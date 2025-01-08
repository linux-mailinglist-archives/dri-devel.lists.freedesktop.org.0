Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ECCA06193
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340C010EBFA;
	Wed,  8 Jan 2025 16:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="PSdiB9Zc";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UrTsPANr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30CD10EBFA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:19:25 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508FMj3r026596;
 Wed, 8 Jan 2025 16:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=TZu/uuSjUZ8ICVP4x5tQiNhJPu19wiRwvpNOeMnqToY=; b=
 PSdiB9ZcxXpIlzQHzQKGgkf7Fvz15jlhXcND1JXFswx6n5m/3vipieRX8apUaqex
 tjqQA3uuJK7gdullAxpKb0+HjQ270jrbkjfz6HyibnRHrjVuBn0h0eRz08nrDWZS
 OuKCZ/9xKVglLPO2q+EMaTuNxtbv4rR2LcW9cdW5rm9OBhJ+yI0VDN5ZW2f2kXeo
 ZN1bfr6KrwjykJOfZLHxG56IBywQBS7oOGoMrwLq8sest9DSRi0/3qblqeT4W1XD
 OurggX4kMYSUYTke9uXmAVJqtC970e+NYJd/lKmCRI70Hr/t5yW3CqH4ZJ20pH3g
 cxIM+3TThVqaqXm44sXlrg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xuwb76xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 16:19:14 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 508FOTvw011977; Wed, 8 Jan 2025 16:19:13 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 43xue9sh65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 16:19:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=filFXLRxUw9cuDhR0XNsfFu0rkVDW809OS2OC3EAzOHi0T/9pg81x65UfOkDoxgiSJHzlTL+fi7CAn5+osaA8rkFib7thqRKY/+71bnDPNNBkRO+S/EGcgcnJdP3r3cW+KUaxIjXCKHW7SzUZU4Co45Y0OS4zOY5FbrctBRigWmp0F2LidmIxnEPwrr89dcsN/NmjeVcnedaIQ/1SrpEBBVp5iIJ3LtSbwNyw4ZoiFW4crgy+168UVmXYHBjJ0zAzCtZzEGVe5TPHpPl4cGAbscnbnFTVREgCtbW226ouFLLeEy26AzKvtvAYPjhPi2k13rlZOu9OfeJ1IHK5exKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZu/uuSjUZ8ICVP4x5tQiNhJPu19wiRwvpNOeMnqToY=;
 b=aWq8PgBwHj2GRkMc7nscYcyZKwkhZFLYe7laZxIR2L1FUhU6KT/l3cpWl1Clok0mvfT80LFxABuzmnpthmnv2CsXYOoVBtoPvCQiOC/095Nvp2NiakviqATAENj/4fO8EdwWNwqVGXKqax7AYQBlHau6kgnCg/UlAHBVk1nn9An+dDfgLg7EG/r8MNX5tdrNBZ2MhuQbDI/AtRVBrJDrpMsQArZAEx4Na/irXvCVZbOgjGUhnn+n/93CKzdjr/U/LkxTZ6/Azbzjc66IL5FVV4tPDuFv7oMkccYaVDBw4V+BzolHUyMzuOmUkXdoAEK3PN9wEs65/n0L+RWF+7G5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZu/uuSjUZ8ICVP4x5tQiNhJPu19wiRwvpNOeMnqToY=;
 b=UrTsPANrgUMEYVTbY81uE2hqF7Jym1YfQglVSdY7lg5kUyqjfdPbwxyLSfWIh+lRPnhWMTS82gggVxwEHFY9F56Z0+ElzBcYF7YCS04WE8AVMWS3adz5Gs2nfGd+C2o4SwYSFsBqCxkTUnLcRXMJIDxRJpT+Tx3kl3nNFQsCktU=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SA6PR10MB8134.namprd10.prod.outlook.com (2603:10b6:806:443::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 16:19:07 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 16:19:07 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Date: Wed,  8 Jan 2025 16:18:42 +0000
Message-ID: <1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::11) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SA6PR10MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: b9814441-dd7c-47cb-d632-08dd30002cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r6M51isgq8+SSsiJciCfzEWBK+d61yjMUO0frPzjbB5aRjrumlBVUOUKa+CE?=
 =?us-ascii?Q?TEsBiYaBOJDLiqz+qzQgDesb9LtH5rC9r73ftsF4dwIqn4GsqXXSe+HvQv6H?=
 =?us-ascii?Q?+ycLWulBptNgUvi5F2Eri/mrssQiuLI8oSghkWmHKdhGUfQjuJ6MAt9kMRZP?=
 =?us-ascii?Q?l2P7GWu1NwuHZzPknUBJQVtgBlg8QnXmWQ2q0U2TU5J0iLi+poDuTD4DBYzI?=
 =?us-ascii?Q?AC/6j2IYY40j0BegRPJ6XtFDnD8rSZwwh11e76wo/GHBqIFZMOLQh1Vd1uwJ?=
 =?us-ascii?Q?pzFFVVDnKlsAkrGxP/VAO8ZYj2xcK0gbApis//COWJXBXDAwo5k6HHKXs2EQ?=
 =?us-ascii?Q?V5baPinkU3QBV9t6cN7ylxIeK7TCsNz5Q3I8nqgBnE5OxkHOBeDCButTQCih?=
 =?us-ascii?Q?RiEDQRrwGE67+TYWiqHfEi1JtotpizVT0hhQDQcQ56Yslaw4RPQ9/G8es895?=
 =?us-ascii?Q?DFczh8rd0dlzki8KRJxQLGupUAxqn9IxJmzgXtvapXRyTSjThBW3dIQ19b1x?=
 =?us-ascii?Q?YzwvqGA7F4nCB97argbdEgqVWck2BLkCVc2YLcUMBQQtOqJJyY9Nwyju+w9s?=
 =?us-ascii?Q?mvCpuZ3NoVJ/m2PX2Y1qoXp5z2PYYrSjLt1BaOXdJiH7waIK15Wqdim54woZ?=
 =?us-ascii?Q?J9nEsmWoztb5DGJJRCJNAjTp59yrCAtoKCJ5d8HqaKKhL4QC2op4wQ2PApoL?=
 =?us-ascii?Q?XwOzFH+gzPMRMvQp+PNqXCWS3gKXmbWG87kr0wPBfE7o33C8ruCN9k10O5vu?=
 =?us-ascii?Q?sK5h8KKGhT4kZT4zH4G+zYIZHHdSToHGWjTymO8iSq2DnsKHjBLvSzCbNGXm?=
 =?us-ascii?Q?UL1qkx9G+CtvvI3atEUqcxxEe/Jzb54rThjZgNqlPWu6TiGhlVv2FOeK+rTo?=
 =?us-ascii?Q?+v7ySXaft2JUBkXO+e0dwRPd3AA4vscmquKkNywowfPplMfRy39PxUgMEYMW?=
 =?us-ascii?Q?7Oq3Qvjp1jCCqdnc4aj0WtfuGhXjx1P4ikpnp4RpE77r283V+dKs7ANyGVMI?=
 =?us-ascii?Q?cV0EprE91jENpXwrQE67QCwaxZN07DszcwHInfknTH3XMPMrN4vrp/BmaPTK?=
 =?us-ascii?Q?QnC7MpPVkX/O2MUPhTppCfQGBLN0tIXWVF2edfyVauSb4lZ6SD0SWlufYpZz?=
 =?us-ascii?Q?ITKTIjZNsV2z8+IhcK/xnhWztGP1MahP1gaxbG7Z+WEdKdnJ5H6hjq5plo+t?=
 =?us-ascii?Q?efMryT4cDEnBYLZGdQrdKCzVPuOCDECjdd7EToUzp6JFqXpKCDIUKXtt67Bk?=
 =?us-ascii?Q?gX9YvqJkp8fRaKJqUXN2+Fg03MY/3kvk7zg4p1zAwjvGD4ahNgXbhe/ErRAc?=
 =?us-ascii?Q?iiinv7Gp3hMOvzcxuCpeSK0LeSVuGEwQOm5RkCZb2ghU60z0oZD8XgCMB16P?=
 =?us-ascii?Q?680j6UU8ArLoV8rCLx0Rm8QHST57?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bh7iueFRoytr/2fEmzAead2h4aOrKZQuOlD8QoOh2SgNE5uuJjNTRxspAzPu?=
 =?us-ascii?Q?42TCLAC1YqctH+77gU2Xasm5IbJ0lpt59iBlon8asQfrhgJGILR+xjDI5ZBA?=
 =?us-ascii?Q?rS8AZIRZ+sGWl7En26jE30tpUvMyWpT39I24nug4I/com4ZeC9mI9XYf6wDc?=
 =?us-ascii?Q?QwgXcExwE+PLp51etO5DtlgG4Ocsz137YAT7Ys8PQZte67JSAEmD7gvScYlV?=
 =?us-ascii?Q?bCnPPzmoQ1sILXKsa2b5qAOZlbT09i/+K5Yyy9dRr1ehMWzwbD+okvqtvD3e?=
 =?us-ascii?Q?USqtNFZpYSCrhM50Onq8yWGGebhUCe9Up1c53tK6hPScdrjr+UnI+lih8JMO?=
 =?us-ascii?Q?4Ce/aaDn+NYLNlWeIdZNk/s5Q/2VI8xMhqf5B/OHon/FW/TcfKFbBDMFSnYm?=
 =?us-ascii?Q?F9uulrNfltoPuQradedylNGkDkkXhaktrMg+E4VfRO3gxuS12jg+zKRB1wAj?=
 =?us-ascii?Q?sYpfwLuw0hv9iqX+1x34ho1OytNIUVUhDVCLrTWOiLyfXOPCvpzichCbvAse?=
 =?us-ascii?Q?6n9Nq5C/e8LbGc6p5kPWa6salAGHjgMopODqI8akC1XaLvlfBBMZLwgTTXN0?=
 =?us-ascii?Q?tpevMxkuI8By64ZkktGo5JKvpGoqwIOnTxWI/Gts3xW70dU/np70MfyTyKBg?=
 =?us-ascii?Q?vDmYJ5RR6nYDGQUuhCKKjkgBncKeGjItq/3GReMEvzoW3r5LrD6RxuHHzloJ?=
 =?us-ascii?Q?8VGVAkQeQEwl7xjS/5/GKuadaVVigN1/3DHmMEf39mhae6Zksz7p/vzkmNUN?=
 =?us-ascii?Q?S906bEhAzh4wPEsC0l76sw8qYAffT6B6xTmhZRCjOJPyEffJwRz76TiVFnvW?=
 =?us-ascii?Q?Vfdkj93gzUQCpM4Z2EhK4x8AnJXqqnX+2KxF+e5GEG2qxRxyYSGvGKCJAzOP?=
 =?us-ascii?Q?M9BrLkEIBPkJVql+Eh9/BUywmiL1YDsF5GLrZ4gEqva9/+llnhjEFrZwwD5Y?=
 =?us-ascii?Q?I64xnRssbjw9h59PDAAF0lL5p8FcFAPGmlcTiedEkO8OFLcfzkJZ7OrdeVEc?=
 =?us-ascii?Q?h4MxTTitOfj6tu7NRrsZ89QJ8zNz2S3uCP23MHJCC4kdeQOVaJOjrOCBDfAx?=
 =?us-ascii?Q?8CaNLi5bLTsE5Npcvm2lLiLmVRgnHC3QgtW+umM7kYaeFzx97fqjfCvn2Xmo?=
 =?us-ascii?Q?CZtXeF61008ZBI43UeHOyz43Kv/ubBYDHXlboKOXp1PDAgwQAOwnB0a6Dr1z?=
 =?us-ascii?Q?hx+iCLP1Kxt+ByLKpjJvjzOCzIYC6qF6QuxBlQDx/X60E1YwCXr4zZU/lf4W?=
 =?us-ascii?Q?kzTEY3trNlDiI/l0J2GfQDgwFdzAUB3LNfqLOCOof4tRsq3EJlWMS28U9xJ2?=
 =?us-ascii?Q?CXFDAKoOsXrMzpmOKuIbR38NMzqTxBZ62pO1ElThfirrHz+Qsia0h5LTI/cQ?=
 =?us-ascii?Q?VCQyXHgr7fJHbeNSQ1CvVhSqLbr5SX4PahoRbBWnTYcCDbgAJFRKPdxzyB01?=
 =?us-ascii?Q?5dY1lr6mRsS0pT6zfuAQxr/6bJhwAhTlTnfjYMi+YGagyG2jh1oNPY7tch/4?=
 =?us-ascii?Q?FLcPuw8iL0HbuLy0aXqZP+ms/ia7QExEm3TOtDFAgnlVVunbsdJ0BSHjUKgc?=
 =?us-ascii?Q?CVt/G+ooUjR6QRExj+GuTqUNeZfsWa59n65V3sQz6D1M1jnbMJnF4v/OBn+0?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FwaBRbP3iYacfQIeGBssGkTIpy4BcYpybhJMscNh1xuj3pex/JmgzDA3mJn4qdlJEh9mgPGV1OTNAVqhQNXtDBauajplq3xrv/eI6a8piuCLP0zuNSL7Ftr6iLtVBqsqmahVpm0dMdQiNfoVINrd8CHbrGia6MZPx5MuGdUHaSjzJtZGy8gbi7oMKy0TuQ9hkhC5gRmuJJNhRw9LyyLQQpHxV7RjlxUF64DpC9Pj2ZPU4ZR4qjVM0NSm22jcJnbpvqbieizYTQ5IAmiIvW11MxLH0Ca1sygFN5UNiL4Ow716mV688eKCOZqqr3dSrkyO5Cc/OtbWEl7J5KNzBbHvbjehg+SQakZJnfdP9B2Napx0F5S8Fii5L4KdIDUOajDqLsSwyGFVCpf7twFCzv6/k5GEJ6ujSHFqG3HJveVOcv5/tFBcyu8jjAdaphfcismWRTHeo1nrE9AOyP+xn0sIE/9/AXMH1G1OV8x9vfVl/jnpRgXuM1z5YXWLkwNlTTlhGyOX5Mcv84qTmIaIt0IFTRpuPnpgWUeBMVCzFWGaCDf6DumB9zAJ+nhZHM4dZDGvfCxM8axkhOWQNC2VFMoo0hjdkK0ks+md3miFcAJkNF0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9814441-dd7c-47cb-d632-08dd30002cb1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 16:19:07.7273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmDADrbMWwNeL1cgWrmKQTF83EgMQzX11yVmy6h1G66yGbeY4Sof6n9P1fQld3JHATAW1DHmstywIFP5kKNAB3NAYskz+TSvHFFyGToJjdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8134
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501080135
X-Proofpoint-GUID: 8pu8T_vnCHIWtyj-NsAbCUIFtiogF7hE
X-Proofpoint-ORIG-GUID: 8pu8T_vnCHIWtyj-NsAbCUIFtiogF7hE
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

With the introduction of rmap_wrprotect_file_page() there is no need to use
folio_mkclean() in order to write-protect mappings of frame buffer pages,
and therefore no need to inappropriately set kernel-allocated page->index,
mapping fields to permit this operation.

Instead, store the pointer to the page cache object for the mapped driver
in the fb_deferred_io object, and use the already stored page offset from
the pageref object to look up mappings in order to write-protect them.

This is justified, as for the page objects to store a mapping pointer at
the point of assignment of pages, they must all reference the same
underlying address_space object. Since the life time of the pagerefs is
also the lifetime of the fb_deferred_io object, storing the pointer here
makes snese.

This eliminates the need for all of the logic around setting and
maintaining page->index,mapping which we remove.

This eliminates the use of folio_mkclean() entirely but otherwise should
have no functional change.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 drivers/video/fbdev/core/fb_defio.c | 34 ++++++++++-------------------
 include/linux/fb.h                  |  1 +
 2 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 65363df8e81b..186ff902da5f 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -69,14 +69,6 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_lookup(struct fb_in
 	return pageref;
 }
 
-static void fb_deferred_io_pageref_clear(struct fb_deferred_io_pageref *pageref)
-{
-	struct page *page = pageref->page;
-
-	if (page)
-		page->mapping = NULL;
-}
-
 static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info *info,
 								 unsigned long offset,
 								 struct page *page)
@@ -140,13 +132,10 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 	if (!page)
 		return VM_FAULT_SIGBUS;
 
-	if (vmf->vma->vm_file)
-		page->mapping = vmf->vma->vm_file->f_mapping;
-	else
+	if (!vmf->vma->vm_file)
 		printk(KERN_ERR "no mapping available\n");
 
-	BUG_ON(!page->mapping);
-	page->index = vmf->pgoff; /* for folio_mkclean() */
+	BUG_ON(!info->fbdefio->mapping);
 
 	vmf->page = page;
 	return 0;
@@ -194,9 +183,9 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
 
 	/*
 	 * We want the page to remain locked from ->page_mkwrite until
-	 * the PTE is marked dirty to avoid folio_mkclean() being called
-	 * before the PTE is updated, which would leave the page ignored
-	 * by defio.
+	 * the PTE is marked dirty to avoid rmap_wrprotect_file_page()
+	 * being called before the PTE is updated, which would leave
+	 * the page ignored by defio.
 	 * Do this by locking the page here and informing the caller
 	 * about it with VM_FAULT_LOCKED.
 	 */
@@ -280,7 +269,10 @@ static void fb_deferred_io_work(struct work_struct *work)
 		struct folio *folio = page_folio(pageref->page);
 
 		folio_lock(folio);
-		folio_mkclean(folio);
+		rmap_wrprotect_file_page(fbdefio->mapping,
+					 pageref->offset >> PAGE_SHIFT,
+					 compound_nr(pageref->page),
+					 page_to_pfn(pageref->page));
 		folio_unlock(folio);
 	}
 
@@ -337,6 +329,7 @@ void fb_deferred_io_open(struct fb_info *info,
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 
+	fbdefio->mapping = file->f_mapping;
 	file->f_mapping->a_ops = &fb_deferred_io_aops;
 	fbdefio->open_count++;
 }
@@ -344,13 +337,7 @@ EXPORT_SYMBOL_GPL(fb_deferred_io_open);
 
 static void fb_deferred_io_lastclose(struct fb_info *info)
 {
-	unsigned long i;
-
 	flush_delayed_work(&info->deferred_work);
-
-	/* clear out the mapping that we setup */
-	for (i = 0; i < info->npagerefs; ++i)
-		fb_deferred_io_pageref_clear(&info->pagerefs[i]);
 }
 
 void fb_deferred_io_release(struct fb_info *info)
@@ -370,5 +357,6 @@ void fb_deferred_io_cleanup(struct fb_info *info)
 
 	kvfree(info->pagerefs);
 	mutex_destroy(&fbdefio->lock);
+	fbdefio->mapping = NULL;
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 5ba187e08cf7..cd653862ab99 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -225,6 +225,7 @@ struct fb_deferred_io {
 	int open_count; /* number of opened files; protected by fb_info lock */
 	struct mutex lock; /* mutex that protects the pageref list */
 	struct list_head pagereflist; /* list of pagerefs for touched pages */
+	struct address_space *mapping; /* page cache object for fb device */
 	/* callback */
 	struct page *(*get_page)(struct fb_info *info, unsigned long offset);
 	void (*deferred_io)(struct fb_info *info, struct list_head *pagelist);
-- 
2.47.1

