Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9FD9B2F3B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC46F10E47D;
	Mon, 28 Oct 2024 11:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpHE5jId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEBD10E47D;
 Mon, 28 Oct 2024 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730116215; x=1761652215;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k8YNynKIsZx63Z6A8oF2tNfm6a4Ua0qNNivho95FcK8=;
 b=TpHE5jId0TFxazsloQ9e7Gr3RsWi7k1DIBzgmbC0ph2S8Uh5f191GQrd
 Qx9OYJZqbMRQ99CkOa+W1fp/1Vn02Q2Wj2JtrcOt/4k/B9caxDT5hnRKM
 hgPgsv4OoCmprwN3S496LpYUYD6nWFcygKrKXgFlLcD1u7pWF9i+Rjiry
 M08BIuwyQw3Oxuq099fdOFGR+6/X1carbNmCVVDufMJ3nlD/NohrTXU24
 SbkObNVWUZWD9M34p1i388ApRN5SKVQhkCovuZa6Fgc9xKuhuj1HUfyUB
 gdql/UqqINTErgQ5YeFE7wW1MxOqqNsNf0HB/Fgmmgfu4W2Tygxpz4Z1u A==;
X-CSE-ConnectionGUID: vxqMUow9TC2GQzHMlQmL/A==
X-CSE-MsgGUID: lERY1OQ+SqagaDED666lTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29572030"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29572030"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 04:50:15 -0700
X-CSE-ConnectionGUID: OSbvOYlXSmSK/Me+QtPu1A==
X-CSE-MsgGUID: Q/WcHiUMSNOcfW3NrpGaLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="112413016"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 04:50:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 04:50:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 04:50:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 04:50:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJxro0GLW7Y2XNFZImzA4gswDxmCsXs4B6tM+dtha61yTZap7sAqLZp2pP+39SOJy1NpfiTD3MtjzNQaawhcss61PCLcto5GGl6e8BUjR54B7nMDoHNV95DMchmXoCRpjmJvn0cMhBABKaUOvjMRR2Bk9AsH8XxGajfkLfkNgKIM6QCDCGCUrUo4k9pv2mnGWvK0WOwBHNH5NOFy29kCRE7bajixMF0ATCg/nHcBpcECAZT6djg5LncGRTQoox83yEvfWFx+Zvr1nDVOl65M+Zmio9C4w8yQEi0/VskpOiwQN5lK7XaRZzxrM8SX1boX+YwyvTD0qR9G6Uz5G96Ujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBAnkFw05BEdPbikTjvzqGYbklshl2RDUKDgJ0Ww4FA=;
 b=dduyapqNT5SxHjne28xdM9WHWeiHwq4vK41DVhzeB7iQSlEdeDRyyflexq3gZEeksXNNVSiUlmM1pvpavnxUlUVuXCIgETj4n+yCf+sTWosNjC6sdTJM++fZZQkiZAl9AdXre92bFwZ+gj2hHPBny0URBfDM4tSyQ65ZRp8YiTjEOTuSp8lg+ci93MSuJxjmBhfBtSiqAbuSl9XfMsovwgjG5Mlp2im3+G3tXaqUMQT2pCmLNnKHS2KkdyG7uQDbgHzXbpdVpUbf0SJ+vn4C/ma5Gby8eMQXeJ9FLyeJC5CbsbsRxtCoebf4S5630uxC+YdQMUAJoXBUqHZXRrf5Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by MW3PR11MB4603.namprd11.prod.outlook.com (2603:10b6:303:5e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 11:50:11 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8093.014; Mon, 28 Oct 2024
 11:50:11 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "1064094935@qq.com" <1064094935@qq.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Thomas <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, pengfuyuan
 <pengfuyuan@kylinos.cn>
Subject: RE: [PATCH] drm/xe/hdcp: Fix logic errors
Thread-Topic: [PATCH] drm/xe/hdcp: Fix logic errors
Thread-Index: AQHbKSCIyqoCEzw/p0KoJi6MRBQ8orKcDJkg
Date: Mon, 28 Oct 2024 11:50:11 +0000
Message-ID: <SN7PR11MB6750A49CB7F7EB13F8BE0A96E34A2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <tencent_46D189AD021D29866D1A9806B47AB013700A@qq.com>
In-Reply-To: <tencent_46D189AD021D29866D1A9806B47AB013700A@qq.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|MW3PR11MB4603:EE_
x-ms-office365-filtering-correlation-id: 72194db9-c55d-4113-4a77-08dcf746aded
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MPaDtctoYRVudS69w2bQ8mVnYoDw+yJmK3GqAASv9m+4V3hYSxU4rZVj2AF9?=
 =?us-ascii?Q?Un84sVGBAN0SQMfJGVI/GcOHIxSY9/3Byooyds7Qz003qCl2oBz3pXl0wT2J?=
 =?us-ascii?Q?vlbBwFBGju4pdogXvzGlTfBfwtYscj5gdT8tGE3EcIY6Drueuv48G4QSV3yJ?=
 =?us-ascii?Q?Lu1//ygGr+veb3TeH3/b2AcQH+Yw+90395TSTntHuYHdXyA3S1jmXEzN1e1P?=
 =?us-ascii?Q?0fVRzRMHi1QyU0d46u2IAsP0zvXfxQ1BVvkfE2axo7HUOa8yocK4omkhQbMd?=
 =?us-ascii?Q?hFeJPGKnnmtI9Aua1f/zSe59+IA7cGBWylbJFF3fmu7b1d+VCqGSoz1Q1mTj?=
 =?us-ascii?Q?0sGXSIOayotAVsA6ACAabt5jyJ6SlHfqxr1P5eLa1M2j+0tPMzPbjrup2mUN?=
 =?us-ascii?Q?Y0d8Jb2JZSnN7q8q2XgE/d+yrZlaJWXzVNr1RY+n1I4l4mNWh7xi1lW2mP4Y?=
 =?us-ascii?Q?h4/TN99Yh+vezFQSFaLFW7ODADK8yLa0lgQyr7gvS/oa42q9uYTQ/OKEw/sz?=
 =?us-ascii?Q?xmO6TJGHCIib2M/7IEzNj3Ve5/0UClfunJtI6TL0mRt5jcnNqFMDUVo7A55h?=
 =?us-ascii?Q?cv4iHR28MYspiO5UYiuBDBOnmEhEBZ+fgGdEugUWRBo8qGD+Cf3/LXMutfFY?=
 =?us-ascii?Q?aTMROz9JqQP8jJHCMwPQdJqzDwwSbBscLBnuL7rXFpzjlB6v6zOO6IHEcAhj?=
 =?us-ascii?Q?tz864UYs+jJRVf1eMQJ3qrA7YmJT8ODEwyiqOwrD/EdcvulLt/9S3CIxHzI9?=
 =?us-ascii?Q?NESGMEpHLll+wkjicKAA+SppGDWvtdDWMqpQ4FH0mwjGmotxXKWD8MXLCkws?=
 =?us-ascii?Q?VuNnZaQBogVD5+q3ZDHbhgTQt7y/3Jn4sEa71L8eF0eMtRpVkHoyv09Vf31Y?=
 =?us-ascii?Q?oto2mRFVZrvrcV8a9UUVWfRDfDPEGg5fVpqo22Hp+i2Uk7PzOypJv5yPIFsO?=
 =?us-ascii?Q?zswlvb6rDdsv+78KKs3ZGb0kN1dzJbZihpZ6mF1bhyqr2+v+MTrEPa5qQ9A7?=
 =?us-ascii?Q?jzGOmwetT5BO39fifS7yugAGzBYCkRARLoogKH7ybu9j/pcVOE0N+ta7vJTo?=
 =?us-ascii?Q?o2dxNC3RiBcYhBGJgFbIrwjLFPbuCoff6UGfs1rXkEQdTmLET2NHJ1bZAyUn?=
 =?us-ascii?Q?K+w/zYZtSQyDmEUgASP6DzOv6BdUwJvUj+NF2yLd/MyHXXu5fyKtLK9fDdYN?=
 =?us-ascii?Q?UDmC8Sbr7731xakG2mtGzZB96eXRBfk8e18MFQ4qviLiNzE7ibKjNk6X2Uo/?=
 =?us-ascii?Q?SNq9glhlQB8VTlpnqkGjqyqCZzEkiH2rlZIo2kCyGAtqHdLi0IRZgMPye16t?=
 =?us-ascii?Q?X5lpTUDFW2CcQ5HSSJS1A/Lk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+4V5lL3zvAUgJ39omp6XW/KYm+DN/jqkWRvBJo3Aefwv0IhdTgBcNkTcnIFY?=
 =?us-ascii?Q?o6+8iwhDDBD2hxXcwuWNAjsqFcwUzIaiSe5Z54oZXjUUlyzdIcXpxFs8jKEt?=
 =?us-ascii?Q?n0h/uvzxjeBjV6iGP8jONGvHnIFJI4wmdx2cAqzhybwkohJXvshxdRG8MttO?=
 =?us-ascii?Q?PVGnw1dwuJFPGjLoxhdkK0zBUKoDKaHWXvTCjLsiNuvTPYC2oCalgVicGMe6?=
 =?us-ascii?Q?Sf0XyMu2G8Hfe5Tj78yBCQz7M2PELKtbifcnRSiqZ0SrHyMktnFGrEtQ+iBa?=
 =?us-ascii?Q?Xm8fNA+LLAzIBQ83k00bw/n1+eBJBWYW4JvURquhVhSA+RCj8hyWV8EE8NIR?=
 =?us-ascii?Q?TbF/hNE1r4QfvzQQ0wovFafjoRQQHWjLSaLO8RcJfNqygkKDt3Xn2Hp1WEbm?=
 =?us-ascii?Q?Lma6bf9wfvf54Swzr81Igza/8fZTa7PgzfWC8l9mgNssnXxN+qmVtxuzVGYC?=
 =?us-ascii?Q?Igf15c/zC7ezjp2lr5NBRUEqOJ0Asf9Byqzc/s5+9G0498OnwqUe/7nVyj7H?=
 =?us-ascii?Q?XYibUpQ47ZL9Bw5T4pl+ORUARWUyEhedbDrqKXcuaLUY5Gs7/E0/GdA0UIoT?=
 =?us-ascii?Q?H9vA8G+mbxlPp9D6xt610EzLmJFzC1FqgrafIOPKN+S8tjG+W/l1mJ+pMjL3?=
 =?us-ascii?Q?ZzJYIqHeTp0l7rTVHTpxoAHKCz8vS2K0Vws+CRmQ138bxk3mf1P0gwDIUieC?=
 =?us-ascii?Q?vgUh6djelHUHJAk20AqxlEYO21Zv2JtbKHSdtagNaxcp4aoGci6NG3Skalun?=
 =?us-ascii?Q?GJ3GDn9mFK+CiOIELth31qrZD/E/LmoErOcWB8nDZV0oShcoo0OD3XxUS9fm?=
 =?us-ascii?Q?GJeO41PNQrypC5qv+Yhd0HKFQnBQQlwbJzvClUlgZmQ91FF4D1Xg8DI4/wWb?=
 =?us-ascii?Q?mMCnLkDggs8KKQeiJh0XspTTKSY9g4H3oeyEz8UKdH/Uw/owouYsVhbDa/on?=
 =?us-ascii?Q?1a2xzMDDGZ3bPGMCpUBMmK9ADfXJ+mRICNusRw0bC5DCkRdfRN8GLYDx8tCm?=
 =?us-ascii?Q?0ywOcncEmhFu1TFFgI0p4+3E/FWpT9JKtgIjzpy4wbc/xLSE35s8nYgQG6UO?=
 =?us-ascii?Q?pW+0A5romACedM6V2rcN/HvfNLS9mVtol/z3jk7rrpwEg648dfTU//XqKtTT?=
 =?us-ascii?Q?o31yiZMcW0gNgeEENdn2ITOrhmShddSqYP17N45t8QUaOWgSxGnUBF9/sTEn?=
 =?us-ascii?Q?p8IOXu2a5XGCNlWUqPj9NEg1+o9WzKDyAe3g64zjYlbv8slqKn56TZOSfBqC?=
 =?us-ascii?Q?IQyBLI9gliILp2T2+WeH+cJ6RYzbfnDxC2p+/LszRT5PRwryhDIbn7wD1zSc?=
 =?us-ascii?Q?YK0dcADuhbLxONxp4gWODnvtXDq3cviosFPvxsQAiD0qc0ETPdsU84KdV9eR?=
 =?us-ascii?Q?KujlBc4/RR1L0J8FBb/PChkMwiMoRb5mOPnfZEBc4IK5XEPaV+K3WPhwzLXY?=
 =?us-ascii?Q?IrpPWI82gcCdvLojd7ltEgx8Ws6+rAi7+IYwnrG2foOv3ZH0iprRYPZMWTe2?=
 =?us-ascii?Q?ts1xqHigjUGckMVoAzeFZHFPlxAitvsgi7RcTjjVJDJlqlQ7yffWW0depRCV?=
 =?us-ascii?Q?Q08AWZhCJaM6vQppUV1LL2foo+POeDFbhcihOS3N?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72194db9-c55d-4113-4a77-08dcf746aded
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 11:50:11.6920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TNqxUHyd2F7poupX924li7Ujl/rjMZoSwqve812T1pcNHGOoJPE/U9X7RRLv6MYvDqvnfno/gkNT+R2XPb5OJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4603
X-OriginatorOrg: intel.com
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



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> 1064094935@qq.com
> Sent: Monday, October 28, 2024 3:13 PM
> To: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Thomas <thomas.hellstrom@linux.intel.com>;
> Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; intel-
> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; pengfuyuan
> <pengfuyuan@kylinos.cn>
> Subject: [PATCH] drm/xe/hdcp: Fix logic errors
>=20
> From: pengfuyuan <pengfuyuan@kylinos.cn>
>=20
> Here the gsc struct null pointer check should use '||' instead of '&&'.
>=20
> Fix the following patches:
>     drm/xe/hdcp: Check GSC structure validity
>=20

This fix has already been sent
https://patchwork.freedesktop.org/series/140291/

Regards,
Suraj Kandpal

> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 6619a40aed15..f4332f06b6c8 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -42,7 +42,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
>  	struct xe_gsc *gsc =3D &gt->uc.gsc;
>  	bool ret =3D true;
>=20
> -	if (!gsc && !xe_uc_fw_is_enabled(&gsc->fw)) {
> +	if (!gsc || !xe_uc_fw_is_enabled(&gsc->fw)) {
>  		drm_dbg_kms(&xe->drm,
>  			    "GSC Components not ready for HDCP2.x\n");
>  		return false;
> --
> 2.25.1

