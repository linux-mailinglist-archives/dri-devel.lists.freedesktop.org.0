Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C1551BD34
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 12:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4782D89B84;
	Thu,  5 May 2022 10:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4EB10E9D9;
 Thu,  5 May 2022 10:28:19 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2457BNBk013502;
 Thu, 5 May 2022 10:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=vj+jLdx61kLbRKPy1P3W+uXy5CBM0nTNpDXBg/lKuVE=;
 b=jqG+jj84/uJI1GWagWOdGxEOGEn2YppRSbM/1DameNiwNZlqNEMdpS8yY/EiZXjwLpz9
 jEUp+s4PHRpV9Fk9J4pZHBgR7hg8oaOCvrQrNl1Ztje0Iw4fCz1QOXTQ5hDo/h6UXD9+
 st81XEG7LHCBkVGifsDM44iWf5Tvt/jbAyfLw1uezjHdcVW1uhkEFku166YLEkBBNukD
 4pcJb33nSx4HPMcRKA0aH3yHfo0ev2rfmbzlyEigqtaERoNnWO2TTBIoSz/qp8isNiz+
 2Kxbl4NrdKR9WQbHXtDvAcKkGpHxfAIFXYMUwPLN+VMU/sl22IIwN/zm/vZ6PbpLR72a 6A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frvqsjxe5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 10:28:18 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245APZxM033789; Thu, 5 May 2022 10:28:17 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fusaghjkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 10:28:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqvqA2dnd6ja9p8vC72LqM1wAbkeH9/UCfj0IVJ2ZpOa2T+Hzck8npeiww6UZjK9yZ+6tiKkLUCw/ubsMRXUsax+6WVj+xkjIdSJAmdqfZrE92/4WYKl5PhOtf1EzXgTeKemnITAhS9e6SlHr+C2QYkT20iNs1FU8GJiYmV849lUEJkqPEtunKbZvqL/j4ljCNG+FrvJgb4KSML5lpIxSBmYEp9pnaurNfxXH7G9nqCHJ56aQQ2zM+Egfq/++gEMOr74kudiqiCbfmgkeQbvar/YUykeJ5wDGkO9Rwi0/JSYEfMTsX+nxvg8gM8t0xJWMl1TCqW+i+vAbIendM6TxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vj+jLdx61kLbRKPy1P3W+uXy5CBM0nTNpDXBg/lKuVE=;
 b=gapL44vjFm90aoCQzHPy2H5QXUAEPhrWYCKZ3qIrV09PwbvjXZcfEK5Vzb2Dhd/JTyOwiJRfn3PgU4jxuTwGE7iyh77RebzEJxhxI1JMqFsRRLdPtOGAfNKG8opfoanwS34fDCe8GJNdboRtnGldEC2h+KEBYZOVhusfT0aX/YZ5xWpo4g9WP2UHlui2LpC/pg7yvOEDPjRR0eeOiFg2X/HCdvV1iA/ouMjHRH4jwGJU2GBEFIN+BRoBbfd7icT3EqYux1fov5dPdlAFWki75Y1BfM/keD+glFuuEM0kVJsdDO4jSYSGcs98RRsoeZLGr35uGnB3MHRs9+tQEkLrqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vj+jLdx61kLbRKPy1P3W+uXy5CBM0nTNpDXBg/lKuVE=;
 b=bwyVTTjlZ4ZrQnXzVDByfKUMJx1PzHBESVRCKJZ0jGu+VJ4N0aMJXmaFqyR2LvGTxjkmfeRgzNlxV8c2VRKYSU864tOhMI1WEhMS7Of6RLBtbpzZ/YqFnOKZp4ud4w9CM1zCLLGqWTZps5dw2So5W6gtPPTSZMQbLnq0L4XYarM=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by DM5PR10MB1836.namprd10.prod.outlook.com
 (2603:10b6:3:10c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 10:28:15 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e929:b74c:f47c:4b6e]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e929:b74c:f47c:4b6e%4]) with mapi id 15.20.5206.024; Thu, 5 May 2022
 10:28:15 +0000
Date: Thu, 5 May 2022 13:28:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm: return an error pointer in
 msm_gem_prime_get_sg_table()
Message-ID: <YnOmtS5tfENywR9m@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZRAP278CA0011.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::21) To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51a220a0-469a-4dbd-cc24-08da2e81f6fd
X-MS-TrafficTypeDiagnostic: DM5PR10MB1836:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB18364E0DEF75295E7B451D8F8EC29@DM5PR10MB1836.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5bNULOgBzF5MEcD6Ngqlnd7UOGFaneERKGHjYxMC2xLodoWxCUaEg0ewOEDOiwYi/sTJ1sJfdWGS7u2hMVRjadqWP3ArhVZbg5ATSfkG6zqUXovmK0YoWw52/XqDZwt1aNk9JiKW2vpW4uW9am8tLOZPwRQmFGXyBK8rYOb3A8jp8UbAwTKybKriiv6Af/KP+/3JpFng9o0YUF9X1sHwQjtc/SGCeS3+pxp08Kxp2bL8JsYqahRaQjdGhQ/ScnurMJEG3qoKlMRi6XaTF3c6AsbJsBtgz7VhfX/k0vPKaE2IJNXIGO5k3qKhlTKUMKl/nrH/Sm3CqJlLETvJmWyXqfQeRXxlZHo+FlzhdJwjqM44KZTicq9/bn83d41MNglz11nA/kceYAFw3xi5+89EXIYrLMSTubcM4hATdiFJNSWJm3oeSNCqlkP7uIDzw266HaDPgPeNbK9plrncY3Gkz3DlyrPXQc1mXec5tHBX8kq7eRG0Yh0SxVJV6CyCnNBE0ACCuYHEsCuza1U0VMUuwYIuY1YvpDJBsXmtz50Q0qvtkAMwqyjW9WcT30ZfrywQZCzo6VAWRsZrKy9Myy9m6OJX5YmmCPjJ4SQR9vtsJc/76bPn8q7kWcHpK/G2ozCVQaErF3fHnpRDmp6YRbC9ZiHNiWmBcRIDpFy9Hr8uo4qfiv24HQNqfXNIbdoK3lD/OgxWGmfo/qSXX3SYACQgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2358.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(54906003)(6916009)(186003)(9686003)(6512007)(86362001)(508600001)(6486002)(26005)(6506007)(316002)(33716001)(6666004)(52116002)(38100700002)(38350700002)(83380400001)(66556008)(66946007)(4326008)(66476007)(8676002)(5660300002)(4744005)(8936002)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0kpZJocXWZEaF7eErXXlhhlzG4T+GmBbt8CnrJhPWB8YlrUn7X/ZttLxfnw9?=
 =?us-ascii?Q?p7xW0FUncuLRXadKgsaX0He1fS2aFPDKBYD1Nswr+LAdhwl/2bKQujm+Xtew?=
 =?us-ascii?Q?m4r+cdQcsJgF6u4VF64rXapEnSGVBreTYBaJrovz8dXDLTKTLrY0DMIXZTqk?=
 =?us-ascii?Q?wvahgAg/L6hsu2pwV20L2mpwA8I2RcX+k/7C7JVss4NZ/NfGcfE5t7t3XHqK?=
 =?us-ascii?Q?VV0zo92dK56F3pY1F70rMmuEj05iI6tOxRO7SYWTVp6jjCVEK6MLmOJ2lix4?=
 =?us-ascii?Q?M5bGEi7DOrsTy011FVx0rU9sDGTGRUTucOfryOFnAt1cIfBAjQDrng0zeqPc?=
 =?us-ascii?Q?qteM5JZpy8lWEAMvdYi9OhYHf6JoYf4YQRIbLzSS+TqeZpwRJb599jQorYic?=
 =?us-ascii?Q?62clf313MU0yUI2cqT1rwbIm3P+ZXrGclvFZyc+FE12nQQVBXmw7jlxOjV2h?=
 =?us-ascii?Q?v+cEDb+RgKQxFf2neVP3XGbJYQ6yJgcmlwMrxzsgupLnciQ2RWdg/5ajIKGL?=
 =?us-ascii?Q?DMMXQchRrTWW5C5z/zLfiJrfhgyGuP/Q1KsQ5QCtEZUfzW7YbiXVgsyOdNEX?=
 =?us-ascii?Q?8OpOpT1EbpHRZlMiDDbkUhKBga+suqUDmxN/s1bT5opuedsK/FHUsGqp5DXC?=
 =?us-ascii?Q?OYyYlKmLj9lzWqTWT57s2WJ7RC71j/GB5B1zy3jktkz9K0ppYsQadajXLcl9?=
 =?us-ascii?Q?Wz4U/ENKFQEzBCAJGiYRBD2mRSQbEFYk8XCY9bUs20iEiBCkatTMrMJq1lS5?=
 =?us-ascii?Q?ZiWgDdC43CiBL+Njmq3ru1aGjLXqviXL0IPeWlbUjzXIOm/Y9QmeyygN+If6?=
 =?us-ascii?Q?qUbos6HfFwaU9HpEtUuIF2kWWqIDxCfnmO0JTZuwbmbbb3p0+YT+Rqb58lGB?=
 =?us-ascii?Q?fDWUV7nQQ2gMJ0x3RpzmUt5a4SafeN2tqvKnPl/PbC0edEPY0J6GqxlQOjVF?=
 =?us-ascii?Q?IF3MkkyN5a/0CCeUP+d34tFArvs/KmY2uOgSHNMLZG5RvTOK1mu97MSn7jr9?=
 =?us-ascii?Q?I+PBNmdrCSjAnhkDnlBUj2gbs3h7ILlonAJVpErsod54A41jngD3tpBj/SWo?=
 =?us-ascii?Q?LYuh40OS7RSatIUL83JFC5PlK1Rbz0067gMgVgLjze/UReH+o7KcIoLiMG10?=
 =?us-ascii?Q?d3QG04r/SoMlnT1mgd6k2iwdNDsjhATDTLyeAddwxSipstGXjvSfQxr9sVpd?=
 =?us-ascii?Q?X4/GAXBGbzKoRmUsI+5bJ8gQKKVPwGFw9xnSs28XQGiZqtPzFXgCXmY2qpbR?=
 =?us-ascii?Q?NevWmdeNOwacRnaU39gmrkSpeHkvWYf8CQwy5/XfTyiOonwcyqAscKBEXcV9?=
 =?us-ascii?Q?scIJi/Fx8iJrUwgPi5q1E5nv4xBjndbSakbLmFnfLhtvSPJXSMIpDcNs378m?=
 =?us-ascii?Q?HJmbm7G2i0xULM8Gu0VQotjbTBBL9GULMfMEt+3llxi/QgHX5K4RGMo5JVd8?=
 =?us-ascii?Q?BD18o/EbuVA0r2dT1mNwsxjXX9srki9TQwy89simsPhEqEBU03TCH7IvS1rV?=
 =?us-ascii?Q?9clhNS/Hmf4nZWu/xxktoVuhB11ZzwjlSUDbg/QgWNZLE3fn0WnZD5SFZNtI?=
 =?us-ascii?Q?dGdZwjW6kqxXlh8BR1jG1r89/HUFBfuDIefWo6Fb2DGVcbSE+KdDp/jJQxl9?=
 =?us-ascii?Q?+blCjGQ8fCg2ZWKP+d7Cm9cbAngoZNu9NXqIBvgCV28sSRrPSZblgUncJC5w?=
 =?us-ascii?Q?LRqHFsEXoJ+YZk7AIiFo1iLGO/ZzKjvkXfDNv2UbCa508fA6HCuXEMZrgCLP?=
 =?us-ascii?Q?6SSUvGwOTL/YPqdzcFaAmb6i+rymivU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a220a0-469a-4dbd-cc24-08da2e81f6fd
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 10:28:15.7239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+jG2XqOijVaH8DNPL8vUi2IFOpFU7EAkUwol3vcI2uh4mzrpVwyK0z9zbxW4lL07gpVnZf6wqW7xYry691ouri0V97B57f3Nh+mz4Jdisc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1836
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_04:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050074
X-Proofpoint-GUID: RKgjtgEqbdSvYf7tSzwVS_RFnjOYUmd3
X-Proofpoint-ORIG-GUID: RKgjtgEqbdSvYf7tSzwVS_RFnjOYUmd3
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The msm_gem_prime_get_sg_table() needs to return error pointers on
error.  This is called from drm_gem_map_dma_buf() and returning a
NULL will lead to a crash in that function.

Fixes: ac45146733b0 ("drm/msm: fix msm_gem_prime_get_sg_table()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/msm_gem_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index e8f1b7a2ca9c..94ab705e9b8a 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -17,7 +17,7 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	int npages = obj->size >> PAGE_SHIFT;
 
 	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	return drm_prime_pages_to_sg(obj->dev, msm_obj->pages, npages);
 }
-- 
2.35.1

