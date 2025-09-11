Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2916EB53BB5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 20:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2795410E3D2;
	Thu, 11 Sep 2025 18:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="c3jMaxtu";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="FJHrrmfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com
 [205.220.161.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5B710E3D2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 18:40:00 +0000 (UTC)
Received: from pps.filterd (m0187211.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BIFgL4020751;
 Thu, 11 Sep 2025 11:39:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
 NFZbdO3Zwj3Yb/SGr/ljDQitPlK630qLCYv22mydHig=; b=c3jMaxtuMPws4WnI
 oCT91ZhJVCwZVZoykO91/q9cT9dOFrvPlf8v1OEJ12glUqJcp6PleK83Fcpt79Ch
 tn8ik2C+8EdfCURrYDMuvoE5lV2JJuNfYg0s8P+nr24gfX7JaJBEfsWFs/kIYz72
 0MuyToeI0NDaKCWS2CCCMM83f2VH9R2iVTuMOg/M/LLdEnzRgBM0ojqwv4JVfkc6
 FOljMrQrYcgF7BhM1hfQbsfyNokgJnnXvoL4uGcsYRwzfFVFvVZkq2WVHf5o7D9s
 aS9KCaJ9G9uFHz8VHVkVY12+z4Ntcjx6GYa6AX7ZvuAootQXS2hOwMbwJMjjIVgC
 l5wAVg==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4938bbuqc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Sep 2025 11:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMvERa10N5HZv+8PMQpiYaBcMABSYrLNcTviqmhP36Fk7bAqj1M1xooGOIhxVgO5mxbWUZQZugYkVlcajMy6w8/XG48Tf5gN+NTP3abZSzPzuu7PQeQQmpHev0/HFN8v6czsBqY1ufkSVWA6/04+w12un1dmiHMo0hp5sVxjLLlFWm1965fH+rxFmWcyG9ZdpufVuKqzhsJUN+XFjxj5CZMmBppUAA+HhTK+kYDUr8z8wTR/vK9q0Dfn7eysU7l7MvAj8OIHh2VVOgnCKBxvw5MwpVO7G6bxP93L0EFymEiA0Oja/slv7RdRDf93sXHnj6zwZdX/NFOinORPCGILyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFZbdO3Zwj3Yb/SGr/ljDQitPlK630qLCYv22mydHig=;
 b=kbzd2CRWSjmAn1vFVcegXxrzTSZhFzzBM4p5N09506RA1lNT4OoQT6lMUYmvkwgfJhqLQ6QN7G9Opn/JZfmjuuKZSLVluDCeawPX9BSxslLq2SwoukXa8wKZhc3/7mXwcsYjIA5dytg9JOd/PboJQ4vRMCbfl24MQOGYZhk7ZznCmwBMSOxFkd8i86R9H2EOuV79gqV9sj60Tz9Okdh3f/qc9icSsZ9tNrfLVXL/hVwLTbZ32KEHBw9o9MtKnnwuR2USR0H2diEFw/O5iQ4LA7o8/9hP2+tE1OYUDP0CZvTOONMgL/yr0YDaXyQlZHVgYMB9Mv9nJqV3KILHjQs5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFZbdO3Zwj3Yb/SGr/ljDQitPlK630qLCYv22mydHig=;
 b=FJHrrmfwjjxTSzh5l1KeeBmq3qI8JCPqVqSEwT+x8PcBrzmYWAVnr9Xcd6ssnuptEcAWKWBkfc9GYl35291P3lS8AAfxqf06DWvtYe2I1O9hD/GsppxnrccOnqzsMNTQLaMrosSE8yWuRXGOJ7jqoezKx3sOAwrnE4IDdPC1YC4=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by SN7PR17MB6559.namprd17.prod.outlook.com (2603:10b6:806:350::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 18:39:37 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 18:39:37 +0000
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
Date: Thu, 11 Sep 2025 12:39:28 -0600
Message-ID: <20250911183928.2627172-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAD=FV=Um5NKHFZJJkC6eC0rnea0xSPeWVpK91PwGcrRjri28NA@mail.gmail.com>
References: <CAD=FV=Um5NKHFZJJkC6eC0rnea0xSPeWVpK91PwGcrRjri28NA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:806:130::8) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|SN7PR17MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: d854eb61-5206-4080-29a9-08ddf1628f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?38j7N5i800EAqy5cSIfkOJ//iKGHN43OD7+9Zh1PNiBPikXIv3trZUVoFSF3?=
 =?us-ascii?Q?F7ujWb7CqOwaR3QyB7h/CYHVXyp72sOAa1D3JjMuhGl3zdjynXcDCax4QEVz?=
 =?us-ascii?Q?aYcNu5L8E2RufvlquiW14ffyTwWDToSR6qpWEhE5bmjeZzn5vHlx3EEZ63B3?=
 =?us-ascii?Q?J5KtZJxrEMCJkEFXg5bzAas4DVdIhQFFSV6T7VcVGCJDyojtqPsBoVEyf1DX?=
 =?us-ascii?Q?PcF8hrLxlXPa0HW8PW9UKunoHf/afM9G6pv9Ly8JZqdDVM5XkE5Zt5+JW7u0?=
 =?us-ascii?Q?AYwgZ6stdg8A8dHXQt/hFfuOxzanx8hI95u5Gx8csgtEbq9Ro2vnswV0wfLB?=
 =?us-ascii?Q?49fQzbgdOdVdyKcfJhXfMli3jRmoNU9Rjp+EIr2JjlUYyWOb8nM6ItPQ4RME?=
 =?us-ascii?Q?pNJmNlIhTcJ3+fYum2bONRqU0Ibm52XzmNuI22Rbh0Nq6onNKfLoAB4wnYlz?=
 =?us-ascii?Q?RxqeiUvvfPiEasDWd/iRNGKwVzsMns3gv/Q2b15Gxbtv9O+QkvqsRr7XzRHW?=
 =?us-ascii?Q?ttdbhkaX2BMSTZz1x27ZYD/NuIePDQFlrJd0Ypy2XFMHzCrDxxE4sA5LLbPa?=
 =?us-ascii?Q?SMHxozkGNpUNehN1OmSYkVZrMPUyfnfoHXuTJBvBFlHC2AXGubuWp/dve/qM?=
 =?us-ascii?Q?aInotQM0qQjqMj93MjiY4ogzvwEyEW2T8n/NfqcdydIUh1gf7ng7FqQpZIOr?=
 =?us-ascii?Q?hZ+NvM7sZIuhMmHkN2fwyRpLKmsyvBArbGtBOvAaLKV+umV+TTaIxz+hp4o3?=
 =?us-ascii?Q?v//HQ5FcPoksN3zYWmWt92xN5V46usEpZuMJuYFa4SnTfNL6XZH8X6viE5cN?=
 =?us-ascii?Q?O2fwFgRVQp9Xv698UnWnBvQgCyZdjJ5s9iUwRvLqR0ogu+LcQL0dPk0ENh6+?=
 =?us-ascii?Q?0NwtkNAGm7Hm1j24RHWqom03kCkobNvC2lL8qwIZcabmOOtFxN2Ia0sFNTWY?=
 =?us-ascii?Q?qu5WesgWUp6isHog8zYnOpLgvoDmvsxiI6PgK2pia3WpFSWR4v8pEBbL1Iop?=
 =?us-ascii?Q?I8bY+q1sE/LDYbSMs7X899n9dNKoOEX07y2/qj528YXf8DNGuSv9ErXucqJL?=
 =?us-ascii?Q?CP3ZGaKTKrU+BO5fjY8wG3OVgscSDfxskjJtBAS4c53qTzFnVGlQRn4yQbOX?=
 =?us-ascii?Q?4MQDQzcfa0ZHNfC73OlzVsWP5MB5J8jri3gV6c9byVk/8clWthvLk3UErjuO?=
 =?us-ascii?Q?LfiW/7Op4s34fSse5Xtm/EhiQu4ul096yaGAbc0Us2H+zQG3On03fcQyIqoq?=
 =?us-ascii?Q?Q40FmrsUnfxofqMB4EfDEWt/2YxXZOuel54u5+jDc5//jcn7HWa3G0sLhyHD?=
 =?us-ascii?Q?oqmD4jcgfvxZHB1Gs9rNcwrlu+LwimyZdnFCGrrkb52TQPXzK+OYpbIh7tZ+?=
 =?us-ascii?Q?uLHuy5DonupR5SE+CU/ZPunvY1YUjq0gGcS0L+0+jPpGIKMLOgaM1T0E2mC6?=
 =?us-ascii?Q?ucWDot3Inqk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR17MB6130.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cn2HFx9eY8javedGcIXzbfcPGfHSPCYRb5NmM358EXfMGXVwII8PHtRA1QTX?=
 =?us-ascii?Q?HOeiuIh5PLIt099wzwSuAXoSZnZ4MiqHynZgulnDlMTs/V0ANg7+W+BzUmPi?=
 =?us-ascii?Q?NjKLHxMUM9+zIBgdBYBVdJAgAJ3OJjGTx61NfLY0wlBf4fpgpT/3rTGkYjfE?=
 =?us-ascii?Q?2NPWylpw524hUwJiRElHbLKvg8FMVhMrMFeSoJjmOTuWFbECpmMUVBmfSQ0o?=
 =?us-ascii?Q?MuoRDy5SisvtVcjADjh2NFtKk+R2sMLvmCITW+gAMx8+XABek3BgYHwKKBLj?=
 =?us-ascii?Q?KMywYsn1uhS267iRyX4hcmLQOuHGjaBi8SmVphhDckf2bl1aLgckBYqaWdWp?=
 =?us-ascii?Q?trlptmnHwOtVc+TliBYdFZviUez5Tc9+sYihoq0SwtzPE4L5Uw0JF+0EzzM4?=
 =?us-ascii?Q?T6saScrFvrKCW8RKPNyNT1tCrFhCg4Am64cqHmuJdSOVXYATPbaA+ckEcqHR?=
 =?us-ascii?Q?CbcdGzQhGpU+egSWRKaDAgsczMuXfPFGnKoTaftv0L1ncCTEqvSkW45vSL2D?=
 =?us-ascii?Q?7B63pqXxd3gQ0l9+f7XS6XTMZdOO4d5Bi1lIqTRI3birdG0ZgVeueEgPcemU?=
 =?us-ascii?Q?8zQy5PIyPOiGDSDnRwyhsUfaZOVbafz322suqucu9NNS1szIGRSoe3MjdC5V?=
 =?us-ascii?Q?ob7ji7JrzlVdfqkFHwpFtQpCfqEMaj8sWIG5GKXcKimcYY35KfWaKy/M5jLX?=
 =?us-ascii?Q?n475WkCqXz7b11+YHIpmq0BBNEorWTewEdeMs0+S0gCUSDoTbWN2iKcRp6Sg?=
 =?us-ascii?Q?AWTkp7cO1Kbk65zhGkD9V23eFRn3qOXSZvCzxW0mpbALnB5YITzeRRkMAsb3?=
 =?us-ascii?Q?O1IbQwQHMoj9PY+tepLZxFMriIVkHaHZ8kx8YbFkimcB24/frlNRrMCgx+mf?=
 =?us-ascii?Q?JHLpQYPVj295NUvPKMMI4upPifizdNBVLFHt0BgZTHCg70MIsOsu9532WwdT?=
 =?us-ascii?Q?VPaO/Iyb77QaPSkI3h/Noqb+gx/rswdwGWnW9nnqJQ2t1Sd7PnqDl12kClZ5?=
 =?us-ascii?Q?s8/m1C7kFnmA2Omos3E1yLOQ0wtzYj1kHnLkg+OaU+vLa4maEgUv2zFv3ROj?=
 =?us-ascii?Q?lr5NpEpbWWPuXcE1KmgYQWb7117XZv6CSIJVRrtdYBF2qdECzrsIP1T8Oq04?=
 =?us-ascii?Q?QRl8DQXiH5ePd78AsZyqXnfVtoygpNxD90nvzLdh9/xL4jYVg1kdpyzXStwy?=
 =?us-ascii?Q?FOCAonIvv4PodPyXcSaidGiPgY3DQvIi8sd891YCxnMwOU6JjdmnYe6aSDgQ?=
 =?us-ascii?Q?1r0dcMRP2PQlOdmLYw+/yxwQ17z8vykDT5fFm4eMxBJsBzkVOwJck62y/al/?=
 =?us-ascii?Q?HwfTlr17FPJFme3SX8BiqbVK2lSTOK2tERAmQ4cC21j/TrUpJjhQd/RgjStG?=
 =?us-ascii?Q?6GgXn7D4LnTfb1CmGNnUwgIJmLiNh4hgwmEbz2BqErfC0gRXq+K0b8DC2Ii8?=
 =?us-ascii?Q?jCxxzA0uIl1zjmy1urNtGQuN0tXMCTAmwwDaH0xeMIZgR8igTkQ8Ff217V/A?=
 =?us-ascii?Q?P1Sv8dOI0ufa4L+RXu96i3Vgav+CmOwItAsWFOYABY1amEiwUZoFoSi4hu/7?=
 =?us-ascii?Q?U36ZqBcpaQ9N+sfSz+yVZmo9d5EOkViOyv2YHwrmnnKiVXWVtK0lRGSeCCrf?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7GuhLm+trU/0aCwJHcK+WAZOVUgoSVK2uorsYKlAX0VyGLISsSgBh1DYvC/5q1VLM+IszCYIhuALrUjXJyQ8j0/lTdZ1aqhwoIowb1NN0KdZAKVi7ba3ywV3ZlkTg7jYkdXckJv3GYMgoMlbGYVdWlEnOXmwPTjw3rO6jsfa2iHtg5JH1+Zcs00bCl0vWWGxgWL2G5WNDX5pKa4ySY6PHpGTOnauwo2kUQ1G31VjuyrHmFnJY21EaCq1aNWc05p5FX8VG/4d28GLuVDIPc4cLYboFRgxXQjdq1T1C9zeHvH6fCS5yF+Mms3CAaibFMEC9uj0XDPhBVtYyPOnP88MZ0kYfaOVBwOc7Z1CPdAufjQjYaK5YLqhS+UH2E8EVnnIfjWEzFOSG2NVzMb2FqxvAovcb1OgxxCvL0vQ5sxnT/N66rROCbMIeff+voizjcxgoOFUnqDAi77L2jsng1kYF6IHsLDCCi2WiVpCDF1NnIDYUHghF3J9N+Sz6VY2SoKQvQI4cDQpGtm08KAfNq1MnFXyYWH/H/HziFzNG0xv/wsDzkzQsBatricr1czzXB58RRYBeIiNQhN30T3G02hbE/nmiLZLxfylj9VqB/LnmX44F2JKwbzMD9bWX1bvdow0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d854eb61-5206-4080-29a9-08ddf1628f3b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 18:39:37.2198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTWxoKLgIe+Z/vG+Mk8fYT6M7Dls9MQvqXP0C+Sut7VBpXINtGmKiTAtGK6vvZIMRDyWkTkMMxWGs6exSE48iLXX3VuSO27PxhAWWqkkT34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR17MB6559
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDEwMSBTYWx0ZWRfX0SFDDiHAWuJq
 gAoVOI+ZfzRxFnehHj97K6RACvv1KXrntJbDP6j0J/9kPMiLocxxNYqjvOPcFAGVJnocQUinLXM
 Pet2JBju/cJXlHqb8S/d4kwEf6SffHZSPAc43C3l3P44HV40rNdZmjAZXYUhP5Ld+2ixXi1Annu
 VB4AyEVOhZpKAEn37xiA2GSsmUtdXuo5NYAq8d0PY9CyZkET2aZ7LcTP/uj8B+jkRet1SnnfPX8
 xqFsp11IzBQoCkIP8dKl+/JxabeyoDcMQ0O0vyIvsifqiEJbOAKMZ8G9lIeprPQ7grUvBHpbp1R
 69p3WNrj3FrhlbaUlOGPz7oHMDSHTEeg1jbqX0SqFPbTxsQBPQ/xT1xydWKP8FezCvDxd2fGaCM
 dttDg3tU
X-Authority-Analysis: v=2.4 cv=bdFrUPPB c=1 sm=1 tr=0 ts=68c3176c cx=c_pps
 a=WhUEUVamR7lPV9LkVsdNog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=vu2TTH8h0NUA:10
 a=VntLOUjEBdILLjWUc2UA:9
X-Proofpoint-GUID: crmFvwOs0GaS1L-13TND3qjS79gqVgaG
X-Proofpoint-ORIG-GUID: crmFvwOs0GaS1L-13TND3qjS79gqVgaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509100101
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

>...and you don't need to check for "dev" being NULL because there's no
>way "hpd_enabled" could be true with "dev" being NULL. At least this
>is my assumption that the core DRM framework won't detach a bridge
>while HPD is enabled. If nothing else, I guess you could call
>ti_sn_bridge_hpd_disable() from ti_sn_bridge_detach()

I don't think ti_sn_bridge_hpd_disable() needs to be in 
ti_sn_brdige_detach(). The DRM framework should run the disable for hpd
before detaching the device. I haven't seen any issues with it so far.

>> @@ -1971,6 +2075,28 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
>>         if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
>>                 return dev_err_probe(dev, -EOPNOTSUPP, "unsupported device >id\n");
>>
>> +       if (client->irq) {
>> +               ret = devm_request_threaded_irq(pdata->dev, client->irq, NULL,
>> +                                               ti_sn_bridge_interrupt,
>> +                                               IRQF_TRIGGER_RISING |
>> +                                               IRQF_TRIGGER_FALLING |
>> +                                               IRQF_ONESHOT,
>> +                                               "ti_sn65dsi86", pdata);
>> +
>> +               if (ret) {
>> +                       return dev_err_probe(dev, ret,
>> +                                            "failed to request interrupt\n");
>> +               }
>> +
>> +               /*
>> +                * Cleaning status register at probe is needed because if the >irq is
>> +                * already high, the rising/falling condition will never occur
>> +                */
>> +               ret = regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, 0xFF);
>> +               if (ret)
>> +                       pr_warn("Failed to clear IRQ initial state: %d\n", >ret);
>
>Actually, wait. Why do you want "rising" and "falling". Isn't this a
>level-triggered interrupt? Then you also don't need this bogus clear
>of interrupts here...

I changed it out for a high level interrupt and it looks fine. The IRQ
line off the check also seems to only send one pulse for about 1.09 ms
when the IRQ is toggled, so I think its doing a level interrupt since 
1 KHz is way slower than the refclk. For 0xE0 the documentation also 
says "the IRQ output is driven high to communicate IRQ events" so I
think you're correct.

>...and also, I seem to recall it's usually better to not specify a
>type here and rely on the type in the device tree. I seem to remember
>there being some weird corner cases (maybe around remove / reprobe or
>maybe about deferred probes?) if an interrupt type is specified in
>both code and device tree and those types don't match...

I couldn't find anything about this and all the other drivers in 
drivers/gpu-drm/bridge that use the devm_request_threaded_irq just 
directly set the irq type. I couldn't find any that read in the device 
tree for it. The display-connector.c general driver also seems to just 
set the type directly. Do you have an example where this is used?

The tisn65dsi86 chip also shouldn't be changing how it does its 
interrupts, so having the hardcoded high interrupt in the driver seems
like it would be fine.
