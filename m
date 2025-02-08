Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D08A2D70D
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 16:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AF710E0F4;
	Sat,  8 Feb 2025 15:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="RRSjqNIH";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bvvdQHL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD64510E2B8
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 15:53:55 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518FQ1Zh004832;
 Sat, 8 Feb 2025 15:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=nBYx7Eh/KR0BtSDRBC2OZUEKMdiIHhWMKyghUPiHSDA=; b=
 RRSjqNIHbAjXCiGZPrP1cTURhn/LQmAKzH9QOl+pw5XnjeRUyqx2KbMqquezn21/
 XItP9w3FemWudb9rkraPUkvosL1zpNKrrrtlhlt4A+8pI17xauzkyaFAnOqtLBVj
 7zsN1WatFVNzCAV2PtU/WzFGKfi0eL3qKg/7EMzqTtmYeo/p7/kE8f0FAYAdKxnr
 SKSRt2pUE6alPtmnTC67dh2vj/X7wjcaYvv7pt0dPZ5H6vKZoB6mCDPpjS/hIG0g
 PyzrzkhF3JV0nl78xOgzhFKYE9DjBCip5rudr5Xqyh0caA4T9yARDxZcph17R9MI
 XB/1bn1tHa9b9mMrM183ug==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0tn0b2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Feb 2025 15:53:28 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 518B4WXF037888; Sat, 8 Feb 2025 15:53:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44p62vc2dc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Feb 2025 15:53:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1MH2Av0ZDTkqu9sWuqDJe9loJaUYKG+UxuLxy3VGLqfAWBREdEBakHjPRFCypnXq3jOFsmhoTjVxCS3HqLa9Kjeqi3iUoHFaDRL5gCiMJ7LvW4PYTwu9uYzvuuLPwM3vDxMk2YD5WKXZK1o6ONu4ClGv+496gdWStFDsSrVlkqXdUBXlo6fZCKgUlcXMY16blksONL5SaAOe0+P1vSmpIWOh2Nhdlb/rdYXwSghj6gZ1oUJTzVbhEQyjVU77PZHdrd86yzH6gfEWA2uNHmMhG5XWzqqHrzqza2qIdSIpHENEu0ntzcuu3M3WgCKFW9Cq0Nv7y3LNH+0Xfv2XTBwJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBYx7Eh/KR0BtSDRBC2OZUEKMdiIHhWMKyghUPiHSDA=;
 b=XwAcRCYZepcX9If2PIanFlYZgX4XUliMZt1FoDmkVw8TsfhdIiu/IRIu7V1mAtYONUiOjoyvTsQODtFHX1kueGA3DNdPWINWhifnnF/9AXGem7lu57/CGx3m+2A5cdORRnGAs4X1Z2YTpzpNugxAMlyzUQcHXzY/9Uzmu1xEzb/8ywqBYe0NeSpDJElXMCieo1fNA8SQEKTw60Cer406xiu/qiPX8FeW9Nvxo1EAny2jWlLUWHeIyirsQefhWwLqqnMdaIsk3MprmbC+42nz60HgyG6Kj19TEVwANsCbqyNuejq5zPzZuanmjp0APXd+Wsa74SY6DAgglL5hgJUZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBYx7Eh/KR0BtSDRBC2OZUEKMdiIHhWMKyghUPiHSDA=;
 b=bvvdQHL4XeHSEizs/F6Z72jWvkEDmuwaqdItbleuJthL/B+PPp21vToUywZgm4E/r/ycDLrGxyukZdN7bF6mgqJ7tX1V/U0kJ1uAzz9d6tCbg/qy8nlp5kbVJWLJrsWfPtaufjh3lZR3+faAc/pw4FdKbsqTinBaeajJBYuQekI=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB5817.namprd10.prod.outlook.com (2603:10b6:510:12a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Sat, 8 Feb
 2025 15:53:11 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Sat, 8 Feb 2025
 15:53:11 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Kajtar Zsolt <soci@c64.rulez.org>, Maira Canal <mcanal@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/3] mm: refactor rmap_walk_file() to separate out
 traversal logic
Date: Sat,  8 Feb 2025 15:52:54 +0000
Message-ID: <0d1acec0cba1e5a12f9b53efcabc397541c90517.1739029358.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739029358.git.lorenzo.stoakes@oracle.com>
References: <cover.1739029358.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0402.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::11) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: c439338e-7817-496e-f69c-08dd4858b0c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7wNhdyKyzG91EA/d/zad6FTD/+G3UQtOFKKKqImqlYMn7U9Hr2NOT4t02kDG?=
 =?us-ascii?Q?geAnwGyVO40tBInzMXB4t5bc9MpY2W58BWB+E19x4Jyv4yAPOHeFEtdl0ywm?=
 =?us-ascii?Q?1JSBhkYgwSzrbWdZgNyZq3v9aujt/EO+k8v7SJHYoF4hiyJAG1lodMKsx0Mr?=
 =?us-ascii?Q?qKHhiIq1d5dOLCyV9A3YKIKMHWZjeCY6h43gQRqIsorf9F1THcK6guE4bcXn?=
 =?us-ascii?Q?WDYvvWLXO5Vvepz3gBA6pwk6Vo32ok5N4SnoZ9qMbKiAxLiH5dK2uTG2yeRl?=
 =?us-ascii?Q?IUAYwuDZqEVXp79yZdong8Vjn2S8S5elbISEWcO6glLS7P7e8YIbIClXMLeF?=
 =?us-ascii?Q?kGcFso4s0kG6a3N9UqrOejRTSoBMc4QLlH4tUtQiKthyZTzHPg5/50VJggN9?=
 =?us-ascii?Q?V1YsVn8A62QXaLQau75SfFsIiJnsHsngTnULwVBqxISqJcM7/maFghfyXtH8?=
 =?us-ascii?Q?2ufSRmVq3W3TXCLq3GGJOHpRG5UfUbHG5zqu3HC9HdEzfkTq/HL9yHc/0MFS?=
 =?us-ascii?Q?dYI/V4FegVoEy1o5SP4odtzwcW+lPyo1/8NRojD60U4Qeq9EtvceiNVJZgDC?=
 =?us-ascii?Q?beSqiHrP0ynq9vPveydc9edhwsq1EzAWAXZjorO7gz04mq4r15uM/s0U5h5o?=
 =?us-ascii?Q?u2/Pj7Z02saBXX2nqg+zMWUic6E3GAVdB/95jPcjeOVJ2xJCIpyWF3z/Dh7x?=
 =?us-ascii?Q?3wFOFL/El3aLgVsg5gW8Y+n9FuarFkAwYJGoqHn7IR4BYHeQPRb+tII6hri6?=
 =?us-ascii?Q?k96TYiLQW7G0en8FDwZeHtdDGUbqttlffpT29Se9DCVwmPCMQ8mLaHSRQGHg?=
 =?us-ascii?Q?FEB923eoPU/qBhNyiWKBh8zclxFsIfzIdIrTZJ4I4cqAYL6AU5c9jQ8T2Lxy?=
 =?us-ascii?Q?y+FsUUEV7hxVTmOsqXwxygbJIFCgtK2a/7VXShNTtXlpn1Me5WKs48+eEnMR?=
 =?us-ascii?Q?aGkzCZtdga2t1vV+PUmV6pP5NOzrJ55WMkaZ6Jd61VYYcGaurXgdSjNkMTma?=
 =?us-ascii?Q?CW2z8LiM/PKfiSPt5y79tf8tO9nDO9g1XHtw77htJv360xidx2jnJXiYHys+?=
 =?us-ascii?Q?styIZlWh/T/TR2gqwvHtdJHOppYXO3lmnYTLcmttMTXgvXjNwqTAkyi1RHfF?=
 =?us-ascii?Q?gWKf3+Ln6UMFsTJo8bNDcse/EhGv+rFmnOU/ysk7+yw/Wy0HUPt0AY8kHlzF?=
 =?us-ascii?Q?Eqi2dWTs6VhVKvRmQkPlqQq/tZQ1R9mqYYog/XiKz5uAEu42iXbEfllhTcaY?=
 =?us-ascii?Q?w4fhAVdZHIv4MYH0QQOaqnntSLm4dgxmSY25eawt5PCxwgvFtpknfyqplkBE?=
 =?us-ascii?Q?CuzWhRQ/LwUkkYVN5i5FPesvsSwog923AYeWNWqi45pri5fIUPAG69OFUYyr?=
 =?us-ascii?Q?nMUMWI/8bntPu9Ot8XLC0XmBfQux?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LnX8bNLvDsonGhQHQYdbawxV07SWpRBa/g3usDcxIo0bKVAaYSMr5ayjpVh0?=
 =?us-ascii?Q?k10xzz5q4ylbnu6vmmG6kP+gwiLVrj2XidYBiKjRzE/Qf83HBkhcNpUs7Zai?=
 =?us-ascii?Q?j1zF0mwkIQxwk10Ws5hD9/+dheYDQcyy1KwQPP2lt9ZHXwnXpDop9mYU5/jI?=
 =?us-ascii?Q?8Tt326AuNHeUWdZSsiMKs10BM1y4oVQ15KIVF8qlmul8vQr/bJHZMeqcg36T?=
 =?us-ascii?Q?QWd7cQzJzNluL9XfOsIPuIpqwYI86YAfC3xJOgyDI/J9Uy1ZUgVP4MwGTSal?=
 =?us-ascii?Q?l/XlJizwYXBhgb2wXfYZx0MclHTQnNFaDtIHN02mBhlquAif8XIFTWvZCv3D?=
 =?us-ascii?Q?XKyrcA1Ypc2PoTjOGjE6YVft2BeYNJEA6ekf1PJK9RXTfXApo4F0N29vaDpO?=
 =?us-ascii?Q?hVqcopASNtPTgJZxmLkH4XoThh96EUJ/G0lW1bBMe9z45XKFi3hKPKhN2yIB?=
 =?us-ascii?Q?htcO77c0oBa8BOsGh+C2KSNxq26+64Z9RMSl4pz93QApCce90EXCUSc7a59E?=
 =?us-ascii?Q?XU95LQIcK1fDZ2Z130HEht0LlDnrw7Ffkg7fEGPBo2P4YDKBXrclHVNx7wKs?=
 =?us-ascii?Q?E7orDTgjBikylzD37eCUzlYgNcO6VlnUNC5dzWHepUl9fe3gu2cd9fjsKChl?=
 =?us-ascii?Q?axRkTfwLGtRUCZduoRAoN+Fg07wGwSEkDBGBs3S5gUeAgg0cm4HlkhxE2oe5?=
 =?us-ascii?Q?pJvnsLg0bBzUUtGdY/fnm3bS2cvODGqAn5D8XzPgWVlqhiM0cbLhDJfzzq/r?=
 =?us-ascii?Q?1a4hBUTpveyG355adiNncK7vxgrtzv3qZIOlpJdZu8xZaEeSjeyp4L75ddc2?=
 =?us-ascii?Q?bsvNEVpKntWK78S1l6nYDeLRuSfd+i6as5H53j4Fhvn0vXvTKGB1UF/Htm4g?=
 =?us-ascii?Q?f86JDYJWQw0Q/cvG1lmZSbd6gso9RzM4vT33TO67FWb7MZ6p/U8Qlg0Vc/ns?=
 =?us-ascii?Q?0R3tyOo+lW1B2FqWIZhfG7KXxvCmGO3v1zZWfuVoVk6alkb13PHjpSctGB12?=
 =?us-ascii?Q?kG2SqArSJSvX6PXnbLC2XgHkLbfR+XlpQ6DFNkP1/5PALl0paCF+VikUSLAI?=
 =?us-ascii?Q?KME8/nU+2Qm6+mgKBSbjsWLab676m8aSgJOC09OEsZNUw3BOr0XCSdT7qrCV?=
 =?us-ascii?Q?VkLyvosYeNxlE6wlEEhxiishMk3f7MPNGM2Z+GGwNGLyE73yl+MqyqhGBGXH?=
 =?us-ascii?Q?ukXdEI9VhNNAsDqXx23uGsnSh8OetJrd/6DEbLGKCsRzSOAmnuMaBE3lKvv0?=
 =?us-ascii?Q?w6smIRy9WYroX2B/rP8R3Iy137MiCh64sYjAo/nFUaYoWSAA3qLOU/SvlC5/?=
 =?us-ascii?Q?+b6uOlAnls74Y3np9/BThy3t9VDcC5srQEi2so3WQ0p2GzZf5uYoW7zYSQcx?=
 =?us-ascii?Q?rY+7GtTFYDfm48Gj6VoaGZan90zd9uEFmAbbVLGKOg4Zu90qFKlzxk10Cdvn?=
 =?us-ascii?Q?W7cnINV0stNW581t+3xXTKC8bUoTHSe0/eVJeSllwPp5JHHQdqi++BDr125m?=
 =?us-ascii?Q?7dDT4+2EgPaukjyB8l0YIrH4WMjCq3HWtFS03RWirJnhNToe+6vWsTwF/1Pl?=
 =?us-ascii?Q?p8rA6kXPlEA+fxue6DZG/OT1pjm4nAVYGm6+qHjpmcMnQGSaoPpK2MWm8GJf?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 8aZPPlf0xwKXvgD2GZn41swcN3uypRt/CHVIbDQFq+x8PgZzM93M/eS1tXffUfd70EMJzSQhPHMwoRs7XYJZ7cSnlptX5CfNtkNbiA6KjDCT/PMxn+8Vl0hHQDW1eKgy/Sz9A97+vMRmli2yBbKUMkTcPw8Tn6Q90Mi73vdEnD/YIfeZXbliUDRJRDatI/vQ0XRNIdbdZrz9ro4lDWi7Uink09SRPDOduHxHjQpmR8TyQ+T5zvUDwXyFnXoVBYENRU0SQiWTTWeabOSBEaqgTkSPgy1a/y6ebUWf9pU+hDvgC4YYOQk0is2i+ZQl8BPKsd8PYIfYL2U/26vtQ2vegWtNUIbxSmScISDtyHZ7MPRckN7a407Rr0Mq6GHf32xEJyEqnbu+eg4r3Zfw/FLxbxzp495j58lOvm1kFsOWDEjac4UZ6FT+XbID8MtyhjG5E70zVFCDLx4vdBk3uNoPJaFc0jcKT4VgV+tINrYMmAzRivt6Gk2xjI9novKKO+wd9Bi/N9fDk2qWiDhDvqJKYDjtQBZZODQXOSuJhGwotvpYdA+vUIHlCKgYzEvCS2eOFNZnCqXRSQuA/hQQK+pmrZyfrQaOAoQ3Nv+6DegRCsg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c439338e-7817-496e-f69c-08dd4858b0c9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 15:53:11.8170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cr5CktrSqpzRa4fsp99ILBHhxoKExWE4Sem6REgIZ79xFNYiz7rF5RhIBTn51YfH6dmlcOjC/SQJoigiw2dMLKChcHhtMzTHIY0OKU+o6wM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5817
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080134
X-Proofpoint-GUID: n3m9G8Wq72_alK1zBnmemJW8RsQEnY4z
X-Proofpoint-ORIG-GUID: n3m9G8Wq72_alK1zBnmemJW8RsQEnY4z
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

In order to permit the traversal of the reverse mapping at a specified
mapping and offset rather than those specified by an input folio, we need
to separate out the portion of the rmap file logic which deals with this
traversal from those parts of the logic which interact with the folio.

This patch achieves this by adding a new static __rmap_walk_file() function
which rmap_walk_file() invokes.

This function permits the ability to pass NULL folio, on the assumption
that the caller has provided for this correctly in the callbacks specified
in the rmap_walk_control object.

Though it provides for this, and adds debug asserts to ensure that, should
a folio be specified, these are equal to the mapping and offset specified
in the folio, there should be no functional change as a result of this
patch.

The reason for adding this is to enable for future changes to permit users
to be able to traverse mappings of userland-mapped kernel memory,
write-protecting those mappings to enable page_mkwrite() or pfn_mkwrite()
fault handlers to be retriggered on subsequent dirty.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/rmap.c | 79 +++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 26 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 7825707929d8..52f98f6ccb56 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2751,35 +2751,37 @@ static void rmap_walk_anon(struct folio *folio,
 		anon_vma_unlock_read(anon_vma);
 }
 
-/*
- * rmap_walk_file - do something to file page using the object-based rmap method
- * @folio: the folio to be handled
- * @rwc: control variable according to each walk type
- * @locked: caller holds relevant rmap lock
+/**
+ * __rmap_walk_file() - Traverse the reverse mapping for a file-backed mapping
+ * of a page mapped within a specified page cache object at a specified offset.
  *
- * Find all the mappings of a folio using the mapping pointer and the vma chains
- * contained in the address_space struct it points to.
+ * @folio: 		Either the folio whose mappings to traverse, or if NULL,
+ * 			the callbacks specified in @rwc will be configured such
+ * 			as to be able to look up mappings correctly.
+ * @mapping: 		The page cache object whose mapping VMAs we intend to
+ * 			traverse. If @folio is non-NULL, this should be equal to
+ *			folio_mapping(folio).
+ * @pgoff_start:	The offset within @mapping of the page which we are
+ * 			looking up. If @folio is non-NULL, this should be equal
+ * 			to folio_pgoff(folio).
+ * @nr_pages:		The number of pages mapped by the mapping. If @folio is
+ *			non-NULL, this should be equal to folio_nr_pages(folio).
+ * @rwc:		The reverse mapping walk control object describing how
+ *			the traversal should proceed.
+ * @locked:		Is the @mapping already locked? If not, we acquire the
+ *			lock.
  */
-static void rmap_walk_file(struct folio *folio,
-		struct rmap_walk_control *rwc, bool locked)
+static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
+			     pgoff_t pgoff_start, unsigned long nr_pages,
+			     struct rmap_walk_control *rwc, bool locked)
 {
-	struct address_space *mapping = folio_mapping(folio);
-	pgoff_t pgoff_start, pgoff_end;
+	pgoff_t pgoff_end = pgoff_start + nr_pages - 1;
 	struct vm_area_struct *vma;
 
-	/*
-	 * The page lock not only makes sure that page->mapping cannot
-	 * suddenly be NULLified by truncation, it makes sure that the
-	 * structure at mapping cannot be freed and reused yet,
-	 * so we can safely take mapping->i_mmap_rwsem.
-	 */
-	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
-
-	if (!mapping)
-		return;
+	VM_WARN_ON_FOLIO(folio && mapping != folio_mapping(folio), folio);
+	VM_WARN_ON_FOLIO(folio && pgoff_start != folio_pgoff(folio), folio);
+	VM_WARN_ON_FOLIO(folio && nr_pages != folio_nr_pages(folio), folio);
 
-	pgoff_start = folio_pgoff(folio);
-	pgoff_end = pgoff_start + folio_nr_pages(folio) - 1;
 	if (!locked) {
 		if (i_mmap_trylock_read(mapping))
 			goto lookup;
@@ -2794,8 +2796,7 @@ static void rmap_walk_file(struct folio *folio,
 lookup:
 	vma_interval_tree_foreach(vma, &mapping->i_mmap,
 			pgoff_start, pgoff_end) {
-		unsigned long address = vma_address(vma, pgoff_start,
-			       folio_nr_pages(folio));
+		unsigned long address = vma_address(vma, pgoff_start, nr_pages);
 
 		VM_BUG_ON_VMA(address == -EFAULT, vma);
 		cond_resched();
@@ -2808,12 +2809,38 @@ static void rmap_walk_file(struct folio *folio,
 		if (rwc->done && rwc->done(folio))
 			goto done;
 	}
-
 done:
 	if (!locked)
 		i_mmap_unlock_read(mapping);
 }
 
+/*
+ * rmap_walk_file - do something to file page using the object-based rmap method
+ * @folio: the folio to be handled
+ * @rwc: control variable according to each walk type
+ * @locked: caller holds relevant rmap lock
+ *
+ * Find all the mappings of a folio using the mapping pointer and the vma chains
+ * contained in the address_space struct it points to.
+ */
+static void rmap_walk_file(struct folio *folio,
+		struct rmap_walk_control *rwc, bool locked)
+{
+	/*
+	 * The folio lock not only makes sure that folio->mapping cannot
+	 * suddenly be NULLified by truncation, it makes sure that the structure
+	 * at mapping cannot be freed and reused yet, so we can safely take
+	 * mapping->i_mmap_rwsem.
+	 */
+	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
+
+	if (!folio->mapping)
+		return;
+
+	__rmap_walk_file(folio, folio->mapping, folio->index,
+			 folio_nr_pages(folio), rwc, locked);
+}
+
 void rmap_walk(struct folio *folio, struct rmap_walk_control *rwc)
 {
 	if (unlikely(folio_test_ksm(folio)))
-- 
2.48.1

