Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECAC576F3D
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7954F1121D3;
	Sat, 16 Jul 2022 14:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE6D10E282;
 Fri, 15 Jul 2022 21:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657920369; x=1689456369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eZo8mA3RGlkDPd6T99En5boHwyo0udBaMF2HXLwhxVg=;
 b=EB+owsAl+mIeOEyAVel8N0Y5Ntpvq0nwvDOofiz5A9W+dUk0V1PwqH6m
 hM/GKwzqqFSd741WbW83GFymnQOh/xcd72yxMM8wnWASeUMW4j5EwITIm
 48yhNUBylPA6Vyg3jtCoIaCL6eYW0paV8gpGOu934xSP6Rc6+LhlWlQNO
 Uba7DSt8ZccOFZ9nuWXpSBqjUKabBdU8OeR0uE35jqdwJa5Jeg/5t9pBU
 fIwrHCmG6m9xnyam/vmklkg3Xa/XnT1e4Mn0xvhwQoXyqZrQx7uRXN1+S
 bVL6Ak38GvpeNKw8d0immcMesdxzatBKqNVnfWoGw8x9UtWdaDCkRuPaV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="372217619"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="372217619"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 14:26:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="624016090"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 15 Jul 2022 14:26:07 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:26:07 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:26:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Jul 2022 14:26:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Jul 2022 14:26:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXRy3Ew2Bzq5kBY6ZbaEPFUoLtQ+YBNrfM1ySSQQ2lb0muybzKepmElttWchdgy9VCtHF+mIjFt63AOtiM6P17KlhwKyzqNirb6+zw0fAkM9IL5MEAqIg8OmTi91WH6o3LYoxYbHnaTTLdW8Wfju8uhPHZWLjBmhJwVpSVBKuUsva646wlSoV14e6lD53yTMPYILLn7EU/7U7QMlk85LpA2fqz733oFXiux2JytVqolSLyZw38hQ/C55YmygWIjRdEc1NlMQzUY56oiU7OqmpnX/Bps/VSLc9XQSeZePKTQ3YeOTTtm2YaUj5bgZiUUyxbsbW2+1L66+I8ZTdFXVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ctt3FKIYWIsoIWYTdOwlV1zPyYa/S5nDyOSHBHwVfko=;
 b=cW7SVlBHBMazak1g4sVcASVn0B/E/4ZLA5j867S06xzZceRI/aP27QBl32szftUZnoBgRiVNZwRZYs22+JyejiRAUcPwaO1o6ls2uTGGJt9Wcb3qytKgWkKAa/3nirusB0jk3V0Di7VI8UiWmpLMBjJRgbsOlZckfmv3yqfq8v0KL2tbP/y1OQTO6SVqNshXpA2/2i1zNeF77U8/gWeyovltLm0qwVBa4VSBpj5clklXBQNZEZR1hmiyRpGCZt0FM/8ypmOlleEIQgNyU9enuzwZV+EF0y/AAGEg9ODZiTSacGa2RDA45oKvYmVlrXmKbp/RBl8PfbcT974JpEqTmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM5PR11MB2028.namprd11.prod.outlook.com (2603:10b6:3:d::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.17; Fri, 15 Jul 2022 21:26:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 21:26:05 +0000
Date: Fri, 15 Jul 2022 17:26:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 26/39] drm/i915: i915_gem.c fix a
 kernel-doc issue
Message-ID: <YtHbaViIllnSiZIA@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <3f512107b7c7c1bdbe3131b3a35d9cc34e29656d.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3f512107b7c7c1bdbe3131b3a35d9cc34e29656d.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR02CA0056.namprd02.prod.outlook.com
 (2603:10b6:a03:54::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 905e0d8d-3cb3-4d12-9962-08da66a89ffe
X-MS-TrafficTypeDiagnostic: DM5PR11MB2028:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w599579iOoidcRcA5QyOR8weIyTRXcuwKMkWbVkeVdV4d5ou8mxs3wzuDwzWFzwZyJustVgkspQF3vuD+7mDzR5SRRML2WwW7+EPlTdZaq6r5anTR08CPjtETnQR6WOrWTUD7He+nRYZRLFZHvJs2xP67xBpuzWS8hPuZBPGhpPdnWDUsx5JdZmBvUxi4tUFQZB/CXVpTQpvqgHD6wMoQXmdJ6zxrz7l5Q4vRPogE2sB38TkJP2GpPDGBNxIDx4dblznUhsidIMPreWFkDvH7nxJDWfmSuuDkia6VWqHI4kgUajDJ6MO1BX/Zn4NplNs3W+e7spkfzDrhMUbDaISrSH9PZxc35PYbLWKzByWsgka8ABW4xVeG8Zs/ia3G8r3Q6g46gYFRw3ZWo5MF9G9rXRiCtSfVSMD+7pm0HgHKGLcPF0CvOZzsu5l4JVMZ8Dj6AnAvihTiH9RAoR/kqskY+Wkwju2s+rwad6ihk3BtMriSJ7pHVU7KvbvakdxBLaUKZuCICFqivXoIKspsZjr0cqF42unLraAOCaoK+/x4EvyxLchMceLaT9vtcKLCsd8xOsLzsaD60suVC+m4yRROJGeGn51osmMAbVLjpw6/7wZHzpZGt/mLQP7l7ImjswWU1qpECcd9wburxJpdfRfcg4zOpUbcrbSwL8ueBLUqTEYQnqSh4FefWqeej65GWZlWzql4M/UN5sBxe3pJxY26pNzqPmMTcqTKY2k6zKUKPaw/HuEfVYPFbTpmbNojZivXQu/fUinYUu6fPtGkLlrefw3l1v7F0ce1dIeUOreEjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(39860400002)(366004)(376002)(136003)(41300700001)(966005)(6506007)(6666004)(478600001)(186003)(83380400001)(26005)(6512007)(2616005)(6486002)(2906002)(5660300002)(44832011)(36756003)(6916009)(316002)(8936002)(4326008)(66556008)(8676002)(66946007)(66476007)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aTrrG4QNzNhvI5BZbVFdy3/oB0maF+e4eEIuS4wHFMn5vAC18zbZc3K4y6EU?=
 =?us-ascii?Q?p1hDBGXs805RXouxYcVtTorDE5fCoOXPYbzTDqDZtljF7W15WcBQzgkZBZ/H?=
 =?us-ascii?Q?kxZBDu2h+R5KEM9WV13KgUZTwmOu4x0A0mmChfZia9inRfA9XaNVcztyPzQr?=
 =?us-ascii?Q?/MESmqcoFIsHvZrahI0cpFWhnmkS4bGie2ZEU9tAm/QRq/wi2VHwCXYtOJEr?=
 =?us-ascii?Q?XqY9Ve269ZTEcofbFb4qwkRgeG6jcBy2RW+YiAUxxAzQA8Vb/5Ks3Ov6XUsi?=
 =?us-ascii?Q?vgP+Ty5hR+hdX9CFphcYph8DfJwLb8/jdc6NLRF3Dy358UPcMh3PgyUUrb6R?=
 =?us-ascii?Q?TyDSyMXdhUeqq6SH6vAtOEwgtTlkY2Co8Ab1YLrNGhIrghPCtLvcucs5uv2O?=
 =?us-ascii?Q?OAbbXjjQ/Jo/W5Vnas1LATVKaLVXvstR3ALlywZ6ExK6ufKrL33Tx4Ybnnkt?=
 =?us-ascii?Q?CbWNTeFKyiTEG7ZK4LFHn+i9AC6p9wxAa76S6bEnQgYl/YOX0DkoFPaQgiMM?=
 =?us-ascii?Q?Nnd6sxZKNk24gjgQy7RjRr5wUo000lwTec3Co7HAS7LiRmjAJ9rNYwAWg9Gp?=
 =?us-ascii?Q?wxOt1tuwz/lOf+yM7Eb4y0l8AkR/64N6j/lM+6xbIwOXJvBBFmRb4zUkeCA1?=
 =?us-ascii?Q?4zpkITzF3N4e0rr9ijrTBfFt4uBnhGRISnv3Sxz5dj02KS6/LBX5RLObMynp?=
 =?us-ascii?Q?wpLNkKngziZpq35ZDNIuWkvrojarpO7WqzOdQsUJORUZUp7gHKXoHEkAJsY+?=
 =?us-ascii?Q?yDo1dtE7Zr+FzpWcvoO+ooXykPEk4rp2/csmiyeTHDG+tJayy3P8luWXUS7a?=
 =?us-ascii?Q?jWVyIrlKpW7+GFs/T+3waNYe/NGhOGRM2ZyzJUWMatf7ZXJxQI73BKknP1v7?=
 =?us-ascii?Q?sOR6QcveHsVjiXtFIgdHkHoGsgZUJgrZbHFzKYUE6AZJl83qBMGGGo+DWIzu?=
 =?us-ascii?Q?/NSQKcSHkEEBQPwiUJswbkQplw8MtWYogPAvK+59Hn+PeIOGsF4OeKfz0isE?=
 =?us-ascii?Q?6GsoABpOdLrNva6XhtmJrRAPFibT8tlR6ZWzC0Cv1cVaoXVEjgDaMFOEmj+i?=
 =?us-ascii?Q?AVez+LNhLl5t6m3cqhefiYvJnwbg5d5YcSBagZ445h9LrGhn83Np3IHaHtMd?=
 =?us-ascii?Q?UG6VfUEXEGNm1N/tssX5lnFR005tPoO/vMlTGw2DJvzmF18xd2h/H0Z2rdAr?=
 =?us-ascii?Q?WGfFPfiV+haP4XxUothAgPvCsdwwd13zU10l3xwpUa1sU/p6eu84ozhyE+1e?=
 =?us-ascii?Q?J9gUsvGnuWg6emoEbuC80VG6vyA/FivzMa30gWBrgM0m04OdYd35F5lfI5Tx?=
 =?us-ascii?Q?OUZXShRmQ++VnZH+JtQLjJ5B8uJc/qfOocr9ow7GdbTgkUNWnsD5jqUkcZbs?=
 =?us-ascii?Q?XlZ0h+jvVd7Pyt3Y/NjMYnt9rBNDeHx2hLT6UUwhjHhldFphG5CQ/1OqOtHQ?=
 =?us-ascii?Q?g9B0qxK3/hSS9uT0f4D3YS6ihDW3akx924QTqaFQnhBzBdhKGCppOS3ZOlCL?=
 =?us-ascii?Q?Kdot2STpKQxHHEtPqhYG37Ep9q7q2+2xkf5v8yqrqqWfC70Ghav1BTmVQap6?=
 =?us-ascii?Q?hOoOEjs4RztHDZvugZXFWlWeONGie+kevWKPHCwCe8mhnOdkPDlpiNGfVU7M?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 905e0d8d-3cb3-4d12-9962-08da66a89ffe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 21:26:05.3491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nDHtkS+RqtE3hit9/ygTijsQ0Oikk5W9bj6k6RvIXsSEy6IWmjA7pPU0HvBCGfwWU/J9WN6gxmwb5Mhh91DpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2028
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:14AM +0100, Mauro Carvalho Chehab wrote:
> Prevent this Sphinx warning:
> 
> 	Documentation/foo/i915:728: ./drivers/gpu/drm/i915/i915_gem.c:447: WARNING: Inline emphasis start-string without end-string.
> 
> By using @data to identify the data field, as expected by kernel-doc.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/i915_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 41e83d078a70..0ca4bb08ea78 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -444,7 +444,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
>   * @data: ioctl data blob
>   * @file: drm file pointer
>   *
> - * On error, the contents of *data are undefined.
> + * On error, the contents of @data is undefined.
>   */
>  int
>  i915_gem_pread_ioctl(struct drm_device *dev, void *data,
> -- 
> 2.36.1
> 
