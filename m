Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F058170F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 18:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32C592986;
	Tue, 26 Jul 2022 16:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C344592986
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 16:14:13 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFnPKY006232;
 Tue, 26 Jul 2022 16:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=5VIC+8QKB6j6ojZgfnIHmY2RBsGnyCmv+5v6cZTexFo=;
 b=yGvh1FKKMdDj74JbHZXwJHnz+4fJO5bMThZm6PPDFWje1iSShPrmu6+DArGdBK/YE30x
 F9xbv8BH/7X/O0iDayRCzlDIEtBh69rRQP0ROMHfmkWd0dxUvthmUCPipFC629u73O2q
 rfCd6xN8Cpi+IdLGr+sDDQgYJL12YBfRGRZyAILfiLHapJnm+06Jm/iL9PNj3CEw0lEE
 vL2A/xRBxMKVP5R6Q8IzBFLu54ZAi2uufKCNHyUZtgz/gevbASus3jq5b4NMlC56yhlG
 XzFPwe/jqqqU2GwaxhqLW0wu375OzHIsnymOANJWkpjm456ras0KFrmwaCGQF3NXgG8+ Tg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg940puc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:14:11 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QFWh5D034494; Tue, 26 Jul 2022 16:14:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh633163k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:14:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxTl12jHcFY9ybQIKkFAWEP4Bs5HJyagTMT5PNhSeYkDUu0rW+/xxO0BqgKa//q54X409J20NIyBCooAOoRryrBgAGI+ORlpNWMtt4ELZpWFfpiho7PcEt+hM5+uyxjt9RNyMlkBkWKmcSaJ3mkzPo37HRtVIISXJcL9riSJbkXGNsT5aA5GXfaCaqbhf8nJxJkQ3EssLISBu4UhnZp/Z5krtn8f3ecSw5cN6IpduVXM+MHQ+JulOOi4kXKl5jJ2Jp/T5yJpnV8InwHothGaNpR/2HZMNzq6kCrR1Vu7o3SCWzGEjqPYtoXqpCBlS7IOD5tse/GOqcZEZpkYORmEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VIC+8QKB6j6ojZgfnIHmY2RBsGnyCmv+5v6cZTexFo=;
 b=BqIn/RMYNvD34OPo0rWkYeJAlgf/Y7xaAasFPI+8ow7OiQB7HXXTZ3oARO71ySBvcQWS40H3Szv9TPmCLmp1EnEkkdqg6Pnswmz3j1T3iddv0ukBVN92+zIYPycVMoBCdOwMnPw3uHBRlKdmZbnfAtO38sjEFQhvKYB80VIIeR2ussAtlL1XA2swvWw4cdm4p86jktozwRphemvqvFFfl9CUHWHNxotwTd5Af2nSxGyPM4kJEsXu2eDMm4ar9p1bDt9m8mDWxQYIp4UjVj6MPmOqItDtEXWzEs94Zo1FX1OWR5+W3QWsshRrl+oIUMQwCfATmna4uMT6XPpDJNaSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VIC+8QKB6j6ojZgfnIHmY2RBsGnyCmv+5v6cZTexFo=;
 b=QD50pHZlJNB6Wwq5mvVhkNKluDsOlIhLODRTbsEtoifJHtIf+hTgiax9O6jKWbRIdbL2320PbC3xcZoF6CDDNR2s6hP8Hmgr3IZbEYDt0sIRrH/YPleY2dZjTTe1dL7cGp2H5dbHNK8qpCdYquYHkl6mEtnqfWhduQ6yuCbAqpw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB4479.namprd10.prod.outlook.com
 (2603:10b6:a03:2af::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 16:14:08 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 16:14:07 +0000
Date: Tue, 26 Jul 2022 19:13:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Peter Suti <peter.suti@streamunlimited.com>,
 Chuansheng Liu <chuansheng.liu@intel.com>
Subject: Re: [PATCH] staging: fbtft: core: set smem_len before
 fb_deferred_io_init call
Message-ID: <20220726161347.GR2338@kadam>
References: <20220726082114.891853-1-peter.suti@streamunlimited.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726082114.891853-1-peter.suti@streamunlimited.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0009.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9981f1e0-719b-41be-45d3-08da6f21dd55
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4479:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /U75/waJgv12VJDaeXWvxdcPsmnj5eIBy7uG0ARy5ODCljBjqKQnjjqewHfjuah/CyHu9UEB6mggOs0ngO8p0q+9UnuyZWKhyrCJk7eywmas9LW50fkoDBdDFUjc3l2pF8qVCTfP7onl9kmJb3XJn+Vxe4gnHQSKhwzSJnHe6oFeNpgACADlaMXylnxl5B/jTI8BU+Pw3pDgg+cL5DWOPfGoKoPUrUbEaxa90LEDXspc8ZygZm5bOfL5vJN+HGev6MYdM7DvSk3IXzJ2iaqOgB2VrN7EeyXwzLyngWR4lg98qcGkSCMKvvv34IAQPmN8Iq9YoCzBzPgecNDdfZLJMMEU3QwsAphkf/Kdy+lrbLYNjl5uAzZHR8/0saA7AnGoliGZA7BYnmhRGCMJYnAlN5VI9fLgYZAol5BvQasqlCoWfGZfONUr0y6Xx8TOxRKTY5WT6YBub4JWGiZNl1fiKsyqyoWMmD3PcBc5EvOEnpx7sT/bQD0Y83bHXtcrXTB4SAbKNF0LsN39YGqNXsUZehvTgEWvdP10zXXIn+UsM0ON19zXv4oMjOmRxJjOYQrk3vRY+GBbZAiRusGoYlLKdb3mEz1S25bTGxqIgFVPWof9mVSTc8ocghw1MpGJtZUcCkMckTavhZt4Lf0TegULUWrXcwu/+iuDCZ9mvBIBpfJL+bXxMdmyeAoR8YhcQEadE0bitUp2785ZiLLp2+pV1p91b0UlJiCr1IwZOvNm4DF2pjZKVo8ql0qGI4jOJiaVXfYnW3W830N39wWm4+a7CNi0cy8Mdu/os/ZMxIvbb8H317+n3ImjrpBU1ZDRzvm9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(136003)(396003)(376002)(346002)(39860400002)(26005)(86362001)(6486002)(44832011)(6512007)(9686003)(38100700002)(2906002)(38350700002)(41300700001)(5660300002)(66476007)(83380400001)(4326008)(66556008)(1076003)(8676002)(66946007)(6666004)(110136005)(8936002)(186003)(33716001)(478600001)(6506007)(316002)(33656002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7yqiM4dBJFAA1/hpwOrp4n1yxBe1s+BIfBTLiSGgjhdN0cejisvdqMjGfSpz?=
 =?us-ascii?Q?BpCvzT3gySbBpVOL0YYUnX/t4excOCYCLMNanD/bq9puc9L/iuPXDx+t3OgK?=
 =?us-ascii?Q?H/t94aMv/998UI1c7NZfegkmLTDOcH9tx1IeuivsIUfUk/dguv8jLm1Uqn+i?=
 =?us-ascii?Q?y+/v6cKHGwhHauCa6rGNsTq4aAS5KyhLcFXpIFrhHIPx+m3L+p9VuA8jlKsi?=
 =?us-ascii?Q?FBkBap644z/TAB8GgAiwcq5SFiKCtJgv1D8itEtvNoh0jQnw9uH7WRntcQwq?=
 =?us-ascii?Q?V48OSyq1DmDkeMxs6UiEjsacO6MXNeCtcVxWMJohCRDpMxr1w32UW5v9vbJ2?=
 =?us-ascii?Q?+7jxV+j23kUiphIgk4Q1jGaOouOEoBYrM+B5hJKSjYLBQB7wpUK0xI2IExOt?=
 =?us-ascii?Q?dQ0U11CNsKrtDlBRVNjgHxwrt/2RVoYM6Geuli3IG4IMzDB8IQvhdnbLhKcV?=
 =?us-ascii?Q?8QsPKe5yvUxsNzAHb+eWCU5mS3bT3eZoLIQA5xnlpji0ehRrrsBTI9ycYVVo?=
 =?us-ascii?Q?eCT6Q8RIBR2yN6bt1bP+1rmvRv7s8wrLsdOfZF9J63o+OBPUyWeVxjNrttSO?=
 =?us-ascii?Q?sWKXA8YS+hnaURt8+fJftyM+G9fAtRjS2+uZxnhaSko/0XkgXNkS3O7kFYj5?=
 =?us-ascii?Q?yZhCIVolFPCvHTN4h8qR5m2Vbj+rsz+soknpFkiOLlE3e4aZx9RjuAFQvaJE?=
 =?us-ascii?Q?2QVEQkowX92ZvllhmtY6D7oGUr2u6U+/l8wIydoIn1ITI3mLpW/NEgPtA7zc?=
 =?us-ascii?Q?Dpdl/Nn+K/N4sWkkbU6iIcXZNipC/Od0JmP9eoR9YYUl6+GvkQWMIolBO+Bd?=
 =?us-ascii?Q?Kb/rXxc31rY0iTty/8Pi/YVGeSvSyM5P/ujFhs+ryhU6B21NPGPBsBaCpch+?=
 =?us-ascii?Q?cYMPTNfeTa57w3bCCosLLQF+RefWtIVtrYm7XR1HcnSKy9Dl87IK3YzO7iJm?=
 =?us-ascii?Q?aqw8fqVOOrVmRYRz2cpYpqa5USSZHLJDlS/NF7XvDwfll08N0Hfee+NDPx/F?=
 =?us-ascii?Q?j9DCsvZt57i+RXSi1a1UuFuq3W33oK82qw7kKYdXwuUOOS89eyyHq4Q0eUv+?=
 =?us-ascii?Q?F08xZU67pX7JBquV3PIOAOmFfjF5too3kpqxuTKcNFIUXx6pPYqJL5hkx6h+?=
 =?us-ascii?Q?KYFSCkksJl7ndaQKrVivmXx9Tt805AKvNOfseuEF1ULFwocn3e4m4bVyw4dd?=
 =?us-ascii?Q?b8Yo5RJznEX7B/+b3nDIrQQuEGbY9udw37GfAf7PYrWJ+v6C+InA8gmyhvzq?=
 =?us-ascii?Q?AsmPtfkb/5CiZshLcSejIlD1XUGft8rQEeKdsFLNwAk2HZf0lr0szTZMl6Xx?=
 =?us-ascii?Q?MiTGsacdaKV8tu+tSEi5CMEOdypdnenkDvQm41wooBUqh2fxlO1/LOIDUvf1?=
 =?us-ascii?Q?ZkjPbIPReDZZzcX6DXumY9sbRJ6H1qvbkyCzwChRhKEsb7Mx+3QwjH8F5c2R?=
 =?us-ascii?Q?4YEOsK/0jXyivBm+q457dAt9v80o2zaLOmLQyiPJenpXlc1BM/9SQqQVcvXn?=
 =?us-ascii?Q?aRmU/p3sXUJ9ZA0cLcly+MrxxHWDZ1gSedPJ0O2pHq556NFjnmjajxYZnx07?=
 =?us-ascii?Q?asBkSbaFfle9jTGoVDWOupbOwiI1ZTFd5PQh2IEBNMa/4cDubDjr711WCnEh?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9981f1e0-719b-41be-45d3-08da6f21dd55
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 16:14:07.3521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ue9Ga6sOnhwIYvV1gsK2zPcYduyOorYIlQdFoylj3XLIG/7vQfO2pTBj6YGXetTLL9XeG4iUh77dKea7rEDnNvZZDvTjW4P+E3aeTCrZbMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4479
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-GUID: vTmx0m2G7k2tWyFn9UNLB-RVA8gAwjyP
X-Proofpoint-ORIG-GUID: vTmx0m2G7k2tWyFn9UNLB-RVA8gAwjyP
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the patch.

On Tue, Jul 26, 2022 at 10:21:13AM +0200, Peter Suti wrote:
> fb_deferred_io_init depends on smem_len being filled
> to be able to initialize the virtual page lists since
> commit 856082f021a2 ("fbdev: defio: fix the pagelist corruption")
> 

This code has changed since then so the patch needs to be updated.
The patch is still necessary but the bug will look different now
because there was a WARN_ON() added.

Currently the commit message does not say how this bug looks like to the
user.  Also the use a Fixes tag.  Something like this:

The fbtft_framebuffer_alloc() calls fb_deferred_io_init() before
initializing info->fix.smem_len.  It is set to zero by the
framebuffer_alloc() function.  It will trigger a WARN_ON() at the
start of fb_deferred_io_init() and the function will not do anything.

Fixes: 856082f021a2 ("fbdev: defio: fix the pagelist corruption")
Signed-off-by:

Make sure you CC the original author (Chuansheng Liu) so they can review
the bug fix.

Google used to give good guides for how to send a v2 patch but now the
first page is just useless.  :/

regards,
dan carpenter








> Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 9c4d797e7ae4..4137c1a51e1b 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -656,7 +656,6 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
>  	fbdefio->delay =           HZ / fps;
>  	fbdefio->sort_pagelist =   true;
>  	fbdefio->deferred_io =     fbtft_deferred_io;
> -	fb_deferred_io_init(info);
>  
>  	snprintf(info->fix.id, sizeof(info->fix.id), "%s", dev->driver->name);
>  	info->fix.type =           FB_TYPE_PACKED_PIXELS;
> @@ -667,6 +666,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
>  	info->fix.line_length =    width * bpp / 8;
>  	info->fix.accel =          FB_ACCEL_NONE;
>  	info->fix.smem_len =       vmem_size;
> +	fb_deferred_io_init(info);
>  
>  	info->var.rotate =         pdata->rotate;
>  	info->var.xres =           width;
> -- 
> 2.25.1
> 
