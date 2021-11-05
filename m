Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D3D445E6C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 04:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931916E845;
	Fri,  5 Nov 2021 03:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2100.outbound.protection.outlook.com [40.107.243.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBF96E845
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 03:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mt4PYwHPMWoGHqbbB+Vsqwk6Lly/NZK/s8yK2QuPkX7mbGjI70WXvFC8IO1agKChPoy7R/uDQqBd87yu3KcBSq9rXktLuRj/Hdgyov/jfvACITg1WpC4btN9zSPG75EIpDQKxMaftj1FHSctXFC2MDqfc4sOcUiI7ERaK8o2MFQb/Th7rDFZjsD+OELuG7MxQk35sBykwazWay9aL994hcN1U4s8zGG3YoSEF4/AwA4JwbgdnyXhg84a1sJ8xMzUCag1eegVdX0KmRVuus/LR3dXBxieiCr9ve3wAXhWP9SiBOZZt8AYUy+t6clDy0NnLJix45xbEaDQa+Qb4GUP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJbBe0VJFzKQHAIB/RY6deI9U1B4/NMCK4yE4uNA/NY=;
 b=K4WVZ3YbFzywzUVHUDhhdX2xJoqpI9p45JNyZZCmW6i5cB5N9U6jKdlsakS+HfKYvE66W+THjZZiPR/iEEJOv7j/i9tXBCrblvt3n1f4EB57wTPKPGZoDY+s94d+xJ77LsvvXhQMugYBMdZFKKd40rUAFwxCZYOMt4scJEyO2/BMt/VOTsqd6yKqK+ArcvWFNHKJclbr7hUndlQu9KnViZVXLm9h22al0g3bVdYLB4ds1oJNiUePuRJsgqoL0ir2h9gD/C2eLZ68CGcAi9tabKxRSrtnv7lqxFtNVX7qnr/3K9TSPwVyHMNk0iRNru941GVsPKQyl8n9IWNbjKAguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJbBe0VJFzKQHAIB/RY6deI9U1B4/NMCK4yE4uNA/NY=;
 b=LTWI3ccDyBslqVqHpPOooOWMjgD4v4ajiEBstQcXk7eCN3pn5XF31f+ueVE+hNCDe8jO/5B7LLDfTNE7Z1/A4TK3Nr6OQWFw6JptdBwuAhaET8xEX1uddynSTsuQIc//RxVGnLUX8PmUD38rP6CzPeAczU06NHc2VmldYH9JKmI=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6568.namprd04.prod.outlook.com (2603:10b6:a03:1de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 03:07:08 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 03:07:07 +0000
Date: Fri, 5 Nov 2021 11:07:02 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v12 0/4] Add MIPI rx DPI support
Message-ID: <20211105030702.GA2640559@anxtwsw-Precision-3640-Tower>
References: <20211104033331.2634341-1-xji@analogixsemi.com>
 <CAG3jFyuKEdbCptFHSSeGRwyDF_D844NAJXhUdcsiaFC2WvUTeA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyuKEdbCptFHSSeGRwyDF_D844NAJXhUdcsiaFC2WvUTeA@mail.gmail.com>
X-ClientProxiedBy: HK2PR04CA0084.apcprd04.prod.outlook.com
 (2603:1096:202:15::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR04CA0084.apcprd04.prod.outlook.com (2603:1096:202:15::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Fri, 5 Nov 2021 03:07:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fab9265d-285e-4e17-7e30-08d9a00959f8
X-MS-TrafficTypeDiagnostic: BY5PR04MB6568:
X-Microsoft-Antispam-PRVS: <BY5PR04MB6568631CE0EB61420FF316E7C78E9@BY5PR04MB6568.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qoQ+N4Y0Gel+9Bbkk1VNeVuZ7ZGapY9KPcl0z+MR3rvx/D+tps3vodM29ms7ao0ENgFgwL7Bv1nwt6Va5hR2eQRxgcByTauRr8+IMS0v5wUKDZ2QM637H9TUs+tcT1jphA9scF8A258ljUCFsiddWa4a8vXLENY3UT3IFVVTEVgpdfvUtwEr6XlLi1FjbR4ZOmNoE7lfUrFhvMqHvfxYxd18sNHnrkdBUxtM0K0R7G9HwOhha03btUgA3+tbxlVA19Tvj24rpz4HubwTXaqTTFBs32+6akrNh9fh+kRaYgBjDqibYWiYc6bBcqJv7R5vKSoaXBMrt8ghd7Mv13RgVWoc99av0zLP34+Li3BUfhzpYfYIZIXdcv1UfvHwlBI7mWkcDr6C1jCd4eHRUBGIhsQAu8cNK/3K6W1zVri9BqNpmoJ8zmqIK6/YlWDGw7W9kIgIiP7VMwPjyduQ4cojLLpD8i85Mt8InaWYKv1p2gbJpg47+f1gGApPr/zf0h6emtFQcQLUdi3Ahz2INXsZTuly/8gVpXmzoHE6aPblS9gL4zRYOtm2kYGIDrkz+1aPm1xLhD6vhYpi6DN5YLy7KJZykdyY37HQVpRIKVNh+CM3lUvvkG/+KEcNXWUdfjswJhRMht9nNFCBQAukKDgEi+Sl2h4Czzrq2PKgDqQ/bXpMwrDmegbG0OJdjubY/R1b0WcDJlOBFr7hz4nuNj9y2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52116002)(9686003)(55016002)(6666004)(38100700002)(4326008)(6916009)(38350700002)(33656002)(6496006)(7416002)(956004)(5660300002)(508600001)(26005)(55236004)(186003)(8676002)(66476007)(4744005)(107886003)(33716001)(2906002)(66946007)(316002)(1076003)(86362001)(8936002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mXXFxcPbbdAhnDq5xF6QlW3gqjzP75ocjz4Sl3ayxXnSx7LDp5E6XihhqhDk?=
 =?us-ascii?Q?8+F7us0zMUc9S6436WmsHFj6I1qWe5W8KHfMpFN1o3AT3lBqgplMq13jzT5W?=
 =?us-ascii?Q?DZ60YJ3Lv7TRuxJLfv2O7X695oup6VhmXMF0CkNWSDIMoKYE0EYkL1tZbPC1?=
 =?us-ascii?Q?5rkTE5wUlSJRKpbIlwezXKmTqNWR30vKjpGbEp/qvyPq7/RvSZta2pQo5Xqe?=
 =?us-ascii?Q?LXJ/6Rlnr2mZStj5QJW5NhTO6NILOP/4Kg4wj5FHQhOVQUQrF+Lnc9N9no4b?=
 =?us-ascii?Q?b0TtLsZL+tGaNgjjiGSomysXnF3vZ4NmCYYuE1hYQ1tHG8DFi2OGDtuxa8Y8?=
 =?us-ascii?Q?KmWePB8GuDUW60JS7fHvKHNUCg/IFsZ0ubaxf10WJi8nHagKEpBZi7SVDqeh?=
 =?us-ascii?Q?4sfDm3VKaIyccM6qUdIZu7Y64yf3cmeJobiw4cG5eeHQaWprmWQX3G2sXzBn?=
 =?us-ascii?Q?KG7wIfJnbxhas+I3+FaAYcLh+Hdbxm6Dq9VLJISjBXnhh8EglDPD7UGlK7Cc?=
 =?us-ascii?Q?dR9bE5zqHlpiAneSDv29XlVa7fbskwAZZVhEb2X2MXVDQIVWrwJ0iW+9xPe5?=
 =?us-ascii?Q?5g0Vp2mzCafKgT8nvF163PwZtXlW394wLSggOLZj1Ime+omcaz23cMujkBdH?=
 =?us-ascii?Q?KKvIIE4aap4ZIQXupUFj+ZDcic3v9+l6R2ow5u+DfeFmc+oo2JYPcb2Oq4ak?=
 =?us-ascii?Q?nyioEQw//D11LOp3A3DrXCovhmjoISqM0lwM5rJH/kORInXHb4ogWxKYsXIS?=
 =?us-ascii?Q?QPw0lgkRnmzMLs6hzINfMiT1F341l6Vha9FurawoJJGBhdoepbC5MEWF9OqU?=
 =?us-ascii?Q?YOVl2BXVDUKsCZt8eFClNFtLtst1rdEsMEEN+CkL9vUhu8rCf/PMbz/PAnsr?=
 =?us-ascii?Q?25+ETgcbIVrN7/0ec5sVZe4imlNPTtKWCTkiAdYpIza0s9kHnpRLCM03TVRQ?=
 =?us-ascii?Q?pdMA0fKwZe5P7S1HSMX+mFOOxzgnCh0xusTMFABmtVIVe0pMmEjkyyJznqNG?=
 =?us-ascii?Q?zuiwky26S8bvvOGLCgz0Lg1kkN1YM1KIRxcHU2VGjzIIvZQryn0QKUDRq0R0?=
 =?us-ascii?Q?JCvqBWsAuB5yAk9VT0cVhEoXLqmIkulImytPkdCgOeecCQhSzwSfFx//9gxV?=
 =?us-ascii?Q?yTXIV05BUxPjsPAR8/Y4gv+zTB1xwRqUrSmBRJ32ef+Kp8Igfw4FsOQazbgA?=
 =?us-ascii?Q?tLiYAkzRkSDcSFlsVTfcJgtdF3gYfVqNc4yuNSxP2JNKvpfP8ITQ7P4yHyPm?=
 =?us-ascii?Q?qbquNVQ/lO0jQy9MPptdmWx93XL4dsWd/FUyXFJBb8MwXPW0t1IiOZO/QNKl?=
 =?us-ascii?Q?l73OE6gXhnkY8qw5QnuS/ZiHVaYbCYyTShoaD0j9iRk94ji1q9Xo6QEjhs5u?=
 =?us-ascii?Q?+AaQI3NACAX64XGofqyZiseUfMSkpLdi8eduzfA1Z/PHpgM/9GCMZewm8UgD?=
 =?us-ascii?Q?/9MHP5Kjv0BKmQ0/ExMCtjIoRrB7hzi8WZVg6n1vk0g+dRQcmlnm0p06ikVi?=
 =?us-ascii?Q?VbDMLHzHKdvHC7eRbQ0aqvyXgdr173wSyujlfl5FLGNAVX6zumtq+ZBP4i80?=
 =?us-ascii?Q?y4e9hOD7Zxc6OHoy/xe6QpMLBYyFLUGJt9rlfW+/+d9ZeoWMBvvKx7lgShlE?=
 =?us-ascii?Q?gNHIPNpbSVTU4hWhbmosUtc=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab9265d-285e-4e17-7e30-08d9a00959f8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 03:07:07.6055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMUnW9YrKneXQ0n5QB4JejXAD56KkEJAQNSEcBbpRe9RXB2Q8At2rMixYkqWfvy4FYUg+q7q61QXpsl7E3mvPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6568
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
Cc: drinkcat@google.com, jernej.skrabec@gmail.com, pihsun@chromium.org,
 jonas@kwiboo.se, airlied@linux.ie, bliang@analogixsemi.com,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, tzungbi@google.com,
 sam@ravnborg.org, qwen@analogixsemi.com, dan.carpenter@oracle.com,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 11:20:21AM +0100, Robert Foss wrote:
> Hey Xin,
> 
> Applied to drm-misc-next.
> 
> The way this series was submitted to the mailing list is not correct
> and is breaking a lot of tooling. It seems like you used git
> send-email, but the individual patches of the series are not connected
> properly and both b4 and the patchwork tools are not able to handle
> this series properly.
> 
> Please try to use git send-email along the lines of this:
> git send-email -$NBR_PATCHES_IN_SERIES -v$VERSION_OF_SERIES --annotate --to=....
Hi Rob, thanks for the comment, sorry about that. I'll submit v12 by
your command.

Xin
> 
> 
> Rob.
