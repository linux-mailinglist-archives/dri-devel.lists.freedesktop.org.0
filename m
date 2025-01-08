Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AECE8A0656F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 20:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C9C10E925;
	Wed,  8 Jan 2025 19:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Ii1mYHa0";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hp2tio2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881F610E26B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 19:35:35 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508IMrj9015048;
 Wed, 8 Jan 2025 19:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=0tC6sJcv7Q82wPOS3e
 3he86aBDqT5Qv41Qfcz6j18II=; b=Ii1mYHa03BjxPokSmCA1oGbvwNwHxq6rVD
 AkZKVJ6KvOAGIMPRU+OdUGWaeG5PgCxycbhwS/pYouSGwiwfTuSFzETyec0dkdV8
 6+1iGWOeLMliTveddWPCZbtRbmkCXYAGnG65LB4b0/OmwchhvZcm0hjnUFl+PYWb
 KTYQbkxU0Q6uABzLL8P2uAaUSjHbMJO5MaCZIIHtqeaUrHpzirKaEPROmze4/ycB
 Xv4WFlLnkeUs8Np1a3IHjLBOc1nLI5nG8Q0kH5ZHlQPJ7kJHzar9cBBF9AWczCLD
 J3VmOTNrxdqzFuQLZf7hM9P+bpobF+0qzgshNYUTa7MoUFgjVDgQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xus2fmu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 19:35:23 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 508IrSS6011005; Wed, 8 Jan 2025 19:35:23 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 43xuea0cf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 19:35:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oy8a8wAS5wl3cNu+ehpZmJcyh8JzJyXzrW3FFpjI+Bo9krN7nbBnPus5iMct4K2jTSkV1VH1J4MzKRIZFckbDR6RJDVP+atRo7hUFSpWLL+BJtunieq61sH9EmCS7/FqMykiAlfmLH5SC61DoFE81oGdHuHI2Xdke6qozdJIc1FV4sI0mTjTKyZnhdzM8eGaaCRODmk/sKIfF5Z2pQybE+7kgVlPcIEeF469Fx1XrXSfpYt23AiQT1mG4GC2X6iimmfJQ9/GW/Q4RBjWwlhh/vpArokYdD+w9XOqTTXRinVQQkHwWHA5bpXkKYpg6bxzXsWenI3corGFKx6v6rbrkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tC6sJcv7Q82wPOS3e3he86aBDqT5Qv41Qfcz6j18II=;
 b=JeiPZ/Lr0nMVgT295DBD2uLPkgdlx+Al+kqoA+RMK5ke2O0Ise7JCZqbiu5x5bxVPn3eYcPnus0jrNPsNTk4iPWRXpGaRNNU5cC/+2CSdSFDhNQD234GkMA9vzKaoaMFq9OPxyPPziUBqJ/trJppJ+0CC6DsNiERnn0tu1b0MCDkCaPzkWyo4lhKIfAqNsJaCDzA0BeddmlWm6dKMKSWVofQZM/RoM5Wfg4SsAbEpt17fahH+WUF8kn5C+LMDwv1lnmTzUK56kk+sWTPRNMBv+eZXB1kU2snkTXR0qP+fbcLSoqHYLAPAiK8wZviPNFKGLNOgxZJNtu0ggLT99WVNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tC6sJcv7Q82wPOS3e3he86aBDqT5Qv41Qfcz6j18II=;
 b=hp2tio2X6QgsOi3eRr7my/CD5N/a68yrpicIUKfZDbG5a5oLUol24DVd/+WTMXMLRrZYtxje1fTk+/W+Sy2D71pjXFIz1WkvWVSofccxbR1cN6fLKqFiBXhMDXCF7SJb99xzvV8Pt7kTgeTosdzolUDyceczAoIjFFrysvrHrSs=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CY8PR10MB6729.namprd10.prod.outlook.com (2603:10b6:930:94::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Wed, 8 Jan
 2025 19:35:15 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 19:35:14 +0000
Date: Wed, 8 Jan 2025 19:35:12 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH 2/3] mm: provide rmap_wrprotect_file_page() function
Message-ID: <9dceb81e-ca46-4dce-962f-af2962f78266@lucifer.local>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <701a67692d5bf9c8424cdbda103c988bbb278e38.1736352361.git.lorenzo.stoakes@oracle.com>
 <Z3607T2A-pukkuQj@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3607T2A-pukkuQj@casper.infradead.org>
X-ClientProxiedBy: LO2P265CA0360.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::36) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CY8PR10MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f6ac81-7faa-48de-46d8-08dd301b932f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tpkmwL+YKrJDx4JpnEKxs6sDRkCcXQ3vkMZ6srrgk7djAU6AdjfA0bsyqGtZ?=
 =?us-ascii?Q?O4Oyb5QrFXZrFQ8shO5tNAt7puLeP5QONtoMgWSlU+0EXO/WRPOwRcyz0DNz?=
 =?us-ascii?Q?MR/wA8GfVN7RqFLos899Uced+BCGhUH6ufIOw0ZnUpMY5XARlWrv2XQlOmFX?=
 =?us-ascii?Q?bztrOpF/Nr3O0hfj9OH17nAU5pmDLeuh1QiknhOZ77NHWSHLyavK6f6S1DBZ?=
 =?us-ascii?Q?ArDFUr3i5ji58bCXY9pmWmR4V/4ySAvNY3e9pIIh4XAQr6wVlyGw9sUt6d75?=
 =?us-ascii?Q?a2hY5SYNp7/cvQV8C63VD+vxRC2VRLStFjuzBJPLBpnBytxcwFSEbO9dGdpC?=
 =?us-ascii?Q?Q327GWGxLJjXGjIMZmAO4Br1ejQ2PQNrK2Dc0IywaTsevaFohhrRnG6hBoQX?=
 =?us-ascii?Q?Pu5n30Z0Cf0dpu7nHll2mvSgs50ePbRwlqF2j015SCsUjB2SnV4K0NRRea7h?=
 =?us-ascii?Q?SRuj+TyBYLaO4T1mBDpKzAGkecM21k5EFddhY2YI32YmLMP7oyQVRN3NE7UR?=
 =?us-ascii?Q?2tXXhx+XsI6Ed2JXOc9nj5TrCfSd3oPVn3kDAc9D4cCq1fw9SvS/enO77m6+?=
 =?us-ascii?Q?7wYfzczD0sTG699ZlGZpm43KafwxeNsgfNnforapS3+t9veAAocm3XoGYyeB?=
 =?us-ascii?Q?V3WfomzoZgB94TCCgBhQF8nrBjFYuifMWa/HE1497SaO6xysc/eV9xMDFqeI?=
 =?us-ascii?Q?QIvRk2oX/aqTEx3X1ZvfzRjWLbkSx+SSqRIl3IQ3+na0ThbTJIqZ/LFVRbHr?=
 =?us-ascii?Q?BV2tKoESNjylxrgLjyqdfyyPI00q7ERNtE4NSTo1Tmys3cc6XVGeYvo2JN9Z?=
 =?us-ascii?Q?OlBAao+B50kjLC0AADixEx0yqdFoCk/dMzgfYhfRJTJAvPSwWFya1urmwcjl?=
 =?us-ascii?Q?PSLjFsXuRyFavkGN/0LcRiXzSXzsON5VOu4sds06wsdtSELvn3Dgn6wp4Nhq?=
 =?us-ascii?Q?UFdM8sX0iubP5YyaEi0T58kLJcCfmxhOO3AIziGj6emkRBCVrvT7MxNeSxzy?=
 =?us-ascii?Q?azyViskwLWm8s7lfDQEBgkGt+8vog8RtgRwYl7vcKt1QoOzXEQpEWpfzhQWQ?=
 =?us-ascii?Q?2ueo1PViVYh9SzZB3QxtwzZmMFvA3+KI0czgtfC9zvCKwNBnzQeAEBEkyRrR?=
 =?us-ascii?Q?vcSx7CqDouOySqiq7CqjSQa92voOkt7HB4b5+Yw1PiFh8HBc4V5lw41ssv+w?=
 =?us-ascii?Q?Uy5thmgynX3j73iyjcX8lmlIgLtuWhPBLt7MmBqRmpCrNlvO++LKV+rr7bKh?=
 =?us-ascii?Q?NNKtWumsAi7nKtsaakGYJYXB7Q3THqNFvQYvL6v87DsJ6UFAck/EB7URhor5?=
 =?us-ascii?Q?G0uoQJXZm4BS3nOgr+Fg/AM1psCoGTFmX3H1qL3oMkdK1D7sRwmeo7qc9wMp?=
 =?us-ascii?Q?V+pJfbIEPR3BTtkZcPiEbKsY+js9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hhy2Eh10YTDhIXLr1efAIdjN6gTIdq0PCRnlF70ew3G6qFtZkha+gtXFbo65?=
 =?us-ascii?Q?GTqNTjG8jZKfFYRQ9tiRtJi72dpJJzxOTjFtPe5fEPdtZvn6bgjMKQhbXH1/?=
 =?us-ascii?Q?hovpMt795oKxA9E9POgyF68dRXXpINkA3nS5zDuBzuLEx/NWd4QJAiSoWVri?=
 =?us-ascii?Q?9zwR8oiIkFkpOD3lC9b/lvqh1zWfNax9iN301tjx8emBgj2SyoRjQXQFK60B?=
 =?us-ascii?Q?ikkRrcHzaB6czTR94XS6ae9GmdDsykRbfBhkChGILe9qjI7vMkIo1JdX6weq?=
 =?us-ascii?Q?+ERwGhGR+BsNWfz9Oz5QZGijmEBX7MkO8VBAYNKzRa4Aih5C3W6xo2R4PsGU?=
 =?us-ascii?Q?8KUOtRn+mXvdPxKqKdUbZo85IQkrFkcIR9yFtgacFBZE1Iy+oKDFB3hdnhJp?=
 =?us-ascii?Q?gZfLgTzw6n8hW8yBo3brP/w8ic+K+zap2YoZhRILVZpXSz8mQ1QY056UfhiB?=
 =?us-ascii?Q?ZaUCSVra4cscLMOTiohTFt4eeju80N6ZPoeUPprDMHPEBHAUMCiPUo4kyr+g?=
 =?us-ascii?Q?ub6tv4KbaSnjDnrNg5lQ2ITDhGB6m+m1TZawAN/OxE/gxB4fH3jWUD5Vrqm0?=
 =?us-ascii?Q?AQqN+vbKikKK+/kSpzAgxrx/eN+kvUrZ29H8eunbxPwa71plsyhHph793pEg?=
 =?us-ascii?Q?5qDz94Wf9Yg35ww+w9iF3FlMe/5ew6CP41oO+MwC5yzy10GDimjnvmTPTr6m?=
 =?us-ascii?Q?FAMxDCp0Yylvt0jSg0tk5RDkc41hw5nxwkuKRRUG37zd9MNb9Hn4Jw3AY/q6?=
 =?us-ascii?Q?EVBnqoTFMj85l9FvXE92I7TdDsqZCrSD1WbvyAw09Gsn68bac5JwURx7wvsN?=
 =?us-ascii?Q?WLl32JHHiTKOD95uqr/LM9fqveTS61ZTD5KOjBtNdFpvnBGtzh23x99rvoF8?=
 =?us-ascii?Q?wC6Ln8E+sQkRXFcjoEps7vvazt6N5v07zBJIfifEcmpo9gLhVm7Fu6q0DbSb?=
 =?us-ascii?Q?I8xEFhLHm/nvgmsTk37iYaKKm7/9p26I28uJIg3dtKm8rcZX0FOYtxKpkBWj?=
 =?us-ascii?Q?rlrfOLMI9wAZuv4w12aS+VfL5zQtfevhtAemC8IP5EPfTk0WZyhLGo7Fm6tJ?=
 =?us-ascii?Q?KGEBvjGR6BHOxRjUANbQxtV45xG53R3PvB0VkFingy0PuKf/SYxttMOE/CV+?=
 =?us-ascii?Q?FBcvwGIKTNVJa7by/jbdLuLmq/BVzc0c1NkIS8pryumVXXTFzpQBlWIy+H16?=
 =?us-ascii?Q?K2cNLwMUcaUiAnL/7f2eaBbIBZvd+IC9pxAEo2M8QurM8pqfrLKdtureNwtp?=
 =?us-ascii?Q?zfhYqNZXjwFvNdQSjxDElNCB7eRtxi5+17/Bs89QyHsU3p7JIFlpV+7OEVAQ?=
 =?us-ascii?Q?H88ncOxqgrnSxZnf31qLY9+rKCPDD6OlAjXrN/i4i04R4EdY11WqeajvCwWH?=
 =?us-ascii?Q?sAMShqciw+FSu/mj5MUVlYkYeZ5OKaxpY44MccA9LlYHgJ5ag2kL9ZrxST1v?=
 =?us-ascii?Q?2y2DkoZggn5BLDAnfUcjWd7AUSwqXeYPb6I6y5b1H2Qb6bgRL4sZoU1zBPKx?=
 =?us-ascii?Q?0rItiTprcZKp9f40s4vnURybEgTdZ13VmdeZRjnbzO/j0V6SUHEzMBuV92/e?=
 =?us-ascii?Q?Jr1hvGv/PtQA7tN4a5AkFFOBdzLF0a+/pT7wi+9jRdnKAVcVGGrg1yOyjNvg?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: z3hFTwmqvG17xEGP6+tnwya9FJh921qKnBrSzLAlGnZm5FSKYQywQCw0p2h01GSB2E0kvYJhWhsAtpX0on7Gmcg7qTACNm1cdhEY9cR23SGZBRfXyvQvUSZv64uFM9YGDH6+Lc6/ec2SZG08y4zoalpFoIIyl2Gdtad9Tf8wmVdFeQq2X7AoYbqPp4/i93K73IF1zBbv0RdO9NEKgsMbrTmFjn6H7r8OH/sMIOebSLTDKdlAw2mxcB0jcFLkwiLkCHQVDpAX99LOkIPpRF6EE69Q1D+EsrjHeH/ks7iiYUjq1N+i49XPUhU5rKTbSB14nMxPo4V9XI/4CHZZW+NXnvhZnmNOoO/KUcKA0eT9IdHcFHSz38iWnDi67lTfPriwfcovXbIzicn+pqucxrTwC3YmiqeNduIDBpKmXqqmzgWEjNtykH4OJkwSJHqo847zX4RRRLRLPg98n52MBY5eJ4h4NYhXSYBBV7NPITf2DU0ZSbQLHs15dlYVJg9VPnDv+SbVZ3Nvlqsa7MQOmICJSaX32oyQFR3QEgeaW6hxL2qZFNhRoxexW3OvOcJ00a+vw/DxH0sL5TMemZTN/aD/BRjcsJfQu4BTr8J02HnoauY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f6ac81-7faa-48de-46d8-08dd301b932f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 19:35:14.9513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMzpaXSpadnGICLhiS8LQKGCqWhD6LkNjcIDzBhCM8Tha60Bs9jWgbpLgOWJpe4M1uI4V0kpDcDQ2kJAPGa8bQj06IpmwQMkPaZPe2vIpwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6729
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_05,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080160
X-Proofpoint-ORIG-GUID: p3H0F1ChOJsnQmlkFHFfUBBdCF-fKk9Y
X-Proofpoint-GUID: p3H0F1ChOJsnQmlkFHFfUBBdCF-fKk9Y
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

On Wed, Jan 08, 2025 at 05:25:01PM +0000, Matthew Wilcox wrote:
> On Wed, Jan 08, 2025 at 04:18:41PM +0000, Lorenzo Stoakes wrote:
> > +++ b/include/linux/rmap.h
> > @@ -754,6 +754,26 @@ unsigned long page_address_in_vma(const struct folio *folio,
> >   */
> >  int folio_mkclean(struct folio *);
> >
> > +/**
>
> The kerneldoc comment should be with the implementation, not the
> prototype.
>
> > + * rmap_wrprotect_file_page() - Traverses the reverse mapping, finding all VMAs
> > + * which contain a shared mapping of the single page at PFN @pfn in @mapping at
> > + * offset @pgoff and write-protecting the mappings.
>
> After the '-' should come a _short_ description ... maybe "Write protect
> all mappings of this page".

As you _well_ know Matthew, brevity is not my strong suite ;)

But sure, will cut this down to size...

>
> > + * The PFN mapped does not have to be a folio, but rather can be a kernel
> > + * allocation that is mapped into userland. We therefore do not require that the
> > + * PFN maps to a folio with a valid mapping or index field, rather these are
> > + * specified in @mapping and @pgoff.
> > + *
> > + * @mapping:	The mapping whose reverse mapping should be traversed.
> > + * @pgoff:	The page offset at which @pfn is mapped within @mapping.
> > + * @nr_pages:	The number of physically contiguous base pages spanned.
> > + * @pfn:	The PFN of the memory mapped in @mapping at @pgoff.
>
> The description of the params comes between the short and full
> description of the function.

Ack

>
> > + * Return the number of write-protected PTEs, or an error.
>
> colon after Return: so it becomes a section.

Ack will do

>
> > +int rmap_wrprotect_file_page(struct address_space *mapping, pgoff_t pgoff,
> > +		unsigned long nr_pages, unsigned long pfn)
> > +{
> > +	struct wrprotect_file_state state = {
> > +		.cleaned = 0,
> > +		.pgoff = pgoff,
> > +		.pfn = pfn,
> > +		.nr_pages = nr_pages,
> > +	};
> > +	struct rmap_walk_control rwc = {
> > +		.arg = (void *)&state,
> > +		.rmap_one = rmap_wrprotect_file_one,
> > +		.invalid_vma = invalid_mkclean_vma,
> > +	};
> > +
> > +	if (!mapping)
> > +		return 0;
>
> Should it be valid to pass in NULL?
>

I think it's ok for it to be, as in that case it's valid to say 'ok we
write-protected everything mapped by mapping - which was nothing'.

It's a bit blurry though.
