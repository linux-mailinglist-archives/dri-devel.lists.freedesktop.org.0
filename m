Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AA523280D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 01:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8A86E802;
	Wed, 29 Jul 2020 23:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC556E802
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 23:26:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fc3omy0PLEChE00f+WcGXW+GU3/ERMfvRuPnG58LEIgFQuSbuCDq2LZR6U1+f8OuiPnEt0FO5YLmNsCvbUit/4jhd4fSBwjN2JihU4B9PsgHuo75c7kkrWLhNtw+e0zd/yui3uAiHcSbMPa87qS0oLRlbkBujnW1LUvWLIT3Qp69TcYdjYxKsQBrzJyGvHs4YyZ2aXlmAb0qX0IAAdPPPmxrAqwT7ZQyqUTSEy2HvbCXNp9NJD/50OwoeZPyP1NP/ePA5vWl3cQrniL/u7vwQLcNbeeKsnKI1ZjBCxx8YTARL44bgiu7L7tlVisDjjH3gvMvCyGFyFLoa+jH2wNWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3cdnUT4KfJPxSb7cRibhRger9fPEuCTF5XA4IvzBqw=;
 b=ABiQJh9UTAvC5RNCn5ptP7mxlS2LmdjFYjqO45BHl8gEe88VxP+LcQPqhXg0v1y7iLHJh1sdNsq+v10Ynk7Tbx7AAfJ7RF28phOoJuUslq4BOctEJSUZ6kl/f2YizTb2JpfV8Mr4lucEjSwus4zrV5kj7MyY3kp5eEj6o9tTdWSVxfwv9tLh703jT3Qz2yPgdNEJuBqIefZM9dqcFac6nYX4z1cANh27cbWiHGuNjTk3qu2hWaxqmGikJW3tioSl2y5VQx19SDQhSXtPIlJq8sN/aCKYCTqTcLQUuirClQOMUmHRnkzvwnLwbbS70qKgoIiCo45WAe4TUNDIfL2D9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=oracle.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3cdnUT4KfJPxSb7cRibhRger9fPEuCTF5XA4IvzBqw=;
 b=HAxXsF2SaM6rYs9cshHP2HXk3GTF1d0f2NnxYNqh3L/HNh2Nv6NYi2fwbiPrIK62B+urT+CVLLJVMzx4+JKjpQCDcuXZm3pd9Lj9p8bj1eMPt6u6hvGwXEPLvi0WzwkTYQqfeIzWGsZFc33l/e6Ydav8I0LFmdqXvdGyE7faRnI=
Received: from SN6PR08CA0010.namprd08.prod.outlook.com (2603:10b6:805:66::23)
 by DM6PR02MB4890.namprd02.prod.outlook.com (2603:10b6:5:fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Wed, 29 Jul
 2020 23:26:05 +0000
Received: from SN1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:66:cafe::cd) by SN6PR08CA0010.outlook.office365.com
 (2603:10b6:805:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Wed, 29 Jul 2020 23:26:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT019.mail.protection.outlook.com (10.152.72.130) with Microsoft SMTP
 Server id 15.20.3239.17 via Frontend Transport; Wed, 29 Jul 2020 23:26:05
 +0000
Received: from [149.199.38.66] (port=59225 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0vQX-0005jX-Md; Wed, 29 Jul 2020 16:24:01 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0vSW-0007DK-PQ; Wed, 29 Jul 2020 16:26:04 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06TNPsZN006213; 
 Wed, 29 Jul 2020 16:25:55 -0700
Received: from [172.19.2.244] (helo=xsjhyunkubuntu)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0vSM-0007Bj-U1; Wed, 29 Jul 2020 16:25:54 -0700
Received: by xsjhyunkubuntu (Postfix, from userid 13638)
 id CFB242C1BFF; Wed, 29 Jul 2020 16:22:02 -0700 (PDT)
Date: Wed, 29 Jul 2020 16:22:02 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/1] drm: xlnx: zynqmp: Stop the loop at lowest link rate
 without check
Message-ID: <20200729232201.GA6469@xilinx.com>
References: <1596046674-29155-1-git-send-email-hyun.kwon@xilinx.com>
 <CAKMK7uGBrACy_sP7h35W=6=R94OG3in3E7JiTMp5Kk-hcfkAcw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGBrACy_sP7h35W=6=R94OG3in3E7JiTMp5Kk-hcfkAcw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d80b2b7b-28f5-4c29-fd9b-08d83416c3be
X-MS-TrafficTypeDiagnostic: DM6PR02MB4890:
X-Microsoft-Antispam-PRVS: <DM6PR02MB489034B3DCED9741CA3C45EED6700@DM6PR02MB4890.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N5eGCgNnz1vWnyHpcZcZhVSmj9MYK8I/7isFZ0J6GUev5DcQcwMnWgdQv6ZICc/lZAtBEF0atMCgSjL8reM6/4tf0dSWkNmQ9xyeLLm1gPnJEo405IAq4HJgxdTBcro+R+7hgXis3cd7BoEJCR0F5+7eYz1qjyvz/QlEvA2sMMBZInHq7zo1zI6GnigayV/XfZkRu2sLZbtwnS8c6acDIuzPvxoH2YK2HEq3q18xfFENKj+Z2V8YT9sEUnOkZGe6Xb4jrIms7ZzreG1GTD3ging3Vdv4f0+762pndZ+fU/VWxbdEU3Cxk4jbl4G3ResV9f9nKTbA2rHNrHaApcZ0WUETv6pEpjmLgfAFJVR7YZQ/TrTzUbeZB108iM8neR+e6kgofdB+k08uNlrLPAnFYMSaryfAw6wsKf4b52WuSZrsVRH4bi3dBxDmQ79oLe1D1pb+EUWMX9YsmyZUxF9SnUqzPfQK8kYzsrGQF8yhSSAHu53emkk8uwOKr6dfpUZb
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(396003)(346002)(136003)(376002)(46966005)(36756003)(6266002)(966005)(5660300002)(6916009)(47076004)(26005)(33656002)(186003)(8936002)(53546011)(83380400001)(54906003)(8676002)(4326008)(70206006)(1076003)(336012)(316002)(82740400003)(82310400002)(70586007)(356005)(2906002)(44832011)(83080400001)(2616005)(81166007)(426003)(478600001)(42186006)(16453002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 23:26:05.0863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d80b2b7b-28f5-4c29-fd9b-08d83416c3be
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4890
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thanks for the review.

On Wed, Jul 29, 2020 at 02:34:16PM -0700, Daniel Vetter wrote:
> On Wed, Jul 29, 2020 at 8:21 PM Hyun Kwon <hyun.kwon@xilinx.com> wrote:
> >
> > The loop should exit at the lowest link rate, so break the loop
> > at the lowest link rate without check. The check is always true
> > because lowest link rate is smaller than current one and maximum
> > of current display. Otherwise, it may be seen as the loop can
> > potentially result in negative array offset.
> >
> > The patch d76271d22694: "drm: xlnx: DRM/KMS driver for Xilinx ZynqMP
> > DisplayPort Subsystem" from Jul 7, 2018, leads to the following
> > static checker warning:
> >
> >         drivers/gpu/drm/xlnx/zynqmp_dp.c:594 zynqmp_dp_mode_configure()
> >         error: iterator underflow 'bws' (-1)-2
> >
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index b735072..1be2b19 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -579,7 +579,7 @@ static int zynqmp_dp_mode_configure(struct zynqmp_dp *dp, int pclock,
> >                 return -EINVAL;
> >         }
> >
> > -       for (i = ARRAY_SIZE(bws) - 1; i >= 0; i--) {
> > +       for (i = ARRAY_SIZE(bws) - 1; i > 0; i--) {
> 
> But now we don't go through the lowest element anymore, which also
> looks wrong. Or I'm blind.
> 

Currently, the lowest element always breaks without decrement by the check of
the loop.

> I think the problem is later on that we should bail out of the loop on
> the last iteration (when i == 0) before we decrement, since otherwise
> we then look at bws[-1] in the next loop, which is clearly wrong. I
> guess your code results in the same, but it's very confusing logic for
> me ...

Indeed. I can convert the for loop into switch - case in v2. Hope it makes less
confusing. :)

Thanks,
-hyun

> -Daniel
> 
> >                 if (current_bw && bws[i] >= current_bw)
> >                         continue;
> >
> > --
> > 2.7.4
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
