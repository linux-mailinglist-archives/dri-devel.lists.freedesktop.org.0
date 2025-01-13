Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D303A0C570
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 00:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC6D10E43E;
	Mon, 13 Jan 2025 23:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="XCU347YW";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sFn7Y0AC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BAB10E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 23:16:35 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DMBLhm032036;
 Mon, 13 Jan 2025 23:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=corp-2023-11-20; bh=7gGosCgZm62qwgZm
 Yxzf9cGwU7NB1JEuose9uH6/nyQ=; b=XCU347YWkhH6tAvULgGaSJ39AWX4IQAX
 WPSmKLnIR9xj/ktMILy123RQYvzkfNFfsdvwwThchCX2/kKIcn5hwVUF04NnrXfF
 LyTbLRJiDkW/6YUAB/gaAnYLxGBPHYl8FkjHVmYpIo8UaZzqnkpU/Wj5aE/jRkWc
 dz3Xh+DZIzlBNArMR18L/zoJzV6JnmeZqpF3Oww80Gfy3njFRfVmR/LHVQtKLaY6
 sq7xeRt1M2fIhWkQcjStkCV2/PoQ6lhRIO/aBiCEwElArWQW1QyIJqpNZzds+c+N
 Q1Ff5CALNTbp9Ad/4RmeiMDuedIXiX2DZTaa2YAl2QmrICpxv0PERQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443fe2ctde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 23:16:24 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50DM36AP038719; Mon, 13 Jan 2025 23:16:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 443f37kamt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 23:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pihq/b1pMI9SgNK02r7tDZveN1PE2FAxinynXGUbySGiP+zIi+MjnWUPrcXsv3GG3MXlrdGGC6+D+ijg0gDd2v9GrQMxqX/jDvGUU9Zk0iVjpcXbo3ZNNnVk76i6IZ+bFzONgu7oFqrte5IAx0CuJX+uUHdHlCO0Twt50KvTVEqTy+jXucCcdwTDou7kJATDxD1Xsb61dMOUslVMqC1zfHaK8DtE+nvSMXENamG2ZPcVQrZ/qYf862RkQI6X/MOcGMcZ4ujLw7e03tp0meFXAFOdpH/Ai8hNvTxViRRK5XvwpjVBeh5fIrTfDyayZ9ev5cP/lDp97eeTp2qtSCp05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gGosCgZm62qwgZmYxzf9cGwU7NB1JEuose9uH6/nyQ=;
 b=ygKAgPEwhZAo6Mi3AMT+4Wq6AaXnhy1gRsD/ZyDyxHAoJ3cZIK3WoJbnKG/+G1GdVuB7ba4VRSo5ZrQI/CAXzqfP6Ox7EFeEnfwTRWpn7ADXGFZPg1YSifyh3FX+8T4wypoLr4+CljYDlfNYSUwW9GUh+Pa06UzBNZ9EHiwSxvMczXWJdW+iwXzBGA9KxgsMuazrjwqmk3SPMSjzLDCm6UhQzYIPOhjvkXTFLkcD6IMryBiBc77M3z2JHCOozGIA/ddWsN19in+oKIDGwqOJH1kF7js6RO1j9Am6wjOznsU0z3zTVwQp9qKKzaGXJ9hKOC1F8zG3WkSLvjak636P8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gGosCgZm62qwgZmYxzf9cGwU7NB1JEuose9uH6/nyQ=;
 b=sFn7Y0ACSVY+QitCRrFIefZ/QjhnRcH1HKGpqTh/2I3TEkzkhaTMAYgHJGhfzAu9HFr4xD+sNjluqu5iK8MWI99z1lldQ95jtu/u45B+Fjydmod/OtKPF287uFgQPUUKFWte4Mvo9wCtpJn3pDKAN9Xoo4uwGnUPw2Rxs/kYX+Y=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB6848.namprd10.prod.outlook.com (2603:10b6:8:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 23:16:21 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 23:16:21 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH v2 0/3] expose mapping wrprotect, fix fb_defio use
Date: Mon, 13 Jan 2025 23:15:45 +0000
Message-ID: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::19) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5fdde0-16a5-4c03-6ad6-08dd34284a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v1c/YMoszkJsp4WOkTOc711RkoZjUVSpsOenz462wjP5mWFIAzz0/xuvo4ve?=
 =?us-ascii?Q?HWVFYn5XaebzvHfhDXk3nNzUE7TM7qFn5EEWO2ASCAF2iSXjJAOc2xlXCjU4?=
 =?us-ascii?Q?jVa6bhXVW7M/bS2GPGX90//8uH2ebShsO5AmhUThdfrZWluZDaqv+yoDCCE9?=
 =?us-ascii?Q?j/hsy4cSaj7VuKW2DNSYmJXNaAVs9oJ9xhwWmmWQzVe+jLV9K8IuFejuBaHX?=
 =?us-ascii?Q?heLQKvqf5PiLyXcBwZu07XelzIWw+j7UrAos+tGdOJiTYYpj9QhDUh/ybOX3?=
 =?us-ascii?Q?T7MKvArVUL3TU9XVSS4PMgSZ76t1W25kq5YPOUqluoOkWVuzvF30lsKO60Yb?=
 =?us-ascii?Q?VqgMbNmJO1eFrIFDq2pspShgV2CPtKPyu15ofwuMISltMQI8jFCXBocUsyvN?=
 =?us-ascii?Q?fyHMQ1bPZ2V84t9/OIEDJpu1lHVOZqxMgIVMhjBm7y5EYiEXBPxIRrJWUtWF?=
 =?us-ascii?Q?KZ7JN7cgxsDUGJMl5ukHppfns6JGsaYlpcNieWE9t+xnNNSCZAbPXYhY3UHq?=
 =?us-ascii?Q?zgVuL3C8M/N38OefRPXUyAme9k6DjmIq/CqooPyZC9TSkirT1yylnaRSois9?=
 =?us-ascii?Q?UNP6Olab3rqPF6SZnAQ9Xy2HuwAGQg2jBN6THsVd0txH3J5u0M5hThLSZhdv?=
 =?us-ascii?Q?6IOPT2gYVEPdQZKre9Z72GruiTUi9ABEZfeuhNz1D7hfmo7gieVLUekXK8/c?=
 =?us-ascii?Q?94CO3jIoI6hobXfthGP3Be/mOmTT9McZudr0JvPZ5tNhX8JIac4V8VNHhmAz?=
 =?us-ascii?Q?I2PIMI5wGhLtlcJc/h5/Y7wqQNBfiWOgItNtf6mx0HW7wwxTKN0QaYxQPpne?=
 =?us-ascii?Q?BpKocrx4N+s9qZqTYZgdwIFd/r7/M8GXUoaaomp5uE8qY3MxYbKtAKsKm9u0?=
 =?us-ascii?Q?G/1h/7+9n/gQGq/q86g3yOBhr77mAMTg8vnNEArMo2SELm9UUaKJrdA+j9xj?=
 =?us-ascii?Q?wKfAiFxChhYckTOhnzSZJxvWjEx1msXXXBvVsxYB2exHQkenxLCR8QvI245w?=
 =?us-ascii?Q?ez+xZjO7uJw+8ob/ll+VmWbtwiXR7+0K2bd5bnbLBlY1DhQL6Mx6kLIAoDRI?=
 =?us-ascii?Q?VxV4l2UriIrXPnLsOero17L0WfseSoQj0le+NzmE87Si5mqJJbH4iWUczWZp?=
 =?us-ascii?Q?fGNRxlZYgfw80NmxdzBTnoCrk8jh6KVxilu879Bg6l8IMk8ZBzjc7xRqKioA?=
 =?us-ascii?Q?SjmQpmvKHWCQMAzvNmlOeoSXhrcaBspYmMeu9wLT7wxgakxhiEMOr9kuREGr?=
 =?us-ascii?Q?QFkX20w6sx9vyVS0mfnIHmOZB37htkMZqilP3KuS2J7WYkjKtdFwZ/SBLyWl?=
 =?us-ascii?Q?vVVKeBhNN+JpbvYhc1R7q+mGI9A3CeO/g9Sd32kjCW1kog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NMds33s7gq+8U9/Pu+/Spnah8XOs/icXWLT+/ae5q1uI7Hq5BE70EttjlVc4?=
 =?us-ascii?Q?jt2L4RHlPTLq0hwUZpZxo1S2uyXSPwFcrB0DckOnaF4r3erTI0Nf9yQK2U6j?=
 =?us-ascii?Q?FyMnNHbiH1Xu/jb8R0mxubJNUfGaCz8iOQ6V1EgM795a8R/Q3xnQtAYl30ve?=
 =?us-ascii?Q?w/M2NC4QGynBj8ppSCivVmAOppyEXQR+fZn8PnDkY03VLI2uzJKM0n/zeQOs?=
 =?us-ascii?Q?FFz3NB3QvJCn9jxK2pRVfb/+NDsXfexBe8ZPp1RI5PRTPDngck0xvk2iR5Pk?=
 =?us-ascii?Q?FNRLVyFcXvGvA/weGO3dtWzikutb4ZNM2RO8CBF6IeLEl73aaODMRDEO/6/7?=
 =?us-ascii?Q?Y6kiLAJUzKzdG1CHEuizQIRVyQfOWfK2HMCyvdRnUOq6uHkp1W1MJ1MpyJK1?=
 =?us-ascii?Q?mbWS+iYeGsJHwJThxigNL1/wdMNHatnhQ8su6Ok+r41IiqD52IavaOPnZ7Wm?=
 =?us-ascii?Q?lHg7PxjHPa9etsDuZGt24HXtfVnVkiykV1D4IeY+4TjPSAJir88S6cKwGeOk?=
 =?us-ascii?Q?+NQGRzGU+ZfERLNL5kvnnqdltsCBPeod7y6zk9GOC9xP4TW8lutsW3uveECk?=
 =?us-ascii?Q?ZKOtCJlT/8ZRYSXGVMo4SROdETEIA2wmwVzRkHLEjkO5Q652dFqXRSrTKOOc?=
 =?us-ascii?Q?8bgkp1kA7xmsKO/gCqNnnW9gGgJaHe3uv5OaMkORvgSjApjBM6vpd06Fzq3X?=
 =?us-ascii?Q?Ad6+EoOiYK8hiY6crApBS6G+nYFq1P1sHtwotMtLQhbar7cLc+XMb30d7N72?=
 =?us-ascii?Q?AAkw2GhWFAxE6SR7DTlDbRoYcf5+rQghbGO+D53KHgHbud8nkILKBxyMgwBw?=
 =?us-ascii?Q?0iWO8Oi79b0fFjN+at8rxOrEIf3SeANoYyOnFc7XMishYvhn9Xks30gDjq0l?=
 =?us-ascii?Q?S0Hx6gc7ZLM3xtYYe7OWhDSrE7F8mKjPwX7y6UOkeF4au5G30tmlv6d5uI+b?=
 =?us-ascii?Q?h3QdP7ODsPAsVhWv3NjLEkPNpSVnyJ6Hj1wZoOx627arqG879x8yeYljERNf?=
 =?us-ascii?Q?F1AZjdYMmM8tjz0LOUnz3LFvFkukFlYL8v4lOO1qzo2sTVwUppSUYdutXvaY?=
 =?us-ascii?Q?+2p6qumdNDp3iZAVzlLCPp1QZH5lQuapFsNx2gg0/wqGzQIM+hQnfGJiEw/A?=
 =?us-ascii?Q?qstLhI9s9P8Bmq3+x5vg/8DokDXdK9Q4UbMqDivwXiTQw7Tw7FKnVHoW5mJ1?=
 =?us-ascii?Q?XvcmzStIycMijFkzcvfayS/kjA04WnIcjmGbvBcJJklFcYgYFRoCs+Bu774C?=
 =?us-ascii?Q?McvfR4B/8Q63OTmVBP5/yOsH4cWsMy4ZFWGG8foixJJjxX/UQ9Gr+E3WAMAd?=
 =?us-ascii?Q?kWG/qyk+U8kfjcCnarH3kOYF+cIYGyg5Y7+LaH1Xv8T5qHHpycWGuEMNsRdK?=
 =?us-ascii?Q?xdHKZF28u5O0Hu8dTmT3CwcL4whu6eRQnyBXayIfCVFj0YLzB2JIeBXhzCPJ?=
 =?us-ascii?Q?a4071Tc5VEa4u509zZR0CJ6FM8Xk0Qi6T/7rl7ebWnu4IZwC25JVDbAunGlH?=
 =?us-ascii?Q?sR0UIq4Dvvp9hfj8zTCjIs5CcsPZ9N52LS7NM/tX7K7fDDPfR4wThMsNVKax?=
 =?us-ascii?Q?4GFdNU8XnUt6TaL/bb+OeA4Vtsl7TG0TN4lg7lcSO/RmXNYBPxSGpXKXnyfr?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: umhM2OvazswbL51GoMtw23Q3KpHeQxlAUmIBjCTWfp4WVIWzIz9fVr1jawjZtgr1qgc9nDdWNqwe3OIRvY2pnFnBuFqRctFJyLslqnjIReDya4MVGPibDu91WpqvdHxWCgj+tfT6447AoeHuOvICUUptKoDj2TfgtcIEwp8c5henz/699sIrfhXlJD85/LQY37CxHdAhMkZ/e3fVS8kxGT82FH0Kt+BPdfbW7xfbR1D7Z4bt3uVZAhERJFfCQlFTT66I1DItXznjstt54mmTjBJHARONUZjM0GtCqGsmlo2yjgCfDJJm5RXEkNShPeBhRX92W+oSyr8GcqF6oZd0CaOsdcMe+0q7418zVeebO8XUayBh9ZT60ePy1an8JckaVAdPqveG05ur13W1kvsXktW45k2mSI6nb3iGK3ecjGGhhxm9ckb+8o7w6NI0/XZfQcxUEk7N86c47h6FInNNzGMZv4dHvX7OSZbjORwHQA1OnmDd4CF/QXRiq//DXqixKWwhB1OsF/T3PNYah8gDDTHar86gh2YzhaW2BofA1ve7o4PxfIswgvywzto6o/mZpvjiNHToaR+KQD/8Wkwb7dn5ZloMfzXkQVmR4fMCSUw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5fdde0-16a5-4c03-6ad6-08dd34284a80
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 23:16:21.1999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXsym7dZPhXcppSK5T0t/y7H/dIN2l9EJokc3a4mrB47bLsTd7k00HG1H4B854+/stG9nRlGjAlrCqf/z6Lyk797ivZZrT5CWC/YWyhqeNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6848
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_09,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501130183
X-Proofpoint-ORIG-GUID: jlr-OiZ1pGuHKp0ZpcsobwBV2IavTP0L
X-Proofpoint-GUID: jlr-OiZ1pGuHKp0ZpcsobwBV2IavTP0L
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

Right now the only means by which we can write-protect a range using the
reverse mapping is via folio_mkclean().

However this is not always the appropriate means of doing so, specifically
in the case of the framebuffer deferred I/O logic (fb_defio enabled by
CONFIG_FB_DEFERRED_IO). There, kernel pages are mapped read-only and
write-protect faults used to batch up I/O operations.

Each time the deferred work is done, folio_mkclean() is used to mark the
framebuffer page as having had I/O performed on it. However doing so
requires the kernel page (perhaps allocated via vmalloc()) to have its
page->mapping, index fields set so the rmap can find everything that maps
it in order to write-protect.

This is problematic as firstly, these fields should not be set for
kernel-allocated memory, and secondly these are not folios (it's not user
memory) and page->index, mapping fields are now deprecated and soon to be
removed.

The implementers cannot be blamed for having used this however, as there is
simply no other way of performing this operation correctly.

This series fixes this - we provide the mapping_wrprotect_page() function
to allow the reverse mapping to be used to look up mappings from the page
cache object (i.e. its address_space pointer) at a specific offset.

The fb_defio logic already stores this offset, and can simply be expanded
to keep track of the page cache object, so the change then becomes
straight-forward.

This series should have no functional change.

*** REVIEWERS NOTES: ***

I do not have any hardware that uses fb_defio, so I'm asking for help with
testing this series from those who do :) I have tested the mm side of this,
and done a quick compile smoke test of the fb_defio side but this _very
much_ requires testing on actual hardware to ensure everything behaves as
expected.

This is based on Andrew's tree [0] in the mm-unstable branch - I was
thinking it'd be best to go through the mm tree (with fb_defio maintainer
approval, of course!) as it relies upon the mm changes to work correctly.

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/

RFC v2:
* Updated Jaya Kumar's email on cc - the MAINTAINERS section is apparently incorrect.
* Corrected rmap_walk_file() comment to refer to folios as per Matthew.
* Reference folio->mapping rather than folio_mapping(folio) in rmap_walk_file()
  as per Matthew.
* Reference folio->index rather than folio_pgoff(folio) in rmap_walk_file() as
  per Matthew.
* Renamed rmap_wrprotect_file_page() to mapping_wrprotect_page() as per Matthew.
* Fixed kerneldoc and moved to implementation as per Matthew.
* Updated mapping_wrprotect_page() to take a struct page pointer as per David.
* Removed folio lock when invoking mapping_wrprotect_page() in
  fb_deferred_io_work() as per Matthew.
* Removed compound_nr() in fb_deferred_io_work() as per Matthew.

RFC v1:
https://lore.kernel.org/all/1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com/

Lorenzo Stoakes (3):
  mm: refactor rmap_walk_file() to separate out traversal logic
  mm: provide mapping_wrprotect_page() function
  fb_defio: do not use deprecated page->mapping, index fields

 drivers/video/fbdev/core/fb_defio.c |  38 ++-----
 include/linux/fb.h                  |   1 +
 include/linux/rmap.h                |   3 +
 mm/rmap.c                           | 152 +++++++++++++++++++++++-----
 4 files changed, 141 insertions(+), 53 deletions(-)

--
2.48.0
