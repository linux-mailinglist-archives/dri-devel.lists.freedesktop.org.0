Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559283DDDBA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 18:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C20F6E4F8;
	Mon,  2 Aug 2021 16:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60070.outbound.protection.outlook.com [40.107.6.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1088E6E4F8;
 Mon,  2 Aug 2021 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEYPjV4xWYZg2FX/DY8BUJLJPErIaU7iqjTcQl5h4u0=;
 b=v0HdsyqGASlfERMSdiJY8pCJ5rFG0yxoKwZX8PXgyt/Y3N+WqlE0HF5wbbTZsh1IDIFZPWmjZeRDMHu1nGjbuJeJNX5a/YWwy5x1pNHfAKv2v0lxSICDkIZ1wDO7aVGJFM2VDzpURHFCH8WdvMt0WBFwpoR4lLwA6Fa1Y/16BkY=
Received: from AM6P192CA0104.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::45)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 16:30:54 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::54) by AM6P192CA0104.outlook.office365.com
 (2603:10a6:209:8d::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Mon, 2 Aug 2021 16:30:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 16:30:53 +0000
Received: ("Tessian outbound 7b804b1d9bbf:v101");
 Mon, 02 Aug 2021 16:30:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4cec125ec527903e
X-CR-MTA-TID: 64aa7808
Received: from 66ebeed65b3b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02B513FD-DFBE-4AE4-9A29-E18ED2B2B525.1; 
 Mon, 02 Aug 2021 16:30:47 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 66ebeed65b3b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 02 Aug 2021 16:30:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAk2q/OyovcOyHR6CevMbSyjiX87F17cOCGbFEb6w9ta1kbDOVRNKNvb09qeezvTq9CdYOzHeFi8BuRCq2Y3sWcT7lkkTePEzIi2W14e+I5E8zgoRpht2Ezx5gRjvCCvHn5KIOXC+3VSuaPVozA9R7hitIqolQyznTGBmb6Aeb3nhG1tY1g9wkJzDja19CeeoqANyNyuJxsGblS3FgP+Vhzob3GAA7+kzerjqikUUX+5Tu2LzwXJwMwXAs/jkSbOXvm1Pzn/zsHqvA5M4O0hzUxMhbT/tAyldcjYYfdBm7u7T/q4Ujlo8mVej1yki4rUXuuQ5j0NJwszFy31AZfNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEYPjV4xWYZg2FX/DY8BUJLJPErIaU7iqjTcQl5h4u0=;
 b=f9ocfflc8IVLLZPtbI4COoWHKn/3/Wbh4LAyK8h8moflcYK4B/znaITXM8M8hOlVpXMTHXcxPgfaDgfsSL1rHSUXSMDzyGRy7ptQW4pj42FUm9UC6voGLZrkW0tVRl0UikNARC2+jc6Sj7TuaPEVwU169Hr0xH2IdLLwZ/+VSp6Vk+yeQZnCLJU7KZ6Ac4tQbngVDWKGCLIthBWKKhbo1qhsJbMKGAVIQ9QCjjzudcwyhQbriCjnzmFMaVaKQ9mQIViFlB4crBbjYHaEzZv9T4cqa2pkeLyEy8ROWSZ2eWFVgEG9mqDt1Le7+VAaThDN9E8p14dNXJMxY3TahUoYeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEYPjV4xWYZg2FX/DY8BUJLJPErIaU7iqjTcQl5h4u0=;
 b=v0HdsyqGASlfERMSdiJY8pCJ5rFG0yxoKwZX8PXgyt/Y3N+WqlE0HF5wbbTZsh1IDIFZPWmjZeRDMHu1nGjbuJeJNX5a/YWwy5x1pNHfAKv2v0lxSICDkIZ1wDO7aVGJFM2VDzpURHFCH8WdvMt0WBFwpoR4lLwA6Fa1Y/16BkY=
Authentication-Results-Original: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=arm.com;
Received: from AM7PR08MB5367.eurprd08.prod.outlook.com (2603:10a6:20b:dd::15)
 by AM6PR08MB3639.eurprd08.prod.outlook.com (2603:10a6:20b:51::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Mon, 2 Aug
 2021 16:30:45 +0000
Received: from AM7PR08MB5367.eurprd08.prod.outlook.com
 ([fe80::84e7:2f9c:1a2f:250a]) by AM7PR08MB5367.eurprd08.prod.outlook.com
 ([fe80::84e7:2f9c:1a2f:250a%9]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 16:30:45 +0000
Date: Mon, 2 Aug 2021 17:30:42 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ppaalanen@gmail.com, sebastian@sebastianwick.net, mcasas@google.com,
 jshargo@google.com, Shashank.Sharma@amd.com, Deepak.Sharma@amd.com,
 Shirish.S@amd.com, Vitaly.Prosyak@amd.com, aric.cyr@amd.com,
 Bhawanpreet.Lakha@amd.com, Krunoslav.Kovac@amd.com,
 hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com, nd@arm.com
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Message-ID: <20210802163042.2phdkytybie236x4@000377403353>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730204134.21769-2-harry.wentland@amd.com>
X-ClientProxiedBy: LO2P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::27) To AM7PR08MB5367.eurprd08.prod.outlook.com
 (2603:10a6:20b:dd::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 000377403353 (82.27.180.53) by
 LO2P265CA0015.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Mon, 2 Aug 2021 16:30:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb9f40a4-5895-401a-f3ea-08d955d2e60b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3639:|AS8PR08MB5877:
X-Microsoft-Antispam-PRVS: <AS8PR08MB5877E096948AE2631D9AE9B2F0EF9@AS8PR08MB5877.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: aYWZkhWvsJblhw1qfWVE++0jz9efS5ILYnrBEaiLx5nX7eACtXsegMI8QdZnUertX42ZxVdnqzacTLBPL4DXxIO0h1tlzLWZdHX7/wYE3ZSRWgn3HjnN9TEslkXHLMlRc8OEDxKGLMO+oFwV0FeFpEkpN1ImB9IPqHqpcAQOZtNI4nn+p9D73rsOGl+GOzvzsdi+FqbD6B5DHcBsp56QDduL5Dlhiki8dHB1Uuq4Kq6TjP7ViJxprqETZeUbVM+41WI+jOA2e9X4JD/sV0v07tzn+oqRsn24R7gp48XINbPpgpYI2/piOh1w2VR8knkEuL2FUwWFmdgf0ifeLfnNvq3kKDtqOcEeSobMp5DHDa1kv1+AUOfEv7+sqVol3QJYyviPWLryXYkymOBlEdAeG5CP9ajOHMawwAtmFozple092NWTovtSAMdMaeJ+1Bp646bi/GIOgApBydS2y+/HTxipY5Qga/iZxiYkrGKpezdeN3Mc6VQBgryy3T5JhfULL7H8cBGrPHTmGkxr2QpJ4TdphQWqwKHhRHS49yKi4SNfQ2lu68pILwV5rO4aE2SeEvv0e5B7EEVHuOs61o6+xcBBt+pgliqZ6Ym4DfX4Gr89T5fqAPOK5T3ZKOwTDoU4kk5xOy2cFk9egO1E6JVUNVGBXP//mLTwAr+ySsK63x3E+n+DDo8j8I8wnKBOWNek//s5vUwZnKGufnoteEw9fli05KcEYxqJyUs2XxIzW5GpouN1MO7ENyg6I060JN43iG7s7Ev+vuhgjIWNQ21rKgfNQURM6oVTt8H1IhM/jh21m5uHwiIZK9+n0SFVwirbvW+kGRg5gZYZm2PKx3TfcA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM7PR08MB5367.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(396003)(366004)(346002)(376002)(30864003)(6496006)(5660300002)(26005)(52116002)(4326008)(83380400001)(8936002)(966005)(33716001)(86362001)(8676002)(9576002)(478600001)(9686003)(66946007)(186003)(66476007)(66556008)(55016002)(38100700002)(38350700002)(1076003)(6916009)(7416002)(956004)(2906002)(316002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kur7eO6V436TxNMkqE37XPPrgi4YOsWLhok2KczWbe8SIDjznhb7cqZ1WLI7?=
 =?us-ascii?Q?MpWtRQju25aWZTbqKKCquT+5e8Vtppj33kQMO6OjpqGk/k+hvBd2F1RJT2lO?=
 =?us-ascii?Q?FQupE8S1tky7yh/05dAglYXKncqNGiWI6XFGoMb8X3MQ+yTkdQsa7RfuHWkb?=
 =?us-ascii?Q?5usPB+sbUGaTiviLPxVyPQMrfu93EGvnmAGPaDaGtsbtvVnKb1n0SNtgovPF?=
 =?us-ascii?Q?Jmvhpq7SMsqfJ+F/4mO1xlhHtXvtys1hcN5U/YEV/DQV6WT/XXOetyskUx0M?=
 =?us-ascii?Q?C7WSoqQbJcpbD9LfavY32L3z/uDBQPnUlBtg/4OFzPm41Itj15m2wNkfvldF?=
 =?us-ascii?Q?Q722n/Q9gwnwFQaMHJp6/Qz+lGijV0tK+X8e5juYMd1XmKUJcGjqRDwrUJQl?=
 =?us-ascii?Q?Vac22tehYbsMkfT/lNyBOpbfGy4QfM62l1ShvFYpkFViOp0UJFrF+HydV80s?=
 =?us-ascii?Q?9tMrf0yzILHG7pPtvdK+cAaTJ/GfkNnNqKLb2wtjgvTe/0Vo4hzKfnQgoZZk?=
 =?us-ascii?Q?OSGnRkttb8xJY93QczNgHMuK6oSJPxY2pT6YSJtW6taQF1aDLIZzuCXG9kMB?=
 =?us-ascii?Q?heqTfmn71jNtg31YymuLlAtIs+ReyfkLskPtIRrVWuZPqxH25GXZD1+OBz7Q?=
 =?us-ascii?Q?Sp4Rjk6WY7kUIbPUHHnc6zU3AAi7tjeIGSJZDZmc+TnDZKB3QPeio6RmL84I?=
 =?us-ascii?Q?MgG0BDQCYrBhwps+c2FW6hy+RcF5M8aNIKE5nIZYXRQZtW2Z0gVmHJqDlEg1?=
 =?us-ascii?Q?2YJHScnIqu5kq5uMTaAq2KbHGXjYNNJk3ahS2jDRK0P+GYmSE0kaIX813xiQ?=
 =?us-ascii?Q?2XNp7UhCi5J7XklvyMUgVcPZJtaTKAxsSASIv1eiolgGspy+cuMabTasowgG?=
 =?us-ascii?Q?PXRbQJ69KEppKC1RKThLxVi9i/QtusSDaJKyrMISYEkmAIwrlEw0ClIiINS6?=
 =?us-ascii?Q?Xb2wpwSAhq+eVLLyiUV4kraMF/u3NRErlYcr2bhqRxDXkWOdccaph0k5Ofwi?=
 =?us-ascii?Q?394hW7Ch4xdfabOm4Q8FBHDzy0wTpbXs788AyNBqliTlYFLM6ywCNdEIeIWd?=
 =?us-ascii?Q?5DjNKUGCV0zHS/wBiGz5PAQx2uAx8HrlVy2q9TDjcUIzwWn7gT2tNrJp3EwX?=
 =?us-ascii?Q?eiIAYfdWVkpW6qwZwpEPiOtvFMmyipiYj3bMZXgp5ryotu+/e2h14MzxBvBx?=
 =?us-ascii?Q?OZ8YFUyL7FjVSkAQqibhGLTS0G25IiiTPLWR/hKnD+309+vy9wRAhdmAzhKq?=
 =?us-ascii?Q?ZT2ctu6LqNrQXza8RCHXzlZ+u3hfvFjeTVVOzUY7A5hkNFjdTXXq0ypaGyR1?=
 =?us-ascii?Q?VIHBsIzHjg22IcBO8txtv0Mq?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3639
Original-Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ed2b2039-b5ef-4402-d8e0-08d955d2e08c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VrHVS8kmvwtR9EHV6LtzLVF7GzSIcX/lz0Tbrmy0IhoVestydo7cRQcfXrbWvy7g/E0wXJB4L3qQURisnLzmpfyW43BiY12N5Hr1yp9eH6kgCyUEx9HGdRIus+RsRedCn49EX6ilkgCpHCB/bCCSr1Iw/veB8ZsRZ+Gl+0jU7LFkrPnsqgDU3YgQMkhWxYRll8D/9O9G2MOIo5lp6fvS+yqRQU6UQErfQgqh4vLPTk7F+W+Wcyc3Zf1Efc70cVcuRRwwydyfY1WRB4Zgz95FeAmIIyk7JT5q6iaxAkth928O6SW2QguEzJHKlpD9H2G5xjlD3USRvnyslCuk2ZjBMGtGpkRhajuGzh15FVA2MzVWh6zSahsNhH4vg2XzpGQiHSNtCT1eQ5p9nK6eHR5E6SiF1J7jNBY2OJjCVYFlp8Ifu+pxkmOTBoNjV/w7ou8PyzkH6yffVuCGn4MwvcmOkp/E3Oot1ccp3maehhRHcI2OzFoz01WroR8LXkD3dl2XBB/jfz0PkidrMDMdSF7lCXgmsQI3xzW7WqphF0524t2nGQ6nIgywLQzBP/ak43J2UT35keYhjJUV5FRbDFTdIG4FcYsDL9eEhg1j9FkSasa7afhGEXAYyzEGO74lttUY8FuIAa9bwiux20XjQsDWf5eR4Dp6WGfysbDdB0g2qN3Kt1OU+y1eMtMRZz3x7Eg9rgU3f5IHm9jybJS2Zi1WIXgLuA9FgZ2wxZZ4W/+4hTW+dgRAxGVcGykiYyMvVeNMS6o6Gf+M293mDInrnhsn7NYzkuDBTjzIMvprHTtxsACSNz4Emd39m8ub/1AMiNOlpQG3C6vIRDLwcs6hQCd50A==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(36840700001)(46966006)(70206006)(316002)(5660300002)(83380400001)(2906002)(6862004)(47076005)(86362001)(82740400003)(966005)(8676002)(956004)(450100002)(6496006)(1076003)(9576002)(26005)(44832011)(8936002)(186003)(30864003)(33716001)(82310400003)(36860700001)(356005)(478600001)(70586007)(81166007)(9686003)(336012)(4326008)(55016002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 16:30:53.9612 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9f40a4-5895-401a-f3ea-08d955d2e60b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
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

Hi,

Thanks for having a stab at this, it's a massive complex topic to
solve.

Do you have the the HTML rendered somewhere for convenience?

On Fri, Jul 30, 2021 at 04:41:29PM -0400, Harry Wentland wrote:
> Use the new DRM RFC doc section to capture the RFC previously only
> described in the cover letter at
> https://patchwork.freedesktop.org/series/89506/
> 
> v3:
>  * Add sections on single-plane and multi-plane HDR
>  * Describe approach to define HW details vs approach to define SW intentions
>  * Link Jeremy Cline's excellent HDR summaries
>  * Outline intention behind overly verbose doc
>  * Describe FP16 use-case
>  * Clean up links
> 
> v2: create this doc
> 
> v1: n/a
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  Documentation/gpu/rfc/color_intentions.drawio |   1 +
>  Documentation/gpu/rfc/color_intentions.svg    |   3 +
>  Documentation/gpu/rfc/colorpipe               |   1 +
>  Documentation/gpu/rfc/colorpipe.svg           |   3 +
>  Documentation/gpu/rfc/hdr-wide-gamut.rst      | 580 ++++++++++++++++++
>  Documentation/gpu/rfc/index.rst               |   1 +
>  6 files changed, 589 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/color_intentions.drawio
>  create mode 100644 Documentation/gpu/rfc/color_intentions.svg
>  create mode 100644 Documentation/gpu/rfc/colorpipe
>  create mode 100644 Documentation/gpu/rfc/colorpipe.svg
>  create mode 100644 Documentation/gpu/rfc/hdr-wide-gamut.rst
> 

-- snip --

> +
> +Mastering Luminances
> +--------------------
> +
> +Even though we are able to describe the absolute luminance of a pixel
> +using the PQ 2084 EOTF we are presented with physical limitations of the
> +display technologies on the market today. Here are a few examples of
> +luminance ranges of displays.
> +
> +.. flat-table::
> +   :header-rows: 1
> +
> +   * - Display
> +     - Luminance range in nits
> +
> +   *  - Typical PC display
> +      - 0.3 - 200
> +
> +   *  - Excellent LCD HDTV
> +      - 0.3 - 400
> +
> +   *  - HDR LCD w/ local dimming
> +      - 0.05 - 1,500
> +
> +Since no display can currently show the full 0.0005 to 10,000 nits
> +luminance range of PQ the display will need to tone-map the HDR content,
> +i.e to fit the content within a display's capabilities. To assist
> +with tone-mapping HDR content is usually accompanied by a metadata
> +that describes (among other things) the minimum and maximum mastering
> +luminance, i.e. the maximum and minimum luminance of the display that
> +was used to master the HDR content.
> +
> +The HDR metadata is currently defined on the drm_connector via the
> +hdr_output_metadata blob property.
> +
> +It might be useful to define per-plane hdr metadata, as different planes
> +might have been mastered differently.

I think this only applies to the approach where all the processing is
decided in the kernel right?

If we directly expose each pipeline stage, and userspace controls
everything, there's no need for the kernel to know the mastering
luminance of any of the input content. The kernel would only need to
know the eventual *output* luminance range, which might not even match
any of the input content!


...

> +
> +How are we solving the problem?
> +===============================
> +
> +Single-plane
> +------------
> +
> +If a single drm_plane is used no further work is required. The compositor
> +will provide one HDR plane alongside a drm_connector's hdr_output_metadata
> +and the display HW will output this plane without further processing if
> +no CRTC LUTs are provided.
> +
> +If desired a compositor can use the CRTC LUTs for HDR content but without
> +support for PWL or multi-segmented LUTs the quality of the operation is
> +expected to be subpar for HDR content.
> +
> +
> +Multi-plane
> +-----------
> +
> +In multi-plane configurations we need to solve the problem of blending
> +HDR and SDR content. This blending should be done in linear space and
> +therefore requires framebuffer data that is presented in linear space
> +or a way to convert non-linear data to linear space. Additionally
> +we need a way to define the luminance of any SDR content in relation
> +to the HDR content.
> +

Android doesn't blend in linear space, so any API shouldn't be built
around an assumption of linear blending.

> +In order to present framebuffer data in linear space without losing a
> +lot of precision it needs to be presented using 16 bpc precision.
> +
> +
> +Defining HW Details
> +-------------------
> +
> +One way to take full advantage of modern HW's color pipelines is by
> +defining a "generic" pipeline that matches all capable HW. Something
> +like this, which I took `from Uma Shankar`_ and expanded on:
> +
> +.. _from Uma Shankar: https://patchwork.freedesktop.org/series/90826/
> +
> +.. kernel-figure::  colorpipe.svg

I don't think this pipeline is expressive enough, in part because of
Android's non-linear blending as I mentioned above, but also because
the "tonemapping" block is a bit of a monolithic black-box.

I'd be in favour of splitting what you've called "Tonemapping" to
separate luminance adjustment (I've seen that called OOTF) and
pre-blending OETF (GAMMA); with similar post-blending as well:

Before blending:

FB --> YUV-to-RGB --> EOTF (DEGAMMA) --> CTM/CSC (and/or 3D LUT) --> OOTF --> OETF (GAMMA) --> To blending

After blending:

From blending --> EOTF (DEGAMMA) --> CTM/CSC (and/or 3D LUT) --> OOTF --> OETF (GAMMA) --> RGB-to-YUV --> To cable

This separates the logical pipeline stages a bit better to me.

> +
> +I intentionally put de-Gamma, and Gamma in parentheses in my graph
> +as they describe the intention of the block but not necessarily a
> +strict definition of how a userspace implementation is required to
> +use them.
> +
> +De-Gamma and Gamma blocks are named LUT, but they could be non-programmable
> +LUTs in some HW implementations with no programmable LUT available. See
> +the definitions for AMD's `latest dGPU generation`_ as an example.
> +
> +.. _latest dGPU generation: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c?h=v5.13#n2586
> +
> +I renamed the "Plane Gamma LUT" and "CRTC De-Gamma LUT" to "Tonemapping"
> +as we generally don't want to re-apply gamma before blending, or do
> +de-gamma post blending. These blocks tend generally to be intended for
> +tonemapping purposes.

Sorry for repeating myself (again) - but I don't think this is true in
Android.

> +
> +Tonemapping in this case could be a simple nits value or `EDR`_ to describe
> +how to scale the :ref:`SDR luminance`.
> +
> +Tonemapping could also include the ability to use a 3D LUT which might be
> +accompanied by a 1D shaper LUT. The shaper LUT is required in order to
> +ensure a 3D LUT with limited entries (e.g. 9x9x9, or 17x17x17) operates
> +in perceptual (non-linear) space, so as to evenly spread the limited
> +entries evenly across the perceived space.

Some terminology care may be needed here - up until this point, I
think you've been talking about "tonemapping" being luminance
adjustment, whereas I'd expect 3D LUTs to be used for gamut
adjustment.

> +
> +.. _EDR: https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst#id8
> +
> +Creating a model that is flexible enough to define color pipelines for
> +a wide variety of HW is challenging, though not impossible. Implementing
> +support for such a flexible definition in userspace, though, amounts
> +to essentially writing color pipeline drivers for each HW.
> +

Without this, it seems like it would be hard/impossible for a
general-purpose compositor use the display hardware.

There will always be cases where compositing needs to fall back to a
GPU pass instead of using HW. If userspace has no idea what the
kernel/hardware is doing, it has no hope of matching the processing
and there will be significant visual differences between the two
paths.

This is perhaps less relevant for post-blending stuff, which I expect
would be applied by HW in both cases.

> +
> +Defining SW Intentions
> +----------------------
> +
> +An alternative to describing the HW color pipeline in enough detail to
> +be useful for color management and HDR purposes is to instead define
> +SW intentions.
> +
> +.. kernel-figure::  color_intentions.svg
> +
> +This greatly simplifies the API and lets the driver do what a driver
> +does best: figure out how to program the HW to achieve the desired
> +effect.
> +
> +The above diagram could include white point, primaries, and maximum
> +peak and average white levels in order to facilitate tone mapping.
> +
> +At this point I suggest to keep tonemapping (other than an SDR luminance
> +adjustment) out of the current DRM/KMS API. Most HDR displays are capable
> +of tonemapping. If for some reason tonemapping is still desired on
> +a plane, a shader might be a better way of doing that instead of relying
> +on display HW.
> +
> +In some ways this mirrors how various userspace APIs treat HDR:
> + * Gstreamer's `GstVideoTransferFunction`_
> + * EGL's `EGL_EXT_gl_colorspace_bt2020_pq`_ extension
> + * Vulkan's `VkColorSpaceKHR`_
> +
> +.. _GstVideoTransferFunction: https://gstreamer.freedesktop.org/documentation/video/video-color.html?gi-language=c#GstVideoTransferFunction
> +.. _EGL_EXT_gl_colorspace_bt2020_pq: https://www.khronos.org/registry/EGL/extensions/EXT/EGL_EXT_gl_colorspace_bt2020_linear.txt
> +.. _VkColorSpaceKHR: https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkColorSpaceKHR
> +

These (at least the Khronos ones) are application-facing APIs, rather
than APIs that a compositor would use. They only communicate content
hints to "the platform" so that the compositor can do-the-right-thing.

I think that this enum approach makes sense for an app, but not for
implementing a compositor, which would want direct, explicit control.

> +
> +A hybrid approach to the API
> +----------------------------
> +
> +Our current approach attempts a hybrid approach, defining API to specify
> +input and output transfer functions, as well as an SDR boost, and a
> +input color space definition.
> +
> +We would like to solicit feedback and encourage discussion around the
> +merits and weaknesses of these approaches. This question is at the core
> +of defining a good API and we'd like to get it right.
> +
> +
> +Input and Output Transfer functions
> +-----------------------------------
> +
> +We define an input transfer function on drm_plane to describe the
> +transform from framebuffer to blending space.
> +
> +We define an output transfer function on drm_crtc to describe the
> +transform from blending space to display space.
> +
> +The transfer function can be a pre-defined function, such as PQ EOTF, or
> +a custom LUT. A driver will be able to specify support for specific
> +transfer functions, including custom ones.
> +
> +Defining the transfer function in this way allows us to support in on HW
> +that uses ROMs to support these transforms, as well as on HW that use
> +LUT definitions that are complex and don't map easily onto a standard LUT
> +definition.
> +
> +We will not define per-plane LUTs in this patchset as the scope of our
> +current work only deals with pre-defined transfer functions. This API has
> +the flexibility to add custom 1D or 3D LUTs at a later date.
> +
> +In order to support the existing 1D de-gamma and gamma LUTs on the drm_crtc
> +we will include a "custom 1D" enum value to indicate that the custom gamma and
> +de-gamma 1D LUTs should be used.
> +
> +Possible transfer functions:
> +
> +.. flat-table::
> +   :header-rows: 1
> +
> +   * - Transfer Function
> +     - Description
> +
> +   *  - Gamma 2.2
> +      - a simple 2.2 gamma function
> +
> +   *  - sRGB
> +      - 2.4 gamma with small initial linear section
> +
> +   *  - PQ 2084
> +      - SMPTE ST 2084; used for HDR video and allows for up to 10,000 nit support
> +
> +   *  - Linear
> +      - Linear relationship between pixel value and luminance value
> +
> +   *  - Custom 1D
> +      - Custom 1D de-gamma and gamma LUTs; one LUT per color
> +
> +   *  - Custom 3D
> +      - Custom 3D LUT (to be defined)
> +
> +
> +Describing SDR Luminance
> +------------------------------
> +
> +Since many displays do no correctly advertise the HDR white level we
> +propose to define the SDR white level in nits.
> +
> +We define a new drm_plane property to specify the white level of an SDR
> +plane.
> +
> +
> +Defining the color space
> +------------------------
> +
> +We propose to add a new color space property to drm_plane to define a
> +plane's color space.

What is this used/useful for?

> +
> +While some color space conversions can be performed with a simple color
> +transformation matrix (CTM) others require a 3D LUT.
> +
> +
> +Defining mastering color space and luminance
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +ToDo

I don't think this is necessary at all (in the kernel API) if we
expose the full pipeline.

Cheers,
-Brian

