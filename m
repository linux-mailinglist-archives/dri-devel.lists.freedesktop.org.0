Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A71D1018
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 12:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1706E0A0;
	Wed, 13 May 2020 10:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00055.outbound.protection.outlook.com [40.107.0.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E256E0A0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 10:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT12j7cDaQzxJmld7W1ghLNJKdBYmgIR3O07RNl4Kjk=;
 b=4ke+o9c7DHd5oCfPIw3O5+tHzr1PR0A0AwsmsxBKpylot23RUmio/E6CnHQ3wJbt1usGvy3ptrGjciX2jUvYqI+n4/VV6qjr/bMa2eY5UpOU1r9idiaFvy+YSBqyFPNyHug2ICdszKMbqvbjlLo5KQcMaoyhUWmD/3r4oQOgRfc=
Received: from AM5PR1001CA0052.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::29) by AM6PR08MB4738.eurprd08.prod.outlook.com
 (2603:10a6:20b:cf::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Wed, 13 May
 2020 10:44:52 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::3c) by AM5PR1001CA0052.outlook.office365.com
 (2603:10a6:206:15::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24 via Frontend
 Transport; Wed, 13 May 2020 10:44:52 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 10:44:52 +0000
Received: ("Tessian outbound e88319d7ccd0:v54");
 Wed, 13 May 2020 10:44:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36459b721cb247b8
X-CR-MTA-TID: 64aa7808
Received: from 0eeeec1c7cf1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78DB516C-4211-4C46-871D-15B3B91BC31D.1; 
 Wed, 13 May 2020 10:44:46 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0eeeec1c7cf1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 May 2020 10:44:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erHePE82A85u/oq3nYeIrBGG5aLjnW8WfBN2WU7z1GEgBJIDwV+OwMlvfpEevulTXYGGw6xkKGayzEwcnmINSfgSwuFGW8DDSLUb1WNvjfa3eha8c1WZx0tecmuEYBLppi+3ipaEACDmZ7yulHAmCBU3iY0YlW2egYZT9wh8hC8l1bMnMucLxfnhETLhzqel45PINK91cEd97uycXiOKd1MQAvxRB6TwGfr3ZsnMmOPSNYKG4HAeRkRZZFn3tEH5SK/MPZdxQ/AkDZMUq0wui56dJ1ZcSioyNntavJ+6LiVDz4QI9V5KHo7Ax7OksYnuDw0F1WrXf9x/twHhwdLBCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT12j7cDaQzxJmld7W1ghLNJKdBYmgIR3O07RNl4Kjk=;
 b=PECCM5MsEs+32dioFYz0R4AAF8jsnFP0WUggf5a0OZBm3iWhZhmnjQhZ8nZsNYxCAYAqEzK5yfoPpzFHERDwHumTsPEOf9c2VpUpPMB1CGKn2ucG4BHPYNsrAHKehFP/Z7EM6TmVgKXDNoloiUJo2tTizB2UNJoGcOh2fkTC0uGuVxTkzQb9xYQkDVOxvhydoD5FIVipmysjur6whlSUluDZkiVcCCJoa4w1FD8J3+p0zOoshMLXvgfaIyHkl2W6pmvoLx+lQ+3R016ReLpQKyNzn8ZKn4KNlQlK9sIP/GSxS8m9B/XnAAIWpJ9yxuixOu1FhVc82eNgpH3n5kimnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT12j7cDaQzxJmld7W1ghLNJKdBYmgIR3O07RNl4Kjk=;
 b=4ke+o9c7DHd5oCfPIw3O5+tHzr1PR0A0AwsmsxBKpylot23RUmio/E6CnHQ3wJbt1usGvy3ptrGjciX2jUvYqI+n4/VV6qjr/bMa2eY5UpOU1r9idiaFvy+YSBqyFPNyHug2ICdszKMbqvbjlLo5KQcMaoyhUWmD/3r4oQOgRfc=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2812.eurprd08.prod.outlook.com (2603:10a6:7:34::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.34; Wed, 13 May 2020 10:44:05 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::21af:7992:3558:1a80]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::21af:7992:3558:1a80%2]) with mapi id 15.20.2958.035; Wed, 13 May 2020
 10:44:05 +0000
Date: Wed, 13 May 2020 11:44:01 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC][PATCH 3/4] dma-buf: cma_heap: Extend logic to export CMA
 regions tagged with "linux,cma-heap"
Message-ID: <20200513104401.lhh2m5avlasev6mj@DESKTOP-E1NTVVP.localdomain>
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-4-john.stultz@linaro.org>
 <20200501102143.xcckvsfecumbei3c@DESKTOP-E1NTVVP.localdomain>
 <47e7eded-7240-887a-39e1-97c55bf752e7@arm.com>
 <CALAqxLU6kmvJ+xPCFzc3N+RNMv4g=L9bmzgE0wrOXefiGfPoHg@mail.gmail.com>
 <20200504090628.d2q32dwyg6em5pp7@DESKTOP-E1NTVVP.localdomain>
 <20200512163714.GA22577@bogus>
Content-Disposition: inline
In-Reply-To: <20200512163714.GA22577@bogus>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0418.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::22) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO2P265CA0418.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20 via Frontend Transport; Wed, 13 May 2020 10:44:02 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bed43735-b05e-4e1c-3165-08d7f72aaac4
X-MS-TrafficTypeDiagnostic: HE1PR08MB2812:|HE1PR08MB2812:|AM6PR08MB4738:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB473805C9E045522E0DF13255F0BF0@AM6PR08MB4738.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 0402872DA1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zMInwp+bMlGCdR9tW1ECY7EZALjsJAXPRDVRqxqx0cN0qmt9VCyhvhOCRz3vZB1g+gqtTloP9mcak34iuVx1YCrW39O9V4EX2ejBs4fE/I5VEpPL3o/gYtOnS1EnByYEVMxWZ0a2xKlOpRDi2qJ46FzaSe2UwjPTZtyAurOs1Gn9mECPR0746DyDcEfd4sEdPmRqseDKCDl9wR/KwQFu1J3/FyIfejW+EnQUA6bXjdUFOy9Oh5Oa6IGzcpEQe52EDPTW4ncf+1uka/d0jvoiC/nvKFKnuM9O/jyYvj4HSXCFw3v5Ad4k6x1r1zt1CmHYNWPwK3BTM7UsY7OC+26yOAcVvNsmopvuEf3tZCoKIN6B2PzCkiaeeqyXIELMuPcAQecvHv5SY/NakTLzbhQTnq83yZb/LrMLbG79pdY7SGx4O7tVjlPFewgqSXxeUjTOovMpvJlH7qY3KIQ1Tl+n/MCiKlwMPLfxleRuLbPNNqf7SWDxIQxp+IXrcOoQJ6uWg9j/HG5a+f1I1UJfHIdojnVe46TTBhztKrmFChLbgZ99SJKw33ixRb1+0txyNhox
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(33430700001)(6506007)(6916009)(5660300002)(7416002)(956004)(186003)(26005)(4326008)(16526019)(8676002)(55016002)(44832011)(8936002)(9686003)(1076003)(2906002)(54906003)(53546011)(66556008)(52116002)(316002)(66476007)(7696005)(66946007)(86362001)(33440700001)(478600001)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: uDzDpuLKwz1jGTAXC0HHowpA/Q6EU8XSFLPOycAh2YG7fvAJCtU/1THQ4qxqk2YTTLUH0Xw+98fPIlSYlgILJy1zRUwFXoAuAdxTW7/u2Rl+T2u9rZCfrR3MxqWshATkI8uLKkaATxmLEVathot3KoCQd+3gr8BVI3WrhBT6CpvOV6PVNXSk+PxCUgGw19QxezoTKcnQlEM8hz1P4yBj6ELTfELMlze49OteHPUdMjEvux0SItjdOaGAC4jIH/wgNiwlfVGegzLro/kLHHyHW9V3d569ksvwD0GcI2MnPWKSWIR867rEsKjIeKYnb2VpQy5YPHjECbrCBwNSj1dmWp57eDiM6vbhFisyG8iFC6V85r/LoU3dvoJPEY4miGxD2fUF5U3c0HxoYwnXbq+oWxJvmpktsSh2ae4dP3vpPhKoiqbuXIQFth903DEdJAIHmv3K2OBhw7QnoC6gk15FSuOe8Z4mWL0PwGC4blLbyfjX+w3S5HUAz9Oqf8WjnSVZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2812
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966005)(33430700001)(8676002)(356005)(70206006)(8936002)(478600001)(5660300002)(2906002)(316002)(33440700001)(1076003)(36906005)(82310400002)(44832011)(54906003)(956004)(9686003)(55016002)(81166007)(70586007)(6506007)(7696005)(82740400003)(6862004)(53546011)(47076004)(26005)(336012)(16526019)(86362001)(4326008)(186003)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0850e977-7095-42c7-0343-08d7f72a8dd5
X-Forefront-PRVS: 0402872DA1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YA6+UwWj34P+p4wN5RQgJ+3meCZ5zSoWIQPwpYEJ7ghuPLcfjWZBEGYZzaMlSWgPBlsXMMO6/PVMP3Fz6FrmEHTeb+G2PBPXRUYUIBlPcgfzvwbLU8VPfQyXJU+3eyF/pKuQahoW3bXhjskcneYcxGeXkYe9JtTC+YV6JXs10JLDQd4bo8nuDU/GOPHDoD0czq9XTH4OwIPZ/lStSADJD8ENvzrvu6BuoweofEG+QMLLXOv90Nf8eb1ch+9EgWU7kjDgwoneGLJOIK4zZGT0ZqAkNCzrSjwSGrgoIjz338xLdyDvVgyMPhwStEUtmH0Uf+i1G0c4CyMzM956boqgdZS77ggX3fivQdSegmL9o2x+t4DvLqv2TcOOnbp590WQGqng/HzL079etbDX/VOQuzj1hmCtQAIWWx88omjPJWYSiFiIhkI11YIgzn7ohFp1hkA1+Xs8aHdnB+OMIN1ZvRWU2Bnph5+i57MRVQfM/qyWGSHlNGT367FOKpZ9vs1NvtlHi+bCAkiiSLSuNHPIMJbS1LWVRR/Ka/TKGcul+mt8i5mgdyt0r3WVX8aZheun8T9V18zdseWQ2gvM9myZpc5C+xQ5GuRse7CwwI84IEw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 10:44:52.1026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bed43735-b05e-4e1c-3165-08d7f72aaac4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4738
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

Hi Rob,

On Tue, May 12, 2020 at 11:37:14AM -0500, Rob Herring wrote:
> On Mon, May 04, 2020 at 10:06:28AM +0100, Brian Starkey wrote:
> > On Fri, May 01, 2020 at 12:01:40PM -0700, John Stultz wrote:
> > > On Fri, May 1, 2020 at 4:08 AM Robin Murphy <robin.murphy@arm.com> wrote:
> > > >
> > > > On 2020-05-01 11:21 am, Brian Starkey wrote:
> > > > > Hi John,
> > > > >
> > > > > On Fri, May 01, 2020 at 07:39:48AM +0000, John Stultz wrote:
> > > > >> This patch reworks the cma_heap initialization so that
> > > > >> we expose both the default CMA region and any CMA regions
> > > > >> tagged with "linux,cma-heap" in the device-tree.
> > > > >>
> > > > >> Cc: Rob Herring <robh+dt@kernel.org>
> > > > >> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > >> Cc: "Andrew F. Davis" <afd@ti.com>
> > > > >> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > > > >> Cc: Liam Mark <lmark@codeaurora.org>
> > > > >> Cc: Pratik Patel <pratikp@codeaurora.org>
> > > > >> Cc: Laura Abbott <labbott@redhat.com>
> > > > >> Cc: Brian Starkey <Brian.Starkey@arm.com>
> > > > >> Cc: Chenbo Feng <fengc@google.com>
> > > > >> Cc: Alistair Strachan <astrachan@google.com>
> > > > >> Cc: Sandeep Patil <sspatil@google.com>
> > > > >> Cc: Hridya Valsaraju <hridya@google.com>
> > > > >> Cc: Christoph Hellwig <hch@lst.de>
> > > > >> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > >> Cc: Robin Murphy <robin.murphy@arm.com>
> > > > >> Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > >> Cc: devicetree@vger.kernel.org
> > > > >> Cc: dri-devel@lists.freedesktop.org
> > > > >> Cc: linux-mm@kvack.org
> > > > >> Signed-off-by: John Stultz <john.stultz@linaro.org>
> > > > >> ---
> > > > >>   drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++---------
> > > > >>   1 file changed, 9 insertions(+), 9 deletions(-)
> > > > >>
> > > > >> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > > > >> index 626cf7fd033a..dd154e2db101 100644
> > > > >> --- a/drivers/dma-buf/heaps/cma_heap.c
> > > > >> +++ b/drivers/dma-buf/heaps/cma_heap.c
> > > > >> @@ -141,6 +141,11 @@ static int __add_cma_heap(struct cma *cma, void *data)
> > > > >>   {
> > > > >>      struct cma_heap *cma_heap;
> > > > >>      struct dma_heap_export_info exp_info;
> > > > >> +    struct cma *default_cma = dev_get_cma_area(NULL);
> > > > >> +
> > > > >> +    /* We only add the default heap and explicitly tagged heaps */
> > > > >> +    if (cma != default_cma && !cma_dma_heap_enabled(cma))
> > > > >> +            return 0;
> > > > >
> > > > > Thinking about the pl111 thread[1], I'm wondering if we should also
> > > > > let drivers call this directly to expose their CMA pools, even if they
> > > > > aren't tagged for dma-heaps in DT. But perhaps that's too close to
> > > > > policy.
> > > >
> > > > That sounds much like what my first thoughts were - apologies if I'm
> > > > wildly off-base here, but as far as I understand:
> > > >
> > > > - Device drivers know whether they have their own "memory-region" or not.
> > > > - Device drivers already have to do *something* to participate in dma-buf.
> > > > - Device drivers know best how they make use of both the above.
> > > > - Therefore couldn't it be left to drivers to choose whether to register
> > > > their CMA regions as heaps, without having to mess with DT at all?
> 
> +1, but I'm biased toward any solution not using DT. :)
> 
> > > I guess I'm not opposed to this. But I guess I'd like to see some more
> > > details? You're thinking the pl111 driver would add the
> > > "memory-region" node itself?
> > > 
> > > Assuming that's the case, my only worry is what if that memory-region
> > > node isn't a CMA area, but instead something like a carveout? Does the
> > > driver need to parse enough of the dt to figure out where to register
> > > the region as a heap?
> > 
> > My thinking was more like there would already be a reserved-memory
> > node in DT for the chunk of memory, appropriately tagged so that it
> > gets added as a CMA region. 
> > 
> > The device's node would have "memory-region=<&blah>;" and would use
> > of_reserved_mem_device_init() to link up dev->cma_area to the
> > corresponding cma region.
> > 
> > So far, that's all in-place already. The bit that's missing is
> > exposing that dev->cma_area to userspace as a dma_heap - so we could
> > just have "int cma_heap_add(struct cma *cma)" or "int
> > cma_heap_dev_add(struct device *dev)" or something exported for
> > drivers to expose their device-assigned cma region if they wanted to.
> > 
> > I don't think this runs into the lifetime problems of generalised
> > heaps-as-modules either, because the CMA region will never go away
> > even if the driver does.
> > 
> > Alongside that, I do think the completely DT-driven approach can be
> > useful too - because there may be regions which aren't associated with
> > any specific device driver, that we want exported as heaps.
> 
> And they are associated with the hardware description rather than the 
> userspace environment? 

I'm not sure how to answer that. We already have CMA regions being
created from device-tree, so we're only talking about explicitly
exposing those to userspace.

Are you thinking that userspace should be deciding whether they get
exposed or not? I don't know how userspace would discover them in
order to make that decision.

Thanks,
-Brian

> 
> Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
