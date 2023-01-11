Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA97665F07
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D954D10E75F;
	Wed, 11 Jan 2023 15:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D8210E75C;
 Wed, 11 Jan 2023 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673450765; x=1704986765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eMJT1b88zOovgJ3+YwqHnkc7AspRh346NN+6YwqQADo=;
 b=GrhKQ0ISDlgdB3zZBzxyf0ZDl+y3gRvv1BLJhvdqt0BEBcu84lVBrh1E
 8JjQZfEs7GUm7loWxdv83PAbU8ITBz7u5AVOgB3d9DkZZLXcOcpWuTUbp
 VVLppMUcUTRKE0BCxPH47e3dWLC2jN0wir5nDCw3rA6ucPtuQddc2dVO+
 4L73srZgnGPQYLbfDeBD8b9nVgYUZC84YCOXSTsGqfT+2EV9awTE/nBQZ
 yzw2BkFZUK82uByQhQkBiv1mwwpGNStF3/g2IAGzQoHbTpfcs9+VcIa8t
 0S26siWkvzE84eD69ZMndvztifZb6vGMNby3AmvEixvURfNe6HxoB7iV7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322138730"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="322138730"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 07:26:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="746196616"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="746196616"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2023 07:26:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 07:26:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 07:26:03 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 07:26:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fknU/kp/cw24oLsdVu6nzCdKNfrDlJeIq+XtlXNjYlTvASKK0TMJwKr822hCiHcaLTz9sACPUrGhUTvPAqVd2t87ZlMmmiq4sIaI922Csbrsrr55GuhL8OzpqNogO3zeVyhooG5/NzNz6JOzrGx1eoCStPeQQvlTqNElJ3mOgnmJAHf8hux7HaIvquh3mvmTk8vd0GzJZ+BHwnFg8Cb0o9H7UdbftXLrZGx2fcKda9SzjKhEpQxjDsAirsIuj7H6SKA9inwzkC9+r8UcwztTpurcSdrmld6mOYkjQ07D2x8o1fX0f/wEloBvcBRHQsv6KcGOKmsc5SYlnACHKpqhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSBvEH4B09JAST3QL4LXgGcQNBpwYUDWExXIJtHkH4c=;
 b=iU/r00vnByDbDOPtdBziW0X0FlggaDZF2Tq6BNnZqCU8i3oo/IEX8NGOvqFMwXJXBT5B4izqXTk0oIbBKPyHw++ItQHgGs9JhXi40azNceCLeK1/uy+y0gZdw2BmClKgPvxjXt6/jVWzYB85Zg4YlGmTp5lZ8wVjwJhkB3+dP5JtoyEyvuFjz43GGovAZxEK0893bMYv9/buC08X+0IMuaWdzQNYD3HjmjOoa9y8a0NWIXF+8B3qfOc52xIbaTOW+1WKL/PH+z6N88s5KI+MqxJTlVA4ewfieCwg+6IES+EBltCZvOvRkj28jif0rRHFXwapznNatOnyTu0ppB3EyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 15:26:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 15:26:01 +0000
Date: Wed, 11 Jan 2023 10:25:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to settle
Message-ID: <Y77VBNAgY161+QNM@intel.com>
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230111104447.338136-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: b9df7a94-8158-42e4-c54c-08daf3e8256d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fHGR4AKXJFLYEPJ6jjeCAJKqcxmOeSkd2VJn2G9OEkfZjjERbZDR3O6c6eoRk1/j4Sq0OBthpfolwsaB5+WjVZRU2nmiC5+5MvgQUdS1GD80VoSzitafbEaARhmJVyC01a7VaB9Mqo2P7NOZD07QfFtcYkFYX8gAHtEkrcm5i1pAygagXtFJVMj0L/GwEJiM0ayOKMc8n2K6BD+/vG6D36NDn+W8zJANWM8esSVZ2iPj1LyTqMzl+BBDrLsc9QF0yNHJVwWJv9lvMA80urfgu9Rt9RjW0b408DNQTTaOst2NEZdI/Itkl19zjXaXSOBmiScVtdAliqXfxi0NvX+yVvHjhYBPkHn1lzMYrSVQv6YCJyzBCJYenFQCtAsC21Rm1SPPAF5gBvXnmqhg672ErDnFOnuRGvWezAoE8LvbfqDhHiU3FU+sCx0Wxn6Rj+sqOT8Y93G/FFv1ShdPUMObxMAcNWwNOC5RohPiO/DmCEKoMqxuSuH5dOSasB+byvzAyHOAVKOUvtziXA6tkI3R9Fl6+R/Ftnn4JtfgzIBpdWXl1jrzPvNMeB8tmfv+GSJBypxnauZx0m2V8UkEJK7OMGu+fHsQ5qishuRGfJS6KDKFe3ptfvtrtQ7AiCF8rgjcPnOslbHIhX3v0SgRhwromCXvhY2Mk/FjrJrCk6DEJIo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199015)(186003)(6486002)(38100700002)(54906003)(966005)(478600001)(316002)(86362001)(36756003)(82960400001)(83380400001)(6512007)(26005)(6666004)(2616005)(6506007)(2906002)(5660300002)(44832011)(66476007)(8676002)(4326008)(6916009)(66556008)(66946007)(41300700001)(8936002)(226643001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h3ReTnvOTxIYkx83d5kV1GuMlGIqt02lIMj31GmoNoINBiv1Q+M9FfaQ6rEk?=
 =?us-ascii?Q?5q4xpRHp1E+VKQgoDwkP6IRbhcC2BX/f2V1Tw/juS7lu8Pvb5y1TY9JMoIfq?=
 =?us-ascii?Q?F8sZ4AKlkZDjkARHqRTPaz7aRGEUWtmm4HNaAaTkeRV1U6+ovTwn1K0Ra5ve?=
 =?us-ascii?Q?Lp7e9uFTz7Y1oixuRPd+KA44Ao+qW8hIcc343DZ9T3mN0wfo28AqTn+Lro9J?=
 =?us-ascii?Q?7+moh8diNmWoUO/8reDgRayxlPgSJ2jPdwzCxQt2sDdkJ2yuaDrjQlPJbvmZ?=
 =?us-ascii?Q?sQ032LHvXl50/lr+R0sssNX5KufwzlPWGGdE0GIQceoqTf6NCfsJRgnHoLhn?=
 =?us-ascii?Q?d4Qf192GX8U4Xg+c+DR2I0JGH8EHKbK4/WzuLIL4um2SZ+q9CFsoVDd+r9q5?=
 =?us-ascii?Q?30MolVwOK0gc+7HXDjAA4trXBxHxH9VcnTBmv54SPybj+AOwUxWYlno4twL4?=
 =?us-ascii?Q?m8xfGHZk0IewM72nvTmVMYA1/n4pZT2uk/RsEvZK9IxWS4UkfabRsgU75IGn?=
 =?us-ascii?Q?ibkFqhXUe8aKm3iXauZJL41WajWnYGO1uYAMjz/LuRZ+gSlI2hC1sLXKYpA+?=
 =?us-ascii?Q?OX9x3gkWaHo5YUVroXdfJtTmLdu5nxVjIFWHuLyY6Kr8dHMG0B+8HRZqj8tk?=
 =?us-ascii?Q?SrLaWTO/9dPYyF9pUXS9guU+dKtNV9RsPOHMW8RjmJMzZb59R3j6h+D0Rili?=
 =?us-ascii?Q?+cS3n5hspqIKsepZ/33hizQgFEAz/TSkmWSZl6lzmfFYj9gGZoHYo98i9XlQ?=
 =?us-ascii?Q?DiywZ25BAeVU2kDUh6J0TDBebmgo3peYqdXA5CePamO3Pwn9KVw1jQEFOYur?=
 =?us-ascii?Q?REaDtYeFzaJMjj8eiqrax1OHoHR3q3r81qbduSH+jCL+c/RMc7fvSQsgv1Yk?=
 =?us-ascii?Q?FJgJlkJe+9Q2mzh1soLkaPGoq4PK7/0w2Wbbz2cByLTE3OExpeYKFV+SEC7G?=
 =?us-ascii?Q?npqQR5z8tf6w3XvVlD4Iu/Ziu8iUFACU6mCNQFb/LKxEcpOjtPLociv19Bc4?=
 =?us-ascii?Q?1gA1VKVnJyUEkAl0shDJhKOBKK0bZUw1wye1MN7iOMlHHWKW6/CiTR9hyfVg?=
 =?us-ascii?Q?48sB+8fCcj8Z3NWpyLSyDf2QM3OV6jmgBzvZDWH8Oy+18zzWcSo0gV1Yf8w5?=
 =?us-ascii?Q?izZkT+diwOgnqkpjj3wlwkodSAvM4QAu1OBCv8ZmjO6JSzGVQDW/bKULStrA?=
 =?us-ascii?Q?y3aXZWw9ixGAd+gtdjXawJlQS8TL0/50YRvbK4WFfswyoN3+/PycZtEeHD0c?=
 =?us-ascii?Q?EohHtEwxpNNQLOVRe4QKihesLyXb5/o6tCzlcY6rJlC5tuwTVIWIoZAOxvkM?=
 =?us-ascii?Q?sXN5RkM8BfpDKWO95vHeLDRm5j6NiqTpxFl5WG51lnTjc8QgqmsL7XvpqbRm?=
 =?us-ascii?Q?ShNMp0c1jqf1X/YpSiNh5HfeTbjMNw7saf3xjD3ak6Ai8jQk7WIY83Usn9OT?=
 =?us-ascii?Q?GohsopseTmiygRtBrdvOR3ZGP3oTvIz+XQ3Lk8vblOZaaMuAHRoc1AsVX5g1?=
 =?us-ascii?Q?lHEz9/q6vuu8uqzCAUQ3rvD2r7txh7tbLqDhkXch0EoPQrqmtCKarfkkuIo3?=
 =?us-ascii?Q?UwyEOsdKnOz3T1ebK7jzvQBVV6LfJEaTHH/Z/kIOfy6BbCVHrcCsYKFsw8bA?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9df7a94-8158-42e4-c54c-08daf3e8256d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 15:26:01.4915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEWEQbkh50okxIQ2ocCc5Y4q+C2mY/PO3AeeRHKsDzINQQw0Eufz9SR0MzcZoaySlbsh4pfLe/HcELu1Oq7TMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 11:44:47AM +0100, Andi Shyti wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> 
> During module load not all the punit transaction have completed
> and we might end up timing out, as shown by the following
> warning:
> 
>    i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)
> 
> Wait 10 seconds for the punit to settle and complete any
> outstanding transactions upon module load.

10 *SECONDS* ?!

> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7814
> 
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/intel_pcode.c | 35 ++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
> index a234d9b4ed14..3db2ba439bb5 100644
> --- a/drivers/gpu/drm/i915/intel_pcode.c
> +++ b/drivers/gpu/drm/i915/intel_pcode.c
> @@ -204,15 +204,42 @@ int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
>  #undef COND
>  }
>  
> +static int pcode_init_wait(struct intel_uncore *uncore, int timeout_ms)
> +{
> +	if (__intel_wait_for_register_fw(uncore,
> +					 GEN6_PCODE_MAILBOX,
> +					 GEN6_PCODE_READY, 0,
> +					 500, timeout_ms,
> +					 NULL))
> +		return -EPROBE_DEFER;
> +
> +	return skl_pcode_request(uncore,
> +				 DG1_PCODE_STATUS,
> +				 DG1_UNCORE_GET_INIT_STATUS,
> +				 DG1_UNCORE_INIT_STATUS_COMPLETE,
> +				 DG1_UNCORE_INIT_STATUS_COMPLETE, timeout_ms);
> +}
> +
>  int intel_pcode_init(struct intel_uncore *uncore)
>  {
> +	int err;
> +
>  	if (!IS_DGFX(uncore->i915))
>  		return 0;
>  
> -	return skl_pcode_request(uncore, DG1_PCODE_STATUS,
> -				 DG1_UNCORE_GET_INIT_STATUS,
> -				 DG1_UNCORE_INIT_STATUS_COMPLETE,
> -				 DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
> +	/*
> +	 * Wait 10 seconds so that the punit to settle and complete
> +	 * any outstanding transactions upon module load
> +	 */
> +	err = pcode_init_wait(uncore, 10000);
> +
> +	if (err) {
> +		drm_notice(&uncore->i915->drm,
> +			   "Waiting for HW initialisation...\n");
> +		err = pcode_init_wait(uncore, 180000);
> +	}
> +
> +	return err;
>  }
>  
>  int snb_pcode_read_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u32 p2, u32 *val)
> -- 
> 2.34.1
> 
