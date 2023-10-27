Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF367D9D6E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C0510E9FD;
	Fri, 27 Oct 2023 15:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE69D10E9FC;
 Fri, 27 Oct 2023 15:51:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1tPjSB+2SKlVgTIJIwbFz4jJjY8pB3N4xH2c22nE9l9Ch7KLoYjroAhnKqwx/ZERfuzi/zKIBQroAzWQl0Vmhjc53ZiwcoZ8OyvaDaU5XfMjUA03u6C+OQG3+pQQIttrFkTGiJrtmRGPN8wWLd91QUWL0M9qx4PIB+bd3fkZNE5STpdI3QAqacwWlYGGevUO5oW8undVyTaVcpa0CUUiKPVQV5BfBhNbw1nm6UBYp+8iMU1inniH2M7D/tglkPQ84ZYS7sU0QjhsVZAm4vPSn96w5Q/JeWsxBxL2SU7+IO6V2HciUsfhe87jlqfLJQ/jW2HRW2/cFXN5XLMpuYLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nlv3P7J99KUKieViOL0VBR7J3msHF2UUa17ihjP92Uk=;
 b=Gl0wHwN9qIOAi4gzb5zwCxmkG0o90h/5fuyXIqy89zKGCXshkkKeGUqlQmrDP6aBPmXkxyYVJon+Lxr4ALg+ZjsePl+eXQx9kPPWdP5X/2uC3Elvka8uMGXfzk5GlLnn+77TMhH7b6/GDLzSliPH8k8QRb9jJAKKT/17nuLlWnkBNwlvXfdoXbg2mKeB0KyX+i0zZLBtu0HJPtLi6epe5odd1tZig6lckaGvVtR9Prfj1beh36WZVrFzOaFT8mVg4ennL4I+J6xpbopisMbQEUd8BXPYoD5vpIyhPFaTzx43CLxXDWxZrmAMS6qnH7V1whM8O5TuQqlzhU9jVz5N1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nlv3P7J99KUKieViOL0VBR7J3msHF2UUa17ihjP92Uk=;
 b=D1632fpdCYyFyKSFf0LasY1NvdBzXc311kiKG4BTzM7jNVXumhgf+iHC61vAJE5ltFlGnWLDdClu27D+uSJbd27gk7QYeVHmWTpgldONBU3u0WU2vxrMTETtfBb6sRkZgSfWKnTh37cxWP7YK57/Y+fJiYghjiVKbYJj2qxkCUw=
Received: from PH8PR12MB7279.namprd12.prod.outlook.com (2603:10b6:510:221::10)
 by DM8PR12MB5397.namprd12.prod.outlook.com (2603:10b6:8:38::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.22; Fri, 27 Oct 2023 15:51:08 +0000
Received: from PH8PR12MB7279.namprd12.prod.outlook.com
 ([fe80::4c4d:fe66:2403:1b86]) by PH8PR12MB7279.namprd12.prod.outlook.com
 ([fe80::4c4d:fe66:2403:1b86%4]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 15:51:07 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: Yuran Pereira <yuran.pereira@hotmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
 amdgpu_dm_setup_replay
Thread-Topic: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
 amdgpu_dm_setup_replay
Thread-Index: AQHaCFMIiCH2+6zK2kijRBI/zx7TwrBdyV4t
Date: Fri, 27 Oct 2023 15:51:07 +0000
Message-ID: <PH8PR12MB727973C99E57A5B03D058D87F9DCA@PH8PR12MB7279.namprd12.prod.outlook.com>
References: <DB3PR10MB683590457246A6625BAA6102E8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB3PR10MB683590457246A6625BAA6102E8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-10-27T15:51:06.501Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB7279:EE_|DM8PR12MB5397:EE_
x-ms-office365-filtering-correlation-id: d3cd5566-8b98-4d91-d304-08dbd70488bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: blyCe+Hmv9rfVxrw6wIkJtlmGQeQudQ9tkZWDBWD8DlBJqkN8SOF2yER7EBJw6Jz3R5r3mh9+/0V5rIvTe/GGXqV75yc4fYbyW3t4r0ptsI5JpFBzaHdMQoSXIHSjDwxL3UsCn7k4wVH/2rgtDk59tlWo81hHMe2Vt6hUuw7moY/luOgVB1xXSQGOVoPjSPwxhTEm2mYtFqBd0s/jJ8wToZXN+RFHAfh0TRGZ44B3EoSt9WvUdlOf4gEnsH84z7GautiYbU8TrV6JlLO7UfakFIBKNj6Llk7Ts3PnNFTc/axPr20lJCyKvx2aPxVnfjxC0EYLcvIRymqrX/dwQ5VXeFl/V6Mue75zT5iNU/dlGHcvKlXqO3bv1ZzDQKGaqr+0rLoUY4DixydpHrfs6pSO6Jzxv+dt9m5jCFuCsYTNjiBNLHQfI4yKKu+QiuI52tr5qyY8Jx4bhm7yW+mXObN4Adzw0ApHjC0Z2yZQ9adxANo/bojCCj6NMOD9O+Pv/wmbTaSzKQ+M80yKb7LhvSyNRrFgpV43cvXFitOnjx+yld7pbA6xOf00U5hySWUnKSVcc9bVFYq8burzgZ2G8LRQIy2NcNLt1bikqPBP2IS78iGr2V3RrqXRn7+oeys8NZL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7279.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(38070700009)(91956017)(53546011)(9686003)(19627405001)(76116006)(66476007)(66946007)(66556008)(54906003)(316002)(110136005)(64756008)(71200400001)(478600001)(66446008)(6506007)(7696005)(45080400002)(55016003)(26005)(8936002)(8676002)(4326008)(52536014)(2906002)(86362001)(41300700001)(122000001)(38100700002)(5660300002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zsrCtbiba2vRp4z0uK4y3ifYMOi7lE8sTpj7WunxGJRT2lDBvEdIeyCReH?=
 =?iso-8859-1?Q?hctLFDDaUL1r/k/D+R5q3jVBkVRXTl/KrEkgIGNZpRq8rlcResUIMlPQvT?=
 =?iso-8859-1?Q?184DBPuXGn9KNHQpf+ZKQuZGPHqXqG1b2CBvQJk+xtQ6lcvVs1Lg1O37Zk?=
 =?iso-8859-1?Q?l/4wH7sI+bsB3WYDZXUhhac5v6khMmJ1oUIV8CZ7mPUDzPeSVdfzYVrzUd?=
 =?iso-8859-1?Q?2ofo4I7Bb8qZ2h12erlEYztqDINZqAHyFSgXsi72WaFbuMHROQJsOr4/TF?=
 =?iso-8859-1?Q?gK0Pe7d/i9b5pkcq6B368qkLtzRhs/ht2/jxGIWE3klj7IAevWUwMxWv0X?=
 =?iso-8859-1?Q?Qg+UInHl814b0o2TRTMMFvnuqInCrNLB19Rzc1UKAONI8JahlSKqkaY2BS?=
 =?iso-8859-1?Q?kUSihnzS3MVQmkyYD8MnwMrcP3tqzkeS3PgO3mEbLUqvB3lJdztw2QiGf8?=
 =?iso-8859-1?Q?Nod9NyaNhs+bcPWu91hIFioHeKchMUfQhB5umZfW0p4KUYWMhMf/6YEQty?=
 =?iso-8859-1?Q?GD6oO7ZwWvrAJOS/ye+hkS2MfZH6JI5Aj+VqsCXPeihDCO2WTJq0Pe3FqM?=
 =?iso-8859-1?Q?JWDePEvFIcyDVlngB1ROf1s2oTF52S7BmNptjWJG6oHfxyi0rfxOYiOjgb?=
 =?iso-8859-1?Q?/6V69aejNqv9OOL4jw1sTt14pPZWhXJ3iDqda6k9Da3TgUJ3hkQTeNXlqH?=
 =?iso-8859-1?Q?3h6/8odYnh09k7gWjEWR9IzjxZnXs7lSNII83SccgP5aDmdHMj2UmbmocC?=
 =?iso-8859-1?Q?rR01NDDty8ql9AMEqCNo0hHovGp90uylX5gPiLQVzOFTMNXMtmaa5StLsK?=
 =?iso-8859-1?Q?9MiCjCU1TIIeVGkJsXBuuAfnS22B2QU2hRoo+ucEaMuKjb4E6z1s2ypRW+?=
 =?iso-8859-1?Q?TspdNrvEvo4AkdhrJTk3tZrRJfnM5d4CBQKwCWerVkSYdv2q8iLrgAZgIv?=
 =?iso-8859-1?Q?TuIvMwnteHo7AcvkafNOAPyMBFrB50V63/PD2Xh0vhWj9TnYB9EYnC36Tm?=
 =?iso-8859-1?Q?u6kzuNocqJIzextpZeCGuSTjQ4NOh7b8sb+ynx047F4IXoRnXLXIKruB4J?=
 =?iso-8859-1?Q?Q8Kf0Hj6OmFBTj4RUvMOWrm8SlMyQ6rfslth9Olhn3GlN/6jMy8v0aoEUV?=
 =?iso-8859-1?Q?8X5i017sfeyYRDHphKgTiGfFglaUl6maNkWnGp0mpbEnas8SHY6A+T4zFx?=
 =?iso-8859-1?Q?4dMVE526pUMl90YejkedbP0Oqgt0DwACTVTZ88WURSikuam7vHJ84B8cWO?=
 =?iso-8859-1?Q?lK1iac1psi+LRuqMtYrzbrgw73X/BwWKqJfpARxTn1CTzLTi0WL+ZxEh7d?=
 =?iso-8859-1?Q?GthspMT6fJpjXGR2vm31KTQUQvJScw0jDydgUXZJHTvsAVcgLunn3vxTsl?=
 =?iso-8859-1?Q?A8UTCOuIc4YCDKCrYSJTHY9X8otpXvDKHNx98wX6FvrtdqILMfHCzrohjK?=
 =?iso-8859-1?Q?Fq7xugz57cVJRakseDGv+8L5ksp0msw8LB+ykQg30l/G+WwLV38aCJL6v8?=
 =?iso-8859-1?Q?FWgz8GVJ/QywPGVzRZk5Piu+ct421sKMios2ZJpi4HpyqdiDa9HZIQDQFN?=
 =?iso-8859-1?Q?oz25eEHqiijNjGB9GRDKo0yDQ0+ZCDyBSdmAK6doQAyaTKTRw5Wt8gf7F9?=
 =?iso-8859-1?Q?RP5hPSfLRrXa8=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH8PR12MB727973C99E57A5B03D058D87F9DCAPH8PR12MB7279namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7279.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cd5566-8b98-4d91-d304-08dbd70488bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 15:51:07.6865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /D9kQFNJlo19li3/HCzmvb92PopLkSfZrTYhE/qie7e1EWMAxUXRg+lUeJ9eK1zf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5397
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
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_PH8PR12MB727973C99E57A5B03D058D87F9DCAPH8PR12MB7279namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Thanks,

Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

________________________________
From: Yuran Pereira <yuran.pereira@hotmail.com>
Sent: October 26, 2023 5:25 PM
To: airlied@gmail.com <airlied@gmail.com>
Cc: Yuran Pereira <yuran.pereira@hotmail.com>; Wentland, Harry <Harry.Wentl=
and@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Siqueira, Rodrigo <R=
odrigo.Siqueira@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; K=
oenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.co=
m>; daniel@ffwll.ch <daniel@ffwll.ch>; Lakha, Bhawanpreet <Bhawanpreet.Lakh=
a@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; =
dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-ke=
rnel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-kernel-mentees@l=
ists.linuxfoundation.org <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in amdgpu_d=
m_setup_replay

Since `pr_config` is not initialized after its declaration, the
following operations with `replay_enable_option` may be performed
when `replay_enable_option` is holding junk values which could
possibly lead to undefined behaviour

```
    ...
    pr_config.replay_enable_option |=3D pr_enable_option_static_screen;
    ...

    if (!pr_config.replay_timing_sync_supported)
        pr_config.replay_enable_option &=3D ~pr_enable_option_general_ui;
    ...
```

This patch initializes `pr_config` after its declaration to ensure that
it doesn't contain junk data, and prevent any undefined behaviour

Addresses-Coverity-ID: 1544428 ("Uninitialized scalar variable")
Fixes: dede1fea4460 ("drm/amd/display: Add Freesync Panel DM code")
Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
index 32d3086c4cb7..40526507f50b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
@@ -23,6 +23,7 @@
  *
  */

+#include <linux/string.h>
 #include "amdgpu_dm_replay.h"
 #include "dc.h"
 #include "dm_helpers.h"
@@ -74,6 +75,8 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struct =
amdgpu_dm_connector *ac
         struct replay_config pr_config;
         union replay_debug_flags *debug_flags =3D NULL;

+       memset(&pr_config, 0, sizeof(pr_config));
+
         // For eDP, if Replay is supported, return true to skip checks
         if (link->replay_settings.config.replay_supported)
                 return true;
--
2.25.1


--_000_PH8PR12MB727973C99E57A5B03D058D87F9DCAPH8PR12MB7279namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt;">=
Thanks,</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted1 ContentPasted3">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt;">=
Reviewed-by: Bhawanpreet Lakha &lt;Bhawanpreet.Lakha@amd.com&gt;</span><br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> Yuran Pereira &l=
t;yuran.pereira@hotmail.com&gt;<br>
<b>Sent:</b> October 26, 2023 5:25 PM<br>
<b>To:</b> airlied@gmail.com &lt;airlied@gmail.com&gt;<br>
<b>Cc:</b> Yuran Pereira &lt;yuran.pereira@hotmail.com&gt;; Wentland, Harry=
 &lt;Harry.Wentland@amd.com&gt;; Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.com&=
gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Deucher, Alexander=
 &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@=
amd.com&gt;;
 Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;; daniel@ffwll.ch &lt;daniel@ffwll.c=
h&gt;; Lakha, Bhawanpreet &lt;Bhawanpreet.Lakha@amd.com&gt;; amd-gfx@lists.=
freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.free=
desktop.org &lt;dri-devel@lists.freedesktop.org&gt;; linux-kernel@vger.kern=
el.org
 &lt;linux-kernel@vger.kernel.org&gt;; linux-kernel-mentees@lists.linuxfoun=
dation.org &lt;linux-kernel-mentees@lists.linuxfoundation.org&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Fixes uninitialized variable usage in a=
mdgpu_dm_setup_replay</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Since `pr_config` is not initialized after its dec=
laration, the<br>
following operations with `replay_enable_option` may be performed<br>
when `replay_enable_option` is holding junk values which could<br>
possibly lead to undefined behaviour<br>
<br>
```<br>
&nbsp;&nbsp;&nbsp; ...<br>
&nbsp;&nbsp;&nbsp; pr_config.replay_enable_option |=3D pr_enable_option_sta=
tic_screen;<br>
&nbsp;&nbsp;&nbsp; ...<br>
<br>
&nbsp;&nbsp;&nbsp; if (!pr_config.replay_timing_sync_supported)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_config.replay_enable_option &=
amp;=3D ~pr_enable_option_general_ui;<br>
&nbsp;&nbsp;&nbsp; ...<br>
```<br>
<br>
This patch initializes `pr_config` after its declaration to ensure that<br>
it doesn't contain junk data, and prevent any undefined behaviour<br>
<br>
Addresses-Coverity-ID: 1544428 (&quot;Uninitialized scalar variable&quot;)<=
br>
Fixes: dede1fea4460 (&quot;drm/amd/display: Add Freesync Panel DM code&quot=
;)<br>
Signed-off-by: Yuran Pereira &lt;yuran.pereira@hotmail.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 3 +++<br>
&nbsp;1 file changed, 3 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c<br>
index 32d3086c4cb7..40526507f50b 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c<br>
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c<br>
@@ -23,6 +23,7 @@<br>
&nbsp; *<br>
&nbsp; */<br>
&nbsp;<br>
+#include &lt;linux/string.h&gt;<br>
&nbsp;#include &quot;amdgpu_dm_replay.h&quot;<br>
&nbsp;#include &quot;dc.h&quot;<br>
&nbsp;#include &quot;dm_helpers.h&quot;<br>
@@ -74,6 +75,8 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struct =
amdgpu_dm_connector *ac<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct replay_config pr_co=
nfig;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; union replay_debug_flags *=
debug_flags =3D NULL;<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;pr_config, 0, sizeof(pr_c=
onfig));<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // For eDP, if Replay is s=
upported, return true to skip checks<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (link-&gt;replay_settin=
gs.config.replay_supported)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return true;<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_PH8PR12MB727973C99E57A5B03D058D87F9DCAPH8PR12MB7279namp_--
