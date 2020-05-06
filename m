Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 003C11C7312
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 16:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1C389B20;
	Wed,  6 May 2020 14:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50053.outbound.protection.outlook.com [40.107.5.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF8C89B20
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joYlYS8TrLqa/xYnwHvD9lqsJBpKd18IzX+Tsgq8EIk=;
 b=1gwfNav2A2yF5fRu3o3rEK3R0WKcp5r/BI6422o1AF+ivwLejlf5EyOMxOr3z+4qhgfErTmpLarl5NLf4aLA/8iMIb7KVP7VesFxgIaZrHUxysJtufnglXTM2ve+MbD8uSRvZ0sydNizo1whj1n/x0t6wp20zK7zFNLI1sfIx3s=
Received: from AM6P195CA0096.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::37)
 by HE1PR0801MB2041.eurprd08.prod.outlook.com (2603:10a6:3:56::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Wed, 6 May
 2020 14:41:39 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::2b) by AM6P195CA0096.outlook.office365.com
 (2603:10a6:209:86::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Wed, 6 May 2020 14:41:39 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Wed, 6 May 2020 14:41:38 +0000
Received: ("Tessian outbound 5abcb386707e:v54");
 Wed, 06 May 2020 14:41:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d2c39329414be185
X-CR-MTA-TID: 64aa7808
Received: from 74493939ba81.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 26E0D17C-F75B-4FF6-B8F7-017330DB5F86.1; 
 Wed, 06 May 2020 14:41:33 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74493939ba81.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 May 2020 14:41:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJ7kkrFEUu3NOMNhnAHLik1npZYXwd9xt2SfgIkGhwVefb1kx8YAGFW9Ukk5t1aVREFaKln7XxZNY+dyXmteWP1D98zmUYYiINhNCB6iOsc/2Pf2UO8zOi3CmnCSR6wUO5SVJ/LIw8PQIGBGpAqJSyH57IqdIbMGx0HdlkpuDylGKuZ51AWcSLSPhW8gMU4JmJJrqUUQ49DmPXQPH4ZQP6MlDmZm+6cw9F9oK2+/yHErkWqAQ+mYH4L5vSQsEDZmWvqpSpeSmuG+Mm8bD23MS7VOgv1U6wywXJnleL+hs/EvZ3MR4molMJXrig7G1Y+Xk2Bx+L3OoVWtHVS/56++ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joYlYS8TrLqa/xYnwHvD9lqsJBpKd18IzX+Tsgq8EIk=;
 b=PU87awuaCBcwyYOo9iTpAJSPTfxjBcfEmv4mA2blQFefhTYWw5w2ewPOa/tEHNZrZZRx2PNNMBqOglLEKpnpEg3D9eSllgW5C+OZJlCbSXqWr/dP7O8NCs6S6O8vlQdzxAuL3tLANLXqUuQmBH1OLN4Rhibr3isMR6lT/oNAuNlstIEL9UcE1m3O9z+6m9LodLfRyBE/eGCDZmuerePJSRmaThXiGCmdDv+X5R4BkiVsqC5jFTfupfBJynK+UcDQNlDqEJ5OtevE6+pyXNPCgPLCWnE/IMnBDrCXFVJgAfcnjG6C/i7jC27d3OAfTLMsrMfObiNMAdwL+EPcR+ovCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joYlYS8TrLqa/xYnwHvD9lqsJBpKd18IzX+Tsgq8EIk=;
 b=1gwfNav2A2yF5fRu3o3rEK3R0WKcp5r/BI6422o1AF+ivwLejlf5EyOMxOr3z+4qhgfErTmpLarl5NLf4aLA/8iMIb7KVP7VesFxgIaZrHUxysJtufnglXTM2ve+MbD8uSRvZ0sydNizo1whj1n/x0t6wp20zK7zFNLI1sfIx3s=
Authentication-Results-Original: lists.freedesktop.org; dkim=none (message not
 signed) header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=arm.com;
Received: from HE1PR0801MB1676.eurprd08.prod.outlook.com (2603:10a6:3:81::22)
 by HE1PR0801MB1980.eurprd08.prod.outlook.com (2603:10a6:3:4f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.21; Wed, 6 May
 2020 14:41:32 +0000
Received: from HE1PR0801MB1676.eurprd08.prod.outlook.com
 ([fe80::e1c6:40f:7991:f1a0]) by HE1PR0801MB1676.eurprd08.prod.outlook.com
 ([fe80::e1c6:40f:7991:f1a0%9]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 14:41:32 +0000
Date: Wed, 6 May 2020 15:41:26 +0100
From: Ben Davis <ben.davis@arm.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: drm_fourcc: add NV15, Q410, Q401 YUV formats
Message-ID: <20200506144126.GB13535@arm.com>
References: <20200422111349.1632-1-ben.davis@arm.com>
Content-Disposition: inline
In-Reply-To: <20200422111349.1632-1-ben.davis@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: SN6PR2101CA0003.namprd21.prod.outlook.com
 (2603:10b6:805:106::13) To HE1PR0801MB1676.eurprd08.prod.outlook.com
 (2603:10a6:3:81::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (217.140.106.55) by
 SN6PR2101CA0003.namprd21.prod.outlook.com (2603:10b6:805:106::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.3 via Frontend
 Transport; Wed, 6 May 2020 14:41:31 +0000
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c20530c-d5ec-4091-f0f8-08d7f1cb9595
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1980:|HE1PR0801MB1980:|HE1PR0801MB2041:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB204179B6936545F4FE602C65E5A40@HE1PR0801MB2041.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2oPwMIJbHsxyHy0XZOlGYgJ+KtyrAWCDWWceIfKSbe1PS4UjwQZ2pSU1Pyflv+v4JyA0+SfbzZI+9F/U39G4bnzCi9D+AbTStDmplvv/g/JSW6xpcxfQxq/8vNvn7OyidLK7MurGk/8Ksd/nbG3Zb+TlqlyUyRpZBVH1F82B5yLEFDW2345f8oOKQBviqPTLsvyXNIEpDy+OKjaDkcUXhHkHsDbWqI5D6ovuXpQu+RjiQZ/IkxypDvqvHvzb8rDlKNjsbUlOHvKaJV5fs9G40sHY3NMD+ccdvckf8JA/2zPxngVmQUnuqjeS8ZyACfp5egsoqzI/jLSQpVoPxqJKtihmBhHzuKlxh43MLkhPqVzsXf7JgP18ceyTfr+QsX9BTzZa5WUgjwLKnrhZYmi1dtfSQq0a+W8eAJ1OTyfIvlwRb0k0Ro8M9QuTIxd2tMZ1rqSZUkVDzZ/z5U799+KBYx+mqTG7/zrb+XvJfo6DC9f6/zXaQQAYx/++23APXScEkxmLSn+cQ40PW+zd/vlmZw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR0801MB1676.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(33430700001)(1076003)(956004)(316002)(44832011)(33656002)(478600001)(8676002)(6666004)(2616005)(5660300002)(4326008)(6916009)(16526019)(33440700001)(2906002)(52116002)(66476007)(66556008)(66946007)(6496006)(36756003)(86362001)(186003)(6486002)(8936002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: b12Iz0opWYoX7QpIv0Wk2fZJyHGgwLW1FLxFIwzlDbYY0MUMFujdBUHId+ZD07/Wh8j1fYkR8tC9ZYYdVJlhnOkPpV4c+RP7M49Y4l855I7HLdmthGHBUq++bV03vjxqPLzxaqcTxlQvjixlMdxL/OOnXkhXrjoITlVYuZCKGVYW8N99QEPC7S4KHuBvowYXFgVK7OVe6cRZjDJ93Hd7rKLnPozx4bbM3GSAHLcvWDMbZYUmWtvYXN5jV9QBHEF0Pj5e85epEUAlHIbYGUV+mskAvSSpoVc6XC+K6dHwbfTz0zp+6xdMixfVRJ9s0S7+Z0E6bAy28H++q8LuliNjQL+sON7gpARNIpSt5ep1eQsOhNJJCiyC+rkOVoCHi4tITiEiibfp7lVx6gqIBncoT5f7gZdGn0E7hDfRIqLSDYCZ4kFVlkZIQ7L2coNSXByTcE0EsribdhR9rO+CKSl3Wzfo9kYf02vu0vISgE5TP/Xgljk7YHZepVUfAaqCnbrU5PLZ09vc1wBbRPC3rgnbJspgcVxAC/uQtLkkQO8DAsN/NCWzwAkBbtbjTRMYyNvkhB2gYEZXYk2nbzqkLhu7F4eEzzXHTjc5TmQElai7iHzGEHFs1cDbRYwQDW3URZu9JvSQ+sixf9PHpzkew0GqnQayTvPR6AAH/FKCWZ6u7Ny05uUbUfmsDBdEiwbWkiFKG3Fwdm+b1hW4UprBVbXy3QVA2FwvC7BvntRHZ+EzUkeEMrj5/jU7nJtP8/hqdt4TcohRPaAHrR96si8FG0Y/MvEwfizHVziwzWC3JKUh2Wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1980
Original-Authentication-Results: lists.freedesktop.org;
 dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(33430700001)(36756003)(33656002)(316002)(36906005)(478600001)(2616005)(6496006)(6666004)(956004)(6916009)(8676002)(44832011)(47076004)(356005)(186003)(16526019)(81166007)(82740400003)(8936002)(1076003)(336012)(5660300002)(2906002)(33440700001)(70586007)(26005)(6486002)(70206006)(86362001)(82310400002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0baffffc-fdad-4042-245d-08d7f1cb9179
X-Forefront-PRVS: 03950F25EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hD97espQPqCIiO08DzUu45m+RaAIvZjJlvikuVIR7i4KJnip54LJD9xtBFXLi2WC72BjamYpxFaqkbXD7RIA2yDFMkhtoHzTJgqD/Wu8b/1IMXUG2hynpfWeP3by2NMjau0gRABHH9HhFABwOYseZvM8UGbcI812NSGeP38q6awkaPvpPE8d9POqEjiI5D51Y2o5VdSZAzGpl7BqekvXXeIf1ygOG/ZOX8e6ePNW2ndWH9aNPRzQc7YYQ5OVrL0+tpofqWUN6Gv9PYKvd9oLw0N7WglmEExWJCUH37WwI2OvzHoWvqC58vCHvgS2vI64jq2rx17l7mFz9t499pAIl5O9dTttsjP1/gnUbUp8ImqwhfQ7trkuhFlF9/R7WvZCOl1w3ocl4j2Xbq7RNed3HjFqsiVn4+baOGuNsMPUKlkEL7hbEB92twLfe8cOqkU5EGCsZn0vvLuRxOKh7cHLkJ5ZShabzsuEVQQky4fghIFhZqdwORYnGL1z9S1cbjSfxpY/ZIqGSYK0zZ86cI820v3Yh3AEKeWaraIMJvAIiQucjOqUKZObPoQziR1IQJjU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 14:41:38.5857 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c20530c-d5ec-4091-f0f8-08d7f1cb9595
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2041
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
Cc: tzimmermann@suse.de, airlied@linux.ie, liviu.dudau@arm.com,
 matteo.franchin@arm.com, nd@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all, any feedback on this patch?
Thanks, Ben
On Wed, Apr 22, 2020 at 12:13:49PM +0100, Ben Davis wrote:
> DRM_FORMAT_NV15 is a 2 plane format suitable for linear and 16x16
> block-linear memory layouts. The format is similar to P010 with 4:2:0
> sub-sampling but has no padding between components. Instead, luminance
> and chrominance samples are grouped into 4s so that each group is packed
> into an integer number of bytes:
> 
> YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes
> 
> The '15' suffix refers to the optimum effective bits per pixel which is
> achieved when the total number of luminance samples is a multiple of 8.
> 
> Q410 and Q401 are both 3 plane non-subsampled formats with 16 bits per
> component, but only 10 bits are used and 6 are padded. 'Q' is chosen
> as the first letter to denote 3 plane YUV444, (and is the next letter
> along from P which is usually 2 plane).
> 
> Signed-off-by: Ben Davis <ben.davis@arm.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 12 ++++++++++++
>  include/uapi/drm/drm_fourcc.h | 24 ++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index b234bfaeda06..0c0a65481afd 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -274,6 +274,18 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_YUV420_10BIT,    .depth = 0,
>  		  .num_planes = 1, .cpp = { 0, 0, 0 }, .hsub = 2, .vsub = 2,
>  		  .is_yuv = true },
> +		{ .format = DRM_FORMAT_NV15,		.depth = 0,
> +		  .num_planes = 2, .char_per_block = { 5, 5, 0 },
> +		  .block_w = { 4, 4, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
> +		  .vsub = 2, .is_yuv = true },
> +		{ .format = DRM_FORMAT_Q410,		.depth = 0,
> +		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
> +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> +		  .vsub = 0, .is_yuv = true },
> +		{ .format = DRM_FORMAT_Q401,		.depth = 0,
> +		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
> +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> +		  .vsub = 0, .is_yuv = true },
>  	};
>  
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d8..232b9ad3534d 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -236,6 +236,12 @@ extern "C" {
>  #define DRM_FORMAT_NV61		fourcc_code('N', 'V', '6', '1') /* 2x1 subsampled Cb:Cr plane */
>  #define DRM_FORMAT_NV24		fourcc_code('N', 'V', '2', '4') /* non-subsampled Cr:Cb plane */
>  #define DRM_FORMAT_NV42		fourcc_code('N', 'V', '4', '2') /* non-subsampled Cb:Cr plane */
> +/*
> + * 2 plane YCbCr
> + * index 0 = Y plane, [39:0] Y3:Y2:Y1:Y0 little endian
> + * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
> + */
> +#define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
>  
>  /*
>   * 2 plane YCbCr MSB aligned
> @@ -265,6 +271,24 @@ extern "C" {
>   */
>  #define DRM_FORMAT_P016		fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane 16 bits per channel */
>  
> +
> +/* 3 plane non-subsampled (444) YCbCr
> + * 16 bits per component, but only 10 bits are used and 6 bits are padded
> + * index 0: Y plane, [15:0] Y:x [10:6] little endian
> + * index 1: Cb plane, [15:0] Cb:x [10:6] little endian
> + * index 2: Cr plane, [15:0] Cr:x [10:6] little endian
> + */
> +#define DRM_FORMAT_Q410		fourcc_code('Q', '4', '1', '0')
> +
> +/* 3 plane non-subsampled (444) YCrCb
> + * 16 bits per component, but only 10 bits are used and 6 bits are padded
> + * index 0: Y plane, [15:0] Y:x [10:6] little endian
> + * index 1: Cr plane, [15:0] Cr:x [10:6] little endian
> + * index 2: Cb plane, [15:0] Cb:x [10:6] little endian
> + */
> +#define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
> +
> +
>  /*
>   * 3 plane YCbCr
>   * index 0: Y plane, [7:0] Y
> -- 
> 2.24.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
