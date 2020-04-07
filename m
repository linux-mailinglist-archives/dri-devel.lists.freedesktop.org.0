Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C860C1A08E2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FEC89D5F;
	Tue,  7 Apr 2020 08:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8489F89D5F;
 Tue,  7 Apr 2020 08:06:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkAPQrDMGtax1MJjnAFGH+Yt1u9CiWAJ91rfX/Rwb/IONbIhm51sVmH7x66KS+ZGm2JxG6EUhMBH04XpakOYs8z+/RsvIgQB+iIsQ4fm1QTexkoOBkgzbtHwgrcwbQv9uIyKTq12TwGCD3hEVM+timtoKNq/5b+ZVYP8vVRfYh496EqWx+mQqWtKe4Y+YCnNfehf35o4vJrTYeIpUTZB1A9FzuXuhVnYOk6z5UMIlxx2s7FxNjyi4lPOcx97ShIFBeouVQ95F4bfM5ShkmULxZTpAZKJM4aeKqOSejQGdjWi6L643AC+JcJSUiPxtctgZnvDqfKpH6b213aIv8+YQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkaVg5kRMeMkZzyy++SucmTdE5xcoKwRr88lUny2Orw=;
 b=cqq+jNw5xOu/UL6GPOvneSBSuCcSmQMTSWAi8gggBlMWir4Ukyfa1a9zm39ev1PF9HCZEZWDmRr8LcIAcw0hLVuFWxWyiPlcOnYqutywhGzQVrdutZULxOs029fbPf/cprS6sKCwQNmsqu883NSP62p9XeQQFECWPS+TX5QRrWH+6BvNlLqylcOWBvpMBpoi6yX/qK1PItokgP6qcGbkr/7jSPBXxiI4elYY7S/6U8xkvACbr2kZO6tETlNU2OItItFP2VnOwNy8ORbSw2cbIbf70/G3VHRGWxwauHfc51631eFqMCHu4nY13klZ8uVCxEFTeA02kXRQaTRekCPUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkaVg5kRMeMkZzyy++SucmTdE5xcoKwRr88lUny2Orw=;
 b=2bKtUIzbJRdX2tEO8m5gjLiKZTZFR1fjnCBCHN097ECQp22lUxZFL5m+xtMXkLyHGU6+B3luNBB7+qIMnkwkrxR/nCsXyTmoGKdAMLJjK0TywLug4YnQ4hoVa1InWG9NKZioh0t/v7dkCiaLwKydksBtMjG69oVdrjG1pr4OIac=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (2603:10b6:208:106::29)
 by MN2PR12MB3344.namprd12.prod.outlook.com (2603:10b6:208:c5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Tue, 7 Apr
 2020 08:06:42 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b%5]) with mapi id 15.20.2878.018; Tue, 7 Apr 2020
 08:06:42 +0000
Date: Tue, 7 Apr 2020 16:06:34 +0800
From: Huang Rui <ray.huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 1/2] drm/ttm: clean up
 ttm_trace_dma_map/ttm_trace_dma_unmap
Message-ID: <20200407080633.GB27094@jenkins-Celadon-RN>
References: <1586241885-25422-1-git-send-email-ray.huang@amd.com>
 <19af654b-ca0b-3077-01bb-939c56b440b6@amd.com>
Content-Disposition: inline
In-Reply-To: <19af654b-ca0b-3077-01bb-939c56b440b6@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: HK2PR02CA0212.apcprd02.prod.outlook.com
 (2603:1096:201:20::24) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jenkins-Celadon-RN (180.167.199.189) by
 HK2PR02CA0212.apcprd02.prod.outlook.com (2603:1096:201:20::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15 via Frontend Transport; Tue, 7 Apr 2020 08:06:41 +0000
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 78c5a7d0-3ead-4689-a15a-08d7daca9b9c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3344:|MN2PR12MB3344:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3344599D665281246E996FD1ECC30@MN2PR12MB3344.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3309.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(54906003)(6636002)(16526019)(26005)(81156014)(9686003)(86362001)(316002)(5660300002)(186003)(478600001)(33716001)(2906002)(33656002)(8676002)(66556008)(55016002)(8936002)(81166006)(1076003)(4326008)(52116002)(450100002)(6666004)(66946007)(66476007)(6862004)(6496006)(956004);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GQ1IhHhVdT4rsc9Oe5pFg3mrQd/1iLZUGTRjCbXygnHnK/FM+eSRc5KYIrlg6rla1F4Eim04+Ra+WJJO5I68k4XYkx2g4tc/SR7wEs9eECzZWXTHhmNqqjgSxsBUuU1WeKGcnbbIk21f1xlJk3KVgPGOuW5V4vkHsUn0hsPy+rM7uq0FjYx36E0D9JHL3kLIeZUrjfMvwUJIO9iLBp9d3df35huZpGqTj5uUqJoBq1i37AXyU6QJcp9Yx4oiK9tPDvNfPeF7Cv7ujMRy9Ixp1y578FBl8EkfZmFz9cXoTSJodgs0pXFOqVVDfvQ8tJPkS20qfTAdfJ3QdYjHrlgoSdEmu2LaIHTjT2ERdqhKlrfVp8po9fnp5zuzcYGfsIubMcmB2lgjKGCSFjXlRu3wa6FhuXU/HqY5Y1wtSsiuvJhn2wMlbA47f96JjbgHKn1+
X-MS-Exchange-AntiSpam-MessageData: iLNKbedgc7+b5Ni/OalqZKQIPbCCxZS9JZ9IQ9IOh4An86/Gz1+53r6QB4aAHia4KhJ29r+m69pRmgA+SPAduSaaLUCIS0/j5Y4mOuQv9tLlE6VTgZQISQWb0JkiwvblA0OpuxtOQW40yz+528/Z/Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c5a7d0-3ead-4689-a15a-08d7daca9b9c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2020 08:06:42.8275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+dFBnSExJsUMrAjtjT/sGfQ7ohH91jkIicgKgPNnr3R1phKNlP3mpQnPBXW/d+SomrGgRbouO0ZAoTzOCiOtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3344
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 03:06:01PM +0800, Koenig, Christian wrote:
> Am 07.04.20 um 08:44 schrieb Huang Rui:
> > ttm_trace_dma_map/ttm_trace_dma_unmap is never used anymore. Move the pr_fmt
> > prefix into this header.
> >
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> >   include/drm/ttm/ttm_debug.h | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/drm/ttm/ttm_debug.h b/include/drm/ttm/ttm_debug.h
> > index b5e460f..bd7cf37 100644
> > --- a/include/drm/ttm/ttm_debug.h
> > +++ b/include/drm/ttm/ttm_debug.h
> > @@ -27,5 +27,5 @@
> >   /*
> >    * Authors: Tom St Denis <tom.stdenis@amd.com>
> >    */
> > -extern void ttm_trace_dma_map(struct device *dev, struct ttm_dma_tt *tt);
> > -extern void ttm_trace_dma_unmap(struct device *dev, struct ttm_dma_tt *tt);
> 
> I would just completely remove the file since it isn't used any more.
> 
> > +
> > +#define pr_fmt(fmt) "[TTM] " fmt
> 
> Oh, that is most likely not a good idea. The pr_fmt define should be set 
> for each file individually or otherwise we could accidentally include 
> the file in a driver.
> 

OK. I will modify the patch to remove the header completely.

Thanks,
Ray

> Regards,
> Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
