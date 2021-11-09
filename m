Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BF344AE6E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 14:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDC16E8B2;
	Tue,  9 Nov 2021 13:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2064.outbound.protection.outlook.com [40.107.101.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6624E6E8CF;
 Tue,  9 Nov 2021 13:05:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPaWHkF7d2mdH0qI+gjjamhGppgFHPRbzSigZ3ZMg7RkWybp47tuxuKCpxGTCZ8RvKIxBKLTYLPd3RPG64zxrE4NwGT4gKtgif7AcsqENOuGFk4hYC6m1Px1JCSM82J8tZ319bZNRUhJGoCJ4UQ13Dt3vP+EHtaN5KaMjlBVNbGmApBDG4aHP5DfX+xkwByTL47o6ZQs2Y1Yo1oG4FXekyW482ZzhWwHguUc6KH+3p1spg6FDXEt0RTOK9It55xkM4UOXmtLi603yLML8CC4LWZ5hf5aIJNP1BNYFU198qB0Fv9V+9sRXye3Xn15/mH4WH82vsg4JagCFBq+1NiyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uT/EUHDuFodKEdnafzZzCH0KLnKLr5Gzel81Pck+ysM=;
 b=XtPutRpxXb2hTOLjX4c6hO/gbLIOgDwoAYA0usHJVDbYv1PWbVXlWYpvINgygk0Pa+I+HPQOXY2HdHLq4kfvMW4DjYewStcUMRb7TVTgZ6qnyihOdQvjrDHtKr85x3ypbnp6WP0HHNFXc1PJ/fIt0byInxIn4P/weJgOtF8oxAEl81BrOxrQ3KIAm+9BMM2WqIPCNK8/GTuLx8lY74vXj0eBdqJ1AL3o2m+CqdAXCTqJgLAB0AmMkrj/arKsGzjmVg1iEuWwX4kGCaEy6g7Cum3NOIaqC+44hbvVoIWDCkvd/xGnRLUSPL/epQ/hlSQrFITuAD7guWXZiBlgk+gE8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uT/EUHDuFodKEdnafzZzCH0KLnKLr5Gzel81Pck+ysM=;
 b=Z+niKNAmraMQOOZTgWQaqo7QDJ5me9C5h11LOvWdYiJwhA2eYlhS/QyzMP6TXhoNRCjgKhIpGSGHcAMqosmSvVrATjQnaqz6w7xe9Zgtoq0V0GQvQrIMAEmJ2u8SbfLU+wQKjQdq38tVLOl2pYwxSI6GYAXDyXh6yL4TX9sC4HY=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5392.namprd12.prod.outlook.com (2603:10b6:5:39a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Tue, 9 Nov 2021 13:05:36 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::3070:7b8d:5f19:ce5f]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::3070:7b8d:5f19:ce5f%8]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 13:05:36 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSF0gZHJtL3R0bTogUHV0IEJPIGluIGl0?=
 =?utf-8?Q?s_memory_manager's_lru_list?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGRybS90dG06IFB1dCBCTyBpbiBpdHMgbWVtb3J5?=
 =?utf-8?Q?_manager's_lru_list?=
Thread-Index: AQHX1VvXjWHPm2/pokm2eFnZq+sX9Kv7Hb8AgAAAQ4eAAAO0AIAAAa9X
Date: Tue, 9 Nov 2021 13:05:36 +0000
Message-ID: <DM4PR12MB51657C53FAA6C096884118AD87929@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20211109111954.41968-1-xinhui.pan@amd.com>
 <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
 <DM4PR12MB51653AB0F1A0B89A41782B1087929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <76d78ff7-efe4-4796-ec18-a668757f2e04@amd.com>
In-Reply-To: <76d78ff7-efe4-4796-ec18-a668757f2e04@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-11-09T13:05:35.456Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: 1cb415ca-a4a6-a5a2-c4bc-89f36fcfeddb
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e25b99e8-4869-49c7-c798-08d9a3819ee9
x-ms-traffictypediagnostic: DM4PR12MB5392:
x-microsoft-antispam-prvs: <DM4PR12MB53927F98AB734DC0637DD63187929@DM4PR12MB5392.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mA0nPEVtBCdU+CD0Lc4+rh7R1oMZrvqM5kXojoqSYWZL2H1EVXI1Szh6mzM2Xn9tFPiBUgmgQlHH+vYaC598QnmaAUE/G+SO5aSCvprum0ps3AFslV4zh1EPJc3M/xrqMybKPH2cgJiOgg/ftuHAtB8vunaQirc+3O4TxmugSMcMM2ReTha6NbnYdWj5SyuefxCqo/mWrDzS1KXjJdh9eu8HYNmxXpfVVz6ZEpW0wmCsOxmetuc3IDWWtcqRnZpL41tCeJgHk49xR2gj9JbM/TOpgzgSJj8CzQtWf0GJhYNI1/mXHJp/Hp42fdwVj2jyyQH7+Yq6e/dplgfxnA/wsHS0xiJIIpSFAkAh0lkrDj39+j7EyA8hyqAF3Yy0v3JOCa63ZtNcYdD3B0OO84d+uMvnRE2NuEpkNDvaSogieuWy3iyxCcxGjEC4+VnEbsU6CWNf+31rLKEEylGad2JtRWjCnBaZZy384/RMseMj8bQwnH/2if//noSexBsEmxYcw8C2cimVY3YbfX776c1yipUAQaWEIeKAyuOXzEAWJCGzJqkqO/hwfzmxirG3yH5vZDhyyjhdV8yCXMvcnzOCu/Avea5GFDz0rnmuX/be2bdjOdvbOqVHapzu5pC/AmftTc4R6SEK5ZfDp5V+yaQwzD2C6Rkb+XKztzF8+/mc78eN+iNnoFcRU26RYxROF4xfB3IHEMs2Dmkd2pn6iXi8rw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(91956017)(66476007)(66556008)(64756008)(76116006)(508600001)(83380400001)(66446008)(450100002)(26005)(66574015)(66946007)(2906002)(4326008)(33656002)(122000001)(316002)(52536014)(71200400001)(38100700002)(110136005)(186003)(55016002)(86362001)(38070700005)(7696005)(6506007)(224303003)(9686003)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkFUUksycWRxNk51M3pOOXdaK1dhc3NtaWhVZWpxbTBKWnpKU3MvMDJEdDE4?=
 =?utf-8?B?TVFaQzdjai94NndURm9TeGFtRUo4K0NVS04xTnA1YVNsbXMvVTRRd2g3WHlG?=
 =?utf-8?B?aXZnb2dXNTVMUXc0Q1g2d29NR0I5TzI0cm1vSUsrRkoyVUtZSTVnVno0NnpX?=
 =?utf-8?B?VlU1dWFxQkI3VEE0MVFJRGUrS3grZlFsdGdseFRJbzBxVzJta1Fab1dGVkJV?=
 =?utf-8?B?TXg2R0x3ZTFYODdoQlhzb0I4SGJJVXFsWWI3WEl5dzNPMXZTT2VVajlrcUYv?=
 =?utf-8?B?ZFBMT2RlYmI0RDNkS0U5SGtnRUtNZzhHbnhVaDlzNmg1NXJHY1oyK25NZit6?=
 =?utf-8?B?M1lpYnBLcmE2TVNkVUFETlVmN01QUEJHUE1mWmJFNVhXdHNyVDJGWDhaeWE1?=
 =?utf-8?B?azBRVXJXeTMrU2w0L1ppQjZoK2w3OFZRZkY3SHIvOHAwaXhWRUFGVzVkaWQ2?=
 =?utf-8?B?Z0JITllaNlhpNmZLdE9PMm00dFhrRTUrSnRUV01DZHo5WXRKaExJY09ibkNy?=
 =?utf-8?B?QVF5TWtOMTUxV0NDUXFwWmZhTEpVV3U2eW8xdVFwMjVtdG80RmE3RUhLZGJo?=
 =?utf-8?B?ZnlDM1FOOHR6OXpPQS9ORUIrTnRGWHpiWUdVcHpxZmN6QmM5Qkd5VXZlWXVC?=
 =?utf-8?B?ckJDRlNoK1RkRzNCMDNrNHVnYUNLTFJqTCtxU0JuM3NDQU1PSkQ2aVgxYmp2?=
 =?utf-8?B?YjU3bmlNZ1hwblhGdjQ4MEVkWFlDWTc0UDdZVEpXd3BpUnFtYTVDWEFCWTFk?=
 =?utf-8?B?dEhOcWQ0YTExWktCVDJQaGhkTkFxNDVHTlg3ekRDaWt0SGphQURWajUxaERa?=
 =?utf-8?B?OXdNYWhaKys0bGhqb1dVYUNBTXZ5UGZnOHlvVGd3TjBVZ0Zhd0MxUDhEVjBG?=
 =?utf-8?B?NExNUWFlY1pwcG4vYXVYUzYzNnVOWkxXZlFRcHNmOTllQTlEMFRUcUgxQzB6?=
 =?utf-8?B?eElueDFKTVpxUm9SNFVtYS8yZGgya1NkcTN3cUw3cXh5dmx1VXRaK1FjNW9q?=
 =?utf-8?B?RHA2RjZwKzN0d2ZZNlJreXh6SkZLYndsQnBhcy85anlPcFBaVTMxTXhVUFNy?=
 =?utf-8?B?MUwrYWtKN2FBOHU3NGV5cmhUREhKcmFOaUNTTE1BejlEQmY0M0Q3K2VPTnJL?=
 =?utf-8?B?SlVIWUlHYzVCdVRrN2JPNHBrMTNVeDBRL0FwSDBpaEUyUFBjdW1WMHI4dmRl?=
 =?utf-8?B?NjR0SnByUnBDaWV1alZzOE9VQXBlOGxndnU3YURaT3JIY1Rmc0NpTzYxWVJm?=
 =?utf-8?B?cEUvSEwzL2twRWhMa1FFQlk5VWdESiswZi9GMDN3MjZPMkNhendkQXdINEFa?=
 =?utf-8?B?MFlSdXpodk1XNGYweHhBVnRGSlIvTXpOMDBML21IUnB6and5YkhSdDhKK2w5?=
 =?utf-8?B?VlMvYjgzd0hYT3cwdEtTNVByV0Z5RU9USEVkRWFiOFdmZlpWK0lXSFUwOHUr?=
 =?utf-8?B?Qmp3cy9oS25jU2pNbytEWmkrUTJUTUlLQTNNOG5pU0xHZE53MVpkbUtiSTJj?=
 =?utf-8?B?dlFkVkc5TDUrZVpxV2MySUQwMmJTZ1JDNHRYTk0xOXkzb1RQNmRtcDBFMUh6?=
 =?utf-8?B?UmZyQ3l0UjFJWCs1V2UzaWswRWFSMHd2anl2UzdJSGNIQjlyVDhxQ01TeUkw?=
 =?utf-8?B?MDVuY0h5RUdYWHlQQnhOcWg1dGJoS0kzZWRqMHRpZHE4Rm00aStmN3ZlZk53?=
 =?utf-8?B?NEFUVFJXZzB5VlduSTdhek5ucjZ3SGlNZkIyL3Z3L1dDNTh2cWM5TDNXV1dJ?=
 =?utf-8?B?dTlKY2I1ZnpQaVVpL0JoZ0NVUlIzOVVJRjBueWJnNytLQUlQZms5U1ZTc2hu?=
 =?utf-8?B?TllYbXQrdDNndlpNV282SEQrZkZRb0Z0d1RmMVp0OEQ4Tmg4VkJVSDZ3N2hW?=
 =?utf-8?B?a3ZwVHU3MDFnaURjMmtVRkxJRWFZTjdZdU4zNHVxbnhwUHdjNUJzWWRMUTZY?=
 =?utf-8?B?Q1FBc3I0OHhTYWcvMW81R09NMWRpbG1ScEN1Y0s5Z0ZER1B5bjNZby81KzZS?=
 =?utf-8?B?ZTRPZzJvaUxvd1pDVVRoMXRsTUxXK3lOMllXV0M4Rm5yMWxXTFV5bzliWlBj?=
 =?utf-8?B?azR1WU5PWCszK2ZQK3ZGL1cxTlJ4d1JNVUJ0UEhHamhyR1k1UWNaMXdGeFpr?=
 =?utf-8?Q?iAaI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25b99e8-4869-49c7-c798-08d9a3819ee9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 13:05:36.0292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RwcBPdt467zngPE7osGXdF/5+XDg7qQP/oy/F+VMFQOc6mcL10DRT9eccfnxdCbY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5392
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KWWVzLCBhIHN0YWJsZSB0YWcgaXMgbmVlZGVkLiB2
dWxrYW4gZ3V5cyBzYXkgNS4xNCBoaXQgdGhpcyBpc3N1ZSB0b28uDQoNCkkgdGhpbmsgdGhhdCBh
bWRncHVfYm9fbW92ZSgpIGRvZXMgc3VwcG9ydCBjb3B5IGZyb20gc3lzTWVtIHRvIHN5c01lbSBj
b3JyZWN0bHkuDQptYXliZSBzb21ldGhpbmcgYmVsb3cgaXMgbmVlZGVkLg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KaW5kZXggYzgzZWY0MmNhNzAyLi5hYTYzYWU3ZGRm
MWUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KQEAgLTQ4NSw3
ICs0ODUsOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8sIGJvb2wgZXZpY3QsDQogICAgICAgIH0NCiAgICAgICAgaWYgKG9sZF9tZW0tPm1l
bV90eXBlID09IFRUTV9QTF9TWVNURU0gJiYNCiAgICAgICAgICAgIChuZXdfbWVtLT5tZW1fdHlw
ZSA9PSBUVE1fUExfVFQgfHwNCi0gICAgICAgICAgICBuZXdfbWVtLT5tZW1fdHlwZSA9PSBBTURH
UFVfUExfUFJFRU1QVCkpIHsNCisgICAgICAgICAgICBuZXdfbWVtLT5tZW1fdHlwZSA9PSBBTURH
UFVfUExfUFJFRU1QVCB8fA0KKyAgICAgICAgICAgIG5ld19tZW0tPm1lbV90eXBlID09IFRUTV9Q
TF9TWVNURU0pKSB7DQogICAgICAgICAgICAgICAgdHRtX2JvX21vdmVfbnVsbChibywgbmV3X21l
bSk7DQogICAgICAgICAgICAgICAgZ290byBvdXQ7DQogICAgICAgIH0NCg0Kb3RoZXJ3aXNlLCBh
bWRncHVfbW92ZV9ibGl0KCkgaXMgY2FsbGVkIHRvIGRvIHRoZSBzeXN0ZW0gbWVtb3J5IGNvcHkg
d2hpY2ggdXNlIGEgd3JvbmcgYWRkcmVzcy4NCiAyMDYgICAgICAgICAvKiBNYXAgb25seSB3aGF0
IGNhbid0IGJlIGFjY2Vzc2VkIGRpcmVjdGx5ICovDQogMjA3ICAgICAgICAgaWYgKCF0bXogJiYg
bWVtLT5zdGFydCAhPSBBTURHUFVfQk9fSU5WQUxJRF9PRkZTRVQpIHsNCiAyMDggICAgICAgICAg
ICAgICAgICphZGRyID0gYW1kZ3B1X3R0bV9kb21haW5fc3RhcnQoYWRldiwgbWVtLT5tZW1fdHlw
ZSkgKw0KIDIwOSAgICAgICAgICAgICAgICAgICAgICAgICBtbV9jdXItPnN0YXJ0Ow0KIDIxMCAg
ICAgICAgICAgICAgICAgcmV0dXJuIDA7DQogMjExICAgICAgICAgfQ0KDQpsaW5lIDIwOCwgKmFk
ZHIgaXMgemVyby4gU28gd2hlbiBhbWRncHVfY29weV9idWZmZXIgc3VibWl0IGpvYiB3aXRoIHN1
Y2ggYWRkciwgcGFnZSBmYXVsdCBoYXBwZW5zLg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCuWPkeS7tuS6ujogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlh
bi5Lb2VuaWdAYW1kLmNvbT4NCuWPkemAgeaXtumXtDogMjAyMeW5tDEx5pyIOeaXpSAyMDozNQ0K
5pS25Lu25Lq6OiBQYW4sIFhpbmh1aTsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCuaK
hOmAgTogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K5Li76aKYOiBSZTog5Zue5aSN
OiBbUEFUQ0hdIGRybS90dG06IFB1dCBCTyBpbiBpdHMgbWVtb3J5IG1hbmFnZXIncyBscnUgbGlz
dA0KDQpNaG0sIEknbSBub3Qgc3VyZSB3aGF0IHRoZSByYXRpb25hbCBiZWhpbmQgdGhhdCBpcy4N
Cg0KTm90IG1vdmluZyB0aGUgQk8gd291bGQgbWFrZSB0aGluZ3MgbGVzcyBlZmZpY2llbnQsIGJ1
dCBzaG91bGQgbmV2ZXINCmNhdXNlIGEgY3Jhc2guDQoNCk1heWJlIHdlIHNob3VsZCBhZGQgYSBD
Qzogc3RhYmxlIHRhZyBhbmQgcHVzaCBpdCB0byAtZml4ZXMgaW5zdGVhZD8NCg0KQ2hyaXN0aWFu
Lg0KDQpBbSAwOS4xMS4yMSB1bSAxMzoyOCBzY2hyaWViIFBhbiwgWGluaHVpOg0KPiBbQU1EIE9m
ZmljaWFsIFVzZSBPbmx5XQ0KPg0KPiBJIGhpdCB2dWxrYW4gY3RzIHRlc3QgaGFuZyB3aXRoIG5h
dmkyMy4NCj4NCj4gZG1lc2cgc2F5cyBnbWMgcGFnZSBmYXVsdCB3aXRoIGFkZHJlc3MgMHgwLCAw
eDEwMDAsIDB4MjAwMC4uLi4NCj4gQW5kIHNvbWUgZGVidWcgbG9nIGFsc28gc2F5cyBhbWRndSBj
b3B5IG9uZSBCTyBmcm9tIHN5c3RlbSBEb21haW4gdG8gc3lzdGVtIERvbWFpbiB3aGljaCBpcyBy
ZWFsbHkgd2VpcmQuDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4g5Y+R5Lu25Lq6OiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29t
Pg0KPiDlj5HpgIHml7bpl7Q6IDIwMjHlubQxMeaciDnml6UgMjA6MjANCj4g5pS25Lu25Lq6OiBQ
YW4sIFhpbmh1aTsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g5oqE6YCBOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IOS4u+mimDogUmU6IFtQQVRDSF0gZHJtL3R0
bTogUHV0IEJPIGluIGl0cyBtZW1vcnkgbWFuYWdlcidzIGxydSBsaXN0DQo+DQo+IEFtIDA5LjEx
LjIxIHVtIDEyOjE5IHNjaHJpZWIgeGluaHVpIHBhbjoNCj4+IEFmdGVyIHdlIG1vdmUgQk8gdG8g
YSBuZXcgbWVtb3J5IHJlZ2lvbiwgd2Ugc2hvdWxkIHB1dCBpdCB0bw0KPj4gdGhlIG5ldyBtZW1v
cnkgbWFuYWdlcidzIGxydSBsaXN0IHJlZ2FyZGxlc3Mgd2UgdW5sb2NrIHRoZSByZXN2IG9yIG5v
dC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFuQGFtZC5jb20+
DQo+IEludGVyZXN0aW5nIGZpbmQsIGRpZCB5b3UgdHJpZ2dlciB0aGF0IHNvbWVob3cgb3IgZGlk
IHlvdSBqdXN0IHN0dW1ibGVkDQo+IG92ZXIgaXQgYnkgcmVhZGluZyB0aGUgY29kZT8NCj4NCj4g
UGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4sIEkgd2lsbA0KPiBwaWNrIHRoYXQgdXAgZm9yIGRybS1taXNjLW5leHQuDQo+DQo+
IFRoYW5rcywNCj4gQ2hyaXN0aWFuLg0KPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jIHwgMiArKw0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPj4gaW5kZXggZjEzNjcxMDc5MjViLi5lMzA3MDA0
ZjBiMjggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+PiBAQCAtNzAxLDYgKzcwMSw4IEBA
IGludCB0dG1fbWVtX2V2aWN0X2ZpcnN0KHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LA0KPj4gICAg
ICAgIHJldCA9IHR0bV9ib19ldmljdChibywgY3R4KTsNCj4+ICAgICAgICBpZiAobG9ja2VkKQ0K
Pj4gICAgICAgICAgICAgICAgdHRtX2JvX3VucmVzZXJ2ZShibyk7DQo+PiArICAgICBlbHNlDQo+
PiArICAgICAgICAgICAgIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsX3VubG9ja2VkKGJvKTsNCj4+
DQo+PiAgICAgICAgdHRtX2JvX3B1dChibyk7DQo+PiAgICAgICAgcmV0dXJuIHJldDsNCg0K
