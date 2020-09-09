Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C16262D7E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 12:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA3F6EB3F;
	Wed,  9 Sep 2020 10:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80042.outbound.protection.outlook.com [40.107.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23E26EB3F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 10:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuuL+FnqMBPFIV8s7bZ/ccc7AE1EXu2Ez8a/tfNy7dyyxlUgYPHrb9cxkvo7KJRhfXcJE/sdFgILcgZuPlMut2jQWpudwpy4Uy0KqElhiM8Mx7u3bheypewwsl1QgpBi58LkYbis2QylllInJHMF8IjDC54GqV96vzLaAxrT7Mc12ujEm2e4iuG6UyPY3WefC65e2UWkgmZOoUi0WRPi+NJh21bkbDKSJNl8GUz5B5c/WJck9ZQgGqK+s13RRBwK4mocRNwebjyeR9A+4Dxsjb9r57ab4oulRCvQLXWgqcVep4CmdVaaaUUOz1YyJ3kIobMd9wBOLcLdR9ywARRHkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzK+CaaAwNJBPOPMEOBnSZSJh5idvok4Z+vqE2W2bYE=;
 b=DYBdsh+WX0S9oIV4AbboRhhT7vSMZdEvABbK//VR7sWZbAHIQ4bFmToCgOsDPg2OxgBNzjysoFipii3OoYEolbp+qwAtYD76VGoGHyPEV4OwuMVerusAN+2jVCJHzniAxPhH3wtH5QrdhozP145ICjG2HN8UYB9wAemqLGu5rJwbYuYMK0GA++M+5l+oRPFHzU7MBrNvPOjKbXgbZYfSF+NiWOyrwwkyNvFulxH2pUTXEXH2Pc5iDdpHcKnjWGXXmpNToxL2KjWSNtodt7VIXtgSBSKlouYCSDqHx4DYc+2ItgiG5ikRs1ki+l/Z2lz+zAdNGuuSPi1uX6l0l2b6qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzK+CaaAwNJBPOPMEOBnSZSJh5idvok4Z+vqE2W2bYE=;
 b=DxXoTzicwmpjZ/cqWC3Y5FVaA6leIVl7uXoFeoi6E4N6lwgCAy3nUjlFlV9aFofk9fz5iLFG2zPeNhy9AWMg4iV08lrJ7VaZKw7TIS/BJ1Lb5dqK7tscbfrdvUCDSGKkwFX67SJUU4as0KynruxBVEA0/xOjHRwAso21647Oauo=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4478.eurprd04.prod.outlook.com
 (2603:10a6:803:67::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 10:57:33 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3%6]) with mapi id 15.20.3370.016; Wed, 9 Sep 2020
 10:57:33 +0000
Date: Wed, 9 Sep 2020 13:57:28 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Lucas Stach <l.stach@pengutronix.de>
Subject: per-plane LUTs and CSCs?
Message-ID: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM3PR05CA0133.eurprd05.prod.outlook.com
 (2603:10a6:207:3::11) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM3PR05CA0133.eurprd05.prod.outlook.com (2603:10a6:207:3::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Wed, 9 Sep 2020 10:57:32 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77ac8928-0f2a-4f07-c4f8-08d854af2758
X-MS-TrafficTypeDiagnostic: VI1PR04MB4478:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4478E8F7BE19F49FE2D978D8BE260@VI1PR04MB4478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T+rRhScumQe09r+1rVa2DarC6SBUZg+it4w04gRDiRsi9Cn0wWs+Ei7xExKod4yMBIQZDevt3BJKR1QEv3q7j8GOOn+E0WV+LbbmQO2M1M0LOw57/1QqZTHYbfJF3RsthMT69tE1je54h7jvwOOMIrWpyEHyXLguCXH133Mo3dJCXIcybKG4BxkVHuvcVr2cMANOLK/5wYn3f9z0ns0bHNNFudauEo+yZJagq8m2RdXjNOBjOyr9QckB3PJMDWXMnEZgYDjDo7Fvt8Q3IaupEodG2s2vhDZV5t+y899q5BBJEqt7eijfEKAXYIwK9uoF4VFidxjT2UIcy1zaW79ucQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(2906002)(52116002)(83380400001)(26005)(316002)(16526019)(6496006)(66476007)(478600001)(186003)(66946007)(110136005)(8676002)(66556008)(9686003)(55016002)(8936002)(4326008)(956004)(44832011)(33716001)(5660300002)(1076003)(6666004)(86362001)(3480700007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: v2SvE9yDEuqMPiN8CYtL2vZNgfLhSL4nrMahRlYeaU7MLgNhyxA66A+RU0FPi/MN9wAuLdtSprqbsIqFPQkcvHbYoN4IgFFBl3LHyqzMKIYMzJWJGrw0/heIGYMhd1FoqawcDAsG28ynzYC+aVG8PUniwS0IcHysyIxzEKvYH0OiEsM2fDXq3eqnKvMKTUU+zYp/FsJCIEsccZ9jTscJGBsWQ0bt7wMzGQL5B1YumIbQdqBMTC3FWakfP6DW1hRLLLkmAzl9dKXEhkxpI7PQ2SCwTthuQQHBH3nX/b4eGqfHjSS1AZAfqw5scQ79d6FVIvGthe5SfT/MN83DIFrgnj3x8HmfLRV5LpNWlymgq/wvPVk2Ai2N0T2xbj86KNcCAzVWQS1wyPpELlcj/XIBWNAn7w4x81061WJZDUmGhYvvURTfBrip8N0rWcIfHC3RrCmdP0p/m/kvbdXQyqgxPGYENd8ZajqIM4fway6RcAsGi+TXLVEheXEkwCKxGUWRLINV4sT9AzKEHgBXsON9U7BHv9TJVUARS85mnrAYDUcxm/sVA6vV5tCPssBpJ5/qVHYQ49CGqkDpvfKMTa4U5QN1dQ6fDr+Adz5LJD90EqwT91ph8jC/pa9TfhUHiY6ttPLvngwmqbGYAZL6bEij+A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ac8928-0f2a-4f07-c4f8-08d854af2758
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 10:57:33.1113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //tTcvFmK6/aSV9cCgfv1/K65kyH0VGMCVSgq7e/14/ufx2UwFwYRuHWcPCPAZT1teuxEJytmlT+oKAb1j7gmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4478
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I was wondering whether you could give me an advise on how to proceed further
with the following issue as I'm preparing to upstream the next set of patches
for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
respectively. Then the output from those 3 pipes is blended together and then
gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
needed.

Currently, downstream, we have all those CSCs and LUTs hard-coded into a header
file. Based on the colorspace, range, gamut selected for the output and/or
plane input, we pick up the right CSCs and LUTs from that header file to
configure our pipes... I guess this solution does the job, userspace doesn't
need to care much about how to generate those tables. But, it's also not very
flexible in case there is an app smart enough to know and actually generate
their own custom tables. :/

Looking through the dri-devel archives, I've seen that there was a tentative to
implement a more or less generic per-plane LUT/CSC solution but it didn't make
it in due to lack of userspace consumers...

Adding CSC and degamma LUT properties for each plane as well as a gamma
LUT and CSC for CRTC, would help get rid of the LUT/CSC header and rely
entirely on userspace to fill in those tables. But userspace has to know
how to generate those LUTs and colorspace conversion matrices in the
first place...

So, how should I continue with this one? Any pointers?

Thanks,
Laurentiu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
