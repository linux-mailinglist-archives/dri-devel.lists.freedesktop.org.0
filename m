Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ECB78C89A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83CE10E3B8;
	Tue, 29 Aug 2023 15:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F7A10E3B8;
 Tue, 29 Aug 2023 15:29:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edbkteRARYC9Qpa1f8Et+3Ikbwak2ZuXKnqsdw5IiMcuR7djjM5NBZn0yUaBXKIafRvOnWTj4Ei+jN1zVH2UTODre8BJ9L9tpGb/OruTEQR2Hlb2bs5AXNHNPPsxTa5EeFk5GUycLEvptcMrsCCV2iAGM2L9GsDHWEBiX1WgNWc40U87Db1YKLtmHNiLje+DUCHxZw3DGQKKUAkmsMjJshbWIKxZJD9CSUhHSp1TUbX6iqTcImmlSYtRT2ecZYod7SqxC6z+1VvaZJpQpHViAfQ1mp8RI9qr+lD54w1ZqT7s8bLsrf2ESibAU8X0cPWJ3wnJ2wr59umJypm92/AwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJ/ABGONM5wz8OHLmIqHdHhiAmd/xCWYrT4k+zHKFzM=;
 b=OjRiEaNbSYW8Oifoyv8kJZXnVNrrqWykMr1K83Md4CE1E4+Zv4VdXTQoQ9hN5yxGwJVljuxYfw0it4Zqxk9WTny6QeUtkZwBuOrHqKOkmqqFU4o7T6krp4fKECL/VIThh8DIHMiHks/5jr/D6M4dVgQ3kDvUk/fXPx0ASwE/tZqEjbm6xBP73AxfHWlK26gP56dJHm3TvMmMm96KOt4n/XtMRBWDccavIGZ7n76wrQhk9ekiUllFhVbyFvRuYAg1Fe/Cz6a1NfOAhuCMXlRcfqZzdkFsix5ZVyCnY/RoI9/yQo+ZV1846elIarJBoP6qhJK0oE7LpZu+tQzuYFFMig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJ/ABGONM5wz8OHLmIqHdHhiAmd/xCWYrT4k+zHKFzM=;
 b=lngF2fGkzlscyvyoVJkctctjlQaxnRUNx8ExnVkoENzAP1V3vYaxUaFhhW/CqeYZlj/mdmElBJ0lgKczHS8x+oOu5Hs0gle8W8Em5ivD7q1bVZsOXyOCqqsEt9knJMfDhbbeza+OUjRQyQQ3qph0XKUGx1tbZGEwTJzL8x297hc=
Received: from PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18)
 by DS7PR12MB6008.namprd12.prod.outlook.com (2603:10b6:8:7f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 15:29:35 +0000
Received: from PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::2630:61dc:a66:bf95]) by PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::2630:61dc:a66:bf95%3]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 15:29:35 +0000
From: "Wu, Hersen" <hersenxs.wu@amd.com>
To: Jani Nikula <jani.nikula@intel.com>, "Hung, Alex" <Alex.Hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Wang, Yu
 (Charlie)" <Yu.Wang4@amd.com>
Subject: RE: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
Thread-Topic: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
Thread-Index: AQHZ1PCVshFeKm1/rU2vqAsCcQ2D4K/2tpMAgADQKQCACZwUAIAATm5w
Date: Tue, 29 Aug 2023 15:29:34 +0000
Message-ID: <PH8PR12MB6962AD5B5CC221E0BE71C2A9FDE7A@PH8PR12MB6962.namprd12.prod.outlook.com>
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com> <87il965gob.fsf@intel.com>
 <871qfm2kg1.fsf@intel.com>
In-Reply-To: <871qfm2kg1.fsf@intel.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=29a1a242-3bc8-4586-8725-3e8881a04b9c;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-29T15:29:11Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB6962:EE_|DS7PR12MB6008:EE_
x-ms-office365-filtering-correlation-id: 7fa72eb5-44e0-4d81-3c6f-08dba8a4bfc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kZVC/6GYDmXnOf7Wh53881Fiab8/yUTs7E5bHyhEX6RVHLVM1mCQXb3AkG8NuOIU8aTdPbZeVu2mX0eLFS2Ma2mD6wHEk6WMl/J+mxkdYfD1XrVexWY9ZTgOPGV3Yh9TMxucb6mG9Bixbc88qYoK8JuA73zAFHKy3YT1MGwv+V6VafU8bvmp6K0VD2bMuWUsPZ1joKkxLW9D7hSeR/7LR3Be+/qCzbNRqv4VFLzyE5NkUlyQzVkEnrP8vu05bLSrtSA3aiuM65uBtZ4oxGSumUsTk1MqR5VHRlXmA70hwd3QsGoN0b9ZPidzG5YzHdBft1zdULMZ38ONA18JdBR3tm2sMyMfpeVDCkEv0tGgVuzRq6Pa56mXELf2dKJ8KXRuJ1DeOW1A73v0mcJuzeyDVGFbzeYn/5mx683xgBd7X8eV8mTl7ZZ/G9PFp3Fhqi1Js7ldP5XushgmEhVTyCVOzY9zxcX9EHYbsKP6s3IJyW1SD41JZiWDE2g7aSHi8BLGH/VmVNUgdnm8n3prxxKqD+wshITpBypEWFPD/isWtGoFxHnp5++0wpVpVqIVkeqm3qRwPhd/uoAXyJhAndf99KeLvRlpTx0JfaZJThmtZtHnPlkRhhAFaVDfRcl6FbEq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB6962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(186009)(1800799009)(451199024)(71200400001)(55016003)(6506007)(7696005)(86362001)(33656002)(26005)(83380400001)(9686003)(38070700005)(316002)(6636002)(66446008)(5660300002)(53546011)(110136005)(76116006)(66556008)(66946007)(38100700002)(66476007)(54906003)(41300700001)(52536014)(64756008)(2906002)(122000001)(478600001)(8936002)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DDOFdpxjZai8VDpBOjacZijkLtEFLTNPYEhkCpPs5HwyKJYlQ6z3Z8PjP5h7?=
 =?us-ascii?Q?uf9++zrcp6Jp3LbKhdtINwvC04XemPQQdlwcHyz1pS+WWmsdhJfhLaaJE2Ew?=
 =?us-ascii?Q?hP44b4E7KZoeun3QuNfVHCQUgvyn+p8xSg2stwIpWM8Xq8D4ud5cHGoPs4O1?=
 =?us-ascii?Q?a585BI9i2uwKhEebVDyGToo7aTIxW6C6fLBADoz2J8tLXtWC+rmd+d1d/L2H?=
 =?us-ascii?Q?G0ULH1owwYPWpPHbzy/dGUJwEUB8SKNjKn15KRcn02vDigQDn6z49XePrGsm?=
 =?us-ascii?Q?chhTga3kaHnjxz7mWmafLCvGOHtQGeMU5+aqr9mrdJidSdgCEhikfuk62BTv?=
 =?us-ascii?Q?WHGEdegEkHQA4kCskkd9N4ziGv7oHmYIZsrAhp5DvlnDHIE2Nfoj/gMSLvSN?=
 =?us-ascii?Q?pXEgtp9uKkIz9cKu/cg8NRGv2Cb6amwDsjB8oL8M6peKgdtxvAOh3v/1Merq?=
 =?us-ascii?Q?N+nrsAZ1JodxRCEHOqstswdrqJXH95qmaSgcG/qz/oomkvfRQWwC2ZtFhw9A?=
 =?us-ascii?Q?IxidziKt3fKUyKtThaKtdBPP7XkBS0GFPwQvW30w8gKK6FiHEVJ/K8UZD7AF?=
 =?us-ascii?Q?FRZrsWeLYeWE43As+SvajSxFn5lhEfKle28RlRQGnZshjug3+hFvWIEw28d3?=
 =?us-ascii?Q?CwU75OjGwFAG/Liyhm+AQGykCZn/hjPbSRQtdW7+ShtTdRWoHkTsawI1A2Kf?=
 =?us-ascii?Q?PNRObten7zQywGFxRm/76i3C+quhg2b2uwu5jSg3MMcM/PSXUZKoSC6OFD9T?=
 =?us-ascii?Q?P/PBvgNhbeZFH4DXsXa9M0K7FvvaG2O6j+A1q1wlb0Z0wd3SrGcbfsUUOaMd?=
 =?us-ascii?Q?uXpreAIMVY5SN/reLYHbRQ24szB3A46JkAsD2KJ5oFqeeGd8RmQTj96KPI6u?=
 =?us-ascii?Q?KyYAZZo7BE1Ezv+hzx7tToaIla9TgsDmuIHvjI6IWkmln2AhOGDvuPpE/8X7?=
 =?us-ascii?Q?Md65goIJGGaX4yGpYCs4Wl/1PZMSkakfp4FutqDxWHTdhFpKcoVfF1mKt9JG?=
 =?us-ascii?Q?/hJOvl1E2Ey/AVjG+fhGSpkuwIoRuhtvD+/uNcEH1m7l+mPjpbRZNzXh+9Oq?=
 =?us-ascii?Q?YThRzaLMm7Q7hsf3xdtR0Hx5kkTqDxg6lBvQt7Ee23Z0dbU37UdKmKc584uz?=
 =?us-ascii?Q?JYiDRJhvCAppyE8gnod4k7ZZCXs4lEfinOoTfuWYI4BKwjTBOXZ+L+ATBbCN?=
 =?us-ascii?Q?3rRNJ++naEdE9szNaR4PNfLD55JXAoT6M9aqoCdq6XbYfpak9OVvCqUEkGLT?=
 =?us-ascii?Q?hpJQOyXv9oFV2lRo5//SgGfmoUCMaK3au69srGm7O+m/j+NUQAw9H4cc4OMh?=
 =?us-ascii?Q?Ww+Wa2wGF9Jtpye1XSv8HsW8S432ysopvFsGeDQmiHPMiGIxaV0/L5iqOtsR?=
 =?us-ascii?Q?0ZJDmQdCix9SFDMbLlLWV1v1es869mQvwZwIp8V8C/ma0oFj67qoGmd6JmcZ?=
 =?us-ascii?Q?Csj6+9JXY6mWqNkzyF3VsscRuXc6cqBSqlREa1tAse7ZBJNyKB7lHOVtVtwD?=
 =?us-ascii?Q?+ncb3sqRu8Q7lAfhiOBRkUivHY++FgdXqpirOrmLgHpmHt+bQKLz+AEI5z4t?=
 =?us-ascii?Q?f20utXtzlCCPLLcpa6Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa72eb5-44e0-4d81-3c6f-08dba8a4bfc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 15:29:34.8222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mHHsaORxWLCTAUdvnOaeqhq//PlFwoojeHp6pCVaW8EyILbubac0z0yaTKHza/yuvfFpem6oRQ0FddBZKdMvLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6008
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "Wheeler,
 Daniel" <Daniel.Wheeler@amd.com>, "Chien,
 WenChieh \(Jay\)" <WenChieh.Chien@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

+ Charlie

-----Original Message-----
From: Jani Nikula <jani.nikula@intel.com>
Sent: Tuesday, August 29, 2023 6:49 AM
To: Hung, Alex <Alex.Hung@amd.com>; dri-devel@lists.freedesktop.org; amd-gf=
x@lists.freedesktop.org
Cc: Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; David Airlie <airlied@gmail.co=
m>; intel-gfx@lists.freedesktop.org; Siqueira, Rodrigo <Rodrigo.Siqueira@am=
d.com>; Wheeler, Daniel <Daniel.Wheeler@amd.com>; Wu, Hersen <hersenxs.wu@a=
md.com>; Daniel Vetter <daniel@ffwll.ch>; Chien, WenChieh (Jay) <WenChieh.C=
hien@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Wentland, Ha=
rry <Harry.Wentland@amd.com>
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using drm_edid_o=
verride_connector_update()

On Wed, 23 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 22 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
>> On 2023-08-22 06:01, Jani Nikula wrote:
>>> Over the past years I've been trying to unify the override and
>>> firmware EDID handling as well as EDID property updates. It won't
>>> work if drivers do their own random things.
>> Let's check how to replace these references by appropriate ones or
>> fork the function as reverting these patches causes regressions.
>
> I think the fundamental problem you have is conflating connector
> forcing with EDID override. They're orthogonal. The .force callback
> has no business basing the decisions on connector->edid_override.
> Force is force, override is override.
>
> The driver isn't even supposed to know or care if the EDID originates
> from the firmware loader or override EDID debugfs. drm_get_edid() will
> handle that for you transparently. It'll return the EDID, and you
> shouldn't look at connector->edid_blob_ptr either. Using that will
> make future work in drm_edid.c harder.
>
> You can't fix that with minor tweaks. I think you'll be better off
> starting from scratch.
>
> Also, connector->edid_override is debugfs. You actually can change the
> behaviour. If your userspace, whatever it is, has been written to
> assume connector forcing if EDID override is set, you *do* have to fix
> that, and set both.

Any updates on fixing this, or shall we proceed with the reverts?

BR,
Jani.



>
> BR,
> Jani.
>
>
>>
>> Cheers,
>> Alex
>>
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Alex Hung <alex.hung@amd.com>
>>> Cc: Chao-kai Wang <Stylon.Wang@amd.com>
>>> Cc: Daniel Wheeler <daniel.wheeler@amd.com>
>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Hersen Wu <hersenxs.wu@amd.com>
>>> Cc: Leo Li <sunpeng.li@amd.com>
>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>> Cc: Wenchieh Chien <wenchieh.chien@amd.com>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>
>>> Jani Nikula (4):
>>>    Revert "drm/amd/display: drop unused count variable in
>>>      create_eml_sink()"
>>>    Revert "drm/amd/display: assign edid_blob_ptr with edid from debugfs=
"
>>>    Revert "drm/amd/display: mark amdgpu_dm_connector_funcs_force static=
"
>>>    Revert "drm/amd/display: implement force function in
>>>      amdgpu_dm_connector_funcs"
>>>
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 44 +++---------------=
-
>>>   1 file changed, 5 insertions(+), 39 deletions(-)
>>>

--
Jani Nikula, Intel Open Source Graphics Center
