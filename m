Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133416742BF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D49C10E9D9;
	Thu, 19 Jan 2023 19:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC54010E9DD;
 Thu, 19 Jan 2023 19:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674156324; x=1705692324;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yuFIGACSKXtJDitISqiX0QBlPs7R8mRIbREkZlGEazk=;
 b=X9zxZLVz1/L81R9ZIbHdcv/5NfydUmSdwQvMa0WO5nAsfmIGtiy6qUV4
 Qk3GNiRsp6RtmolXa6OC3JMgJTabBn6MK80OOeW+YfwRDjFlzBEwxwaGi
 ZjijXxhzVE5OUfvKVMMbrKOLFifK8Rxy/zdSQtDW6q9sEHSArJsVYLPZf
 IEiqU4fJkE7cwkZXh8nPDmbQcmDNI9lA0/veCqDWw9VK28/nISVdQ7w/d
 8wTsS/SogPA288fJ2i4KWvwhDAhRShrq5HUPYZ5oocumcM9W5XB/fGRJ6
 iCdDLyF8GY2//6zqyzAQfsG/v3MtPB9mHCouY4BtWv36gyzAKWsQaNM8h w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326674891"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="326674891"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 11:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="784180999"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="784180999"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 19 Jan 2023 11:25:23 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:25:23 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:25:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 11:25:22 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 11:25:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6rAdg/0hErEjtvwTJ6d/x+TsNkEtuXIJOJP/jh2n0s5919nfuV7FMZRJErJAb/YgEc0Md+nx3x8cWMLl4/+M9JC64MGZqwprEzi0hzUE3meeq51rlM7+UL3+RoKYEfUZphbf2WpcURP5CvJ1IDb76gaieGf+303jffVGdtQ0JLWo7U1rprq0LapHkYLfM4D8uEQkUSL+eNUesYxDggSCwM+/0B0//RiSiSQLhmTMxw2skeCqeiKVxw2fsj+2kxEn2EkjysaAj8/cSWSq5q9h9mOB+mBotkYNtmDtT63EGxqfbehJXykKCotMZtpzTveA81IJANT/kEG9qduoPK5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pf4UH3/LdFoAZahKCADYa47XOy5RZWdI9PWgUUw5Sy8=;
 b=eDV+VDHo65ZI9p0Jlz3VdPsAFUgcaWaas5LmO6G/rRi2+pVKT53mZz7duNoJdm+x5+TLM6KVNpc9UCeikAR1YRbNi9sHtgfn1xYwHRdRt9q0wOLp7iEgxIeyP+HcuD2Vw/gTiknL2poznmYnwhfKkDkMq6fZ/SQSmULDuMEMBw2yG8QMDNneM8uDCvPVzqnuUH16sOo5/Rg9NdXc3523Kxkp2e1PljVxJDn4He7ovpdKFYAIXizMwjdhOD3rwqzPQPh0UM46fKnDshCP7VQap0Ejjv7ztO8qOMpZwRti8y9mQWCFbkPsCGn1gcm1kNbQwRpJrNP6MbYH40BoMKwddQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5884.namprd11.prod.outlook.com (2603:10b6:303:1a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 19:25:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 19:25:17 +0000
Date: Thu, 19 Jan 2023 14:25:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 2/6] drm/i915/pxp: add device link between
 i915 and mei_pxp
Message-ID: <Y8mZGMjjlTW3U0jA@intel.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-3-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230113011850.1463965-3-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: BYAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a6b165-98cb-4cb1-2f41-08dafa52e556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONxT7Hi1e0JYadO5FsqYBXXtRbmlwwWPz5U3lTKEgOR1YmBsYds62V+7Lbih1QqiMiP5PJiJNKe71Udh6L0uq1+gDy3WJevx8TMXQqOGKgy+ySzVdoPOjpIfYhr0kRdpTY9YZDXXUHWUsS6ft0Im0AsgtgGbbZf9JRepNkr9tiOO9XEV6z1ZQf2d1+WQQ2cvR3kiF4MJHfBOE6JSOO1K6KYiPKHNo9XEkVNQHm0ABK5bXWZ7B5Rn5HoGdQo3+p2E5nO9wHbI+R9hJXXU2dO8eGg+4tJASrzLEGi+mEv3D0fYD3PDsOspvlY8AdaEmfJZTzBXAuX3UG3OE//8NHcJnozNZOC/DQQS8rJKleM3CFp5RmXz3DzUhq0tXaD7AQLLCQCvxl5oH7RpjOjCXJzAMY724dnBA7VaCKSMFDwef5mSxT5Zv4Ll796dHUOaRKgN1q7ha1N6qps01ySOGOi0vWi8crsY44JqGpffvUy47wXqHSD5A2j93koA/dhaljxXDX6jtInBWF3vI6muvUGAMlQehgDSSbMWbgdgnb2yU1Myz2csRa612fZhYSIiTRj03DWmFhMcsrRkgTE6tM1ldoIM/UzCBpUHv1dP9yev6egnw7EsnHJENDqy/gVjO75y8Ed79BqZ1pXgUzMNYJGp7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199015)(83380400001)(6512007)(54906003)(6486002)(6636002)(478600001)(82960400001)(36756003)(38100700002)(66946007)(186003)(2616005)(86362001)(107886003)(41300700001)(66556008)(6506007)(26005)(44832011)(2906002)(6862004)(4326008)(6666004)(5660300002)(8676002)(8936002)(37006003)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8BtrbH9d6u6T0BxcQ4YwEpuOWIKt8LrJDrR8x59hxTQZmxSv0QZixGgs4olX?=
 =?us-ascii?Q?CxNuF490LpOZMvWXJnb5aL53I3JrJvhnyIoqXXx6IHFACU2fwhL9I8xI6TAa?=
 =?us-ascii?Q?ArXAD6euw2XNySbgVPP9Gs1p/ltFoWiJeoMfmnc7byfLI5q2ybJvYPeDVYWJ?=
 =?us-ascii?Q?f1Zzz32RCsuvPzePkU7zH07o1KxNJBDthlmcGmJXYSQYGHUZvPTpY0eIVSnL?=
 =?us-ascii?Q?nYli/z+0pqexIOF95pT2MEhN0s3hbOju6yvJPfBf3Jv5MoeMceeGeiXrpIBi?=
 =?us-ascii?Q?JzNlIYL2CsR5FYJ2KSnwY8tc0LVusS9VUGmkk5IH0vOv2fe6qfqzm4Cmp5if?=
 =?us-ascii?Q?dIvRZaidq8slQaYvkvD655ggcaP/2U+HTR2lzlyQ9RjRI6Z9CBWTFJxno3XM?=
 =?us-ascii?Q?yzPbViL5PezJ82qDe2nJFhvfZccwP1H0LN2tKBA7PuToHHtlxysxIHuOSHai?=
 =?us-ascii?Q?H9gVXSB7vjoPwkUeMXCUp+HEsyek8RE0gRM7XiIlsQvzisrkeEM3ixcgio92?=
 =?us-ascii?Q?Bldlik2Bv9zha9JZ7sutJixrZagdZmkq7gR4XSQ7QxjRTLfMMnRaLDMQFjxj?=
 =?us-ascii?Q?r3LRVXcVz6GPek7dMryx0tq8GqMLCSWoWjsV6OiFmys2E4tAj9ath/uyp5R1?=
 =?us-ascii?Q?Eesk5FmNPZiONAkwdFKzHOtfxCeUr285945jbtM59cCtlXU51/BVBN81yNpx?=
 =?us-ascii?Q?JPluDpmT7KZRHovZ+5aCUYXO/56fBIW/Kis55ERFRlVL8++M3fL7Nfm0jyc5?=
 =?us-ascii?Q?H4GYcAyzg8CLZNZNKTQZ2yUfioWHpMPoYDrFf3KSYtmmUu0VLRTBJDpRvNJ/?=
 =?us-ascii?Q?wDZ/UV0EX4qQxbY+KIsWs/0cDpS5omVVHBITrzsZ4+H5vs/BUnv967Ul33WZ?=
 =?us-ascii?Q?nC85p7B/KfoQLqM3YEGz9Y67aUmd2AtT8HDM7/U5IZRMCLiA3petSOQKcQZd?=
 =?us-ascii?Q?hsQ9MyidAiMv41EmyZQ403GfwZOgXPXP7h3Md1Ujq9rtDkOKnekaUSqmgsQ6?=
 =?us-ascii?Q?B7TN85jdomlw8f2+PkoDp4q969q/Bsdxcm8SpI/y/hhKLDDc2D7De9oRqMGg?=
 =?us-ascii?Q?FeyxgLu3zSbabjd3G4Bj7mWXIhmKc4r1ban7ZWGf1qeb3dMVp+mZmIeu+xhR?=
 =?us-ascii?Q?LoGrLFB5gmPwKQlxpXat1elnA43MGRhxDopJUPikycNW5/oD/NZIJpGVGXb3?=
 =?us-ascii?Q?B8rme6nhWxSM+RdJS9vbHsUEjDfHscqKRvFSr3bQqlhwU60gHcAtMBldiNJy?=
 =?us-ascii?Q?H6+92uwhOtOD/j1mDcSAA0qllS1dwlwDIXbqTGmf62tzzV5ZtlV2ZK2W7Aak?=
 =?us-ascii?Q?d1GrlCrsYxVs7uJyVbgu9Hz5EFqZpO9GEHrmfOeHwign9oX45ezZxcjZyvZa?=
 =?us-ascii?Q?4s0ucfGJefrTHtH5TcNdYFW37QTqvKRA19wjFaO8d1ncuCzVWItsajoEka7I?=
 =?us-ascii?Q?gI3bveMmW+WL2Lx2EQkp0QJdXKX45m918Zh4x3reN4PFzneVXfyLN7vAB4Oo?=
 =?us-ascii?Q?uK02gSDp59hBAcOUuJ5HRkEGoXTRWTSU+35mSS/lHt+25xIuT71etvYgEkiv?=
 =?us-ascii?Q?LdxxgQfKUNQcokefog6MBytbw1A7jJ9+E5KJjGms?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a6b165-98cb-4cb1-2f41-08dafa52e556
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 19:25:17.1988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBNpw3lUK5guYF9uLzB2VvcNRYRduePBlck0r2IGseqYd4C9An8+36E05mVKYgEoNBJUSWRzsZzo+FN/CfS5PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5884
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
Cc: Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org, Tomas
 Winkler <tomas.winkler@intel.com>, Vivi@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 05:18:46PM -0800, Alan Previn wrote:
> From: Alexander Usyskin <alexander.usyskin@intel.com>
> 
> Add device link with i915 as consumer and mei_pxp as supplier
> to ensure proper ordering of power flows.
> 
> V2: condition on absence of heci_pxp to filter out DG
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index d50354bfb993..bef6d7f8ac55 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -127,6 +127,10 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
>  	intel_wakeref_t wakeref;
>  	int ret = 0;
>  
> +	if (!HAS_HECI_PXP(i915) &&
> +	    drm_WARN_ON(&i915->drm, !device_link_add(i915_kdev, tee_kdev,

I don't like the action here hidden behind the drm_WARN_ON.
Please notice that almost every use of this and other helpers like
this expect the param as a failure. Not an actual action. So,
most of lazy readers like me might ignore that the main function
is actually a param inside  this warn condition.

We should probably stash the link as well...

pxp->dev_link = device_link_add(i915_kdev, tee_kdev,...);

so in the end below, instead of checking the HAS_HECI_PXP again
and use the remove version you check the dev_link and use the del
function.

something like:

if (pxp->dev_link)
   device_link_del(pxp->dev_link);

Also, do you really need the WARN to see the stack when this happens
or you already know the callers?
Why not a simple drm_error msg?

if (!HAS_HECI_PXP(i915) {
	pxp->dev_link = device_link_add(i915_kdev, tee_kdev,...);
	if (!pxp->dev_link) {
	   drm_error();
	   return -ESOMETHING;

>  DL_FLAG_STATELESS)))

do we need the RPM in sync as well?
I mean:

DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)))

?

> +		return -ENOMEM;

why ENOMEM?

> +
>  	mutex_lock(&pxp->tee_mutex);
>  	pxp->pxp_component = data;
>  	pxp->pxp_component->tee_dev = tee_kdev;
> @@ -169,6 +173,9 @@ static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
>  	mutex_lock(&pxp->tee_mutex);
>  	pxp->pxp_component = NULL;
>  	mutex_unlock(&pxp->tee_mutex);
> +
> +	if (!HAS_HECI_PXP(i915))
> +		device_link_remove(i915_kdev, tee_kdev);
>  }
>  
>  static const struct component_ops i915_pxp_tee_component_ops = {
> -- 
> 2.39.0
> 
