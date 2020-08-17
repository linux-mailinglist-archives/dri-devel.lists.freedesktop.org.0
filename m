Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562DB246943
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 17:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822798910D;
	Mon, 17 Aug 2020 15:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70085.outbound.protection.outlook.com [40.107.7.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665828910D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYfsDhRgQD1ezeY9lyqwFHKEgg63uYc9MnXLOTCfo5U=;
 b=rE621ZBiGUgc7D9OSafpwR8Gcu72W73K9vE0/Kg7hAfnftPIohx0yOb0CEQl8/WxIwCL6Nu9F69twEG9kiayFnmcdCwdp6xWa4tizmvBZFp3xMvLAhXKNAHPp3jX2YS/6gSw0umO3dym8Gy29WDc53F5/QPYyE1f3PSuSPkT9BQ=
Received: from AM5PR0601CA0063.eurprd06.prod.outlook.com (2603:10a6:206::28)
 by AM0PR08MB4050.eurprd08.prod.outlook.com (2603:10a6:208:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Mon, 17 Aug
 2020 15:18:25 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::33) by AM5PR0601CA0063.outlook.office365.com
 (2603:10a6:206::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Mon, 17 Aug 2020 15:18:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Mon, 17 Aug 2020 15:18:24 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Mon, 17 Aug 2020 15:18:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff04bc9e4037ae8d
X-CR-MTA-TID: 64aa7808
Received: from 4c7cfde8b51b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D06A1DBB-E818-45F2-A810-0C7D9A117804.1; 
 Mon, 17 Aug 2020 15:18:18 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c7cfde8b51b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Aug 2020 15:18:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBe73S8micziosyBYCIbS4sECEbKfsIcH8WZ0phcPBtwyAZOuPP8OgTMBu0mqU14RublNQ4UH/XDbzoaSGdPXe8LHzZhYnEE4DeDBGNJIVpiAY5HQCvl9zdrVKi18kOQHx9cWiEN3CgnsgHnf8rUro15E9Ea3pwxRkgu5llKGgrZIgJWbXMS7ukfOT9NaWNkaVTEJYX6afn3HQnMwwn8Id1jJjlyUE1nUnUE5h0Rc+ai3AUbIRAnd29mnLf5/YdxN4r8Q2bO3u0rE2FwnLJWROEB3Bmbw5s1sXdXnT7wYIJo4OTLgsI5CrelC1U0QWnrw7i7KrLr3K5UyiF5F2eiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYfsDhRgQD1ezeY9lyqwFHKEgg63uYc9MnXLOTCfo5U=;
 b=iwwMtVJnA+ypv28qKVNuillNb4n/bucZweRVXfQdHpRvIz7h+SwQdI6c0kIMEsbNzF67wlJ+Q+KBsLItNF8qhnfirmh0Zz9quinpFyyEvdpAYPe+2Ve/fe66wkZcNIgExbpCaXXltq7UXy/UEenamhD6uoVA0Jnx7sijvby27scxJQefK9dsN5PpztP/7gRUHusYNp9CGo1gI/0aM/7oTY4ak67vxFERU+o8c2fn7Kx2mum9+f3N1/P6geam4pO9EB6SLSrvqg0rsLZeoTF8Ieb2CH97XaunTmcgsrR1kL7Qbo4lu8+gN7PPr9juvdgmhFaT5S4/nWy8VCyn0mI0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYfsDhRgQD1ezeY9lyqwFHKEgg63uYc9MnXLOTCfo5U=;
 b=rE621ZBiGUgc7D9OSafpwR8Gcu72W73K9vE0/Kg7hAfnftPIohx0yOb0CEQl8/WxIwCL6Nu9F69twEG9kiayFnmcdCwdp6xWa4tizmvBZFp3xMvLAhXKNAHPp3jX2YS/6gSw0umO3dym8Gy29WDc53F5/QPYyE1f3PSuSPkT9BQ=
Authentication-Results-Original: collabora.com; dkim=none (message not signed)
 header.d=none; collabora.com;
 dmarc=none action=none header.from=arm.com; 
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR0802MB2268.eurprd08.prod.outlook.com (2603:10a6:3:c4::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.23; Mon, 17 Aug 2020 15:18:15 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::14f5:cc22:9381:1d13]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::14f5:cc22:9381:1d13%6]) with mapi id 15.20.3283.027; Mon, 17 Aug 2020
 15:18:15 +0000
Date: Mon, 17 Aug 2020 16:18:13 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
Message-ID: <20200817151813.wet5faqg4fzlfbsh@DESKTOP-E1NTVVP.localdomain>
References: <20200816172246.69146-1-ezequiel@collabora.com>
Content-Disposition: inline
In-Reply-To: <20200816172246.69146-1-ezequiel@collabora.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::17) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO2P265CA0077.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15 via Frontend Transport; Mon, 17 Aug 2020 15:18:13 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 305fb85a-f6f5-45b9-29bd-08d842c0c8dc
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2268:|AM0PR08MB4050:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4050DFA05BB0794E8EA88BDAF05F0@AM0PR08MB4050.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hxrPveqwYpr68qq23N6NCk0/+9HQrD8qFQ8xrLclNlniNb1GpJq9VZm7s9Z7Pp0GCxkYdV1ssztrVSe189SuVIICt4PJizC4tDvMPyaUdCgCa9X/mHHoNQIY6GcaadjlSj3Ne+VScqgw/uxbhB+YpVSa5yN+hpu1Jn6f584KY+Xvh++825r8DHwypAkWD9bnUis/WhVKDT4Tq6ZU+fCDtvfH3Fk3jlf2sY+KEflwH1qqtWNJ+vko1QwL7YBeGN0NudxKhOoDuCrHimeJ1bieDN1fo73GLWNSPTAsMKl2DXW2IO0CKiurSK5By5hBPA4ib7GE9t+/IJbVYAN/c7E6214WkB9hfq3ZRZdhh1oYG/bNiBWtccEE5tlhLNgXzgByW8WbtBrxVJEdfAvBWlM3yw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(54906003)(26005)(316002)(1076003)(16526019)(186003)(52116002)(7696005)(4326008)(2906002)(55016002)(7416002)(6506007)(86362001)(8936002)(966005)(66556008)(8676002)(44832011)(66946007)(66476007)(9686003)(956004)(5660300002)(478600001)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: l7B+zF6lAWkwv8L1t9rWWEd+hxuHZ70juU3k+vQpj9Q3F/Vcv5uhp5yknnoYdn/a9MEUpr0HmttYE427qoNmr5Ra+wYfe0/6gYqDwcE4a8lSDUa9wQuTVvrLYXv1nczlI6v5OZn2bX4jfNCEOIbX94zEAINNvZXvA9m+8vmSO4XtZHGutAJhCI57NyndF+I815wyveUGy4SwxsWhZZx5NALCj65P+00tVO76bP7d2cQ++kSZI9yjZlD13KOkfrL0ktsNELKvY5VhViZsKHbaUGQMacDLojUChdNfenDbdhXsRhUVFWz8TnrmgvJeEceWrp2YM1kdgEuNsMv6eTs0zEIdpdmMbk42xeRIHLTvoO6uwhfeMRoOlMubpG/GTT3ddAeze2jYtYRiE9ur3eVv2VY+tEoBgXlbrbat5TPbU9UwKr+0e2WIIWj4kYFJ1DD6USv5qBp5aWIIFvldvegBs2Ozuitdrt5HT2zO9b0fzIm28blxOrvhrNgZadPSOkddOA2cyER1SHDyWsGyGzWomVPV+Af5gBXRdmuDTbBISaAjA9z9KgRupfB3xNM+qkf4ozKXlLNjvR8K0S29scGp0ZnagVlZuTyAfP67lUD/yV4pCpDIMNVq41C1SjC6U0d6SUHgQwO8Le87SrcOIbHh9w==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2268
Original-Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none; collabora.com;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 39e7649a-3912-4849-603d-08d842c0c36f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I5TyRl02MjRZMZx0by46gqnMgdNlRwslugzvqIdCBE0Y5o9QpTnT95q1N2iVXi+FLfUm3AEGZHAxV2grAeXk5O5ZiDazSgTJDTlxx1LQZN+fkkSiN6+XLxcsZurxerzwy9nFnFfFIyAYTu90IYEqHWEG/67vJr1Thrbmhq0x2fyY/9idVtN7eNqGmaARe9TQL+D+KgYmyrMgbHjgXn2Fq/bTvP4AquXVI6vjKpN8nF3+NjgrE0OxNhoUvzHElZl5KZ+hrKHmc3MQSRs1CtYmc0eKjo63wa1nDl0SCzf8JMNJpKMlKxPrK7ya3e7UAoMI8Fuzwg6lfP7HFYT0vzp0t4HOccsn83rGSutIP9Tw5t0pKYbIPYcT80sHO/je58GostxK8xN0XK/xCIKvCF26R6yq4aNOX14jZVnSeu2fVInean+IDGeHlbJ0YskFKYeJqAg4BHfUNjUv5ILsJxxnYiECtFgWdQFz843TmVIS2HY=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966005)(81166007)(4326008)(86362001)(966005)(16526019)(356005)(8676002)(55016002)(2906002)(47076004)(478600001)(9686003)(186003)(956004)(6506007)(54906003)(70586007)(7696005)(5660300002)(316002)(8936002)(82310400002)(1076003)(26005)(6862004)(36906005)(44832011)(82740400003)(336012)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 15:18:24.3361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 305fb85a-f6f5-45b9-29bd-08d842c0c8dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4050
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
Cc: Robert Beckett <bob.beckett@collabora.com>, nd@arm.com,
 Tomasz Figa <tfiga@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>, James Jones <jajones@nvidia.com>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F . Davis" <afd@ti.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 Laura Abbott <labbott@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ezequiel,

On Sun, Aug 16, 2020 at 02:22:46PM -0300, Ezequiel Garcia wrote:
> This heap is basically a wrapper around DMA-API dma_alloc_attrs,
> which will allocate memory suitable for the given device.
> 
> The implementation is mostly a port of the Contiguous Videobuf2
> memory allocator (see videobuf2/videobuf2-dma-contig.c)
> over to the DMA-BUF Heap interface.
> 
> The intention of this allocator is to provide applications
> with a more system-agnostic API: the only thing the application
> needs to know is which device to get the buffer for.
> 
> Whether the buffer is backed by CMA, IOMMU or a DMA Pool
> is unknown to the application.
> 
> I'm not really expecting this patch to be correct or even
> a good idea, but just submitting it to start a discussion on DMA-BUF
> heap discovery and negotiation.
> 

My initial reaction is that I thought dmabuf heaps are meant for use
to allocate buffers for sharing across devices, which doesn't fit very
well with having per-device heaps.

For single-device allocations, would using the buffer allocation
functionality of that device's native API be better in most
cases? (Some other possibly relevant discussion at [1])

I can see that this can save some boilerplate for devices that want
to expose private chunks of memory, but might it also lead to 100
aliases for the system's generic coherent memory pool?

I wonder if a set of helpers to allow devices to expose whatever they
want with minimal effort would be better.

Cheers,
-Brian

1. https://lore.kernel.org/dri-devel/57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi/

> Given Plumbers is just a couple weeks from now, I've submitted
> a BoF proposal to discuss this, as perhaps it would make
> sense to discuss this live?
> 
> Not-signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
