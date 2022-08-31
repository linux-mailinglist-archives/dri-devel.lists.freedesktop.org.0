Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA0A5A84F1
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 20:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF43210E4C5;
	Wed, 31 Aug 2022 18:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20D710E4C5;
 Wed, 31 Aug 2022 18:03:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGZWjrmZm/XUd3DpzvMGBVCqT7hKZ4UY0EsBlrS5sZ+Z2URAmXUdwro4Ns7f/zuyvGwXf+rFp3rTybvjI75BkmRllzqozUVCoUD44fg5Ij1HlwBG5y1NoJghUtbDyYTDbWMdahnpuFF3jqAwhKFOkAtKhSW8lyOvkGkv2IeC19tXr0pWlqk40nATn6ZdNqSqEli7gshaebpVaOWxX2daGFARwXlrZCe9sn+xCZDBGKKo3iGehf20nwW/WTQEzcq6mMnv5iM2toCz16TyJoopHu35BloBX+j2Fe4hmYmwe60r2F2p77chOedmF4R3EnfD+LWYLlXb1t3Vd8sJ5EB9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLmSDw3SN0uv0BcFeePuVOTPZItchrm2jl6itgduwRI=;
 b=JfxvFjQWLcoMQyqGAi+JdTNwec7zWLcKhuuE5NFspNOw2B3WO0XI+q+Ib81ei3Y+Sa2SL0u1MsWRQwSdeKhUkRoL3EOa2D7Q6y4F0H9Q/JjVymiat8ODxuqcCWkpTSSkTTChPjqoMNTc68viPAawgsRB6WXD2EGab/ORa0SEaVHaAZOT3o4xCTdTqf9aqMVc8L9Iaf73zL2qNCARe5qmR1yLh5+EzQx5gGL2ovG5Ahq72B0DNuOPnGARoSWh8D5FbsIKFpCvrMpf+BG6WoaOHVfbM5fAsFFUHCQU3WiBSW1wtjZorWABfFnXaSajwVjVs1ivuGw8i+4LUElxyWP8jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLmSDw3SN0uv0BcFeePuVOTPZItchrm2jl6itgduwRI=;
 b=bDaZXhQPpm2u6/QjsT4ycPaR1GCFkksHF41O5Z2wkGnA+dmHF0KQcTBp5XOrEUPmkRxAuwByhoFBIVbMoFHX6LZu5za81sgL3eYHyTftTUn3bPEHtycaV+PYc/GTbAUYzCxgussZqhb73KcYMchyUlLogUvQmFgzkXuuVCY8H0M=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 18:03:50 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::2428:2f57:b85c:757f]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::2428:2f57:b85c:757f%8]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 18:03:49 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/amd/display: fix indentation in
 commit_planes_for_stream()
Thread-Topic: [PATCH] drm/amd/display: fix indentation in
 commit_planes_for_stream()
Thread-Index: AQHYvWM9SMnd+u38D0WdLb0Pzcl8gq3JTRtA
Date: Wed, 31 Aug 2022 18:03:49 +0000
Message-ID: <BL1PR12MB5144CE167DC191E105C43BBAF7789@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20220831175808.100597-1-hamza.mahfooz@amd.com>
In-Reply-To: <20220831175808.100597-1-hamza.mahfooz@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-08-31T18:03:15Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=f7fb79c3-d6ba-46ff-9018-af2f91dd5923;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-08-31T18:03:48Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: dcd189cb-3061-4880-a389-9c95db6f327b
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a69f01c-9f42-4ed4-b17c-08da8b7b283a
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y6Lr/WhPvso86BhEgBKtla8qENyl5AZmpKeO3nFx2S7YdHIrWKwwPemZOxqEMnpf98Kv+/HhXY62zC7WMgChpeaSBU2+cJJpG9DLnQ/vMLzG4DPFyaPvpV+5SGOHpSxw/doJFI0agMHz4mFQFys/CJQeN3V4/p0cN6j3+FUOdO5Nnaz0CgSnMwO+CgC+/qNX+EOd9iemM3+GsWgPq47vVDo68j2SnOnIoV9LnL7A6PNdX/4Ub+6PpuxioSnoyqzIkEYcmC14GpSUog3sx01vPdSNvZKIdKq4r/JjKvyWbiVcT9BWFB7oZ1iThiOseIiX3lUv8b+BN7CORGtmnAUj+95X7GL/SfFG5hsHdu/Bfd3Gkspi134Tb3e/yno2pmBZ8MTSZ+KUtSlJF8avAv2oRon9O+tiDqUH5FrHuR7MZHJF93EuSr8WbggWwf8gJqpAbqdCsQLgq5D8YxMhQtx1SOJBI1lLaya3qLcXDRKPqF/dNWDFPOwTs+fZ0EEmJBDPLl3dyk6IGoH0zpODE1pSPrSjB0yWQKkKdh2e121t7aRFf9ggYZc3Fo47THEi30PN8+nz1wYZYCARovFapBOBrju9Wh6CuP4kjpX5uTcj8EnKk8UKRX65ivLO3tjocuz3nTsfo3/hSLKv1dkaE7icNvQhm+2OIvpU+rnM75a1D6NAlSunwBxC9phmACCK0SnDS7Exi80ZwPJI4BW2q7T7kFoWPm1kITpQmlrQRty1/wpR6aZv//9NPZaBn3S/MEGtfWyuVPBX3C6FJ5c2OoksVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(83380400001)(2906002)(66446008)(9686003)(55016003)(26005)(64756008)(86362001)(38070700005)(4326008)(186003)(8676002)(76116006)(66946007)(66556008)(66476007)(122000001)(478600001)(38100700002)(52536014)(8936002)(5660300002)(71200400001)(33656002)(41300700001)(110136005)(54906003)(6506007)(53546011)(7696005)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkZYUnJLZlI3eHlKaVErOXZLcHpLY043MzdXQ242cENGNCtjVTN1cVI1UkJ5?=
 =?utf-8?B?c2czQmVHWnRKaUtCQ2xTa2dWZ05YdVJpY1kzZjVmS0svRWxMc0hqQ3Uyd3NP?=
 =?utf-8?B?MXp4ZnYybit3QnYxS2NmRE16R1EyZm14a1d4YnJSSGsyNUtUblNWd3ViMk13?=
 =?utf-8?B?VzR6RlZHamJWSURSd3JaZW9sTHZxTHBZckhYM20rSFd0SHRXRGVtVklVYW16?=
 =?utf-8?B?bFhNWnJZUUhwaGFORnhMRFNsclFJR2xDcVBXYmp0Y0l5WFhyOW5jZkVpNzR6?=
 =?utf-8?B?MjZCMzMxNG9INWVFMDZJS2dCZGVMRFRUWi9iSXRmSDMra1hKem9VUjdWK01B?=
 =?utf-8?B?eDFBd21nT0JKdnJFNlFnbW9oc2liNWpRVVlBRU9pTmtqaDVhU0NaVFV2VzY2?=
 =?utf-8?B?UlZoUjF3U0pUbjJUWmlEUzR4dE1SNktQK2FON1VMcExFV3VQQ3JEdUQ0byt5?=
 =?utf-8?B?enk1Y0RKdGFFK3dnRkQvYUxReUNXWDc0NTN1dFNyNytqc2l4bnJjdjViU3J4?=
 =?utf-8?B?WUs5MEkxQVNoSmFLWEpLYlRhOW9RVTZyMy9nTU5CTEhtN0VUaXl4WDhYV2o2?=
 =?utf-8?B?cXRtamJjSUxCeFcyWlZQZ0xENEpZWDdCZE9zN2hrS0pKZjl6Tll3RS9iWjlh?=
 =?utf-8?B?WUZvbGtCeFFJaXJZMUhEYjVlWEJ6UHV4MWxVcXZTS0c5YTlhejFkNVMyenpR?=
 =?utf-8?B?RC9NencxaGlnWkU5Z1dZbExNdjQ4MS9uMkdXZit5YjQ2NllmWDh1K2IwWFpE?=
 =?utf-8?B?ZUJYUUdhdDkyUGpYMkwrUU5NMG5hM21weGwrY2tGdlNFY3VHVDNwbEZxRk9H?=
 =?utf-8?B?aUhmUXBleXBld2RpRC9tdWVNblp6cExoMEFOWnVzRWwyRkJXTHVoTnViOTBq?=
 =?utf-8?B?MnYxblFETDBwdFZYK0ZyN2dEYlRNb1lrcVNJZHdodkhkVW54SFFYcTV5TlJY?=
 =?utf-8?B?Wk1jc25nTnRuWGpmc0JlZUJ6cG1UelNUcnVXMkJFR3F0UHZtaysraWx6NW1O?=
 =?utf-8?B?TDI0M2kxR0t1ODFSVmM5NjlkY3ZSYnN4U0kvTmg3dmE4N0VnRWxyWGx4OFVu?=
 =?utf-8?B?VzV4dHEzeDhzS3Y1M0tGRFZGUFJERG5vS3B6UmNXdFRsSmw0L3I1ekdLbWRq?=
 =?utf-8?B?Mzd2VHhXUEsxcy9uSmRVVTJqMGtYZ1g4aWhBNDRySk04QjNFR05uRjZWanVS?=
 =?utf-8?B?dWswOCszM014cUlQZzUxcitDSDhjaGRDbjhzTUw0TERFM1R4bXZTaFhHWlA2?=
 =?utf-8?B?bUI5RlZxL2NYdWtvQndkTElxS2dwdG5FTWZJMHdSbVRNcHZiMit2L2hIOXNS?=
 =?utf-8?B?bVVTKzFnbk9xb3JtelRkY0IzRUVoazZHNjE3L2xqZkJwVkdHdG92Uk9iR0xn?=
 =?utf-8?B?Q214cGJwUkpwSkJ3a1p3ZkNuRnFtR0QvVEM0OWVMU0FSMkhyWVcvVmRGRldp?=
 =?utf-8?B?ZGNJd084Nks4QXp5bWhVYmgrTW9nemNLRUNSR2c5RndFTUIweGlUMEpSSzg4?=
 =?utf-8?B?b05mT2RnVzNMTVNqV1RkcWtUT2RWT0ZyQmkvMTZWQmM1NDFkcmY1V2U1ZlFs?=
 =?utf-8?B?TzJjVFZoYjlGRUhTRnd1MTM4dGNOQmd5TWF4a1RSN1F2QmdiQ2M1NE8rYmEv?=
 =?utf-8?B?WCtRajNZTTNFaDhvMjdhY3phM3dxSjA2Z1h6LzR3Mk1IV2h6Z3ZUaHBzWEdM?=
 =?utf-8?B?bm15UVowMlY0TEZUTkVrY1dqam4yUkxiSHovaWpwV3VPeHdKdkxRa2E3N0FY?=
 =?utf-8?B?ekVENWlQTDZ4SktKZGR2MmxnbEdweHlpQlNremlWb09FYWljTVFyWW4rdW9Z?=
 =?utf-8?B?ejY5K1JCa0dEYXhkOUtnMnNNZXJ3T1pLVStHTEdUOWhPQmFFQmFkamtoUGNj?=
 =?utf-8?B?QVQ1bUhQQlFyMGRqWUZHdzdDbllyRHl0UW0ycHNZSXRoYlBjNDVVWGM0YVJC?=
 =?utf-8?B?VFBYcHNoNFg1d29mZEVNU3hxeitnem5SRE5SaUc5WFFjTTlseGJkMHBHdDE1?=
 =?utf-8?B?TG0zd2k4NEswNWIzVnFrOHZPOVhWSy8vd3ZCQ0Rpc2I0em1BVHZtOEVCb1o0?=
 =?utf-8?B?WUdscncwVWE4QjArbFJFbUdNcy9YeG5aMUNkQkpyQUVMR0pQVWFRZGlnbWlK?=
 =?utf-8?Q?FEKIlVgSsNK8zDyb7SB4OpxYE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a69f01c-9f42-4ed4-b17c-08da8b7b283a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 18:03:49.8207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i2ckJ4II/pZUUMV1rMOyEVcHXiT9O+/0xASr1UyLRFZ4ZAPgXdphinMHqgef9bTnkXGceK33tt7dRF/SGvl9+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5753
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
Cc: "Aberback, Joshua" <Joshua.Aberback@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Liu, Wenjing" <Wenjing.Liu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Tam, Samson" <Samson.Tam@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, "Somasundaram,
 Meenakshikumar" <Meenakshikumar.Somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, "Hung, Alex" <Alex.Hung@amd.com>, "Lee,
 Alvin" <Alvin.Lee2@amd.com>, "Leung, Martin" <Martin.Leung@amd.com>, "Lei,
 Jun" <Jun.Lei@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogTWFoZm9veiwgSGFtemEgPEhhbXphLk1haGZvb3pAYW1kLmNvbT4N
Cj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMzEsIDIwMjIgMTo1OCBQTQ0KPiBUbzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBDYzogTWFoZm9veiwgSGFtemEgPEhhbXphLk1haGZv
b3pAYW1kLmNvbT47IFdlbnRsYW5kLCBIYXJyeQ0KPiA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT47
IExpLCBTdW4gcGVuZyAoTGVvKSA8U3VucGVuZy5MaUBhbWQuY29tPjsNCj4gU2lxdWVpcmEsIFJv
ZHJpZ28gPFJvZHJpZ28uU2lxdWVpcmFAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlcg0KPiA8
QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3Rp
YW4uS29lbmlnQGFtZC5jb20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgRGF2
aWQNCj4gQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPjsgS2F6bGF1c2thcywNCj4gTmljaG9sYXMgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1k
LmNvbT47IExlaSwgSnVuIDxKdW4uTGVpQGFtZC5jb20+Ow0KPiBTb21hc3VuZGFyYW0sIE1lZW5h
a3NoaWt1bWFyDQo+IDxNZWVuYWtzaGlrdW1hci5Tb21hc3VuZGFyYW1AYW1kLmNvbT47IExlZSwg
QWx2aW4NCj4gPEFsdmluLkxlZTJAYW1kLmNvbT47IExldW5nLCBNYXJ0aW4gPE1hcnRpbi5MZXVu
Z0BhbWQuY29tPjsgVGFtLA0KPiBTYW1zb24gPFNhbXNvbi5UYW1AYW1kLmNvbT47IEh1bmcsIEFs
ZXggPEFsZXguSHVuZ0BhbWQuY29tPjsNCj4gQWJlcmJhY2ssIEpvc2h1YSA8Sm9zaHVhLkFiZXJi
YWNrQGFtZC5jb20+OyBMaXUsIFdlbmppbmcNCj4gPFdlbmppbmcuTGl1QGFtZC5jb20+OyBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL2Rpc3BsYXk6IGZpeCBpbmRlbnRhdGlv
biBpbg0KPiBjb21taXRfcGxhbmVzX2Zvcl9zdHJlYW0oKQ0KPiANCj4gQWRkcmVzcyB0aGUgZm9s
bG93aW5nIHdhcm5pbmc6DQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkv
ZGMvY29yZS9kYy5jOjM1MDg6OTogd2FybmluZzogdGhpcw0KPiDigJhpZuKAmSBjbGF1c2UgZG9l
cyBub3QgZ3VhcmQuLi4gWy1XbWlzbGVhZGluZy1pbmRlbnRhdGlvbl0NCj4gIDM1MDggfCAgICAg
ICAgIGlmICh1cGRhdGVfdHlwZSAhPSBVUERBVEVfVFlQRV9GQVNUKQ0KPiAgICAgICB8ICAgICAg
ICAgXn4NCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2Rj
LmM6MzUxMDoxNzogbm90ZTogLi4udGhpcw0KPiBzdGF0ZW1lbnQsIGJ1dCB0aGUgbGF0dGVyIGlz
IG1pc2xlYWRpbmdseSBpbmRlbnRlZCBhcyBpZiBpdCB3ZXJlIGd1YXJkZWQgYnkgdGhlDQo+IOKA
mGlm4oCZDQo+ICAzNTEwIHwgICAgICAgICAgICAgICAgIGlmICh1cGRhdGVfdHlwZSAhPSBVUERB
VEVfVFlQRV9GQVNUKQ0KPiAgICAgICB8ICAgICAgICAgICAgICAgICBefg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSGFtemEgTWFoZm9veiA8aGFtemEubWFoZm9vekBhbWQuY29tPg0KDQpBY2tlZC1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KDQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyB8IDggKysrKy0tLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMNCj4gaW5kZXggYjQ5MjM3
MzkwY2NlLi42YzQ5NDg5MTZlN2UgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jb3JlL2RjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGMuYw0KPiBAQCAtMzUwNSwxMSArMzUwNSwxMSBAQCBzdGF0aWMgdm9pZCBjb21t
aXRfcGxhbmVzX2Zvcl9zdHJlYW0oc3RydWN0IGRjDQo+ICpkYywNCj4gIAkJCQkJdG9wX3BpcGVf
dG9fcHJvZ3JhbS0NCj4gPnN0cmVhbV9yZXMudGcpOw0KPiAgCQl9DQo+IA0KPiAtCWlmICh1cGRh
dGVfdHlwZSAhPSBVUERBVEVfVFlQRV9GQVNUKQ0KPiArCWlmICh1cGRhdGVfdHlwZSAhPSBVUERB
VEVfVFlQRV9GQVNUKSB7DQo+ICAJCWRjLT5od3NzLnBvc3RfdW5sb2NrX3Byb2dyYW1fZnJvbnRf
ZW5kKGRjLCBjb250ZXh0KTsNCj4gLQkJaWYgKHVwZGF0ZV90eXBlICE9IFVQREFURV9UWVBFX0ZB
U1QpDQo+IC0JCQlpZiAoZGMtPmh3c3MuY29tbWl0X3N1YnZwX2NvbmZpZykNCj4gLQkJCQlkYy0+
aHdzcy5jb21taXRfc3VidnBfY29uZmlnKGRjLA0KPiBjb250ZXh0KTsNCj4gKwkJaWYgKGRjLT5o
d3NzLmNvbW1pdF9zdWJ2cF9jb25maWcpDQo+ICsJCQlkYy0+aHdzcy5jb21taXRfc3VidnBfY29u
ZmlnKGRjLCBjb250ZXh0KTsNCj4gKwl9DQo+IA0KPiAgCS8qIFNpbmNlIHBoYW50b20gcGlwZSBw
cm9ncmFtbWluZyBpcyBtb3ZlZCB0bw0KPiBwb3N0X3VubG9ja19wcm9ncmFtX2Zyb250X2VuZCwN
Cj4gIAkgKiBtb3ZlIHRoZSBTdWJWUCBsb2NrIHRvIGFmdGVyIHRoZSBwaGFudG9tIHBpcGVzIGhh
dmUgYmVlbiBzZXR1cA0KPiAtLQ0KPiAyLjM3LjINCg==
