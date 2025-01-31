Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57149A2417F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 18:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB66410E42A;
	Fri, 31 Jan 2025 17:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="U1yB7kLk";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I4HQRC04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B284010E41E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 17:04:19 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VGuxYG024554;
 Fri, 31 Jan 2025 17:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=qAOD86tnHi193L+dBl
 29I6iQ5hwv5WofSUZYpoE+GKA=; b=U1yB7kLkiQv7T7zdkPYqdv+vpy43n3gIYS
 3F0NgpL3zHR6lBk2b8XsdII54VM+CMwH9RsUmF+fVnDiWZ3JfIFji2XA8hieCbfT
 vnoV3uqfyn9CyGWUr5vW7RlYKb6U3VhON8/nn7FGbpanjrrGUk4Qedlv9uU7/upT
 e3Zc2VsCkexhRbZ5J4rD3qWttPEwA4rf2TJuunHc9l6zhGqp1w+Al+P90Yct+Che
 UINRbznf8t6AdQqlldqNEfFsPpxR83ggfPMwEhHf6UWn3xaGxr3goKN+lT/7DCE5
 qUpDtLa+lYAEb6SvIuaJnnuOsHH/KiPznOqmnm/biG/7ZUcoJ0TQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h2g100j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2025 17:03:34 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50VGjtWr016719; Fri, 31 Jan 2025 17:03:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44ggvkht4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2025 17:03:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJThGRgfZW2Wxe+0L8OoKQ5Z7KlZqQ4rFkCcqBysHuQsuPwrYaINtd+IEF0n5Wx/9hhAUp2CHOIVxdq5oD+oDweNkaeI9WpzXaRPhouZrBvepQZlKV1BkAbpc8yOvIaPC/ruQn6QzM/7HbmnvpC6DMyGHw5BjuRxOAX/JUXynY0xb5xIAPZzYzFU7NHjBj3LJTjjXxReveCULJPcHQH58kKiD/j/ux+QGDT+pLrCwA1Ly43wHafCsjbZct4FjeGvzW2mYxS+HtekpkZf1XyOTRZynFPIZYlic6uH6YRmbGDIfE1SdE2iNnpzoQMul0l5/VlsQcl6HGFEFC9FMoAkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAOD86tnHi193L+dBl29I6iQ5hwv5WofSUZYpoE+GKA=;
 b=O31hu7ngFx+rhjZ65T14fft95PaE6HHXddjzUFIw5VdiJd7NxUOdnM5szW8Yz+SUZonQRlBUdTQJabdETOuwpLiesRPUukXXvzpzYBybPyiLhkgpXUc1CAki6NDgxUsZ1uLus6sniBW+95VM4f5plEHDM1OApBMB1dSbb7VT8WyjJxKWdRpKBt5H3cZTpg6qZOKOqgyAGl+lR17DtWTap5AevpPod7tpC4E6od3OUA5thUYpylmeTmlXbeMBAvJn6loUL8EFeAduLERl2wzcx6DOvyiMfbSB08moKl7LpVd0Myf6Pr2jrWfPDWEW8LhNJWmd7qFmMpmeuN+7xw72Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAOD86tnHi193L+dBl29I6iQ5hwv5WofSUZYpoE+GKA=;
 b=I4HQRC04qykRtstvlTbwEglCzRTYVlbnVxVJQMkgWTqsW052O8NeguPzETu+oEvg5PiaxFqdarZlzBQb1wmzitvw83V27tH1Vz83gJEHy8gPhTh6YEfil0ALlOPf4VkfdraZYAmfZVW73zOCSOEnmqnVgRAJp7FU1kyA6/PnUTo=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA0PR10MB6890.namprd10.prod.outlook.com (2603:10b6:208:432::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Fri, 31 Jan
 2025 17:03:29 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 17:03:29 +0000
Date: Fri, 31 Jan 2025 17:03:25 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>, Kajtar Zsolt <soci@c64.rulez.org>
Subject: Re: [RFC PATCH v2 0/3] expose mapping wrprotect, fix fb_defio use
Message-ID: <091e47e4-1d8b-4b9c-8e1c-2f748c3bff8a@lucifer.local>
References: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO2P123CA0101.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::16) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA0PR10MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0da286-452d-457d-c756-08dd42192f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XhInTVqOLT/Zj58qeUnqpD1wtpnrUDF/R93cT/GcjgCbQ0hweUum50d/cUT2?=
 =?us-ascii?Q?sT2xGEId+JNvzznoUpxgnUovxQyQvLnH2GgMr1OTJFwL/jxU65RRMzf+nVRd?=
 =?us-ascii?Q?AtugsMxp05RrK++UouyXfHXYxSgMwyvzydxuSckc+jQQsw14PjkZaR+USRme?=
 =?us-ascii?Q?qMPcIHUb5M9IbRxUZrZoX8c6ft7LHKc4RTHkqGSXOUoaYxGk+naV7nMi56j3?=
 =?us-ascii?Q?eKoSRvJY/aPHi2WMVPf9KGZ+JaaXM4oLA/sidHDUrg2pTjrbPt0NA9Zep9Ya?=
 =?us-ascii?Q?8JPOiWmK3W7Aqh2bINFVr4xDUMAIXQq+9rQX3RakrZosIdeS87YA7kPv84jd?=
 =?us-ascii?Q?1+vQN6qodLX8FUMQUSnpebl9rz4R7L46QOigvcR0jEE5HQp+hf6CjfH5MFy5?=
 =?us-ascii?Q?ytWJghvah9NqopMyYTow2Y/cBp7fYP9jxhEo1sTWdoKUFIvBS8WAe5crNRoG?=
 =?us-ascii?Q?IfAa/04uCyejKnI/tVQge1JJTdKuCH10CL+6Kx2u5BnFDdOBrjtBLyWYLqZa?=
 =?us-ascii?Q?1uFmr3nPMTdrYqwllVjHrmScf984KpjISq6b5txoeB9YmbANN/jfNEqaTMhC?=
 =?us-ascii?Q?A8Q/of4GGW+gyHbrMF7U/euNZ89wVpkew2A9BQhxQeexaDtLpyHnjx7J5Z4H?=
 =?us-ascii?Q?9fEPhPRU90NGplNs39eQM3InAjgi7Fm97mNuL4/D+7c2XwXabuodA7v9HmYA?=
 =?us-ascii?Q?QPBUGMIQKkYxH2t/hJP7cJYc5njnILUR+6mVI7WOe+YFvO86bsIpyW37qyCf?=
 =?us-ascii?Q?tl+893pvJFvD5FOIio6K9ZMWBoaYe8Vgz746JjSpjVtOJkmXCRM97yakDqdK?=
 =?us-ascii?Q?Ct/1dmrQY/nTk+WVzbJ9D+kyuAaOWll8sAA6uEMlBztDmFqGGWspV5LI9VdK?=
 =?us-ascii?Q?026Vz/YUP1jxIq3v4DeI3Ip2UqG/Z3HYbVGf+9bC3hdRYqJaCssSMsTLIRom?=
 =?us-ascii?Q?zKfvRlhRJj7Hbq4jk1nOLu4JBPyUKPXBlHeU59AzeTESaRGHn9KmVGZR775k?=
 =?us-ascii?Q?89nupJMGzJEQ2pM9zI2YYKclhHzx25ty3a7tqYxfU9vOpQLDAoGrQjAcs+oa?=
 =?us-ascii?Q?piprFYFAAy8XPG/iihqz9O3Lip98dJUUoAjVumLiIjN4mO4+W5mCd6i/FVvZ?=
 =?us-ascii?Q?nP09DNyc4Y3xc0VafPOW9eXCJTz9rvgvwB2auSw6Mq+1VqPckju0PuHeiITw?=
 =?us-ascii?Q?SI6vwOrbcBMBlDI5+4lTzxrDDse6f8ArfS4g3lhWzEnLGwQ4eJ4gPBtkOeiK?=
 =?us-ascii?Q?NM/x+KUSntPHEjan08IbWItTaBNJm7ndR35ApFoqHwW0Zx+EP5TydD9TtzMQ?=
 =?us-ascii?Q?To1Ka6goGORcdROv6Uzs4UA3WJ3ohSIxRAhtRXt9tydg0N/nSnGXM4ZrBeDo?=
 =?us-ascii?Q?y+KNgw/buiQxe6zfMewHJss0y70IhaYGWL2wQsJemd9wVaTbfw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+CLeOn85e9pMyrhFhjlUDibMczlaPC32IGAiMeurDpvvKiGub4bTZtS6PtBd?=
 =?us-ascii?Q?74mjQKhYCjcE9/stRhMpkbWZE6GnR4pz3O1uYg6afIXzkWtrWXvqDe8WlnrE?=
 =?us-ascii?Q?jO85LiMcKPWo8RA1CY/WaiM1iG3V8jub23CSeyND0CAJ2e0fb4pSptNmNHzk?=
 =?us-ascii?Q?JkPZptj10K2aXpXn885srheRjFqwCl/CmgtSgbMgj3whKWAjZYMoynAskoIp?=
 =?us-ascii?Q?gL3qjEcE+vxiXQJFMKiUBqbfB9LJTfHzB3Q+62INgK35oViSZzX4768MmUe3?=
 =?us-ascii?Q?8Zetvr3zwVPGsr0ISMB5URsStpyc52zD1J9W7xQG/s2JOGqdU+rm6jC+S6/X?=
 =?us-ascii?Q?EPouGG7BqnZGTCwPE4bz1+WhKKoJPKW/6P3mh1QZJNbCvxfj6/yL7XYJFe7/?=
 =?us-ascii?Q?xwE+crEArBwGcJiN/qgajq3RtnmbAkv8GXFpqi/2hR1LU0wZetv71nsjZoCl?=
 =?us-ascii?Q?OX+jcJQnMFdM9XnNirBLqStAGvn6son+LzwGQntCZNdVnGXrc/7LPkCgL2Di?=
 =?us-ascii?Q?vD4q4TrBsMnXp05UOYg63BZ7gAtRVwaWJyKOPInn1lUyY/jb9mo2fSMqNd4W?=
 =?us-ascii?Q?txUeUYK6BWz1s7Dg83ZacsbmH+tKhSjs3/897MnYmarRhMDPhCh2EbVM2aUO?=
 =?us-ascii?Q?DfqCPLLJ4+MB2AWcEtfZgQa1Ekh7+/8pq3ydwNEeMTlMzuEUE5IARvEXShIO?=
 =?us-ascii?Q?Vy13oy2+5J7HsFcWNlNNjgbVSsGEb1tA9DYuyPwfycTUk5EPLZ+kcP/wBedJ?=
 =?us-ascii?Q?cqlGEO/c1PPHZJUUOhKm9oLDdGcc1fJqBVaLuRobLThER4Rxv27sFuTJwOOE?=
 =?us-ascii?Q?u1luwWBTs9d3t9vH9z6eaMW7yqY6bK3xFiRANBjd+IIDKlDFqz+pw1JkexAy?=
 =?us-ascii?Q?qYZHva0TQIG+DgskHMFD5SshL2MmSb0q6PlOn7Q9kw7Kqa/HeouxQ8jw3e4+?=
 =?us-ascii?Q?zXjY1pLujHDuaxxUdoYmAR/HayCmTBj0fJTKs+xc3MDppgGYfHq4gCVw8juG?=
 =?us-ascii?Q?Xg+yIYpVaKDpMDM0xPTYeDAQC4AdX42RPbAAA6WfNOoWtZH2dZ+P4HCKGJKK?=
 =?us-ascii?Q?DSXCwNcfIihDp1FrHGqGC2xsOqOjOIAE6CPt40ous+R5Yz5qYUnpFTvOgB19?=
 =?us-ascii?Q?YPh5C1X/LR7hoPmythfwq28/e2d/hovVK40TcBNYzY7F5N/QJhd37mpJmGe4?=
 =?us-ascii?Q?77hO+i1TAXeTj4GN9FDLwljl3mpOEhtHFP2++Mn71s/s9nO4UXvH3ACa0Dw2?=
 =?us-ascii?Q?niC6BaEqlJEdhJUzdqX86M5ps7GVCC5LMP8AugsTp9dFNld3dJ8f2AkMMwOg?=
 =?us-ascii?Q?YTnQuULXszZ6UKMtpN7NyBE4esTx2DS6FXzP48XKeLjepCnpQi2EleFB4wEQ?=
 =?us-ascii?Q?8GG9QpIC6BT8NT56Jj0l4m1I4hoxUFiPOTqzDfr2dGWp0g1yPr+mggPaTk14?=
 =?us-ascii?Q?Y4ShnA14DoONJ5HtWrcDcuQFXrmEj7Kh73LkvIR/dQnDGBmtiFMEmnVua65Q?=
 =?us-ascii?Q?3VXnQHVL1nR8KczQ23eGK2gNir4CatRODR/qk48y9wgfeil+n+LGzsaS3aSw?=
 =?us-ascii?Q?fcFvY8Bwkb0So9XmqZdOJUoabhEQWB7JyNfaFlK7JEWllWDkbfhEYMb2LYGK?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: n0DYRP1liorIJ6iCo8XoFL3vEvmTeZ0viL7DPeiBPryrtlaQdba+R5k9YSkfdQCoQHMWBZZfJ/9JRkfJyVk92XTrBDl6dYxL2MuUxGsc5+tiqf1Nj5UNfEA8nyYn6nEsfPlP2kQa5Gd6FZ2E0Zs8KT8K0EC2U4H9P131vRZbUymzFb+sq9gxswx/LkYfZkJ0ZVpiKFHTerowxw+Z31+6v6Qk5sPB3Juz9rlmKzZAookNQzGmvybz5R4d6aBz4pKetABvu9XQa37WodTXLhmbKf1V8VujP/yiq9HZtbtWNt8x4vTWHVYBChrr9MlbsQpGBdT2lMfRijWjlI47Cu6BpFSwYsL9Y2WWz/RVeBZc8OtsqQB2hKwI1mZHUU5plr+JuYBWPjgUFbzd3swNmCYotF50LYcisJZlz09jyalM0+dPFPnTcUzIp180+f56VbTCspsKlZh82yJqHXDov3wLQ45IXZWq5lW4eh/Cnm4BgvlkaYmiOrBJHqxJ9z2sxvPePW5n6X20H4Wi2XXWK5S2V6neosbOWsy3TlHizctj7YyIvjDg+XuSj9PktGtTxTiqRrKIjvauKgRvUTok7kUoSiAC+AjanAHuNjpL9wWQN8E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0da286-452d-457d-c756-08dd42192f3e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 17:03:29.7053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqSKVCFhpfTcz8FkeFBpIv/8ZVjTZNCPbvxxaaG8/WC2MtIxvUur2OQs1TPNa4Fm2jqGuGC8bmAmq9p1IfwaEZggQr0+k0reFlpd8Id9hqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6890
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310130
X-Proofpoint-ORIG-GUID: Tdg-GItNqRNTzjZh6lsPyf_3ZB98oJSh
X-Proofpoint-GUID: Tdg-GItNqRNTzjZh6lsPyf_3ZB98oJSh
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

+cc Kajtar, who has kindly smoke tested this series on real hardware and
confirmed things are working ostensibly the same as before.

On this basis I will be un-RFC'ing this and, if Kajtar can reply to
confirm, will add a Tested-by tag to patch 3/3.

Again to emphasise - there is some urgency here - as struct page fields
that defio relies upon prior to this series are being removed
non-optionally.

Thanks, Lorenzo


On Mon, Jan 13, 2025 at 11:15:45PM +0000, Lorenzo Stoakes wrote:
> Right now the only means by which we can write-protect a range using the
> reverse mapping is via folio_mkclean().
>
> However this is not always the appropriate means of doing so, specifically
> in the case of the framebuffer deferred I/O logic (fb_defio enabled by
> CONFIG_FB_DEFERRED_IO). There, kernel pages are mapped read-only and
> write-protect faults used to batch up I/O operations.
>
> Each time the deferred work is done, folio_mkclean() is used to mark the
> framebuffer page as having had I/O performed on it. However doing so
> requires the kernel page (perhaps allocated via vmalloc()) to have its
> page->mapping, index fields set so the rmap can find everything that maps
> it in order to write-protect.
>
> This is problematic as firstly, these fields should not be set for
> kernel-allocated memory, and secondly these are not folios (it's not user
> memory) and page->index, mapping fields are now deprecated and soon to be
> removed.
>
> The implementers cannot be blamed for having used this however, as there is
> simply no other way of performing this operation correctly.
>
> This series fixes this - we provide the mapping_wrprotect_page() function
> to allow the reverse mapping to be used to look up mappings from the page
> cache object (i.e. its address_space pointer) at a specific offset.
>
> The fb_defio logic already stores this offset, and can simply be expanded
> to keep track of the page cache object, so the change then becomes
> straight-forward.
>
> This series should have no functional change.
>
> *** REVIEWERS NOTES: ***
>
> I do not have any hardware that uses fb_defio, so I'm asking for help with
> testing this series from those who do :) I have tested the mm side of this,
> and done a quick compile smoke test of the fb_defio side but this _very
> much_ requires testing on actual hardware to ensure everything behaves as
> expected.
>
> This is based on Andrew's tree [0] in the mm-unstable branch - I was
> thinking it'd be best to go through the mm tree (with fb_defio maintainer
> approval, of course!) as it relies upon the mm changes to work correctly.
>
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/
>
> RFC v2:
> * Updated Jaya Kumar's email on cc - the MAINTAINERS section is apparently incorrect.
> * Corrected rmap_walk_file() comment to refer to folios as per Matthew.
> * Reference folio->mapping rather than folio_mapping(folio) in rmap_walk_file()
>   as per Matthew.
> * Reference folio->index rather than folio_pgoff(folio) in rmap_walk_file() as
>   per Matthew.
> * Renamed rmap_wrprotect_file_page() to mapping_wrprotect_page() as per Matthew.
> * Fixed kerneldoc and moved to implementation as per Matthew.
> * Updated mapping_wrprotect_page() to take a struct page pointer as per David.
> * Removed folio lock when invoking mapping_wrprotect_page() in
>   fb_deferred_io_work() as per Matthew.
> * Removed compound_nr() in fb_deferred_io_work() as per Matthew.
>
> RFC v1:
> https://lore.kernel.org/all/1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com/
>
> Lorenzo Stoakes (3):
>   mm: refactor rmap_walk_file() to separate out traversal logic
>   mm: provide mapping_wrprotect_page() function
>   fb_defio: do not use deprecated page->mapping, index fields
>
>  drivers/video/fbdev/core/fb_defio.c |  38 ++-----
>  include/linux/fb.h                  |   1 +
>  include/linux/rmap.h                |   3 +
>  mm/rmap.c                           | 152 +++++++++++++++++++++++-----
>  4 files changed, 141 insertions(+), 53 deletions(-)
>
> --
> 2.48.0
