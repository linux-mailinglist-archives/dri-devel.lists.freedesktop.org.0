Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9269ED755
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 21:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E909C10E61A;
	Wed, 11 Dec 2024 20:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IS90yfiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EB910E1D2;
 Wed, 11 Dec 2024 20:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733949540; x=1765485540;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=alBsNWij8b4+xYkLCexYfHFCOcfKzeRjhVKSPPY7B60=;
 b=IS90yfiyhD8FLgOaKW6SzzlMXjb3JquE9fayjmYAq/Fkf4NCb7XGTzpW
 /BXV+3q01ls4JeFUBN1Cq8EInp7vNYxJLSTWGBU75IOLy3naciZVl8jUm
 JGX0XLn/N5IPDcbUYV1eLfkwPC/8x5uq3bmU7AyrEpwYnkq5g+97UbOAR
 3zoJP5ujUo2NdKccHxR+X5xmrYXAnpyXSbjqELG/9mn2RL7PMbnqH0kdP
 nEmr/H9GnEwayCUccWnwuvwcuWMiWb+fJm5g3NWE3frgHs2dR82xbnDYp
 GUZ/6seQqh/YfjFOVpl1cpnZThd0IvxrslkoWdNG2w9rjZc5Ux3XjIQq1 A==;
X-CSE-ConnectionGUID: QOwJohpuQHij3VHtwJmzsA==
X-CSE-MsgGUID: 2Bx1YzjIQHaJc3a1oK5K3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34389944"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34389944"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 12:38:59 -0800
X-CSE-ConnectionGUID: ISj0gVVmSkOPXYT6NGgFyA==
X-CSE-MsgGUID: DaCrS5YhSkmTLTALfoN1rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="101019441"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 12:38:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 12:38:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 12:38:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 12:38:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvqTXQYByAgRx1VpJPtUEMNw9iTPssIPkJHO8ybUBie0DJEJuEFpueRIyMeNWYXoar9OUOHLWN7erNJN0WJ5+Dm1f7R3P95IYR9iWPBChM6yWgWf800n8vHoB7IMXQSWTgXFFbRwm2gUzlfwy+FGjVG11AH6gbl3U1U+tzww4ZPy6S31XRUQEB29ERmcUBkLqb1d2XkSzNiyb6+WqQC9M82yFQGT4ESnG3ol7tUMJLB+5PvjJ4xyqjoU6lDzQJ4/RZF5AlLnFTRjRmRYRNFbeKwJhIci5PjF8Usi6dJoTZKlmlZaDqMKjpdMFFoJziDHAp7kTpeiA0vuDN+/Hv6DRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVG2b4wGYuvkB0R7KFT/FEF0CxJKL436ZlFkipsuqvM=;
 b=kq2xfC74nLMmlgHsR5uKUMTQIfOT/IshOa4kTgopEmbZd8eQLin/arhvctrpf5pxjOlfzVL3gHa/zvtOP0Xe4BR8fmEnTxgAAEQjKNozJYKgQCdjAEO1JAbE4rFMFaQVc16JaIVVJ1t+voJvaO4RQM7faBOWu82oTvwz9H8cCEB5e7VeE/ri3/synBCctOH8wSQPUiLszMg2KPWlGjzHxpnOtNjeISudHhHXHBxQalG3kTTzQIh/23A3fYqi5RssNRhYkhTy9fqFgDmwm3mz5FPoqxKymHjn9DwUi9RufNsFQRkSTpjtsDr3PDgJBjTnT7sUrkqHTe/W+I3jDUEokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Wed, 11 Dec
 2024 20:38:55 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 20:38:55 +0000
Date: Wed, 11 Dec 2024 15:38:46 -0500
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
Subject: [PULL] drm-intel-next
Message-ID: <Z1n4VhatZpvT5xKs@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:303:b9::25) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: a924f585-f4b5-470a-2c4f-08dd1a23d4b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fHV0nXPNpHuQ60PDSvFxipF8QEQIs96nY1VoX5mq5IBQKFnzwK+Qs44rsJ?=
 =?iso-8859-1?Q?EqIx2Ws697MEGUFpubxQzTcMMrOkJN+qhRLan1HUaoi7f7sh/Xywvx90uv?=
 =?iso-8859-1?Q?djSE89TFWViWI4s7lFc0kFXmk5z6cgJZQNGT5TBWeVvKscSsn2Xb9k8wcB?=
 =?iso-8859-1?Q?DyNcgOjeA4OjU86vFL4A5k/0Ht40ELo7RHuTZcCm7tZSJNJiJav+0V2KZh?=
 =?iso-8859-1?Q?xgyi9gJb2S8hiPkXQzvvqyYsCvsDqZzq8OK25g4FtJOCIrwQHsKqxQfGZ9?=
 =?iso-8859-1?Q?d8aVKz7WsATe/zjPmECB6T1XrX8illmIAna4SXz5N6PuEzXSFcMPIIQC6S?=
 =?iso-8859-1?Q?KUlYpXBuzpjHpIuhB+Xb265pJgflyChJPQO6WnQqB6RfzIkCuz9S5taqNN?=
 =?iso-8859-1?Q?R0TmaFp92vCdSotPPPPdbUniJYKRt4nFA2CLTv0ViAaLEzBtErOBk597Cs?=
 =?iso-8859-1?Q?FLj8lRccBX15+rOzKd0yw/8Y+iq2yFaEsGjo+8PXvHT2kjdWmyyKtGXtSA?=
 =?iso-8859-1?Q?IRAWRxXH9rs/c16FEvgrWA28EUnnU5SG9zM6f6QtSunCUiukWRyAgeqKIP?=
 =?iso-8859-1?Q?/4igr9NJ93Dtql+hYOJbom5LG65htULx7YXctD6AON9DYuXWZfzcpcKFKN?=
 =?iso-8859-1?Q?XRa4BiN4ykog5akV2VIuXtAE8xYASMF03V38jYGgf7R5CcY8r6Edroe5l9?=
 =?iso-8859-1?Q?waLr+z5rhBYekG+3IMgfiTj+XCA6JUQuL22g9WT4RBjUt5IZsrJ3CwGnGs?=
 =?iso-8859-1?Q?XoeXnpsZAlAgkF9HFAzyG6LTIaoQN3Nz2ACU/+uYtgbfoeM+w78cfHJi/b?=
 =?iso-8859-1?Q?jiE4zY2pu2b55zfg/AA07/dqANuFzhaGlGi86V47VJzhJEJ9JNvxqqVsU1?=
 =?iso-8859-1?Q?0RyIpTzw5ySgxqEyzZJlyx4tczWlbXJTEuDMhG64lqSWQkB+xZFdSGUuqe?=
 =?iso-8859-1?Q?whXdd9YUj7cV9Yi05rMmcLI74CYPO7TCadRBniRSbTlg87ni+0xzG9qFST?=
 =?iso-8859-1?Q?1fskj7/urGtg7YZzm41boP4/yyAhDvAsNx68FOrc3o/QVim5bPbbG/4/V1?=
 =?iso-8859-1?Q?md8OR/mrcuSyRMiGuNqIESwLTTFFQPR/72qN7W0aW0+L/y7DMKffFcZbHJ?=
 =?iso-8859-1?Q?szB6Q4Gi8t9DhA90DXPShZhYjn8JeE4FFT5zgrvli21e2aTM7zZJjTbdLD?=
 =?iso-8859-1?Q?qu7EakYETaUdLjD05IRE/uyvx/IRABR5nXgpL5vhyPguaF2BwxcoJ+3kXq?=
 =?iso-8859-1?Q?5FK7OIX8mYAZGCrtX0Ca3zbzX5ghdSR1Jl1bFVlyzkyDYoRjAwH1vZWcqX?=
 =?iso-8859-1?Q?3rzoZ+gnkMG29ox3UXHagOIJefNXPaZKJYSi6k+zo6g4Un8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KBHuSMSw4J3aWDTuvOoLH9dlUaq85hlmaCXN0JrbO5X3tG8GitbiqA0Rqb?=
 =?iso-8859-1?Q?PuQEAT3r5BPljZDd4v7P6/0VCxN5xRuOfH9YHUUmjh1YJkz0KJt71faClI?=
 =?iso-8859-1?Q?dTiyjaQuNUHfWuce4ALI9TuiXGGAMsuPSW/9UAIBkDUU+o9AsHRWkFbw2Q?=
 =?iso-8859-1?Q?RDjsxO488F7/6OBXwKkzkSU8Qx96zFBSp8/qNVq58RqiQK69HNiu4nBOX7?=
 =?iso-8859-1?Q?3kKWl7XN3d1uPEs4EMZavXRQgN2rMYZKoYvzF0GUMrHfTc7hR8vrBk69rZ?=
 =?iso-8859-1?Q?tr/H7siym0OtkkwsK52bCGgkaCE/Rp4wgJ9iIangp39w69m/VpOMUArwMJ?=
 =?iso-8859-1?Q?FMxqugd/TK2NNaGaxlxmszo8ub3+/zXav5J29lgdOUqAv7lTkP+TOWEJ+y?=
 =?iso-8859-1?Q?7nyhkeNvqP4C/Z3reCwfNFm0vjt3UdGij5k/REnDyUqpkGe08qd4gzC+sx?=
 =?iso-8859-1?Q?sRUximPEZJizLlWC3CML5qBBLLf2VajKRzgDHVtsc9KlGM9hxwthcL4KUt?=
 =?iso-8859-1?Q?kNwzApmc1f3VSqmxdMX/bcrrgQpxYkzdBaFyl2P3d4IV+mXTjg6Daz4UYv?=
 =?iso-8859-1?Q?Xemgv1LwpEOz9Ay8zm0mBg2SArs5joKiBkleaXfWwBm7bHJY+fqT5u7rMw?=
 =?iso-8859-1?Q?CH/mydX573wwNdLNN7iiTzUQh8OT6hEynSeEMhKkn+dis/JYNsrzEv4R1Q?=
 =?iso-8859-1?Q?lag1xQZBczgBMyjDXWtR/n215yLMoKqVrjrTfaLfjJH7F1zdRar9ZS/DZd?=
 =?iso-8859-1?Q?sOeSlqJ7NzBwnSQY7TG94vLLR6zC45Fm/l3/Vqr9CGvr+d813sqGFBVEbe?=
 =?iso-8859-1?Q?AdwHCwq0azglDVSDWHtcgYu3Y75lLPOaJWQC7dleaASMNMUcKj6xdIjt3J?=
 =?iso-8859-1?Q?QtdjWGeK4O+zOdcvGZmJ6r3HzhVs1CI7FHrMsc2Tjm/9Lbt3ntM7w1QEDA?=
 =?iso-8859-1?Q?tpnKFyWRKUMb0ZuOXFo+g+lPvgw6XxIO6Qmb/MyBjYh138lo0oYwgzKybF?=
 =?iso-8859-1?Q?mDJ8XqT2aPFeQzxU7LnquTuA1f0aEr03iopPBFNI59t5FT/GaMZ35vUZBL?=
 =?iso-8859-1?Q?J2jjL1anyyHDRcyOLA5qoiZuC06qYWyTYwGmTp4G1I3WpmQ3SWvQ+pL6sv?=
 =?iso-8859-1?Q?gwGGwRPQGELUwFLAJMhHlv+j/0nUnbttVG2KoX+Tb6nDaw5Bfdvp5XWNNu?=
 =?iso-8859-1?Q?4+NYh2RkgFquBnPF4mcjfEoQRddVF66Xakq3utGcPMJ0T8x2Zh+G9YdVOQ?=
 =?iso-8859-1?Q?hO2BVZshvSSOPxrNWNHc5A3LAiPum71xB87H57evabYlTFWIzIn4xZ9UEA?=
 =?iso-8859-1?Q?pCcMIqfEOn3Ketow44n66+rNpQTJ+Hw7SBfcmlQF1atMTdxwDlvLVxrhdx?=
 =?iso-8859-1?Q?5ScyeHidQmuQCSUlF6hC16E23X3u/sRBEFkT85LRXceGPTyVk/WEYfjU0F?=
 =?iso-8859-1?Q?I46uXbCLrffiGhZGqGbGCcJIgZN1twtkrepHsy25QKyQyIlA/PvFgRZ1i4?=
 =?iso-8859-1?Q?4o5yvGW0lvh6zKohiwCG14PBkZzcPNmU0vWkc0FSjURb7EoYaz8E5ypVeQ?=
 =?iso-8859-1?Q?WIRygw3RUy/jcXDBV7v1VvdaTYZfrYafCfE/EGvdog4KQohbvvkg4iEgXF?=
 =?iso-8859-1?Q?vtPoizXmC5xT+cA/6zQ0Wo2KOaEFD0J91OY89O4EWt+kYyck5p+G22xA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a924f585-f4b5-470a-2c4f-08dd1a23d4b2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 20:38:55.4298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erBClc+VDZQnNTmGN8h+9y360XGEjp4b4T/RkjiwdHRMgpKw5CMhUSe4ntqWVYMDTT1X02aEh9dL5AzWaB5U/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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

Here goes our first drm-intel-next round targeting 6.14.

One drm/print change coming from here. The rest is mostly
display changes and one GSC FW update for ARL platforms.

Thanks,
Rodrigo.

drm-intel-next-2024-12-11:
Core Changes:
 - drm/print: add drm_print_hex_dump()

Driver Changes:
 - HDCP fixes and updates for Xe3lpd and for HDCP 1.4 (Suraj)
 - Add dedicated lock for each sideband (Jani)
 - New GSC FW for ARL-H and ARL-U (Daniele)
 - Add support for 3 VDSC engines 12 slices (Ankit)
 - Sanitize MBUS joining (Ville)
 - Fixes in DP MST (Imre)
 - Stop using pixel_format_from_register_bits() to parse VBT (Ville)
 - Declutter CDCLK code (Ville)
 - PSR clean up and fixes (Jouni, Jani, Animesh)
 - DMC wakelock - Fixes and enablement for Xe3_LPD (Gustavo)
 - Demote source OUI read/write failure logging to debug (Jani)
 - Potential boot oops fix and some general cleanups (Ville)
 - Scaler code cleanups (Ville)
 - More conversion towards struct intel_display and general cleanups (Jani)
 - Limit max compressed bpp to 18 when forcing DSC (Ankit)
 - Start to reconcile i915's and xe's display power mgt sequences (Rodrigo)
 - Some correction in the DP Link Training sequence (Arun)
 - Avoid setting YUV420_MODE in PIPE_MISC on Xe3lpd (Ankit)
 - MST and DDI cleanups and refactoring (Jani)
 - Fixed an typo in i915_gem_gtt.c (Zhang)
 - Try to make DPT shrinkable again (Ville)
 - Try to fix CPU MMIO fails during legacy LUT updates (Ville)
 - Some PPS cleanups (Ville, Jani)
 - Use seq buf for printing rates (Jani)
 - Flush DMC wakelock release work at the end of runtime suspend (Gustavo)
 - Fix NULL pointer dereference in capture_engine (Eugene)
 - Fix memory leak by correcting cache object name in error handler (Jiasheng)
 - Small refactor in WM/DPKGC for modifying latency programmed into PKG_C_LATENCY (Suraj)
 - Add drm_printer based hex dumper and use it (Jani)
 - Move g4x code to specific g4x functions (Jani)
The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2024-12-11

for you to fetch changes up to e7f0a3a6f7339af55f1ca2c27131739d75569c08:

  Merge drm/drm-next into drm-intel-next (2024-12-11 15:06:05 -0500)

----------------------------------------------------------------
Core Changes:
 - drm/print: add drm_print_hex_dump()

Driver Changes:
 - HDCP fixes and updates for Xe3lpd and for HDCP 1.4 (Suraj)
 - Add dedicated lock for each sideband (Jani)
 - New GSC FW for ARL-H and ARL-U (Daniele)
 - Add support for 3 VDSC engines 12 slices (Ankit)
 - Sanitize MBUS joining (Ville)
 - Fixes in DP MST (Imre)
 - Stop using pixel_format_from_register_bits() to parse VBT (Ville)
 - Declutter CDCLK code (Ville)
 - PSR clean up and fixes (Jouni, Jani, Animesh)
 - DMC wakelock - Fixes and enablement for Xe3_LPD (Gustavo)
 - Demote source OUI read/write failure logging to debug (Jani)
 - Potential boot oops fix and some general cleanups (Ville)
 - Scaler code cleanups (Ville)
 - More conversion towards struct intel_display and general cleanups (Jani)
 - Limit max compressed bpp to 18 when forcing DSC (Ankit)
 - Start to reconcile i915's and xe's display power mgt sequences (Rodrigo)
 - Some correction in the DP Link Training sequence (Arun)
 - Avoid setting YUV420_MODE in PIPE_MISC on Xe3lpd (Ankit)
 - MST and DDI cleanups and refactoring (Jani)
 - Fixed an typo in i915_gem_gtt.c (Zhang)
 - Try to make DPT shrinkable again (Ville)
 - Try to fix CPU MMIO fails during legacy LUT updates (Ville)
 - Some PPS cleanups (Ville, Jani)
 - Use seq buf for printing rates (Jani)
 - Flush DMC wakelock release work at the end of runtime suspend (Gustavo)
 - Fix NULL pointer dereference in capture_engine (Eugene)
 - Fix memory leak by correcting cache object name in error handler (Jiasheng)
 - Small refactor in WM/DPKGC for modifying latency programmed into PKG_C_LATENCY (Suraj)
 - Add drm_printer based hex dumper and use it (Jani)
 - Move g4x code to specific g4x functions (Jani)

----------------------------------------------------------------
Animesh Manna (1):
      drm/i915/psr: Disable psr1 if setup_time > vblank

Ankit Nautiyal (9):
      drm/i915/dp: Update Comment for Valid DSC Slices per Line
      drm/i915/display: Prepare for dsc 3 stream splitter
      drm/i915/vdsc: Use VDSC0/VDSC1 for LEFT/RIGHT VDSC engine
      drm/i915/vdsc: Introduce 3rd VDSC engine VDSC2
      drm/i915/vdsc: Add support for read/write PPS for 3rd DSC engine
      drm/i915/dp: Ensure hactive is divisible by slice count
      drm/i915/dp: Enable 3 DSC engines for 12 slices
      drm/i915/dp: Limit max compressed bpp to 18 when forcing DSC
      drm/i915/display/xe3lpd: Avoid setting YUV420_MODE in PIPE_MISC

Arun R Murthy (3):
      drm/i915/dp: use fsleep instead of usleep_range for LT
      drm/i915/dp: read Aux RD interval just before setting the FFE preset
      drm/i915/dp: Include the time taken by AUX Tx for timeout

Daniele Ceraolo Spurio (1):
      drm/i915/gsc: ARL-H and ARL-U need a newer GSC FW.

Eugene Kobyak (1):
      drm/i915: Fix NULL pointer dereference in capture_engine

Gustavo Sousa (18):
      drm/i915/dmc_wl: Use i915_mmio_reg_offset() instead of reg.reg
      drm/xe: Mimic i915 behavior for non-sleeping MMIO wait
      drm/i915/dmc_wl: Use non-sleeping variant of MMIO wait
      drm/i915/dmc_wl: Check for non-zero refcount in release work
      drm/i915/dmc_wl: Get wakelock when disabling dynamic DC states
      drm/i915/dmc_wl: Use sentinel item for range tables
      drm/i915/dmc_wl: Extract intel_dmc_wl_reg_in_range()
      drm/i915/dmc_wl: Rename lnl_wl_range to powered_off_ranges
      drm/i915/dmc_wl: Track registers touched by the DMC
      drm/i915/dmc_wl: Allow simpler syntax for single reg in range tables
      drm/i915/dmc_wl: Deal with existing references when disabling
      drm/i915/dmc_wl: Couple enable/disable with dynamic DC states
      drm/i915/dmc_wl: Add and use HAS_DMC_WAKELOCK()
      drm/i915/dmc_wl: Sanitize enable_dmc_wl according to hardware support
      drm/i915/xe3lpd: Use DMC wakelock by default
      drm/i915/dmc_wl: Extract intel_dmc_wl_flush_release_work()
      drm/xe/display: Extract xe_display_pm_runtime_suspend_late()
      drm/xe/display: Flush DMC wakelock release work on runtime suspend

Imre Deak (6):
      drm/i915/ptl/dp_mst: Fix slave transcoder enabling wrt. DDI function
      drm/i915/adlp+/dp_mst: Align slave transcoder enabling with spec wrt. DDI function
      drm/i915/dp_mst: Add a way to disable the DP2 config
      drm/i915/adlp+/dp_mst: Align slave transcoder sequences with spec wrt. DP2 config
      drm/i915/adlp+/dp_mst: Align master transcoder disabling with spec wrt. DP2 config
      drm/i915/dp_mst: Fix connector initialization in intel_dp_add_mst_connector()

Jani Nikula (69):
      drm/i915/sbi: add intel_sbi_{lock,unlock}()
      drm/i915/sbi: add a dedicated mutex for LPT/WPT IOSF sideband
      drm/i915: add a dedicated mutex for VLV/CHV IOSF sideband
      drm/i915: hide VLV PUNIT IOSF sideband qos handling better
      drm/i915/dp: demote source OUI read/write failure logging to debug
      drm/i915/psr: add LATENCY_REPORTING_REMOVED() register bit helper
      drm/i915/psr: stop using bitwise OR with booleans in wm_optimization_wa()
      drm/i915/display: identify discrete graphics
      drm/i915/display: convert HAS_D12_PLANE_MINIMIZATION() to struct intel_display
      drm/i915/display: convert HAS_4TILE() to struct intel_display
      drm/i915/display: convert HAS_DOUBLE_BUFFERED_M_N() to struct intel_display
      drm/i915/display: convert HAS_DP20() to struct intel_display
      drm/i915/display: convert HAS_GMBUS_BURST_READ() to struct intel_display
      drm/i915/display: convert HAS_IPS() to struct intel_display
      drm/i915/display: convert HAS_MBUS_JOINING() to struct intel_display
      drm/i915/display: convert HAS_SAGV() to struct intel_display
      drm/i915/display: convert HAS_HW_SAGV_WM() to struct intel_display
      drm/i915/display: convert HAS_ULTRAJOINER() to struct intel_display
      drm/i915/display: rename i915 parameter to __display in feature helpers
      drm/i915/display: convert display device identification to struct intel_display
      drm/i915/display: pass struct pci_dev * to intel_display_device_probe()
      drm/i915/display: add mobile platform group
      drm/i915/mst: pass primary encoder to primary encoder hooks
      drm/i915/mst: rename intel_encoder to encoder
      drm/i915/mst: introduce to_primary_encoder() and to_primary_dp()
      drm/i915/mst: use primary_encoder in fake mst encoder creation
      drm/i915/display: make CHICKEN_TRANS() display version aware
      drm/i915/mst: convert to struct intel_display
      drm/i915/mst: change naming from fake encoders to MST stream encoders
      drm/i915/dp: add comments about hooks called from MST stream encoders
      drm/i915/mst: pass intel_dp around in mst stream helpers
      drm/i915/mst: unify MST connector function naming to mst_connector_*
      drm/i915/mst: simplify mst_connector_get_hw_state()
      drm/i915/mst: unify MST topology callback naming to mst_topology_*
      drm/i915/ddi: use intel_ddi_* naming convention for encoder enable/disable
      drm/i915/reg: convert DP_TP_CTL/DP_TP_STATUS to REG_BIT() and friends
      drm/i915/dp: refactor clear/wait for act sent
      drm/i915/ddi: rename temp to ddi_func_ctl in intel_ddi_read_func_ctl()
      drm/i915/ddi: split up intel_ddi_read_func_ctl() by output type
      drm/i915/ddi: refactor intel_ddi_connector_get_hw_state()
      drm/i915/ddi: simplify intel_ddi_get_encoder_pipes() slightly
      drm/i915/overlay: convert to struct intel_display
      drm/i915/overlay: add intel_overlay_available() and use it
      drm/i915/plane: convert initial plane setup to struct intel_display
      drm/i915/irq: hide display_irqs_enabled access
      drm/i915/irq: emphasize display_irqs_enabled is only about VLV/CHV
      drm/i915/ddi: clarify intel_ddi_connector_get_hw_state() for DP MST
      drm/i915/display: prefer DISPLAY_VER over GRAPHICS_VER in display s/r
      drm/i915/dislay: convert i9xx_display_sr.[ch] to struct intel_display
      drm/i915/dp: use seq buf for printing rates
      drm/i915/display: convert for_each_power_well() to struct intel_display
      drm/i915/display: convert for_each_power_domain_well() to struct intel_display
      drm/i915/display: convert power wells to struct intel_display
      drm/i915/display: convert power domain code internally to struct intel_display
      drm/i915/display: convert high level power interfaces to struct intel_display
      drm/i915/display: convert power map to struct intel_display
      drm/i915/display: replace dig_port->saved_port_bits with flags
      drm/i915/display: remove unused for_each_crtc()
      drm/i915/cx0: split out mtl_get_cx0_buf_trans() to c10 and c20 variants
      drm/i915/display: convert intel_display_driver.[ch] to struct intel_display
      drm/i915/pps: debug log the remaining power cycle delay to wait
      drm/i915/pps: include panel power cycle delay in debugfs
      drm/i915/mst: add beginnings of DP MST documentation
      drm/print: add drm_print_hex_dump()
      drm/i915/display: use drm_print_hex_dump() for crtc state dump
      drm/i915/display: use drm_print_hex_dump() for buffer mismatch dumps
      drm/i915/display: clean up DP Adaptive Sync SDP state mismatch logging
      drm/i915/dp: add g4x_dp_compute_config()
      drm/i915/dp: move g4x_dp_set_clock() call to g4x_dp_compute_config()

Jiasheng Jiang (1):
      drm/i915: Fix memory leak by correcting cache object name in error handler

Jouni Högander (1):
      drm/i915/psr: Disable Panel Replay as well if VRR is enabled

Rodrigo Vivi (8):
      drm/i915: Remove vga and gmbus seq out of i915_restore_display
      drm/i915/display: Convert i915_suspend into i9xx_display_sr
      drm/i915/display: Move regfile registers intel_display.restore
      drm/{i915, xe}/display: Move DP MST calls to display_driver
      drm/xe/display: Delay hpd_init resume
      drm/xe/display: Delay dsm handler registration
      drm/{i915, xe}: Move power_domains suspend/resume to display_power
      Merge drm/drm-next into drm-intel-next

Suraj Kandpal (10):
      drm/i915/xe3lpd: Update HDCP rekeying bit
      drm/i915/hdcp: Handle HDCP Line Rekeying for HDCP 1.4
      drm/i915/hdcp: Fix when the first read and write are retried
      drm/i915/hdcp: Remove log for HDMI HDCP LIC check
      drm/i915/wm: Initialize max_latency variable to appropriate value
      drm/i915/wm: Refactor dpkgc value prepration
      drm/i915/wm: Use intel_display structure in DPKGC code
      drm/i915/display: Refactor DPKGC code to call it from atomic_commit_tail
      drm/i915/wm: Modify latency programmed into PKG_C_LATENCY
      drm/i915/wm: Club initialized variables of same type together

Ville Syrjälä (51):
      drm/i915: Relocate the SKL wm sanitation code
      drm/i915: Extract pipe_mbus_dbox_ctl()
      drm/i915: Extract pipe_mbus_dbox_ctl_update()
      drm/i915: Extract mbus_ctl_join_update()
      drm/i915: Sanitize MBUS joining
      drm/i915: Simplify xelpdp_is_only_pipe_per_dbuf_bank()
      drm/i915/dsi: Stop using pixel_format_from_register_bits() to parse VBT
      drm/i915: Introduce HAS_DOUBLE_WIDE()
      drm/i915/cdclk: Extract intel_cdclk_guardband() and intel_cdclk_ppc()
      drm/i915/cdclk: Extract hsw_ips_min_cdclk()
      drm/i915/cdclk: Extract intel_audio_min_cdclk()
      drm/i915/cdclk: Factor out has_audio check in intel_audio_min_cdclk()
      drm/i915/cdclk: Extract vlv_dsi_min_cdclk()
      drm/i915/cdclk: Factor out INTEL_OUTPUT_DSI check in vlv_dsi_min_cdclk()
      drm/i915/cdclk: Suck the compression_enable check into intel_vdsc_min_cdclk()
      drm/i915/cdclk: Drop pointles max_t() usage in intel_vdsc_min_cdclk()
      drm/i915/cdclk: Relocate intel_vdsc_min_cdclk()
      drm/i915/cdclk: Unify cdclk max() parameter order
      drm/i915: Grab intel_display from the encoder to avoid potential oopsies
      drm/i915/crt: Split long line
      drm/i915/crt: Drop the unused ADPA_DPMS bit definitions
      drm/i915/crt: Use REG_BIT() & co.
      drm/i915/crt: Clean up ADPA_HOTPLUG_BITS definitions
      drm/i915/crt: Extract intel_crt_regs.h
      drm/i915/crt: s/pipe_config/crtc_state/
      drm/i915/crt: Drop pointless drm_device variables
      drm/i915/crt: Rename some variables
      drm/i915/crt: Nuke unused crt->connector
      drm/i915/scaler: s/intel_crtc/crtc/ etc.
      drm/i915/scaler: Remove redudant junk from skl_scaler.h
      drm/i915/scaler: Pass the whole atomic state into intel_atomic_setup_scalers()
      drm/i915/scaler: Clean up intel_atomic_setup_scalers() a bit
      drm/i915/scaler: Convert the scaler code to intel_display
      drm/i915/scaler: Carve up intel_atomic_setup_scalers()
      drm/i915/scaler: Make scaler in_use a bool
      drm/i915/scaler: Extract intel_allocate_scaler()
      drm/i915: Don't reuse commit_work for the cleanup
      drm/i915: Intruduce display.wq.cleanup
      drm/i915/dpt: Evict all DPT VMAs on suspend
      Revert "drm/i915/dpt: Make DPT object unshrinkable"
      drm/i915/dsb: Don't use indexed register writes needlessly
      drm/i915/color: Stop using non-posted DSB writes for legacy LUT
      drm/i915/dsb: Nuke the MMIO->indexed register write logic
      drm/i915/pps: Store the power cycle delay without the +1
      drm/i915/pps: Decouple pps delays from VBT struct definition
      drm/i915/pps: Rename intel_pps_delay members
      drm/i915/lvds: Use struct intel_pps_delays for LVDS power sequencing
      drm/i915/pps: Spell out the eDP spec power sequencing delays a bit more clearly
      drm/i915/pps: Extract msecs_to_pps_units()
      drm/i915/pps: Extract pps_units_to_msecs()
      drm/i915/pps: Eliminate pointless get_delay() macro

Zhang He (1):
      drm/i915: Fixed an typo in i915_gem_gtt.c

 drivers/gpu/drm/drm_print.c                        |  23 +
 drivers/gpu/drm/i915/Makefile                      |   2 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |  25 +-
 drivers/gpu/drm/i915/display/g4x_dp.h              |   6 -
 drivers/gpu/drm/i915/display/hsw_ips.c             |  20 +-
 drivers/gpu/drm/i915/display/hsw_ips.h             |   6 +-
 drivers/gpu/drm/i915/display/i9xx_display_sr.c     |  95 +++
 drivers/gpu/drm/i915/display/i9xx_display_sr.h     |  14 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |   4 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |  54 +-
 drivers/gpu/drm/i915/display/intel_audio.h         |   1 +
 drivers/gpu/drm/i915/display/intel_bios.c          |  15 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |   8 -
 drivers/gpu/drm/i915/display/intel_bw.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 175 +---
 drivers/gpu/drm/i915/display/intel_color.c         |  81 +-
 drivers/gpu/drm/i915/display/intel_crt.c           | 163 ++--
 drivers/gpu/drm/i915/display/intel_crt_regs.h      |  48 ++
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |  14 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |   5 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           | 491 ++++++-----
 drivers/gpu/drm/i915/display/intel_ddi.h           |  12 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |  23 +-
 drivers/gpu/drm/i915/display/intel_de.h            |  10 +
 drivers/gpu/drm/i915/display/intel_display.c       | 111 ++-
 drivers/gpu/drm/i915/display/intel_display.h       |   3 -
 drivers/gpu/drm/i915/display/intel_display_core.h  |  17 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   7 +-
 .../gpu/drm/i915/display/intel_display_device.c    | 278 +++---
 .../gpu/drm/i915/display/intel_display_device.h    | 155 ++--
 .../gpu/drm/i915/display/intel_display_driver.c    | 298 ++++---
 .../gpu/drm/i915/display/intel_display_driver.h    |  38 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  52 +-
 .../gpu/drm/i915/display/intel_display_params.c    |   6 +-
 .../gpu/drm/i915/display/intel_display_params.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_display_power.c | 948 +++++++++++----------
 drivers/gpu/drm/i915/display/intel_display_power.h |  29 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |  56 +-
 .../drm/i915/display/intel_display_power_well.c    | 567 ++++++------
 .../drm/i915/display/intel_display_power_well.h    |  35 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |   4 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  25 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |   4 -
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        | 314 +++++--
 drivers/gpu/drm/i915/display/intel_dmc_wl.h        |  14 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 110 ++-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   1 -
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  23 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 663 +++++++-------
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   7 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |   4 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |  73 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |   2 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |  20 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |   9 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   3 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  36 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   9 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |   4 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |  49 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   2 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       | 184 ++--
 drivers/gpu/drm/i915/display/intel_overlay.h       |  19 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |   6 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   1 +
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  26 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |  56 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.h |   4 +-
 drivers/gpu/drm/i915/display/intel_pps.c           | 174 ++--
 drivers/gpu/drm/i915/display/intel_psr.c           |  86 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  12 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   5 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   8 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |  80 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |   1 +
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |  12 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   2 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          | 286 ++++---
 drivers/gpu/drm/i915/display/skl_scaler.h          |  11 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  25 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       | 724 +++++++++-------
 drivers/gpu/drm/i915/display/skl_watermark.h       |   1 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  28 +-
 drivers/gpu/drm/i915/display/vlv_dsi.h             |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   4 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  19 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   3 +-
 drivers/gpu/drm/i915/gvt/display.c                 |   1 +
 drivers/gpu/drm/i915/gvt/handlers.c                |   1 +
 drivers/gpu/drm/i915/i915_driver.c                 | 115 +--
 drivers/gpu/drm/i915/i915_drv.h                    |  19 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c                |   2 +-
 drivers/gpu/drm/i915/i915_getparam.c               |   5 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |  18 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  12 +-
 drivers/gpu/drm/i915/i915_reg.h                    | 122 +--
 drivers/gpu/drm/i915/i915_scheduler.c              |   2 +-
 drivers/gpu/drm/i915/i915_suspend.c                | 141 ---
 drivers/gpu/drm/i915/i915_suspend.h                |  14 -
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   1 +
 drivers/gpu/drm/i915/intel_sbi.c                   |  22 +-
 drivers/gpu/drm/i915/intel_sbi.h                   |   4 +
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   2 +-
 drivers/gpu/drm/i915/vlv_sideband.c                |  28 +-
 drivers/gpu/drm/i915/vlv_sideband.h                |   3 +
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |  11 +-
 drivers/gpu/drm/xe/display/xe_display.c            | 114 ++-
 drivers/gpu/drm/xe/display/xe_display.h            |   2 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |   8 +-
 drivers/gpu/drm/xe/xe_pm.c                         |   4 +-
 include/drm/drm_print.h                            |   2 +
 116 files changed, 4251 insertions(+), 3479 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/i9xx_display_sr.c
 create mode 100644 drivers/gpu/drm/i915/display/i9xx_display_sr.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_crt_regs.h
 delete mode 100644 drivers/gpu/drm/i915/i915_suspend.c
 delete mode 100644 drivers/gpu/drm/i915/i915_suspend.h
