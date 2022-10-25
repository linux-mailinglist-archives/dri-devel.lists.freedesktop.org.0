Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFB560CB2F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 13:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E04010E334;
	Tue, 25 Oct 2022 11:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4DA10E334
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 11:44:28 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29P9XiOo010233;
 Tue, 25 Oct 2022 11:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=EkV/40bYzbpcwAYpvWs1ros0C3F+CUMnsUkvA+bdF4Y=;
 b=KshcFf5iG7MRBONfEPCUHzTRNyRn7mrzw3ooIxey+j7x+p0qMys2fyF7zxTM6sep0Lh7
 IYHj+xXCAiKgbJVuqQJw4NMzVCPbnkE1jMaViLMXJOsOeAg/x7cS3eiX9XYSIExuO8DQ
 ebMpqMYf6N3o6erj0XguTz0FAB8swSsREMbRP+OXUqusGxqPE4vWc4yuh687hpeObIXd
 uJSkg43pRzph4zLukNgFLSprNx8J/+P6/PrN5qRSTf1vNE6aH4vrGjjxibwB5Yga6v0y
 8q7YN6+SMe4RK4SzthiQgGljuWHsJi3DruLPND4S43DQiZ+pRcbeUWWqaMvTqO1hQdlQ sA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kc741ufw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Oct 2022 11:44:26 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29PB2uuN014405; Tue, 25 Oct 2022 11:44:25 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kc6y4a156-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Oct 2022 11:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myWI50Qn9K5sIIf4Pp9Zrc04b1l+lDUqkx8yjYmnjyP0+prxpziRYfm4WG/2uomi74ZQWYVp/zinRhBy2BQ3El0t1xisMRLyWvPVDrJMfnQH+VVBiunvH0XTem25aQxDqzFN6DhljUOgCqs/yOU6P1dIz4a6q2EsTX3tuPBNSMwVMFy7Chw00Sah7x4znN8vqadG+Zyk6mrB59V6cc2RP2gXZ0nLyr4eyLPAK+wXWgl3inqxhRHLzdrDERe8IYVXLl+WGiPZz1wYxF6XViiTZ3A96jiZxBtu1M64id2/eXWecV4EBzoftjOHR7djml8DwKe+v2xUtB93RvCgcS3hMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkV/40bYzbpcwAYpvWs1ros0C3F+CUMnsUkvA+bdF4Y=;
 b=Hi+/0OFqdHI/Cn93ubyhKe4UGafs6zSTnNzbmNx3PZUsOKX5pEwf1OkkKjZmLdowbhxSEFD4xJSznxRPTquQDziKWLlByb9SyMKbClSh5LmIXihY0dXCuBPgrpc7IyKSAF7NMTBEF4gG8zZ+8TKk1ROmsy8T03z/zQQ3pU9lZIAHc7C5+mkOmSsNws0xBi4pZb00I4uaPr1pZgAkgr7KSXODRC/VsDk8OnF3U0hYn9UMnDJBTV0PkpHqu9Cx9M+YRYLXBBL5x3xq9ryqkvw5IEg3saaKCxEMjC09x7jOPumkGVqOT909gyaQkO6tVNUxEx/HwCbb71vxKOMLcDJ9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkV/40bYzbpcwAYpvWs1ros0C3F+CUMnsUkvA+bdF4Y=;
 b=EAESwxrNA/BnJY5p1Zz4FDl8j1Z0Uqzf26oBC9b85uWT+swGpwnJS/JqmfZK74a0sM0zh/VJoDBqyvs8VFDOpP/EXBTk09s7vBmgUY4wrFljKtU/6yPgOnHlb7bWuoxXS+gCPtEl09tuZJJRD1A7L894t/baEdZfpU3snJc+oDk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH7PR10MB6532.namprd10.prod.outlook.com
 (2603:10b6:510:203::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 11:44:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Tue, 25 Oct 2022
 11:44:23 +0000
Date: Tue, 25 Oct 2022 14:44:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: treapking@chromium.org
Subject: [bug report] drm/bridge: it6505: Adapt runtime power management
 framework
Message-ID: <Y1fMCs6VnxbDcB41@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0147.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|PH7PR10MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: d8bbc652-80e3-4f33-d98a-08dab67e4313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DzOAObvozEWNOqsdo6RUZdBvslq7LIfnb+5xsjcgfajy7btoeKcUCfoJyha50Z3CSF2S29SvcdpQpcLS3m1fkFqw94yuGFZC5Aqw8KcZf5eCJ2NEZA1WNEdIod9x7dUbTUkrTkYoavHrh1Hylkj8zL+PSanX6jkTe+byL5eViMmWRhhcE/s/k7OogrXTBVMm7Yd8RJ8frlsWARAUcxv+rumEoWMNWGUlL2R1LBI7yUEZdvpfwmB2K1BHirJAatgtW/qD5qgXh8AGcSIh/XiwGyNFQS7Tl+j1DMosHcUah6wahXN9TM15zM0VNWXWYm30xsAS8Ne1nCzPwSPbpqtvdiEpHiKQp0fkpDo22X0gpMtkEdPzxnlLFGb1o+bMG6AQZp3yVi41ZUL+2xPwbnSVnArkSYmBtZB+fJNDaPigh/pm+UK8cOVJbwpmFhCkQphp7NF47xeXjCK0G2BxOch97IBvOFyIJs9Q71xTnM27yVh8TWaJhw9lA/ZF5Q+inLZVf6h7qyL1nj3IwGtl+7aQNH8kaD/i3JBSpejiHYvaUaO7AsoAv7wXWr9SXWKpZgapDjghR88EHLhDqLG5Jw2YetILMljrJXR4TtRrWx51cq8vZttUym5SqAIVJLST7f80q4dQA65SZHmj1w+efEk9pdVZBjI7FTRhYc4xTX6Ab5L9QBTAg5mk9gtZi5WF7/nmwscttq1fzosY7LwITF/KOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199015)(66946007)(8676002)(38100700002)(5660300002)(2906002)(44832011)(66476007)(86362001)(66556008)(4326008)(6916009)(8936002)(316002)(41300700001)(9686003)(6512007)(26005)(186003)(33716001)(6666004)(6486002)(83380400001)(478600001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d5hKupj8Zsh8Hx+5zJWsUTvhk+fZY+eJmXblejKLu2xA18OTvWZcfKSSKoyK?=
 =?us-ascii?Q?Fo3rLQtviGzfkA82zazZoA5g7k6I8N5c70zck3o/3z2jHj3J8GH4hITBoJtu?=
 =?us-ascii?Q?cUgxZhAIXlPf2Dwr3YpKWUkOWP6PrC0u1eDGIVdHokBkUG4p1a9wWrXL6BQK?=
 =?us-ascii?Q?26N0XPACRAMVhk6YzydGAm3433F498dnZg43pJGZmOFTecH9AiYoApgJGxMg?=
 =?us-ascii?Q?+MPyAgTUp4mV0qHDfMJHo0xqX01w5e42WjQt2+mY1mtkP1oMQPleDv+4c6jg?=
 =?us-ascii?Q?iv3YzhJV768EyVVYEvjhwFwTcB6UBllB+DOPSwHeycJxdoDF6td1sk9yQThQ?=
 =?us-ascii?Q?cBhXXHrr8BCcP8+uh0zqxe3hQrbPHx7uASi1MorrUH/U+/VGCfvNC/j6rKQR?=
 =?us-ascii?Q?RRv2iflkDHLqiR4NTjfOKilUcmZWbimMPD3ZJtVhhc/wwKDZWaW4V9113RM+?=
 =?us-ascii?Q?k7uOjObmlRgogo6tMycK6HGRPF6vryH6a7Wou0qyhdiNtBSXuDvBZP89wnjL?=
 =?us-ascii?Q?oAZ7BDGyyiytTR5qnwJf3yHRpEy+6cT7Vd7ShLLHPeDkup9aqxzZyBD7aVD4?=
 =?us-ascii?Q?q+2yQwTVBkXu9Btq9NT2MZ55eyeQDd+bfBOpVv/gpYCoDFkZGfGeUFThocZd?=
 =?us-ascii?Q?saJe7901qA2o6GRLm86eXI9l/gZ/xXFMzbLxFY3v/bY20l60swLa0YTQ/2or?=
 =?us-ascii?Q?q79THezVp7LfT77AFlsTNzIGuKccA+iet2yUBPBdKMJ8M6IU61VsZG8ZWLsp?=
 =?us-ascii?Q?DLiH4wq+3VMbOhNPVaKMHtJ7RyknsIncm2M+jEhYJgNiX4v7vkcDm+4yWkZ+?=
 =?us-ascii?Q?aTWJuMA46Cl57bPdgO+1Tx8vsqiu5QEamwudD0QkQzSui2DR5vk2uO5eZ/+b?=
 =?us-ascii?Q?qWJktC8sVvgGOJF+VElGyXeTHZsuhvLqbXbjJSsCmOhasOWxi7KgZLT+TJds?=
 =?us-ascii?Q?7cFLjPNgGnRDacQ7YoKu0Hdbq1spd+t3FauOOTPWFwFOQg7mPyc8JMM8yl0t?=
 =?us-ascii?Q?jXQ7BTNoO4LfSMD8iGGXd4eWPihZfcDWUtwIgbfMtvDMu6WZpJLpf9O4yaGq?=
 =?us-ascii?Q?JYe7eoSaRKviHF8/GL+dOma4RmygrGh38p+75+64C9Mlsx24uFL9UfP25OMH?=
 =?us-ascii?Q?wL/tn1zWVzRt778P/yioZj25OVRuvwhMvIu3tQnAQas9GYNQpfSdUO1j8JjX?=
 =?us-ascii?Q?MrCpVK3l73WFZco7iVeERNonZigTycE8sNNCbFfbfCqOx4rkVshbV71kAbqu?=
 =?us-ascii?Q?iHto3LNPyu2vPcvXqv8VjzvRURNxf3lPF/9Day2niVLnCgJg0U+G/9Vl6z7o?=
 =?us-ascii?Q?UmtWuFLe9p5RBIdzeNPPgbciRJtUxdSPSXRNAjII0RieDaRzhk19dElVeMHT?=
 =?us-ascii?Q?PcEoc06azYNRj08NVUZ9nXcoBX1A6Hu56gvJWYgKt2aY55URdQFh+YMzaAqU?=
 =?us-ascii?Q?obprdcWK6nkwOtd4qWyoYn7LkBYpb8xAAoH0ws0RGxDaerQDGkkPS7vlvpfO?=
 =?us-ascii?Q?6TujOMiQ2FEsZXKic5eEd+Q4PyjqIYHgbrneF5m+Grwuas6feJiQ1C0QYlfD?=
 =?us-ascii?Q?idW71NVCx6JE60yr29ntbcsG9OnnJpmqmb7xgEz5RKU+OaQ46X+cqsh5keNk?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bbc652-80e3-4f33-d98a-08dab67e4313
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 11:44:23.4949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwoN6fQphQR6ogMKpAGFrXra/uOl8kMfC8JwNZ1sz4LicjRpg8wbTRplunP7cfQFx2Nt02E5c9tp6u3TvE5EuS50bZHyCKyFzAYZVfD6LUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6532
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_05,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210250067
X-Proofpoint-GUID: rviecT0w6PrGs5R50co2hgEE5qhwFTWQ
X-Proofpoint-ORIG-GUID: rviecT0w6PrGs5R50co2hgEE5qhwFTWQ
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Pin-yen Lin,

The patch 10517777d302: "drm/bridge: it6505: Adapt runtime power
management framework" from Oct 4, 2022, leads to the following Smatch
static checker warning:

	drivers/gpu/drm/bridge/ite-it6505.c:2712 it6505_extcon_work()
	warn: pm_runtime_get_sync() also returns 1 on success

drivers/gpu/drm/bridge/ite-it6505.c
    2685 static void it6505_extcon_work(struct work_struct *work)
    2686 {
    2687         struct it6505 *it6505 = container_of(work, struct it6505, extcon_wq);
    2688         struct device *dev = &it6505->client->dev;
    2689         int state, ret;
    2690 
    2691         if (it6505->enable_drv_hold)
    2692                 return;
    2693 
    2694         mutex_lock(&it6505->extcon_lock);
    2695 
    2696         state = extcon_get_state(it6505->extcon, EXTCON_DISP_DP);
    2697         DRM_DEV_DEBUG_DRIVER(dev, "EXTCON_DISP_DP = 0x%02x", state);
    2698 
    2699         if (state == it6505->extcon_state || unlikely(state < 0))
    2700                 goto unlock;
    2701         it6505->extcon_state = state;
    2702         if (state) {
    2703                 DRM_DEV_DEBUG_DRIVER(dev, "start to power on");
    2704                 msleep(100);
    2705                 ret = pm_runtime_get_sync(dev);
    2706 
    2707                 /*
    2708                  * On system resume, extcon_work can be triggered before
    2709                  * pm_runtime_force_resume re-enables runtime power management.
    2710                  * Handling the error here to make sure the bridge is powered on.
    2711                  */
--> 2712                 if (ret)
    2713                         it6505_poweron(it6505);

pm_runtime_get_sync() returns 1 on success.  Consider using
pm_runtime_resume_and_get() instead.

    2714         } else {
    2715                 DRM_DEV_DEBUG_DRIVER(dev, "start to power off");
    2716                 pm_runtime_put_sync(dev);
    2717 
    2718                 drm_helper_hpd_irq_event(it6505->bridge.dev);
    2719                 memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
    2720                 DRM_DEV_DEBUG_DRIVER(dev, "power off it6505 success!");
    2721         }
    2722 
    2723 unlock:
    2724         mutex_unlock(&it6505->extcon_lock);
    2725 }

regards,
dan carpenter
