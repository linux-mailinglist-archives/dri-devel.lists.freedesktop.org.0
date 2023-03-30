Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D27E6CFC5E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3568910ECE6;
	Thu, 30 Mar 2023 07:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889DB10ECEF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680160313; x=1711696313;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pBbTar/GWetK+itGYOHgB172Nh02ABsplEQVDiEzDQs=;
 b=Y5WuV29lFNNRoatHhRMSNQLcOAYo43p+jl/InTWIjZDmrpTZNhGLmQOa
 ul6TvUAyuC3cMLv77nKgeLU3swAW1OJNk9pM8ULVdHy9wDJWnE6A4lQOa
 pMcpp2emQHHsZIi13NoUJwV6zO92d5cIz8zu21l1WfskThMkFY7XikFD+
 GeIh1K2zqu5crKDRcz771+nQdY3L+i6Ti0fXMKHiSdvD0cQ61dah7bvQX
 l629aN3tbu1OTI0J9tNlCD279RTMwANuKDTlIxHEMeuJNygnnLe9CiriR
 D7m9ih/Ym4WNMdelo4akElbnwiC8r9IGx0q/Txkn+1vvPKF9Zl5dHPved A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342702085"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="342702085"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 00:11:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="930616620"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="930616620"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2023 00:11:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 00:11:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 00:11:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 00:11:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 00:11:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euQKIkg92gv5KmErFcmVkN9mW+klUytOPWGUAUFHjb2o5kgaww57UowdaBOtZK+41ClMmfv0sxB6f6OoRVH4wEDX4qnakyRCtuvXj6waNx7MAdZaG+Y4JZ5Jwdoyy0FrQ5JXO1KQwrIzmMwNVGnj1WErFkQzWnywJVU1hAZsnHezax4uR+Za/Ch2G+VBAY3g6y4mOsnYuwiCNpLdsZMPzLnBl9NTor/sjqasIh05hiLZZoLuDCF+MKp0ie/dd/WBRCow2SOuMlLSfzvsk4rYYZJzvB+jBh1wr3mrw7aCdAsg/iwXhTsaV6MAQRMIqN+BxcSfv49JAsxis+pH+UXD0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4q+VUy0j3+TKut/u1g1rorfDgoLS47v8omJFYsvWfQ=;
 b=UF7NHysgV11+laU6ht4tAfHcityuHuMA6yADHinJ+YEUPILpeDAV1HPImOmp3iFwHPdO/TJTtk6Ej2DlGbUJiD8r+eyOS4fSSvV/eX45k/myOlBXdAlkRI3ufbBDnFOYdIYZDdhpqyrlkktlii968RqDZBlCsq5ayQre7Zig3p1jJQAGlq2+9pcCbiOYKhUvlOrzJbLGprEge2gZdFZb+1MC9swFRiSFVfl3dXp4N5F6Csio0WqvDHkKY5/3N3oWWAYfXvZnJC1t8Ki+zHBJPuP/yDv2qoGLw/s1kgtONtw9Si5tPwZROnErAe8IJRgF7ETFVx7ckfCGPODHWs0UmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN0PR11MB5710.namprd11.prod.outlook.com (2603:10b6:408:14a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 07:11:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 07:11:48 +0000
Date: Thu, 30 Mar 2023 01:11:21 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fbdev-generic: optimize out a redundant assignment
 clause
Message-ID: <20230330071121.pf4tg4pkwrfv2amc@ldmartin-desk2>
References: <20230325074636.136833-1-15330273260@189.cn>
 <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
 <20230330041726.w7boceq7ljymvfq2@ldmartin-desk2>
 <f42d8ab8-c765-2517-7d25-6ce1dea320e8@suse.de>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f42d8ab8-c765-2517-7d25-6ce1dea320e8@suse.de>
X-ClientProxiedBy: BYAPR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN0PR11MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: e825ad95-9744-4e35-31f2-08db30ee0711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a8zgWz/V2JDK0LOr8EgiG0wo1zzMX4sTDzylg+OliL2eDOQFy1F/VoZm+Rw83M5Jm6XYeywHnXhlav6bQPV6sJ32YUmSHocflMxjZWycjXyjUBrw81Xf6agQZAonO3LmlgxX5QPnzUfWv9IC1Ut0yOBXt26dOJXvRVoLClW4jws1KTYDXYSYqXQ0A33ZR6YMRuZburSc4yQO7Lye+WVjrFkTI0xrbS05KEToakMY9IvX/Y5ZInXs1DRx1uR3AlSyxL+S2/uPVJkmVb8iJM8BuDrb8X16GtH5HirCkDQLIe26sM1bkARGY9eAzZlvnn97/uTjNLGmBJnmNEsVOnQ0KIFgVi1iMj6TM888ComN94lh8fJRO1m4NzBD9k78SjDTt+E0wljaCZnFA2kyd4fug8P5IZD40/A5UWq5yQKTWxsj1lqzcHQ8IBdxqfdWkETHi4CJXIHJWddNmdKCWCzQ1l0DUqW9fVBJqzKWNZMgALr0JtMjEC/nwZo6K/8ZD1QcuDPR4/pxJEb4KkFAMpZmsmiPrWN819cp4aGyq44aJTxoOBySztvMAdtcZ0bSrBO/Kr610NXh5RDSsR9jWExLA9sqtRTSwqLfGvXJnx5HxWA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(186003)(6512007)(54906003)(6666004)(316002)(6506007)(9686003)(1076003)(26005)(83380400001)(6486002)(478600001)(8936002)(38100700002)(5660300002)(86362001)(4326008)(66946007)(41300700001)(66556008)(8676002)(6916009)(66476007)(33716001)(2906002)(82960400001)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R7FoF7IVNsXIrNMPniKvxd9iNYnK2ZZ8h1hvVmZwHQmiE2IXZh7xJEOI4w?=
 =?iso-8859-1?Q?6isdBzw1ovtw5WHmCnkDk0k+RtwFcR98IBjOLOCG+Fl98meW1XYfQymwH3?=
 =?iso-8859-1?Q?ICD/J5Lq+RqK/GK9+8DKy3buYxp0cmF4GxQgM/dd6G/It3fefQRaNT7ytv?=
 =?iso-8859-1?Q?v3By/LoJIY+LsjEuCLHPPZR4k+q0arG2ub4oxWgOYl5fB1iOzrrkNkiPTM?=
 =?iso-8859-1?Q?VBpUl5AjhuHlnVKdx30dU5Wkmtf8FTtqwBCw+9fj8RtoEngLAkLmyGbETX?=
 =?iso-8859-1?Q?rbjcX+uquMH0GSEXWxwG8TuI6GKF9pNDxjrPr5uM2PEG2qyosR6+Z09s4q?=
 =?iso-8859-1?Q?r+nlMtxzXIBbIRu4FXiwZmYUKILQBIAi6lJM2pMaemrjRzbSVBX50FjnuX?=
 =?iso-8859-1?Q?CBcvrmVZKTpWy6igVGLmXvGzzGCL4o710YYE3cYZSsdaaLgpspFUJwHI0q?=
 =?iso-8859-1?Q?iTf80qk54qjP6wSiUOo7UY9cwHO6tMvloK7Fn4KFFt1kGCK7+dsmVEgCca?=
 =?iso-8859-1?Q?CVZq+QwcU8t0uJfT11PgSqIhNfGzbueDmuo+/SeqzbEVOHMYgGXHqv4MqH?=
 =?iso-8859-1?Q?53M5+S9vjsR892Cz9sqBvzaR1TPgLEgZ7ABQ/DIqkZkCIWFpzbo+JD6PCS?=
 =?iso-8859-1?Q?nVtLtAyALIsshS5NOuuiAhcJGCJ0XKSWWaYmdS/L4rLbN6qA+FxEIjFlwc?=
 =?iso-8859-1?Q?6/ha5k81yK/fvawY26pAtjsEn0gG0pFM2J+FakkjDiSQnXFeodACUYuKSE?=
 =?iso-8859-1?Q?rgbDFkmPTLqrfY4w6S/QQ+h1rM6JaJklzWpIDilCyw7qHOD6iHFIrQZqbs?=
 =?iso-8859-1?Q?+XLjrRO5+yE7EVNhQfY7ifjNze+AIaIwQJwno9bNDaGnKga0ofMYsH9+UO?=
 =?iso-8859-1?Q?T41iA6YzvU63FWJZj8SMNWJcPnIDrJq2dov12dA5ED+FHEJpLJ1dwntITd?=
 =?iso-8859-1?Q?V7J5EO9GMyDpym0QoV0rsiveWGm1wbbR8UUEAVgy6IHl1tSXMNMbtVsufj?=
 =?iso-8859-1?Q?ZB4K9suMX8haH0hoDo20ck62pIbyzA7EE2lg680xSE1U1yjOe7B68D5END?=
 =?iso-8859-1?Q?R4xWduzED4WpgbLv/KKM+r0iE8lqGHpQBQW0VEUSzKWXzg7BG+IOAOYuIk?=
 =?iso-8859-1?Q?s28nPz7SIm/Y7kdTFjzRYzAvGnwML9xjJn2lMJVAsH1kBFWl8X6ENmgGad?=
 =?iso-8859-1?Q?7ie3xxcC1TkTB2yv95HIUezlzLu3vQE3BMj+aUods4274NIS62Umrwc8Mh?=
 =?iso-8859-1?Q?scpxtboQBdQH1/1LStEMQp4pl2QNKL3fo4jXMRrOIphhyhuq6uxvcjqUD9?=
 =?iso-8859-1?Q?T2+lIyDFLh9WkyjXnakxMOjXE0Pai3Xx1DQ9YMsIZuwNnLMbQIBcp9f0Oz?=
 =?iso-8859-1?Q?0zWv89rpvEzblLaypr4p6iizLWjZskopjzFN3zt3iUrSgCiuXbj2RW8bd3?=
 =?iso-8859-1?Q?rMKGkkkm53yQ/0tlXhgLVwYl9K0JrNq4SSKNpivaBaHNrXHyeI3o1AaNx4?=
 =?iso-8859-1?Q?I0zEbKGcLwgD1l9vtHsX9/VgzhR3fTKklf5inHACcseoatLVqMOnJnrnyA?=
 =?iso-8859-1?Q?d5n8bnvcQGDD3dHDVhYV81baEoCiZn07v27Uc2oa9GAn/sFBRo5kwbfYiY?=
 =?iso-8859-1?Q?jhEmhG7K0boS6Roq1THQrlljy3qMtfC9LpLP4pq6AyAgAukXppYVE96Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e825ad95-9744-4e35-31f2-08db30ee0711
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 07:11:48.4268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gx5wFsG1Lp1TIffyKBMWuqCS6Wvulql7tsTvn1Xi7TD0XFdxtM0A5w9rZ+3l92G4shVIb+KNVyXlznJ7Jshdq4spXUbPPOsZ03W2EWTUOJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5710
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
Cc: suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 liyi <liyi@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <15330273260@189.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 08:57:36AM +0200, Thomas Zimmermann wrote:
>Hi
>
>Am 30.03.23 um 06:17 schrieb Lucas De Marchi:
>>On Wed, Mar 29, 2023 at 11:04:17AM +0200, Thomas Zimmermann wrote:
>>>(cc'ing Lucas)
>>>
>>>Hi
>>>
>>>Am 25.03.23 um 08:46 schrieb Sui Jingfeng:
>>>> The assignment already done in drm_client_buffer_vmap(),
>>>> just trival clean, no functional change.
>>>>
>>>>Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>>>>---
>>>> drivers/gpu/drm/drm_fbdev_generic.c | 5 ++---
>>>> 1 file changed, 2 insertions(+), 3 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/drm_fbdev_generic.c 
>>>>b/drivers/gpu/drm/drm_fbdev_generic.c
>>>>index 4d6325e91565..1da48e71c7f1 100644
>>>>--- a/drivers/gpu/drm/drm_fbdev_generic.c
>>>>+++ b/drivers/gpu/drm/drm_fbdev_generic.c
>>>>@@ -282,7 +282,7 @@ static int drm_fbdev_damage_blit(struct 
>>>>drm_fb_helper *fb_helper,
>>>>                  struct drm_clip_rect *clip)
>>>> {
>>>>     struct drm_client_buffer *buffer = fb_helper->buffer;
>>>>-    struct iosys_map map, dst;
>>>>+    struct iosys_map map;
>>>>     int ret;
>>>>     /*
>>>>@@ -302,8 +302,7 @@ static int drm_fbdev_damage_blit(struct 
>>>>drm_fb_helper *fb_helper,
>>>>     if (ret)
>>>>         goto out;
>>>>-    dst = map;
>>>>-    drm_fbdev_damage_blit_real(fb_helper, clip, &dst);
>>>>+    drm_fbdev_damage_blit_real(fb_helper, clip, &map);
>>>
>>>I see what you're doing and it's probably correct in this case.
>>>
>>>But there's a larger issue with this iosys interfaces. Sometimes 
>>>the address has to be modified (see calls of iosys_map_incr()). 
>>>That can prevent incorrect uses of the mapping in other places, 
>>>especially in unmap code.
>>
>>using a initializer for the cases it's needed IMO would make these kind
>>of problems go away, because then the intent is explicit
>>
>>>
>>>I think it would make sense to consider a separate structure for 
>>>the I/O location. The buffer as a whole would still be represented 
>>>by struct iosys_map.  And that new structure, let's call it struct 
>>>iosys_ptr, would point to an actual location within the buffer's
>>
>>sounds fine to me, but I'd have to take a deeper look later (or when
>>someone writes the patch).  It seems we'd replicate almost the entire
>>API to just accomodate the 2 structs.  And the different types will lead
>>to confusion when one or the other should be used
>
>I think we can split the current interface onto two categories: 
>mapping and I/O. The former would use iosys_map and the latter would 
>use iosys_ptr. And we'd need a helper that turns gets a ptr for a 
>given map.
>
>If I find the tine, I'll probably type up a patch.

yeah, a split would make it better rather than just make iosys_ptr
replace the current cases where we copy the struct. In this case most
places passing a buffer around in the same driver would migrate to
iosys_ptr.

thanks
Lucas De Marchi

>
>Best regards
>Thomas
>
>>
>>thanks
>>Lucas De Marchi
>>
>>>memory range. A few locations and helpers would need changes, but 
>>>there are not so many callers that it's an issue.  This would also 
>>>allow for a few debugging tests that ensure that iosys_ptr always 
>>>operates within the bounds of an iosys_map.
>>>
>>>I've long considered this idea, but there was no pressure to work 
>>>on it. Maybe now.
>>>
>>>Best regards
>>>Thomas
>>>
>>>>     drm_client_buffer_vunmap(buffer);
>>>
>>>-- 
>>>Thomas Zimmermann
>>>Graphics Driver Developer
>>>SUSE Software Solutions Germany GmbH
>>>Maxfeldstr. 5, 90409 Nürnberg, Germany
>>>(HRB 36809, AG Nürnberg)
>>>Geschäftsführer: Ivo Totev
>>
>>
>>
>
>-- 
>Thomas Zimmermann
>Graphics Driver Developer
>SUSE Software Solutions Germany GmbH
>Maxfeldstr. 5, 90409 Nürnberg, Germany
>(HRB 36809, AG Nürnberg)
>Geschäftsführer: Ivo Totev



