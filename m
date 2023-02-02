Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87246880BD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 15:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCAB10E517;
	Thu,  2 Feb 2023 14:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2056.outbound.protection.outlook.com [40.107.95.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315CF10E1B1;
 Thu,  2 Feb 2023 14:54:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNzFVtC26AA24nMEQyhjS9IPQnGMiB3mTDEm+RdagCMXgHOB9ODdWhLFSiJFnMrS5qokd+weBDxNLB+u8y4K1rMv0v23egA5Sdr/vtDmaHs/0DRSSg6pi8NGAE9615j9q7SqzmLzfgwOryUv/UB6vI+iyvNOPWbBxA6lT4NUOGe5fmoLW66Vy3r+XAgrOZkwaDHkCfxEcVPc1uKrPtaxLab6C+eIGM8B1T3Or1ZcimQ7LThsNBj5a9Uy++zb7rDMv24KkwSE4O92owLYotnIejXGHrcBdLKiFzcK/5hdxr2w9+ffccC4Xs3gTdjLLQyYnCgVlYSc6KpONtrg7kksTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MJNUz7V2xQsI22bQyBgVVbLP28d6Yvny42IKWafuQ8=;
 b=MwlHcTFWOjwbSaBumO9Astfy5FpLEN2cMJMaXAYaQhJ4mPLnMyu2dMWOPCCft1qgbzt3b0oqmkU9Yt2eR42eq7wzebRKUr7Ody1ede4QRVHE6iRZOABZn3L00IpJn8Maz1b6/M40RYCxj96mt57yWPHbHyXhx+Bjs053Z9gwZJG5Jacrj2a+DPKfEtlIQMAh1i36l/4rY8g9Np+4biMHJsJYH2WxLoaqusbNpwGxulc4dNQR3if8hoQvY2a7ODI69zuDT/2vvP3VfjRkPc7AgRjnL8eNIDeJ1KzIzdLtW7JfmdPU6id2iNjeiiZGq/KszB0uM0VxRNtZ+PbxCW+yBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MJNUz7V2xQsI22bQyBgVVbLP28d6Yvny42IKWafuQ8=;
 b=JOM/b1pY3ztRTL+JU/lqP1WkZJQun42BWpc9n/tX67UXMqNvUQQWiz2/yg18X+0uRNBjdS5GDDHoaelY2pBA6WpdxIXuGmEjeI6Cq+mbusiSrx9+xW599u21yafAYt1JCLrGquFsuwDYEHPEbGXVdSMvVptYY+XH4VyRYJXaY4Y=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 14:54:06 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5cbd:2c52:1e96:dd41]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5cbd:2c52:1e96:dd41%6]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 14:54:06 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: RE: [PULL] drm-misc-next
Thread-Topic: [PULL] drm-misc-next
Thread-Index: AQHZLzt+LXKKZ2D7TkGzizfD1bbaaq67zVxw
Date: Thu, 2 Feb 2023 14:54:06 +0000
Message-ID: <BL1PR12MB5144E22CB535DEED748FC288F7D69@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <Y8kDk5YX7Yz3eRhM@linux-uq9g>
 <0df23fe5-40cb-c5f3-33e1-da57a7b23808@physik.fu-berlin.de>
In-Reply-To: <0df23fe5-40cb-c5f3-33e1-da57a7b23808@physik.fu-berlin.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-02-02T14:54:04Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=a5884550-27f3-4bf1-83d4-be663ef1e3bd;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-02-02T14:54:04Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: d2274b11-8ed0-4db1-b05b-d78b6e0daf63
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|DS7PR12MB5864:EE_
x-ms-office365-filtering-correlation-id: 8d41da21-0839-43b4-9ab4-08db052d550a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6IuV/1MAcjZL763mWcMueRqRNoB5oZq+p9IPRRGsU3EFV2+88Bp5oOjq1zgb8+UgtclTRkaA1Hr9cbUMvgf0Q1Hnq/SzRO7+TBngrzUooAwBR97d2g2tyw0hGROP1KYkM1qEsmvrblCVjogGxujPmAd3wOSrQLJxWW3cQgx350BMGPdcZ/i/gRzTKN8QjZdc0UIc1UF8mjsivaZXtu5r6e5LSBoA041PH0x6xl4B2ATpA17ZnqR2rrpIi+z4+syPXZ6hEtSzj9SjM7K5QJd8oHoKL4sWXSHgtbURS/2mL8gPv9k21eaTnYKk2yoDs3Tt+H16QWXRj/eZs5voDrLyXONXjlmy1MVe65+rjWC4n+qm/0m8iwMiF5EbE2WQwT9JvMdOP73hAL9Jc+E/S/OeobP/XijC4eKOGqTrfcjYkrmLDn4MCcgp6u/zoJx4HOHAQOr5rceyswLilIdrXsN+K+AOUJ9gU0Dt34UIxmmNQ/Qcrece7QJ8Dzmo+W5j/o5laVkq7nUCxFPVpCfLkOgQ1laXIUDzadb9WsSSrzL91glzm0ensgCB1xI2IyxMb2zKhMyyRoDy04JdgmWfWwbGV5/LEFJ7aIX+DzRLYyuM58uIhXGlS4U3UkJEewJX5DA81w58pV+wnZe2niKMg8tYHYxrI6i+2bgdLZRGUVMu3Hc6BSS3ngkdQ5P717gQSCX9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199018)(33656002)(38100700002)(83380400001)(86362001)(122000001)(478600001)(55016003)(316002)(110136005)(54906003)(52536014)(5660300002)(38070700005)(26005)(66946007)(2906002)(7696005)(9686003)(186003)(53546011)(66446008)(6506007)(71200400001)(8936002)(64756008)(4326008)(66476007)(41300700001)(8676002)(66556008)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGtyZWx0UDdaMTNtL29wZVJTVDNYQTNaSFV4Tjk4UGt4ckhROXRnMk1PVkxq?=
 =?utf-8?B?Tzgyc0tKZ25JTkdPQ2pTNzBaWWI2ZWhWMGRDMVpCaDBpaHZaRWlmRkE0UGNQ?=
 =?utf-8?B?TndXY1RJOElYVEs4eU5BMmFkZDBQRHpndlMxTFJKQk5kUU1zaDFTK0ZNMFUz?=
 =?utf-8?B?ZWRNcFg4bkMzMXN2Zm9MSmVHWU45ZmhlM2ZHdmhBTmJyM0xBMUJ6ZzNkdGZk?=
 =?utf-8?B?MjZLS0NOS2FxR2Zrckl2MUUzTy84UndMV3J4K0xzVkNKRlExMThhSWw1RjVQ?=
 =?utf-8?B?amphT0wzMFg2WnE4M2tJdC91Ty9rYVkxUU5pY3lGRFhBdXduTnFHSnZkTHlH?=
 =?utf-8?B?REpibXgrdEhickhlY1FibFEwZXkvVU4yOFNNKzlKMEJFQzQzNnZHa1hJVVhY?=
 =?utf-8?B?UnFsWTNVOC9vUzFoS01MMjRBQTRpeUFkQWNFaDllSmIxWmZ1VzhwNGsvTk5Y?=
 =?utf-8?B?VW92VlRJTWpDSFBBVUJ5TEpybzJsbGJZOHUybG40NzlvUFNBMGhrUW4yM2xM?=
 =?utf-8?B?cjlMUlVVRTBqSHZydC9uakM3NTkvQ0lGQXAvSUdzZU96UDFFcE1yNVN0ZWtU?=
 =?utf-8?B?VUhiRFVmc1p6aE5FSUNNbnFnelo0ZWxKUStxajFYQUlFU3lkM0phUjFGbFVv?=
 =?utf-8?B?MzAwSXRSOXA5MThmQmJIc1hpMkViOUZXc2w5WHI1YmVuVGNFT0cvYTdyK0Fs?=
 =?utf-8?B?UlVNQm13aWxHQ3hhdlpTendtSjZBSTJ0bWhRN3Z0Snc2VU91RkJFQy9mcXhZ?=
 =?utf-8?B?czIwclRtcEVJMzVoUHFtTFo4dlFETHJZQldjRTBTYks1YmpKS3F1S1g5bTk4?=
 =?utf-8?B?MkV4ZmMyRGI1SkVBMFU3UjYrZXNFUUFtVURDazJCcFZnMTJDRFVtMzYxQlJy?=
 =?utf-8?B?MFlla3NFTXk4OWdoSktYa2pWSWJzc3BGVHBMZGJiMjZ2emsrUG1LT01GNGpi?=
 =?utf-8?B?NktiN2toRHloRVhZM0J5RFI5TFJseW5DTTFVTTVGUWZqc1hwWm83WVNZVW5J?=
 =?utf-8?B?Y2ZaUmlvVkxiWFNlZVZJQnhsV2dwZ2g1dTB1bWpDNjVYZFJXeHJPMFBNTTRz?=
 =?utf-8?B?Um40SWV5U0tTb0NuaEUwdzBGR3dNL0ZQOFdreUdka1luZk0zbTRHTXZ0WUlo?=
 =?utf-8?B?eXFEZW4wanhrWnJ4LzlsVnVlVkFHUW1MMlRRMDhVeHp6ZjdoU1RVSlA3dzh2?=
 =?utf-8?B?R3RhazJyNnFGV1JkWXNWS3lSR2xXMnFIWFRPdDAxKzEwdDBTczQ0SDhoM01y?=
 =?utf-8?B?WE5lWlQxQ0FaNkhhSnBTdlVRVWhsWmQrWnVMUHFWQkIreGIxZXZzNkV6Z0Zo?=
 =?utf-8?B?VUJWcEJQRnV5K0pyWmRkbmJtV1hiSzhOR2t5clFXaVIyNTN0THAwNE03d1c0?=
 =?utf-8?B?cm1jYXg0SFkxZWx4a1YzUGR4T0NQdm5GNWM0Vm93NllJMjVvb0VLcHU1NS9R?=
 =?utf-8?B?MDRiVFRkVXoxZXUrZUhqTDNhYkVMMlRybzJzMmVWUjQ2MUtHdjY4WHJ4cFR6?=
 =?utf-8?B?UU9OWVIrdDRGNGdiYkJ0bkhYZHZFZ3RGSG1XSXVVNTU1SVR5RFp3SHFEN08w?=
 =?utf-8?B?alBFUFRoUW4vaVhEbE41dUNvTEFjQUhZVHF6RXdtaXZjUnlpU1Q3cFIrK2dB?=
 =?utf-8?B?QjhNZEVYTVlVY1V5dVJIMXBvVU95MklaK094NHNzRHA5OG55NnBiajRybnJE?=
 =?utf-8?B?LzRxdXJ1V2VreDdmUlpoTHZnMm9WYlpVN0M2SFhWMlk5WHhQM0NjeUhFdHo2?=
 =?utf-8?B?UFNJT0tUWmdCQ0ozUjlxTTVIMi91TDA0RW1QRzUxQzFDRFo4d0dLYWVmL1lJ?=
 =?utf-8?B?bDV6SzYveDJEM2hya1hMU0cyeldtNlp5MVNDdWxVUnNhd3B5V21rL1FIZERx?=
 =?utf-8?B?RHJyVVJIWWY2L0liRUROcDdnRGVNNU1aY1dmTlJXa29MYnBXOE50b1N1dTVk?=
 =?utf-8?B?U3h6Vi8xVXhlcGc2aTdNc2xhUUNqMDRyemYyTnA0Q1cxaGVLcmVMTjU1M1VG?=
 =?utf-8?B?U3pWMUt3TkNUb0diUG5xL3ZrRWdMRzZhNjNoRTJMNzBuZ0Npd0FSdmxDZS9J?=
 =?utf-8?B?UUpFemVlbHRpeUt2ZTB3alBYRnQ5QXg5WlZjcFZoaFJQRnJvMFdwOXQvaG1X?=
 =?utf-8?Q?idwk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d41da21-0839-43b4-9ab4-08db052d550a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 14:54:06.1013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WM0SF6iio0Qfu4/idMEjKmw+UQHsXdlbg1zSDBepx90tWpkD3JYdRk+rUft9w+xTa+vjd6aJX3Dej9D6VkPKOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "dim-tools@lists.freedesktop.org" <dim-tools@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkaW0tdG9v
bHMgPGRpbS10b29scy1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
DQo+IEpvaG4gUGF1bCBBZHJpYW4gR2xhdWJpdHoNCj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDIz
LCAyMDIzIDEwOjAxIEFNDQo+IFRvOiB0emltbWVybWFubkBzdXNlLmRlDQo+IENjOiB0dnJ0a28u
dXJzdWxpbkBsaW51eC5pbnRlbC5jb207IGRpbS10b29sc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7
DQo+IGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyByb2RyaWdvLnZpdmlAaW50
ZWwuY29tOyBhaXJsaWVkQGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BVTExdIGRybS1taXNj
LW5leHQNCj4gDQo+IEhpIFRob21hcyENCj4gDQo+ID4gRHJpdmVyIENoYW5nZXM6DQo+ID4NCj4g
PiAgKiBSZW1vdmUgb2Jzb2xldGUgZHJpdmVycyBmb3IgdXNlcnNwYWNlIG1vZGVzZXR0aW5nIGk4
MTAsIG1nYSwgcjEyOCwNCj4gPiAgICBzYXZhZ2UsIHNpcywgdGRmeCwgdmlhDQo+IA0KPiBJcyB0
aGUgUmFnZSAxMjggR1BVIHN0aWxsIHN1cHBvcnRlZCB2aWEgdGhlIGdlbmVyaWMgbW9kZXNldHRp
bmcgZHJpdmVyPw0KPiANCj4gSSdtIGFza2luZyBiZWNhdXNlLCB3ZSdyZSBzdGlsbCBzdXBwb3J0
aW5nIFBvd2VyTWFjcyBpbiBEZWJpYW4gUG9ydHMgb2YNCj4gd2hpY2ggc29tZSBvZiB0aG9zZSBh
cmUgc3BvcnRpbmcgYSBSYWdlIDEyOCBHUFUuIFNpbWlsYXIgcXVlc3Rpb24gYXBwbGllcyB0bw0K
PiB0aGUNCj4gaTgxMCBHUFUgdXNlZCBpbiBzb21lIG9sZCBUaGlua1BhZHMsIGZvciBleGFtcGxl
Lg0KDQpUaGVzZSBhcmUgbm90IEtNUyBkcml2ZXJzLiAgVGhleSBhcmUganVzdCB0aGUga2VybmVs
IGNvbXBvbmVudCBuZWVkZWQgZm9yIDNEIHJlbmRlcmluZy4gIFRoZXNlIGRyaXZlcnMgaGF2ZSBu
b3RoaW5nIHRvIGRvIHdpdGggZHJpdmluZyB0aGUgZGlzcGxheXMgb24gdGhlc2UgY2FyZHMuICBG
b3IgZGlzcGxheSBzdXBwb3J0IHlvdSBuZWVkIHRvIHVzZSB0aGUgb2xkIFhvcmcgRERYcyBmb3Ig
dGhlc2UgY2FyZHMgb3IgdGhlIHJlbGV2YW50IG5vbi1EUk0gZmJkZXYgZHJpdmVycy4NCg0KQWxl
eA0KDQo+IA0KPiBUaGFua3MsDQo+IEFkcmlhbg0KPiANCj4gLS0NCj4gICAuJydgLiAgSm9obiBQ
YXVsIEFkcmlhbiBHbGF1Yml0eg0KPiA6IDonIDogIERlYmlhbiBEZXZlbG9wZXINCj4gYC4gYCcg
ICBQaHlzaWNpc3QNCj4gICAgYC0gICAgR1BHOiA2MkZGIDhBNzUgODRFMCAyOTU2IDk1NDYgIDAw
MDYgNzQyNiAzQjM3IEY1QjUgRjkxMw0K
