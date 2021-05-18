Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F12DA3875B7
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 11:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9206E867;
	Tue, 18 May 2021 09:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4616E867
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 09:52:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjTo/ZV84yjfSfeUPkOsFI7/JO5ZUt5sjkzn8DBJ8SpmRnT0Z+3a6uY/ZPrWgOQfpZYTDIJ66BNNFTZtYCfogxFY8gCj6plEG8z+fBv+bE6OZLO319IYGnjpSCTRgG3Tr4z+5ydW0ojOvrrE4KbAZo7sQogKRmcam7ig6wrpNN3me6dDPaPR/++M453d0+EMjrKbK+J+d/gBD/S8MrZzu/BkaPSF6iCzFULV0Bnbn5r0YDmsEVmRi5nLODjJ5PQ63ooOeBRacCrjCjWdYop/s0AIh1N5nYzdCz1kx314Ja+sz4Zp1/PhCFSmvdoaM7rXvls2irHHRgDHwrBUVHDUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpNdpYEuzkEvzwoRt0y6OblPM4gIQfLEnd0HB/+bB88=;
 b=GU3NADtLVdF3P8EaIcpzczh01LOgw6OcEXNB10MxBw1FHMacaG1BEwQ+z8i+5RHj1UO1T28OW4UI5KYxJE730hMvOAUfAZL/5jwGAkvvDCM6YAw67bQgtOguohZxqaBgPLLNrvdbUBDtdGCaL6kB8UtQ0T73KCmxlFQMuwfODbFnA5tcq5/USD7vrWoettGHETeQlZIo9WJnmGBeXU57ZHdO5Owr6GaV95/Izrc6pk5NA6ZJqxKXSAUr2puOaSHFHOkP8nG8kqqbRdfb+zvZl1DV9LvW7RX1QKnVuy8aWfyCiEMhXtbnz2Mv3VirK46ltiD3baDlQMl0oGHZ3SYmuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpNdpYEuzkEvzwoRt0y6OblPM4gIQfLEnd0HB/+bB88=;
 b=FNC07IBUtzpV546kEZkqymiovHpy5kn7aCdXfjv36O7n3xyS4uPRilZ+VVOQiboxu6Mjcpx5EDyKanBbA6DP3GDX5Ok5vILoMsRe0wbRl5jhG1etYX4HjFI93fE/3mYdnchZ4+JvUmq946c93f6+i89pd1LRJPbMraAnat/Jo0Q=
Authentication-Results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0075.namprd11.prod.outlook.com (2603:10b6:4:6c::16) by
 DM6PR11MB3082.namprd11.prod.outlook.com (2603:10b6:5:6b::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.26; Tue, 18 May 2021 09:52:10 +0000
Received: from DM5PR11MB0075.namprd11.prod.outlook.com
 ([fe80::7cf5:4b57:4804:20bf]) by DM5PR11MB0075.namprd11.prod.outlook.com
 ([fe80::7cf5:4b57:4804:20bf%5]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 09:52:10 +0000
From: quanyang.wang@windriver.com
To: Paul Cercueil <paul@crapouillou.net>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@xilinx.com>
Subject: [V2][PATCH 0/2] drm: xlnx: add some functions
Date: Tue, 18 May 2021 17:50:17 +0800
Message-Id: <20210518095019.3855369-1-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To DM5PR11MB0075.namprd11.prod.outlook.com
 (2603:10b6:4:6c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qwang2-d1.wrs.com (60.247.85.82) by
 HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.35 via Frontend Transport; Tue, 18 May 2021 09:52:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fb500af-3935-4996-a33d-08d919e29a9d
X-MS-TrafficTypeDiagnostic: DM6PR11MB3082:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB308256E38D9CD215CE957B30F02C9@DM6PR11MB3082.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BUQZEyeZIkE3lGdy0mRV0K0sC1rwiLVbDw4rZJCdxmPdX9ZcmCj/Jqx1Xwj6cndv00JPVOLyxbKI3qrWVk7ARUiwdJCpnR95FoWJyhV2vE/FWW8hgvBrFYu1rf43mWEulohTxbl1vXU4yiIVM4XtXzoO/rui2+JWOX5P35jSYvXNf4wJ5VpLD9ewhg8PGT2N9v6ap0hGn5DvPWij32RSSIjVy+jjx72VkoYpTml9YQBsMUKSUZGyTcoSYuVqhuFxEFe0N81wt/tzw+k7oc2oaQJLIar4sx7QofL8t3wEByI6DevUh2RBTjwoo8L7Xu/W2er4ztQnXq+c7ws1x8qraI1Tcj8ElaAVC031FPjgSPgLfRyUqIoubhVptbc6+OZt56JVFRuocZzDH3v9POfHN0Sn2s/Dz5nx4UjIg5FGse9HDBQxTbW+7+jqOKX4Oi3O9bR7O4Cmdnw0v8mkAsyaic3aynaTGtK5ijP99xy/BKnGY8c40noJCHSoDeNZypb++UFY+5VJnHm7NLPqs2uSasIzOQBIrypOgbq+n4vZxL1u4GJSVy0JXD1VDUZFrqYlSs+iHZcEuwWl0bn1mt5PuLFAzfa7ueNan2Xk4mLVbATfQHnO5cA+PGDYd5tfz8hclFUJiMuK225kvl6lSIgVcLzCidbzQ1iQWEm3H+2eoA0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB0075.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39850400004)(66556008)(52116002)(83380400001)(66946007)(66476007)(110136005)(38350700002)(478600001)(8936002)(6666004)(5660300002)(38100700002)(6486002)(316002)(2906002)(2616005)(6512007)(9686003)(186003)(956004)(4326008)(1076003)(16526019)(36756003)(107886003)(8676002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gZmnEtFH2lA+heNZHOFhOmUtjO3rv7o1NIDc35xTpDW+PVOTQXMkDwPROTWH?=
 =?us-ascii?Q?25jEh46L2VHS8qsvNq/BudOxqfYFCMJcRaZ9XiQLlWe7+7lIJ+ajcW57G1NY?=
 =?us-ascii?Q?1+P0VqYDHsITxiCHJadQ+o3KiSNq2vJi6DM3+cTwwCWmVGlWQwCS0ubis7lO?=
 =?us-ascii?Q?tOWUcyq5OdFnMAftuDJ6di7S0EQ12pYo07JLWsK+Y1ONHTzwqs/NntrSZrOM?=
 =?us-ascii?Q?UZN3aRuamhUfd/g4Aj9ZJnlWxb/MlBXieoZXYcl5xIUcStb68No++bJR+WQf?=
 =?us-ascii?Q?pNdyxiXdzrWTz0pr043BWCKUCbpmYzyhGuOLd2I7pDJNnomQ/NctcI++IbRY?=
 =?us-ascii?Q?BJbtmIJtGgGlZN6Urv0R6prdw2AmJxOYuUs2h0ei4PVj0X691E9uthSVk6w7?=
 =?us-ascii?Q?Ex0jaffnxYlNOpKXmdicXaf0bs25UECwscKvdsl4U7kvovHOVIWAXqMTTzBd?=
 =?us-ascii?Q?KAizYfCc1kVkSH/MRbYQOP4X2hOPcl3peANVWLHEnP4plO91+SQAMQsoeaxc?=
 =?us-ascii?Q?jD/sBx0KLt8uLcIzuQ29nKnkvTmyLj120mKiADEy/DLKCL3O7qPqegFEnCL5?=
 =?us-ascii?Q?fbpuTLw/xeSvDZ1C8hIy8W1iiWzai5hCdjAQcy85mws/VnS3loROwzlEwdU+?=
 =?us-ascii?Q?6sGixJc0Wjsdi9AwwYO4+umN8HNHZM82U7n1EKeEbHuK56PKqO05HQN688VV?=
 =?us-ascii?Q?MY/gqJ3T+pt+UTSlESksh5ox7+jrB61/PDv2UqGw7fr1O4fqTxU8T5Q+Nytg?=
 =?us-ascii?Q?VvNiw83uBIRn5cDY+h7pLgZW0Zfaatz+aTjxO237bX7d5Y/tkPdGdCQ8cIlL?=
 =?us-ascii?Q?kVFlHXalgcAdGjVeXMXacKntMUgIEhn0rBar51kfjf/Pv3V+b8nvbCO9nyjm?=
 =?us-ascii?Q?XUqQOpjcwb1Xroq2Mne+8E8Ol0wxym0tHd7REbaHchvVdjyPdAZVon6R3gHg?=
 =?us-ascii?Q?1r1KxQOuMJJyDL5anLo+aJHwLpD8TajrFHetB1DYcgWXrt3lzXKxQIY09Pqg?=
 =?us-ascii?Q?t50uieGYXHCn3l0qppPdsboMxAIN7J3OW3yPxNfKRawvRPTGm9GEW/0MmOam?=
 =?us-ascii?Q?J7BCO6uxVASQlk1TPyiw+vrEKN2upqTIVYx0FUzrF58yAOeN87L9YNZczLJT?=
 =?us-ascii?Q?5l/B4yvQ+mER0/GSr+3hRx7jyph+mJfKHP+Rnnix3Am/p3dRQyhkdWQMdG/p?=
 =?us-ascii?Q?8gNtB8cVwM3k//mVGtSmyIjTdTPb+qV3z98KlmiIujB8GOggVUSwR//0B6e+?=
 =?us-ascii?Q?YyxlCBv4rKnls/7ndYbg7ljsXt4NKZ612S1OF5uzlZPq21NsKMqOW6WDcMPu?=
 =?us-ascii?Q?VzmAmoZ8sILsYzYJmZpori/k?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb500af-3935-4996-a33d-08d919e29a9d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0075.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 09:52:10.1328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBMbvPJsGsTJAWA8WvfEv6oKsnAkLr94yTvbHvtapXd8ZQ08sxfYwBZ75QH16mQGScysdIC8h/ZII+EZEiK0vFsaLMj1t+f4K0A8sZRDrM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3082
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
Cc: Quanyang Wang <quanyang.wang@windriver.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Quanyang Wang <quanyang.wang@windriver.com>

Hi all,

The patch "drm: xlnx: add is_layer_vid() to simplify the code" is to
simplify the code which judge the layer type.

The patch "drm: xlnx: consolidate the functions which programming AUDIO_VIDEO_SELECT register"
is to consolidate the code that can configure vid/gfx/audio to output
different mode (live/mem/disable/tpg) in one function "zynqmp_disp_avbuf_output_select".

Changelogs:

 V1 ---> V2:
 - As per Paul's comments, add "const" to the argument "layer" of the
 function is_layer_vid, and just return the result of "==" operator, and
 add Acked-by from Paul. 
 - As per Paul's comments, fix some pattern errors and use FIELD_PREP()
 macro instead of *_SHIFT and use GENMASK/BIT to create *_MASK macros.

Thanks,
Quanyang


Quanyang Wang (2):
  drm: xlnx: add is_layer_vid() to simplify the code
  drm: xlnx: consolidate the functions which programming
    AUDIO_VIDEO_SELECT register

 drivers/gpu/drm/xlnx/zynqmp_disp.c      | 193 ++++++++++++++----------
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |  23 +--
 2 files changed, 121 insertions(+), 95 deletions(-)

-- 
2.25.1

