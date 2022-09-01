Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C42BF5A9BD7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 17:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFA410E033;
	Thu,  1 Sep 2022 15:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CB010E030;
 Thu,  1 Sep 2022 15:39:20 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281FIggU028411;
 Thu, 1 Sep 2022 15:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=MR+ePpMzY4Gt/nAT1M9QsBa8EStf1y/VAj1zb+aIBaU=;
 b=TqtredDfCcFcp4g7d4j/C871Hnb6siAoaPNncmrtj8rSRNsxsIehlw2VT9m2pO9rZJIr
 X0N6X9UOImQfsAPqj+4iLV3iFHg4F+XcV9+J4MhAnoQvQnjtlormNjPYKfsjbf5S0soY
 I03Uy/uingkx9QRxuO1lT4vmX304jliGg6tleS/BVUXcaGKgWHD2MhYJrLb8NOV9r750
 449kqQRr2N9FpSKTqA1+vE8MrQHlFPxs1XrXkUojMStfjJcU5yW8mf50NSEu/Kv+wP4P
 3SJ1oyPYtNTfCMvRDjVlIhyPXb464sRYiKz8vcYv8l3rBc3zNkTQUud413Lw3rilqQ4p 0Q== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j79pc49xe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Sep 2022 15:38:56 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 281E1S8j019674; Thu, 1 Sep 2022 15:38:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3j79q6kd2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Sep 2022 15:38:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg+DokADsL3ZKvTThmCAXqsRI8BFeEiJpcv7fJfIslWOkjGBxhcOjoI2PcjbgfqiYRYYXRoT/qRUat6v8GygPo9zXU/Z/XSRZFb9hQGrEEEsdTH0MLOFEMaAadWHjFIG4OS4Suf7j8IVGbt5ComrufqkQid4yU9XPbo7yjDPUngfeTxk5Q2TeGV2qNB+rRq7gawbeCfFFvj0oOmMqkezW/vBsyRlj7s0H1c86yRDzf98lNYSOt/4GPeOv8n2lI5Rz25QOJ3bkWdViX3vMNWlytTtT6zo2pfMpEh90MntvtHG5ISP/y8dtgzw8g4mQLKynkVdHAFQuJxfY7EZosVL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MR+ePpMzY4Gt/nAT1M9QsBa8EStf1y/VAj1zb+aIBaU=;
 b=WWSv98UDck/jI+Q0U3jLhW//inNbwEDm/wOF1QRlUPYxt9ja7wUr/RaiSk6lK50LfCEfljiQwWXKIziL60zeIWlQfnsV4eKMXFhoDbmbxDAt0Xy3OKRDWKBKkkGd9pAwj/fpoYhI6dU3R2yBU4RRd86yXifNbvz6kPGOXtWNoQf2QLHlDreKcZxPVXvOa1amKGsUIGx2s4CCgtv4Iny+xBEaS6cVNImwmBZ63R+apUa5hGcKL5Ik3jNYNyr+lKZ7Yab15OBghnhuRoN82i+B0XQiAuSPEqJi9nSPeU2aR6OoKnaQFIeHV3BjmdLhPiWUhaS3KAtOSNzVo02sTy3vhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR+ePpMzY4Gt/nAT1M9QsBa8EStf1y/VAj1zb+aIBaU=;
 b=GGBAu3/h/9RY7C+Oh5u3hmeebpdi96mC+0A0SVGIxiWdbjXi6Srd3LOYs6IH4DtGZlkTrIAqIJqA8/l47DQ/En4k2m56dgrpz+MRpMZs928nlv54mWtoqWQ5vmROS3L+vWZhV982K7c9hRA9pLbu/RyiJRcU3D+Y92zt7mgS07A=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB4590.namprd10.prod.outlook.com
 (2603:10b6:a03:2d1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 15:38:53 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 15:38:53 +0000
Date: Thu, 1 Sep 2022 18:38:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH] drm/i915: prevent integer overflow in query_engine_info()
Message-ID: <YxDSAj6tIrTZv5Y5@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0126.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97fea0c8-a552-4969-33f9-08da8c30131d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4590:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tDXlHs2/kbXl3EJkGpzAUCgl/5aMnz+tUGzjqxudFHCZSJ3qWwl6V+FuKlvEVFxHcfvxPm/DBCvyJ1Gp2ZGmY715LkOLTO/nNj5UDQ1gsejmt0GEFgBzi4bI/AZVKUvXX/UYpLUAcW0ElzTJ8+HNW+irV30u4XDxFs7ny7YKcmLlcDejF57M8dQqqGgdd+0I3BI/a8CQbpV4Me9PFvTOeWqjvS86cs3IwX4RGeHPlEqWec43ZrjrPT77K5vPTy5qs+BpzyVlOvunaw9KnXa9hU0XriNOy4u3oN8+1Aspro3JLtCREVYe9qTrQ3+RyVV/iBOEaLDDnPtgHrCk1+Cm08xh8ILNQD8ZgKKoKtnrOhwOqIQVSpDP7nQqPNWw56dnjAP4w6rcZUoxDWn2c8EvZz11/8eZonnF7+0rjx/xt3G/fmnI5U8ocQa4S6r/fKgRsyAMSsepLCF3Gr5tmXqhvhr1FLJgaHb0VF6oXiXTxFTy42li8MAhVVDFtpErzKWP9cwHee+9HpTJYu108pSfZEQVwQRlqsTaEaxpfc/2RtWY8NjYL0RTfJWg2l0W4vKtefIeNk59TOVdVG1NIRV5OqI2dejQsx+8Hq72fG2ta/gBoTmMvzNSkc2KokuhnCFte4fVE7ESRPsfnYAHu5A8oB5adrtkbasWK5qq+GdqzBOlp8+nmHrvHEhDE6GgN9sodqOx/eywp0U/qK00x5068A1IEIlw7ijE1MugusDzGOO/NapjLCTJP0ycNwNa+d1ckgiZK5Y4KLx2h4n1zT7Mkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(396003)(136003)(39860400002)(376002)(366004)(44832011)(316002)(54906003)(38350700002)(110136005)(5660300002)(4326008)(186003)(83380400001)(8936002)(8676002)(66556008)(66476007)(7416002)(66946007)(6486002)(86362001)(478600001)(6506007)(26005)(6666004)(33716001)(41300700001)(2906002)(52116002)(6512007)(9686003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MpmqA2X/9VD47Uv4PfHQoqnGGsdE8d6s0nJhe5buJy1HQ2uCpBpuzD0zeWLV?=
 =?us-ascii?Q?7YvbAabspWBZZFnL1BfNzvlYlRRz0qC3lLDIuMcbmQaOdOy7GlJ0NhCSqw5x?=
 =?us-ascii?Q?VFbaDZMIj2YURVl+tEYy+qFOlMv/L0a/KaK2N5Vui9+OKzljfxEIOLK+Ny2z?=
 =?us-ascii?Q?gbvvDWnOzsaxS6BNTzyUHHh+lmKnMhUha5g4ckPHSgUWiM4yAM4w+c6AHeiC?=
 =?us-ascii?Q?HHYuxNcJKttZfXJ+voI5wdyGgxuaVdovZtlf5+pGsVD6vN+n0+MZjuBdAaI7?=
 =?us-ascii?Q?MlB0NCk28uoDP3Wy5GlpCMD36lYxXVDp5mIsO7FagHW9j9fqmoIN1m8JLD9H?=
 =?us-ascii?Q?P69MiP0NDFkipJGNDtrfLrBbTD70bXqB0sAlMxaMjaUsK0qLUqJFtXrpOhxP?=
 =?us-ascii?Q?ndPt0xfmuCaAgn0oDLnoVSIZlaG55N6Ip/eJ/PFr7w2kmZwFNrxM9ogT8jL7?=
 =?us-ascii?Q?iD630jPkDWM7NjnenDA9thLUgwxvt9SoqGo9q2kXQMoBxQ5pqUtQmMa6H2np?=
 =?us-ascii?Q?tg42zVuFPn9NO1hrVmxHuVrInA1y0UPvFOlDuw360vxyeUXJCUvyc6M5A/fv?=
 =?us-ascii?Q?+tohfJTg36Xf74K+obeC7qRL4xOQqbILP3Po9iKPHORnl7G8OM31AobJ3ANu?=
 =?us-ascii?Q?YdlrjjSseOfgo5p49GlFSNwXjAeIozNmZAeyPiwX8vU5CrfqiK1JMsZhUh+S?=
 =?us-ascii?Q?GCnqaDLposmXLjNv/n4mM4cvsEMuqSP+zfWSUgtffOX4Ze+yRF832oDh1SsM?=
 =?us-ascii?Q?e9R54uyF1f6nFcYjg1Oub9dIlOJBn6eThbH3pNaaRh7s3j96aqXNutSwogAM?=
 =?us-ascii?Q?j469SMTWlBLWAb15cg9Hh/AWiKWJFLZBcY62Xsfb65JCUe8Qw9EcfkBhCFsZ?=
 =?us-ascii?Q?fXaDgyKAxdC/KsA46dDqdDpp8C+qJkSLttQ6YbSNApri5+YjUdbMG6iqbfsH?=
 =?us-ascii?Q?4SZdWMqSFZpJ5MS6fklKNt6i5rKT8Dadht1NGNjZIk4MiRjD9sS+GV4qQ2Es?=
 =?us-ascii?Q?8FdsfyZOJcuVxqq1OwDnmB9h3Sjjcxk3yzqBz8mjeJ9dMWKhIcxdoopMMqj7?=
 =?us-ascii?Q?mJG15HfIm/W8/0OL8PhrpDWE4y3BOoGW34JEcStJyv+KhFo2Yfb4/IE1tzQm?=
 =?us-ascii?Q?NLb4FZOkyWnyGRTc2NNiNl5Jzkn8H/Ga/HUd1Bjpj5AanogzE9mTS5kuI/H5?=
 =?us-ascii?Q?nKMgq+uErY1w3CnheSi/7UqrF59uEXlegUGXZcfoiaEpbt+iJcInk8Q7viVv?=
 =?us-ascii?Q?1xQ2QQXu0mtKpyM4MVibh1cuSzoSfNVkoeyyrjaeImX7gDNj+5qAURtA3iIr?=
 =?us-ascii?Q?A/JMkH1ug23T8Z1cRRGSNyccGLamB3xqv0C2XRWr73GPeKD1P5ScIIA+QbIR?=
 =?us-ascii?Q?Itpt1gYfCK6i7jINbNhnEeSfMLD1iLfey8QJDMIkNr8kUaNTZ9CNuqSlx+5r?=
 =?us-ascii?Q?00GQIUkzW5cS6WkXyvO6C/agnmUgntMw41bHgZ1imG+x2Udo78f5BfJbAoEp?=
 =?us-ascii?Q?ZpuwmR3PvI/lsQq/Ba9Q1ZeKV+3Iy90aanZRPB37wRnzjkXTJgii3w3AYuKa?=
 =?us-ascii?Q?jiHzHpXSH0OKGXxURvQjRfEkiELG9liYz98wEADeAmy4zjq+foci/1Cbzuh6?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fea0c8-a552-4969-33f9-08da8c30131d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 15:38:53.4752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gxv79g96zSYzURoYJBsDxx+8jflLhvaIseL+KkhsN3llZl2CzQN7swzk75P3gh9Fz6ACOFbuzmuuuNddKwXlhf6bTQ41YNCSBYaBf+0XCY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_10,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209010070
X-Proofpoint-ORIG-GUID: WgqqHOt1dp3Jk4Tmky-Bym8JSoczgqek
X-Proofpoint-GUID: WgqqHOt1dp3Jk4Tmky-Bym8JSoczgqek
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code uses struct_size() but it stores the result in an int so the
integer overflow checks are not effective.  Record the types as size_t
to prevent the size from being truncated.

Fixes: bf3c50837506 ("drm/i915/query: Use struct_size() helper")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I do not know if the integer overflow can happen.  This is a hardenning
patch just like the conversion to struct_size().

 drivers/gpu/drm/i915/i915_query.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 6ec9c9fb7b0d..43a499fbdc8d 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -13,7 +13,7 @@
 #include <uapi/drm/i915_drm.h>
 
 static int copy_query_item(void *query_hdr, size_t query_sz,
-			   u32 total_length,
+			   size_t total_length,
 			   struct drm_i915_query_item *query_item)
 {
 	if (query_item->length == 0)
@@ -135,7 +135,8 @@ query_engine_info(struct drm_i915_private *i915,
 	struct drm_i915_engine_info info = { };
 	unsigned int num_uabi_engines = 0;
 	struct intel_engine_cs *engine;
-	int len, ret;
+	size_t len;
+	int ret;
 
 	if (query_item->flags)
 		return -EINVAL;
-- 
2.35.1

