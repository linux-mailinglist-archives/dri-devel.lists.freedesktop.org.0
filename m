Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22C823B5B3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EF46E44D;
	Tue,  4 Aug 2020 07:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A727D6E37C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 23:34:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIULIi7bIrX/VrL0VK48ieuSFsxOYiOPM7UYQ7yxYYsKcFLs5w00mp5wiFvZUYMuRnAZgx2rWLW/AxkAr8ksnxclNbIaFeUPuOTF1AA3htWRgpFsxHQaGkPQqLobs27Y8YQQjxLVaTrSzqHb5cxAZaO6s6tgsvdTTk1A9etihOuHObJqurgLGvDnLr0VFUmI6+8NwKG3uidMwXWFpjj0O6SRTH4GrGCndJVQQgAxtsBoWpOCwOUADE3yg7Xcn3aDefkPtxW564ZX5XR0Ujqg32WcEic+0AUahuwqbhRZSq9KR/oxi/TVaQW8d1Ess+DG4tH9JsxUgHW3/lOwwnkoow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eaH+EFDjNL7/5j4OCMZZX4seUGPNX61bi+tebUfEVs=;
 b=P5VXQLvYOPW+IMkZc/c8aSY2eCx9410+kxw6w6Z06FP86l7NnVo00VahkgkWtQkd2kV1rOMtQ7QoQ/SuDsm/E7nUE6btiR5foBI2Nio4R90ztAWeWLtVOs8e4aftv5w0Lyspn+Olaf8ll2mU+o9lnh/aoNw7CRN1YVLzat7wH7Etnz8px7JggKQaU7eRWyU9we9JkW1ZkrFUlokg0vpu8YUPek0qYk8oRxe5TVm57lR/ZBtHpO59Pd4fN+BlBi/OatjM3cBpC5YWACDghEER3ptGRupDorIcV5DFHRks+cAyXQkxx/CpfcIUT/YVkslHV7MpW2AyZpZdJ28/SYtejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eaH+EFDjNL7/5j4OCMZZX4seUGPNX61bi+tebUfEVs=;
 b=UNwQ3bTwg3AN5AdhoTfV2Giu86blt3UiTLgRSQW8UipRPDVmrE3Fj/Ck81l93UW++aMwTlE/Ld26OTwNV92FiMmEgohkOEOYu2eNe0C8NtpXOrE1jpkuJw1irtWIKQK1hl4CpcwyOyM2SZB80Ereb/oSt1RxgmbJ5SHm+WvoNdU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB6720.eurprd05.prod.outlook.com (2603:10a6:800:139::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Mon, 3 Aug
 2020 23:34:30 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::10b0:e5f1:adab:799a]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::10b0:e5f1:adab:799a%4]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 23:34:30 +0000
Date: Mon, 3 Aug 2020 20:34:26 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: Re: linux-next: manual merge of the hmm tree with the drm tree
Message-ID: <20200803233426.GS19097@mellanox.com>
References: <20200730192110.1466e63e@canb.auug.org.au>
 <20200730120303.GQ19097@mellanox.com>
 <cf7af4c9-592a-2143-831a-cb0f44bc768e@nvidia.com>
 <20200803231923.GR19097@mellanox.com>
 <CABDvA=mvks3Nrs=8wo1jomPxGjWFxwz4EWrppmmHTzsOuQO6Kg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CABDvA=mvks3Nrs=8wo1jomPxGjWFxwz4EWrppmmHTzsOuQO6Kg@mail.gmail.com>
X-ClientProxiedBy: MN2PR14CA0029.namprd14.prod.outlook.com
 (2603:10b6:208:23e::34) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR14CA0029.namprd14.prod.outlook.com (2603:10b6:208:23e::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Mon, 3 Aug 2020 23:34:30 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@mellanox.com>)	id 1k2jyM-003ANj-Bu; Mon, 03 Aug 2020 20:34:26 -0300
X-Originating-IP: [156.34.48.30]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 85468d41-4aa7-443c-3753-08d83805c505
X-MS-TrafficTypeDiagnostic: VI1PR05MB6720:
X-Microsoft-Antispam-PRVS: <VI1PR05MB6720E3778CFD895EF28BCF36CF4D0@VI1PR05MB6720.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IWkr1Swztp05j3H3L9AQ5Pt0ysnRth2MbS5dzJwJrAi6d0xdPnyNg8HwIA+JwsLutjHksR9he0TkKhjpIzIsIsqQQPaiFoG5g6ccfy2qOtDQ3Qu9Rm7BnB8be/saBeasSjdIVyLFPIWeGRUkPBH7IJ/KV9JlJgRR/kkqaQdwgpzTFnwmz7puOeMQMNVeHs/7B8l6f/2KEd8aNku5bw/tdcv8METdQ4pmzd7YTFIMsqsU/MmTVJs6Ua9hf/qWxBrAWryxx2KJ6f06HthewWooAm8P8Dlmsf2bemYliY/rNE09qI1lkeOC6CpNQM4l61Qm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB4141.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(1076003)(316002)(186003)(66556008)(66476007)(54906003)(8936002)(478600001)(66946007)(26005)(9786002)(36756003)(53546011)(4326008)(6916009)(2616005)(9746002)(2906002)(5660300002)(8676002)(426003)(86362001)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 2ClXS7fMHJ8HluRfoUCPr2CfRgFW/w2s0hbWUW2X52ZXbZDK/Hy3bB2tuxQlDGUYaM68AKJPYfbqbKm7hmfqs9TVr2un0AkKNJSD6yzBcwH4p6tGIMTviDUFbxZjGSxllQsKaY73xQn8CQX9j9ETSf6btncXx8vBv3CH1RN4M1T+mv9m7MEgFF24oBbcEs/0Ujc9OSOhGHc8RVbluItLq/Lovv6H6cPGQcSMAYgMAlV39m91qQs7eHtcBmsHrZUjZw2vvBdhE+hsIaJix4keIISweKt+94WeU/ZR1K4xykHRD5ihLdYNjN9u+iWGc314Xu4BPO2CSX/NtwMkEte9QxsLp+iYAUSMhFL87Mw6WwT8PxjlmVF1EqYAdD8WXkiy3CnFDQsxIwtXqJWT+4oovb34zWYFbWobtqxw2GIej6A9Bibgejg/wsODmlI5kgqKYoM+xnAE7viBNvgyKh4q7+S3bhRBW4+FCKEtnL41hqMHlxLkjqGZLDVi1GfeW+FGrR3/qtjQnOHa4RY1elcDk0s4f1RxGILAYPsBmtala6WdjZdHwXFIMqjFTVwaKdqJWKPk74OzQXifvHV0OPT9GJpcSiiai6I3svvUXiQ2Pu1uDKsM9M2UEOiL+Ed8af/fXdHw4UemPWKNAHsrpHhS9w==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85468d41-4aa7-443c-3753-08d83805c505
X-MS-Exchange-CrossTenant-AuthSource: VI1PR05MB4141.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 23:34:30.5629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIDTNcW1mS/S96K0cKUZrW0oZkmEIe77zROJFlXSpHa5lC34T/Qfl2o4URQukZXuIVNVs6K7nesYv/yzo4TkHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6720
X-MS-Exchange-Transport-Forked: True
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Ralph Campbell <rcampbell@nvidia.com>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 09:29:30AM +1000, Ben Skeggs wrote:
> On Tue, Aug 4, 2020 at 9:19 AM Jason Gunthorpe <jgg@mellanox.com> wrote:
> >
> > On Thu, Jul 30, 2020 at 10:31:45AM -0700, Ralph Campbell wrote:
> > >
> > > On 7/30/20 5:03 AM, Jason Gunthorpe wrote:
> > > > On Thu, Jul 30, 2020 at 07:21:10PM +1000, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > >
> > > > > Today's linux-next merge of the hmm tree got a conflict in:
> > > > >
> > > > >    drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> > > > >
> > > > > between commit:
> > > > >
> > > > >    7763d24f3ba0 ("drm/nouveau/vmm/gp100-: fix mapping 2MB sysmem pages")
> > > > >
> > > > > from the drm tree and commits:
> > > > >
> > > > >    4725c6b82a48 ("nouveau: fix mapping 2MB sysmem pages")
> > > > >    1a77decd0cae ("nouveau: fix storing invalid ptes")
> > > > >
> > > > > from the hmm tree.
> > > > >
> > > > > 7763d24f3ba0 and 4725c6b82a48 are exactly the same patch.
> > > >
> > > > Oh? Ralph? What happened here?
> > >
> > > Ben did email me saying he was planning to take this patch into
> > > his nouveau tree and I did reply to him saying you had also taken it
> > > into your tree and that I had more nouveau/SVM patches for you on the way.
> > > So, I'm not sure what happened.
> >
> > Well no answer from Ben and it looks like it is in the main DRM tree,
> > so I will drop the 4725c6b82a48 patch from hmm.
> My apologies, both for this slipping past me, and for the trouble.  I
> did mean to drop that patch from my tree before sending it on to Dave.

No worries, it looks like I can't drop it anyhow as the later
1a77decd0cae really does thoroughly depend on it. :(

Thanks!
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
