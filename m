Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3B52234D1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 08:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666DF6ECE0;
	Fri, 17 Jul 2020 06:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40086ECE0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 06:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zVKv5MybxWO155NTi0lS+pf114SxiytmH+2X+BzUyA=;
 b=bKdsndnGz9P0SaTuenBbO6X+zTPjmLndhhUPayD5iNZZRexElxumITpf8U/jaSZrES+FIx/D2rUQT9X6RKKVYZxyYslo7sJNfMOz54S00K/grtqYhfHcMD0tM3EZtCM7FZ1ao7QE4MNjKnd+VxTvlZQA5KWS9La56x0W6xr8pmw=
Received: from AM6P194CA0003.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::16)
 by VE1PR08MB4845.eurprd08.prod.outlook.com (2603:10a6:802:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 17 Jul
 2020 06:40:31 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::69) by AM6P194CA0003.outlook.office365.com
 (2603:10a6:209:90::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Fri, 17 Jul 2020 06:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 06:40:31 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62");
 Fri, 17 Jul 2020 06:40:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5ffc6090f2e03f9
X-CR-MTA-TID: 64aa7808
Received: from e59d4340bcc0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E640413-5317-40EF-90D5-11E4C4166107.1; 
 Fri, 17 Jul 2020 06:40:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e59d4340bcc0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 06:40:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnQ/cWPYb9Do9THmPEGRYirRvrO+Tfnuowrg5CYCie44MoKZsqefzFO7BAysSXvN3gHpOix1FXc/qhp9HDfpF1mR8Wb/jdksTuJEyPQEjnwqnzMUG1fgIwJ8aMqHMqHUyKMs6WzpD+UnIOsIpBtUXi2W8/3osoPDUUWTCGYb2y8gKA+g4wFyjsRKeWaSy1R3nBouxE8VgBZRlx9cdnbNj3k7AI1EeHhRJm4JcE92v+GQayI8M7xAssA6MBEqN3qF65Z6Zah+yY1thA1iCe/Y3qAx5KX+jaIsWbtmnuV5hyQ5mOKJzQIVULoWOjJ6GIYS3Lyo+yypRQTGB3k7T6H2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zVKv5MybxWO155NTi0lS+pf114SxiytmH+2X+BzUyA=;
 b=V4dwiLVNQGpC+pXQ9oS2mZT8RdVUDFT3I0mLb6+3JlpFzT5TkivsoUKcEJ7IgqrA9q6Mogb4wUiefgcmZXC5XFcxvlpaUNAg0bJAOWPbuHRNl+nRqe/qh8nitCC1keQL5MTrhOwE+mPzdcjrh7Eo+t5mzOXIwmutcn3BYj653NoiXQyLVjp2hfxjxBJ0LXub1WORJQ/3bx3lfib1EwRVTNnqwEefJzAmLuSUYWfNpNEGqbUfTkzdP4yy3445apjEN0pTCkqTYNJsJOEEixZrd6LC5aL6CamvSXPG5N30NQw6qzGjZud7WNRq2c+WJyw5VFBv4JOZImDD8qj5e1CIFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zVKv5MybxWO155NTi0lS+pf114SxiytmH+2X+BzUyA=;
 b=bKdsndnGz9P0SaTuenBbO6X+zTPjmLndhhUPayD5iNZZRexElxumITpf8U/jaSZrES+FIx/D2rUQT9X6RKKVYZxyYslo7sJNfMOz54S00K/grtqYhfHcMD0tM3EZtCM7FZ1ao7QE4MNjKnd+VxTvlZQA5KWS9La56x0W6xr8pmw=
Authentication-Results-Original: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=arm.com;
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com (2603:10a6:4:3a::18)
 by DBBPR08MB4661.eurprd08.prod.outlook.com (2603:10a6:10:d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 06:40:23 +0000
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef]) by DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef%12]) with mapi id 15.20.3174.027; Fri, 17 Jul
 2020 06:40:23 +0000
Date: Fri, 17 Jul 2020 14:40:17 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] drm/komeda: Convert to DEFINE_SHOW_ATTRIBUTE
Message-ID: <20200717064017.GA76612@jamwan02-TSP300>
References: <20200716090333.13334-1-miaoqinglang@huawei.com>
Content-Disposition: inline
In-Reply-To: <20200716090333.13334-1-miaoqinglang@huawei.com>
X-ClientProxiedBy: SG2PR0401CA0008.apcprd04.prod.outlook.com
 (2603:1096:3:1::18) To DB6PR0801MB1719.eurprd08.prod.outlook.com
 (2603:10a6:4:3a::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (203.126.0.113) by
 SG2PR0401CA0008.apcprd04.prod.outlook.com (2603:1096:3:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.17 via Frontend Transport; Fri, 17 Jul 2020 06:40:22 +0000
X-Originating-IP: [203.126.0.113]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 840fae4f-ab9c-49f9-b1a3-08d82a1c4d09
X-MS-TrafficTypeDiagnostic: DBBPR08MB4661:|VE1PR08MB4845:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB4845B6303EA54095EC456468B37C0@VE1PR08MB4845.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Hy1/NdTR4VlyYMyW4GHE9TMrU5ArRXKsz8KtYTQVmuqkfp20hO2K3jTW2C/fgPAueatPH5041q1cdfr4ggu2RH3tK+zru591S/dxHWn0nQJCyPaQcv5/BeS9BFllucegk9XtXvy+mQlfgt1rs/xuZl2x9oTHGRTKTHVwUAlvRvNsfhhypSpkcauQ7xhDy+5XSZSUvLYfjgbfsd0ZgoWViyxib7DCcSFEiqYvkdBxsN0TY+Bp0wf+jV6oqOW/ax3JdB10uswGWCepA2VpvyYhSvWJaTCDtQI+mCqfHxaFQ3C0xY1MurH+PUX2F9IJiO2Yl4L7TsDoScBFJnmhXH7X4w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB6PR0801MB1719.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(7916004)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(6496006)(8676002)(1076003)(316002)(6916009)(66556008)(9686003)(66946007)(33656002)(186003)(478600001)(956004)(16526019)(5660300002)(86362001)(26005)(33716001)(66476007)(83380400001)(52116002)(8936002)(4326008)(6666004)(6486002)(54906003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 5rB3TEifZnW1Gb4OZy7LgYrKWA8L6l/Y+JpTzB8353fDUAqhY5w85nEWTr5MVGqKtQK2r3DqIBkksV6qs5fXMTSMmPqL4fNpuHm0ue73kZ9hdrjRApDNsZgh7G4WHXsoxqsUc+pahg3P4L29fc67+6OEyP9JrZ8xACbHi11PUPKKz7j+KeTEgpna8oOpY2x6zlF1VFCdr+XgRYrdMlk/CSpaWZ0niC5IvvVptAfAH/Co9EDblbsm8RRTF72bADUtr7ciz556lRAMk713IIK2cb575O7N6pzlYBBbMk7jAaKCa6woCzGBEPUVki7ffx6GoGwFDCCi604MwFpfgj/aRjvS++A11BhRo5CvFTvL91TmA4haK6J/yFNRlr3LGfYcr45Wu+x3zzTck9G0rfu7KpxxdeQ3gu3LX/F/a0/8UX1MIcNN/xr1x1eEf7f65ia9fEkjh+ZiEPxXVOgo3EH/yZmcoxVw3uszHC8J/DevkLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4661
Original-Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(7916004)(346002)(39850400004)(396003)(376002)(136003)(46966005)(316002)(36906005)(8936002)(47076004)(356005)(8676002)(33656002)(1076003)(956004)(336012)(4326008)(83380400001)(6666004)(81166007)(82740400003)(186003)(2906002)(6496006)(70206006)(5660300002)(9686003)(82310400002)(54906003)(33716001)(70586007)(6862004)(478600001)(86362001)(16526019)(26005)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4d29ef94-abc7-404f-201a-08d82a1c4843
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tGi7PrV1IDVSzuAf65/RWO+yuQtft0kmVSw5w132hwZ2ZSOt3zDQYIETHz6hV0Gvu5qChHvIV8QjPhFZ6TUj/KOPH/tD22yoO7kZOoMvWja0HMvdnzezSIBH2+FAqtJ1V0QWPqJZZhi02PqYQjbE+oOpsVleTC7HK5CJVYVei5DU9dwUaPLkfO4WnEDVeRJK+hgqoc8cpbCevR84rsa4j6n+XXiubXAXpooIUncR1BVNIY0uh4KNeVJ8WkCV65bgYgDIs9JD3MfD6whzNeAqnol/yymAEAydMIib14i/JxZTIzrR87g8w/YEW1Pb1icv6ma5b8fP54BDlAyF65nBIjL9a5FJSBp3h8Qc5Lhr4UX2sNk1DaQ2iRLeZfztlyWp0XkYKCRuyZCxoREP8O22Dw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 06:40:31.2227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 840fae4f-ab9c-49f9-b1a3-08d82a1c4d09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4845
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
Cc: Mihail Atanassov <mihail.atanassov@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nd@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 05:03:33PM +0800, Qinglang Miao wrote:
> From: Liu Shixin <liushixin2@huawei.com>
> 
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index 0246b2e94..4a10e6b9e 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -41,18 +41,7 @@ static int komeda_register_show(struct seq_file *sf, void *x)
>  	return 0;
>  }
>  
> -static int komeda_register_open(struct inode *inode, struct file *filp)
> -{
> -	return single_open(filp, komeda_register_show, inode->i_private);
> -}
> -
> -static const struct file_operations komeda_register_fops = {
> -	.owner		= THIS_MODULE,
> -	.open		= komeda_register_open,
> -	.read_iter		= seq_read_iter,
> -	.llseek		= seq_lseek,
> -	.release	= single_release,
> -};
> +DEFINE_SHOW_ATTRIBUTE(komeda_register);
>

Hi Shixin & Qinglang

Thanks for your patch.

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

Since your patch is not for drm-misc-next, so seems better
to leave it to you to merge it. :)

Thanks
James

>  #ifdef CONFIG_DEBUG_FS
>  static void komeda_debugfs_init(struct komeda_dev *mdev)
> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
