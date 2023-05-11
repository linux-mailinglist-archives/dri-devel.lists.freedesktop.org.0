Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73696FF45C
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 16:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D349010E27F;
	Thu, 11 May 2023 14:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2113.outbound.protection.outlook.com [40.107.244.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AA110E28E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 14:31:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVGpAdI1kymaxAzEg9Pj1U7V59oKT5m77l5+HKVvFA1zfqJj2bcBv8kDE6q2CGxyR4bxgD4/8+E35898ZDFtIlVvv7qN2jfEYYzDy61CSNeoCEkLuNgpYsVi2YZHWEbVyHSx+KmzV4Fh+06Tu8bvJa4UO61TnZ9HmYj06KeHHnvwoRzJ0PB764CatR2BM2TD8dL4Stkv49xbx3B7fcyfNRrBeQoYZEt0qRzBaYVXfhNvDbgLtjrO1h75jB76WO/NOE3mBSJ4/+Fgx4te+J1UkIQVheLzwOG8HNkzvut7hNqFgdnxdYN7tlSs2A/N6yRct7U/ta6M36/lg6k0yKe67A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hS3/Hc1PAJjBHrdbK44eSRRCjuYuz1RZ1HLgWrUEqYg=;
 b=VoQCg63IbGRGRW1HZE3787b0zZbie7oqLNfNOQUm6WbN3GcJa/VDvqt0Gds3V4SRWpiE81DPXewyObStsFWEQX9Iws0XFSRtEGqNzULeemWSEazR5XZlh0W7n0NLIdGzabt9rpzqlrDhehVerZVUxgNCtzTeYmyY9jUzl5ZoCz59+g72c1IsFtSrIUjZpqXF4/lvdH/BobpVRPlQht9x69J40IPdsSowIl0JMEGb+aiJNn313tz310Ys2ZppuiTQPxu97pYNYOqJo+pkjZdo2OrA7Yf8l6Ip/YLPhrLXgoUk2p6PGIIDca6iCNLQPA4a/Sc8jid1nZH4nP8rzxtiOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hS3/Hc1PAJjBHrdbK44eSRRCjuYuz1RZ1HLgWrUEqYg=;
 b=UGFCKoFHM3WM7Z1hDRTkMijoemMj+MXP8ozMFpUsfgtAq6VO5i7aeb6KLzeYu/bFAe6iGQbRfOON0QEKC00PjtVus+mte3XS4SZXX7i+h3XMtoRtO0KhPcNNNqC5dc4tclV9TFxoCjVNyJGgH1MaRdTz5UXnwtxTqR4OW2UGADo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SN4PR13MB5677.namprd13.prod.outlook.com (2603:10b6:806:21d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Thu, 11 May
 2023 14:31:41 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34%5]) with mapi id 15.20.6387.020; Thu, 11 May 2023
 14:31:41 +0000
Date: Thu, 11 May 2023 16:31:29 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH 05/10] net: ethernet: i825xx: Replace GPL boilerplate
 with SPDX identifier
Message-ID: <ZFz8QT/HpSABMFti@corigine.com>
References: <20230511133406.78155-1-bagasdotme@gmail.com>
 <20230511133406.78155-6-bagasdotme@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511133406.78155-6-bagasdotme@gmail.com>
X-ClientProxiedBy: AM3PR05CA0125.eurprd05.prod.outlook.com
 (2603:10a6:207:2::27) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|SN4PR13MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: 5231ca39-d55e-481a-fb1a-08db522c6fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ChKK1hfjz0BnQZRM+ps8rCjbQi0xb4u3dRj6ZUuNr+lTRPARqHxRMLpo0tqawjk3FyG9ssQyHLgc9V+2ysmY/0aJz0iW8RLVzRkbuQ3ntNAQ6wN05LneJbZf3vCXu54GaRd0F3LZAbE6jddRCiqXx9+tezXJcQxzDKjZG7EdzEN/Syc+mte8GqC1xoqW7oAAlRd3b43zDePBH0FCi0Agv98TqLCrzWzCRdNG36Ah5UZ7E22iSE5grdGNgPoZxuYBX1CrmV7CNCwL6rv62ahM82C+PiG/D0GdiJu2arfL1XZTKqRZQoypVfgGVqC8Jz2ZX/pDT3A0WA5Y74wWwmScYEDjTdJjmjJIef2Gzupc3EB3gneOAG7KNb0PthBAqnwf3CkjjHPxWzyF/y+gfaqZLnXz35R3QCe7KN8T+hR+S4PTT6Lge4wMuP+dSWzPktzvxk060QYx14zA5G8Ta3qxy5H8MXKbA+oJ/c/PySEnNMLO/AbwWLPpTGwP+/jypR29OL4x68TRGDzGenPkz66J3sLMcwLZiKHCDXMNtE2AM0sxbS4gU82gM1WBgmif6tvYO1qSoAvGBvzyH3vMwrYCJ/mmnGVU6VcmywBHhLrspdEd32TKSOsB+NyRjZ9sKQDd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39840400004)(136003)(346002)(366004)(376002)(396003)(451199021)(2616005)(6666004)(36756003)(6486002)(83380400001)(86362001)(6512007)(6506007)(186003)(41300700001)(5660300002)(2906002)(44832011)(38100700002)(54906003)(4744005)(4326008)(66476007)(478600001)(66946007)(66556008)(316002)(6916009)(8936002)(7406005)(7416002)(8676002)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4begxVX8d4po8sJIu1MFbcLBjDACzA+XTRtYIN8gv4jW6KA/4OlZcShbXqWh?=
 =?us-ascii?Q?/BoJdFlHFxJ/O6BR7V+OWkXqtuh932Dz8ATJMsd9FXOmMqTF8O4s4wbpaRMz?=
 =?us-ascii?Q?PWshSf/Va7XlYF0gVLbUBO+3Y0RNNg0bymuVaeMPOFOq7RxPfeodE6MgYCyE?=
 =?us-ascii?Q?e0C2h2RL1F9kSb0o7wW6ajCUVzIeOMI83G0UL25htDqg8EnVEOkJuNuuAatP?=
 =?us-ascii?Q?VY6FLRkztyZFfwpeGb1lojII2PAZp6YbUpf/YxGyIRhM0EWFAcp0uq04z8gr?=
 =?us-ascii?Q?NrQ+ycoslNgbUV85R2HSleNUCC8jd9fh0XPljQsAd3J4xSuan0l8DJBG5WD5?=
 =?us-ascii?Q?zvELWoTkTwKh3fAf4QRAqiAFryW7U5gDorVT7YxNzr2XK+dX1TukHEl5QaKQ?=
 =?us-ascii?Q?q6CKC/4x0yLOyRqzHWgR8Is21qZD415xCVWxFe4bKHM2sYCj/eRepPw/9hpP?=
 =?us-ascii?Q?/u9gH3fzzIzpetyg6ONTnR0HwwurZHRWpJpPaMFerEPoArp2quVb9lqflqAi?=
 =?us-ascii?Q?mxJJ/JyhN6XHAzk9Tvhh1bIa3j3yqxBJiht4/OeUaVCRbI2W0Dw5RfsI6hi1?=
 =?us-ascii?Q?shujO9wOqJZuTk2QUGtWyNLkDZgxeKD48RBIoyPhVZ7iaGAlW8/Feu2kILCq?=
 =?us-ascii?Q?hd3QY14PLyikI9TNB1wmAt6Z02NnZUiYnPe6f8pGfMivtcfSCl4oEQpk3HKW?=
 =?us-ascii?Q?4LFWl0UloB79uUki7BKNvEuQkse1h8asdhSLc9k+SWutuKEY12P7KVHxAopd?=
 =?us-ascii?Q?R3ptXLT+47x+FdAxS+xmrC0M3XH7im6EO0F8Em2y8U0pK7Lt7ZCKY23zF8BE?=
 =?us-ascii?Q?uWpXiHDOuOde1RhlH3EABFdeDC+CTiXR2pDhtU3/0S5nszFpjxsJVlk7pmhd?=
 =?us-ascii?Q?2Yhs6SAF3CmLOPNAtMjUHQ8WQeZHGs05+pkNIAWiNPzX7eTAnV74cGfMx49t?=
 =?us-ascii?Q?wcgGEBSXbv7e3yKKMZQIj8l68BJ6i+53FCiM4puTszZ+tejkASk6AZNPO2BZ?=
 =?us-ascii?Q?B4kGaEw+Ne+14vElEEfOMJjZOxtnvD8Di0REspOg0VkZQ0ocN2mu4JBqRKIP?=
 =?us-ascii?Q?aOZaUQVIfNLGOkbAOFKKLdw5c9KIu2BzONYsTjYygcBi4J2PhJTzreSNG+2J?=
 =?us-ascii?Q?Wvve2lPPpAlJqehPX/vPxRrPvFsMSNMqN6PUETTyCMnhDEDGNcPIR2dqQqYY?=
 =?us-ascii?Q?sY/doD41plSjTUayWUSz4Xsd5PbpaAc1RmKl8tjh7+zIERRFZpDiKzCJZCqK?=
 =?us-ascii?Q?G2CuV2KqCD2lVDqm3pZ2rnLQw+N4W5NLCOcouGoSfU+GOP+FtEYXlTZM3qWp?=
 =?us-ascii?Q?1qFhlSvKcl5A38kL47vpdXNL6vxFhSaYUvWLXrzo+Z1yJM6YDF00eRpl03am?=
 =?us-ascii?Q?dGACs99ul34eq0pwm4i2GNDQEHZPdsAIxcYz0SPDCJmFvVX620LY3ErtJr/a?=
 =?us-ascii?Q?GlGqXd500SfsOACFK0PE8YHHTZ15He0Fc8Q9R2UxPAiaC0ZZvh32twt/UNxZ?=
 =?us-ascii?Q?7p1st9I4mqy2qWWful3huC+1DcrF5pO2KXQf3OKb7So1Iursery2SvZJUFZH?=
 =?us-ascii?Q?To4UrVIP9CFk4X/HbFRA988OfalXSSdMWg9t5xW47/JYhNJrk0ZOBqguXpaH?=
 =?us-ascii?Q?OEXcGp8YDxL0InZPP+P5ZULmDg0Hh1Obgwrgg19jGw0rYQKS6A6pNGFf1PZ5?=
 =?us-ascii?Q?haZtbw=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5231ca39-d55e-481a-fb1a-08db522c6fd0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:31:41.4284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtpPBOr9kVpWtR3RaDoeaR/F1JFG71zmqhhV01ZJYXnX9CvnDdGjHRRitx5/OhsLOgNVSeh1kG2ceqrEOI9LDDNWqCBAliZiHbzr+tOmDkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR13MB5677
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>, Tom Rix <trix@redhat.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Eric Dumazet <edumazet@google.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Andy Gospodarek <andy@greyhouse.net>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Minghao Chi <chi.minghao@zte.com.cn>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Archana <craechal@gmail.com>, Yang Yingliang <yangyingliang@huawei.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Sam Creasey <sammy@sammy.net>, Donald Becker <becker@scyld.com>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Jay Vosburgh <j.vosburgh@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Michael Hipp <hippm@informatik.uni-tuebingen.de>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Karsten Keil <isdn@linux-pingi.de>, Deepak R Varma <drv@mailo.com>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Diederik de Haas <didi.debian@cknow.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 08:34:01PM +0700, Bagas Sanjaya wrote:
> Replace unversioned GPL boilerplate notice on remaining i825xx files
> with appropriate SPDX identifier. For files that contains "extension to
> Linux kernel", use GPL 2.0, otherwise GPL 1.0+.
> 
> Cc: Donald Becker <becker@scyld.com>
> Cc: Michael Hipp <hippm@informatik.uni-tuebingen.de>
> Cc: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Simon Horman <simon.horman@corigine.com>
