Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB02450FEC0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 15:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57D010F144;
	Tue, 26 Apr 2022 13:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2118.outbound.protection.outlook.com [40.107.215.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBD710F12F;
 Tue, 26 Apr 2022 13:21:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJDSe0sgfr8I/HCZMsJLRcLtanhrldp4FOYrh7+iofdMZfYZW2JFlRfX+XAIxRI726bYmI5x4ZaPR5owKENYH+K+iJNzsPxqJOwXGszYuj/ylg7NqoNRU4cRnmrQz7kwKOwiqVCdUEVq+bLBW2rUAYzqQIOUosf1b4qQ1gY274BfiFkt8o8mbcG4oHcWFWTyRtjGo+QPWdpA4AsW6jkPq1lKNr613xLW0BPXjFcnqWC9IRmxurIwE1mUjl2y2bR7qsYxycXZFhS+W7p+mKxROUbbKTudtuwjlkBdGBu8CDdEd+xTTKR51+4Iqb8DStTq4xxxAxstD3D2YGK+EvJwMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbH/hT7j4xY6emUZBWeVi5ms9E26ZhDvilsL1BNUG/w=;
 b=crIOQxU7AeSLD/eTONUKaGbwqbeCfL68+0M6oveuCoqx6ZYGOjBgShoaOzDx60WtnNwQdKYMqWYr72vVsRAA5aaH376kXf7QXsw5AB1WXGlJx8VuiY4VqmXrV6VaaPAcA2WHN5GqYTzkpK9FOftA9SVdEJPG0w3fe6zpGp+JMxO6JjznKjB3qV1FnCHUHlJPhc5Sdx5ubSP9MdaNDnSgYKZux4KBsrnx+y5qPwNUfkfS60IZEzMjONsg5ZB9NFTkyix6Tt5oVUNsUv5QCSQPlB/cgBd6Zhh+wxuDhlqTYAGq92Uci0m+W/fYW26LMZVHnH6dyRSm+CNvgZtsZjtUuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbH/hT7j4xY6emUZBWeVi5ms9E26ZhDvilsL1BNUG/w=;
 b=hIKZvJNLk+VizGupm3U+8f8r+axoORGvhxdvCT/VHSh2sgg6uIMbTl4egi0bjEW+J1ixoLnoD/OawDI2jnK2dQBJZICUroVv544OFLGPzt51hhhNg1XwUBc+K1nOruF+wkonTMJJrsibDr6J5wLq4jeCe1HZYdtKZZ9xJsle6JE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 KL1PR0601MB4939.apcprd06.prod.outlook.com (2603:1096:820:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 13:21:46 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 13:21:46 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: Use div64_ul instead of do_div
Date: Tue, 26 Apr 2022 21:21:26 +0800
Message-Id: <20220426132126.686447-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.35.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:202:16::11) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9901219-c31c-48c8-a267-08da2787b644
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4939:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB4939232C8944BBFE8884EB45ABFB9@KL1PR0601MB4939.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B61C6wkGkFp5xHgCf1jV1FJIJ5v+1ViMwkzdI6YKVsedAoDlzr8fY4mgrF2Z+vawS1fWAsj4huMOmbX96NWHdtkmiCCmaI2M2HHZkq2iC2pA4IVkse8prYRtV1ktCxWAFACio9Cz2EG7gDHjp1PiNqDfLtoaf0Q9SWt+3fZxyEwl6iRJkkK05UyXZJVFiScliJRICb4qwVnsk5OGFt3lxRE0rTAayW1wsaihrDQwTpcxU9EivdIF6to+4fTbGkxQo6ZT1fgG1etmGaR4wSwSS9svWP99GYfHEyt3HeGJUWKRrVlOMgNPgOaov2ZMolo9DaB1jZYbderYnnTwgnMtLDP1b2LO0fNkd6xPWtDl/h0IJT/5PApPbekBVjCY6JfxTTXav2dXZfiTbFEUpxAZGJxy6F+Mue05oQ2EobyRGsU0jBfw5M9vM2MHJRH8HPRNLQNE0nUwJx/kfar3sMXrcZlfoQZWhqWlHmhvNIRJ1fHKozxvp+x/fcZKvLX42g5/zCipFIW9Y+2dW9ybpB8fhQZaCs5JjEibHYytonIWEVP8A6S6V2+6jxCmjK305ny/vkjhwXRPmERvbsc0Rpo2U8jtk62sWjhQEBZXFZ2Zv8f94/fqWVAyAXAp/1F3JUBu1DfI+9PjUucosotx/BjCzahe5hyjactHsQJ468SlIoARifSDpCEBYDoixwxxgr+JGY4WEVbXQWk/06+1Qb3lng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(52116002)(6506007)(6512007)(8936002)(2616005)(186003)(107886003)(1076003)(36756003)(4744005)(26005)(83380400001)(6666004)(4326008)(110136005)(508600001)(316002)(6486002)(66946007)(38100700002)(38350700002)(8676002)(66556008)(66476007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hf9BkgBRXsC0qRahiJ2F8AldYikTI6ADL5M13tfwfkv1OBFPj8UeKoRqCB6i?=
 =?us-ascii?Q?SZZE36j82j1eyLT8rQAokBvWugqStSwWGYkFoYWOlwYycmlQmehMhWkjPgG7?=
 =?us-ascii?Q?sR9SWKXbGb0cmYzU+LW4w/O7gk2YqGjdNauQYW48nATFyQFgkD/CxMhZWoyI?=
 =?us-ascii?Q?W9IMCwNcUEfbyrLsaEKsPJqO43bDxT3N5O2TuEJLByRaM5QT6tIpg8XmQTmW?=
 =?us-ascii?Q?29NLGZYtky6vA+MLPZ6WeXQPmgYtiVcGmlIzg0Vaxg69jUQswyTr2CZSj9EQ?=
 =?us-ascii?Q?GY3xxBj0m3LK8P8og0W6GdJyo9YyWnEaAXnsU18BQCsPJIv0LBYdEC4L+Lzx?=
 =?us-ascii?Q?MiEcIDHDkD2/rQZvmoQ0wMuAnj9sLHapX+/8zeBkRbcs8kJ+WXpMMKO+a95S?=
 =?us-ascii?Q?X6HdahQBCc3kejsldYCh9NRzp0JDlCtlbWjGq35nIfxNnL6xG5XV/65j1TyX?=
 =?us-ascii?Q?fWL1i2MuGMPn0+vi92x7RuAsp9T2/J80VmlJVL54v9oTUPLhlcv3NQtExorJ?=
 =?us-ascii?Q?lcVEQ92lZJTPcPX5QKysmbheeIcSLSjccvQUbCk3K9rCPJpv4uaZR2Z/ghJ4?=
 =?us-ascii?Q?dC4RebP/6FDezGVgBRip+iQApT31jMMokU0hRsDpUBL87uGtWfuM5Yx5GM6N?=
 =?us-ascii?Q?qg3hNcymjK/iLmTeVw8+CHoShQy4jjPoxz1Q/vQHAz/vldJsjiPts5CqYzrK?=
 =?us-ascii?Q?dSdtyt79clQojSt2owWCZnectfwzfoQcB2AmbJ7ruceMEvxatMWRkPTHVFk2?=
 =?us-ascii?Q?2CrbZ+gfJ7+isF25k0hT3ZZhnh4DVFiOmpMYYhapXGHt67TtFwfzM1smzesd?=
 =?us-ascii?Q?gL3GgzuGQAdOXSM86BRVnRxdBqKeSojawPsl7zk1YHxz/hiLXoHk0ZaPT1jb?=
 =?us-ascii?Q?XGHXQEMM5QtnsIEztJ3NTM9zORmLjpw7cgC+wdLxJ89yOd+crjYBiiCNJUBd?=
 =?us-ascii?Q?PHt8iLuVNfV5FI+LSg56PQiJE0P+sBC4OCKRZHv9LZ1Etn4vhdtYAECo6Tlo?=
 =?us-ascii?Q?8H5ejDWG27tbHoLjD9rsFt/ALtaapSVk9pWv4GV7oWZtIgVBoFmyfSqY5OfN?=
 =?us-ascii?Q?POSGoYy/dUXukf8ETi4XPs8dYkVMJZiziwtGZZlgkgDpnB6V7do+/+Ektltu?=
 =?us-ascii?Q?qOmLHWe5T9W29HrE8m0vVFWzcJsDRd0GtTRpll9v1Y51DQEvii0fZWU+Y4bY?=
 =?us-ascii?Q?4ES++j0+etmCQqPXR4pdbxHVtGffFsaYZPDuXBbgBfNNu43lehmGMH9gsoFM?=
 =?us-ascii?Q?14OZpuib/+wbZR/V84uyYN0PSYXjXQMbRK/JvEGEzilpGJqqnA5OCj5dEZLc?=
 =?us-ascii?Q?b5t4lrgs4HTsyGqo8PlFq+yhPevFcfENTB4E9sHkcxMYynHca9KdzLHkO3m/?=
 =?us-ascii?Q?/LAPwCXoYFJcKD/cJCMgqgnE6yYq+ZJ3GdoUuEpNegbhM4ToC3ai5Oom67Mq?=
 =?us-ascii?Q?keDgCoh/UQoanr0rUHGUJaxS5tur9s+LoaoE9evWrZ9hxejXlz3U0uk42xyd?=
 =?us-ascii?Q?daobb7qAM3/RyxX0GgC1z2arSdyNWrevVwpkDfaO1TPAHy/OxfmjrrdMaA8c?=
 =?us-ascii?Q?qACFfjO7fouZzgkRkd0cp+cx2Ii8ZjCP9XN1QD+6SjORSSW2/qywe1g/cZSg?=
 =?us-ascii?Q?7BM1vLveYdqPWIaU4RC6/0Dm80U8ry229PEwnGnRTaqW8R5X4EvU4R6+LHIT?=
 =?us-ascii?Q?ruQe8oXUVn14n/L2RR7iqJlxhADrpBGl86dTeY9+BXhSUox3iIXUdkusuXCT?=
 =?us-ascii?Q?KZyqN+zuoQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9901219-c31c-48c8-a267-08da2787b644
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 13:21:46.1022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUArpZIYlIiStGHEeVO7m9Xop8ZqgrzhvFdMNwFQd4wMlnM8GWV5tlBkDDSyyImdHAEQwVsWS2Xu6SIDvZKfMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4939
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
Cc: Wan Jiabing <wanjiabing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix following coccicheck warning:
drivers/gpu/drm/msm/msm_gpu_devfreq.c:72:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

Use div64_ul instead of do_div to avoid a possible truncation.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index d2539ca78c29..c2ea978c8921 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -69,7 +69,7 @@ static void get_raw_dev_status(struct msm_gpu *gpu,
 	df->time = time;
 
 	busy_time *= USEC_PER_SEC;
-	do_div(busy_time, sample_rate);
+	busy_time = div64_ul(busy_time, sample_rate);
 	if (WARN_ON(busy_time > ~0LU))
 		busy_time = ~0LU;
 
-- 
2.35.3

