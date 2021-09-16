Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B390C40ED3F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 00:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBA86E927;
	Thu, 16 Sep 2021 22:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2040.outbound.protection.outlook.com [40.92.42.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8C96E927
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 22:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFxg+BrTHfvRJhY/QLwxe/jONr5i3gY8Y+0a4yHfD66ffbspUJfid+uSrEfLZbnToLAx0zvyAIkvV099MIOUC6duCGWNRoaRIbJ2BxozQt/r8Xu9KLqD+dEqYNI9yWWqLV/gS96+vn74iHRFhWU0h2PXNkWiRFIAMdG/fFDMjKv5bHBMcz2leVtsIHssvvx2sNaRnChCx9UnXdijX1IC16gpxmEqVaQ81Ma5rJtg5Xz3GBr+i0ozNJUdaBgHeAEpFP1p4YQgr16HzDSCir/jEAbqQvYN70mS8qiNGtHSb19L7T7g513v0tvEOoejnFquS83nDGaJiaJjkLraT71txw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=NObobCNTkvw2Z3IPKPODBCqkGCvY5S4t2QL+uOaiXkU=;
 b=jDJjrdI7a4D4T1m68WsxXhct3fN5ru6I6n3VSz+SKPI9HqRqEBYG/brpb9abDObfT0MVtnQtyYORpqgt+ZvdpmpvvxDQl6hB3BUUc/cdkFZ51nOkhO7wHa4tiDyTZOV+EIhkGcQw+b6mI+4nNXAu+LQjl9cipq2CaNsXBw4REsWz27LbNqxwEYbyMPpTklJhhmlTENVEGlOrnRYEIWm11wtBZjoUzhkk45Zx+5rrIppyPx6ifXqyseZZ+ZqXkHAnsOve+rBzJm3PUMoas1EV579UTSePDuFF/KkoJ27I1j2U2cnHKescbt73HurLXAMWJKqVOvqE7jhiFlQ59EfWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NObobCNTkvw2Z3IPKPODBCqkGCvY5S4t2QL+uOaiXkU=;
 b=VsjV1MIh1i9q4FKXEoQYtZeLz4lYYSr+kIWv3qDiOTTN/6Lc1CN8vHS98AGErTMonWPQZsRz3B11B1EzehLfKzqxwqZIesD85xEwemOF5wv/xRVH2qVjpA/Ha2HCrQ5A8I8gYTEfLFpnjVhJkMY7llrlLfjEcXNK1/fF8hBA6Xho8Ql2UhJ8+aH257Swaw64K32buN5ZH+t6sN8feEqh2fNVMDHJNBPaMHbvSicp1Z4/j5FZygAr0TXqOi4SB80uX3E60RJw3ia7DAO80MwX9KG9h3dA6LvhQzRBpanQO4NRsuuTOOdIjlyIW8lsjJJ8kPa4oMs2AHhEWFjhCEraEw==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SN7PR06MB7230.namprd06.prod.outlook.com (2603:10b6:806:10a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 22:18:44 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::ecff:6fcc:9321:2810]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::ecff:6fcc:9321:2810%6]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 22:18:44 +0000
Date: Thu, 16 Sep 2021 17:18:41 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, seanpaul@chromium.org, daniel@ffwll.ch,
 airlied@linux.ie, heiko@sntech.de, hjc@rock-chips.com
Subject: Re: [PATCH v3] drm/rockchip: Update crtc fixup to account for
 fractional clk change
Message-ID: <SN6PR06MB5342C1C760B53C45C4C99C86A5DC9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210916202907.18394-1-macroalpha82@gmail.com>
 <YUOtw8FmQWoSBO/P@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUOtw8FmQWoSBO/P@google.com>
X-TMN: [+8sqiTC48AFH+FlsiRRJzdUI1SZ8BDlS]
X-ClientProxiedBy: SN4PR0501CA0135.namprd05.prod.outlook.com
 (2603:10b6:803:2c::13) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210916221841.GA19860@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0501CA0135.namprd05.prod.outlook.com (2603:10b6:803:2c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6 via Frontend
 Transport; Thu, 16 Sep 2021 22:18:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 084b7725-cfb3-444a-b3b3-08d9795ff209
X-MS-TrafficTypeDiagnostic: SN7PR06MB7230:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x0S1SQ9PzMO94SFnnIuliA7gQIMwApdXUX8wLScOPSAkUCuKCp07/Su+rMK8OXbfuF80XfYlmmcb0I1UOwTwZLrUvVujnutOE3TzNvYgBDpE/yfMAPX2GziS7RO5SqoI9CREJop6dNFonbROr3/keL9/8sUu564PlTdZD+F2ieHChTWfn6Pg/bSEZxHTEskh5RgxnzFy2Ib6b4m+8Pt3e6ROnm6bzZa3L3uXKD8tt0yQTZFVK1ND1f2auhyhcNDoEtSt9lc/yatO6FobbAfKlUwGFaGT9d6yHsRd9FKdZE/fL/bjOEfX3H4/Suc7rD19GnrXfH/kKoysRrRmgrgB+LfAI4Bq4a/egcuQxbqZaxV07cMT3zfH78W0GuGBqKFE5rbjFZb5+2FgnW1nuxByI4+552Hyae1+epxhuHVSlPOizXqU8OoPXtIFQOJtzyBH
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nhkSvPnqRgSmD3b/VFHkSeT9AEQAprcqmzFX0F2lUKvANwZ87QyUxo8G7bxKAEUTtF0eCrV84jmbedJbRNRsQD30JuYDLCjEx5GZWLsEiNyFaGxJC+xTOcdRiBmtIBgzDg5i530OQmvyVhtA4QN0/w==
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-94543.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 084b7725-cfb3-444a-b3b3-08d9795ff209
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 22:18:44.5808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR06MB7230
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 16, 2021 at 01:49:07PM -0700, Brian Norris wrote:
> On Thu, Sep 16, 2021 at 03:29:07PM -0500, Chris Morgan wrote:
> > After commit 928f9e268611 ("clk: fractional-divider: Hide
> > clk_fractional_divider_ops from wide audience") was merged it appears
> 
> What does that commit have to do with anything? Are you perhaps
> interested in its parent, where the rockchip clock driver was actually
> changed?

It was part of a series of 4 commits, basically there were 2 commits
from the series that had to be rolled back to make things work again
and this was one of the two. Sorry for the confusion. It turns out
that there was a change made some time ago (referenced by the Fixes:)
that broke how the clock was getting set for a specific clock, but
it wasn't until the patch series about the fractional dividers where
it went from "works despite being broken in this limited case" to
"doesn't work anymore in this limited case."

Thank you.

> 
> 4e7cf74fa3b2 clk: fractional-divider: Export approximation algorithm to the CCF users
> 
> I'm just trying to follow along what's going on here.
> 
> Brian
