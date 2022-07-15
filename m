Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B0576F3E
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9ABA11221A;
	Sat, 16 Jul 2022 14:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A652E10E282;
 Fri, 15 Jul 2022 21:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657921233; x=1689457233;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4UOg8e0wYSTBaC9K7J5MSznTdajX+5EptlDGFaS9jbg=;
 b=Nm9IQWETIzmzw7WiKmNnw6x+YpY13qt7fW/P7veTw1IknVzUMaZ431d/
 bToPsp1mkfqXp3fEaSzB1mkzfZgi3acpJYWQsV2XRcx1j9CviUWiLHGjD
 bkM9MTNEKOxXmZx4C++KmOjMNdNDMeZ4e8wtNccM0O52AfI9jaoHTu16A
 0jXQpqrtElt89sAQfSZu/d2dXSmJnjD89JPok1TIQeN9HsWcxkhxo1/RO
 DMNQIVRIYcqNiUtb5yZevMacRyhV9QOFf2c8APqXkFe3FD2lmxvQZsPE+
 QEE3OTI8Qe2Xs05rT08Jz5k/J9dYwbZW5XD5MZ7wDZ0PBCWm9L+u1Of/A g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="265694793"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="265694793"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 14:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="842661022"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga006.fm.intel.com with ESMTP; 15 Jul 2022 14:40:32 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:40:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Jul 2022 14:40:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Jul 2022 14:40:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoP7VK2f4Zq9ye8YDVFCQpTdBQxLUFIsBznK4amEdr2Zwj+WuByZ42keImXdsd+o2z8BPN83Vp0DQrKxMpcldbvPenw2sAjf9RiFiuznGum79t71WYRc3jShEETCjU+vWLYRCO6u/gf5L3jC3QhtRRoq7sYVtEcuPkFEpWRWLnxsbGY/vF2cARHtuMwgFg5K9W2A0mQxV1V9GwANG8E16MdsYm5Q9XDrkFHtFWZBV0HIMqwDnpNf6B85pUIWLVTyNfQgBcAv4/XIHjzYO1thKs12fkJhghdMq8jhacRFfoT5WqotcQMFYBsObWBooUPPih0J+xe8BBoGrVaF3+5Cmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECMyOqurgBtR020XSk6+AaOq6rtvtoG0NJ7Qm/YwNDA=;
 b=J5whEYuzXLwANZlkzdLeEdnCXLrGdXhNHVkYq0l3JRxFF2+Vo8iMDGeIv/islKo/o8KEc5vPbsM3j78mVFQdeDUuyTUxuXyZWn0J2owO7RdVZC/4r1OW7TEiqeFUFLGHFjZBQJ8Td4qN/QjpgqaFGBVFYMexzcA6FOr42/pHgTDwc0c3Cc8DObw2skqJYjy1PjG1Ou4HKXwNQcLNmDd6I/P3nN+u9O3jyH6+cAT/JNL/R3G/s9n0P64IOU8RBF8kISsZZQZ5u2tspX/3DLz4GLIiPDJt2q94MzM5WXg0LQoY6pck37KSFsRRthxTYPWEoErSDi2TFHPS8eKGUk88Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 21:40:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 21:40:29 +0000
Date: Fri, 15 Jul 2022 17:40:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 16/39] drm/i915: intel_fb: fix a
 kernel-doc issue with Sphinx
Message-ID: <YtHeySNYE+B3XJ7w@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <5647d7b6ffe47f53b90342e4ad881d4d4e6b005b.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5647d7b6ffe47f53b90342e4ad881d4d4e6b005b.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb457467-fed2-4744-cc38-08da66aaa32a
X-MS-TrafficTypeDiagnostic: CH0PR11MB5234:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 19PRMo5JGZjs/jBAm4aEfpJ1Ftn/9yAM7D7Oh+SBvA/fTnv5Muz+rLgL/vLsHZo1V6dH0wR+rCALYO9K06blp37Q4oQ7NEX16Z9kkO/+71yzTwfbLzwDWB/p/9ESRCqFp8cV5rCYIWDB0aOyzdwfS8gQ1p1OQ+rKbI9qdJuCpoeL52GeyIAIMgneC+Y5PnOnnyReieMYahj7kt5V8+NhkAz9uGcgfpbnIFznDilhahCRoIffKZCk2f7nsGwDaxgr5eGgbE3pgftGhgQT1KEtuzVn7HWDunwxb2/su8rny0I9F/us12CSGO4/SiIxkcAD3J2a3Cgovse2zU1mvTSRBVSJq0G0Z5Edh4M9KDt8Cf09yjYlA4wKUjWUAuGzJHeoXeSK5VL9AOk+/TS3O+8BBP86WjBfcF+w2U4AfyZHRcSyzFJjpS1eRKLCRQm8DaS/uh/HEdJaMgkINafbvmc/61/1WNjyurHJl8Dcj5+KQdGaLvXZYKU8ZU6PzThRF56UsrPAasuXRft2tP1HxXSWG97KWeLFs51Xdm29mPm5rBXFH672YQYllBDGNudS/vZf8riasTghpG/e1EVQOJJj2dS1n7Vl/6AaYlvN3p4UxmwPimNjp7MQ7bth0IQrBj6uJCFROp+NR/qC4Shos826miDvV3nXycSIRyI1vneoKNLxw4hBA2zq7qFzR7yTwR96zJogrHSgr1cUus7KQ6+nHijdfpAm9JWzrYgDFqQhvv3VZXSnKdNDTjGjPkOMwTs8M9tZBz2zpQLe0GFAQUCyedmOgMrx5+K+DbL3LjbxCGY3BLBC3J4Q56lBADsw6WeNkXnFfp/MHOYBXt2Nksk5nQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(396003)(346002)(136003)(376002)(86362001)(2906002)(6512007)(5660300002)(83380400001)(44832011)(966005)(82960400001)(8936002)(38100700002)(36756003)(478600001)(4326008)(6486002)(6506007)(316002)(66946007)(2616005)(66556008)(6916009)(41300700001)(66476007)(186003)(6666004)(26005)(54906003)(8676002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lVcOH8C5FFEhYqkbzESgPpn7XRKx6YFHNZoA8qy/BF4tp6nbouWvBNQCKalA?=
 =?us-ascii?Q?g3HUvM9r4mSRgppgU0No19akQg8dLhqmOEsjW2mkUWNPGAIzRCLApRQgAOYU?=
 =?us-ascii?Q?jL7SuKZMQHxcZ/00a2YQnsBa6U0gsxjL73x/83Wkd9czzd3FIvOsDHuUARB1?=
 =?us-ascii?Q?HXlk8+LlSyjNNj/x2srudjFAFCSKQgx+O8x/zG4m2MMttyg+8JwqcFfNR+1W?=
 =?us-ascii?Q?vCBWeGr/llvoLa5XbZfeof19rcKUE8AvyWbalNbzZBtSbIwwlA0Mbyx7Ei1F?=
 =?us-ascii?Q?RCILWofCPe9Fmuyn17N+AtLD4drf+/s5EmuPEEIrUbSl2xWqkEPcV7CQ6B8d?=
 =?us-ascii?Q?l83jHBpqq+u3WkLPApQUx88GL15Rvr+d+sQ5R9wOV4XqfNJOVYSgPuqMPxzZ?=
 =?us-ascii?Q?xnoqLJiTIRrWq15NAdAZ/OA7uQDkGCuPxgqmC8qhAk+hO4Jg9EKHW5gBFztn?=
 =?us-ascii?Q?m+ta8dhHQBZQupr+beJDI56gd5T3S9s5y2QG0w53vJWDRm+hyXK1sN+K/3BZ?=
 =?us-ascii?Q?wf1ZCJQOD5Y2TUQ/uU0sRLCcqSrzYw8n86KUIp1hQKsifF0mz3d7I8pzUFNc?=
 =?us-ascii?Q?TgdosxZYBaGGE2sloP//GjRT5H7riE9f/yzmiufnR6RabJRvdWL7nBzorkPc?=
 =?us-ascii?Q?9oXLy12+QgpWCBycdfW6cZw+Z6ot8shUAs65PNFOTpMRKYoQCpKeQrkm7qF2?=
 =?us-ascii?Q?S1qVSQFd3M2GsYDjGHYGE2XxAdGpB6Z3tGlN+R1O/HNtcyA8niSX59i19tKU?=
 =?us-ascii?Q?ytt6/P8dZy+Gg2Ie7Grjx9A0Rmi+9cDW9LS4XD2dYEfE6kFP5jm6lawqZ/zx?=
 =?us-ascii?Q?UFPSfOey8FOEvA+m4j/qQpdnjVlOl8rp2eqdIz6nL8xXxo8DNSScb5xy12SQ?=
 =?us-ascii?Q?tUwUHsiKB5omxmDuirwqT9i8VUCemEpA6ImhwT9a9k9OueCG6rcQXC4Hte7S?=
 =?us-ascii?Q?MP/6dEH26hJb2tTbVWQaBVEqQvAIRYBsn5OmU9Z4E7FxeYkWSU6TBrZjhRe/?=
 =?us-ascii?Q?7KIlxTas/Rj7h8/mAqL2t74AzMRiRqKfZN7orICP5H+dIFKRIG+fmI+DoZa2?=
 =?us-ascii?Q?1VsYpWCGpJGW1lBTNOa4g12gDSF8V6/9FF5Ozizz5tucS/6tfjSgXpfGoDn8?=
 =?us-ascii?Q?VwwK7AQQ+MlSEpUArXg2JaLgj3io6WGXurV8oRevQLgcC8X+FuT4b9NoobSS?=
 =?us-ascii?Q?K9RklvH+Z4y+HJOImWTH8tIq/t5rbqttN0OjC4gTqIpSz2xXaV3N0xEP3nAL?=
 =?us-ascii?Q?E/QVbIyTGjIK2Lwq5JHBWDEQkXXxPsLjf2/J0hbYAyNw50BbgIr7w+dBuICH?=
 =?us-ascii?Q?GkRRVWt7YQdZmKDRJjN8cOjI/BU3FOeHBWpC5eGG7PQdba2XMO04t6vIZ1Zu?=
 =?us-ascii?Q?nqqQIdxiL7xjXx6Qu+NPbT+v3yfV8YngQO8fa+/Rv8W8uM1gw8wkV1+u8MsF?=
 =?us-ascii?Q?qdSvgzsTEi+HpU03g2S/BS0cQRDSr0yMiDii5u8d96VPsWMatuC+e5OzVsF5?=
 =?us-ascii?Q?9xXyax4FfLTzJnu0KEZuopkkYqz1bJVH7/h2UDayJgj3MKqWwFpEGhQUIm9c?=
 =?us-ascii?Q?THiMPqtwvWYrHFwcDvtwY1Qbc2Fpa02YZr350v+f7zNIERpozcAxrfcWtUCs?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb457467-fed2-4744-cc38-08da66aaa32a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 21:40:29.6340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTQx4L690q/Dd5HJc342r986xcyGOzmCzVsLCzwB0ICX4eXJjFayPLBMB2BKTFrCrsUduojsyX0Dkqc9xqzfmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Juha-Pekka =?iso-8859-1?Q?Heikkil=E4?= <juha-pekka.heikkila@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:04AM +0100, Mauro Carvalho Chehab wrote:
> We can't use %foo[<something>] as this produces a bad markup.
> Use instead, the emphasis markup directly.
> 
> Fix this issue:
> 	Documentation/gpu/i915:136: ./drivers/gpu/drm/i915/display/intel_fb.c:280: WARNING: Inline strong start-string without end-string.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Just trying to understand as well on why in a few you had chosen ```foo```
and here **foo**. why?

anyway, not a blocker:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index b191915ab351..fe72c75a9c79 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -276,7 +276,7 @@ lookup_format_info(const struct drm_format_info formats[],
>   * @cmd: FB add command structure
>   *
>   * Returns:
> - * Returns the format information for @cmd->pixel_format specific to @cmd->modifier[0],
> + * Returns the format information for @cmd->pixel_format specific to **cmd->modifier[0]**,
>   * or %NULL if the modifier doesn't override the format.
>   */
>  const struct drm_format_info *
> -- 
> 2.36.1
> 
