Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050E3B583EF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F8810E302;
	Mon, 15 Sep 2025 17:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="TJSuwjP4";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="MxlyPL4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A2910E302
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 17:48:19 +0000 (UTC)
Received: from pps.filterd (m0187217.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FAkCr2018507;
 Mon, 15 Sep 2025 10:48:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
 9DZLVZ5tO+u348txv1rJKzEq/UYiC9jqElXDh259pec=; b=TJSuwjP452fdl0ex
 7lEbUc+T3N1ZaSmiAaselawVxG1ALCRky4EvfKAisyE5swl5+nkuCUEc3ZzjdFg3
 kzJNCgIPQMOXEqubZB7GmlV8/0szu0p4mMSoYHDZyaLlEg90Q33OVQHdTcvOcS5x
 Q2yduWBfsfbO6PB3ns+6cTxnJfXbqsRL26ub8eHbyCvTO7eCcud614Ux8NHb5TOm
 XdFJU6n5EqLu/pCbwJqVT6pTnifYMeLGjvLDhfG7Q1ni7+E9fDiAVvZZKb3wjuf0
 FW1Dox8c3vBrEEmBiFhjxR2bfDGQRoH2hGmU7B+f6JD6fX2QpAY/ODgV9dDZZrbl
 LfvZjQ==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2065.outbound.protection.outlook.com [40.107.102.65])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 49581eujjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Sep 2025 10:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjZh57N/lgWxHm6b3/ErknojJn+hPjmbSf7P3IxBNKEmbmkg+O4yV6jeu2Wq059DaLpMBWeee9KiXhi4H0ClqNm9ejSRnulZ2qNnDyZjd0p6uppUTa0117wytrpuezlvD67uD06ojRp6kepl4vVwppRilUeCY7wBEa8TOPl+qjCjXEjPfPfZRg6zQwik345qDwQqwCcr0qeq31RSJT+wLgDLS3TTojLerIFskIOESiZhNcQqeDUCRQIsKeFL4pq9FElXDnY4h+gL8yBIH2UFphs8mIcDfDcShtR51aGv+B4BLlR295ebrXUvtZTCOx+QlP4ciObiCr1tKbW7jqehKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DZLVZ5tO+u348txv1rJKzEq/UYiC9jqElXDh259pec=;
 b=un5+MeWko2ZxH3YPV+FUZYgY4gnvAdmwh0axBXx54R3fRZZrBaHbB9Pk6G9e3NyRvHBXnZ2ru4Tswy+Py2UtPb4dFP7p0TJqeiwFNzsrWAzSW7wvqeJ4NdiBDb3+sEQm/xDUBCyNIkUkp0Y8vtR/DoC3QUqsPF9eykQnxi+q5ABBoGkwFrSEE5db7sqcr4buwvw0pLhf7kHYuOaLUxZO+w8aEEt3ix2dVHYJBiNX7qd54D6RCWyS8KodjS3EEcg5bciskXN+Z4vk0NU3AnJFbc5pEKfAgxcPtggMPXkiGRdmYsJVGsKMYWRrytN7iK1VxY6sQpVTguEkqgRGOBzvfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DZLVZ5tO+u348txv1rJKzEq/UYiC9jqElXDh259pec=;
 b=MxlyPL4KX2U/QyZO3LFE/fEhG7euBxCYScZXAW79xfXpmUlNp26CqCPxvsOlyYa3+U/mYxDVkb+IQYVnEVdI1+Q2DjnYnzCWpneyBEOJIiUsyIu09zSvKY1uhlG7dvns2KDy01SGU4sTKMMnRyuRXyFx8Iu3/+HQvgxQzqK8Sl8=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by SJ0PR17MB4758.namprd17.prod.outlook.com (2603:10b6:a03:378::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 17:48:06 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 17:48:05 +0000
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
Date: Mon, 15 Sep 2025 11:47:57 -0600
Message-ID: <20250915174757.2566288-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAD=FV=Wij7MjyuS0b+4jn65Oq7Ee+2-__+5GjhfURBBk9G3kpQ@mail.gmail.com>
References: <CAD=FV=Wij7MjyuS0b+4jn65Oq7Ee+2-__+5GjhfURBBk9G3kpQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:b::37) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|SJ0PR17MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: b46024cf-7c9b-4416-e1cf-08ddf480066c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y6GHcklFWiwVQtB59JEc0d9SN4LNMY7aOhGETEMm+GBjUBXruPEtZkqYnDGQ?=
 =?us-ascii?Q?mE29CukeOl89jy4HbC39I/i4K85/Ii1ByazP9ED3FIddi46r7MQt1/CT4m3v?=
 =?us-ascii?Q?cVJ63nhcnN1ryH0tSMfHHIaFbqcw1Zn158O5JC339LOFxA85B/V6DWpPXQs/?=
 =?us-ascii?Q?wDLREw4P46s/Uyej4dm7QmiOggdHZnVVVPWCL/e61v/zedjC4z4QC3OzHoQf?=
 =?us-ascii?Q?QJsGWJXHKaddNuB7+jJYFrQN3eABFUJEWYTCACO7wrMRZMnnD228k1tHN3WX?=
 =?us-ascii?Q?TsF0gVdRsUd8CpAuSPsH+7zo6MUPyVLeWTgs1McujPRM4UXxE9mDbhUfrbrI?=
 =?us-ascii?Q?GLCOUjp0GVPT2Zxl+fccBMKhopMsU0xDAvfyA4vQJgeUw1AUYcglnNZFlto0?=
 =?us-ascii?Q?iw/2MSnjSVSbY9SorM5CcTEvJP7ty9hsZbsvPCA+yztekj2iTV9KOjgVOjEm?=
 =?us-ascii?Q?aSsRmOkGvIpAmTVtTNWlQChDZdlzm6Rs3cYkiqNJ/RU1JPqN1P//ZNdycke/?=
 =?us-ascii?Q?OLRQmbiE1VB2dKyHeP3nEfKva5ycpJkytBVeaSn9Jb5rgiEJewdaNMQJsnYH?=
 =?us-ascii?Q?ThwrHPAL2Hz0qzojSWx6/GjjF7amwfZDkSpXhs9SZ3hQn4qZWtCVgqMdkpdh?=
 =?us-ascii?Q?rSmerZUV4uqz0kxWZeRmvstKhYMd6w2aN36MSXJ9RdaKLpnTa0OhLZymXeTC?=
 =?us-ascii?Q?XrpAo6rNHlvwKD6giK1ncF1bZImlNVgF+MQSE4Na+/fs1njKnT89oQUScs0h?=
 =?us-ascii?Q?f8FHJjizwR1/so+Wk7DSgefJUVez2G2TUKVPCB5fYr80O+V6RubWOpHB2bnH?=
 =?us-ascii?Q?rHZu7gD5Qyj4LYuuktoIoDKOPDaXhpeZ/mVmY579O+wXjhK0CNyqEX1KqWKL?=
 =?us-ascii?Q?B23vyrZAz6vZiEbzF4+88YjT6coGc82I9ie/gAz40wlnyYp1t+mIXtK+hH7x?=
 =?us-ascii?Q?4fzU2GrEe13nPUeaAF90CKZi8l9LmSKM1qwy97EIeD/MUdtdMcozoQBapVWC?=
 =?us-ascii?Q?82FJk4k5iBNhk8GVwjduXQrHd20foVPFv3GjV3UBG1OvXYO8DU+G752FF13Q?=
 =?us-ascii?Q?aQd9yF7+bGEHcSTbrkM3l+2gg8oeNf+6WUKfePDz1yCBsMlNP9bZP6r1GswN?=
 =?us-ascii?Q?usFvA6db8URoqI7E7SVEKgZtcyAS0ScWZ8LemHJLc1Jan0c6DjQgOMatgUq/?=
 =?us-ascii?Q?jJ4jL7PmJsOm5hpuC0PtZ049ltZCIdx+0sHAyG1vbLg7N5FkkskOfsZvLyUk?=
 =?us-ascii?Q?h2M4Brxaq4ZhQgNf4kg1L5hX0eRuJgL3z6pe/5J3fJl+j/SetcuU0L+9OuFq?=
 =?us-ascii?Q?NcOe/2k7kHgs4pCokjJCf4fHb/As5sVcheA5hiYNF/R+zeQoQUFpDBjjA54Q?=
 =?us-ascii?Q?Tw8wyf/XB6tRntzpQRcVwRlB09AzF/6NcqsT+JCGzL5d8uICFWq91ko3KAtJ?=
 =?us-ascii?Q?VJs1vDTe3Yo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR17MB6130.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LCXX/pX7aCscp78XJvU3GUXgqp7akDwxULNAC4XdiWIfOgZoFHft7Pe5dHHB?=
 =?us-ascii?Q?fQO0fHycO5Z3wYvxP8ht1rSI3c+XWU3ETondDLj1YF5xFEqWAqd+GjrLhvm4?=
 =?us-ascii?Q?FvldmkrJ6/TuE4eR5GswmFqNNz4IACDxtivTN7jANn6sCgrchiRGBTL3JV/w?=
 =?us-ascii?Q?aeMOqVZxhWogQ670YrZMks0dxy5bh8vmtai1zuHZes1qOSkbo8cisulH0LKq?=
 =?us-ascii?Q?7NvD6J9vOjtkPmYe3s/dJaQGDEHqgizBbImQ8mJHznvaer5TodiNISzhz5sS?=
 =?us-ascii?Q?UcTJFWmUY4NHTKzoSaFKyBR44sq4cHAzgi1uG/kN6Pc8HtrZPIldJA46YbKT?=
 =?us-ascii?Q?X0EJYmflaHN5HfFiCh4lH+xM2cRp3eZg1AwvBUWg8CP3aoJRRQwcMCFlbEvT?=
 =?us-ascii?Q?fUjH9G5rBcv1Bf8kFoMdY8XB/9dgwDmb6Q/46v/u8X67y+HHB6mMp08Caxva?=
 =?us-ascii?Q?QWzisVNWpvVsM4iyjZDnXUF041Q8Arfuc+FklEMIgZ04S1xjj0AYuNetOmfo?=
 =?us-ascii?Q?E8lEhySYQZeAdlMpWN/bkGRfHn9OiBeuOfxUn8Wn41eNBRW55ueIv+c38xFs?=
 =?us-ascii?Q?ZzquISzaI1ZRO6b78/esh2BSnUTkcSU6Remw+uw1Wd50Fm9olggdyYpHIkxS?=
 =?us-ascii?Q?lqEojnMK8Sd7OkRsC0dT9zR8m2JztifJonP36TcPpzHmJ1tbGPs0LOUe9Nj3?=
 =?us-ascii?Q?XZj+wo6m8p7eg6rjKWQkBNm4CjQfh1tGA9J1OpkQiIl4MChGYYprymNeSZ0r?=
 =?us-ascii?Q?M6prh3wu0KK+ZJ8lSr8r0NzomDTc0fmATehsFWmeuMtUyKwIc6JnTdWrqggm?=
 =?us-ascii?Q?zqJ6XHEvcdw/Pr1zPpg+FTYE8QjuHNq9KXaDLqilF8NPPApKriBdkDtYWw7K?=
 =?us-ascii?Q?7dGMfuH+TCgR72Q3YCukeOj1ENSh++37IEr9gBbJ9/13Uc9G2m2pCQrvPk2i?=
 =?us-ascii?Q?F1W0CD7VnWhfVXcEnux/bey+VnwIqSs2UHJpFxNSVTy8XOnBwCsLvZ1mxnMW?=
 =?us-ascii?Q?p5N245sypkm+ax15rCp8xq4sqAp4PCt0QUva3HeLORW1TSXZEJw1gSN5DSUW?=
 =?us-ascii?Q?+T5YwIWcJKM5UW0q3IAvVDLlWTnI6spaG5Pqm/Ky5t6k8wxKcFZHileu5fg1?=
 =?us-ascii?Q?ir2K5MTAh6qz32nlrn3bQM5SqYLYKT2HvfK4oKEXsM2fFWdAgY3mccp86ZGn?=
 =?us-ascii?Q?Dv49PDgkr6nO9P70l2nlgUK75TTMox3jRFMIibhljVJ6fl8LMHjP6ez5Cmhx?=
 =?us-ascii?Q?H6Nr5ZtJm60ri5Uve51eQ67BHenLBhp2iGq6IYvXpxIZK2/pXOUw2yChQCnQ?=
 =?us-ascii?Q?aC8mU5PEWbfCUOLGYQorBrMV5vycO121v28JzaaOK8NaNHqxEFbbTp9Csjcb?=
 =?us-ascii?Q?T+1RkQZ1LdsKKmWIWCTj2ttaqPKa/lhFO+9nVjScCxDEaT6sBnaJOWNYakIg?=
 =?us-ascii?Q?zF8Z/WREoiQhNxOzWaZCN0sYxnMITRer6OSuzO6aFw5FlyZKSYWzDZPYU+rN?=
 =?us-ascii?Q?4S7gkLe8be97JJoOVrEHMq+HuP99aza+PEw4md+cPz3N8/oE4uJEt0lFfC1y?=
 =?us-ascii?Q?OeVh5GfNzipTu2PMMJIjBs4gRHOQNLwLh/hxK7tPDqHF2ZdAQGA8Eby89GQR?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: l5/9S3QRWokwbGu+i3/lUWWjjc8YQbhm6F+I76km7Zn97u7GVhB8y0WioVFG/SrrxczH9xaBAcD014KvlcIpmdUwJ+SEpsiklFeNKIRXyeuM5hM50bbmNA4f0TmO5UJpfgA5536S0TtmTRIEpNJnVtDj3H+DCd0qPmF+I3I4He1u5n4M3/H4aJIwCzQF4b47sOFUNHGGsEniRbmw4Vr+ToR56uJ6d8nXlObsoK3QF/FaNIbM6koGYTRFmYrRzcd9M8ov2XsNr1DDrbGaiZnsR0jtiaiMdSmD5eofSxvp+Zt0rkDOdbzkBNUkA+u3/PQzfoCXdv3v5lpD2gMmYFN31Coy33s8B5DXnRgEbQfXI0kALZGbCvcQnSCsur1bLyWJ0AHViIgYZumK2b5QW1U3MW14zRAR3NkiHI8s4YJDaZhs37hpSjGXkKWbIGUskxjV41lHF2U7ZcniAzVQmI1KIxCHWD+VcgYf8O6FH3SC+9vJP52CTsVfA7Pirj9A5AbHH8q04tA7D20NHhF4fi3fKCVKmOdRcjfjlZ66wJ2M/HYhhppbhtp1jAXVLJFfjJeyQsM7FOecc0tf7d7tdY5fRxQQe/NED+1wIBJXDuuJPpQrzFlchiUj7zE5Nt3YK1lM
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46024cf-7c9b-4416-e1cf-08ddf480066c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 17:48:05.9358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uv7L3jKc7fJqyMrt+qumi8Y3byu1IResWpDANpr24onwGw5HAKXwK+SWcCcpBmoxKd2nwPJdqheeAGC3+OQNNFaRECiGoXDM8LAWfNc/P24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB4758
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDExMCBTYWx0ZWRfX3BzYCoacBLVk
 pl5eGJYX7nndcocofdVWNIV0QsrpI7+yAl+IIOUPEganBPZ1lmN6fnfMt5SyHI9E5EKgIo87Sac
 JxtZrx7dpRk2vW68sKs/ZmbxXIcXO0uBDcXqsYLfZH64v9wBjZxFvJXyoXVr4XlEDfnZ7dXT/ib
 B+JnAPsdBzEG49gg0HLuOC1PITeoDAmnMP8q6ZJQD+C+avISlQIDZTDVQeipeqzfp+lSuNcoMrL
 KKNbAfpbHHmziFJlFDozQv123niMllneTBuYaUaNYdju5vtKRtSR/q/dk8BaS6+AOlPkA1dnCQ1
 jh7JPfghARREsOv/FrufQ5ryyDN2ymtzW2NsfobVU+fMPirRFfsd2NfA8g3B9DN/1IuMf82fOA0
 FxsSabtK
X-Proofpoint-GUID: VEDfSngR3WN0Y8oaej5gd9lMcJdOevQ5
X-Authority-Analysis: v=2.4 cv=XLkwSRhE c=1 sm=1 tr=0 ts=68c85158 cx=c_pps
 a=1qom1VPyPr7zHzn88zifxA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=vu2TTH8h0NUA:10
 a=ytpM4SMt6J0pzg2_eLsA:9
X-Proofpoint-ORIG-GUID: VEDfSngR3WN0Y8oaej5gd9lMcJdOevQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130110
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

>...but it doesn't really matter. I guess it's a little weird that your
>current code still writes status even if it's 0, but it shouldn't
>really hurt. There's no need to spin with that change unless you feel
>like it.

I'm already working on it so I might as well.

Thanks for all the feedback its been very helpful!

-John
