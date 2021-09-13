Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1B54084E6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 08:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5F66E0F4;
	Mon, 13 Sep 2021 06:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32D46E0F1;
 Mon, 13 Sep 2021 06:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/n/WpAJ1Mdg1nvkD73fHfjNlrRRj7K5IYxtsal9t751/uE7ZHBQzZu4oWucsWqcOizgZ7hRE5dDPlNgiPQ30oFz4ULRaj7DSjAX94m3x/u1niFmWAfL6aZQvW4huxzjdqbJvWlNOD68EcFylRQl4R8q8D+mlapRNHceNbeFe9++D9z1/Kz8lqMSLmoTqDNee8sdzf2+ymXDrfGlhAb1u3zYRGVFCMxCFYdgY7l+qBIRR5xtwssjDMyyVGLtE0Hn6euljGGqgX2Mfra1K8slsdp6kknSd3A5uYmZdTo+ytlxNhnOk4AhVVQTX+s3nk9/t0w3EJ2We77CW6JM7Tpb6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zP8r8RtnOc63boFeBrKyJGyYnXKLcGAE4wag4ncLIX0=;
 b=TLTTSI6/HUhlv5Ss78M0qp8hIFb0Jbpx6qRbikcRW+z0kSozDRjG0kpRZhA68o6b8eb3nv8ZztJyuIFTiroxp+8TJOPPF8IDjV3WUjrb/9SO9rPufSTALBTFDGwf1tNHwBWHm0CjWmsBscXFEb3Wt7+jMrJH9MuUxEimFKs7SvOx0kGX+4XygqHu1LatbTAOSiXmFNCMnlOWgBBi+uXRD7vb1jVdqvnCDGA2lLC1Jpyo0u6F5PGoH0xAOunLvise/FB8cTbYV8mqXjR0DFtrKlOp8ulJktq96XzUCE4rb2dztipgcs3JJX1ZiC2kyKop1B/r/Uq6s3LUgIFJsVaYzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP8r8RtnOc63boFeBrKyJGyYnXKLcGAE4wag4ncLIX0=;
 b=wf1eNFSKAYNzWDePifEGwINcOUuF+Suv85djKnGiJX+2ofEsQKVi3zYoYvpcRi26CLWl8iVUuyC17jvPPF4hwLkKNi7eV6JYYbJAGhQFJ+zb9j9ThLAxqMKIrsyjPa8Wa6uaIE0q4SgzCv3PS+hMHICvtbHPc9mJVP7AdzezLzk=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM8PR12MB5480.namprd12.prod.outlook.com (2603:10b6:8:24::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16; Mon, 13 Sep 2021 06:44:02 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca%9]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 06:44:02 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUkZDIFBBVENIXSBkcm0vdHRtOiBUcnkgdG8gY2hlY2sgaWYg?=
 =?utf-8?Q?new_ttm_man_out_of_bounds_during_compile?=
Thread-Topic: [RFC PATCH] drm/ttm: Try to check if new ttm man out of bounds
 during compile
Thread-Index: AQHXqFCVtvQAM6RRTkmTiaFYwK8fUquhgmaAgAAA5Pw=
Date: Mon, 13 Sep 2021 06:44:01 +0000
Message-ID: <DM4PR12MB51654C04316888783D3AAAAC87D99@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20210913033623.296390-1-xinhui.pan@amd.com>
 <ab044048-9739-f955-880e-612fb6214826@gmail.com>
In-Reply-To: <ab044048-9739-f955-880e-612fb6214826@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-13T06:43:58.368Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: 2cbd93fc-4adf-c5e7-59a7-db4e35675f59
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5710acb6-514f-450e-009b-08d97681df61
x-ms-traffictypediagnostic: DM8PR12MB5480:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR12MB548079534EDBF0B38CA4D54C87D99@DM8PR12MB5480.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +kBj9iyX2tuUaxRT+73NnRHoVTZJxXhtiPXXi+s6plrJbIBp0DNCXOSvBR71OhYtr2vK+zM6CCf3MXXD7K+4vFKdRdsUzs7pePTabbfXJ+uuuu8OXi4fe2eiuKBglYUzYSUvMlpUXGA1kBYbxVbxPghYyJvOj8JLUf9NUuKD/Y7EKQ7NECyvengI+Ru11URR7+qNaq0TQD8W23izebqgKzD0HiiqijKZz1Dlm8H9awiYCrsrDEtm1uUk+dMVFEudqCf6Z0YFklcoLGxJFKmrHxqQB9qjZLflM2XApsD+VKIVEVIkcw+FQVnt0EZocdTc/ehCT+aLQKsSQX/aFgMNU8uBrnRxr1ZwUFM8ryb2J+psuCUGIiTUPlMGbPCswG52M5ZGRuZWtxwOZpODawn8q+YxXgVHPaQXBioGvwRH5KWy6Jlhu9e5hHQCjdCqFpe4iKttVNFYbqf3HBgaR66X0/j2JvAW5lstVvQY3i0hGGxF3l5fu1h/H7raLBXJQPdnLU3AgGjwY98x/XhmdB9wqAUBVrVB3qBfOZo39p440K1nQ7WsetjVTbIg7tGXx+KHaLbj3RVbHQou19NoTRuPagGJ6pus4dQGi9YlUb4RCNBEPf3N3hsGqiR2U8JvfHuWvUS1mwLyjdFl3rabsRsvklf3SER3+efaE/1zgRTKNJzrGJuK4J2dYetCxQZwgftBYr9uRQQcwFhLFmma9uE35g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(52536014)(33656002)(2906002)(110136005)(54906003)(4326008)(86362001)(6506007)(66946007)(66476007)(76116006)(66556008)(66446008)(26005)(224303003)(55016002)(5660300002)(71200400001)(316002)(8936002)(478600001)(122000001)(186003)(9686003)(7696005)(38100700002)(38070700005)(64756008)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckhjMWRTbGh4ZVl2ZnVOQlpmZi9mbkJHMnF3T1dFc2pRa09iUkc4VVBWSkNr?=
 =?utf-8?B?NkFHQjFLNEl5U3o0V1NPcFgxUTc1TnNxSVZMa21PWE4yUzh3dEd0dkJydkdP?=
 =?utf-8?B?R0RDVkxMc01RUmZaVjFkdGNWWUNNTlBQMGlPT3dSemtteUdIK0htempHeTZa?=
 =?utf-8?B?VkdKdHNvb3BGWmM5WHhGaWJRZXExMUZhM2JSQ3huanM2dTZTb2RBMTFydTZn?=
 =?utf-8?B?M1dlVHFZMFZzUy9zbzdIOUVVc3JSUUVEUXl6azRXQXFyeGdlUW5QMStua1Rw?=
 =?utf-8?B?c0xQakU0RDRURmIyRzljQ2RoN1JqU2EySmsxT052bUhHRmJFTExlc3BucHM3?=
 =?utf-8?B?Z3k5Tk9icm16bkhnYlZlek5yWlZpdEpSSkVNM3NMMW5Ndi90NVdCVUpWalZE?=
 =?utf-8?B?cGcvblZoeGlvQ0pFbXo5YVBjZ2VZRUxXSlJ4Y1RJTm05czg4bGJpUkZJeUE4?=
 =?utf-8?B?YUFadTRnRStCZktNdk9oSGVETGlybGNzNDNsMHFiMWVnN0lCNlB0VXJTNlU3?=
 =?utf-8?B?QjBlc1ZlTk5XaVdGMHdGeitCUS9YeG02cWZ2N2FOQVc4aDc4ZjdzMVhnOTZV?=
 =?utf-8?B?Q1VPcnJXMUtsRmZCZFo2QkJHVmRKVG1iYWU0MXdBejNrWUY0b0VMTGhZTmxy?=
 =?utf-8?B?czFzM0tJYXVQQmxhbnRBeG43KzMzVG5yMmxKdENuTFJRVHVzczJLTmIzMXlU?=
 =?utf-8?B?MXdUOGROYTMweGFQNkkyR0lCMlI5bEUxaXRlNzZZUXJvTGJ3YzBEeE5ZNUVT?=
 =?utf-8?B?ZmhMWFF6WEhDWjJLREtUUEZWVTVuRW5NZng2TFYvRjhwSnErMlBWcHptanhk?=
 =?utf-8?B?QW5QNDYrVEY3dFhQV1dRSzZ2ODQvc0h4WHQ5em4zcXlDNEdJR1RpN0lJcUda?=
 =?utf-8?B?c0p6aXZqSTdPR3l5ZXhPUERWTHE5ejZOUkM5YkJKMkxrclZ4NGNnWlBCdUEx?=
 =?utf-8?B?VGlNRlVadld3TXUyL28yelhVbEVYTURJQ0RzY0t4ZEJ6MkNyeHVXNVRIcE42?=
 =?utf-8?B?eXBGKzQvWU1jU05ER3p5OWs1Q3JzKy8valVkcXR1dGNDUEV6eG80Y2MvL2tL?=
 =?utf-8?B?MTJQSVVkODdHZkdXZTdnVDJ6Wms5a2R5a2dWandZVnNseHdSMHJkejdwLzFM?=
 =?utf-8?B?aXVGc0twd0tlT2pJbVc5emRtajAyd05KOWdjdmU3K2dkUTUxUFFWSTVDYkRu?=
 =?utf-8?B?WjFVWUNwRXo1elZ6dko1bEF6RDVJQjZ1cjVYRFIwUldCc0tCTWRJZWdSd0s0?=
 =?utf-8?B?R3NvS1RiSGJKenZCeXFjNy8xUkdiQU84U2VUZVRGVVFuSTgwWmV0NXFHREZU?=
 =?utf-8?B?TXRGQzJXaXRpazE0Q3VBY2NadFIwd1A0by9QRjAzNHBrUWJYVFluM2N0Z0c5?=
 =?utf-8?B?azhJVkJaTkJIcWsxbUNqK3pLc0tsc3U0Z282c2dZcFpmcFBjRXdocURZNDBR?=
 =?utf-8?B?aWdWc0NrOVZucEUva3pIbjFneXhYckl5Nk5oYUhoMnkwNDdIQmlwNWZ1dnJ3?=
 =?utf-8?B?N1hnNEhnb3FnaFlCRzkxZVREQVpqVFZtampkcVBrdGwzT0g2U3dWdktxc1o3?=
 =?utf-8?B?UDV5Vy9QL0djOG9VUTZuYjN5NERZbTFiV2s2REZzMThjR1N1MHlTKzZYTEt5?=
 =?utf-8?B?WTNCdWlLbStMWlZlNjhZSFczOHBPOVJTT0lNVFBsMHlOR00ydC81K2RULzl5?=
 =?utf-8?B?REEvRU1TOEN2c2pQL3VZSU1UYVYwWjhZczhpY3V0WUZlRDlBekw0OUdZOVVy?=
 =?utf-8?Q?ZfQym2FJliz8DzITcPymherP9jZxmKWyN4V9v2F?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5710acb6-514f-450e-009b-08d97681df61
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 06:44:01.8249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wjse1fAfKxvPnsWMK3nGaFxQ2pteEQeGmXkLob6XsADb6RHOpC82OD/1PyX8vrd9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5480
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KdHRtX3JhbmdlX21hbl9pbml0L2ZpbmkgYXJlIGV4
cG9ydGVkLiBTb21lb25lIGVsc2UgbWlnaHQgdXNlIGl0IGJ5IGZpbmRfc3ltYm9sLg0KSSBqdXN0
IHdhbnQgdG8gbm90IGJyZWFrIHRoaW5ncy4NCg0KRGV2ZWxvcGVyIHVzdWFsbHkgY29tcGlsZSB0
aGUgd2hvbGUga2VybmVsLiBTbyBhZGQgYSBjaGVja2VkIHZlcnNpb24gb2YgdHRtX3JhbmdlX21h
bl9pbml0L2ZpbmkgYnkgdGhlIHdyYXBwZXJzLg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQrlj5Hku7bkuro6IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVp
Y2h0enVtZXJrZW5AZ21haWwuY29tPg0K5Y+R6YCB5pe26Ze0OiAyMDIx5bm0OeaciDEz5pelIDE0
OjM1DQrmlLbku7bkuro6IFBhbiwgWGluaHVpOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0K5oqE6YCBOiBLb2VuaWcsIENocmlzdGlhbjsgZGFuaWVsQGZmd2xsLmNoOyBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBDaGVuLCBHdWNodW4NCuS4u+mimDogUmU6IFtSRkMgUEFU
Q0hdIGRybS90dG06IFRyeSB0byBjaGVjayBpZiBuZXcgdHRtIG1hbiBvdXQgb2YgYm91bmRzIGR1
cmluZyBjb21waWxlDQoNCg0KDQpBbSAxMy4wOS4yMSB1bSAwNTozNiBzY2hyaWViIHhpbmh1aSBw
YW46DQo+IEFsbG93IFRUTSBrbm93IGlmIHZlbmRvciBzZXQgbmV3IHR0bSBtYW5hbmdlciBvdXQg
b2YgYm91bmRzIGJ5IGFkZGluZw0KPiBidWlsZF9idWdfb24uDQoNCkkgcmVhbGx5IGxpa2UgdGhl
IHBhcnQgaW4gdGhlIGlubGluZSBmdW5jdGlvbnMsIGJ1dCB0aGUgd3JhcHBlcnMgYXJvdW5kDQp0
aGUgdHRtX3JhbmdlX21hbl9pbml0L2ZpbmkgbG9vayBhIGJpdCBhd2t3YXJkIG9mIGhhbmQuDQoN
CkNocmlzdGlhbi4NCg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFu
QGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3JhbmdlX21hbmFn
ZXIuYyB8ICAyICsrDQo+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9kZXZpY2UuaCAgICAgICAgICAg
IHwgIDMgKysrDQo+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9yYW5nZV9tYW5hZ2VyLmggICAgIHwg
MTAgKysrKysrKysrKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2VfbWFuYWdlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2VfbWFuYWdlci5jDQo+IGluZGV4IDAzMzk1Mzg2
ZThhNy4uNDdlMzA0NzE5Yjg4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9yYW5nZV9tYW5hZ2VyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2Vf
bWFuYWdlci5jDQo+IEBAIC0xMjcsNiArMTI3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB0dG1f
cmVzb3VyY2VfbWFuYWdlcl9mdW5jIHR0bV9yYW5nZV9tYW5hZ2VyX2Z1bmMgPSB7DQo+ICAgICAg
IC5kZWJ1ZyA9IHR0bV9yYW5nZV9tYW5fZGVidWcNCj4gICB9Ow0KPg0KPiArI3VuZGVmIHR0bV9y
YW5nZV9tYW5faW5pdA0KPiArI3VuZGVmIHR0bV9yYW5nZV9tYW5fZmluaQ0KPiAgIC8qKg0KPiAg
ICAqIHR0bV9yYW5nZV9tYW5faW5pdA0KPiAgICAqDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS90dG0vdHRtX2RldmljZS5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9kZXZpY2UuaA0KPiBpbmRl
eCAwN2Q3MjI5NTBkNWIuLjZmMjM3MjRmNWEwNiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0v
dHRtL3R0bV9kZXZpY2UuaA0KPiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5oDQo+
IEBAIC0yODUsMTIgKzI4NSwxNSBAQCBpbnQgdHRtX2RldmljZV9zd2Fwb3V0KHN0cnVjdCB0dG1f
ZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCwNCj4gICBzdGF0aWMg
aW5saW5lIHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqDQo+ICAgdHRtX21hbmFnZXJfdHlw
ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwgaW50IG1lbV90eXBlKQ0KPiAgIHsNCj4gKyAgICAg
QlVJTERfQlVHX09OKF9fYnVpbHRpbl9jb25zdGFudF9wKG1lbV90eXBlKQ0KPiArICAgICAgICAg
ICAgICAgICAgJiYgbWVtX3R5cGUgPj0gVFRNX05VTV9NRU1fVFlQRVMpOw0KPiAgICAgICByZXR1
cm4gYmRldi0+bWFuX2RydlttZW1fdHlwZV07DQo+ICAgfQ0KPg0KPiAgIHN0YXRpYyBpbmxpbmUg
dm9pZCB0dG1fc2V0X2RyaXZlcl9tYW5hZ2VyKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LCBpbnQg
dHlwZSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0
dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuYWdlcikNCj4gICB7DQo+ICsgICAgIEJVSUxEX0JVR19P
TihfX2J1aWx0aW5fY29uc3RhbnRfcCh0eXBlKSAmJiB0eXBlID49IFRUTV9OVU1fTUVNX1RZUEVT
KTsNCj4gICAgICAgYmRldi0+bWFuX2Rydlt0eXBlXSA9IG1hbmFnZXI7DQo+ICAgfQ0KPg0KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9yYW5nZV9tYW5hZ2VyLmggYi9pbmNsdWRl
L2RybS90dG0vdHRtX3JhbmdlX21hbmFnZXIuaA0KPiBpbmRleCAyMmI2ZmE0MmFjMjAuLjkyNTBh
ZGU1NGUyYyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9yYW5nZV9tYW5hZ2Vy
LmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9yYW5nZV9tYW5hZ2VyLmgNCj4gQEAgLTM4
LDUgKzM4LDE1IEBAIGludCB0dG1fcmFuZ2VfbWFuX2luaXQoc3RydWN0IHR0bV9kZXZpY2UgKmJk
ZXYsDQo+ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcF9zaXplKTsNCj4gICBp
bnQgdHRtX3JhbmdlX21hbl9maW5pKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LA0KPiAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCB0eXBlKTsNCj4gKyNkZWZpbmUgdHRtX3JhbmdlX21hbl9p
bml0KGJkZXYsIHR5cGUsIHVzZV90dCwgc2l6ZSkgKHsgICAgICBcDQo+ICsgICAgIEJVSUxEX0JV
R19PTihfX2J1aWx0aW5fY29uc3RhbnRfcCh0eXBlKSAgICAgICAgIFwNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICYmIHR5cGUgPj0gVFRNX05VTV9NRU1fVFlQRVMpOyAgXA0KPiArICAgICB0dG1f
cmFuZ2VfbWFuX2luaXQoYmRldiwgdHlwZSwgdXNlX3R0LCBzaXplKTsgICBcDQo+ICt9KQ0KPiAr
I2RlZmluZSB0dG1fcmFuZ2VfbWFuX2ZpbmkoYmRldiwgdHlwZSkgKHsgICAgICAgICAgICBcDQo+
ICsgICAgIEJVSUxEX0JVR19PTihfX2J1aWx0aW5fY29uc3RhbnRfcCh0eXBlKSAgICAgICAgIFwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICYmIHR5cGUgPj0gVFRNX05VTV9NRU1fVFlQRVMpOyAg
XA0KPiArICAgICB0dG1fcmFuZ2VfbWFuX2ZpbmkoYmRldiwgdHlwZSk7ICAgICAgICAgICAgICAg
ICBcDQo+ICt9KQ0KPg0KPiAgICNlbmRpZg0KDQo=
