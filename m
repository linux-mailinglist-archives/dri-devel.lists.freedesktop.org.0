Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC8A58D741
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4358ACE2A5;
	Tue,  9 Aug 2022 10:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716B6CE268;
 Tue,  9 Aug 2022 10:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660040008; x=1691576008;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DeU54nypMGCz5Vi0eskXf4mhbCd4xpZ8JNKuJNKVYTk=;
 b=iPyaR7q56FiCBdLLqWaYfi96CbimgM9G5kmitMsAc9LEFJVo4HY9QX4a
 r/RBuPr/6ZF39rlLEEXtGy/mzbeYRVIRPRJyhxNkBmjOzF3Tx+Sdyr5Mj
 99TQM81Rd35/4ITZAN7J5bZ+X7enYXI+rrz09bcBad3W+zdoVWxDr1R7G
 B5G+g8sSQogyYjrFt2y+iMcziZlnzkEy3tXoC0ZXscEP0xZQOK1baql2q
 gkT/ZJzngOE7Pp9VZjCT+PmRAhmS8HTDG8qVDI3oKfQaXxxk6JJhnodVx
 mY7gQ47zq0a0cg8lIaLZc12IKPWzgzsXBHTvecdCPI5btOXqC0a8Tuc3L Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="290804920"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="290804920"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 03:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="580740936"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 09 Aug 2022 03:13:26 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:13:26 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:13:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 03:13:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 03:13:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kir3C6RjpeUmT+HLWsMgt7+oEWVIUWkjTWzwMVf2L1UT7sR9FyUKEQGYX30U8grxElDwnAwwD4XQlpknY05eORYZ87IByZJNqQn846YtNQUkze7cUC962dsGZvMdXEoLJdboDH5/ViEyE0GBUbLHxeYIK3AHe4ddeVnX2U3r5f7TpJWy0DC01Ejz1KD3tVPUosP6mveCYGGPxG3k8SPEdZIkQSyXHE8YXTpQT9q7aY7+9ZFElWxvtu5b9zUgaWeRbfozXPxsj2kxhlMvfiblKfjxfej2YP1aily+BwUbenHZALuqUzj89MhO1GMiGUJCCvB1zIKPI+s1XJfCepPpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIbB212EyOQ0+OkCH42grJ5WujIUgcZP2YTaqC6OHtc=;
 b=ZY9xWuU+rEgy9ySjeyaHPeGHDwbVJP+/NlQA3v1zA4G7MgqNv+BYdHyCA8nKpB597X52ztvRIlN89hBumSA3DMwXey4oOjuiAAuLIzTBBs9rDOWaEjBiEBIQYPHDxOOXet3c97+QTsk+cXrSdWhq61Ca/BbtTndFRCB2/fJY7+SJQ5POnbWAH17X8q5KmJMaCvxBnoxhp/y6sRv9xEb9HkAXTevKC7hREvUaiyqQHLSg6+xJbKQoEWrqIXdIIOUujZShr7CWajUpkLbFD8kpKe3exYn5leISM8UicvKrobmaychGriUelBTO6rgrN2JoSyqzTeSFDY9K4lvvx0bY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY4PR1101MB2199.namprd11.prod.outlook.com (2603:10b6:910:1a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 10:13:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 10:13:19 +0000
Date: Tue, 9 Aug 2022 06:13:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 39/39] drm/i915: add GuC functions to the documentation
Message-ID: <YvIzOsj0LmdEzlno@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <d9d2ba7ac39f89fc196447891b43ed70a8c6dcaa.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d9d2ba7ac39f89fc196447891b43ed70a8c6dcaa.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0114.namprd05.prod.outlook.com
 (2603:10b6:a03:334::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52c936c9-3aaa-417f-c5f5-08da79efc83b
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2199:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kcZtjtEq6ydVCVsCVS9Nu8TxAD889JQ+d3tYyIS+Fh9iLbwHvZzixLFpxvQLxlV+T33EsWTh+5rRWrIQTOAUk6Bpz+QCiovw/cpHJUEraVytFXK3lreLAHcD+rrHd8GAafinUXfd2WA8pb6FAqaAkYIRgcqXn+Q2evb/yOMzcuoenVJsCKY7NQWIN7RFWZjty/M9OAFrklC/f9JE++3EoaFi9Hfknh6/kJnZG4HQNFRRsOHd+JIoBQ+Ov47ODeQ735PnGckZa0oHLx0o/Mc0qJrX4cB3TVKyEYjqVwPV7tWKC1vIxwd6oUZMz15L2GKTEQS5SiqmQFTHc+MDQocWgyEyQ43pcAT8NzTXHND8uFPP0udN0soi3uo8PC43oZ5LtY90Z9TyF8wD0EnXH43Bim56WOHyNI0ABSsjqEeJqot6Nebc9m+t5g8SenKZOZlXR9v/QuV2V1z5OrNF7NiWoXaJ2eRIb+RCN1Jf4CPFU9+JOTFPSnGpaSoVJ1LV8uwNijBdzK98O5hkIZxchssL9OU+rTJBmck3kq5qZKFq8vQICLaVA1MWePIYmg+o8QwSTL8Qcbxs+pzKfirSOOb4gF66hI4htvbptjQchc1yJ+YK7wzqxHqQDy27MSrUiT6NgBnepGBvUCkqirDefSD4oCMEozBQlxWawdNi7COeQLQI3GXcMOjFq//g1HJ9Xj2NMXCrtT8zB+O86lyH96UD2A70s4nboY5GLHWkZemA3k2tHAySG6CCeH/jv7P7JIdvZkdFVAl1ZA3P0lrNpn9Www==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(396003)(39860400002)(376002)(136003)(38100700002)(966005)(4326008)(6916009)(54906003)(6486002)(8676002)(66476007)(5660300002)(66946007)(66556008)(186003)(44832011)(316002)(36756003)(8936002)(478600001)(86362001)(2906002)(26005)(6512007)(41300700001)(6506007)(6666004)(2616005)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vz5IIqNsNpTmv+90cNiFkw9lfN8ye7rgMMCP0otL8ZdTFvvM1abL+6Tl5X2K?=
 =?us-ascii?Q?9nDhtquXXbfEJBSU98v72aqfBm4rxH2mS1afgZvHEOB966qrIRYDKeOHH4k1?=
 =?us-ascii?Q?ATk9st8coFdS1n/NQd7ACA/riNxp0MLSXio4PJZP+KPGa2ovL781LTZSuahf?=
 =?us-ascii?Q?MvXMZ96p+qnZp5Vu8wRro/Kp2ZmIjjJAfCMK8AcY6RrYU+Ahfl7q4eBVKdND?=
 =?us-ascii?Q?sIelSMPR333w7luTKCMD7HyPlqIdTGe+KcEalQBxOPTqaK622BdLtEvoSstz?=
 =?us-ascii?Q?V86IJoMnHOU5wTV5PTAaJQM1pAHX9LVQaGfKy65CDUwqtVjuC2Xtg+C6v0WV?=
 =?us-ascii?Q?+yj5q22/Rg1hJCWkfCc48ZoZic9lAbkrvpQI8RW1TYeJz+j9bWqarzqeAb7L?=
 =?us-ascii?Q?gdcI0ZGatN9Cs+xxLgPARH3AD3n7j5AzvJqm+ZGXJGfH642tuHiGxLvwI4j+?=
 =?us-ascii?Q?lq0Kv8OACKJNPyNuOE21SoHv6LY9ZVzIHPBtRkzIvV77s83qnW3h3+zteBU7?=
 =?us-ascii?Q?rwFO3ds+565/tM3gQpUuOdyiBPM0kXyrfLLFuVnXg9Wqwws6GzKamesIxrJJ?=
 =?us-ascii?Q?CGhxa2GgcTs/tzj0doKrKNlbhbsYpNV8KgIvliA2QdPZlARSB5GqgcT1/fvz?=
 =?us-ascii?Q?1lDV5D5vS/dfMy76vcto14FaBrM7nddLu7fpdYQfoC0d82HJ9igRpAdBGhrB?=
 =?us-ascii?Q?10RGpD8z8W4F66nqiUVGgZzXIofb8qQBV8Z4NovzbqHFDmfiySxj6Eo2eliK?=
 =?us-ascii?Q?veRHs/c5Od+aBxhEkRMo4rVBdPJdnuBiMAoEyUDGZ6BzSwV5Ae3NXaZkD4gK?=
 =?us-ascii?Q?HZTW97A/O6KQ+Vyh0Z5vv6m1f/EPMbSlT/KHN0RFlQfgYNFTpBfAWOthCIxS?=
 =?us-ascii?Q?juNQtN1BRSkq40D6oKDeWdKylwd4CavM/7aoe+HUiQqT7w4YmHJlu1Yu4kWA?=
 =?us-ascii?Q?JRxUQyi23Hlaqvso3r1Hh7tHxgaVWVbpQHkSscdG5eLDWNbv08BmRJAUKtki?=
 =?us-ascii?Q?YpeMe6icI3OwhZWCAjTRubKzS08XfBZ9cKDi3C93nPyvAtuZj7v3UfilD3r7?=
 =?us-ascii?Q?t4Xe8xnunEIgJsw2RMz7+gH4zbUug1pawbOCRFBqcx7LTKEVEst5G/QtBMaI?=
 =?us-ascii?Q?fqCK4bBOFUCEJeE2rgkDnbqnBLbAAuqA9u3JdTP33XyDWDFKbwVCivx5Oylf?=
 =?us-ascii?Q?+gvqXz87uDYrAo1oVIhxnteBLciGfOpA8NamIuFL17nKSUJS09UFQFhyYUk8?=
 =?us-ascii?Q?vind3xqxNMUd01IvNx1Ab2fCIuDzFZQD8L5NmutYMxMBdsWOGTU5I4d41sJs?=
 =?us-ascii?Q?TdhX/BUPFD2SwY+3hLq9mvN/rf6reLN+fZoOuY1zXBsmpDZGG3bLgu/FShuW?=
 =?us-ascii?Q?bnpzwoXNMuWi+dtsZbxr6w2/s4tYE7kq/tjN2Ji9Hgq4ZekyPlymj4tiR50w?=
 =?us-ascii?Q?1iYLIm3Y2w2YUxqGAhHm/rGJGpTjy5Bi2R0+c3tLQGkluXVWXAdoOGPVaC/G?=
 =?us-ascii?Q?Mlxj9DwwZ9zynrteN3ri9w3RMPHTTXMbvau1nHZp/eWS+LpDYlfyINL/yvfE?=
 =?us-ascii?Q?jVgFIHu4d4MX/L6zB2yPw4VhWERjQuP9R3JCtdnx8MHre7gJYb9TQFrhlOf8?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c936c9-3aaa-417f-c5f5-08da79efc83b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:13:19.3132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bn6Yt30LMc/wwlpKaEFTV/FOK5lrFMN29+0jSkFe5tSZvTMvvYWWMfhmjbR2qC38nUVRtJ8yOMwem3qaKgLaPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2199
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

On Wed, Jul 13, 2022 at 09:12:27AM +0100, Mauro Carvalho Chehab wrote:
> Currently, functions inside GuC aren't presented as part of the
> GuC documentation.
> 
> Add them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

could be squashed to the other guc patch, but anyways:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  Documentation/gpu/i915.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 9862d504df4d..8c21a90d8b5a 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -768,6 +768,9 @@ GuC
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc.h
>  
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +   :internal:
> +
>  .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> -- 
> 2.36.1
> 
