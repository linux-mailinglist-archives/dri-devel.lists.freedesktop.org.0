Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3222B6A1E12
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 16:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94AA10EC4B;
	Fri, 24 Feb 2023 15:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0917710EC4B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 15:09:07 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31OEmweU024913; Fri, 24 Feb 2023 15:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=zAqHKrn1JFZqWOev6K7J/fb3IkjV9TRiIn3jtlIXJlM=;
 b=GmWpX5oKiv+rH7MkU0AVu4y9mLQRJn0R7TTHN1BRwwokpvPvcV2tKEyOBCjEfSQ0zi40
 pD0FaVKF8kQnYwzZRcymxGA8PBYr+/QIMEQXtHhEQQ7fOxULOhDAiQ8QJo/MgkepOIih
 r26hVKK/8Kj3kHvpIU1hhqvVlRw8u1bU2YNtwx2g/ITRzzZNWcqEtw7eRweA6dLLP5Q7
 Oy+h5wgZZtEiCVGjHFW3fVxG/n1VbUyDBPg7PeYLlfD60nlwUN82Rp5Xj/NF8F3zwK4+
 wT/JVaMSyNDDp5T8Vkk2sGj1LlsKqWW1j55cUXnDvuNexMXeNC4abSIMP13Acbj1EUcb gA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntn3dwaqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 15:09:00 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31ODRtpk030422; Fri, 24 Feb 2023 15:08:52 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn49kw2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 15:08:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1IoolD8xpq6KxnQ2Az5L4A6hkN5sgftuXvBmurxmE9m1FBhbJoewop+8ca7Iqw9yT+c56/+zEwlJjLfmfWIO0rpCijm1uvrDtBDwx7qCSu/Bqd/92XtO8ydNfCLLW8xdkI8qJds3V/TP4Mr1dQEySw+uvLhMtdLj9IoUy9ymcNiIYezKQgpoX+I18iwWO49MUxWZLoMnPVAcwEvwGyS+8Wuz2oNZepYGfHWmYjAhqZshvaBTsahABdDA/H/GMgVZdLI2z5CTib+Z6ovvJLKEPyyn0DKxGOnH+uDDF8J4UhFLNzGOv7/sNf8fqoGXr+Z1vq486HuUBC+uH+HWj0K/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAqHKrn1JFZqWOev6K7J/fb3IkjV9TRiIn3jtlIXJlM=;
 b=bUjLeA8seBkshE+ZhlBvk6jyVkQhRdyxWhawoMB9ljQmdKu1nTeWEWJuXfwb/uGWu4H9CLyhrGuKUwKf4orE8H9qM9n1351oJLKEqc+4zIf7rNk1Dyq4NOPle6ANyNG36wa/dKnp8gI1R66eY370as3j4pbyrRsT+kjJtIdi6Eet7yjOpXxzDJHWCxJ3RlWtJSFtpvtKjh1LpLq+vEX8JSUYIaa8nIvLj5Jz4U8fQF60+EDBzVRTgQQgTFQ5GRxWRB87Mf2hp/bsWCB+YgYS92pGNmWefFLOCCQiTPr1Lb2ECfrakcWcSN1dWZUR6t8JQVEmjgW+LCYmGppn0LN76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAqHKrn1JFZqWOev6K7J/fb3IkjV9TRiIn3jtlIXJlM=;
 b=J96yIvIKMEzQ3hhk9wYiIm+Ri3KbsSSp6SobfvnQbzjMVLJc7zxhN3WIapl/RAWHHva+lI5uAIjwAJeqg86nYau03Zcld6r+b/tj27F+6/45u8Ui+HWYvjDZLymvtNBNrtZXYf8M3naXk55cOWRwTk+QJPuD9CBgn3Otm3EwpIc=
Received: from DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20)
 by BN0PR10MB5303.namprd10.prod.outlook.com (2603:10b6:408:125::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.11; Fri, 24 Feb
 2023 15:08:38 +0000
Received: from DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760]) by DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760%3]) with mapi id 15.20.6134.019; Fri, 24 Feb 2023
 15:08:38 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: mcgrof@kernel.org
Subject: [PATCH 03/27] fbdev: remove MODULE_LICENSE in non-modules
Date: Fri, 24 Feb 2023 15:07:47 +0000
Message-Id: <20230224150811.80316-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.39.1.268.g9de2f9a303
In-Reply-To: <20230224150811.80316-1-nick.alcock@oracle.com>
References: <20230224150811.80316-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::22) To DS0PR10MB6798.namprd10.prod.outlook.com
 (2603:10b6:8:13c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6798:EE_|BN0PR10MB5303:EE_
X-MS-Office365-Filtering-Correlation-Id: ac087c66-da7c-4aa6-6b73-08db16790207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SHG/gO1yO5gUsBMD219ArCP0aJVKHhFKSckM98tHawPA3QO8E7Y3HO4kXRE94VCqQae5aozsIXhUaxhm54jGgjntzkr12xpZG/is1pOzL5sTNKmzeNLOqz4gZzuOpoTdejsXwR9hJOEiaHbAPUVFpgJixKUFlVdECooqn4bxf4bViEHjJhvMTtsaia0mKHHGxs4Yz1Qq6VmXG2Z3Br+VrRPoyoFQjUbp6htJwF50+liAcxg6Xu46HlGvYYaiXYljfLwRVLnxC1zLSOns7t5TtUg5yrwYKjRxE4jVxQDiEkQ/a9qPh0iCJwYbDQ9QsTHHNcUNNyLpbh+5YB9RV3lMNfxnlL4FRaPAEffXbhUOPoML07Os2LWAqaLLDZFHJqsGkJfcmur+eXUAZCT0TANXxDJujD/Wjvpqwm+fQSosw9LbflPLv9l7gUEWF4nUOot5f7gHnJFydT70ztD+NiUkpPcN3L+EWGBmQqvgfrA4be9YCWf1BMHa4h49Bc3aRkvWDMyac9QVyA8+yNE4qVeMseSGrOUovtAXrQHApWP1x+cwdHMN2ZetgkqP/maRuZj6u5Zw7LKOPGccZdSIDEGSIDylLojayAiAdWv5GQ+LvAPnimhkZ9BGLtHx95On4fnG46gYgYQfAi2UrB2hVSynVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6798.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199018)(36756003)(6506007)(83380400001)(2616005)(1076003)(6512007)(6666004)(186003)(8936002)(41300700001)(6916009)(4326008)(44832011)(8676002)(5660300002)(2906002)(6486002)(478600001)(66946007)(66556008)(66476007)(54906003)(316002)(86362001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bTr5qoYhRt9Ki56Si8yghXNudG/dCqt1mT36G/DW/BnjVWmuKl9UxOinzNXO?=
 =?us-ascii?Q?plyz+ZODbRx1DqlWN9J5Ehf5X0xElWIFhB5qpbWyPCiNO1kqtjHsV9ALiXV5?=
 =?us-ascii?Q?Lx6gxaWeTmikhxaiUGLtHIGe68gOGk0vRB4aOuUgjeCBOVErUJHL2F0vpPjO?=
 =?us-ascii?Q?37uFWQAgsL7IBc1dwhVATHMsSR+lfjs87JYEXDhrtvoJAQ8NwQI4w/gr1eJz?=
 =?us-ascii?Q?2CvmwmeVDDBuTOjB9a8o+9VLb4R1mHO/fV6OV5RvvoDOrxOJSd3V+Yj8pOgE?=
 =?us-ascii?Q?d2sjGH9db7IyPge2Rv0hkKnGfpFWRJQY04eb9z838GKyt+JK8t+dJct6rdCI?=
 =?us-ascii?Q?FkEqrATT4TRnw/DRGd747n4lvBynTrFCyxdmuWXVhhyrnGl5VnIvfJlu9pLJ?=
 =?us-ascii?Q?sdoEoQ8EBPYPGhryUQjmc1eozQ9X8ov4X6/afVzgw28U3uoziiwRHgeEQJuR?=
 =?us-ascii?Q?xnGFZkIfw9rqK/D/5OWcwfHAp4+IFoSXAkmywG4ELhu5rkS1/lFUOf4i9/ZH?=
 =?us-ascii?Q?hb4LLBlbns0VBqiwcB2JSLdwBUbOm0PQqnOSsWaB6koWQVGSryHVgF+UR8t1?=
 =?us-ascii?Q?zP+pj6uHML+uRKLkX6nf1mjp/cv9x83yJ9CXsj7snX/vtzlyhufhmoVQ8J76?=
 =?us-ascii?Q?tmhdMSB5Bz/hpvRrAmFSesxOcNYwGT84qn3DEhSc9BEIfstv//abBdFBcRLB?=
 =?us-ascii?Q?8+Zl24FVqHB1g+JY2PvE+NbzS+SuVMcPMzdN/j1WdQoX1cnS09vWZRpWA4y6?=
 =?us-ascii?Q?8PnLDk8Ncu2BnsxxiAKcXdElsAZnXcOha+RcNvSpPWv8LNmgPVsUbx4KsIcl?=
 =?us-ascii?Q?Hz2fLkAFr2WzbUeeE2GpQ7bdXsHXUSKdSEPfDblb9J/I++K++r7CmB9KOWus?=
 =?us-ascii?Q?r2vGQ7TujFulB6lOTbmr7TwQh1q6ZBfjbXxuoySwRbdeexXQM0sFLalcRIi5?=
 =?us-ascii?Q?zrjYPmMgV9xcylcnWWcYCKEUkeXTSdMkDPLt2cMidk3dU/7e30BtnUo6+263?=
 =?us-ascii?Q?DEssqCgOUMmUrATbbrpv7Uhuv3NC3HjWczapXnO8lLalvnv82CLer4M/T293?=
 =?us-ascii?Q?xjsN70oH3IfhZ/K0roNGQRAIEpiVVioJ0kxuerkAeK7Rnzi4Zallc/saXG5b?=
 =?us-ascii?Q?JOS9hQdrlhOPzcednc2q4XGWw6IqNIrIAmsMATJRhMz98mvZTLIY6cV9hdta?=
 =?us-ascii?Q?arxthIfyk2wr4gSwXU+hnvtKhhmCEIAsCpPyLxjSF8XFR+tIQPU1oPksOANM?=
 =?us-ascii?Q?XlL9OJSYPILPiwZMMRrSSM+tfVfc6B7wD5yG/Gmn8WLqtFIT6G/Ly7sG+uQ6?=
 =?us-ascii?Q?ZjY/ifWGPcTMnyKZ6ZjrWwWckFFi7OpzRzWkWTgPj2fnMUt4TD0ypGc80zMP?=
 =?us-ascii?Q?rHAJtHc6bDlW13lO4SwpveUpdmfgcwcCBBUGrJHu/tdm8dz12mIN+37E+vBl?=
 =?us-ascii?Q?9KscG7mTKaQhalKvbypnrNh7WrzhSviQ/MadCwNIsU9+vYTY5RMfX6maIvQt?=
 =?us-ascii?Q?dIdxH9R6HlxUlE5V1AocmUz9z2SVG85UithHoDN/dHENT22HCM8JoCIcMyRQ?=
 =?us-ascii?Q?zQ80Cb1veUslnVLA1VuMoSb/fnAM0uRUEYisJd71aH7TTF895zrUaCFW6Sp4?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: BL5lv2qUB4l7AFZUn19MashwIRNILFn/UfykY2IX3uoI5+WwDUJQJDngeskQL+4VefycylsGh3wDUIxH5qoYvipfDFEj9hxXhLYJWqq0yKRBAUhvMEH8oRAUpPso2XH/Qq42op/jq68O9EFm0cA3+2dQRCtUb/SwvZdkYe4VBQUXFsyL7ptBE5RoyZZJKB57+XGQWXd8VhTExGbp+UppxQUVwb+Izy2McvX4ECI057EvaoZQP2U+vEh7KfEdXsY+3HG7vSY25wfHQdX9+hW5BgY699rJtySUam1jsiYuIkvSdXRe9iKgaei88Qv52s33SJPJgkWAJiBhrUafBeWxtqz1HsrRXk72KNgIbt9bPAO/6ddq7ittFrCycIOl7EDp6/Msnsaene50h30FrhkV18g4+5DxwoJ8kLG6/KSB/j5aBj8BLxMRCFtje/iNV2zfZxpIA86BTmfgnFGoohkyazQfHUzJJNmzV+GT7ws5R+Hjtu+kVKm/oBfrrRSLfOSF6piM0ijp0KtFujSIYpljnkYUaKHoFE68lmWM0InrAU7ysJXXIpYmuYdy5ncpw2drrG5337lrKovpzRRKmP+WKBLluWyPC9+GSwxGIl2gS20AvQwwY/3D9V8H346OJeUOgHf2YS4im1yWSvyb+2pfEuxB97Qnvc68gWBVxi+FSidifl9aWrTfattFWFZl6nVTXQNsp35fcQqOVyUH6V3IY0M02otL876keCgLYGeQ39PCOSCYCyBiTs9oAvF/GjfHlyuWwNPDZ/3Ipnv5KCF5Ct9/nyBWI0XB5rR0VEqLDijpX2V6U6XrEh1FvTeKBreTRxDUpecnVCziiXpLUGN6rtdDlvTHhvD9pRlwpHD04E1piCqKjtcUqm/pkL+Z4xDx/R2lWqnilMjLBqEQVuiZzw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac087c66-da7c-4aa6-6b73-08db16790207
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6798.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:08:38.4889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/bMgXwM+P48cXfnlawmgtL4RffAyNsUXIZ3Wqf5t+uY1+Jtn4IKvNnRLU2GW398e3DJcHfxb0o9blmMF3XIJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5303
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_10,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240118
X-Proofpoint-GUID: wuO3Kq-i2bhdeJGNXH3k0UXHdWTMokaw
X-Proofpoint-ORIG-GUID: wuO3Kq-i2bhdeJGNXH3k0UXHdWTMokaw
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 8b41fc4454e ("kbuild: create modules.builtin without
Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
are used to identify modules. As a consequence, uses of the macro
in non-modules will cause modprobe to misidentify their containing
object file as a module when it is not (false positives), and modprobe
might succeed rather than failing with a suitable error message.

So remove it in the files in this commit, none of which can be built as
modules.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/imsttfb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index bea45647184e..dbfaac0b14a8 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1636,7 +1636,6 @@ static void __exit imsttfb_exit(void)
 	pci_unregister_driver(&imsttfb_pci_driver);
 }
 
-MODULE_LICENSE("GPL");
 
 module_init(imsttfb_init);
 module_exit(imsttfb_exit);
-- 
2.39.1.268.g9de2f9a303

