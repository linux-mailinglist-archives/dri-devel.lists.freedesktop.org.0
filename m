Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA5CC965CF
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA4C10E345;
	Mon,  1 Dec 2025 09:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAaDMGPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76C510E345;
 Mon,  1 Dec 2025 09:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764581003; x=1796117003;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IEfgEl/mw5NdkelUe1bikbXuy0k40/s3Y5PH128mRLg=;
 b=fAaDMGPL0/Qyg5vv5JH8eymms1SZzeYLUKE48+lIv5CnZBjLDSPe7mH+
 ky/13OTc0kHq/4GsFF0kChKNy2N3AobbeTPUN5qR9XxmlbGmngHx5f3IP
 GQOiB40jm046LOoGIilXVo6PXxTA8iPm35u6Ol4sNWZ0zM/Mkit/9G0Em
 fGhvZO3MJIfbxnO0fMxe91oG8WpMGjF1NDhDFtz4dmC5L/RQjoUwL9G0Z
 1bN0CL1bWJkxxio+i++SAmilEr/br93HNP2uAn86WCZm456TCoX2DpXkt
 BspyOaLp5vy/iQ81YehliX5BUZeqklIsb8DYux9gAaaXz7xQUXfi4xx85 A==;
X-CSE-ConnectionGUID: 8a0/r9VOQ1+Un/z4gfHWng==
X-CSE-MsgGUID: tpqLzMPCT3KYD3deKh9Udw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="91991849"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="91991849"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:23:22 -0800
X-CSE-ConnectionGUID: NBxLxsErS3647AkekomG7Q==
X-CSE-MsgGUID: tpw140aZSM2aPHfosGFP8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193914560"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:23:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:23:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 01:23:22 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.34)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:23:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSpLm8ej8eekRoBH41KH3oxqicqU7UGTa9QNasfovpn5eK5CwGe3bdQmKxv6Hu6FUJwvSKfNigU2OcCk+3cpUerexMdop8J96mBSpHATuGZDuQ2E93/0d8zLNryF6RTAyj1FWWEgVo02atRhhvLo+M+Uh/bdp6TTykQ1DDg1QMtDMgMkv0DssCMsS/OMLPe6a1MnFkhmbcK/OmczJ0BVg6W3S0M+7KPLvWA6+TqiEVZSduKhDUQFQAEBM+lBI3FU6K+cLjKiOxArG96EwWB3alsEOKk/1B2DyJ6ID4jvAtzwzjwkg82h14yEV9vEuUPslxI+GvdroleNFwwVcFGV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AMryNAGh2dZ6c788Ru5Ka6LcS6ChgVVBOTlc2Zo+a4=;
 b=zFTQYhxf0NtcwAPCtqG+awnh7TMcBKKxAKSbyXt8XY7NjYZyE6PJiWODj3B2KqoQ816YjxJ3kR5UTsSVSZMgJlLZpKabUftoGfNr/vuIpoAQP5rgRtUBo5J+oF/w2QSeLAYxvTpPo07/Kx+bqHwnhmLgLrCb/3QXfW8S1B82OEVYP6I5f4eLPIFMIJU9y4tPTjV8usV+I/DaLDQgqxwKElBO+BPQ+0YrtOIas+kDZJC2ucOwLWKiWTcVKPRUQUdxIxLSiYFITHd6E7D2VcodePz5T2BCcGjAI0SgoeqBRn9K4LJV2Vy8/lZWkkIfIa8sL5XAPtmw50bLXTo8B/pWng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA3PR11MB9111.namprd11.prod.outlook.com
 (2603:10b6:208:57d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:23:20 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 09:23:19 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [v7 10/15] drm/i915/color: Add framework to program PRE/POST CSC
 LUT
Thread-Topic: [v7 10/15] drm/i915/color: Add framework to program PRE/POST CSC
 LUT
Thread-Index: AQHcYozJep5S6/eevUOavwx6x6S0zLUMgvwQ
Date: Mon, 1 Dec 2025 09:23:19 +0000
Message-ID: <DM3PPF208195D8D164887A00AC2DB9C430EE3DBA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
 <20251201064655.3579280-11-uma.shankar@intel.com>
In-Reply-To: <20251201064655.3579280-11-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA3PR11MB9111:EE_
x-ms-office365-filtering-correlation-id: c93df23d-4074-4548-1123-08de30bb4476
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kOHhRhOAYgkeGQ0sTinu7bJGhyaCvxXgdSJRBNxjmErlPkxtuyGNBixQOfv8?=
 =?us-ascii?Q?QI8tLfOKC7HueaEkXlEaMtcjOtQoCb/A5xSyi4lT3bbsY9gcxPh0gT8X4+yJ?=
 =?us-ascii?Q?kf8BwmaZeuXAGlyqDW8eaGdMkyvhJ/CWJXCPqOAN7Fzcq2Vt1whxM/lFH1LY?=
 =?us-ascii?Q?DmjIEXQfyrr68wYDu7PaIX6bZwAS17VclPoi9qiUT0U71gmBkKp7DwCqcb/2?=
 =?us-ascii?Q?y7O+lxDK+ErO0eBI+MvmJcsfJyHu+2raQFPtcw6RSss7D8+aFynMjLmnRddA?=
 =?us-ascii?Q?NoZENZnZUuX6lWDH+k4BaQOXIWCi49J/fG3JcuJbmUatgWSEFgKdJQRcXYrM?=
 =?us-ascii?Q?e+c/b80NAYKUbLaMt+3mHuqa6ii2gIkhSSKd0xC7tvtSlDgUzQBkxYzhfN0M?=
 =?us-ascii?Q?W1ir42tavDR+TP6MLKOMJJQ4wSimmvn8sv+GMUhIo+yLG862e6kPpV5uAvOu?=
 =?us-ascii?Q?JbotWp8Ge7Rmb+9eJ12V1H5kpsjAgajNc/XwtAHvKv/Lu6Zc7psbAtNIPdpG?=
 =?us-ascii?Q?wq+93xeTD3A2b6j78Bgff5xBwkywfDwqIRTULfQP9hWg6hDI86W/rjVcFbCF?=
 =?us-ascii?Q?I2otpSucnMVBikPCbP7b/6wovFGDOq1JFJpBDki8JTQbCtHdOHo9JsdFtV4N?=
 =?us-ascii?Q?sK7LPHDWkD9Y+nM7Rajie663kVy57Ts4KO6wJCoLhiDacguEjG4duddZDGyB?=
 =?us-ascii?Q?da1s1Ew0S7pRNR5/UdTXHH22YXYwxFz/Ee6qCJCntZwpqYpLn+jXAz8crGge?=
 =?us-ascii?Q?GyzjOJrWV2jMJ0B+Viq4paHYl+KAohKt7j1XAKYdhRVNKIhRlCHNgUaKXqsq?=
 =?us-ascii?Q?c2hGZ/FsSPEvZWe+lI6w7XcqFTs6MSppjv2aYWRBOjJPbK6XFJHGBjCbO0Tj?=
 =?us-ascii?Q?HhUe/jWxgFsPXBBaCkjnYMTAvH6z5/KvAMthk7BfW6op1mvFoL+1Hne//Aiw?=
 =?us-ascii?Q?KaRtO0X9Rl/rEHbFCNHQAgCNpJ0Z5JNXWzu5FipVPbWCGM6yJDmANdKgGFNY?=
 =?us-ascii?Q?jNxnkdYBm0xUBz46J8hnKaGabJAA/AAGzaipzMwP+xNAf+lzqKBQ11HXdNCn?=
 =?us-ascii?Q?aDJHrtvN1KFueG3OJrhoEqRIl7bieGCSwnehT5mmNR8XREHH9IussX+qWCw1?=
 =?us-ascii?Q?Icj7KPAeNIzwIgaaxgfwMuGBa3eqoirmm2QzG/yVz+I4rCepfSr2M1WSsdGH?=
 =?us-ascii?Q?DUNGTmsGJ+hLzQ/faxMs3NglpvfZBRk2q764YbYgkbrkdn2ouPP8+Wr+euog?=
 =?us-ascii?Q?iVc2rCy19FeXolqe2Wx0vqBaWzZoGiKwa2UkgyB+wasZruxn0rhBq0sNoFAt?=
 =?us-ascii?Q?vCxOyR4Vv5zCu5mVRlgkYxhcxZC8AD+1LDtK+I70GJODOVhhsiICg3EfPKO0?=
 =?us-ascii?Q?Vie6uYNwTXifMg+KmBvns/ESZNxztiYdjMZWV4Is1YVmULtESEMpXrIgFc+O?=
 =?us-ascii?Q?5S3ZkJwZ3wTxC0Jktxox+kYsdRW1LEt/i41ItIPwKY4nZDatPUAxKmKPhTXf?=
 =?us-ascii?Q?8h/FcSOrs3TltG2laZLN0voBE8P+xJqyo6sV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NGDyPRA6xvDDHi2QWWQBjCia/h2K1bRPWarUhiz2ZMs/2DyrLI026wTAUXaI?=
 =?us-ascii?Q?1DsVkeyLbjBkXQbzxYDl9y4tXROLpOKCM58+8YfCQ4x/14cXQ/MHd2P9j6RJ?=
 =?us-ascii?Q?FXobgPV90WSJ/6OP2R9Ok8UQe+NaLAYj5Hc0GPzkTmC0CJ/nBTitZMUTuoUO?=
 =?us-ascii?Q?KxJiReizCeNOlqtvkVaP215ieXEbgOB4pInAGSpbexdG9gjZVduDKf/7D6fX?=
 =?us-ascii?Q?NPM1F7qYXOyM8l6pqW1Y/c74HITd7BMfsglEDSzMb7N4IGlbLElCZq4aBs2s?=
 =?us-ascii?Q?7htS+iA6mt6bF/LfbzH6VIXRxqxvBCp6wqf2Z8FzQXSWStArOn5W+YjPWsz9?=
 =?us-ascii?Q?Nh/kY3ScNxy81jsd6CxlLEtWmfreSdLCLsiPwgORTJXU/hNGfmoi8TwBORqV?=
 =?us-ascii?Q?EVIr56HvqzPeL0O8Sl8kO42b6fXdCzL/unWoxkVbqLgVE+a2YnDP1BsfBF1Q?=
 =?us-ascii?Q?Xj19JWN5kugSHxoo214c/j4ECNKiDOFv5OMNXL25ffWkaGWSVX3GzJe1b7YF?=
 =?us-ascii?Q?ejkxSJyUiMBiBQ/fDVFlwofcx/+X3W04TluIKR7ajtOY/lrPFPQNFTYtSuGf?=
 =?us-ascii?Q?uKjGg9yjYnQnA1/P4GUsKI+glE9OOPa5xx0wVO+z42V+JugR/oHoBJrXyLhn?=
 =?us-ascii?Q?L6sin70I0EeYRzEKCSsVMqCmGdlIS/pFaiiiF8kOVsBPLvdJvAC7sMaUpCK4?=
 =?us-ascii?Q?i0GJu2M7g6WMUqwrxHwj+UGmRg9BdZJ7dpHfFe38v427P7YWqRVRJqCLWp6F?=
 =?us-ascii?Q?y21mNhh7QqdyCVNUoqaeWYgzLEcaEmAFLXSFDqrZSQc0o+JbUHx3XkuDN5Ss?=
 =?us-ascii?Q?JgShhS0Je7kLe4W8dX/HmbkizONWoLlj/d0SkMC6Jk8+KBH1dCexPcSwXL3+?=
 =?us-ascii?Q?J0brY0U/Eqzg/pcJA0xEms/bZ3SbQc+6hVTCnHDtbYgY3yJX75QcrQ43g/HS?=
 =?us-ascii?Q?zMkM1StxkVcfCqEwVz117aMxeIXbsSkDYge63OG1yYBQ1DhOqYs3SDmWSqNp?=
 =?us-ascii?Q?J1ZNgj3PWZLvpKxsg+FGAuA/36HsZqR95pMlQY3CJCzXkNuYnP2HFmBLHunP?=
 =?us-ascii?Q?KJwg3NKrEjyCIHOq4BAYBKDdze2F+D/iEFSpw5+ypFVP+30CDDqDtbsdDbTF?=
 =?us-ascii?Q?fn6TdX0zVhj1CtsP3+pzZZyd/d5G0vhNtn0I1z5vayoKpKCgjfIpM9gHU5Yb?=
 =?us-ascii?Q?5y2uc4H7ydAZ65f3hy9IRZzgUjJ6ZxWrI3k+myE6dtQdZyuvrCaGV7lbFS/x?=
 =?us-ascii?Q?8pgGK/iglCaTBE+hgrnsouA0rtUbW5yah7h+p4AnkXRfBgUn/0SkWNRfHPCQ?=
 =?us-ascii?Q?liQoK3sMgsLflhO/Sii+45X0Zm6HPNLvkxePw4vP/lPBsq5xR0jWhplVwdW3?=
 =?us-ascii?Q?oAvfK+YO+VkfmH9oi3zCqt88pHAkesfZytCQb6oEY3qSlTdArtztXZKQGRph?=
 =?us-ascii?Q?lSdE5Mmip0+vCVy8WXTKWmrBA/4PODLRBgjyRFji37dc8JSjysH8QoIthGF+?=
 =?us-ascii?Q?ZU4QWmlreGBuTnBX294JuIA5UWIBNDb+QuaFgJ12b/GcGyIQ2Nku7vxe1Js9?=
 =?us-ascii?Q?3gvWBzoFvPf9poFH4qsgmmrPVya8rVzZRyeO+72+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93df23d-4074-4548-1123-08de30bb4476
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 09:23:19.8751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2SbWlx2INoh8KZ+CYP1yrpnWKnrGF8pMO7twOjyFR3MWky6v84V7tM39i+uXlvhrn4u1M7xGoGjydLT8Umhtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9111
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

> Subject: [v7 10/15] drm/i915/color: Add framework to program PRE/POST CSC
> LUT
>=20
> Add framework that will help in loading LUT to Pre/Post CSC color blocks.
>=20
> v2: Add dsb support
> v3: Align enum names
> v4: Propagate change in lut data to crtc_state
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

LGTM
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_color.c       | 16 ++++++++++++++++
>  .../gpu/drm/i915/display/intel_display_types.h   |  2 +-
>  drivers/gpu/drm/i915/display/intel_plane.c       |  4 ++++
>  3 files changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index 2f8e985d51e5..4ca359d68730 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -93,6 +93,10 @@ struct intel_color_funcs {
>  	/* Plane CSC*/
>  	void (*load_plane_csc_matrix)(struct intel_dsb *dsb,
>  				      const struct intel_plane_state
> *plane_state);
> +
> +	/* Plane Pre/Post CSC */
> +	void (*load_plane_luts)(struct intel_dsb *dsb,
> +				const struct intel_plane_state *plane_state);
>  };
>=20
>  #define CTM_COEFF_SIGN	(1ULL << 63)
> @@ -4077,11 +4081,23 @@ intel_color_load_plane_csc_matrix(struct
> intel_dsb *dsb,
>  		display->funcs.color->load_plane_csc_matrix(dsb,
> plane_state);  }
>=20
> +static void
> +intel_color_load_plane_luts(struct intel_dsb *dsb,
> +			    const struct intel_plane_state *plane_state) {
> +	struct intel_display *display =3D to_intel_display(plane_state);
> +
> +	if (display->funcs.color->load_plane_luts)
> +		display->funcs.color->load_plane_luts(dsb, plane_state); }
> +
>  void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>  					const struct intel_plane_state
> *plane_state)  {
>  	if (plane_state->hw.ctm)
>  		intel_color_load_plane_csc_matrix(dsb, plane_state);
> +	if (plane_state->hw.degamma_lut || plane_state->hw.gamma_lut)
> +		intel_color_load_plane_luts(dsb, plane_state);
>  }
>=20
>  void intel_color_crtc_init(struct intel_crtc *crtc) diff --git
> a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 6d8217497583..c419a814cb34 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -646,7 +646,7 @@ struct intel_plane_state {
>  		enum drm_color_encoding color_encoding;
>  		enum drm_color_range color_range;
>  		enum drm_scaling_filter scaling_filter;
> -		struct drm_property_blob *ctm;
> +		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut;
>  	} hw;
>=20
>  	struct i915_vma *ggtt_vma;
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
> b/drivers/gpu/drm/i915/display/intel_plane.c
> index 328b12af4d27..4e6ddb36b872 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -348,6 +348,10 @@ intel_plane_colorop_replace_blob(struct
> intel_plane_state *plane_state,  {
>  	if (intel_colorop->id =3D=3D INTEL_PLANE_CB_CSC)
>  		return drm_property_replace_blob(&plane_state->hw.ctm,
> blob);
> +	else if (intel_colorop->id =3D=3D INTEL_PLANE_CB_PRE_CSC_LUT)
> +		return	drm_property_replace_blob(&plane_state-
> >hw.degamma_lut, blob);
> +	else if (intel_colorop->id =3D=3D INTEL_PLANE_CB_POST_CSC_LUT)
> +		return drm_property_replace_blob(&plane_state-
> >hw.gamma_lut, blob);
>=20
>  	return false;
>  }
> --
> 2.50.1

