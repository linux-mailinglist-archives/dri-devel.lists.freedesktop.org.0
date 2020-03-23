Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0B1190710
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687BD6E0E1;
	Tue, 24 Mar 2020 08:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC92A6E394;
 Mon, 23 Mar 2020 17:33:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/EVy3Fp7fl8gJacuwKRuTXoaJZDSAi0g1RFJmNVrvwm6eG87Nk2hfOCzzkyKLS844MdIcJRMle9ipG7FguVIyL66tknZIimOR4RHXKOkX1UYSzRH5rSJdqIbioWaO9xgWyn4BFE9pWBnWtq2rqnE7gne3Ggn9SjgW/0PUjNdbdAhXyGMf+REhpkdYU7JzwfOi+si3iH4Arq7k8gGlTSYK/OKldpBk3K1ghhVa3PeA7X3cCHhFadBNkM7IBFbcisMgDzu7rvmQsTXNjwG70wW4EOoIHq++vEPi/Rq5Eg+ifkbK87Uz1LyLr++GtCtKjUMclyla3YiSFRe8aF5YVBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2vtXiTErJIHEvTEo1GjxP/+bZztJXHjAj6Ijocj08U=;
 b=YCWSEIhGY8fFnpehfEEtDBKP/g7jNLbeRYKtgk4gf++HbTuM2xOygMKICCjd30cFnPOYnBsreOSTZzW0qLQlE5h0PAZLk1dpLbAdNSS44mRkQVBq3zisjlhL1dOsvjD3AwhLjq4MmE2ctrFGAdN7zITKuozAwF3tbAZ4LEKrwWjItD3SRm+I5fxvjTcKZy3hOi6P672LsvW2Hfn6tHUHsZivaUh2S+aqVTRtbCZYAGySVfMY87Y3as5THed+YwpiyRXQ194cXB/UwZyH2D4nTfActn05Xo/7Bu52e0lKxd7heSkHtoCRNCjXXhsiurUQeh0hYTcylN5Ze68TR1Dxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2vtXiTErJIHEvTEo1GjxP/+bZztJXHjAj6Ijocj08U=;
 b=pvkEq2YlgSkcEIXDVXheKU3VAZfAI4H1pPfZJKy3SASl6p0A1dGMhShV+6Hfk+MMsMkbh2muLknVYqOyhhM4D2m3g7HM+ZQVH4g5TYCBt5w678zaMVuYe+vhNI08e9i/kl1NCf6tkYLLriHXEXkhCpalXOKvlY3uD5TXhFpPJnM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4448.eurprd05.prod.outlook.com (52.133.13.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Mon, 23 Mar 2020 17:33:49 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 17:33:49 +0000
Date: Mon, 23 Mar 2020 14:33:45 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH hmm 5/6] mm/hmm: remove the CONFIG_TRANSPARENT_HUGEPAGE
 #ifdef
Message-ID: <20200323173345.GB13183@mellanox.com>
References: <20200320164905.21722-1-jgg@ziepe.ca>
 <20200320164905.21722-6-jgg@ziepe.ca>
 <20200321084317.GE28695@lst.de>
Content-Disposition: inline
In-Reply-To: <20200321084317.GE28695@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR16CA0012.namprd16.prod.outlook.com
 (2603:10b6:208:134::25) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR16CA0012.namprd16.prod.outlook.com (2603:10b6:208:134::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20 via Frontend
 Transport; Mon, 23 Mar 2020 17:33:48 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jGQxN-0006wh-It; Mon, 23 Mar 2020 14:33:45 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1d8aa265-3732-455f-40af-08d7cf5058ae
X-MS-TrafficTypeDiagnostic: VI1PR05MB4448:
X-Microsoft-Antispam-PRVS: <VI1PR05MB4448D773CEC8EE29B5ED28A2CFF00@VI1PR05MB4448.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 0351D213B3
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(199004)(4326008)(316002)(186003)(8676002)(9746002)(9786002)(26005)(8936002)(81166006)(81156014)(54906003)(4744005)(52116002)(1076003)(36756003)(6916009)(5660300002)(478600001)(86362001)(66556008)(66476007)(33656002)(2616005)(2906002)(66946007)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4448;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ox8TcPSj1Y5AmQ6J40FHjKU75i1ldl8XWET69yYlkNRBZC5C3aEYKbOMHs/Q2KXDp647bKdQ4pOz6i8Y7uaQWoRmkoWeLvGP4GSGwB5OX9hWkUYx54saHx9R2zvYdqIs8mrEGKIk3mcCSSaBnQ2QQhI1nd+RBXvl8WiJli/zV+txU9TuhGDspbyjaOKfhf99Lm8gXfCSLC5DkiEROlXyeJtJGaRqnR0EeDw1oxAfxJzAj8O+I3amX6Vw3pE/Kc/jX+Lt08wmd5AfxE5F/fqX7cNIZ683y5qmeAbLpyR9Fo5n8ZyevgFcZygn9ytwRMV92wMW9c/vZFKB0WkXU7sqxI9OQE2yg3f/N0dO0oc6Z/B+yHykVe3zF/gj4Zqqn2X5WguMNoytKf7wuS+q4b3AiU/zzRkxZFzRPF/WggF3YSQgwLe46GvnQqc9uWqj/gTfGuJxBeGJOzuUojjwN8trFDDqisDbwEhr3QCjnkZ41qDHxK4oYbmrXDhAaMrybesL
X-MS-Exchange-AntiSpam-MessageData: N+VMtfLiiC2kXHFlAWy4B+T9lmwA40UbNwOON8OWCB46ihbmxakfO0q2lJbmMMGLigDkfT+542z3QJRoXk3FFXFfhg69J1LUq7MFyXDWb5s/WbtjNS9ZMKY1MaTffpLF1FOvCywd7/ME9fLcbm8fAg==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8aa265-3732-455f-40af-08d7cf5058ae
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 17:33:49.1001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCKwzLgKxM9K0fRP+84pUtpCjPR6RKqlWthdrvSZxmC/MKZpoCH/MFr32BEcLaZheDh2orGDkaRFsM+acKGEtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4448
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 21, 2020 at 09:43:17AM +0100, Christoph Hellwig wrote:
> On Fri, Mar 20, 2020 at 01:49:04PM -0300, Jason Gunthorpe wrote:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> > 
> > This code can be compiled when CONFIG_TRANSPARENT_HUGEPAGE is off, so
> > remove the ifdef.
> 
> It can compile, but will the compiler optimize it away?  

Yes, the enclosing conditional:

if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {

is statically false if !CONFIG_TRANSPARENT_HUGEPAGE

This is proven today, as the fallback stub is a function prototype
with no implementation:

-int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
-		unsigned long end, uint64_t *pfns, pmd_t pmd);

If the compiler wasn't optimizing the above branch we'd get link
failures.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
