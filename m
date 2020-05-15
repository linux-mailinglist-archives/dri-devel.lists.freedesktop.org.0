Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3031D49AB
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D3F8920D;
	Fri, 15 May 2020 09:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB80891EB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1eVtPJdOfak8LUKZ90gMOGASb8ujGDAuzC7EcQvvxA=;
 b=n4g1dPvnQerVoJdDk5Kpc3Uw67yq5AYbGmHrxHP3Rwd0mt23QCRN5t/gvbIS2mDounPReMjIRScxJyZ7Xqzy/1NE92rLCs5r+QpOr/OwgnY6hJqV4WE6nikA881vo1gjGguSuIX5FaiffjgShMq0mbTsukyq5BwUFWNB+sbPDe0=
Received: from DB6PR1001CA0008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::18)
 by AM6PR08MB3943.eurprd08.prod.outlook.com (2603:10a6:20b:a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Fri, 15 May
 2020 09:32:41 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::2e) by DB6PR1001CA0008.outlook.office365.com
 (2603:10a6:4:b7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Fri, 15 May 2020 09:32:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Fri, 15 May 2020 09:32:41 +0000
Received: ("Tessian outbound b3a67fbfbb1f:v54");
 Fri, 15 May 2020 09:32:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e383358394b59448
X-CR-MTA-TID: 64aa7808
Received: from e9153ab57fc6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DFB3491D-EF13-411F-8C1B-AAB3CDFC3F87.1; 
 Fri, 15 May 2020 09:32:36 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e9153ab57fc6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 May 2020 09:32:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wza82cE5h5ZWP3h2XRO9zs6EkKdBRvJeETYJCKqYXlchwydv71olSoVzhzJPEvV6w+zG1sqpj7UwEgY/ha+2PQ8mblujGMCGC8+MEoy398rwUrO3mO9SPgSpNA//NAp3DducaPQ9aOj+1sU6abzJStVDW2NluWR04Piqk/MHMEOuIybeXlVf19qPgdqqb7AO1H2JoS9GOFIZGWGu5qMWqsw1mivdmBl6wePs47h/2VhXARDCsCnnTKqfRW8d3Ze9b5NGB3idzGRpBNamjBcrUAMGzZxMe8fkeV7jsZZWlQ9/LBPNMM+iEtkO61cRQ4Bypqy4KwgqU0PPet/EbYgj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1eVtPJdOfak8LUKZ90gMOGASb8ujGDAuzC7EcQvvxA=;
 b=IyCt+e+JCvhBY+LBT9GJPFsBbGf1JodQ6UHPezQu8pq8bh9F+JmwnnywJ43MlRANjuMbydAxsG+vG9RE4uBAjWgj2TJ78KLonanJRH8FSsqFBjS3HVJFlIlBM9cd8NnWCSr/0tGI38OYPPaWhPimoQdFW3Rl7kVuzbdxTT2BHS2zLYnWixBeB17gDekXvpKfI7PYxT4LPQDO22YMxza8wfjopkUcbjXC//GRg91CoMk4GPSmah3rpywtx6sFNyhW7RYTA7D8QadGjZz61XnH6ye1ynU+ksBQQMY5N15jUq+SHHX1Uh179t+8s3birpYdTw+i6NjcpJPh7GgrFjQQOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1eVtPJdOfak8LUKZ90gMOGASb8ujGDAuzC7EcQvvxA=;
 b=n4g1dPvnQerVoJdDk5Kpc3Uw67yq5AYbGmHrxHP3Rwd0mt23QCRN5t/gvbIS2mDounPReMjIRScxJyZ7Xqzy/1NE92rLCs5r+QpOr/OwgnY6hJqV4WE6nikA881vo1gjGguSuIX5FaiffjgShMq0mbTsukyq5BwUFWNB+sbPDe0=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2921.eurprd08.prod.outlook.com (2603:10a6:7:30::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.34; Fri, 15 May 2020 09:32:32 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::21af:7992:3558:1a80]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::21af:7992:3558:1a80%2]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 09:32:32 +0000
Date: Fri, 15 May 2020 10:32:29 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC][PATCH 3/4] dma-buf: cma_heap: Extend logic to export CMA
 regions tagged with "linux,cma-heap"
Message-ID: <20200515093229.bibu5etvfrdlrhsi@DESKTOP-E1NTVVP.localdomain>
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-4-john.stultz@linaro.org>
 <20200501102143.xcckvsfecumbei3c@DESKTOP-E1NTVVP.localdomain>
 <47e7eded-7240-887a-39e1-97c55bf752e7@arm.com>
 <CALAqxLU6kmvJ+xPCFzc3N+RNMv4g=L9bmzgE0wrOXefiGfPoHg@mail.gmail.com>
 <20200504090628.d2q32dwyg6em5pp7@DESKTOP-E1NTVVP.localdomain>
 <20200512163714.GA22577@bogus>
 <20200513104401.lhh2m5avlasev6mj@DESKTOP-E1NTVVP.localdomain>
 <CAL_Jsq+V-YA9B7i+9U0as3oXNC=HLPHmZ2NrPzNJu5CXpvD3tg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+V-YA9B7i+9U0as3oXNC=HLPHmZ2NrPzNJu5CXpvD3tg@mail.gmail.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0308.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::32) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.1.208.173) by
 LO2P265CA0308.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.26 via Frontend Transport; Fri, 15 May 2020 09:32:30 +0000
X-Originating-IP: [82.1.208.173]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e5428c30-0f69-46c0-a913-08d7f8b2ea4b
X-MS-TrafficTypeDiagnostic: HE1PR08MB2921:|HE1PR08MB2921:|AM6PR08MB3943:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB394300B648F8566892FEA60FF0BD0@AM6PR08MB3943.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: NKzk5khuMDIemVQuoeYoENrAbLHq3Hpeo2gRKN6vmFsYC1xU+vooC9Ivx4bsqwWuFUMlM0H7Yub2p2OFrZppkSlVqrPZzZcN8CYvMkQ+Qn2U/TGjdWc4gj1H8kOrd9mEXYEAgZvEM76dmL9q8bJZ2XlIGlsyL4uUd/OIDAdtKQ+BlYu13a7oKqISeh2uUpmz+C07JMDKWxIsZHp/It7B9qNkSr1LNcNbH51uAU9F5qEieWatsgjk/laV3Eyiiw7z/dnZPR2osLWbyXNck1gwMRDFytGFaFDjqYFxyTtBM20r6yANXoQuQl1AxWVkCOC5z/TigLlFyfZ7SBeKlBSfMfxAYojKMJr2jer38pT6cE2k2EG80ZCXfmiZo/gbgWKKL8mOYhxXHN5EEco6+8SaJ7eQUGVOS2ffvogvM8uOHFQWqKfHyOmL1f5hLTHuwWb3PF7wZl/MKP+SMFOUUlJ3Wl3J/S0SEFw8Sa8/pYKnQAWRJfn/Y4ExQ20s+bh5q4uO
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(1076003)(6916009)(8936002)(86362001)(66946007)(66556008)(186003)(54906003)(7416002)(16526019)(956004)(66476007)(55016002)(9686003)(478600001)(6506007)(7696005)(53546011)(8676002)(316002)(52116002)(2906002)(44832011)(4326008)(26005)(5660300002)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: fN6g2wvY+kQGqfVYzukC3huo+PGdxIeyOewBKsrg/s82Mk1AoC2NmSzAYVzbuurElLMVfWrZTeJmNTczo09V4iRZIMbiRNhGN+VmgFokPp/P3ZeT2wmC0z8LSbr2QPpYt+lzJRv/O+CwT4DAoLeipF9z3SFpLcKNMdyzTQqWc19KFq3o3RgAYYee5+5SMYqM1OiwZuYHN1JqXmt42FwPW1v+ZyEKnkT+QoSoBd4bBJwFeQxYTrHknu9y8CMLOyq13aFsqPWdad+xt65gGl9E1Gbxk7DflMt7uaT4SXNhRqXyXff/OHILVG6xsKmiC9c4TQ32SNLn7X39/lWjP9u0ItK6uFVCiSyn9E2TeiCgj9GPqZXvEXILozz3URcDyUrTdnOE6/ebGFvBa1yXnM3CaPUy/gzwDtQ9IiQ+VN5ZlNoLBBWHNCwruKkN8AXzqdQvGhmFSrci1+MW0iI2zUOCCjNDpxmomb4/YzMehXw4E2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2921
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966005)(47076004)(2906002)(4326008)(6862004)(356005)(316002)(5660300002)(81166007)(82740400003)(82310400002)(54906003)(53546011)(7696005)(6506007)(1076003)(336012)(186003)(86362001)(44832011)(16526019)(55016002)(26005)(8936002)(8676002)(956004)(70586007)(9686003)(70206006)(478600001)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 75b2492b-b0b0-470a-0c9c-08d7f8b2e49b
X-Forefront-PRVS: 04041A2886
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uphWMKZmYbR8SaX4yfC7P2kxhnIeDWqqHRM/og6v0SiPblCPDC1NBfHiuKxqFtR/c4rGX6SqNeAPNON1ZEjfK99euN7Fd3/n13pzLgiNkhF2736JdP3xc9kK+aHT2dQ2eekEVO25DUMrTCRqLm1VkeNmIv7g+qJ4Qs/MplD9rx1HFz8+BK3jmKsziGpSR7K/1hjpAXDeWDYaLB8BDw4TIe2C5MkD6dQiLO0hCe5m7Ktm2+CAxLNQdb0bXp9z0I4Y+g+DIU2NK/F02+0AUncITjXYFzEQKCD2n28docvr0fswnZixgwPmxq+f1XAHREkbVlW7Z/V0ZqhFgR5Ox+pdNuGcBobrhAHmkGiLfST0e41n7g8bGmEJFaVTBOW3bGY5vKIeDb3bCVVBv9qIEo/3HRRrR1MGpZCM/zNlt/kRmwxhzzS2WfJNGPCmkOpcIiWIglkAeBusmszqQi2z6/iRhu2142oXc3btRyRT5kEcH3VOMrMrtCy1TD2xjt5v22FIarqGJhuV/oDw4TVkweVn8zzG0T6qNXBgIq9bOrpgyEk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 09:32:41.4838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5428c30-0f69-46c0-a913-08d7f8b2ea4b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3943
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
 Christoph Hellwig <hch@lst.de>, Pratik Patel <pratikp@codeaurora.org>,
 Chenbo Feng <fengc@google.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>,
 linux-mm <linux-mm@kvack.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 09:52:35AM -0500, Rob Herring wrote:
> On Wed, May 13, 2020 at 5:44 AM Brian Starkey <brian.starkey@arm.com> wrote:
> >
> > Hi Rob,
> >
> > On Tue, May 12, 2020 at 11:37:14AM -0500, Rob Herring wrote:
> > > On Mon, May 04, 2020 at 10:06:28AM +0100, Brian Starkey wrote:
> > > > On Fri, May 01, 2020 at 12:01:40PM -0700, John Stultz wrote:
> > > > > On Fri, May 1, 2020 at 4:08 AM Robin Murphy <robin.murphy@arm.com> wrote:
> > > > > >
> > > > > > On 2020-05-01 11:21 am, Brian Starkey wrote:
> > > > > > > Hi John,
> > > > > > >
> > > > > > > On Fri, May 01, 2020 at 07:39:48AM +0000, John Stultz wrote:
> > > > > > >> This patch reworks the cma_heap initialization so that
> > > > > > >> we expose both the default CMA region and any CMA regions
> > > > > > >> tagged with "linux,cma-heap" in the device-tree.
> > > > > > >>
> > > > > > >> Cc: Rob Herring <robh+dt@kernel.org>
> > > > > > >> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > > > >> Cc: "Andrew F. Davis" <afd@ti.com>
> > > > > > >> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > > > > > >> Cc: Liam Mark <lmark@codeaurora.org>
> > > > > > >> Cc: Pratik Patel <pratikp@codeaurora.org>
> > > > > > >> Cc: Laura Abbott <labbott@redhat.com>
> > > > > > >> Cc: Brian Starkey <Brian.Starkey@arm.com>
> > > > > > >> Cc: Chenbo Feng <fengc@google.com>
> > > > > > >> Cc: Alistair Strachan <astrachan@google.com>
> > > > > > >> Cc: Sandeep Patil <sspatil@google.com>
> > > > > > >> Cc: Hridya Valsaraju <hridya@google.com>
> > > > > > >> Cc: Christoph Hellwig <hch@lst.de>
> > > > > > >> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > > > >> Cc: Robin Murphy <robin.murphy@arm.com>
> > > > > > >> Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > >> Cc: devicetree@vger.kernel.org
> > > > > > >> Cc: dri-devel@lists.freedesktop.org
> > > > > > >> Cc: linux-mm@kvack.org
> > > > > > >> Signed-off-by: John Stultz <john.stultz@linaro.org>
> > > > > > >> ---
> > > > > > >>   drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++---------
> > > > > > >>   1 file changed, 9 insertions(+), 9 deletions(-)
> > > > > > >>
> > > > > > >> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > > > > > >> index 626cf7fd033a..dd154e2db101 100644
> > > > > > >> --- a/drivers/dma-buf/heaps/cma_heap.c
> > > > > > >> +++ b/drivers/dma-buf/heaps/cma_heap.c
> > > > > > >> @@ -141,6 +141,11 @@ static int __add_cma_heap(struct cma *cma, void *data)
> > > > > > >>   {
> > > > > > >>      struct cma_heap *cma_heap;
> > > > > > >>      struct dma_heap_export_info exp_info;
> > > > > > >> +    struct cma *default_cma = dev_get_cma_area(NULL);
> > > > > > >> +
> > > > > > >> +    /* We only add the default heap and explicitly tagged heaps */
> > > > > > >> +    if (cma != default_cma && !cma_dma_heap_enabled(cma))
> > > > > > >> +            return 0;
> > > > > > >
> > > > > > > Thinking about the pl111 thread[1], I'm wondering if we should also
> > > > > > > let drivers call this directly to expose their CMA pools, even if they
> > > > > > > aren't tagged for dma-heaps in DT. But perhaps that's too close to
> > > > > > > policy.
> > > > > >
> > > > > > That sounds much like what my first thoughts were - apologies if I'm
> > > > > > wildly off-base here, but as far as I understand:
> > > > > >
> > > > > > - Device drivers know whether they have their own "memory-region" or not.
> > > > > > - Device drivers already have to do *something* to participate in dma-buf.
> > > > > > - Device drivers know best how they make use of both the above.
> > > > > > - Therefore couldn't it be left to drivers to choose whether to register
> > > > > > their CMA regions as heaps, without having to mess with DT at all?
> > >
> > > +1, but I'm biased toward any solution not using DT. :)
> > >
> > > > > I guess I'm not opposed to this. But I guess I'd like to see some more
> > > > > details? You're thinking the pl111 driver would add the
> > > > > "memory-region" node itself?
> > > > >
> > > > > Assuming that's the case, my only worry is what if that memory-region
> > > > > node isn't a CMA area, but instead something like a carveout? Does the
> > > > > driver need to parse enough of the dt to figure out where to register
> > > > > the region as a heap?
> > > >
> > > > My thinking was more like there would already be a reserved-memory
> > > > node in DT for the chunk of memory, appropriately tagged so that it
> > > > gets added as a CMA region.
> > > >
> > > > The device's node would have "memory-region=<&blah>;" and would use
> > > > of_reserved_mem_device_init() to link up dev->cma_area to the
> > > > corresponding cma region.
> > > >
> > > > So far, that's all in-place already. The bit that's missing is
> > > > exposing that dev->cma_area to userspace as a dma_heap - so we could
> > > > just have "int cma_heap_add(struct cma *cma)" or "int
> > > > cma_heap_dev_add(struct device *dev)" or something exported for
> > > > drivers to expose their device-assigned cma region if they wanted to.
> > > >
> > > > I don't think this runs into the lifetime problems of generalised
> > > > heaps-as-modules either, because the CMA region will never go away
> > > > even if the driver does.
> > > >
> > > > Alongside that, I do think the completely DT-driven approach can be
> > > > useful too - because there may be regions which aren't associated with
> > > > any specific device driver, that we want exported as heaps.
> > >
> > > And they are associated with the hardware description rather than the
> > > userspace environment?
> >
> > I'm not sure how to answer that. We already have CMA regions being
> > created from device-tree, so we're only talking about explicitly
> > exposing those to userspace.
> 
> It's easier to argue that how much CMA memory a system/device needs is
> h/w description as that's more a function of devices and frame sizes.
> But exposing to userspace or not is an OS architecture decision. It's
> not really any different than a kernel vs. userspace driver question.
> What's exposed by UIO or spi-dev is purely a kernel thing.
> 
> > Are you thinking that userspace should be deciding whether they get
> > exposed or not? I don't know how userspace would discover them in
> > order to make that decision.
> 
> Or perhaps the kernel should be deciding. Expose to userspace what the
> kernel doesn't need or drivers decide?

If not via device-tree how would the kernel make that decision? For
regions which get "claimed" by a device/driver, obviously that driver
can make the decision, and I totally think we should provide a way for
them to expose it.

But for something like a shared pool amongst the media subsystem,
there may not be any specific single device/driver - and creating a
dummy driver with the sole purpose of exposing the heap doesn't seem
like an improvement over a simple "linux,cma-heap".

Cheers,
-Brian

> 
> It's hard to argue against 1 new property. It's death by a 1000 cuts though.
> 
> Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
