Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1353CB556DD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 21:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E76A10E1DE;
	Fri, 12 Sep 2025 19:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="nFrrgfu/";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="SF08x1QG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558E310E1DE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 19:24:29 +0000 (UTC)
Received: from pps.filterd (m0187215.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CFXo9J029106;
 Fri, 12 Sep 2025 12:24:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
 HyS4tjzmif86OECD1IQXPj2J6PoFySPZZTErsmjD3JM=; b=nFrrgfu/b8w5i0XS
 zAmafY3Q1optcXnJF9Ah1BoZcjyiIYiFh04BVtShut6xNhfPbYyn/d1lQwJQFQnF
 gDUtP8myT2JhGZTnAN3FHIvK1zHxK4A21L+X67mMux+sVeQJIIf25KbcMO//tn9v
 gnDAuYJC0SE8NdZl8W3q4DpySdESTZ3jvY42vleZniEUnZqxH8HlUvApAbWMvdad
 HmFvMpQ7wN6p+b7fRRcK5CR5ucCYs1NNSWOGzmykGOx7BJuj91CfBBMym4W1dUPR
 TQaHFe5TZzhq7Qlo8jzc/kKSTXSchsOQl1OhxmBLgQlaOPWLohkSyCmx1AblPh1d
 7wbSDA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 494hwc124h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Sep 2025 12:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4D26+h2cAOdAa+Uljdw/YOEYC3ySOn44KUUzmDbqtx7cujfDTDHXQZb7GlIptlsx1vFxNGoEfMbWl6ikl0iPsmmSIgouGlh3uaER51NPMXYBuXljoPY7gD2Z8xjRcFKcJGQ5o4ikyEr5N2s7FuXI861ftwFuwZaETYqVCyBllo8tgR99qMcAaQONnZc2uGq0PldtoOJbKLoUqRU5B8gClfuufyQdpKNkmoh8AAARf96Y4uavoA2kqUzqcBoAQqqATb6zEn0sRv+sXMTg6hE8f8gOcWwGBBPhRyl9I0sCBwFWt5bsH06sR2q7PqzZNZemiJdtxB2DKDPSAQK5mSWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyS4tjzmif86OECD1IQXPj2J6PoFySPZZTErsmjD3JM=;
 b=ciEm1wSTEKywguwhZdAen5hPvxcH/KBd7Fhx0P511qUK5BZIy9wyb2oA358LnngUVOJgBTDxT1CZFM0SeaqFaY3zCmskcf22f4NZocEU+CSQ8pbNSwjAZlwe/0p+u3EuGTVrj67o91G6ov88zcOIT8JKOEyzBxfLgqRVfklRq8DRFuVpGzRFM+pmMb59lu/tYfcBsOj93NxEDhMSMaZcLCqFPQZMl4vkzZT0eVOBbqosw2tCdn7TPaKw5OyX938IH56Es7IfbzelZBW+75gceIqWPEgLoX62MW5tXbi43QVhZ2T0G3Pp15LDTsiOeGqXgS8+2hoq1VqFHrfl4F0vrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyS4tjzmif86OECD1IQXPj2J6PoFySPZZTErsmjD3JM=;
 b=SF08x1QGMJhkn+XKcvkaPsH79v50gTmrFPQhI2urZA8MEzrPaZE8wryo3srTo7IOldFLgUGdGTlImBA17eqX8hfSLHqX9z2hH8BzPUlh8BAVvoZ4eFN2V8/P3MyFbwXzKdfFgbIRDFVsBM1lVdD+6baP6uVsTSA4pJJD4EjmW+Q=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by MW3PR17MB4124.namprd17.prod.outlook.com (2603:10b6:303:46::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 19:24:05 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 19:24:05 +0000
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
Subject: Re: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
Date: Fri, 12 Sep 2025 13:23:56 -0600
Message-ID: <20250912192356.2067099-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAD=FV=WkbQeCaqHL3A3RzW9GhiLvkrZEbfLUFwfnx4LJQbUcWg@mail.gmail.com>
References: <CAD=FV=WkbQeCaqHL3A3RzW9GhiLvkrZEbfLUFwfnx4LJQbUcWg@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR22CA0001.namprd22.prod.outlook.com
 (2603:10b6:930:45::6) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|MW3PR17MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd8ad9f-a93a-470f-6403-08ddf231f013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NzJZ0YlhE9bq9Gujpktk+KoSOFGedTdLY1TUSqqeEuLmhBHRZSVyyUStFJiU?=
 =?us-ascii?Q?gfyg9gO4+RKNtcoQmminKLwKH7Z8WK7QC5EghVwEW312JUqWV5s5tJUCrkIQ?=
 =?us-ascii?Q?SDjRfNHg5gsR9aiRK0awLxFnQN0GcdKRnVqAHMzx3WesnqWIQoBiqXTDtEiD?=
 =?us-ascii?Q?5l4E0fxmJwPZ7zZqb4o+8RhaIVmFaXKBbkxNZV6s8QJbfamGnvEAeJZjZDe6?=
 =?us-ascii?Q?QDlV9WPAFwKHpgekoOUs4EFst6MTuVTrSQrnTcaqlYfXmtw9yht7fQkwEvBe?=
 =?us-ascii?Q?IAasHdw9POfyeJ0/l0UoanjNMEoHVpkF9Ln34JRz59hUZZAb526MTGnstzr/?=
 =?us-ascii?Q?qrkJU0E0id9udzuvJ+64yNsOiOE5K5xfdHydy6s0QQrxFrBTZkSP6Lyp1/6G?=
 =?us-ascii?Q?8gbV65RN7hOC3JbZA53rLLiXGMaiYlOVac+2cDc73NfnF84hRjPELZQ5Xo94?=
 =?us-ascii?Q?sjTQkb3OWcQgYHw8TASa78KJwoxrkqGMKxrOLKFDlOQWC8XdljR/bqrnbZ7j?=
 =?us-ascii?Q?CsXc09b3309+M5JqDc9n8vZK6BN3hKo/1kKYm4NZsbncYk2q/IUobYEQ+58C?=
 =?us-ascii?Q?UsLpOU9v9DN4Bdwr+WdUBUFyfmBOd9QLQrtrFAIwDLg4WTA4AiR6IlSEF7Co?=
 =?us-ascii?Q?d9PaDvzmN+Byiqx4pke27WoLrwlC2EVeKEnLAJq2c8CwMUJiN+hvlolx/wWt?=
 =?us-ascii?Q?YY/GIQ0j5m4dvtOYS2+3wXLiL5HgD1vZRkDAUZ2SXWPtS8QTgdxRTMWC7BSz?=
 =?us-ascii?Q?DpAqxBL9auzkkJLYOkbpkLLK6tV8N6G/niKgqKLH8pYsjrAnt4yxh/rlaipq?=
 =?us-ascii?Q?p6WEEXxHsSE7pUQUnWnCMmQxO0ySPS9AJWIIs32qbhCUQpThxF8lxAb6yGoP?=
 =?us-ascii?Q?9bDMjW45Nk6G5jPsthaKodMXs5GGEBOjB0UoePSo9yduusg7ZIScpEMo4ZwU?=
 =?us-ascii?Q?6kis21k8A+9kAVVhavCACeRrdJmnCi8rxcR8E/AifAXAhtUAvJTNfZXWZnj8?=
 =?us-ascii?Q?TO7vUmsHOSDcQKpkLrAPPKTpbwKqO59+fESUcTqnJ+LqKhD/xpDKQss3Ncx2?=
 =?us-ascii?Q?8KR7Ux76yR/khx4k0p03xSYN/3GNN+ZINzo1XRMfIl8YLtzwJeAi8rYcuudX?=
 =?us-ascii?Q?htS7SPzxHrm3tvqxM9IOziMDQQUKyRxKn7ni0AiiZArXA2oNmxjN2OLMdvj3?=
 =?us-ascii?Q?T+YlRAv88D1XkEDgXF/WQt3hjrGZpJ1M4c/ufSnLYlKniVugJDoW3OAFj7mH?=
 =?us-ascii?Q?/8oKkZ7STytaIN8qp6uCwntu9nyMQ3ZkI/d1iBHZmiz0BVKcDFEdwmiFaILi?=
 =?us-ascii?Q?C30iC1U5RChkIQ5yKfbc5r30ncyTz8jXfYh4lcdi5wT6auYkKxvBcKJt+4TE?=
 =?us-ascii?Q?Xf09Wyo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR17MB6130.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?atIzOo1ktoM/g8RnlEqLM5CVMapIdbMzpdkxGosINhu5NtLshpE/dX0DrWbY?=
 =?us-ascii?Q?8PGDTI4Rbs40zj/DWj/aVyo5nKp5K0sNfOVFXuDabOio9VjGWM4pALTju8Lc?=
 =?us-ascii?Q?BCWFsaUBEGxEVzCQOzGP0NYBlAzQD9A+l+ScuZZsBOxkB117nwU3QMBvA+49?=
 =?us-ascii?Q?hRpNi/VzLk2qf9hjlCREItdZ+Ue3UrqBWX8ptu3GEbMfg27qqW9kcH8DMctK?=
 =?us-ascii?Q?nsWH4tCzN0cm5rB4XVVxNmaA5GeUamZD/ixED+l+lp13oWjWAiHl+ywNWkmO?=
 =?us-ascii?Q?Htr2A6fozn+EIK8Ju+f2DV9y8IPsZJx6NOKAKvXmdXLLz7u/QJpV3yRRiVWY?=
 =?us-ascii?Q?SgLBbTCD/ai2ukjfrs/rWVQecKU8wVhA8xajZeE3x36djh9L/rnmTjw3Hr9G?=
 =?us-ascii?Q?dLKwzswTx5wPMSyt0O1pO8sjv2T9elY7r6jsrzRmJGra9Bus2MJSZfEroP0m?=
 =?us-ascii?Q?Z6n1U85b6Fi2Gsd6ZOXiFWK3OjZGqPRaURp3KaX/soLO1qZP6wtR89S5VhP3?=
 =?us-ascii?Q?tL0CM8VdYInkrRf6CssO/9YDeV8gYIhE7Tw29Huy9xiInbgljXgJ1GcoIEYp?=
 =?us-ascii?Q?C03PD1TIe6eUt7T8mfRbZAfRpa1do6AN6XZCdM4ybL5b4Ll6cWCuk3m0sjDm?=
 =?us-ascii?Q?Tjad/PWiIZ9D73/hjS1BCSrnF0IBhlTf+5rWHOIkmoKsxWeqTwdTxr1yidla?=
 =?us-ascii?Q?TiaAwk+/JPMbL7m5/iA/Wj9lQ+0UJdebkoru8LghvK09TKfrplEDLL1qC9ss?=
 =?us-ascii?Q?QDtBoNS88xrvGVnk00k48mwhUUD99V/BO3lDgqh5+AGR6Ib0VoOUDLlYdHcW?=
 =?us-ascii?Q?3oHfJ80tQgDysbcpIbXWgn4sy1rlOcZgEawgr8kmlvy+HLQ5twqwea1IuL4u?=
 =?us-ascii?Q?ItHSr03EWwsz95b1JW3LM4VQuFbije8OOb5CgTmFcA3k7Ma2kWtyaPfHaSec?=
 =?us-ascii?Q?AIC1/rQB4kNfTYBmNv5fc8opNKDOnPAMiRewQ/K4xKYRE31YFNIlVS3nbirL?=
 =?us-ascii?Q?0P5Wx2hQufIFtOBoKf/C0BNjgVVTdyQiTJ8mYqTwQK+DEfinOCiGapKZ3tbe?=
 =?us-ascii?Q?r68UOt4pP6pERsLpQruvf6OlvYCK+AzIX9P6UBT3jHDZ6vMVatLNCPwsrY0A?=
 =?us-ascii?Q?lyIOn7rNlzJgo7wNYh3fxA9kyFUV6wpf/UiAs/2BLnkO5eBnIYKrG91hQH29?=
 =?us-ascii?Q?aEoE+qekHsWus/9B7CLEoaJkKNSZLhQx5/Nol69Ug8HiM3vcxtZh4Pol57U2?=
 =?us-ascii?Q?3Kw59/VgmozTAsms9j63UGROcjnQrkbITjFCZqZp/PILdOvMS8/UUpaGboos?=
 =?us-ascii?Q?a4WWXR5r+EC9Kjs8nHsSaef3M7Kfdwu7uCObXZEKyHQdq/30m7ZlYAogPz0M?=
 =?us-ascii?Q?ttQm6BAvmzmJJ8GOchK+QPyhFxyWEMXVL4/Pq5R7T5ftxcngefA53N0CZ2kN?=
 =?us-ascii?Q?i4o4tiH54cXAgAHcCRk/FZafM04/7mG4Om7iicPjdGuWZ5YHzW96i6hF85RR?=
 =?us-ascii?Q?4DwztO0pjBJfx0EY/B+S/hNU2yGHppedKcKB4ecvqQvM5OFlaTbMAjv943y3?=
 =?us-ascii?Q?iynFocwG2ENVW7ieI3DyvlaZJL02oY12NpJHNXAR8K2ELjpgfsrfmushCeTR?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: mSkv2miOOsbSnA8OIQUKKu68I0sgwAUQsqX9fbMJasYFm7ixObKgtq64Pq8zDEFCxRw+v7bXsdoDzVFHTSnCy2C4d4fOPL5skaFeOY42TUxLD3aRX/Ol0etgRq9E3nm4GfOdpmeRnJrIJvz4C+wFi9sQf2v6oBnt4Pp/H4yKvvMDrYkUcJlDqdDAYjd54UTVsOueoptAExRgzF4bTEamg9a+DQn6ANLZWuzrYy1bsF8yFxM4GHzNnoSxFOyiWpxQJ+G66oKfy+dWhFtndboj/8+AFgpoBcxsFcuE0Vl9IDSWzYUjf1HZvJUApXVCSMpJKxMt4OOZrxkl2TYBR1SmR148VK3NKmCg6ZMxErESYPqFPQT3WHWDnXpwmLrcrfR0jWjtbsscMyOspqah6DRJXxyAZksj155UZ5slyjZQ8ZTT+PlRZMsBIMPMpXVRjaRk1C9iBVNKpFeIrRxb1yiUy315dURXLzxeqKvmwq3p2WDvneb5R1vv0AGc+o6Up89gArlFdfAc7ufd4WKNfL5rQaiTjwiAt4CXtnpum8o30/KJ69v/ZnXW3l8wUzguStx+9RA+rM6M5stMO5W3JjinpAq7oVQMtfg5tO2nZM6jy52tgoGgZOdkN29ptiUsokSU
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd8ad9f-a93a-470f-6403-08ddf231f013
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 19:24:05.3103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mNtZIUAkKuEBvA+rxcKEAemEKCYPcij5A3TZfX2H9Fzg+4Ol5/7z7dLzL57AVzs5g6X6w0zI4VaAF7MxzsnSPhCdeWO4kM78BqY3QX2LB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR17MB4124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX/a+s76YPAiux
 0YMZMXuckMlBaNUiJBE2GH8YGic1ipDYke8qe4OaSCZToQsIYTc2+aliY3QShWfBJQceePAl03w
 wwIBklwbFmD7xQ7/U4+VigJx33TleTCgewv4OZMUnvoIz1KYz276fJOlf8mOQfowaTkVFSiZ7WG
 b2iwVYes1FI+URgF45UuRI+pw2mKAIG0aTMDGcj5UxqMdhUMqkWS7G0b9OO9CnB62kXzCKT2Kxd
 gAZhcWMY+Vn65WicvO0MRFzSkASpGEkajGkPfdSdmIxKoCv4PB8Jb4urP3B/AsD2KaqDgMSwzuV
 qgkkSrzos9R8Uitz3Srg3hve5attOX1Kkj01KuTp0tp6rBHNmqsoeuP3Ux8lVyHHGmcLYmzFOmd
 pZBspbQr
X-Authority-Analysis: v=2.4 cv=TJJFS0la c=1 sm=1 tr=0 ts=68c47359 cx=c_pps
 a=S+bK3CcnjRkaVKfFm0nHhg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=vu2TTH8h0NUA:10 a=uPZiAMpXAAAA:8
 a=gQOvY88JWHA1kynjLCkA:9
X-Proofpoint-ORIG-GUID: 11bhMbbOd5iFU96jFP3TV8mdKt1NHZE9
X-Proofpoint-GUID: 11bhMbbOd5iFU96jFP3TV8mdKt1NHZE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120099
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

>As I said, maybe the problem is fixed now, but at the same time there
>is something nice about the interrupt type only being specified in one
>place. ...and IIRC the device tree validator gets upset if you don't
>specify the interrupt type there, so removing it from the source code
>seems nice...

My device tree does have interrupts already specified for the node, 
so allowing the driver to use that does seem like a good idea.

> [1] https://stackoverflow.com/questions/40011799/mapping-device-tree-interrupt-flags-to-devm-request-irq

The link you sent suggests just using "0" for the flag value lets the 
device tree flags to be used. I couldn't do this because the 
IRQF_ONESHOT needed to be passed as a flag or I'd get stack traces
every time the irq was triggered. Several of the other drivers in 
drivers/gpu/drm/bridge only pass IRQ_ONESHOT so I think those might be
using the device tree flags with the oneshot flag. As far as I could
tell, only passing the oneshot flag and setting the interrupt level
high in the device tree works.
