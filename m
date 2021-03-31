Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D82473501A3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 15:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C386EAA4;
	Wed, 31 Mar 2021 13:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA4B6EAA2;
 Wed, 31 Mar 2021 13:46:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OORG9tZ3d0HtmXhGuuKzx1tPZAK3ci3dSrGD5yxggZQ92przGB1I8+McP3WtgquhBR703zlw6OxkqujPIMnBGryYpeCuRL24cuoAuVZalR+c2kI09Km5tbmbDh6Iu5dNcVW4Y8SrYgzCPYFiG4zKXyk+mhVcUL9ib/wJv6MlPPMZF4XJp5Vllt1x4BAFRoCDdtnhifIZY4BdFl0eqS+RY+RCJ+7MK+4xoqKZufeRfy6TsvxOgNnqAHXsK4SvDlK6txS8e7/GyDxRQj7ENI/Br2Qi5O0O82WHieZaAOR5Booq6j3aY5XQlQHiWEe5na56BbnTVMrJZSvbnBwBPruMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TkDJd2X/C8+bAdlrTGnrbdd2Ga7H+R6q19g1qFkoKQ=;
 b=d5sbjAgb/1vvXRjgfAOBSO8mWrXbTcUgNYMG2VaKiiorXSNOMhPptaaIjspO+ra2eQGFyO499FrwagWJAJjdrysDlguZyPDh26b4xFTHfv1E26SW4OEjFUAKjfxMKHIffMT0kWs2VwQkJ/Y1R7yjoXvy80gMx9JLLpuaR4mZX9HYwayMw9Cn+VjvpK1N0Dj5S+QIcNSKdmz4XB3oRcisN0LL8QRQAyd4F2kDJS906UyHispCS6amVYlHATXWYgDyNJhwF6cqudLbssFmkSDjh9aaVzrLaEMhSs7bNTRmVp8mbjrn1CrYoa1omFNI7okItkWf6qup3peguND2oX54Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TkDJd2X/C8+bAdlrTGnrbdd2Ga7H+R6q19g1qFkoKQ=;
 b=opPC5rTtwCR4n7ZQ7xpv4ajRhKMcDNcmP11XKeyPF3uvvfm3ciOrjH6AfcRgjf/fdcnUWIS0+Ax8l1niL6co+P0UHgeU3TcNGB+yeJtkICZh+im/8macbeHZeTTiyWSy0hEkmDRBUmNhvIKxf4epXRykfoJrf2DhOMfKtyziqCniGQX2VjhDpP5/ho5SY6u8lGCW/KPyaRGUDQD7qwvHferzBdFOZs6HhvahC/xBjb0xg+GrMuqGAbdvu4krTQfGD/AX9lx+cchnROxaxxcrOshQiS9jv8ItDHiPngubjJgA8jwF4hSspD2MJ35HNSkivYTSkwT1rByWfA3+n30roQ==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB3827.namprd12.prod.outlook.com (2603:10b6:a03:1ab::16)
 by BYAPR12MB2901.namprd12.prod.outlook.com (2603:10b6:a03:138::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 13:46:06 +0000
Received: from BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::4c46:77c0:7d7:7e43]) by BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::4c46:77c0:7d7:7e43%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 13:46:06 +0000
Date: Wed, 31 Mar 2021 10:46:04 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v7 5/8] mm: Device exclusive memory access
Message-ID: <20210331134604.GK1463678@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <2521635.masqiumSp9@nvdebian> <20210331131854.GI1463678@nvidia.com>
 <2124945.3NMGunUBXV@nvdebian>
Content-Disposition: inline
In-Reply-To: <2124945.3NMGunUBXV@nvdebian>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BL1PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:208:2be::8) To BY5PR12MB3827.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL1PR13CA0183.namprd13.prod.outlook.com (2603:10b6:208:2be::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.8 via Frontend Transport; Wed, 31 Mar 2021 13:46:06 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lRbAa-006Lc8-C2; Wed, 31 Mar 2021 10:46:04 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b667bd60-cbbf-48cc-d3ea-08d8f44b5569
X-MS-TrafficTypeDiagnostic: BYAPR12MB2901:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB290100AC8F29D3DEAF31CCAFC27C9@BYAPR12MB2901.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3736OGcHm7QPzJovqMgbIiQ79J6T9XV2CIUIoNJgTyqEz3JIU5b731TM6AbJjfUhH6cUgUSwI28BCnWM63vNxiLOTX35Qqoh9x+x6Q85aptfMVdRio3+5Y80u9Ri5FXc1tI6UnxDaBSEIelrlDQt+fqHOYwEMr+de2iJhWAJtiP7drZToIwcAIIFvajHBJXnmDDjyXy6Zxd5z9PScsa6vmMWEZOEeoxllb88mzWgjRAHQW3Kg54Pxw1IbOAqRluQBT+hEGd+p+bwexLMZYGxvvqY8MZIwqAL5iD7gSjCvhgU2KvG27keuOCT4+44bTy88ycjGcdxinZsjdaHXHRDLkjj7hYrto30GYoXjVl51ZRzZq2ZT1GUyqQxEdqIEVk/yLSpEtbQsOW8+jfuW0KwmGE/xX+oRfRoJoSE36hdGITgt5AuJzLDAJJxa2RgqRucnOiH8RhuB01teKh6SQXT/zSEZ2/SSFEZlZe1nX1/gXir0xQrEPSZFpY2cik+VOM0Zk0OnlDep/f2x8Ln0O9tgLL7QUrBojwX2hxxAKgPh5N/lIxVS6KUju8m4dqU1vF7p+LUu0F2A83t/6tzOmsZSM2RneBgprdDrFM0mX1fnBauryl1G/rYYD0t7QG0c7lWkbz1mLhIcBNADnnL0rkx0/WnyQM0RsEWYgl0vpYlpqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3827.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(6862004)(2616005)(1076003)(186003)(9746002)(9786002)(33656002)(83380400001)(8936002)(66556008)(4744005)(38100700001)(4326008)(6636002)(86362001)(5660300002)(478600001)(2906002)(36756003)(37006003)(316002)(8676002)(66476007)(426003)(66946007)(26005)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZZNzjHTa16Va3EZF854Ny6DLBpCpmVQ+g0q+dpS+OeuObxKlKp5m7mT8nipS?=
 =?us-ascii?Q?eyWOC1YCm6wJ4lVr4241hC1MRJiztFCmBShXThaSW8HlEnDPfscn27FRiEeS?=
 =?us-ascii?Q?5paNCq3GPG7mHMQMLlhTTlaXZ61gcJAu62+FLW7ZI8T2kXYik20iTbKcC2hu?=
 =?us-ascii?Q?PSG9HMvrylA5nJlNIItA1pBunVWmLJGJMMusZiDa8kypZhVQSadgrzsLm1rU?=
 =?us-ascii?Q?PbZBqrgONeNZab+X7jwnVN5xf+2XBDoMIOvx4voJImwDzEnWdY3McTbzWhp+?=
 =?us-ascii?Q?D2GFmFwYVa5O9g1smUmsKrhInra3yVBpQG33vhlBnHruRz9TZrXv5Bt0kBWI?=
 =?us-ascii?Q?sCJujdagfe7lTU9i9UDzINLzCMNgGv1EVX+PjZ2t7sn+fKd5ggrUyqCbSqn6?=
 =?us-ascii?Q?vAB0hVxuRM8ObDy7Uwt0YoUfnOrySKU4pk3sPankMMGLlBC9xHgwJ/9DFnol?=
 =?us-ascii?Q?gEfvI7Qx4Ydrqh4jCqMGVV/GicwH53p3URR/k3LNYV7k7kA0qDpdEBG5hDl0?=
 =?us-ascii?Q?f8EuF5hK8p5kv4s5kQE05n/brC0xzUWZFlLb5+9NywHly9Xgd+2HiBJNhV06?=
 =?us-ascii?Q?32aE+Mm+uIFIaCdL9qhwo1VhFLsvUhRFLtnaM/Daeq9UwwazGWLu3emxJonJ?=
 =?us-ascii?Q?QsiCwyC83oTfcdB51UYAxggPZ4nJ9fIp+pgbHwnbrsgXpcu7kNdyQNKLTdja?=
 =?us-ascii?Q?TahipukJ8Y1NeYKwjTgmENia3uK5VyvbQpkRXAJYUTX2uDLV40pM5V3w/x8C?=
 =?us-ascii?Q?pPhBgjKdRt4Uw1IQ0oCMwkGuDTFqQcOzTEBuvrwKxP93VL/y+9+sJgjTzw4E?=
 =?us-ascii?Q?BF52VW53GxJwDHPCg4uWdCjRJ5jZ42mZMuMVH0Pr7qB/tiNRFJ91pz90Z2ux?=
 =?us-ascii?Q?iDhb3zxvJeKAx8aUiLjsQH+Z0UvBheBwSPwAciwb/w6ksOZ4vVsOz6xEbvT7?=
 =?us-ascii?Q?7dDr/rETi1OX9S8UeuB7Xgk6AaYi+uDBAfscDO3fmXdMACihCjUIp58NZdTa?=
 =?us-ascii?Q?VMnzCnF4a3DDqHjmT0wRLujaUVcWMyVYPBA6cJJcwbjndvQjQtGpJmPf9b9d?=
 =?us-ascii?Q?1ObxMUVto44Zq7JuJGFG6meNBPWjLLbD+DILquqPDpWBE/A91Fw6WjC0oSrI?=
 =?us-ascii?Q?8T7zsU65MXFcl+Mjb7FVnRbH0KaMBUbT1GySvKvL1sOHOsl+Hmud3vJGzD4w?=
 =?us-ascii?Q?oyCGFNRSwghEZviGW8buOlnBrB6Cmt3RrJSHi8HlvkYNeXzD1qBcIH+a60vv?=
 =?us-ascii?Q?S4YaKGOj4NhkGvmyOP3kjwX8Fyc2/AgFmDOfK+WIesL6OZOyT1NH95mQK7cv?=
 =?us-ascii?Q?R4HXm5wraVzLf3bbxhV3m66J2J2NF/tAzEo8zorrSKm5Tw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b667bd60-cbbf-48cc-d3ea-08d8f44b5569
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 13:46:06.8407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Auuf1ZyTbG7zHermtVtDrb/12zR8ElOjZGnEy38lE4CWllK1fvkCODKDoQ6yfDED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2901
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 01, 2021 at 12:27:52AM +1100, Alistair Popple wrote:
> On Thursday, 1 April 2021 12:18:54 AM AEDT Jason Gunthorpe wrote:
> > On Wed, Mar 31, 2021 at 11:59:28PM +1100, Alistair Popple wrote:
> > 
> > > I guess that makes sense as the split could go either way at the
> > > moment but I should add a check to make sure this isn't used with
> > > pinned pages anyway.
> > 
> > Is it possible to have a pinned page under one of these things? If I
> > pin it before you migrate it then it remains pinned but hidden under
> > the swap entry?
> 
> At the moment yes. But I had planned (and this reminded me) to add a check to 
> prevent marking pinned pages for exclusive access. 

How do you even do that without races with GUP fast?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
