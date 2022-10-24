Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B27B460AE21
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 16:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC6E10E68D;
	Mon, 24 Oct 2022 14:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C980510E233;
 Mon, 24 Oct 2022 14:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666622979; x=1698158979;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bryeTtjDQZlPWVoVE23ET0voTw2QfUOp+nCHf0sHmsI=;
 b=ND9k9+/Cr3OI9DUBTufY+6hJHqWgWWn5ddddyafY0CZ+NORA6Y6xgARS
 UwcO2xAJ09eRWSlQd1weLNMv/TK4XoTpXKPJiLpw3WOj5mnKqfi1spf0o
 1G2BOY1AtCgP7Vy6roCC5CeckHuPzFUn4N4eRyADKUfPvHWZFOfb9QLbb
 MDDWBAPVWxW/VtyE0k7aaI0UsbCBSLyvSCnUTTLJpr+Z2iyQuJhds6r4Y
 QEjovHXCidJVYy9fyoZqnoh7iaLQVLbXZ/1J7RatAQoTBo5lmZ+oWPRhN
 blvrE1dK/K6tZMJhe/gaS8Ad5dIatDp9yGCGZnRG+GArAwxlgkEAnYmKy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="334022208"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="334022208"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 07:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="876459985"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="876459985"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 24 Oct 2022 07:49:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 07:49:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 07:49:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 24 Oct 2022 07:49:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 24 Oct 2022 07:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e171mO6w8IglA7rQJxm0UDLGclii+9/NFFnHP2LeGUvi2qVR5ucYI4fZdebTStemNDxBox8TmlJfCyWaSxVsmW8RIcZsTrevG2gqydCd95ZX8/T/qGMfKjlJaFDJSW7u5Oo00D88TPRmuDuP6KB5UgXJgDJVrU2iLYigl9m4HEy4Ver0iG8qj34FMUAD+GSbtXtM5+BAh3YfM+uuy1o+hItoIa85q7M7esE8Fc2cCiruMBmV5MrnE+Q8KkGPVExJsXrPixmH8ACvtWDee/gvrUIxwjXaObvfn/4TMrER8rRtquGErVHcomCmUa/F8z2xw0nXnzrJJkyq5bAYzNdtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ksmNs3JojjBle8cnlbztQqdI09jleRypQo5xAyd0u4=;
 b=ZOrIQ4wgl6qz2WR4v9IvDCPbpCyhM2Fo2c9K5cQ8gISrRkgg4VjdGOcVPEJOIdjBe+3gmIGXbPMJqNSfTexLswMLJmMI+1qsZx7YAVJy1AdCXuBpzEsTS0F6FRZdWrcSO4q/+jBR4HXlvnQGmdv4tZvsiEp0MIvs2/MnzUvz8LbobnUxk/kPuODe/gd0+eE6Hd0/HcUAu+zzrl612o/Z179ogtxjgDNv9IMmA+t1V2nUmvj/aTE/WwhUIx1qJoJpXS58HIKK6CcxFIITbJ3u6YNyp9Jsnfyy5p2CAgKS+m8c3bZQptBOHwt0mJQmQX8pcWzV8ymjjFvo2WkXtsp7Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6143.namprd11.prod.outlook.com (2603:10b6:8:b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 24 Oct
 2022 14:49:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::29e1:56c3:823b:45d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::29e1:56c3:823b:45d%4]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 14:49:35 +0000
Date: Mon, 24 Oct 2022 10:49:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: wangjianli <wangjianli@cdjrlc.com>
Subject: Re: [PATCH] i915/display: fix repeated words in comments
Message-ID: <Y1al+lRNjRRCZR9o@intel.com>
References: <20221022060947.61179-1-wangjianli@cdjrlc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221022060947.61179-1-wangjianli@cdjrlc.com>
X-ClientProxiedBy: SJ0PR03CA0184.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6143:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1b0cdd-f3ab-43d4-2d46-08dab5cef7aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nBi0Hh2o9ZBTq4VUhIikSbMSVuo+QNZ5rDQkOziqqVkmhP+cSGKnfX1wD5HeY0iYGtvpPVYI2E3QuB4mqqVwYgEXo7v7voq/8wdUHA6adcUOBGXA5vJ9HwcJf54aiPz3wKVhsMnZyuZ9hAnsRykIfh1Gp/OCUWBV0XxqUao0pLqvJ4jlQHjiFAqAI+L2BmNBEc2rl9UcsZ2VRubE4gXZ9wtb9QVXmME8yZxQuLIWS/cBb1NPDykydRcFirbWhk6QzBnMdiN+5phIUp2zf9+3jMg4EPQWyQsiBBToprK+RMZJb6jEwxV2qxVnVS0aQyMbtvJ+R9McATSBJXWCZSHFes3t7g/V7Sk5IGLgoKQwc+BQDoRgVs+64pDVrE8H4W83yA0Mq73OqKJvzdIY7akSa5QDAxI6wB31B/DOo4n3pm1NtSL3+Vxj0gKuYKaTP5ACUDWfr7W87rxdH7GdchXxGvw4w5dtY3z51NcJKM4eQkUMLBW1EVJerM4pMaHRXl7aG7SDtFqI9xLy4W3g2naYp46tx9WVzS6xUFTFW8MZ0Oeqdq07FhvQCJqJ+PcPu/2nDYQKv7Rq4Ln+vGCL9nyj6sdtYSGxpTo2Ab5cPgUlL6oRakOaGIsS1nUOu0osG5EBExvtnYlmTwh+skrk4xbbbe/VrGSXBBfmMo62Pp1A9WblU8pxr4FgmlVOKHM+GxWL5uVCw4UwYpfnnwgXZQxSiy/6ASvMkCU238sMidA5Ho0z6yxnUmZj84bue64GBm82
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199015)(8676002)(2616005)(316002)(86362001)(66946007)(4326008)(66556008)(6506007)(38100700002)(36756003)(82960400001)(6916009)(6512007)(44832011)(2906002)(186003)(5660300002)(83380400001)(41300700001)(8936002)(478600001)(6666004)(6486002)(26005)(66476007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IhvQA4jT+ILZ7UqiFpsAqbIdOMZKLQ/y8kTWNE4OuxdaCSOu6rl7QCDf2hch?=
 =?us-ascii?Q?ylf2e+q6k92Z3rk4ejKwR3/hSuRqSyCEXq9132Ma1PB+24/5qQ/jS63nEIsa?=
 =?us-ascii?Q?Uc1NlsuoNBoq2kgMoUEH4CeL499NICK19lXtBFcrhUnBKdhKM0TqWV1NcSyw?=
 =?us-ascii?Q?Z2hym46Hdp9sZWMBWz4H5OwhTtppp4+dPKKeQRr2yDt9JyhdVKaJ5QDo79R3?=
 =?us-ascii?Q?Y6X6iaiTQbi+wWLqw2Qis6rBM1WFatUPl01GV5qLpZdlwLk4bwT74xdXgSRg?=
 =?us-ascii?Q?L5IY/+Nv4rCR8whmRmjhuSVtih0aZmTGNmToQENWimzm8t2glU6QMWsmY56w?=
 =?us-ascii?Q?Hm9xF0F9v/RtA9BOC/MEmp1pfiSqosUrSard8YWZ4XAMtvw2n+kNNpwm2Lhp?=
 =?us-ascii?Q?vBtAg8Gfmqm2i11xlgeGXS9B0w3kp/PAaD9CGjEw5H16MRfmPbQXETTWNY2x?=
 =?us-ascii?Q?Q4NceCe3DbdoA/sntRVHOH2Bi4vIUsy0p2v09NOFsm1sgGc4LkO/rU6qkO2b?=
 =?us-ascii?Q?9AfHIYf/9bu8sbHMOPFk9DEEfW4JKhtmsl/7uDeDftLO+lDhxVaFJxhuM1ix?=
 =?us-ascii?Q?F3a+jNixsxBBp1bWj1vwfOfE5h5osxB06PAlddH6BsFJMLIMhpdtq31ke89P?=
 =?us-ascii?Q?zHmgIuviYmWWXZJl1bNC9Bnzic2HRpsQeZOOvZZKXaTcCLEkbf2yqjZdOuJh?=
 =?us-ascii?Q?mpd1F5oRh5/QtxU9ejmOpS29M3gDOCMTYDAOT9DMQAeQTeYTw8uQ1LYjrm8Z?=
 =?us-ascii?Q?k+jS6Y3Ge57Ye0gepVal+iUNvlC5BOFQSmWqqUutM8aOQfjjpJ1sJikb9F/Y?=
 =?us-ascii?Q?XrN/JsQdGQxb7VuHmIRM0TMwQhOg/oJhpbmbBiRkPaV55fgL/rmJGyqv3S6i?=
 =?us-ascii?Q?kkQ9exIyOslX1xe05ntM2sKNBrzfFdXDGssCY8nR+TU4y9Wi0t6Q3zWOENh8?=
 =?us-ascii?Q?Tf9Gp1XSVvEbLTsrYmmLZSTA0CAbFWnAY8C9CF54FT5JK7XtYs4ATKLhm3Sb?=
 =?us-ascii?Q?+3XQbpspHKfm5KX8u2CCxWB2IJrJxg9mYAFWU22xfuCxGgHomMliD45LUwNq?=
 =?us-ascii?Q?5EF6koGJ8xR2pS+f0Ymx/A3F5CdhFr+4Vo05fAu2X2tUcOcMlhlYth7KR0mp?=
 =?us-ascii?Q?Lp0K7AJ16G8FRIdceOFLLrAT2hBHJyPIbvaUjIx7mzB8l/vD+pEbpsz0muIL?=
 =?us-ascii?Q?pwY51tpzXTakUEgCZCzo+MQHEi07N54wEAM0nBPU1ysxchBQSBQi4ycf42f+?=
 =?us-ascii?Q?vu5HbMMQZh+Q6w17w4GCyDPJTnkHm9KdODz8wSCvZGE0OsdWDp+oBYhu0gUf?=
 =?us-ascii?Q?0f+cp0s3uT2QePYo/e2OKu43bL57Q/T/+Tl3ub81aeTHKmWpAqxHTxeO/eP4?=
 =?us-ascii?Q?6Whi6zzDXiQovhZ7PP5K2b/xI84DFIrPvTe2hIl4BcV3Wo5hh681C8hikpxy?=
 =?us-ascii?Q?fn+OY8rz9Wt9QFbYeNVsioB4iE20yvC0kfzSiXTYkAUEXQGILjvob9rGXpB1?=
 =?us-ascii?Q?I+RXOSWqgbKPdxvzdVHu8IwmmB4/3AVJuuSiGX3sxfQQcQ+KVJZ4oTJgfRA5?=
 =?us-ascii?Q?dn026txHgoovQF6dHpfxHn7dfPHpMvnNK/eaZ68P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1b0cdd-f3ab-43d4-2d46-08dab5cef7aa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 14:49:35.1549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zT9dJvmG2Gw10p437MUdXoa+KXHJ3vsh8ObuXQgO7sHRokfTiz89IcHB4APuBQTCucJ4j7OTVS1kPL/uVy2AGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6143
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
Cc: tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 22, 2022 at 02:09:47PM +0800, wangjianli wrote:
> Delete the redundant word 'the'.

I believe we should put an end in patches like this.

Please accumulate all the s/the the/the and other small
comment fixes that are under drivers/gpu/drm/i915 in a single
commit.

> 
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  drivers/gpu/drm/i915/display/intel_crt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
> index 6a3893c8ff22..fead011c87b5 100644
> --- a/drivers/gpu/drm/i915/display/intel_crt.c
> +++ b/drivers/gpu/drm/i915/display/intel_crt.c
> @@ -1102,7 +1102,7 @@ void intel_crt_init(struct drm_i915_private *dev_priv)
>  	drm_connector_helper_add(connector, &intel_crt_connector_helper_funcs);
>  
>  	/*
> -	 * TODO: find a proper way to discover whether we need to set the the
> +	 * TODO: find a proper way to discover whether we need to set the
>  	 * polarity and link reversal bits or not, instead of relying on the
>  	 * BIOS.
>  	 */
> -- 
> 2.36.1
> 
