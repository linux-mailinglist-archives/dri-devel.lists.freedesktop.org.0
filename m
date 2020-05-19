Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907F1DAC47
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60228936C;
	Wed, 20 May 2020 07:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3056E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 23:26:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuF9ygxDkSvzgwixLZ00oT9AykrzJWzXOJFYJJ1fWWCxlkQLANBlyEvNwHgjpv+fupuFY4OH2CC/VuCGHsO2V9A2NNV8IxEcjf9QFdaYi25Kcm632YTSUPXnUtphkn3X2N15T8DhnYBF7yuiONQAwt1LUJcngQaEYjs5lfvdmRCLByrwnRO4w6sooU1UhFhKQVuWTDNR+3nAB6VDM4HCJDvqK0N+iVD9jYP49395MdGYaOyW9HUtrMlnTOr3ovGOaqJvcMGURvnRYcq2bp8l6l6RE7vrLBsYK9f3rEX8J5ysbxzB2Wz7gmTM8dChHEEPk6baffghufQL1TTgXOfJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3out6jrln7PxKdCWAHNqerkDXxM/y0YwkyhcP1vS2nU=;
 b=n6w6UxWhc6giMAPOIx0sbFTcVf5RbWMZ8MaEE9XVEiGImr/V/68cCDIGbW6XOIYz/RI6sqMjrIzuezYgkv0OkFDfeAuyr+rB6anQK1RgIS7ARo/mrbc0mBqFWsuco9wi6zuTh29CIC9tl1L2bdzFMuI8IvgesDtjbVmoFSfVe0IOMmQe82Yh6z1Ou0wgXeyP6Ik//CFvtZ9nptH8n+3uQMg0SSAXVBSZskx12/ol/8udmUKI6dT6YR1eO6nQ5yCnYg0dsRx4z2sIT8QVy2sDzdt2NXqu49Vcf3g4Ge8AAH/YuFEEITazVq7wlX7+xxwzCqAKCabj/P6HYUMlOZC7dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3out6jrln7PxKdCWAHNqerkDXxM/y0YwkyhcP1vS2nU=;
 b=gYkf9VsFBNPcRj3HyTf8PE/g4EqNG+7pB66uIb8+aDO13k0AIjswBpmgPGFtzbZtcofNMa6pSQM916McPQ8AGus7Y0avGfuESu8rtJk34L6+5dMv1BnDzXl8LA/TSRe2suRDIkqilb1ZiQW9277udDaZGfDEz9G6p5+Z2dldCO8=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB5533.eurprd05.prod.outlook.com (2603:10a6:803:96::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Tue, 19 May
 2020 23:26:41 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e%7]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 23:26:41 +0000
Date: Tue, 19 May 2020 20:26:36 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
Message-ID: <20200519232636.GA24561@mellanox.com>
References: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:208:23b::29) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR11CA0024.namprd11.prod.outlook.com (2603:10b6:208:23b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24 via Frontend
 Transport; Tue, 19 May 2020 23:26:40 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jbBd6-00037I-5O; Tue, 19 May 2020 20:26:36 -0300
X-Originating-IP: [156.34.48.30]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3e0c6265-8af2-4196-789b-08d7fc4c1559
X-MS-TrafficTypeDiagnostic: VI1PR05MB5533:
X-Microsoft-Antispam-PRVS: <VI1PR05MB5533A7AD7EC2297299F8CBE7CFB90@VI1PR05MB5533.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZJDZs4rETzrF9QviuUN8FPsVKL1NqJDBmWlHo1xeRlkLD5+ZlQ+ghO2j8D/D/X5wsrU23h/C3Hbq3ZsHn0JUTZa9AX7ZdNjfCY7weVnPRV6tRF1fy/G90MVoztede8gQqkO7MkMgN+YUQogZQr0yOIOZB6KCLenIiNrF0LuhkZCeUbFWlgAnAW00+rpNGJjYstvyyb2iVePtic8DjONWjXMzq3fNKTh0MUMTJ445IZ9Oz0BynRp8DNNo6aDdLg63s016cGD1h14N13N/Y+CV2CeFx14Gfo9co39vuTctrNR0fGDThwnATU93xgst9paQIe7EIBIpaaQQQke/WsZZrwrtv1tAYUHqidQ66AsFwh5AU93MsNVlQWpTvPWu/dvJMqngmZCvIp3t9FLENRt4OUVyfK8eIBQGDbuFLBAuEIUj4fZex+a/fDW49DSU9O8bFZKZAI4kZIcuotRwBRnA2LFTirz5yCjaggStmGGJz1rdLhTklBvza7ajoXhhGXwu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB4141.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(26005)(4326008)(9786002)(52116002)(33656002)(9746002)(2616005)(186003)(66476007)(66946007)(66556008)(2906002)(478600001)(316002)(36756003)(8676002)(6916009)(54906003)(86362001)(5660300002)(7416002)(8936002)(1076003)(24400500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: sjfbhFGgYpXl1eyHC0WgZrRACwq/2ZQ5YEde8RJVqXZc3Rgk2ncgPjNXxFcBeo76oKrU6jFfAgJYfCCv7yBVMQVBL5C8GE3L+dEQitB1SaOIz/BM9CTvDBcPox0Tzi9eDWuNZoTOKlfv6Q72jCB2WEh1UUhE0NS/uWk0/WaRc+DOhwDN3U2GuJa6A2HmpfcQy4+SROFiWr1R//TUwS0mQtXxlRdrS3MJ+Ap5AGZlxDGXB1MgeE3Hev7OK2ZyQrXv1NLLpM2tdSGtDWFqeUeCMnl97LTnWmUUdcRcYpj5Zg6A7hAznv4EvxPcpvm1ubr2QrPUcjhRC2+qbT+w69c3vDyCUrh6sISmLjgip+Fsy7HjW1t6gN0RMzzNeY/pXbpOxIk7VPmH0g3vGyoNPuddGxXrWw2MzFBFAs3WT8R1wa6eYqJHKpZ8CRff4OwhidD/l1WkYVq1mgmwTjEUjhvq4KBdvMgV0OVPgvB8aMsiEVQ=
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0c6265-8af2-4196-789b-08d7fc4c1559
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 23:26:40.9829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDWI9cIlSLy4pc7Gjtg6Kpg8IigaDSMeul28xIUBHbmDuaLBz21cn6yqLk/rdljw0S2aHpySVEZhHfFI8HAWlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5533
X-Mailman-Approved-At: Wed, 20 May 2020 07:34:33 +0000
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
Cc: Olof Johansson <olof.johansson@gmail.com>, wufan@codeaurora.org,
 Arnd Bergmann <arnd@arndb.de>, Jeffrey Hugo <jhugo@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, pratanan@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 19, 2020 at 10:41:15PM +0200, Daniel Vetter wrote:

> Get some consistency into your decision making as maintainer. And don't
> tell me or anyone else that this is complicated, gpu and rdma driver folks
> very much told you and Olof last year that this is what you're getting
> yourself into.

It is complicated!

One of the big mistakes we learned from in RDMA is that we must have a
cannonical open userspace, that is at least the user side of the uABI
from the kernel. It doesn't have to do a lot but it does have to be
there and everyone must use it.

Some time ago it was all a fragmented mess where every HW had its own
library project with no community and that spilled into the kernel
where it became impossible to be sure everyone was playing nicely and
keeping their parts up to date. We are still digging out where I find
stuff in the kernel that just never seemed to make it into any
userspace..

I feel this is an essential ingredient, and I think I gave this advice
at LPC as well - it is important to start as a proper subsystem with a
proper standard user space. IMHO a random collection of opaque misc
drivers for incredibly complex HW is not going to magically gel into a
subsystem.

Given the state of the industry the userspace doesn't have to do
alot, and maybe that library exposes unique APIs for each HW, but it
is at least a rallying point to handle all these questions like: 'is
the proposed userspace enough?', give some consistency, and be ready
to add in those things that are common (like, say IOMMU PASID setup)

The uacce stuff is sort of interesting here as it does seem to take
some of that approach, it is really simplistic, but the basic idea of
creating a generic DMA work ring is in there, and probably applies
just as well to several of these 'totally-not-a-GPU' drivers.

The other key is that the uABI from the kernel does need to be very
flexible as really any new HW can appear with any new strange need all
the time, and there will not be detailed commonality between HWs. RDMA
has made this mistake a lot in the past too.

The newer RDMA netlink like API is actually turning out not bad for
this purpose.. (again something a subsystem could provide)

Also the approach in this driver to directly connect the device to
userspace for control commands has worked for RDMA in the past few
years.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
