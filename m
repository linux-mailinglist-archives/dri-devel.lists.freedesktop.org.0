Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1981C1102
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 12:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6C36E233;
	Fri,  1 May 2020 10:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60081.outbound.protection.outlook.com [40.107.6.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843B86E233
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 10:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNtEUQI/36QeG0QKk0rcflx1RIAYz3xEJWtTjP/t91U=;
 b=1IxB2sCFgsSLFwjd4mVpM2ph0Are6bS+Q2jbDgma5X3ZRq2XNIvzTpUiZKUIMYhKw+9dru0SInOQeDADl/5GeF7mYgvCTMCdQdMeV8f3F/68gedISre/ECStLYbY0h0DzJsT2e7XH7WWxMo93je9xoQ9DuQk2+jv51TZ1d5PfQ8=
Received: from AM6PR08CA0022.eurprd08.prod.outlook.com (2603:10a6:20b:b2::34)
 by VI1PR08MB4430.eurprd08.prod.outlook.com (2603:10a6:803:ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 1 May
 2020 10:42:26 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::9b) by AM6PR08CA0022.outlook.office365.com
 (2603:10a6:20b:b2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Fri, 1 May 2020 10:42:26 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 10:42:26 +0000
Received: ("Tessian outbound 4cdf5642225a:v54");
 Fri, 01 May 2020 10:42:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 413210b7ca8a1f83
X-CR-MTA-TID: 64aa7808
Received: from 63e2167dd4f1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11D8CBB9-C324-4ECB-B27C-E7FB4A77C5BB.1; 
 Fri, 01 May 2020 10:42:20 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 63e2167dd4f1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 May 2020 10:42:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltTo/AB0RXj77d63F9oKY0/gNUSzBXdRuygumjhijCmA7f4UX6sbr9TqcdY8JBe5Awhh1tbKMg4NF19hsr0XEEtG+cpxt63qKnQ84kTvBw1ABv7rcTZHCpcF0JSSv1URzsXs8nNTIMG6GZfJSDVL25gFng/5TcgfpAQ9sJHIcgUF8y7FhqeK+YPZJyRVdz8MvZK31g/2TmUpJmNeHZ0FO/x4/DcvEL0PlkszRUWFZOQ/etV6Hh+yZaMifcEvASdBeDg+U7XpXqSJ+8TtaCD3oKh783JR6VOb8rr4sxmPjegjNdLl0oftfv/uLgSdfSXUCBnbfMpVGcbyiBWim9xVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNtEUQI/36QeG0QKk0rcflx1RIAYz3xEJWtTjP/t91U=;
 b=eRW8bQSiEg/gaUZFFinJGw95k6wgTWOWffHia32pcVV3Sqg8TEIj/DlmaRIsAUA50Eqy8TI0MUVh5gSXV7T+tPHcETo4Ju5gncNcHvvRt6Cq0pmTNZBMm4K4XFD/fOVaobYZL5HZP06yRrNq4LXj4EZuqpYWBXeX1Fq9siMavcR3ryTM22oERXmKX4jaO/AynUFkH05mWS6m/mF6Tx2s0MEtbvNwAOvAkMa+jkY705Dm2XuxQ+FnqBsHhUZpP3UGTz+E7TvHGJYPEZwO8wRrIwoHEK9WGY3sCvJqUSB8cr6wFoAGFBZe4UElWhAc4aojPhNg+aTFwmKVM+3WTySIpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNtEUQI/36QeG0QKk0rcflx1RIAYz3xEJWtTjP/t91U=;
 b=1IxB2sCFgsSLFwjd4mVpM2ph0Are6bS+Q2jbDgma5X3ZRq2XNIvzTpUiZKUIMYhKw+9dru0SInOQeDADl/5GeF7mYgvCTMCdQdMeV8f3F/68gedISre/ECStLYbY0h0DzJsT2e7XH7WWxMo93je9xoQ9DuQk2+jv51TZ1d5PfQ8=
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (2603:10a6:20b:85::14)
 by AM6PR08MB3112.eurprd08.prod.outlook.com (2603:10a6:209:46::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Fri, 1 May
 2020 10:42:17 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d%3]) with mapi id 15.20.2958.027; Fri, 1 May 2020
 10:42:17 +0000
Date: Fri, 1 May 2020 11:42:16 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 1/4] devicetree: bindings: Add linux,cma-heap tag
 for reserved memory
Message-ID: <20200501104216.4f226c2a7bzval5o@DESKTOP-E1NTVVP.localdomain>
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-2-john.stultz@linaro.org>
Content-Disposition: inline
In-Reply-To: <20200501073949.120396-2-john.stultz@linaro.org>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0147.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::15) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.1.208.173) by
 LO2P265CA0147.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.27 via Frontend Transport; Fri, 1 May 2020 10:42:16 +0000
X-Originating-IP: [82.1.208.173]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 177f06b4-b0f3-4905-7695-08d7edbc56e3
X-MS-TrafficTypeDiagnostic: AM6PR08MB3112:|AM6PR08MB3112:|VI1PR08MB4430:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4430F002FA5943E720B7705AF0AB0@VI1PR08MB4430.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 0390DB4BDA
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3829.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(44832011)(86362001)(55016002)(6916009)(186003)(2906002)(5660300002)(1076003)(4326008)(54906003)(7416002)(316002)(8936002)(26005)(8676002)(52116002)(66476007)(66556008)(478600001)(7696005)(66946007)(6506007)(9686003)(956004)(16526019)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: GeLbvZ5GKnRLQ+DQMiNJ5K6mGWI55ym4qL128swDGro9bWVpHv6RVDr0393cdPy76zODHsWeZmJxy7+3qE1czObKKuEgu5ErbEZyj2wShI1qU2bLKD9hBJb7CUTeRks/vf95iOJeN/iSoYCfKt7ENahJwh0Pn2+zfdBiVwduqdjHGnq063q44ImpwXubSXUT/gfJPLN5/d84ya5I9aJPO/mjq6OoXwvaYcerVASxt9QDmlXlSn4Yk1KycQ0Rg6wKxpWNg9lM6sMBDbr7Lt8sGIXvn5jKVrePtAj15y6a/Z2xYOkow/8MXMalk0ogHoIh2Fv7/i3G9ugYXdhKutPCWG1KiRWszDnUV5mnLYApAUEU2qwiJQs5D0qZcb6v7ZSmr7pjxpG/AOOBl0C136w86FgsKaeKolsockoQKnlJdkIgvu2enbbyg/zFAQD9Ye6Q+KMQnlEz0VEYYf287Q00yhWWkc631oOSLBgXKbxEAsZzVxa1mzxUR/IqFpx6StSW
X-MS-Exchange-AntiSpam-MessageData: v1fGfe4rETbOV2BNMZx4jpkyAd2A9wPBeq6iSEAMF3KS4s379D6vUsec/pqSQ09KNfUHWc9farkqR/SdpsvqBde/UGo3MhA/gP7nYbdgkLkOS1Me1hYNv8eVvIjH9NvXM1vkLWiuCEZ5kJy3SX1lm/92iGA1uIlhuctGrLAfDI3g6ujZMxdIHjpHVw9ZwpF7ucYEgoxI4nGi4PBThRivCCbyGo4IKxrWGhtImiJJ2U7K0o5JZLeCH/aLkRAZt01I8Q0CHMxQiy74Rs/CPXaMRGYiTrez7FqH7N2eGv9aA8qHxrZC/IZDfP3/hOkmMkslZnvnoOy0QMf5N2CYXr2iv9CUhjwqtjEXhmFW9cA5z+lUEAyjiNEchnLW2Ne2iJInuPqarpLso7v+TF9PL9VBJoL9UJCxOJ5uAUa9sUiDisOPmQ4A0HLzRd05SzNwNVAvARq0wNlfQSzjmhr1b6/YCAGajxbJLBtA6UJwgyKt77eftPGKo900gAYyVYLU5wTvMZMMABZOy6nzuWCw3tzoBYmDdD+cjC+zfKe71qLyEqVHTFu2cLUeVn9UVnClXVH67MhOQCys1N63/VODyIogf0bO9GcFIHTQ9BgEKwK2FxReuoqOaNy9lm71KMbUi5KQELGld9gP2rZOIlIC7VGiYK9A5DonVVyPQBnHCmnAt5gvpLXpXtTpeYgMw4asCS8Uxe0CYwgw+ST1GuOa9/g68tEof1vI+RQthH37s4WhLRf9Yzzfb8TpzvXn4Otq9ms8A0I1/mtUFzLhEFImaNq7f5SM1RSfM268e/8Vz6BSxFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3112
Original-Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966005)(186003)(82740400003)(16526019)(5660300002)(8936002)(316002)(81166007)(26005)(47076004)(6506007)(8676002)(9686003)(55016002)(356005)(82310400002)(1076003)(956004)(7696005)(44832011)(478600001)(54906003)(70206006)(70586007)(336012)(2906002)(86362001)(6862004)(36906005)(4326008)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e22157a5-6c38-4ed2-0540-08d7edbc5153
X-Forefront-PRVS: 0390DB4BDA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dAJ+AyxlWmxeBMjRrCsCyP/quo+bELRoFKC53P1DXgXaHwWBccRHSVSkpXz4QqXk2VlfNj4Pggkc+tHMdp4nWOb/0mpFO7EofLw52DmayebxjU9xsYNLb3ZaQYT6iWc7wv4hResGJXTMUbYT0ATAZUEmpkoktter994iciwIDt11SI5ed7+yHGvkBl7Vkl7cxZLVPP7Z/GZPc3p48JLfDgL9u7FLdhTqSEAtKmfS/04Xkp9xa2F0C1eeeGWsnlmi+4NUvmfCjs2An7fMtztIA208yLKPb9zjTfkm7wbuR4+WxeSK+CCIzdIMCZSr/mi2IIZQcYxGfsaqxgZrcP9mnt6gYQy36W1m/K1EJVGTERMwSxAlVnG7Z8vfJF/t9eAQw3ou3a+tHq5WgtGVGC707KWrt26XhvVTqMv84I0bNBOmG8+SKgeqido5ndefnUYZj54sd7emZdOucMeFpM4duGyx30FMCO863DjISdZE+XYt5ilCQttdu3X+lXXa1/hOrrBQAci++pGKC4GGlbrqan761rsa1Gn9v8UYXrYXU34=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 10:42:26.2787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 177f06b4-b0f3-4905-7695-08d7edbc56e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4430
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
Cc: devicetree@vger.kernel.org, nd@arm.com,
 Alistair Strachan <astrachan@google.com>, Sandeep Patil <sspatil@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, linux-mm@kvack.org,
 Rob Herring <robh+dt@kernel.org>, Christoph Hellwig <hch@lst.de>,
 dri-devel@lists.freedesktop.org, Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Pratik Patel <pratikp@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 01, 2020 at 07:39:46AM +0000, John Stultz wrote:
> This patch adds a linux,cma-heap property for CMA reserved memory
> regions, which will be used to allow the region to be exposed via
> the DMA-BUF Heaps interface
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Andrew F. Davis" <afd@ti.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Pratik Patel <pratikp@codeaurora.org>
> Cc: Laura Abbott <labbott@redhat.com>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Chenbo Feng <fengc@google.com>
> Cc: Alistair Strachan <astrachan@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mm@kvack.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  .../devicetree/bindings/reserved-memory/reserved-memory.txt    | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> index bac4afa3b197..e97b6a4c3bc0 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> @@ -68,6 +68,9 @@ Linux implementation note:
>  - If a "linux,cma-default" property is present, then Linux will use the
>    region for the default pool of the contiguous memory allocator.
>  
> +- If a "linux,cma-heap" property is present, then Linux will expose the
> +  the CMA region via the DMA-BUF Heaps interface.
> +

Would it be useful or even possible to give some indication of what
the heap will end up being called? I'm afraid I don't remember what if
any conclusions came out of previous discussions on UAPI for heap
enumeration.

I suppose CMA names haven't been relevant to userspace before, but
they perhaps would be with this change.

Alternatively, leaving it effectively undefined doesn't tie us down,
and something like links in sysfs can be added as a richer API in the
future.

Cheers,
-Brian

>  - If a "linux,dma-default" property is present, then Linux will use the
>    region for the default pool of the consistent DMA allocator.
>  
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
