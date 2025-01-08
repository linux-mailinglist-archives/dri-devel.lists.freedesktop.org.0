Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96408A0657F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 20:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E0C10E025;
	Wed,  8 Jan 2025 19:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="jnsYDjGm";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qpvCgz/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C495310E025
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 19:41:51 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508INI8c013788;
 Wed, 8 Jan 2025 19:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=9fHqram0VQbOYkQ/ar
 JLjiLGuFnIuARrYC4z65VwQwk=; b=jnsYDjGmK0YXR89508BgHrjuJvawaya3EN
 iFjO/07PBiD4j0Ei4ej3tjO2e+5ID7Mqsla2U/0BGFms7QUl7dk197Ta9gD+niIJ
 8HAQtAZ4Xbct46dd+HGljOX+ayi6YcT6Jr69Dpk+wdPXlFkf+PHczZOFTkTezITm
 w9oZZ3bhh6pn8lp6zZ3GRZ4asPAgWU5O77rjYuuyEFV1k1LGtSGawigvLZOoV3N+
 jObAE8HlAwtibcvprhoZDvBMT4BMTLD9TmOdXk8z4p//BVmbXrtZFkzTUNlZT/GO
 eoGUgVo6fC0AyLJbjrzWpVbh1UzqAvzkvHtfS8Ert12O2Jh2CcNA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xwhsqd6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 19:41:39 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 508InrEA026242; Wed, 8 Jan 2025 19:41:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 43xueae72j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 19:41:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeUn1Anh82HxzhEeZGqWbxuGgN6vmxCucw05QDqMRVduagWaCdfzWQv+W7EcWnDL4noOkr06EbHkYNuRCjN5UDHb4EgcxZvQMp1y9UOXmOFJ5sMwSfUZK33LCXtlmcYfs1rSzf+WzaLStrfcns5F0/AAUQaSAIm3IYx1PZ40tMVhykJiMGFRhOYeEkdfHhOjOmbeZRZJJJBpT3Dib85a808Z/e9J/m6/jQAB/wRjq+Lm26Z3eCk52pzqFxrLzDia7/kOT/BXvqnCzBMYF/umTfGDkWjGyW5fTPScQLkcLu47tIyLEBpHpEGj4neDamjWPhZckMdH4q/mB7QJVH/fEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fHqram0VQbOYkQ/arJLjiLGuFnIuARrYC4z65VwQwk=;
 b=NYRkE/9TJaKO1+dq1d/pMuQR6VHefSRuEgmWgCep/visFnaTdc40m5F77wXjopJmjjp99Hs+HXX84fKJJky6tP03VMmt/2MZp50uKlibKuBCWvYdsY+fHzaKSYZi+Tl5+JWyig0NcmI4Wy5Bx4GXO8l98VF/jHmNQLNrAcDvOq7pA+xhKEtGo9HTCBWpdw/r475GwX1dMkA+PPvo08My/Pg81AvRxUEBbnvxzuSIfo5tiXgdRvj8kheh4ZY14/YpkKFKjwYceoR/HaqPj71tp2YgxP8yd4KW31eYKwp+FNyaOKvfJdaqQ1tDAwqnU3qDYndAZlk/QHu8TQ6RjZwDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fHqram0VQbOYkQ/arJLjiLGuFnIuARrYC4z65VwQwk=;
 b=qpvCgz/BzgVzslBLJ+cFlxDVnIw6Kx2+7BSdoBH7EL8KAmTqttdgxBVxlX56jUSiwwl4DHHSDP9ZlijITWAdtpYgOd7tudoyf83l95Xe/ma0CzGSQCdmcMQCb8lMeg9u7RJfNnwge4hIB87ZN53qJmwNCu+uyQ3Duk3wZDt3AwI=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MN0PR10MB5958.namprd10.prod.outlook.com (2603:10b6:208:3ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Wed, 8 Jan
 2025 19:41:35 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 19:41:35 +0000
Date: Wed, 8 Jan 2025 19:41:31 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Message-ID: <cf2e1d90-2d6f-464e-b8a0-805ff041604e@lucifer.local>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com>
 <Z362xoQMxQRxYUlJ@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z362xoQMxQRxYUlJ@casper.infradead.org>
X-ClientProxiedBy: LO4P123CA0411.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::20) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MN0PR10MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee629ad-2917-4c9b-16c2-08dd301c759f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c1oh3EEIvhC7vX1MUaG+3/yzvIMwpMGWy8EsdwaN1rjpOdhodNYl32g6EG0y?=
 =?us-ascii?Q?tlpXv7uzxAelWDf4Qo0g3f1kaSCmYzNJJZpotPPFTlPRra2d6MnkIlG69G5g?=
 =?us-ascii?Q?Vtbcds+JqmTV9q6qaptVGx9FZ4w9/GyW/gHlbByhqKf91Zn0fCnFDDx2Z7Ui?=
 =?us-ascii?Q?ZqXUnJeMpyXdqfElDcN+0YM/cqmM9BP/CPGkeUr1W49LAU4A0xC/5pEDbGek?=
 =?us-ascii?Q?S4n/CiGpE06/v1p/KTkvcQ7WRH3VB3bzPBt/GC0O2tZYZu0/c+cY88nbs+hD?=
 =?us-ascii?Q?ytqbQ8XK+BXnY/53WkLrUQ58KaJEoeaYDQmWBFLY5+ljjEbQRWx2yLEXQzfr?=
 =?us-ascii?Q?8sEA9bwG/0aA7YDCbEj9r+Pe/DqTZSHCE0X4VriFOImg+UQl/lJM37JjwfSL?=
 =?us-ascii?Q?4QU5pCW4oPWIa4NbejmH1bgq6s6ZuiOsVCbBgYBOS0PhC1ldorKBlmxNraqC?=
 =?us-ascii?Q?Dp2yqVF4Df+rf235uEFybDZzOlaIzb1A9pl6WLsLviUjje3w3/d/BIJnF2BX?=
 =?us-ascii?Q?peKnAMatI619W7BuczB5nDdqhL4kRok58lrMRwubbaopJ20jDMk/ZnPE7CLK?=
 =?us-ascii?Q?SaWuzhoU0zPv8zSO12g/tXKKfv3UzYPQdaxevpEtl9/bNeypZd2sHhm8BytX?=
 =?us-ascii?Q?dLrm0vNX7A6VK8x/Q3YAo+rPFwirvAqKkHw6Rw1aS9DJ20uvxrAFoW5qgaY8?=
 =?us-ascii?Q?pSRqQCqdboaC1mPW1mb0ArQSIc7J90FfLre/XpqyjDFWAeNp8t/p5s3V/StD?=
 =?us-ascii?Q?a3sZIUfg5n2+UHJ0vlaVc1j69Iffh/+gxcXeWp/k+FLNSAEnGxoF8t2w+69F?=
 =?us-ascii?Q?Mov6pmy8nuGmWcCQ1L85EChv/eoSvIBDq0PBjxqFLHKdhjqAtKr3rwVPawpy?=
 =?us-ascii?Q?CS6OEt9KwP1qyhKCaS1FW6D8DxsGvDXMrWYsKuBqKHugD0bfbRteNLn1wWp1?=
 =?us-ascii?Q?14RmH5UK37+PG26iscRuBx5r71H4M6CJtlkFDQijToxpA2HIw/rxWFpdyfc1?=
 =?us-ascii?Q?zFDIdJx3ohRAgXCJlp546ln07u3oLUlpotiWhq/pF7vW/y+vVcM+bwLNj4Jv?=
 =?us-ascii?Q?z67LUVAcJWbe+7HBwEiLpJcV23OFkv5xK6yx4yPDzOWrA0RTwq0Qy8HpPHcD?=
 =?us-ascii?Q?PcvxwuTGq++u/9kkGhjy3lRIWhHdfTYM+Yth7z6JIs3U++J9M+1fKwtYiUwf?=
 =?us-ascii?Q?rZSsMr6wPRi2Lxo7yevX1RuyN9lgjtLgnzBRNoIkWl92mFTtVBmDpcFN3Kye?=
 =?us-ascii?Q?qScqKk5h52F5+DPa1/cyazQNa5j70RKOzBbwu2Gt/l3rhds9bEJKjs3kX3zR?=
 =?us-ascii?Q?oYmzSVLO6HpwbHEUlEU7zM/VOMq46h3/wMrwkoFrGzfOcGvguScWuV3t6TD5?=
 =?us-ascii?Q?cFmm7emiW97VSnQJbH+BmiKDC+MG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i1Ri6KuHKaqGJDLRK35rXL8UXuI1Pegz3teFRtWmHz0wv6NNyY6pRFTYM7XG?=
 =?us-ascii?Q?tRKDtNm5NAEThr3p/gfYQ3mr4cuPWqJWEyVFamZME9aJBmi2UJymJqpS/tGK?=
 =?us-ascii?Q?LkfomLvxRxmc0Yv9XskDWASS0ddJkXpaxvIOwN59oup0fetCPsKk2EfTcgK3?=
 =?us-ascii?Q?HgDi+3u5sj0iAts+TKNs96h/RRmPmrHc+ZPWccPQNIjq3aRxeQEnVMlQfgZL?=
 =?us-ascii?Q?HQqUXG/dE6j3i8da8GH29MLNjzF1zHZ4oobkkPviktrZG9lKIPtR+wDFtiUF?=
 =?us-ascii?Q?evPz/sVzePcitXUxLy6WTsTS5/pgQogj1AprEe8AbGzv4CpUD2TE5I2/d7Wo?=
 =?us-ascii?Q?8lLNBDrAw4KIkNGcaV1VUiDinGKortAz7vY/zNvmlRqzJoBbBZCXsaYqRESL?=
 =?us-ascii?Q?g0Zbr5d/NN95ByZyFEeMOV3k3R7QTTjpYs1gwcrWA8wk1jFjPDeTAIKzNAcL?=
 =?us-ascii?Q?nx7DFCD7IK+lcaC8WRlzqTBrhB4TjOjOfELQ46ivLbWTJX1ymE+cX3wZCQJt?=
 =?us-ascii?Q?MrB9hQJ5YNPJdF25oG6zQmZA4fyWu7Q2mA67CXzlMhoykLueTTIZDT8MnweJ?=
 =?us-ascii?Q?x7jecGcnuP2KoUKUaXuKbQrEs1vMjRAyRQ0dS04SKvuNUm8ox1UcM+c+SsX5?=
 =?us-ascii?Q?monAzM9020mCPD5hyv82C3o/OiStwnNAyyotgwE+FyB9Jx18FnRGw1TzvZ1b?=
 =?us-ascii?Q?JgjjpZBkk1dtfNE6n6TR3PukkK85ZP+gwuOq33Hn2Ha6tr4tizfF4STkrVWS?=
 =?us-ascii?Q?y/RyksfwbDhlaPLk6FxveOwXZJ9oIoGUG19qha0fCCEWaNI/uwApFpXpnjUY?=
 =?us-ascii?Q?H0kx5Aeql2Vb9jRqXkug9LZ4gYFK+T1ge+HXdhTme/KpdKGYRiZTzni6l2mY?=
 =?us-ascii?Q?ZroFBqHbn768tVT4/Jeaak1PuM/D4Dq/ORvusRImQyniI70Ah35RipN2Jb3A?=
 =?us-ascii?Q?duo2ACxQmrTpbz76W7NVxPEHd6PSg7dI8HbMp10gD2iqI+eyEO0raQuyLFlL?=
 =?us-ascii?Q?ohSokSTragXnWdSSNP80IBP5x13DecNxcDY+QIagFQSz2h6Qryyj3iUwLOcI?=
 =?us-ascii?Q?XToRh6IM4zZw7Q+AeLi/F/CdbhNQ3p0JQhwNnm8P6hNRAfd0fN/A9i3/Td3/?=
 =?us-ascii?Q?ZOn8q2G9vDETbzQlEELPRVQe+Z7zljyYS49ul70O6Gs+/kIet/mFI4h+CXam?=
 =?us-ascii?Q?eg/6Mgz2PLlkHP83N5umegJYzXK/nb7eqcwywBZuNpMuklivZapj6Aw0ODX1?=
 =?us-ascii?Q?WOAChlR3ehziVTZI8EulvOtnwm1G9SGPqNGyGHCy8wDC3LVV6mNlydlpXAIp?=
 =?us-ascii?Q?xTrQdfBB9tSI+saB77PzO/Jud84YfPpQ3sVF83BZOez0olYgLuX5Gqri+U8V?=
 =?us-ascii?Q?vZGbp4HCiv0I+VrTTETBwFtWgwYR58T6vCywkerAg6Umpu9TP0ssv0VaUXoC?=
 =?us-ascii?Q?cl1pYZtsBxdo39lHf5+35t5H4cmlYSDkaxaDUx4yzZanLpu/teu5XJQkYvEQ?=
 =?us-ascii?Q?B8CMAoxfpEoTTnT+gAXq18hMMFaWN532Js0Cu/Q+rrsXzx0KA9/Pbrmrl8hi?=
 =?us-ascii?Q?K0IFuc53hRThei0eXNbqqGq/QJ2laQkWVRb8QfwDrS2aI3nZ0xbq7K9gpipd?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 0sgAOxglWUWeXhkhGcEoLjvW/BUR6y+Vs4+2Ic9Z1EtkFaUD7ppP2OBXj/8GRvArczoN2E15gGRXVGAw6MiQP2MDlsM4g0zKkJ9hI/sZFJ6lt9SuGPjYXZvnoHA7WwINNrV/syKx+67j2yM4M2fdVgl17BXRLuOhvSSUzVcnhUawOKO/OaLoM3ene2pdykbawoKOWawDeovwrf02SuyACFmgLprX+t24P4WzvHclXQmSkLsDZuqlDArJMC0cjei9EqQEmIlLwYFCGdCvwP8F50ulPqW1pmZxOIdvveELTuCV/dfEeR0j0CQKFGPc89JSegikmjKkbxvEg9woSC8EXcneYvInzg+ZUnbg2+6E6w/kai6l47nNl0rdtDO/iT71gsnXDYCEGwkqE6WtFiQ0lnyba7P2zhR3RYLetB2Fybr+ce9ES0dfWVWmIv9GRk/eKtb3oOng4xcoZqofp8RjPl5eztkIhtwRjlXJriK/6C8+EYpTvQ0RvuTxuy/dLgDstvOExpl7wJxc/aBPSVJdV6NIoC+Z3GpYbrBQNZZGcuGTY+cjNw4M0SpHyBQjomlf0ELQKLX/FEA9Q0OAtfyjGk2FiNFsyIV9nw7fufU6Pic=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee629ad-2917-4c9b-16c2-08dd301c759f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 19:41:34.8267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CX7QpsOX64VJt9Dc9YHfk9cIwVbfWCJQGuugo7eXd9vmDd+iPdIGbbVb7Ih2503ybAkE4gjrYDO/mrUmlE+GmXK7gKXLuh777Um7icxyNnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5958
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_05,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080161
X-Proofpoint-GUID: rcqos5AC6WWFroL55V4MPfn8F4GY74w0
X-Proofpoint-ORIG-GUID: rcqos5AC6WWFroL55V4MPfn8F4GY74w0
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

On Wed, Jan 08, 2025 at 05:32:54PM +0000, Matthew Wilcox wrote:
> On Wed, Jan 08, 2025 at 04:18:42PM +0000, Lorenzo Stoakes wrote:
> > @@ -280,7 +269,10 @@ static void fb_deferred_io_work(struct work_struct *work)
> >  		struct folio *folio = page_folio(pageref->page);
> >
> >  		folio_lock(folio);
> > -		folio_mkclean(folio);
> > +		rmap_wrprotect_file_page(fbdefio->mapping,
> > +					 pageref->offset >> PAGE_SHIFT,
> > +					 compound_nr(pageref->page),
> > +					 page_to_pfn(pageref->page));
> >  		folio_unlock(folio);
>
> Why do we need to lock the folio?  (since this isn't necessarily a
> folio)  Also, do we need compound_nr() here?  I _think_ for defio,
> the number of pages allocated per object are fixed, so this should be
> an fbdefio->nr_pages field?

I'm trying to keep the code as similar as possible to the way it was before,
even if there are questionable parts.

There is a comment about some timing issue around the locks and so there appears
to be an assumption about that.

As to compound_nr(), we're not write protecting everything, just each invidiual
page in the list that needs it, so we only want to do one at a time. I strongly
suspect it's a single base page each time, but for belts + braces I'm doing
compound_nr().

See below, this is wrong, it should just be '1'.

So this is iterating through a list of pagerefs that can be in any random order.

>
> (something that's always troubled me about compound_nr() is that it
> returns 1 for tail pages and the number you actually expect for head
> pages)
>

OK I changed this from '1' to compound_nr() out of an (apparently) abundance of
caution, but I was wrong:

npagerefs = DIV_ROUND_UP(info->fix.smem_len, PAGE_SIZE);

There are page refs for each PAGE_SIZE (i.e. base page size), so there is no way
anything is compound.

Will switch this to 1.
