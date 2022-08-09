Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7058D6EB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B67792676;
	Tue,  9 Aug 2022 09:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BCF10F2B7;
 Tue,  9 Aug 2022 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660039027; x=1691575027;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b66XbpX0cI/lqMPuyB9HA9nt1XUb8ApCBZ3lB3UFlmM=;
 b=UdHX9OsN7np4og9Workry6E9jNcGfMQZb1PQBiqZQ4jdrFqtWlDpVCLT
 vGh7OWmFZPcr5cpCUUHnfm+/GBxfAorN3OpvxHyku33UViazNCet8FvXd
 t00N5Cw/4fPFQKBj3IIMnUdmtU5vsTwG8w6yPWfyf6GPYdvu1By1NNzzN
 KObd4UTIN2hOUP3h5kBnpuIIwlFy4/gjZvYkpIGBtcVTo3rFNEPq44qgU
 HlStgzFB87S4kWgytQb9MicJ4a2x0KiupCJKQD8BL5C2F+2W2AFC+f49e
 wwDexdp+FVvDlpA/9AqMrqfI5QOFaHu6ukmeE8NCVBlfmHOIMU1i952Eu w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="270574055"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="270574055"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 02:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="932422343"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2022 02:57:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 02:57:05 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 02:57:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 02:57:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 02:57:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwbMifcgzMbQmGWNLbwvhoaGLWUa0vp/EKlT2zl8zE6/6+4CZmiGBQY1rMMdHAE6tWSK0zqra1yRQwtth9JM8bpxVSbqaI4a84e9cfZYPDjazR+nxjkQr9lLlgYu3NcP+2LsVJ88BLLc2lZPM9C7W9kVH54aYuqSAKM9QH55vqbPmD7Q0KmvcmsnWF2/O/XRZsO27JvBSPMKvnKWN2WhYG69mjp6qBILrUQi3Y5RMdvaFiDOXN1mRoHoq4XA3gZsL2mIhOOqSfA8ewajPXuTtUZFCWFkFh9vi6Ikfa5D+tFl6QoaWUhkjInZ1BcPZ8zHlmKWRQpqmpdvY3cFadEc3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zu1qNahR7dyZ0bH12bgJDZzIkyqOJJh+nYY6/Gx3EzQ=;
 b=cWn7JTFuACzkBhhaGhm4oPrFGqevoMvvC4Zu/+pl7f1QNEERX2fYMeShNLujqHk9TqmpvS8Tbz5u/79fUZiQNWZRUbqh/eRxuOjGRneri6phCp3a9p+b8aRDR3Q53iC6LhSxVqk8fwBc+1ZNmtAr9whSrsFykpH19fql8uC0ghQQCJpz0e8RxScY9J4PiM7e61XymrkWMXdxUPMOYymdDHvp4NAtFA7SK7tB89CguxokEPWnvLcyosQZKUhFJhM7QbjIQYy0h73yr8toZyoF641GL2hqlc5yyfZCN/PUVl0FD2nTQ1Y9IBI9CrGeZOd97CvsttPtqT+OVkFA2ifBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 09:57:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 09:57:01 +0000
Date: Tue, 9 Aug 2022 05:56:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 32/39] docs: gpu: i915.rst: GVT: add more kernel-doc
 markups
Message-ID: <YvIvaOxs45xz/Pw4@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <7711d6d694def4129e9c2d2c8d507e62d8cc1519.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7711d6d694def4129e9c2d2c8d507e62d8cc1519.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d737005-691e-41e8-376d-08da79ed8123
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4958:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XOaA6zbdTZVrAt7hf8Kf58eWtTnta+Xb2dRZ55dTmvoKvm4rsp4g3MzVbT/UDIGlijuIiaeV39dlyJsvwEmsn8UTiNhGTdWFZlyAyvPKiv2X8w4obDgaybibBDEyeiTWe2AXLCyEA7Y3sZJfbcg+v8DnImdl7Kz/AYpqB3Ba7FLFQAq9REImnEKjCinYrP8e1qWvNBbX+2IKcx0y3DP6mO1+i4Umz55F43QrlHhBsErAfphjsTDkZvOSSI4vcWthzDAy02MWw5/paJJjzSDwqZYzdgadUefAEdj63uc0/idzYfCyoqgepvYp/EWIUr/zRMuAfkVsRxpqawv3vubA3qvUjsz8x/y/huhrN96OQMcBJBzn6KEuCeiN4p67RbvvkAYvyEWS4Uyude7H9vm+PCE/oNig3R7ZuABL4FAKOws8NdpeX3NQGe8OaUFWj3A+4tKea1irTsbwC5wk2YV/w9gtVL56MCFUy5RzXC18JW2l0AARbng6Qj5Zf76AtiA5P6BdoLPAGSXHxCag/JsrcD/tpP/oGs49OdZRp7caxfL66UWvqCbuS82f9dv/8TlgeKOh2URcDAuaSGZ2ohGM1QnYMWbFv5rer36qnye0UsT8nPzIbeOVOsv+HzIm5TCGuum5PWiY9KJI9Dod/B/uNijjEs4mRkz2dd+CFLDgVubVqhsHppK+aikN6QqeKZRtB3MBEUQmksxfovnQM92MwcQNtEgdHUWRTAk+i+rtOXC0LkbV051AGssf7FUbev8OJPGbSxKpbltWc/PcLZHCnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(136003)(376002)(366004)(346002)(36756003)(26005)(6512007)(6506007)(41300700001)(38100700002)(6666004)(966005)(6486002)(478600001)(86362001)(186003)(2616005)(82960400001)(8936002)(8676002)(2906002)(4326008)(66476007)(44832011)(66946007)(316002)(5660300002)(66556008)(54906003)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o6E9sjLH20H4IajQm8nc1HM5IAYN9A2ldJh7UkWBmMGba+oPuPfY4ls3DeMG?=
 =?us-ascii?Q?ydGllAbq4HlOrHbGxVrBQm6WUNuoJAhCp7UHRMSP7CXX9ruBzydBOR70gBoh?=
 =?us-ascii?Q?IYzHkbd9l9PuFN4OT/u3Ipdp8q+Dh79SXTC/W3/kD9rkStGgUloQtbLSSJy+?=
 =?us-ascii?Q?3qCFVxRi7SAJe5H4vp2ZuqQOjHdC30PbQzCG57HKxP0iFGVwfVMTgIgoS5ZS?=
 =?us-ascii?Q?1idyealswiDeyObTo59bJGKTF5dM4A7qVurM1b14Crp1uPjUxmJq8VnEnoGY?=
 =?us-ascii?Q?+gz+PqAYmI0pvnH1oR/qQoQ3oyq+JrOT3vuE+d+JLbdGVmrOk9OFUV/0H5Af?=
 =?us-ascii?Q?RGTqOeGSk9OTYJyWSZ1AKlCswSLF9NHbDKnPmt32pg9WKfdL+zp+HZFK0T0H?=
 =?us-ascii?Q?D5WR08i8R4HApfmrNLx2dp0fMgO9wmSkP2duPvbteEyXvFXppiZZtj10qeKc?=
 =?us-ascii?Q?KBK1xmKXgFjU/QujRtpbxpSytrOmZ2QfgsIFIbdXMXPNRUiQue+/P7lolOc+?=
 =?us-ascii?Q?hK/7Z+ijC1CHugQ+XoaGPtCKJTTcTySvZj859KQnRmR7ko1ywrfbVnWGROCx?=
 =?us-ascii?Q?YoZi/XjiER/lpNx2WWCOuh1eNzGrQg5h7Kj+1H2UMcs23u/4Naa6FefjIwX+?=
 =?us-ascii?Q?ZcMxkIwPKrScEZ3iWj7ecIpkKobF3XOQYyD8lXC4MQwahTu8mB2U+Y0W22ma?=
 =?us-ascii?Q?opxf2SbcUYWPk1W4cjEcFXN+lkLEaoLBvsCBX2xIclmnzhUoBM11v36e0377?=
 =?us-ascii?Q?Hh/SeKLX1agYCI4W1w5CFuY2chDkStUS689TnqXBR/0cAKbX+WBKVW9659lw?=
 =?us-ascii?Q?SFwKIgsztkik5eL+fgiqA7cULYcamAj1reFdiZm7aHZ51WodMmXKL8nN0NlC?=
 =?us-ascii?Q?KOTPBx32OFAj6aXfZZsRcLR16r6O/4HwnI7z93bIFvsgIJkypMe9EVRTgmPU?=
 =?us-ascii?Q?AiW2oKKL2idl2/IY4NQIvBTtIzRPFiiZX9OpprjDyZ+wDer3g3JCWMXdoru0?=
 =?us-ascii?Q?UdCcs6wRkKJUoe2PWMmTQGLFDWuj7t4IhrorRz3bx9Q8U52WH7VQUfPovKJu?=
 =?us-ascii?Q?yxDtYh01x28JdKsQb/1CnxFHUpbDJRZNZaeVZql8BAj4cLMBCGQKqv2S5Hsw?=
 =?us-ascii?Q?z3LY8NpueImQjGs4qb6gTzqKZAYBSsZzrTlU+TBOB1Bd9FbUf8VK8/efkCAw?=
 =?us-ascii?Q?DqZWO+r1Wk1vgd/++kB1VklEKQHW0WNZvjJHpaNyYWGrNctwyuBRXpkihCpG?=
 =?us-ascii?Q?PSp9XT8ZFp2R6HV35vnONY/WWuht91b4jAQw7GRHFwkmZwn5Q/4YlgFmokyC?=
 =?us-ascii?Q?SkeQIxQ6fdFzhf+WKrxFvWI/amLG71X34guWO8JYuQKLr7q6HdV7of4BOX13?=
 =?us-ascii?Q?XFrJnxDb+J3g/UTcujaQjnARnxaommNOBtsU/g62DrcXg+e8Qgp7M+7xV4p8?=
 =?us-ascii?Q?hfvsuqz6R/Ch5monM4jhQ+vhGkSy5HWernkmsF3iOu4gtRkMuVJBhGpr5Gle?=
 =?us-ascii?Q?VC4ZLYwltCzvnxW1ZbAMkoKI+k+P+1yUzZ3HL2OLMRi+Zr+MLZhFzfoJngrV?=
 =?us-ascii?Q?TQxEiasDJYeioDiqGkVvBqTg+ARZsKdbfLv7QwyrHYGDXZgSPAzymfjxrr0B?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d737005-691e-41e8-376d-08da79ed8123
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 09:57:00.9171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HPACLyZgfoYDOKAlCaXWJrJLDShC1cJkNUu42pPRlOjbq58JA0QJEPfrYpctGBPVCQEdqnq+xAO+hhC99Zs6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:20AM +0100, Mauro Carvalho Chehab wrote:
> There are several documented GVT kAPI that aren't currently part
> of the docs. Add them, as this allows identifying issues with
> badly-formatted tags.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

I haven't checked if these would be all the files, but the approach
looks reasonable to me.


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  Documentation/gpu/i915.rst | 41 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 70f2f4826eba..3ee121a0ea62 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -58,6 +58,47 @@ Intel GVT-g Host Support(vGPU device model)
>  .. kernel-doc:: drivers/gpu/drm/i915/intel_gvt.c
>     :internal:
>  
> +Other Intel GVT-g interfaces
> +----------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/gvt.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/aperture_gm.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/cfg_space.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/debugfs.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/display.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/edid.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/fb_decoder.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/firmware.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/gtt.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/handlers.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/interrupt.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/kvmgt.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/mmio.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/mmio_context.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/opregion.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/page_track.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/scheduler.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/vgpu.c
> +
>  Workarounds
>  -----------
>  
> -- 
> 2.36.1
> 
