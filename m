Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F30D51F766
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 11:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154C710E312;
	Mon,  9 May 2022 09:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2ED10E312
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 09:04:55 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2497WK8V024470;
 Mon, 9 May 2022 09:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=+tXipcafg8AMw6t6WS+hNlKllbCee3ql+HGEDckURW0=;
 b=yl2A0lkPaAquNK87f+BBTkpNyhnTDvEwX2etn1/eA/XAxkxHkns32zc+MCEjnOK1mADJ
 Sa9YyIljWoGZt8GfAUQysRgRZQplL3R/fjFrMRpTnBuD0xrgBSy7gQ9iA8akioYqioO6
 YpnoWYwak+nibmmpRrGAxqrrQ677PPA/yig5ySbDl0aUFE5lsHaONUWQ5Jm0taHPDTqw
 eyndMalgicjwWFBpwpzjNqlD8dQPiOLnNv3w9+AezKn9Fu/caHRX8l4QbIXkTtNaMv/L
 YHNGNj/yfpeprGwBXzLt6xXUjhh4U07JOkZklpRA7w2jjBH29QD+m8RRdf1j/vVnFXKp Sg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwfc0jst1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 May 2022 09:04:55 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2498us90021332; Mon, 9 May 2022 09:04:53 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2045.outbound.protection.outlook.com [104.47.74.45])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fwf77uqkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 May 2022 09:04:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkkgFTYM/3SqOdcx7Ti3q4WgUhqKWlG+DgUSG9HBSnQXn5dWZVjXDfAuomL7dBRj0yZ35/2Zk3Day0v/bfwYWwaRIVGUPH36bHmGTCrmO8v3nWqqH4Xxe4cK8nG0bTlYbZZ+MXWjCOOLSIz/rKE/y29AWvA4QyNCd214uecrD5OnMy0vDD/m/3eJJHIVKaW7cD0EWeJeJXo/PjlNTmOBhv0G5VA0z8/DP9xHaSsrMp8HqGqDveQ9M5gzF8pQ15ctusfYVKjPHepcYHByfh/UreYxwafcADNtLOK12l9sGkC/+B83Do1y8IzxmxyCUe6mavjRFoxWIXr+ApK/+rslrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tXipcafg8AMw6t6WS+hNlKllbCee3ql+HGEDckURW0=;
 b=Jwn3rEJl7suWFmY8dXXgdSVT3s75ly1z2lN6ym1JX5LFTIbORMht7EONFd/hsAS700bbqyF0bmS/rLglmOqC2HfU59NvZHbfDuvTU7qrIWsrT02dKOQ2Y5a6SecwpXNM7IOuzq3v4Ga893lYDkYnwDz+HOdz3/nLElUWzWAXpJQLXIb3tV36HxsUjBbFc1LrAEypXIHoRPF8Kq/HxXHzStX3t1qJcLbnGuJSdVJTe6+IKZhs67u67MYxK3c3yZnncnUsTrCFbTZnPuhc8mkDh8Z33MT9ROhP4GPz81rgB7NeDvnQ2skqoP56CqqMP33N/lRb9kbon0RX+XnyjhSjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tXipcafg8AMw6t6WS+hNlKllbCee3ql+HGEDckURW0=;
 b=vUVzejiV7sEfftT5RkjbeJ3zJhY6HVlRrHgChK8G9mP8EBlW0osSygqg+DW121lCrIyBAHTvz440RJ4dBzYAo2EQI1AAHWupbda0umJlIB1NHo5rUVlGMu8xEQR/SEln4cJybF7R65LWng/kJ2USTT53EAjUOo9eMLc6bGJec5k=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 09:04:52 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5227.020; Mon, 9 May 2022
 09:04:52 +0000
Date: Mon, 9 May 2022 12:04:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: quic_abhinavk@quicinc.com
Subject: [bug report] drm/msm/dpu: introduce the dpu_encoder_phys_* for
 writeback
Message-ID: <YnjZKF1lTZ3HKyjE@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0015.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::25) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f0796e5-0b25-4fdf-a8f1-08da319afa45
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4542:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4542BE99CFBEFD23CB8FA6F98EC69@SJ0PR10MB4542.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcE/Y+Cxwslzl+SepFRpi7vSBsDrYWl+4/w+PSzGq3cs9yO74TJCFo5hRDqjXRcmWYuQgwNQIr5j522Ac7bKd1MQ3qOxuVf+p9HeMn383uyMQyKJ/XXrSlhcS9ip6voV5hgqocp/k3uMdTERm8agYpl2FKVzbL3XDeRLCZrn3P/xte8MvuaGchQg9seZriSdH3o1SFdkUxyBts0Gyci4NQEdpp2xXfSwAGUf6llSX9xWRZ9GwwhZcYBxE9yy7cavSTqUn7o1NK5ap/BU1NmjdsGYG18t5eja9fsGlhjJMjaC7a4IezIQc+Hx4dffEHU7pzLdPcxbvw2Q2lKO8JJh1lSAWjYE5ZzPmPzZQ/j7Jc2YXJOzB1mWG0TS0zkzx0ZRYQiYkJ4W5Hv+l4ds5N5OZ80nPtVPVFdDloMtzcRGpYskGpnHMgRH+mW3LCjXMCPv7+eFCI7ubwMZ4tSv01HCLHk4D7SxODW2kQ93s3aLumd/P6j0S7Jh3XEkk75uj/eUTgPipHdoTwEnOt96+YwFB6ndUBT68BNIqlvcBQ9mFEEPKiOtfkCKZWiPrGK+bfw18dzcSrpZtbcAq2NK/0JSx3fiXWRAH9PvWLa5FTCKTEgPjrOh/P8TvuTiV5hBgNsrU/c+ewx4rbavaCojOIZrKzf/P/oDaEXICaQDEWvqna2eWTC2/SAGMfZnkVFNGzagotJs+srwDBcRT7jD2sjCLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(66946007)(6486002)(316002)(66556008)(6666004)(26005)(6512007)(44832011)(9686003)(508600001)(66476007)(186003)(2906002)(52116002)(8676002)(4326008)(6916009)(86362001)(38100700002)(33716001)(38350700002)(6506007)(83380400001)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tV+SdqtCYzYbPe9/0uKJKXxzdMnKecFlb38cUq+d30qHIxVT6r/pK5xFpTpJ?=
 =?us-ascii?Q?PVeSp3UZuDGSjYRPVzJsLgATO7xHL2oTXKyGPs5vTOnBKD/WI6wYslBETcdf?=
 =?us-ascii?Q?TGtEI3X/trCqo0DVMaXdTG/LBvr4rkmLV19rQiiXRING41h1PM54OQnnUzug?=
 =?us-ascii?Q?sLJDWp8i4RfbBjf2xV7bDYCqXl073PjY/Nw7M4yM+B1t9lLYjN4a8DFWPmL5?=
 =?us-ascii?Q?AAegHmaRrMmwH3q5MvmL3E45fGdy0JeVhdVmMsVIyg+DJDUU95UlOV+cdU4f?=
 =?us-ascii?Q?1Vw005YySY5IWFWXT/FvuSolXbB+FZlfdsKwqehCf/Qx4OmQHppxYGwaNDmK?=
 =?us-ascii?Q?/HTXy61QHGjqx0xMQBYH49CSUSLRNsmXNZ3mj9tSdHxwONZsJdxsoMKUZ3yN?=
 =?us-ascii?Q?RhzXWRbMk1M947IQC8YZBTvvTaxKxdFWS0o0FSNIBqJUCOaRqGBJSQYwbobU?=
 =?us-ascii?Q?7vu5++ArSydNeBVPqs8JcnijYhxAK0UsfHRlf9CLz0drwv3fagNK0Z1qVU8s?=
 =?us-ascii?Q?yFNWeewdXelzICKlruZ6qqMMLbHYXAhwwSwa0caEPE3mWOepyD0lo5g6Q//Z?=
 =?us-ascii?Q?Hg9ExzX6Nd519fV6YJklEXHJ6DpKLccKYVHfwkseZHbOX0eTN1lBJ6hD8+kA?=
 =?us-ascii?Q?byy1h98hG4o+NcITHfE6/M0ggYudW9ZVbR33D+j+kcGoU9OiscozNhDa69VH?=
 =?us-ascii?Q?ZGosoTKGnY+dVnkIFA6w4EPI2HRHaFzr9zLC7pC+apAKkhp26emvl6mDeWqG?=
 =?us-ascii?Q?FZj+ci1gVJHj77BajeFNlncjp9t+tTL5OM/9JS6tLnfJQphAjAueiuHtkYfT?=
 =?us-ascii?Q?9RWnqDBlDQWY2w/cQylCDQ/ysguRkHscWueFce7zrQ/cD8PZNcqbnM6hOS30?=
 =?us-ascii?Q?twIn7GXDRR6HC/qqH19tzmFZqJKqf0YAXPmr8yt3lK8iANBRHkUS3WhcPXvZ?=
 =?us-ascii?Q?YD5AsaSF2PmTlj7P3CfPgr+gtEwZeBJJ6bXQjGMbu8KKC3t/I/K75UNqBLeX?=
 =?us-ascii?Q?svg8PJwR907VJbQTbOXHn7IckjfBHqubO2/eAAFsJ3K9TX7HkeUxphJ4u82f?=
 =?us-ascii?Q?tnWoU1cm+Oo8Gi2t2XxTYn4971ilG722ztPfVP02T8ujrMJS9Y1Js0A/psX3?=
 =?us-ascii?Q?JILMIHl/7PNjOmdcQu3vTZjWyTm1ssbCClWKk8a7lYEgrnKUib4xAtMCoSWi?=
 =?us-ascii?Q?LQRiSox11T1m2CUM1hV2Jexez4sv9mWtiziOwzyR2pb6fz8n/tCPtYjtfYM2?=
 =?us-ascii?Q?WwX/y5VL7cTBOPDlPk4E4K0Opq0S8H/NHDCxvsni3FUCLXxSZli4mWyPvrvM?=
 =?us-ascii?Q?139xbh8i+DuupwnjzKLP9b0/6EDFxK5M2jbzf8b/zbxAAi9S9KlB4TqPjsdg?=
 =?us-ascii?Q?uGkL6hoMCVwL4DP6tT/7boXctHepkkJuFKKywNohWMPWDF3+Bf0hP27qoFsS?=
 =?us-ascii?Q?/rS4TIcjBSPl/6QqkPjWqZDYmSlOB5rBqV0V99Bq79+EOiD/AyYylCeOUkGp?=
 =?us-ascii?Q?K7ymfbluVmFiDo79ck1FuQ2Ux1W9ii/+Gnh2QtHXTyLLWzqlw1nae8eQxeod?=
 =?us-ascii?Q?IB0H3tRSHxk+D/k9A+ucFXMosnC2PKPiTsmCfUtqY9Q+HpokIhlGcFZ6tQIz?=
 =?us-ascii?Q?Imv7AflrEZVn3JRlVtpNgtD6Jz3SJTnizUSV49WQtyDdkBEWTvNC0t8kMKM+?=
 =?us-ascii?Q?1QNMihrLIA/vdL5LsMhdFD3j6sEEX09OzTLN1qplnQ8NJ7tdd5t+G8CFwr3k?=
 =?us-ascii?Q?r1cAA96ADG5Oe/gLWnWdUVlLPipWWnA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0796e5-0b25-4fdf-a8f1-08da319afa45
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 09:04:52.3221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzxKZHetP6xC0PG7pRvtVzvsL16fraCsLKO9tCgFkWg/M5yz9CQhZk0nAtOc2lcUJ0gVb6QM//4XMXkBIsI2IlEkMlCZ1m8mOCKDHACRfEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4542
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-09_02:2022-05-09,
 2022-05-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=876 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090051
X-Proofpoint-ORIG-GUID: 4EZRrjKQP7_OGKQfXuDogtLP9FxNBvGe
X-Proofpoint-GUID: 4EZRrjKQP7_OGKQfXuDogtLP9FxNBvGe
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

[ Oops.  I never sent this after all.  - dan ]

Hello Abhinav Kumar,

The patch d7d0e73f7de3: "drm/msm/dpu: introduce the
dpu_encoder_phys_* for writeback" from Apr 26, 2022, leads to the
following Smatch static checker warning:

	drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:252 dpu_encoder_phys_wb_atomic_check()
	error: potentially dereferencing uninitialized 'mode'.

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
    244 static int dpu_encoder_phys_wb_atomic_check(
    245                 struct dpu_encoder_phys *phys_enc,
    246                 struct drm_crtc_state *crtc_state,
    247                 struct drm_connector_state *conn_state)
    248 {
    249         struct drm_framebuffer *fb;
    250         const struct drm_display_mode *mode;
                                               ^^^^^


    251 
--> 252         DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
    253                         phys_enc->wb_idx, mode->name, mode->hdisplay, mode->vdisplay);
                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Uninitialized

    254 
    255         if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
    256                 return 0;
    257 
    258         fb = conn_state->writeback_job->fb;
    259         mode = &crtc_state->mode;
                ^^^^^^^^^^^^^^^^^^^^^^^^
Initialized here

    260 
    261         if (!conn_state || !conn_state->connector) {
    262                 DPU_ERROR("invalid connector state\n");
    263                 return -EINVAL;
    264         } else if (conn_state->connector->status !=
    265                         connector_status_connected) {

regards,
dan carpenter
