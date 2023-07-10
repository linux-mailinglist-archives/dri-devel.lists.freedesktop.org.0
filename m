Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947674CA65
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC1910E0C0;
	Mon, 10 Jul 2023 03:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::701])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9811D10E0B1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlLUe7npvBUqFyaqhSZW7QXqltu1drCgYg6NLKvozV8cIvkDRO5lnTYBgZSr1Y1fhN5rMFXIrj6cP5YROmuJcLMkJE5czXu9t20rgIzI+ws895Wy7vsnfcGDKs4lbBj2Oz0p1CTBCIHDth1iKlWIxWW1TG5ByNQvSa8si/orvJz35tvgmoQIQXnJ/wku//kp84v3Sa4vDsXYSN3Is4dF6hA0U7w4UHqGIH+coQV0/Wanp1un6BohcQj08pG/Ux3coB+ajYOa3HHlNF1Yu/5h9P2Tw1f2Hd8pExjyECqZha7P6rG15mLr3lyxJgXfu8BXOn1oJoELW6IiQTfMhCwIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKJoh2hSC8dM7Y1vvcPJKJWgRJKyavcM1Y5HK94NPkE=;
 b=c7lW40Q7awawgxIvgeRhKARUPKjMB0uvLKgroiEGC254hTZuFLvjkTfqlDqws4uXj5EPALKtRuKeBd0ZeFnzYr8HUSpn8KH45ATWQ0CzdAf237uM4K9d2e+mAjsJ3U0j+6F5+DBl7nj2XV17LhrkqxqnRuwubdDJrOuXSAaKuNgykDIlQzMY5k5AGPoG0ew1OLK/hlFNzQLDkLz5N2FDgQacgNANZIPlM2js9cUw0KTZF/tayojXE6xrAXVB4J1qy1k80xhth0aDYcPHp6m97FaYF4sodY+UXgAkmLawg5gHWvgEJlZRxHjb8PFhNYoToZCRGfEea+R2RKDauY/oOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKJoh2hSC8dM7Y1vvcPJKJWgRJKyavcM1Y5HK94NPkE=;
 b=YtfVcuGe7Cr63yYRDaExCvO+PUn46YB+ofHBvFKmFHoXs2UwbipCDb/JKMVu3Zwk9BExRcSy2VyiuIlyJUkDfJ4+afgGbanFkqS/ZtYC0jqNsY+Sf/jHotFcz57eSgO6l8mlI7dk8BLU9q2AbjycaBJC+Lgc4Vi13aLUw6ysM+HHA6EDhINBYRKa4neWZtvBebsC1gLankgUYy8A9aqPbI+w9Esb+v1/w4AcyVG6IMx5Np0YUtQH7rpY3/FzPUeVn3xoxDHT94bHOtp/QaA/VDNBxHGGLzh6ZtVtWL1TBB/xzphmbn04jwSMcPFLPDZcTxux/TY5FdhvG1HNjg13Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4488.apcprd06.prod.outlook.com (2603:1096:301:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 03:24:12 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:12 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 02/19] gpu: ipu-v3: pre: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:38 +0800
Message-Id: <20230710032355.72914-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: 8680f954-93aa-4565-2d6e-08db80f521a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JhtGblqm6EJAvxbhPErvgeZgG6OAeBBP/PcHihRwbQiG0ckh5CEK1Ki2QN1xDqBs3Ln42u9N44HoOBOQyF3A2Ncik3eZ1Bh3xlgdefF/UWKX0IvCe9aK5o1SaJmL9byaIiYi02nVUR92lUIlCZuImvyuUBxmJVtq4yMHpf6EnGUgBtckQQAZnHAzEi8rHwwGSdXhnDf9Gd216MvlzDUV8AMhsQkoZ3n5bDDnWLWO2a+eLEXGYH3lPDAbt29yAH0GpzeF8Nr1QVdvzXT+091C0Z3Fud2+bJP08aNoo7nHeC+mrqtV0bdmuZ02sfigQe+dZ7indhaxF+kZkLUWscd4rb7VkMQPWxO9H5qpZ0SOxgnG4HaSQ47VI/R424SVcZrCltPQs2/QKDvQfu3jlXuXbCLH/Yu4GOc6o1pylkHVCqh4p9nObAfO8ZkbhRIayvYUio4l5cIT+kiNWWgnorWKVzlgzH1JYOy8YqjyH1Bki/oUrDN2qPQ18p2kM7pPVHy7ZXFpWpHwvQdyoTnJ/U19GusCj+rj5lqBkLt6NlMdT1eb7jE59vGrh64tmrbuYmLGCoZ8NY1mUl4p6qp6WrlgNIj+UvxnPLDIqkabLlWeKQeVyzLO9AEEdWqfXBnytdZ+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(396003)(39850400004)(451199021)(186003)(6506007)(26005)(2616005)(6512007)(1076003)(83380400001)(4744005)(41300700001)(4326008)(2906002)(66556008)(316002)(5660300002)(8676002)(8936002)(66476007)(478600001)(66946007)(6486002)(52116002)(6666004)(110136005)(36756003)(86362001)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yeqPG/FNcWAN5mdqPS/fzY5jHjufj+WC4bcpAMS6kyKa5aLn5mBKLk1bO9vx?=
 =?us-ascii?Q?O/U1XjzJLqK0FOUNeM0QbrettTT8e+iteMYbYD6a42bFmwMLKaPoeIccrziY?=
 =?us-ascii?Q?eBY0VJ845ikdKqO4EKoCLjRzzNP7MDstyYbmgTSLWbdUcq/ACGQ5uCNdq5TB?=
 =?us-ascii?Q?2YFXj3HpCCVymyilGEvCcYup/qZf888fL00OwO2lCYDQc+tfczUUhr5Rt+Kq?=
 =?us-ascii?Q?Hs4qe6YQOaCxkCi3oZyngzZyd2darqgfil2MuqiQcWCEzl1qN53qqtAt0QkN?=
 =?us-ascii?Q?ZkWKsxHePXxbeMn0kdC1OsSKdF9GKtJ+U6fxRRJ4DZ7SxpH0umg9lybR47/W?=
 =?us-ascii?Q?tXw5mCyIFqPsDNwS0XutZ9pu8UkZPLiIxwMAk+sW/fyuv2XNhyjtVcljsfW9?=
 =?us-ascii?Q?ISsASHNIBFUIfVG1f8SppaXeEjwOETzv5BAvPpP1hLKAqEpodZx954So2MgA?=
 =?us-ascii?Q?7KxJ95fqQ9qT4990SqGv0BkBexJyGuQcfk2zSFo7mywPksVd9O14WKhnHIYg?=
 =?us-ascii?Q?18N/C+8DdGgt78OvWeB0GcKOE8Qtkm2tQWN9EfhU3yqnr2QSqIoW1parhS70?=
 =?us-ascii?Q?DKvDPvjxliEHTa0ZqRwcUIgLwB/81HVvpFN2+bKsJJEJQz79Su3REFv8q4Ms?=
 =?us-ascii?Q?07LdQTO8iYvXIJAFpxIEm+yynsheXRDLX7euIPfHp/Rd7p0wXZd+KekChe/P?=
 =?us-ascii?Q?gxVXS40+iO/ZP9knUNJAXlh4rKdHJqgHlsND6WPr0msJqb6p2vnCh6I5smTk?=
 =?us-ascii?Q?9biiKwVqD6FRvUITg4XqZirXQse9yq7ffAj4zRXl8epKDYry5OU6uBzkhtgZ?=
 =?us-ascii?Q?3VG+OG33HV5dKuKFF02iNPN6z9Yx4G2f1rvyB4a8xHhBclOOkmPWarSorE8v?=
 =?us-ascii?Q?0N+nElnFxl3clr0i9K1mlPsk7Ix435+507vHy1TonMCqOGdAELSIhV+MYAEc?=
 =?us-ascii?Q?eTDXq5SkS5r0WAbaeqvd1vNO4u+GqS18H3FCjdorRnIEj6roPJ+olZ44hXCf?=
 =?us-ascii?Q?mxJz7wlStigzXx+qetGWmdvNvWpa+CqOWrxTzSpn+T+J/M7N+c85VzDyOEQu?=
 =?us-ascii?Q?VG2Ear1SASgseZLq5eUW6bQOEQX5fTc+7FqkQveGNh1Ce8Qf74OKjJSL1HiP?=
 =?us-ascii?Q?AR8RKOpxsiE8k6cw0zABkYJEZlqTRjrYX8iLm2+DYXy+coirOArIj/Jznd32?=
 =?us-ascii?Q?8j2m6hWMrfMHYitc3FroCS1laHyISO1ztaKnJLWRgDmnNThRPZrhTt848x3Y?=
 =?us-ascii?Q?uma3o0I2MNu28KNiIpbHaU/L3Fultx1eeq4sZ76T43eBL0Eyhw8nFE4MqwUL?=
 =?us-ascii?Q?tLgc2Dtp0fvEHkJIkr3xQWKjrovfsm6gQv6xi8ADrBHeiV4TisqP1zIzyx53?=
 =?us-ascii?Q?TQA6DGXxA7BHIq2U/LUPJFIJO3ONRzvkpF4DF5XMIU/LztVkzLQ9kAcdBvCk?=
 =?us-ascii?Q?b7RpmW4PrYyMROzbuE8jYBHfTVI6xubE0ttLSSemoFAmE8cPM2GdfK/g4gdp?=
 =?us-ascii?Q?jyfeLDxwDHAmL8hsVTMozN1YY2cWG4wLe6dccU1dfR4jHrGX7cTL1eD9aL9A?=
 =?us-ascii?Q?WTOISbRN2qKkzqbcoVRACWU/H4hIXRFvk0bCFc3G?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8680f954-93aa-4565-2d6e-08db80f521a5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:12.4946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9x4lX0+ZJWPqCb8xNLpNeLP0CnAGHiEQaKtYoI6Ju/Wu1VTysktF/BbShQ+lXbqTonwSiKZ5JrVaBN8bYL9oRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4488
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/ipu-v3/ipu-pre.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-pre.c b/drivers/gpu/ipu-v3/ipu-pre.c
index ad82c9e0252f..aef984a43190 100644
--- a/drivers/gpu/ipu-v3/ipu-pre.c
+++ b/drivers/gpu/ipu-v3/ipu-pre.c
@@ -271,15 +271,13 @@ u32 ipu_pre_get_baddr(struct ipu_pre *pre)
 static int ipu_pre_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct ipu_pre *pre;
 
 	pre = devm_kzalloc(dev, sizeof(*pre), GFP_KERNEL);
 	if (!pre)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pre->regs = devm_ioremap_resource(&pdev->dev, res);
+	pre->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pre->regs))
 		return PTR_ERR(pre->regs);
 
-- 
2.39.0

