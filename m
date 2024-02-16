Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A058857BE1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E964710E61D;
	Fri, 16 Feb 2024 11:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RWrTICJk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2072.outbound.protection.outlook.com [40.107.102.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0523A10E5DE;
 Fri, 16 Feb 2024 11:41:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcoCrRDAH61QF8RdOqHPcggQe+wqa5PxTu5LFHoRpBV0LgWUE09EfJVAz4gy3SrA3xukbkAGxvKKss85fA2yymVUKRuRVmgVogHQ7hj0ST01vG+QVFHQk0fTewfyuclSreYsfHvO5wiffLu0p8d73WrP0U9XawA5Miv2kqK8YP+xonhSu7Jo1hMwZvYghsAaaLv70L9nhSJlL5/8QhGsVLUjy7Bq5lB6iIpC36IB14kI//dgnD27vDQye0XFvQPL5WRLQDwCMNLhCXkPi1KOOdSiAZbwF1Ke4ClCgQ/bTUppztw4uOCEUoilamSKXELIrVthAfZGC2oe7oh7WgDVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+ElSj1TBSAr5wqonIQpecCyv+VvOQtLlet4V9TQL+M=;
 b=mzwKHdHDgPUwk2SmUSuXtduvBo6vCDIOhjaIPVNI7k2my53mJ8GeK/bYFf7oLps3N1i1Xun6Gx8itK/d0e9w6UeJlBzm2XLgyxBQWQ9SMX5MmhXTcvfbuqECHaIr17j3/SDZRg7X8wVa2VSBZedDRYOwVVXXIJVYp16gKlYj4zyOg/ZDkkbc+FoX1tY1LI1uNGud9paY+1w76gcNj1GspTaxto4UZ0Esr+UkHfcFGOloqxnQ9zt8L35j5p636PbjvhM7Z2EcO+AECLpdUsIKvqRsxSpczHuVJ4+EW5pQFWKuMHjwea3cI78gfZVbfrtErEZg7sOp9bbPWzDlHXWhwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+ElSj1TBSAr5wqonIQpecCyv+VvOQtLlet4V9TQL+M=;
 b=RWrTICJkx0gWRMUaENWmfLHMGVpaGjtia/lm/lv1Qcs2wUc374PFKWpcWFbv8PfqiH/tqltNZGUvXE2Jo5TOY9PQn17u6XNvrPNOOvRxQJnHkF7RRtI4onCig1lQR2ByFqaf5ttcKXiXyofvGLNYF4GxBi2YkDDkf4xg95VeOGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Fri, 16 Feb
 2024 11:40:59 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6%5]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 11:40:59 +0000
Content-Type: multipart/alternative;
 boundary="------------wqEro68jGOcgP0eULtbFPFNk"
Message-ID: <119438d7-b2c8-d696-4249-a2e14bac88a0@amd.com>
Date: Fri, 16 Feb 2024 17:10:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/6] drm/buddy: fix range bias
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 stable@vger.kernel.org
References: <20240215174431.285069-7-matthew.auld@intel.com>
 <20240215174431.285069-8-matthew.auld@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240215174431.285069-8-matthew.auld@intel.com>
X-ClientProxiedBy: PN3PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::16) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: c67b2790-e043-4481-a4c4-08dc2ee42521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VisNxmX8i/h2sVUjGAv2JwhJWsSGyVMmOCaHDXqU1r/y48yk45ygVL+SVB/SuZ9j3r5DNFgw7+R5U9bNxeqCFGPapH0ACSGTdy+wIbRSu8E2HN2udZmjL/CYhKRqae0JfdjgB7zSl0xJiLA7JnG/UyRckIyRRPzEkFnAHnaYF9qYDRgv3pWgPXNB/Hgo869v3lOYvaS2vsYpiQgE1VQEAjZgd0e/CNwmGuvQm2G4XhYm/4B8rqkZnAEIf0rHzhXNpR4BmSJuQBiVGrB2EDxeiXeC25BYBgaLISkSExOfQRfak8/V0xuEdsoBqkLWB5CUgI1CGOQikeFis1TglkuTSw2VLD+U13FW9qC6I5yesmM/SvWf5rgcyz/A22wAhTk65SQ+NHo5GBtQ9dFXx9hEEtoZQmW1n+54hkZA/z12j13hLjGhHkh4gusw8fC/kvqT0feqo5V9LY83K56Bhq8mHhPjSvAs971pz/0WZlBC9Oxl6bfcxKZAKIYxlhw6No4vVscQ9L2Vp0uyaL9pKRQj+nJRCnqx7DaeRCNLyKeMtXe3rrLibJOF/1vwxrcvr2t+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(316002)(31686004)(41300700001)(2906002)(4326008)(8676002)(83380400001)(8936002)(66946007)(31696002)(5660300002)(86362001)(6512007)(38100700002)(478600001)(33964004)(26005)(6666004)(66476007)(6486002)(36756003)(53546011)(6506007)(2616005)(66556008)(66574015);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTN0YjJ5RFo1Y2lSM0srcWp4NVA4MEVSMENmU09jU0NDMHBrMktUYXVVSHpr?=
 =?utf-8?B?V3NVSERYS0l2bXQxM0VwWllrMnlNekxVOEpwMTM4NEhiNC9QQ3dTaEc2b0Qx?=
 =?utf-8?B?VFppRm9zcmxDZDBscDNLZ0FTeTBaRlNTeE9FQnhnRmZDVVpGOXdpUXZKd2cr?=
 =?utf-8?B?c0xDQ2NGdi9ZajVCMmdDNnJxdkhWUTdxdEpuSXkzNExCRFhucDFWT1AxMjJz?=
 =?utf-8?B?ZzUyMFAxTFZhT3JUU0ZCR0MzdkJDSFlxdXFzMVlaMkp4Z3ptWWFzRFZlazVL?=
 =?utf-8?B?WWNRYVNXbGRNU3ZtMW13cGIxZ2xqUFlWQnlqdTV2ZkhjRWkrTlpoU3JVZDEy?=
 =?utf-8?B?OUNxSEt6SFNZQU05d1hUbzMzRkNhVjM3ZWxYSGJZS1pYc0JzRytFTDNIMDFH?=
 =?utf-8?B?Ri9sOXNmOEt0djUxTjdMbnd1SGt6REN3bVJRT3p0ZlhIekJmOVErTWErUlJ3?=
 =?utf-8?B?Y1NEenN0US9yWHZmM0IzOGx0Y0dTQ1Juc1dSRTh5R1pvaDlVUms1M002VHE4?=
 =?utf-8?B?M0ZKM1BJK3U1YTJlZzJtM3ROb0kxV1dGbXY0RldsbXk0bXp2amhxVmFaTkhQ?=
 =?utf-8?B?UkxZM2dsQ29scG1rV2ZSTHowNm9yakdyYWt2Y0JTRmpGcHZjZ3ppMTdVNGcv?=
 =?utf-8?B?Y0Vlb2ZWNmw4VjJNREl5bWFQeERuTXppK011Y1JUMks0RDg3dUpOclZ4VVox?=
 =?utf-8?B?SitjODhkb2VqcHJNZWxFaXNhcW8rS0ROaEk2b0dwWmNJMTZQUFRxcC9EUkRT?=
 =?utf-8?B?d1NaR05xOU53SGxWWW1YRTJja2V5YzdTbVBzQ1BVZ1Q2N2tPSFFmOGYzTVBR?=
 =?utf-8?B?Z2hKV2dzMGxjcXA2b1FFUGptZFB0eWlxMExoWFJBMHdpVllHbHpvNERMK2t6?=
 =?utf-8?B?RHhUbEcvS2txdmZiM0dFSnVkVHBOaWtWZGlMVGFnTDdaUVJQTWNjZitLTG1s?=
 =?utf-8?B?UmpPcllWaVhBbkVCbzJ6d2cxTHNaMk92Y2MrYXpaWk1oUElLeC8xNHk2QVp4?=
 =?utf-8?B?K3lvdHRyWVVjdVR0aG9RZUcxWkZtU3QwNmczcDRNTWZCdms1N2orZURzbGIx?=
 =?utf-8?B?MFM5a1VVVURJdGNtaUhlY1BjNDZNQ0s4VURnaVFDQmFDMTR6UW9iOU1FRjV5?=
 =?utf-8?B?NTRBL28zRnp5TVM4c0UwZ3pDMzV0czhLMnYvRUoyM1BlMk9lVTlhVlZpSFo4?=
 =?utf-8?B?NWdDTjVKWXRpR1J4S0VjYy9sMmhwNHdpNm9DQmRZeXYvSWIrYVVsRjl2N09O?=
 =?utf-8?B?OHFucU85azhwS083QkM4Y1lxVHRCR1duand5WjdxT3Q0akFlNmZQRUtOWi9Q?=
 =?utf-8?B?Q09zb0k1dlR5dmY1NFpqVkJrQmdYVTQ4MDdXMlhsUmZnN0RjRld0b3A5d0hh?=
 =?utf-8?B?UUJmb0hYTmdXbDFOTWE5ZUVjUUtPVzc4OVlMb2V5UU5ZRzdyd1RzSWtNQVMy?=
 =?utf-8?B?K2N0SURJaFZPRUlUeS9yMFcyd2VDb2FldEpOWlA2VmRPSnFrdVlKRkhwR25l?=
 =?utf-8?B?S0VSK29QUldyY0xJZm9oRnVRQld2ZzM1NGhkakVTWThuSG5MZnhzcW9QZ2VQ?=
 =?utf-8?B?UkE1VXA5R1dRU21MTERNUjBlL2dxbDA5Q2VNRGFHRlBGM2ZoSnFrUjcxZnBo?=
 =?utf-8?B?WlE1QnpHSSsvaHNiZXhZaUZER2N1MDdoaGtGa2JmNm82Ym1jbjJybTQvSDRm?=
 =?utf-8?B?M0h1ejUybEtlNmZLYWFZdXJmbXByTnU5SSttSGVZcVkxbGR0MUh6U056UWhk?=
 =?utf-8?B?VUFtRTJyODlISHRCNVVDRE84RzFBaVZScVRSdGs5eGVYTFpVeGdFV1pFVDBv?=
 =?utf-8?B?N3VLV0plRCt0NFF1cHl6Y2JsTHR2dHdXTmdiMzdOSU1SRlVibjVxeVFtUm1C?=
 =?utf-8?B?dXZKaUtJblpyNVVNelAvZXVqNlIwRTFzODludmdlYUJoMDIyREo3Y09rSXZJ?=
 =?utf-8?B?YzVzSXl2TDdNVDZsR25sdWxFb28weFZTZ2llRGgzeUZnRjhNd1c5WmQ3R09G?=
 =?utf-8?B?YTFPN3FZeFdrUFpTOVh2ZHpnMlR4dlZ1QUVsR0MxUDRxZTlLdHlvTjEyWEQw?=
 =?utf-8?B?b29Nd0QwWmd2MkdDd3pNTFRlMEdiR1JrRFdwZjFsWTBaeC9KZUJoVUVqS2dq?=
 =?utf-8?Q?zx7lVeEsSa82mInvQfRNHRU+J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c67b2790-e043-4481-a4c4-08dc2ee42521
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 11:40:59.3022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVPDwVvozHDDc/I96pJTR7rP84pP5jf6raIsfU5v5m2f0XUcdHMmuD/E5UVm4kFnOxbYqkvm8c2+hIWP7VSIbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------wqEro68jGOcgP0eULtbFPFNk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Looks good.

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>



On 2/15/2024 11:14 PM, Matthew Auld wrote:
> There is a corner case here where start/end is after/before the block
> range we are currently checking. If so we need to be sure that splitting
> the block will eventually give use the block size we need. To do that we
> should adjust the block range to account for the start/end, and only
> continue with the split if the size/alignment will fit the requested
> size. Not doing so can result in leaving split blocks unmerged when it
> eventually fails.
>
> Fixes: afea229fe102 ("drm: improve drm_buddy_alloc function")
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam<Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian König<christian.koenig@amd.com>
> Cc:<stable@vger.kernel.org>  # v5.18+
> ---
>   drivers/gpu/drm/drm_buddy.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index c1a99bf4dffd..d09540d4065b 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -332,6 +332,7 @@ alloc_range_bias(struct drm_buddy *mm,
>   		 u64 start, u64 end,
>   		 unsigned int order)
>   {
> +	u64 req_size = mm->chunk_size << order;
>   	struct drm_buddy_block *block;
>   	struct drm_buddy_block *buddy;
>   	LIST_HEAD(dfs);
> @@ -367,6 +368,15 @@ alloc_range_bias(struct drm_buddy *mm,
>   		if (drm_buddy_block_is_allocated(block))
>   			continue;
>   
> +		if (block_start < start || block_end > end) {
> +			u64 adjusted_start = max(block_start, start);
> +			u64 adjusted_end = min(block_end, end);
> +
> +			if (round_down(adjusted_end + 1, req_size) <=
> +			    round_up(adjusted_start, req_size))
> +				continue;
> +		}
> +
>   		if (contains(start, end, block_start, block_end) &&
>   		    order == drm_buddy_block_order(block)) {
>   			/*

--------------wqEro68jGOcgP0eULtbFPFNk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Looks good.<br>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Reviewed-by:
      Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;</p>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/15/2024 11:14 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240215174431.285069-8-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">There is a corner case here where start/end is after/before the block
range we are currently checking. If so we need to be sure that splitting
the block will eventually give use the block size we need. To do that we
should adjust the block range to account for the start/end, and only
continue with the split if the size/alignment will fit the requested
size. Not doing so can result in leaving split blocks unmerged when it
eventually fails.

Fixes: afea229fe102 (&quot;drm: improve drm_buddy_alloc function&quot;)
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Arunpravin Paneer Selvam <a class="moz-txt-link-rfc2396E" href="mailto:Arunpravin.PaneerSelvam@amd.com">&lt;Arunpravin.PaneerSelvam@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # v5.18+
---
 drivers/gpu/drm/drm_buddy.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index c1a99bf4dffd..d09540d4065b 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -332,6 +332,7 @@ alloc_range_bias(struct drm_buddy *mm,
 		 u64 start, u64 end,
 		 unsigned int order)
 {
+	u64 req_size = mm-&gt;chunk_size &lt;&lt; order;
 	struct drm_buddy_block *block;
 	struct drm_buddy_block *buddy;
 	LIST_HEAD(dfs);
@@ -367,6 +368,15 @@ alloc_range_bias(struct drm_buddy *mm,
 		if (drm_buddy_block_is_allocated(block))
 			continue;
 
+		if (block_start &lt; start || block_end &gt; end) {
+			u64 adjusted_start = max(block_start, start);
+			u64 adjusted_end = min(block_end, end);
+
+			if (round_down(adjusted_end + 1, req_size) &lt;=
+			    round_up(adjusted_start, req_size))
+				continue;
+		}
+
 		if (contains(start, end, block_start, block_end) &amp;&amp;
 		    order == drm_buddy_block_order(block)) {
 			/*
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------wqEro68jGOcgP0eULtbFPFNk--
