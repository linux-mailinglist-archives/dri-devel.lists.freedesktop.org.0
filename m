Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2BCBEE6EF
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 16:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741BB10E1FB;
	Sun, 19 Oct 2025 14:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Jv55izMV";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lTMjyQLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EFA10E1FD;
 Sun, 19 Oct 2025 14:23:24 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J50uK2007805;
 Sun, 19 Oct 2025 14:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=corp-2025-04-25; bh=lutSZzv8Dos3FqjE
 b3rT4308gocF7Tir9mdGzYVdVsQ=; b=Jv55izMVA4/8xRjPAb+Z6xn4nJffgamt
 tDgawbLKhIjjecMEyqREt8/D0Y0dLIMxc6vx08EKluf8OUJJ0BY+5okm+ZeUlZwJ
 V4RdjGonAIlXVcfHDcLdgV/QoKdIebLNAieebsZ/nNvq37XMQhF/0dKxBHUyDx9Y
 0sj3lZ+6G6lR4cHYwayoRa0EjpPKJBitiP97iI5Ig1J0qGY01gvRi3vktS00r2c1
 yinW+FQj0pTUohQZUk3al/iKdPkDO6IBFSNdBABgi5t4UOaBLF7gf77PxQtYAfMZ
 ETLnjr3EA15SyQ+Vw/8jCXf1o4h+mMlP93ZWOA3+I7sUJNN1WIXIog==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v31d12bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 19 Oct 2025 14:23:21 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 59J8G2R2004341; Sun, 19 Oct 2025 14:23:20 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com
 (mail-northcentralusazon11010044.outbound.protection.outlook.com
 [52.101.193.44])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 49v1ba619k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 19 Oct 2025 14:23:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3iiuTNvhKecjMXpUfVzl4VbEcaO2+9pj+BC2+3goSgTsL1t7hNo0zwf3ZTrpKKsO81/SnOfshcmx9uuoNyRw4XvRjwzPqxCDrjiXdUmT012Bsmih+qJoTEw4z/5kiPglVwnwxP0KcEBnu/8pvXVsiZRPJ49zLyjiRBa1Ywk6YQITegLt15JepDy2B6LwaxMEMb7HTUZke26U6qUOQry9QmTBkaqoi4iLwlF/j6e5lEgfjYMoSmE1+ykCRd+cKLOaIPmovtTHQpyF+92ZOUQjtNkfxU4I8nZFUBiXRk6/yMi5sDftiqyn0Ev58zERaoN4q2w6ePPa+Bha8+zei590A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lutSZzv8Dos3FqjEb3rT4308gocF7Tir9mdGzYVdVsQ=;
 b=Era4uebI86dlyMPwAh2lL78Z0//bFuSq+Uyf4Ta80U3XsSl2oOLmiI5QFScJhLglpyzEAYv1JIolzgpND9pJHVZkIQrKyzxYGjdVY7cDdLw5sEhIyxE043vBfz+ivwDxNHC1fAk2ppz53QMS0c6SgC9h1Ddpgz/i0u8Z1zYEiAPF6moK639WYVfsUrL82mEKebXgCrP7nwXaa76/93B3RUtsQS86b0CMZpviltX6xgty0GAcC5vG6v65h0SmNCyy6/nxEDSnKxgKmB4NWtB+pIprH4n2azTaGq+P1wwOY9nvuhUA3Fto8InyIMJopazDakwOqFrh4Pa3OeRk4dkPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lutSZzv8Dos3FqjEb3rT4308gocF7Tir9mdGzYVdVsQ=;
 b=lTMjyQLqTir4Vgs7FLudCdw0yI3Im+myAwgDLwV3dTwBy+nUyXVE5F9AA1FgcNnWoYlg8LK50LdIVBIsIcrHadRvASgSQ5EpAux62lrJ68iarQLyNM9wnguu1CO4x3kL5LBaL+YtFPPoF0RWTabChNRo7RWD/WT4oA+mPd4HqII=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Sun, 19 Oct
 2025 14:21:17 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.9228.009; Sun, 19 Oct 2025
 14:21:17 +0000
Message-ID: <33db45cc-c007-4a72-9303-7690d6818e73@oracle.com>
Date: Sun, 19 Oct 2025 19:51:08 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, tursulin@ursulin.net,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
Subject: [bug-report] i915 DMC assert crash on HDMI hotplug
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::34) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|SN4PR10MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: d62d556f-92d2-48c8-eb09-08de0f1ac430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmxrSC9neEJPd2tITFFzY0dhYktHU2diM1RUT2hWOXdhcE9oS3hwWWE4cW52?=
 =?utf-8?B?SnJZU1BjU2ZtdXliM1AyaWNBVktUa25HSGViWStsVG9LK0NnTjVqajROWGdE?=
 =?utf-8?B?N3YxV040andRZjNDdWRwUkpVaHAyYXNmRDVqMHlRZE9ITTVDUExaNitOMDhB?=
 =?utf-8?B?dkpmZHY3bUJqK2VhVGlGc2ZyY01UMjdoa1RGZHh3amhQQzNpVmFEMGE3SDd0?=
 =?utf-8?B?cnF0cm42WDdtRGlCWlB4dzhieDBtcWZLSW12ZmU0eEY4UGlpc3pwK0tVN2lz?=
 =?utf-8?B?Um5lSjROdmNqOUdYblZpRFpZRHVBRVVjYWFTUXY1U0pnQzh3c1lXcVpOcitC?=
 =?utf-8?B?UXdJYVJ1c0J3VHN4R05uckthYUtUN0NLME04aTZ6aDR4UGdWYnd0R29Fdy9r?=
 =?utf-8?B?Yzl2RVdaNWpXcy9qMEluQ1JSMnY0emMwWGVaWEJHZlpwUGRyRnkrNm9MaEVQ?=
 =?utf-8?B?OXBWam9TUVZlTWlaczQwVi9rOTNOT3MybGxXOFNZV2pCcmdGQ3RoUitSR04v?=
 =?utf-8?B?Qktxd053c0ZQNTgya011VkVUNDh4eExYS2ZpL202bmVmQnF6MkFja3V3eGhs?=
 =?utf-8?B?VTdVUUtSTTJLVnNyVEdEdEx5T09UZy91azhQVmFVMTgrd1JSRmtLMkZ4SUxO?=
 =?utf-8?B?ZTBkREJOTVRWL093bHMycEVCZ2ZlRU1lWjhlYWZYVmNqblE3UU1lSnN1dXc1?=
 =?utf-8?B?eStwL0h6NGlaaklBVzc1L3VOdkczdTZ4VnFYc3RFd2p6RVowVGliMm5NTFFs?=
 =?utf-8?B?QUx4Q3RBajVQVVZtWUlZQnVyYVVxeHJ3WUFKcXJPRXZDZTVVY0xnQXFPTlk5?=
 =?utf-8?B?Z0V6blViWHJwV05nUWNLejZQaEtFZWlQT0tscGhZOEVnck5pRnI0eDFaVW5m?=
 =?utf-8?B?ZElxOWRJS243Ky81OE13SXRST01hY2tneU9iN2xHajYyeHRaSnJzbXYveVE2?=
 =?utf-8?B?SmpmYWFTOGdZVjlNdXN2WUdCNC9lMHk3NjNBcG5vWUExR050UVVBdmMwRUdw?=
 =?utf-8?B?RlBJUXhpV0lGWG0xUzc1OWZRK2YrTitFL25ubE9mTVhYU0t0MUtUVDNEUnNJ?=
 =?utf-8?B?c0YrdXBpWFJCSEwwckh3R1dHZnNxZjdLandwemtQSlpKUC8wZlFsN3c0VlVP?=
 =?utf-8?B?ZGw0c1FiTGlCNjF1bUZwRmVLT1JuTUMvcmc4YlNadURxV2F3YTgyQU84TFNF?=
 =?utf-8?B?Wm8yZ2hJZi95YTdUamRFd1N0SEFrZGEwcW9jSzBKa25xUkx1MU5kdFY4Rm43?=
 =?utf-8?B?S3U4Y0haOGd2SDVVdmY2M3pGVU1VbGtUM0tLUlRxY3VIdWFjVVR5YkwxZktJ?=
 =?utf-8?B?dmtRcTRJeVU3RFUwOWJVSjVpOWFYVWVUdi9nbVlkbG9WTnJDL0RTSENyd2Mz?=
 =?utf-8?B?aVMvN3NnUHgzVklqbjFjZ1FORFZWdURBMURISzl5aVpiRjM5NlczUndnUThH?=
 =?utf-8?B?bHFSS1RzQlpHNFgrQXI1VXpMTVFQODN6dGx5UEVLNTlrWSt6c3dqOEd0L2hn?=
 =?utf-8?B?YzR1VHRnNHY2WTdiMmZUQ2JxZllaeThiNFcydXBORlRKQ01HRGI3MmRJYjV1?=
 =?utf-8?B?WHBkaHVjYUQwZ091QnFxTDAvMXJuUFhld2NXOWJZT2VNNzc3cGJOL3ZWZEN2?=
 =?utf-8?B?MGY1ajQvc2x4bnc3TnhKYU1yWWlSTDZScS8yRlRXSHM5U1loS29URUFwTkNG?=
 =?utf-8?B?VjF2a2dsUVhHUDMraXhXaWRHcGd2dWlEZjBJOUE3ZkVZVndSSDUzdk1xMTVt?=
 =?utf-8?B?ejB4ckVNeXNtUC8rbEdSVFdIMDVPRlQwcFBmbHgrcDdnTnRPTTBqS01uMFNI?=
 =?utf-8?B?Y2IvRjFISWVvRThTbjI2OXNndmExWm8zOTgvNWZCVzgrWVR0S3ZkejlZNHl3?=
 =?utf-8?B?c1Z0cFJxQzZWbkUvQVl6TjdMSVVleVpaRzdVYmUzSHRnb1VUMUlacTZ3d3ZV?=
 =?utf-8?Q?rjbCjKnwa0n5i3i/bcRQ0UvjiN5IxjW2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB5328.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTlJMDc4NFB5TGYyaDNHWVArNkRiRlNGdWlqbDJrYTA5Smt6cGpzbW5qMUdJ?=
 =?utf-8?B?ZlhQT3NBSFhTdjlCckVqOUhLalQ3Znk4aUxLSXFEcXd0L2I5NFRxM2RBS0to?=
 =?utf-8?B?dDB4d1pDY2YySTdITysycUVSdlI5UTBZNGg1c0JpNGd2TmZNajNRVGhmalI2?=
 =?utf-8?B?YnZSdWwreGJ1QWVCYi9tVUVlUHVIUWwzS3dMWGVpSzZpVTQ2NlhrNjMyZ3JD?=
 =?utf-8?B?bjlBN0M5azRJVElmdzg4cm4vV2tYS0hza2loN01SVkFXczNuZktSbnR2MUFp?=
 =?utf-8?B?ZFpSUzhoRzB0eURSK29SeTNQeXdPMiszS09IK0d2UVhQclljV2w5SVMrUE1J?=
 =?utf-8?B?eW53MnYxa2hESzJzdFpKR013NUNDY3JiTnhRNHdwQVZEQXREUU9VcmlldDZH?=
 =?utf-8?B?bWU1dGV5dFlYWWlNZ1M4QS9xbVRhd1NzUE1VbnJKWE9mRVBQbTczcEpnVlpI?=
 =?utf-8?B?UXhSWmRaMFB0ZmNBeEoxRU9jTkUwUkpiSkdiaW1RcWlFTC9PblNSUVh1VTQ5?=
 =?utf-8?B?R3RKSERWKzNlRXgydC9ocUtoSnlTY2VEdlBpS1ZPemd3ek05L25KMGVCeW5a?=
 =?utf-8?B?cjVHK2dGdmFnUDV1SnZWWmtxNGduSFZHZnhjTytVSm5pZ1Z5K1JEOEhYMnAx?=
 =?utf-8?B?NGxwRlFleTFlNWFDUFdrdUErZHl4NS9UWEZmSE9tQUpkVjVrU1RzOGRJbGVX?=
 =?utf-8?B?N1UvVmZzVkpJcjExWjZCYkJyU1Zua0FoYnpRR3lxcDQ0UXRMa0dhcVdKM3dk?=
 =?utf-8?B?blpTakxsWXJ1Si9KMUQ1TElKdGFkcjNscmtZNWNvQk5tV0gzQnFOd1oxOGZy?=
 =?utf-8?B?R1VSU3IrdVdOVVhVWjE5bWtNNHdLT0p5NVowcUg0ZVgrbERqenFzQlZXTHBr?=
 =?utf-8?B?bXpqUU5FbnJOaEJqdG5xaGhIZmdFUXY0V3phQitHTHJ2d1pubFNwVW4yWjNM?=
 =?utf-8?B?MEhYc0pjWTR1dHFPcGNnOE9yUEZXM1R6cGN3cXZDeWgvZXlVbzBkdTBpL1lB?=
 =?utf-8?B?Q2lkMGlOQWxsa0N4NDJTMG1OaXNXaVpWQXllT096QTlQL3RqZXd2Sit6MGZr?=
 =?utf-8?B?VVk5YlNqdnpCOUpoM2xMQXYwRjlhWEN6bHpxaHlReE9CYnlSdVNWYVpHNUdH?=
 =?utf-8?B?N0dXWWtnamc2Z2FwejQxSUhOSjI1eXBWL0xHVDY3NmtRb3grb2hta3Q3SGNY?=
 =?utf-8?B?VDBPeG0zTWVHWWVJRHMveDlRK0FGaWN0bExCelp2NWNVOU9ZRUhOc3EvMHVI?=
 =?utf-8?B?aUVySnhKalE4UE8rRzg5aFBLYjVHNzZjS0lpWHdZcjJhdCticnhKMEc4R2lC?=
 =?utf-8?B?cmlKTlpmMi9SREVMbG91N2hzdlBGWmdma2pYam5VaS9KZjdTWnBxSy91aHpC?=
 =?utf-8?B?SHlyM1FlRnJMVGxjK0t0RjZWcUliSlUvRXJoQSs0UVBqc0E2bHZLMXJOUlZM?=
 =?utf-8?B?L0Q5TUNuMlZxdStuZXVpeU5zZUdXYUxac3FJWlpsenptb1BsbldsK3cvU0l1?=
 =?utf-8?B?SE82UTdNUC9yWFRJQ1JQZ2s3blU3QTVEQ1h5WGxkYmtOYmJmRFd0Y0s3bzV3?=
 =?utf-8?B?aHlkaTVQdzJVQWxsdmxiazhiZTRpRkVRSTdERFV3SllZVW1qVDZHcTFmZjIv?=
 =?utf-8?B?VkEwSVNHa1N5akhIV3Y1aFFNTjRtRlVzVk1QRSsyTWtDcExVQ2IzczFYQUFO?=
 =?utf-8?B?YjV5a1pSSXVUdlRtRk5PK1ovOFFuTFdjMjEvWE5LUC9EbnZ4VzF6cyttSldU?=
 =?utf-8?B?dDJsZHYwRVpPSGFrcDBGa1hyQmVITEw1L2V5SFVlcXp6OGxlWGdJYVIwcDVZ?=
 =?utf-8?B?MjM0ZGE5YUoyZ0FLcCtuRHc5SGUydmJZa0hJZVYyc3Rodm5jMDFwVWNiT2s4?=
 =?utf-8?B?czk5Ry91cjVvcHZoR1Z6c0pOZ09tdllXcjZtUnhBM29OQ2RaOXAxRlJpL1pu?=
 =?utf-8?B?OUxES1ArVFNHcFFzbWJwSFhnbDdyMnBOdjgvMmVkYi81YU1jQzhnNUhKZ0xh?=
 =?utf-8?B?SUttYUZHRXlyK3JDaVRQVWFqYmMxOFM0SDVZbWRva1VuZHJRZDFNWUsxNmow?=
 =?utf-8?B?YmxwNXdHelB5RkJMTkhObVVJWFZadDk4MDZMV0FEZ25DbXh3VjRwZWJuZlVD?=
 =?utf-8?B?OXovSERUbUdSZ25NZmdGUS9zV09KOU1QNmljNThNL3VxUUdwWVpleGh1aCsx?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3vW8r+eEtZPkhy75hiXe61Nb70QFEFxHFWQB75VPQcKTxjdVLR3U/f3emQCx+OyvbqoONR7zodWZ5B0YpAWeKaktqjpLvC+AgvrOlG4cL2wU2Jc6sdLA5+EY4uHMxpm6doQyLf+YrbZRUuXEuVJFBcOuvI6ASOOXdgDb1QF71hORBk0yxYop4auT+pHeAz/Y0QXESFPnX5qjjIUIAixuteuuHHbJXa3vwAl4maVOXy4KTBLY8t6PMdZVG1fhbr0vB45fJt5faqdcEHFezX9K785QlCiBAunXBZtATRWN6Lu/ijSuzhIIE6yyCA4+372Ies7S9mFNP0O4jaRfyESkzE1X4Ji8CbQRpls4+enbVgT4asPvuZ6ycPEZFwAaub4YLZQYzQIbF3u9GGQuIqGt8PTF/E2tDayltoCKxFnqfnNwPBYX4Y9Lshiuzl4MnhHdRXkhmwimAptpRoYvWA63g+eXlag0xBCF+xNEhKgNSp+M5GOA2AXXpQAknguiUbwhnIQXJxSamWJ1TK2kaILvN9e0fEv+XcPCbwpuL4OjqWvsnc+eppQjjBSn6W+SNKltM/FcrSJUzKHQ5VZgDO0zE0q2iFCCc6qDkMa7PZ1w69I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62d556f-92d2-48c8-eb09-08de0f1ac430
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2025 14:21:16.9966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kprki0TZoH1WE+N18XQ86iDi6Ljh+LocWaQUZJ6ZL3K9OPSs1EL80F/4k0KcC7h/Cn+Cr0pWkELRBQ2NzVjpqpJTto+432JoZIjR+W63PWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510190103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX+zj9WQl/khJr
 wfjGVBmlDQpMGFdV8bwhXcVMnkKxgM9kwVsKGztX5glb00OItg42fv+tyg3jeeRuBU9Jo3Cmi/S
 v+SEVVw9bYm4nruTRQjB299JLV+9ifdlRQ2arC32t8BhDWpikQH+uIYhSWLe/poihAH/RDTFxdE
 H7wYNxX0epBe0D566kDAStfc3JH3BNmj5d+m/2UHpqq4mA4hmbARTkWaxbyTvvZkfReM0eO2X9d
 hqi2VMjwZJwglVQp756KJHOAtr+VOo8H+hRgQ0F0IHLxliBmlNIrfbkAZ2xEluM706qG1s+TKJY
 rxhPc70qU40t8LLYz1ffUYeyAO4j4G88HNACXc1ODme8Se4fqVoH7QCMEyEXIUAefIdkILYvzLD
 th2vtip0dJzRVgOl9pzw8yz4RKHRrA==
X-Proofpoint-GUID: MKhbMHd-rofB3SKeHsZEgms9xy2Olz_i
X-Authority-Analysis: v=2.4 cv=KoZAGGWN c=1 sm=1 tr=0 ts=68f4f459 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p-AZ_irS1pRGNWHL4FAA:9 a=QEXdDO2ut3YA:10 a=HhbK4dLum7pmb74im6QT:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-ORIG-GUID: MKhbMHd-rofB3SKeHsZEgms9xy2Olz_i
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On a Lenovo 12TECTO1WW HW (BIOS M5HKT1DA), the i915 DRM driver triggers 
a DMC firmware assertion
when connecting or disconnecting an HDMI display. The GPU firmware (DMC) 
registers show incorrect
values, causing assert_dmc_loaded() to warn in intel_dmc.c.

This occurs on kernel 6.18-rc1 and appears related to DMC power and 
hotplug handling.

Kernel: 6.18.0-rc1

---

[  130.665424] audit: type=1326 audit(1760882657.655:78): auid=1001 
uid=1001 gid=1001 ses=3 
subj=snap.snapd-desktop-integration.snapd-desktop-integration pid=2408 
comm="snapd-desktop-i" 
exe="/snap/snapd-desktop-integration/315/usr/bin/snapd-desktop-integration" 
sig=0 arch=c000003e syscall=203 compat=0 ip=0x7e4ba6bc4531 code=0x50000
[  131.287051] nvme nvme0: using unchecked data buffer
intel_dmcintel_dmc[  218.492264] ------------[ cut here ]------------
[  218.492268] i915 0000:00:02.0: [drm] DMC 0 mmio[5]/0x8f03c incorrect 
(expected 0x30100, current 0x0)
[  218.492292] WARNING: CPU: 6 PID: 409 at 
drivers/gpu/drm/i915/display/intel_dmc.c:645 
assert_dmc_loaded+0x2c1/0x420 [i915]
[  218.492455] Modules linked in: rfcomm ccm cmac algif_hash 
algif_skcipher af_alg xe snd_hda_codec_intelhdmi drm_gpuvm 
drm_gpusvm_helper snd_hda_codec_alc269 gpu_sched 
snd_hda_scodec_component drm_ttm_helper snd_hda_codec_realtek_lib 
drm_exec snd_hda_codec_generic drm_suballoc_helper 
intel_uncore_frequency intel_uncore_frequency_common i915 snd_hda_intel 
snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic 
soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common 
snd_soc_hdac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda 
snd_hda_codec_hdmi soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp 
snd_sof iwlmvm snd_sof_utils snd_soc_acpi_intel_match bnep 
snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation snd_soc_acpi 
soundwire_bus x86_pkg_temp_thermal snd_soc_sdca intel_powerclamp 
mac80211 crc8 snd_soc_avs snd_soc_hda_codec snd_hda_ext_core 
snd_hda_codec coretemp kvm_intel snd_hda_core snd_intel_dspcfg 
snd_intel_sdw_acpi snd_hwdep snd_soc_core kvm libarc4 snd_compress 
iwlwifi ac97_bus
[  218.492496]  snd_pcm_dmaengine snd_pcm snd_seq_midi 
snd_seq_midi_event snd_rawmidi binfmt_misc snd_seq cmdlinepart 
processor_thermal_device_pci btusb processor_thermal_device spi_nor 
snd_seq_device btmtk processor_thermal_wt_hint drm_buddy 
platform_temperature_control snd_timer btrtl irqbypass ttm 
processor_thermal_soc_slider polyval_clmulni nls_iso8859_1 
ghash_clmulni_intel platform_profile btbcm aesni_intel mei_hdcp 
think_lmi processor_thermal_rfim btintel mei_pxp rapl snd intel_rapl_msr 
processor_thermal_rapl cfg80211 bluetooth firmware_attributes_class 
input_leds drm_display_helper intel_cstate mtd mei_me joydev wmi_bmof 
intel_rapl_common soundcore cec ecdh_generic processor_thermal_wt_req 
ecc mei rc_core processor_thermal_power_floor intel_pmc_core 
i2c_algo_bit processor_thermal_mbox pmt_telemetry pmt_discovery 
pmt_class intel_pmc_ssram_telemetry int3400_thermal int3403_thermal 
intel_vsec acpi_thermal_rel int340x_thermal_zone acpi_pad acpi_tad 
mac_hid sch_fq_codel msr parport_pc ppdev lp parport efi_pstore
[  218.492543]  autofs4 btrfs blake2b_generic raid10 raid456 
async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq 
raid1 raid0 hid_generic usbhid nvme i2c_i801 e1000e nvme_core hid 
i2c_mux nvme_keyring i2c_smbus ahci spi_intel_pci nvme_auth spi_intel 
libahci hkdf video wmi
[  218.492563] CPU: 6 UID: 0 PID: 409 Comm: kworker/u32:8 Not tainted 
6.18.0-rc1 #3 PREEMPT(voluntary)
[  218.492566] Hardware name: LENOVO 12TECTO1WW/3355, BIOS M5HKT1DA 
06/17/2025
[  218.492568] Workqueue: events_unbound 
intel_display_power_put_async_work [i915]
[  218.492706] RIP: 0010:assert_dmc_loaded+0x2c1/0x420 [i915]
[  218.492840] Code: 55 a8 e8 52 2d 9c cf 44 8b 45 cc 8b 4d bc 45 89 e9 
48 89 c6 8b 45 c8 48 8b 55 a8 48 c7 c7 28 7e db c1 50 41 56 e8 9f 19 e4 
ce <0f> 0b 58 5a e9 92 fe ff ff 48 8b 17 eb c6 48 8b 3b 48 85 ff 74 04
[  218.492842] RSP: 0018:ffffd04682ff7c48 EFLAGS: 00010246
[  218.492844] RAX: 0000000000000000 RBX: ffff8ef885a22000 RCX: 
0000000000000000
[  218.492845] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
0000000000000000
[  218.492846] RBP: ffffd04682ff7cb0 R08: 0000000000000000 R09: 
0000000000000000
[  218.492847] R10: 0000000000000000 R11: 0000000000000000 R12: 
0000000000000000
[  218.492848] R13: 000000000008f03c R14: 0000000000030100 R15: 
0000000000000005
[  218.492850] FS:  0000000000000000(0000) GS:ffff8efc32794000(0000) 
knlGS:0000000000000000
[  218.492851] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  218.492852] CR2: 000075deec01b098 CR3: 00000001fba40006 CR4: 
0000000000f72ef0
[  218.492854] PKRU: 55555554
[  218.492855] Call Trace:
[  218.492856]  <TASK>
[  218.492860]  assert_main_dmc_loaded+0x10/0x20 [i915]
[  218.492990]  skl_enable_dc6+0xad/0x230 [i915]
[  218.493113]  gen9_dc_off_power_well_disable+0xb8/0xd0 [i915]
[  218.493244]  intel_power_well_disable+0x67/0x80 [i915]
[  218.493394]  intel_power_well_put+0x4b/0xc0 [i915]
[  218.493523]  __intel_display_power_put_domain+0xc7/0x1d0 [i915]
[  218.493649]  release_async_put_domains+0x5b/0x90 [i915]
[  218.493774]  intel_display_power_put_async_work+0x6b/0x170 [i915]
[  218.493896]  process_one_work+0x1a1/0x3f0
[  218.493901]  worker_thread+0x2ba/0x3d0
[  218.493904]  kthread+0x107/0x220
[  218.493906]  ? __pfx_worker_thread+0x10/0x10
[  218.493908]  ? __pfx_kthread+0x10/0x10
[  218.493910]  ret_from_fork+0x202/0x230
[  218.493912]  ? __pfx_kthread+0x10/0x10
[  218.493914]  ret_from_fork_asm+0x1a/0x30
[  218.493918]  </TASK>
[  218.493919] ---[ end trace 0000000000000000 ]---
[  218.493921] ------------[ cut here ]------------
[  218.493921] i915 0000:00:02.0: [drm] DMC 0 mmio[6]/0x8f00c incorrect 
(expected 0x40b8408c, current 0x0)
[  218.493937] WARNING: CPU: 6 PID: 409 at 
drivers/gpu/drm/i915/display/intel_dmc.c:645 
assert_dmc_loaded+0x2c1/0x420 [i915]
[  218.494063] Modules linked in: rfcomm ccm cmac algif_hash 
algif_skcipher af_alg xe snd_hda_codec_intelhdmi drm_gpuvm 
drm_gpusvm_helper snd_hda_codec_alc269 gpu_sched 
snd_hda_scodec_component drm_ttm_helper snd_hda_codec_realtek_lib 
drm_exec snd_hda_codec_generic drm_suballoc_helper 
intel_uncore_frequency intel_uncore_frequency_common i915 snd_hda_intel 
snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic 
soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common 
snd_soc_hdac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda 
snd_hda_codec_hdmi soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp 
snd_sof iwlmvm snd_sof_utils snd_soc_acpi_intel_match bnep 
snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation snd_soc_acpi 
soundwire_bus x86_pkg_temp_thermal snd_soc_sdca intel_powerclamp 
mac80211 crc8 snd_soc_avs snd_soc_hda_codec snd_hda_ext_core 
snd_hda_codec coretemp kvm_intel snd_hda_core snd_intel_dspcfg 
snd_intel_sdw_acpi snd_hwdep snd_soc_core kvm libarc4 snd_compress 
iwlwifi ac97_bus
[  218.494101]  snd_pcm_dmaengine snd_pcm snd_seq_midi 
snd_seq_midi_event snd_rawmidi binfmt_misc snd_seq cmdlinepart 
processor_thermal_device_pci btusb processor_thermal_device spi_nor 
snd_seq_device btmtk processor_thermal_wt_hint drm_buddy 
platform_temperature_control snd_timer btrtl irqbypass ttm 
processor_thermal_soc_slider polyval_clmulni nls_iso8859_1 
ghash_clmulni_intel platform_profile btbcm aesni_intel mei_hdcp 
think_lmi processor_thermal_rfim btintel mei_pxp rapl snd intel_rapl_msr 
processor_thermal_rapl cfg80211 bluetooth firmware_attributes_class 
input_leds drm_display_helper intel_cstate mtd mei_me joydev wmi_bmof 
intel_rapl_common soundcore cec ecdh_generic processor_thermal_wt_req 
ecc mei rc_core processor_thermal_power_floor intel_pmc_core 
i2c_algo_bit processor_thermal_mbox pmt_telemetry pmt_discovery 
pmt_class intel_pmc_ssram_telemetry int3400_thermal int3403_thermal 
intel_vsec acpi_thermal_rel int340x_thermal_zone acpi_pad acpi_tad 
mac_hid sch_fq_codel msr parport_pc ppdev lp parport efi_pstore
[  218.494145]  autofs4 btrfs blake2b_generic raid10 raid456 
async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq 
raid1 raid0 hid_generic usbhid nvme i2c_i801 e1000e nvme_core hid 
i2c_mux nvme_keyring i2c_smbus ahci spi_intel_pci nvme_auth spi_intel 
libahci hkdf video wmi
[  218.494165] CPU: 6 UID: 0 PID: 409 Comm: kworker/u32:8 Tainted: G 
    W           6.18.0-rc1 #3 PREEMPT(voluntary)
[  218.494168] Tainted: [W]=WARN
[  218.494169] Hardware name: LENOVO 12TECTO1WW/3355, BIOS M5HKT1DA 
06/17/2025
[  218.494170] Workqueue: events_unbound 
intel_display_power_put_async_work [i915]
[  218.494309] RIP: 0010:assert_dmc_loaded+0x2c1/0x420 [i915]
[  218.494435] Code: 55 a8 e8 52 2d 9c cf 44 8b 45 cc 8b 4d bc 45 89 e9 
48 89 c6 8b 45 c8 48 8b 55 a8 48 c7 c7 28 7e db c1 50 41 56 e8 9f 19 e4 
ce <0f> 0b 58 5a e9 92 fe ff ff 48 8b 17 eb c6 48 8b 3b 48 85 ff 74 04
[  218.494437] RSP: 0018:ffffd04682ff7c48 EFLAGS: 00010246
[  218.494439] RAX: 0000000000000000 RBX: ffff8ef885a22000 RCX: 
0000000000000000
[  218.494440] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
0000000000000000
[  218.494441] RBP: ffffd04682ff7cb0 R08: 0000000000000000 R09: 
0000000000000000
[  218.494442] R10: 0000000000000000 R11: 0000000000000000 R12: 
0000000000000000
[  218.494443] R13: 000000000008f00c R14: 0000000040b8408c R15: 
0000000000000006
[  218.494444] FS:  0000000000000000(0000) GS:ffff8efc32794000(0000) 
knlGS:0000000000000000
[  218.494446] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  218.494447] CR2: 000075deec01b098 CR3: 00000001fba40006 CR4: 
0000000000f72ef0
[  218.494448] PKRU: 55555554
[  218.494449] Call Trace:
[  218.494450]  <TASK>
[  218.494452]  assert_main_dmc_loaded+0x10/0x20 [i915]
[  218.494572]  skl_enable_dc6+0xad/0x230 [i915]
[  218.494667]  gen9_dc_off_power_well_disable+0xb8/0xd0 [i915]
[  218.494757]  intel_power_well_disable+0x67/0x80 [i915]
[  218.494845]  intel_power_well_put+0x4b/0xc0 [i915]
[  218.494930]  __intel_display_power_put_domain+0xc7/0x1d0 [i915]
[  218.495015]  release_async_put_domains+0x5b/0x90 [i915]
[  218.495099]  intel_display_power_put_async_work+0x6b/0x170 [i915]
[  218.495181]  process_one_work+0x1a1/0x3f0
[  218.495184]  worker_thread+0x2ba/0x3d0
[  218.495185]  kthread+0x107/0x220
[  218.495187]  ? __pfx_worker_thread+0x10/0x10
[  218.495189]  ? __pfx_kthread+0x10/0x10
[  218.495190]  ret_from_fork+0x202/0x230
[  218.495191]  ? __pfx_kthread+0x10/0x10
[  218.495192]  ret_from_fork_asm+0x1a/0x30
[  218.495195]  </TASK>
[  218.495195] ---[ end trace 0000000000000000 ]---


Thanks,
Alok
