Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC8019070F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C776E0D8;
	Tue, 24 Mar 2020 08:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20061.outbound.protection.outlook.com [40.107.2.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8056E388;
 Mon, 23 Mar 2020 17:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LS1NiI4GJLQDGFKow4J/r7G2BHiVrAV+wlswJqD0XdPe6NWnZbP8/u3S3J351Xg7xh/TZpKm8iOK/N68mPahWLtrvYhi1VPz0KJCm7Qyj9rvgsByVOew0t6w4U3SlPJ+bJAnMaRbiQgfUalDLIo8W8jRkjp7NFxDQ9FGppWchKxXxlDvnkL/kntMGzmsartJNXyu81Gf3ljl432f5KwU7VlUal6gZ8M86tS8NPADY3LAYIxF0J5aV6zx2l2FX81pH5npUwkxX6bTp4DKKCWQU9Ko+C3DkZb6aptvzqIMi4dwTrLv2TZGcGvjtiJd33z5VEiqp2adbhJMv7GOrLTdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsUSfHXoQu9RzEPhPkKioENxNemQOUt/Ks4aeWl8dY4=;
 b=Zw8BGVjvJSoQ8kboDe6MMyf3WuP+Gt7wXkumZJMszUxjJKkD30/WxcJhg8sKQhs4mvr5QKsrPNIFuHVsfl4VjKJtDYjfYRbayqA+Pzyaogoi2Rde6ZDQT+j44pHQLhuslAZJdEPZqtUeDBcP4ShQ3DzAgG17e9cpi+egsK0GmcbFSEMmo4wVZC0z10kBZTWG83WkSIoBPkln4SsHrnUgfVcPasMt0YL96rtLBfMNT5oB2xQPzM7jllx4liMj66eOD8QP1HWwhmgsGtcuhoL6JiTgZaN2E4CAZGGB/Z2z/KqnSAWIculW/VWt1CS8R65nsFaWQwyxyPysASX4pwCAtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsUSfHXoQu9RzEPhPkKioENxNemQOUt/Ks4aeWl8dY4=;
 b=hvqERebfVF6OE1lMiQgkNk3OXdmGFqTPa0xgVVJFAz6HUAeCjRH3+yOOBrbwJcnAKG9ZZmGytE1oVJe/FvqfLci/9xj68o6NRnBT3cQSD9iL7STrogpkx2keAjgzz1Q4MCoREnZPQxh7o7IXHajUAdPauPzCUGLQB7TykpjZ6bs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4975.eurprd05.prod.outlook.com (20.177.51.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Mon, 23 Mar 2020 17:24:43 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 17:24:43 +0000
Date: Mon, 23 Mar 2020 14:24:39 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH hmm 3/6] mm/hmm: remove unused code and tidy comments
Message-ID: <20200323172439.GA13183@mellanox.com>
References: <20200320164905.21722-1-jgg@ziepe.ca>
 <20200320164905.21722-4-jgg@ziepe.ca>
 <7d7e5bad-8956-775b-1a4c-c927b2464459@nvidia.com>
Content-Disposition: inline
In-Reply-To: <7d7e5bad-8956-775b-1a4c-c927b2464459@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:208:160::41) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR13CA0028.namprd13.prod.outlook.com (2603:10b6:208:160::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.12 via Frontend
 Transport; Mon, 23 Mar 2020 17:24:42 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jGQoZ-0006bq-8v; Mon, 23 Mar 2020 14:24:39 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 43e3dd63-d209-4195-4bf9-08d7cf4f1351
X-MS-TrafficTypeDiagnostic: VI1PR05MB4975:
X-Microsoft-Antispam-PRVS: <VI1PR05MB4975660BDCD937202A07D6C9CFF00@VI1PR05MB4975.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 0351D213B3
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(199004)(53546011)(2616005)(52116002)(66556008)(66946007)(66476007)(186003)(26005)(86362001)(4326008)(1076003)(2906002)(36756003)(5660300002)(6916009)(81166006)(81156014)(8676002)(9786002)(9746002)(8936002)(478600001)(33656002)(54906003)(316002)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4975;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: htheMka+2GTVR1Sp+JKS62mF2TwsOTX8KRMC0otkYpZPcY2rO1aYjZqzoml7p6mgczFILOOzPg4SkNVONGqJHd+hMiAlUe+W1gl4FGX8VxzfzvmdTMULPU0et77NljEeo9L5Rr9amU/ZKc7IS53SXhnj+Mg3nTMALDXcsn9CQC/MxD56PRz9LfcAI0JpeRLAwy9He7w8XIWgS489yIYXGrtYfNRgEuMI4Ktv/suSdHrGP+H0fNkriEzxBpYAdG3GF7ywgChrAAPgIU/xPYw+s6tQE0rIqWs94gYBn/lUlOOD5Ep3wlguozV5VC3vdR9pkikScNtbUgoq36ysADNyLhf3OBhgIraxtlPUQbqI8k5Jqa2WBwNuk/8jbVoarRIVeyD/w0iRhb78MlwSMli9MpEIxLOCcidbI7kDB4FkOFaDKxTj5YBB+XoSIWSkiy5rJDJF7/IwzKfMNS9f1BgQuhldryIBqG0I1oVHDUcwNM4cHeMTMz0gYpPqT972U3AF
X-MS-Exchange-AntiSpam-MessageData: HMDWH4Z7MZHo8dHJ0h90PEFYrdx0nsqvAm+IQE/BeaxCmAmpCtqREcf3rcyW2DvdfD1elWpCvFdONi2yQqec5ea7s8X90fOYkyMF4eOQEmJnmqaa+ptlZJENOL3QLekBPg8M5jEy8l6pqgYeMQR+SA==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e3dd63-d209-4195-4bf9-08d7cf4f1351
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 17:24:43.1164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRsCVKsxvszV6pfjer+Ut/OfAbAhv8Mw2RSzrchueF0PqT79TuiEJcOtHpnJJuoqzJNAmHVUr9sqQy12+SIEQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4975
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:09:16 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 20, 2020 at 02:46:09PM -0700, Ralph Campbell wrote:
> 
> On 3/20/20 9:49 AM, Jason Gunthorpe wrote:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> > 
> > Delete several functions that are never called, fix some desync between
> > comments and structure content, remove an unused ret, and move one
> > function only used by hmm.c into hmm.c
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> 
> Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
> 
> >   include/linux/hmm.h | 50 ---------------------------------------------
> >   mm/hmm.c            | 12 +++++++++++
> >   2 files changed, 12 insertions(+), 50 deletions(-)
> > 
> > diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> > index bb6be4428633a8..184a8633260f9d 100644
> > +++ b/include/linux/hmm.h
> > @@ -120,9 +120,6 @@ enum hmm_pfn_value_e {
> >    *
> >    * @notifier: a mmu_interval_notifier that includes the start/end
> >    * @notifier_seq: result of mmu_interval_read_begin()
> > - * @hmm: the core HMM structure this range is active against
> > - * @vma: the vm area struct for the range
> > - * @list: all range lock are on a list
> >    * @start: range virtual start address (inclusive)
> >    * @end: range virtual end address (exclusive)
> >    * @pfns: array of pfns (big enough for the range)
> > @@ -131,7 +128,6 @@ enum hmm_pfn_value_e {
> >    * @default_flags: default flags for the range (write, read, ... see hmm doc)
> >    * @pfn_flags_mask: allows to mask pfn flags so that only default_flags matter
> >    * @pfn_shifts: pfn shift value (should be <= PAGE_SHIFT)
> 
> s/pfn_shifts/pfn_shift

Got it in v2, thanks

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
