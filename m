Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA899C8AB79
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 16:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7058610E2BB;
	Wed, 26 Nov 2025 15:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7ldFGG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC3688A72;
 Wed, 26 Nov 2025 15:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764171892; x=1795707892;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=0vqnEauJ32XTdgo/fKNrOPsYCeq5WAJW5wh3vt13TG8=;
 b=n7ldFGG7Jck6pniLBjthT8/4tYzkXXqA/CPgZpXX/LoEnUJazNRtUDzB
 48LGhDxmVhrQqtE1LfERYr5WOGO0YFYqmC2uEIRR1/5xY9BLeRQ4E3oGb
 E4e/nnFC56NzHMgF8CEnl+TyObXU5jUVZPnpY5QU1AE61qyCihHs/SN2Y
 64HMBM1vUeGAXYxAUljhv9EUE/f/erYJBTl4Q32TT8A7nX8PI16MbBlZr
 Sj4snsrfIw7YK2nRlEuwsbx4tBtRiKvbHBbY2yC+TgNreXuzqdv2JCRQe
 ZZW3BBUh3FSysMs7mGiUkJzQHUtS7MZ1j5aYjzzkb56+1iCdTsF2bu5rp Q==;
X-CSE-ConnectionGUID: /GBPIlZUTtq9mCbp0RuLsg==
X-CSE-MsgGUID: DSZ2tRAoTQGvaUqx53fOxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76841189"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="76841189"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 07:44:51 -0800
X-CSE-ConnectionGUID: zRmvrxvOQ0CM0GKsYVKCOw==
X-CSE-MsgGUID: Voc11kgnRDuKtd7js/wmAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="197303610"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 07:44:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 07:44:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 07:44:50 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.21)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 07:44:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qeho1vj6vDfQeA/DeAX1Milx98OeyvIh21h6Y2Nkq/5/1gQuiFGufoi1cTqJ5WTO535H194VR7BuPOZTHWS2bdaENl0ptDQO01GmFKaM5b/ni5QoWPFr//sy3eB9TMT/7J4gDhzCckKM6ClB7Os7oscbUAimzy/DjD0Ir6urKvS8mQPSMCzviF1Kk/bGGYG5Dl4oF5LUSCb+ekgnLxvkF/RN0e925sK9DDWKJxZh4cXZZYVVzGaW0mjWG+ninJaI194Ask1fW10FeidIToCHW3VKY2f6nf+V2R7IGqnXL4DHAIFTu1cOKd6V4hK/Mzks7FUEyCMuQaPKdxiEfLjyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYL5V2c/K2TLuQNziJA6QCPCbt6S2cDtHqJckZHOvPw=;
 b=LY7rfprT1kMa1GUjW3RfhhinT5TZN7fFXLhStQtDXaGmSnW1IT2I7Ec+k3ZIikMeXmKpcmMGpB7iHl53+DrQybrDXUvVVJCDw88LzdYCDkKVrjLFS7mjnCCQUUs3EfIhweuN/+MrUB/hCq5yShSbyaWtEXwfRe6dqWStlmyLUV7JEgWeY+x6QzaSlHszoiJD7lAQ6A2giHG/qBLucrLdYEYOfMMVauQX0c2EaZxVjAcnX+BstEz72E853AI6DuQTrmt1p9d0p4+BpfSCOQ/CYtcBSANZtvyLPAD/Nvt/15pbOV54YC6UedqRTb1OMEkRmPGUgkjwJ32uVl0VPJ0k1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB6602.namprd11.prod.outlook.com (2603:10b6:806:272::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 26 Nov
 2025 15:44:46 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 15:44:46 +0000
Date: Wed, 26 Nov 2025 10:44:35 -0500
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
Subject: [PULL] drm-intel-fixes
Message-ID: <aScgY8QMjmyJRBX2@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::10) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 833264bf-a121-4e62-c212-08de2d02b973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?j48WJCD6UUVahdJw9tUaJjusuEIMCfUbPt5rFtJ1x4IiXTEFMsCa4OYqzd?=
 =?iso-8859-1?Q?io3HYecHFydjS4G5V7uoSK+mufyP5Mdm5+qdHj8WLavz72RhR3CCH6HhG7?=
 =?iso-8859-1?Q?qLVS6prBdqusAsLCtgE5OCWHBoUwpUBrHtNCSZ+Mtv5Jefi2rqyETxMRgv?=
 =?iso-8859-1?Q?ZvQThWIEklf+Tg6Fw0U1/a0XpdHq8V5HdlkP9P6+58sf4T0gpSp3A5QvYR?=
 =?iso-8859-1?Q?zmUPHhZgfHqQbTRlOSEbEH5s3zm1jlW+vFefjmSvWHSNwXybBnZ5pzDx92?=
 =?iso-8859-1?Q?fft0e2LZwcyKdWDHU6dpWm1MnbIBRhCZGRH4XdxxjUVia+WPuvRIUJR870?=
 =?iso-8859-1?Q?lKoAbrt3Ib9M+BoNUoPaUcHCcdp5av/bY9cAdJYeLz3C6njD4gO4aPnGNu?=
 =?iso-8859-1?Q?2Vp6nNOUi45c425ldYTpukKLtiX0kRi+Unv9o7xizg/TwipmYH1ywZWDKN?=
 =?iso-8859-1?Q?LC8x2ssjPgGna8lD+MKDMkppvUtKbNX/VbK5k27+yBuPiDm0ubegazjhUp?=
 =?iso-8859-1?Q?9zPPzPn9BTl9OhywiLrIhsACJ0BtS+McEoBdL/9f5Zq9i6GrbvZ15uWy1J?=
 =?iso-8859-1?Q?MrIEtZOX/HqceSqBkk/DV7HroIyYZTvdAR8H9yzrspiT8s+qu2hMCzd7Ht?=
 =?iso-8859-1?Q?kBO2NxcDFyFIdBPU8HpT5Y6fuD1MBKuL+JsUPDvYQrPN/aRR5gDBbznJ/t?=
 =?iso-8859-1?Q?EIeAnCse/OdQ8tRG5pN9+dtm8YoPQswfWtGX9UPR8FS3btkeCzm6NYTxnM?=
 =?iso-8859-1?Q?xSn8cvsTa1j3BUihCXU3j0mSOjM/RJZNJOn8Q+0ybGAaA9xF19dMWR/w3A?=
 =?iso-8859-1?Q?KFmBT2V8UHvNl4MOUWeiHEp1+9Va+bjV67i8HGFfkzDrpCBEybSePS0o2/?=
 =?iso-8859-1?Q?sbpnAn+O2Alwum6RJkJgbEsBvvWyX7kNoGpIp09PqWInjXLwW+YX4n9PPX?=
 =?iso-8859-1?Q?bIvW/lRgn7H7QRMRD006S7w41xD1tP2bG6dbXi50JtQpORhui9aRNNuR0r?=
 =?iso-8859-1?Q?pXviSmzJ8WU0UJUEFSU724rPLmSBkJOUH6r/DjxqlbYN6+CSI4gD0NxNAK?=
 =?iso-8859-1?Q?GLcs+GTkMVzFjz6VEvIHPfYt73kR0cYN5tGUDqzb5C/TdK/bdyicRX3aIx?=
 =?iso-8859-1?Q?V3Yv+zFua7ituvofIaG7ecgDYAToAvntEHjk8Px78El+nSSTOpZn5FAFEG?=
 =?iso-8859-1?Q?WCHfzgOsyr7nSEfpkY+luoQwP1fQW3GZ+z01MzmFmH0D8CnITSlhrK6yNd?=
 =?iso-8859-1?Q?iA2QdPTF18qG9HJrOGND1u64wSyAqkJXuoQC2fvqAPcjKlA5jrELbSic19?=
 =?iso-8859-1?Q?x8YeZy8THwo0FJZO7HqRiCeDpcMT5xELE/6steiWGvWvJ0ELb8Geutkmkm?=
 =?iso-8859-1?Q?Uu05rzRY8X585KRYJlmA2i5Dy93hLAuJLkJxsr89O7Il1i22kQGFE398w3?=
 =?iso-8859-1?Q?Ud6pPr/L8zAgUQnSR5AIleEA+8QUiC3X/aZnQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XE+rL78ACCPPBWGo53xTmgR91w8tj/TyFhC+BvJgyB+X9AB00z8nV1MLnT?=
 =?iso-8859-1?Q?bUFR7N0q1/Kq1+LkOq+tAbpxy5dU6mlpevThd8HJi/saU0qfWyy+PGSyWV?=
 =?iso-8859-1?Q?VL2PoGZKuciSVllUUNPmdkzIWNa3aznAGFTZEK10oK/FMPwufTAF06pezF?=
 =?iso-8859-1?Q?YyPqoBCvL8+TbpWU3ExWw4YJ8RvYi+hCVXxkHt138jN64q49qJVlnt4I33?=
 =?iso-8859-1?Q?f4xZFKZ6u7gJ5SQ3/Ns510JLjMdVm/HTml3DCCXhRIZi5v+zNoM1BjUeQi?=
 =?iso-8859-1?Q?Sn6B5WdE/+/5PNuZRWYMmVVawZZ5MDV+n42fM2uHuc7mqr9zNc7+NxvNJO?=
 =?iso-8859-1?Q?9Fp48HmIyiKkmjTfUnkmkx02332eDFlbnJiK6r+mnIlT4U1gHT72Ha9hqI?=
 =?iso-8859-1?Q?+ebgk2O7s136omaagYYDUKZtrK/iHrAtiiYc15Ooqu2tzTg5vKeM9JycGr?=
 =?iso-8859-1?Q?MDeGSSUPY223rbIHcp0Ow5EfURWjn1o2cUIhwEntS8P0dRg/I8FPNS5Er3?=
 =?iso-8859-1?Q?T6P+mhhHd7YjnffM6dRlq5GuJAItDtihEZafrDeOV+NuHRojsz/ydm+ByQ?=
 =?iso-8859-1?Q?x5aPlmcXLZp93aZq0A3iKvvQcs7JNSbDE7qZtOqiQWCQf77ApYM6Tw5tdC?=
 =?iso-8859-1?Q?INUkmSBzfV+AMYU7EBorF6vwj91zcN/FDSgRzp3MK9bYLjpxKZUCwrXPg3?=
 =?iso-8859-1?Q?vmNFHME048vXh0L1PZYaf1VpA7hd7KGABkwrvmV+h5go8zl/cADUrzZBmw?=
 =?iso-8859-1?Q?/JQ2uFvcCLKzq2EERnN8c52CRBL8Un9G9qUVczdyZ4e7aaUHonISySJS1a?=
 =?iso-8859-1?Q?LXrkGkg7VHh5ROkph+t0ga+ZxaaXzfBv+V9nMikS5DPHSIbHep/L4dekT4?=
 =?iso-8859-1?Q?7jbvn/XMSQKDFm7KepnuqpSaYVk8MBUxsEBc2mcNlm5iU9UZlGwXQdDncm?=
 =?iso-8859-1?Q?mMQRvlpi7qf3pqHosD4Qkm3aaDyIeNZf9jmDPiziILpIm5e1VP8RkrRBnw?=
 =?iso-8859-1?Q?pcsP11Ty8QdSwEjnKdN57YNWj2PyEKZYcBXovKxQfpLTrE/KhG1YU8hGkH?=
 =?iso-8859-1?Q?0DqkzvassM6ZfNtaDCgo3Rgg1YRieo9yZxc7sYaRYCsdwIT2NyAevHgDn9?=
 =?iso-8859-1?Q?uA4T6zgf0KZBOYNfea4hjGr6PjXOVs4P+0kqvyEaTCve+Sc22UajIej4yy?=
 =?iso-8859-1?Q?8B3jG5S001rufVAoEg8U56B5Rw+3LkqDReIM1owBoC1Ks7uXWJuubOW3aK?=
 =?iso-8859-1?Q?lkb+YhyfpcQRiqEEQd/+Y3vFPMPThFrLaSTi/tnOuZdxrJDBxIpgJoKKyI?=
 =?iso-8859-1?Q?ieZ2ngPjkOwGs2F2++FxDUicvwkfXHlB99tOoBhcLZGXrFhzlKMp1x0BdC?=
 =?iso-8859-1?Q?Pe5uLYxbhIwO8l7SHvlL6bzBrfB9FZcsG702fuV2M6dNiKAOOcYQj2kYbM?=
 =?iso-8859-1?Q?oIcgl8QDMIalf96acKMIMDJ9SB3mD13ZEAlMFTWerJMVoKgVYqM4EhllvA?=
 =?iso-8859-1?Q?0SdV+5bUbdLGZpwYd5Q76SEtoW+g4a/JC9xIM/imYzjkfFzJoWGpjNsC8x?=
 =?iso-8859-1?Q?REfjzHoh6VQQm++aJ2mC0rLGtFb+4rbCEF0k4ZLmVNFSWTr8yM5dyIQVl2?=
 =?iso-8859-1?Q?8dVFYXsDuK9O7ObFLnihl5YL6twosI+YC1ZSIXu03FCDPepTHOBdnqIA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 833264bf-a121-4e62-c212-08de2d02b973
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 15:44:46.1034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xhG2/evsJpL6VMGPCUsGH18CVrgQNtJqrLvAz3SwAW8kI0e5QaNYnF9H7q99iRkCyR0HbTkpAAWMCluorYmQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6602
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

Here goes our drm-intel-fixes for this round with a single PSR
related fix.

Thanks,
Rodrigo.

drm-intel-fixes-2025-11-26:
- Reject async flips when PSR's selective fetch is enabled (Ville)
The following changes since commit ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d:

  Linux 6.18-rc7 (2025-11-23 14:53:16 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-11-26

for you to fetch changes up to 7c373b3bd03c77fe8f6ea206ed49375eb4d43d13:

  drm/i915/psr: Reject async flips when selective fetch is enabled (2025-11-25 08:24:33 -0500)

----------------------------------------------------------------
- Reject async flips when PSR's selective fetch is enabled (Ville)

----------------------------------------------------------------
Ville Syrjälä (1):
      drm/i915/psr: Reject async flips when selective fetch is enabled

 drivers/gpu/drm/i915/display/intel_display.c | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_psr.c     | 6 ------
 2 files changed, 8 insertions(+), 6 deletions(-)
