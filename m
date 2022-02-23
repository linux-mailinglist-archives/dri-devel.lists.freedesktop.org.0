Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4004C2468
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 08:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA43310F3B1;
	Thu, 24 Feb 2022 07:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB6C10E11F;
 Wed, 23 Feb 2022 23:27:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igzjloc/IHy1OJQLPqe/3KOrJL3ErkBiWQQDw7jJXx8aQZUCGFPi45UWy57gN9+i63jqr0/ty6pibdNO3Bkl5yN8+0Xj+G4iligye75BhRXqSnRQtJfJCgZ1kmh0srHQpQU6halkeIKjTURaZGrEZUSuiiFCD5Yw2X8DgEgfWaiPvfsLNVXuZ/dWu2uOjn36INp+RirAuGngoxzKp4tb0plNK7JFfPa0P6t7p9javNGFRH8eHZHKCsAbQZASVxxQ512nMvtQI8j8MLzz3kQm2qNL8jgx/xLfGs7AaCRWGR6/GS9x2Kf+Kks+TSvqC3lvmQW/DzgWBkH0CIF6ED9fvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhoGS3DUsCJBDKhDylqWVs7P3vnQ/LP+sog5aQcNYME=;
 b=Ms73CzMTotSGKg2a7LZ8JGv1TbaHU03ij9SXxqMQuoC7YlV0oEhrcg/KQUA7Aa0OnIpEGcXmXyNG4blji3xEJ+h2YQvah/uqaw4VHlknwqTdPFay6GjNwUXGydrlnn89zeSSpTFn+/4oxNQVJ2fbY3ewYXyA9Y5JQtMC5Wg9rGHa3IhPJnEI1K2lh/G4SEtXMxjQOHE3Mv2cwozLcctlPM118TUUu0jpIW9lJF1sJLXsf+Dxj+dA0fA4D6W9VRz19K+rrWsVbbMmeL5g5EvawHe7t3cQXLQIVcngs6/7J1zcG77NxzMtjSE5p+jnKeAiEKWn3y0MSQmHkXvT3L3wSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhoGS3DUsCJBDKhDylqWVs7P3vnQ/LP+sog5aQcNYME=;
 b=L7zyiS6mizgQuCzkwpsmKG7yubx3nfNYIwt8DJQQmiOHjj/Ki+nybuYz5PAJxHa6j+cgkvq7FqnBeD6+9PgwbuKC6B5pxuMkT0S7C1lwzrO7y7MIY6EJ/ItGjSJn82YfmXTzOa7aqrkPwD5yV7kOPkJcxrEUowLdH0k5gOku7G8=
Received: from BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19)
 by MW3PR12MB4460.namprd12.prod.outlook.com (2603:10b6:303:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 23:27:25 +0000
Received: from BY5PR12MB4211.namprd12.prod.outlook.com
 ([fe80::9950:df8d:9a0f:b334]) by BY5PR12MB4211.namprd12.prod.outlook.com
 ([fe80::9950:df8d:9a0f:b334%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 23:27:25 +0000
From: "Dhillon, Jasdeep" <Jasdeep.Dhillon@amd.com>
To: Melissa Wen <mwen@igalia.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/amd/display: move FPU-related code from dcn20 to
 dml folder
Thread-Topic: [PATCH v2] drm/amd/display: move FPU-related code from dcn20 to
 dml folder
Thread-Index: AQHYKQnnSH6/2ZzlBkyqqMkBsDnyx6yhxyel
Date: Wed, 23 Feb 2022 23:27:25 +0000
Message-ID: <BY5PR12MB42119C940C7070B6DE69B2A9FB3C9@BY5PR12MB4211.namprd12.prod.outlook.com>
References: <20220223230506.2656258-1-mwen@igalia.com>
In-Reply-To: <20220223230506.2656258-1-mwen@igalia.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-02-23T23:27:24.646Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: 848fdea2-f948-f57b-9ef6-9e1481aabf10
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2110adc8-51c7-48e0-4f21-08d9f7240cb4
x-ms-traffictypediagnostic: MW3PR12MB4460:EE_
x-microsoft-antispam-prvs: <MW3PR12MB4460DB420A101137CC5948C2FB3C9@MW3PR12MB4460.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zPsS7iEqmrEieZTJEjwNLR2XfEozCwnak10+tlVt5aVOQg+okcfp2SSf/yWrcAS3nsony8ejFJiaVew3qmSrPwkvsuiP4YflwTiepaJUxjVfWkHyxPLUKbVNLxinIUvPpvHsr5Y3/7PbXYeiOkDqCfKscQDasYOYEqPXI6H43mokrDiTzUVZ/XorqHNTwOYs+dmCeOitGcDts7hk47z6qZ7Kzui+P9Lbv83+ORaR0FCMsTHqjQSkuniaLKHlaQdI47rmzyrgqKRHirrALJN+jW+IFRU2Lt0CjLE0gWoSqZRadtSvsMMHxCIVqyh/STLTZvM0GDk6hXMPugMz1ww1CpPkxD5ppW7HUkqZ4Doq1ojoFjK0PPz+/WtN1JgKAG2IkaIVtG9YX9YjmJ5DTybbFze7L+lxdRL5yB5H5TrR4/ejH64wkH3ow4dAXo6BRCcTuq9Xb2Cn58mpV/fzsYDJ1G4oeJ7nwa9jwaWu4POZnfu59MUpKwnBJIT+xEm4ejeKSSNn6gsOTkSebz8SRY1zLutaSubN3OMtWxETLT/FALrmAW/pcqgpRPSHgJdgbjAWnCEAku82Tinta4Qe8p7/e3Pj0Kd7IbxTsbxyGluKBBAx5Cun4kSn7DM4DgW7ibbWYdrxqx4daH5fVmWMDk7yJIPirRlg+M80Zf1nzSL+S70+ChuM55wHE5kr5xCX9zmgbltqa+eh0o9H3vwxBcmaT2UvoR1ExbZ/C1ZXR5cwZJI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4211.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(186003)(71200400001)(9686003)(54906003)(66556008)(508600001)(45080400002)(76116006)(66946007)(66476007)(966005)(91956017)(7696005)(110136005)(316002)(86362001)(66446008)(64756008)(921005)(122000001)(8676002)(6506007)(166002)(83380400001)(52536014)(4326008)(38100700002)(30864003)(55016003)(5660300002)(33656002)(8936002)(2906002)(19627405001)(38070700005)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x4NLeLJKB6WUmpi4k7sE+pKqkYOL616bD8k+Y7MFo4s9hHiKJd4RuvHHwqem?=
 =?us-ascii?Q?BbqrbKfMFOKE1/wx2ZF2Sw5nJbCejXqPsiYsMV5WMn3kGg7JvtYgDFMwnNRH?=
 =?us-ascii?Q?WDy1c1OGtY+UURg3XzKRmcUGbH1yyhXyza8oE3Vop7XMhuPfvd/PMkoAKKUe?=
 =?us-ascii?Q?pi7YpU9iZVstR+i1eRH86k1t3n4w0++DQT8NI26KCLfXsOhnWUzieYTyxDXO?=
 =?us-ascii?Q?IlzlVqGMo+Qu06pYmQtFIXWePOJLXPoti/9lphSFYZLx2MlRDkyeTWFr+S4I?=
 =?us-ascii?Q?VCXn4si7f+TNg3NITVyJJ4HAtAOXzS65GMAAWApR+L5aP+HEtYdGMnIM3z3l?=
 =?us-ascii?Q?lunUhz36Lp07Jj7sBRWlK8eLq83RiRNwKA81acceNSITuS92V3oI7wzXYrww?=
 =?us-ascii?Q?aQVL4XvLjU+MUz4k05uAHXxEjEo2Kv9At52C2AGzdL2XxcwJi3ZJbpb3/3fj?=
 =?us-ascii?Q?hU3Ay3u9XB/0EOlL/9pysM4UWQ+bbvAcUz6m+bW4jIjz8xzkPbdlAIXC+vHV?=
 =?us-ascii?Q?yhveC8Je82hCdehrStXRXY/4d8Gq/IJwmcM9ODLtGUt2KqC8FaYam8ISnyrx?=
 =?us-ascii?Q?Z/6sLZ438aPX4/Iig63nk9ZErXReWgCVXl0LmovNMfgOE0E2A8tT6XIxECzb?=
 =?us-ascii?Q?Fh1MSvqnm5NL8AYFhioG4DqdZw9Rkya58SDUgiBx0epZ++nQP2WIDB5eSyWH?=
 =?us-ascii?Q?e2+/YgTTfo//V4uxKvqm82ir11DmCwM+Q6+DBaXLLI92Y5qPQEPYViVoqjSW?=
 =?us-ascii?Q?haiVxxG3eDasiuop+hZxWK801MhWLoum/FAq8FbZdxGbAJ5PQ1DeXpHJ+6dd?=
 =?us-ascii?Q?AqDHdnxftzA9jB/AmVohDR4kpTDbFq+ppwvlawV/RHKH81DVuLpEaXqKsIsM?=
 =?us-ascii?Q?GazK/6ED4W+82qvu7HeO2j4lGPe9uBZHzg/KMMXJ8NPdoENV++coaSZN24WC?=
 =?us-ascii?Q?6gipc4QoXqYOriTQ86kLcClwaOGnIuNWOlxdD/KFgEMvOQmhzIcHLphFQU3Y?=
 =?us-ascii?Q?jMx5sj4gky3Q4o2xiW75gtwdZxLMWvhPUYamikSJo9m/vzYTg1otp66tM4zd?=
 =?us-ascii?Q?WH9uWh/OGND0oLN3BW4drfzfophrKaspR+eZMFQ9tno8xKPclK9NYHRydvx2?=
 =?us-ascii?Q?ZE65gEOJfUMWpBoq5LL84PonutofTVVyHt9NNws5pQ3Ns2/huwetXhny/zeH?=
 =?us-ascii?Q?HJFZP3piB+Zm8D8vsreVlGmodkzTToqIDhnF9jcMGxhfT+nL1CLUq6bF2JPX?=
 =?us-ascii?Q?4yul74Dwv7Ikrb8wnL2gfyqc8oW/mrgMRTmKnrqh/nKbXGRaEqDp23Qpkl3j?=
 =?us-ascii?Q?emCrhPLV3VK1Tw6VtycGTAeqQmHSRXmHAtpjOEX0n718sfL8ZoHHWf9pgSzc?=
 =?us-ascii?Q?tBeXRAfe2r/ulBgxgxLfQsYTFatCgByFnZZXsEnubHbMr7fYLIqDXPD7EMLz?=
 =?us-ascii?Q?rcacefFi+WVwOvZ51mfzmDXwHs7y5bRS4apbd2crHzwpka8Nfr2+54R/e+k5?=
 =?us-ascii?Q?TEkinUbzTUKOjgDUCzdnSY6VO2hX7aZkt5rm0dgKsX8EvEKDcHgfDJGEjcf9?=
 =?us-ascii?Q?8nXVRM/p5ffbydVT5TgLaV7clwHprpKSYqrUs9sb/aR1eqNwGN4b+m57cOYp?=
 =?us-ascii?Q?twhrw5morz487lHnFTDnNQsbqSrImqjqcLMS8lIrfmQezcSvNnlylNZ8Tc3t?=
 =?us-ascii?Q?r5n4eQxHP5446ZSdyI99uyDwqbk=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BY5PR12MB42119C940C7070B6DE69B2A9FB3C9BY5PR12MB4211namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4211.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2110adc8-51c7-48e0-4f21-08d9f7240cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 23:27:25.1318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gc33B0Ur241pn/omhYeS6eQtgZ1Cak0WwuLWSI7CiFJfI9WAlTSqGEMcnqgu3i3USqJbIwVDojh5p228ppzatA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4460
X-Mailman-Approved-At: Thu, 24 Feb 2022 07:13:41 +0000
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
Cc: "Zhuo, Qingqing \(Lillian\)" <Qingqing.Zhuo@amd.com>, "Laktyushkin,
 Dmytro" <Dmytro.Laktyushkin@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BY5PR12MB42119C940C7070B6DE69B2A9FB3C9BY5PR12MB4211namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Hi Melissa,

Thanks for the new update and added your changes.

Regards,
Jasdeep
________________________________
From: Melissa Wen <mwen@igalia.com>
Sent: February 23, 2022 6:05 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Wentland, Harry =
<Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Siqueira=
, Rodrigo <Rodrigo.Siqueira@amd.com>; Deucher, Alexander <Alexander.Deucher=
@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhu=
i.Pan@amd.com>; airlied@linux.ie <airlied@linux.ie>; daniel@ffwll.ch <danie=
l@ffwll.ch>
Cc: Laktyushkin, Dmytro <Dmytro.Laktyushkin@amd.com>; Dhillon, Jasdeep <Jas=
deep.Dhillon@amd.com>; Zhuo, Qingqing (Lillian) <Qingqing.Zhuo@amd.com>; Me=
lissa Wen <mwen@igalia.com>; linux-kernel@vger.kernel.org <linux-kernel@vge=
r.kernel.org>
Subject: [PATCH v2] drm/amd/display: move FPU-related code from dcn20 to dm=
l folder

Move parts of dcn20 code that uses FPU to dml folder. It aims to isolate
FPU operations as described by series:

drm/amd/display: Introduce FPU directory inside DC
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatchwo=
rk.freedesktop.org%2Fseries%2F93042%2F&amp;data=3D04%7C01%7CJasdeep.Dhillon=
%40amd.com%7Cdf9863db496249b48b6f08d9f7210654%7C3dd8961fe4884e608e11a82d994=
e183d%7C0%7C0%7C637812543530752899%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DMcy8d=
Ekii67NyQoxaP0%2F8AjFYDhCZgqlm%2BGxAPo1OQ4%3D&amp;reserved=3D0

This patch moves the following functions from dcn20_resource to
dml/dcn20_fpu and calls of public functions in dcn20_resource are
wrapped by DC_FP_START/END():

- void dcn20_populate_dml_writeback_from_context
- static bool is_dtbclk_required()
- static enum dcn_zstate_support_state()
- void dcn20_calculate_dlg_params()
- static void swizzle_to_dml_params()
- int dcn20_populate_dml_pipes_from_context()
- void dcn20_calculate_wm()
- void dcn20_cap_soc_clocks()
- void dcn20_update_bounding_box()
- void dcn20_patch_bounding_box()
- bool dcn20_validate_bandwidth_fp()

This movement also affects dcn21/30/31, as dcn20_calculate_dlg_params()
is used by them. For this reason, I included dcn20_fpu headers in
dcn20_resource headers to make dcn20_calculate_dlg_params() visible to
dcn21/30/31.

Three new functions are created to isolate well-delimited FPU
operations:

- void dcn20_fpu_set_wb_arb_params(): set cli_watermark,
  pstate_watermark and time_per_pixel from wb_arb_params (struct
mcif_arb_params), since those uses FPU operations on double types:
WritebackUrgentWatermark, WritebackDRAMClockChangeWatermark, '16.0'.
- void dcn20_fpu_set_wm_ranges(): set min_fill_clk_mhz and
  max_fill_clk_mhz involves FPU calcs on dram_speed_mts (double type);
- void dcn20_fpu_adjust_dppclk(): adjust operation on RequiredDPPCLK
  that is a double.

--

v2:
 - besides dcn20_resource, dcn20_calculate_dlg_params() is used in
   dcn[21/30/31]_resource and therefore it needs to be wrapped by
   DC_FP_START/END wherever it is called, as verified by
   dc_assert_fp_enabled.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile |   25 -
 .../drm/amd/display/dc/dcn20/dcn20_resource.c | 1370 +---------------
 .../drm/amd/display/dc/dcn20/dcn20_resource.h |   30 +-
 .../drm/amd/display/dc/dcn21/dcn21_resource.c |    2 +
 .../drm/amd/display/dc/dcn30/dcn30_resource.c |    2 +
 .../drm/amd/display/dc/dcn31/dcn31_resource.c |    2 +
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 1385 +++++++++++++++++
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.h  |   42 +-
 8 files changed, 1457 insertions(+), 1401 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile b/drivers/gpu/dr=
m/amd/display/dc/dcn20/Makefile
index 5fcaf78334ff..abaed2121feb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
@@ -9,31 +9,6 @@ DCN20 =3D dcn20_resource.o dcn20_init.o dcn20_hwseq.o dcn2=
0_dpp.o dcn20_dpp_cm.o d

 DCN20 +=3D dcn20_dsc.o

-ifdef CONFIG_X86
-CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -msse
-endif
-
-ifdef CONFIG_PPC64
-CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -maltivec
-endif
-
-ifdef CONFIG_CC_IS_GCC
-ifeq ($(call cc-ifversion, -lt, 0701, y), y)
-IS_OLD_GCC =3D 1
-endif
-endif
-
-ifdef CONFIG_X86
-ifdef IS_OLD_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-bound=
ary=3D3
-# (8B stack alignment).
-CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o +=3D -mpreferred-stack-boun=
dary=3D4
-else
-CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o +=3D -msse2
-endif
-endif
-
 AMD_DAL_DCN20 =3D $(addprefix $(AMDDALPATH)/dc/dcn20/,$(DCN20))

 AMD_DISPLAY_FILES +=3D $(AMD_DAL_DCN20)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/driver=
s/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index dfe2e1c25a26..63c50bee0144 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -63,7 +63,6 @@
 #include "dcn20_dccg.h"
 #include "dcn20_vmid.h"
 #include "dc_link_ddc.h"
-#include "dc_link_dp.h"
 #include "dce/dce_panel_cntl.h"

 #include "navi10_ip_offset.h"
@@ -93,367 +92,6 @@

 #define DC_LOGGER_INIT(logger)

-struct _vcs_dpi_ip_params_st dcn2_0_ip =3D {
-       .odm_capable =3D 1,
-       .gpuvm_enable =3D 0,
-       .hostvm_enable =3D 0,
-       .gpuvm_max_page_table_levels =3D 4,
-       .hostvm_max_page_table_levels =3D 4,
-       .hostvm_cached_page_table_levels =3D 0,
-       .pte_group_size_bytes =3D 2048,
-       .num_dsc =3D 6,
-       .rob_buffer_size_kbytes =3D 168,
-       .det_buffer_size_kbytes =3D 164,
-       .dpte_buffer_size_in_pte_reqs_luma =3D 84,
-       .pde_proc_buffer_size_64k_reqs =3D 48,
-       .dpp_output_buffer_pixels =3D 2560,
-       .opp_output_buffer_lines =3D 1,
-       .pixel_chunk_size_kbytes =3D 8,
-       .pte_chunk_size_kbytes =3D 2,
-       .meta_chunk_size_kbytes =3D 2,
-       .writeback_chunk_size_kbytes =3D 2,
-       .line_buffer_size_bits =3D 789504,
-       .is_line_buffer_bpp_fixed =3D 0,
-       .line_buffer_fixed_bpp =3D 0,
-       .dcc_supported =3D true,
-       .max_line_buffer_lines =3D 12,
-       .writeback_luma_buffer_size_kbytes =3D 12,
-       .writeback_chroma_buffer_size_kbytes =3D 8,
-       .writeback_chroma_line_buffer_width_pixels =3D 4,
-       .writeback_max_hscl_ratio =3D 1,
-       .writeback_max_vscl_ratio =3D 1,
-       .writeback_min_hscl_ratio =3D 1,
-       .writeback_min_vscl_ratio =3D 1,
-       .writeback_max_hscl_taps =3D 12,
-       .writeback_max_vscl_taps =3D 12,
-       .writeback_line_buffer_luma_buffer_size =3D 0,
-       .writeback_line_buffer_chroma_buffer_size =3D 14643,
-       .cursor_buffer_size =3D 8,
-       .cursor_chunk_size =3D 2,
-       .max_num_otg =3D 6,
-       .max_num_dpp =3D 6,
-       .max_num_wb =3D 1,
-       .max_dchub_pscl_bw_pix_per_clk =3D 4,
-       .max_pscl_lb_bw_pix_per_clk =3D 2,
-       .max_lb_vscl_bw_pix_per_clk =3D 4,
-       .max_vscl_hscl_bw_pix_per_clk =3D 4,
-       .max_hscl_ratio =3D 8,
-       .max_vscl_ratio =3D 8,
-       .hscl_mults =3D 4,
-       .vscl_mults =3D 4,
-       .max_hscl_taps =3D 8,
-       .max_vscl_taps =3D 8,
-       .dispclk_ramp_margin_percent =3D 1,
-       .underscan_factor =3D 1.10,
-       .min_vblank_lines =3D 32, //
-       .dppclk_delay_subtotal =3D 77, //
-       .dppclk_delay_scl_lb_only =3D 16,
-       .dppclk_delay_scl =3D 50,
-       .dppclk_delay_cnvc_formatter =3D 8,
-       .dppclk_delay_cnvc_cursor =3D 6,
-       .dispclk_delay_subtotal =3D 87, //
-       .dcfclk_cstate_latency =3D 10, // SRExitTime
-       .max_inter_dcn_tile_repeaters =3D 8,
-       .xfc_supported =3D true,
-       .xfc_fill_bw_overhead_percent =3D 10.0,
-       .xfc_fill_constant_bytes =3D 0,
-       .number_of_cursors =3D 1,
-};
-
-static struct _vcs_dpi_ip_params_st dcn2_0_nv14_ip =3D {
-       .odm_capable =3D 1,
-       .gpuvm_enable =3D 0,
-       .hostvm_enable =3D 0,
-       .gpuvm_max_page_table_levels =3D 4,
-       .hostvm_max_page_table_levels =3D 4,
-       .hostvm_cached_page_table_levels =3D 0,
-       .num_dsc =3D 5,
-       .rob_buffer_size_kbytes =3D 168,
-       .det_buffer_size_kbytes =3D 164,
-       .dpte_buffer_size_in_pte_reqs_luma =3D 84,
-       .dpte_buffer_size_in_pte_reqs_chroma =3D 42,//todo
-       .dpp_output_buffer_pixels =3D 2560,
-       .opp_output_buffer_lines =3D 1,
-       .pixel_chunk_size_kbytes =3D 8,
-       .pte_enable =3D 1,
-       .max_page_table_levels =3D 4,
-       .pte_chunk_size_kbytes =3D 2,
-       .meta_chunk_size_kbytes =3D 2,
-       .writeback_chunk_size_kbytes =3D 2,
-       .line_buffer_size_bits =3D 789504,
-       .is_line_buffer_bpp_fixed =3D 0,
-       .line_buffer_fixed_bpp =3D 0,
-       .dcc_supported =3D true,
-       .max_line_buffer_lines =3D 12,
-       .writeback_luma_buffer_size_kbytes =3D 12,
-       .writeback_chroma_buffer_size_kbytes =3D 8,
-       .writeback_chroma_line_buffer_width_pixels =3D 4,
-       .writeback_max_hscl_ratio =3D 1,
-       .writeback_max_vscl_ratio =3D 1,
-       .writeback_min_hscl_ratio =3D 1,
-       .writeback_min_vscl_ratio =3D 1,
-       .writeback_max_hscl_taps =3D 12,
-       .writeback_max_vscl_taps =3D 12,
-       .writeback_line_buffer_luma_buffer_size =3D 0,
-       .writeback_line_buffer_chroma_buffer_size =3D 14643,
-       .cursor_buffer_size =3D 8,
-       .cursor_chunk_size =3D 2,
-       .max_num_otg =3D 5,
-       .max_num_dpp =3D 5,
-       .max_num_wb =3D 1,
-       .max_dchub_pscl_bw_pix_per_clk =3D 4,
-       .max_pscl_lb_bw_pix_per_clk =3D 2,
-       .max_lb_vscl_bw_pix_per_clk =3D 4,
-       .max_vscl_hscl_bw_pix_per_clk =3D 4,
-       .max_hscl_ratio =3D 8,
-       .max_vscl_ratio =3D 8,
-       .hscl_mults =3D 4,
-       .vscl_mults =3D 4,
-       .max_hscl_taps =3D 8,
-       .max_vscl_taps =3D 8,
-       .dispclk_ramp_margin_percent =3D 1,
-       .underscan_factor =3D 1.10,
-       .min_vblank_lines =3D 32, //
-       .dppclk_delay_subtotal =3D 77, //
-       .dppclk_delay_scl_lb_only =3D 16,
-       .dppclk_delay_scl =3D 50,
-       .dppclk_delay_cnvc_formatter =3D 8,
-       .dppclk_delay_cnvc_cursor =3D 6,
-       .dispclk_delay_subtotal =3D 87, //
-       .dcfclk_cstate_latency =3D 10, // SRExitTime
-       .max_inter_dcn_tile_repeaters =3D 8,
-       .xfc_supported =3D true,
-       .xfc_fill_bw_overhead_percent =3D 10.0,
-       .xfc_fill_constant_bytes =3D 0,
-       .ptoi_supported =3D 0,
-       .number_of_cursors =3D 1,
-};
-
-static struct _vcs_dpi_soc_bounding_box_st dcn2_0_soc =3D {
-       /* Defaults that get patched on driver load from firmware. */
-       .clock_limits =3D {
-                       {
-                               .state =3D 0,
-                               .dcfclk_mhz =3D 560.0,
-                               .fabricclk_mhz =3D 560.0,
-                               .dispclk_mhz =3D 513.0,
-                               .dppclk_mhz =3D 513.0,
-                               .phyclk_mhz =3D 540.0,
-                               .socclk_mhz =3D 560.0,
-                               .dscclk_mhz =3D 171.0,
-                               .dram_speed_mts =3D 8960.0,
-                       },
-                       {
-                               .state =3D 1,
-                               .dcfclk_mhz =3D 694.0,
-                               .fabricclk_mhz =3D 694.0,
-                               .dispclk_mhz =3D 642.0,
-                               .dppclk_mhz =3D 642.0,
-                               .phyclk_mhz =3D 600.0,
-                               .socclk_mhz =3D 694.0,
-                               .dscclk_mhz =3D 214.0,
-                               .dram_speed_mts =3D 11104.0,
-                       },
-                       {
-                               .state =3D 2,
-                               .dcfclk_mhz =3D 875.0,
-                               .fabricclk_mhz =3D 875.0,
-                               .dispclk_mhz =3D 734.0,
-                               .dppclk_mhz =3D 734.0,
-                               .phyclk_mhz =3D 810.0,
-                               .socclk_mhz =3D 875.0,
-                               .dscclk_mhz =3D 245.0,
-                               .dram_speed_mts =3D 14000.0,
-                       },
-                       {
-                               .state =3D 3,
-                               .dcfclk_mhz =3D 1000.0,
-                               .fabricclk_mhz =3D 1000.0,
-                               .dispclk_mhz =3D 1100.0,
-                               .dppclk_mhz =3D 1100.0,
-                               .phyclk_mhz =3D 810.0,
-                               .socclk_mhz =3D 1000.0,
-                               .dscclk_mhz =3D 367.0,
-                               .dram_speed_mts =3D 16000.0,
-                       },
-                       {
-                               .state =3D 4,
-                               .dcfclk_mhz =3D 1200.0,
-                               .fabricclk_mhz =3D 1200.0,
-                               .dispclk_mhz =3D 1284.0,
-                               .dppclk_mhz =3D 1284.0,
-                               .phyclk_mhz =3D 810.0,
-                               .socclk_mhz =3D 1200.0,
-                               .dscclk_mhz =3D 428.0,
-                               .dram_speed_mts =3D 16000.0,
-                       },
-                       /*Extra state, no dispclk ramping*/
-                       {
-                               .state =3D 5,
-                               .dcfclk_mhz =3D 1200.0,
-                               .fabricclk_mhz =3D 1200.0,
-                               .dispclk_mhz =3D 1284.0,
-                               .dppclk_mhz =3D 1284.0,
-                               .phyclk_mhz =3D 810.0,
-                               .socclk_mhz =3D 1200.0,
-                               .dscclk_mhz =3D 428.0,
-                               .dram_speed_mts =3D 16000.0,
-                       },
-               },
-       .num_states =3D 5,
-       .sr_exit_time_us =3D 8.6,
-       .sr_enter_plus_exit_time_us =3D 10.9,
-       .urgent_latency_us =3D 4.0,
-       .urgent_latency_pixel_data_only_us =3D 4.0,
-       .urgent_latency_pixel_mixed_with_vm_data_us =3D 4.0,
-       .urgent_latency_vm_data_only_us =3D 4.0,
-       .urgent_out_of_order_return_per_channel_pixel_only_bytes =3D 4096,
-       .urgent_out_of_order_return_per_channel_pixel_and_vm_bytes =3D 4096=
,
-       .urgent_out_of_order_return_per_channel_vm_only_bytes =3D 4096,
-       .pct_ideal_dram_sdp_bw_after_urgent_pixel_only =3D 40.0,
-       .pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm =3D 40.0,
-       .pct_ideal_dram_sdp_bw_after_urgent_vm_only =3D 40.0,
-       .max_avg_sdp_bw_use_normal_percent =3D 40.0,
-       .max_avg_dram_bw_use_normal_percent =3D 40.0,
-       .writeback_latency_us =3D 12.0,
-       .ideal_dram_bw_after_urgent_percent =3D 40.0,
-       .max_request_size_bytes =3D 256,
-       .dram_channel_width_bytes =3D 2,
-       .fabric_datapath_to_dcn_data_return_bytes =3D 64,
-       .dcn_downspread_percent =3D 0.5,
-       .downspread_percent =3D 0.38,
-       .dram_page_open_time_ns =3D 50.0,
-       .dram_rw_turnaround_time_ns =3D 17.5,
-       .dram_return_buffer_per_channel_bytes =3D 8192,
-       .round_trip_ping_latency_dcfclk_cycles =3D 131,
-       .urgent_out_of_order_return_per_channel_bytes =3D 256,
-       .channel_interleave_bytes =3D 256,
-       .num_banks =3D 8,
-       .num_chans =3D 16,
-       .vmm_page_size_bytes =3D 4096,
-       .dram_clock_change_latency_us =3D 404.0,
-       .dummy_pstate_latency_us =3D 5.0,
-       .writeback_dram_clock_change_latency_us =3D 23.0,
-       .return_bus_width_bytes =3D 64,
-       .dispclk_dppclk_vco_speed_mhz =3D 3850,
-       .xfc_bus_transport_time_us =3D 20,
-       .xfc_xbuf_latency_tolerance_us =3D 4,
-       .use_urgent_burst_bw =3D 0
-};
-
-static struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc =3D {
-       .clock_limits =3D {
-                       {
-                               .state =3D 0,
-                               .dcfclk_mhz =3D 560.0,
-                               .fabricclk_mhz =3D 560.0,
-                               .dispclk_mhz =3D 513.0,
-                               .dppclk_mhz =3D 513.0,
-                               .phyclk_mhz =3D 540.0,
-                               .socclk_mhz =3D 560.0,
-                               .dscclk_mhz =3D 171.0,
-                               .dram_speed_mts =3D 8960.0,
-                       },
-                       {
-                               .state =3D 1,
-                               .dcfclk_mhz =3D 694.0,
-                               .fabricclk_mhz =3D 694.0,
-                               .dispclk_mhz =3D 642.0,
-                               .dppclk_mhz =3D 642.0,
-                               .phyclk_mhz =3D 600.0,
-                               .socclk_mhz =3D 694.0,
-                               .dscclk_mhz =3D 214.0,
-                               .dram_speed_mts =3D 11104.0,
-                       },
-                       {
-                               .state =3D 2,
-                               .dcfclk_mhz =3D 875.0,
-                               .fabricclk_mhz =3D 875.0,
-                               .dispclk_mhz =3D 734.0,
-                               .dppclk_mhz =3D 734.0,
-                               .phyclk_mhz =3D 810.0,
-                               .socclk_mhz =3D 875.0,
-                               .dscclk_mhz =3D 245.0,
-                               .dram_speed_mts =3D 14000.0,
-                       },
-                       {
-                               .state =3D 3,
-                               .dcfclk_mhz =3D 1000.0,
-                               .fabricclk_mhz =3D 1000.0,
-                               .dispclk_mhz =3D 1100.0,
-                               .dppclk_mhz =3D 1100.0,
-                               .phyclk_mhz =3D 810.0,
-                               .socclk_mhz =3D 1000.0,
-                               .dscclk_mhz =3D 367.0,
-                               .dram_speed_mts =3D 16000.0,
-                       },
-                       {
-                               .state =3D 4,
-                               .dcfclk_mhz =3D 1200.0,
-                               .fabricclk_mhz =3D 1200.0,
-                               .dispclk_mhz =3D 1284.0,
-                               .dppclk_mhz =3D 1284.0,
-                               .phyclk_mhz =3D 810.0,
-                               .socclk_mhz =3D 1200.0,
-                               .dscclk_mhz =3D 428.0,
-                               .dram_speed_mts =3D 16000.0,
-                       },
-                       /*Extra state, no dispclk ramping*/
-                       {
-                               .state =3D 5,
-                               .dcfclk_mhz =3D 1200.0,
-                               .fabricclk_mhz =3D 1200.0,
-                               .dispclk_mhz =3D 1284.0,
-                               .dppclk_mhz =3D 1284.0,
-                               .phyclk_mhz =3D 810.0,
-                               .socclk_mhz =3D 1200.0,
-                               .dscclk_mhz =3D 428.0,
-                               .dram_speed_mts =3D 16000.0,
-                       },
-               },
-       .num_states =3D 5,
-       .sr_exit_time_us =3D 11.6,
-       .sr_enter_plus_exit_time_us =3D 13.9,
-       .urgent_latency_us =3D 4.0,
-       .urgent_latency_pixel_data_only_us =3D 4.0,
-       .urgent_latency_pixel_mixed_with_vm_data_us =3D 4.0,
-       .urgent_latency_vm_data_only_us =3D 4.0,
-       .urgent_out_of_order_return_per_channel_pixel_only_bytes =3D 4096,
-       .urgent_out_of_order_return_per_channel_pixel_and_vm_bytes =3D 4096=
,
-       .urgent_out_of_order_return_per_channel_vm_only_bytes =3D 4096,
-       .pct_ideal_dram_sdp_bw_after_urgent_pixel_only =3D 40.0,
-       .pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm =3D 40.0,
-       .pct_ideal_dram_sdp_bw_after_urgent_vm_only =3D 40.0,
-       .max_avg_sdp_bw_use_normal_percent =3D 40.0,
-       .max_avg_dram_bw_use_normal_percent =3D 40.0,
-       .writeback_latency_us =3D 12.0,
-       .ideal_dram_bw_after_urgent_percent =3D 40.0,
-       .max_request_size_bytes =3D 256,
-       .dram_channel_width_bytes =3D 2,
-       .fabric_datapath_to_dcn_data_return_bytes =3D 64,
-       .dcn_downspread_percent =3D 0.5,
-       .downspread_percent =3D 0.38,
-       .dram_page_open_time_ns =3D 50.0,
-       .dram_rw_turnaround_time_ns =3D 17.5,
-       .dram_return_buffer_per_channel_bytes =3D 8192,
-       .round_trip_ping_latency_dcfclk_cycles =3D 131,
-       .urgent_out_of_order_return_per_channel_bytes =3D 256,
-       .channel_interleave_bytes =3D 256,
-       .num_banks =3D 8,
-       .num_chans =3D 8,
-       .vmm_page_size_bytes =3D 4096,
-       .dram_clock_change_latency_us =3D 404.0,
-       .dummy_pstate_latency_us =3D 5.0,
-       .writeback_dram_clock_change_latency_us =3D 23.0,
-       .return_bus_width_bytes =3D 64,
-       .dispclk_dppclk_vco_speed_mhz =3D 3850,
-       .xfc_bus_transport_time_us =3D 20,
-       .xfc_xbuf_latency_tolerance_us =3D 4,
-       .use_urgent_burst_bw =3D 0
-};
-
-static struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc =3D { 0 };
-
 #ifndef mmDP0_DP_DPHY_INTERNAL_CTRL
         #define mmDP0_DP_DPHY_INTERNAL_CTRL             0x210f
         #define mmDP0_DP_DPHY_INTERNAL_CTRL_BASE_IDX    2
@@ -1810,69 +1448,6 @@ enum dc_status dcn20_remove_stream_from_ctx(struct d=
c *dc, struct dc_state *new_
         return result;
 }

-
-static void swizzle_to_dml_params(
-               enum swizzle_mode_values swizzle,
-               unsigned int *sw_mode)
-{
-       switch (swizzle) {
-       case DC_SW_LINEAR:
-               *sw_mode =3D dm_sw_linear;
-               break;
-       case DC_SW_4KB_S:
-               *sw_mode =3D dm_sw_4kb_s;
-               break;
-       case DC_SW_4KB_S_X:
-               *sw_mode =3D dm_sw_4kb_s_x;
-               break;
-       case DC_SW_4KB_D:
-               *sw_mode =3D dm_sw_4kb_d;
-               break;
-       case DC_SW_4KB_D_X:
-               *sw_mode =3D dm_sw_4kb_d_x;
-               break;
-       case DC_SW_64KB_S:
-               *sw_mode =3D dm_sw_64kb_s;
-               break;
-       case DC_SW_64KB_S_X:
-               *sw_mode =3D dm_sw_64kb_s_x;
-               break;
-       case DC_SW_64KB_S_T:
-               *sw_mode =3D dm_sw_64kb_s_t;
-               break;
-       case DC_SW_64KB_D:
-               *sw_mode =3D dm_sw_64kb_d;
-               break;
-       case DC_SW_64KB_D_X:
-               *sw_mode =3D dm_sw_64kb_d_x;
-               break;
-       case DC_SW_64KB_D_T:
-               *sw_mode =3D dm_sw_64kb_d_t;
-               break;
-       case DC_SW_64KB_R_X:
-               *sw_mode =3D dm_sw_64kb_r_x;
-               break;
-       case DC_SW_VAR_S:
-               *sw_mode =3D dm_sw_var_s;
-               break;
-       case DC_SW_VAR_S_X:
-               *sw_mode =3D dm_sw_var_s_x;
-               break;
-       case DC_SW_VAR_D:
-               *sw_mode =3D dm_sw_var_d;
-               break;
-       case DC_SW_VAR_D_X:
-               *sw_mode =3D dm_sw_var_d_x;
-               break;
-       case DC_SW_VAR_R_X:
-               *sw_mode =3D dm_sw_var_r_x;
-               break;
-       default:
-               ASSERT(0); /* Not supported */
-               break;
-       }
-}
-
 bool dcn20_split_stream_for_odm(
                 const struct dc *dc,
                 struct resource_context *res_ctx,
@@ -1988,394 +1563,6 @@ void dcn20_split_stream_for_mpc(
         ASSERT(primary_pipe->plane_state);
 }

-int dcn20_populate_dml_pipes_from_context(
-               struct dc *dc,
-               struct dc_state *context,
-               display_e2e_pipe_params_st *pipes,
-               bool fast_validate)
-{
-       int pipe_cnt, i;
-       bool synchronized_vblank =3D true;
-       struct resource_context *res_ctx =3D &context->res_ctx;
-
-       for (i =3D 0, pipe_cnt =3D -1; i < dc->res_pool->pipe_count; i++) {
-               if (!res_ctx->pipe_ctx[i].stream)
-                       continue;
-
-               if (pipe_cnt < 0) {
-                       pipe_cnt =3D i;
-                       continue;
-               }
-
-               if (res_ctx->pipe_ctx[pipe_cnt].stream =3D=3D res_ctx->pipe=
_ctx[i].stream)
-                       continue;
-
-               if (dc->debug.disable_timing_sync ||
-                       (!resource_are_streams_timing_synchronizable(
-                               res_ctx->pipe_ctx[pipe_cnt].stream,
-                               res_ctx->pipe_ctx[i].stream) &&
-                       !resource_are_vblanks_synchronizable(
-                               res_ctx->pipe_ctx[pipe_cnt].stream,
-                               res_ctx->pipe_ctx[i].stream))) {
-                       synchronized_vblank =3D false;
-                       break;
-               }
-       }
-
-       for (i =3D 0, pipe_cnt =3D 0; i < dc->res_pool->pipe_count; i++) {
-               struct dc_crtc_timing *timing =3D &res_ctx->pipe_ctx[i].str=
eam->timing;
-               unsigned int v_total;
-               unsigned int front_porch;
-               int output_bpc;
-               struct audio_check aud_check =3D {0};
-
-               if (!res_ctx->pipe_ctx[i].stream)
-                       continue;
-
-               v_total =3D timing->v_total;
-               front_porch =3D timing->v_front_porch;
-
-               /* todo:
-               pipes[pipe_cnt].pipe.src.dynamic_metadata_enable =3D 0;
-               pipes[pipe_cnt].pipe.src.dcc =3D 0;
-               pipes[pipe_cnt].pipe.src.vm =3D 0;*/
-
-               pipes[pipe_cnt].clks_cfg.refclk_mhz =3D dc->res_pool->ref_c=
locks.dchub_ref_clock_inKhz / 1000.0;
-
-               pipes[pipe_cnt].dout.dsc_enable =3D res_ctx->pipe_ctx[i].st=
ream->timing.flags.DSC;
-               /* todo: rotation?*/
-               pipes[pipe_cnt].dout.dsc_slices =3D res_ctx->pipe_ctx[i].st=
ream->timing.dsc_cfg.num_slices_h;
-               if (res_ctx->pipe_ctx[i].stream->use_dynamic_meta) {
-                       pipes[pipe_cnt].pipe.src.dynamic_metadata_enable =
=3D true;
-                       /* 1/2 vblank */
-                       pipes[pipe_cnt].pipe.src.dynamic_metadata_lines_bef=
ore_active =3D
-                               (v_total - timing->v_addressable
-                                       - timing->v_border_top - timing->v_=
border_bottom) / 2;
-                       /* 36 bytes dp, 32 hdmi */
-                       pipes[pipe_cnt].pipe.src.dynamic_metadata_xmit_byte=
s =3D
-                               dc_is_dp_signal(res_ctx->pipe_ctx[i].stream=
->signal) ? 36 : 32;
-               }
-               pipes[pipe_cnt].pipe.src.dcc =3D false;
-               pipes[pipe_cnt].pipe.src.dcc_rate =3D 1;
-               pipes[pipe_cnt].pipe.dest.synchronized_vblank_all_planes =
=3D synchronized_vblank;
-               pipes[pipe_cnt].pipe.dest.hblank_start =3D timing->h_total =
- timing->h_front_porch;
-               pipes[pipe_cnt].pipe.dest.hblank_end =3D pipes[pipe_cnt].pi=
pe.dest.hblank_start
-                               - timing->h_addressable
-                               - timing->h_border_left
-                               - timing->h_border_right;
-               pipes[pipe_cnt].pipe.dest.vblank_start =3D v_total - front_=
porch;
-               pipes[pipe_cnt].pipe.dest.vblank_end =3D pipes[pipe_cnt].pi=
pe.dest.vblank_start
-                               - timing->v_addressable
-                               - timing->v_border_top
-                               - timing->v_border_bottom;
-               pipes[pipe_cnt].pipe.dest.htotal =3D timing->h_total;
-               pipes[pipe_cnt].pipe.dest.vtotal =3D v_total;
-               pipes[pipe_cnt].pipe.dest.hactive =3D
-                       timing->h_addressable + timing->h_border_left + tim=
ing->h_border_right;
-               pipes[pipe_cnt].pipe.dest.vactive =3D
-                       timing->v_addressable + timing->v_border_top + timi=
ng->v_border_bottom;
-               pipes[pipe_cnt].pipe.dest.interlaced =3D timing->flags.INTE=
RLACE;
-               pipes[pipe_cnt].pipe.dest.pixel_rate_mhz =3D timing->pix_cl=
k_100hz/10000.0;
-               if (timing->timing_3d_format =3D=3D TIMING_3D_FORMAT_HW_FRA=
ME_PACKING)
-                       pipes[pipe_cnt].pipe.dest.pixel_rate_mhz *=3D 2;
-               pipes[pipe_cnt].pipe.dest.otg_inst =3D res_ctx->pipe_ctx[i]=
.stream_res.tg->inst;
-               pipes[pipe_cnt].dout.dp_lanes =3D 4;
-               pipes[pipe_cnt].dout.is_virtual =3D 0;
-               pipes[pipe_cnt].pipe.dest.vtotal_min =3D res_ctx->pipe_ctx[=
i].stream->adjust.v_total_min;
-               pipes[pipe_cnt].pipe.dest.vtotal_max =3D res_ctx->pipe_ctx[=
i].stream->adjust.v_total_max;
-               switch (get_num_odm_splits(&res_ctx->pipe_ctx[i])) {
-               case 1:
-                       pipes[pipe_cnt].pipe.dest.odm_combine =3D dm_odm_co=
mbine_mode_2to1;
-                       break;
-               case 3:
-                       pipes[pipe_cnt].pipe.dest.odm_combine =3D dm_odm_co=
mbine_mode_4to1;
-                       break;
-               default:
-                       pipes[pipe_cnt].pipe.dest.odm_combine =3D dm_odm_co=
mbine_mode_disabled;
-               }
-               pipes[pipe_cnt].pipe.src.hsplit_grp =3D res_ctx->pipe_ctx[i=
].pipe_idx;
-               if (res_ctx->pipe_ctx[i].top_pipe && res_ctx->pipe_ctx[i].t=
op_pipe->plane_state
-                               =3D=3D res_ctx->pipe_ctx[i].plane_state) {
-                       struct pipe_ctx *first_pipe =3D res_ctx->pipe_ctx[i=
].top_pipe;
-                       int split_idx =3D 0;
-
-                       while (first_pipe->top_pipe && first_pipe->top_pipe=
->plane_state
-                                       =3D=3D res_ctx->pipe_ctx[i].plane_s=
tate) {
-                               first_pipe =3D first_pipe->top_pipe;
-                               split_idx++;
-                       }
-                       /* Treat 4to1 mpc combine as an mpo of 2 2-to-1 com=
bines */
-                       if (split_idx =3D=3D 0)
-                               pipes[pipe_cnt].pipe.src.hsplit_grp =3D fir=
st_pipe->pipe_idx;
-                       else if (split_idx =3D=3D 1)
-                               pipes[pipe_cnt].pipe.src.hsplit_grp =3D res=
_ctx->pipe_ctx[i].pipe_idx;
-                       else if (split_idx =3D=3D 2)
-                               pipes[pipe_cnt].pipe.src.hsplit_grp =3D res=
_ctx->pipe_ctx[i].top_pipe->pipe_idx;
-               } else if (res_ctx->pipe_ctx[i].prev_odm_pipe) {
-                       struct pipe_ctx *first_pipe =3D res_ctx->pipe_ctx[i=
].prev_odm_pipe;
-
-                       while (first_pipe->prev_odm_pipe)
-                               first_pipe =3D first_pipe->prev_odm_pipe;
-                       pipes[pipe_cnt].pipe.src.hsplit_grp =3D first_pipe-=
>pipe_idx;
-               }
-
-               switch (res_ctx->pipe_ctx[i].stream->signal) {
-               case SIGNAL_TYPE_DISPLAY_PORT_MST:
-               case SIGNAL_TYPE_DISPLAY_PORT:
-                       pipes[pipe_cnt].dout.output_type =3D dm_dp;
-                       break;
-               case SIGNAL_TYPE_EDP:
-                       pipes[pipe_cnt].dout.output_type =3D dm_edp;
-                       break;
-               case SIGNAL_TYPE_HDMI_TYPE_A:
-               case SIGNAL_TYPE_DVI_SINGLE_LINK:
-               case SIGNAL_TYPE_DVI_DUAL_LINK:
-                       pipes[pipe_cnt].dout.output_type =3D dm_hdmi;
-                       break;
-               default:
-                       /* In case there is no signal, set dp with 4 lanes =
to allow max config */
-                       pipes[pipe_cnt].dout.is_virtual =3D 1;
-                       pipes[pipe_cnt].dout.output_type =3D dm_dp;
-                       pipes[pipe_cnt].dout.dp_lanes =3D 4;
-               }
-
-               switch (res_ctx->pipe_ctx[i].stream->timing.display_color_d=
epth) {
-               case COLOR_DEPTH_666:
-                       output_bpc =3D 6;
-                       break;
-               case COLOR_DEPTH_888:
-                       output_bpc =3D 8;
-                       break;
-               case COLOR_DEPTH_101010:
-                       output_bpc =3D 10;
-                       break;
-               case COLOR_DEPTH_121212:
-                       output_bpc =3D 12;
-                       break;
-               case COLOR_DEPTH_141414:
-                       output_bpc =3D 14;
-                       break;
-               case COLOR_DEPTH_161616:
-                       output_bpc =3D 16;
-                       break;
-               case COLOR_DEPTH_999:
-                       output_bpc =3D 9;
-                       break;
-               case COLOR_DEPTH_111111:
-                       output_bpc =3D 11;
-                       break;
-               default:
-                       output_bpc =3D 8;
-                       break;
-               }
-
-               switch (res_ctx->pipe_ctx[i].stream->timing.pixel_encoding)=
 {
-               case PIXEL_ENCODING_RGB:
-               case PIXEL_ENCODING_YCBCR444:
-                       pipes[pipe_cnt].dout.output_format =3D dm_444;
-                       pipes[pipe_cnt].dout.output_bpp =3D output_bpc * 3;
-                       break;
-               case PIXEL_ENCODING_YCBCR420:
-                       pipes[pipe_cnt].dout.output_format =3D dm_420;
-                       pipes[pipe_cnt].dout.output_bpp =3D (output_bpc * 3=
.0) / 2;
-                       break;
-               case PIXEL_ENCODING_YCBCR422:
-                       if (res_ctx->pipe_ctx[i].stream->timing.flags.DSC &=
&
-                           !res_ctx->pipe_ctx[i].stream->timing.dsc_cfg.yc=
bcr422_simple)
-                               pipes[pipe_cnt].dout.output_format =3D dm_n=
422;
-                       else
-                               pipes[pipe_cnt].dout.output_format =3D dm_s=
422;
-                       pipes[pipe_cnt].dout.output_bpp =3D output_bpc * 2;
-                       break;
-               default:
-                       pipes[pipe_cnt].dout.output_format =3D dm_444;
-                       pipes[pipe_cnt].dout.output_bpp =3D output_bpc * 3;
-               }
-
-               if (res_ctx->pipe_ctx[i].stream->timing.flags.DSC)
-                       pipes[pipe_cnt].dout.output_bpp =3D res_ctx->pipe_c=
tx[i].stream->timing.dsc_cfg.bits_per_pixel / 16.0;
-
-               /* todo: default max for now, until there is logic reflecti=
ng this in dc*/
-               pipes[pipe_cnt].dout.dsc_input_bpc =3D 12;
-               /*fill up the audio sample rate (unit in kHz)*/
-               get_audio_check(&res_ctx->pipe_ctx[i].stream->audio_info, &=
aud_check);
-               pipes[pipe_cnt].dout.max_audio_sample_rate =3D aud_check.ma=
x_audiosample_rate / 1000;
-               /*
-                * For graphic plane, cursor number is 1, nv12 is 0
-                * bw calculations due to cursor on/off
-                */
-               if (res_ctx->pipe_ctx[i].plane_state &&
-                               res_ctx->pipe_ctx[i].plane_state->address.t=
ype =3D=3D PLN_ADDR_TYPE_VIDEO_PROGRESSIVE)
-                       pipes[pipe_cnt].pipe.src.num_cursors =3D 0;
-               else
-                       pipes[pipe_cnt].pipe.src.num_cursors =3D dc->dml.ip=
.number_of_cursors;
-
-               pipes[pipe_cnt].pipe.src.cur0_src_width =3D 256;
-               pipes[pipe_cnt].pipe.src.cur0_bpp =3D dm_cur_32bit;
-
-               if (!res_ctx->pipe_ctx[i].plane_state) {
-                       pipes[pipe_cnt].pipe.src.is_hsplit =3D pipes[pipe_c=
nt].pipe.dest.odm_combine !=3D dm_odm_combine_mode_disabled;
-                       pipes[pipe_cnt].pipe.src.source_scan =3D dm_horz;
-                       pipes[pipe_cnt].pipe.src.sw_mode =3D dm_sw_4kb_s;
-                       pipes[pipe_cnt].pipe.src.macro_tile_size =3D dm_64k=
_tile;
-                       pipes[pipe_cnt].pipe.src.viewport_width =3D timing-=
>h_addressable;
-                       if (pipes[pipe_cnt].pipe.src.viewport_width > 1920)
-                               pipes[pipe_cnt].pipe.src.viewport_width =3D=
 1920;
-                       pipes[pipe_cnt].pipe.src.viewport_height =3D timing=
->v_addressable;
-                       if (pipes[pipe_cnt].pipe.src.viewport_height > 1080=
)
-                               pipes[pipe_cnt].pipe.src.viewport_height =
=3D 1080;
-                       pipes[pipe_cnt].pipe.src.surface_height_y =3D pipes=
[pipe_cnt].pipe.src.viewport_height;
-                       pipes[pipe_cnt].pipe.src.surface_width_y =3D pipes[=
pipe_cnt].pipe.src.viewport_width;
-                       pipes[pipe_cnt].pipe.src.surface_height_c =3D pipes=
[pipe_cnt].pipe.src.viewport_height;
-                       pipes[pipe_cnt].pipe.src.surface_width_c =3D pipes[=
pipe_cnt].pipe.src.viewport_width;
-                       pipes[pipe_cnt].pipe.src.data_pitch =3D ((pipes[pip=
e_cnt].pipe.src.viewport_width + 255) / 256) * 256;
-                       pipes[pipe_cnt].pipe.src.source_format =3D dm_444_3=
2;
-                       pipes[pipe_cnt].pipe.dest.recout_width =3D pipes[pi=
pe_cnt].pipe.src.viewport_width; /*vp_width/hratio*/
-                       pipes[pipe_cnt].pipe.dest.recout_height =3D pipes[p=
ipe_cnt].pipe.src.viewport_height; /*vp_height/vratio*/
-                       pipes[pipe_cnt].pipe.dest.full_recout_width =3D pip=
es[pipe_cnt].pipe.dest.recout_width;  /*when is_hsplit !=3D 1*/
-                       pipes[pipe_cnt].pipe.dest.full_recout_height =3D pi=
pes[pipe_cnt].pipe.dest.recout_height; /*when is_hsplit !=3D 1*/
-                       pipes[pipe_cnt].pipe.scale_ratio_depth.lb_depth =3D=
 dm_lb_16;
-                       pipes[pipe_cnt].pipe.scale_ratio_depth.hscl_ratio =
=3D 1.0;
-                       pipes[pipe_cnt].pipe.scale_ratio_depth.vscl_ratio =
=3D 1.0;
-                       pipes[pipe_cnt].pipe.scale_ratio_depth.scl_enable =
=3D 0; /*Lb only or Full scl*/
-                       pipes[pipe_cnt].pipe.scale_taps.htaps =3D 1;
-                       pipes[pipe_cnt].pipe.scale_taps.vtaps =3D 1;
-                       pipes[pipe_cnt].pipe.dest.vtotal_min =3D v_total;
-                       pipes[pipe_cnt].pipe.dest.vtotal_max =3D v_total;
-
-                       if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=3D dm=
_odm_combine_mode_2to1) {
-                               pipes[pipe_cnt].pipe.src.viewport_width /=
=3D 2;
-                               pipes[pipe_cnt].pipe.dest.recout_width /=3D=
 2;
-                       } else if (pipes[pipe_cnt].pipe.dest.odm_combine =
=3D=3D dm_odm_combine_mode_4to1) {
-                               pipes[pipe_cnt].pipe.src.viewport_width /=
=3D 4;
-                               pipes[pipe_cnt].pipe.dest.recout_width /=3D=
 4;
-                       }
-               } else {
-                       struct dc_plane_state *pln =3D res_ctx->pipe_ctx[i]=
.plane_state;
-                       struct scaler_data *scl =3D &res_ctx->pipe_ctx[i].p=
lane_res.scl_data;
-
-                       pipes[pipe_cnt].pipe.src.immediate_flip =3D pln->fl=
ip_immediate;
-                       pipes[pipe_cnt].pipe.src.is_hsplit =3D (res_ctx->pi=
pe_ctx[i].bottom_pipe && res_ctx->pipe_ctx[i].bottom_pipe->plane_state =3D=
=3D pln)
-                                       || (res_ctx->pipe_ctx[i].top_pipe &=
& res_ctx->pipe_ctx[i].top_pipe->plane_state =3D=3D pln)
-                                       || pipes[pipe_cnt].pipe.dest.odm_co=
mbine !=3D dm_odm_combine_mode_disabled;
-
-                       /* stereo is not split */
-                       if (pln->stereo_format =3D=3D PLANE_STEREO_FORMAT_S=
IDE_BY_SIDE ||
-                           pln->stereo_format =3D=3D PLANE_STEREO_FORMAT_T=
OP_AND_BOTTOM) {
-                               pipes[pipe_cnt].pipe.src.is_hsplit =3D fals=
e;
-                               pipes[pipe_cnt].pipe.src.hsplit_grp =3D res=
_ctx->pipe_ctx[i].pipe_idx;
-                       }
-
-                       pipes[pipe_cnt].pipe.src.source_scan =3D pln->rotat=
ion =3D=3D ROTATION_ANGLE_90
-                                       || pln->rotation =3D=3D ROTATION_AN=
GLE_270 ? dm_vert : dm_horz;
-                       pipes[pipe_cnt].pipe.src.viewport_y_y =3D scl->view=
port.y;
-                       pipes[pipe_cnt].pipe.src.viewport_y_c =3D scl->view=
port_c.y;
-                       pipes[pipe_cnt].pipe.src.viewport_width =3D scl->vi=
ewport.width;
-                       pipes[pipe_cnt].pipe.src.viewport_width_c =3D scl->=
viewport_c.width;
-                       pipes[pipe_cnt].pipe.src.viewport_height =3D scl->v=
iewport.height;
-                       pipes[pipe_cnt].pipe.src.viewport_height_c =3D scl-=
>viewport_c.height;
-                       pipes[pipe_cnt].pipe.src.viewport_width_max =3D pln=
->src_rect.width;
-                       pipes[pipe_cnt].pipe.src.viewport_height_max =3D pl=
n->src_rect.height;
-                       pipes[pipe_cnt].pipe.src.surface_width_y =3D pln->p=
lane_size.surface_size.width;
-                       pipes[pipe_cnt].pipe.src.surface_height_y =3D pln->=
plane_size.surface_size.height;
-                       pipes[pipe_cnt].pipe.src.surface_width_c =3D pln->p=
lane_size.chroma_size.width;
-                       pipes[pipe_cnt].pipe.src.surface_height_c =3D pln->=
plane_size.chroma_size.height;
-                       if (pln->format =3D=3D SURFACE_PIXEL_FORMAT_GRPH_RG=
BE_ALPHA
-                                       || pln->format >=3D SURFACE_PIXEL_F=
ORMAT_VIDEO_BEGIN) {
-                               pipes[pipe_cnt].pipe.src.data_pitch =3D pln=
->plane_size.surface_pitch;
-                               pipes[pipe_cnt].pipe.src.data_pitch_c =3D p=
ln->plane_size.chroma_pitch;
-                               pipes[pipe_cnt].pipe.src.meta_pitch =3D pln=
->dcc.meta_pitch;
-                               pipes[pipe_cnt].pipe.src.meta_pitch_c =3D p=
ln->dcc.meta_pitch_c;
-                       } else {
-                               pipes[pipe_cnt].pipe.src.data_pitch =3D pln=
->plane_size.surface_pitch;
-                               pipes[pipe_cnt].pipe.src.meta_pitch =3D pln=
->dcc.meta_pitch;
-                       }
-                       pipes[pipe_cnt].pipe.src.dcc =3D pln->dcc.enable;
-                       pipes[pipe_cnt].pipe.dest.recout_width =3D scl->rec=
out.width;
-                       pipes[pipe_cnt].pipe.dest.recout_height =3D scl->re=
cout.height;
-                       pipes[pipe_cnt].pipe.dest.full_recout_height =3D sc=
l->recout.height;
-                       pipes[pipe_cnt].pipe.dest.full_recout_width =3D scl=
->recout.width;
-                       if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=3D dm=
_odm_combine_mode_2to1)
-                               pipes[pipe_cnt].pipe.dest.full_recout_width=
 *=3D 2;
-                       else if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=
=3D dm_odm_combine_mode_4to1)
-                               pipes[pipe_cnt].pipe.dest.full_recout_width=
 *=3D 4;
-                       else {
-                               struct pipe_ctx *split_pipe =3D res_ctx->pi=
pe_ctx[i].bottom_pipe;
-
-                               while (split_pipe && split_pipe->plane_stat=
e =3D=3D pln) {
-                                       pipes[pipe_cnt].pipe.dest.full_reco=
ut_width +=3D split_pipe->plane_res.scl_data.recout.width;
-                                       split_pipe =3D split_pipe->bottom_p=
ipe;
-                               }
-                               split_pipe =3D res_ctx->pipe_ctx[i].top_pip=
e;
-                               while (split_pipe && split_pipe->plane_stat=
e =3D=3D pln) {
-                                       pipes[pipe_cnt].pipe.dest.full_reco=
ut_width +=3D split_pipe->plane_res.scl_data.recout.width;
-                                       split_pipe =3D split_pipe->top_pipe=
;
-                               }
-                       }
-
-                       pipes[pipe_cnt].pipe.scale_ratio_depth.lb_depth =3D=
 dm_lb_16;
-                       pipes[pipe_cnt].pipe.scale_ratio_depth.hscl_ratio =
=3D (double) scl->ratios.horz.value / (1ULL<<32);
-                       pipes[pipe_cnt].pipe.scale_ratio_depth.hscl_ratio_c=
 =3D (double) scl->ratios.horz_c.value / (1ULL<<32);
-                       pipes[pipe_cnt].pipe.scale_ratio_depth.vscl_ratio =
=3D (double) scl->ratios.vert.value / (1ULL<<32);
-                       pipes[pipe_cnt].pipe.scale_ratio_depth.vscl_ratio_c=
 =3D (double) scl->ratios.vert_c.value / (1ULL<<32);
-                       pipes[pipe_cnt].pipe.scale_ratio_depth.scl_enable =
=3D
-                                       scl->ratios.vert.value !=3D dc_fixp=
t_one.value
-                                       || scl->ratios.horz.value !=3D dc_f=
ixpt_one.value
-                                       || scl->ratios.vert_c.value !=3D dc=
_fixpt_one.value
-                                       || scl->ratios.horz_c.value !=3D dc=
_fixpt_one.value /*Lb only or Full scl*/
-                                       || dc->debug.always_scale; /*suppor=
t always scale*/
-                       pipes[pipe_cnt].pipe.scale_taps.htaps =3D scl->taps=
.h_taps;
-                       pipes[pipe_cnt].pipe.scale_taps.htaps_c =3D scl->ta=
ps.h_taps_c;
-                       pipes[pipe_cnt].pipe.scale_taps.vtaps =3D scl->taps=
.v_taps;
-                       pipes[pipe_cnt].pipe.scale_taps.vtaps_c =3D scl->ta=
ps.v_taps_c;
-
-                       pipes[pipe_cnt].pipe.src.macro_tile_size =3D
-                                       swizzle_mode_to_macro_tile_size(pln=
->tiling_info.gfx9.swizzle);
-                       swizzle_to_dml_params(pln->tiling_info.gfx9.swizzle=
,
-                                       &pipes[pipe_cnt].pipe.src.sw_mode);
-
-                       switch (pln->format) {
-                       case SURFACE_PIXEL_FORMAT_VIDEO_420_YCbCr:
-                       case SURFACE_PIXEL_FORMAT_VIDEO_420_YCrCb:
-                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_420_8;
-                               break;
-                       case SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCbCr:
-                       case SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCrCb:
-                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_420_10;
-                               break;
-                       case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
-                       case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
-                       case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
-                       case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
-                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_64;
-                               break;
-                       case SURFACE_PIXEL_FORMAT_GRPH_ARGB1555:
-                       case SURFACE_PIXEL_FORMAT_GRPH_RGB565:
-                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_16;
-                               break;
-                       case SURFACE_PIXEL_FORMAT_GRPH_PALETA_256_COLORS:
-                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_8;
-                               break;
-                       case SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA:
-                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_rgbe_alpha;
-                               break;
-                       default:
-                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_32;
-                               break;
-                       }
-               }
-
-               pipe_cnt++;
-       }
-
-       /* populate writeback information */
-       DC_FP_START();
-       dc->res_pool->funcs->populate_dml_writeback_from_context(dc, res_ct=
x, pipes);
-       DC_FP_END();
-
-       return pipe_cnt;
-}
-
 unsigned int dcn20_calc_max_scaled_time(
                 unsigned int time_per_pixel,
                 enum mmhubbub_wbif_mode mode,
@@ -2413,7 +1600,7 @@ void dcn20_set_mcif_arb_params(
 {
         enum mmhubbub_wbif_mode wbif_mode;
         struct mcif_arb_params *wb_arb_params;
-       int i, j, k, dwb_pipe;
+       int i, j, dwb_pipe;

         /* Writeback MCIF_WB arbitration parameters */
         dwb_pipe =3D 0;
@@ -2437,11 +1624,10 @@ void dcn20_set_mcif_arb_params(
                         } else
                                 wbif_mode =3D PACKED_444;

-                       for (k =3D 0; k < sizeof(wb_arb_params->cli_waterma=
rk)/sizeof(wb_arb_params->cli_watermark[0]); k++) {
-                               wb_arb_params->cli_watermark[k] =3D get_wm_=
writeback_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-                               wb_arb_params->pstate_watermark[k] =3D get_=
wm_writeback_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 100=
0;
-                       }
-                       wb_arb_params->time_per_pixel =3D 16.0 * 1000 / (co=
ntext->res_ctx.pipe_ctx[i].stream->phy_pix_clk / 1000); /* 4 bit fraction, =
ms */
+                       DC_FP_START();
+                       dcn20_fpu_set_wb_arb_params(wb_arb_params, context,=
 pipes, pipe_cnt, i);
+                       DC_FP_END();
+
                         wb_arb_params->slice_lines =3D 32;
                         wb_arb_params->arbitration_slice =3D 2;
                         wb_arb_params->max_scaled_time =3D dcn20_calc_max_=
scaled_time(wb_arb_params->time_per_pixel,
@@ -2808,8 +1994,11 @@ int dcn20_validate_apply_pipe_split_flags(
                 }

                 /* Adjust dppclk when split is forced, do not bother with =
dispclk */
-               if (split[i] !=3D 0 && v->NoOfDPP[vlevel][max_mpc_comb][pip=
e_idx] =3D=3D 1)
-                       v->RequiredDPPCLK[vlevel][max_mpc_comb][pipe_idx] /=
=3D 2;
+               if (split[i] !=3D 0 && v->NoOfDPP[vlevel][max_mpc_comb][pip=
e_idx] =3D=3D 1) {
+                       DC_FP_START();
+                       dcn20_fpu_adjust_dppclk(v, vlevel, max_mpc_comb, pi=
pe_idx, false);
+                       DC_FP_END();
+               }
                 pipe_idx++;
         }

@@ -2835,7 +2024,9 @@ bool dcn20_fast_validate_bw(

         dcn20_merge_pipes_for_validate(dc, context);

+       DC_FP_START();
         pipe_cnt =3D dc->res_pool->funcs->populate_dml_pipes(dc, context, =
pipes, fast_validate);
+       DC_FP_END();

         *pipe_cnt_out =3D pipe_cnt;

@@ -2892,7 +2083,9 @@ bool dcn20_fast_validate_bw(
                                 hsplit_pipe =3D dcn20_find_secondary_pipe(=
dc, &context->res_ctx, dc->res_pool, pipe);
                                 ASSERT(hsplit_pipe);
                                 if (!hsplit_pipe) {
-                                       context->bw_ctx.dml.vba.RequiredDPP=
CLK[vlevel][context->bw_ctx.dml.vba.maxMpcComb][pipe_idx] *=3D 2;
+                                       DC_FP_START();
+                                       dcn20_fpu_adjust_dppclk(&context->b=
w_ctx.dml.vba, vlevel, context->bw_ctx.dml.vba.maxMpcComb, pipe_idx, true);
+                                       DC_FP_END();
                                         continue;
                                 }
                                 if (context->bw_ctx.dml.vba.ODMCombineEnab=
led[pipe_idx]) {
@@ -2934,369 +2127,6 @@ bool dcn20_fast_validate_bw(
         return out;
 }

-static void dcn20_calculate_wm(
-               struct dc *dc, struct dc_state *context,
-               display_e2e_pipe_params_st *pipes,
-               int *out_pipe_cnt,
-               int *pipe_split_from,
-               int vlevel,
-               bool fast_validate)
-{
-       int pipe_cnt, i, pipe_idx;
-
-       for (i =3D 0, pipe_idx =3D 0, pipe_cnt =3D 0; i < dc->res_pool->pip=
e_count; i++) {
-               if (!context->res_ctx.pipe_ctx[i].stream)
-                       continue;
-
-               pipes[pipe_cnt].clks_cfg.refclk_mhz =3D dc->res_pool->ref_c=
locks.dchub_ref_clock_inKhz / 1000.0;
-               pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D context->bw_ctx.dm=
l.vba.RequiredDISPCLK[vlevel][context->bw_ctx.dml.vba.maxMpcComb];
-
-               if (pipe_split_from[i] < 0) {
-                       pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D
-                                       context->bw_ctx.dml.vba.RequiredDPP=
CLK[vlevel][context->bw_ctx.dml.vba.maxMpcComb][pipe_idx];
-                       if (context->bw_ctx.dml.vba.BlendingAndTiming[pipe_=
idx] =3D=3D pipe_idx)
-                               pipes[pipe_cnt].pipe.dest.odm_combine =3D
-                                               context->bw_ctx.dml.vba.ODM=
CombineEnabled[pipe_idx];
-                       else
-                               pipes[pipe_cnt].pipe.dest.odm_combine =3D 0=
;
-                       pipe_idx++;
-               } else {
-                       pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D
-                                       context->bw_ctx.dml.vba.RequiredDPP=
CLK[vlevel][context->bw_ctx.dml.vba.maxMpcComb][pipe_split_from[i]];
-                       if (context->bw_ctx.dml.vba.BlendingAndTiming[pipe_=
split_from[i]] =3D=3D pipe_split_from[i])
-                               pipes[pipe_cnt].pipe.dest.odm_combine =3D
-                                               context->bw_ctx.dml.vba.ODM=
CombineEnabled[pipe_split_from[i]];
-                       else
-                               pipes[pipe_cnt].pipe.dest.odm_combine =3D 0=
;
-               }
-
-               if (dc->config.forced_clocks) {
-                       pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D context->b=
w_ctx.dml.soc.clock_limits[0].dispclk_mhz;
-                       pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D context->bw=
_ctx.dml.soc.clock_limits[0].dppclk_mhz;
-               }
-               if (dc->debug.min_disp_clk_khz > pipes[pipe_cnt].clks_cfg.d=
ispclk_mhz * 1000)
-                       pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D dc->debug.=
min_disp_clk_khz / 1000.0;
-               if (dc->debug.min_dpp_clk_khz > pipes[pipe_cnt].clks_cfg.dp=
pclk_mhz * 1000)
-                       pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D dc->debug.m=
in_dpp_clk_khz / 1000.0;
-
-               pipe_cnt++;
-       }
-
-       if (pipe_cnt !=3D pipe_idx) {
-               if (dc->res_pool->funcs->populate_dml_pipes)
-                       pipe_cnt =3D dc->res_pool->funcs->populate_dml_pipe=
s(dc,
-                               context, pipes, fast_validate);
-               else
-                       pipe_cnt =3D dcn20_populate_dml_pipes_from_context(=
dc,
-                               context, pipes, fast_validate);
-       }
-
-       *out_pipe_cnt =3D pipe_cnt;
-
-       pipes[0].clks_cfg.voltage =3D vlevel;
-       pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limi=
ts[vlevel].dcfclk_mhz;
-       pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limi=
ts[vlevel].socclk_mhz;
-
-       /* only pipe 0 is read for voltage and dcf/soc clocks */
-       if (vlevel < 1) {
-               pipes[0].clks_cfg.voltage =3D 1;
-               pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[1].dcfclk_mhz;
-               pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[1].socclk_mhz;
-       }
-       context->bw_ctx.bw.dcn.watermarks.b.urgent_ns =3D get_wm_urgent(&co=
ntext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_enter_plus=
_exit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cn=
t) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_exit_ns =
=3D get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.b.pte_meta_urgent_ns =3D get_wm_m=
emory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_nom =3D get_fractio=
n_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_flip =3D get_fracti=
on_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 10=
00;
-       context->bw_ctx.bw.dcn.watermarks.b.urgent_latency_ns =3D get_urgen=
t_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-
-       if (vlevel < 2) {
-               pipes[0].clks_cfg.voltage =3D 2;
-               pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[2].dcfclk_mhz;
-               pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[2].socclk_mhz;
-       }
-       context->bw_ctx.bw.dcn.watermarks.c.urgent_ns =3D get_wm_urgent(&co=
ntext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_enter_plus=
_exit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cn=
t) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_exit_ns =
=3D get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.c.pte_meta_urgent_ns =3D get_wm_m=
emory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_nom =3D get_fractio=
n_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_flip =3D get_fracti=
on_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 10=
00;
-
-       if (vlevel < 3) {
-               pipes[0].clks_cfg.voltage =3D 3;
-               pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[2].dcfclk_mhz;
-               pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[2].socclk_mhz;
-       }
-       context->bw_ctx.bw.dcn.watermarks.d.urgent_ns =3D get_wm_urgent(&co=
ntext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_enter_plus=
_exit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cn=
t) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_exit_ns =
=3D get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.d.pte_meta_urgent_ns =3D get_wm_m=
emory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_nom =3D get_fractio=
n_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_flip =3D get_fracti=
on_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 10=
00;
-
-       pipes[0].clks_cfg.voltage =3D vlevel;
-       pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limi=
ts[vlevel].dcfclk_mhz;
-       pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limi=
ts[vlevel].socclk_mhz;
-       context->bw_ctx.bw.dcn.watermarks.a.urgent_ns =3D get_wm_urgent(&co=
ntext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_enter_plus=
_exit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cn=
t) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_exit_ns =
=3D get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.a.pte_meta_urgent_ns =3D get_wm_m=
emory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_nom =3D get_fractio=
n_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-       context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_flip =3D get_fracti=
on_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 10=
00;
-}
-
-static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
-{
-       int i;
-       for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
-               if (!context->res_ctx.pipe_ctx[i].stream)
-                       continue;
-               if (is_dp_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
-                       return true;
-       }
-       return false;
-}
-
-static enum dcn_zstate_support_state  decide_zstate_support(struct dc *dc,=
 struct dc_state *context)
-{
-       int plane_count;
-       int i;
-
-       plane_count =3D 0;
-       for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
-               if (context->res_ctx.pipe_ctx[i].plane_state)
-                       plane_count++;
-       }
-
-       /*
-        * Zstate is allowed in following scenarios:
-        *        1. Single eDP with PSR enabled
-        *        2. 0 planes (No memory requests)
-        *        3. Single eDP without PSR but > 5ms stutter period
-        */
-       if (plane_count =3D=3D 0)
-               return DCN_ZSTATE_SUPPORT_ALLOW;
-       else if (context->stream_count =3D=3D 1 &&  context->streams[0]->si=
gnal =3D=3D SIGNAL_TYPE_EDP) {
-               struct dc_link *link =3D context->streams[0]->sink->link;
-
-               /* zstate only supported on PWRSEQ0 */
-               if (link->link_index !=3D 0)
-                       return DCN_ZSTATE_SUPPORT_DISALLOW;
-
-               if (context->bw_ctx.dml.vba.StutterPeriod > 5000.0)
-                       return DCN_ZSTATE_SUPPORT_ALLOW;
-               else if (link->psr_settings.psr_version =3D=3D DC_PSR_VERSI=
ON_1 && !dc->debug.disable_psr)
-                       return DCN_ZSTATE_SUPPORT_ALLOW_Z10_ONLY;
-               else
-                       return DCN_ZSTATE_SUPPORT_DISALLOW;
-       } else
-               return DCN_ZSTATE_SUPPORT_DISALLOW;
-}
-
-void dcn20_calculate_dlg_params(
-               struct dc *dc, struct dc_state *context,
-               display_e2e_pipe_params_st *pipes,
-               int pipe_cnt,
-               int vlevel)
-{
-       int i, pipe_idx;
-
-       /* Writeback MCIF_WB arbitration parameters */
-       dc->res_pool->funcs->set_mcif_arb_params(dc, context, pipes, pipe_c=
nt);
-
-       context->bw_ctx.bw.dcn.clk.dispclk_khz =3D context->bw_ctx.dml.vba.=
DISPCLK * 1000;
-       context->bw_ctx.bw.dcn.clk.dcfclk_khz =3D context->bw_ctx.dml.vba.D=
CFCLK * 1000;
-       context->bw_ctx.bw.dcn.clk.socclk_khz =3D context->bw_ctx.dml.vba.S=
OCCLK * 1000;
-       context->bw_ctx.bw.dcn.clk.dramclk_khz =3D context->bw_ctx.dml.vba.=
DRAMSpeed * 1000 / 16;
-
-       if (dc->debug.min_dram_clk_khz > context->bw_ctx.bw.dcn.clk.dramclk=
_khz)
-               context->bw_ctx.bw.dcn.clk.dramclk_khz =3D dc->debug.min_dr=
am_clk_khz;
-
-       context->bw_ctx.bw.dcn.clk.dcfclk_deep_sleep_khz =3D context->bw_ct=
x.dml.vba.DCFCLKDeepSleep * 1000;
-       context->bw_ctx.bw.dcn.clk.fclk_khz =3D context->bw_ctx.dml.vba.Fab=
ricClock * 1000;
-       context->bw_ctx.bw.dcn.clk.p_state_change_support =3D
-               context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][cont=
ext->bw_ctx.dml.vba.maxMpcComb]
-                                                       !=3D dm_dram_clock_=
change_unsupported;
-       context->bw_ctx.bw.dcn.clk.dppclk_khz =3D 0;
-
-       context->bw_ctx.bw.dcn.clk.zstate_support =3D decide_zstate_support=
(dc, context);
-
-       context->bw_ctx.bw.dcn.clk.dtbclk_en =3D is_dtbclk_required(dc, con=
text);
-
-       if (context->bw_ctx.bw.dcn.clk.dispclk_khz < dc->debug.min_disp_clk=
_khz)
-               context->bw_ctx.bw.dcn.clk.dispclk_khz =3D dc->debug.min_di=
sp_clk_khz;
-
-       for (i =3D 0, pipe_idx =3D 0; i < dc->res_pool->pipe_count; i++) {
-               if (!context->res_ctx.pipe_ctx[i].stream)
-                       continue;
-               pipes[pipe_idx].pipe.dest.vstartup_start =3D get_vstartup(&=
context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
-               pipes[pipe_idx].pipe.dest.vupdate_offset =3D get_vupdate_of=
fset(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
-               pipes[pipe_idx].pipe.dest.vupdate_width =3D get_vupdate_wid=
th(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
-               pipes[pipe_idx].pipe.dest.vready_offset =3D get_vready_offs=
et(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
-               context->res_ctx.pipe_ctx[i].det_buffer_size_kb =3D context=
->bw_ctx.dml.ip.det_buffer_size_kbytes;
-               context->res_ctx.pipe_ctx[i].unbounded_req =3D pipes[pipe_i=
dx].pipe.src.unbounded_req_mode;
-
-               if (context->bw_ctx.bw.dcn.clk.dppclk_khz < pipes[pipe_idx]=
.clks_cfg.dppclk_mhz * 1000)
-                       context->bw_ctx.bw.dcn.clk.dppclk_khz =3D pipes[pip=
e_idx].clks_cfg.dppclk_mhz * 1000;
-               context->res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz =3D
-                                               pipes[pipe_idx].clks_cfg.dp=
pclk_mhz * 1000;
-               context->res_ctx.pipe_ctx[i].pipe_dlg_param =3D pipes[pipe_=
idx].pipe.dest;
-               pipe_idx++;
-       }
-       /*save a original dppclock copy*/
-       context->bw_ctx.bw.dcn.clk.bw_dppclk_khz =3D context->bw_ctx.bw.dcn=
.clk.dppclk_khz;
-       context->bw_ctx.bw.dcn.clk.bw_dispclk_khz =3D context->bw_ctx.bw.dc=
n.clk.dispclk_khz;
-       context->bw_ctx.bw.dcn.clk.max_supported_dppclk_khz =3D context->bw=
_ctx.dml.soc.clock_limits[vlevel].dppclk_mhz * 1000;
-       context->bw_ctx.bw.dcn.clk.max_supported_dispclk_khz =3D context->b=
w_ctx.dml.soc.clock_limits[vlevel].dispclk_mhz * 1000;
-
-       context->bw_ctx.bw.dcn.compbuf_size_kb =3D context->bw_ctx.dml.ip.c=
onfig_return_buffer_size_in_kbytes
-                                               - context->bw_ctx.dml.ip.de=
t_buffer_size_kbytes * pipe_idx;
-
-       for (i =3D 0, pipe_idx =3D 0; i < dc->res_pool->pipe_count; i++) {
-               bool cstate_en =3D context->bw_ctx.dml.vba.PrefetchMode[vle=
vel][context->bw_ctx.dml.vba.maxMpcComb] !=3D 2;
-
-               if (!context->res_ctx.pipe_ctx[i].stream)
-                       continue;
-
-               if (dc->ctx->dce_version =3D=3D DCN_VERSION_2_01)
-                       cstate_en =3D false;
-
-               context->bw_ctx.dml.funcs.rq_dlg_get_dlg_reg(&context->bw_c=
tx.dml,
-                               &context->res_ctx.pipe_ctx[i].dlg_regs,
-                               &context->res_ctx.pipe_ctx[i].ttu_regs,
-                               pipes,
-                               pipe_cnt,
-                               pipe_idx,
-                               cstate_en,
-                               context->bw_ctx.bw.dcn.clk.p_state_change_s=
upport,
-                               false, false, true);
-
-               context->bw_ctx.dml.funcs.rq_dlg_get_rq_reg(&context->bw_ct=
x.dml,
-                               &context->res_ctx.pipe_ctx[i].rq_regs,
-                               &pipes[pipe_idx].pipe);
-               pipe_idx++;
-       }
-}
-
-static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_sta=
te *context,
-               bool fast_validate)
-{
-       bool out =3D false;
-
-       BW_VAL_TRACE_SETUP();
-
-       int vlevel =3D 0;
-       int pipe_split_from[MAX_PIPES];
-       int pipe_cnt =3D 0;
-       display_e2e_pipe_params_st *pipes =3D kzalloc(dc->res_pool->pipe_co=
unt * sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
-       DC_LOGGER_INIT(dc->ctx->logger);
-
-       BW_VAL_TRACE_COUNT();
-
-       out =3D dcn20_fast_validate_bw(dc, context, pipes, &pipe_cnt, pipe_=
split_from, &vlevel, fast_validate);
-
-       if (pipe_cnt =3D=3D 0)
-               goto validate_out;
-
-       if (!out)
-               goto validate_fail;
-
-       BW_VAL_TRACE_END_VOLTAGE_LEVEL();
-
-       if (fast_validate) {
-               BW_VAL_TRACE_SKIP(fast);
-               goto validate_out;
-       }
-
-       dcn20_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, =
vlevel, fast_validate);
-       dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
-
-       BW_VAL_TRACE_END_WATERMARKS();
-
-       goto validate_out;
-
-validate_fail:
-       DC_LOG_WARNING("Mode Validation Warning: %s failed validation.\n",
-               dml_get_status_message(context->bw_ctx.dml.vba.ValidationSt=
atus[context->bw_ctx.dml.vba.soc.num_states]));
-
-       BW_VAL_TRACE_SKIP(fail);
-       out =3D false;
-
-validate_out:
-       kfree(pipes);
-
-       BW_VAL_TRACE_FINISH();
-
-       return out;
-}
-
-/*
- * This must be noinline to ensure anything that deals with FP registers
- * is contained within this call; previously our compiling with hard-float
- * would result in fp instructions being emitted outside of the boundaries
- * of the DC_FP_START/END macros, which makes sense as the compiler has no
- * idea about what is wrapped and what is not
- *
- * This is largely just a workaround to avoid breakage introduced with 5.6=
,
- * ideally all fp-using code should be moved into its own file, only that
- * should be compiled with hard-float, and all code exported from there
- * should be strictly wrapped with DC_FP_START/END
- */
-static noinline bool dcn20_validate_bandwidth_fp(struct dc *dc,
-               struct dc_state *context, bool fast_validate)
-{
-       bool voltage_supported =3D false;
-       bool full_pstate_supported =3D false;
-       bool dummy_pstate_supported =3D false;
-       double p_state_latency_us;
-
-       p_state_latency_us =3D context->bw_ctx.dml.soc.dram_clock_change_la=
tency_us;
-       context->bw_ctx.dml.soc.disable_dram_clock_change_vactive_support =
=3D
-               dc->debug.disable_dram_clock_change_vactive_support;
-       context->bw_ctx.dml.soc.allow_dram_clock_one_display_vactive =3D
-               dc->debug.enable_dram_clock_change_one_display_vactive;
-
-       /*Unsafe due to current pipe merge and split logic*/
-       ASSERT(context !=3D dc->current_state);
-
-       if (fast_validate) {
-               return dcn20_validate_bandwidth_internal(dc, context, true)=
;
-       }
-
-       // Best case, we support full UCLK switch latency
-       voltage_supported =3D dcn20_validate_bandwidth_internal(dc, context=
, false);
-       full_pstate_supported =3D context->bw_ctx.bw.dcn.clk.p_state_change=
_support;
-
-       if (context->bw_ctx.dml.soc.dummy_pstate_latency_us =3D=3D 0 ||
-               (voltage_supported && full_pstate_supported)) {
-               context->bw_ctx.bw.dcn.clk.p_state_change_support =3D full_=
pstate_supported;
-               goto restore_dml_state;
-       }
-
-       // Fallback: Try to only support G6 temperature read latency
-       context->bw_ctx.dml.soc.dram_clock_change_latency_us =3D context->b=
w_ctx.dml.soc.dummy_pstate_latency_us;
-
-       voltage_supported =3D dcn20_validate_bandwidth_internal(dc, context=
, false);
-       dummy_pstate_supported =3D context->bw_ctx.bw.dcn.clk.p_state_chang=
e_support;
-
-       if (voltage_supported && (dummy_pstate_supported || !(context->stre=
am_count))) {
-               context->bw_ctx.bw.dcn.clk.p_state_change_support =3D false=
;
-               goto restore_dml_state;
-       }
-
-       // ERROR: fallback is supposed to always work.
-       ASSERT(false);
-
-restore_dml_state:
-       context->bw_ctx.dml.soc.dram_clock_change_latency_us =3D p_state_la=
tency_us;
-       return voltage_supported;
-}
-
 bool dcn20_validate_bandwidth(struct dc *dc, struct dc_state *context,
                 bool fast_validate)
 {
@@ -3464,170 +2294,6 @@ static void dcn20_pp_smu_destroy(struct pp_smu_func=
s **pp_smu)
         }
 }

-void dcn20_cap_soc_clocks(
-               struct _vcs_dpi_soc_bounding_box_st *bb,
-               struct pp_smu_nv_clock_table max_clocks)
-{
-       int i;
-
-       // First pass - cap all clocks higher than the reported max
-       for (i =3D 0; i < bb->num_states; i++) {
-               if ((bb->clock_limits[i].dcfclk_mhz > (max_clocks.dcfClockI=
nKhz / 1000))
-                               && max_clocks.dcfClockInKhz !=3D 0)
-                       bb->clock_limits[i].dcfclk_mhz =3D (max_clocks.dcfC=
lockInKhz / 1000);
-
-               if ((bb->clock_limits[i].dram_speed_mts > (max_clocks.uCloc=
kInKhz / 1000) * 16)
-                                               && max_clocks.uClockInKhz !=
=3D 0)
-                       bb->clock_limits[i].dram_speed_mts =3D (max_clocks.=
uClockInKhz / 1000) * 16;
-
-               if ((bb->clock_limits[i].fabricclk_mhz > (max_clocks.fabric=
ClockInKhz / 1000))
-                                               && max_clocks.fabricClockIn=
Khz !=3D 0)
-                       bb->clock_limits[i].fabricclk_mhz =3D (max_clocks.f=
abricClockInKhz / 1000);
-
-               if ((bb->clock_limits[i].dispclk_mhz > (max_clocks.displayC=
lockInKhz / 1000))
-                                               && max_clocks.displayClockI=
nKhz !=3D 0)
-                       bb->clock_limits[i].dispclk_mhz =3D (max_clocks.dis=
playClockInKhz / 1000);
-
-               if ((bb->clock_limits[i].dppclk_mhz > (max_clocks.dppClockI=
nKhz / 1000))
-                                               && max_clocks.dppClockInKhz=
 !=3D 0)
-                       bb->clock_limits[i].dppclk_mhz =3D (max_clocks.dppC=
lockInKhz / 1000);
-
-               if ((bb->clock_limits[i].phyclk_mhz > (max_clocks.phyClockI=
nKhz / 1000))
-                                               && max_clocks.phyClockInKhz=
 !=3D 0)
-                       bb->clock_limits[i].phyclk_mhz =3D (max_clocks.phyC=
lockInKhz / 1000);
-
-               if ((bb->clock_limits[i].socclk_mhz > (max_clocks.socClockI=
nKhz / 1000))
-                                               && max_clocks.socClockInKhz=
 !=3D 0)
-                       bb->clock_limits[i].socclk_mhz =3D (max_clocks.socC=
lockInKhz / 1000);
-
-               if ((bb->clock_limits[i].dscclk_mhz > (max_clocks.dscClockI=
nKhz / 1000))
-                                               && max_clocks.dscClockInKhz=
 !=3D 0)
-                       bb->clock_limits[i].dscclk_mhz =3D (max_clocks.dscC=
lockInKhz / 1000);
-       }
-
-       // Second pass - remove all duplicate clock states
-       for (i =3D bb->num_states - 1; i > 1; i--) {
-               bool duplicate =3D true;
-
-               if (bb->clock_limits[i-1].dcfclk_mhz !=3D bb->clock_limits[=
i].dcfclk_mhz)
-                       duplicate =3D false;
-               if (bb->clock_limits[i-1].dispclk_mhz !=3D bb->clock_limits=
[i].dispclk_mhz)
-                       duplicate =3D false;
-               if (bb->clock_limits[i-1].dppclk_mhz !=3D bb->clock_limits[=
i].dppclk_mhz)
-                       duplicate =3D false;
-               if (bb->clock_limits[i-1].dram_speed_mts !=3D bb->clock_lim=
its[i].dram_speed_mts)
-                       duplicate =3D false;
-               if (bb->clock_limits[i-1].dscclk_mhz !=3D bb->clock_limits[=
i].dscclk_mhz)
-                       duplicate =3D false;
-               if (bb->clock_limits[i-1].fabricclk_mhz !=3D bb->clock_limi=
ts[i].fabricclk_mhz)
-                       duplicate =3D false;
-               if (bb->clock_limits[i-1].phyclk_mhz !=3D bb->clock_limits[=
i].phyclk_mhz)
-                       duplicate =3D false;
-               if (bb->clock_limits[i-1].socclk_mhz !=3D bb->clock_limits[=
i].socclk_mhz)
-                       duplicate =3D false;
-
-               if (duplicate)
-                       bb->num_states--;
-       }
-}
-
-void dcn20_update_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding=
_box_st *bb,
-               struct pp_smu_nv_clock_table *max_clocks, unsigned int *ucl=
k_states, unsigned int num_states)
-{
-       struct _vcs_dpi_voltage_scaling_st calculated_states[DC__VOLTAGE_ST=
ATES];
-       int i;
-       int num_calculated_states =3D 0;
-       int min_dcfclk =3D 0;
-
-       if (num_states =3D=3D 0)
-               return;
-
-       memset(calculated_states, 0, sizeof(calculated_states));
-
-       if (dc->bb_overrides.min_dcfclk_mhz > 0)
-               min_dcfclk =3D dc->bb_overrides.min_dcfclk_mhz;
-       else {
-               if (ASICREV_IS_NAVI12_P(dc->ctx->asic_id.hw_internal_rev))
-                       min_dcfclk =3D 310;
-               else
-                       // Accounting for SOC/DCF relationship, we can go a=
s high as
-                       // 506Mhz in Vmin.
-                       min_dcfclk =3D 506;
-       }
-
-       for (i =3D 0; i < num_states; i++) {
-               int min_fclk_required_by_uclk;
-               calculated_states[i].state =3D i;
-               calculated_states[i].dram_speed_mts =3D uclk_states[i] * 16=
 / 1000;
-
-               // FCLK:UCLK ratio is 1.08
-               min_fclk_required_by_uclk =3D div_u64(((unsigned long long)=
uclk_states[i]) * 1080,
-                       1000000);
-
-               calculated_states[i].fabricclk_mhz =3D (min_fclk_required_b=
y_uclk < min_dcfclk) ?
-                               min_dcfclk : min_fclk_required_by_uclk;
-
-               calculated_states[i].socclk_mhz =3D (calculated_states[i].f=
abricclk_mhz > max_clocks->socClockInKhz / 1000) ?
-                               max_clocks->socClockInKhz / 1000 : calculat=
ed_states[i].fabricclk_mhz;
-
-               calculated_states[i].dcfclk_mhz =3D (calculated_states[i].f=
abricclk_mhz > max_clocks->dcfClockInKhz / 1000) ?
-                               max_clocks->dcfClockInKhz / 1000 : calculat=
ed_states[i].fabricclk_mhz;
-
-               calculated_states[i].dispclk_mhz =3D max_clocks->displayClo=
ckInKhz / 1000;
-               calculated_states[i].dppclk_mhz =3D max_clocks->displayCloc=
kInKhz / 1000;
-               calculated_states[i].dscclk_mhz =3D max_clocks->displayCloc=
kInKhz / (1000 * 3);
-
-               calculated_states[i].phyclk_mhz =3D max_clocks->phyClockInK=
hz / 1000;
-
-               num_calculated_states++;
-       }
-
-       calculated_states[num_calculated_states - 1].socclk_mhz =3D max_clo=
cks->socClockInKhz / 1000;
-       calculated_states[num_calculated_states - 1].fabricclk_mhz =3D max_=
clocks->socClockInKhz / 1000;
-       calculated_states[num_calculated_states - 1].dcfclk_mhz =3D max_clo=
cks->dcfClockInKhz / 1000;
-
-       memcpy(bb->clock_limits, calculated_states, sizeof(bb->clock_limits=
));
-       bb->num_states =3D num_calculated_states;
-
-       // Duplicate the last state, DML always an extra state identical to=
 max state to work
-       memcpy(&bb->clock_limits[num_calculated_states], &bb->clock_limits[=
num_calculated_states - 1], sizeof(struct _vcs_dpi_voltage_scaling_st));
-       bb->clock_limits[num_calculated_states].state =3D bb->num_states;
-}
-
-void dcn20_patch_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_=
box_st *bb)
-{
-       if ((int)(bb->sr_exit_time_us * 1000) !=3D dc->bb_overrides.sr_exit=
_time_ns
-                       && dc->bb_overrides.sr_exit_time_ns) {
-               bb->sr_exit_time_us =3D dc->bb_overrides.sr_exit_time_ns / =
1000.0;
-       }
-
-       if ((int)(bb->sr_enter_plus_exit_time_us * 1000)
-                               !=3D dc->bb_overrides.sr_enter_plus_exit_ti=
me_ns
-                       && dc->bb_overrides.sr_enter_plus_exit_time_ns) {
-               bb->sr_enter_plus_exit_time_us =3D
-                               dc->bb_overrides.sr_enter_plus_exit_time_ns=
 / 1000.0;
-       }
-
-       if ((int)(bb->urgent_latency_us * 1000) !=3D dc->bb_overrides.urgen=
t_latency_ns
-                       && dc->bb_overrides.urgent_latency_ns) {
-               bb->urgent_latency_us =3D dc->bb_overrides.urgent_latency_n=
s / 1000.0;
-       }
-
-       if ((int)(bb->dram_clock_change_latency_us * 1000)
-                               !=3D dc->bb_overrides.dram_clock_change_lat=
ency_ns
-                       && dc->bb_overrides.dram_clock_change_latency_ns) {
-               bb->dram_clock_change_latency_us =3D
-                               dc->bb_overrides.dram_clock_change_latency_=
ns / 1000.0;
-       }
-
-       if ((int)(bb->dummy_pstate_latency_us * 1000)
-                               !=3D dc->bb_overrides.dummy_clock_change_la=
tency_ns
-                       && dc->bb_overrides.dummy_clock_change_latency_ns) =
{
-               bb->dummy_pstate_latency_us =3D
-                               dc->bb_overrides.dummy_clock_change_latency=
_ns / 1000.0;
-       }
-}
-
 static struct _vcs_dpi_soc_bounding_box_st *get_asic_rev_soc_bb(
         uint32_t hw_internal_rev)
 {
@@ -3910,9 +2576,9 @@ static bool dcn20_resource_construct(
                                 ranges.reader_wm_sets[i].wm_inst =3D i;
                                 ranges.reader_wm_sets[i].min_drain_clk_mhz=
 =3D PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MIN;
                                 ranges.reader_wm_sets[i].max_drain_clk_mhz=
 =3D PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MAX;
-                               ranges.reader_wm_sets[i].min_fill_clk_mhz =
=3D (i > 0) ? (loaded_bb->clock_limits[i - 1].dram_speed_mts / 16) + 1 : 0;
-                               ranges.reader_wm_sets[i].max_fill_clk_mhz =
=3D loaded_bb->clock_limits[i].dram_speed_mts / 16;
-
+                               DC_FP_START();
+                               dcn20_fpu_set_wm_ranges(i, &ranges, loaded_=
bb);
+                               DC_FP_END();
                                 ranges.num_reader_wm_sets =3D i + 1;
                         }

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h b/driver=
s/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
index 6ec8ff45f0f7..961923c56ea0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
@@ -27,6 +27,7 @@
 #define __DC_RESOURCE_DCN20_H__

 #include "core_types.h"
+#include "dml/dcn20/dcn20_fpu.h"

 #define TO_DCN20_RES_POOL(pool)\
         container_of(pool, struct dcn20_resource_pool, base)
@@ -35,6 +36,12 @@ struct dc;
 struct resource_pool;
 struct _vcs_dpi_display_pipe_params_st;

+extern struct _vcs_dpi_ip_params_st dcn2_0_ip;
+extern struct _vcs_dpi_ip_params_st dcn2_0_nv14_ip;
+extern struct _vcs_dpi_soc_bounding_box_st dcn2_0_soc;
+extern struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc;
+extern struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc;
+
 struct dcn20_resource_pool {
         struct resource_pool base;
 };
@@ -49,11 +56,6 @@ unsigned int dcn20_calc_max_scaled_time(
                 unsigned int time_per_pixel,
                 enum mmhubbub_wbif_mode mode,
                 unsigned int urgent_watermark);
-int dcn20_populate_dml_pipes_from_context(
-               struct dc *dc,
-               struct dc_state *context,
-               display_e2e_pipe_params_st *pipes,
-               bool fast_validate);
 struct pipe_ctx *dcn20_acquire_idle_pipe_for_layer(
                 struct dc_state *state,
                 const struct resource_pool *pool,
@@ -79,7 +81,6 @@ struct dpp *dcn20_dpp_create(
 struct input_pixel_processor *dcn20_ipp_create(
         struct dc_context *ctx, uint32_t inst);

-
 struct output_pixel_processor *dcn20_opp_create(
         struct dc_context *ctx, uint32_t inst);

@@ -96,11 +97,6 @@ struct display_stream_compressor *dcn20_dsc_create(
         struct dc_context *ctx, uint32_t inst);
 void dcn20_dsc_destroy(struct display_stream_compressor **dsc);

-void dcn20_cap_soc_clocks(
-               struct _vcs_dpi_soc_bounding_box_st *bb,
-               struct pp_smu_nv_clock_table max_clocks);
-void dcn20_update_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding=
_box_st *bb,
-               struct pp_smu_nv_clock_table *max_clocks, unsigned int *ucl=
k_states, unsigned int num_states);
 struct hubp *dcn20_hubp_create(
         struct dc_context *ctx,
         uint32_t inst);
@@ -158,11 +154,6 @@ bool dcn20_fast_validate_bw(
                 int *pipe_split_from,
                 int *vlevel_out,
                 bool fast_validate);
-void dcn20_calculate_dlg_params(
-               struct dc *dc, struct dc_state *context,
-               display_e2e_pipe_params_st *pipes,
-               int pipe_cnt,
-               int vlevel);

 enum dc_status dcn20_build_mapped_resource(const struct dc *dc, struct dc_=
state *context, struct dc_stream_state *stream);
 enum dc_status dcn20_add_stream_to_ctx(struct dc *dc, struct dc_state *new=
_ctx, struct dc_stream_state *dc_stream);
@@ -170,12 +161,5 @@ enum dc_status dcn20_add_dsc_to_stream_resource(struct=
 dc *dc, struct dc_state *
 enum dc_status dcn20_remove_stream_from_ctx(struct dc *dc, struct dc_state=
 *new_ctx, struct dc_stream_state *dc_stream);
 enum dc_status dcn20_patch_unknown_plane_state(struct dc_plane_state *plan=
e_state);

-void dcn20_patch_bounding_box(
-               struct dc *dc,
-               struct _vcs_dpi_soc_bounding_box_st *bb);
-void dcn20_cap_soc_clocks(
-               struct _vcs_dpi_soc_bounding_box_st *bb,
-               struct pp_smu_nv_clock_table max_clocks);
-
 #endif /* __DC_RESOURCE_DCN20_H__ */

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/driver=
s/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index e5cc6bf45743..c1cd1a8ff1d7 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -1363,7 +1363,9 @@ static noinline bool dcn21_validate_bandwidth_fp(stru=
ct dc *dc,
         }

         dcn21_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from,=
 vlevel, fast_validate);
+       DC_FP_START();
         dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
+       DC_FP_END();

         BW_VAL_TRACE_END_WATERMARKS();

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/driver=
s/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
index f10f7a0ca02a..8fa08f026c89 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
@@ -2261,7 +2261,9 @@ static noinline void dcn30_calculate_wm_and_dlg_fp(
                 pipe_idx++;
         }

+       DC_FP_START();
         dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
+       DC_FP_END();

         if (!pstate_en)
                 /* Restore full p-state latency */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/driver=
s/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index 660e96a7fe7f..4a9c80482636 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -1998,7 +1998,9 @@ static void dcn31_calculate_wm_and_dlg_fp(
                 pipe_idx++;
         }

+       DC_FP_START();
         dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
+       DC_FP_END();
 }

 void dcn31_calculate_wm_and_dlg(
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers=
/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index d590dc917363..b7adc9b6a543 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -25,6 +25,9 @@
  */

 #include "resource.h"
+#include "clk_mgr.h"
+#include "dc_link_dp.h"
+#include "dcn20/dcn20_resource.h"

 #include "dcn20_fpu.h"

@@ -61,6 +64,370 @@
  * warning.
  */

+struct _vcs_dpi_ip_params_st dcn2_0_ip =3D {
+       .odm_capable =3D 1,
+       .gpuvm_enable =3D 0,
+       .hostvm_enable =3D 0,
+       .gpuvm_max_page_table_levels =3D 4,
+       .hostvm_max_page_table_levels =3D 4,
+       .hostvm_cached_page_table_levels =3D 0,
+       .pte_group_size_bytes =3D 2048,
+       .num_dsc =3D 6,
+       .rob_buffer_size_kbytes =3D 168,
+       .det_buffer_size_kbytes =3D 164,
+       .dpte_buffer_size_in_pte_reqs_luma =3D 84,
+       .pde_proc_buffer_size_64k_reqs =3D 48,
+       .dpp_output_buffer_pixels =3D 2560,
+       .opp_output_buffer_lines =3D 1,
+       .pixel_chunk_size_kbytes =3D 8,
+       .pte_chunk_size_kbytes =3D 2,
+       .meta_chunk_size_kbytes =3D 2,
+       .writeback_chunk_size_kbytes =3D 2,
+       .line_buffer_size_bits =3D 789504,
+       .is_line_buffer_bpp_fixed =3D 0,
+       .line_buffer_fixed_bpp =3D 0,
+       .dcc_supported =3D true,
+       .max_line_buffer_lines =3D 12,
+       .writeback_luma_buffer_size_kbytes =3D 12,
+       .writeback_chroma_buffer_size_kbytes =3D 8,
+       .writeback_chroma_line_buffer_width_pixels =3D 4,
+       .writeback_max_hscl_ratio =3D 1,
+       .writeback_max_vscl_ratio =3D 1,
+       .writeback_min_hscl_ratio =3D 1,
+       .writeback_min_vscl_ratio =3D 1,
+       .writeback_max_hscl_taps =3D 12,
+       .writeback_max_vscl_taps =3D 12,
+       .writeback_line_buffer_luma_buffer_size =3D 0,
+       .writeback_line_buffer_chroma_buffer_size =3D 14643,
+       .cursor_buffer_size =3D 8,
+       .cursor_chunk_size =3D 2,
+       .max_num_otg =3D 6,
+       .max_num_dpp =3D 6,
+       .max_num_wb =3D 1,
+       .max_dchub_pscl_bw_pix_per_clk =3D 4,
+       .max_pscl_lb_bw_pix_per_clk =3D 2,
+       .max_lb_vscl_bw_pix_per_clk =3D 4,
+       .max_vscl_hscl_bw_pix_per_clk =3D 4,
+       .max_hscl_ratio =3D 8,
+       .max_vscl_ratio =3D 8,
+       .hscl_mults =3D 4,
+       .vscl_mults =3D 4,
+       .max_hscl_taps =3D 8,
+       .max_vscl_taps =3D 8,
+       .dispclk_ramp_margin_percent =3D 1,
+       .underscan_factor =3D 1.10,
+       .min_vblank_lines =3D 32, //
+       .dppclk_delay_subtotal =3D 77, //
+       .dppclk_delay_scl_lb_only =3D 16,
+       .dppclk_delay_scl =3D 50,
+       .dppclk_delay_cnvc_formatter =3D 8,
+       .dppclk_delay_cnvc_cursor =3D 6,
+       .dispclk_delay_subtotal =3D 87, //
+       .dcfclk_cstate_latency =3D 10, // SRExitTime
+       .max_inter_dcn_tile_repeaters =3D 8,
+       .xfc_supported =3D true,
+       .xfc_fill_bw_overhead_percent =3D 10.0,
+       .xfc_fill_constant_bytes =3D 0,
+       .number_of_cursors =3D 1,
+};
+
+struct _vcs_dpi_ip_params_st dcn2_0_nv14_ip =3D {
+       .odm_capable =3D 1,
+       .gpuvm_enable =3D 0,
+       .hostvm_enable =3D 0,
+       .gpuvm_max_page_table_levels =3D 4,
+       .hostvm_max_page_table_levels =3D 4,
+       .hostvm_cached_page_table_levels =3D 0,
+       .num_dsc =3D 5,
+       .rob_buffer_size_kbytes =3D 168,
+       .det_buffer_size_kbytes =3D 164,
+       .dpte_buffer_size_in_pte_reqs_luma =3D 84,
+       .dpte_buffer_size_in_pte_reqs_chroma =3D 42,//todo
+       .dpp_output_buffer_pixels =3D 2560,
+       .opp_output_buffer_lines =3D 1,
+       .pixel_chunk_size_kbytes =3D 8,
+       .pte_enable =3D 1,
+       .max_page_table_levels =3D 4,
+       .pte_chunk_size_kbytes =3D 2,
+       .meta_chunk_size_kbytes =3D 2,
+       .writeback_chunk_size_kbytes =3D 2,
+       .line_buffer_size_bits =3D 789504,
+       .is_line_buffer_bpp_fixed =3D 0,
+       .line_buffer_fixed_bpp =3D 0,
+       .dcc_supported =3D true,
+       .max_line_buffer_lines =3D 12,
+       .writeback_luma_buffer_size_kbytes =3D 12,
+       .writeback_chroma_buffer_size_kbytes =3D 8,
+       .writeback_chroma_line_buffer_width_pixels =3D 4,
+       .writeback_max_hscl_ratio =3D 1,
+       .writeback_max_vscl_ratio =3D 1,
+       .writeback_min_hscl_ratio =3D 1,
+       .writeback_min_vscl_ratio =3D 1,
+       .writeback_max_hscl_taps =3D 12,
+       .writeback_max_vscl_taps =3D 12,
+       .writeback_line_buffer_luma_buffer_size =3D 0,
+       .writeback_line_buffer_chroma_buffer_size =3D 14643,
+       .cursor_buffer_size =3D 8,
+       .cursor_chunk_size =3D 2,
+       .max_num_otg =3D 5,
+       .max_num_dpp =3D 5,
+       .max_num_wb =3D 1,
+       .max_dchub_pscl_bw_pix_per_clk =3D 4,
+       .max_pscl_lb_bw_pix_per_clk =3D 2,
+       .max_lb_vscl_bw_pix_per_clk =3D 4,
+       .max_vscl_hscl_bw_pix_per_clk =3D 4,
+       .max_hscl_ratio =3D 8,
+       .max_vscl_ratio =3D 8,
+       .hscl_mults =3D 4,
+       .vscl_mults =3D 4,
+       .max_hscl_taps =3D 8,
+       .max_vscl_taps =3D 8,
+       .dispclk_ramp_margin_percent =3D 1,
+       .underscan_factor =3D 1.10,
+       .min_vblank_lines =3D 32, //
+       .dppclk_delay_subtotal =3D 77, //
+       .dppclk_delay_scl_lb_only =3D 16,
+       .dppclk_delay_scl =3D 50,
+       .dppclk_delay_cnvc_formatter =3D 8,
+       .dppclk_delay_cnvc_cursor =3D 6,
+       .dispclk_delay_subtotal =3D 87, //
+       .dcfclk_cstate_latency =3D 10, // SRExitTime
+       .max_inter_dcn_tile_repeaters =3D 8,
+       .xfc_supported =3D true,
+       .xfc_fill_bw_overhead_percent =3D 10.0,
+       .xfc_fill_constant_bytes =3D 0,
+       .ptoi_supported =3D 0,
+       .number_of_cursors =3D 1,
+};
+
+
+struct _vcs_dpi_soc_bounding_box_st dcn2_0_soc =3D {
+       /* Defaults that get patched on driver load from firmware. */
+       .clock_limits =3D {
+                       {
+                               .state =3D 0,
+                               .dcfclk_mhz =3D 560.0,
+                               .fabricclk_mhz =3D 560.0,
+                               .dispclk_mhz =3D 513.0,
+                               .dppclk_mhz =3D 513.0,
+                               .phyclk_mhz =3D 540.0,
+                               .socclk_mhz =3D 560.0,
+                               .dscclk_mhz =3D 171.0,
+                               .dram_speed_mts =3D 8960.0,
+                       },
+                       {
+                               .state =3D 1,
+                               .dcfclk_mhz =3D 694.0,
+                               .fabricclk_mhz =3D 694.0,
+                               .dispclk_mhz =3D 642.0,
+                               .dppclk_mhz =3D 642.0,
+                               .phyclk_mhz =3D 600.0,
+                               .socclk_mhz =3D 694.0,
+                               .dscclk_mhz =3D 214.0,
+                               .dram_speed_mts =3D 11104.0,
+                       },
+                       {
+                               .state =3D 2,
+                               .dcfclk_mhz =3D 875.0,
+                               .fabricclk_mhz =3D 875.0,
+                               .dispclk_mhz =3D 734.0,
+                               .dppclk_mhz =3D 734.0,
+                               .phyclk_mhz =3D 810.0,
+                               .socclk_mhz =3D 875.0,
+                               .dscclk_mhz =3D 245.0,
+                               .dram_speed_mts =3D 14000.0,
+                       },
+                       {
+                               .state =3D 3,
+                               .dcfclk_mhz =3D 1000.0,
+                               .fabricclk_mhz =3D 1000.0,
+                               .dispclk_mhz =3D 1100.0,
+                               .dppclk_mhz =3D 1100.0,
+                               .phyclk_mhz =3D 810.0,
+                               .socclk_mhz =3D 1000.0,
+                               .dscclk_mhz =3D 367.0,
+                               .dram_speed_mts =3D 16000.0,
+                       },
+                       {
+                               .state =3D 4,
+                               .dcfclk_mhz =3D 1200.0,
+                               .fabricclk_mhz =3D 1200.0,
+                               .dispclk_mhz =3D 1284.0,
+                               .dppclk_mhz =3D 1284.0,
+                               .phyclk_mhz =3D 810.0,
+                               .socclk_mhz =3D 1200.0,
+                               .dscclk_mhz =3D 428.0,
+                               .dram_speed_mts =3D 16000.0,
+                       },
+                       /*Extra state, no dispclk ramping*/
+                       {
+                               .state =3D 5,
+                               .dcfclk_mhz =3D 1200.0,
+                               .fabricclk_mhz =3D 1200.0,
+                               .dispclk_mhz =3D 1284.0,
+                               .dppclk_mhz =3D 1284.0,
+                               .phyclk_mhz =3D 810.0,
+                               .socclk_mhz =3D 1200.0,
+                               .dscclk_mhz =3D 428.0,
+                               .dram_speed_mts =3D 16000.0,
+                       },
+               },
+       .num_states =3D 5,
+       .sr_exit_time_us =3D 8.6,
+       .sr_enter_plus_exit_time_us =3D 10.9,
+       .urgent_latency_us =3D 4.0,
+       .urgent_latency_pixel_data_only_us =3D 4.0,
+       .urgent_latency_pixel_mixed_with_vm_data_us =3D 4.0,
+       .urgent_latency_vm_data_only_us =3D 4.0,
+       .urgent_out_of_order_return_per_channel_pixel_only_bytes =3D 4096,
+       .urgent_out_of_order_return_per_channel_pixel_and_vm_bytes =3D 4096=
,
+       .urgent_out_of_order_return_per_channel_vm_only_bytes =3D 4096,
+       .pct_ideal_dram_sdp_bw_after_urgent_pixel_only =3D 40.0,
+       .pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm =3D 40.0,
+       .pct_ideal_dram_sdp_bw_after_urgent_vm_only =3D 40.0,
+       .max_avg_sdp_bw_use_normal_percent =3D 40.0,
+       .max_avg_dram_bw_use_normal_percent =3D 40.0,
+       .writeback_latency_us =3D 12.0,
+       .ideal_dram_bw_after_urgent_percent =3D 40.0,
+       .max_request_size_bytes =3D 256,
+       .dram_channel_width_bytes =3D 2,
+       .fabric_datapath_to_dcn_data_return_bytes =3D 64,
+       .dcn_downspread_percent =3D 0.5,
+       .downspread_percent =3D 0.38,
+       .dram_page_open_time_ns =3D 50.0,
+       .dram_rw_turnaround_time_ns =3D 17.5,
+       .dram_return_buffer_per_channel_bytes =3D 8192,
+       .round_trip_ping_latency_dcfclk_cycles =3D 131,
+       .urgent_out_of_order_return_per_channel_bytes =3D 256,
+       .channel_interleave_bytes =3D 256,
+       .num_banks =3D 8,
+       .num_chans =3D 16,
+       .vmm_page_size_bytes =3D 4096,
+       .dram_clock_change_latency_us =3D 404.0,
+       .dummy_pstate_latency_us =3D 5.0,
+       .writeback_dram_clock_change_latency_us =3D 23.0,
+       .return_bus_width_bytes =3D 64,
+       .dispclk_dppclk_vco_speed_mhz =3D 3850,
+       .xfc_bus_transport_time_us =3D 20,
+       .xfc_xbuf_latency_tolerance_us =3D 4,
+       .use_urgent_burst_bw =3D 0
+};
+
+struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc =3D {
+       .clock_limits =3D {
+                       {
+                               .state =3D 0,
+                               .dcfclk_mhz =3D 560.0,
+                               .fabricclk_mhz =3D 560.0,
+                               .dispclk_mhz =3D 513.0,
+                               .dppclk_mhz =3D 513.0,
+                               .phyclk_mhz =3D 540.0,
+                               .socclk_mhz =3D 560.0,
+                               .dscclk_mhz =3D 171.0,
+                               .dram_speed_mts =3D 8960.0,
+                       },
+                       {
+                               .state =3D 1,
+                               .dcfclk_mhz =3D 694.0,
+                               .fabricclk_mhz =3D 694.0,
+                               .dispclk_mhz =3D 642.0,
+                               .dppclk_mhz =3D 642.0,
+                               .phyclk_mhz =3D 600.0,
+                               .socclk_mhz =3D 694.0,
+                               .dscclk_mhz =3D 214.0,
+                               .dram_speed_mts =3D 11104.0,
+                       },
+                       {
+                               .state =3D 2,
+                               .dcfclk_mhz =3D 875.0,
+                               .fabricclk_mhz =3D 875.0,
+                               .dispclk_mhz =3D 734.0,
+                               .dppclk_mhz =3D 734.0,
+                               .phyclk_mhz =3D 810.0,
+                               .socclk_mhz =3D 875.0,
+                               .dscclk_mhz =3D 245.0,
+                               .dram_speed_mts =3D 14000.0,
+                       },
+                       {
+                               .state =3D 3,
+                               .dcfclk_mhz =3D 1000.0,
+                               .fabricclk_mhz =3D 1000.0,
+                               .dispclk_mhz =3D 1100.0,
+                               .dppclk_mhz =3D 1100.0,
+                               .phyclk_mhz =3D 810.0,
+                               .socclk_mhz =3D 1000.0,
+                               .dscclk_mhz =3D 367.0,
+                               .dram_speed_mts =3D 16000.0,
+                       },
+                       {
+                               .state =3D 4,
+                               .dcfclk_mhz =3D 1200.0,
+                               .fabricclk_mhz =3D 1200.0,
+                               .dispclk_mhz =3D 1284.0,
+                               .dppclk_mhz =3D 1284.0,
+                               .phyclk_mhz =3D 810.0,
+                               .socclk_mhz =3D 1200.0,
+                               .dscclk_mhz =3D 428.0,
+                               .dram_speed_mts =3D 16000.0,
+                       },
+                       /*Extra state, no dispclk ramping*/
+                       {
+                               .state =3D 5,
+                               .dcfclk_mhz =3D 1200.0,
+                               .fabricclk_mhz =3D 1200.0,
+                               .dispclk_mhz =3D 1284.0,
+                               .dppclk_mhz =3D 1284.0,
+                               .phyclk_mhz =3D 810.0,
+                               .socclk_mhz =3D 1200.0,
+                               .dscclk_mhz =3D 428.0,
+                               .dram_speed_mts =3D 16000.0,
+                       },
+               },
+       .num_states =3D 5,
+       .sr_exit_time_us =3D 11.6,
+       .sr_enter_plus_exit_time_us =3D 13.9,
+       .urgent_latency_us =3D 4.0,
+       .urgent_latency_pixel_data_only_us =3D 4.0,
+       .urgent_latency_pixel_mixed_with_vm_data_us =3D 4.0,
+       .urgent_latency_vm_data_only_us =3D 4.0,
+       .urgent_out_of_order_return_per_channel_pixel_only_bytes =3D 4096,
+       .urgent_out_of_order_return_per_channel_pixel_and_vm_bytes =3D 4096=
,
+       .urgent_out_of_order_return_per_channel_vm_only_bytes =3D 4096,
+       .pct_ideal_dram_sdp_bw_after_urgent_pixel_only =3D 40.0,
+       .pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm =3D 40.0,
+       .pct_ideal_dram_sdp_bw_after_urgent_vm_only =3D 40.0,
+       .max_avg_sdp_bw_use_normal_percent =3D 40.0,
+       .max_avg_dram_bw_use_normal_percent =3D 40.0,
+       .writeback_latency_us =3D 12.0,
+       .ideal_dram_bw_after_urgent_percent =3D 40.0,
+       .max_request_size_bytes =3D 256,
+       .dram_channel_width_bytes =3D 2,
+       .fabric_datapath_to_dcn_data_return_bytes =3D 64,
+       .dcn_downspread_percent =3D 0.5,
+       .downspread_percent =3D 0.38,
+       .dram_page_open_time_ns =3D 50.0,
+       .dram_rw_turnaround_time_ns =3D 17.5,
+       .dram_return_buffer_per_channel_bytes =3D 8192,
+       .round_trip_ping_latency_dcfclk_cycles =3D 131,
+       .urgent_out_of_order_return_per_channel_bytes =3D 256,
+       .channel_interleave_bytes =3D 256,
+       .num_banks =3D 8,
+       .num_chans =3D 8,
+       .vmm_page_size_bytes =3D 4096,
+       .dram_clock_change_latency_us =3D 404.0,
+       .dummy_pstate_latency_us =3D 5.0,
+       .writeback_dram_clock_change_latency_us =3D 23.0,
+       .return_bus_width_bytes =3D 64,
+       .dispclk_dppclk_vco_speed_mhz =3D 3850,
+       .xfc_bus_transport_time_us =3D 20,
+       .xfc_xbuf_latency_tolerance_us =3D 4,
+       .use_urgent_burst_bw =3D 0
+};
+
+struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc =3D { 0 };
+
+#define DC_LOGGER_INIT(logger)
+
 void dcn20_populate_dml_writeback_from_context(struct dc *dc,
                                                struct resource_context *re=
s_ctx,
                                                display_e2e_pipe_params_st =
*pipes)
@@ -100,3 +467,1021 @@ void dcn20_populate_dml_writeback_from_context(struc=
t dc *dc,
                 pipe_cnt++;
         }
 }
+
+void dcn20_fpu_set_wb_arb_params(struct mcif_arb_params *wb_arb_params,
+                                struct dc_state *context,
+                                display_e2e_pipe_params_st *pipes,
+                                int pipe_cnt, int i)
+{
+       int k;
+
+       dc_assert_fp_enabled();
+
+       for (k =3D 0; k < sizeof(wb_arb_params->cli_watermark)/sizeof(wb_ar=
b_params->cli_watermark[0]); k++) {
+               wb_arb_params->cli_watermark[k] =3D get_wm_writeback_urgent=
(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+               wb_arb_params->pstate_watermark[k] =3D get_wm_writeback_dra=
m_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       }
+       wb_arb_params->time_per_pixel =3D 16.0 * 1000 / (context->res_ctx.p=
ipe_ctx[i].stream->phy_pix_clk / 1000); /* 4 bit fraction, ms */
+}
+
+static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
+{
+       int i;
+
+       for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
+               if (!context->res_ctx.pipe_ctx[i].stream)
+                       continue;
+               if (is_dp_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
+                       return true;
+       }
+       return false;
+}
+
+static enum dcn_zstate_support_state decide_zstate_support(struct dc *dc,s=
truct dc_state *context)
+{
+       int plane_count;
+       int i;
+
+       plane_count =3D 0;
+       for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
+               if (context->res_ctx.pipe_ctx[i].plane_state)
+                       plane_count++;
+       }
+
+       /*
+        * Zstate is allowed in following scenarios:
+        *        1. Single eDP with PSR enabled
+        *        2. 0 planes (No memory requests)
+        *        3. Single eDP without PSR but > 5ms stutter period
+        */
+       if (plane_count =3D=3D 0)
+               return DCN_ZSTATE_SUPPORT_ALLOW;
+       else if (context->stream_count =3D=3D 1 &&  context->streams[0]->si=
gnal =3D=3D SIGNAL_TYPE_EDP) {
+               struct dc_link *link =3D context->streams[0]->sink->link;
+
+               /* zstate only supported on PWRSEQ0 */
+               if (link->link_index !=3D 0)
+                       return DCN_ZSTATE_SUPPORT_DISALLOW;
+
+               if (context->bw_ctx.dml.vba.StutterPeriod > 5000.0)
+                       return DCN_ZSTATE_SUPPORT_ALLOW;
+               else if (link->psr_settings.psr_version =3D=3D DC_PSR_VERSI=
ON_1 && !dc->debug.disable_psr)
+                       return DCN_ZSTATE_SUPPORT_ALLOW_Z10_ONLY;
+               else
+                       return DCN_ZSTATE_SUPPORT_DISALLOW;
+       } else
+               return DCN_ZSTATE_SUPPORT_DISALLOW;
+}
+
+void dcn20_calculate_dlg_params(struct dc *dc,
+                               struct dc_state *context,
+                               display_e2e_pipe_params_st *pipes,
+                               int pipe_cnt,
+                               int vlevel)
+{
+       int i, pipe_idx;
+
+       dc_assert_fp_enabled();
+
+       /* Writeback MCIF_WB arbitration parameters */
+       dc->res_pool->funcs->set_mcif_arb_params(dc, context, pipes, pipe_c=
nt);
+
+       context->bw_ctx.bw.dcn.clk.dispclk_khz =3D context->bw_ctx.dml.vba.=
DISPCLK * 1000;
+       context->bw_ctx.bw.dcn.clk.dcfclk_khz =3D context->bw_ctx.dml.vba.D=
CFCLK * 1000;
+       context->bw_ctx.bw.dcn.clk.socclk_khz =3D context->bw_ctx.dml.vba.S=
OCCLK * 1000;
+       context->bw_ctx.bw.dcn.clk.dramclk_khz =3D context->bw_ctx.dml.vba.=
DRAMSpeed * 1000 / 16;
+
+       if (dc->debug.min_dram_clk_khz > context->bw_ctx.bw.dcn.clk.dramclk=
_khz)
+               context->bw_ctx.bw.dcn.clk.dramclk_khz =3D dc->debug.min_dr=
am_clk_khz;
+
+       context->bw_ctx.bw.dcn.clk.dcfclk_deep_sleep_khz =3D context->bw_ct=
x.dml.vba.DCFCLKDeepSleep * 1000;
+       context->bw_ctx.bw.dcn.clk.fclk_khz =3D context->bw_ctx.dml.vba.Fab=
ricClock * 1000;
+       context->bw_ctx.bw.dcn.clk.p_state_change_support =3D
+               context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][cont=
ext->bw_ctx.dml.vba.maxMpcComb]
+                                                       !=3D dm_dram_clock_=
change_unsupported;
+       context->bw_ctx.bw.dcn.clk.dppclk_khz =3D 0;
+
+       context->bw_ctx.bw.dcn.clk.zstate_support =3D decide_zstate_support=
(dc, context);
+
+       context->bw_ctx.bw.dcn.clk.dtbclk_en =3D is_dtbclk_required(dc, con=
text);
+
+       if (context->bw_ctx.bw.dcn.clk.dispclk_khz < dc->debug.min_disp_clk=
_khz)
+               context->bw_ctx.bw.dcn.clk.dispclk_khz =3D dc->debug.min_di=
sp_clk_khz;
+
+       for (i =3D 0, pipe_idx =3D 0; i < dc->res_pool->pipe_count; i++) {
+               if (!context->res_ctx.pipe_ctx[i].stream)
+                       continue;
+               pipes[pipe_idx].pipe.dest.vstartup_start =3D get_vstartup(&=
context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
+               pipes[pipe_idx].pipe.dest.vupdate_offset =3D get_vupdate_of=
fset(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
+               pipes[pipe_idx].pipe.dest.vupdate_width =3D get_vupdate_wid=
th(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
+               pipes[pipe_idx].pipe.dest.vready_offset =3D get_vready_offs=
et(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
+               context->res_ctx.pipe_ctx[i].det_buffer_size_kb =3D context=
->bw_ctx.dml.ip.det_buffer_size_kbytes;
+               context->res_ctx.pipe_ctx[i].unbounded_req =3D pipes[pipe_i=
dx].pipe.src.unbounded_req_mode;
+
+               if (context->bw_ctx.bw.dcn.clk.dppclk_khz < pipes[pipe_idx]=
.clks_cfg.dppclk_mhz * 1000)
+                       context->bw_ctx.bw.dcn.clk.dppclk_khz =3D pipes[pip=
e_idx].clks_cfg.dppclk_mhz * 1000;
+               context->res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz =3D
+                                               pipes[pipe_idx].clks_cfg.dp=
pclk_mhz * 1000;
+               context->res_ctx.pipe_ctx[i].pipe_dlg_param =3D pipes[pipe_=
idx].pipe.dest;
+               pipe_idx++;
+       }
+       /*save a original dppclock copy*/
+       context->bw_ctx.bw.dcn.clk.bw_dppclk_khz =3D context->bw_ctx.bw.dcn=
.clk.dppclk_khz;
+       context->bw_ctx.bw.dcn.clk.bw_dispclk_khz =3D context->bw_ctx.bw.dc=
n.clk.dispclk_khz;
+       context->bw_ctx.bw.dcn.clk.max_supported_dppclk_khz =3D context->bw=
_ctx.dml.soc.clock_limits[vlevel].dppclk_mhz * 1000;
+       context->bw_ctx.bw.dcn.clk.max_supported_dispclk_khz =3D context->b=
w_ctx.dml.soc.clock_limits[vlevel].dispclk_mhz * 1000;
+
+       context->bw_ctx.bw.dcn.compbuf_size_kb =3D context->bw_ctx.dml.ip.c=
onfig_return_buffer_size_in_kbytes
+                                               - context->bw_ctx.dml.ip.de=
t_buffer_size_kbytes * pipe_idx;
+
+       for (i =3D 0, pipe_idx =3D 0; i < dc->res_pool->pipe_count; i++) {
+               bool cstate_en =3D context->bw_ctx.dml.vba.PrefetchMode[vle=
vel][context->bw_ctx.dml.vba.maxMpcComb] !=3D 2;
+
+               if (!context->res_ctx.pipe_ctx[i].stream)
+                       continue;
+
+               if (dc->ctx->dce_version =3D=3D DCN_VERSION_2_01)
+                       cstate_en =3D false;
+
+               context->bw_ctx.dml.funcs.rq_dlg_get_dlg_reg(&context->bw_c=
tx.dml,
+                               &context->res_ctx.pipe_ctx[i].dlg_regs,
+                               &context->res_ctx.pipe_ctx[i].ttu_regs,
+                               pipes,
+                               pipe_cnt,
+                               pipe_idx,
+                               cstate_en,
+                               context->bw_ctx.bw.dcn.clk.p_state_change_s=
upport,
+                               false, false, true);
+
+               context->bw_ctx.dml.funcs.rq_dlg_get_rq_reg(&context->bw_ct=
x.dml,
+                               &context->res_ctx.pipe_ctx[i].rq_regs,
+                               &pipes[pipe_idx].pipe);
+               pipe_idx++;
+       }
+}
+
+static void swizzle_to_dml_params(enum swizzle_mode_values swizzle,
+                                 unsigned int *sw_mode)
+{
+       switch (swizzle) {
+       case DC_SW_LINEAR:
+               *sw_mode =3D dm_sw_linear;
+               break;
+       case DC_SW_4KB_S:
+               *sw_mode =3D dm_sw_4kb_s;
+               break;
+       case DC_SW_4KB_S_X:
+               *sw_mode =3D dm_sw_4kb_s_x;
+               break;
+       case DC_SW_4KB_D:
+               *sw_mode =3D dm_sw_4kb_d;
+               break;
+       case DC_SW_4KB_D_X:
+               *sw_mode =3D dm_sw_4kb_d_x;
+               break;
+       case DC_SW_64KB_S:
+               *sw_mode =3D dm_sw_64kb_s;
+               break;
+       case DC_SW_64KB_S_X:
+               *sw_mode =3D dm_sw_64kb_s_x;
+               break;
+       case DC_SW_64KB_S_T:
+               *sw_mode =3D dm_sw_64kb_s_t;
+               break;
+       case DC_SW_64KB_D:
+               *sw_mode =3D dm_sw_64kb_d;
+               break;
+       case DC_SW_64KB_D_X:
+               *sw_mode =3D dm_sw_64kb_d_x;
+               break;
+       case DC_SW_64KB_D_T:
+               *sw_mode =3D dm_sw_64kb_d_t;
+               break;
+       case DC_SW_64KB_R_X:
+               *sw_mode =3D dm_sw_64kb_r_x;
+               break;
+       case DC_SW_VAR_S:
+               *sw_mode =3D dm_sw_var_s;
+               break;
+       case DC_SW_VAR_S_X:
+               *sw_mode =3D dm_sw_var_s_x;
+               break;
+       case DC_SW_VAR_D:
+               *sw_mode =3D dm_sw_var_d;
+               break;
+       case DC_SW_VAR_D_X:
+               *sw_mode =3D dm_sw_var_d_x;
+               break;
+       case DC_SW_VAR_R_X:
+               *sw_mode =3D dm_sw_var_r_x;
+               break;
+       default:
+               ASSERT(0); /* Not supported */
+               break;
+       }
+}
+
+int dcn20_populate_dml_pipes_from_context(struct dc *dc,
+                                         struct dc_state *context,
+                                         display_e2e_pipe_params_st *pipes=
,
+                                         bool fast_validate)
+{
+       int pipe_cnt, i;
+       bool synchronized_vblank =3D true;
+       struct resource_context *res_ctx =3D &context->res_ctx;
+
+       dc_assert_fp_enabled();
+
+       for (i =3D 0, pipe_cnt =3D -1; i < dc->res_pool->pipe_count; i++) {
+               if (!res_ctx->pipe_ctx[i].stream)
+                       continue;
+
+               if (pipe_cnt < 0) {
+                       pipe_cnt =3D i;
+                       continue;
+               }
+
+               if (res_ctx->pipe_ctx[pipe_cnt].stream =3D=3D res_ctx->pipe=
_ctx[i].stream)
+                       continue;
+
+               if (dc->debug.disable_timing_sync ||
+                       (!resource_are_streams_timing_synchronizable(
+                               res_ctx->pipe_ctx[pipe_cnt].stream,
+                               res_ctx->pipe_ctx[i].stream) &&
+                       !resource_are_vblanks_synchronizable(
+                               res_ctx->pipe_ctx[pipe_cnt].stream,
+                               res_ctx->pipe_ctx[i].stream))) {
+                       synchronized_vblank =3D false;
+                       break;
+               }
+       }
+
+       for (i =3D 0, pipe_cnt =3D 0; i < dc->res_pool->pipe_count; i++) {
+               struct dc_crtc_timing *timing =3D &res_ctx->pipe_ctx[i].str=
eam->timing;
+               unsigned int v_total;
+               unsigned int front_porch;
+               int output_bpc;
+               struct audio_check aud_check =3D {0};
+
+               if (!res_ctx->pipe_ctx[i].stream)
+                       continue;
+
+               v_total =3D timing->v_total;
+               front_porch =3D timing->v_front_porch;
+
+               /* todo:
+               pipes[pipe_cnt].pipe.src.dynamic_metadata_enable =3D 0;
+               pipes[pipe_cnt].pipe.src.dcc =3D 0;
+               pipes[pipe_cnt].pipe.src.vm =3D 0;*/
+
+               pipes[pipe_cnt].clks_cfg.refclk_mhz =3D dc->res_pool->ref_c=
locks.dchub_ref_clock_inKhz / 1000.0;
+
+               pipes[pipe_cnt].dout.dsc_enable =3D res_ctx->pipe_ctx[i].st=
ream->timing.flags.DSC;
+               /* todo: rotation?*/
+               pipes[pipe_cnt].dout.dsc_slices =3D res_ctx->pipe_ctx[i].st=
ream->timing.dsc_cfg.num_slices_h;
+               if (res_ctx->pipe_ctx[i].stream->use_dynamic_meta) {
+                       pipes[pipe_cnt].pipe.src.dynamic_metadata_enable =
=3D true;
+                       /* 1/2 vblank */
+                       pipes[pipe_cnt].pipe.src.dynamic_metadata_lines_bef=
ore_active =3D
+                               (v_total - timing->v_addressable
+                                       - timing->v_border_top - timing->v_=
border_bottom) / 2;
+                       /* 36 bytes dp, 32 hdmi */
+                       pipes[pipe_cnt].pipe.src.dynamic_metadata_xmit_byte=
s =3D
+                               dc_is_dp_signal(res_ctx->pipe_ctx[i].stream=
->signal) ? 36 : 32;
+               }
+               pipes[pipe_cnt].pipe.src.dcc =3D false;
+               pipes[pipe_cnt].pipe.src.dcc_rate =3D 1;
+               pipes[pipe_cnt].pipe.dest.synchronized_vblank_all_planes =
=3D synchronized_vblank;
+               pipes[pipe_cnt].pipe.dest.hblank_start =3D timing->h_total =
- timing->h_front_porch;
+               pipes[pipe_cnt].pipe.dest.hblank_end =3D pipes[pipe_cnt].pi=
pe.dest.hblank_start
+                               - timing->h_addressable
+                               - timing->h_border_left
+                               - timing->h_border_right;
+               pipes[pipe_cnt].pipe.dest.vblank_start =3D v_total - front_=
porch;
+               pipes[pipe_cnt].pipe.dest.vblank_end =3D pipes[pipe_cnt].pi=
pe.dest.vblank_start
+                               - timing->v_addressable
+                               - timing->v_border_top
+                               - timing->v_border_bottom;
+               pipes[pipe_cnt].pipe.dest.htotal =3D timing->h_total;
+               pipes[pipe_cnt].pipe.dest.vtotal =3D v_total;
+               pipes[pipe_cnt].pipe.dest.hactive =3D
+                       timing->h_addressable + timing->h_border_left + tim=
ing->h_border_right;
+               pipes[pipe_cnt].pipe.dest.vactive =3D
+                       timing->v_addressable + timing->v_border_top + timi=
ng->v_border_bottom;
+               pipes[pipe_cnt].pipe.dest.interlaced =3D timing->flags.INTE=
RLACE;
+               pipes[pipe_cnt].pipe.dest.pixel_rate_mhz =3D timing->pix_cl=
k_100hz/10000.0;
+               if (timing->timing_3d_format =3D=3D TIMING_3D_FORMAT_HW_FRA=
ME_PACKING)
+                       pipes[pipe_cnt].pipe.dest.pixel_rate_mhz *=3D 2;
+               pipes[pipe_cnt].pipe.dest.otg_inst =3D res_ctx->pipe_ctx[i]=
.stream_res.tg->inst;
+               pipes[pipe_cnt].dout.dp_lanes =3D 4;
+               pipes[pipe_cnt].dout.is_virtual =3D 0;
+               pipes[pipe_cnt].pipe.dest.vtotal_min =3D res_ctx->pipe_ctx[=
i].stream->adjust.v_total_min;
+               pipes[pipe_cnt].pipe.dest.vtotal_max =3D res_ctx->pipe_ctx[=
i].stream->adjust.v_total_max;
+               switch (get_num_odm_splits(&res_ctx->pipe_ctx[i])) {
+               case 1:
+                       pipes[pipe_cnt].pipe.dest.odm_combine =3D dm_odm_co=
mbine_mode_2to1;
+                       break;
+               case 3:
+                       pipes[pipe_cnt].pipe.dest.odm_combine =3D dm_odm_co=
mbine_mode_4to1;
+                       break;
+               default:
+                       pipes[pipe_cnt].pipe.dest.odm_combine =3D dm_odm_co=
mbine_mode_disabled;
+               }
+               pipes[pipe_cnt].pipe.src.hsplit_grp =3D res_ctx->pipe_ctx[i=
].pipe_idx;
+               if (res_ctx->pipe_ctx[i].top_pipe && res_ctx->pipe_ctx[i].t=
op_pipe->plane_state
+                               =3D=3D res_ctx->pipe_ctx[i].plane_state) {
+                       struct pipe_ctx *first_pipe =3D res_ctx->pipe_ctx[i=
].top_pipe;
+                       int split_idx =3D 0;
+
+                       while (first_pipe->top_pipe && first_pipe->top_pipe=
->plane_state
+                                       =3D=3D res_ctx->pipe_ctx[i].plane_s=
tate) {
+                               first_pipe =3D first_pipe->top_pipe;
+                               split_idx++;
+                       }
+                       /* Treat 4to1 mpc combine as an mpo of 2 2-to-1 com=
bines */
+                       if (split_idx =3D=3D 0)
+                               pipes[pipe_cnt].pipe.src.hsplit_grp =3D fir=
st_pipe->pipe_idx;
+                       else if (split_idx =3D=3D 1)
+                               pipes[pipe_cnt].pipe.src.hsplit_grp =3D res=
_ctx->pipe_ctx[i].pipe_idx;
+                       else if (split_idx =3D=3D 2)
+                               pipes[pipe_cnt].pipe.src.hsplit_grp =3D res=
_ctx->pipe_ctx[i].top_pipe->pipe_idx;
+               } else if (res_ctx->pipe_ctx[i].prev_odm_pipe) {
+                       struct pipe_ctx *first_pipe =3D res_ctx->pipe_ctx[i=
].prev_odm_pipe;
+
+                       while (first_pipe->prev_odm_pipe)
+                               first_pipe =3D first_pipe->prev_odm_pipe;
+                       pipes[pipe_cnt].pipe.src.hsplit_grp =3D first_pipe-=
>pipe_idx;
+               }
+
+               switch (res_ctx->pipe_ctx[i].stream->signal) {
+               case SIGNAL_TYPE_DISPLAY_PORT_MST:
+               case SIGNAL_TYPE_DISPLAY_PORT:
+                       pipes[pipe_cnt].dout.output_type =3D dm_dp;
+                       break;
+               case SIGNAL_TYPE_EDP:
+                       pipes[pipe_cnt].dout.output_type =3D dm_edp;
+                       break;
+               case SIGNAL_TYPE_HDMI_TYPE_A:
+               case SIGNAL_TYPE_DVI_SINGLE_LINK:
+               case SIGNAL_TYPE_DVI_DUAL_LINK:
+                       pipes[pipe_cnt].dout.output_type =3D dm_hdmi;
+                       break;
+               default:
+                       /* In case there is no signal, set dp with 4 lanes =
to allow max config */
+                       pipes[pipe_cnt].dout.is_virtual =3D 1;
+                       pipes[pipe_cnt].dout.output_type =3D dm_dp;
+                       pipes[pipe_cnt].dout.dp_lanes =3D 4;
+               }
+
+               switch (res_ctx->pipe_ctx[i].stream->timing.display_color_d=
epth) {
+               case COLOR_DEPTH_666:
+                       output_bpc =3D 6;
+                       break;
+               case COLOR_DEPTH_888:
+                       output_bpc =3D 8;
+                       break;
+               case COLOR_DEPTH_101010:
+                       output_bpc =3D 10;
+                       break;
+               case COLOR_DEPTH_121212:
+                       output_bpc =3D 12;
+                       break;
+               case COLOR_DEPTH_141414:
+                       output_bpc =3D 14;
+                       break;
+               case COLOR_DEPTH_161616:
+                       output_bpc =3D 16;
+                       break;
+               case COLOR_DEPTH_999:
+                       output_bpc =3D 9;
+                       break;
+               case COLOR_DEPTH_111111:
+                       output_bpc =3D 11;
+                       break;
+               default:
+                       output_bpc =3D 8;
+                       break;
+               }
+
+               switch (res_ctx->pipe_ctx[i].stream->timing.pixel_encoding)=
 {
+               case PIXEL_ENCODING_RGB:
+               case PIXEL_ENCODING_YCBCR444:
+                       pipes[pipe_cnt].dout.output_format =3D dm_444;
+                       pipes[pipe_cnt].dout.output_bpp =3D output_bpc * 3;
+                       break;
+               case PIXEL_ENCODING_YCBCR420:
+                       pipes[pipe_cnt].dout.output_format =3D dm_420;
+                       pipes[pipe_cnt].dout.output_bpp =3D (output_bpc * 3=
.0) / 2;
+                       break;
+               case PIXEL_ENCODING_YCBCR422:
+                       if (res_ctx->pipe_ctx[i].stream->timing.flags.DSC &=
&
+                           !res_ctx->pipe_ctx[i].stream->timing.dsc_cfg.yc=
bcr422_simple)
+                               pipes[pipe_cnt].dout.output_format =3D dm_n=
422;
+                       else
+                               pipes[pipe_cnt].dout.output_format =3D dm_s=
422;
+                       pipes[pipe_cnt].dout.output_bpp =3D output_bpc * 2;
+                       break;
+               default:
+                       pipes[pipe_cnt].dout.output_format =3D dm_444;
+                       pipes[pipe_cnt].dout.output_bpp =3D output_bpc * 3;
+               }
+
+               if (res_ctx->pipe_ctx[i].stream->timing.flags.DSC)
+                       pipes[pipe_cnt].dout.output_bpp =3D res_ctx->pipe_c=
tx[i].stream->timing.dsc_cfg.bits_per_pixel / 16.0;
+
+               /* todo: default max for now, until there is logic reflecti=
ng this in dc*/
+               pipes[pipe_cnt].dout.dsc_input_bpc =3D 12;
+               /*fill up the audio sample rate (unit in kHz)*/
+               get_audio_check(&res_ctx->pipe_ctx[i].stream->audio_info, &=
aud_check);
+               pipes[pipe_cnt].dout.max_audio_sample_rate =3D aud_check.ma=
x_audiosample_rate / 1000;
+               /*
+                * For graphic plane, cursor number is 1, nv12 is 0
+                * bw calculations due to cursor on/off
+                */
+               if (res_ctx->pipe_ctx[i].plane_state &&
+                               res_ctx->pipe_ctx[i].plane_state->address.t=
ype =3D=3D PLN_ADDR_TYPE_VIDEO_PROGRESSIVE)
+                       pipes[pipe_cnt].pipe.src.num_cursors =3D 0;
+               else
+                       pipes[pipe_cnt].pipe.src.num_cursors =3D dc->dml.ip=
.number_of_cursors;
+
+               pipes[pipe_cnt].pipe.src.cur0_src_width =3D 256;
+               pipes[pipe_cnt].pipe.src.cur0_bpp =3D dm_cur_32bit;
+
+               if (!res_ctx->pipe_ctx[i].plane_state) {
+                       pipes[pipe_cnt].pipe.src.is_hsplit =3D pipes[pipe_c=
nt].pipe.dest.odm_combine !=3D dm_odm_combine_mode_disabled;
+                       pipes[pipe_cnt].pipe.src.source_scan =3D dm_horz;
+                       pipes[pipe_cnt].pipe.src.sw_mode =3D dm_sw_4kb_s;
+                       pipes[pipe_cnt].pipe.src.macro_tile_size =3D dm_64k=
_tile;
+                       pipes[pipe_cnt].pipe.src.viewport_width =3D timing-=
>h_addressable;
+                       if (pipes[pipe_cnt].pipe.src.viewport_width > 1920)
+                               pipes[pipe_cnt].pipe.src.viewport_width =3D=
 1920;
+                       pipes[pipe_cnt].pipe.src.viewport_height =3D timing=
->v_addressable;
+                       if (pipes[pipe_cnt].pipe.src.viewport_height > 1080=
)
+                               pipes[pipe_cnt].pipe.src.viewport_height =
=3D 1080;
+                       pipes[pipe_cnt].pipe.src.surface_height_y =3D pipes=
[pipe_cnt].pipe.src.viewport_height;
+                       pipes[pipe_cnt].pipe.src.surface_width_y =3D pipes[=
pipe_cnt].pipe.src.viewport_width;
+                       pipes[pipe_cnt].pipe.src.surface_height_c =3D pipes=
[pipe_cnt].pipe.src.viewport_height;
+                       pipes[pipe_cnt].pipe.src.surface_width_c =3D pipes[=
pipe_cnt].pipe.src.viewport_width;
+                       pipes[pipe_cnt].pipe.src.data_pitch =3D ((pipes[pip=
e_cnt].pipe.src.viewport_width + 255) / 256) * 256;
+                       pipes[pipe_cnt].pipe.src.source_format =3D dm_444_3=
2;
+                       pipes[pipe_cnt].pipe.dest.recout_width =3D pipes[pi=
pe_cnt].pipe.src.viewport_width; /*vp_width/hratio*/
+                       pipes[pipe_cnt].pipe.dest.recout_height =3D pipes[p=
ipe_cnt].pipe.src.viewport_height; /*vp_height/vratio*/
+                       pipes[pipe_cnt].pipe.dest.full_recout_width =3D pip=
es[pipe_cnt].pipe.dest.recout_width;  /*when is_hsplit !=3D 1*/
+                       pipes[pipe_cnt].pipe.dest.full_recout_height =3D pi=
pes[pipe_cnt].pipe.dest.recout_height; /*when is_hsplit !=3D 1*/
+                       pipes[pipe_cnt].pipe.scale_ratio_depth.lb_depth =3D=
 dm_lb_16;
+                       pipes[pipe_cnt].pipe.scale_ratio_depth.hscl_ratio =
=3D 1.0;
+                       pipes[pipe_cnt].pipe.scale_ratio_depth.vscl_ratio =
=3D 1.0;
+                       pipes[pipe_cnt].pipe.scale_ratio_depth.scl_enable =
=3D 0; /*Lb only or Full scl*/
+                       pipes[pipe_cnt].pipe.scale_taps.htaps =3D 1;
+                       pipes[pipe_cnt].pipe.scale_taps.vtaps =3D 1;
+                       pipes[pipe_cnt].pipe.dest.vtotal_min =3D v_total;
+                       pipes[pipe_cnt].pipe.dest.vtotal_max =3D v_total;
+
+                       if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=3D dm=
_odm_combine_mode_2to1) {
+                               pipes[pipe_cnt].pipe.src.viewport_width /=
=3D 2;
+                               pipes[pipe_cnt].pipe.dest.recout_width /=3D=
 2;
+                       } else if (pipes[pipe_cnt].pipe.dest.odm_combine =
=3D=3D dm_odm_combine_mode_4to1) {
+                               pipes[pipe_cnt].pipe.src.viewport_width /=
=3D 4;
+                               pipes[pipe_cnt].pipe.dest.recout_width /=3D=
 4;
+                       }
+               } else {
+                       struct dc_plane_state *pln =3D res_ctx->pipe_ctx[i]=
.plane_state;
+                       struct scaler_data *scl =3D &res_ctx->pipe_ctx[i].p=
lane_res.scl_data;
+
+                       pipes[pipe_cnt].pipe.src.immediate_flip =3D pln->fl=
ip_immediate;
+                       pipes[pipe_cnt].pipe.src.is_hsplit =3D (res_ctx->pi=
pe_ctx[i].bottom_pipe && res_ctx->pipe_ctx[i].bottom_pipe->plane_state =3D=
=3D pln)
+                                       || (res_ctx->pipe_ctx[i].top_pipe &=
& res_ctx->pipe_ctx[i].top_pipe->plane_state =3D=3D pln)
+                                       || pipes[pipe_cnt].pipe.dest.odm_co=
mbine !=3D dm_odm_combine_mode_disabled;
+
+                       /* stereo is not split */
+                       if (pln->stereo_format =3D=3D PLANE_STEREO_FORMAT_S=
IDE_BY_SIDE ||
+                           pln->stereo_format =3D=3D PLANE_STEREO_FORMAT_T=
OP_AND_BOTTOM) {
+                               pipes[pipe_cnt].pipe.src.is_hsplit =3D fals=
e;
+                               pipes[pipe_cnt].pipe.src.hsplit_grp =3D res=
_ctx->pipe_ctx[i].pipe_idx;
+                       }
+
+                       pipes[pipe_cnt].pipe.src.source_scan =3D pln->rotat=
ion =3D=3D ROTATION_ANGLE_90
+                                       || pln->rotation =3D=3D ROTATION_AN=
GLE_270 ? dm_vert : dm_horz;
+                       pipes[pipe_cnt].pipe.src.viewport_y_y =3D scl->view=
port.y;
+                       pipes[pipe_cnt].pipe.src.viewport_y_c =3D scl->view=
port_c.y;
+                       pipes[pipe_cnt].pipe.src.viewport_width =3D scl->vi=
ewport.width;
+                       pipes[pipe_cnt].pipe.src.viewport_width_c =3D scl->=
viewport_c.width;
+                       pipes[pipe_cnt].pipe.src.viewport_height =3D scl->v=
iewport.height;
+                       pipes[pipe_cnt].pipe.src.viewport_height_c =3D scl-=
>viewport_c.height;
+                       pipes[pipe_cnt].pipe.src.viewport_width_max =3D pln=
->src_rect.width;
+                       pipes[pipe_cnt].pipe.src.viewport_height_max =3D pl=
n->src_rect.height;
+                       pipes[pipe_cnt].pipe.src.surface_width_y =3D pln->p=
lane_size.surface_size.width;
+                       pipes[pipe_cnt].pipe.src.surface_height_y =3D pln->=
plane_size.surface_size.height;
+                       pipes[pipe_cnt].pipe.src.surface_width_c =3D pln->p=
lane_size.chroma_size.width;
+                       pipes[pipe_cnt].pipe.src.surface_height_c =3D pln->=
plane_size.chroma_size.height;
+                       if (pln->format =3D=3D SURFACE_PIXEL_FORMAT_GRPH_RG=
BE_ALPHA
+                                       || pln->format >=3D SURFACE_PIXEL_F=
ORMAT_VIDEO_BEGIN) {
+                               pipes[pipe_cnt].pipe.src.data_pitch =3D pln=
->plane_size.surface_pitch;
+                               pipes[pipe_cnt].pipe.src.data_pitch_c =3D p=
ln->plane_size.chroma_pitch;
+                               pipes[pipe_cnt].pipe.src.meta_pitch =3D pln=
->dcc.meta_pitch;
+                               pipes[pipe_cnt].pipe.src.meta_pitch_c =3D p=
ln->dcc.meta_pitch_c;
+                       } else {
+                               pipes[pipe_cnt].pipe.src.data_pitch =3D pln=
->plane_size.surface_pitch;
+                               pipes[pipe_cnt].pipe.src.meta_pitch =3D pln=
->dcc.meta_pitch;
+                       }
+                       pipes[pipe_cnt].pipe.src.dcc =3D pln->dcc.enable;
+                       pipes[pipe_cnt].pipe.dest.recout_width =3D scl->rec=
out.width;
+                       pipes[pipe_cnt].pipe.dest.recout_height =3D scl->re=
cout.height;
+                       pipes[pipe_cnt].pipe.dest.full_recout_height =3D sc=
l->recout.height;
+                       pipes[pipe_cnt].pipe.dest.full_recout_width =3D scl=
->recout.width;
+                       if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=3D dm=
_odm_combine_mode_2to1)
+                               pipes[pipe_cnt].pipe.dest.full_recout_width=
 *=3D 2;
+                       else if (pipes[pipe_cnt].pipe.dest.odm_combine =3D=
=3D dm_odm_combine_mode_4to1)
+                               pipes[pipe_cnt].pipe.dest.full_recout_width=
 *=3D 4;
+                       else {
+                               struct pipe_ctx *split_pipe =3D res_ctx->pi=
pe_ctx[i].bottom_pipe;
+
+                               while (split_pipe && split_pipe->plane_stat=
e =3D=3D pln) {
+                                       pipes[pipe_cnt].pipe.dest.full_reco=
ut_width +=3D split_pipe->plane_res.scl_data.recout.width;
+                                       split_pipe =3D split_pipe->bottom_p=
ipe;
+                               }
+                               split_pipe =3D res_ctx->pipe_ctx[i].top_pip=
e;
+                               while (split_pipe && split_pipe->plane_stat=
e =3D=3D pln) {
+                                       pipes[pipe_cnt].pipe.dest.full_reco=
ut_width +=3D split_pipe->plane_res.scl_data.recout.width;
+                                       split_pipe =3D split_pipe->top_pipe=
;
+                               }
+                       }
+
+                       pipes[pipe_cnt].pipe.scale_ratio_depth.lb_depth =3D=
 dm_lb_16;
+                       pipes[pipe_cnt].pipe.scale_ratio_depth.hscl_ratio =
=3D (double) scl->ratios.horz.value / (1ULL<<32);
+                       pipes[pipe_cnt].pipe.scale_ratio_depth.hscl_ratio_c=
 =3D (double) scl->ratios.horz_c.value / (1ULL<<32);
+                       pipes[pipe_cnt].pipe.scale_ratio_depth.vscl_ratio =
=3D (double) scl->ratios.vert.value / (1ULL<<32);
+                       pipes[pipe_cnt].pipe.scale_ratio_depth.vscl_ratio_c=
 =3D (double) scl->ratios.vert_c.value / (1ULL<<32);
+                       pipes[pipe_cnt].pipe.scale_ratio_depth.scl_enable =
=3D
+                                       scl->ratios.vert.value !=3D dc_fixp=
t_one.value
+                                       || scl->ratios.horz.value !=3D dc_f=
ixpt_one.value
+                                       || scl->ratios.vert_c.value !=3D dc=
_fixpt_one.value
+                                       || scl->ratios.horz_c.value !=3D dc=
_fixpt_one.value /*Lb only or Full scl*/
+                                       || dc->debug.always_scale; /*suppor=
t always scale*/
+                       pipes[pipe_cnt].pipe.scale_taps.htaps =3D scl->taps=
.h_taps;
+                       pipes[pipe_cnt].pipe.scale_taps.htaps_c =3D scl->ta=
ps.h_taps_c;
+                       pipes[pipe_cnt].pipe.scale_taps.vtaps =3D scl->taps=
.v_taps;
+                       pipes[pipe_cnt].pipe.scale_taps.vtaps_c =3D scl->ta=
ps.v_taps_c;
+
+                       pipes[pipe_cnt].pipe.src.macro_tile_size =3D
+                                       swizzle_mode_to_macro_tile_size(pln=
->tiling_info.gfx9.swizzle);
+                       swizzle_to_dml_params(pln->tiling_info.gfx9.swizzle=
,
+                                       &pipes[pipe_cnt].pipe.src.sw_mode);
+
+                       switch (pln->format) {
+                       case SURFACE_PIXEL_FORMAT_VIDEO_420_YCbCr:
+                       case SURFACE_PIXEL_FORMAT_VIDEO_420_YCrCb:
+                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_420_8;
+                               break;
+                       case SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCbCr:
+                       case SURFACE_PIXEL_FORMAT_VIDEO_420_10bpc_YCrCb:
+                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_420_10;
+                               break;
+                       case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+                       case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
+                       case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
+                       case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
+                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_64;
+                               break;
+                       case SURFACE_PIXEL_FORMAT_GRPH_ARGB1555:
+                       case SURFACE_PIXEL_FORMAT_GRPH_RGB565:
+                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_16;
+                               break;
+                       case SURFACE_PIXEL_FORMAT_GRPH_PALETA_256_COLORS:
+                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_8;
+                               break;
+                       case SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA:
+                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_rgbe_alpha;
+                               break;
+                       default:
+                               pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_32;
+                               break;
+                       }
+               }
+
+               pipe_cnt++;
+       }
+
+       /* populate writeback information */
+       dc->res_pool->funcs->populate_dml_writeback_from_context(dc, res_ct=
x, pipes);
+
+       return pipe_cnt;
+}
+
+void dcn20_calculate_wm(struct dc *dc, struct dc_state *context,
+                       display_e2e_pipe_params_st *pipes,
+                       int *out_pipe_cnt,
+                       int *pipe_split_from,
+                       int vlevel,
+                       bool fast_validate)
+{
+       int pipe_cnt, i, pipe_idx;
+
+       dc_assert_fp_enabled();
+
+       for (i =3D 0, pipe_idx =3D 0, pipe_cnt =3D 0; i < dc->res_pool->pip=
e_count; i++) {
+               if (!context->res_ctx.pipe_ctx[i].stream)
+                       continue;
+
+               pipes[pipe_cnt].clks_cfg.refclk_mhz =3D dc->res_pool->ref_c=
locks.dchub_ref_clock_inKhz / 1000.0;
+               pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D context->bw_ctx.dm=
l.vba.RequiredDISPCLK[vlevel][context->bw_ctx.dml.vba.maxMpcComb];
+
+               if (pipe_split_from[i] < 0) {
+                       pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D
+                                       context->bw_ctx.dml.vba.RequiredDPP=
CLK[vlevel][context->bw_ctx.dml.vba.maxMpcComb][pipe_idx];
+                       if (context->bw_ctx.dml.vba.BlendingAndTiming[pipe_=
idx] =3D=3D pipe_idx)
+                               pipes[pipe_cnt].pipe.dest.odm_combine =3D
+                                               context->bw_ctx.dml.vba.ODM=
CombineEnabled[pipe_idx];
+                       else
+                               pipes[pipe_cnt].pipe.dest.odm_combine =3D 0=
;
+                       pipe_idx++;
+               } else {
+                       pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D
+                                       context->bw_ctx.dml.vba.RequiredDPP=
CLK[vlevel][context->bw_ctx.dml.vba.maxMpcComb][pipe_split_from[i]];
+                       if (context->bw_ctx.dml.vba.BlendingAndTiming[pipe_=
split_from[i]] =3D=3D pipe_split_from[i])
+                               pipes[pipe_cnt].pipe.dest.odm_combine =3D
+                                               context->bw_ctx.dml.vba.ODM=
CombineEnabled[pipe_split_from[i]];
+                       else
+                               pipes[pipe_cnt].pipe.dest.odm_combine =3D 0=
;
+               }
+
+               if (dc->config.forced_clocks) {
+                       pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D context->b=
w_ctx.dml.soc.clock_limits[0].dispclk_mhz;
+                       pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D context->bw=
_ctx.dml.soc.clock_limits[0].dppclk_mhz;
+               }
+               if (dc->debug.min_disp_clk_khz > pipes[pipe_cnt].clks_cfg.d=
ispclk_mhz * 1000)
+                       pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D dc->debug.=
min_disp_clk_khz / 1000.0;
+               if (dc->debug.min_dpp_clk_khz > pipes[pipe_cnt].clks_cfg.dp=
pclk_mhz * 1000)
+                       pipes[pipe_cnt].clks_cfg.dppclk_mhz =3D dc->debug.m=
in_dpp_clk_khz / 1000.0;
+
+               pipe_cnt++;
+       }
+
+       if (pipe_cnt !=3D pipe_idx) {
+               if (dc->res_pool->funcs->populate_dml_pipes)
+                       pipe_cnt =3D dc->res_pool->funcs->populate_dml_pipe=
s(dc,
+                               context, pipes, fast_validate);
+               else
+                       pipe_cnt =3D dcn20_populate_dml_pipes_from_context(=
dc,
+                               context, pipes, fast_validate);
+       }
+
+       *out_pipe_cnt =3D pipe_cnt;
+
+       pipes[0].clks_cfg.voltage =3D vlevel;
+       pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limi=
ts[vlevel].dcfclk_mhz;
+       pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limi=
ts[vlevel].socclk_mhz;
+
+       /* only pipe 0 is read for voltage and dcf/soc clocks */
+       if (vlevel < 1) {
+               pipes[0].clks_cfg.voltage =3D 1;
+               pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[1].dcfclk_mhz;
+               pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[1].socclk_mhz;
+       }
+       context->bw_ctx.bw.dcn.watermarks.b.urgent_ns =3D get_wm_urgent(&co=
ntext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_enter_plus=
_exit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cn=
t) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_exit_ns =
=3D get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.b.pte_meta_urgent_ns =3D get_wm_m=
emory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_nom =3D get_fractio=
n_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_flip =3D get_fracti=
on_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 10=
00;
+       context->bw_ctx.bw.dcn.watermarks.b.urgent_latency_ns =3D get_urgen=
t_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+
+       if (vlevel < 2) {
+               pipes[0].clks_cfg.voltage =3D 2;
+               pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[2].dcfclk_mhz;
+               pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[2].socclk_mhz;
+       }
+       context->bw_ctx.bw.dcn.watermarks.c.urgent_ns =3D get_wm_urgent(&co=
ntext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_enter_plus=
_exit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cn=
t) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_exit_ns =
=3D get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.c.pte_meta_urgent_ns =3D get_wm_m=
emory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_nom =3D get_fractio=
n_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_flip =3D get_fracti=
on_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 10=
00;
+
+       if (vlevel < 3) {
+               pipes[0].clks_cfg.voltage =3D 3;
+               pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[2].dcfclk_mhz;
+               pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.cl=
ock_limits[2].socclk_mhz;
+       }
+       context->bw_ctx.bw.dcn.watermarks.d.urgent_ns =3D get_wm_urgent(&co=
ntext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_enter_plus=
_exit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cn=
t) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_exit_ns =
=3D get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.d.pte_meta_urgent_ns =3D get_wm_m=
emory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_nom =3D get_fractio=
n_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_flip =3D get_fracti=
on_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 10=
00;
+
+       pipes[0].clks_cfg.voltage =3D vlevel;
+       pipes[0].clks_cfg.dcfclk_mhz =3D context->bw_ctx.dml.soc.clock_limi=
ts[vlevel].dcfclk_mhz;
+       pipes[0].clks_cfg.socclk_mhz =3D context->bw_ctx.dml.soc.clock_limi=
ts[vlevel].socclk_mhz;
+       context->bw_ctx.bw.dcn.watermarks.a.urgent_ns =3D get_wm_urgent(&co=
ntext->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_enter_plus=
_exit_ns =3D get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cn=
t) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_exit_ns =
=3D get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns =
=3D get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.a.pte_meta_urgent_ns =3D get_wm_m=
emory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_nom =3D get_fractio=
n_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+       context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_flip =3D get_fracti=
on_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 10=
00;
+}
+
+void dcn20_update_bounding_box(struct dc *dc,
+                              struct _vcs_dpi_soc_bounding_box_st *bb,
+                              struct pp_smu_nv_clock_table *max_clocks,
+                              unsigned int *uclk_states,
+                              unsigned int num_states)
+{
+       struct _vcs_dpi_voltage_scaling_st calculated_states[DC__VOLTAGE_ST=
ATES];
+       int i;
+       int num_calculated_states =3D 0;
+       int min_dcfclk =3D 0;
+
+       dc_assert_fp_enabled();
+
+       if (num_states =3D=3D 0)
+               return;
+
+       memset(calculated_states, 0, sizeof(calculated_states));
+
+       if (dc->bb_overrides.min_dcfclk_mhz > 0)
+               min_dcfclk =3D dc->bb_overrides.min_dcfclk_mhz;
+       else {
+               if (ASICREV_IS_NAVI12_P(dc->ctx->asic_id.hw_internal_rev))
+                       min_dcfclk =3D 310;
+               else
+                       // Accounting for SOC/DCF relationship, we can go a=
s high as
+                       // 506Mhz in Vmin.
+                       min_dcfclk =3D 506;
+       }
+
+       for (i =3D 0; i < num_states; i++) {
+               int min_fclk_required_by_uclk;
+               calculated_states[i].state =3D i;
+               calculated_states[i].dram_speed_mts =3D uclk_states[i] * 16=
 / 1000;
+
+               // FCLK:UCLK ratio is 1.08
+               min_fclk_required_by_uclk =3D div_u64(((unsigned long long)=
uclk_states[i]) * 1080,
+                       1000000);
+
+               calculated_states[i].fabricclk_mhz =3D (min_fclk_required_b=
y_uclk < min_dcfclk) ?
+                               min_dcfclk : min_fclk_required_by_uclk;
+
+               calculated_states[i].socclk_mhz =3D (calculated_states[i].f=
abricclk_mhz > max_clocks->socClockInKhz / 1000) ?
+                               max_clocks->socClockInKhz / 1000 : calculat=
ed_states[i].fabricclk_mhz;
+
+               calculated_states[i].dcfclk_mhz =3D (calculated_states[i].f=
abricclk_mhz > max_clocks->dcfClockInKhz / 1000) ?
+                               max_clocks->dcfClockInKhz / 1000 : calculat=
ed_states[i].fabricclk_mhz;
+
+               calculated_states[i].dispclk_mhz =3D max_clocks->displayClo=
ckInKhz / 1000;
+               calculated_states[i].dppclk_mhz =3D max_clocks->displayCloc=
kInKhz / 1000;
+               calculated_states[i].dscclk_mhz =3D max_clocks->displayCloc=
kInKhz / (1000 * 3);
+
+               calculated_states[i].phyclk_mhz =3D max_clocks->phyClockInK=
hz / 1000;
+
+               num_calculated_states++;
+       }
+
+       calculated_states[num_calculated_states - 1].socclk_mhz =3D max_clo=
cks->socClockInKhz / 1000;
+       calculated_states[num_calculated_states - 1].fabricclk_mhz =3D max_=
clocks->socClockInKhz / 1000;
+       calculated_states[num_calculated_states - 1].dcfclk_mhz =3D max_clo=
cks->dcfClockInKhz / 1000;
+
+       memcpy(bb->clock_limits, calculated_states, sizeof(bb->clock_limits=
));
+       bb->num_states =3D num_calculated_states;
+
+       // Duplicate the last state, DML always an extra state identical to=
 max state to work
+       memcpy(&bb->clock_limits[num_calculated_states], &bb->clock_limits[=
num_calculated_states - 1], sizeof(struct _vcs_dpi_voltage_scaling_st));
+       bb->clock_limits[num_calculated_states].state =3D bb->num_states;
+}
+
+void dcn20_cap_soc_clocks(struct _vcs_dpi_soc_bounding_box_st *bb,
+                         struct pp_smu_nv_clock_table max_clocks)
+{
+       int i;
+
+       dc_assert_fp_enabled();
+
+       // First pass - cap all clocks higher than the reported max
+       for (i =3D 0; i < bb->num_states; i++) {
+               if ((bb->clock_limits[i].dcfclk_mhz > (max_clocks.dcfClockI=
nKhz / 1000))
+                               && max_clocks.dcfClockInKhz !=3D 0)
+                       bb->clock_limits[i].dcfclk_mhz =3D (max_clocks.dcfC=
lockInKhz / 1000);
+
+               if ((bb->clock_limits[i].dram_speed_mts > (max_clocks.uCloc=
kInKhz / 1000) * 16)
+                                               && max_clocks.uClockInKhz !=
=3D 0)
+                       bb->clock_limits[i].dram_speed_mts =3D (max_clocks.=
uClockInKhz / 1000) * 16;
+
+               if ((bb->clock_limits[i].fabricclk_mhz > (max_clocks.fabric=
ClockInKhz / 1000))
+                                               && max_clocks.fabricClockIn=
Khz !=3D 0)
+                       bb->clock_limits[i].fabricclk_mhz =3D (max_clocks.f=
abricClockInKhz / 1000);
+
+               if ((bb->clock_limits[i].dispclk_mhz > (max_clocks.displayC=
lockInKhz / 1000))
+                                               && max_clocks.displayClockI=
nKhz !=3D 0)
+                       bb->clock_limits[i].dispclk_mhz =3D (max_clocks.dis=
playClockInKhz / 1000);
+
+               if ((bb->clock_limits[i].dppclk_mhz > (max_clocks.dppClockI=
nKhz / 1000))
+                                               && max_clocks.dppClockInKhz=
 !=3D 0)
+                       bb->clock_limits[i].dppclk_mhz =3D (max_clocks.dppC=
lockInKhz / 1000);
+
+               if ((bb->clock_limits[i].phyclk_mhz > (max_clocks.phyClockI=
nKhz / 1000))
+                                               && max_clocks.phyClockInKhz=
 !=3D 0)
+                       bb->clock_limits[i].phyclk_mhz =3D (max_clocks.phyC=
lockInKhz / 1000);
+
+               if ((bb->clock_limits[i].socclk_mhz > (max_clocks.socClockI=
nKhz / 1000))
+                                               && max_clocks.socClockInKhz=
 !=3D 0)
+                       bb->clock_limits[i].socclk_mhz =3D (max_clocks.socC=
lockInKhz / 1000);
+
+               if ((bb->clock_limits[i].dscclk_mhz > (max_clocks.dscClockI=
nKhz / 1000))
+                                               && max_clocks.dscClockInKhz=
 !=3D 0)
+                       bb->clock_limits[i].dscclk_mhz =3D (max_clocks.dscC=
lockInKhz / 1000);
+       }
+
+       // Second pass - remove all duplicate clock states
+       for (i =3D bb->num_states - 1; i > 1; i--) {
+               bool duplicate =3D true;
+
+               if (bb->clock_limits[i-1].dcfclk_mhz !=3D bb->clock_limits[=
i].dcfclk_mhz)
+                       duplicate =3D false;
+               if (bb->clock_limits[i-1].dispclk_mhz !=3D bb->clock_limits=
[i].dispclk_mhz)
+                       duplicate =3D false;
+               if (bb->clock_limits[i-1].dppclk_mhz !=3D bb->clock_limits[=
i].dppclk_mhz)
+                       duplicate =3D false;
+               if (bb->clock_limits[i-1].dram_speed_mts !=3D bb->clock_lim=
its[i].dram_speed_mts)
+                       duplicate =3D false;
+               if (bb->clock_limits[i-1].dscclk_mhz !=3D bb->clock_limits[=
i].dscclk_mhz)
+                       duplicate =3D false;
+               if (bb->clock_limits[i-1].fabricclk_mhz !=3D bb->clock_limi=
ts[i].fabricclk_mhz)
+                       duplicate =3D false;
+               if (bb->clock_limits[i-1].phyclk_mhz !=3D bb->clock_limits[=
i].phyclk_mhz)
+                       duplicate =3D false;
+               if (bb->clock_limits[i-1].socclk_mhz !=3D bb->clock_limits[=
i].socclk_mhz)
+                       duplicate =3D false;
+
+               if (duplicate)
+                       bb->num_states--;
+       }
+}
+
+void dcn20_patch_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_=
box_st *bb)
+{
+       dc_assert_fp_enabled();
+
+       if ((int)(bb->sr_exit_time_us * 1000) !=3D dc->bb_overrides.sr_exit=
_time_ns
+                       && dc->bb_overrides.sr_exit_time_ns) {
+               bb->sr_exit_time_us =3D dc->bb_overrides.sr_exit_time_ns / =
1000.0;
+       }
+
+       if ((int)(bb->sr_enter_plus_exit_time_us * 1000)
+                               !=3D dc->bb_overrides.sr_enter_plus_exit_ti=
me_ns
+                       && dc->bb_overrides.sr_enter_plus_exit_time_ns) {
+               bb->sr_enter_plus_exit_time_us =3D
+                               dc->bb_overrides.sr_enter_plus_exit_time_ns=
 / 1000.0;
+       }
+
+       if ((int)(bb->urgent_latency_us * 1000) !=3D dc->bb_overrides.urgen=
t_latency_ns
+                       && dc->bb_overrides.urgent_latency_ns) {
+               bb->urgent_latency_us =3D dc->bb_overrides.urgent_latency_n=
s / 1000.0;
+       }
+
+       if ((int)(bb->dram_clock_change_latency_us * 1000)
+                               !=3D dc->bb_overrides.dram_clock_change_lat=
ency_ns
+                       && dc->bb_overrides.dram_clock_change_latency_ns) {
+               bb->dram_clock_change_latency_us =3D
+                               dc->bb_overrides.dram_clock_change_latency_=
ns / 1000.0;
+       }
+
+       if ((int)(bb->dummy_pstate_latency_us * 1000)
+                               !=3D dc->bb_overrides.dummy_clock_change_la=
tency_ns
+                       && dc->bb_overrides.dummy_clock_change_latency_ns) =
{
+               bb->dummy_pstate_latency_us =3D
+                               dc->bb_overrides.dummy_clock_change_latency=
_ns / 1000.0;
+       }
+}
+
+static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_sta=
te *context,
+               bool fast_validate)
+{
+       bool out =3D false;
+
+       BW_VAL_TRACE_SETUP();
+
+       int vlevel =3D 0;
+       int pipe_split_from[MAX_PIPES];
+       int pipe_cnt =3D 0;
+       display_e2e_pipe_params_st *pipes =3D kzalloc(dc->res_pool->pipe_co=
unt * sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
+       DC_LOGGER_INIT(dc->ctx->logger);
+
+       BW_VAL_TRACE_COUNT();
+
+       out =3D dcn20_fast_validate_bw(dc, context, pipes, &pipe_cnt, pipe_=
split_from, &vlevel, fast_validate);
+
+       if (pipe_cnt =3D=3D 0)
+               goto validate_out;
+
+       if (!out)
+               goto validate_fail;
+
+       BW_VAL_TRACE_END_VOLTAGE_LEVEL();
+
+       if (fast_validate) {
+               BW_VAL_TRACE_SKIP(fast);
+               goto validate_out;
+       }
+
+       dcn20_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, =
vlevel, fast_validate);
+       dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
+
+       BW_VAL_TRACE_END_WATERMARKS();
+
+       goto validate_out;
+
+validate_fail:
+       DC_LOG_WARNING("Mode Validation Warning: %s failed validation.\n",
+               dml_get_status_message(context->bw_ctx.dml.vba.ValidationSt=
atus[context->bw_ctx.dml.vba.soc.num_states]));
+
+       BW_VAL_TRACE_SKIP(fail);
+       out =3D false;
+
+validate_out:
+       kfree(pipes);
+
+       BW_VAL_TRACE_FINISH();
+
+       return out;
+}
+
+bool dcn20_validate_bandwidth_fp(struct dc *dc,
+                                struct dc_state *context,
+                                bool fast_validate)
+{
+       bool voltage_supported =3D false;
+       bool full_pstate_supported =3D false;
+       bool dummy_pstate_supported =3D false;
+       double p_state_latency_us;
+
+       dc_assert_fp_enabled();
+
+       p_state_latency_us =3D context->bw_ctx.dml.soc.dram_clock_change_la=
tency_us;
+       context->bw_ctx.dml.soc.disable_dram_clock_change_vactive_support =
=3D
+               dc->debug.disable_dram_clock_change_vactive_support;
+       context->bw_ctx.dml.soc.allow_dram_clock_one_display_vactive =3D
+               dc->debug.enable_dram_clock_change_one_display_vactive;
+
+       /*Unsafe due to current pipe merge and split logic*/
+       ASSERT(context !=3D dc->current_state);
+
+       if (fast_validate) {
+               return dcn20_validate_bandwidth_internal(dc, context, true)=
;
+       }
+
+       // Best case, we support full UCLK switch latency
+       voltage_supported =3D dcn20_validate_bandwidth_internal(dc, context=
, false);
+       full_pstate_supported =3D context->bw_ctx.bw.dcn.clk.p_state_change=
_support;
+
+       if (context->bw_ctx.dml.soc.dummy_pstate_latency_us =3D=3D 0 ||
+               (voltage_supported && full_pstate_supported)) {
+               context->bw_ctx.bw.dcn.clk.p_state_change_support =3D full_=
pstate_supported;
+               goto restore_dml_state;
+       }
+
+       // Fallback: Try to only support G6 temperature read latency
+       context->bw_ctx.dml.soc.dram_clock_change_latency_us =3D context->b=
w_ctx.dml.soc.dummy_pstate_latency_us;
+
+       voltage_supported =3D dcn20_validate_bandwidth_internal(dc, context=
, false);
+       dummy_pstate_supported =3D context->bw_ctx.bw.dcn.clk.p_state_chang=
e_support;
+
+       if (voltage_supported && (dummy_pstate_supported || !(context->stre=
am_count))) {
+               context->bw_ctx.bw.dcn.clk.p_state_change_support =3D false=
;
+               goto restore_dml_state;
+       }
+
+       // ERROR: fallback is supposed to always work.
+       ASSERT(false);
+
+restore_dml_state:
+       context->bw_ctx.dml.soc.dram_clock_change_latency_us =3D p_state_la=
tency_us;
+       return voltage_supported;
+}
+
+void dcn20_fpu_set_wm_ranges(int i,
+                            struct pp_smu_wm_range_sets *ranges,
+                            struct _vcs_dpi_soc_bounding_box_st *loaded_bb=
)
+{
+       dc_assert_fp_enabled();
+
+       ranges->reader_wm_sets[i].min_fill_clk_mhz =3D (i > 0) ? (loaded_bb=
->clock_limits[i - 1].dram_speed_mts / 16) + 1 : 0;
+       ranges->reader_wm_sets[i].max_fill_clk_mhz =3D loaded_bb->clock_lim=
its[i].dram_speed_mts / 16;
+}
+
+void dcn20_fpu_adjust_dppclk(struct vba_vars_st *v,
+                            int vlevel,
+                            int max_mpc_comb,
+                            int pipe_idx,
+                            bool is_validating_bw)
+{
+       dc_assert_fp_enabled();
+
+       if (is_validating_bw)
+               v->RequiredDPPCLK[vlevel][max_mpc_comb][pipe_idx] *=3D 2;
+       else
+               v->RequiredDPPCLK[vlevel][max_mpc_comb][pipe_idx] /=3D 2;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h b/drivers=
/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
index 36f26126d574..6b1f4126bc88 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
@@ -23,6 +23,7 @@
  * Authors: AMD
  *
  */
+#include "core_types.h"

 #ifndef __DCN20_FPU_H__
 #define __DCN20_FPU_H__
@@ -30,5 +31,44 @@
 void dcn20_populate_dml_writeback_from_context(struct dc *dc,
                                                struct resource_context *re=
s_ctx,
                                                display_e2e_pipe_params_st =
*pipes);
-
+void dcn20_fpu_set_wb_arb_params(struct mcif_arb_params *wb_arb_params,
+                                struct dc_state *context,
+                                display_e2e_pipe_params_st *pipes,
+                                int pipe_cnt, int i);
+void dcn20_calculate_dlg_params(struct dc *dc,
+                               struct dc_state *context,
+                               display_e2e_pipe_params_st *pipes,
+                               int pipe_cnt,
+                               int vlevel);
+int dcn20_populate_dml_pipes_from_context(struct dc *dc,
+                                         struct dc_state *context,
+                                         display_e2e_pipe_params_st *pipes=
,
+                                         bool fast_validate);
+void dcn20_calculate_wm(struct dc *dc,
+                       struct dc_state *context,
+                       display_e2e_pipe_params_st *pipes,
+                       int *out_pipe_cnt,
+                       int *pipe_split_from,
+                       int vlevel,
+                       bool fast_validate);
+void dcn20_cap_soc_clocks(struct _vcs_dpi_soc_bounding_box_st *bb,
+                         struct pp_smu_nv_clock_table max_clocks);
+void dcn20_update_bounding_box(struct dc *dc,
+                              struct _vcs_dpi_soc_bounding_box_st *bb,
+                              struct pp_smu_nv_clock_table *max_clocks,
+                              unsigned int *uclk_states,
+                              unsigned int num_states);
+void dcn20_patch_bounding_box(struct dc *dc,
+                             struct _vcs_dpi_soc_bounding_box_st *bb);
+bool dcn20_validate_bandwidth_fp(struct dc *dc,
+                                struct dc_state *context,
+                                bool fast_validate);
+void dcn20_fpu_set_wm_ranges(int i,
+                            struct pp_smu_wm_range_sets *ranges,
+                            struct _vcs_dpi_soc_bounding_box_st *loaded_bb=
);
+void dcn20_fpu_adjust_dppclk(struct vba_vars_st *v,
+                            int vlevel,
+                            int max_mpc_comb,
+                            int pipe_idx,
+                            bool is_validating_bw);
 #endif /* __DCN20_FPU_H__ */
--
2.34.1


--_000_BY5PR12MB42119C940C7070B6DE69B2A9FB3C9BY5PR12MB4211namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Melissa,&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for the new update and added your changes.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jasdeep&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Melissa Wen &lt;mwen@=
igalia.com&gt;<br>
<b>Sent:</b> February 23, 2022 6:05 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;; Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Li, Sun peng (Leo) &lt;S=
unpeng.Li@amd.com&gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;;
 Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &l=
t;Christian.Koenig@amd.com&gt;; Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;; air=
lied@linux.ie &lt;airlied@linux.ie&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch=
&gt;<br>
<b>Cc:</b> Laktyushkin, Dmytro &lt;Dmytro.Laktyushkin@amd.com&gt;; Dhillon,=
 Jasdeep &lt;Jasdeep.Dhillon@amd.com&gt;; Zhuo, Qingqing (Lillian) &lt;Qing=
qing.Zhuo@amd.com&gt;; Melissa Wen &lt;mwen@igalia.com&gt;; linux-kernel@vg=
er.kernel.org &lt;linux-kernel@vger.kernel.org&gt;<br>
<b>Subject:</b> [PATCH v2] drm/amd/display: move FPU-related code from dcn2=
0 to dml folder</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Move parts of dcn20 code that uses FPU to dml fold=
er. It aims to isolate<br>
FPU operations as described by series:<br>
<br>
drm/amd/display: Introduce FPU directory inside DC<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fpatchwork.freedesktop.org%2Fseries%2F93042%2F&amp;amp;data=3D04%7C01%7C=
Jasdeep.Dhillon%40amd.com%7Cdf9863db496249b48b6f08d9f7210654%7C3dd8961fe488=
4e608e11a82d994e183d%7C0%7C0%7C637812543530752899%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&am=
p;amp;sdata=3DMcy8dEkii67NyQoxaP0%2F8AjFYDhCZgqlm%2BGxAPo1OQ4%3D&amp;amp;re=
served=3D0">https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fpatchwork.freedesktop.org%2Fseries%2F93042%2F&amp;amp;data=3D04%7C01%7=
CJasdeep.Dhillon%40amd.com%7Cdf9863db496249b48b6f08d9f7210654%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637812543530752899%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&a=
mp;amp;sdata=3DMcy8dEkii67NyQoxaP0%2F8AjFYDhCZgqlm%2BGxAPo1OQ4%3D&amp;amp;r=
eserved=3D0</a><br>
<br>
This patch moves the following functions from dcn20_resource to<br>
dml/dcn20_fpu and calls of public functions in dcn20_resource are<br>
wrapped by DC_FP_START/END():<br>
<br>
- void dcn20_populate_dml_writeback_from_context<br>
- static bool is_dtbclk_required()<br>
- static enum dcn_zstate_support_state()<br>
- void dcn20_calculate_dlg_params()<br>
- static void swizzle_to_dml_params()<br>
- int dcn20_populate_dml_pipes_from_context()<br>
- void dcn20_calculate_wm()<br>
- void dcn20_cap_soc_clocks()<br>
- void dcn20_update_bounding_box()<br>
- void dcn20_patch_bounding_box()<br>
- bool dcn20_validate_bandwidth_fp()<br>
<br>
This movement also affects dcn21/30/31, as dcn20_calculate_dlg_params()<br>
is used by them. For this reason, I included dcn20_fpu headers in<br>
dcn20_resource headers to make dcn20_calculate_dlg_params() visible to<br>
dcn21/30/31.<br>
<br>
Three new functions are created to isolate well-delimited FPU<br>
operations:<br>
<br>
- void dcn20_fpu_set_wb_arb_params(): set cli_watermark,<br>
&nbsp; pstate_watermark and time_per_pixel from wb_arb_params (struct<br>
mcif_arb_params), since those uses FPU operations on double types:<br>
WritebackUrgentWatermark, WritebackDRAMClockChangeWatermark, '16.0'.<br>
- void dcn20_fpu_set_wm_ranges(): set min_fill_clk_mhz and<br>
&nbsp; max_fill_clk_mhz involves FPU calcs on dram_speed_mts (double type);=
<br>
- void dcn20_fpu_adjust_dppclk(): adjust operation on RequiredDPPCLK<br>
&nbsp; that is a double.<br>
<br>
--<br>
<br>
v2:<br>
&nbsp;- besides dcn20_resource, dcn20_calculate_dlg_params() is used in<br>
&nbsp;&nbsp; dcn[21/30/31]_resource and therefore it needs to be wrapped by=
<br>
&nbsp;&nbsp; DC_FP_START/END wherever it is called, as verified by<br>
&nbsp;&nbsp; dc_assert_fp_enabled.<br>
<br>
Signed-off-by: Melissa Wen &lt;mwen@igalia.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/dc/dcn20/Makefile |&nbsp;&nbsp; 25 -<br>
&nbsp;.../drm/amd/display/dc/dcn20/dcn20_resource.c | 1370 +---------------=
<br>
&nbsp;.../drm/amd/display/dc/dcn20/dcn20_resource.h |&nbsp;&nbsp; 30 +-<br>
&nbsp;.../drm/amd/display/dc/dcn21/dcn21_resource.c |&nbsp;&nbsp;&nbsp; 2 +=
<br>
&nbsp;.../drm/amd/display/dc/dcn30/dcn30_resource.c |&nbsp;&nbsp;&nbsp; 2 +=
<br>
&nbsp;.../drm/amd/display/dc/dcn31/dcn31_resource.c |&nbsp;&nbsp;&nbsp; 2 +=
<br>
&nbsp;.../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c&nbsp; | 1385 +++++++++++=
++++++<br>
&nbsp;.../drm/amd/display/dc/dml/dcn20/dcn20_fpu.h&nbsp; |&nbsp;&nbsp; 42 +=
-<br>
&nbsp;8 files changed, 1457 insertions(+), 1401 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile b/drivers/gpu/dr=
m/amd/display/dc/dcn20/Makefile<br>
index 5fcaf78334ff..abaed2121feb 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile<br>
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile<br>
@@ -9,31 +9,6 @@ DCN20 =3D dcn20_resource.o dcn20_init.o dcn20_hwseq.o dcn2=
0_dpp.o dcn20_dpp_cm.o d<br>
&nbsp;<br>
&nbsp;DCN20 +=3D dcn20_dsc.o<br>
&nbsp;<br>
-ifdef CONFIG_X86<br>
-CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -msse<br>
-endif<br>
-<br>
-ifdef CONFIG_PPC64<br>
-CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -maltivec=
<br>
-endif<br>
-<br>
-ifdef CONFIG_CC_IS_GCC<br>
-ifeq ($(call cc-ifversion, -lt, 0701, y), y)<br>
-IS_OLD_GCC =3D 1<br>
-endif<br>
-endif<br>
-<br>
-ifdef CONFIG_X86<br>
-ifdef IS_OLD_GCC<br>
-# Stack alignment mismatch, proceed with caution.<br>
-# GCC &lt; 7.1 cannot compile code using `double` and -mpreferred-stack-bo=
undary=3D3<br>
-# (8B stack alignment).<br>
-CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o +=3D -mpreferred-stack-boun=
dary=3D4<br>
-else<br>
-CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o +=3D -msse2<br>
-endif<br>
-endif<br>
-<br>
&nbsp;AMD_DAL_DCN20 =3D $(addprefix $(AMDDALPATH)/dc/dcn20/,$(DCN20))<br>
&nbsp;<br>
&nbsp;AMD_DISPLAY_FILES +=3D $(AMD_DAL_DCN20)<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/driver=
s/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c<br>
index dfe2e1c25a26..63c50bee0144 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c<br>
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c<br>
@@ -63,7 +63,6 @@<br>
&nbsp;#include &quot;dcn20_dccg.h&quot;<br>
&nbsp;#include &quot;dcn20_vmid.h&quot;<br>
&nbsp;#include &quot;dc_link_ddc.h&quot;<br>
-#include &quot;dc_link_dp.h&quot;<br>
&nbsp;#include &quot;dce/dce_panel_cntl.h&quot;<br>
&nbsp;<br>
&nbsp;#include &quot;navi10_ip_offset.h&quot;<br>
@@ -93,367 +92,6 @@<br>
&nbsp;<br>
&nbsp;#define DC_LOGGER_INIT(logger)<br>
&nbsp;<br>
-struct _vcs_dpi_ip_params_st dcn2_0_ip =3D {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .odm_capable =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .gpuvm_enable =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hostvm_enable =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .gpuvm_max_page_table_levels =3D 4,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hostvm_max_page_table_levels =3D 4,<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hostvm_cached_page_table_levels =3D =
0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pte_group_size_bytes =3D 2048,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_dsc =3D 6,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .rob_buffer_size_kbytes =3D 168,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .det_buffer_size_kbytes =3D 164,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpte_buffer_size_in_pte_reqs_luma =
=3D 84,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pde_proc_buffer_size_64k_reqs =3D 48=
,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpp_output_buffer_pixels =3D 2560,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .opp_output_buffer_lines =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pixel_chunk_size_kbytes =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pte_chunk_size_kbytes =3D 2,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .meta_chunk_size_kbytes =3D 2,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_chunk_size_kbytes =3D 2,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .line_buffer_size_bits =3D 789504,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .is_line_buffer_bpp_fixed =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .line_buffer_fixed_bpp =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcc_supported =3D true,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_line_buffer_lines =3D 12,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_luma_buffer_size_kbytes =
=3D 12,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_chroma_buffer_size_kbytes =
=3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_chroma_line_buffer_width_p=
ixels =3D 4,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_hscl_ratio =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_vscl_ratio =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_min_hscl_ratio =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_min_vscl_ratio =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_hscl_taps =3D 12,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_vscl_taps =3D 12,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_line_buffer_luma_buffer_si=
ze =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_line_buffer_chroma_buffer_=
size =3D 14643,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cursor_buffer_size =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cursor_chunk_size =3D 2,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_num_otg =3D 6,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_num_dpp =3D 6,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_num_wb =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_dchub_pscl_bw_pix_per_clk =3D 4,=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pscl_lb_bw_pix_per_clk =3D 2,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_lb_vscl_bw_pix_per_clk =3D 4,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_vscl_hscl_bw_pix_per_clk =3D 4,<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_hscl_ratio =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_vscl_ratio =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hscl_mults =3D 4,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vscl_mults =3D 4,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_hscl_taps =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_vscl_taps =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_ramp_margin_percent =3D 1,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .underscan_factor =3D 1.10,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .min_vblank_lines =3D 32, //<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_subtotal =3D 77, //<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_scl_lb_only =3D 16,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_scl =3D 50,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_cnvc_formatter =3D 8,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_cnvc_cursor =3D 6,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_delay_subtotal =3D 87, //<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_cstate_latency =3D 10, // SRE=
xitTime<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_inter_dcn_tile_repeaters =3D 8,<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_supported =3D true,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_fill_bw_overhead_percent =3D 10.=
0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_fill_constant_bytes =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .number_of_cursors =3D 1,<br>
-};<br>
-<br>
-static struct _vcs_dpi_ip_params_st dcn2_0_nv14_ip =3D {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .odm_capable =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .gpuvm_enable =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hostvm_enable =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .gpuvm_max_page_table_levels =3D 4,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hostvm_max_page_table_levels =3D 4,<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hostvm_cached_page_table_levels =3D =
0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_dsc =3D 5,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .rob_buffer_size_kbytes =3D 168,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .det_buffer_size_kbytes =3D 164,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpte_buffer_size_in_pte_reqs_luma =
=3D 84,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpte_buffer_size_in_pte_reqs_chroma =
=3D 42,//todo<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpp_output_buffer_pixels =3D 2560,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .opp_output_buffer_lines =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pixel_chunk_size_kbytes =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pte_enable =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_page_table_levels =3D 4,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pte_chunk_size_kbytes =3D 2,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .meta_chunk_size_kbytes =3D 2,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_chunk_size_kbytes =3D 2,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .line_buffer_size_bits =3D 789504,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .is_line_buffer_bpp_fixed =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .line_buffer_fixed_bpp =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcc_supported =3D true,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_line_buffer_lines =3D 12,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_luma_buffer_size_kbytes =
=3D 12,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_chroma_buffer_size_kbytes =
=3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_chroma_line_buffer_width_p=
ixels =3D 4,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_hscl_ratio =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_vscl_ratio =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_min_hscl_ratio =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_min_vscl_ratio =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_hscl_taps =3D 12,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_vscl_taps =3D 12,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_line_buffer_luma_buffer_si=
ze =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_line_buffer_chroma_buffer_=
size =3D 14643,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cursor_buffer_size =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cursor_chunk_size =3D 2,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_num_otg =3D 5,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_num_dpp =3D 5,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_num_wb =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_dchub_pscl_bw_pix_per_clk =3D 4,=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pscl_lb_bw_pix_per_clk =3D 2,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_lb_vscl_bw_pix_per_clk =3D 4,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_vscl_hscl_bw_pix_per_clk =3D 4,<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_hscl_ratio =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_vscl_ratio =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hscl_mults =3D 4,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vscl_mults =3D 4,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_hscl_taps =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_vscl_taps =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_ramp_margin_percent =3D 1,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .underscan_factor =3D 1.10,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .min_vblank_lines =3D 32, //<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_subtotal =3D 77, //<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_scl_lb_only =3D 16,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_scl =3D 50,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_cnvc_formatter =3D 8,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_cnvc_cursor =3D 6,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_delay_subtotal =3D 87, //<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_cstate_latency =3D 10, // SRE=
xitTime<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_inter_dcn_tile_repeaters =3D 8,<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_supported =3D true,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_fill_bw_overhead_percent =3D 10.=
0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_fill_constant_bytes =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ptoi_supported =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .number_of_cursors =3D 1,<br>
-};<br>
-<br>
-static struct _vcs_dpi_soc_bounding_box_st dcn2_0_soc =3D {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Defaults that get patched on drive=
r load from firmware. */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .clock_limits =3D {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 560.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 560.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 513.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 513.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 540.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 560.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 171.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 8960.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 694.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 694.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 642.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 642.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 600.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 694.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 214.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 11104.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 2,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 875.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 875.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 734.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 734.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 875.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 245.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 14000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 3,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 1000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 1000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 1100.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 1100.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 1000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 367.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 16000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 4,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 1200.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 1200.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 1284.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 1284.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 1200.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 428.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 16000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*Extra state, n=
o dispclk ramping*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 5,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 1200.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 1200.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 1284.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 1284.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 1200.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 428.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 16000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_states =3D 5,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sr_exit_time_us =3D 8.6,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sr_enter_plus_exit_time_us =3D 10.9,=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_us =3D 4.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_pixel_data_only_us =
=3D 4.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_pixel_mixed_with_vm_d=
ata_us =3D 4.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_vm_data_only_us =3D 4=
.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_pixel_only_bytes =3D 4096,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_pixel_and_vm_bytes =3D 4096,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_vm_only_bytes =3D 4096,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pct_ideal_dram_sdp_bw_after_urgent_p=
ixel_only =3D 40.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pct_ideal_dram_sdp_bw_after_urgent_p=
ixel_and_vm =3D 40.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pct_ideal_dram_sdp_bw_after_urgent_v=
m_only =3D 40.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_avg_sdp_bw_use_normal_percent =
=3D 40.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_avg_dram_bw_use_normal_percent =
=3D 40.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_latency_us =3D 12.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ideal_dram_bw_after_urgent_percent =
=3D 40.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_request_size_bytes =3D 256,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_channel_width_bytes =3D 2,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabric_datapath_to_dcn_data_return_b=
ytes =3D 64,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcn_downspread_percent =3D 0.5,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .downspread_percent =3D 0.38,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_page_open_time_ns =3D 50.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_rw_turnaround_time_ns =3D 17.5,=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_return_buffer_per_channel_bytes=
 =3D 8192,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .round_trip_ping_latency_dcfclk_cycle=
s =3D 131,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_bytes =3D 256,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .channel_interleave_bytes =3D 256,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_banks =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_chans =3D 16,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vmm_page_size_bytes =3D 4096,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_clock_change_latency_us =3D 404=
.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dummy_pstate_latency_us =3D 5.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_dram_clock_change_latency_=
us =3D 23.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .return_bus_width_bytes =3D 64,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_dppclk_vco_speed_mhz =3D 385=
0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_bus_transport_time_us =3D 20,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_xbuf_latency_tolerance_us =3D 4,=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .use_urgent_burst_bw =3D 0<br>
-};<br>
-<br>
-static struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc =3D {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .clock_limits =3D {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 560.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 560.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 513.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 513.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 540.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 560.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 171.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 8960.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 694.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 694.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 642.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 642.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 600.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 694.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 214.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 11104.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 2,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 875.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 875.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 734.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 734.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 875.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 245.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 14000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 3,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 1000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 1000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 1100.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 1100.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 1000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 367.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 16000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 4,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 1200.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 1200.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 1284.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 1284.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 1200.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 428.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 16000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*Extra state, n=
o dispclk ramping*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 5,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 1200.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 1200.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 1284.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 1284.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 1200.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 428.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 16000.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; },<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_states =3D 5,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sr_exit_time_us =3D 11.6,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sr_enter_plus_exit_time_us =3D 13.9,=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_us =3D 4.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_pixel_data_only_us =
=3D 4.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_pixel_mixed_with_vm_d=
ata_us =3D 4.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_vm_data_only_us =3D 4=
.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_pixel_only_bytes =3D 4096,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_pixel_and_vm_bytes =3D 4096,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_vm_only_bytes =3D 4096,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pct_ideal_dram_sdp_bw_after_urgent_p=
ixel_only =3D 40.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pct_ideal_dram_sdp_bw_after_urgent_p=
ixel_and_vm =3D 40.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pct_ideal_dram_sdp_bw_after_urgent_v=
m_only =3D 40.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_avg_sdp_bw_use_normal_percent =
=3D 40.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_avg_dram_bw_use_normal_percent =
=3D 40.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_latency_us =3D 12.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ideal_dram_bw_after_urgent_percent =
=3D 40.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_request_size_bytes =3D 256,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_channel_width_bytes =3D 2,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabric_datapath_to_dcn_data_return_b=
ytes =3D 64,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcn_downspread_percent =3D 0.5,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .downspread_percent =3D 0.38,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_page_open_time_ns =3D 50.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_rw_turnaround_time_ns =3D 17.5,=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_return_buffer_per_channel_bytes=
 =3D 8192,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .round_trip_ping_latency_dcfclk_cycle=
s =3D 131,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_bytes =3D 256,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .channel_interleave_bytes =3D 256,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_banks =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_chans =3D 8,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vmm_page_size_bytes =3D 4096,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_clock_change_latency_us =3D 404=
.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dummy_pstate_latency_us =3D 5.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_dram_clock_change_latency_=
us =3D 23.0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .return_bus_width_bytes =3D 64,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_dppclk_vco_speed_mhz =3D 385=
0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_bus_transport_time_us =3D 20,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_xbuf_latency_tolerance_us =3D 4,=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .use_urgent_burst_bw =3D 0<br>
-};<br>
-<br>
-static struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc =3D { 0 };<br>
-<br>
&nbsp;#ifndef mmDP0_DP_DPHY_INTERNAL_CTRL<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #define mmDP0_DP_DPHY_INTE=
RNAL_CTRL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 0x210f<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #define mmDP0_DP_DPHY_INTE=
RNAL_CTRL_BASE_IDX&nbsp;&nbsp;&nbsp; 2<br>
@@ -1810,69 +1448,6 @@ enum dc_status dcn20_remove_stream_from_ctx(struct d=
c *dc, struct dc_state *new_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return result;<br>
&nbsp;}<br>
&nbsp;<br>
-<br>
-static void swizzle_to_dml_params(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; enum swizzle_mode_values swizzle,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int *sw_mode)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (swizzle) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_LINEAR:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_linear;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_4KB_S:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_4kb_s;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_4KB_S_X:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_4kb_s_x;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_4KB_D:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_4kb_d;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_4KB_D_X:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_4kb_d_x;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_S:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_s;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_S_X:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_s_x;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_S_T:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_s_t;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_D:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_d;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_D_X:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_d_x;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_D_T:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_d_t;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_R_X:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_r_x;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_VAR_S:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_var_s;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_VAR_S_X:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_var_s_x;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_VAR_D:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_var_d;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_VAR_D_X:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_var_d_x;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_VAR_R_X:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_var_r_x;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ASSERT(0); /* Not supported */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-}<br>
-<br>
&nbsp;bool dcn20_split_stream_for_odm(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; const struct dc *dc,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; struct resource_context *res_ctx,<br>
@@ -1988,394 +1563,6 @@ void dcn20_split_stream_for_mpc(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSERT(primary_pipe-&gt;pl=
ane_state);<br>
&nbsp;}<br>
&nbsp;<br>
-int dcn20_populate_dml_pipes_from_context(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc *dc,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc_state *context,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; display_e2e_pipe_params_st *pipes,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bool fast_validate)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_cnt, i;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool synchronized_vblank =3D true;<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct resource_context *res_ctx =3D =
&amp;context-&gt;res_ctx;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, pipe_cnt =3D -1; i &lt;=
 dc-&gt;res_pool-&gt;pipe_count; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!res_ctx-&gt;pipe_ctx[i].stream)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (pipe_cnt &lt; 0) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_cnt =3D i;<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (res_ctx-&gt;pipe_ctx[pipe_cnt].stream =3D=3D res_ctx-&gt;pip=
e_ctx[i].stream)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;debug.disable_timing_sync ||<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (!resource_are_s=
treams_timing_synchronizable(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res_ctx-&gt;pipe_ctx[pipe_cnt].stream,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res_ctx-&gt;pipe_ctx[i].stream) &amp;&amp;<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !resource_are_vb=
lanks_synchronizable(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res_ctx-&gt;pipe_ctx[pipe_cnt].stream,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res_ctx-&gt;pipe_ctx[i].stream))) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; synchronized_vbl=
ank =3D false;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, pipe_cnt =3D 0; i &lt; =
dc-&gt;res_pool-&gt;pipe_count; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc_crtc_timing *timing =3D &amp;res_ctx-&gt;pipe_ctx[i].s=
tream-&gt;timing;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int v_total;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int front_porch;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int output_bpc;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct audio_check aud_check =3D {0};<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!res_ctx-&gt;pipe_ctx[i].stream)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; v_total =3D timing-&gt;v_total;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; front_porch =3D timing-&gt;v_front_porch;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* todo:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.dynamic_metadata_enable =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.dcc =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.vm =3D 0;*/<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].clks_cfg.refclk_mhz =3D dc-&gt;res_pool-&gt;ref_=
clocks.dchub_ref_clock_inKhz / 1000.0;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].dout.dsc_enable =3D res_ctx-&gt;pipe_ctx[i].stre=
am-&gt;timing.flags.DSC;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* todo: rotation?*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].dout.dsc_slices =3D res_ctx-&gt;pipe_ctx[i].stre=
am-&gt;timing.dsc_cfg.num_slices_h;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (res_ctx-&gt;pipe_ctx[i].stream-&gt;use_dynamic_meta) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.dynamic_metadata_enable =3D true;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 1/2 vblank */=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.dynamic_metadata_lines_before_active =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (v_total - timing-&gt;v_addressable<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; - timing-&gt;v_border_top - timing-&gt;v_border_bottom) / 2;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 36 bytes dp, =
32 hdmi */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.dynamic_metadata_xmit_bytes =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_is_dp_signal(res_ctx-&gt;pipe_ctx[i].str=
eam-&gt;signal) ? 36 : 32;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.dcc =3D false;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.dcc_rate =3D 1;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.synchronized_vblank_all_planes =3D syn=
chronized_vblank;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.hblank_start =3D timing-&gt;h_total - =
timing-&gt;h_front_porch;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.hblank_end =3D pipes[pipe_cnt].pipe.de=
st.hblank_start<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - timing-&gt;h_addressable<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - timing-&gt;h_border_left<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - timing-&gt;h_border_right;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.vblank_start =3D v_total - front_porch=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.vblank_end =3D pipes[pipe_cnt].pipe.de=
st.vblank_start<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - timing-&gt;v_addressable<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - timing-&gt;v_border_top<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - timing-&gt;v_border_bottom;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.htotal =3D timing-&gt;h_total;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.vtotal =3D v_total;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.hactive =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timing-&gt;h_add=
ressable + timing-&gt;h_border_left + timing-&gt;h_border_right;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.vactive =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timing-&gt;v_add=
ressable + timing-&gt;v_border_top + timing-&gt;v_border_bottom;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.interlaced =3D timing-&gt;flags.INTERL=
ACE;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.pixel_rate_mhz =3D timing-&gt;pix_clk_=
100hz/10000.0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (timing-&gt;timing_3d_format =3D=3D TIMING_3D_FORMAT_HW_FRAME=
_PACKING)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.pixel_rate_mhz *=3D 2;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.otg_inst =3D res_ctx-&gt;pipe_ctx[i].s=
tream_res.tg-&gt;inst;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].dout.dp_lanes =3D 4;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].dout.is_virtual =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.vtotal_min =3D res_ctx-&gt;pipe_ctx[i]=
.stream-&gt;adjust.v_total_min;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.vtotal_max =3D res_ctx-&gt;pipe_ctx[i]=
.stream-&gt;adjust.v_total_max;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; switch (get_num_odm_splits(&amp;res_ctx-&gt;pipe_ctx[i])) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case 1:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.odm_combine =3D dm_odm_combine_mode_2to1;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case 3:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.odm_combine =3D dm_odm_combine_mode_4to1;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; default:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.odm_combine =3D dm_odm_combine_mode_disabled;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.hsplit_grp =3D res_ctx-&gt;pipe_ctx[i].=
pipe_idx;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (res_ctx-&gt;pipe_ctx[i].top_pipe &amp;&amp; res_ctx-&gt;pipe=
_ctx[i].top_pipe-&gt;plane_state<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=3D res_ctx-&gt;pipe_ctx[i].plane_state)=
 {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pipe_ctx =
*first_pipe =3D res_ctx-&gt;pipe_ctx[i].top_pipe;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int split_idx =
=3D 0;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (first_pip=
e-&gt;top_pipe &amp;&amp; first_pipe-&gt;top_pipe-&gt;plane_state<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; =3D=3D res_ctx-&gt;pipe_ctx[i].plane_state) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first_pipe =3D first_pipe-&gt;top_pipe;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; split_idx++;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Treat 4to1 mp=
c combine as an mpo of 2 2-to-1 combines */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (split_idx =
=3D=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.hsplit_grp =3D fir=
st_pipe-&gt;pipe_idx;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (split_i=
dx =3D=3D 1)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.hsplit_grp =3D res=
_ctx-&gt;pipe_ctx[i].pipe_idx;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (split_i=
dx =3D=3D 2)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.hsplit_grp =3D res=
_ctx-&gt;pipe_ctx[i].top_pipe-&gt;pipe_idx;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else if (res_ctx-&gt;pipe_ctx[i].prev_odm_pipe) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pipe_ctx =
*first_pipe =3D res_ctx-&gt;pipe_ctx[i].prev_odm_pipe;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (first_pip=
e-&gt;prev_odm_pipe)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first_pipe =3D first_pipe-&gt;prev_odm_pipe=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.hsplit_grp =3D first_pipe-&gt;pipe_idx;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; switch (res_ctx-&gt;pipe_ctx[i].stream-&gt;signal) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SIGNAL_TYPE_DISPLAY_PORT_MST:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SIGNAL_TYPE_DISPLAY_PORT:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_type =3D dm_dp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SIGNAL_TYPE_EDP:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_type =3D dm_edp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SIGNAL_TYPE_HDMI_TYPE_A:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SIGNAL_TYPE_DVI_SINGLE_LINK:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SIGNAL_TYPE_DVI_DUAL_LINK:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_type =3D dm_hdmi;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; default:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* In case there=
 is no signal, set dp with 4 lanes to allow max config */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.is_virtual =3D 1;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_type =3D dm_dp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.dp_lanes =3D 4;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; switch (res_ctx-&gt;pipe_ctx[i].stream-&gt;timing.display_color_=
depth) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_666:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 6=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_888:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 8=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_101010:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 1=
0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_121212:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 1=
2;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_141414:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 1=
4;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_161616:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 1=
6;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_999:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 9=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_111111:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 1=
1;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; default:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 8=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; switch (res_ctx-&gt;pipe_ctx[i].stream-&gt;timing.pixel_encoding=
) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case PIXEL_ENCODING_RGB:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case PIXEL_ENCODING_YCBCR444:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_format =3D dm_444;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_bpp =3D output_bpc * 3;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case PIXEL_ENCODING_YCBCR420:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_format =3D dm_420;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_bpp =3D (output_bpc * 3.0) / 2;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case PIXEL_ENCODING_YCBCR422:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (res_ctx-&gt;=
pipe_ctx[i].stream-&gt;timing.flags.DSC &amp;&amp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; !res_ctx-&gt;pipe_ctx[i].stream-&gt;timing.dsc_cfg.ycbcr422_simple)=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].dout.output_format =3D dm_n=
422;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].dout.output_format =3D dm_s=
422;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_bpp =3D output_bpc * 2;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; default:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_format =3D dm_444;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_bpp =3D output_bpc * 3;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (res_ctx-&gt;pipe_ctx[i].stream-&gt;timing.flags.DSC)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_bpp =3D res_ctx-&gt;pipe_ctx[i].stream-&gt;timing.dsc_cfg.bits_=
per_pixel / 16.0;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* todo: default max for now, until there is logic reflecting th=
is in dc*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].dout.dsc_input_bpc =3D 12;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /*fill up the audio sample rate (unit in kHz)*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; get_audio_check(&amp;res_ctx-&gt;pipe_ctx[i].stream-&gt;audio_in=
fo, &amp;aud_check);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].dout.max_audio_sample_rate =3D aud_check.max_aud=
iosample_rate / 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /*<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * For graphic plane, cursor number is 1, nv12 is 0<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * bw calculations due to cursor on/off<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (res_ctx-&gt;pipe_ctx[i].plane_state &amp;&amp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res_ctx-&gt;pipe_ctx[i].plane_state-&gt;add=
ress.type =3D=3D PLN_ADDR_TYPE_VIDEO_PROGRESSIVE)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.num_cursors =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.num_cursors =3D dc-&gt;dml.ip.number_of_cursors;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.cur0_src_width =3D 256;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.cur0_bpp =3D dm_cur_32bit;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!res_ctx-&gt;pipe_ctx[i].plane_state) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.is_hsplit =3D pipes[pipe_cnt].pipe.dest.odm_combine !=3D dm_odm_co=
mbine_mode_disabled;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.source_scan =3D dm_horz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.sw_mode =3D dm_sw_4kb_s;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.macro_tile_size =3D dm_64k_tile;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_width =3D timing-&gt;h_addressable;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipes[pipe_c=
nt].pipe.src.viewport_width &gt; 1920)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.viewport_width =3D=
 1920;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_height =3D timing-&gt;v_addressable;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipes[pipe_c=
nt].pipe.src.viewport_height &gt; 1080)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.viewport_height =
=3D 1080;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_height_y =3D pipes[pipe_cnt].pipe.src.viewport_height;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_width_y =3D pipes[pipe_cnt].pipe.src.viewport_width;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_height_c =3D pipes[pipe_cnt].pipe.src.viewport_height;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_width_c =3D pipes[pipe_cnt].pipe.src.viewport_width;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.data_pitch =3D ((pipes[pipe_cnt].pipe.src.viewport_width + 255) / =
256) * 256;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.source_format =3D dm_444_32;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.recout_width =3D pipes[pipe_cnt].pipe.src.viewport_width; /*vp_wi=
dth/hratio*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.recout_height =3D pipes[pipe_cnt].pipe.src.viewport_height; /*vp_=
height/vratio*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.full_recout_width =3D pipes[pipe_cnt].pipe.dest.recout_width;&nbs=
p; /*when is_hsplit !=3D 1*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.full_recout_height =3D pipes[pipe_cnt].pipe.dest.recout_height; /=
*when is_hsplit !=3D 1*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.lb_depth =3D dm_lb_16;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.hscl_ratio =3D 1.0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.vscl_ratio =3D 1.0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.scl_enable =3D 0; /*Lb only or Full scl*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_taps.htaps =3D 1;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_taps.vtaps =3D 1;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.vtotal_min =3D v_total;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.vtotal_max =3D v_total;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipes[pipe_c=
nt].pipe.dest.odm_combine =3D=3D dm_odm_combine_mode_2to1) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.viewport_width /=
=3D 2;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.recout_width /=3D=
 2;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (pipes=
[pipe_cnt].pipe.dest.odm_combine =3D=3D dm_odm_combine_mode_4to1) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.viewport_width /=
=3D 4;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.recout_width /=3D=
 4;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_plane_=
state *pln =3D res_ctx-&gt;pipe_ctx[i].plane_state;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct scaler_da=
ta *scl =3D &amp;res_ctx-&gt;pipe_ctx[i].plane_res.scl_data;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.immediate_flip =3D pln-&gt;flip_immediate;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.is_hsplit =3D (res_ctx-&gt;pipe_ctx[i].bottom_pipe &amp;&amp; res_=
ctx-&gt;pipe_ctx[i].bottom_pipe-&gt;plane_state =3D=3D pln)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || (res_ctx-&gt;pipe_ctx[i].top_pipe &amp;&amp; res_ctx-&gt;pipe_ctx[i=
].top_pipe-&gt;plane_state =3D=3D pln)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || pipes[pipe_cnt].pipe.dest.odm_combine !=3D dm_odm_combine_mode_disa=
bled;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* stereo is not=
 split */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pln-&gt;ster=
eo_format =3D=3D PLANE_STEREO_FORMAT_SIDE_BY_SIDE ||<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pln-&gt;stereo_format =3D=3D PLANE_STEREO_FORMAT_TOP_AND_BOTTOM) {<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.is_hsplit =3D fals=
e;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.hsplit_grp =3D res=
_ctx-&gt;pipe_ctx[i].pipe_idx;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.source_scan =3D pln-&gt;rotation =3D=3D ROTATION_ANGLE_90<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || pln-&gt;rotation =3D=3D ROTATION_ANGLE_270 ? dm_vert : dm_horz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_y_y =3D scl-&gt;viewport.y;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_y_c =3D scl-&gt;viewport_c.y;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_width =3D scl-&gt;viewport.width;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_width_c =3D scl-&gt;viewport_c.width;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_height =3D scl-&gt;viewport.height;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_height_c =3D scl-&gt;viewport_c.height;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_width_max =3D pln-&gt;src_rect.width;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_height_max =3D pln-&gt;src_rect.height;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_width_y =3D pln-&gt;plane_size.surface_size.width;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_height_y =3D pln-&gt;plane_size.surface_size.height;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_width_c =3D pln-&gt;plane_size.chroma_size.width;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_height_c =3D pln-&gt;plane_size.chroma_size.height;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pln-&gt;form=
at =3D=3D SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || pln-&gt;format &gt;=3D SURFACE_PIXEL_FORMAT_VIDEO_BEGIN) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.data_pitch =3D pln=
-&gt;plane_size.surface_pitch;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.data_pitch_c =3D p=
ln-&gt;plane_size.chroma_pitch;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.meta_pitch =3D pln=
-&gt;dcc.meta_pitch;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.meta_pitch_c =3D p=
ln-&gt;dcc.meta_pitch_c;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.data_pitch =3D pln=
-&gt;plane_size.surface_pitch;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.meta_pitch =3D pln=
-&gt;dcc.meta_pitch;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.dcc =3D pln-&gt;dcc.enable;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.recout_width =3D scl-&gt;recout.width;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.recout_height =3D scl-&gt;recout.height;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.full_recout_height =3D scl-&gt;recout.height;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.full_recout_width =3D scl-&gt;recout.width;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipes[pipe_c=
nt].pipe.dest.odm_combine =3D=3D dm_odm_combine_mode_2to1)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.full_recout_width=
 *=3D 2;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (pipes[p=
ipe_cnt].pipe.dest.odm_combine =3D=3D dm_odm_combine_mode_4to1)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.full_recout_width=
 *=3D 4;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pipe_ctx *split_pipe =3D res_ctx-&gt=
;pipe_ctx[i].bottom_pipe;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (split_pipe &amp;&amp; split_pipe-&gt=
;plane_state =3D=3D pln) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pipes[pipe_cnt].pipe.dest.full_recout_width +=3D split_pipe-&gt;plane_=
res.scl_data.recout.width;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; split_pipe =3D split_pipe-&gt;bottom_pipe;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; split_pipe =3D res_ctx-&gt;pipe_ctx[i].top_=
pipe;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (split_pipe &amp;&amp; split_pipe-&gt=
;plane_state =3D=3D pln) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pipes[pipe_cnt].pipe.dest.full_recout_width +=3D split_pipe-&gt;plane_=
res.scl_data.recout.width;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; split_pipe =3D split_pipe-&gt;top_pipe;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.lb_depth =3D dm_lb_16;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.hscl_ratio =3D (double) scl-&gt;ratios.horz.value / =
(1ULL&lt;&lt;32);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.hscl_ratio_c =3D (double) scl-&gt;ratios.horz_c.valu=
e / (1ULL&lt;&lt;32);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.vscl_ratio =3D (double) scl-&gt;ratios.vert.value / =
(1ULL&lt;&lt;32);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.vscl_ratio_c =3D (double) scl-&gt;ratios.vert_c.valu=
e / (1ULL&lt;&lt;32);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.scl_enable =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; scl-&gt;ratios.vert.value !=3D dc_fixpt_one.value<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || scl-&gt;ratios.horz.value !=3D dc_fixpt_one.value<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || scl-&gt;ratios.vert_c.value !=3D dc_fixpt_one.value<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || scl-&gt;ratios.horz_c.value !=3D dc_fixpt_one.value /*Lb only or Fu=
ll scl*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || dc-&gt;debug.always_scale; /*support always scale*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_taps.htaps =3D scl-&gt;taps.h_taps;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_taps.htaps_c =3D scl-&gt;taps.h_taps_c;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_taps.vtaps =3D scl-&gt;taps.v_taps;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_taps.vtaps_c =3D scl-&gt;taps.v_taps_c;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.macro_tile_size =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; swizzle_mode_to_macro_tile_size(pln-&gt;tiling_info.gfx9.swizzle);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swizzle_to_dml_p=
arams(pln-&gt;tiling_info.gfx9.swizzle,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &amp;pipes[pipe_cnt].pipe.src.sw_mode);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (pln-&gt;=
format) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_VIDEO_420_YCbCr:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_VIDEO_420_YCrCb:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_420_8;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_VIDEO_420_10bpc_YCbCr:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_VIDEO_420_10bpc_YCrCb:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_420_10;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_ARGB16161616:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_ABGR16161616:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_ARGB16161616F:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_ABGR16161616F:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_64;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_ARGB1555:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_RGB565:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_16;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_PALETA_256_COLORS:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_8;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_RGBE_ALPHA:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_rgbe_alpha;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_32;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipe_cnt++;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* populate writeback information */<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_START();<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;res_pool-&gt;funcs-&gt;populat=
e_dml_writeback_from_context(dc, res_ctx, pipes);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_END();<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return pipe_cnt;<br>
-}<br>
-<br>
&nbsp;unsigned int dcn20_calc_max_scaled_time(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; unsigned int time_per_pixel,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; enum mmhubbub_wbif_mode mode,<br>
@@ -2413,7 +1600,7 @@ void dcn20_set_mcif_arb_params(<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum mmhubbub_wbif_mode wb=
if_mode;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mcif_arb_params *wb=
_arb_params;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, j, k, dwb_pipe;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, j, dwb_pipe;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Writeback MCIF_WB arbit=
ration parameters */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dwb_pipe =3D 0;<br>
@@ -2437,11 +1624,10 @@ void dcn20_set_mcif_arb_params(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } els=
e<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wbif_mode =3D PACKED_444;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (k =3D 0; k =
&lt; sizeof(wb_arb_params-&gt;cli_watermark)/sizeof(wb_arb_params-&gt;cli_w=
atermark[0]); k++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wb_arb_params-&gt;cli_watermark[k] =3D get_=
wm_writeback_urgent(&amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wb_arb_params-&gt;pstate_watermark[k] =3D g=
et_wm_writeback_dram_clock_change(&amp;context-&gt;bw_ctx.dml, pipes, pipe_=
cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wb_arb_params-&g=
t;time_per_pixel =3D 16.0 * 1000 / (context-&gt;res_ctx.pipe_ctx[i].stream-=
&gt;phy_pix_clk / 1000); /* 4 bit fraction, ms */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_START();<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_fpu_set_wb=
_arb_params(wb_arb_params, context, pipes, pipe_cnt, i);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_END();<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wb_ar=
b_params-&gt;slice_lines =3D 32;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wb_ar=
b_params-&gt;arbitration_slice =3D 2;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wb_ar=
b_params-&gt;max_scaled_time =3D dcn20_calc_max_scaled_time(wb_arb_params-&=
gt;time_per_pixel,<br>
@@ -2808,8 +1994,11 @@ int dcn20_validate_apply_pipe_split_flags(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* Adjust dppclk when split is forced, do not bother =
with dispclk */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (split[i] !=3D 0 &amp;&amp; v-&gt;NoOfDPP[vlevel][max_mpc_com=
b][pipe_idx] =3D=3D 1)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v-&gt;RequiredDP=
PCLK[vlevel][max_mpc_comb][pipe_idx] /=3D 2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (split[i] !=3D 0 &amp;&amp; v-&gt;NoOfDPP[vlevel][max_mpc_com=
b][pipe_idx] =3D=3D 1) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_START();<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_fpu_adjust=
_dppclk(v, vlevel, max_mpc_comb, pipe_idx, false);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_END();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pipe_idx++;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
@@ -2835,7 +2024,9 @@ bool dcn20_fast_validate_bw(<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_merge_pipes_for_vali=
date(dc, context);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_START();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_cnt =3D dc-&gt;res_po=
ol-&gt;funcs-&gt;populate_dml_pipes(dc, context, pipes, fast_validate);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_END();<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *pipe_cnt_out =3D pipe_cnt=
;<br>
&nbsp;<br>
@@ -2892,7 +2083,9 @@ bool dcn20_fast_validate_bw(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hsplit_pipe =3D dcn20_find_secon=
dary_pipe(dc, &amp;context-&gt;res_ctx, dc-&gt;res_pool, pipe);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSERT(hsplit_pipe);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!hsplit_pipe) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; context-&gt;bw_ctx.dml.vba.RequiredDPPCLK[vlevel][context-&gt;bw_ctx.d=
ml.vba.maxMpcComb][pipe_idx] *=3D 2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; DC_FP_START();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; dcn20_fpu_adjust_dppclk(&amp;context-&gt;bw_ctx.dml.vba, vlevel, conte=
xt-&gt;bw_ctx.dml.vba.maxMpcComb, pipe_idx, true);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; DC_FP_END();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; continue;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (context-&gt;bw_ctx.dml.vba.O=
DMCombineEnabled[pipe_idx]) {<br>
@@ -2934,369 +2127,6 @@ bool dcn20_fast_validate_bw(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return out;<br>
&nbsp;}<br>
&nbsp;<br>
-static void dcn20_calculate_wm(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc *dc, struct dc_state *context,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; display_e2e_pipe_params_st *pipes,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int *out_pipe_cnt,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int *pipe_split_from,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int vlevel,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bool fast_validate)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_cnt, i, pipe_idx;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, pipe_idx =3D 0, pipe_cn=
t =3D 0; i &lt; dc-&gt;res_pool-&gt;pipe_count; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!context-&gt;res_ctx.pipe_ctx[i].stream)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].clks_cfg.refclk_mhz =3D dc-&gt;res_pool-&gt;ref_=
clocks.dchub_ref_clock_inKhz / 1000.0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D context-&gt;bw_ctx.dml.=
vba.RequiredDISPCLK[vlevel][context-&gt;bw_ctx.dml.vba.maxMpcComb];<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (pipe_split_from[i] &lt; 0) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
clks_cfg.dppclk_mhz =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; context-&gt;bw_ctx.dml.vba.RequiredDPPCLK[vlevel][context-&gt;bw_ctx.d=
ml.vba.maxMpcComb][pipe_idx];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (context-&gt;=
bw_ctx.dml.vba.BlendingAndTiming[pipe_idx] =3D=3D pipe_idx)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.odm_combine =3D<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.dml=
.vba.ODMCombineEnabled[pipe_idx];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.odm_combine =3D 0=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_idx++;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
clks_cfg.dppclk_mhz =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; context-&gt;bw_ctx.dml.vba.RequiredDPPCLK[vlevel][context-&gt;bw_ctx.d=
ml.vba.maxMpcComb][pipe_split_from[i]];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (context-&gt;=
bw_ctx.dml.vba.BlendingAndTiming[pipe_split_from[i]] =3D=3D pipe_split_from=
[i])<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.odm_combine =3D<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.dml=
.vba.ODMCombineEnabled[pipe_split_from[i]];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.odm_combine =3D 0=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;config.forced_clocks) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
clks_cfg.dispclk_mhz =3D context-&gt;bw_ctx.dml.soc.clock_limits[0].dispclk=
_mhz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
clks_cfg.dppclk_mhz =3D context-&gt;bw_ctx.dml.soc.clock_limits[0].dppclk_m=
hz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;debug.min_disp_clk_khz &gt; pipes[pipe_cnt].clks_cfg.=
dispclk_mhz * 1000)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
clks_cfg.dispclk_mhz =3D dc-&gt;debug.min_disp_clk_khz / 1000.0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;debug.min_dpp_clk_khz &gt; pipes[pipe_cnt].clks_cfg.d=
ppclk_mhz * 1000)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
clks_cfg.dppclk_mhz =3D dc-&gt;debug.min_dpp_clk_khz / 1000.0;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipe_cnt++;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipe_cnt !=3D pipe_idx) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;res_pool-&gt;funcs-&gt;populate_dml_pipes)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_cnt =3D dc-=
&gt;res_pool-&gt;funcs-&gt;populate_dml_pipes(dc,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context, pipes, fast_validate);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_cnt =3D dcn=
20_populate_dml_pipes_from_context(dc,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context, pipes, fast_validate);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *out_pipe_cnt =3D pipe_cnt;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[0].clks_cfg.voltage =3D vlevel;=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[0].clks_cfg.dcfclk_mhz =3D cont=
ext-&gt;bw_ctx.dml.soc.clock_limits[vlevel].dcfclk_mhz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[0].clks_cfg.socclk_mhz =3D cont=
ext-&gt;bw_ctx.dml.soc.clock_limits[vlevel].socclk_mhz;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* only pipe 0 is read for voltage an=
d dcf/soc clocks */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vlevel &lt; 1) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.voltage =3D 1;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.dcfclk_mhz =3D context-&gt;bw_ctx.dml.soc.cloc=
k_limits[1].dcfclk_mhz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.socclk_mhz =3D context-&gt;bw_ctx.dml.soc.cloc=
k_limits[1].socclk_mhz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.urgent_ns =3D get_wm_urgent(&amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.cstate_pstate.cstate_enter_plus_exit_ns =3D get_wm_stutter_enter_exit(&am=
p;context-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.cstate_pstate.cstate_exit_ns =3D get_wm_stutter_exit(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.cstate_pstate.pstate_change_ns =3D get_wm_dram_clock_change(&amp;context-=
&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.pte_meta_urgent_ns =3D get_wm_memory_trip(&amp;context-&gt;bw_ctx.dml, pi=
pes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.frac_urg_bw_nom =3D get_fraction_of_urgent_bandwidth(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.frac_urg_bw_flip =3D get_fraction_of_urgent_bandwidth_imm_flip(&amp;conte=
xt-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.urgent_latency_ns =3D get_urgent_latency(&amp;context-&gt;bw_ctx.dml, pip=
es, pipe_cnt) * 1000;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vlevel &lt; 2) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.voltage =3D 2;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.dcfclk_mhz =3D context-&gt;bw_ctx.dml.soc.cloc=
k_limits[2].dcfclk_mhz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.socclk_mhz =3D context-&gt;bw_ctx.dml.soc.cloc=
k_limits[2].socclk_mhz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.urgent_ns =3D get_wm_urgent(&amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.cstate_pstate.cstate_enter_plus_exit_ns =3D get_wm_stutter_enter_exit(&am=
p;context-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.cstate_pstate.cstate_exit_ns =3D get_wm_stutter_exit(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.cstate_pstate.pstate_change_ns =3D get_wm_dram_clock_change(&amp;context-=
&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.pte_meta_urgent_ns =3D get_wm_memory_trip(&amp;context-&gt;bw_ctx.dml, pi=
pes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.frac_urg_bw_nom =3D get_fraction_of_urgent_bandwidth(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.frac_urg_bw_flip =3D get_fraction_of_urgent_bandwidth_imm_flip(&amp;conte=
xt-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vlevel &lt; 3) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.voltage =3D 3;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.dcfclk_mhz =3D context-&gt;bw_ctx.dml.soc.cloc=
k_limits[2].dcfclk_mhz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.socclk_mhz =3D context-&gt;bw_ctx.dml.soc.cloc=
k_limits[2].socclk_mhz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.urgent_ns =3D get_wm_urgent(&amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.cstate_pstate.cstate_enter_plus_exit_ns =3D get_wm_stutter_enter_exit(&am=
p;context-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.cstate_pstate.cstate_exit_ns =3D get_wm_stutter_exit(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.cstate_pstate.pstate_change_ns =3D get_wm_dram_clock_change(&amp;context-=
&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.pte_meta_urgent_ns =3D get_wm_memory_trip(&amp;context-&gt;bw_ctx.dml, pi=
pes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.frac_urg_bw_nom =3D get_fraction_of_urgent_bandwidth(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.frac_urg_bw_flip =3D get_fraction_of_urgent_bandwidth_imm_flip(&amp;conte=
xt-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[0].clks_cfg.voltage =3D vlevel;=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[0].clks_cfg.dcfclk_mhz =3D cont=
ext-&gt;bw_ctx.dml.soc.clock_limits[vlevel].dcfclk_mhz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[0].clks_cfg.socclk_mhz =3D cont=
ext-&gt;bw_ctx.dml.soc.clock_limits[vlevel].socclk_mhz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.urgent_ns =3D get_wm_urgent(&amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.cstate_pstate.cstate_enter_plus_exit_ns =3D get_wm_stutter_enter_exit(&am=
p;context-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.cstate_pstate.cstate_exit_ns =3D get_wm_stutter_exit(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.cstate_pstate.pstate_change_ns =3D get_wm_dram_clock_change(&amp;context-=
&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.pte_meta_urgent_ns =3D get_wm_memory_trip(&amp;context-&gt;bw_ctx.dml, pi=
pes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.frac_urg_bw_nom =3D get_fraction_of_urgent_bandwidth(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.frac_urg_bw_flip =3D get_fraction_of_urgent_bandwidth_imm_flip(&amp;conte=
xt-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
-}<br>
-<br>
-static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)<br=
>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; dc-&gt;res_pool-=
&gt;pipe_count; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!context-&gt;res_ctx.pipe_ctx[i].stream)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (is_dp_128b_132b_signal(&amp;context-&gt;res_ctx.pipe_ctx[i])=
)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
-}<br>
-<br>
-static enum dcn_zstate_support_state&nbsp; decide_zstate_support(struct dc=
 *dc, struct dc_state *context)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int plane_count;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plane_count =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; dc-&gt;res_pool-=
&gt;pipe_count; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (context-&gt;res_ctx.pipe_ctx[i].plane_state)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plane_count++;<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Zstate is allowed in followin=
g scenarios:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 1. Single eDP with PSR enabled<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 2. 0 planes (No memory requests)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 3. Single eDP without PSR but &gt; 5ms stutter period<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (plane_count =3D=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return DCN_ZSTATE_SUPPORT_ALLOW;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (context-&gt;stream_count =3D=
=3D 1 &amp;&amp;&nbsp; context-&gt;streams[0]-&gt;signal =3D=3D SIGNAL_TYPE=
_EDP) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc_link *link =3D context-&gt;streams[0]-&gt;sink-&gt;lin=
k;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* zstate only supported on PWRSEQ0 */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (link-&gt;link_index !=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DCN_ZSTAT=
E_SUPPORT_DISALLOW;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (context-&gt;bw_ctx.dml.vba.StutterPeriod &gt; 5000.0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DCN_ZSTAT=
E_SUPPORT_ALLOW;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else if (link-&gt;psr_settings.psr_version =3D=3D DC_PSR_VERSION=
_1 &amp;&amp; !dc-&gt;debug.disable_psr)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DCN_ZSTAT=
E_SUPPORT_ALLOW_Z10_ONLY;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DCN_ZSTAT=
E_SUPPORT_DISALLOW;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return DCN_ZSTATE_SUPPORT_DISALLOW;<br>
-}<br>
-<br>
-void dcn20_calculate_dlg_params(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc *dc, struct dc_state *context,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; display_e2e_pipe_params_st *pipes,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int pipe_cnt,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int vlevel)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, pipe_idx;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Writeback MCIF_WB arbitration para=
meters */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;res_pool-&gt;funcs-&gt;set_mci=
f_arb_params(dc, context, pipes, pipe_cnt);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dispclk=
_khz =3D context-&gt;bw_ctx.dml.vba.DISPCLK * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dcfclk_=
khz =3D context-&gt;bw_ctx.dml.vba.DCFCLK * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.socclk_=
khz =3D context-&gt;bw_ctx.dml.vba.SOCCLK * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dramclk=
_khz =3D context-&gt;bw_ctx.dml.vba.DRAMSpeed * 1000 / 16;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dc-&gt;debug.min_dram_clk_khz &gt=
; context-&gt;bw_ctx.bw.dcn.clk.dramclk_khz)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dramclk_khz =3D dc-&gt;debug.min_d=
ram_clk_khz;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dcfclk_=
deep_sleep_khz =3D context-&gt;bw_ctx.dml.vba.DCFCLKDeepSleep * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.fclk_kh=
z =3D context-&gt;bw_ctx.dml.vba.FabricClock * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.p_state=
_change_support =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][contex=
t-&gt;bw_ctx.dml.vba.maxMpcComb]<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; !=3D dm_dram_clock_change_unsupported;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dppclk_=
khz =3D 0;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.zstate_=
support =3D decide_zstate_support(dc, context);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dtbclk_=
en =3D is_dtbclk_required(dc, context);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (context-&gt;bw_ctx.bw.dcn.clk.dis=
pclk_khz &lt; dc-&gt;debug.min_disp_clk_khz)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dispclk_khz =3D dc-&gt;debug.min_d=
isp_clk_khz;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, pipe_idx =3D 0; i &lt; =
dc-&gt;res_pool-&gt;pipe_count; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!context-&gt;res_ctx.pipe_ctx[i].stream)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_idx].pipe.dest.vstartup_start =3D get_vstartup(&amp;c=
ontext-&gt;bw_ctx.dml, pipes, pipe_cnt, pipe_idx);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_idx].pipe.dest.vupdate_offset =3D get_vupdate_offset(=
&amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt, pipe_idx);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_idx].pipe.dest.vupdate_width =3D get_vupdate_width(&a=
mp;context-&gt;bw_ctx.dml, pipes, pipe_cnt, pipe_idx);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_idx].pipe.dest.vready_offset =3D get_vready_offset(&a=
mp;context-&gt;bw_ctx.dml, pipes, pipe_cnt, pipe_idx);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;res_ctx.pipe_ctx[i].det_buffer_size_kb =3D context-&=
gt;bw_ctx.dml.ip.det_buffer_size_kbytes;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;res_ctx.pipe_ctx[i].unbounded_req =3D pipes[pipe_idx=
].pipe.src.unbounded_req_mode;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (context-&gt;bw_ctx.bw.dcn.clk.dppclk_khz &lt; pipes[pipe_idx=
].clks_cfg.dppclk_mhz * 1000)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_c=
tx.bw.dcn.clk.dppclk_khz =3D pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000;<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_idx].clks_c=
fg.dppclk_mhz * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;res_ctx.pipe_ctx[i].pipe_dlg_param =3D pipes[pipe_id=
x].pipe.dest;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipe_idx++;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*save a original dppclock copy*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.bw_dppc=
lk_khz =3D context-&gt;bw_ctx.bw.dcn.clk.dppclk_khz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.bw_disp=
clk_khz =3D context-&gt;bw_ctx.bw.dcn.clk.dispclk_khz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.max_sup=
ported_dppclk_khz =3D context-&gt;bw_ctx.dml.soc.clock_limits[vlevel].dppcl=
k_mhz * 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.max_sup=
ported_dispclk_khz =3D context-&gt;bw_ctx.dml.soc.clock_limits[vlevel].disp=
clk_mhz * 1000;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.compbuf_siz=
e_kb =3D context-&gt;bw_ctx.dml.ip.config_return_buffer_size_in_kbytes<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - context-&gt;bw_ctx.d=
ml.ip.det_buffer_size_kbytes * pipe_idx;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, pipe_idx =3D 0; i &lt; =
dc-&gt;res_pool-&gt;pipe_count; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bool cstate_en =3D context-&gt;bw_ctx.dml.vba.PrefetchMode[vleve=
l][context-&gt;bw_ctx.dml.vba.maxMpcComb] !=3D 2;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!context-&gt;res_ctx.pipe_ctx[i].stream)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;ctx-&gt;dce_version =3D=3D DCN_VERSION_2_01)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cstate_en =3D fa=
lse;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.dml.funcs.rq_dlg_get_dlg_reg(&amp;context-&gt=
;bw_ctx.dml,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;context-&gt;res_ctx.pipe_ctx[i].dlg_re=
gs,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;context-&gt;res_ctx.pipe_ctx[i].ttu_re=
gs,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_cnt,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_idx,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cstate_en,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.p_state_chang=
e_support,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; false, false, true);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.dml.funcs.rq_dlg_get_rq_reg(&amp;context-&gt;=
bw_ctx.dml,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;context-&gt;res_ctx.pipe_ctx[i].rq_reg=
s,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;pipes[pipe_idx].pipe);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipe_idx++;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-}<br>
-<br>
-static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_sta=
te *context,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bool fast_validate)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool out =3D false;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_SETUP();<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int vlevel =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_split_from[MAX_PIPES];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_cnt =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_e2e_pipe_params_st *pipes =3D=
 kzalloc(dc-&gt;res_pool-&gt;pipe_count * sizeof(display_e2e_pipe_params_st=
), GFP_ATOMIC);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_LOGGER_INIT(dc-&gt;ctx-&gt;logger)=
;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_COUNT();<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out =3D dcn20_fast_validate_bw(dc, co=
ntext, pipes, &amp;pipe_cnt, pipe_split_from, &amp;vlevel, fast_validate);<=
br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipe_cnt =3D=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto validate_out;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!out)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto validate_fail;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_END_VOLTAGE_LEVEL();<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fast_validate) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; BW_VAL_TRACE_SKIP(fast);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto validate_out;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_calculate_wm(dc, context, pipes=
, &amp;pipe_cnt, pipe_split_from, vlevel, fast_validate);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_calculate_dlg_params(dc, contex=
t, pipes, pipe_cnt, vlevel);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_END_WATERMARKS();<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto validate_out;<br>
-<br>
-validate_fail:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_LOG_WARNING(&quot;Mode Validation =
Warning: %s failed validation.\n&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; dml_get_status_message(context-&gt;bw_ctx.dml.vba.ValidationStat=
us[context-&gt;bw_ctx.dml.vba.soc.num_states]));<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_SKIP(fail);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out =3D false;<br>
-<br>
-validate_out:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(pipes);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_FINISH();<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return out;<br>
-}<br>
-<br>
-/*<br>
- * This must be noinline to ensure anything that deals with FP registers<b=
r>
- * is contained within this call; previously our compiling with hard-float=
<br>
- * would result in fp instructions being emitted outside of the boundaries=
<br>
- * of the DC_FP_START/END macros, which makes sense as the compiler has no=
<br>
- * idea about what is wrapped and what is not<br>
- *<br>
- * This is largely just a workaround to avoid breakage introduced with 5.6=
,<br>
- * ideally all fp-using code should be moved into its own file, only that<=
br>
- * should be compiled with hard-float, and all code exported from there<br=
>
- * should be strictly wrapped with DC_FP_START/END<br>
- */<br>
-static noinline bool dcn20_validate_bandwidth_fp(struct dc *dc,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc_state *context, bool fast_validate)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool voltage_supported =3D false;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool full_pstate_supported =3D false;=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool dummy_pstate_supported =3D false=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; double p_state_latency_us;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p_state_latency_us =3D context-&gt;bw=
_ctx.dml.soc.dram_clock_change_latency_us;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.dml.soc.disable_dr=
am_clock_change_vactive_support =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; dc-&gt;debug.disable_dram_clock_change_vactive_support;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.dml.soc.allow_dram=
_clock_one_display_vactive =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; dc-&gt;debug.enable_dram_clock_change_one_display_vactive;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*Unsafe due to current pipe merge an=
d split logic*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSERT(context !=3D dc-&gt;current_st=
ate);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fast_validate) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return dcn20_validate_bandwidth_internal(dc, context, true);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Best case, we support full UCLK sw=
itch latency<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; voltage_supported =3D dcn20_validate_=
bandwidth_internal(dc, context, false);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; full_pstate_supported =3D context-&gt=
;bw_ctx.bw.dcn.clk.p_state_change_support;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (context-&gt;bw_ctx.dml.soc.dummy_=
pstate_latency_us =3D=3D 0 ||<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; (voltage_supported &amp;&amp; full_pstate_supported)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.p_state_change_support =3D full_ps=
tate_supported;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto restore_dml_state;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Fallback: Try to only support G6 t=
emperature read latency<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.dml.soc.dram_clock=
_change_latency_us =3D context-&gt;bw_ctx.dml.soc.dummy_pstate_latency_us;<=
br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; voltage_supported =3D dcn20_validate_=
bandwidth_internal(dc, context, false);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dummy_pstate_supported =3D context-&g=
t;bw_ctx.bw.dcn.clk.p_state_change_support;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (voltage_supported &amp;&amp; (dum=
my_pstate_supported || !(context-&gt;stream_count))) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.p_state_change_support =3D false;<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto restore_dml_state;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // ERROR: fallback is supposed to alw=
ays work.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSERT(false);<br>
-<br>
-restore_dml_state:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.dml.soc.dram_clock=
_change_latency_us =3D p_state_latency_us;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return voltage_supported;<br>
-}<br>
-<br>
&nbsp;bool dcn20_validate_bandwidth(struct dc *dc, struct dc_state *context=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bool fast_validate)<br>
&nbsp;{<br>
@@ -3464,170 +2294,6 @@ static void dcn20_pp_smu_destroy(struct pp_smu_func=
s **pp_smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
&nbsp;<br>
-void dcn20_cap_soc_clocks(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct _vcs_dpi_soc_bounding_box_st *bb,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct pp_smu_nv_clock_table max_clocks)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // First pass - cap all clocks higher=
 than the reported max<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; bb-&gt;num_state=
s; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].dcfclk_mhz &gt; (max_clocks.dcfClock=
InKhz / 1000))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.dcfClockInKhz !=3D 0)=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].dcfclk_mhz =3D (max_clocks.dcfClockInKhz / 1000);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].dram_speed_mts &gt; (max_clocks.uClo=
ckInKhz / 1000) * 16)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
uClockInKhz !=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].dram_speed_mts =3D (max_clocks.uClockInKhz / 1000) * 16;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].fabricclk_mhz &gt; (max_clocks.fabri=
cClockInKhz / 1000))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
fabricClockInKhz !=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].fabricclk_mhz =3D (max_clocks.fabricClockInKhz / 1000);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].dispclk_mhz &gt; (max_clocks.display=
ClockInKhz / 1000))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
displayClockInKhz !=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].dispclk_mhz =3D (max_clocks.displayClockInKhz / 1000);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].dppclk_mhz &gt; (max_clocks.dppClock=
InKhz / 1000))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
dppClockInKhz !=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].dppclk_mhz =3D (max_clocks.dppClockInKhz / 1000);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].phyclk_mhz &gt; (max_clocks.phyClock=
InKhz / 1000))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
phyClockInKhz !=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].phyclk_mhz =3D (max_clocks.phyClockInKhz / 1000);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].socclk_mhz &gt; (max_clocks.socClock=
InKhz / 1000))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
socClockInKhz !=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].socclk_mhz =3D (max_clocks.socClockInKhz / 1000);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].dscclk_mhz &gt; (max_clocks.dscClock=
InKhz / 1000))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
dscClockInKhz !=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].dscclk_mhz =3D (max_clocks.dscClockInKhz / 1000);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Second pass - remove all duplicate=
 clock states<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D bb-&gt;num_states - 1; i &=
gt; 1; i--) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bool duplicate =3D true;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].dcfclk_mhz !=3D bb-&gt;clock_limits=
[i].dcfclk_mhz)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].dispclk_mhz !=3D bb-&gt;clock_limit=
s[i].dispclk_mhz)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].dppclk_mhz !=3D bb-&gt;clock_limits=
[i].dppclk_mhz)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].dram_speed_mts !=3D bb-&gt;clock_li=
mits[i].dram_speed_mts)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].dscclk_mhz !=3D bb-&gt;clock_limits=
[i].dscclk_mhz)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].fabricclk_mhz !=3D bb-&gt;clock_lim=
its[i].fabricclk_mhz)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].phyclk_mhz !=3D bb-&gt;clock_limits=
[i].phyclk_mhz)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].socclk_mhz !=3D bb-&gt;clock_limits=
[i].socclk_mhz)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (duplicate)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;num_state=
s--;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-}<br>
-<br>
-void dcn20_update_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding=
_box_st *bb,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct pp_smu_nv_clock_table *max_clocks, unsigned int *uclk_sta=
tes, unsigned int num_states)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct _vcs_dpi_voltage_scaling_st ca=
lculated_states[DC__VOLTAGE_STATES];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int num_calculated_states =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int min_dcfclk =3D 0;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_states =3D=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(calculated_states, 0, sizeof(c=
alculated_states));<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dc-&gt;bb_overrides.min_dcfclk_mh=
z &gt; 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; min_dcfclk =3D dc-&gt;bb_overrides.min_dcfclk_mhz;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (ASICREV_IS_NAVI12_P(dc-&gt;ctx-&gt;asic_id.hw_internal_rev))=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min_dcfclk =3D 3=
10;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Accounting fo=
r SOC/DCF relationship, we can go as high as<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 506Mhz in Vmi=
n.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min_dcfclk =3D 5=
06;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; num_states; i++)=
 {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int min_fclk_required_by_uclk;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].state =3D i;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].dram_speed_mts =3D uclk_states[i] * 16 / 10=
00;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; // FCLK:UCLK ratio is 1.08<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; min_fclk_required_by_uclk =3D div_u64(((unsigned long long)uclk_=
states[i]) * 1080,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1000000);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].fabricclk_mhz =3D (min_fclk_required_by_ucl=
k &lt; min_dcfclk) ?<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min_dcfclk : min_fclk_required_by_uclk;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].socclk_mhz =3D (calculated_states[i].fabric=
clk_mhz &gt; max_clocks-&gt;socClockInKhz / 1000) ?<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_clocks-&gt;socClockInKhz / 1000 : calcu=
lated_states[i].fabricclk_mhz;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].dcfclk_mhz =3D (calculated_states[i].fabric=
clk_mhz &gt; max_clocks-&gt;dcfClockInKhz / 1000) ?<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_clocks-&gt;dcfClockInKhz / 1000 : calcu=
lated_states[i].fabricclk_mhz;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].dispclk_mhz =3D max_clocks-&gt;displayClock=
InKhz / 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].dppclk_mhz =3D max_clocks-&gt;displayClockI=
nKhz / 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].dscclk_mhz =3D max_clocks-&gt;displayClockI=
nKhz / (1000 * 3);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].phyclk_mhz =3D max_clocks-&gt;phyClockInKhz=
 / 1000;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; num_calculated_states++;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; calculated_states[num_calculated_stat=
es - 1].socclk_mhz =3D max_clocks-&gt;socClockInKhz / 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; calculated_states[num_calculated_stat=
es - 1].fabricclk_mhz =3D max_clocks-&gt;socClockInKhz / 1000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; calculated_states[num_calculated_stat=
es - 1].dcfclk_mhz =3D max_clocks-&gt;dcfClockInKhz / 1000;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(bb-&gt;clock_limits, calculate=
d_states, sizeof(bb-&gt;clock_limits));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;num_states =3D num_calculated_=
states;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Duplicate the last state, DML alwa=
ys an extra state identical to max state to work<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;bb-&gt;clock_limits[num_c=
alculated_states], &amp;bb-&gt;clock_limits[num_calculated_states - 1], siz=
eof(struct _vcs_dpi_voltage_scaling_st));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_limits[num_calculated_st=
ates].state =3D bb-&gt;num_states;<br>
-}<br>
-<br>
-void dcn20_patch_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_=
box_st *bb)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((int)(bb-&gt;sr_exit_time_us * 10=
00) !=3D dc-&gt;bb_overrides.sr_exit_time_ns<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; dc-&g=
t;bb_overrides.sr_exit_time_ns) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bb-&gt;sr_exit_time_us =3D dc-&gt;bb_overrides.sr_exit_time_ns /=
 1000.0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((int)(bb-&gt;sr_enter_plus_exit_t=
ime_us * 1000)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !=3D dc-&gt;bb_overrides.sr_enter_plus_exit=
_time_ns<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; dc-&g=
t;bb_overrides.sr_enter_plus_exit_time_ns) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bb-&gt;sr_enter_plus_exit_time_us =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;bb_overrides.sr_enter_plus_exit_time=
_ns / 1000.0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((int)(bb-&gt;urgent_latency_us * =
1000) !=3D dc-&gt;bb_overrides.urgent_latency_ns<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; dc-&g=
t;bb_overrides.urgent_latency_ns) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bb-&gt;urgent_latency_us =3D dc-&gt;bb_overrides.urgent_latency_=
ns / 1000.0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((int)(bb-&gt;dram_clock_change_la=
tency_us * 1000)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !=3D dc-&gt;bb_overrides.dram_clock_change_=
latency_ns<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; dc-&g=
t;bb_overrides.dram_clock_change_latency_ns) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bb-&gt;dram_clock_change_latency_us =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;bb_overrides.dram_clock_change_laten=
cy_ns / 1000.0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((int)(bb-&gt;dummy_pstate_latency=
_us * 1000)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !=3D dc-&gt;bb_overrides.dummy_clock_change=
_latency_ns<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; dc-&g=
t;bb_overrides.dummy_clock_change_latency_ns) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bb-&gt;dummy_pstate_latency_us =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;bb_overrides.dummy_clock_change_late=
ncy_ns / 1000.0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-}<br>
-<br>
&nbsp;static struct _vcs_dpi_soc_bounding_box_st *get_asic_rev_soc_bb(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t hw_internal_rev)<=
br>
&nbsp;{<br>
@@ -3910,9 +2576,9 @@ static bool dcn20_resource_construct(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges.reader_wm_sets[i].wm_inst=
 =3D i;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges.reader_wm_sets[i].min_dra=
in_clk_mhz =3D PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MIN;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges.reader_wm_sets[i].max_dra=
in_clk_mhz =3D PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MAX;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges.reader_wm_sets[i].min_fill_clk_mhz =
=3D (i &gt; 0) ? (loaded_bb-&gt;clock_limits[i - 1].dram_speed_mts / 16) + =
1 : 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges.reader_wm_sets[i].max_fill_clk_mhz =
=3D loaded_bb-&gt;clock_limits[i].dram_speed_mts / 16;<br>
-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_START();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_fpu_set_wm_ranges(i, &amp;ranges, loa=
ded_bb);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_END();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges.num_reader_wm_sets =3D i =
+ 1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h b/driver=
s/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h<br>
index 6ec8ff45f0f7..961923c56ea0 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h<br>
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h<br>
@@ -27,6 +27,7 @@<br>
&nbsp;#define __DC_RESOURCE_DCN20_H__<br>
&nbsp;<br>
&nbsp;#include &quot;core_types.h&quot;<br>
+#include &quot;dml/dcn20/dcn20_fpu.h&quot;<br>
&nbsp;<br>
&nbsp;#define TO_DCN20_RES_POOL(pool)\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; container_of(pool, struct =
dcn20_resource_pool, base)<br>
@@ -35,6 +36,12 @@ struct dc;<br>
&nbsp;struct resource_pool;<br>
&nbsp;struct _vcs_dpi_display_pipe_params_st;<br>
&nbsp;<br>
+extern struct _vcs_dpi_ip_params_st dcn2_0_ip;<br>
+extern struct _vcs_dpi_ip_params_st dcn2_0_nv14_ip;<br>
+extern struct _vcs_dpi_soc_bounding_box_st dcn2_0_soc;<br>
+extern struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc;<br>
+extern struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc;<br>
+<br>
&nbsp;struct dcn20_resource_pool {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct resource_pool base;=
<br>
&nbsp;};<br>
@@ -49,11 +56,6 @@ unsigned int dcn20_calc_max_scaled_time(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; unsigned int time_per_pixel,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; enum mmhubbub_wbif_mode mode,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; unsigned int urgent_watermark);<br>
-int dcn20_populate_dml_pipes_from_context(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc *dc,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc_state *context,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; display_e2e_pipe_params_st *pipes,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bool fast_validate);<br>
&nbsp;struct pipe_ctx *dcn20_acquire_idle_pipe_for_layer(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; struct dc_state *state,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; const struct resource_pool *pool,<br>
@@ -79,7 +81,6 @@ struct dpp *dcn20_dpp_create(<br>
&nbsp;struct input_pixel_processor *dcn20_ipp_create(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_context *ctx, ui=
nt32_t inst);<br>
&nbsp;<br>
-<br>
&nbsp;struct output_pixel_processor *dcn20_opp_create(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_context *ctx, ui=
nt32_t inst);<br>
&nbsp;<br>
@@ -96,11 +97,6 @@ struct display_stream_compressor *dcn20_dsc_create(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_context *ctx, ui=
nt32_t inst);<br>
&nbsp;void dcn20_dsc_destroy(struct display_stream_compressor **dsc);<br>
&nbsp;<br>
-void dcn20_cap_soc_clocks(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct _vcs_dpi_soc_bounding_box_st *bb,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct pp_smu_nv_clock_table max_clocks);<br>
-void dcn20_update_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding=
_box_st *bb,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct pp_smu_nv_clock_table *max_clocks, unsigned int *uclk_sta=
tes, unsigned int num_states);<br>
&nbsp;struct hubp *dcn20_hubp_create(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_context *ctx,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t inst);<br>
@@ -158,11 +154,6 @@ bool dcn20_fast_validate_bw(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; int *pipe_split_from,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; int *vlevel_out,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bool fast_validate);<br>
-void dcn20_calculate_dlg_params(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc *dc, struct dc_state *context,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; display_e2e_pipe_params_st *pipes,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int pipe_cnt,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int vlevel);<br>
&nbsp;<br>
&nbsp;enum dc_status dcn20_build_mapped_resource(const struct dc *dc, struc=
t dc_state *context, struct dc_stream_state *stream);<br>
&nbsp;enum dc_status dcn20_add_stream_to_ctx(struct dc *dc, struct dc_state=
 *new_ctx, struct dc_stream_state *dc_stream);<br>
@@ -170,12 +161,5 @@ enum dc_status dcn20_add_dsc_to_stream_resource(struct=
 dc *dc, struct dc_state *<br>
&nbsp;enum dc_status dcn20_remove_stream_from_ctx(struct dc *dc, struct dc_=
state *new_ctx, struct dc_stream_state *dc_stream);<br>
&nbsp;enum dc_status dcn20_patch_unknown_plane_state(struct dc_plane_state =
*plane_state);<br>
&nbsp;<br>
-void dcn20_patch_bounding_box(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc *dc,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct _vcs_dpi_soc_bounding_box_st *bb);<br>
-void dcn20_cap_soc_clocks(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct _vcs_dpi_soc_bounding_box_st *bb,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct pp_smu_nv_clock_table max_clocks);<br>
-<br>
&nbsp;#endif /* __DC_RESOURCE_DCN20_H__ */<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/driver=
s/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c<br>
index e5cc6bf45743..c1cd1a8ff1d7 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c<br>
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c<br>
@@ -1363,7 +1363,9 @@ static noinline bool dcn21_validate_bandwidth_fp(stru=
ct dc *dc,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn21_calculate_wm(dc, con=
text, pipes, &amp;pipe_cnt, pipe_split_from, vlevel, fast_validate);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_START();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_calculate_dlg_params=
(dc, context, pipes, pipe_cnt, vlevel);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_END();<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_END_WATERMARK=
S();<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/driver=
s/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c<br>
index f10f7a0ca02a..8fa08f026c89 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c<br>
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c<br>
@@ -2261,7 +2261,9 @@ static noinline void dcn30_calculate_wm_and_dlg_fp(<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pipe_idx++;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_START();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_calculate_dlg_params=
(dc, context, pipes, pipe_cnt, vlevel);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_END();<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pstate_en)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* Restore full p-state latency */<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/driver=
s/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c<br>
index 660e96a7fe7f..4a9c80482636 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c<br>
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c<br>
@@ -1998,7 +1998,9 @@ static void dcn31_calculate_wm_and_dlg_fp(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pipe_idx++;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_START();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_calculate_dlg_params=
(dc, context, pipes, pipe_cnt, vlevel);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_FP_END();<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;void dcn31_calculate_wm_and_dlg(<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers=
/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c<br>
index d590dc917363..b7adc9b6a543 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c<br>
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c<br>
@@ -25,6 +25,9 @@<br>
&nbsp; */<br>
&nbsp;<br>
&nbsp;#include &quot;resource.h&quot;<br>
+#include &quot;clk_mgr.h&quot;<br>
+#include &quot;dc_link_dp.h&quot;<br>
+#include &quot;dcn20/dcn20_resource.h&quot;<br>
&nbsp;<br>
&nbsp;#include &quot;dcn20_fpu.h&quot;<br>
&nbsp;<br>
@@ -61,6 +64,370 @@<br>
&nbsp; * warning.<br>
&nbsp; */<br>
&nbsp;<br>
+struct _vcs_dpi_ip_params_st dcn2_0_ip =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .odm_capable =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .gpuvm_enable =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hostvm_enable =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .gpuvm_max_page_table_levels =3D 4,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hostvm_max_page_table_levels =3D 4,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hostvm_cached_page_table_levels =3D =
0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pte_group_size_bytes =3D 2048,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_dsc =3D 6,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .rob_buffer_size_kbytes =3D 168,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .det_buffer_size_kbytes =3D 164,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpte_buffer_size_in_pte_reqs_luma =
=3D 84,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pde_proc_buffer_size_64k_reqs =3D 48=
,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpp_output_buffer_pixels =3D 2560,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .opp_output_buffer_lines =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pixel_chunk_size_kbytes =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pte_chunk_size_kbytes =3D 2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .meta_chunk_size_kbytes =3D 2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_chunk_size_kbytes =3D 2,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .line_buffer_size_bits =3D 789504,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .is_line_buffer_bpp_fixed =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .line_buffer_fixed_bpp =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcc_supported =3D true,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_line_buffer_lines =3D 12,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_luma_buffer_size_kbytes =
=3D 12,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_chroma_buffer_size_kbytes =
=3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_chroma_line_buffer_width_p=
ixels =3D 4,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_hscl_ratio =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_vscl_ratio =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_min_hscl_ratio =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_min_vscl_ratio =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_hscl_taps =3D 12,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_vscl_taps =3D 12,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_line_buffer_luma_buffer_si=
ze =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_line_buffer_chroma_buffer_=
size =3D 14643,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cursor_buffer_size =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cursor_chunk_size =3D 2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_num_otg =3D 6,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_num_dpp =3D 6,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_num_wb =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_dchub_pscl_bw_pix_per_clk =3D 4,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pscl_lb_bw_pix_per_clk =3D 2,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_lb_vscl_bw_pix_per_clk =3D 4,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_vscl_hscl_bw_pix_per_clk =3D 4,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_hscl_ratio =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_vscl_ratio =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hscl_mults =3D 4,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vscl_mults =3D 4,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_hscl_taps =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_vscl_taps =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_ramp_margin_percent =3D 1,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .underscan_factor =3D 1.10,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .min_vblank_lines =3D 32, //<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_subtotal =3D 77, //<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_scl_lb_only =3D 16,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_scl =3D 50,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_cnvc_formatter =3D 8,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_cnvc_cursor =3D 6,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_delay_subtotal =3D 87, //<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_cstate_latency =3D 10, // SRE=
xitTime<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_inter_dcn_tile_repeaters =3D 8,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_supported =3D true,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_fill_bw_overhead_percent =3D 10.=
0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_fill_constant_bytes =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .number_of_cursors =3D 1,<br>
+};<br>
+<br>
+struct _vcs_dpi_ip_params_st dcn2_0_nv14_ip =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .odm_capable =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .gpuvm_enable =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hostvm_enable =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .gpuvm_max_page_table_levels =3D 4,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hostvm_max_page_table_levels =3D 4,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hostvm_cached_page_table_levels =3D =
0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_dsc =3D 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .rob_buffer_size_kbytes =3D 168,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .det_buffer_size_kbytes =3D 164,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpte_buffer_size_in_pte_reqs_luma =
=3D 84,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpte_buffer_size_in_pte_reqs_chroma =
=3D 42,//todo<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpp_output_buffer_pixels =3D 2560,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .opp_output_buffer_lines =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pixel_chunk_size_kbytes =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pte_enable =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_page_table_levels =3D 4,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pte_chunk_size_kbytes =3D 2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .meta_chunk_size_kbytes =3D 2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_chunk_size_kbytes =3D 2,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .line_buffer_size_bits =3D 789504,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .is_line_buffer_bpp_fixed =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .line_buffer_fixed_bpp =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcc_supported =3D true,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_line_buffer_lines =3D 12,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_luma_buffer_size_kbytes =
=3D 12,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_chroma_buffer_size_kbytes =
=3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_chroma_line_buffer_width_p=
ixels =3D 4,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_hscl_ratio =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_vscl_ratio =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_min_hscl_ratio =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_min_vscl_ratio =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_hscl_taps =3D 12,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_max_vscl_taps =3D 12,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_line_buffer_luma_buffer_si=
ze =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_line_buffer_chroma_buffer_=
size =3D 14643,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cursor_buffer_size =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cursor_chunk_size =3D 2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_num_otg =3D 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_num_dpp =3D 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_num_wb =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_dchub_pscl_bw_pix_per_clk =3D 4,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pscl_lb_bw_pix_per_clk =3D 2,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_lb_vscl_bw_pix_per_clk =3D 4,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_vscl_hscl_bw_pix_per_clk =3D 4,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_hscl_ratio =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_vscl_ratio =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hscl_mults =3D 4,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vscl_mults =3D 4,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_hscl_taps =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_vscl_taps =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_ramp_margin_percent =3D 1,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .underscan_factor =3D 1.10,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .min_vblank_lines =3D 32, //<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_subtotal =3D 77, //<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_scl_lb_only =3D 16,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_scl =3D 50,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_cnvc_formatter =3D 8,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_delay_cnvc_cursor =3D 6,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_delay_subtotal =3D 87, //<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_cstate_latency =3D 10, // SRE=
xitTime<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_inter_dcn_tile_repeaters =3D 8,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_supported =3D true,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_fill_bw_overhead_percent =3D 10.=
0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_fill_constant_bytes =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ptoi_supported =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .number_of_cursors =3D 1,<br>
+};<br>
+<br>
+<br>
+struct _vcs_dpi_soc_bounding_box_st dcn2_0_soc =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Defaults that get patched on drive=
r load from firmware. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .clock_limits =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 560.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 560.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 513.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 513.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 540.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 560.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 171.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 8960.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 694.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 694.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 642.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 642.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 600.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 694.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 214.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 11104.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 875.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 875.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 734.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 734.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 875.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 245.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 14000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 3,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 1000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 1000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 1100.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 1100.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 1000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 367.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 16000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 4,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 1200.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 1200.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 1284.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 1284.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 1200.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 428.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 16000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*Extra state, n=
o dispclk ramping*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 1200.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 1200.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 1284.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 1284.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 1200.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 428.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 16000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_states =3D 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sr_exit_time_us =3D 8.6,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sr_enter_plus_exit_time_us =3D 10.9,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_us =3D 4.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_pixel_data_only_us =
=3D 4.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_pixel_mixed_with_vm_d=
ata_us =3D 4.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_vm_data_only_us =3D 4=
.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_pixel_only_bytes =3D 4096,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_pixel_and_vm_bytes =3D 4096,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_vm_only_bytes =3D 4096,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pct_ideal_dram_sdp_bw_after_urgent_p=
ixel_only =3D 40.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pct_ideal_dram_sdp_bw_after_urgent_p=
ixel_and_vm =3D 40.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pct_ideal_dram_sdp_bw_after_urgent_v=
m_only =3D 40.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_avg_sdp_bw_use_normal_percent =
=3D 40.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_avg_dram_bw_use_normal_percent =
=3D 40.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_latency_us =3D 12.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ideal_dram_bw_after_urgent_percent =
=3D 40.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_request_size_bytes =3D 256,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_channel_width_bytes =3D 2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabric_datapath_to_dcn_data_return_b=
ytes =3D 64,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcn_downspread_percent =3D 0.5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .downspread_percent =3D 0.38,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_page_open_time_ns =3D 50.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_rw_turnaround_time_ns =3D 17.5,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_return_buffer_per_channel_bytes=
 =3D 8192,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .round_trip_ping_latency_dcfclk_cycle=
s =3D 131,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_bytes =3D 256,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .channel_interleave_bytes =3D 256,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_banks =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_chans =3D 16,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vmm_page_size_bytes =3D 4096,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_clock_change_latency_us =3D 404=
.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dummy_pstate_latency_us =3D 5.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_dram_clock_change_latency_=
us =3D 23.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .return_bus_width_bytes =3D 64,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_dppclk_vco_speed_mhz =3D 385=
0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_bus_transport_time_us =3D 20,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_xbuf_latency_tolerance_us =3D 4,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .use_urgent_burst_bw =3D 0<br>
+};<br>
+<br>
+struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .clock_limits =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 560.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 560.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 513.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 513.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 540.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 560.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 171.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 8960.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 694.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 694.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 642.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 642.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 600.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 694.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 214.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 11104.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 875.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 875.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 734.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 734.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 875.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 245.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 14000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 3,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 1000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 1000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 1100.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 1100.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 1000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 367.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 16000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 4,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 1200.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 1200.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 1284.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 1284.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 1200.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 428.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 16000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*Extra state, n=
o dispclk ramping*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .state =3D 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcfclk_mhz =3D 1200.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabricclk_mhz =3D 1200.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_mhz =3D 1284.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dppclk_mhz =3D 1284.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phyclk_mhz =3D 810.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .socclk_mhz =3D 1200.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dscclk_mhz =3D 428.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_speed_mts =3D 16000.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_states =3D 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sr_exit_time_us =3D 11.6,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sr_enter_plus_exit_time_us =3D 13.9,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_us =3D 4.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_pixel_data_only_us =
=3D 4.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_pixel_mixed_with_vm_d=
ata_us =3D 4.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_latency_vm_data_only_us =3D 4=
.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_pixel_only_bytes =3D 4096,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_pixel_and_vm_bytes =3D 4096,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_vm_only_bytes =3D 4096,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pct_ideal_dram_sdp_bw_after_urgent_p=
ixel_only =3D 40.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pct_ideal_dram_sdp_bw_after_urgent_p=
ixel_and_vm =3D 40.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pct_ideal_dram_sdp_bw_after_urgent_v=
m_only =3D 40.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_avg_sdp_bw_use_normal_percent =
=3D 40.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_avg_dram_bw_use_normal_percent =
=3D 40.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_latency_us =3D 12.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ideal_dram_bw_after_urgent_percent =
=3D 40.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_request_size_bytes =3D 256,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_channel_width_bytes =3D 2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fabric_datapath_to_dcn_data_return_b=
ytes =3D 64,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dcn_downspread_percent =3D 0.5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .downspread_percent =3D 0.38,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_page_open_time_ns =3D 50.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_rw_turnaround_time_ns =3D 17.5,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_return_buffer_per_channel_bytes=
 =3D 8192,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .round_trip_ping_latency_dcfclk_cycle=
s =3D 131,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .urgent_out_of_order_return_per_chann=
el_bytes =3D 256,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .channel_interleave_bytes =3D 256,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_banks =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_chans =3D 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vmm_page_size_bytes =3D 4096,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dram_clock_change_latency_us =3D 404=
.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dummy_pstate_latency_us =3D 5.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .writeback_dram_clock_change_latency_=
us =3D 23.0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .return_bus_width_bytes =3D 64,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dispclk_dppclk_vco_speed_mhz =3D 385=
0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_bus_transport_time_us =3D 20,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .xfc_xbuf_latency_tolerance_us =3D 4,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .use_urgent_burst_bw =3D 0<br>
+};<br>
+<br>
+struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc =3D { 0 };<br>
+<br>
+#define DC_LOGGER_INIT(logger)<br>
+<br>
&nbsp;void dcn20_populate_dml_writeback_from_context(struct dc *dc,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct resource_c=
ontext *res_ctx,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_e2e_pipe_=
params_st *pipes)<br>
@@ -100,3 +467,1021 @@ void dcn20_populate_dml_writeback_from_context(struc=
t dc *dc,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pipe_cnt++;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
+<br>
+void dcn20_fpu_set_wb_arb_params(struct mcif_arb_params *wb_arb_params,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_state *context,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_e2e_pipe_params_st *pipes,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_cnt, int i)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int k;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_assert_fp_enabled();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (k =3D 0; k &lt; sizeof(wb_arb_pa=
rams-&gt;cli_watermark)/sizeof(wb_arb_params-&gt;cli_watermark[0]); k++) {<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; wb_arb_params-&gt;cli_watermark[k] =3D get_wm_writeback_urgent(&=
amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; wb_arb_params-&gt;pstate_watermark[k] =3D get_wm_writeback_dram_=
clock_change(&amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wb_arb_params-&gt;time_per_pixel =3D =
16.0 * 1000 / (context-&gt;res_ctx.pipe_ctx[i].stream-&gt;phy_pix_clk / 100=
0); /* 4 bit fraction, ms */<br>
+}<br>
+<br>
+static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)<br=
>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; dc-&gt;res_pool-=
&gt;pipe_count; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!context-&gt;res_ctx.pipe_ctx[i].stream)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (is_dp_128b_132b_signal(&amp;context-&gt;res_ctx.pipe_ctx[i])=
)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
+}<br>
+<br>
+static enum dcn_zstate_support_state decide_zstate_support(struct dc *dc,s=
truct dc_state *context)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int plane_count;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plane_count =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; dc-&gt;res_pool-=
&gt;pipe_count; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (context-&gt;res_ctx.pipe_ctx[i].plane_state)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plane_count++;<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Zstate is allowed in followin=
g scenarios:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 1. Single eDP with PSR enabled<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 2. 0 planes (No memory requests)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 3. Single eDP without PSR but &gt; 5ms stutter period<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (plane_count =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return DCN_ZSTATE_SUPPORT_ALLOW;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (context-&gt;stream_count =3D=
=3D 1 &amp;&amp;&nbsp; context-&gt;streams[0]-&gt;signal =3D=3D SIGNAL_TYPE=
_EDP) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc_link *link =3D context-&gt;streams[0]-&gt;sink-&gt;lin=
k;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* zstate only supported on PWRSEQ0 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (link-&gt;link_index !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DCN_ZSTAT=
E_SUPPORT_DISALLOW;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (context-&gt;bw_ctx.dml.vba.StutterPeriod &gt; 5000.0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DCN_ZSTAT=
E_SUPPORT_ALLOW;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else if (link-&gt;psr_settings.psr_version =3D=3D DC_PSR_VERSION=
_1 &amp;&amp; !dc-&gt;debug.disable_psr)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DCN_ZSTAT=
E_SUPPORT_ALLOW_Z10_ONLY;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DCN_ZSTAT=
E_SUPPORT_DISALLOW;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return DCN_ZSTATE_SUPPORT_DISALLOW;<br>
+}<br>
+<br>
+void dcn20_calculate_dlg_params(struct dc *dc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_state *context,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_e2e_pipe_params_st *pipes,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_cnt,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int vlevel)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, pipe_idx;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_assert_fp_enabled();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Writeback MCIF_WB arbitration para=
meters */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;res_pool-&gt;funcs-&gt;set_mci=
f_arb_params(dc, context, pipes, pipe_cnt);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dispclk=
_khz =3D context-&gt;bw_ctx.dml.vba.DISPCLK * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dcfclk_=
khz =3D context-&gt;bw_ctx.dml.vba.DCFCLK * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.socclk_=
khz =3D context-&gt;bw_ctx.dml.vba.SOCCLK * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dramclk=
_khz =3D context-&gt;bw_ctx.dml.vba.DRAMSpeed * 1000 / 16;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dc-&gt;debug.min_dram_clk_khz &gt=
; context-&gt;bw_ctx.bw.dcn.clk.dramclk_khz)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dramclk_khz =3D dc-&gt;debug.min_d=
ram_clk_khz;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dcfclk_=
deep_sleep_khz =3D context-&gt;bw_ctx.dml.vba.DCFCLKDeepSleep * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.fclk_kh=
z =3D context-&gt;bw_ctx.dml.vba.FabricClock * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.p_state=
_change_support =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][contex=
t-&gt;bw_ctx.dml.vba.maxMpcComb]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; !=3D dm_dram_clock_change_unsupported;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dppclk_=
khz =3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.zstate_=
support =3D decide_zstate_support(dc, context);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dtbclk_=
en =3D is_dtbclk_required(dc, context);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (context-&gt;bw_ctx.bw.dcn.clk.dis=
pclk_khz &lt; dc-&gt;debug.min_disp_clk_khz)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.dispclk_khz =3D dc-&gt;debug.min_d=
isp_clk_khz;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, pipe_idx =3D 0; i &lt; =
dc-&gt;res_pool-&gt;pipe_count; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!context-&gt;res_ctx.pipe_ctx[i].stream)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_idx].pipe.dest.vstartup_start =3D get_vstartup(&amp;c=
ontext-&gt;bw_ctx.dml, pipes, pipe_cnt, pipe_idx);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_idx].pipe.dest.vupdate_offset =3D get_vupdate_offset(=
&amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt, pipe_idx);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_idx].pipe.dest.vupdate_width =3D get_vupdate_width(&a=
mp;context-&gt;bw_ctx.dml, pipes, pipe_cnt, pipe_idx);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_idx].pipe.dest.vready_offset =3D get_vready_offset(&a=
mp;context-&gt;bw_ctx.dml, pipes, pipe_cnt, pipe_idx);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;res_ctx.pipe_ctx[i].det_buffer_size_kb =3D context-&=
gt;bw_ctx.dml.ip.det_buffer_size_kbytes;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;res_ctx.pipe_ctx[i].unbounded_req =3D pipes[pipe_idx=
].pipe.src.unbounded_req_mode;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (context-&gt;bw_ctx.bw.dcn.clk.dppclk_khz &lt; pipes[pipe_idx=
].clks_cfg.dppclk_mhz * 1000)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_c=
tx.bw.dcn.clk.dppclk_khz =3D pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000;<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_idx].clks_c=
fg.dppclk_mhz * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;res_ctx.pipe_ctx[i].pipe_dlg_param =3D pipes[pipe_id=
x].pipe.dest;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipe_idx++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*save a original dppclock copy*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.bw_dppc=
lk_khz =3D context-&gt;bw_ctx.bw.dcn.clk.dppclk_khz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.bw_disp=
clk_khz =3D context-&gt;bw_ctx.bw.dcn.clk.dispclk_khz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.max_sup=
ported_dppclk_khz =3D context-&gt;bw_ctx.dml.soc.clock_limits[vlevel].dppcl=
k_mhz * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.max_sup=
ported_dispclk_khz =3D context-&gt;bw_ctx.dml.soc.clock_limits[vlevel].disp=
clk_mhz * 1000;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.compbuf_siz=
e_kb =3D context-&gt;bw_ctx.dml.ip.config_return_buffer_size_in_kbytes<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - context-&gt;bw_ctx.d=
ml.ip.det_buffer_size_kbytes * pipe_idx;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, pipe_idx =3D 0; i &lt; =
dc-&gt;res_pool-&gt;pipe_count; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bool cstate_en =3D context-&gt;bw_ctx.dml.vba.PrefetchMode[vleve=
l][context-&gt;bw_ctx.dml.vba.maxMpcComb] !=3D 2;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!context-&gt;res_ctx.pipe_ctx[i].stream)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;ctx-&gt;dce_version =3D=3D DCN_VERSION_2_01)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cstate_en =3D fa=
lse;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.dml.funcs.rq_dlg_get_dlg_reg(&amp;context-&gt=
;bw_ctx.dml,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;context-&gt;res_ctx.pipe_ctx[i].dlg_re=
gs,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;context-&gt;res_ctx.pipe_ctx[i].ttu_re=
gs,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_cnt,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_idx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cstate_en,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.p_state_chang=
e_support,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; false, false, true);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.dml.funcs.rq_dlg_get_rq_reg(&amp;context-&gt;=
bw_ctx.dml,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;context-&gt;res_ctx.pipe_ctx[i].rq_reg=
s,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;pipes[pipe_idx].pipe);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipe_idx++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+}<br>
+<br>
+static void swizzle_to_dml_params(enum swizzle_mode_values swizzle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int *sw_mode)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (swizzle) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_LINEAR:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_linear;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_4KB_S:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_4kb_s;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_4KB_S_X:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_4kb_s_x;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_4KB_D:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_4kb_d;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_4KB_D_X:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_4kb_d_x;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_S:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_s;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_S_X:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_s_x;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_S_T:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_s_t;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_D:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_d;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_D_X:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_d_x;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_D_T:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_d_t;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_64KB_R_X:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_64kb_r_x;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_VAR_S:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_var_s;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_VAR_S_X:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_var_s_x;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_VAR_D:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_var_d;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_VAR_D_X:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_var_d_x;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DC_SW_VAR_R_X:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *sw_mode =3D dm_sw_var_r_x;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ASSERT(0); /* Not supported */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+}<br>
+<br>
+int dcn20_populate_dml_pipes_from_context(struct dc *dc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; struct dc_state *context,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; display_e2e_pipe_params_st *pipes,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bool fast_validate)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_cnt, i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool synchronized_vblank =3D true;<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct resource_context *res_ctx =3D =
&amp;context-&gt;res_ctx;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_assert_fp_enabled();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, pipe_cnt =3D -1; i &lt;=
 dc-&gt;res_pool-&gt;pipe_count; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!res_ctx-&gt;pipe_ctx[i].stream)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (pipe_cnt &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_cnt =3D i;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (res_ctx-&gt;pipe_ctx[pipe_cnt].stream =3D=3D res_ctx-&gt;pip=
e_ctx[i].stream)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;debug.disable_timing_sync ||<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (!resource_are_s=
treams_timing_synchronizable(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res_ctx-&gt;pipe_ctx[pipe_cnt].stream,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res_ctx-&gt;pipe_ctx[i].stream) &amp;&amp;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !resource_are_vb=
lanks_synchronizable(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res_ctx-&gt;pipe_ctx[pipe_cnt].stream,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res_ctx-&gt;pipe_ctx[i].stream))) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; synchronized_vbl=
ank =3D false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, pipe_cnt =3D 0; i &lt; =
dc-&gt;res_pool-&gt;pipe_count; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct dc_crtc_timing *timing =3D &amp;res_ctx-&gt;pipe_ctx[i].s=
tream-&gt;timing;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int v_total;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int front_porch;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int output_bpc;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct audio_check aud_check =3D {0};<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!res_ctx-&gt;pipe_ctx[i].stream)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; v_total =3D timing-&gt;v_total;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; front_porch =3D timing-&gt;v_front_porch;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* todo:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.dynamic_metadata_enable =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.dcc =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.vm =3D 0;*/<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].clks_cfg.refclk_mhz =3D dc-&gt;res_pool-&gt;ref_=
clocks.dchub_ref_clock_inKhz / 1000.0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].dout.dsc_enable =3D res_ctx-&gt;pipe_ctx[i].stre=
am-&gt;timing.flags.DSC;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* todo: rotation?*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].dout.dsc_slices =3D res_ctx-&gt;pipe_ctx[i].stre=
am-&gt;timing.dsc_cfg.num_slices_h;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (res_ctx-&gt;pipe_ctx[i].stream-&gt;use_dynamic_meta) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.dynamic_metadata_enable =3D true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 1/2 vblank */=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.dynamic_metadata_lines_before_active =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (v_total - timing-&gt;v_addressable<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; - timing-&gt;v_border_top - timing-&gt;v_border_bottom) / 2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 36 bytes dp, =
32 hdmi */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.dynamic_metadata_xmit_bytes =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_is_dp_signal(res_ctx-&gt;pipe_ctx[i].str=
eam-&gt;signal) ? 36 : 32;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.dcc =3D false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.dcc_rate =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.synchronized_vblank_all_planes =3D syn=
chronized_vblank;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.hblank_start =3D timing-&gt;h_total - =
timing-&gt;h_front_porch;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.hblank_end =3D pipes[pipe_cnt].pipe.de=
st.hblank_start<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - timing-&gt;h_addressable<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - timing-&gt;h_border_left<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - timing-&gt;h_border_right;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.vblank_start =3D v_total - front_porch=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.vblank_end =3D pipes[pipe_cnt].pipe.de=
st.vblank_start<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - timing-&gt;v_addressable<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - timing-&gt;v_border_top<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - timing-&gt;v_border_bottom;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.htotal =3D timing-&gt;h_total;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.vtotal =3D v_total;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.hactive =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timing-&gt;h_add=
ressable + timing-&gt;h_border_left + timing-&gt;h_border_right;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.vactive =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timing-&gt;v_add=
ressable + timing-&gt;v_border_top + timing-&gt;v_border_bottom;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.interlaced =3D timing-&gt;flags.INTERL=
ACE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.pixel_rate_mhz =3D timing-&gt;pix_clk_=
100hz/10000.0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (timing-&gt;timing_3d_format =3D=3D TIMING_3D_FORMAT_HW_FRAME=
_PACKING)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.pixel_rate_mhz *=3D 2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.otg_inst =3D res_ctx-&gt;pipe_ctx[i].s=
tream_res.tg-&gt;inst;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].dout.dp_lanes =3D 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].dout.is_virtual =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.vtotal_min =3D res_ctx-&gt;pipe_ctx[i]=
.stream-&gt;adjust.v_total_min;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.dest.vtotal_max =3D res_ctx-&gt;pipe_ctx[i]=
.stream-&gt;adjust.v_total_max;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; switch (get_num_odm_splits(&amp;res_ctx-&gt;pipe_ctx[i])) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case 1:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.odm_combine =3D dm_odm_combine_mode_2to1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case 3:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.odm_combine =3D dm_odm_combine_mode_4to1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; default:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.odm_combine =3D dm_odm_combine_mode_disabled;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.hsplit_grp =3D res_ctx-&gt;pipe_ctx[i].=
pipe_idx;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (res_ctx-&gt;pipe_ctx[i].top_pipe &amp;&amp; res_ctx-&gt;pipe=
_ctx[i].top_pipe-&gt;plane_state<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=3D res_ctx-&gt;pipe_ctx[i].plane_state)=
 {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pipe_ctx =
*first_pipe =3D res_ctx-&gt;pipe_ctx[i].top_pipe;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int split_idx =
=3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (first_pip=
e-&gt;top_pipe &amp;&amp; first_pipe-&gt;top_pipe-&gt;plane_state<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; =3D=3D res_ctx-&gt;pipe_ctx[i].plane_state) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first_pipe =3D first_pipe-&gt;top_pipe;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; split_idx++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Treat 4to1 mp=
c combine as an mpo of 2 2-to-1 combines */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (split_idx =
=3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.hsplit_grp =3D fir=
st_pipe-&gt;pipe_idx;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (split_i=
dx =3D=3D 1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.hsplit_grp =3D res=
_ctx-&gt;pipe_ctx[i].pipe_idx;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (split_i=
dx =3D=3D 2)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.hsplit_grp =3D res=
_ctx-&gt;pipe_ctx[i].top_pipe-&gt;pipe_idx;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else if (res_ctx-&gt;pipe_ctx[i].prev_odm_pipe) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pipe_ctx =
*first_pipe =3D res_ctx-&gt;pipe_ctx[i].prev_odm_pipe;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (first_pip=
e-&gt;prev_odm_pipe)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first_pipe =3D first_pipe-&gt;prev_odm_pipe=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.hsplit_grp =3D first_pipe-&gt;pipe_idx;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; switch (res_ctx-&gt;pipe_ctx[i].stream-&gt;signal) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SIGNAL_TYPE_DISPLAY_PORT_MST:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SIGNAL_TYPE_DISPLAY_PORT:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_type =3D dm_dp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SIGNAL_TYPE_EDP:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_type =3D dm_edp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SIGNAL_TYPE_HDMI_TYPE_A:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SIGNAL_TYPE_DVI_SINGLE_LINK:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SIGNAL_TYPE_DVI_DUAL_LINK:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_type =3D dm_hdmi;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; default:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* In case there=
 is no signal, set dp with 4 lanes to allow max config */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.is_virtual =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_type =3D dm_dp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.dp_lanes =3D 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; switch (res_ctx-&gt;pipe_ctx[i].stream-&gt;timing.display_color_=
depth) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_666:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 6=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_888:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 8=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_101010:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 1=
0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_121212:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 1=
2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_141414:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 1=
4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_161616:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 1=
6;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_999:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 9=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case COLOR_DEPTH_111111:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 1=
1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; default:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_bpc =3D 8=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; switch (res_ctx-&gt;pipe_ctx[i].stream-&gt;timing.pixel_encoding=
) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case PIXEL_ENCODING_RGB:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case PIXEL_ENCODING_YCBCR444:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_format =3D dm_444;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_bpp =3D output_bpc * 3;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case PIXEL_ENCODING_YCBCR420:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_format =3D dm_420;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_bpp =3D (output_bpc * 3.0) / 2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case PIXEL_ENCODING_YCBCR422:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (res_ctx-&gt;=
pipe_ctx[i].stream-&gt;timing.flags.DSC &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; !res_ctx-&gt;pipe_ctx[i].stream-&gt;timing.dsc_cfg.ycbcr422_simple)=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].dout.output_format =3D dm_n=
422;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].dout.output_format =3D dm_s=
422;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_bpp =3D output_bpc * 2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; default:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_format =3D dm_444;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_bpp =3D output_bpc * 3;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (res_ctx-&gt;pipe_ctx[i].stream-&gt;timing.flags.DSC)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
dout.output_bpp =3D res_ctx-&gt;pipe_ctx[i].stream-&gt;timing.dsc_cfg.bits_=
per_pixel / 16.0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* todo: default max for now, until there is logic reflecting th=
is in dc*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].dout.dsc_input_bpc =3D 12;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /*fill up the audio sample rate (unit in kHz)*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; get_audio_check(&amp;res_ctx-&gt;pipe_ctx[i].stream-&gt;audio_in=
fo, &amp;aud_check);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].dout.max_audio_sample_rate =3D aud_check.max_aud=
iosample_rate / 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * For graphic plane, cursor number is 1, nv12 is 0<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * bw calculations due to cursor on/off<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (res_ctx-&gt;pipe_ctx[i].plane_state &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res_ctx-&gt;pipe_ctx[i].plane_state-&gt;add=
ress.type =3D=3D PLN_ADDR_TYPE_VIDEO_PROGRESSIVE)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.num_cursors =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.num_cursors =3D dc-&gt;dml.ip.number_of_cursors;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.cur0_src_width =3D 256;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].pipe.src.cur0_bpp =3D dm_cur_32bit;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!res_ctx-&gt;pipe_ctx[i].plane_state) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.is_hsplit =3D pipes[pipe_cnt].pipe.dest.odm_combine !=3D dm_odm_co=
mbine_mode_disabled;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.source_scan =3D dm_horz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.sw_mode =3D dm_sw_4kb_s;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.macro_tile_size =3D dm_64k_tile;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_width =3D timing-&gt;h_addressable;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipes[pipe_c=
nt].pipe.src.viewport_width &gt; 1920)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.viewport_width =3D=
 1920;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_height =3D timing-&gt;v_addressable;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipes[pipe_c=
nt].pipe.src.viewport_height &gt; 1080)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.viewport_height =
=3D 1080;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_height_y =3D pipes[pipe_cnt].pipe.src.viewport_height;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_width_y =3D pipes[pipe_cnt].pipe.src.viewport_width;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_height_c =3D pipes[pipe_cnt].pipe.src.viewport_height;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_width_c =3D pipes[pipe_cnt].pipe.src.viewport_width;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.data_pitch =3D ((pipes[pipe_cnt].pipe.src.viewport_width + 255) / =
256) * 256;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.source_format =3D dm_444_32;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.recout_width =3D pipes[pipe_cnt].pipe.src.viewport_width; /*vp_wi=
dth/hratio*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.recout_height =3D pipes[pipe_cnt].pipe.src.viewport_height; /*vp_=
height/vratio*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.full_recout_width =3D pipes[pipe_cnt].pipe.dest.recout_width;&nbs=
p; /*when is_hsplit !=3D 1*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.full_recout_height =3D pipes[pipe_cnt].pipe.dest.recout_height; /=
*when is_hsplit !=3D 1*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.lb_depth =3D dm_lb_16;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.hscl_ratio =3D 1.0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.vscl_ratio =3D 1.0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.scl_enable =3D 0; /*Lb only or Full scl*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_taps.htaps =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_taps.vtaps =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.vtotal_min =3D v_total;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.vtotal_max =3D v_total;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipes[pipe_c=
nt].pipe.dest.odm_combine =3D=3D dm_odm_combine_mode_2to1) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.viewport_width /=
=3D 2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.recout_width /=3D=
 2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (pipes=
[pipe_cnt].pipe.dest.odm_combine =3D=3D dm_odm_combine_mode_4to1) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.viewport_width /=
=3D 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.recout_width /=3D=
 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_plane_=
state *pln =3D res_ctx-&gt;pipe_ctx[i].plane_state;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct scaler_da=
ta *scl =3D &amp;res_ctx-&gt;pipe_ctx[i].plane_res.scl_data;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.immediate_flip =3D pln-&gt;flip_immediate;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.is_hsplit =3D (res_ctx-&gt;pipe_ctx[i].bottom_pipe &amp;&amp; res_=
ctx-&gt;pipe_ctx[i].bottom_pipe-&gt;plane_state =3D=3D pln)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || (res_ctx-&gt;pipe_ctx[i].top_pipe &amp;&amp; res_ctx-&gt;pipe_ctx[i=
].top_pipe-&gt;plane_state =3D=3D pln)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || pipes[pipe_cnt].pipe.dest.odm_combine !=3D dm_odm_combine_mode_disa=
bled;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* stereo is not=
 split */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pln-&gt;ster=
eo_format =3D=3D PLANE_STEREO_FORMAT_SIDE_BY_SIDE ||<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pln-&gt;stereo_format =3D=3D PLANE_STEREO_FORMAT_TOP_AND_BOTTOM) {<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.is_hsplit =3D fals=
e;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.hsplit_grp =3D res=
_ctx-&gt;pipe_ctx[i].pipe_idx;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.source_scan =3D pln-&gt;rotation =3D=3D ROTATION_ANGLE_90<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || pln-&gt;rotation =3D=3D ROTATION_ANGLE_270 ? dm_vert : dm_horz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_y_y =3D scl-&gt;viewport.y;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_y_c =3D scl-&gt;viewport_c.y;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_width =3D scl-&gt;viewport.width;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_width_c =3D scl-&gt;viewport_c.width;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_height =3D scl-&gt;viewport.height;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_height_c =3D scl-&gt;viewport_c.height;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_width_max =3D pln-&gt;src_rect.width;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.viewport_height_max =3D pln-&gt;src_rect.height;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_width_y =3D pln-&gt;plane_size.surface_size.width;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_height_y =3D pln-&gt;plane_size.surface_size.height;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_width_c =3D pln-&gt;plane_size.chroma_size.width;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.surface_height_c =3D pln-&gt;plane_size.chroma_size.height;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pln-&gt;form=
at =3D=3D SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || pln-&gt;format &gt;=3D SURFACE_PIXEL_FORMAT_VIDEO_BEGIN) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.data_pitch =3D pln=
-&gt;plane_size.surface_pitch;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.data_pitch_c =3D p=
ln-&gt;plane_size.chroma_pitch;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.meta_pitch =3D pln=
-&gt;dcc.meta_pitch;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.meta_pitch_c =3D p=
ln-&gt;dcc.meta_pitch_c;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.data_pitch =3D pln=
-&gt;plane_size.surface_pitch;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.meta_pitch =3D pln=
-&gt;dcc.meta_pitch;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.dcc =3D pln-&gt;dcc.enable;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.recout_width =3D scl-&gt;recout.width;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.recout_height =3D scl-&gt;recout.height;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.full_recout_height =3D scl-&gt;recout.height;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.dest.full_recout_width =3D scl-&gt;recout.width;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipes[pipe_c=
nt].pipe.dest.odm_combine =3D=3D dm_odm_combine_mode_2to1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.full_recout_width=
 *=3D 2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (pipes[p=
ipe_cnt].pipe.dest.odm_combine =3D=3D dm_odm_combine_mode_4to1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.full_recout_width=
 *=3D 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pipe_ctx *split_pipe =3D res_ctx-&gt=
;pipe_ctx[i].bottom_pipe;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (split_pipe &amp;&amp; split_pipe-&gt=
;plane_state =3D=3D pln) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pipes[pipe_cnt].pipe.dest.full_recout_width +=3D split_pipe-&gt;plane_=
res.scl_data.recout.width;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; split_pipe =3D split_pipe-&gt;bottom_pipe;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; split_pipe =3D res_ctx-&gt;pipe_ctx[i].top_=
pipe;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (split_pipe &amp;&amp; split_pipe-&gt=
;plane_state =3D=3D pln) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pipes[pipe_cnt].pipe.dest.full_recout_width +=3D split_pipe-&gt;plane_=
res.scl_data.recout.width;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; split_pipe =3D split_pipe-&gt;top_pipe;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.lb_depth =3D dm_lb_16;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.hscl_ratio =3D (double) scl-&gt;ratios.horz.value / =
(1ULL&lt;&lt;32);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.hscl_ratio_c =3D (double) scl-&gt;ratios.horz_c.valu=
e / (1ULL&lt;&lt;32);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.vscl_ratio =3D (double) scl-&gt;ratios.vert.value / =
(1ULL&lt;&lt;32);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.vscl_ratio_c =3D (double) scl-&gt;ratios.vert_c.valu=
e / (1ULL&lt;&lt;32);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_ratio_depth.scl_enable =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; scl-&gt;ratios.vert.value !=3D dc_fixpt_one.value<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || scl-&gt;ratios.horz.value !=3D dc_fixpt_one.value<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || scl-&gt;ratios.vert_c.value !=3D dc_fixpt_one.value<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || scl-&gt;ratios.horz_c.value !=3D dc_fixpt_one.value /*Lb only or Fu=
ll scl*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; || dc-&gt;debug.always_scale; /*support always scale*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_taps.htaps =3D scl-&gt;taps.h_taps;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_taps.htaps_c =3D scl-&gt;taps.h_taps_c;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_taps.vtaps =3D scl-&gt;taps.v_taps;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.scale_taps.vtaps_c =3D scl-&gt;taps.v_taps_c;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
pipe.src.macro_tile_size =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; swizzle_mode_to_macro_tile_size(pln-&gt;tiling_info.gfx9.swizzle);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swizzle_to_dml_p=
arams(pln-&gt;tiling_info.gfx9.swizzle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &amp;pipes[pipe_cnt].pipe.src.sw_mode);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (pln-&gt;=
format) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_VIDEO_420_YCbCr:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_VIDEO_420_YCrCb:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_420_8;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_VIDEO_420_10bpc_YCbCr:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_VIDEO_420_10bpc_YCrCb:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_420_10;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_ARGB16161616:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_ABGR16161616:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_ARGB16161616F:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_ABGR16161616F:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_64;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_ARGB1555:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_RGB565:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_16;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_PALETA_256_COLORS:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_8;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SURFACE_PIX=
EL_FORMAT_GRPH_RGBE_ALPHA:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_rgbe_alpha;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.src.source_format =3D =
dm_444_32;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipe_cnt++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* populate writeback information */<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;res_pool-&gt;funcs-&gt;populat=
e_dml_writeback_from_context(dc, res_ctx, pipes);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return pipe_cnt;<br>
+}<br>
+<br>
+void dcn20_calculate_wm(struct dc *dc, struct dc_state *context,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_e2e_pipe=
_params_st *pipes,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *out_pipe_cn=
t,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *pipe_split_=
from,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int vlevel,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool fast_valida=
te)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_cnt, i, pipe_idx;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_assert_fp_enabled();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, pipe_idx =3D 0, pipe_cn=
t =3D 0; i &lt; dc-&gt;res_pool-&gt;pipe_count; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!context-&gt;res_ctx.pipe_ctx[i].stream)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].clks_cfg.refclk_mhz =3D dc-&gt;res_pool-&gt;ref_=
clocks.dchub_ref_clock_inKhz / 1000.0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[pipe_cnt].clks_cfg.dispclk_mhz =3D context-&gt;bw_ctx.dml.=
vba.RequiredDISPCLK[vlevel][context-&gt;bw_ctx.dml.vba.maxMpcComb];<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (pipe_split_from[i] &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
clks_cfg.dppclk_mhz =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; context-&gt;bw_ctx.dml.vba.RequiredDPPCLK[vlevel][context-&gt;bw_ctx.d=
ml.vba.maxMpcComb][pipe_idx];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (context-&gt;=
bw_ctx.dml.vba.BlendingAndTiming[pipe_idx] =3D=3D pipe_idx)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.odm_combine =3D<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.dml=
.vba.ODMCombineEnabled[pipe_idx];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.odm_combine =3D 0=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_idx++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
clks_cfg.dppclk_mhz =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; context-&gt;bw_ctx.dml.vba.RequiredDPPCLK[vlevel][context-&gt;bw_ctx.d=
ml.vba.maxMpcComb][pipe_split_from[i]];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (context-&gt;=
bw_ctx.dml.vba.BlendingAndTiming[pipe_split_from[i]] =3D=3D pipe_split_from=
[i])<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.odm_combine =3D<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.dml=
.vba.ODMCombineEnabled[pipe_split_from[i]];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].pipe.dest.odm_combine =3D 0=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;config.forced_clocks) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
clks_cfg.dispclk_mhz =3D context-&gt;bw_ctx.dml.soc.clock_limits[0].dispclk=
_mhz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
clks_cfg.dppclk_mhz =3D context-&gt;bw_ctx.dml.soc.clock_limits[0].dppclk_m=
hz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;debug.min_disp_clk_khz &gt; pipes[pipe_cnt].clks_cfg.=
dispclk_mhz * 1000)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
clks_cfg.dispclk_mhz =3D dc-&gt;debug.min_disp_clk_khz / 1000.0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;debug.min_dpp_clk_khz &gt; pipes[pipe_cnt].clks_cfg.d=
ppclk_mhz * 1000)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_cnt].=
clks_cfg.dppclk_mhz =3D dc-&gt;debug.min_dpp_clk_khz / 1000.0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipe_cnt++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipe_cnt !=3D pipe_idx) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dc-&gt;res_pool-&gt;funcs-&gt;populate_dml_pipes)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_cnt =3D dc-=
&gt;res_pool-&gt;funcs-&gt;populate_dml_pipes(dc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context, pipes, fast_validate);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_cnt =3D dcn=
20_populate_dml_pipes_from_context(dc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context, pipes, fast_validate);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *out_pipe_cnt =3D pipe_cnt;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[0].clks_cfg.voltage =3D vlevel;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[0].clks_cfg.dcfclk_mhz =3D cont=
ext-&gt;bw_ctx.dml.soc.clock_limits[vlevel].dcfclk_mhz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[0].clks_cfg.socclk_mhz =3D cont=
ext-&gt;bw_ctx.dml.soc.clock_limits[vlevel].socclk_mhz;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* only pipe 0 is read for voltage an=
d dcf/soc clocks */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vlevel &lt; 1) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.voltage =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.dcfclk_mhz =3D context-&gt;bw_ctx.dml.soc.cloc=
k_limits[1].dcfclk_mhz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.socclk_mhz =3D context-&gt;bw_ctx.dml.soc.cloc=
k_limits[1].socclk_mhz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.urgent_ns =3D get_wm_urgent(&amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.cstate_pstate.cstate_enter_plus_exit_ns =3D get_wm_stutter_enter_exit(&am=
p;context-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.cstate_pstate.cstate_exit_ns =3D get_wm_stutter_exit(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.cstate_pstate.pstate_change_ns =3D get_wm_dram_clock_change(&amp;context-=
&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.pte_meta_urgent_ns =3D get_wm_memory_trip(&amp;context-&gt;bw_ctx.dml, pi=
pes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.frac_urg_bw_nom =3D get_fraction_of_urgent_bandwidth(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.frac_urg_bw_flip =3D get_fraction_of_urgent_bandwidth_imm_flip(&amp;conte=
xt-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
b.urgent_latency_ns =3D get_urgent_latency(&amp;context-&gt;bw_ctx.dml, pip=
es, pipe_cnt) * 1000;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vlevel &lt; 2) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.voltage =3D 2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.dcfclk_mhz =3D context-&gt;bw_ctx.dml.soc.cloc=
k_limits[2].dcfclk_mhz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.socclk_mhz =3D context-&gt;bw_ctx.dml.soc.cloc=
k_limits[2].socclk_mhz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.urgent_ns =3D get_wm_urgent(&amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.cstate_pstate.cstate_enter_plus_exit_ns =3D get_wm_stutter_enter_exit(&am=
p;context-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.cstate_pstate.cstate_exit_ns =3D get_wm_stutter_exit(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.cstate_pstate.pstate_change_ns =3D get_wm_dram_clock_change(&amp;context-=
&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.pte_meta_urgent_ns =3D get_wm_memory_trip(&amp;context-&gt;bw_ctx.dml, pi=
pes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.frac_urg_bw_nom =3D get_fraction_of_urgent_bandwidth(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
c.frac_urg_bw_flip =3D get_fraction_of_urgent_bandwidth_imm_flip(&amp;conte=
xt-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vlevel &lt; 3) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.voltage =3D 3;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.dcfclk_mhz =3D context-&gt;bw_ctx.dml.soc.cloc=
k_limits[2].dcfclk_mhz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pipes[0].clks_cfg.socclk_mhz =3D context-&gt;bw_ctx.dml.soc.cloc=
k_limits[2].socclk_mhz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.urgent_ns =3D get_wm_urgent(&amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.cstate_pstate.cstate_enter_plus_exit_ns =3D get_wm_stutter_enter_exit(&am=
p;context-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.cstate_pstate.cstate_exit_ns =3D get_wm_stutter_exit(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.cstate_pstate.pstate_change_ns =3D get_wm_dram_clock_change(&amp;context-=
&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.pte_meta_urgent_ns =3D get_wm_memory_trip(&amp;context-&gt;bw_ctx.dml, pi=
pes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.frac_urg_bw_nom =3D get_fraction_of_urgent_bandwidth(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
d.frac_urg_bw_flip =3D get_fraction_of_urgent_bandwidth_imm_flip(&amp;conte=
xt-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[0].clks_cfg.voltage =3D vlevel;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[0].clks_cfg.dcfclk_mhz =3D cont=
ext-&gt;bw_ctx.dml.soc.clock_limits[vlevel].dcfclk_mhz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[0].clks_cfg.socclk_mhz =3D cont=
ext-&gt;bw_ctx.dml.soc.clock_limits[vlevel].socclk_mhz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.urgent_ns =3D get_wm_urgent(&amp;context-&gt;bw_ctx.dml, pipes, pipe_cnt)=
 * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.cstate_pstate.cstate_enter_plus_exit_ns =3D get_wm_stutter_enter_exit(&am=
p;context-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.cstate_pstate.cstate_exit_ns =3D get_wm_stutter_exit(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.cstate_pstate.pstate_change_ns =3D get_wm_dram_clock_change(&amp;context-=
&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.pte_meta_urgent_ns =3D get_wm_memory_trip(&amp;context-&gt;bw_ctx.dml, pi=
pes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.frac_urg_bw_nom =3D get_fraction_of_urgent_bandwidth(&amp;context-&gt;bw_=
ctx.dml, pipes, pipe_cnt) * 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.bw.dcn.watermarks.=
a.frac_urg_bw_flip =3D get_fraction_of_urgent_bandwidth_imm_flip(&amp;conte=
xt-&gt;bw_ctx.dml, pipes, pipe_cnt) * 1000;<br>
+}<br>
+<br>
+void dcn20_update_bounding_box(struct dc *dc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct _vcs_dpi_soc_bounding_box_st *bb,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct pp_smu_nv_clock_table *max_clocks,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int *uclk_states,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int num_states)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct _vcs_dpi_voltage_scaling_st ca=
lculated_states[DC__VOLTAGE_STATES];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int num_calculated_states =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int min_dcfclk =3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_assert_fp_enabled();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_states =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(calculated_states, 0, sizeof(c=
alculated_states));<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dc-&gt;bb_overrides.min_dcfclk_mh=
z &gt; 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; min_dcfclk =3D dc-&gt;bb_overrides.min_dcfclk_mhz;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (ASICREV_IS_NAVI12_P(dc-&gt;ctx-&gt;asic_id.hw_internal_rev))=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min_dcfclk =3D 3=
10;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Accounting fo=
r SOC/DCF relationship, we can go as high as<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 506Mhz in Vmi=
n.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min_dcfclk =3D 5=
06;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; num_states; i++)=
 {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int min_fclk_required_by_uclk;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].state =3D i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].dram_speed_mts =3D uclk_states[i] * 16 / 10=
00;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; // FCLK:UCLK ratio is 1.08<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; min_fclk_required_by_uclk =3D div_u64(((unsigned long long)uclk_=
states[i]) * 1080,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1000000);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].fabricclk_mhz =3D (min_fclk_required_by_ucl=
k &lt; min_dcfclk) ?<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min_dcfclk : min_fclk_required_by_uclk;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].socclk_mhz =3D (calculated_states[i].fabric=
clk_mhz &gt; max_clocks-&gt;socClockInKhz / 1000) ?<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_clocks-&gt;socClockInKhz / 1000 : calcu=
lated_states[i].fabricclk_mhz;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].dcfclk_mhz =3D (calculated_states[i].fabric=
clk_mhz &gt; max_clocks-&gt;dcfClockInKhz / 1000) ?<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_clocks-&gt;dcfClockInKhz / 1000 : calcu=
lated_states[i].fabricclk_mhz;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].dispclk_mhz =3D max_clocks-&gt;displayClock=
InKhz / 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].dppclk_mhz =3D max_clocks-&gt;displayClockI=
nKhz / 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].dscclk_mhz =3D max_clocks-&gt;displayClockI=
nKhz / (1000 * 3);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; calculated_states[i].phyclk_mhz =3D max_clocks-&gt;phyClockInKhz=
 / 1000;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; num_calculated_states++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; calculated_states[num_calculated_stat=
es - 1].socclk_mhz =3D max_clocks-&gt;socClockInKhz / 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; calculated_states[num_calculated_stat=
es - 1].fabricclk_mhz =3D max_clocks-&gt;socClockInKhz / 1000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; calculated_states[num_calculated_stat=
es - 1].dcfclk_mhz =3D max_clocks-&gt;dcfClockInKhz / 1000;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(bb-&gt;clock_limits, calculate=
d_states, sizeof(bb-&gt;clock_limits));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;num_states =3D num_calculated_=
states;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Duplicate the last state, DML alwa=
ys an extra state identical to max state to work<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;bb-&gt;clock_limits[num_c=
alculated_states], &amp;bb-&gt;clock_limits[num_calculated_states - 1], siz=
eof(struct _vcs_dpi_voltage_scaling_st));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_limits[num_calculated_st=
ates].state =3D bb-&gt;num_states;<br>
+}<br>
+<br>
+void dcn20_cap_soc_clocks(struct _vcs_dpi_soc_bounding_box_st *bb,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stru=
ct pp_smu_nv_clock_table max_clocks)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_assert_fp_enabled();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // First pass - cap all clocks higher=
 than the reported max<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; bb-&gt;num_state=
s; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].dcfclk_mhz &gt; (max_clocks.dcfClock=
InKhz / 1000))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.dcfClockInKhz !=3D 0)=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].dcfclk_mhz =3D (max_clocks.dcfClockInKhz / 1000);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].dram_speed_mts &gt; (max_clocks.uClo=
ckInKhz / 1000) * 16)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
uClockInKhz !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].dram_speed_mts =3D (max_clocks.uClockInKhz / 1000) * 16;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].fabricclk_mhz &gt; (max_clocks.fabri=
cClockInKhz / 1000))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
fabricClockInKhz !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].fabricclk_mhz =3D (max_clocks.fabricClockInKhz / 1000);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].dispclk_mhz &gt; (max_clocks.display=
ClockInKhz / 1000))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
displayClockInKhz !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].dispclk_mhz =3D (max_clocks.displayClockInKhz / 1000);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].dppclk_mhz &gt; (max_clocks.dppClock=
InKhz / 1000))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
dppClockInKhz !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].dppclk_mhz =3D (max_clocks.dppClockInKhz / 1000);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].phyclk_mhz &gt; (max_clocks.phyClock=
InKhz / 1000))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
phyClockInKhz !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].phyclk_mhz =3D (max_clocks.phyClockInKhz / 1000);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].socclk_mhz &gt; (max_clocks.socClock=
InKhz / 1000))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
socClockInKhz !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].socclk_mhz =3D (max_clocks.socClockInKhz / 1000);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((bb-&gt;clock_limits[i].dscclk_mhz &gt; (max_clocks.dscClock=
InKhz / 1000))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; max_clocks.=
dscClockInKhz !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;clock_lim=
its[i].dscclk_mhz =3D (max_clocks.dscClockInKhz / 1000);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Second pass - remove all duplicate=
 clock states<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D bb-&gt;num_states - 1; i &=
gt; 1; i--) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bool duplicate =3D true;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].dcfclk_mhz !=3D bb-&gt;clock_limits=
[i].dcfclk_mhz)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].dispclk_mhz !=3D bb-&gt;clock_limit=
s[i].dispclk_mhz)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].dppclk_mhz !=3D bb-&gt;clock_limits=
[i].dppclk_mhz)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].dram_speed_mts !=3D bb-&gt;clock_li=
mits[i].dram_speed_mts)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].dscclk_mhz !=3D bb-&gt;clock_limits=
[i].dscclk_mhz)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].fabricclk_mhz !=3D bb-&gt;clock_lim=
its[i].fabricclk_mhz)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].phyclk_mhz !=3D bb-&gt;clock_limits=
[i].phyclk_mhz)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (bb-&gt;clock_limits[i-1].socclk_mhz !=3D bb-&gt;clock_limits=
[i].socclk_mhz)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duplicate =3D fa=
lse;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (duplicate)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb-&gt;num_state=
s--;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+}<br>
+<br>
+void dcn20_patch_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_=
box_st *bb)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_assert_fp_enabled();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((int)(bb-&gt;sr_exit_time_us * 10=
00) !=3D dc-&gt;bb_overrides.sr_exit_time_ns<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; dc-&g=
t;bb_overrides.sr_exit_time_ns) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bb-&gt;sr_exit_time_us =3D dc-&gt;bb_overrides.sr_exit_time_ns /=
 1000.0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((int)(bb-&gt;sr_enter_plus_exit_t=
ime_us * 1000)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !=3D dc-&gt;bb_overrides.sr_enter_plus_exit=
_time_ns<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; dc-&g=
t;bb_overrides.sr_enter_plus_exit_time_ns) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bb-&gt;sr_enter_plus_exit_time_us =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;bb_overrides.sr_enter_plus_exit_time=
_ns / 1000.0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((int)(bb-&gt;urgent_latency_us * =
1000) !=3D dc-&gt;bb_overrides.urgent_latency_ns<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; dc-&g=
t;bb_overrides.urgent_latency_ns) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bb-&gt;urgent_latency_us =3D dc-&gt;bb_overrides.urgent_latency_=
ns / 1000.0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((int)(bb-&gt;dram_clock_change_la=
tency_us * 1000)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !=3D dc-&gt;bb_overrides.dram_clock_change_=
latency_ns<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; dc-&g=
t;bb_overrides.dram_clock_change_latency_ns) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bb-&gt;dram_clock_change_latency_us =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;bb_overrides.dram_clock_change_laten=
cy_ns / 1000.0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((int)(bb-&gt;dummy_pstate_latency=
_us * 1000)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !=3D dc-&gt;bb_overrides.dummy_clock_change=
_latency_ns<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; dc-&g=
t;bb_overrides.dummy_clock_change_latency_ns) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bb-&gt;dummy_pstate_latency_us =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc-&gt;bb_overrides.dummy_clock_change_late=
ncy_ns / 1000.0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+}<br>
+<br>
+static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_sta=
te *context,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bool fast_validate)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool out =3D false;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_SETUP();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int vlevel =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_split_from[MAX_PIPES];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_cnt =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_e2e_pipe_params_st *pipes =3D=
 kzalloc(dc-&gt;res_pool-&gt;pipe_count * sizeof(display_e2e_pipe_params_st=
), GFP_ATOMIC);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_LOGGER_INIT(dc-&gt;ctx-&gt;logger)=
;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_COUNT();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out =3D dcn20_fast_validate_bw(dc, co=
ntext, pipes, &amp;pipe_cnt, pipe_split_from, &amp;vlevel, fast_validate);<=
br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipe_cnt =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto validate_out;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!out)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto validate_fail;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_END_VOLTAGE_LEVEL();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fast_validate) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; BW_VAL_TRACE_SKIP(fast);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto validate_out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_calculate_wm(dc, context, pipes=
, &amp;pipe_cnt, pipe_split_from, vlevel, fast_validate);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_calculate_dlg_params(dc, contex=
t, pipes, pipe_cnt, vlevel);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_END_WATERMARKS();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto validate_out;<br>
+<br>
+validate_fail:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_LOG_WARNING(&quot;Mode Validation =
Warning: %s failed validation.\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; dml_get_status_message(context-&gt;bw_ctx.dml.vba.ValidationStat=
us[context-&gt;bw_ctx.dml.vba.soc.num_states]));<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_SKIP(fail);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out =3D false;<br>
+<br>
+validate_out:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(pipes);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_FINISH();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return out;<br>
+}<br>
+<br>
+bool dcn20_validate_bandwidth_fp(struct dc *dc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_state *context,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool fast_validate)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool voltage_supported =3D false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool full_pstate_supported =3D false;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool dummy_pstate_supported =3D false=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; double p_state_latency_us;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_assert_fp_enabled();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p_state_latency_us =3D context-&gt;bw=
_ctx.dml.soc.dram_clock_change_latency_us;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.dml.soc.disable_dr=
am_clock_change_vactive_support =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; dc-&gt;debug.disable_dram_clock_change_vactive_support;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.dml.soc.allow_dram=
_clock_one_display_vactive =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; dc-&gt;debug.enable_dram_clock_change_one_display_vactive;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*Unsafe due to current pipe merge an=
d split logic*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSERT(context !=3D dc-&gt;current_st=
ate);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fast_validate) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return dcn20_validate_bandwidth_internal(dc, context, true);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Best case, we support full UCLK sw=
itch latency<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; voltage_supported =3D dcn20_validate_=
bandwidth_internal(dc, context, false);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; full_pstate_supported =3D context-&gt=
;bw_ctx.bw.dcn.clk.p_state_change_support;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (context-&gt;bw_ctx.dml.soc.dummy_=
pstate_latency_us =3D=3D 0 ||<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; (voltage_supported &amp;&amp; full_pstate_supported)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.p_state_change_support =3D full_ps=
tate_supported;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto restore_dml_state;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Fallback: Try to only support G6 t=
emperature read latency<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.dml.soc.dram_clock=
_change_latency_us =3D context-&gt;bw_ctx.dml.soc.dummy_pstate_latency_us;<=
br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; voltage_supported =3D dcn20_validate_=
bandwidth_internal(dc, context, false);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dummy_pstate_supported =3D context-&g=
t;bw_ctx.bw.dcn.clk.p_state_change_support;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (voltage_supported &amp;&amp; (dum=
my_pstate_supported || !(context-&gt;stream_count))) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; context-&gt;bw_ctx.bw.dcn.clk.p_state_change_support =3D false;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto restore_dml_state;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // ERROR: fallback is supposed to alw=
ays work.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSERT(false);<br>
+<br>
+restore_dml_state:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;bw_ctx.dml.soc.dram_clock=
_change_latency_us =3D p_state_latency_us;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return voltage_supported;<br>
+}<br>
+<br>
+void dcn20_fpu_set_wm_ranges(int i,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; struct pp_smu_wm_range_sets *ranges,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; struct _vcs_dpi_soc_bounding_box_st *loaded_bb)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_assert_fp_enabled();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges-&gt;reader_wm_sets[i].min_fill=
_clk_mhz =3D (i &gt; 0) ? (loaded_bb-&gt;clock_limits[i - 1].dram_speed_mts=
 / 16) + 1 : 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges-&gt;reader_wm_sets[i].max_fill=
_clk_mhz =3D loaded_bb-&gt;clock_limits[i].dram_speed_mts / 16;<br>
+}<br>
+<br>
+void dcn20_fpu_adjust_dppclk(struct vba_vars_st *v,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; int vlevel,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; int max_mpc_comb,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; int pipe_idx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; bool is_validating_bw)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_assert_fp_enabled();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_validating_bw)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; v-&gt;RequiredDPPCLK[vlevel][max_mpc_comb][pipe_idx] *=3D 2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; v-&gt;RequiredDPPCLK[vlevel][max_mpc_comb][pipe_idx] /=3D 2;<br>
+}<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h b/drivers=
/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h<br>
index 36f26126d574..6b1f4126bc88 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h<br>
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h<br>
@@ -23,6 +23,7 @@<br>
&nbsp; * Authors: AMD<br>
&nbsp; *<br>
&nbsp; */<br>
+#include &quot;core_types.h&quot;<br>
&nbsp;<br>
&nbsp;#ifndef __DCN20_FPU_H__<br>
&nbsp;#define __DCN20_FPU_H__<br>
@@ -30,5 +31,44 @@<br>
&nbsp;void dcn20_populate_dml_writeback_from_context(struct dc *dc,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct resource_c=
ontext *res_ctx,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_e2e_pipe_=
params_st *pipes);<br>
-<br>
+void dcn20_fpu_set_wb_arb_params(struct mcif_arb_params *wb_arb_params,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_state *context,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_e2e_pipe_params_st *pipes,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_cnt, int i);<br>
+void dcn20_calculate_dlg_params(struct dc *dc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_state *context,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_e2e_pipe_params_st *pipes,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_cnt,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int vlevel);<br>
+int dcn20_populate_dml_pipes_from_context(struct dc *dc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; struct dc_state *context,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; display_e2e_pipe_params_st *pipes,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bool fast_validate);<br>
+void dcn20_calculate_wm(struct dc *dc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_state =
*context,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_e2e_pipe=
_params_st *pipes,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *out_pipe_cn=
t,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *pipe_split_=
from,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int vlevel,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool fast_valida=
te);<br>
+void dcn20_cap_soc_clocks(struct _vcs_dpi_soc_bounding_box_st *bb,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stru=
ct pp_smu_nv_clock_table max_clocks);<br>
+void dcn20_update_bounding_box(struct dc *dc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct _vcs_dpi_soc_bounding_box_st *bb,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; struct pp_smu_nv_clock_table *max_clocks,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int *uclk_states,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int num_states);<br>
+void dcn20_patch_bounding_box(struct dc *dc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; struct _vcs_dpi_soc_bounding_box_st *bb);<br>
+bool dcn20_validate_bandwidth_fp(struct dc *dc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_state *context,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool fast_validate);<br>
+void dcn20_fpu_set_wm_ranges(int i,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; struct pp_smu_wm_range_sets *ranges,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; struct _vcs_dpi_soc_bounding_box_st *loaded_bb);<br>
+void dcn20_fpu_adjust_dppclk(struct vba_vars_st *v,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; int vlevel,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; int max_mpc_comb,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; int pipe_idx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; bool is_validating_bw);<br>
&nbsp;#endif /* __DCN20_FPU_H__ */<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BY5PR12MB42119C940C7070B6DE69B2A9FB3C9BY5PR12MB4211namp_--
