Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 731674FF57C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 13:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45AB10E07B;
	Wed, 13 Apr 2022 11:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F4A10E07B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 11:11:39 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23D9jQJa006846; 
 Wed, 13 Apr 2022 11:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=dTP7S3FvlOEBvoCIKCNdtQulhdQTEPb1/zhJ4Q0+fG0=;
 b=pFLLFX6vJ+dWP7d4qzgBfGxNfix7J9r2e17yh/zXzx+xCVxocpMX7yud9tpKO2+F2qjB
 qmbWcanpDNN9jDD2u5+7faKzazPcTDrcayZ39rxxyDZOahFvW1P7oL08wQKT1+ruICnP
 DWsKsZZlBYLOwHAfK/zPAIcBLKl9sRY4pmvoGSRTySUy0aTfy0AM/882OIoY+wI44fZn
 Lu0Z4bUuLfQFEpmGy+S3RZpcS5PNWXj9YNA+z8bWMhrrpug7VN3prnbM06YZ7F9wk6N/
 ppvU0F8PX0/kscwNyy0VY/GXvBt6k/SzpIGa0zLlNQkVyLMIYsqZnoc/Oxf40kjAiPde PQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb1rs9mu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Apr 2022 11:11:37 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23DB5Rap037202; Wed, 13 Apr 2022 11:11:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fb0k3vmmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Apr 2022 11:11:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtiMJPokFruyp/CQsLf++PKIg1hbsEKWaxB9vPp6E31VJD8lYaAb8zweRjddaaLHzf/VOBMFrQryi0mzgYIzetiX4pXEdG4vY6aBTozLptclgXD+9axIsTNvPYjR9zyetvHcEoI+r4aejUkjS5eNpIeDEPhusq2c1wKFlfJy3vCbHNqAdNMEt6Cxvz8l7mnToPC2o/CSgJoiDRsHY/AcQXYzY/wRhb86sKN3oeW0CbBa+HWvcMRLGxFiBfqhkOlCj2fE4gtvny+kYP2f9kLhBf8052wOqZe6fWbsHT2S4TF1eJtlI5UtnNxFogGJ7UmK4oNjleuTq7dMqWOmahrZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jZISweo7tt6xfGoT4JNsHW3IzL/JeNRPx0mjid05ZQ=;
 b=R5QUp85+wvA+8HR/1IpAskuDafzgCCONb0OQKYsDl7ofwJcu2jdvENKmyA6eIFI4jMSyp7da7VzYByP+XC8h/jDLS8O8qmqdRtdUBLTzC4JFni+KJIomuc4BozmKN5wjsnzp7jg/iiopHHSpB5AfTMm4YgQYWFNrdZUmLlWzk5uaH3ak4NbGAnFvmiSid0rIRBFYSSDseFFekuw09ct4jVjtTuEvxKX30AK1kYLz5DD+7fjzooDG75HfumFGp9msj5Ptv+2x6ReGD9XEakup4gj1d6j5swOxENQlq97vjoMHO7iEBgCO2K4ZKjlR9lkbtLhEe3HUZLRb+Q/2VA27jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jZISweo7tt6xfGoT4JNsHW3IzL/JeNRPx0mjid05ZQ=;
 b=UYeAhxn2PMDOsX+/0G0yJwYly+uJ7y/fpvhJ/w4HiIREHMRlDzO1Y6WceeHb2JyFVkuVVpFaCTH92Yi2gxOi7IqwgtVdOPQfUgBJbRkf0ywFA5Aqca/DrtTOJIlL31F+KTFzCtv4ksiSeFjRvcVdsuJIGWUljz+mINDr/xseqac=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH0PR10MB5225.namprd10.prod.outlook.com
 (2603:10b6:610:c5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 11:11:35 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Wed, 13 Apr 2022
 11:11:35 +0000
Date: Wed, 13 Apr 2022 14:11:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: thomas.hellstrom@linux.intel.com
Subject: [bug report] drm/ttm: Add a generic TTM memcpy move for page-based
 iomem
Message-ID: <20220413111126.GA20082@kili>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0027.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23228189-6449-4cb8-f04f-08da1d3e5f4e
X-MS-TrafficTypeDiagnostic: CH0PR10MB5225:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB52253A0DC0390356558D90368EEC9@CH0PR10MB5225.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sok5j5B6z5EpMQSGoILSmbk+pgzZY2mUPMAXtsthlnIvqi/728B4xARQ8mv8fBSzMFQ3a+Dg8FyhNWxFf2vRuwoleqtR7UzAFadU6T58SYNFtfAOxUd4IKWwrdrn0BWPwMXjBD2DzLLmcQ+jVvvYNCP8NRS0DGTxI9HdzT2EBmnF4yH0qyhQrSitpP6jaKXI9jToXQaiCwAmzANFoE9ZtYDyJodeSBAi0X0Lucj/wFm7bIWLWfAJnYVDs489QR+ZLYbc+pXsBmfJzQne939uIO5GTDdKW9Xs1fR+WU81rXmKl2GEVh+/CG66kp1DOmFCU0sQg/WGhrlzexXzCv7+itdwLOg3buE9rwxT4+ijO4SsKnGJJIGIuINJl+uGkZ/nyNyL80xH9jUwoga45gsqhHP487xZcUYS64zBZSQyi5mkboNL29oHWTfYCKV0RpLYWuMT/TROtTdKfQyoWKvyoYjzSZvFb60i5mASfSccs73gXOsmYKSr2TdBy6WcNRUugh4RNwS20842siKJILzAel9SIGaDIFIzs3I2uxhAXv9YcYtkQ1LjfOH6LWP1fpQeS/1LoCJKehSpKHdjooWE9lodAt+2fP2QpkGxA6pP/BTmC1UEJx1RnjxIzyCFA0R6Hn1KSzZ4g2b5yIcG1aGlMEPf7zx0jTniO+x9crb5bW676dSU/2fo5WY46Gdb5wKQv2k+lagUE8TezKxyPjzxuM5dGrSF7vtDWw4T/BUECVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(66476007)(1076003)(8676002)(6486002)(4744005)(186003)(44832011)(66556008)(4326008)(26005)(6666004)(66946007)(2906002)(83380400001)(316002)(86362001)(5660300002)(6916009)(508600001)(8936002)(33656002)(66574015)(6506007)(6512007)(33716001)(9686003)(38350700002)(38100700002)(52116002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?feo/ghVQwUzXV/0aBe8qjPk4OVwJ0bKrQzmFfWOd0GFEN9rbLY9LR9aYuz?=
 =?iso-8859-1?Q?FtSUT5mVkR7G4pK1SHpM8HLYK5Q6Gc72YZcvMVI5pS21XltJ5/40Tbvaag?=
 =?iso-8859-1?Q?RGwPBVSDt7OJaTkKdowMRvvCtrag+OxtZZvit38YG1gNYb0kJ0zo6Sbnto?=
 =?iso-8859-1?Q?tDnrsyvomMtfxLb8TfxfLYdd/21C5daoaw0Qni8gnDpZPl+JDMVvXJobUS?=
 =?iso-8859-1?Q?1jY2mKf9a/MTTImqB3oQ68zIzoWzW9QU3dLTfcoyY9djvKQ0gTyufwNeMN?=
 =?iso-8859-1?Q?eg7/m2eWJl2HvoeKByizfjY7q6YPwu28J/o4zDENp7FggGY3mT+r2Ga7P6?=
 =?iso-8859-1?Q?eaZWH9IG44+uR86wDGY1CeWHcS0L1p0ux0NAN2U7St8Ozvvkv9tpElAQz7?=
 =?iso-8859-1?Q?vkbRWysDgrCEhWIAfAHO/lsmz1YtwSu4Ro3/Ou0pfeYocPvZ55SeFAzCif?=
 =?iso-8859-1?Q?mOo3bpUmB5Pk3EwaYla7Sjg2B+OE2LoFXXHPhoERM5aTyYjTHGJgH7X6FQ?=
 =?iso-8859-1?Q?mWRDnxr2Mm/yTr5EiK4syAsoIGK/6PnK/nsyYEv48jUnyvNoBujmgab4m3?=
 =?iso-8859-1?Q?yH8ppC6yo1e+obJM3ioOHow2NNEsSH2nYCsQqhxyjtIMgEO5K//z7t5VHE?=
 =?iso-8859-1?Q?FJHTH0WKPuWM71BqSM0I7qh9dwfAzafFu9/4w/cAVlr5vt8MlicSaNqHFQ?=
 =?iso-8859-1?Q?oFfw2lBW1Rs9Db9/N+921+9g+50HFEFIOkUmHwQBZFgMPR0N5WVe9D014j?=
 =?iso-8859-1?Q?NHyEpDO8EnWFnrFv4gx844R2U+BwtICZ9ChCYKK1VMNq/2DjroCUtdOLDW?=
 =?iso-8859-1?Q?J2O6y/xWmOmAcGzNX7zkfjoc6tfsAwB5MjjsSyVNbWDAB6616pGCv8WDyz?=
 =?iso-8859-1?Q?VQsS+eVdE3uyU14I4BJslYDA4xcKna3bAWH7cSySaqS2HbCdEggROGhKcM?=
 =?iso-8859-1?Q?2pqT9YURDlrbsEIVFGzQLUy3F0bBdzrrkwfYZJfiGffIT0tr/pGF4tV3Z+?=
 =?iso-8859-1?Q?25DwLhaTBBe8nyvhpJ4pOQzYWolMGP/c3te/eR6KVZHOvzYkcKwhs0Sz6t?=
 =?iso-8859-1?Q?WVbsLSeFJyoIN5eQEdSwBQePh6OA2vaegD57Wk4c0BaEIUekWK4JwGjdux?=
 =?iso-8859-1?Q?QvQOWRYVisur+XIq7fn00v4fYcnNIFFsdfw8a2Fp6oFPwgroH+AwDr02jO?=
 =?iso-8859-1?Q?uXNdspg0MAzxpgRfpvEyP+2vCgLcPbuc17KFHCmM++vRuCKNeEvNo49uh4?=
 =?iso-8859-1?Q?lQghrgkov/+GcKy/CqZ2xbsRx7KuM/U42GseAnfgrI51FEZOq7vMHmmify?=
 =?iso-8859-1?Q?2BBZaHyzxA0+FJGe5mdNswZ9NmQW53x80Kg4wl2xqsrz1kJUURYlLYhodv?=
 =?iso-8859-1?Q?P/PMnVWDv/qiVdW8wP/ICHo5VXMpQVQEbJ70rAStJLxKiKDyTN+e9MPnkJ?=
 =?iso-8859-1?Q?kygnEGI0+XEXVXWTrRtvK9crY95yatyFuQQEFo+aWZ5ydunZqJDDi3zBG4?=
 =?iso-8859-1?Q?EtkgnS+W1qX7JfP3teUbVD58nBT41RIi/FsUza+R6uDN9ASg4uzYrEcPKB?=
 =?iso-8859-1?Q?9BohUybcU1tODek/U83II6J2XZ4VmVx4y2SeQv46xEPQiGdmAk6UUXYW1c?=
 =?iso-8859-1?Q?Gsed8o9GPo3t7Elf719snv1s4kvwvbmkkuH7I6MgfYtyLpg0a6T03LiDcB?=
 =?iso-8859-1?Q?S7BbMxOqg9+QgolidR/XL63n900LxFTletGaINseWxG6dxoOyqooO9Pl4t?=
 =?iso-8859-1?Q?ziVaGXO4zvgjvKw/98+8my4K6y9h3aGkwMg4kamfaOoLixeIzgBsPfPNPF?=
 =?iso-8859-1?Q?PbZKEqXgDJvmKXO50BwEHBDC8PUjWfQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23228189-6449-4cb8-f04f-08da1d3e5f4e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 11:11:35.1626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOsnHhtJvJrXdlGATlzGFBpceZDIm16EUjdxpSv/vAcYpalPEMNz8IGqUTDEFCR1/RAffIIWGLYGyxHS1OivjarTe0H54tYMwHcSd8XPcQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5225
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-13_01:2022-04-11,
 2022-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 bulkscore=0
 suspectscore=0 mlxlogscore=788 mlxscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204130062
X-Proofpoint-ORIG-GUID: DzrM233WM_r2AT0b1ak3JJsF_d3N6Otw
X-Proofpoint-GUID: DzrM233WM_r2AT0b1ak3JJsF_d3N6Otw
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

Hello Thomas Hellström,

The patch 3bf3710e3718: "drm/ttm: Add a generic TTM memcpy move for
page-based iomem" from Jun 2, 2021, leads to the following Smatch
static checker warning:

	./include/drm/ttm/ttm_bo_driver.h:259 ttm_bo_move_sync_cleanup()
	error: NULL dereference inside function 'ttm_bo_move_accel_cleanup()'

./include/drm/ttm/ttm_bo_driver.h
    256 static inline void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
    257                                             struct ttm_resource *new_mem)
    258 {
--> 259         int ret = ttm_bo_move_accel_cleanup(bo, NULL, true, false, new_mem);
                                                        ^^^^
Passing a NULL for "fence" will crash.  The first place where it will
crash is in dma_resv_add_fence() where it does:

	WARN_ON(dma_fence_is_container(fence));

    260 
    261         WARN_ON(ret);
    262 }

regards,
dan carpenter
