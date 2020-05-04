Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9541C353F
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 11:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24206E364;
	Mon,  4 May 2020 09:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150081.outbound.protection.outlook.com [40.107.15.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC7A6E35D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 09:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=me03ZDsFYyyUDzA23dGXx6iBVPgSmnXSn0KWN4Dd3EM=;
 b=28u1SGw5rJWQb9jhV37HkHEhDp1xKLwup0mAM0Aq+H7RryGPw/LCt/CevpHHzReQzoHUClOQWQypNfPDepJlGuC21gy2NDPCgwSaE5bAnKudmrhW38ikElxv0kWVNqiy2Gb7Nsh1jglAXuzkngm3W6xAP6DKm11s/TmBxvfXr9o=
Received: from AM5PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:206:1::14)
 by DBBPR08MB4267.eurprd08.prod.outlook.com (2603:10a6:10:cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Mon, 4 May
 2020 09:06:38 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::26) by AM5PR04CA0001.outlook.office365.com
 (2603:10a6:206:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Mon, 4 May 2020 09:06:38 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Mon, 4 May 2020 09:06:37 +0000
Received: ("Tessian outbound 4cdf5642225a:v54");
 Mon, 04 May 2020 09:06:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b360b976e1bbede9
X-CR-MTA-TID: 64aa7808
Received: from 1bcda96b86ba.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 390088F8-F9AF-4029-90E4-6893A561AB32.1; 
 Mon, 04 May 2020 09:06:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1bcda96b86ba.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 May 2020 09:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoQyfqoVL30oSmA9a1Q6JjSQLfnCnVUahKRZh9LPEyeAMQQrAL+TXS+29mhR/6QFv/UIt7UEuM5suVp1/zMedDASaeYkpvQL1J2w40uAdFDCeENWejm+9CKaPadQ6J4pzSpNJs5Nghj8xwYg7muLJXQi7NEq2dhIbdQ+FBo1XNopwkCuLmlPzubkxOX179K9LuXxXURP4JIB9lddRBU1+Nphfo0A4cpZZnNEMNDlHX5rxEoEcaYqEe87ygkN3UzB74rchtqbjcnC8B84WEkGd9/nSbjleCyX7s/0ocJB+A4ba3Sf34rKIBEErwhw035/iLRVC/E9koNk0jSVrrU29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=me03ZDsFYyyUDzA23dGXx6iBVPgSmnXSn0KWN4Dd3EM=;
 b=OJnDsOpkUhfOQG4uj3W5TOw9bdAE+bGLYrk+zQ2gTN9vnGX7WlmDWkbdsEXhkle1kJKXki32jeivCvTgN2zO/DFusCYXW5qTZkL8f/3xtQFnLP+CVginSUcaEKJQdJgjboO0ixoq+/ZCMou3NY0Wgh/PX0wjvlXgSThmJ96tT6S0SxU9NdqIulIX6FQn0FL0WBVkZoWX1TUnijMEM2Uy/sZfOJ2HwYr3oPQvPUNigdLx8w+4kHOFXncVdVDtt0sZE5mlv/1GAuv6KoJTwrU4bDfnYGERG4PPtVBiSRjujS2G5XL4Xz0bnf56Sf8/t5z++52F+OjfhFJa/vdQMtx2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=me03ZDsFYyyUDzA23dGXx6iBVPgSmnXSn0KWN4Dd3EM=;
 b=28u1SGw5rJWQb9jhV37HkHEhDp1xKLwup0mAM0Aq+H7RryGPw/LCt/CevpHHzReQzoHUClOQWQypNfPDepJlGuC21gy2NDPCgwSaE5bAnKudmrhW38ikElxv0kWVNqiy2Gb7Nsh1jglAXuzkngm3W6xAP6DKm11s/TmBxvfXr9o=
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (2603:10a6:20b:85::14)
 by AM6PR08MB4262.eurprd08.prod.outlook.com (2603:10a6:20b:b4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Mon, 4 May
 2020 09:06:28 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d%3]) with mapi id 15.20.2958.030; Mon, 4 May 2020
 09:06:28 +0000
Date: Mon, 4 May 2020 10:06:28 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 3/4] dma-buf: cma_heap: Extend logic to export CMA
 regions tagged with "linux,cma-heap"
Message-ID: <20200504090628.d2q32dwyg6em5pp7@DESKTOP-E1NTVVP.localdomain>
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-4-john.stultz@linaro.org>
 <20200501102143.xcckvsfecumbei3c@DESKTOP-E1NTVVP.localdomain>
 <47e7eded-7240-887a-39e1-97c55bf752e7@arm.com>
 <CALAqxLU6kmvJ+xPCFzc3N+RNMv4g=L9bmzgE0wrOXefiGfPoHg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CALAqxLU6kmvJ+xPCFzc3N+RNMv4g=L9bmzgE0wrOXefiGfPoHg@mail.gmail.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::32) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.1.208.173) by
 LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Mon, 4 May 2020 09:06:27 +0000
X-Originating-IP: [82.1.208.173]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 98e9a7e2-0b54-426b-f8c7-08d7f00a7395
X-MS-TrafficTypeDiagnostic: AM6PR08MB4262:|AM6PR08MB4262:|DBBPR08MB4267:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4267DC105A6AF06D8F850C7DF0A60@DBBPR08MB4267.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 03932714EB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zPp3U3FEfsKFX7a9HESOO4JYYUae2MCPEeZbO0oeUZvohxp4UEUzbT+Kd+JZYAxN1qkNS8ibuIlDxrpXK9uBJVVDJrxk66DnYCbOk5rag4XhLiglzUbmhzcLI+kZWDvyWDe9QjH4dT+pT3CVkqRWJfH2dDtEUisgPV+Ct9rhH2ur7cZw9fhB1qSbBAAHqUnWdBfl2aAz2mbT93+WHBGjhK7Wg2eQd88eFlIxKacVLA4QOR4uvbBK8fUSzQLK1XfGM+Y3ruaM0uk8grPUPwVhYy5JC8yY8UueHt4VJNiiHqxkJo1jFJI8sFSAjPy6YO/1J5FDHhRuWKCj6LhXYR94BPFdhOmsEs5w1ygSgzrTuzVF1S/CTA28T8gXDyoEmL6lfKlJZlNqDyWbNEuNo0tBI3i36TQtTgJ9d+fIHQzekHlfkl5ocSJVcYY1J/9oNAvfxeiXlRGMv5iM/OFvUtT9eKViMM3Rk4Fl0UXtcjGZ1CDQuxGJOHzBcskcXY5A3i6k
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3829.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(86362001)(55016002)(2906002)(6916009)(478600001)(8936002)(9686003)(5660300002)(8676002)(6506007)(66946007)(956004)(53546011)(7416002)(186003)(26005)(16526019)(1076003)(52116002)(7696005)(66556008)(66476007)(4326008)(54906003)(44832011)(316002)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: sT9mVsWfaq0GWQLx5SCmDh2PZAKCVxGVOa/HtbFPMiQkmM/jLPFfCz/od7+jwvM25EL8lcL++dW4N9i0YLOxrWE9/sbpfdOJ6VUEUAx3KxsHASJNlD0DUtA1nt4kyKxVr8c6g0jBmix14lZoRCwmTjTURMMpkvJ4oZVCi+HWlu6SGbrGL6kxI1uLYWvIxceWO5xcdeCxRLRhzVvAIGGES06vbNNSP1uHF9mAVH39ZqoXIzejdJq7G8yLVFM9ctuFSZ96Q/WW5T3xxnYhszjaDAurxc0SDrFK0w4JFXiCr6LeQA505FcOb3xtSCMyTNYVXTkbFtgSfv4M3aZYRSqp7eopCPH7r23VIop3hOZPbF0F3JdDHpqevFHX3uCjuCC83hwDwjRaNJlDoBBaYu+GXrHpFZNb6XLtyIDoMHrYQTzqw0vqa+QhJqST+1Ng+tO1wBQUBDDLWZSCkg15nmdWxImU0Ec+Yd5ioNA4T1HQHxqMHz6xzJezUCkGVjdQJgW1+uAK0jGy4fIeg8ZSCg6jQ5v4pkhHuIH5L4GAUKGw1my7eNlti81CwqN/sZ+wNwS9CG7on74aklo1PcunO8O2WEawjmRFj3ZGbe+7pWT7XUJ1L8HdQvGy4aIuzYYHVMUXUiUt1apqxyrE95VSelLJRwmKoCGmCgSC8ssqPOBRSfl+eUyxpWDrmtEMZpu9QEl4sF8HAcsl1/pvDSeZCCB4VcED60TCFLtDVecLJNCJOysw+kNjL5VmOKwfFMB2wzN77rEL3ymSho0FxDrOOREpx2pCfidaqncU9YxhcKCFDBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4262
Original-Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966005)(186003)(16526019)(81166007)(1076003)(356005)(26005)(5660300002)(82740400003)(86362001)(70586007)(478600001)(2906002)(53546011)(336012)(956004)(6506007)(6862004)(7696005)(47076004)(4326008)(54906003)(316002)(82310400002)(8936002)(44832011)(36906005)(55016002)(9686003)(8676002)(70206006)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d4c63e69-87bf-49ea-0be7-08d7f00a6e0c
X-Forefront-PRVS: 03932714EB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IuYLDDtLlv/htUceet2DQOLzA/DbzTddF3iuQYw0+nT0fMZO+Pxu0F9vCLQSVJoSTs7qIPbTRbnFfmrkWt+Si15CxU7WQqpAJiT8AE9Eic8DDRkC4IHz8cL/Y4fDWHEnEFFrVdXRMIOHXoSdMCH20y2VaI9xpX+GRDmQ/wEEwa0dJcZz2ofK/mI/B2BRXNQegsGUt46FoqrQZvKZFJ0zFYTVVFe4HqvjkcdCpI3397pKglpE/p357NHPvC0FcZJ3Dg7blFq+DXXykIUyJImhqI5TlktQMM3ehPMat2gM6679CkYw9kmPChGFdkQrrz9t5HInHRc3Fy9gbo2QPRQm6QXmy1fbZazPvEgpgLfF++1cl2mEDEtnRV7TKsJYerTIQb23Ax1Hd2Z8DsDkjL8N/KdlkHQrMfgkML9kCJ9t8iFoa1cJ9zaOxAEvn9e+HqtTJP1gDp84zJcePDOHJQY335+Uv1yw/r2y5xvJlwGpLYLgRI83sIqmNdp+skG+S+pqfBnj6Y85RexdHFMkVi1c4QA7kyEW4gMJyD4zfatRitM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2020 09:06:37.4922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e9a7e2-0b54-426b-f8c7-08d7f00a7395
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4267
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, nd <nd@arm.com>,
 Alistair Strachan <astrachan@google.com>, Sandeep Patil <sspatil@google.com>,
 Pratik Patel <pratikp@codeaurora.org>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, linux-mm <linux-mm@kvack.org>,
 Rob Herring <robh+dt@kernel.org>, Christoph Hellwig <hch@lst.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 01, 2020 at 12:01:40PM -0700, John Stultz wrote:
> On Fri, May 1, 2020 at 4:08 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 2020-05-01 11:21 am, Brian Starkey wrote:
> > > Hi John,
> > >
> > > On Fri, May 01, 2020 at 07:39:48AM +0000, John Stultz wrote:
> > >> This patch reworks the cma_heap initialization so that
> > >> we expose both the default CMA region and any CMA regions
> > >> tagged with "linux,cma-heap" in the device-tree.
> > >>
> > >> Cc: Rob Herring <robh+dt@kernel.org>
> > >> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > >> Cc: "Andrew F. Davis" <afd@ti.com>
> > >> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > >> Cc: Liam Mark <lmark@codeaurora.org>
> > >> Cc: Pratik Patel <pratikp@codeaurora.org>
> > >> Cc: Laura Abbott <labbott@redhat.com>
> > >> Cc: Brian Starkey <Brian.Starkey@arm.com>
> > >> Cc: Chenbo Feng <fengc@google.com>
> > >> Cc: Alistair Strachan <astrachan@google.com>
> > >> Cc: Sandeep Patil <sspatil@google.com>
> > >> Cc: Hridya Valsaraju <hridya@google.com>
> > >> Cc: Christoph Hellwig <hch@lst.de>
> > >> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > >> Cc: Robin Murphy <robin.murphy@arm.com>
> > >> Cc: Andrew Morton <akpm@linux-foundation.org>
> > >> Cc: devicetree@vger.kernel.org
> > >> Cc: dri-devel@lists.freedesktop.org
> > >> Cc: linux-mm@kvack.org
> > >> Signed-off-by: John Stultz <john.stultz@linaro.org>
> > >> ---
> > >>   drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++---------
> > >>   1 file changed, 9 insertions(+), 9 deletions(-)
> > >>
> > >> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > >> index 626cf7fd033a..dd154e2db101 100644
> > >> --- a/drivers/dma-buf/heaps/cma_heap.c
> > >> +++ b/drivers/dma-buf/heaps/cma_heap.c
> > >> @@ -141,6 +141,11 @@ static int __add_cma_heap(struct cma *cma, void *data)
> > >>   {
> > >>      struct cma_heap *cma_heap;
> > >>      struct dma_heap_export_info exp_info;
> > >> +    struct cma *default_cma = dev_get_cma_area(NULL);
> > >> +
> > >> +    /* We only add the default heap and explicitly tagged heaps */
> > >> +    if (cma != default_cma && !cma_dma_heap_enabled(cma))
> > >> +            return 0;
> > >
> > > Thinking about the pl111 thread[1], I'm wondering if we should also
> > > let drivers call this directly to expose their CMA pools, even if they
> > > aren't tagged for dma-heaps in DT. But perhaps that's too close to
> > > policy.
> >
> > That sounds much like what my first thoughts were - apologies if I'm
> > wildly off-base here, but as far as I understand:
> >
> > - Device drivers know whether they have their own "memory-region" or not.
> > - Device drivers already have to do *something* to participate in dma-buf.
> > - Device drivers know best how they make use of both the above.
> > - Therefore couldn't it be left to drivers to choose whether to register
> > their CMA regions as heaps, without having to mess with DT at all?
> 
> I guess I'm not opposed to this. But I guess I'd like to see some more
> details? You're thinking the pl111 driver would add the
> "memory-region" node itself?
> 
> Assuming that's the case, my only worry is what if that memory-region
> node isn't a CMA area, but instead something like a carveout? Does the
> driver need to parse enough of the dt to figure out where to register
> the region as a heap?

My thinking was more like there would already be a reserved-memory
node in DT for the chunk of memory, appropriately tagged so that it
gets added as a CMA region. 

The device's node would have "memory-region=<&blah>;" and would use
of_reserved_mem_device_init() to link up dev->cma_area to the
corresponding cma region.

So far, that's all in-place already. The bit that's missing is
exposing that dev->cma_area to userspace as a dma_heap - so we could
just have "int cma_heap_add(struct cma *cma)" or "int
cma_heap_dev_add(struct device *dev)" or something exported for
drivers to expose their device-assigned cma region if they wanted to.

I don't think this runs into the lifetime problems of generalised
heaps-as-modules either, because the CMA region will never go away
even if the driver does.

Alongside that, I do think the completely DT-driven approach can be
useful too - because there may be regions which aren't associated with
any specific device driver, that we want exported as heaps.

Hope that makes sense,
-Brian

> 
> thanks
> -john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
