Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83E43399AB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 23:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D0D6E04E;
	Fri, 12 Mar 2021 22:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ACA6E04E;
 Fri, 12 Mar 2021 22:28:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4G8b9TnOCK+BLbkc/AkcKBfQr5ck7FDgNHqm6W8VHCN9Ci9FI0Vg3FgAcodjRy4e5Ho1JjOWBPs0T7xOMISZ/cbA3RpDL49OlDeNmwiEcfIvpS/AWCDWJWJIBlgNzqEIOyLp5d/EIA2jcDNM/aYr4kE4cQfEqyI4TQMxp/Hd8ak4HbXTQ72DYgcghB8YR/bK5TN2RyWypAFpnqDK+QCu1Rq8C+Y/yfgbgx6clHvjkKYZleqAZ4rc1th6KpITRldPL8t5lWgohsEwKR43qlZ6AR4lBeGdWrFV+YP9pvlf7IZvCutjk5l/0Au3dK1lr9dX4RfVAJmI9zyqZloAFVRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXykoo9ptugOnTaP5mdMN5PmPIG4iT2Od7rwg7Onfcw=;
 b=dy0Ps8jgVD4OAasecZK35qbO5uaXmZBKi8f0LZ9OxO6E09fZcl1zsYySdsO6q1RDm2Jwur0oHX/jpRilVNRSO5bvKwq00AW8Xy4P/ofVyvGyZHUg7p3YGtf1/8qQ23PqlrEyMGIzFy4vfT+xgzmQsr2E2u/kqucc7les55hVSEav3XJXFL4NhM50xwtMEwO3jCVOs3oH7tjtjRms1lDpYZbzRFR1qg1tE7VKvIeCGYUYlkyQNJobPchPzhLjgP5C+1snI3YUmo0kkb4EzEUQ4EbE4NKXPXhsOIug3Bz0GQGhQGJLMAbKbF0dCul/SzJAX/eBv1ejs8Wxdtyvk/G/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXykoo9ptugOnTaP5mdMN5PmPIG4iT2Od7rwg7Onfcw=;
 b=KLYs60lLxeOZvCUyNUDjd9di66VSLF+rsiP2J8aczbm4Q/A3gv1g+s1qxKuufmN1W3Ylt847SJGZOJjwwrBiS6inCXcHPOtTDbEhkc9jD00/kIa6SE/mFTwvlUgGE0a8+CiMdnr2OcQnjkz7rqlh7WXZ+LstDCUyMOomvw5GyNU=
Received: from DM6PR12MB4732.namprd12.prod.outlook.com (2603:10b6:5:32::25) by
 DM6PR12MB3705.namprd12.prod.outlook.com (2603:10b6:5:14a::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Fri, 12 Mar 2021 22:28:33 +0000
Received: from DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2]) by DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2%5]) with mapi id 15.20.3890.041; Fri, 12 Mar 2021
 22:28:33 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: Souptick Joarder <jrdr.linux@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "Ma, Le"
 <Le.Ma@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Mark mmhub_v1_7_setup_vm_pt_regs() as static
Thread-Topic: [PATCH] drm/amdgpu: Mark mmhub_v1_7_setup_vm_pt_regs() as static
Thread-Index: AQHXF428baRlH6LzBEySkvDjMDhRD6qAmyMA
Date: Fri, 12 Mar 2021 22:28:33 +0000
Message-ID: <ACD7D8F0-345B-4A4B-8F39-64CA119B5501@amd.com>
References: <1615587537-28989-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1615587537-28989-1-git-send-email-jrdr.linux@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=b92d0369-a5e2-4c5f-8f3a-cbf1eee11f50;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-12T22:27:47Z; 
user-agent: Microsoft-MacOutlook/16.46.21021202
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.54.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2bc64137-0e43-41a6-2093-08d8e5a62bdb
x-ms-traffictypediagnostic: DM6PR12MB3705:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3705713DD9A2472E3BF0D980806F9@DM6PR12MB3705.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bkrlkLC5gjQ0oQND5VAi9jh6HBgRdL/0rfLg54wHJu16egP/Pk2Pd5LyDTRYyFeks5iAOoSBu+M7qf4zFBAjW+b9vWE3X/MWrRWGy1SieUwW6sbo8MqzGfL0n5DcPLgCxtObvo7KICyo7aMFx2Y12fRYXT9tbzjGCdUDDA/T1jQ+AaDRgiwI5SgkJxPjD4IG90pP0H15o3CqQXqg5GhXmJSgQAK7b+tnUgXBQwbMyjwVgOO2r4a8dWuGXP0LqtluRUjb20+bpL51BCnf/9cQWZawQV1oIxqCyoyA+GuudE78ezAO96lWNKhOKL9GBi7yWPqpvvAeJaCLvmD/Fg/s9r1Nba38agwRKKybNTKDLGIZtLcWd26CSOiJHg4+4YckoR5Ru/b3u9YU876rI8i8GX9t638oyXGPTjR6A5NNL0F68prhwo1v/sAZrpeIJJ1w8WGsoTeqdSmMGSN756ZE4J8xwE6q168TIJJOFhTMe/1qQFjsZUjrAEDAFGN3cpMX+7v/QNPzueFeUIXxRCTK4pSIBeXPDv1iWYKDpMoJs0xRTxgeVH2Ae29pPKpc3e1XQj1bdbuhF6rhJzjVU1il2a/FTTZd5st8QXMlBDEPxy1hBQCursGcTQYPtUQR3afUhXGmfTnTFQYAakwKrlJQNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4732.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(36756003)(71200400001)(2616005)(66946007)(83380400001)(64756008)(76116006)(66446008)(4326008)(2906002)(8676002)(478600001)(6636002)(33656002)(186003)(66476007)(8936002)(26005)(54906003)(921005)(110136005)(6486002)(6512007)(316002)(5660300002)(86362001)(6506007)(66556008)(91956017)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ck94TDNzQS9PZFREUVQwWG8zaE9LbmFMOEE1a1IweFMwVzdiYnpWTVdWaERW?=
 =?utf-8?B?K0dkUFFYc3JkbDBrYnhpQkdkMHhHOGorcmdZYllDOEZObFp0aEMvSnFFa04y?=
 =?utf-8?B?Y1Jnd0FjMFpkSDM3UDJvOGNkZ0ZtVEdrYkRvWExDS0xsMVZTZHVaL25uTVdy?=
 =?utf-8?B?RlgwSDFkYUVnT2xnc0xmR2IzUXFKMzNXZTVDZFF4L1ZqSnYyK1FzRGNpd0ln?=
 =?utf-8?B?N29MR1pxQjB4V1hYYWIwYzY5ZlJjTVpPV0FxaGJwTWJvVXJIR0JhRGRCUVIv?=
 =?utf-8?B?R1EzNzI5NkZBSDJPTjdOdTgydW12YVhTcWt3MmtBNDhwUE9wUFVJeEIrbmR2?=
 =?utf-8?B?UzJSaU50a0V6MC93dXQzLzRiVTNOd0RrRlQ0dWZnQktXTWhWMVNxVnRQRUlX?=
 =?utf-8?B?eFZuaGJ3dll5bU1paFlEWjdXUlRpWTFTN1lvQlhQYldPK2psaU9qbTNYUk9B?=
 =?utf-8?B?T2ZZaWZqMG9nQVNsTHplNU5CY2kvdHZud01KODhkOWI0TW5WSGxlbkFGNnFH?=
 =?utf-8?B?eStZU21lWHBIaXZDdGZHaEpiOURsSkc2eVZFSzFyS0RRSGVrTjlaa3NQeXBl?=
 =?utf-8?B?UStJeE1CRHdyYlBrQ2htb0pVWHlWK2V5SFIrOTJ2YkJZSC94VnF2a01INjN1?=
 =?utf-8?B?eUxIMUZUMjhMTnN2ZXdRUUlTNVFUcTVHL2QyK3pFNjlJRUVDbnlxWGNtbWcw?=
 =?utf-8?B?TnZ1Y1NmTmUzY25JSjRYbWR6djArV0h3V3J1SUZUbzNpQ1EwMjhDZ2IrMFE4?=
 =?utf-8?B?aW1LZm9GMjI2Y0hRQXBGNEUrZDh2V0RQM2RvZStsaGJOSWlUd29sZXN6bm1L?=
 =?utf-8?B?eVlpTklWdG16QVMxUGRJOVpFWjVEdXRFKytIQWo5TTdWZXozT29TcldUMTBx?=
 =?utf-8?B?cXJHVkJSTjQ5bk9Vd05oUWNFQ2x4RWpMa0NEUVBLSExBNnh2UENDa2Y3bC9G?=
 =?utf-8?B?U0dFN2c5TGw2ZmR0bHlFaU1wWW14MjJ0SElKTVorVHBpeDV2c3JNcFJMT285?=
 =?utf-8?B?Rjk4Z0o3ZWxoZGVGOVJrdzhJUHhWNjN5aGpKREZSeFJEclQ0bk1zbHdwSGVG?=
 =?utf-8?B?emdCTStPTlN3aEVKT2JZYVJnZGhpbkU0ek53M2ZWTE1VR20wYjRoaENyczdI?=
 =?utf-8?B?dFZHYXN2N3JyNnNVNlByMi9nMCtKVnorWTlyMmluRnVSbzZiVWRQTng3d2pH?=
 =?utf-8?B?QVlFaUlQUlBXL1lCRFBwRktSTTZqeVJBYjd6Z0Q1Ulg4T2VWSG82Sy9YZ2dZ?=
 =?utf-8?B?Q3ZhbGNuNWNLNU56T0ZYNlEwT1NqbDl5enhjQWhFNWQ1cjluaXM1TUlsYUIz?=
 =?utf-8?B?TUNWSGtaZXAwVStmNHlmWXRQdmEvdjhmUEZBZm9PV3Mrb2tXeDBYa25PQ0t4?=
 =?utf-8?B?ZStRSmtpQXA3Tyt3Z2FsMWJ6OFp6RkRQMkpoNFdXc05FUmhNSFFMdHBQeG13?=
 =?utf-8?B?a24vZStKQ1pPREVCU0psTHR2Vjc2UHRhSyswVXhoMmc0V2pjcVZPUC9NSUtv?=
 =?utf-8?B?Y1paZW1lUjllWVRmOC9jMUN2VFJJa283N2FBQWNDYmplM3o4UlJaLzlYMW81?=
 =?utf-8?B?amN0REZLa3VHdytzQW13MjhaVjNuL2ZmclR6NUhucUx1WFFUTHhrVGlpazRZ?=
 =?utf-8?B?NXVrMmJwK20rcGl0aFNpTjQycTVWUW9hN0dGc3VmNzBpRVNDOC9YMW5WTU9h?=
 =?utf-8?B?Y3hRN2FIS2pBRVhnVU1nd3FqSUFBU29rcHFicis4bi9XZ3BmVjRQenh4emhT?=
 =?utf-8?B?b0dJS0c0TjBNN2trNVA1M2ptZDQyUlFTQjZ0U1E3MTNqNWdQY3ZFWmZYaXQ0?=
 =?utf-8?B?RGRhNnpDVlBhUEhGc1A1QT09?=
Content-ID: <B81E5E02441FDF49BF24BE4FCACF8F36@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc64137-0e43-41a6-2093-08d8e5a62bdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 22:28:33.4978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPLu0mxKys5EITK0qJEWw/W+tSRwnBj8P1HA8eZvgs/vLgcILOeOVllwYbWUHaPH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3705
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpU
aGFuayB5b3UgSm9hcmRlciBmb3IgdGhlIGZpeC4gQnV0IHRoaXMgaGFzIGFscmVhZHkgYmVlbiBm
aXhlZCBpbiBvdXIgQWxleCdzIGRybS1uZXh0IGJyYW5jaC4NCg0KUmVnYXJkcywNCk9haw0KDQoN
Cg0K77u/T24gMjAyMS0wMy0xMiwgNToxOSBQTSwgIlNvdXB0aWNrIEpvYXJkZXIiIDxqcmRyLmxp
bnV4QGdtYWlsLmNvbT4gd3JvdGU6DQoNCiAgICBLZXJuZWwgdGVzdCByb2JvdCB0aHJvd3MgYmVs
b3cgd2FybmluZyAtPg0KDQogICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFf
Ny5jOjU2OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzDQogICAgcHJvdG90eXBlIGZvciAnbW1odWJf
djFfN19zZXR1cF92bV9wdF9yZWdzJyBbLVdtaXNzaW5nLXByb3RvdHlwZXNdDQoNCiAgICBNYXJr
IG1taHViX3YxXzdfc2V0dXBfdm1fcHRfcmVncygpIGFzIHN0YXRpYy4NCg0KICAgIFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCiAgICBTaWduZWQtb2ZmLWJ5
OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4NCiAgICAtLS0NCiAgICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfNy5jIHwgMiArLQ0KICAgICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KICAgIGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV83LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV83LmMNCiAgICBpbmRleCA0ZGYwYjczLi5hZTdkOGEx
IDEwMDY0NA0KICAgIC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzcu
Yw0KICAgICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzcuYw0KICAg
IEBAIC01Myw3ICs1Myw3IEBAIHN0YXRpYyB1NjQgbW1odWJfdjFfN19nZXRfZmJfbG9jYXRpb24o
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogICAgIHJldHVybiBiYXNlOw0KICAgICB9DQoN
CiAgICAtdm9pZCBtbWh1Yl92MV83X3NldHVwX3ZtX3B0X3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsDQogICAgK3N0YXRpYyB2b2lkIG1taHViX3YxXzdfc2V0
dXBfdm1fcHRfcmVncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwN
CiAgICAgdWludDY0X3QgcGFnZV90YWJsZV9iYXNlKQ0KICAgICB7DQogICAgIHN0cnVjdCBhbWRn
cHVfdm1odWIgKmh1YiA9ICZhZGV2LT52bWh1YltBTURHUFVfTU1IVUJfMF07DQogICAgLS0NCiAg
ICAxLjkuMQ0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
