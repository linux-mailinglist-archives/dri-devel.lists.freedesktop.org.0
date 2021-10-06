Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA005423D6F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 14:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D46688E35;
	Wed,  6 Oct 2021 12:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF66E88E35
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 12:05:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eA5tpuwh+BLzz3FGcBxViqFDNE3M9QbqGwIxhyR6yY2LGFKZALfj1ZbdOjKGA/gvuIS+xPBfx1WkPaKlAmc1s5tvgBKqW0DerhOoWV6YmKTAFsTS5gG/3K44wJhUc7pvXwM8WKc3rsPju6rvjXVeHKocOn1gH7X99c3Qjd3OBKNTFeGrCL8XVzSU0x6wEY5Tl+v43tRLxcSVzGRXEaOiMhYdUzdwijxD9MWBZro4FjqHStbN4LLF4kOqDk6BdFe2cCbNOmnqf0GLatgQHlfdaPvVPVhptReq5EGVDASKuumt0r9qdjYUsswiEV9wlerF/SD9bG0ecy/WlyjXXp6EwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z66ak9MsTjUV9w3KUrUQ/chIeJobIMmi2sgVvrhr+to=;
 b=A8xsR8u+Nts9DWWGjoKj44K8W3AYXaCAykS6uZeqmjdtJpVMiVDYPymAzjbLRh4jq6ZIJzFAKPpncplN8mSqqftSowtIPxasB4DcdQ0EZUEnDk7Xf3BfYEgt/2avoaSEN0tC+ncZLL9gGRPryb1R5Fi+CTelrq0alIDjfOohsBSIfPadHmFCMSPkJ56vtUP83UwkQTjfdG5+K6tTBTr3GC9PJsytNWGNFPYpgHKb9B7J4o3uikPxU9b6nxwELzlssav2ABf4z3Ul7OgKYFMG3Z+h49PifRAHa+Ky2EJ7L1tK5KkVWjmWzSmIBMZm3bu6TVhF73L64sRTDldwYoa7jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z66ak9MsTjUV9w3KUrUQ/chIeJobIMmi2sgVvrhr+to=;
 b=V+I8vIfOX/OSFAUMTP0eHDVx5QcbNlaTCQY6xJPvPZXPtp6gN9wlk814VQV2DwmvWiqzFwAHBA5a+GKMUTm/cDTTb5A65fmTvHeyIaazzrOQ8F/hQSeCjoakQu4cm0RBh7XnEmk6y2D8XAcl+RNMVWJMizPto8lbeewzfXFQ+Pg=
Received: from DM6PR12MB4912.namprd12.prod.outlook.com (2603:10b6:5:20b::24)
 by DM6PR12MB4843.namprd12.prod.outlook.com (2603:10b6:5:1d1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 6 Oct
 2021 12:05:26 +0000
Received: from DM6PR12MB4912.namprd12.prod.outlook.com
 ([fe80::81f5:b123:f485:e51a]) by DM6PR12MB4912.namprd12.prod.outlook.com
 ([fe80::81f5:b123:f485:e51a%7]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 12:05:26 +0000
From: "Zuo, Jerry" <Jerry.Zuo@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, Doug Anderson
 <dianders@chromium.org>
CC: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>, "oliver.sang@intel.com"
 <oliver.sang@intel.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>, Jani Nikula <jani.nikula@intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Sam
 Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, Kuogee Hsieh <khsieh@codeaurora.org>
Subject: RE: connector_bad_edid() is broken (was: Re: [PATCH] drm/edid: Fix
 crash with zero/invalid EDID)
Thread-Topic: connector_bad_edid() is broken (was: Re: [PATCH] drm/edid: Fix
 crash with zero/invalid EDID)
Thread-Index: AQHXufuiB3TntzhJLk2KvcowNJeYQqvEhcmwgAAs+4CAAS4R4A==
Date: Wed, 6 Oct 2021 12:05:26 +0000
Message-ID: <DM6PR12MB49129E10E87DD88576B16A5DE5B09@DM6PR12MB4912.namprd12.prod.outlook.com>
References: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
 <YVtZstInQxXfPmsZ@intel.com>
 <DM6PR12MB49127B8B63079E6533197EA6E5AF9@DM6PR12MB4912.namprd12.prod.outlook.com>
 <CAD=FV=VvKsrB9RZKdB6vQJ-38BZEYLnuENxb1+1v-PahcdBtiQ@mail.gmail.com>
 <DM6PR12MB4912FFA74D1E7FF4599DA57EE5AF9@DM6PR12MB4912.namprd12.prod.outlook.com>
 <ba92567c-4ef3-871e-16d9-1830e2c0e929@amd.com>
In-Reply-To: <ba92567c-4ef3-871e-16d9-1830e2c0e929@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=4414a83f-54d0-41a2-ba64-47749a89fa40;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-10-06T12:05:05Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e264f141-252d-4e80-4fe5-08d988c19555
x-ms-traffictypediagnostic: DM6PR12MB4843:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4843D1C532EDD5E50C14B32EE5B09@DM6PR12MB4843.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:324;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2aeRzfj0+COAnNL+dwBqX0UthsoPv2rVo4SKQtoB6wpDuwYtnE/5fhj4UVOB1HFyOe3GFJ7ZYrkg8rv7GFcVlmSrOjzWVBsR++VVWHXAp4oKchVAIE3xI7zhkmEOPP8uoGju3vwR6xJBDaI0YPG7Owu5uo6IC5r3IgfpNCg0A1EZCgk2vQLqZ7M+NrHtPhf6MToWcDNanlDXjaW+v0+9RFF4Bp35LN+BAWAuHM2mrbYBAXVE0+IoWiXZiW3Uu9Wr2Ie+cgjyywgCbxFS5YyoSy27HFOXoo+hvsg5NuDMuf0RtGHyv9vum0bPQe+TMVFl6eho6Mxl51vuW45xkr9Of/Iwj3lAHpb1hLiWPxJWHU+C8dRrA90Z5lfkGNlwt1mKvn7dqInYguZjSn+lRcCotkNC86luuXyGtbyWneNUXD9XVG5/2DawyESrg4pWl0WXxGeEAfRRgYsuqXwxtxmN0sE35OzWQMIQSYRNYzJ73jDe4IJjYg+YvU0j7PJ1ITw0ymMXhRRaD9uDSYNJq0dF6rzEBrIVohu59eYiJ2W0Bd7OJWCeMq+A1gvkZfPMiDh/flwWYp20iTRLzRXN1/3t20RaakAFwMEMwFAJqZ0SHllIqFq7ihmGFrgtp1QPn9OiRgOossmJIvqQ+IDiSYTbpixL+rG/ttVHCuaNOvi1aydlfE/WQA6Acc6Jf2qLWi7bPYF5lmf2LT8Afc5seKuVQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4912.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(52536014)(66574015)(966005)(86362001)(26005)(54906003)(4326008)(33656002)(7696005)(76116006)(66946007)(8936002)(7416002)(55016002)(2906002)(508600001)(6506007)(66476007)(66556008)(64756008)(66446008)(8676002)(122000001)(38070700005)(186003)(83380400001)(9686003)(316002)(71200400001)(110136005)(38100700002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFFtNmhqNFE5NHJYTUVrRGlKZFVhWFQxS2ErN3ZvSWU3ZUp1N1l0a0RUK2ZL?=
 =?utf-8?B?Q051V2k2TEFUMG5hWmdKMG14OGxhYTd1UFN6N0pLZTg3TllZcVhJWndXSUhY?=
 =?utf-8?B?QUtFMlZRbWh1TTRScjhwSEh2VEZIUitTS0dlV2tNN05PcWEwaktHcjhDdWkw?=
 =?utf-8?B?T1RvQVRaT29KYkFKL2dnVTUvM3owWGNlV0l2SERSdWZuSnNid251bk1mNDVB?=
 =?utf-8?B?dEhTOWp5OXJ2R0lHR1duWm52Qmw5YUpFdkc4UlptNEptNkxJVkN3a2ZqSWc0?=
 =?utf-8?B?bFh3TlRLaVF2ejY3VnRKMEZJbGw5UGEyUmI0ZW1yZUZSZGQ5UEQyTGN3QXpH?=
 =?utf-8?B?NUxZcDVRaGJ0eVMwVWU4MGphRko3ZEthaWJNYmpqcHRva29CZXZST0JpZFh3?=
 =?utf-8?B?M3paT25EN1Q2K2RSbUVvWi9kRVVqdjhuakFES0ZYa2YwbTNnbW5BbHNsQy8y?=
 =?utf-8?B?RDkxS0FtSXVzbTRWY3FsN3lwY0RTRTlVVEpneEd5TnhZTlY3SHgxZzVPUjRz?=
 =?utf-8?B?YTJXQks3ZWc2bTd3dlRXRzYvaUxhcE9BeCtvYmZtTTIvV1l6RGJHMnc0SUts?=
 =?utf-8?B?REdYWVkrUEUrNEdwZDlyRzFVYWV1VXZVbkk1SVByQkI2amRZZ2hxaFZpcDJV?=
 =?utf-8?B?VU1BdHpCYzhkVWV5OXNjL3pXQ3QxRHpTT3JHTC9rUGErZ3gzelhwYjk4S01O?=
 =?utf-8?B?VndXNlMzYklXd2FTZmxWd252YWxIc1BIZDZ0TTlWSEV1bm5IWXRzNitub1BZ?=
 =?utf-8?B?OTBHUFRFRUdsRm9XZXBOVkViK0VwblNjTVVwTTJEUlh6UUxjNTZzcmlCUXBk?=
 =?utf-8?B?OGFUWCtaR1BJT1J0MmpSWmk0WHpHSjYva1BBNmpTUWJ3V3Y5dmtrVVR0RjFp?=
 =?utf-8?B?a08vTFYxSW1wY2FCVWJxUTFPMFQ4ZjN4M2ZFMDM3ZktaOFVnZGdycXBsRGth?=
 =?utf-8?B?Y3lXVlB5Zm1yTlNCekFBc0JuOTA2T2VDdEdSVXJiTjFlUkVwMGt6VmdYUkd6?=
 =?utf-8?B?dzdEdnBLK21lNlE2S0hpSmthdVY2eTZWcDB6QjNsU0JaOFE3R0pONGVjM2d4?=
 =?utf-8?B?S0FtaHFIK1Y4QUszTkdNVTgvY29pYjZzeTBzMU14M2F6ZGZSaXNJOVVPZGNq?=
 =?utf-8?B?eW1zR2F0bURiNEU4OXVFVXhNQkhITXpyTlJIOFB4NCtRRm1zS0xZcytndE5o?=
 =?utf-8?B?TVVUTFBUcEtvRDZkMEdkTHREUWJNaTY0RFEyV003T1UxQmhMNURaNlZiaW5F?=
 =?utf-8?B?NjFmOGloRjJOcDYvdjBrMERoM1pGUzE0NWRFZEtHb1FvSzNwYjhLSTltMndz?=
 =?utf-8?B?Q1VSUDZ4UmN0N2tjU09QMUt4SldkUnJQa0I1OGlxajdXOUR6WktyWndMZmpU?=
 =?utf-8?B?aENEWk0ramVoWFJtNElMSlRZOVlmWE0rZEZweFkvSlQybE8xVGtGNXRTQ0V1?=
 =?utf-8?B?SHU1WmNEeExJNE1LRmMxMWRYWG81YXdydys5WVJYNDEvSktWTlE4ZlN3Q2s3?=
 =?utf-8?B?d25zNk4vQ0lBWU5TK3hTZ1NScmVVMjhlYmpGVjkzOGdkMFJMOW0zeXAzMzgv?=
 =?utf-8?B?bTRZS0szVVllRWYzRjRXTDNLY3FQZm1PK2pvdmVnWmtxY1lhT1B4Zm15T1l2?=
 =?utf-8?B?dUsxWGNPRzNtVk9vNzBEenlZdm16dCswWTFXMVlwRTZpL1pFVnBRbmZySU1a?=
 =?utf-8?B?LzMzSFV0N2dzRjgySG5yelFvVy85M1hubjJuaXY4N3NLU2hIQ3VMdCtHTWpY?=
 =?utf-8?Q?vP3IelDPXw9c5TAasVR/aTy2bFCjTQWToX8fi/I?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4912.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e264f141-252d-4e80-4fe5-08d988c19555
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2021 12:05:26.3922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e5HS/h2pzbs+oxnwJk7Z6pTGkywXAuydWsXNmPELf0vSq5yeUu/nOTfiaDEmWaN/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4843
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBXZW50bGFuZCwgSGFycnkgPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+DQo+IFNlbnQ6
IE9jdG9iZXIgNSwgMjAyMSAyOjA0IFBNDQo+IFRvOiBadW8sIEplcnJ5IDxKZXJyeS5adW9AYW1k
LmNvbT47IERvdWcgQW5kZXJzb24NCj4gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4NCj4gQ2M6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+OyBkcmktDQo+IGRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZ2VlcnRAbGludXgtbTY4ay5vcmc7IG9saXZlci5z
YW5nQGludGVsLmNvbTsNCj4gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPjsgSmFuaSBOaWt1bGENCj4gPGphbmkubmlrdWxhQGlu
dGVsLmNvbT47IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IE1hYXJ0
ZW4NCj4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhp
bWUgUmlwYXJkDQo+IDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+OyBUaG9tYXMNCj4gWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IFNpcXVlaXJhLCBSb2RyaWdvIDxSb2RyaWdv
LlNpcXVlaXJhQGFtZC5jb20+OyBLdW9nZWUgSHNpZWgNCj4gPGtoc2llaEBjb2RlYXVyb3JhLm9y
Zz4NCj4gU3ViamVjdDogUmU6IGNvbm5lY3Rvcl9iYWRfZWRpZCgpIGlzIGJyb2tlbiAod2FzOiBS
ZTogW1BBVENIXSBkcm0vZWRpZDoNCj4gRml4IGNyYXNoIHdpdGggemVyby9pbnZhbGlkIEVESUQp
DQo+DQo+DQo+DQo+IE9uIDIwMjEtMTAtMDUgMTE6MjUsIFp1bywgSmVycnkgd3JvdGU6DQo+ID4g
W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+DQo+
ID4+IFNlbnQ6IE9jdG9iZXIgNSwgMjAyMSAxMToxNCBBTQ0KPiA+PiBUbzogWnVvLCBKZXJyeSA8
SmVycnkuWnVvQGFtZC5jb20+DQo+ID4+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPjsgZHJpLQ0KPiA+PiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGdlZXJ0QGxpbnV4LW02OGsub3JnOw0KPiA+PiBvbGl2ZXIuc2FuZ0BpbnRlbC5jb207IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IERhdmlkIEFpcmxpZQ0KPiA+PiA8YWlybGll
ZEBsaW51eC5pZT47IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+OyBMaW51cw0K
PiA+PiBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBNYWFydGVuIExhbmtob3Jz
dA0KPiA+PiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFy
ZA0KPiA+PiA8bXJpcGFyZEBrZXJuZWwub3JnPjsgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPjsgVGhvbWFzDQo+ID4+IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBXZW50bGFuZCwgSGFycnkgPEhhcnJ5Lldl
bnRsYW5kQGFtZC5jb20+OyBTaXF1ZWlyYSwgUm9kcmlnbw0KPiA+PiA8Um9kcmlnby5TaXF1ZWly
YUBhbWQuY29tPjsgS3VvZ2VlIEhzaWVoIDxraHNpZWhAY29kZWF1cm9yYS5vcmc+DQo+ID4+IFN1
YmplY3Q6IFJlOiBjb25uZWN0b3JfYmFkX2VkaWQoKSBpcyBicm9rZW4gKHdhczogUmU6IFtQQVRD
SF0gZHJtL2VkaWQ6DQo+ID4+IEZpeCBjcmFzaCB3aXRoIHplcm8vaW52YWxpZCBFRElEKQ0KPiA+
Pg0KPiA+PiBIaSwNCj4gPj4NCj4gPj4gT24gVHVlLCBPY3QgNSwgMjAyMSBhdCA2OjMzIEFNIFp1
bywgSmVycnkgPEplcnJ5Llp1b0BhbWQuY29tPiB3cm90ZToNCj4gPj4+DQo+ID4+Pj4gQlRXIEkg
YmVsaWV2ZSBjb25uZWN0b3JfYmFkX2VkaWQoKSBpdHNlbGYgaXMgYnJva2VuIHNpbmNlIGNvbW1p
dA0KPiA+Pj4+IGUxMWY1YmQ4MjI4ZiAoImRybTogQWRkIHN1cHBvcnQgZm9yIERQIDEuNCBDb21w
bGlhbmNlIGVkaWQNCj4gPj4+PiBjb3JydXB0aW9uIHRlc3QiKS4gQmVmb3JlIHdlJ3ZlIGV2ZW4g
YWxsb2NhdGVkIHRoZSBtZW1vcnkgZm9yIHRoZQ0KPiA+Pj4+IGV4dGVuc2lvbiBibG9ja3MgdGhh
dCBjb2RlIG5vdyBhc3N1bWVzIGVkaWRbMHg3ZV0gaXMgdG8gYmUgMTAwJQ0KPiA+Pj4+IHRydXN0
ZWQgYW5kIGdvZXMgYW5kIGNhbGN1bGF0ZXMgdGhlIGNoZWNrc3VtIG9uIGEgYmxvY2sgYmFzZWQg
b24NCj4gPj4+PiB0aGF0LiBTbyB0aGF0J3MgbGlrZWx5IGdvaW5nIHRvIGJlIHBvaW50aW5nIHNv
bWV3aGVyZSBiZXlvbmQgdGhlDQo+ID4+Pj4gYmFzZSBibG9jayBpbnRvIG1lbW9yeSB3ZSd2ZSBu
b3QgZXZlbiBhbGxvY2F0ZWQuIFNvIGFueW9uZSB3aG8NCj4gPj4+PiB3YW50ZWQgY291bGQgY3Jh
ZnQgYSBib2d1cyBFRElEIGFuZCBtYXliZSBnZXQgc29tZXRoaW5nIGludGVyZXN0aW5nDQo+ID4+
Pj4gdG8NCj4gPj4gaGFwcGVuLg0KPiA+Pj4+DQo+ID4+Pj4gV291bGQgYmUgZ29vZCBpZiBzb21l
b25lIGNvdWxkIGZpeCB0aGF0IHdoaWxlIGF0IGl0LiBPciBqdXN0IHJldmVydA0KPiA+Pj4+IHRo
ZSBvZmZlbmRpbmcgY29tbWl0IGlmIHRoZXJlIGlzIG5vIHNpbXBsZSBzb2x1dGlvbiBpbW1lZGlh
dGVseSBpbiBzaWdodC4NCj4gPj4+Pg0KPiA+Pj4+IFRoZSBmYWN0IHRoYXQgd2UncmUgcGFyc2lu
ZyBlbnRpcmVseSB1bnRydXN0d29ydGh5IGNyYXAgaW4gdGhlDQo+ID4+Pj4ga2VybmVsIGFsd2F5
cyB3b3JyaWVzIG1lLiBFaXRoZXIgd2UgbmVlZCBzdXBlciBjYXJlZnVsIHJldmlldyBvZg0KPiA+
Pj4+IGFsbCByZWxldmFudCBjb2RlLCBhbmQvb3Igd2UgbmVlZCB0byB0aGluayBhYm91dCBtb3Zp
bmcgdGhlIHBhcnNlcg0KPiA+Pj4+IG91dCBvZg0KPiA+PiB0aGUga2VybmVsLg0KPiA+Pj4+IEkg
d2FzIGNvbnNpZGVyaW5nIHBsYXlpbmcgYXJvdW5kIHdpdGggdGhlIHVzZXJtb2RlIGhlbHBlciBz
dHVmZi4NCj4gPj4+PiBJSVJDIHRoZXJlIGlzIGEgd2F5IHRvIGVtYmVkIHRoZSB1c2Vyc3BhY2Ug
YmluYXJ5IGludG8gdGhlIGtlcm5lbA0KPiA+Pj4+IGFuZCBqdXN0IGZpcmUgaXQgdXAgd2hlbiBu
ZWVkZWQuIEJ1dCBzbyBmYXIgaXQncyBiZWVuIHRoZSB1c3VhbA0KPiA+Pj4+IC1FTk9USU1FDQo+
ID4+IGZvciBtZS4uLg0KPiA+Pj4+DQo+ID4+PiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5XQ0KPiA+
Pj4NCj4gPj4+IEhpIFZpbGxlOg0KPiA+Pj4NCj4gPj4+ICAgICAgWWhlYSwgaXQgaXMgcHJldHR5
IG9sZCBjaGFuZ2UgZnJvbSB0d28geWVhcnMgYWdvLCBhbmQgaXQgaXMgbm8NCj4gPj4+IGxvbmcg
dmFsaWQNCj4gPj4gYW55bW9yZS4gUGxlYXNlIHNpbXBseSBkcm9wIGl0Lg0KPiA+Pj4NCj4gPj4+
IFJlZ2FyZHMsDQo+ID4+PiBKZXJyeQ0KPiA+Pg0KPiA+PiBJJ3ZlIGN1dCBvdXQgb3RoZXIgYml0
cyBmcm9tIHRoaXMgZW1haWwgYW5kIGNoYW5nZWQgdGhlIHN1YmplY3QgbGluZQ0KPiA+PiBzaW5j
ZSBJIHRoaW5rIHRoaXMgaXMgYW4gaXNzdWUgdW5yZWxhdGVkIHRvIHRoZSBvbmUgbXkgb3JpZ2lu
YWwgcGF0Y2ggd2FzDQo+IGZpeGluZy4NCj4gPj4NCj4gPj4gSSBkb24ndCBhY3R1YWxseSBrbm93
IGEgdG9uIGFib3V0IERQIGNvbXBsaWFuY2UgdGVzdGluZywgYnV0IEkNCj4gPj4gYXR0ZW1wdGVk
IHRvIHRyeSB0byBiZSBoZWxwZnVsIGFuZCByZXZlcnQgY29tbWl0IGUxMWY1YmQ4MjI4ZiAoImRy
bToNCj4gPj4gQWRkIHN1cHBvcnQgZm9yIERQIDEuNCBDb21wbGlhbmNlIGVkaWQgY29ycnVwdGlv
biB0ZXN0IikuIEl0IHdhc24ndA0KPiA+PiB0b28gaGFyZCB0byBkZWFsIHdpdGggdGhlIGNvbmZs
aWN0cyBpbiB0aGUgcmV2ZXJ0IGl0c2VsZiwgYnV0IHRoZW4NCj4gPj4gdGhpbmdzIGRpZG4ndCBj
b21waWxlIGJlY2F1c2UgdGhlcmUgYXJlIHR3byBwbGFjZXMgdGhhdCB1c2UNCj4gPj4gYHJlYWxf
ZWRpZF9jaGVja3N1bWAgYW5kIHRoYXQgZ29lcyBhd2F5IGlmIEkgcmV2ZXJ0IHRoZSBwYXRjaC4N
Cj4gPj4NCj4gPj4gSSd2ZSBtYWRlIGFuIGF0dGVtcHQgdG8gZml4IHRoZSBwcm9ibGVtIGJ5IGp1
c3QgYWRkaW5nIGEgYm91bmRzIGNoZWNrLg0KPiA+PiBQZXJoYXBzIHlvdSBjYW4gc2VlIGlmIHRo
YXQgbG9va3MgZ29vZCB0byB5b3U6DQo+ID4+DQo+ID4+IGh0dHBzOi8vbG9yZS4NCj4gIGtlcm5l
bC5vcmclMkZyJTJGMjAyMTEwMDUwODEwMjIuMS5JYjA1OWY5YzIzYzI2MTFjYjVhOWQ3NjBlN2Qw
YTcwMGMxDQo+ID4+DQo+IDI5NTkyOGQlNDBjaGFuZ2VpZCZhbXA7ZGF0YT0wNCU3QzAxJTdDSmVy
cnkuWnVvJTQwYW1kLmNvbSU3QzkwDQo+ID4+DQo+IGI5NDg2NTk0NTQ0MDBjZWRkMzA4ZDk4ODEy
YzMzOSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkDQo+ID4+ICU3QzAlN0MwJTdD
NjM3NjkwNDM2NDUzMTYzODY0JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5Sg0KPiBXSWoNCj4g
Pj4NCj4gb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhW
Q0k2TW4wJTNEJTdDMQ0KPiA+Pg0KPiAwMDAmYW1wO3NkYXRhPU90U25nV2xZeURjMU5iTlNnQWVB
THFOM25GJTJCbncwOG5KMDY4Y3BBS1pKayUzDQo+ID4+IEQmYW1wO3Jlc2VydmVkPTANCj4gPj4N
Cj4gPj4gLURvdWcNCj4gPg0KPiA+IFRoZSBwYXRjaCB1c2VkIGZvciBEUDEuNCBjb21wbGlhbmNl
IGVkaWQgY29ycnVwdGlvbiB0ZXN0LiBMZXQgbWUgZG91YmxlDQo+IGNoZWNrIGlmIGVkaWQgY29y
cnVwdGlvbiB0ZXN0IGNvdWxkIGJlIHBhc3NlZCB3aXRob3V0IHRoZSBwYXRjaC4NCj4gPg0KPg0K
PiBDYW4geW91IHRyeSB0aGUgQ1RTIHRlc3Qgd2l0aCBEb3VnJ3MgZml4Pw0KPg0KPiBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNDU3NTM3Lw0KPg0KPiBIYXJyeQ0KDQpZ
ZXMsIEknbGwgZ2l2ZSBhIHRyeSBvbiB0aGF0Lg0K
