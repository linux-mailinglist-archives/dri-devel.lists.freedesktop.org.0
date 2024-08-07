Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F0D949D7A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 03:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E739210E124;
	Wed,  7 Aug 2024 01:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ME7j1qqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E2410E0DB;
 Wed,  7 Aug 2024 01:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722995441; x=1754531441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r2F+wNs2ZqdTcpQEIB3xDV/kNRnNuRkrIrSPba1TQH0=;
 b=ME7j1qqY26mCUz/AFAXkAbypFQdryl3nwXQZjUSo8iiOHcmN24WHqPn8
 3E7LiP/+X+/IS2Is7vQi6auE1uU9qA8h0+qbBd/l6m17hhTee8K+XXUWc
 Pe6SkUT/eVy4MIMNtnn7vXevmXlWaaf1etCp6000w9YCW4Mic2x+Teu0w
 3bX/HF6L0KFzxfTauaEgQJjP4r57q7lxFl5a6RvWEizNAgkEUj3hpjoHt
 wtWjgD5eEDvNXTJshmdxLm5hCd83mD3C0M/i4ogDewCMWPdkgmsk8qVeY
 dpXxYJqDXmExl6nwCTP60TLBrnRQPS7TRoVVBKBVL6ix2AVQW2FNLmMF2 A==;
X-CSE-ConnectionGUID: hL4BirokTaqf30Uns7XqVQ==
X-CSE-MsgGUID: UrcAg599RgG7btlu7P1mGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21217545"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="21217545"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 18:50:40 -0700
X-CSE-ConnectionGUID: 2JBP9BZdS2+i1ylaVAglDw==
X-CSE-MsgGUID: HV4KmzsaSzmGWkD7YtjU4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="60806003"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 18:50:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 18:50:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 18:50:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 18:50:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yC9DGRmFyucs/VoROK6PN961OSe+6dzy8ov8x9+8qzvPO0ODOgOZS9TqTVSsXF9ulo1ZQMdG6pcuLOlvtp3q4TkQ/T8j+LyOfZllh69OMTlLXRyz0zKPOgZCVYo4GRWlrw6zbFr4gQt4xAnQPXgFR+w6PUeQusjWqFih6Z3S/pYP6F4lnOznygD4/NSH+NPBTM2mdZDJcoSMK38IkSyOYGjEnXLigU4xZsG4dMV20JXGxQAImMPqRB19AWA8ww3VYTBpjWH7j23a/vrB+pVuN+oEPDufkeIGEH5WYjaCisxsJmD8uuTkQRnEiG6eV/Z/Jn5zV25zWnvfl0uQHdrJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhVncpsGvFTh82oVXIBJVIQ1wtA/7uxwA00xIB0+AvM=;
 b=lXxp0meRYv+q5OitaE/ImaIN7cX3L6ZCQfPH+D6LtwW0Yv5BvgjpfXNnPLNQAgeMuePqGAdLJ0B/5TUieAtMmne4wO6RQTy7L/d/o1w9DnisI9ysc2uioM+IvwIeZJI7chkY9Bexk2Eu74TWk84SHbB6LGNrMZaoIiGiSvx+4ATUD66HhZ7MI1So1BgefyPmHUTQ/wf/jZIia7F5Oki1WDhJb96MMyCrOtf16NiuW6L+AdmDXDMFt+SZxQrBEYMkf7XBLHgnvRV3u7aABG0nDao6g2Qviot/YS5s1mRBBCNaCiwjlFMXkZgzLaWvJhf04CQEMQ87p06LuMXXA5fmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 7 Aug
 2024 01:50:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 01:50:35 +0000
Date: Tue, 6 Aug 2024 20:50:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <da.gomez@samsung.com>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, William Hubbs <w.d.hubbs@gmail.com>, "Chris
 Brannon" <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, "Samuel
 Thibault" <samuel.thibault@ens-lyon.org>, Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek
 <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <speakup@linux-speakup.org>, <selinux@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
 <linux-serial@vger.kernel.org>, <llvm@lists.linux.dev>, Finn Behrens
 <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 <gost.dev@samsung.com>
Subject: Re: [PATCH 04/12] drm/xe: xe_gen_wa_oob: fix
 program_invocation_short_name for macos
Message-ID: <67ahzgfa63gs7ybbunthdiwodlaihzqerb5xmkrgfgrbmghjmw@d57hhuwaf53i>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-4-4cd1ded85694@samsung.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807-macos-build-support-v1-4-4cd1ded85694@samsung.com>
X-ClientProxiedBy: SCZP215CA0010.LAMP215.PROD.OUTLOOK.COM
 (2603:10d6:300:50::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e887cd-f18c-4e82-eb78-08dcb683544c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tBoj694IRsbZPlTg/P2vm4o5WoG7zUulPG99SNILzJlKEmscDlHTtUQIQg51?=
 =?us-ascii?Q?YVO0tZtVusj91IW/cbc1Cbnp24Kchv3QS20JROYxfzrwZNTylzbOWr1qMbbC?=
 =?us-ascii?Q?gQvqbA3X0an8dKSrsojut9/X3S8Kn6vvxUnXmqi0djApMhgA45qjp0IlZgZ0?=
 =?us-ascii?Q?5nLdwoknGvbapU6zR42Gng8VQWagEiUR9xrdF1U2VWFpOi+PDMEx7+1aVmKl?=
 =?us-ascii?Q?SZYAmZEZWkzKPKFE89iWXRgZMwluQ7WFnfp1nVCBpv4fJPvqiPl7OHDJb8Ok?=
 =?us-ascii?Q?FoBjdBZRfw8lEPkMtzuCKwhxS5GXpZiBs3IOPJDa8rDa1lRjnfJOupkk2ofm?=
 =?us-ascii?Q?5Qbw6WbdhJvx2wkoo9PP2JrQC3MlGQtwQQHsR4fK+wYD32dpQsviaSul2bdD?=
 =?us-ascii?Q?Id7fL6ZAKgXFhIAeltaeuRrYksChpJTUT02FeXrszvqqiULy65wAFS5nRX0E?=
 =?us-ascii?Q?0et1J4D90RhSEO8El0VLgDrftOpVlkSOcgjx3SPIJi2X0IPg+D7VgbciPGb5?=
 =?us-ascii?Q?IIBTUBxinQBx7ZKb/kunJE20s3ecn61Hdli+DCfdwvjLlldCgPq6UY2TE1/h?=
 =?us-ascii?Q?l1hSlilWpjqPzNvsoV2Y3Q8HlT35Kaqn4hlA3Ig9hPGO7jOgCknOHlPKB+Fh?=
 =?us-ascii?Q?BJSZqaNHw+ciAV6TcegbaAkuN0AuW0j7hkUORIMdi56ExJ7EOvRUA66Bvf+H?=
 =?us-ascii?Q?JVfZGRX1jdhFXXhC9+Vb5OMJQJtC4NrRQgEDsSGXfQrocrszKZF/rS3uAae0?=
 =?us-ascii?Q?KibYECaWGWo6Sds5vV+kpOvcbyrpHHNZln6Zk+0YwV0ER7BTVMr0G9VjBz9E?=
 =?us-ascii?Q?dh5NusE3lh8nY4Jj3eFj9zzl8lIxxiUsQJs9CY5yaOGfv/CsEm4DiOU9Eu4W?=
 =?us-ascii?Q?VEzxobaVC9K9zbMYNf0UZtaWPNx+pvaJMLDqKajvGnSyz/jb4BaJkkXqAnt5?=
 =?us-ascii?Q?QOT7OOtGma8R4czZSTCUszlYUKw0qtmLLDac7+Bb5CWfX6PM6mOl3GZko5h1?=
 =?us-ascii?Q?P5r3Vqa6Ys3fRa5OfbBkOmUVCDELBInp4HmhjR5U82lufl4VsGEHwVwgAgzz?=
 =?us-ascii?Q?rVdHTXCsjjpsSRu5ZVN6RU9N/tv3ktE7/a2qavx9oslVH9iRSqCdrddSnTaa?=
 =?us-ascii?Q?/rJF5VSFTHS2GdMqgJ31iPw8VVDxmNvaWbZGr89B1G11LLPyDxd7CmhdYNFw?=
 =?us-ascii?Q?+gEL94pNJGpOXJqNqizEuzoIstqu61tvYJLSbyg6jeUrLnKDuaIIYVKeAgsY?=
 =?us-ascii?Q?pfBzDfS6caPrEMugl57ddIZ0whXN4oAuzeWCiKUkxdlWZw6d5Wr9lOgco3yc?=
 =?us-ascii?Q?Tx/GnaP/QIE+up8ctKcYtOt4irpl4y6MulIBEwL22iqOvrrTHUvCLj06Vj+H?=
 =?us-ascii?Q?i6QCMYk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?55J7iHsC6y/5JavvJ9EECNnb9U5w0YGUN9xYOq2YC8V4UHuorMlayrHo4kQc?=
 =?us-ascii?Q?vyUJw1n2AmJuRP6aGVMw7AwNYUUDfXNIE41rAgp9RXEdHl8zqodWnFFclZwM?=
 =?us-ascii?Q?/a15QrSSwSE9oYpjlXE1Hb6/6V5ZMWiWIvZXJZ7bdRrthoGt/c3PcvPPkQ+e?=
 =?us-ascii?Q?4JWgS6Sdlz8AO67DaAh7Ajx4RaHfVtWytJT/CI+RIsk1bQQFrcG3H6hf5vtD?=
 =?us-ascii?Q?PtDIZoPhXEtLvnkH+LilS86LA6Qynq0R3/zwQhbcSamS+vNy3ADsxIT+ndFD?=
 =?us-ascii?Q?siNfxEdUYDrAazUpDg3WAk+YB7wPPdpWFJLLSV8Q07mboQWrf4uTw/S6ADpm?=
 =?us-ascii?Q?G411FQF8djBIuMHXhLxuaFr0Hg6SgcrqXzn+tVlEGtblL0731jvIqLL0r2Ae?=
 =?us-ascii?Q?Pg22QmhFwaWPUgsiH25e53oVtuDNL3ptin2boCNpRPhDSglEkv2o8lN8L7aV?=
 =?us-ascii?Q?RCl0+dhPTMCmIUSgIQvXrgfkUar0S5cgXFnGbZjm8n7FobnTBmvsHsrqR1jA?=
 =?us-ascii?Q?o5lctyCecbxz82mBiiDXFPNW2ItXtaG1wfTC7qw4F9mxGnmq+qS1eiPz/IY4?=
 =?us-ascii?Q?EvSDp8gcPLp3wkm7JkqyTKbPcaA2PFej+hGHUxir6SBZslhGfTILEt54ETVG?=
 =?us-ascii?Q?cTipe3gktSt1mgVMDxdIvgz99NEeWvi7UP332PYtF8b46Rdyuz7Xr79rlVTg?=
 =?us-ascii?Q?my5FhLEbr8YuZcVP1UqOQy9Pi/U3wuuMVQaK/BPq5xF54T32b9PPRgmrlzAG?=
 =?us-ascii?Q?Li6JnjcPIvxtumjVCma8QCaOTjhqv8DeU6W/BFCyQUjcM6ecv1SPhZkddU/6?=
 =?us-ascii?Q?FvJAEkuSWNH2UnJrU/e/Eok6ufhhVo5cuwHe2rE0xBpINXgQEOhNZn66QbL+?=
 =?us-ascii?Q?069COhqgvGsI9AtDatjv9GviGIX3o5XVSf+euBQzy+euHJPNj2MRV7RjOYei?=
 =?us-ascii?Q?ElPkGe4KaA+35Dbc/6BLw3ONiwyOzWPXdGlNIMgWEOUgYu8WaPo6cmX7911T?=
 =?us-ascii?Q?kxMwrt69/r/vtwUe41FQPI+fWWGnftEwvpcwnorMQOXxmx6wYg8T4DwKuaUy?=
 =?us-ascii?Q?+1X6MZd0pR90Zk/VR/AfYi24gIFDoRbpHybqqHjyInhDgxIZnUwsyVVh/Ue5?=
 =?us-ascii?Q?1DZIVhpCdNYsBZE1/tjpt8xIV/xyJHJqjTfDKRGM9yJS95Yv7LJeqtcl4BL+?=
 =?us-ascii?Q?SquUTW0I+b6pBOdMxcH29O/bOdKAte2+geuwulhDTuOgeOFbdEtukknnpFyZ?=
 =?us-ascii?Q?rI1fz+qgj/FIGALIxZWDgwIanFuoFCBuiBVcfZ63mFfcsbbQzWvvam3BMS3+?=
 =?us-ascii?Q?MUC4Yt9++b2Srtgp3CzYHqvir6vOsuJnOA9FDnXlYwSTpA1sPCsIsAZqG1xv?=
 =?us-ascii?Q?j0vNLGXv9cXKKGImGEhSude+IdhokCKNhHO/MR5L+zQyNqNxrJY48/SGRlHl?=
 =?us-ascii?Q?Ri8gvFAoBaWqqXfT3Oeu3mnQOZPL2GSYVfJ6dcZZX1REpFrg8N9rG1vXS/uh?=
 =?us-ascii?Q?oIgb7eIgWR8QjxW2o3b1Mvl+BHLFe+jJT6l5Ap/7qxTvhxjWvE7TTgZWBFIk?=
 =?us-ascii?Q?PFOVrRvQ8fLGHe+XJc60PIkailbG5zTrFJnQgV69vuireuE67RV7UCfe1t8m?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e887cd-f18c-4e82-eb78-08dcb683544c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 01:50:35.4401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uF5SP0fhCAZg3B9lXxHBu/nutI8DuiuUXp5SuCwlriwO7EjJ7yPJtEyuSUbLeMHNwZ/bRbhgu2c3JKvZj2im7IKJCXmBDlwLMmg1oXNjIrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
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

On Wed, Aug 07, 2024 at 01:09:18AM GMT, Daniel Gomez via B4 Relay wrote:
>From: Daniel Gomez <da.gomez@samsung.com>
>
>Use getprogname() [1] instead of program_invocation_short_name() [2]
>for macOS hosts.
>
>[1]:
>https://www.gnu.org/software/gnulib/manual/html_node/
>program_005finvocation_005fshort_005fname.html
>
>[2]:
>https://developer.apple.com/library/archive/documentation/System/
>Conceptual/ManPages_iPhoneOS/man3/getprogname.3.html
>
>Fixes build error for macOS hosts:
>
>drivers/gpu/drm/xe/xe_gen_wa_oob.c:34:3: error: use of
>undeclared identifier 'program_invocation_short_name'    34 |
>program_invocation_short_name);       |                 ^ 1 error
>generated.
>
>Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
>---
> drivers/gpu/drm/xe/xe_gen_wa_oob.c | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>index 904cf47925aa..079b8870c461 100644
>--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>@@ -9,6 +9,12 @@
> #include <stdbool.h>
> #include <stdio.h>
> #include <string.h>
>+#define PROG_INV_NAME program_invocation_short_name
>+
>+#ifdef __APPLE__
>+#include <stdlib.h>
>+#define PROG_INV_NAME getprogname()
>+#endif
>
> #define HEADER \
> 	"// SPDX-License-Identifier: MIT\n" \
>@@ -31,7 +37,7 @@
> static void print_usage(FILE *f)
> {
> 	fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <generated-c-header-file>\n",
>-		program_invocation_short_name);
>+		PROG_INV_NAME);

instead of doing that, can we a) include stdlib.h unconditionally and b)
add here a
`static const char *program_invocation_short_name = getprogname()` so we
don't need to change the common case and just handle the "build on
macos" as a compat layer?

Lucas De Marchi

> }
>
> static void print_parse_error(const char *err_msg, const char *line,
>
>-- 
>Git-146)
>
>
