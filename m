Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDFB5B0FC5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 00:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF31D10E8FC;
	Wed,  7 Sep 2022 22:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A060810E8D8;
 Wed,  7 Sep 2022 22:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662589294; x=1694125294;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J7UCblqNCr4I5ra8rL+cBmwPNWPR/6W++hwhvrq0180=;
 b=jfnVwBufvF0QPRaVCvkBacNHKUM6xUvdZElgR8xTfFoqI51Mz/DSo4tx
 DptKC5klhFuLi6RSOiy8Mt004r/AoisqWT99JdRCKt5gAba0CmzK531xn
 BmIh8QZJfXSx+hYvHSKcth5w/7/RmGySGEbMS3yzM8n8ssiVMErdgGUcv
 qCjTtbuKyaVlH7vB4XfHbbPiSMkd45Qlil8xpQwWmnegZ4po2W4gctRxA
 mRFn7ssgtIfONWCPz/LwhZ+xVvCPcpIguX22tCgqSZ3uAsjoEb4859/2x
 byrH+7I0sHsb6QEpuaePF5JfazXaHfyNsv9di93e1gQuOhr3TX0WMpVAW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="360975204"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="360975204"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 15:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="676404650"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 07 Sep 2022 15:21:33 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 15:21:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 15:21:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 15:21:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDNo0KyXplHVvzY6bvnuz4MFdPWe3x3Qt87fue3N0PXU8Jfq0bCG4N8xC0yfWL/XvgTdChnfQLqtzrFFVFjPplXufBzI+HWd7OWdhYTY4x4uiQmUhoX0vkojg/x4XXxiVg+xmVcKAyKUrU+QmXHso8EWTnOAO97UtTRzc0V7879c0ykmUCrD8cDhSjkIcOR8uyXHM0BjU9Aqog9dgS63F9OGgwQHk5e/87qlV+ITUG6fF7fKR0EAuvlszpGb8c9BtdmpjQTUJaL+VvSN8SxfIkEZk+VCGnOyfWCb+ZHdjdMmFofVoDVhjy+aWD47IojVkoSDOk2gm67GgOUeRDoUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQRNi/NftLC/wVquD1LYaAJ3JD4E+Q7XUgdWVjtxZf0=;
 b=YQ3TeWSr/9uR+aUzPSszZfcjns6dqNGCPRyDZ0OOh1Ml4GJLBRTybkR8k8KY7TpZ+I8b5UXW2rgOx5KHAxTL73A5J+D22LlgsRwkPLvhp2E62tjzdDzJGywdg2y00cPyIboB5xsEPh3H5TEnBeF8bRMU+Toukeac+0+ZD+GqJQb9RfIs9oiR6LtjyjvAgFAdyHutfO7GIVw5EH2dmVDF9LEyn9eWD9rGfgHrClj6ZJH0DyO6WSTv0Dpo1NwUe7Ts0G5V8M1DAoWnR/sKJ1hKvmxFA0TBNXH4WAYrnrixSLicczO/hEqERicHPwJojAhTyqC0W/nKb6UsNYk1wsL0SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN6PR11MB2544.namprd11.prod.outlook.com (2603:10b6:805:5d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 22:21:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2%5]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 22:21:31 +0000
Date: Wed, 7 Sep 2022 15:21:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 02/11] drm/i915: Read
 graphics/media/display arch version from hw
Message-ID: <20220907222129.yjwbuymda37jy6mp@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-3-radhakrishna.sripada@intel.com>
 <20220907204925.52jz35ufbxvvm3yv@ldmartin-desk2.lan>
 <YxkXi5b2heLYZaRS@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <YxkXi5b2heLYZaRS@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR16CA0030.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adaa63ec-eb92-4505-f27d-08da911f50a9
X-MS-TrafficTypeDiagnostic: SN6PR11MB2544:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8UL+VJ9Dd5Glt1zdsZPP5jV88/VndlYE8BsJnQ5UR4CeqNDhaKV1c0Grw9FOHrbIuR6Dd5r+flWLmZzhQRin3KLCVrsezysq9MLhx5q49X4dhBLV5BpMoiU1UGo8hEplc/caWUfPIa9XaWbYG20wFIsy5npQqI9kmxRgwjFFWjNeJLha3mtQe4yclgeREyKDFJ7xcAflJtWCtWht8wVm2fKJARP+MI5mE3PKWSz/JZV2iYZgIvtP5bMfWHRUcmZc6pNFyn2hWXBcY3bkw+vZoFUMBwiS0FXMB8fYGLBUZyK3bswR/ASYk5fHGyUGWkvNMdIXMZ8V8oArBPTsq5wFZpB3qMuhwqJOdyN/SI+rRjrebEbVeiGAsGzVbIlXTytyN/m7lz6DAhKOTZLHYmy0QUR48guDiDHwV2UBmGeAFxZE+16paurazqN4ek0G/SxQpB81gU4v3S6HdD2Z4DyAaHEjt8DoQVPk/FpEtCiuxrQB3F+m53vehJZSHuaP1oY8RQFhdSxHOrpG29rmGOfNbKRb9TLc/aTOZAszPyYAkrsgCSyCGkQHEVn0ng3IyIxvfIBZdR4FQUfUzHsKmp3YFgk1wMUTTnfn2OdMnibhROfc3wLSPi8woTJ9vJM0Jd+GcV/W+7gpFmGgkNKKzjAFoWFvQLu5jUpCnbNHbnSE3He688AARA0f2CChQV0TJdxObqAsj3X+beyRWHzEb6oZQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(39860400002)(366004)(136003)(376002)(478600001)(186003)(5660300002)(107886003)(6506007)(6486002)(6512007)(1076003)(26005)(82960400001)(9686003)(41300700001)(36756003)(38100700002)(83380400001)(8936002)(316002)(54906003)(66476007)(6636002)(86362001)(450100002)(6862004)(66556008)(2906002)(8676002)(4326008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IY8Huk3vyv9DOnhmZl8uvLewPX3P5j39YtcumJgRXyE0mpw74EE+LSpZdU7P?=
 =?us-ascii?Q?GKWrg5smJqvcAAZZ4ZMuz4SzHrp9gPNLxqc8kiXXgGyUxN6SDrSiS3Q8Jm9e?=
 =?us-ascii?Q?hPPOMX2XMSwSmIZ7F/RaVevCDCRXpfkcJjgkQ7t3iCyKJG1OMsoKIokrrfdY?=
 =?us-ascii?Q?4Xm5jwFDXexWuHEaHeXM5xEL5CP+iHle2/rhgQPes7v/z0l1gNwhV5V3IJXY?=
 =?us-ascii?Q?/6B5zyXFVlNvIIuaSxTeJQ2jq7KWQvOlRWD1TrqmsvhQYE6H1n7niYLkG12x?=
 =?us-ascii?Q?iCY8VWLrpYS6unyBPNNd9O8ZIGljysaWxcbjuxqaPTj4B8X2UwOvSP4l8HY4?=
 =?us-ascii?Q?VyDDfEHHLTY6L4hIy8IkueEsPtNe7Pq8cKDRtQ+1wRKmDrBKNqrhsAw25zHD?=
 =?us-ascii?Q?44YJgcWe1dz4KoCsVulWkCuoqIDFkYUkE98EY4IwuRTTKVCQ/4bZ3dyXXUGV?=
 =?us-ascii?Q?dOi7K0AOVMV9QnIhU5RmKIABZ6iw7/mKFHgPpzMjmZ9soFcaEKnFG2MbQ06E?=
 =?us-ascii?Q?lYdoKtkpGsBMYDumW+Zn4E1wBovGCfhSeqcCWSM1te0PxfAVXmQxuZ8FtbQV?=
 =?us-ascii?Q?70uIso5tKaE609eZe3pQAfX+6iwQmj7rqUUquNP2tjxO4UY6ueYDIb9MVYSH?=
 =?us-ascii?Q?49YonOTHS+hfnFZXrCjKQocjGIzEocuPZL4xfFqeckL6obuNO9Qkoh6cXX/g?=
 =?us-ascii?Q?dtKh2XUf9kdAnfPQ67wK1EQUCO+OEIzqYXo9Gp2F4Lr5kDRxENtLb1H/KD7t?=
 =?us-ascii?Q?Ckl34oguSwCX84Z5x8S6Bt1CKM8fJXeK+e92aaJtgsBq8c7RjLqPooYYooDf?=
 =?us-ascii?Q?G0GErlTOfRqOyqIdOD1Re2UFRhBffq2nzV0rM5e6Y0TCncPqYg321o5F7fDb?=
 =?us-ascii?Q?ceu3VTEzwq2PG8vwqxlBPrZgVSLejAT9q9sIT95arTougKkKCHGSuH3xVM4n?=
 =?us-ascii?Q?5yu6LG1QxiY6SjMl41/sh2d2S5An5bm/WCB2IPM3KlKsxm0PAf9JqbufprVj?=
 =?us-ascii?Q?GnFJEh6JFpT6GuGQEAnW6o5L4P6v2yG+vx4tRYHsbmkETMwzZZI91Rfw3WAm?=
 =?us-ascii?Q?m+Ktkb0n8IpWG5LsgV9sXhM+6r31YFVfvNVTQyisqq6hD7haYVPeQFHsFour?=
 =?us-ascii?Q?JfemSuDvDdzozxiad7Lly4D1x0TSAQ09RDwvttdiJQI686UXGW8VQyuTWP3q?=
 =?us-ascii?Q?bHOqY4GtgK7tl4KQlA5zMpJSmMdJJiNKiZV9ODZI14jOuygZPOHYVEFRG1/1?=
 =?us-ascii?Q?3RsuUvbl+W80D9DPWoqpPQlGZCiTO+3u0x8t4wsBSO40oPHQxplHBFHd6Y/v?=
 =?us-ascii?Q?+QPkQE9s3GHsqmiYqORtKTHR2Scjl/8V5P3mfIOh5CdLC/60JVwA2Kl5CUjd?=
 =?us-ascii?Q?w75NyVA6hxTvMGZ8m3qA6rVMIg+zi9kvodPSfkiRi8WOxMJz4wRDF7BsZGZx?=
 =?us-ascii?Q?klhkzo+BnEjrD/wxgnrK6rOoIDHfRz0IFhmm7AkZSBFd9ARLdu/c2eksiL91?=
 =?us-ascii?Q?RYM0RljzZlMVKT9zjNZM2REMQtcU1rasypWEu2VXIhKV97pZHTr9AhdWr9Fs?=
 =?us-ascii?Q?KRBg5w9D9ps8Oc6LVKYdmzQzbMi8s+7f3epsCxAQfoeWGkisG6+Vjauia96d?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adaa63ec-eb92-4505-f27d-08da911f50a9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 22:21:31.0769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L03AEnSxXQl3etKhzWRICaI7AYrsRspChBmpvqk5pqylTJ1IIwKslnOJEmY620zP6sbQdRS09zvnpjEixl2fPhEvlNCPQBDx02ip/iL3RGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2544
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
Cc: intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 03:13:31PM -0700, Matt Roper wrote:
>On Wed, Sep 07, 2022 at 01:49:25PM -0700, Lucas De Marchi wrote:
>> On Thu, Sep 01, 2022 at 11:03:33PM -0700, Radhakrishna Sripada wrote:
>> > From: Matt Roper <matthew.d.roper@intel.com>
>> >
>> > Going forward, the hardware teams no longer consider new platforms to
>> > have a "generation" in the way we've defined it for past platforms.
>> > Instead, each IP block (graphics, media, display) will have their own
>> > architecture major.minor versions and stepping ID's which should be read
>> > directly from a register in the MMIO space.  New hardware programming
>> > styles, features, and workarounds should be conditional solely on the
>> > architecture version, and should no longer be derived from the PCI
>> > device ID, revision ID, or platform-specific feature flags.
>> >
>> > Bspec: 63361, 64111
>> >
>> > v2:
>> >  - Move the IP version readout to intel_device_info.c
>> >  - Convert the macro into a function
>> >
>> > v3:
>> >  - Move subplatform init to runtime early init
>> >  - Cache runtime ver, release info to compare with hardware values.
>> >
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> > ---
>> > drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  2 +
>> > drivers/gpu/drm/i915/i915_driver.c       |  3 +-
>> > drivers/gpu/drm/i915/i915_drv.h          |  2 +
>> > drivers/gpu/drm/i915/i915_pci.c          |  1 +
>> > drivers/gpu/drm/i915/i915_reg.h          |  7 +++
>> > drivers/gpu/drm/i915/intel_device_info.c | 74 +++++++++++++++++++++++-
>> > drivers/gpu/drm/i915/intel_device_info.h | 12 +++-
>> > 7 files changed, 98 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> > index d414785003cc..579da62158c4 100644
>> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> > @@ -39,6 +39,8 @@
>> > #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
>> > #define FORCEWAKE_ACK_MEDIA_GEN9		_MMIO(0xd88)
>> >
>> > +#define GMD_ID_GRAPHICS				_MMIO(0xd8c)
>> > +
>> > #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
>> > #define SF_MCR_SELECTOR				_MMIO(0xfd8)
>> > #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
>> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> > index 56a2bcddb2af..a1ab49521d19 100644
>> > --- a/drivers/gpu/drm/i915/i915_driver.c
>> > +++ b/drivers/gpu/drm/i915/i915_driver.c
>> > @@ -323,7 +323,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>> > 	if (i915_inject_probe_failure(dev_priv))
>> > 		return -ENODEV;
>> >
>> > -	intel_device_info_subplatform_init(dev_priv);
>> > +	intel_device_info_runtime_init_early(dev_priv);
>> > +
>> > 	intel_step_init(dev_priv);
>> >
>> > 	intel_uncore_mmio_debug_init_early(&dev_priv->mmio_debug);
>> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> > index f85a470397a5..405b59b8c05c 100644
>> > --- a/drivers/gpu/drm/i915/i915_drv.h
>> > +++ b/drivers/gpu/drm/i915/i915_drv.h
>> > @@ -936,6 +936,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>> >
>> > #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
>> >
>> > +#define HAS_GMD_ID(i915)	INTEL_INFO(i915)->has_gmd_id
>> > +
>> > #define HAS_LSPCON(dev_priv) (IS_DISPLAY_VER(dev_priv, 9, 10))
>> >
>> > #define HAS_L3_CCS_READ(i915) (INTEL_INFO(i915)->has_l3_ccs_read)
>> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>> > index f6aaf938c53c..4672894f4bc1 100644
>> > --- a/drivers/gpu/drm/i915/i915_pci.c
>> > +++ b/drivers/gpu/drm/i915/i915_pci.c
>> > @@ -1129,6 +1129,7 @@ static const struct intel_device_info mtl_info = {
>> > 	PLATFORM(INTEL_METEORLAKE),
>> > 	.display.has_modular_fia = 1,
>> > 	.has_flat_ccs = 0,
>> > +	.has_gmd_id = 1,
>> > 	.has_snoop = 1,
>> > 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>> > 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
>> > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> > index 5e6239864c35..e02e461a4b5d 100644
>> > --- a/drivers/gpu/drm/i915/i915_reg.h
>> > +++ b/drivers/gpu/drm/i915/i915_reg.h
>> > @@ -5798,6 +5798,11 @@
>> > #define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
>> > #define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
>> >
>> > +#define GMD_ID_DISPLAY				_MMIO(0x510a0)
>> > +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>> > +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>> > +#define   GMD_ID_STEP				REG_GENMASK(5, 0)
>> > +
>> > /*GEN11 chicken */
>> > #define _PIPEA_CHICKEN				0x70038
>> > #define _PIPEB_CHICKEN				0x71038
>> > @@ -8298,4 +8303,6 @@ enum skl_power_gate {
>> > #define  MTL_LATENCY_LEVEL_EVEN_MASK	REG_GENMASK(12, 0)
>> > #define  MTL_LATENCY_LEVEL_ODD_MASK	REG_GENMASK(28, 16)
>> >
>> > +#define MTL_MEDIA_GSI_BASE		0x380000
>> > +
>> > #endif /* _I915_REG_H_ */
>> > diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
>> > index 56f19683dd55..a5bafc9be1fa 100644
>> > --- a/drivers/gpu/drm/i915/intel_device_info.c
>> > +++ b/drivers/gpu/drm/i915/intel_device_info.c
>> > @@ -29,6 +29,7 @@
>> >
>> > #include "display/intel_cdclk.h"
>> > #include "display/intel_de.h"
>> > +#include "gt/intel_gt_regs.h"
>> > #include "intel_device_info.h"
>> > #include "i915_drv.h"
>> > #include "i915_utils.h"
>> > @@ -231,7 +232,7 @@ static bool find_devid(u16 id, const u16 *p, unsigned int num)
>> > 	return false;
>> > }
>> >
>> > -void intel_device_info_subplatform_init(struct drm_i915_private *i915)
>> > +static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
>> > {
>> > 	const struct intel_device_info *info = INTEL_INFO(i915);
>> > 	const struct intel_runtime_info *rinfo = RUNTIME_INFO(i915);
>> > @@ -288,6 +289,77 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
>> > 	RUNTIME_INFO(i915)->platform_mask[pi] |= mask;
>> > }
>> >
>> > +static void ip_ver_read(struct drm_i915_private *i915, u32 offset, struct ip_version *ip)
>> > +{
>> > +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>> > +	void __iomem *addr;
>> > +	u32 val;
>> > +	u8 ver = ip->ver;
>> > +	u8 rel = ip->rel;
>> > +
>> > +	addr = pci_iomap_range(pdev, 0, offset, sizeof(u32));
>> > +	if (drm_WARN_ON(&i915->drm, !addr))
>> > +		return;
>> > +
>> > +	val = ioread32(addr);
>> > +	pci_iounmap(pdev, addr);
>> > +
>> > +	ip->ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val);
>> > +	ip->rel = REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>> > +	ip->step = REG_FIELD_GET(GMD_ID_STEP, val);
>> > +
>> > +	/* Sanity check against expected versions from device info */
>> > +	if (ip->ver != ver || ip->rel > rel)
>>
>> this doesn't seem correct.. if we have
>>
>> 	ip->ver == 12, 	ip->rel == 1
>> 	ver == 12, rel == 0
>>
>> we will print
>>
>> 	Hardware reports GMD IP version 12.1 but minimum expected is 12.0"
>>
>> should it be `|| ip->rel < rel`? Once we land the static number in
>> device info, we can only expect new .rel versions greater than that.
>
>I'm not sure how much value there is in keeping this sanity check at all
>given that we plan to remove the device info versions completely for
>platforms with GMD_ID.  But if you want to test this in an easy-to-read
>manner in the short term,
>
>        if (IP_VER(ip->ver, ip->rel) < IP_VER(ver, rel))
>
>would probably be best.

I'm ok with removing the sanity check as long as we log the value read.
We still do when printing all the info, so lgtm.

Lucas De Marchi

>
>
>Matt
>
>>
>> Lucas De Marchi
>
>-- 
>Matt Roper
>Graphics Software Engineer
>VTT-OSGC Platform Enablement
>Intel Corporation
