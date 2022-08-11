Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5030858FB17
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 13:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D14A9AC2;
	Thu, 11 Aug 2022 11:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A124612A89F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 11:06:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVVwzLIJoWRXb07hIz3+KcFJqR8cNTpC4HyUWD3CtonPiz5STNC3NNt1YMRKwoQeStk04aveBok2kugMux8auD6iAcuxJ7MWjZUGmXUpuzUK2wTR8I7bM52a0HBGeSopAqvcDnAxkEsae4P91CVXPWZ+DFw3fj45b+3KkfzcvpGjVglbgGuX0DiEwuskkjuidmNZY6u+w7EZM0gk+MxpGrJ+FCL1uRcEzwJO3hkyOGABr4V8ufI9IZg081b/bYKFGUWRKsm96Rpcno7dk3OoWN3rb+cGhngxptAcPUpW/uik4DtaFEFqEAWW0Z3JYfHwUQc8u5N0JMVniSnB3dNQ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXiZF0TuhWNSxOXohR0+SlF55Ssbl5rA8Vd8h94MgF8=;
 b=bvjyPE+vHW4av7I6roTz6aonTlv8VswbUmZxzhEy2XvVqlX2QAA1FVU0I8EoV/mOhcKpyHlF47xT1/iVWsLeZuCNVtsM/Bf/awzLIJL1QyGM7ftAfwIF9Om0X2Ywp2H/TesD7Zy2Orhmxb4UaLdg8Do/EECJ40mxo9r9cfBXOc6ccS73/kCMvSauqDefQGCF4xeyVz53drPlQB7L6mBdo6Jme3rJGXawFQ6jCr904jsbCKIQj+wV7y6L/SeqQ22gOzABTvFJu7gllSe3cArjv604McGc1hAgjuO7eHU429/EaMtPaSbodxGJFQ6fdhdK9e5MAWMS8HVHrTm4zp2h6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXiZF0TuhWNSxOXohR0+SlF55Ssbl5rA8Vd8h94MgF8=;
 b=R6S+0amXG0Z05Yvhl0/qb9TpbyZdX2kMUUuBT7kuUfr3eK/vz2CW6q6nOq8Q/OY7FgoEYMgK9sRtKTyW9P/vuwy03f/BqnPj/oj92/jIHgzqwf8AZC5VRPgUinTs3ZKJA5EfgAjR2Q+N5KhBy7eJsh63dIV4g/J26mcvUhwZV60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by PH8PR12MB7376.namprd12.prod.outlook.com (2603:10b6:510:214::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 11 Aug
 2022 11:06:40 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14%9]) with mapi id 15.20.5504.024; Thu, 11 Aug 2022
 11:06:40 +0000
Content-Type: multipart/alternative;
 boundary="------------uFfqQidilUGvwf6bR9kqlTFt"
Message-ID: <28f5d71e-34ca-214a-f8a8-14e227bb42cf@amd.com>
Date: Thu, 11 Aug 2022 16:36:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [bug report] drm/ttm: Fix dummy res NULL ptr deref bug
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YvTSD44z0csJ8YsP@kili>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <YvTSD44z0csJ8YsP@kili>
X-ClientProxiedBy: PN2PR01CA0211.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::6) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 995de029-ef31-4e30-f450-08da7b8990f4
X-MS-TrafficTypeDiagnostic: PH8PR12MB7376:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o/qQP8a6nZ0XsNnkIV+RwJvbjtGobhAeDz/q0XV/0EMNWwQyk/lcxLY0T/xLAAJRZx/QrtIqx+D3TpSChGBXrVzBJWJ/IXQVO5GL/BiJRNSRKmxCcOEtHIIN0nGM3VTnZCdfoUw+vclqFAs2VABS1A78m9AEZSc2y3owpV9aeCLVLhgdiHy25DyHVUW7W5yKQOmGlS6fogRpHrkJX765w0drsL/r3UbAG3M2cVVSygte6d4HXxhbJtQEAmn0U5EMoUB3J3J19CTrRzVPTarmXHneVPcU48PBMxYfoBxpOqk9qgN7XA5g0s2nWP2yvH1i/mNbxwx7VfED2ybvxpplyS88JOx2OCkRoqsFxm8Ved9xq45Unyd2SZBvJ/4Ss36fIZYJtDMudsSf8nQCQY5BfW1UMWtbttqFUScg565y19bq+WGnod29dibOC14tfeg11aZ+FNBpC3hjs/L4Q3Ls1M0pgpONGfyaG1Lg3FdmCQ5ubKbKJWLGmUunDVEbo8NyMgt3fUh0SnYItDD12duNLJe8vd0g5SO900L+sd/1pWnU1TwmZog0XPH1N1M8fmvcGfosWlAr0r3mxbPOqP2ftnUtho1jghtAqYp4rgzKSNIYHgSJQGPkNro+fpGMdKy7k56o38uk5FV4avj33eZRxzgaQbU6jLXaFOv7/+7cnqsDRbn4u+mr+oEtYAOIXHqwfApu8Kobt8GLp1rYJLxzMEUXi2gh2uW1RwaN2nxoibYmBvpCjghppC6+iZLD3YwVwStH+3xnpStSCrZRUmShZJNMRcH3HKQg3ZCH2BshTVjaWGCHZkzqOt7GgNP/ikVt5JswXGe3LDvCwl6Rs+rsnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(6512007)(6666004)(6506007)(26005)(33964004)(53546011)(478600001)(8936002)(41300700001)(31696002)(83380400001)(8676002)(86362001)(2906002)(186003)(2616005)(6916009)(66476007)(66556008)(38100700002)(31686004)(4326008)(316002)(66946007)(36756003)(6486002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk96ZFFiL01LdEhaSGMvcGNXajgzcHBiUWduSlJqcitENzIxUjYyUURWOTF6?=
 =?utf-8?B?RXhyeXlxZGxCM2hmNVowSXNWSnVtM2ZZZmFONmE0ZUNxRjEyQlA4ODU2a3l0?=
 =?utf-8?B?NUZsMnFrU1lycU1PbTFUcXBaTWFscVN0bTBDYkVGN0RVRG0yRmVzdUtHU0Rh?=
 =?utf-8?B?MHg4MjYvRS94MkI2aEFuQkxnQWNSclRFdjZHejR6aEYxSUtYNDJtRTU5NXhK?=
 =?utf-8?B?MEMyVXovMDRFa1Q2SDI4bERLUEwyYWlhbjJrY0VUUGk4dzFVeTVCYWFreGVk?=
 =?utf-8?B?Tzg3NThMcGlnT1Q4cTlNOGYxc1ZZcklsckgxQ0hBRXpaMkRhUTc3VHZKUVNp?=
 =?utf-8?B?cUI5RTNGWFFyNXRaV2k1c29lSFZUU0p1cWNoMkJPMkdjejFlVkh1TEV4blIr?=
 =?utf-8?B?ekxLWXNVZFVHSDErN1VFUk93Vk81eXFIdEd5SUhNNjR2NW8zbzFUU2h1ZjNC?=
 =?utf-8?B?eGo0QllXM2dUYUxWWGVFQXgycGgrK1lIOGIrRy9yU3JuQWdEV2NWMjlEK0FN?=
 =?utf-8?B?V2h2c2VoL3EwUGRFL08zU1c2VTJYSlZvR2Rzam9SSnpNVGRHWklnRmNDaFZX?=
 =?utf-8?B?UTJDMmJ0TVE0dW5obGFyMGF2bmpiSWNHWlF3cmJrTFowN3NqazhwUlh2RnNP?=
 =?utf-8?B?bkMxTVpaeC9PVVBuUlRCYk5iUzF0eWtnS09ZOEc2NFB3eG05L2FxTnFubG5J?=
 =?utf-8?B?MmZnK1JyNmNDcG42KzN1UUtCK1l6Z0x4UUJ0WTVNMVFwTHd4eG9oNFJTNjd5?=
 =?utf-8?B?QkRDSGY3bm5BSUpTRGRLMjl4dEZvWHlCdVZRT0ZEMEZlMUhlWGpoaFNjNENV?=
 =?utf-8?B?MUduT1lyL0t6SG1lZ1VXb1lRQ0xxRHYxcnJsL0dvbWwwYzlPVmE4amEvYUZD?=
 =?utf-8?B?eUVlU3lKZDA0UEUyQVBjYnJLNG9SMXhITHpKMS9KeS93TlkwcDVRdDdMbTRv?=
 =?utf-8?B?ZVZIVHVKY1RkN0tnNm8xRHViK0tUL3F2aFU5TEwyR3owOWZHS1FwNEpqeUt3?=
 =?utf-8?B?aXdha1N5WVVqMHNXVWhISTc0VU1UTzRTYWpnRGN1cDdDTnYxdGdRZWpiWjFP?=
 =?utf-8?B?dzdJRDE4aDd6UGd5cFdhdnB6a0NWNE1XRGwrRTBNOFhmT01VNlpBTjFHMXJY?=
 =?utf-8?B?VDRlZDZMUGJQQkJ3VWw4MzZsVlB1L1lvQnJSNEZ3Y3IzQ2lwWWE3andTQVlq?=
 =?utf-8?B?YmpYV3Z4Zy8rb0lMa25ITVBvdytHMlQ2UG5lN3k3RTRSSVc1bnlzYXpRay9j?=
 =?utf-8?B?cE91bCtEamVVOGxhQzEydVpzL2V6b2h3Mml0S0Z3S3F5SW9XT2RHQmdyOTRj?=
 =?utf-8?B?LzdZQjlHVWMyV0VpSFE3TUhoaWpXdXRMdFdVUTRhajlNcDZnMUM2ZEI2cWd4?=
 =?utf-8?B?S00wNXMvQVNUb1NDMU83UEdQa2NhcXcyNGl1TENyamVlOEE5alVMYmpMM29k?=
 =?utf-8?B?Wm5ZcmZuN2RydzZGdGF1SVBMME9TUCtQNVpvWmpjQlhTdVVzSGFZc1RtWnE2?=
 =?utf-8?B?aGx2dC9DbVJIRHBxY0RiSFY3ZGNCYXRCeTdkZTNnRXRJRlBQWWt5cnhUMCto?=
 =?utf-8?B?NkFTajhNUG1vOHNtUGtxL1NyMmhseCsxSmVTUVkrUkFNUXhZL01FeEdaVTdK?=
 =?utf-8?B?L1ZrTmJjNzF4eGV6cGk0OUNBM0d0bEpUaDdVS2NGSmVBdTFpKzlveTVQWlZD?=
 =?utf-8?B?eHJmNzJiSW5RSUF0R2hNbGUwTThTY1VneDllWk5zNmVSZER0QjNVbmZsK3Rj?=
 =?utf-8?B?b2V3czkvd25weFlIclZobXBDWEhTTkpUdHUyclZydWFqYUJnZzdtWG9mVFZa?=
 =?utf-8?B?STdrbnljTW40QytEWEc4a1BlYXg0RjBlZTkvMk9ZRzZDM2gxVzJtYmM0Q04r?=
 =?utf-8?B?cWhBVi81SmdKMldETjFPVHI3d3ZFY1Q0aUxEVjQ0NGRnTnJGUm53Z2lPL1Bu?=
 =?utf-8?B?VFB6ZXVjbjBBcU02VlpnWUhFRFVtYnJBRGZJdSs4a2VGNEJJdzM1bVFBaHFR?=
 =?utf-8?B?Nm1kMmx4UkFMVWRiK1crQ2U3V2JORlNCcXdqR0Vmc2pEODk3YlFNZ0MzSnNq?=
 =?utf-8?B?aFc2a09TbUJ6S2tYZTg1WHBuOHVXNUphYytTcGZVdGRkUWc4aFJyN05mZVUy?=
 =?utf-8?Q?xIkUPdmgX8NYfwl7CxKsbtUgr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995de029-ef31-4e30-f450-08da7b8990f4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 11:06:40.3116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fx5NRLoOZX1bprmYlluwgxqX0zyqXLL3wYutFACn4Mrnt/HqfcQUBwbRWjJqZlPCzXoM5q1tDEJ6yyRL1JKbrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7376
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------uFfqQidilUGvwf6bR9kqlTFt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

drm-misc-fixes doesn't have the updated ttm_bo.c file, we have the 
updated ttm_bo.c version in
drm-misc-next branch. Please find below for the line number 907.

On 8/11/2022 3:25 PM, Dan Carpenter wrote:
> Hello Arunpravin Paneer Selvam,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch cf4b7387c0a8: "drm/ttm: Fix dummy res NULL ptr deref bug"
> from Aug 9, 2022, leads to the following Smatch complaint:
>
>      drivers/gpu/drm/ttm/ttm_bo.c:915 ttm_bo_validate()
>      warn: variable dereferenced before check 'bo->resource' (see line 907)
>
> drivers/gpu/drm/ttm/ttm_bo.c
>     906		 */
>     907		if (!ttm_resource_compat(bo->resource, placement)) {
>                                           ^^^^^^^^^^^^
> Unchecked dereference here inside the function.

|if (!bo->resource || !ttm_resource_compat(bo->resource, placement)) { 
we have this version in drm-misc-next Regards, Arun |

>
>     908			ret = ttm_bo_move_buffer(bo, placement, ctx);
>     909			if (ret)
>     910				return ret;
>     911		}
>     912		/*
>     913		 * We might need to add a TTM.
>     914		 */
>     915		if (!bo->resource || bo->resource->mem_type == TTM_PL_SYSTEM) {
>                       ^^^^^^^^^^^^
> Checked too late.
>
> This NULL check was added deliberately based on a report from the kbuild
> bot, but it's not clear why bo->resource is NULL at this point.  Was the
> patch tested?  There is astable@vger.kernel.org  but there is no Fixes
> tag.
>
>     916			ret = ttm_tt_create(bo, true);
>     917			if (ret)
>
> regards,
> dan carpenter

--------------uFfqQidilUGvwf6bR9kqlTFt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Dan,<br>
    <br>
    drm-misc-fixes doesn't have the updated ttm_bo.c file, we have the
    updated ttm_bo.c version in<br>
    drm-misc-next branch. Please find below for the line number 907.<br>
    <br>
    <div class="moz-cite-prefix">On 8/11/2022 3:25 PM, Dan Carpenter
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YvTSD44z0csJ8YsP@kili">
      <pre class="moz-quote-pre" wrap="">Hello Arunpravin Paneer Selvam,

This is a semi-automatic email about new static checker warnings.

The patch cf4b7387c0a8: &quot;drm/ttm: Fix dummy res NULL ptr deref bug&quot;
from Aug 9, 2022, leads to the following Smatch complaint:

    drivers/gpu/drm/ttm/ttm_bo.c:915 ttm_bo_validate()
    warn: variable dereferenced before check 'bo-&gt;resource' (see line 907)

drivers/gpu/drm/ttm/ttm_bo.c
   906		 */
   907		if (!ttm_resource_compat(bo-&gt;resource, placement)) {
                                         ^^^^^^^^^^^^
Unchecked dereference here inside the function.</pre>
    </blockquote>
    <br>
    <pre style="padding: 0px; margin: 0px; color: rgb(0, 0, 0); font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code>if (!bo-&gt;resource || !ttm_resource_compat(bo-&gt;resource, placement)) {
we have this version in drm-misc-next

Regards,
Arun
</code></pre>
    <blockquote type="cite" cite="mid:YvTSD44z0csJ8YsP@kili">
      <pre class="moz-quote-pre" wrap="">

   908			ret = ttm_bo_move_buffer(bo, placement, ctx);
   909			if (ret)
   910				return ret;
   911		}
   912		/*
   913		 * We might need to add a TTM.
   914		 */
   915		if (!bo-&gt;resource || bo-&gt;resource-&gt;mem_type == TTM_PL_SYSTEM) {
                     ^^^^^^^^^^^^
Checked too late.

This NULL check was added deliberately based on a report from the kbuild
bot, but it's not clear why bo-&gt;resource is NULL at this point.  Was the
patch tested?  There is a <a class="moz-txt-link-abbreviated" href="mailto:stable@vger.kernel.org">stable@vger.kernel.org</a> but there is no Fixes
tag.

   916			ret = ttm_tt_create(bo, true);
   917			if (ret)

regards,
dan carpenter
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------uFfqQidilUGvwf6bR9kqlTFt--
