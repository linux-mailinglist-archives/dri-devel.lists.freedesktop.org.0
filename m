Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDADB302C3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 21:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9C310E3A4;
	Thu, 21 Aug 2025 19:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GqjfZ4Xi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE4810E3A4;
 Thu, 21 Aug 2025 19:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755804061; x=1787340061;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=0LRZxtKBQIpPevmCHo3X7fG1+oVXKFMgFKcRA9kOYso=;
 b=GqjfZ4XiZ8sX+5pmAs+DUBHgTXETYyHiS9RLQFKRhX2ezmzMAmuUp553
 UWZYPDPbslveU6baQSrCWUPMFMYUvQN122adqFP231oxC6ZbHu5/QMDSu
 Srjcphl+UYtZcJ3QosMN2M/cv6l/MzK0xls/ATePOLJ1umQ2/Bqi+Sxbn
 a2bqgpy1yoYyGe54Ei1DnguQzg6WEEkbRBEoxcLm2F8anWrS7KbmwKgjl
 4PcM0TqRlD2dMFS5EWJz/oeQtnrpMNAj70+Mx8wQ82w9VGpI5cWC2MCJ4
 oInKCFaaPWuQkAj4PGYzmuOO2xK1PXIrsy0848uQWUkXeXSh8I0JVvrKj A==;
X-CSE-ConnectionGUID: ewsQvD5wShqdeOl+INyHQQ==
X-CSE-MsgGUID: +IQtCo2oQ7+NY+Laq0bYTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57128253"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="57128253"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 12:20:59 -0700
X-CSE-ConnectionGUID: +6ZeSw8zSgmnucdAQ9tvGw==
X-CSE-MsgGUID: ceMAnBdjTrqUq28/B7+i2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="168863189"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 12:20:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 12:20:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 12:20:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.44)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 12:20:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeNAWVzMCyd3XHFuPJ5Yb+vSt170mMyvcJzvxN65ejw2p6JHvC8oZVm+sN/5pvGaIOhyihsOpnhjBHfzFMC6Bva9+K8/gR7odr98nmHQOoo7eBue2I/6aG5a8wtEKtf54dYDLfqgv/hndbQHQPNh30kr8QsEGvBtU2CHaU+6MfE4UN+m3K9weuvw/LhGoSdHX+rwuVufbhjjDK2+Tp/tpUTKkwuWfIYyOzHjUdE316wnlGSBSH3ATvACSNyLEQY46L6m4jY1buxsJl1PoV/TNkK8LAs88Loo3ihuAzI1php7c4Tch/4xuxEBVgPrXpfffd7ydapG9ldx84VSb5wPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy4zifOIB3Ig4sMOH36Kc3S8gLfNMvcY0yNB02ySlY0=;
 b=ey6k7Stdm2NRS+fQ/FAeOSd0WId0yWe2+Ks5qsccd2eovsOb2PwMa9t+2lI7JYz4TtWwcyxMVTFAgpIjLREHFgUn2Z3sZ5HmuA1cRW/p/+AjE5XJ8zeNXICATRP03h5syYTo+yTrudbmY591mNoyYrrfXwVm6DABnkqd5ooe5W+bkmoDp7UbYxH5vFCxeXoZGVW0tNiKVMU0yOX9YEJhQ4SJimnoRiivgqytwRUtsQqDLcRRFouU9BqZUYuJUIP7v9J9jONL5H/xXs3gW1abg9Atogs0ON8i7qPAb41XRdYSJ/ygsl9qP5k6RHq/60M3LtT/zpMHVnzmUsoEdIoMWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB7913.namprd11.prod.outlook.com (2603:10b6:610:12e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Thu, 21 Aug
 2025 19:20:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 19:20:49 +0000
Date: Thu, 21 Aug 2025 15:20:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <aKdxiw9hvO6mcyKs@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a03:505::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 3172ee23-3c58-4994-2ee9-08dde0e7d63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wrKSnbufZaZp8ItIo0YNgOAOEXG9PMmm/EuLjdlY+pTgxRA9H0piXRBt1q?=
 =?iso-8859-1?Q?c4QeDmEXWdXvssvLpGrLWAZ5WOOpPh4KrrRk3ioThreugK1g0NFjJObkid?=
 =?iso-8859-1?Q?5yeK4CPW/Hk5CNn8JOFArAYEco1VS/iLMzErGEcndz+sIbdtma17dKNwYe?=
 =?iso-8859-1?Q?cn71+3G3GS+BnWVqEuObOEfy838C9RTT8QakjLQ/9SHPpitau0L02zB+WH?=
 =?iso-8859-1?Q?gH0J2E7mtVxxzXBbo5e5exI5DekEuPrIbfzQ6RYtcUEayyNTfFgdyhAiUX?=
 =?iso-8859-1?Q?EoDxZPhGDexEy22TdFFCgklULpAbYI/vzLX9yuXx4Z8IBhPdD75uvVTUj6?=
 =?iso-8859-1?Q?uhogKNHtagogtho957AGZGsWSl6q8t9qi9Vhmrnmjx93HZmSB/HRh5oT/8?=
 =?iso-8859-1?Q?l2Ldcv5Qe+qjv3Ba+izONiL3OYAbK4YOWZKjP8wfzxnwRfus4S9EuDzzP1?=
 =?iso-8859-1?Q?DYFnwzVaYFLBrjujJFcKUUhF4RW17zwDq502hed3AV3bHlZDrG+qtj0aRo?=
 =?iso-8859-1?Q?fM28VDEicF4bS7knpxq6KrYSj/VhBHgGVnXb5cJvC3H8shuDie64fh7qhK?=
 =?iso-8859-1?Q?9GWTo70TqgUuPBlhK5tHrIz1EuNi0xgtGIHa5sGiTzSgPqTAdxtztZFLM5?=
 =?iso-8859-1?Q?tzqUv5p7KLwznHy3LdLf1jjTHW55IrYEsqL9NV0hCcXJXvhGpHHZv8zddV?=
 =?iso-8859-1?Q?O0G2oD4tg2IpeVLR+EB2zmnKpb4AM7RRIhscWJBW4U+nTPnHQueO4Nfcvq?=
 =?iso-8859-1?Q?aiEe7fW5Uxh+Az9h7xGJmhbtfkQblAzzu67XqIV8csIrrJ86XGjAbKsgOW?=
 =?iso-8859-1?Q?dOf1X0/iQmVA2Ney8iPS7Ub2EYnzDzXvsPebVsrIt9RosH2yEyQOtpXPHM?=
 =?iso-8859-1?Q?HZ8mKWOOXhibqVJ25niXi9WSHsPP67kNDIUzEAxC3XEYBwuOCx1JWGKxaK?=
 =?iso-8859-1?Q?shUocGbLK5H8saPB2GJgeZ7E4A+tnaKPMW1pwtMOeesPaBh8CgyHeSiLv1?=
 =?iso-8859-1?Q?WivbGVK/u9xp3uTmAuxglS+FFPN/nZBwLf/qSdxPjTzcc4218ysgYixDim?=
 =?iso-8859-1?Q?rrSWyJjl8bBsaxE6Gwg0B0zvYQRSop4QT61Bopk8lpJEti0QE7CN5G5pFz?=
 =?iso-8859-1?Q?Tn3NMwajAT0UTJJaCGzsBkaaUtNz3DrJPb50O6jT5NQb3Bm5jdhJU7sLFg?=
 =?iso-8859-1?Q?qdK+LrMsaAPcXKniY5pzMOyVCHFgLiDVh7F+U3v/Si6ch/6Ulbmcb4JwBM?=
 =?iso-8859-1?Q?40wOr+h1xNGgq5Dsm7Zvqe8hh1nx/XzEHwRHbkGYb53dbs0c4zzI06bsgg?=
 =?iso-8859-1?Q?af23aOmOhNuvf/qtPIn/smRJxiocLkGAthgl6vZdzTmyI9iUyBiG8CHWuT?=
 =?iso-8859-1?Q?NNmYu0MM9/NZAznnTN/CLpkiKq+pu/7THM1fQGhtrvOf3Ngfq0vTw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xL1cX6jEiRtrkFSsSYDBIeFBhRHxy8TE5uxFfBVgHuwHoS5TjKuZYoaGhP?=
 =?iso-8859-1?Q?bmL3hDsc0KYJkjPC1ozRc8mlD6+s2x02EyFMeOxjLy3bgHs/kjV3oNjedT?=
 =?iso-8859-1?Q?ex+2y8mlN/9KSy8wXYLPgkbqWtNyg4Zb3VtebPiGxP5ZIqaB6suFY3yVYI?=
 =?iso-8859-1?Q?GSbuHj6HF1Zw4AV4Et7l0+vZ9ZxxSZgk46zw6UceJawpeWBg8EHj+WJHOx?=
 =?iso-8859-1?Q?SAQjuAwUdltNTSWRIErTJHbcBffMDxL7CSc3U4nagdgrFGvtGLPCHevuJa?=
 =?iso-8859-1?Q?9Co0QHXPQR2+EJ8gP9adEBY0nFa14krPJbaFWUio4U6FSrBHI9F70Jq/aD?=
 =?iso-8859-1?Q?B3wuOcBayIJB6D51AGiZkIi0FjDLQnizibqreM5iJ+dcEg1SVREyT1P7xr?=
 =?iso-8859-1?Q?vQ7OedvMKy6O5wixiPUJOzct3CqCqa3NNesZ0so8K3lvjSGhBcYMkikhj8?=
 =?iso-8859-1?Q?x1GUh5jGLJ5FIvice+lW0jBsa5qL+JK46dX3vBnETimuSF4nPg31/97fRh?=
 =?iso-8859-1?Q?I9Wlxl8YfMynpgbQWbAKD+Sl3j6bsdWh69ejC5/a8EMgJqU5ET/bb13r6R?=
 =?iso-8859-1?Q?OeMV5WuCicOB8ZD3meq5CAelBa6MlzsbNS+F0l6gL7j28jnIYZIexo9kHw?=
 =?iso-8859-1?Q?QE/pnYQN1kbWbyrmZfIhsDw0w4pp51sp4URgaY9fS6WvGmLE2MJgxhkGag?=
 =?iso-8859-1?Q?fCszh63lEbuUYKgKjXVRFnzsTm4ZxrGP4Qnnk/sszWpZl8p/xwxxhChi8D?=
 =?iso-8859-1?Q?fpOE7iCREUUqLedHwK8VlMFeSLx7lvYcBsLQLH70O1Q9t8BBE9aH++WKTr?=
 =?iso-8859-1?Q?RbsER3zU3Al/HQX9OkdYV8HwTo+3EZywiEuImzy6x1BgQj7TGpp3hamlTH?=
 =?iso-8859-1?Q?BDTDx53cke2e2muF/3nJKfqO15symq42DFf7aYiJGBMxl3SutrqFc/PQG8?=
 =?iso-8859-1?Q?4xP2Lc+Gw8JUL33AlbhAD2+4zPqj/1XwknBgGicYF9ds/6k1667u+d+gbn?=
 =?iso-8859-1?Q?xGFz1xvgV9KTt/7R5YUVtMUYxV9uuGvfzEgUtbBP7loPS5ekAuxUbP+35j?=
 =?iso-8859-1?Q?iNh3+a3Yh4tv5iJAt6rKTwIotH/x/K4De6IrR+EeKyliP2HXqIEk71asVu?=
 =?iso-8859-1?Q?5cBsSE4BYi7y2zoyLLGWWRwtAfYJzfx9kLSBacXlGUVBwAUPuYfOF+m3pA?=
 =?iso-8859-1?Q?6QqzqjYBuii9ny0U6kQvTChgi+dEpequkVvy2+ubAcFUF/DdHBdi6mxBfm?=
 =?iso-8859-1?Q?XdvF2PEdtx1REjUni3SkFhj9AI6qbsZngjOeDVSvc43LN8T30m8mXRjbph?=
 =?iso-8859-1?Q?U545YRvkCUbOG0yT+VvWzdSnYwEd/0JSi529ox0jLJs50Gbr8bUawYhgtt?=
 =?iso-8859-1?Q?tdOKsF47sTmym4XCQI7ZcwiFiQFn18/DQI0WMSdW5bMG86WgBFPK3J2kEl?=
 =?iso-8859-1?Q?hV+9P2AtqvJTCF06/pJdysvKQ4I4N5rtGSedwy6aQEoJvnJkg9eeJF6qFB?=
 =?iso-8859-1?Q?Tu9w33sWaURHv5vNhFTBOa3VMLQuX6XA6NqInwJrO/qfaIU7clEQlxZQcw?=
 =?iso-8859-1?Q?H1MuarAH2JKucxspPoF722rtCe2AM6Z9n1SdyQ/7xV8CkrtuJ7pZQcSn3p?=
 =?iso-8859-1?Q?7o96K6a3WXpn7DVRV5+Bv8aKfZ33BeC/Po?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3172ee23-3c58-4994-2ee9-08dde0e7d63c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 19:20:49.4680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4MgXgFUzngFWHtJJ2ky+vFk+Mg97u3qkZ3769d/Ov/JljlONayup/ZrxvwYgRi939kOd3Ho4I2RCR8pWJo5IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7913
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

Hi Dave and Sima,

Here goes our xe-fixes targeting -rc3.

The xe_vm_create fixes should actually had been squashed together,
to avoid null-deref in the vm_create. But this would mess up
the original hash of a fix propagated last week that already
landed in -rc2. :/

I should had checked this last week, I'm sorry for that.
But at least the end result is right and fixing real issue.

Thanks,
Rodrigo.

drm-xe-fixes-2025-08-21-1:
- xe_vm_create fixes (Piotr)
- Fix vm_bind_ioctl double free (Christoph)
The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-08-21-1

for you to fetch changes up to 111fb43a557726079a67ce3ab51f602ddbf7097e:

  drm/xe: Fix vm_bind_ioctl double free bug (2025-08-21 15:06:58 -0400)

----------------------------------------------------------------
- xe_vm_create fixes (Piotr)
- Fix vm_bind_ioctl double free (Christoph)

----------------------------------------------------------------
Christoph Manszewski (1):
      drm/xe: Fix vm_bind_ioctl double free bug

Piotr Piórkowski (2):
      drm/xe: Assign ioctl xe file handler to vm in xe_vm_create
      drm/xe: Move ASID allocation and user PT BO tracking into xe_vm_create

 drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
 drivers/gpu/drm/xe/xe_pxp_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 48 ++++++++++++++++++--------------------
 drivers/gpu/drm/xe/xe_vm.h         |  2 +-
 4 files changed, 26 insertions(+), 28 deletions(-)
