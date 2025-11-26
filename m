Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B2C8B169
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AD810E6AD;
	Wed, 26 Nov 2025 16:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bdb0f4Cj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7339910E6AE;
 Wed, 26 Nov 2025 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764176173; x=1795712173;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NXEfju2n9/4MvAnxuMCYm1j1fSmCYHV+pj6AKkH0l2s=;
 b=Bdb0f4CjgiKqQZHimI5UJ0luF4/yugnaPBvT3ZljAlr/v/56pZg5f0np
 jcz+m4C6r5wPuFf8USXxLvv5t54DK6vbByPA7+bd9oSo+0vCf9cCr8ylz
 CLsgGNM7OlguznlG5TABKgoDHLuYqz0HmHXYX29vkEswsFntua6KI0VMt
 xVKpe4/pGX7lY6uac34dFvxs6qm2wTE81R8Tc8TVE/2o2fodCrlZwUeKd
 k3cwNkpQGLyBelpPe14UK8Yr9TTMzoxKaAB6M8xHnNa4g5RAOruLyUaJ0
 2mwnemmMhRqRxQyE0VuLwWonCbZVKiIUGkvXXEpi2NQ++z4cj25KKDo03 Q==;
X-CSE-ConnectionGUID: q/WZXygMToaq9k8spOPCpg==
X-CSE-MsgGUID: O0VHiOxURrK2RlolBQKOIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66296578"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66296578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 08:56:02 -0800
X-CSE-ConnectionGUID: a7Sqrf4MRByhjD8XK0JPqQ==
X-CSE-MsgGUID: /5yPeZh+T66CQMMJXlLV+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192240783"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 08:56:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 08:56:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 08:56:00 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 08:56:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fnu+uhIDXJdJJnTbG7kDRQahP23o+EI4laOMvzjbbhXuhcV6TEwvOd94GL8M6l1Hrg2mjErkRoWGGfEd8srfFmxFbE+po6riIee1LRnEf32yowl9A6+nrj3t1O4C1fembSCLy60DHmOLNCqMUGDP3+0GeHzgZ5E/KOoQ0gGZqJkKiMLRZrZ2s8OxpQVkmxzGRfOcJYPpAyaEBMMs2BARFwB7XbIaM25Ibsg5LhHzcIpYDsIIt5y/lq6hY526/JGIDOBwlnGi87RuOtxGfLsTLEIRQprxqlq/Q4ulMV/MPW4bulIjesT6RMLANKRO1H8SVaArPDovfrwAvYWK6kqU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITrg8htAmcUkNC0cOn1nzxvXssGE91/zWK6DxcwPcnY=;
 b=tQHH/Dz26+AYoBWESo4db3XIVhrUHCS5RD1kKdZbfgGhL18J80Hx2ue/cGNmKNCIVqk2+FMdkIO0FUZsKVAPD5Xc4qKPcNPHm05N+zH2bwO7M7/M003Aen7jT5abH7DRawTEFSvaGhbUzMfcS7oRIAFalNuFfs+0867nwRq7PjKTwOgQrKeDBi20CL5kyHzIxFUXVgNlvLZmbyU8qkGUzsnsqUL/CSVmrJ7M1utGqO5Q5Z1mZ+6i4HP+0wqIlFzVp+rnLDooly1MV34pA5hOrbUTMn4ihcdhagMTIix/8DZduQKpQ0HdhsKrQgO3lr20O2XrvoRqlhSf10ysnDKJ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7372.namprd11.prod.outlook.com (2603:10b6:610:145::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 16:55:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 16:55:56 +0000
Date: Wed, 26 Nov 2025 08:55:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 1/6] dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
Message-ID: <aScxGDYeNeN1WYja@lstrano-desk.jf.intel.com>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-3-phasta@kernel.org>
 <aSctt3QFiEIB61Gr@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aSctt3QFiEIB61Gr@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0373.namprd04.prod.outlook.com
 (2603:10b6:303:81::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: f73647cb-50b4-4d97-7e1f-08de2d0caab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oJxjR3psbw3NMJHrDQERuuGpC5pZ3A+F09qgRiMzoc8KXQFrmmOSqARpyfod?=
 =?us-ascii?Q?fyZamGEWy9YEtU4VlGDJFn+Iq2y0I3TtR5YUYuo0hiGtOrStgz61/Og9UJHH?=
 =?us-ascii?Q?1sVd3B6S7nUBzj19u1cEMD+w1FKM19nLJJvaMT1VyCJMVPRbQ82D4uXbovlK?=
 =?us-ascii?Q?TNxy0ondfF/RKWQuqKO4QwSLyzaDupc1IldA65QRgDgnojwx6Ku107tpPxBY?=
 =?us-ascii?Q?pJ4/kVzBMGYGdaL7hqK68LLXYmKC8p2RvdYhdGnApO0xcIfbV0yF9O4YzDmM?=
 =?us-ascii?Q?mmVlBM1grXpTD6R6WmWufsOSXIr1b2KfQmwqflMNaaLBAr+CG4+FlOOMr6y/?=
 =?us-ascii?Q?2ENYCmu0sA4W/WkvXGsfb6hnUyp7TNofTYSVpTgnoxFGMgtGAFINUwyYe0RO?=
 =?us-ascii?Q?GEFNMPF+E5ZdKX2myFI9RdifraAMR8cjSzMqJB92gzcjQ3ozik30Ua+GJAOt?=
 =?us-ascii?Q?+nAG4FfTQS6ZmP/k29ZpuwZWD2Wty7MkuBDBKbGcsSgKCUBW6DssIPqryrIR?=
 =?us-ascii?Q?YD8NFF3RPS607M/1wLtM3xqBEBbMYYKI9uo+Y+UX0UUdux+mk1AkdMjKJSSd?=
 =?us-ascii?Q?tMjeI+O5DqxgMT8XkuW4aYdFJkuRbykppCwH192q6e43ueeSRKSrAdmRmpIV?=
 =?us-ascii?Q?Ilu3gAWlL5so7ahvU0ES/GW4cRCftwkhDoMm4XoTGRpxru4oTTrj8Cfd0M+6?=
 =?us-ascii?Q?yhUvWjkWYzT/4t3wc7yas1Dv87S39apbBjMqiH+8XRYyTyHfTAKgHw9i8mPD?=
 =?us-ascii?Q?XOORC4rc6C5+Us0tYZPE19iEsBVULCG1s/FD8MKBld3HJe7Vu/ALQklAOUyr?=
 =?us-ascii?Q?DJLYZTJiDI+dhg9e32ZtNjeUBpvJfVnBFey4mPrG9CSQ1b+xKaP453nxiSZx?=
 =?us-ascii?Q?6P2PlSPY52Zc38cmebi53xcG3oQPmi+g9pUV2oN5JYyVF9Nj66TzkNJy3pA6?=
 =?us-ascii?Q?GPAha/KpTURENDP+j6iWlRqBCn16xhpgLOca80xqqr3ozO60MFMZV7By6gAM?=
 =?us-ascii?Q?wr1SYq6bMJ10oRh6kWoLlinA6ozDucqZ2BcZ/Fa9jbk/TIt6S/IL+gWGh/uJ?=
 =?us-ascii?Q?NEIXXwZjdgEPfbBxa1TLMxbJ5d3Tnm00YwoC7Vhy6rSOo5KagYuPp5gJdnkP?=
 =?us-ascii?Q?zeqaFpDCpYWB4bjUblZjGR2lbeS+CLqZo7g3rGD0rmi6/ZSG4B9ZCSB1Q61t?=
 =?us-ascii?Q?fSdXvv31QHfIqcoxHjL5Tchiqk1Zr4Az3lMUVGYDSRR8G0UkAPp1cbU/H31K?=
 =?us-ascii?Q?O2lYbSqF+8264shrWeM7dSAV3CUTxMAmh2woctv2rVdnFB+ORew1H/43Dogn?=
 =?us-ascii?Q?V6+0DjPraJavY3pNMNfRXfqXIDyp9P/wh6weyx/qsxikjt/NDLzHkEw9EhsA?=
 =?us-ascii?Q?ZNxIPauGm74lMZFB2VGd8v94hlYF3fwR3f6oIAObZLdvV/3xd9ozqaaHEh4Y?=
 =?us-ascii?Q?IdjUfeCnCfPLVkD8i+u2qkZ4QnvhdgW/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KfDkIfejZ6jkBE5nyiXL++AwXHyRxANHHdGaqu4qfZLe8KWgD0gX7asMqtjS?=
 =?us-ascii?Q?47X0OrhJDFJ3S0FkFe0QXOUnWV4r5+iF0hPL8Om69eBT/6nFwd+VAzkCyeIL?=
 =?us-ascii?Q?Hv85lCbcufYNv0ZWbO9SSZ8jEnRNJvUG2S9bLypczb7y42CglZmKGiZp30b7?=
 =?us-ascii?Q?XatYDyF2qIhB6epTcAvULzqGTSzJ8T02sZf+AjegXe8hnAWxXkKc7wbAhW7Z?=
 =?us-ascii?Q?hgt2KQfABoj7JMMzEohr/2fb5xpCwVCcgfUPH/oGuxt4XuBp+CPWxDsf2BSy?=
 =?us-ascii?Q?Ox1nS4mnvDdBAkChMOO+0oJOtwx+hDLj7IUmm4tFANj9BymuvRTAuXQC5Q1a?=
 =?us-ascii?Q?bWUjnG+svGcPz2xwt0Jl5h/6eu2XPHupDhMhw6UCsAzYfJeFpV+XTGXV2IDk?=
 =?us-ascii?Q?tDMpp17CUrUpYld+F887FyDp+jjzhB+E00DRksEwcX9LMpjowVbuO0QddMjh?=
 =?us-ascii?Q?npl7nD8s5VGPNwnifYA0++yn+V3su7j0gaznqX90Cx/eRHPFAszWaAm7Ey5g?=
 =?us-ascii?Q?ZP9g9Blrf0IPdL+yj02PFXuHHL8fsh5e9DDC4r7bPeblmCJUAAhyDVqzDVFS?=
 =?us-ascii?Q?UKjGwHCsFBuVJNXBMyWPEviARzUA1jRDFnoFdsSprpgfrx/OOOjaqxfqSiRS?=
 =?us-ascii?Q?9k7c+DDACO8rmiDwiyRjRGNvNWoILBlrFurJ0Dh53V1xAAgGqUInbA6SEbtL?=
 =?us-ascii?Q?pR2GFR/IK+QCX3Aei6fM4NSFA0RDdjYHdKkGLt+9oe5K9RVqGVUpVUoArqse?=
 =?us-ascii?Q?hv8/M6ph11dBEOHGiWFtGu0ZeJZK6I+faex/0rOGi9OwdpMJNbD7KM6UG9ZT?=
 =?us-ascii?Q?+o+3cU1QDJ7IMmmcR3RENyiO0bNB/BNw8lZMCGNvK/ON/I2AWnxFjKJYOc4D?=
 =?us-ascii?Q?jvAOYiAr2TAbMAUrsi6t4WaQbYAvY5hmwuvq9rgoxW3KCIh1RsZkBeqUJBKJ?=
 =?us-ascii?Q?JfFdZjUooCR3KOS73eT9b9eNW62YY8eZdhQJ1K+7MkHM8MtODW+4C263Qocg?=
 =?us-ascii?Q?xjH3qGW9aI+KTaaxAZ+lAqwKm1nutausqbrob8yi/QzgHniA/Dn1MYzOtVe3?=
 =?us-ascii?Q?OMVJIMmpwPtcvbO/c3Ljw56/ALTkqLpmH36IQZA10QFPWYgpj6GqcaKmkQiC?=
 =?us-ascii?Q?A6D4w/f17ayp4JkQ4sp/neH3UBjF9L940Zpq67YSBBA7urizAmHAT9iLECPh?=
 =?us-ascii?Q?QITVrv0qCbFVi6t+MGgQnzZ7q1VBE5hMDgqhE5tReia+wlFmDZlqXkMJmrvy?=
 =?us-ascii?Q?NTbpaZnIdc/2iqGepcCjzALVEXPRXn8xvZaX2XlvaLptL+pKtZYHTDi1EgeI?=
 =?us-ascii?Q?YytNyEq//3rfl7rvb3ZtCh8HHUvq8PggXulycAIWQmSXExbGFtnnTXo/GVxr?=
 =?us-ascii?Q?AFeY4PlusUp0/v8Oh2ekwHT2umehg+tUkGwxl1qoCq6BraFue1Vc0lR2mw14?=
 =?us-ascii?Q?OF75BcYxmYeDQWUapvdwXo7UKzZrOgdOojUJnEvlK76FbcmWyvqfJfjvNBnB?=
 =?us-ascii?Q?KNDUFLG52unSEcBAbQ66nADd7VplKFiiZNNF8bfwv+CzLjdP3Z2dihW5iYCx?=
 =?us-ascii?Q?SmnInZQKmEnmdbQqNLYEifrVVfHo3JminS9bIko1+QnV2SQoSVdXmlgyi+uB?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f73647cb-50b4-4d97-7e1f-08de2d0caab1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:55:56.0952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lr/Pss4VxbrFA3MqY6V0UQqb5A2gByxhpphC8B/99qD90IdJceiPPkEUM4Jtt6YdJwpR2PYGpLb0YrnZG8619Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7372
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

On Wed, Nov 26, 2025 at 08:41:27AM -0800, Matthew Brost wrote:
> On Wed, Nov 26, 2025 at 02:19:10PM +0100, Philipp Stanner wrote:
> > The dma_fence framework checks at many places whether the signaled flag
> > of a fence is already set. The code can be simplified and made more
> > readable by providing a helper function for that.
> > 
> > Add dma_fence_test_signaled_flag(), which only checks whether a fence is
> > signaled. Use it internally.
> > 
> > Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> 
> This is a nice cleanp:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> > ---
> >  drivers/dma-buf/dma-fence.c | 19 +++++++++----------
> >  include/linux/dma-fence.h   | 24 ++++++++++++++++++++++--
> >  2 files changed, 31 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 39e6f93dc310..25117a906846 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> >  
> >  	lockdep_assert_held(fence->lock);
> >  
> > -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > -				      &fence->flags)))

I need to read a little better, I think this change isn't quite right.
The original code is test and set, the updated code is test only (i.e.,
you are missing the set step). So maybe just leave this line as is.

Matt

> > +	if (unlikely(dma_fence_test_signaled_flag(fence)))
> >  		return -EINVAL;
> >  
> >  	/* Stash the cb_list before replacing it with the timestamp */
> > @@ -545,7 +544,7 @@ void dma_fence_release(struct kref *kref)
> >  	trace_dma_fence_destroy(fence);
> >  
> >  	if (!list_empty(&fence->cb_list) &&
> > -	    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> > +	    !dma_fence_test_signaled_flag(fence)) {
> >  		const char __rcu *timeline;
> >  		const char __rcu *driver;
> >  		unsigned long flags;
> > @@ -602,7 +601,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
> >  	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> >  				   &fence->flags);
> >  
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> > +	if (dma_fence_test_signaled_flag(fence))
> >  		return false;
> >  
> >  	if (!was_set && fence->ops->enable_signaling) {
> > @@ -666,7 +665,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
> >  	if (WARN_ON(!fence || !func))
> >  		return -EINVAL;
> >  
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> > +	if (dma_fence_test_signaled_flag(fence)) {
> >  		INIT_LIST_HEAD(&cb->node);
> >  		return -ENOENT;
> >  	}
> > @@ -783,7 +782,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
> >  
> >  	spin_lock_irqsave(fence->lock, flags);
> >  
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> > +	if (dma_fence_test_signaled_flag(fence))
> >  		goto out;
> >  
> >  	if (intr && signal_pending(current)) {
> > @@ -800,7 +799,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
> >  	cb.task = current;
> >  	list_add(&cb.base.node, &fence->cb_list);
> >  
> > -	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
> > +	while (!dma_fence_test_signaled_flag(fence) && ret > 0) {
> >  		if (intr)
> >  			__set_current_state(TASK_INTERRUPTIBLE);
> >  		else
> > @@ -832,7 +831,7 @@ dma_fence_test_signaled_any(struct dma_fence **fences, uint32_t count,
> >  
> >  	for (i = 0; i < count; ++i) {
> >  		struct dma_fence *fence = fences[i];
> > -		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> > +		if (dma_fence_test_signaled_flag(fence)) {
> >  			if (idx)
> >  				*idx = i;
> >  			return true;
> > @@ -1108,7 +1107,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
> >  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> >  			 "RCU protection is required for safe access to returned string");
> >  
> > -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> > +	if (!dma_fence_test_signaled_flag(fence))
> >  		return fence->ops->get_driver_name(fence);
> >  	else
> >  		return "detached-driver";
> > @@ -1140,7 +1139,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
> >  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> >  			 "RCU protection is required for safe access to returned string");
> >  
> > -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> > +	if (!dma_fence_test_signaled_flag(fence))
> >  		return fence->ops->get_timeline_name(fence);
> >  	else
> >  		return "signaled-timeline";
> > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > index 64639e104110..19972f5d176f 100644
> > --- a/include/linux/dma-fence.h
> > +++ b/include/linux/dma-fence.h
> > @@ -401,6 +401,26 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
> >  const char __rcu *dma_fence_driver_name(struct dma_fence *fence);
> >  const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
> >  
> > +/*
> > + * dma_fence_test_signaled_flag - Only check whether a fence is signaled yet.
> > + * @fence: the fence to check
> > + *
> > + * This function just checks whether @fence is signaled, without interacting
> > + * with the fence in any way. The user must, therefore, ensure through other
> > + * means that fences get signaled eventually.
> > + *
> > + * This function uses test_bit(), which is thread-safe. Naturally, this function
> > + * should be used opportunistically; a fence could get signaled at any moment
> > + * after the check is done.
> > + *
> > + * Return: true if signaled, false otherwise.
> > + */
> > +static inline bool
> > +dma_fence_test_signaled_flag(struct dma_fence *fence)
> > +{
> > +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> > +}
> > +
> >  /**
> >   * dma_fence_is_signaled_locked - Return an indication if the fence
> >   *                                is signaled yet.
> > @@ -418,7 +438,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
> >  static inline bool
> >  dma_fence_is_signaled_locked(struct dma_fence *fence)
> >  {
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> > +	if (dma_fence_test_signaled_flag(fence))
> >  		return true;
> >  
> >  	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> > @@ -448,7 +468,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
> >  static inline bool
> >  dma_fence_is_signaled(struct dma_fence *fence)
> >  {
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> > +	if (dma_fence_test_signaled_flag(fence))
> >  		return true;
> >  
> >  	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> > -- 
> > 2.49.0
> > 
