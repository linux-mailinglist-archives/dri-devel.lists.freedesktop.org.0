Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F76672816
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 20:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8404510E189;
	Wed, 18 Jan 2023 19:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B1710E189;
 Wed, 18 Jan 2023 19:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674069736; x=1705605736;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NRiGhQdWGT2ejUmlsOIELjp4O41Gi0SIttG8875n974=;
 b=ABiM8cx2d09lf7NqJTzYR3x/AaTFLJSkYIHiMegD9++ekoLrfS5iamTY
 OWtrGG5KWhnpqPbnWBo2wgoOyf6WZhihfAR3LliivGBf1WjIztElt3H7m
 llS/d3KIao4C+HhFWCH0V2rVSph1w1bYcI4lOlEk4DuKXAgzxzdu2I0Ig
 dnW7U6lkAigmYQWKta8HgJojYQJQgckBqPXM7apVAMKXZ8C6n4N69kb+m
 nSvb7Vi9HuApi3jgtILZp0btuVbnm20vPF3bYrS62KR6SGg0wX/friolN
 cmzzq3kuNvk2Nqrw1yPABG5Hx0B+TENRKbtpiKr1sCqTzgckllHE7CkcR Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="389572579"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="389572579"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 11:21:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="802324094"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="802324094"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2023 11:21:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 11:21:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 11:21:40 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 11:21:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vhe1HOWLH9wWO9pt5kWqAiZkjCotW/0eGAQ+gX1gulHxGOb7hoe18BpKnzrGbswSDqK9J/wT3ZaePuWwvXdN+ogqX3JcMSzycBt7Ko/bvDVLooz2S0OLGQh4sNP37fGHBYmA63bOn19hJD9uuJ77hBg/LHnA2yxHKPbz/Ezqj+Nqu960b2mPALMJJ3RUcmPi1tU6ZapURlPzwPtrsaqJWqLFMksCGtFh254vZ3W6MYePmroyhWI3NiByBNS2twD8Dmcx+P4A3ZneXRJoha9NTtwIaIO7e8uczPo9aDQ7qqpzcgPXJFWmlGmfwz668SdPiLwuOnGdoV3Nvh0FOhNWAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4IVCnVVs02ALvxxd6BezQMC9IwQKGmIinNUeIfSZzQ=;
 b=DlGSZTGYHKAV96vIouOzQbldP2Hr83VniZqYR2vCXQC7v2nQA9y2dxAxEN/dlE7f+nTH32e+yL4BItkWOYLd8NOzPP5R93LNMhaqD3kzLG+GoKJ52jjJSUshf+yHBwiUByYOboukOS9FcExNk11xCCf94Zi6raHOr1rZko//SZFrIwHMe2kF6qkIEDMMlTM58eAGJfqFB11gU1rebUOtK9mkyrTY2wJg4do63UKEZET40prtmqgJSWqndECKT/fNryamgojNb28FcgMw1HAH+fHAzLzuGCLb2QKbJB1zMlwngQ4dLVzE9bsz+61+nEK1WytAqklUbPzT5jTdIEcvPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 19:21:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Wed, 18 Jan 2023
 19:21:33 +0000
Date: Wed, 18 Jan 2023 14:21:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/3] drm/fb-helper: Set framebuffer for
 vga-switcheroo clients
Message-ID: <Y8hGsX+yafmFbq4g@intel.com>
References: <20230112201156.26849-1-tzimmermann@suse.de>
 <20230112201156.26849-3-tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112201156.26849-3-tzimmermann@suse.de>
X-ClientProxiedBy: BYAPR07CA0076.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 7edacf22-ff7e-4cd3-3b2f-08daf9893562
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCA0kJy1EWsu64hvrj9dBdC23J38/JaZwydPz0H/C/liGjn2IoXi04CZuhJxtLV83H0IR30yKi9ZsgYj7NoaEvDNLk36J7/1A1om2SpNIQ5zbctdvAYSRF7ZNTc0BhJpRSBbqGBOA47azGeaZH+bCkEUQXyP0nFVrF79hMee7J49f9R8oRTiTMlBqVm6Rl9icC8v4Aq2H7QilKlw8Ud2Yn9aM+CLnV+bybC9l2eiZkk5Lx1cD90I4hlBy+lofFDBxC21V4MGMIzwBZgekdDHi8+/TX4XRvi+S2SS4ppq60jbyZzUiTGoYLDz00Fehpf60uBUI8eW3WKI5oiFlJ00GGgKYJiokTG6xE/JuLAnJO2Mn2sKD+gfpHlOHrUXL5ci51BFLgXJmO6AAUSOsr9BAupt8YSbvQVPBtlGorp16PZ/KohSWgtADccvLgj71QnUQ2BGWylKDz/Yqh56paEN2OnQaUNXn61OS6vVigIge/Gaj2GfVrWQSL4mG7KUn/is5WfUD4m+FqvTDPWTFoIggGGVE7JhrV7EHtCGJsGwOLmGcZq71vXJKYEcvAgNSvopoF6tHPC5ToxVGRSCCbk2t22L5y/MNAWVe1RNHgDv6mmxum4SH50FIWdtPycfo5RASdWiPePDETQEgUhCRfMhqXDZe0oWglo3BZoLPHuvOLANaLQ0WqfdPSD5/zmLuWHH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199015)(36756003)(8676002)(66556008)(66476007)(4326008)(66946007)(316002)(54906003)(41300700001)(2616005)(6666004)(186003)(6512007)(8936002)(6506007)(5660300002)(6486002)(478600001)(26005)(86362001)(7416002)(7406005)(44832011)(82960400001)(38100700002)(2906002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVljaGJYY1VPalVJQkpYa2JhSzRjNGZjSDdUS3owNWM4NUdKb3FJenhGcHVM?=
 =?utf-8?B?MmpBcTU0RzhyMzhHZS9MeGFGY2U4ZThNMnZ6QzBkQ3MvWFhYaVpPUEZ2Zm9J?=
 =?utf-8?B?aFVYQy9BZFpjTEJXU0x4aVBCOGYvdmFTQ2taeWRuSUpLSUhndkdVMTcvK29p?=
 =?utf-8?B?ZERubUdBdTNzejFrYXdVeTJ0ajR3dFlZaFpndGoxMmdTUmVZNGhybTgyNmNE?=
 =?utf-8?B?L3IzUFBmUzd6WHppUVBaVEFOSHFSWFltb2IrdDloNTNsM0FrdjcyeTJKTlFh?=
 =?utf-8?B?WUdySUdJMUFCWlB6TEFOQVl2VDl5YkxMMnlycmF1M3NEQ1pjZm0yQ0dFekdl?=
 =?utf-8?B?cFpUcThpLzY0YlkvU3BsYjEyZUlMMzVjb25OUmlUZzZORmNzb3lsQkJnekJO?=
 =?utf-8?B?Uy9VOXluWEpVb251VXBQOHpOaS9IR1lJanVUMUpISTM1bEErMEk2b21pSkkr?=
 =?utf-8?B?bFhsc3VrWXFNQ1pNNXVoU2N5RHR6cUhDWHVxcERNQU9oUks3V3l2YVB1c3VU?=
 =?utf-8?B?dDAybVlrekNsVUNPQUJ0d2xVZ2E3ZEU3Q3BFTHZVTUl6S2ViQmVldVhuVU5X?=
 =?utf-8?B?bXlYTDV3cDhtMVVlRVdRdEdzS0pHYzc4dStkZkxNVGt2NFFvT0FSSzNlRFdM?=
 =?utf-8?B?WVNBRUUwREJnSUkxUEZJbHkzYlhqcTFDWG9LT2NONWRjQjRtN1J3NlhBcDMx?=
 =?utf-8?B?cFd6dHEvZldzR2JTK1RSRmpIR3FHQkdqSDlxRCtyS2VnQ1pSOVFIcVB4b2hp?=
 =?utf-8?B?aGlRNEJjVzk5S1loWCt6bHExYXhzZkZBeTN6SFprTUdmSEV1RWFQWmhWV0lP?=
 =?utf-8?B?WkQ5SEpmaHZaZzdxZEF3Mm12RGhBTDJrUG1OSUZER3RJR2hXbTZNejBpOVpS?=
 =?utf-8?B?SThkOE9KWnlubXZqY1ZmQ3U4UDc3TUV4MHRYT2VKU2FGV01lQnp4R1Z4WFpN?=
 =?utf-8?B?RUMxWWhHYVJSWG1CdDgwSUo4eHBsOHV6MnhFVWswVVY2TVRoOWE0NmRseVZF?=
 =?utf-8?B?YW9PTm1NaklOMlluQTBuR1ErREcvOHRtRDVMT2h1RVNrTUk1Y1BEQmVhRzZE?=
 =?utf-8?B?SW1pL0JTc2ROUjl6MzFyQU5FOUlacnJ5dTlaVStsRFB1VllERzBJazJjWkIz?=
 =?utf-8?B?N3NDcmM5NXhBejBTazhEUmhVN3FjOXVnMjNTUW1XVWZCTmRYYld1bG9wazAw?=
 =?utf-8?B?ZmhkMFhtc0ZiSEZHZFd1cUNXMHRiNFlpcEMzSG1ib2xpZmFyRFo2blpMTlpi?=
 =?utf-8?B?bXI4emlWZW5PNG1OZzJoVkJCd2p5QWZWSE10VkdkZXk3NXhCaXFtcndHMW0x?=
 =?utf-8?B?b3EyODRFbHFzZVcramR3NFFLeVk1Q3NnUmsyaTRWYWFFekZSNTZ2OThNRjJt?=
 =?utf-8?B?LzN1aXM3ZkFsNVZYSG8wV3BndHBVa1pDNHpzSWpHYUwxaWRJSXNEZFdPQ20r?=
 =?utf-8?B?Z3QrZnZJQjBqTzh3Y1Y3VWd3bDRKK2oxMkFSc2hxQTQ2NnFXcFphZXFycTRE?=
 =?utf-8?B?S2hvMUwxN00rcWdZVzRNMnlWd2JkMGY4MHp2R1BvejNIbjgwZm44MDAxRjU2?=
 =?utf-8?B?cEhMdkJKQWt3ZXdmcEZ0dU02M3QzcEFIckpVWFQ5TGI5NnUvREtOWEd3VFM5?=
 =?utf-8?B?NEV3S2lBRVdldTRYeTZIUVByL0wwakFZeGQyeGZWcDhKbEFCbUNKOG5QdGIz?=
 =?utf-8?B?TTh4SGZBUDhCTWZaZHNzVVBtQ1BlN01YYll3SU9zaW02QnN3VUpDZ1RiZW5y?=
 =?utf-8?B?Y2JwM2ltbVV4UUY5ZGQrc05MTFlDRDZSUSsvTlFPUG1RR3FaNWx2QW9Ld0hP?=
 =?utf-8?B?eGRDaWJNallMOGtheXpmNmxpc2hNbk4yd1BTRC9BNlJhTFlyYXN0TWdwdUtD?=
 =?utf-8?B?cmpIcTV0ZHBDaGVwRk9IL3ltV2pieU94dU9KRXhVRDFuRGpZMGZKYzBGUjdh?=
 =?utf-8?B?bjBQendsVlhFZGxzNG51bm5YRHB5NzRBdWlMRHJCY1hHaExMZE9NMDVwY1Va?=
 =?utf-8?B?UUtWYzFrVUVaRmZhU2xrRldGU20yUEhHaE1HMVhBZGsyVWFVcGRrTkNQVVpP?=
 =?utf-8?B?YzUvTnRjMVdSUHFLanNLZlViQjVkSGNETmRGZWoydTRNWXM0Ym1hbldhRWVF?=
 =?utf-8?B?bjdjYlovZ0djangrSU9Tc3FsaU95OWd5VVJLWGhsUTJWZTA1T1ZjY0pLVCsv?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7edacf22-ff7e-4cd3-3b2f-08daf9893562
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 19:21:33.2655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UsEhv6OkuoyroYfPBiDEq3TkkC9doeE5XPSTS0pYfLIXKo2gR7EoXyqLe/Cip9Ws8pdS+Vo7jEC580OQoydqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, kherbst@redhat.com,
 Daniel
 Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, YiPeng
 Chai <YiPeng.Chai@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guchun Chen <guchun.chen@amd.com>, Javier
 Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 intel-gfx@lists.freedesktop.org, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 "Tianci.Yin" <tianci.yin@amd.com>, Hans de
 Goede <hdegoede@redhat.com>, jose.souza@intel.com, evan.quan@amd.com,
 tvrtko.ursulin@linux.intel.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Xinhui.Pan@amd.com, stable@vger.kernel.org,
 Solomon Chiu <solomon.chiu@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, alexander.deucher@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>, christian.koenig@amd.com,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 09:11:55PM +0100, Thomas Zimmermann wrote:
> Set the framebuffer info for drivers that support VGA switcheroo. Only
> affects the amdgpu and nouveau drivers, which use VGA switcheroo and
> generic fbdev emulation. For other drivers, this does nothing.
> 
> This fixes a potential regression in the console code. Both, amdgpu and
> nouveau, invoked vga_switcheroo_client_fb_set() from their internal fbdev
> code. But the call got lost when the drivers switched to the generic
> emulation.
> 
> Fixes: 087451f372bf ("drm/amdgpu: use generic fb helpers instead of setting up AMD own's.")
> Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Likun Gao <Likun.Gao@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Stanley Yang <Stanley.Yang@amd.com>
> Cc: "Tianci.Yin" <tianci.yin@amd.com>
> Cc: Xiaojian Du <Xiaojian.Du@amd.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: YiPeng Chai <YiPeng.Chai@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Bokun Zhang <Bokun.Zhang@amd.com>
> Cc: Guchun Chen <guchun.chen@amd.com>
> Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Solomon Chiu <solomon.chiu@amd.com>
> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Marek Olšák" <marek.olsak@amd.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.17+
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 427631706128..5e445c61252d 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -30,7 +30,9 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/console.h>
> +#include <linux/pci.h>
>  #include <linux/sysrq.h>
> +#include <linux/vga_switcheroo.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_drv.h>
> @@ -1940,6 +1942,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>  					 int preferred_bpp)
>  {
>  	struct drm_client_dev *client = &fb_helper->client;
> +	struct drm_device *dev = fb_helper->dev;

On drm-tip, this commit has a silent conflict with
cff84bac9922 ("drm/fh-helper: Split fbdev single-probe helper")
that's already in drm-next.

I had created a fix-up patch in drm-tip re-introducing this line.

We probably need a backmerge from drm-next into drm-misc-fixes with
the resolution applied there. And probably propagated that resolution
later...

>  	struct drm_fb_helper_surface_size sizes;
>  	int ret;
>  
> @@ -1961,6 +1964,11 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>  		return ret;
>  
>  	strcpy(fb_helper->fb->comm, "[fbcon]");
> +
> +	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
> +	if (dev_is_pci(dev->dev))
> +		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
> +
>  	return 0;
>  }
>  
> -- 
> 2.39.0
> 
