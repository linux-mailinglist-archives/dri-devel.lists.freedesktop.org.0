Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 498836CFA08
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 06:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA3110ECCD;
	Thu, 30 Mar 2023 04:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6B210ECCD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680149884; x=1711685884;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l8ySbKSm5fphSn5af2ryD3CYMONQvlQnXACx4ZLX2Jo=;
 b=CES23FAiEdKbkHH7ioVclNdBEupLWT/L7xtgde/yzxMD/kRjVFRtr0+k
 xqXUMTm5TuQqiz1T4j+mOewv4PACOirTRLLgZETk1Ul3gSgwP1oeZVSkg
 CURDWC4FJRa8XaOo7Pe+Z6+SQBy1ouV+RPSOgMt6xJii9Lhd9uNsnX4v2
 7uu43+bnVU0qmlIFUaCrPgtwUAKk3P1y3yq8cluZE8gaeYSpM74JvSNC3
 nVrzm+teGPdZo+i67NuOZkU8zhlyDXxmi0YKAAI5OQe7IVv94LvXdol0k
 FcaX3YLg7L86JqV8Hews0UAPU/DTD3mDJ2sPiz1B7OIlHQnpEtKyDWmIG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="320717260"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="320717260"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 21:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="828152971"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="828152971"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2023 21:18:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 21:18:03 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 21:18:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 29 Mar 2023 21:18:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 29 Mar 2023 21:18:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzfJS4Ja+i+bL60nMtZ7iA9oEXWR9lWEf3KWCXmSmrLKxyA12tS9Qe56QwCwd1UO8gxAp4Y4sKNbJEM75z5LMxUK+2yOwcyaE8hFgMQ3i5/vR64T7gF3YziPSPbZi4hCQKkT8VF9Fvbe7f/bC+/y9nQYwxgjrfjukaxhEhHu/+jM8smVihv4cq/iDUQvk7Mk7O7tIz0gFHzL2CtpaIAPU7dxNzteoE2rD4sKtN+FpXqnMuODD44kNqPSaZophHMJkYieduO/RHEl5+EBrI58Fv5Vjg2NZCFv4viJe9A4ESVYFWlIjtkQqMFdMIONsIJIDxwjGnQQ8nNIdsQPy701Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=571oNoo08cR/69G1Q5mD5RLKD+AqN3vlreMuhcFIzXw=;
 b=W8pK1hfV88SLLQjF5+IrCpDncy9bgINS9AVl8rmYSNuMWtEdbaS3AFs0l/ZUEUQYXR+uDgw9opGrlgIbpnbtzmdJL226obQ4rmQpYTBJu19hGC6VogV3jyhgm0GXa2eHBbg2BXq4vHlPLLYMhHYRUWc6iX/MljktbRknEaRFmSVcrdY0yPWi0IL24NBCXqCUONGWIof64T1Oj4gqIjhhlxuAEAGgbFTv9wEv7/xDzcsD/48Er+tmBEZNpOOSLQeu/ny64PLCYrm+vLPO8/VvmjbKS4TqFCFCutE8/APTUKN36uM/vURpXGUcv5xDPDuYuUu1O+jWQvVxapftSjXk4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 04:18:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 04:18:01 +0000
Date: Wed, 29 Mar 2023 22:17:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fbdev-generic: optimize out a redundant assignment
 clause
Message-ID: <20230330041726.w7boceq7ljymvfq2@ldmartin-desk2>
References: <20230325074636.136833-1-15330273260@189.cn>
 <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
X-ClientProxiedBy: SJ0PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7bc165-4171-4b2d-3a1b-08db30d5bfc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B7JOflSwMzmqhXG4+0Z+Spkqtd6/qvbJFbcUm2v/6NOsCvXs4qy7cD3vQKIfkfw9hpO8BgT/Ev14dROc0qC0W3yIVHiktUw09WTIBgP6orZ03wCA4KcsAntwPhLEdx4uETnGUy188rH3jw8ypuXnanhYErHdM5pqAyFgM2y1ogzhptnVQcJETmp55RIAXLdERvpXAS4c1WPpl2hgnju3G4uZXNHxFNDS6DJNKY3bij2Fl4GD7JXU8DfgpjmRZSo5+DumKvCXq2ydqD5e3rL1EI67skDozTDDKGp0oEBy4jXcwe4st+dabV/176fNPJH54ynLRa2+W1kJ8gWw/MNk3IH2jwn6jJ/zsGlyi0B1IuQe+eVsCd+Bz2PqGnLnbOi79JVojWGIh4HU3FjjwlVHnnrx+SqxEBLRtflHSr6C8FOZC7vxHdzhtVOn1DPMKjmsE+OG237ra98/OO89kjtSon7vIRjS2P3TK6jHeFrtwvjyX2mW+KZtJWUUUvA0uYlfEtlyUdmrSsfPYU5QZJ+WkxxjXkPt94WkYaXYfYe47AS5bL92zp+iyZeSKGRyE3kXVOjS7d02uiqS+V7Cn+cvd9X3eugIskX9UWssqdoyCII=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199021)(83380400001)(6666004)(1076003)(82960400001)(26005)(33716001)(54906003)(316002)(7416002)(66556008)(66946007)(8676002)(66476007)(86362001)(6512007)(41300700001)(4326008)(6916009)(478600001)(38100700002)(6506007)(9686003)(6486002)(8936002)(5660300002)(2906002)(186003)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IxOtDxyAKCNy/+DKpZj1ZLiCmdrpePhbFV7DFvzQ7JHe6HkMhLOLUgugaV?=
 =?iso-8859-1?Q?KfoGxhJWPygtDDeMz7SwabPLXhW2UjIGpd+mzWaHFN+q51lE6276OLPuWR?=
 =?iso-8859-1?Q?W011Q3WZDRLlibpow5bnRYYF8F25lF+64QGHoFj0bq82MA2iCjwYiGhfhi?=
 =?iso-8859-1?Q?59kWaxCl+OvX60n000CTuzRlFh1h2hucDTkzv4Lftf4lfGYErY9wwxUTUc?=
 =?iso-8859-1?Q?kPoNNHbjpXRoFV2lGtuClO930xP3JIbkOiNH9v2nccQoV7XP4bzxBWZpjS?=
 =?iso-8859-1?Q?qE87zwPEUjSEFOjATUzhHREqRrKrI0wIkG8t7TX1lJU1QoR7Anqw7R9tcn?=
 =?iso-8859-1?Q?T2VlKm68ziFrBvkQCsKhi3iyHwMY04HAmFPxPzNTvOn92tmztH4wg4/iDO?=
 =?iso-8859-1?Q?aQrB64VRkFT1bIVEBRhqEjyVgF5ELDgFBne0A/zbVqZiSd+uAt6+jgN4fj?=
 =?iso-8859-1?Q?8PKGyP0oMlGh3LOEeGCridJ5UuO2HJmsJ1ggR7wdbtR/we6cuSLYaBvy5D?=
 =?iso-8859-1?Q?fOzeR8zagvlOxMjKCKFJShbRlC1aTXGoOpPiJ/v66Vcc2+0jXqEVlC9xta?=
 =?iso-8859-1?Q?MJ6lozcelSkFDvw+znN7DVi9JNKToxZLJP7rwv/ZNQTfHcW+iKQeczH2uR?=
 =?iso-8859-1?Q?2KEHjx9Ncjg9Y7Lxz4K0FraDt54HZu9HbOsKOQUBSrQRpi8X/Ys5aL1cgk?=
 =?iso-8859-1?Q?RWqQW947EkXMva5fyYYUst8fROK4umDvLfGV85sf8rPoIxIYylgrb+Vo+1?=
 =?iso-8859-1?Q?j0dLzIfeQguXqGHr4ODSE+Q8IFslNiDArvaUm+mmXfgqp0Ay+yqQV5wV4m?=
 =?iso-8859-1?Q?lfhqIisi7Cu5PBvyH/BCX+NAnk0r2+8OUU4FNcYnHfpucMP6dcZOzmk2tb?=
 =?iso-8859-1?Q?4FUxyOfF8BsnunXB8PGUNpyiAwYlr0mm65iRjSaklOvwz+Yw4Iw08cTLAB?=
 =?iso-8859-1?Q?iP5+kMmiUf1jTRuzmG92b/40923KoM6tiaPdrnjLYUYdQ5SLjjrnAOHcH7?=
 =?iso-8859-1?Q?vjtQ7h2tJ6PTjHZQmL/P+I9V5kaopeRZpw9JpZcFXavuhyAHRwS7+4fnkO?=
 =?iso-8859-1?Q?+9UpL6Yr7hyuQGyv1tIqiXdxECryHxkEKul6tew7/Iks40sXFpVeWGOBkX?=
 =?iso-8859-1?Q?asWqRvLO6J0xxRXxGnZM/t6sbRNkKXFVQa7TkH3GjH69wVWzyDLBC+1mA7?=
 =?iso-8859-1?Q?z6U7ffny85nSNxcTxlrlxn5s6hotkCLd/AXAtRLYDKmSU5P67Db4JpNX0e?=
 =?iso-8859-1?Q?vLVL1YcJH1sQDFCqUa0kX17P5sisOzieLVzz/oDULf7DaNnDZc1ddsKETA?=
 =?iso-8859-1?Q?BEcZU8nvbTP2AfhTQ8xwR4U1plqC7B0Rje1THbybQpxlyJg6tg+nlGI/kh?=
 =?iso-8859-1?Q?yeWIvm3AnjfY7HyJhrMPynblx6LQE4yzE/ixvwAupN9WL/FgUrNp7576UM?=
 =?iso-8859-1?Q?j8dRUev0ZFy/0UPHHQJjw1f9guL2Szh/QRnLnTzwAc2G3znNjDmXBZClS+?=
 =?iso-8859-1?Q?K539vic66ENQXTJH6fx9TycbGbvzo670ZtGHYVAGmCjmGsdnal8lSZi2NB?=
 =?iso-8859-1?Q?2zZTkMNiD+luHKVOAeIKGvP7AWgnc62PozGZ0C96+1LaMSlNDJUBdLgBKm?=
 =?iso-8859-1?Q?5oDVSNVk9NBvERc7C1W9NDvpFBi0LSpBzgeOeNqaN3R+dfGNIiltPedQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7bc165-4171-4b2d-3a1b-08db30d5bfc2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 04:18:00.9490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqNMLOHaXSImecHRjsReln2/pInzeWUrBUaNeZ3H8huMvqkYcgJ2L8g5IMowjO9nIrU6x0kP3uf9sbWkIiUzCZu4ALLf03dZ0E+JxXThYyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
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
 Sui Jingfeng <15330273260@189.cn>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 11:04:17AM +0200, Thomas Zimmermann wrote:
>(cc'ing Lucas)
>
>Hi
>
>Am 25.03.23 um 08:46 schrieb Sui Jingfeng:
>>  The assignment already done in drm_client_buffer_vmap(),
>>  just trival clean, no functional change.
>>
>>Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>>---
>>  drivers/gpu/drm/drm_fbdev_generic.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
>>index 4d6325e91565..1da48e71c7f1 100644
>>--- a/drivers/gpu/drm/drm_fbdev_generic.c
>>+++ b/drivers/gpu/drm/drm_fbdev_generic.c
>>@@ -282,7 +282,7 @@ static int drm_fbdev_damage_blit(struct drm_fb_helper *fb_helper,
>>  				 struct drm_clip_rect *clip)
>>  {
>>  	struct drm_client_buffer *buffer = fb_helper->buffer;
>>-	struct iosys_map map, dst;
>>+	struct iosys_map map;
>>  	int ret;
>>  	/*
>>@@ -302,8 +302,7 @@ static int drm_fbdev_damage_blit(struct drm_fb_helper *fb_helper,
>>  	if (ret)
>>  		goto out;
>>-	dst = map;
>>-	drm_fbdev_damage_blit_real(fb_helper, clip, &dst);
>>+	drm_fbdev_damage_blit_real(fb_helper, clip, &map);
>
>I see what you're doing and it's probably correct in this case.
>
>But there's a larger issue with this iosys interfaces. Sometimes the 
>address has to be modified (see calls of iosys_map_incr()). That can 
>prevent incorrect uses of the mapping in other places, especially in 
>unmap code.

using a initializer for the cases it's needed IMO would make these kind
of problems go away, because then the intent is explicit

>
>I think it would make sense to consider a separate structure for the 
>I/O location. The buffer as a whole would still be represented by 
>struct iosys_map.  And that new structure, let's call it struct 
>iosys_ptr, would point to an actual location within the buffer's

sounds fine to me, but I'd have to take a deeper look later (or when
someone writes the patch).  It seems we'd replicate almost the entire
API to just accomodate the 2 structs.  And the different types will lead
to confusion when one or the other should be used

thanks
Lucas De Marchi

>memory range. A few locations and helpers would need changes, but 
>there are not so many callers that it's an issue.  This would also 
>allow for a few debugging tests that ensure that iosys_ptr always 
>operates within the bounds of an iosys_map.
>
>I've long considered this idea, but there was no pressure to work on 
>it. Maybe now.
>
>Best regards
>Thomas
>
>>  	drm_client_buffer_vunmap(buffer);
>
>-- 
>Thomas Zimmermann
>Graphics Driver Developer
>SUSE Software Solutions Germany GmbH
>Maxfeldstr. 5, 90409 Nürnberg, Germany
>(HRB 36809, AG Nürnberg)
>Geschäftsführer: Ivo Totev



