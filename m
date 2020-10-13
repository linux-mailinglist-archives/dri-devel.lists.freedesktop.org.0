Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A9928C913
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90376E894;
	Tue, 13 Oct 2020 07:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2109.outbound.protection.outlook.com [40.107.243.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C855E6E047
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 02:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daeeRnwDjLAmu0pcOMP9GlwbT2f+XtLpP8GzpHr9LoTHtuPIYEGbD7eXqXvs8p6duB25PFkhVZi8AzT706LCdcWg+LRnBbcrupPqjKNJS35uNUkmUXacz7z3GMAAOQzOQdTQ6RH/ofADiz35M2lBMapEinPVXJIZ92Fz8wg2ZarqXsjYXzHimeaM2zo9UcgUwDEoUw0EyAWhcXZhNBR3CJhCjqTakrFSkNA6igmpMpVTVUwigZC56GwpQ8U3iAOdV0loTGGBOvgn1IBJQldN8+t87vuiZjb/tIP0UADzGsfa3zRN43i0/+7pt/AzziAPjLGWK3F4fyMGTzO/erCyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnyUw0+kZp2F5/rBvE1awpW0hcBGcQqpycFu5IfY48Q=;
 b=Xz7cs6unRQNLPO3rPv4OuFmsSE43UkgJbamAV2MltGIcYbBe5dZvfNwe8ap+4LVLUjjpj1qyvwhogl5Y6FU6kzARn7lhRqySHMRz1/OsMLV89WcpPo+3CX37Bs9uMj35KiTeSKAHtC5b7/tt7fl2sAsis1MW6Qt32wqgCIgnjSaawFaFHjp0k/1+swEtrRxBJv/TwWTOfRzWzOjJu65pH/7wmJGLKhkPbe9Z911EQQXYS9i4HhPfr6gZw7W6+p7PwibRh5UG3zzgucgo1Ux2Tqhw+i5fdLexaYV9jQPwK8UDWwrb5sUZy+LBpCMqRo+TYiUe8powU8U0CopPjuK1Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnyUw0+kZp2F5/rBvE1awpW0hcBGcQqpycFu5IfY48Q=;
 b=jxgr+1hyaEx2Qk9+IO0nRZOTM6oW8/JEW9fhaU3fC14oay+5efR9O/kld73cvVLaerClVDdr2pRz3wY5zmZPROEy4QqvU4nP3QLQm34iM1rZ4ZPqUAZBQngOwnQNl9k+ajyzvNQfP3rxUzNaffHJ5mcoZ4QDgDKzBEvbtgqlSBk=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6802.namprd04.prod.outlook.com (2603:10b6:a03:22d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.25; Tue, 13 Oct
 2020 02:51:48 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5585:3adc:f199:7d5a]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5585:3adc:f199:7d5a%8]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 02:51:48 +0000
Date: Tue, 13 Oct 2020 10:49:31 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v17 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP
Message-ID: <20201013024931.GA2299@pc-user>
References: <cover.1600423931.git.xji@analogixsemi.com>
 <528b76c1a4f7b6ea85371bfae4bde389aec4bb24.1600423932.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <528b76c1a4f7b6ea85371bfae4bde389aec4bb24.1600423932.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [114.247.245.146]
X-ClientProxiedBy: HKAPR03CA0016.apcprd03.prod.outlook.com
 (2603:1096:203:c8::21) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (114.247.245.146) by
 HKAPR03CA0016.apcprd03.prod.outlook.com (2603:1096:203:c8::21) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3477.11 via Frontend Transport; Tue, 13 Oct 2020 02:51:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd72c370-1034-4695-49cc-08d86f22edae
X-MS-TrafficTypeDiagnostic: BY5PR04MB6802:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB680280A6E00506FC9EFCB749C7040@BY5PR04MB6802.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EqfH3hc77wLoBOGWyy1VQUzVY1TOdmxzMltY/MKPLh5dd+XJ9kp4KkhlyjFdMGCZ/Ls+ibDFQ3UcrqVLfwvYGzhLlK2MMcOIu/sqivEoMZZKu8pTSqJoPDCYnpuJX2+OvGtoUPIwLdDX7UU3uM+EnhhrE3/1QxuEGNvKEgpb2wkCHgkpbcy0L4ueYem9YRo4QuIpQiW20wty/P4OHmJjlzrpbmb3c+zw6LLCRH2f477tPRZcW4MzDPnwbKriWgXmw3LS82UeVc2orZdsvmHMNwRVaJE0KIVXGtsgrjWhyN+eaUEV1y9uKgZbzj/c7BXFsKIks29oBfBF4ZnV55PF+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(366004)(39840400004)(346002)(136003)(5660300002)(110136005)(6666004)(8936002)(956004)(16526019)(54906003)(7416002)(9686003)(52116002)(316002)(33716001)(55016002)(6496006)(186003)(33656002)(558084003)(26005)(86362001)(4326008)(8676002)(1076003)(66476007)(66946007)(107886003)(66556008)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: xhXLLDpZE/XYYt2CJnDxLtOPAI1+4rk7VnJmvyOVY7e1mBu1bWl1uE6xFFN4vjksDIIu5nZ7A6JZJAQta+Z0L7443RZEcLmp4QW2x1ZvmVWgdrRUUQR+Q3VXyFFhPte3HhBp9xF0647YNZ0qRfwWOtWkaVGZdpWuRJ5l6EVplxqRZ6udJ2MfeEvaxpXwjaExb9rbP8fysuxo+JgoJ+0ZhWi7qi7prsSXi6DbdTGJHNHbhZKfbkiip2/JIxNYpnR/528xchFaB0SFGITHV/MIX16QJVXbiLbvI+viVXdW3UH4qXH1UOga5m9p4Vxr3IPeeBw/mM0fIcADKrYQ4+aiMQv3AbEbJBDyEwTXtytDqDhlgDoSm4HEDsLLIfc8oC547iNBrd0CvV+qQmR59IbkKnVaq4bOs/z+xRnbFPDhmls9rJ0RkaahGS7yiclNLdyvebCa6QbyQLhtlKjpn9YClQqxWAXTAgtTVZPsODQe/f87Z33btgz/rAdb9gg1qsIKMfM+DQyLIY4Xp79Kepm3rH6dEXf0TFwZQ2QYa3mxGYsP4O6FfK6Ncfc9psuVB+8zHS3iEV6Fj9z996gtmD9qY4pBNkLAAmddrlLOCxcF/feOPvHZGz2uINVRNwJ/eUOdFXluH+RhWTEcPxveknaXRQ==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd72c370-1034-4695-49cc-08d86f22edae
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 02:51:48.5116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8ovZVo8cscZHzIncuMruPYbYp4IAk82bPnjbX2gHMONunkEdjkLvKO337nl0hSzs5naVENpnxdMM+tZJOgb2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6802
X-Mailman-Approved-At: Tue, 13 Oct 2020 07:16:53 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all, would you please help to review my latest patch v17, thanks very much!

Best Regards,
Xin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
