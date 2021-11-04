Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A16444CC1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 01:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A267AEF6;
	Thu,  4 Nov 2021 00:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2115.outbound.protection.outlook.com [40.107.220.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1867AEF6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 00:57:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eO4rsmot21KBLPO5YLaqpaSilyhO1IS9BSSO8vM3yCcX/suw9WRPq5UMBotDu5NvmC7ODYk093UYHzBW2oyEsB2HHGjWev4NJvDW0Wsqfy/yz5iymXRMnYW/vDFXSlMgqWyP0U68h1PRmRmJ0TpjbyVTOi2qKXIG4f0w+dAXmkKM3JaPaaBMiLoUc8MCQ5ZoyoHCfTSEj7uVYTyrpLii3VWfT/8Lai86q3rrDMQP18i+VYeHSN8tQe2XkCVF1TOWvwf8FLeycP/+mrgv85cptulzs+IA+/u8tACOFLWOBNjargLaSi5j5gXLo029YDyHiN2HmNXFVUv6L28TgWgWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lf9EEamLfqvtLbUTDs75WqTpTsXuVYpscR3iy8/np/s=;
 b=GZBi4pHlKx5rciczaXUVRBal1o4uJnCMMsArmilrFLXhrROi2HDq+mNFzdewDOBJWTZfQDwylM8LV+2+zrJQQExqGAsLaelDmZuJyFo7J2omeAqVP/CzXX4sRpQodNL991yZpk9iZBrAW7wXyVsRFlCUrxY2nQH68gkRYA0u7ONkCu+JdCeapr2UGa1XWQlDdqAL+vVG0wtB3poZ6RnrOyhpeJfcUvEXCMQ9MwUCoSewCjRsKnASZ7SI2tV5ql0fzDBHPG9cQhOzaSI0isJNzLT8LIuzE9kuxjsYhtUh/WoIOkRYeGNiZ1CtpHD5FofhnLue3JqNLGgogSuk/kMEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lf9EEamLfqvtLbUTDs75WqTpTsXuVYpscR3iy8/np/s=;
 b=gvZsoFuIMxAexslYOnlCBCbwi4rg/c5MSs3FX8g8lpsR72RTfoHgwkQes5yORWNbaXNqvIzdQYC1HpwUgC37geNjPXbbC4O5tw3CmPFCCU7ZRHiM12QsgrUOjdKyCgPrrs4SUEtZoqqun0ce0oJxXJhYelP/l2SFnsJNuY65sv0=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5622.namprd04.prod.outlook.com (2603:10b6:a03:103::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 4 Nov
 2021 00:57:44 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 00:57:44 +0000
Date: Thu, 4 Nov 2021 08:57:39 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v11 4/4] drm/bridge: anx7625: add HDMI audio function
Message-ID: <20211104005739.GB2328386@anxtwsw-Precision-3640-Tower>
References: <7dc405471da4771641d2942960d364a588bb4395.1628161369.git.xji@analogixsemi.com>
 <20211018030529.2055255-1-xji@analogixsemi.com>
 <20211103142003.GW2794@kadam>
 <CAG3jFysp-Gs_Zk2PooTpqig1ns5pi+FKASMy=FW1V7oecdNGig@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFysp-Gs_Zk2PooTpqig1ns5pi+FKASMy=FW1V7oecdNGig@mail.gmail.com>
X-ClientProxiedBy: HKAPR03CA0023.apcprd03.prod.outlook.com
 (2603:1096:203:c9::10) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR03CA0023.apcprd03.prod.outlook.com (2603:1096:203:c9::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.5 via Frontend Transport; Thu, 4 Nov 2021 00:57:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24f69d79-5647-47af-6dc7-08d99f2e1c13
X-MS-TrafficTypeDiagnostic: BYAPR04MB5622:
X-Microsoft-Antispam-PRVS: <BYAPR04MB56223E8807AA3C8BA7BEEBE1C78D9@BYAPR04MB5622.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UrgXnp0nsyIwXCEB2VBDiC+UsHhI2E3xSfBlWQvpW5kdEEKe8Uu/3Z1bOv86lKrutBZaAw19ibH9namZoskzdEoRRlIgEAXbnjnqdhoEmi4H7ez9n/Dy81DofMx09haTgSCXigZt1PzbAdtz9yYfuwcCELJLJPmw+3ug3zA4cYj6cGMNSA3de92cay2pXpwJSzltSdijCnL05hEQC5EBygEvlKHFBk1r/OxWSrHq0IVH/5h3CNYHOaodK+lgGdnKz5QKYuJzjMg7en3Vf38ueM3NPPLqaO1l4P25Mog2IQikM6sPFTUdT7YOlUrB4oi1p8YvOs+nwQLRQLzZryutL9Jylahh1q9K62nCONzSdfxcj0hQ5Bvf0PwTRbFu9R2HXKrseQ+VIXIVCPtE189Q/HopTWCh+uWiJ6CioMICJX8j45F2aHNjZuUu6B1j96D+lzDJdAiZfGB3Ug6C/lsz7IiKNSWaWaPx6WxHlDD7GxGwtgOo/H/IXe/ewV2a16j2SrMRHCqVcL/4BEQR6U0e4wQW0XN6fFgFfTQC2njQz8j4M/togWdLy8g4BVfULcAFDby0uVZp5hmV8gfkvE4Jr5iw+5Ubkgw6ed7jL/BI1ascPt2QUewkGE0Kcj1drDWFSqCwCHI0V9TyHJhwEq2S5v4lFUX5ywmJE+/GQ8tJHPv+/aTLYbCeBFXwDf/6Y0D4ZCo3qX5sSGGEn/EPon4lWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(1076003)(8936002)(4744005)(508600001)(7416002)(33656002)(33716001)(6666004)(6916009)(956004)(8676002)(186003)(5660300002)(26005)(38350700002)(38100700002)(66946007)(55016002)(66476007)(66556008)(52116002)(2906002)(9686003)(55236004)(4326008)(86362001)(6496006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Xong3PzptDXwR5JtnE6s6m3qm06QWUj+fe7OcCzlCBlOlh/OOkOhLPWNWfR?=
 =?us-ascii?Q?oO4mNgu7O6ln+twnrEBFG1SY1jL5sEthtns+MA5gF6WwrVkJySkMZDDhOC/S?=
 =?us-ascii?Q?/q6ELwC2c4RYmkEN3/WFz88+8DrgiO+srPJYowUjUtSO3d6zDAeY7YyMbqpE?=
 =?us-ascii?Q?F5uJFIA3ac/YgnsN4N8cUZZatC89CTFFfdiSYXrPnySE8KyX0mnR210JhanM?=
 =?us-ascii?Q?rdESusT+Ks3gddJeESexraITvX86mcH2IxxrLJyst6F9ve60biGce9IhAd0G?=
 =?us-ascii?Q?fHcc6Jz5tcVsrFxpChFdOR2hiXsoLdV61ZWJKLC+g1SUOMGDWPIPB8z40IGr?=
 =?us-ascii?Q?oBfk0GNrdzZ9DX5fsIr7r+rqL/Dlz9cEXMCsAQzLr6cJPYGpxVWre9qxMC3u?=
 =?us-ascii?Q?cfxCcHIQKoWrRCpx8NYUp32UO76a2nGn+tC+TP12x1P/k0IQKQAOrmay+7hW?=
 =?us-ascii?Q?3sySIRO/WoNdrGLm4ViQMChykD94N24OWlmWa4PZe1gePtOu5TPjj8jL2IHW?=
 =?us-ascii?Q?+GGxYBDmiZv+NR0geor0p2sDUs2dSLJBxNDWGitSoU7T1UY9OUws+Gg9Qbe9?=
 =?us-ascii?Q?Q9M+jGl4xBvoi17uTNNfjjc85Px09dp2OlaLZ9svCP3Ey9e6Q1DLJIxMyNPL?=
 =?us-ascii?Q?TSE4FA5ZP+pvnEclf3SkaQ1BLZQU8LvJJ+HD80UUOvicND8pfpg/SjpGeoUj?=
 =?us-ascii?Q?TfTuCAkXUCbFogkCj90VtdX0JF4LSVCcCUmQ6rmkNUvRbc9YImlHBmOYrFsp?=
 =?us-ascii?Q?DUpxJegsa+mQAg2w7Fc4M6Bz3+UmTnSxNBuYnTI+qBYjMepfzRZ08K8M7ulT?=
 =?us-ascii?Q?v+IPWpSTpJUHf0qIj8PtYdA4LokmxL8k/zVdTmZ6Ap7OEBbuVfkbfGt8tFAR?=
 =?us-ascii?Q?4FGzGWISJYiE6YeQgm0vkNzIH3Nhzhp3bOx5srvhlwxERSYMrD1wmnCi2Rd+?=
 =?us-ascii?Q?SAMJ/Nv+oel15rIks0tw/7yQXaLaoa2Zkq/SqDaTZb2SH2bL2ls5gdiEWBkG?=
 =?us-ascii?Q?TAjNLdB53Vh6zPSwsBePWWuGNKeWoyi3dVzzg+/BwCy3rPjpmshMrxn6zG2a?=
 =?us-ascii?Q?OxzEE5F+VB0VXveErwNKVhsz70Ps6qMZO8UwTJnPnlyC3RWy9yEGYFytBmTC?=
 =?us-ascii?Q?6MvViaFUe0HEPXsvb4RRUtDfLZSO5V5qs49lzYMyTwTuaCpatHkg90M4lDAa?=
 =?us-ascii?Q?yVr0iA4iQQ8SdlV4W3tAMlSJQFQd21/EOxwxf9X14qAM10yjmbCEabtJvX/g?=
 =?us-ascii?Q?Utja/M+7Q2Wcw+GHVTdnzIwHzdxAuuduCaBvu+Tx0rkqNZbqHd4t8b4e6wFu?=
 =?us-ascii?Q?FTofSyW1UakgAZbCY8tmVi3Wo6JcLgmexn4mBWNvw/28rO63EenqRENtDrFa?=
 =?us-ascii?Q?c2nl8I/ofz/TLPu/iPawluWaTHAr6w9j7ZINjUxfyB8vFOEBeR5tXEZEBk1t?=
 =?us-ascii?Q?MQbuJFJjGH65d/Rm3JLpuCrjLCuly1vG7A0xVswJH1pxfzqEyw0y8HX3jVad?=
 =?us-ascii?Q?ZP+qN1nHZTYXYArD6Eio3QrSY/eIjFNig67S+1pLxrQR/YWmH8xCOhe/M2VF?=
 =?us-ascii?Q?+FwUVr85T5wj4bGBTUu4s6+0Cr5UKj7hvCGG5UwVs3ArehYAq4sm8cbc1lAD?=
 =?us-ascii?Q?FZwns+M9yY8LeR4jhHTgdS4=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f69d79-5647-47af-6dc7-08d99f2e1c13
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 00:57:43.9725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ce0tVVgQgcenuh1EpGgWdG9/JcOnk7gdhuZVdXyLv0TGxtTC6FvkCH+AXId/k4esXa/hB0GEfJ+Li43pFL6sAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5622
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
Cc: devel@driverdev.osuosl.org, drinkcat@google.com, jonas@kwiboo.se,
 airlied@linux.ie, zhenli@analogixsemi.com, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bliang@analogixsemi.com, anarsoul@gmail.com, a.hajda@samsung.com,
 boris.brezillon@collabora.com, duwe@lst.de, span@analogixsemi.com,
 hsinyi@chromium.org, m.szyprowski@samsung.com, sam@ravnborg.org,
 dan.carpenter@oracle.com, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 03, 2021 at 04:04:00PM +0100, Robert Foss wrote:
> Hey Xin,
> 
> This series does not apply on drm-misc-next. Please fix this and
> resend. Make sure that checkpatch --strict passes as well.
OK, I'll apply on drm-misc-next, thanks!
Xin
> 
> On Wed, 3 Nov 2021 at 15:20, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > This is a super awkward way to resend a patch series.  Next time, just
> > start a new thread and put [PATCH RESEND] in the subject.
> >
> > I am sorry that no one responded to your thread.  :/
> >
> > regards,
> > dan carpenter
