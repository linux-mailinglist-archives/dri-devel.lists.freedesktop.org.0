Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80A9B50677
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 21:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1687510E348;
	Tue,  9 Sep 2025 19:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="tpWxuUSG";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="cHW9zp05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFD410E348
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 19:37:11 +0000 (UTC)
Received: from pps.filterd (m0187215.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589ENpuY030507;
 Tue, 9 Sep 2025 12:36:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
 EpgulT6Dw2sPkcxsllaFg9xY+DvFlRILwFDYSBBn35E=; b=tpWxuUSGdax51Z10
 mp1qhlbukNy6M/puZfWTRxkic2PgnkAeXMfTOUdOKuc35VTsrCsiBUkXy3RQPHbN
 8lBHVmT18QupGtI8sC86222gIrCWOW1VGFLcX2mO9du0hPp8PslBPKUI9j94w0p1
 Xo1PKnQj43/E56GQQbtOC1gcJ85BxRBxAJ8wWfoLOr4qHRx6qyb9IfxVh+jA5Uux
 b5CtrKCrLDNTVucrqSA6FQ1IYqakA83kX6fEW8ZrzCgj8s0dEC8cp7nfnXLTXNcM
 z8i85/I6OEAHAvfT3vcEJN425n/Z+9SS+00UWnW03reVxz3IjMMOAp1b5LwNLYNA
 +IvU5w==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 490m8ny71y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Sep 2025 12:36:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChhzzoyJOCvbvddBSdlhti2E3gNV44dh6xmogX5WCiTiZhpowOeKiSpka4mV8lnLA0H66rv4YAese7HmFANXNFqPPIkbDYTuW0kIpsM8vA21BQt+rI9CZpnRExVXmNqC2884MjqnBz2Dic056clkpGPL29BCr16fd73lsVUOv90nD7+iPZxaVOesF1j0N/Rg/m5tPtfIu2RaKlWpBwXXRweKd/nonR4X3zvuMRa7bhAV9G86yLgVUnzfySpSd0Cb5Z2GVWyY2LfRhFQdF5tVYk9qKL3hoWHRKPMU9cNCsFZ/HVOo1ZS5uVK4icOaDHjA8dpXdnSeF/EJRpiqtcpLUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpgulT6Dw2sPkcxsllaFg9xY+DvFlRILwFDYSBBn35E=;
 b=nE87Ky3nyJHy7Rus2qqfhymwZqtjf8LnwxEcbp5GTyaDnvGAEFspzMLY83AKfNuYuLl6EJO+ackuAw9INgVF0UgHLWicjC4e5WlvDp8u7aDgkrZBi6ScDfDTjHPHJ/vTmHNKftGWNguVByM1dZ6khgiHxL2NhE8z2sveWI6ubClC0HG92MkvsQO2prjVyfK44dmOFgGJ1bCZkB0oxRd3J59VsFBHxpins1tB3vWyyVgIPhi2FbP1KF8KK4INlSsN/kARmoF4ioHpAnZao8O8EULqyrhhZN9yH29moYfpi3L9iPvxAkv/XJFEpSe6/4fOwC3SsWhDnZqzD+KoZrQelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpgulT6Dw2sPkcxsllaFg9xY+DvFlRILwFDYSBBn35E=;
 b=cHW9zp05lmvHX0pyHP6/EWapIbsKriddhLZrKe21PtKg9S64AO8JYy6jx/rQ831KEedrEAMuXrmnNCsgCrL2+vK/I4oBA9kMkw+PSdvMzRH02so0IjXzomTFIRd8+G7LE0hqkWuifjclC18XNUiuirEzehnY8HVrX/LotgGOEIU=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by IA1PR17MB6695.namprd17.prod.outlook.com (2603:10b6:208:3d9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 19:36:49 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.9073.026; Tue, 9 Sep 2025
 19:36:49 +0000
From: John Ripple <john.ripple@keysight.com>
To: dianders@chromium.org
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, blake.vermeer@keysight.com,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com,
 john.ripple@keysight.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 matt_laubhan@keysight.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: Re: [PATCH V2] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
Date: Tue,  9 Sep 2025 13:36:40 -0600
Message-ID: <20250909193641.236527-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAD=FV=XWhDtFWegUUeACxcrSTFh7kbmwVFy3sioboh2fgk3Evw@mail.gmail.com>
References: <CAD=FV=XWhDtFWegUUeACxcrSTFh7kbmwVFy3sioboh2fgk3Evw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:806:d1::12) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|IA1PR17MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: 222bb4b3-7a2b-4bc4-14ac-08ddefd83850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dutAJEb/v/IF4syBYYlG6ikPDvX9B+Q4kRaDm+mPm8AA4ESc6Q0fTU6PlIy4?=
 =?us-ascii?Q?9in3FTN0D35qpJjP7u3mS/2A10QTm1amgIr3biO5qC403G3qD8H0PRPAEVqs?=
 =?us-ascii?Q?m+APZGfba0RoRrwAPxGj3pEfMybfqaLmBPzoOwBGnnOeVOVlxZ7Ym08ch8NB?=
 =?us-ascii?Q?ub9Y2JeS2BDdCV7yQYJuFTyFmuEeEzogOP7rj1D1fr/R81e32kgWLh+1gab7?=
 =?us-ascii?Q?6VzdfnvioZ3V80sigKCqoYuRnempRqE+UEeUYkEOrrjKl7CYdnG7M95Ue7zV?=
 =?us-ascii?Q?n3hVCzHjFHeAPgvUkyZQvGTJBX1QCBTmlm0H2tHyDQFm3aVXTxP2nqCc6OTu?=
 =?us-ascii?Q?cOP7WVlaz0hrSvkm7nbrlk6YD/fXwwbrkMBCHvjdmlmxl8o3OYXY365H1YQm?=
 =?us-ascii?Q?PRgSrgN/cGvk6qRBzEnbQyhWKJevMs8BDngFEbqsTT3Fg5YdFH2VSCiWpS32?=
 =?us-ascii?Q?bo2BA8NimpHW4QgwrFaEYtdw7u9gcfaBBAudPtHc9B/aPCTATRPsthMdgN6i?=
 =?us-ascii?Q?Vsyo0ezqdEtLlctALHj5yaLDS0la7X870SSlY7fkRJhTiFNyvTteWJP2aFwE?=
 =?us-ascii?Q?wk9GBKoi8NpeiECIBykmahM5nU8I4ZMv87dnVMbMXuMOQnvAvDGuedMYqs1a?=
 =?us-ascii?Q?ABTW6buGpxTXzEdf/5NGHjJVbS+bNaibc9sKoyLafsHaMPve3pFvSdzfU4QZ?=
 =?us-ascii?Q?SocxNknmpFjtURyYpxD1VJneOHErw/FudtTONeZtuRYEaDffDNElNnkceEjW?=
 =?us-ascii?Q?HgVMl7u3rMNSsEYHfVWOJPPaDuesUYY9CU1VZd/8a3oyB7oWsNjOevA7UFf6?=
 =?us-ascii?Q?aSyvqiXiURxv5kvcc/aYRGuykrpUIB5UP+aGBel7KNS0saDDC6B3vjXwlLGr?=
 =?us-ascii?Q?8y8Jlu5DhgLC9R7xl94JvDRbyXevY7IZEHHFba5pTMg6VXW7DJgfZGTC24Px?=
 =?us-ascii?Q?T743Ape9uBtTbW9eYPl//5L03Imk2yo/I5bNJVE4YOGygHcX7W2ed7GgQ4Xx?=
 =?us-ascii?Q?SHw8yR+x7vKK9DcItaw5Rr9u+T7rtY+/aNUI3rCqgvkxCBdRauHUKAH3GuP1?=
 =?us-ascii?Q?fTS0FZVCc/sOsych47Cx//pNVJdzO5Bj+bAoEe1JE7x8mgyo4S78ZViTp/Mw?=
 =?us-ascii?Q?wVKwYi7t+CFm07pCyWioZEf9EZod4AWdZinWB8Micl5Ph334KxEFzcrRycvb?=
 =?us-ascii?Q?45u/vrCAYyZZCYsdeloOyi+pu6q0dS+tFX7VKKQBsstOsIJG+iszyGJjmFdv?=
 =?us-ascii?Q?+/LwJ+ekEOJnzxT6BH3Pgk2qYB3/6xnH5hM/albzpfbUPveliQ8ipXsjhTty?=
 =?us-ascii?Q?UM9R4Ri7yNsM+hzOX7dLYmxUy+5rx8BSWp3GOB9cBXIGAA/fmaXvqkor4wQv?=
 =?us-ascii?Q?J3kfpE/ifl/CR8PtLPVpSLMn/eQSGEmP/1GfLcY4qj+pGYhJsKBWD09B0tmI?=
 =?us-ascii?Q?47Lp5K48aMs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR17MB6130.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RbuwGUhyRjRIpsQXkkc2+SnsghtDsCZW1frGxYZjXLADcckPrX/KaV5huDvu?=
 =?us-ascii?Q?lhXNMU6NyR41fJsXL7MGmuXWlscpVXs5NUdJFp3LMIkEE1me780geuDWdXt6?=
 =?us-ascii?Q?6wdSA+OBP1gQ1zzk3KVKZfxQj2eZL9z0NOwrmr3NLa7yPTmAAiL1v0/DSG6R?=
 =?us-ascii?Q?g4NYcxJuPBxIyKTttr+nM1xzseZM58HVzPv9jH+17km2HJBJj8K3JVHZzklr?=
 =?us-ascii?Q?ng6pI2LuibwuNOAhh+idK9wg/Q8SVQQWPCaSoW+QOhUfsQuHt3J4VINYgrX1?=
 =?us-ascii?Q?pQMRCeeiEDPFJn+gb+el1GvJIGMOfwCoFPezM4CgrqPbO1ZljBiWwnImmCuH?=
 =?us-ascii?Q?5wAZ87vqPHcY9DixbmviY1yEkMJTQ32sW3MaESP430GvpPSJNp+MI4biQ2VG?=
 =?us-ascii?Q?hFETXyLHBckndrqxrarAhaKJE/DgG5mT0cBBx2uXeBH3wEinmZeRVyj6ME/0?=
 =?us-ascii?Q?9oBlIJxJFNxVfUJSesNl9wapEg5O2kXVshjDJW+2vBb4p6vBi5O10j7qS7ij?=
 =?us-ascii?Q?5U01e68AH4dG49Q6QauFm5H9O7ZmkKTn4+Wg21iMbuMEH8sOk/IBPRVUou1B?=
 =?us-ascii?Q?4q8T/VH18rPcTS+A60GorLI5W5NzVtolBdelJ3alDZfoLdrQ64Nb4gLT4DH8?=
 =?us-ascii?Q?Uvkwq/AB0LzTT42EvDDulcgW3kwIcTqxhDa2ObgOyNEv77tkO4U8FAX3c/0U?=
 =?us-ascii?Q?JTEEQngVWnc7xaM48e/Qzd0SsS99AkZDbHHggc4z9+fa59NBaOM+6DG8Yn2e?=
 =?us-ascii?Q?0prqCMPSGSLA4ydONQq3WmD6RwYeFjtnqOCOh7IfqO5lAb0PwL2OMU0o8zIE?=
 =?us-ascii?Q?DQ3lhp/ts2JqYGtfLHnlPDVjsWGhcqtBcHATKSo0wUywBgglmUzYFOQWgtSL?=
 =?us-ascii?Q?M+LiNMxAg30CZIO+SfIV924siJp3sRTzqbNUjnnleYLIyMuWoaRSJoBh6n5z?=
 =?us-ascii?Q?y4VZZKrcjoYBAuOthC6xHhzCed3sJ2Hnd773SjbPunOUmjHGxnxTYD3NVqxL?=
 =?us-ascii?Q?5CiHgBVyKrPV2XYIQCLYw3PWUgWfeWNzALrVMYXQKNMZKgHAQGLqDpGSFH2L?=
 =?us-ascii?Q?BOqvic0JDzkHdMCEFGFiKIre/pFnBtAiIF2svMCPQ5SCwgQ7/xSazBq/mA7u?=
 =?us-ascii?Q?TztrzVEb9DG6cddLrPal6TRuK7BW5qM4tp2yx7npchcWmf+iknKdJmD4moKF?=
 =?us-ascii?Q?fNsHr4lkiBnfZDgAF5I/FaFjhJYZGLo/zsuWIFKNz+y92R8PJD9eh2PlzgOp?=
 =?us-ascii?Q?ugWVh7zx1EDJPeYjAllOjUOKkNc1IwzCJWRLNa4XWfg9U8aeUiE9sUyMj/fB?=
 =?us-ascii?Q?YcQ6eSenz0yIqQVn0VmKocuHoosk+TbEhxUUZnnuBD/6qUfnGKpMPdfNywpQ?=
 =?us-ascii?Q?Kb0D5ympqYKTwi+3p3caLyR1jh4RV4dH4xDu/iJP2rW6Z04L7/8y0pF53OpV?=
 =?us-ascii?Q?ONfJae0XeN+WQlLO9oFgYFkTfW1hSx078E/G2MzH+TGEwTpeeGfBKSbxXrcP?=
 =?us-ascii?Q?/yF0inOracjVNXKRSO/JQa3D9G8DdyimDhhT3oFjrspWA/sIpVi2a1y36p0G?=
 =?us-ascii?Q?Txz9FIjEoXd2rwJVvDyXnHKUaYk/mKIcNRdZVHgRBVvHQWC5iK51JLQ6zDg1?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2Gh24GfIxVCh92m2z8eZYscYA8igYpj7q7mMHr600BNdlQYDDRQE5qzn6oh40YjGssa48Jiuzmo7e1x19EfBpP4tWDfZd4Q2d+CcIgLAi3t9/nZFSd0KKva/fdDkuNIsWrrngQaVYT2B9M7Ype1fGOnUZ6FJbLLixYdiAimwI7LRnoyFOiriV5kSa+4uMqIUE0LlZT40PxcKLeA9EEXAW0nz9DZV1sQK845fQ/vyrJt5IPBFoiDBhhW8Pjjw/uEZur3oWLoAFjBvReSwGMpIbbgJpjiI+QSwoYmEXTelXd1wNzD0sQZc1v5E6ag2Nfnovo+D+GcPTVJA+bjgYyNP0zR56gtGPyJAlNjjtmTZG0NP87nzXwU2U7ABoZ/RhhmAZv2p5L7MpNjJR3D5lKaN2BZ8U8U1Ste4y1n6/LDWbqc+t6VdKX21xSnbskCTgbBFv/gwmhMVIvwijdfSJeuf6OPbh06d2hXVMFOyofnh3R6oy878CCYL9ZWi+f/9CqMseZj5QfyM/p21qrji3ao+gmwIjEHCMYd5k1ZkyXAYmOtaubSpuLO9sDBzqgYT/4eMlWu/5+RSXaf2M2unyZLF51r3S+dq3l64rAbZhCHXv9UUEojb2zM1MgC1Sh61up8e
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222bb4b3-7a2b-4bc4-14ac-08ddefd83850
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 19:36:49.5343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EB6B6ucZy5czthLGrLQ0Pd04IQ7V4hUusr3YZd9BRygT1kj2jUo/w+D3pKhc23OzolrBMtknJCNvHnQdwckKOMzVdFfMBAnWvEXJiXt7vpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR17MB6695
X-Authority-Analysis: v=2.4 cv=C4PpyRP+ c=1 sm=1 tr=0 ts=68c081d5 cx=c_pps
 a=k8WdsgGmLKCkffjC5Q7UFQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=vu2TTH8h0NUA:10
 a=ctSNeKHNUa5XGTd22DUA:9
X-Proofpoint-GUID: z64zadPChiNt4QwOVVEtm7uF6c4V7PVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDExMiBTYWx0ZWRfX3hn1JiD7fZM4
 Jqc9cSVkn5FZ/qdea/WgfeJACTiL0lXUdWbn9Wft5KkJmpA482V10/uVN95mRwIEe3GTENQlKN8
 G31t2W4GrPXwPIDu+8/oD4EYhVGDAgjx+97Nd6HqHIPy1AeCitWzALEsDzsWd6U0IiI7rAC5M+B
 B6iifUUFzF/1gtcn5xWlWYE4JOhS+TUP1UTBiDfsggjrpGgbi02/bxkPQU3GXYIzv2ML4aV4Q19
 jiAabxVVeqrL7zQLIKv17Z3aDNwpeztcM2wH4t2+Wfxb2qrxMbXu+2vi9FzuiIV+1l43oi36rbI
 0oFHgIXMye5Dym7Qv2HRe6dhhDYdb2eBv8g8SnfnOuKJ8v02vcfD3Q4vqxl+TEtGnZOMKria5VO
 wHDGz2fL
X-Proofpoint-ORIG-GUID: z64zadPChiNt4QwOVVEtm7uF6c4V7PVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060112
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

>> +static int ti_sn65dsi86_read(struct ti_sn65dsi86 *pdata, unsigned int reg,
>> +                            unsigned int *val)
>
>This is reading a byte, right? So "val" should be an "u8 *". Yeah,
>that means you need a local variable to adjust for the generic regmap
>call, but it makes a cleaner and more obvious API to the users in this
>file.

The regmap_read function takes in an "unsigned int *" as the "val"
parameter and I'm using it to return u32 values (which could probably
be u8 instead). Would it be better to leave this as the more generic 
int type or change it to u8 so its more specific to this driver?
If this function gets used elsewhere in this file at some point, I'm 
not sure everything that could be read would be single bytes.

>> @@ -1219,12 +1246,28 @@ static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
>>          */
>>
>>         pm_runtime_get_sync(pdata->dev);
>> +
>> +       /* Enable HPD and PLL events. */
>> +       regmap_write(pdata->regmap, SN_IRQ_EVENTS_EN_REG,
>> +                    PLL_UNLOCK_EN |
>> +                    HPD_REPLUG_EN |
>> +                    HPD_REMOVAL_EN |
>> +                    HPD_INSERTION_EN |
>> +                    IRQ_HPD_EN);
>
>* Shouldn't this be `regmap_update_bits()` to just update the bits
>related to HPD?
>
>* why enable "PLL_UNLOCK_EN" when you don't handle it?
>
>* I also don't think your IRQ handler handles "replug" and "irq_hpd",
>right? So you shouldn't enable those either?

The IRQ_HPD_EN documentation said:
"When IRQ_EN and IRQ_HPD_EN is enabled, the DSIx6 will assert the 
IRQ whenever the eDP generates a IRQ_HPD event. An IRQ_HPD event 
is defined as a change from INSERTION state to the IRQ_HPD state."

I thought that meant the IRQ_HPD_EN needed to be enabled to get any irqs,
but when I tried removing the IRQ_HPD_EN and it doesn't seem to change
anything, so I'm not sure what the documentation is trying to say.

>> @@ -1309,6 +1352,32 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
>>         return 0;
>>  }
>>
>> +static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
>> +{
>> +       struct ti_sn65dsi86 *pdata = private;
>> +       struct drm_device *dev = pdata->bridge.dev;
>
>I'm unsure if accessing "dev" here without any sort of locking is
>safe... It feels like, in theory, "detach" could be called and race
>with the IRQ handler? Maybe you need a spinlock to be sure?

I tested a spinlock added to the ti-sn65dsi86 structure that gets used
in the ti_sn_bridge_detach and ti_sn_bridge_interrupt functions and it
seems to work. Is there another spinlock created somewhere that I could
use instead? Is using the spin lock in the interrupt and detach functions
the correct way to do it?
