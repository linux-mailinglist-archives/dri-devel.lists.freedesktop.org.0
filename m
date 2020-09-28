Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D180B27AFA5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 16:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4719089B83;
	Mon, 28 Sep 2020 14:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F1889B83;
 Mon, 28 Sep 2020 14:06:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMvS2ruEOWVMXX+MGdqw2IL50/r4QW8gjK0M7t9JKA+6vhAQ1AxOxm32zpo5jDDTQD8+zH+IYpJkJ+V7oasKxV6w/97zwcxYl1XziEE8gvwdKpEaTqLdq2928A2hAIbfWEcfMNs+2wlSzPHpeHX4SOvqDBITeU8313plJxdF2BFkd8ZDzsxvgUXDgV7GOj3LeG6/w/msEhVjF0fIjaUfmq3VAlHKEixu3nLbpqrqHTxOQf8T8f8kfMlxX8juys7x73OySUNRbH25HuBd6sHt2LuXoVEQ9nmuYWSq7E32VA9i+Vn4Gtp/5IVhTq9wCKKCl+HZQwkEsH/VbELFDTHHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPWvSJUAyf8GwGHwa+rnB/qZSxhHqosapsoqZZOm4g4=;
 b=brCQ6RFPXl08DM2S3JxeoQe/23LznpWctJwnzHb1fsCyXi3YkdQSnFW076Nw+I1MD39VlruCY4yBdyiumEGc9g8sqG03LLyIuzZoXrCJ472eXImBOMpDTKXQvxnr720LXpm1i51BmDB6CsFsBf/93xsRIIBRbSXHbRlMyJikVGtICXaUOiQzpCXxUZzrCKp832kwpGyJdDpNxCJiWtD83lbONLXCPmMweV5JJAt+0mjvfqIxS97T6kfBiSgyyqOSVv9089nT1rcK75QH3IlgPEBXhuzJiuy7rDtpU+hDMhD8xHOmgu0/XT1cAyiCAij+qDVTxJ8PR1R3nO06cH7unA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPWvSJUAyf8GwGHwa+rnB/qZSxhHqosapsoqZZOm4g4=;
 b=CU4oGcY+4LAPZmXQ64wy2/nbJmvqkO5ms3Hj2g8jGFDfEWpO4H4UfNFswCiMdCIkgcLpI4242AfNK9zEtIITU1rNYMVL1L3moIH5wfplZ3o1mIfm0JqxBGau8qhjE3cYuCm2QUCdYbyV/V43Lv6SyEQeGy7FVCSVQUDlFkfSDkg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR12MB1293.namprd12.prod.outlook.com (2603:10b6:300:9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Mon, 28 Sep
 2020 14:06:06 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe%2]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 14:06:06 +0000
Subject: Re: [PATCH] drm/amd/display: make get_color_space_type() static
To: Jason Yan <yanaijie@huawei.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200928023641.90932-1-yanaijie@huawei.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <41625a2c-d859-6ff1-cb03-08d97d606131@amd.com>
Date: Mon, 28 Sep 2020 10:06:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20200928023641.90932-1-yanaijie@huawei.com>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN0PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:408:e4::29) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.4.135] (165.204.84.11) by
 BN0PR02CA0024.namprd02.prod.outlook.com (2603:10b6:408:e4::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.23 via Frontend Transport; Mon, 28 Sep 2020 14:06:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3da2a449-35bb-4cc4-b017-08d863b7a420
X-MS-TrafficTypeDiagnostic: MWHPR12MB1293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB129380486EC6AADAB26129E68C350@MWHPR12MB1293.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUXgr634d4n2cuFsYLWvnSWdjtTnkrOKbXnLnm2lnr/DBC5to1WWny+9OX8tOp0yV3uAZXTRtqpRkFDlbEkZE7SmiiLZ9OKcVXkeMVooF7ov+151GFWPbrHTTPh7mnjVvEmSwyYZsxRVA/FRSUd0qEdZOZ331HhSM+k+vVvdVKaBr+lB4d7s49k7OX9sZq7/qXATlDyxP4gEffpi2WcsfEs6mnrXwSYv736HVKqG++yIbwmayp2B/BzTDIajld3/5Ax6NZBx/8x25uaa6hjAhQK/nrkuvzrswxg3trWZQu4kpEmnHr5FrB1yxgV1j8WRugFcADxvn78FOXMx0UUIQ8b1KTa99tWhdecrnan5W8YfDH2lP0hdXbg53D7mhDswsC252wn/zTyUbXmpeXf2ix27geKJ2QCMS6v2wc344Fm5UvOBHgtzwmo1gogATFDM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(8936002)(316002)(6486002)(16576012)(86362001)(8676002)(44832011)(66556008)(36756003)(53546011)(52116002)(83380400001)(2906002)(66476007)(5660300002)(478600001)(16526019)(31696002)(6666004)(31686004)(956004)(2616005)(66946007)(186003)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: kVi1AkqF5bqhHqK9v/oMXMmm4X1OAyx5Wo/2thCD20wer7wyJjCAjj/RMV2iEJnsTqJxh/NC+yf5Mm91YRYGudL2uiBXCMOLQ7eOh9L0djKQDQ6KrK6AwWxs5QK53yT5hieuG7PaSKTD8/Z4Tpw/jCU7Vkuiw4YXNM0Q1lPHls4dLmtf+ez8Rq+H/nd0g9jQNucb65SkEWiPWVdip1Tfr/+D0LVhQuO4++SUA2ISK7Yp/qCD6THfRXGGlYETIt2yeTscBnv8Yd+KCEU3vrWuFV9WH0hy934UlRUOW4+kFXuNJoBmVWNJ5xnkuxg0LNvZu/fRyLgqCSqf0xnA3Uw7C/peQP7oCTW4vzJ5SNUbELPlq+rrIpaDWuziNoLY0CGUNcSBa5VhVck8Urh5iwpYJXiRGk2WWjRzfthcX7DgFx1hhQZkK4zyYSdfIuWZ9tpUkxMFn2Ah5oyKDIONEkHruHrbBBCgW3Pj05j9TOMpPWHrgFtK0wJiBPi2/+4tYSNk4FXJSCzp4OMlKr1lqeekL+9SFDOJokVZdb13wSpo092ULCOplF2dAf27RleoWh5/ZqanGXHMDmQqdUOuCpDaqrDFd+iZx19SVvQZuykWGhWtOMePXDnY8mJkoNPicBS64QEc40ZgYiGryvC5TDvrSg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da2a449-35bb-4cc4-b017-08d863b7a420
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 14:06:06.0160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGj+wqM5iFfJEOfkpjrzAj8UgMxygpLUoOO7aRdSZvuOe5Lur1Max+YkLs/xqOyKtcxrHb/9YcCy2qUc147a9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1293
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-27 10:36 p.m., Jason Yan wrote:
> This addresses the following sparse warning:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:180:26:
> warning: symbol 'get_color_space_type' was not declared. Should it be
> static?
> 

If you have multiple fixes of the same or similar nature in the same
subsystem (e.g. drm/amd/display) I would prefer a single patch to fix
all of them. These really only need separate patches if they go outside
a subsystem.

I see a lot of these tiny static checker patches from Huawei and while I
appreciate small patches I feel these are needlessly small.

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> index c026b393f3c5..2a9080400bdd 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> @@ -177,7 +177,7 @@ static bool is_ycbcr709_limited_type(
>  		ret = true;
>  	return ret;
>  }
> -enum dc_color_space_type get_color_space_type(enum dc_color_space color_space)
> +static enum dc_color_space_type get_color_space_type(enum dc_color_space color_space)
>  {
>  	enum dc_color_space_type type = COLOR_SPACE_RGB_TYPE;
>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
