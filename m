Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC87869E52A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 17:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCE210E888;
	Tue, 21 Feb 2023 16:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CEB10E884;
 Tue, 21 Feb 2023 16:52:53 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31LGhhR7015537; Tue, 21 Feb 2023 16:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=0qvzB4cRoR+2uu//zERx3WMCJQB6ybvcFvt3enWAN0E=;
 b=h9vRN0D5FH2pWzfQ5EfqfxoJYKTYab7k/433SwYZYCsDZ6VZOkR9IXG7kJUX1qrOKRD/
 XJy2lc3aXyFbhUOWLjnOYceSaBUjWFBI8x8A1F7fDTaTLIKtiSIJ0k+RU0C00rCKtuOA
 A0AsUT4u+0uoK07EmvJGVTC/lxLZEJTBRZEm0Fd7rHY/Bn9lpPDrdG139MDc7zUyvnPG
 hhafsLn3faFz7EwBMHs8qNDsqKRoIxYfBpc/RGe4snj8SksGrHh0+s2qejtBsemjWo2q
 f2DEJ8kdxJDaIsY89i5MKLIs7joNKZ8rdqt6zC2AvihsggJ7I4ye9IcQa4SX138c7x15 Xg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntpqcdr2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Feb 2023 16:52:26 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31LFOxCT006926; Tue, 21 Feb 2023 16:52:26 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn4bwj3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Feb 2023 16:52:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMpuaRgGptjMhgJMEPgZ3uU++i220c0GrBeMP/OHULKI29lzS/pVxW0lsINlqGLBlImZTb0DIKjcKoppr0c15GSzN6BbDk0NyFGYtvR3wvzK0IACzcElWX18v/0KSJbJSjKDIi4V00z3vGKiLRr4D0uuK1J8Q0snfPGncCBmQHwlJ4Wfe5u/KX4LMzuGC+3O4pFyrq4WTrzq7uGGzQXsukF4ND5EZNsyWjt/B3W0kdWmtSaR4wX8xPygTTEdxFwmZ/VLldNX31t9qxlMjucNqWFr3q1HU9jKXdOffymrksjb6i8lh+pco0NFB+xRMfX+KCz4+iIJDvkEwxaJf214PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qvzB4cRoR+2uu//zERx3WMCJQB6ybvcFvt3enWAN0E=;
 b=XsrZcZaWOGMZBjtyuXnr4k0WMGSWQYiGkySvVuFk9KSfH6kIhJRGy4OfQDm50Z44LgRgdUEYoprNEH8ufp0R/XFyh/8Avx4KFbc7vTA/60fXIh9fdLVlW4ah7FIs+5/JdwJIPlcwAlT8WBjm/ysLEM37RbnJrS4PsKrZJQ6o+RNJvSmcOPJYc3Zqu5U5UYeNCC8UHhxiYyCLYgVgYZpR2Gnf90Z7jjBOWXNIOv5LYvZC+Vq1CNKSrZKYFP0sI+WfEPSoC3A+R0cFkDhhBD9WpVYdSXJ5WtNCgtPvmR8bF+y2mcIehlk+WzDeSAol+4i35XprR9w8G59KpIjc7YogGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qvzB4cRoR+2uu//zERx3WMCJQB6ybvcFvt3enWAN0E=;
 b=PpfC2WLxak0tyLn/bhJb4rldrSEV2jiIni3oidTRJDxxWbYsfZT2ovbu0SZyXeR057IgJ52xvoO31extsx9eghKWyBuQ0diva9Qri4sg+6L0psnVBUeIXgurBtrO2KzRSc/N6TRSHaJrN5W3jBQsPZVF2hkY+wXbFJ1kiidXMCM=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.17; Tue, 21 Feb
 2023 16:52:23 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6134.017; Tue, 21 Feb 2023
 16:52:23 +0000
Date: Tue, 21 Feb 2023 11:52:19 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 03/16] maple_tree: split up MA_STATE() macro
Message-ID: <20230221165219.omgbrjmow6hszzgt@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
 Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, christian.koenig@amd.com, bskeggs@redhat.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-4-dakr@redhat.com>
 <20230217183404.jmjew5lrduts6cpo@revolver>
 <3c9e368a-0ecb-fc60-dac4-f12fa23d8f60@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c9e368a-0ecb-fc60-dac4-f12fa23d8f60@redhat.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT2PR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::15) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|SJ0PR10MB4686:EE_
X-MS-Office365-Filtering-Correlation-Id: 2602b520-f277-474c-c470-08db142c010c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lPR1JwqVCqYua0HW+ymOG7mOvBD1gbmbnL5UmmTfBWNeMYPbtU+JUZflK16Loyd/w0dnvJJTKseByvea/m3LzXXJm1PFnIW0QTTwTSX6w+s8RFK8jJClSOYOupoIz1PHuVB5/lmnS15/gYRp5feaunwbTIIm56He3yNV+j2R8ZaVA+/ObLhdYH1gY0yfbIka5LrfbcX+yGJsilpXaYjNu6GL9lxEIcSV3ku1Iw6G4IsdZ4D17/G79dXeKV9CuYXu0GoHJjUG3wJLPIjBvQpw4NAt6v1L6Vk3eFJragK6L2qiGax2JpT3z0pdTSPnfse19nrYqfOZTCC5LLaBnRlM/zO03k9XT1H2eXwJnhlE1aUgG4h0wX16zyOgBiejg44vvpHGxsJ0xl0FI02alN+wAebY4KPguYJQey/PC2TGTRRrBwYWASyTR25neWjZ0IMnk9o7ASzdr10Gbvg70kVDDKFNNwHxgMFpnkTo8q2H4F3CUEhGM9bIvffOyxH9gtE3LANCe+YQwUxbsPCYQaNPew0RBk2jeo5JahC3bgtLSbVrn/i/NQkBdZsY6huMf3NZSuanCwSZfWGoiNbI30GqU0LAdR0UobGWXNqcnjtqYDnyFGWnvJ5tnVZjhB7R3S4in8/egjwnpBfdfnt2uTzm+4H4AxJlIfImnhGp0jJDOzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199018)(26005)(186003)(38100700002)(316002)(83380400001)(478600001)(966005)(1076003)(2906002)(86362001)(41300700001)(6512007)(6666004)(6486002)(8676002)(4326008)(6506007)(6916009)(9686003)(53546011)(7416002)(8936002)(33716001)(5660300002)(66476007)(66946007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sYzOBbRZUYxpN7ubFRGVyUp6GafDSHjMJe96DCL/wZ5SPsP2DX1ArgxUozDZ?=
 =?us-ascii?Q?fV2HOBEOjO76NoqV3FAGD1e2cbZWgSmMYfLudATb2QL4Lrkw9wYyHWqpWNpR?=
 =?us-ascii?Q?hL2CYc8oIu/1JkTg+eAnKEs5XG3PLtR8TU6MMDLleETb2px3h+bir1fPJYLF?=
 =?us-ascii?Q?hV8LMN6Vn55pl/IQXcoqPYyUY02l4vZKyBPlw97y1dW3/gjMUb3DQSq11DNh?=
 =?us-ascii?Q?W/+Q6orTCQPBoT8samt4/dhU6CFuQ6aF9NskvwGSOiBcYXPvEpGIQ5QHBuE0?=
 =?us-ascii?Q?SFwLbi2/YJJCorS6+LMcu/5DeyrQb/L4XujuCcJrYz32ol6DJCJKSEVNdju3?=
 =?us-ascii?Q?YPslbTY/FBq5A/STek4XSbF42ZBTqC88IwqC0UMPEQDj9lSJqkghWwczwA5z?=
 =?us-ascii?Q?JY7gHuTAiWCvApgLrz/dSz+oN0B+I1N5BD80S2dODUq9CsqiBTywCKxCvIIx?=
 =?us-ascii?Q?KBfVWIewd5oflcCKjjwMNutSXDwNMUHMvBYy4uxoq/TXgcgAVwYmtH3z921L?=
 =?us-ascii?Q?lIWGmx543Iv+Y/e/ZvYrI8/VDpH0EX6c4A/sA6mtC00N+OBdq46EQCT0qMHM?=
 =?us-ascii?Q?nR5OHid0kPyaG99lGs4P+bZGPVECWA9tRr4DavMYSOmxipBrAfA5MSqiPli/?=
 =?us-ascii?Q?E2zY42dvvc1cOwOzHClzIhGpTQgPKgIMw4tNZeN+PIC/+fb+dr6tlRtVdPtk?=
 =?us-ascii?Q?hGrjRMTh5nMFPe70gtSbjr6bHEtAFRly8SxjiZ5NjsReV9nn3sYSSi+gOIH7?=
 =?us-ascii?Q?8YgvltboniNG7OdJV7oDFrwa+jRZ2Pqmx7xSRRisptNmxguXiaVwc+2M+uZV?=
 =?us-ascii?Q?BfC0X99lk+GFa27kOaMEVB3dCADEW4w3QWCJVnkGhH6MzHapwhGA8X+Aocdu?=
 =?us-ascii?Q?tn9k6WnliGdeuPzJVCEi0R5dvkdtg3AgrCznlpSCOgZeX7PkVh7NxDp+t7aj?=
 =?us-ascii?Q?39QbQBGIKxY4YvEhEmyl1Bpk+tsgpJs/M8EvwFWOkQefbTbAs+tFzbcul7nK?=
 =?us-ascii?Q?QSY6q0XDJ4hV5/pAglMG9q7/EfrqBcaa0hkVDwBtvEvryvW33iY4JZcmdvRN?=
 =?us-ascii?Q?Ad0S/p3XYz+zHm6gxWE7hJUmNUuSuDD4DiP0mWes+arevsuPj4rsRsjvzqSN?=
 =?us-ascii?Q?op6IOm8WR0irvWw67RJnx1tbmSvrpN/W0MLWN7viE0YzUMVqgx3nTQE+B6E/?=
 =?us-ascii?Q?xtqbGP1Y3+LFBx0MImsP8Qx+2Yc3RzobVK4yzjeQA84u7qFdICa443jzwqYv?=
 =?us-ascii?Q?xd6I8ts0R7ha0ceTO6rVazI018QtBRvYYwn2hEx+9GLjBMuU16aK95vmyhrA?=
 =?us-ascii?Q?4PZbQ4WCdg5BjG+Aq+XAnnYnas5iTLISh4DKxi+7ZCOocLnUr1smTvF2OoJu?=
 =?us-ascii?Q?xyzhT/ic/1ZdgrgKkAtujJAHAM1H427xkWXz3ZbQXLiGKGV1N/IZ0cJ8s6fF?=
 =?us-ascii?Q?Cs14HwP0oQZ0ouDnvUoAUfK+BF1jS02P9jGtMaeZTwHxpoNluBic5WXFD6uO?=
 =?us-ascii?Q?hVP25rEu4DQLDsQOzJLCOkq0y76joJqIYi6aDbJEO/vK82p0GOAzu5xDUs0g?=
 =?us-ascii?Q?EO7yRUFFm8tGy5ziv63S5nt4ubgF9HPKZu6A5R0Pbw97gaC1+VxMjKaevpIA?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?9ipNMNeEoLxLFc8sKIRxG/vCzalyDSTRxVOjxQvi/RZVs73nrAgOBSJVWYbW?=
 =?us-ascii?Q?YpIwG7nmXHSheKsn7Uv8aA4vj0Y3E3OhmrwiIlnDRfKIVouKPWTg55Uhpvgz?=
 =?us-ascii?Q?jrz3qet7kXe5pigcA09NiRUeGAeMZCVG6TzZvIQ78nQBJt3FqF7NccgVRyrY?=
 =?us-ascii?Q?ilBaqh5Eayay4uO9sDDa3lghHX/DIxu6TsPJJYqiHZy0JWIKM297yfWLr3wj?=
 =?us-ascii?Q?tcRgd0ecJKWBjqODSr31rx5zv7i8neMKi1M+dIUL7trkMnSeP6auPd+t3C30?=
 =?us-ascii?Q?B90DTjPb93z6oYVZ2yHPjCOYlO1qST/n/WC5ExrTr0cQ3dxQdMB9OWlBbQnM?=
 =?us-ascii?Q?2jz7r60qjqKR4bq0p4sFg1HQXTqu/v+SgxQ1pfW8HWNXJI7DMTVR+RV2aw49?=
 =?us-ascii?Q?/XdymXlm4BH8h/X1Jc2iwsgN931kcEi9vwKrgE7HrawOM/3BOW7AAWi3tK3v?=
 =?us-ascii?Q?fKpr5p70gvOV4fLjBRT7BFhq4eN5EZVgRPmTd5q7p2o7GmKyOtemBdG/V1pe?=
 =?us-ascii?Q?twSrz4tPIQBQGqSOtUU7LaXv02tSvvzGpNYM6H9xq8e2Yq0Mr2+/+6NB5elF?=
 =?us-ascii?Q?+o4/r0x1ubiqKxjzz4cpm0EUXFZDZydSYafvPGHRTLuXP1faMszcp9Cywxij?=
 =?us-ascii?Q?A52VSKMqiVLyq/VqZXSARQzLAkxAYW66IwJ2zT78v3NdALDbJw4DeynqLuF+?=
 =?us-ascii?Q?hSZQyCHGMZbqzM4jMROkiuIB6Z8XetMcl2u/w4m/PwAbOEO55C3J/ZDtO/5N?=
 =?us-ascii?Q?h50f6xN7Y7GHRzlN5WiHpE7qxmAu81MStXS1uolCtVw0f0f0PwruFvw3hgVM?=
 =?us-ascii?Q?tvyi86TS9TASFkZXgRh1Ol0pDF1UWoAqBav/8+fhk2KdZ5rfwZ98R+M1bWNX?=
 =?us-ascii?Q?kC+7qZ03VuCErm5cW9O1OyN0EHqqrsi2W5GJnb4jNE4wZESJFJknfKBUzltK?=
 =?us-ascii?Q?/A4+uJTcrtQx8fThoq0lQZ0La0F2bxl3X58Y8W7yzqm5qhDlX3VV64B3szJh?=
 =?us-ascii?Q?ndhS5onQePfBLcMAct7uKyuUo0bJ3+uZ8sTogmfhNfg03NgUTdTGAtHXiDlf?=
 =?us-ascii?Q?GQqePOe54Tmo2hzf9MFjs3whoJrbUUB4XqzX0N5Q/jEHDG7YyVBfyE7/FXiH?=
 =?us-ascii?Q?aLtawVY2cY0c+euMLnWdB1KO3WooUpfMCw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2602b520-f277-474c-c470-08db142c010c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 16:52:23.7880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6Zn7a2MSM8il5auVRZIiSkFOiuDOpX6XkVHTC6zBuAxk3LSbos7a2D2iKUEvVSR//kuE9lrwE1nAwsdRoo9EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4686
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_09,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302210141
X-Proofpoint-GUID: 9H0BeSVfXWEtzpBzio8Cn1NXcozYxisL
X-Proofpoint-ORIG-GUID: 9H0BeSVfXWEtzpBzio8Cn1NXcozYxisL
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, bagasdotme@gmail.com, christian.koenig@amd.com,
 jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Danilo Krummrich <dakr@redhat.com> [230220 09:38]:
> On 2/17/23 19:34, Liam R. Howlett wrote:
> > * Danilo Krummrich <dakr@redhat.com> [230217 08:44]:
> > > Split up the MA_STATE() macro such that components using the maple tree
> > > can easily inherit from struct ma_state and build custom tree walk
> > > macros to hide their internals from users.
> > > 
> > > Example:
> > > 
> > > struct sample_iter {
> > > 	struct ma_state mas;
> > > 	struct sample_mgr *mgr;
> > > 	struct sample_entry *entry;
> > > };
> > > 
> > > \#define SAMPLE_ITER(name, __mgr) \
> > > 	struct sample_iter name = { \
> > > 		.mas = __MA_STATE(&(__mgr)->mt, 0, 0),
> > > 		.mgr = __mgr,
> > > 		.entry = NULL,
> > > 	}
> > 
> > I see this patch is to allow for anonymous maple states, this looks
> > good.
> > 
> > I've a lengthy comment about the iterator that I'm adding here to head
> > off anyone that may copy your example below.
> > 
> > > 
> > > \#define sample_iter_for_each_range(it__, start__, end__) \
> > > 	for ((it__).mas.index = start__, (it__).entry = mas_find(&(it__).mas, end__ - 1); \
> > > 	     (it__).entry; (it__).entry = mas_find(&(it__).mas, end__ - 1))
> > 
> > I see you've added something like the above in your patch set as well.
> > I'd like to point out that the index isn't the only state information
> > that needs to be altered here, and in fact, this could go very wrong.
> > 
> > The maple state has a node and an offset within that node.  If you set
> > the index to lower than the current position of your iterator and call
> > mas_find() then what happens is somewhat undefined.  I expect you will
> > get the wrong value (most likely either the current value or the very
> > next one that the iterator is already pointing to).  I believe you have
> > been using a fresh maple state for each iterator in your patches, but I
> > haven't had a deep look into your code yet.
> 
> Yes, I'm aware that I'd need to reset the whole iterator in order to re-use
> it.

Okay, good.  The way you have it written makes it unsafe to just call
without knowledge of the state and that will probably end poorly over
the long run.  If it's always starting from MAS_START then it's probably
safer to just initialize when you want to use it to the correct start
address.

> 
> Regarding the other considerations of the iterator design please see my
> answer to Matthew.
> 
> > 
> > We have methods of resetting the iterator and set the range (mas_set()
> > and mas_set_range()) which are safe for what you are doing, but they
> > will start the walk from the root node to the index again.
> > 
> > So, if you know what you are doing is safe, then the way you have
> > written it will work, but it's worth mentioning that this could occur.
> > 
> > It is also worth pointing out that it would be much safer to use a
> > function to do the above so you get type safety.. and I was asked to add
> > this to the VMA interface by Linus [1], which is on its way upstream [2].
> > 
> > 1. https://lore.kernel.org/linux-mm/CAHk-=wg9WQXBGkNdKD2bqocnN73rDswuWsavBB7T-tekykEn_A@mail.gmail.com/
> > 2. https://lore.kernel.org/linux-mm/20230120162650.984577-1-Liam.Howlett@oracle.com/
> 
> You mean having wrappers like sample_find() instead of directly using
> mas_find()?

I'm not sure you need to go that low level, but I would ensure I have a
store/load function that ensures the correct type being put in/read from
are correct on compile - especially since you seem to have two trees to
track two different sets of things.  That iterator is probably safe
since the type is defined within itself.

> 
> > 
> > > 
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > ---
> > >   include/linux/maple_tree.h | 7 +++++--
> > >   1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
> > > index e594db58a0f1..ca04c900e51a 100644
> > > --- a/include/linux/maple_tree.h
> > > +++ b/include/linux/maple_tree.h
> > > @@ -424,8 +424,8 @@ struct ma_wr_state {
> > >   #define MA_ERROR(err) \
> > >   		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
> > > -#define MA_STATE(name, mt, first, end)					\
> > > -	struct ma_state name = {					\
> > > +#define __MA_STATE(mt, first, end)					\
> > > +	{								\
> > >   		.tree = mt,						\
> > >   		.index = first,						\
> > >   		.last = end,						\
> > > @@ -435,6 +435,9 @@ struct ma_wr_state {
> > >   		.alloc = NULL,						\
> > >   	}
> > > +#define MA_STATE(name, mt, first, end)					\
> > > +	struct ma_state name = __MA_STATE(mt, first, end)
> > > +
> > >   #define MA_WR_STATE(name, ma_state, wr_entry)				\
> > >   	struct ma_wr_state name = {					\
> > >   		.mas = ma_state,					\
> > > -- 
> > > 2.39.1
> > > 
> > 
> 
