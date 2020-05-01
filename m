Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE521C10C1
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 12:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D266EC3D;
	Fri,  1 May 2020 10:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA1E6EC3D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 10:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bFt/YSuPZ1GdsBCmdZ2CeasT3vR7OsD9EdH0NLeQEg=;
 b=McN6Y2ziAclg4vIIQe/dZ59Zyq1IvtmHnqWZNVqP50HV+ztkNv1tc8h8HC+Y+2goGEUCwjL+YeIC568Cs6+9PaJ3vrmIBY88yyPiksSwOaSS2vEuiOxlnjE+IsskVvDaT2oW3KFRsEkI7LXo+YlnYfZaQrYBRuwplRfRAaqVHAU=
Received: from MR2P264CA0048.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::36) by
 DB6PR0802MB2536.eurprd08.prod.outlook.com (2603:10a6:4:a2::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.22; Fri, 1 May 2020 10:21:53 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::e6) by MR2P264CA0048.outlook.office365.com
 (2603:10a6:500::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Fri, 1 May 2020 10:21:53 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 10:21:52 +0000
Received: ("Tessian outbound e88319d7ccd0:v54");
 Fri, 01 May 2020 10:21:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29a0d038b367c97b
X-CR-MTA-TID: 64aa7808
Received: from 6f3b2fe72522.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9708DBC2-C762-4AD2-9BC8-608F74154E3E.1; 
 Fri, 01 May 2020 10:21:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f3b2fe72522.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 May 2020 10:21:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqYENF8SoN6XEcOa4Tw8PLnfFFGI9hK9x/kW5LCUCnK/TGPk9naIgje/UN8UZp09GbYQFDjXl43kHKmVyJau0093YzAjmS13+Pu1wokUhfRfnL9N3UHitph7wVUUaWFxFvwg5wjX/LXuSTNbk1xHGh2yzf/T99kvK0Mx16J2a0xA5l3EcRRCq+Rnr1h40NoFgT4x1+uqxoiXeESDH9ZTCdvsw6EpH4HIOUOLaMeN3b7Rq3O0sU4VmJKICPnAu3EtL5NQBfHbAKSAo/DUV+IEiGEAvqZ4pPIotOQUE0OR3dtpImsqIQDSzRXNYMputXiVRbkPtAcuRt7PfPklgpEFmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bFt/YSuPZ1GdsBCmdZ2CeasT3vR7OsD9EdH0NLeQEg=;
 b=CaDf+s0Ey3wh8zUJWiB0g0QcPse3boeqGXSMX2C/EfHiomkrTK/BO3hmdUP9QGpqhuY/3XC2sR4Pz1/nkuFpacPTdbwXD82qdMSZ0WNr4kldm+iry8e3SgsFODUAd5LKB0VXHg2flWrVfKAqbch03iiz4t1GO1DNVgzCoYwDHW8x9Ix68TAoVLGZlIPS6NVdZ/yLVzi98c1AzoAE/rT/nIj65ZbSkQojR/NCewv1SywbtPaTHOZGR1teqcUU+yz+nKtcSFUa7Z8QJiY8nIae3WaVtjCIzPxmSAFAB/W4Q0VUK5SEDa1SBLtoXiw8BRPFZp5HMUDgZGefp9MnyLDxAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bFt/YSuPZ1GdsBCmdZ2CeasT3vR7OsD9EdH0NLeQEg=;
 b=McN6Y2ziAclg4vIIQe/dZ59Zyq1IvtmHnqWZNVqP50HV+ztkNv1tc8h8HC+Y+2goGEUCwjL+YeIC568Cs6+9PaJ3vrmIBY88yyPiksSwOaSS2vEuiOxlnjE+IsskVvDaT2oW3KFRsEkI7LXo+YlnYfZaQrYBRuwplRfRAaqVHAU=
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (2603:10a6:20b:85::14)
 by AM6SPR01MB0041.eurprd08.prod.outlook.com (2603:10a6:20b:29::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 10:21:44 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d%3]) with mapi id 15.20.2958.027; Fri, 1 May 2020
 10:21:44 +0000
Date: Fri, 1 May 2020 11:21:43 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 3/4] dma-buf: cma_heap: Extend logic to export CMA
 regions tagged with "linux,cma-heap"
Message-ID: <20200501102143.xcckvsfecumbei3c@DESKTOP-E1NTVVP.localdomain>
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-4-john.stultz@linaro.org>
Content-Disposition: inline
In-Reply-To: <20200501073949.120396-4-john.stultz@linaro.org>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0293.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::17) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.1.208.173) by
 LO2P265CA0293.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 10:21:42 +0000
X-Originating-IP: [82.1.208.173]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a431673b-668f-4a98-2535-08d7edb977c0
X-MS-TrafficTypeDiagnostic: AM6SPR01MB0041:|AM6SPR01MB0041:|DB6PR0802MB2536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB25362BE45F675B6BD216CA2BF0AB0@DB6PR0802MB2536.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-Forefront-PRVS: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: gEbRJMvyaSoud/C1/IHSIHIinS+A0QpoNgC7nbMVWBT+EojWxI0VphW7gHktIc3jYwM7uZKvUNFNAxwnFr2cF7haCJDUyg/Hd2ZUZxWVkVMMriu1aMe00zL85Pp08hQnZoUGVSJFhRxpdthOAsTYsh5AuAoDAPwaRNrqC5L5uKTVWSEOoMGT+P/t0WF2TiNnagKJHcKhzf7eHBhFrGxfFyGEzHvDs6kcZ2p7PxjzZv1VahOO8L+PQZQRXESIHW0qvORnYZEwiHpfwYCM889QXf7teQNumIWAWC0XeX9LHK+G/5cCwrNEjqODzsGp1olJV+HPGghw3ix/Cd/yZOeOl16M655yDF04XNkEU+dFEf/RZDMofb1dTJL7v+/PBljjsb5lypafh2R7Hbn8D1BM5+uHNyepUPryLLgtEskHjwtw0T3GbjU3Q7eYjUC3/N5dQW+3rFct/af+88Kd+JNgkVeUpH2ZSPFq9a90cb9SMhi1Lm2K5Bd8KuQ5BDkMvpLM/ijNn7P5p54tGSglVDsg9A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3829.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(44832011)(26005)(55016002)(66476007)(66946007)(66556008)(186003)(1076003)(5660300002)(4326008)(7696005)(316002)(8676002)(86362001)(6916009)(6506007)(52116002)(7416002)(2906002)(8936002)(9686003)(966005)(956004)(54906003)(478600001)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: n8aSPr1PZZoXnwqv3uvcu2gpzeV/ytbmejNje8WY0bWDioh4dNJDzh6MT7E5AWrwM8SA+W9NGqtGTtuyLlgMkf9yK/HNG/ZNLk71qXLCsyldK93QfYIksuJBsc2zvETpJu68laKcjhD7Li/oSxNH5LCBz6PmXRJvpqQhlFI2oPHgPxLbI6DtXJqPkthoTlYrZiWu3R0z1ZqrMFwyIMJ73rt/P4XbnERmRb6G/HF1FDpWkbRl3uq3UAAhq/PPxx7ffj+2QpyxJNWM4Fk7vB9QqeL7LeOXjtXdCyPVXnONblkRG3hwHHm9N/fOVMCqTfn6eU46spjHDqC2wwq4k6FrD3O+7+6cvjy/5JDqiyKhx9omYxyGsj0h+Yzi6y//laRJMD2ruiaJVOiliQ1pqSfy2SIK0LTn3KC+tg6sLJZ3XvNNcjFbaDfXGbPGWkSwLghMVHaH9SyLlz3+LhI2JXCH71gkb/l1VVV81qVpltIs84SkHVUwIhGaeTeb2dsGeJA+S1e6mu5E2K8NS3YQQOYdUmQ2jOvSOVHZUWHUDhU/zpqIp16Jl7ziU5mnLNA//HXZXCu+mfxflzJiiphFSJDoA4bjZDBK4Wvkl4To0yym8imApZhy1g/wFI7XTEYH9z4dYa0aM0kyWuTmHr7b/fv181pYa2hefqF0AbLEiqRTG3b+cI3fAObwSs+eeFHzuDhR2NYVYC9a6RLPI4pteGxpJbNv56uaUyCZQ48Zc+9FeNXwQbx7bh9k6I4MrDzFd3QP9o7bTB5EYcJhKBgyAR6152iwvTCvgNHhn6Jao2Vaafg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6SPR01MB0041
Original-Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966005)(2906002)(5660300002)(82310400002)(86362001)(956004)(966005)(478600001)(7696005)(47076004)(82740400003)(4326008)(44832011)(81166007)(6506007)(356005)(70206006)(70586007)(6862004)(36906005)(316002)(336012)(8936002)(16526019)(55016002)(186003)(9686003)(26005)(8676002)(1076003)(54906003)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2aedde36-fd95-4d7b-a561-08d7edb97227
X-Forefront-PRVS: 0390DB4BDA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mivFMbHceWfjt20ZXLgtOXmk0vI8UfPPeUMNO99lBLSm8CWxeLZWuNLdhIr952xcp0Cm1BqcaveDUe+BDNaQkTO6VxTvNY0jdHfmwVuOBYyHKYvTKu+aNR9w3fpQYd3Z2J6tQ4/zQrkUpZzqX7+BwphLeP2G2RxxndlMuQrd20KjqQ/QaE2610+SU0eBZFc9xHH25pmJB873FQYor9IoeBEq5WS8t2J845s+pD001SrdF7rLsNa2LRw4YYtl5HNXFD/QIp5AZJFEc3rAHO6Rkpc5t/yX9dwrkIeG1DoqYsWnn7fohpzW9K5Ve5B8voploUG4KzMapm+ibtkBMJfOr+3LUHJo42uynWdvK1yVwxSOFh6KIOVWiPuAseEmzFIzBCUl3QNU7I0dGZk0xQLwPlrBpMDVd6L8ju8yvmm37bbjqb+AgocYo/Tmmz6wySV8JGWidLhf4yQK85w/NAEv6MjgdP0Y/rlCLbc7IUm+/BqrDAE9KE8/aiTm0dSOEyTolZ0iHdr7uQB7yZApzlgPjwyvvIldWYp11FK/Bw6D98lDSr0RI1ubCPUbEjoS3IcJ20/AE7ssk2LFUOy4FOxPdA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 10:21:52.8955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a431673b-668f-4a98-2535-08d7edb977c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2536
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

Hi John,

On Fri, May 01, 2020 at 07:39:48AM +0000, John Stultz wrote:
> This patch reworks the cma_heap initialization so that
> we expose both the default CMA region and any CMA regions
> tagged with "linux,cma-heap" in the device-tree.
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
>  drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 626cf7fd033a..dd154e2db101 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -141,6 +141,11 @@ static int __add_cma_heap(struct cma *cma, void *data)
>  {
>  	struct cma_heap *cma_heap;
>  	struct dma_heap_export_info exp_info;
> +	struct cma *default_cma = dev_get_cma_area(NULL);
> +
> +	/* We only add the default heap and explicitly tagged heaps */
> +	if (cma != default_cma && !cma_dma_heap_enabled(cma))
> +		return 0;

Thinking about the pl111 thread[1], I'm wondering if we should also
let drivers call this directly to expose their CMA pools, even if they
aren't tagged for dma-heaps in DT. But perhaps that's too close to
policy.

Cheers,
-Brian

[1] https://lists.freedesktop.org/archives/dri-devel/2020-April/264358.html

>  
>  	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
>  	if (!cma_heap)
> @@ -162,16 +167,11 @@ static int __add_cma_heap(struct cma *cma, void *data)
>  	return 0;
>  }
>  
> -static int add_default_cma_heap(void)
> +static int cma_heaps_init(void)
>  {
> -	struct cma *default_cma = dev_get_cma_area(NULL);
> -	int ret = 0;
> -
> -	if (default_cma)
> -		ret = __add_cma_heap(default_cma, NULL);
> -
> -	return ret;
> +	cma_for_each_area(__add_cma_heap, NULL);
> +	return 0;
>  }
> -module_init(add_default_cma_heap);
> +module_init(cma_heaps_init);
>  MODULE_DESCRIPTION("DMA-BUF CMA Heap");
>  MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
