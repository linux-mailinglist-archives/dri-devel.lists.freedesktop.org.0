Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CD821E968
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DADA6E922;
	Tue, 14 Jul 2020 07:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A06A6EC39;
 Fri, 10 Jul 2020 12:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQlTbD4q4Fsi5BIUergqUp2v9l2P232rpR5KPf3NUERPzYfzHfkmFa104QUv0oPWS9nIMAOof1PqO1go/UrDRGN9fUHFoa7QgcRRIHHrBdgGJH+Q1ySxw8drFdN7yv/Dn0L6TeKebAQ0lrvWs5qCS7PZ96ePF/b5nb8q7h6ET+tyRvoaW9glChJpwgjTdOZ3GokCotCEarnz03/FvSWE47nNJl+POP1vqIVKzRokAkJ3SkOdMzG4ZJcGcRz0gQ6Ze7sc6ZczhsnJ/V5JBKAIY7rPKKI4jPm0PtLTHFYH+aj5572JFdourEl35AIMlUiXc/MxBeE7LXgl38geCudQTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34hurTMtr+T3rLOIz0AGs7Xw2DPXpoxnn9bisG6j/60=;
 b=edWY0hArN8brHPoUWDQZXhU8IqUDRPt8Baz4420UpUieJp7iMBNEyvkFs4Ym+LsflUnzd7+BL9jxCF8TshFvu6USwcKSHjJhd4sbjXIyFU4noygnhnoXnTqqNtQthJOaeHvlIOa3G04qpYNg5MDmcg2RFVTFyc46ljSnuVFo2Ch0Pb9H8ZIDM2Q1r++OW1VGxhazEW5Y2iVSY2XhSFGb8I+ef+d5Xa5ul/SgFDHrFpLELXE47+PjuB2QyP2bKkTFhRBi5A/MkvbMik1PZbCLuihzAtmbrvd33OTyod65uU8ru6ux8/i9CG1QckCjHl9Jk9b0Av/VaKeb13qR+mr5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34hurTMtr+T3rLOIz0AGs7Xw2DPXpoxnn9bisG6j/60=;
 b=VdyEz8p46asubFjoz/VOfACDW9iLeZsl4uDjsAvmgLolPF/3cldWUDPDpW9PCyJkli3P6iFDfGB8IZEJcclEr0KEozXL/E5Pd7f66Q5WKTN/fW5++cRA16kgHu4+paAlvQ3r9GCOHQkxa75ZhwDg7Vd84kfg3nc+wC5u5WYtNiQ=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB3232.eurprd05.prod.outlook.com (2603:10a6:802:1c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Fri, 10 Jul
 2020 12:44:01 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e%7]) with mapi id 15.20.3174.022; Fri, 10 Jul 2020
 12:44:01 +0000
Date: Fri, 10 Jul 2020 09:43:57 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 02/25] dma-fence: prime lockdep annotations
Message-ID: <20200710124357.GB23821@mellanox.com>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-3-daniel.vetter@ffwll.ch>
 <20200709080911.GP3278063@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <20200709080911.GP3278063@phenom.ffwll.local>
X-ClientProxiedBy: MN2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::34) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR07CA0024.namprd07.prod.outlook.com (2603:10b6:208:1a0::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Fri, 10 Jul 2020 12:44:00 +0000
Received: from jgg by mlx with local (Exim 4.93)	(envelope-from
 <jgg@mellanox.com>)	id 1jtsNh-0087aF-Qh; Fri, 10 Jul 2020 09:43:57 -0300
X-Originating-IP: [156.34.48.30]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 949f6f7a-4c05-4e34-0a29-08d824ceebb2
X-MS-TrafficTypeDiagnostic: VI1PR05MB3232:
X-Microsoft-Antispam-PRVS: <VI1PR05MB3232088F248EE466D987FA10CF650@VI1PR05MB3232.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqpfTDwxTe8EbaKS7F5vLqXSlJ8EPcUtUksP2GLHlmDh6cU6p+EHOFgx+cJjdBV3cFXCDGIWvL4UwdMLcQJOOONv/mMw3kHu7FX+UlJVZMOcxKjeJLPGZkr3A0BKa26tGypW5eVts2u8RCcE4l3WbfHGqyu61fgQI34sI5mfvBwI38/yf0UTP1MGJrbPNeLN7jsii3/GnDWHFNtAr3GcQmIcI87C2EXnzEr780/RlKb8gWD6YdLbJ7cF6bzZDCD4F36miFFS1aBmMVlTdhUgMGqwT8PrtpuYp6CRWF7INou1rCg6v+LoysL/QCIbY6lX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB4141.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(426003)(9746002)(9786002)(36756003)(4744005)(4326008)(33656002)(8676002)(2906002)(8936002)(86362001)(7416002)(54906003)(26005)(1076003)(316002)(66476007)(66556008)(478600001)(66946007)(5660300002)(186003)(2616005)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: hA2CTgxojdMabErcREc5NIuOaoW9dFPneNldyaWHilKPV7fc5qsN0oVk76s/aCnKTNb5kR3/PKQXldGWUD/2OEQ3vpI0IxF4DsU/9G4jQ7ya4HIF95juT3p/an25ADh1spMOIh2cB7SJDX0MzyNzmLrKJwtVEsNEcjVOjQnmxCLZ8Zrs5LJYtv+VhhB2w3oDxXVcf1m3SsIEMRXIqyLdmFIt5SFehXnvbnuZ0mhBtKvNjmzt3jI6mMozgT/XDgaKJfqPOd2aIO7ih7V3vwSIuLpz58YQVw0O3dRP1ovTRCV7GOIY6c/CS67IMaXUyywHiD2nGIFYL+Vi2mc3GW8EGrq/HSMOQ0RKbJ2H9w0Qep2N7PtnhzSh3T3RdFLFV6KZOSd83rU7Y4tyyIM2U72zRnsw9zmHdlZO0TrOSFRHAgWoXpuc1rRSO5qPCMWdCCwi7//3rdIm0LttoUjpMUSCdOwBjaVlEJR/IA7dn6VP8Sk=
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949f6f7a-4c05-4e34-0a29-08d824ceebb2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR05MB4141.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 12:44:01.5468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXglOwtPtNSZpu2Czmltg7ntqThyjyNV7n3EWO/TAEXvgshsT+SKXP83QoyNKMC/EROi3M/ESSiakUKPxaktdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3232
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: kernel test robot <lkp@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 09, 2020 at 10:09:11AM +0200, Daniel Vetter wrote:
> Hi Jason,
> 
> Below the paragraph I've added after our discussions around dma-fences
> outside of drivers/gpu. Good enough for an ack on this, or want something
> changed?
> 
> Thanks, Daniel
> 
> > + * Note that only GPU drivers have a reasonable excuse for both requiring
> > + * &mmu_interval_notifier and &shrinker callbacks at the same time as having to
> > + * track asynchronous compute work using &dma_fence. No driver outside of
> > + * drivers/gpu should ever call dma_fence_wait() in such contexts.

I was hoping we'd get to 'no driver outside GPU should even use
dma_fence()'

Is that not reasonable?

When your annotations once anything uses dma_fence it has to assume
the worst cases, right?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
