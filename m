Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB35968C796
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 21:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD7710EA44;
	Mon,  6 Feb 2023 20:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B28410EA44;
 Mon,  6 Feb 2023 20:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675715044; x=1707251044;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j60YO8eGCFxRyORPXJ+cLrf2BqxZ1i+qtXNXBf6HyhQ=;
 b=CQHZl99IZit8EC3PKqg7tj0EWmLgo2dh+5+9cE7tEdQRBp1+OCNg+YU8
 u4PDti//RSkVoVu2EboBirhEP/IvndpAWHzzmnPmqMwvOjsopr+NZcEmh
 VG1d6rANmjXnv+R8iVhbuA2L625ukmSirfQ2zhSyAfpJP29C4SR2d+SbM
 z6py8bdVI3Xinc24bL8xznIClbo+HvhlIyZMkpiq6qmZ+ebtqpiSikVKE
 rJJstnQyJCj6myd+q1bciu+ZxVS+QalsqXLBEL14NDVzfsYjV31bPlEal
 cunsDInHlkO56RQafXQpjjF3Xk0J/ZA7XaqEfbCEtEU/ChI0ZoxRvM7+t w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309640326"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="309640326"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 12:24:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="809255865"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="809255865"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2023 12:24:03 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 12:24:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 12:24:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 6 Feb 2023 12:24:02 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 6 Feb 2023 12:24:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGLBxMI3golahwSTRw3cuo2ANSY64/v/kucr1e4mWgfBHhsWYax2iQROe4N9Hr8L1cd6UndykcUtptDMvuM1Gm3ed30BqTcM/1VgXr+FslRneHnokp/wfvwK6P/GqzPH6lJATmbC4olcLJoMWWVywwcsRKABhdUj1GDUMwrukhOQd7lxJth2r1wGUzuhQdCqX0P7UkzZACFl+nRgWGgpomgSrfrvWenLE6HjiWKMZRT1BCFQy/ucySAguD+Gl0wAYKrJed7ZcEyFZca7Yj3fz9/qqBnk7YxQBeaI38ISx/3L7/RMPQdryQhISK2BGrc4uiDEugA8YlM87J+xEVIfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9ui6SGxK0remQXztHVdjzgaxvvnQumyJrDdq+W4T94=;
 b=IB+ZdtPP3x6XeqK0+0I7eO4NwkcD/L5XDTq8lisHDwnDK58iatEohb2Ebbf4rEk77r9pr50C72eJhzO2x7HnCwW8TW2jUXHU9/qW6VmCbMRwXgKfP6gb1Sn0FXzESwXAIiJbwZzoTBPlflkDpEsIEnXAGymMkQe2c5iTM309ZrW7lF8YcnUeDb/UZcy0I2GCuyNalxEMfvB9iRNjaBttT6nyuHXeULN03MXhCwithysvoiJgQR3MDJdpS7RhOKhE0KJ8K62Tc2HyR7JArGhs4318z9NzB6//0q4G3FdAbzDhosBdrbM60ZC4wxkjq6xM8Xv479lYNStKMTLD77C4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7506.namprd11.prod.outlook.com (2603:10b6:8:151::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Mon, 6 Feb
 2023 20:24:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6064.031; Mon, 6 Feb 2023
 20:24:01 +0000
Date: Mon, 6 Feb 2023 15:23:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [Intel-gfx] [PATCH] i915: fix memory leak with using
 debugfs_lookup()
Message-ID: <Y+Fh2w1Iw3kHp5D+@intel.com>
References: <20230202141309.2293834-1-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230202141309.2293834-1-gregkh@linuxfoundation.org>
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: d217f5b9-783e-4c5f-ee9f-08db0880151d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YRryePeAw1mmi8I8O4YaH7VXsFpZhuleoCr2crhMNjoYm+/mNNwAsRKFQkE3TzNmDurkS8P0+pKluU4/YJs5Zut8rQdHCYpouLSSNHuYbcQ2jTQlhlT2k+hSgaUWVtDuMyg0n/u8yhb1TRJgiWSOvGe62BTlycMdQvJBZfqDU1Ztkte5GJY6n3pR9iWWLOlt7ANkYw5TzfmrsJ/2USrcGg2TaeUhqlVZAfTb3gAjV1hzwzVU5OOyVlQIhUSWVgaFHQ1EItury3WvyA9kMXc1/+CVwCl3PIkocqCLQ8G/ghMCQDlLfpyndm94ZGALvGehgHsdm95R40wOM2zgyWxJVYtqgXdGnDXu5Y8U6jB9X5FuFRNliWfXD/NBcRVX6OJ9qQ31QjBGby6ws1WlCzzxSPnkP2rbCCaW/RKd3LFGKcgE7AY3iUhDm2l0oMQf6YZ9cMyLljwpRkVBGj/A3SfEY2HkAo9HeHyYb/jrB4yA+HOJNrqLyHzDioQpgvvsy5NT5LDF9hYL7uUU13EToo+HbGxwjNp2WtYGhlM7RpzWugsv1w8nNaY5WXyJZ7HfW9xAAJ/UWQkrXr3yG7asB3w8mK3FkXxm4gi2F+6ra0I5uyBaK7ySMx23IIeeVKyCSWSjl5TFrAS3vxZYtVKmmrk+Bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199018)(66476007)(36756003)(66946007)(66556008)(6486002)(8676002)(6916009)(38100700002)(86362001)(6666004)(6512007)(6506007)(26005)(186003)(2616005)(83380400001)(5660300002)(4326008)(54906003)(44832011)(316002)(41300700001)(8936002)(82960400001)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oFl8k+xPs9U/qq0ZAnu0WernxZ3wSySAFVJXi+mKPoRpBmiKS4HS5I66T07B?=
 =?us-ascii?Q?6T2FuqgbkbVlaDQOmmeDxeqfa8mIOACbxHTj6MYqohSDFn633MOpYJKe1lLV?=
 =?us-ascii?Q?VS458nrMV49Ah/rG5HuGGbEZbJME6WFPencxXRULl/jSYQJWEi8QixqUi7qW?=
 =?us-ascii?Q?lr/aVAI+YCs+nHmV3l2afGg8pdX1WxWdYfG//YyPWbCkdio4A9pWq0hBzH1w?=
 =?us-ascii?Q?1mA0hEXmeVhpqoZaDkMXIltQ6n/EJI6fSgSfKJlLbD+36As8hCauEs/vSVH0?=
 =?us-ascii?Q?FbMa3rhGNTN7GO3npRECv7ggLV9YfEyhlPBqhFgANeSlZ8/iqkASKtCNqsHm?=
 =?us-ascii?Q?VxW7NUAKVtGRMhrd/XYb5mcjHCaJleVFHrFVzlJ1XYC98NBRR8yN8AeOB4+9?=
 =?us-ascii?Q?7jIRevbuYQB99zgG+9IsaggUZP0D0KhfWrG0GdmxYCxbZm/47W+tzMcMFVzm?=
 =?us-ascii?Q?VPrEzwDXWT6B3pImWE1o5FHJ0INBr1XhfNx20212UJadY9B3/K7etl3Bo5j0?=
 =?us-ascii?Q?sv585bF3/vvJxtehFkOQ3hZX0k+/hW/OdK3BipsHPSfWZK+La/dCRc+ZdZC5?=
 =?us-ascii?Q?9rk61aGMXSSWHhcWBBmWl0Nj9hq2/ft8lhUMKre2gwORtajJpfgpbdcdHjV+?=
 =?us-ascii?Q?EtP5t7mgxT5lDYzVL2wMvFlMHn6At4rb4AKmXJyn38VY47QYm9EMCCAZlS06?=
 =?us-ascii?Q?MmWDwaNTlkebJZ5AewD0FXdCsfreR0+q6eIBm3WPxa+YdBKb+wQiDGBPdGTg?=
 =?us-ascii?Q?Zr7OkB3twJGwlUB34YUkswF/bDSoQPEXBiz3hWHBLFpS815pi5n5z458QcQ2?=
 =?us-ascii?Q?i109UdgnsM74IMKryhUkmS682rGs5Uvevxb9Bc+rN+yKoRYLUSHUIFgjY6AW?=
 =?us-ascii?Q?vOy500qD5YETm/tmYHpYsjTFXXuWWQewHgrqc0lytX1Y3xmG5WSLl7fbR8m4?=
 =?us-ascii?Q?msesxOPCSVXWtK3m1x4m29DXLONfl1stp6EBwWMU0p4X5tlVQk7s3+LyyyoK?=
 =?us-ascii?Q?ArHnqfRkbsM5PRvN2tfAk0jZ1LIqQIYUFwe4OSeeSw4HVwFKEtp/7EunAUXe?=
 =?us-ascii?Q?w/kSgQdRjnWekTOmaqsoYGsiObqzKA7YW0xhFo4r3hFe6iwDQx4V7JZ4aChk?=
 =?us-ascii?Q?pYBaBAYCZrL6ZQj0LUTjSBHK6Y4E8wfM37mZOs4Zywf5XERN8QgkxcYaB5oU?=
 =?us-ascii?Q?Y92J08ptAhoLucwI68K89V4C8GHZ4MJptgE3b1BOVEMOaDv48dlldXchgRie?=
 =?us-ascii?Q?0Hz+4ivAJn9NbRzi2f3aqZic3Wy7ZhQ6WJJFgDiJNqL5t1QAZ/W7HkcHtqbg?=
 =?us-ascii?Q?uY+9oGgecO+iEaRyXlZitVIZ0vfslilg8Akg8BM+nX010qB+lzebLqZ14Cm3?=
 =?us-ascii?Q?jOfbyi2V1LIrsWMT8HQ2aFaRjmUX1tcr22X/EyXzTGti4ZoFTj9fnfbHegpY?=
 =?us-ascii?Q?1kq2tqjEJQhmvZcUU2IX95R8xL8VrE4Z7Y2XjYq9YmSknFgQ4T8iNz7M6+4z?=
 =?us-ascii?Q?FxmXLtKTTGjJYhNlKnomU3xen9QdKVzcr7zfKhdA+JtI8sFCyS75fXLA63MR?=
 =?us-ascii?Q?OAqrSlLK3VRoyDUbRRBukZhSbpgn0KwIF76GzQamNRg3ir1Kpe3pmnN2aZnG?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d217f5b9-783e-4c5f-ee9f-08db0880151d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 20:24:00.9613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2utD2vyYC4nTSmRXv+l9d/OnLm7/oatrWcu7Ex1CwiXgu2gWtoCFCMSkSIzLPJhxkmCR/uC977RvWboyuZwigw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7506
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 02, 2023 at 03:13:09PM +0100, Greg Kroah-Hartman wrote:
> When calling debugfs_lookup() the result must have dput() called on it,
> otherwise the memory will leak over time.  To make things simpler, just
> call debugfs_lookup_and_remove() instead which handles all of the logic
> at once.
> 
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Zhenyu or Zhi, could you please propagate this through your gvt branch?

> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 8ae7039b3683..de675d799c7d 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -699,7 +699,7 @@ static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
>  
>  	clear_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status);
>  
> -	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
> +	debugfs_lookup_and_remove(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs);
>  
>  	kvm_page_track_unregister_notifier(vgpu->vfio_device.kvm,
>  					   &vgpu->track_node);
> -- 
> 2.39.1
> 
