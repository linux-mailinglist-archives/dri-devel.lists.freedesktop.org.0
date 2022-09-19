Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623FE5BD22F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 18:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B0910E691;
	Mon, 19 Sep 2022 16:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2076.outbound.protection.outlook.com [40.107.212.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A742710E691;
 Mon, 19 Sep 2022 16:27:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uu4BmJJQePrh479mHbSHN2bXOtYPn19dcVKGEtJeTTQ/UiN/Z0qX20q+pKuN7ezTtIo2slJ4mP9xnIERW92RsvHACyoEhiyZcR2DWUbY2yLuUyhxQy+HVaxZSW0W669qAyxc4Dw90pr7XX9B6I+56DQRvytCcOTS3W5On/ErP666TG3J7+qks9umRGEd0TwKaegSV+Jrkx9Wg5YLILN2RzPBwl6tWWt4O2Q4Y9T8leeRRutdnF5A8YIsGvuiVGRLZjPHnrBpkFVOLmHz3dhEGhrO+uBkYfLVor++4U4SGH5+qTCkyMSy3gLe/BqBBTKeCMeE6hYYNH7sv4p+DT1swQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/gGjVw0+Kq51yWxh7bedVivBXb8I77J6jYrgxSlOLs=;
 b=Z98Yt6g/v8F5kNHaceX6iUuXnrzuk1Ztmw791x7JuNhHBAH7wGu0tyaXrYJZsCGe7D5FQmRpJ4z+Y9lDvOOXFaR8Dtxry/kydD2R2AYoJt/ySpxxLd+yBF456t1tN7jaAzxb9Xro0bew7SoBRbUGCzc57I6Cx8tJ2PkHpLIx9Dz/Ihl1muhwHA71cO1BsW9FsNtydYQDakDuqZD28GSmskJRShv9IQA6jNQD30jJos2TjlzoYty4vYeNGZivHroXjENnflVTmIeVINzBfTcM0Ak3/fa0QGnMKsXmTy17TbCzD2O38N//VCEtgTdaNF399neKCPqxvAdaEuDDlGZoAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/gGjVw0+Kq51yWxh7bedVivBXb8I77J6jYrgxSlOLs=;
 b=r7GtmKeOQSuIYGOJvFqizMXEXPcOu/OV2oUYOaqSFSfWUnWYhlKie66MDXzoSZur5jH4TRXXPHNW7A2p21v0YuIVzc9b5IIwiG2N12XZD8OdxH7DT0tmyPVzt20JoEPkuioGdPQqSYgnYhRGB8Ytu4mfNh7CuPQkoIX74Zs0q4Y=
Received: from DM4PR12MB5213.namprd12.prod.outlook.com (2603:10b6:5:394::16)
 by CH2PR12MB4151.namprd12.prod.outlook.com (2603:10b6:610:78::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 16:27:20 +0000
Received: from DM4PR12MB5213.namprd12.prod.outlook.com
 ([fe80::f568:a2a9:8e30:5904]) by DM4PR12MB5213.namprd12.prod.outlook.com
 ([fe80::f568:a2a9:8e30:5904%6]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 16:27:20 +0000
From: "Kovac, Krunoslav" <Krunoslav.Kovac@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Zeng Heng <zengheng4@huawei.com>,
 "Chung, Jaehyun" <Jaehyun.Chung@amd.com>
Subject: RE: [PATCH] gpu: color: eliminate implicit conversion about enum type
Thread-Topic: [PATCH] gpu: color: eliminate implicit conversion about enum type
Thread-Index: AQHYy8hztXfWsXHFcEih1OOuG3r/Tq3m68IAgAAAS4CAAARv4A==
Date: Mon, 19 Sep 2022 16:27:20 +0000
Message-ID: <DM4PR12MB5213546E00652CD96EAA7476E64D9@DM4PR12MB5213.namprd12.prod.outlook.com>
References: <20220919014457.3297857-1-zengheng4@huawei.com>
 <CADnq5_OE0yZvEYGu82QJHL9wvVcTFZrmeTgX7URgh7FVA=jqYg@mail.gmail.com>
 <CADnq5_PmZsMCPk3hwZvk+ZrtDMpfxWrhHKfMAostd9pOgXwFHw@mail.gmail.com>
In-Reply-To: <CADnq5_PmZsMCPk3hwZvk+ZrtDMpfxWrhHKfMAostd9pOgXwFHw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=068fe227-3956-46d9-a0a5-8b470577ca7e;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-19T16:22:34Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5213:EE_|CH2PR12MB4151:EE_
x-ms-office365-filtering-correlation-id: 4723461d-bfed-457b-7d7b-08da9a5bd38a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /IuVieSEqKZSQ2p/74SwCXtmAHs6LutPs1SlmoYfyaxXbO8Ww0VoRiFuyotcip2bev/fJhnQXNc+gnMu0eiFIDURiUdjU4kg50Z+EToaEAf5vkvMuzFhXsLSP4//BWJS7fSNyesWzC1KYyDx46dJAqRaYPKMjXVkIXR/gCVF5s/sovbJ3Ci9ehbtplBUmHsfvbzke1GQPyxUkgWqRoVgJM5vdlKXgIzp/lWqplWv4gIqcuaPJJK7/hBqXRO26YiPnHD0T6dgTnPT6qB5jQ2pIqjRKGqzj3e/LCfkAH73Ww6LCIYldrDrH2I0IWudRY9M0XR0cMbP6rHjxfrrLcTShiGCMAORXGLPINP8WaTz2ysM9NhI25oSCMGeLRmKyfWxWid1fuVs4rm5qcfxpXyH1I5+zgc7R3iD0I4lJ2P6LCV0nSZtQXm497dUIN0JInrKcClDUdBpbqKTRXmHWdmtaOaNjSl37JaVnjj2bGV3qP5xjo9za/p3EuuMEmcpOVdZqj6BYUSssiqokAFZpN8bu5CXBiwk5KMe/A1pT7+4L0RNftz3A1z/dPDP3M6L7C96fy/E5cTUbBRih1oCQy03pIwfLm6y6guyCe473QJTbYME1Eg9oDVQcwcOUA2Yv2VNsNPsFbOlkQuL/+42q1/u3forLHfyyuY8QNqiWzhy6ORf6y3pKCq9hCgb8Ee7qyVub8rB7CYhTc3c+d+VgfI/Eu/a+sPQ+yy82Qc8o2EhTRnDd3Qso21kqMhNL5Mh6mFwf7Km4YR8DRAvqMW2IsqlDA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5213.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199015)(9686003)(38100700002)(26005)(122000001)(66899012)(55016003)(64756008)(6506007)(8676002)(33656002)(76116006)(4326008)(54906003)(2906002)(38070700005)(41300700001)(53546011)(7696005)(186003)(5660300002)(71200400001)(478600001)(86362001)(8936002)(316002)(110136005)(66556008)(66476007)(66446008)(66946007)(6636002)(83380400001)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VE1jS2tqcVhuS0pPRStzdUlRYThZdlhEV2pIbUs3WlBFQWVhS21vRnUvNW9E?=
 =?utf-8?B?WHBPRWVHYUliOTFwNU5Va2JTT2RmWkRsOUVvaUxjcTUwVWo0VXhLVUNIdHVw?=
 =?utf-8?B?SUJ5TUN6MmFEaGZoeG84dnd0ZVl3TzZwMEJ2d0lsKzduSHY2OVI5WjlFTEl0?=
 =?utf-8?B?S1FFL3dTM2hPNWxjR0Yra25nYVRoeGsrRUM0cC9TYkYycmwzUHpBR0w0L2dk?=
 =?utf-8?B?MUE3WEozSDRQUWwwK2w2SzdFRWZsYzZUcjd5L3FjVEZabGpieDN3eGJiVDJR?=
 =?utf-8?B?UXdhMjdXR25BOUN4Z2huaW5NRHB2SUJRMFdzZFdFV1lwZ2kzeVFyNTVQVWJZ?=
 =?utf-8?B?WVd3RW4za3d4cTBaQWkwKzlWd2poNjFWYkZYdzI2YlVCY0VZN1FrVWluaEhL?=
 =?utf-8?B?QU9SblBZbE96RVZ3Ni90YXBES0dQSzVxUmQzWTJ6eVpRcDVPUEUwakFQMDJB?=
 =?utf-8?B?UjlZeUFURDUxTjB6Y0s1NnBSUlNKTVlvQnlvcTNZZkFCK3hGM1grRzlkZ0dW?=
 =?utf-8?B?cG15YnFzVkxYc0lsOWhralZDN1NEcVFQWGtqMW1Xd29hNVdrWGM3dForUVdj?=
 =?utf-8?B?anpGKzZMSTZTeUlyajhGZUJJaFVBWmVnY1oxd3B1VEF3S2VWSFpWRlphVlll?=
 =?utf-8?B?RnpRVTJhNXRvT1Q5TW5zT2p6aEhMYzZvUTlrcGRoekErSDh2WDFHd0JRbXFj?=
 =?utf-8?B?N0VxOFB4dG5PUk0vY3h5WnRRUEVNVmJmbGNiMVp1UE83d0pBWFo5b1VvR1pC?=
 =?utf-8?B?Vm1CTXlJMEx6Z0orVTJWdHkrWmJRQzVQZGtLVWxIWE1TV2xaU2pxYjMyalhB?=
 =?utf-8?B?V1BsZVFGMFYvWXRJM0ppOXVVOHR2c1VUaHFiUGxqOFM5SG9DK3FSSlB5ajhv?=
 =?utf-8?B?b0lyWnVPRHVua0RoYmpFcVFpYTlzTEtIN0tTTkpMSXVtUWFuTVVRSmVuYk1n?=
 =?utf-8?B?NldzZ1ZSajdXd2o0U2JmTDVJNkhmMWFGK2lReHFCSVdvQnBORU8xM3BKMWRB?=
 =?utf-8?B?ZDh1MmdaYmkwMWVGWmYvbTh4THU3bng0NlpCbEp3WElsZ3JQWTZCS2Zndnkr?=
 =?utf-8?B?cFMwRmtRRDk0aDJGVVYycEdaM0tJY2pYTFZaMkxxM3E4Z1l0TjJkcjZNRmIy?=
 =?utf-8?B?cGZIUkdab1JIclNXSUx1cXhsKytJbjV3c1FqVDBWMDNSL3o1aER4Y0dOVk5K?=
 =?utf-8?B?QkFvVjMxajNMeWFBamZSVy9MQnJxOXUzR2I0ZlBzbEVpQ0xVdEJkLzN3cmhD?=
 =?utf-8?B?ZVJiSlZXSkVBN3huYjlCY1V0UW5Ec3ZMdWlKWWQ2M2N3eE5EM1NqY25ZL0Fn?=
 =?utf-8?B?c3VzL2FWUUJZNkRqTFpibllRdVVWcnJWT2FkcnJ3R0pGUWJQWi9Cbm5vai8w?=
 =?utf-8?B?NlhRMWVGaVErUjhhUUY1REF5UG1tZkl0azd0Q1l2aG9WeWNoQS9BNUZlUmtX?=
 =?utf-8?B?NnJ4NFBqVTFxZGg3eTBWUjdScGVsYy9XcitFQjBySjYxUUxmQ1h0ZlkvbER4?=
 =?utf-8?B?RWNwSFF6UkFHakY4eStoWTE0T0FYSDhJYXdrY3RQc0tvTlIzSG1uczhubGpV?=
 =?utf-8?B?OTZCVnNoUVgyaFhuRGtGTlYxUFZTMTJMTXZkRE1FdHpTeVFiSzlFME1JOWVF?=
 =?utf-8?B?VmhWaEJ3cVNsVzlRVWtNYnl3eEJycG5rL2htRzRlbnFDMVUxUWkyK2lGU0t3?=
 =?utf-8?B?YzA2TGtDNGpGVTB5Q0s3ckxrYkpJOXFPb2JvSmtGMmdDRHQvL1JPNmZ0TlZm?=
 =?utf-8?B?YjRuRS9MSHdZd2tZOSsva0duZTBtUjlkd3hqYnN2WXVDYmxkcmZyVm1LMVpT?=
 =?utf-8?B?SUJ6QUNIOTJHeGJCVGNSMEFUZ1ZBT3FCWDZHYnBaQlR4d0d6V2FTSk9rSExt?=
 =?utf-8?B?LzJNMVl0VnZEeXp3QVZJT1ViUjd1cG9adUptS0w0VDFKRTlVSThsaDE1ZHlk?=
 =?utf-8?B?SjdoYlgwZWJ1b3RheFBGVWZzSVhnMEJMekRjTFVRU0ZBQ2ZzWGpkOHJHZkh6?=
 =?utf-8?B?Yll6L2dhNnBqVm5FUDk4UXRZdHpYbGV4TmU5c0ZmdGFNZ3Q3UlY2Kzg0Zndy?=
 =?utf-8?B?d2FmUHk3ek92czY4SEtKeUxnaVd3anZCbXkyblpHN0IvaTc1a1N3TFozYUxp?=
 =?utf-8?Q?Xaf4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5213.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4723461d-bfed-457b-7d7b-08da9a5bd38a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 16:27:20.7960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rpf7XXMasJzYziW3UkJM8XUNii5Qn8AiAosOEbvRclr1aKQH6QB1qJ7BBLF3GFvw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4151
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
Cc: "Liu, HaoPing \(Alan\)" <HaoPing.Liu@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "liwei391@huawei.com" <liwei391@huawei.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "Wang, Sherry" <Yao.Wang1@amd.com>,
 "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Kotarac,
 Pavle" <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCj4gSSB0aGluayB0aGUgcHJvcGVy
IGZpeCBpcyB0byBzZXQgaXQgdG86DQo+IGJ1aWxkX2NvZWZmaWNpZW50cygmY29lZmYsIFRSQU5T
RkVSX0ZVTkNUSU9OX1NSR0IpOw0KDQpJIGFncmVlLCBkZWZhdWx0IGFyZyBzaG91bGQgYmUgVFJB
TlNGRVJfRlVOQ1RJT05fU1JHQi4NCkV2ZW4gdGhvdWdoIGl0J3MgYSBjaGFuZ2UgaW4gYmVoYXZp
b3VyLCBwcmV2aW91cyBiZWhhdmlvdXIgd2FzIHdyb25nLg0KSWRlYWxseSBpdCB3b3VsZCBiZSBi
YXNlZCBvbiBpbnB1dCBURiwgYnV0IGFmYWlrIG9uIGJvdGggTGludXggYW5kIFdpbiB0aGVyZSdz
IG5vIGN1cnJlbnQgY2FzZSB3aGVyZSB0aGlzIGlzIG5vdCBzUkdCLg0KDQpUaGFua3MsDQpLcnVu
bw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQWxleCBEZXVjaGVyIDxhbGV4
ZGV1Y2hlckBnbWFpbC5jb20+DQpTZW50OiBNb25kYXksIFNlcHRlbWJlciAxOSwgMjAyMiAxMjow
NyBQTQ0KVG86IFplbmcgSGVuZyA8emVuZ2hlbmc0QGh1YXdlaS5jb20+OyBDaHVuZywgSmFlaHl1
biA8SmFlaHl1bi5DaHVuZ0BhbWQuY29tPjsgS292YWMsIEtydW5vc2xhdiA8S3J1bm9zbGF2Lktv
dmFjQGFtZC5jb20+DQpDYzogV2VudGxhbmQsIEhhcnJ5IDxIYXJyeS5XZW50bGFuZEBhbWQuY29t
PjsgTGksIFN1biBwZW5nIChMZW8pIDxTdW5wZW5nLkxpQGFtZC5jb20+OyBTaXF1ZWlyYSwgUm9k
cmlnbyA8Um9kcmlnby5TaXF1ZWlyYUBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2Vu
aWdAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+OyBhaXJsaWVkQGxp
bnV4LmllOyBkYW5pZWxAZmZ3bGwuY2g7IEtvdGFyYWMsIFBhdmxlIDxQYXZsZS5Lb3RhcmFjQGFt
ZC5jb20+OyBMaXUsIEhhb1BpbmcgKEFsYW4pIDxIYW9QaW5nLkxpdUBhbWQuY29tPjsgV2FuZywg
U2hlcnJ5IDxZYW8uV2FuZzFAYW1kLmNvbT47IHdlaXlvbmdqdW4xQGh1YXdlaS5jb207IGxpd2Vp
MzkxQGh1YXdlaS5jb207IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBncHU6IGNvbG9yOiBl
bGltaW5hdGUgaW1wbGljaXQgY29udmVyc2lvbiBhYm91dCBlbnVtIHR5cGUNCg0KQWRkIHRoZSBy
ZWxldmFudCBBTUQgZGV2ZWxvcGVycyB0byBjb21tZW50Lg0KDQpPbiBNb24sIFNlcCAxOSwgMjAy
MiBhdCAxMjowNSBQTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6
DQo+DQo+IE9uIE1vbiwgU2VwIDE5LCAyMDIyIGF0IDM6MTkgQU0gWmVuZyBIZW5nIDx6ZW5naGVu
ZzRAaHVhd2VpLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGaXggYmVsb3cgY29tcGlsZSB3YXJuaW5n
IHdoZW4gb3BlbiBlbnVtLWNvbnZlcnNpb24gb3B0aW9uIGNoZWNrOg0KPiA+DQo+ID4gZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1h
LmM6DQo+ID4gSW4gZnVuY3Rpb24g4oCYYXBwbHlfZGVnYW1tYV9mb3JfdXNlcl9yZWdhbW1h4oCZ
Og0KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvbW9kdWxlcy9jb2xv
ci9jb2xvcl9nYW1tYS5jOjE2OTU6Mjk6DQo+ID4gZXJyb3I6IGltcGxpY2l0IGNvbnZlcnNpb24g
ZnJvbSDigJhlbnVtIDxhbm9ueW1vdXM+4oCZIHRvIOKAmGVudW0NCj4gPiBkY190cmFuc2Zlcl9m
dW5jX3ByZWRlZmluZWTigJkgWy1XZXJyb3I9ZW51bS1jb252ZXJzaW9uXQ0KPiA+ICAxNjk1IHwg
IGJ1aWxkX2NvZWZmaWNpZW50cygmY29lZmYsIHRydWUpOw0KPiA+ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn4NCj4gPg0KPiA+IEFzICdidWlsZF9jb2VmZmljaWVudHMn
IGRlZmluaXRpb24sIGl0IG5lZWRzIGVudW0NCj4gPiAnZGNfdHJhbnNmZXJfZnVuY19wcmVkZWZp
bmVkJyB0eXBlIGFjdHMgYXMgdGhlIHNlY29uZCBhcmd1bWVudCwNCj4gPiBpbnN0ZWFkIG9mIGJv
b2wtdHlwZSBvbmUuDQo+ID4NCj4gPiBUaGUgbnVtZXJpY2FsIHZhbHVlcyBvZiBUUkFOU0ZFUl9G
VU5DVElPTl9CVDcwOSAmIHRydWUgaGFwcGVuIHRvIGJlDQo+ID4gdGhlIHNhbWUsIHNvIHRoZXJl
IGlzIG5vIGNoYW5nZSBpbiBiZWhhdmlvci4NCj4NCj4gVGhpcyBsb29rcyBsaWtlIGEgcmVncmVz
c2lvbiBmcm9tOg0KPg0KPiBjb21taXQgOWIzZDc2NTI3ZjZlYTUwMjcwZjdmN2FjNzQ5NDkzYjQx
NzgzZThiZA0KPiBBdXRob3I6IEphZWh5dW4gQ2h1bmcgPGphZWh5dW4uY2h1bmdAYW1kLmNvbT4N
Cj4gRGF0ZTogICBNb24gQXVnIDMwIDE2OjQ2OjQyIDIwMjEgLTA0MDANCj4NCj4gICAgIGRybS9h
bWQvZGlzcGxheTogUmV2ZXJ0IGFkZGluZyBkZWdhbW1hIGNvZWZmaWNpZW50cw0KPg0KPiAgICAg
W1doeV0NCj4gICAgIERlZ2FtbWEgY29lZmZpY2llbnRzIGFyZSBjYWxjdWxhdGVkIGluIG91ciBk
ZWdhbW1hIGZvcm11bGEgdXNpbmcNCj4gICAgIHRoZSByZWdhbW1hIGNvZWZmaWNpZW50cy4gV2Ug
ZG8gbm90IG5lZWQgdG8gYWRkIHNlcGFyYXRlIGRlZ2FtbWENCj4gICAgIGNvZWZmaWNpZW50cy4N
Cj4NCj4gICAgIFtIb3ddDQo+ICAgICBSZW1vdmUgdGhlIGNoYW5nZSB0byBhZGQgc2VwYXJhdGUg
ZGVnYW1tYSBjb2VmZmljaWVudHMuDQo+DQo+ICAgICBSZXZpZXdlZC1ieTogS3J1bm9zbGF2IEtv
dmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4NCj4gICAgIEFja2VkLWJ5OiBNaWtpdGEgTGlw
c2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+DQo+ICAgICBTaWduZWQtb2ZmLWJ5OiBKYWVoeXVu
IENodW5nIDxqYWVoeXVuLmNodW5nQGFtZC5jb20+DQo+ICAgICBUZXN0ZWQtYnk6IERhbmllbCBX
aGVlbGVyIDxkYW5pZWwud2hlZWxlckBhbWQuY29tPg0KPiAgICAgU2lnbmVkLW9mZi1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPg0KPiBXaGljaCBzZWVtcyB0
byBpbXByb3Blcmx5IHJldmVydDoNCj4gY29tbWl0IGQwMjA5NzA5NTkxNjk2MjdkNTlhNzExNzY5
ZjhjNGI4N2JmNWY5MGMNCj4gQXV0aG9yOiBKYWVoeXVuIENodW5nIDxqYWVoeXVuLmNodW5nQGFt
ZC5jb20+DQo+IERhdGU6ICAgVHVlIEF1ZyAyNCAxNDowNTo0OCAyMDIxIC0wNDAwDQo+DQo+ICAg
ICBkcm0vYW1kL2Rpc3BsYXk6IEFkZCByZWdhbW1hL2RlZ2FtbWEgY29lZmZpY2llbnRzIGFuZCBz
ZXQgc1JHQg0KPiB3aGVuIFRGIGlzIEJUNzA5DQo+DQo+ICAgICBbV2h5XQ0KPiAgICAgSW4gWVVW
IGNhc2UsIG5lZWQgdG8gc2V0IHRoZSBpbnB1dCBURiB0byBzUkdCIGluc3RlYWQgb2YgQlQ3MDks
DQo+ICAgICBldmVuIHRob3VnaCB0aGUgaW5wdXQgVEYgdHlwZSBpcyBkaXN0cmlidXRlZC4gU1JH
QiB3YXMgbm90DQo+ICAgICBiZWluZyB1c2VkIGJlY2F1c2UgcGl4ZWwgZm9ybWF0IHdhcyBub3Qg
YmVpbmcgc2V0IGluIHRoZQ0KPiAgICAgc3VyZmFjZSB1cGRhdGUgc2VxdWVuY2UuDQo+ICAgICBB
bHNvLCB3ZSB3ZXJlIHVzaW5nIHRoZSBzYW1lIGNvZWZmaWNpZW50cyBmb3IgZGVnYW1tYSBhbmQN
Cj4gICAgIHJlZ2FtbWEgZm9ybXVsYSwgY2F1c2luZyB0aGUgY3V0b2ZmIHBvaW50IG9mIHRoZSBs
aW5lYXINCj4gICAgIHNlY3Rpb24gb2YgdGhlIGN1cnZlIHRvIGJlIGluY29ycmVjdC4NCj4NCj4g
ICAgIFtIb3ddDQo+ICAgICBTZXQgcGl4ZWwgZm9ybWF0IGluIHRoZSBzdXJmYWNlIHVwZGF0ZSBz
ZXF1ZW5jZS4gQWRkIHNlcGFyYXRlDQo+ICAgICBjb2VmZmljaWVudCBhcnJheXMgZm9yIHJlZ2Ft
bWEgYW5kIGRlZ2FtbWEuDQo+DQo+ICAgICBSZXZpZXdlZC1ieTogS3J1bm9zbGF2IEtvdmFjIDxL
cnVub3NsYXYuS292YWNAYW1kLmNvbT4NCj4gICAgIEFja2VkLWJ5OiBNaWtpdGEgTGlwc2tpIDxt
aWtpdGEubGlwc2tpQGFtZC5jb20+DQo+ICAgICBTaWduZWQtb2ZmLWJ5OiBKYWVoeXVuIENodW5n
IDxqYWVoeXVuLmNodW5nQGFtZC5jb20+DQo+ICAgICBUZXN0ZWQtYnk6IERhbmllbCBXaGVlbGVy
IDxkYW5pZWwud2hlZWxlckBhbWQuY29tPg0KPiAgICAgU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPg0KPiBJIHRoaW5rIHRoZSBwcm9wZXIg
Zml4IGlzIHRvIHNldCBpdCB0bzoNCj4gYnVpbGRfY29lZmZpY2llbnRzKCZjb2VmZiwgVFJBTlNG
RVJfRlVOQ1RJT05fU1JHQik7DQo+DQo+IEFsZXgNCj4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFplbmcgSGVuZyA8emVuZ2hlbmc0QGh1YXdlaS5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMgfCAyICstDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9y
L2NvbG9yX2dhbW1hLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVz
L2NvbG9yL2NvbG9yX2dhbW1hLmMNCj4gPiBpbmRleCAwNGY3NjU2OTA2Y2EuLjJmODA3ZDc4N2M3
NyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9j
b2xvci9jb2xvcl9nYW1tYS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYw0KPiA+IEBAIC0xNjkyLDcgKzE2OTIsNyBAQCBz
dGF0aWMgdm9pZCBhcHBseV9kZWdhbW1hX2Zvcl91c2VyX3JlZ2FtbWEoc3RydWN0IHB3bF9mbG9h
dF9kYXRhX2V4ICpyZ2JfcmVnYW1tYQ0KPiA+ICAgICAgICAgc3RydWN0IHB3bF9mbG9hdF9kYXRh
X2V4ICpyZ2IgPSByZ2JfcmVnYW1tYTsNCj4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBod194X3Bv
aW50ICpjb29yZF94ID0gY29vcmRpbmF0ZXNfeDsNCj4gPg0KPiA+IC0gICAgICAgYnVpbGRfY29l
ZmZpY2llbnRzKCZjb2VmZiwgdHJ1ZSk7DQo+ID4gKyAgICAgICBidWlsZF9jb2VmZmljaWVudHMo
JmNvZWZmLCBUUkFOU0ZFUl9GVU5DVElPTl9CVDcwOSk7DQo+ID4NCj4gPiAgICAgICAgIGkgPSAw
Ow0KPiA+ICAgICAgICAgd2hpbGUgKGkgIT0gaHdfcG9pbnRzX251bSArIDEpIHsNCj4gPiAtLQ0K
PiA+IDIuMjUuMQ0KPiA+DQo=
