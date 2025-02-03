Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2CCA25FFD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 17:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0216910E501;
	Mon,  3 Feb 2025 16:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="ZjdsGT7L";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iLUbgoQT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE8410E501
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 16:30:34 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513ECA6m031626;
 Mon, 3 Feb 2025 16:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=lr2cg0So7Aa6IY7vA9
 XRpYnd8q7SKI5q38FG8h4JnFs=; b=ZjdsGT7LTZ4VRfRJOI9NywB2SJ6huBYAI4
 5k1sgKSsfLwWc/PeA5JXdFCe/uU1zob9RFSXlZOwi3cuhUFHkUIQYBhPNOa8lX8i
 tB8d5A040d/wwA0YMqOyswzgfAINS4yJIyNjVzfJ8hiTptUkt8UbA01WGyrg29n5
 caTzCDxY7F+PGdY0o47JTxyniG/phy9d6DfJXiJyx6DI5lkPnblSuaIqHIaO1j5/
 sqIgcwQPNe+mnU7VnKGOEQ21igSA/Ql3URIXpoY0vACJt/tzqJLZyZ5mbfsVlQtg
 6MhL64na7jRGKh2Z2o0Eyzscf/JqiR4XKymSjIfvXcMoxz0pBzYA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hfy830fd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Feb 2025 16:30:10 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 513FmWFX038900; Mon, 3 Feb 2025 16:30:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44j8e6kfbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Feb 2025 16:30:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQ7NX0xwhsOS+BRD7RM93eaPMcyjlv+MDLr/8rpjh4ZnwwBm4lzwFgtGoo6bkBk45+l20ezFGJzig7ldBwfU4mbA1CcpLfd+YjNgiQxoCg1v0oNN0e9fJjkaaMjwqzWspsFN6RiqyLO7bAJArD0kw+lghbJUm1KEt157ug0eOKyh61rwRUVGj3WkfGtyJGo/U5LUVbAUEY0x6MW4DX4iQ/qhiSVk+IFh7vrwxVkmwCvvHCvdM7FwJwVrq+2voIWTMxkd3ex+SEsJvL/CjwxO2DCpRedVEVlWv2/O1Akk4XQh5xrPEKd33IUTFbXOBwm1Gfp4UvJUjKlKkuXolV2plA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lr2cg0So7Aa6IY7vA9XRpYnd8q7SKI5q38FG8h4JnFs=;
 b=yA2s77en6tqzqP6nRyICyYbv9QjeSwBg+GTMLRrtQy6GyWoPyfQJSrQ4GL0wX1XS5qD4kJ4CtVlFtRlyepbuCMWPDk25DfrALRhVvnAQpsjW3WPeNE68vWTHfseTbnJuFI/5AqzRQu3xlY14ViwQ286Qt+pc9sW0S+VZdjbMCoTmSyqQL3xsNR4bC5NnECrDg2kyefztunmL7DB1bnBsfBNaPNNu/h2AMqfeRUlQdfCuPRJejre8Ew8Gv1pCIus44wOLejXM04jgyP7296MUxRIMzsL3hdDdH+xCsJ0ptW5ZFB4Iq2u4ujrm0vu/OYNLtO08dQS4/1gT/cQTtvO+Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr2cg0So7Aa6IY7vA9XRpYnd8q7SKI5q38FG8h4JnFs=;
 b=iLUbgoQTM13rPFiSyo/ooNo2QyEFo2d7STln8bqrDBCDfnPzD0M7ZDsGC5Z8NthDXsyeEzVrAKgQr4gbPA+aEJEPo4/lMJduAp3nZM6YhG+kGBtnDyl9fpUIKLBzo0HxFzm/fpIVLPzwUuzJg7urN8aV/yaBRNrRzk/TnkNtfmg=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS7PR10MB4959.namprd10.prod.outlook.com (2603:10b6:5:3a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 16:30:07 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 16:30:07 +0000
Date: Mon, 3 Feb 2025 16:30:04 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Kajtar Zsolt <soci@c64.rulez.org>, Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH 2/3] mm: provide mapping_wrprotect_page() function
Message-ID: <655f318b-d883-4ddd-9301-53a05ab06bc0@lucifer.local>
References: <cover.1738347308.git.lorenzo.stoakes@oracle.com>
 <c802c17cdba59e3455f3d7db07659d5da0ed6dc1.1738347308.git.lorenzo.stoakes@oracle.com>
 <Z6DljlvHpjdFof42@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6DljlvHpjdFof42@phenom.ffwll.local>
X-ClientProxiedBy: LO2P265CA0492.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::17) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS7PR10MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: 56127ba9-f391-44a0-32c4-08dd44700511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MOmR5D1E67A/r2gAC0MVMXGsoMNpQP+4T20PwlhFF62ZFaVXeImcbp1CyyPF?=
 =?us-ascii?Q?+LmO2j4PLZXnyI/xxVF3yVVCls/w0nJ9kQYLDgVLcQVvG6UQc6M1MJflUtYU?=
 =?us-ascii?Q?rc9BLYFz5OxOr9AM1Ytok1z98FEA/Lt1D/D6jUw+rFVacO0wkPYHxDRWYiKS?=
 =?us-ascii?Q?kSdz7zpvHsYfbEm58sc4TIr9hofDDTqMe7u66LEhTD+ruZRwxguppokDsqg9?=
 =?us-ascii?Q?d/HkhidctR+W4NMtTgyjAyzw8asFvB7M4a2hE7Lti73xzhWwtFDBrVFe20x4?=
 =?us-ascii?Q?lJUvr08u9rrPi6ma2jaI6UB+IZDCScueZpHptgVGpBQ/A1R9QMtht30Wa9jP?=
 =?us-ascii?Q?X+nQ9pw0X2ydRj8qHG1gcZZROHDb9+UxvbDMXLWs6ZcuqnLSwg00n2dAsmc3?=
 =?us-ascii?Q?FXsJCBMAzNRmxMm2SN0kaXIQGIH/YP0aM59Yjh7NVKYoRG/6fqMJcDn+eCt5?=
 =?us-ascii?Q?i13HcN4SDQpPMscYNu58C96YYB98zV3uWmBFEUIqr48YoyBiPPcfcJCTnm+e?=
 =?us-ascii?Q?XIIPdIMHK1U3/jipa8tdnv9wwudUCVfc/1uWJlm5Wpv2RaT7p//MiwRcRs/8?=
 =?us-ascii?Q?smAYdfUnsSVr5x0ZUPsiZnT6U6XW+ICDoVrxnQeseDDFG4RzSc7dzyt2Q5fl?=
 =?us-ascii?Q?rpo8v5pJCbnuSEQ5/FAViw7AHUyCwlMc0XgNNiF9QxQ9NZ9gUUMB1rEadg4I?=
 =?us-ascii?Q?0DbaN3zrc1K34aNLuGk3qvmw+LCnKbytrSPXpOKe55PUdA21y2WuPTO0Dbxu?=
 =?us-ascii?Q?xlgnfbMYrfMorR5a2NYrkXVWbN56dw2Zvg2o73viwDNC9nvFY3xj/HYYW80D?=
 =?us-ascii?Q?XoZfX4uW2JtMnz6BqFPNzrkgXyV9iqHhDtxCfbmGr0heB42ry7NkLSE+gF8E?=
 =?us-ascii?Q?whF3ZzCipW1q6f8GAkGe14AqpARzIZUBVxQeEHVa/eYl7Xhspxbkk6ueG4vJ?=
 =?us-ascii?Q?lC33d7a1mHivNM+isZLrp5U85bjXtAam1nciJR16ChPwP+D7QyefY4cbIbAT?=
 =?us-ascii?Q?vtlbL0c5skXOFXbws0tk5hfY8WiqQWoslSLe67G3qbhOZuAJ8yP/GPy2mDcA?=
 =?us-ascii?Q?GAr9hPtuCV36eQu/slaKAqxpR+QQzYzIoAFpqWjJGIpK0gukqq4jnMcciqA6?=
 =?us-ascii?Q?O50jrRz/+ooXrRP8aTMivk/jYyUwNcA96LPDAwM5cMHnIjPQNWA45xdwPszN?=
 =?us-ascii?Q?BeqsB18dLU1In9A8AFXHRy2gVF2vWGAJK/02xi4ldUaBMQS1RLyulsBfWDA2?=
 =?us-ascii?Q?MQgzq735PK+g9TMGun1QSoKDOEkD8FJD5i0IzQr9qEYh1KQ7t0bnzuo8oHBZ?=
 =?us-ascii?Q?Sncb5r+18q06K+ZO3ebvkDr1XTHb/gaUutV6DuADS0yn9IDP8kKotuJJIxm2?=
 =?us-ascii?Q?C6+XPhlrsYBhSk0fqWi1ISaICcS0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p2sYz37rtWv+RYEi+K3o39Yu6ul8c0M5n1kdpKpCxl3eq8Z9mBs2NmFFqOkB?=
 =?us-ascii?Q?DZpj7i83AZ+7tY0xdye5dMYkagHyHV8HpTMu29uFqD7GoygEtbxtvCd2S/CF?=
 =?us-ascii?Q?d18BeewKKMBcX9FjWMbdJKIHMmqSGaRsneJlwyRAVpMe0MXuJIFAL4LF4HGx?=
 =?us-ascii?Q?kReEymYKdK0I+uOP5iQ6qFKPH4GEGWhMip4sXTuNaFxHqZG62xtq1sK6jxDm?=
 =?us-ascii?Q?CN0YK7hY+Yjo2byJguRXhOubRNoQhWGAMsRlX3Auk6p3pasD3fVYH0dcDapf?=
 =?us-ascii?Q?R4xpSE/fSNFKvmmzJyjcnayfWEAAuDieJds8GW/bh8EsgsBrSr7SAe635X1V?=
 =?us-ascii?Q?KnsGNsso3PS8q8no8eDl9GHgGpjp0IwNnQ3V7yDaT2nivFfpM5rOUvdqolI2?=
 =?us-ascii?Q?bJ4xeGpJFCKFM9RCtTRKOGDnQ6iUKKHgJn8/fLu2Eo4YbbdY0fXN4B0uatmP?=
 =?us-ascii?Q?o34HVZgDOSWmmI/OPyyYBy62h1lEF6bB2TiN1i796ZfmLQRlF9DM+eNT3mvv?=
 =?us-ascii?Q?XeiDnBSMt4RaQ54KoLzXFlj5KQo7P/x1PSCdXYOth7S+Ynk7+IsHtp/R8KrB?=
 =?us-ascii?Q?vLVNBdpTRVHySpnxKuKF7+mq0s7ivefFoIyRA/MO0QR1lNHmYF/5nGIJqph0?=
 =?us-ascii?Q?lafnUvXnODJsTKmk4PkwWVww/bJktqNRandMmD6L/mO+5G2ABXYDyxvZfip+?=
 =?us-ascii?Q?gb5hqNncecuMaJQSOQ7wilTUZdelItiBfZK+5q185FAjkML0r+Ps/GB6NHXT?=
 =?us-ascii?Q?l4WWy26FikAtyUPkM/y9PAlpCS8Lp1RipR45msj+pPq64gdS5BoXBne78T1D?=
 =?us-ascii?Q?7WQStv7m+MZHJezWPM5DGPL8hCFdfeDN4YwDqOu93c5rwQVthBfy4edOQAYt?=
 =?us-ascii?Q?vdaEe5t8nURLo/jZgVKt1TWvjRSmIoNPFjBB1B6buWhWfW1AMs+UWSfB8bGh?=
 =?us-ascii?Q?AW9yvTfgbso3Tc/4HSGd4kfjfSUPng2ryJisFK0JnJVfzeq42uht4Nt4ZrNf?=
 =?us-ascii?Q?cCchn9a66Xv+i72Wah/0grx+pybPyi85md0vR0ZBc3JRNgywfT2G7+EisWeL?=
 =?us-ascii?Q?PGmvDZ1UpDZt0FNQCxtk3x4n9BLZ4EzpjK3LdsFGhwx1yefEx3csz76OyiY6?=
 =?us-ascii?Q?icLio8iD7pB7ZRX1gQjuWeKWBVoCUnrQNKhM+SqeC0/+iecd0H8IBQA3c7Jc?=
 =?us-ascii?Q?S+MqKewQXJ2axh31GQOLJL3myjiFfyYjUFUw+FADiqqADmaGXWkZ67U2Fpmm?=
 =?us-ascii?Q?yZWbFvH939rK6CN5jBcuuQY1u8I+dPEsXKmFTTHAEgAkCLEVq0znBQ6uuGFQ?=
 =?us-ascii?Q?c6fF2VyPViiXy7uIwmNGRNQkr809TUPh29aOL0yJ0nVIn6xWQSvkdyZCyl4B?=
 =?us-ascii?Q?FfuDIvVr74PG/rHoYQKLK5PDts2ISRRZhdz2+NBBP/3Gl6L1cRU1vXC2b25+?=
 =?us-ascii?Q?hQaOrYMPX4WI4J7JatuIT+M8SOVzMnkf24dgYF8kUFe67YyorOSwBtJ0aGjp?=
 =?us-ascii?Q?ZlIPcSrm5frbfgmHRSZnWgkJxHzLkWyxmTMaJuuJ7zj7EGSBoemTjHt+b9p5?=
 =?us-ascii?Q?8UCGDLasRBBqb05F3FUG48LJxMP9BUWTGOpwUCH/D+tj3ewWNEgiLi5Z32iS?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +hn7zuKVbMlcHgMs4CpZhCyNgfCiAj2RqWUV0/d6BYFEbdwENBWVbKVzz/Vod/LWeFGnkklkwKTa9wI40bznkuixlPkm0Po9FDEhyvfs2TXo0tWfmoudMdRDQiBazkrfScPqMrh9XpHO2i5XEcZ2NgzSq7UWiTh8silQ9TXiyVWMfDYRIkesbi7oDITkqnwKGsWCQU0UC52dHskTBOF0HOo2RMn0Bog6X1kMQIDF0MzHzG04dxiMfOqzr3O+uwV+dcfdqG0kUYUmi9kOxMrLQwo5fmv+Qy8yzqRrJjMU+wcGd6QP+THr3KNnBvYH1P1tJ2hlVDxCsRsKfdY0v6uGNTgL7h1Z5Zmq7u9CPetMDz5vo1RQ9jZyXEx/f/dYVEoiypTD55GYMTBtU7Gk6IiQd7FD6+EIisx5wDy1awjW3fxwuE7seFDcfsQZHIhqxxhiaXrinDzlzakCR0NumaLa83//hBTtCRJUk6baO2pw0q9FCGiB5aqfGJsS/rAM1+UKzPZDMtdfijWcGLiZqmlx5IyOqSbIMdnYAliaU8OomhzUdskwqz4LDnkO0oLNWQgbmeWe3Kt0kTbjcB/VFUa0K/K2vI5A6uXC3zxOBkr9Y0A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56127ba9-f391-44a0-32c4-08dd44700511
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 16:30:07.0487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvFilQRa/eZbd7zLMNl4xtqhBvSic6gISzJz6ZWfLCaZbOirttHWcnw01j1CwuYZxTIS2Tve76S00Jv+YJAew2eGoxzGcxUEG9xZ04Jlnbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502030120
X-Proofpoint-GUID: Fj1AuSeKTD2snM7znMsg2qu5sBgc_iav
X-Proofpoint-ORIG-GUID: Fj1AuSeKTD2snM7znMsg2qu5sBgc_iav
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

On Mon, Feb 03, 2025 at 04:49:34PM +0100, Simona Vetter wrote:
> On Fri, Jan 31, 2025 at 06:28:57PM +0000, Lorenzo Stoakes wrote:
> > in the fb_defio video driver, page dirty state is used to determine when
> > frame buffer pages have been changed, allowing for batched, deferred I/O to
> > be performed for efficiency.
> >
> > This implementation had only one means of doing so effectively - the use of
> > the folio_mkclean() function.
> >
> > However, this use of the function is inappropriate, as the fb_defio
> > implementation allocates kernel memory to back the framebuffer, and then is
> > forced to specified page->index, mapping fields in order to permit the
> > folio_mkclean() rmap traversal to proceed correctly.
> >
> > It is not correct to specify these fields on kernel-allocated memory, and
> > moreover since these are not folios, page->index, mapping are deprecated
> > fields, soon to be removed.
> >
> > We therefore need to provide a means by which we can correctly traverse the
> > reverse mapping and write-protect mappings for a page backing an
> > address_space page cache object at a given offset.
> >
> > This patch provides this - mapping_wrprotect_page() allows for this
> > operation to be performed for a specified address_space, offset and page,
> > without requiring a folio nor, of course, an inappropriate use of
> > page->index, mapping.
> >
> > With this provided, we can subequently adjust the fb_defio implementation
> > to make use of this function and avoid incorrect invocation of
> > folio_mkclean() and more importantly, incorrect manipulation of
> > page->index, mapping fields.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  include/linux/rmap.h |  3 ++
> >  mm/rmap.c            | 73 ++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 76 insertions(+)
> >
> > diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> > index 683a04088f3f..0bf5f64884df 100644
> > --- a/include/linux/rmap.h
> > +++ b/include/linux/rmap.h
> > @@ -739,6 +739,9 @@ unsigned long page_address_in_vma(const struct folio *folio,
> >   */
> >  int folio_mkclean(struct folio *);
> >
> > +int mapping_wrprotect_page(struct address_space *mapping, pgoff_t pgoff,
> > +		unsigned long nr_pages, struct page *page);
> > +
> >  int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
> >  		      struct vm_area_struct *vma);
> >
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index a2ff20c2eccd..bb5a42d95c48 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -1127,6 +1127,79 @@ int folio_mkclean(struct folio *folio)
> >  }
> >  EXPORT_SYMBOL_GPL(folio_mkclean);
> >
> > +struct wrprotect_file_state {
> > +	int cleaned;
> > +	pgoff_t pgoff;
> > +	unsigned long pfn;
> > +	unsigned long nr_pages;
> > +};
> > +
> > +static bool mapping_wrprotect_page_one(struct folio *folio,
> > +		struct vm_area_struct *vma, unsigned long address, void *arg)
> > +{
> > +	struct wrprotect_file_state *state = (struct wrprotect_file_state *)arg;
> > +	struct page_vma_mapped_walk pvmw = {
> > +		.pfn		= state->pfn,
> > +		.nr_pages	= state->nr_pages,
> > +		.pgoff		= state->pgoff,
> > +		.vma		= vma,
> > +		.address	= address,
> > +		.flags		= PVMW_SYNC,
> > +	};
> > +
> > +	state->cleaned += page_vma_mkclean_one(&pvmw);
> > +
> > +	return true;
> > +}
> > +
> > +static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
> > +			     pgoff_t pgoff_start, unsigned long nr_pages,
> > +			     struct rmap_walk_control *rwc, bool locked);
> > +
> > +/**
> > + * mapping_wrprotect_page() - Write protect all mappings of this page.
> > + *
> > + * @mapping:	The mapping whose reverse mapping should be traversed.
> > + * @pgoff:	The page offset at which @page is mapped within @mapping.
> > + * @nr_pages:	The number of physically contiguous base pages spanned.
> > + * @page:	The page mapped in @mapping at @pgoff.
> > + *
> > + * Traverses the reverse mapping, finding all VMAs which contain a shared
> > + * mapping of the single @page in @mapping at offset @pgoff and write-protecting
> > + * the mappings.
> > + *
> > + * The page does not have to be a folio, but rather can be a kernel allocation
> > + * that is mapped into userland. We therefore do not require that the page maps
> > + * to a folio with a valid mapping or index field, rather these are specified in
> > + * @mapping and @pgoff.
> > + *
> > + * Return: the number of write-protected PTEs, or an error.
> > + */
> > +int mapping_wrprotect_page(struct address_space *mapping, pgoff_t pgoff,
> > +		unsigned long nr_pages, struct page *page)
> > +{
> > +	struct wrprotect_file_state state = {
> > +		.cleaned = 0,
> > +		.pgoff = pgoff,
> > +		.pfn = page_to_pfn(page),
>
> Could we go one step further and entirely drop the struct page? Similar to
> unmap_mapping_range for VM_SPECIAL mappings, except it only updates the
> write protection. The reason is that ideally we'd like fbdev defio to
> entirely get rid of any struct page usage, because with some dma_alloc()
> memory regions there's simply no struct page for them (it's a carveout).
> See e.g.  Sa498d4d06d6 ("drm/fbdev-dma: Only install deferred I/O if
> necessary") for some of the pain this has caused.
>
> So entirely struct page less way to write protect a pfn would be best. And
> it doesn't look like you need the page here at all?

In the original version [1] we did indeed take a PFN, so this shouldn't be
a problem to change.

Since we make it possible here to explicitly reference the address_space
object mapping the range, and from that can find all the VMAs that map the
page range [pgoff, pgoff + nr_pages), I don't think we do need to think
about a struct page here at all.

The defio code does seem to have some questionable assumptions in place, or
at least ones I couldn't explain away re: attempting to folio-lock (the
non-folios...), so there'd need to be changes on that side, which I suggest
would probably be best for a follow-up series given this one's urgency.

But I'm more than happy to make this interface work with that by doing
another revision where we export PFN only, I think something like:

int mapping_wrprotect_range(struct address_space *mapping, pgoff_t pgoff,
		unsigned long pfn, unsigned long nr_pages);

Should work?

[1]:https://lore.kernel.org/all/cover.1736352361.git.lorenzo.stoakes@oracle.com/

>
> Cheers, Sima

Thanks!

>
>
> > +		.nr_pages = nr_pages,
> > +	};
> > +	struct rmap_walk_control rwc = {
> > +		.arg = (void *)&state,
> > +		.rmap_one = mapping_wrprotect_page_one,
> > +		.invalid_vma = invalid_mkclean_vma,
> > +	};
> > +
> > +	if (!mapping)
> > +		return 0;
> > +
> > +	__rmap_walk_file(/* folio = */NULL, mapping, pgoff, nr_pages, &rwc,
> > +			 /* locked = */false);
> > +
> > +	return state.cleaned;
> > +}
> > +EXPORT_SYMBOL_GPL(mapping_wrprotect_page);
> > +
> >  /**
> >   * pfn_mkclean_range - Cleans the PTEs (including PMDs) mapped with range of
> >   *                     [@pfn, @pfn + @nr_pages) at the specific offset (@pgoff)
> > --
> > 2.48.1
> >
>
> --
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
