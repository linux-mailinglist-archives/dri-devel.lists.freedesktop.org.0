Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA7B55812
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 23:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1F410ECDA;
	Fri, 12 Sep 2025 21:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="xadJ2cCM";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="RevmlhL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72C710ECD9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 21:08:32 +0000 (UTC)
Received: from pps.filterd (m0187216.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CFwSei028640;
 Fri, 12 Sep 2025 14:08:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
 XZJO5hQsZ3zdHd+W6Avtz0ZI3a54SRWx52aF+muiTT0=; b=xadJ2cCM4b8/4stv
 U07bCnEqXywYoi/NK8nyXWRGJ7j331k/pkoPfMJX5FdvvDk2G6HihFphE4LYdMWQ
 qsU2MQebjN+4DPBiC8y1Kt6ri7E8qkbrX65XFFVoLNF8Q5rN1ZEoIqmsW7NF5nST
 n1oPpAnYEkBmqhf8dphWesxeWWHHPFCTNIABYGYMjey1Qgz3adijOFrA5wxIe/KX
 SIx1IDgam191hZh33WY4LY1Jn3zv3aYDYe94TkHGj8TS+87mPIu/Lmda6ZQpkH8Z
 Dd3OmiqP8tLO8gMjgurixaF0IUxOFaCoT34it3i082RDUlsAApkLuGXn7EA+nTbw
 Wovoxw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 494hwa16x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Sep 2025 14:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQaZHk6c2QEVc7hgkeOQTxzeDmqwwW2gGQYCy9py2Bd1G81bchC/qkD1EyCStYqPzZUzv+JLuD2nmexdihVTVLNYf5QcojldcoiVsYSUyDI29NNLSlBwpZ6XYAL4bjtGFPyH9Fjs1VmBKTyxcABlmWBSHJzeQ3HMXIRp63bcnkUdUNYxD7a9fC/VzaR0Rx29fwQDsiIQZffVJZsiHWQ0Ive2DZpqa2LvSfP/Mm0nibgiyaIedrNEs2tU4O1enSZAbnhTfTkQgSU6sRuI4YGdD0r5+tCVjGfr6+S2oQHiO1oVZNZ+Bbw8JhbUhUTXZ7Lo/XDQSC1O9HeTK3CKl33bgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZJO5hQsZ3zdHd+W6Avtz0ZI3a54SRWx52aF+muiTT0=;
 b=Yp3RRnqmMButUh+fg7gELp67T178+C6H2ny6VgZw+ICVSRxzyMQivzTHnQKtCU1yogN0EySsxtSiGRMr//W8y+sGkd/3xab0bT5winTJrYots3UxkAPI7TK0/95+GrNeYXSmQGOTcAOBnZ2M6dFATLGcviMvLAnvru0T2x868f/6DvxtN9trVDb9NIc5LH+EGiFq9/y4WQ9RezBlGlz1SpxrTaNzj1+xe1XUX+HIJ7XR8kAx55By4U52ne9pPEu/bUqDZO64Jw8pLPsjZWNLsSFwHsg6x+rx6stvB0roXzchVe3rnwzfXitWJbOXKXd8d+aZ2jkEMGZMrG8VEoLZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZJO5hQsZ3zdHd+W6Avtz0ZI3a54SRWx52aF+muiTT0=;
 b=RevmlhL79QF9sLtZ46vokLt3OhQFZO4A3F7pg6xA/jCnrmAz+bPLQrm/+GJ2SILWrK73y9Xs7OlOQFUAsPPim7Fiq0/z7EF0kP9xXWI/FwbyX6xBUWyHAqh054OYz3OfDI55oChqG/WwQHh4FW6qsSXJp7oZQ9H+mghocwbGCq8=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by SA1PR17MB4787.namprd17.prod.outlook.com (2603:10b6:806:19e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 21:08:14 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 21:08:14 +0000
From: John Ripple <john.ripple@keysight.com>
To: john.ripple@keysight.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, blake.vermeer@keysight.com,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 matt_laubhan@keysight.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: [PATCH V5] drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode
 with HPD
Date: Fri, 12 Sep 2025 15:08:05 -0600
Message-ID: <20250912210805.2910936-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250912192457.2067602-1-john.ripple@keysight.com>
References: <20250912192457.2067602-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR19CA0049.namprd19.prod.outlook.com
 (2603:10b6:930:1a::7) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|SA1PR17MB4787:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c278b14-66b1-4394-fe76-08ddf2407d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PAisFXuW2S8EzkzXFAw/WeqsvyTCg+XZuwQ1dFxt2dcVXTtjhE9GgaHFoCDK?=
 =?us-ascii?Q?IFs6eEkshprDaQVrs6C0EYyl+eG9H73sFlrmjSKI+Knesy+z1vgPDibEujMW?=
 =?us-ascii?Q?Wxv1W4HlYjNPkmCFNKTeT4Vp8C0gSRgj4UuUXP5dvQbhombWHXPdcFKceG5V?=
 =?us-ascii?Q?nTaJUD6wAdUScvXWRaaUcVcMiia74QOeHvCXfaKGMdquGc14I3nRpsK765QI?=
 =?us-ascii?Q?azkskYdPiG/crHSCBJ419QFZ8RWm1np7cFfnczNI5LBdtfKASksFeEIVTTi5?=
 =?us-ascii?Q?QP73gZZ8cncGIQ+9gu+yT0vzgDBJ7n5WGR5kXooZrcB+mtrUwg2z9PNcfeeq?=
 =?us-ascii?Q?vyq9FhaV57JZ4xwHXRq+zuKczT4q2bhbQOKZBs9KLiExq79RAnvLlhHZhRvL?=
 =?us-ascii?Q?DL/Ru0prMFowB2o6lfcAPPsyedDBEDy0KGePcSoj0tPWZnUsR7+5R+m/TM86?=
 =?us-ascii?Q?U5mDBMSlI5UwOV+PQedKXa/WeQsHOcgsIqQ4RE5xQJJblFNFRvmlaT+zCFJ3?=
 =?us-ascii?Q?Rf6lfOJME4Thif/TLnxmvBNtptykg8lDUWoLnVTVk67my3nCkcDJf6589UdY?=
 =?us-ascii?Q?sCRMAKSWH/GbGfGJU4PwlMVQFGR+10W8+Hzm42H0snio1LXfu7CotPaH/dnX?=
 =?us-ascii?Q?F83MPPJU2InL149YjHECljY4VkZzaovazWOhquQADRco8a9E6qk3zbdqjc8k?=
 =?us-ascii?Q?P8nHQwpdcGLrMqZKxbiWZ6y9IwsROqcK46JleGb9KvCX4YDTwQ1Y8IcN4fR3?=
 =?us-ascii?Q?Boj2mobcNvhz8FZxdB0pvwiHcaf92z9dvdNaEEzMdHqP1Ki2peKA8GP6lM8y?=
 =?us-ascii?Q?ZhSPw+H3p/FMPL8SRGF7YA2nJLlnX8919c63jc+xOm3wU3BaD24wDOrBKSd5?=
 =?us-ascii?Q?IXEuYpIeWXY7z3S4yWRoFeA+TMuSeT4xsO4MaM/I9IWJ+OgncABEfWh47LeB?=
 =?us-ascii?Q?aan7nAG/fRrvVTb7N3aahGR9MkvGLjDrWMz3vGbAy1pb403SO9tBO++mYUuR?=
 =?us-ascii?Q?9CVvNmaEDyBw66+p84gpAHCZVW4BPyJhRzp8LV8nqSuT4iVGQtHGngNteAyx?=
 =?us-ascii?Q?F/+h+Yj38b+vLSSmJjbb3GCvfceunuh1VRpzir5c4soMrCwIXOJn7EdFs0Ps?=
 =?us-ascii?Q?PBSvQfh/ZAIyFZfiuG8csDWc1oTAl/eEImITGMy0nPU4rtsWUB1RXoMtFE0D?=
 =?us-ascii?Q?N/xrAoLQlgMaTMR7MdyZ4nNm6cvi7ox8Am9w1NrrVzwHdaOmL97SpzD/phsh?=
 =?us-ascii?Q?68QGub3/Udu+qTo2FmyGDjjUUSV8gkib5eSOolu5cKaog8YlhJr++95c6wmu?=
 =?us-ascii?Q?6m2U2RMI/n8l2hY6PbAG5r+OMR5+7YAxZ3TVb0/KH4TZBZ6v4j47v++ETy3M?=
 =?us-ascii?Q?u/BCl2JkrODaAWE4saxi4wQw9x9pKMVEUj1t1z+YpsclUoXBD1JiYnY/uFol?=
 =?us-ascii?Q?s6/8soXa6Ac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR17MB6130.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?peYHLf8TeVoDklwrmEaH4XmYzAql0HTTBYZ49UUkuAQV36JqIVc1lkFkQkV/?=
 =?us-ascii?Q?hkoJzJSnyjpS1PlQsNdlUCZMSXcNlhvfg9CDtd1AwREYYq4yQWOttCPnXeDA?=
 =?us-ascii?Q?dAaxdo3RS76rMapd/w71PQTOKAhBHF/Przi+QLm/8WUzl/lqbXV7T1uW1sYb?=
 =?us-ascii?Q?mTEalBe4HKs+I9gh8fYW9+Drg3Kvo54BtLm5IosqcTWfVJVspSfISjiyPB4v?=
 =?us-ascii?Q?KCPokcgnfHxSsAK4ivkXVhhioLJ8KHVjJlFjIIpL6itbr2g/USioND0uXv1n?=
 =?us-ascii?Q?m32i4/MQqXp0TtReCi73ao0/lvtS7OVDJJbBhD6R6dPryHt+dBeYSXNLGK8p?=
 =?us-ascii?Q?bkoeJKjDP1y4gFT/CrX67C59CB4XGrv7x5KM0dQCeeaAY7W3HaMP2ix0IuBa?=
 =?us-ascii?Q?Ks4ohB35LrwbXCWhq6tR/twqeY8YJ7S3z49c+3Ed9uO9rXW5Ia3EEO3GgIJh?=
 =?us-ascii?Q?TgHoZazJRmsAVixCEezAt73+49kwYVBOHMuSv9uFwTgCUirlKGZLkLmqF6qi?=
 =?us-ascii?Q?ntchHPnOqWp++3swec+rY08lHlP9nf7Jbm9xGZ3Es2LmxSj3epsxhRg2bZUJ?=
 =?us-ascii?Q?d+VSvS1/9/FpsKDTIZn/gtma1yCelZoZVQU3SlT5xFssrWWzfgrYRytjGY0l?=
 =?us-ascii?Q?CyhLPCqXdSnx6wvTt4mGrCTT+rdrm4kiL2bDqqULGll1t28obR8F41l8HurE?=
 =?us-ascii?Q?WDXIjgQUBkHbW6lIKEXG1xVUAasq0GGUaNhiRkqY8XA6KjAlkNNrjB3aOEQ7?=
 =?us-ascii?Q?aMC7Q1Dc9h91xa5xmgNBM3xfUhxE2s+IlCvNZEcVIJ6p0lxac0wDt5JFyC93?=
 =?us-ascii?Q?klLevyGYkISNecHyOW3RYIl2Yt5T7fm56sS9WG18XlH+bP8qBo94f3xw7RPf?=
 =?us-ascii?Q?S84gJRYrmKYhWIKvw0RsC9AwSh2Rn+WD/Z3nsKAXk2hN1DyZ58eL8Cg4oo1X?=
 =?us-ascii?Q?CIh8eeUSXQo0HgJY8e8dWvl/7na04MqLGmivPuWjnwlOZupvzMFukJlWYYfX?=
 =?us-ascii?Q?5+eOKlYcAuSOQYjlcf2HoFlUz3MnpGF+Ww6gU//Wr8qBpEvr7wIx4BoKXpDA?=
 =?us-ascii?Q?3iju6hPXS24yLY7W12gcPtJSlP/Gt+/khGC7TAvSa7uRjFnaWU2ntEHJ4MSR?=
 =?us-ascii?Q?pP2izPjT4nSi9LnA3xD4/Hyt5nNlPU0BpfmJPyOo1XtKQAQ2ZPhJc1ea7ST9?=
 =?us-ascii?Q?jVoXzyHvY7yfBRHMglNvcO52cgg9WKZQWIEmZ7SIeSzNz1wu7bi7BTWquhJ9?=
 =?us-ascii?Q?Kv/yKKG/A7SFMjmZw191KG02y2UvRfi4mNyWASUckCHBuoCeGCtnGUFhnuAX?=
 =?us-ascii?Q?FIx5z63jlED8WJSRdZ6Jzo9c0XxczJIPd3RsMhV/YXVS0/UnDN3qThCi6hG/?=
 =?us-ascii?Q?BY6p7cJK4+zOwfr8Xjh2g8l+0i8Q5hT4TTc2YpNRRRPZxj3SKLwmdo+KrRpR?=
 =?us-ascii?Q?I446WRTowi84Tdl1APuchlhi4Nos0QWXh9bkKvhnWk6A2ySJwNr6Ck4p38u5?=
 =?us-ascii?Q?9GV5q1ojO024dfC04rdmgEtlDvNSP1gio4VPb9EdEVgBTED/Tk3PFVEMx8hv?=
 =?us-ascii?Q?uG3TfQMuNAqDgr4EQf1pQJ5UjwX/vysqYsIIdm6y/ncRc+h5KYZJCgRpKvdD?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: bXhSOBbnWCTJ74QmNoWBGyYHuXO2Q9ip6IPFctyLQ3G1+fUjT1ry9bTOy0qkW579ACqtsnYppZRi/UrQCnADfhgsTvdY+qU7YK20GEhFGR1FS512vMiDQg7uYqTld+N25WALfl7xWKDjwxue3dh4Zej2cJcSWqUeKMds5+zu2p/Yci7Jxjd8aypL+FE7TYVcHEXuA6pp+k03Le6TCu3k87j6atIjubeCokgiNZiShAhC0/zA7Ovp3QMoMG4QPxPMYzlm11wo5zqWvywpQkMxxzS6dm7+5fC4uBoskiRWGU7Nitl77qSnrRTgAWeJ6yXM24bOivCFoM3Uc6RaL+6yAu4Zrw9lLazyHqyX26N8UmWtaHfxZ6KehPBhno+27P8viv2fuxI3xetBRfsKDvKICkVq4W8+BbMR4RV1BZpCJjTRpRbW5tYzOZ2JpV0jE5yqDaWt3b0pmRtFdXNWp8emVONb7OagpR/qt+LgZC3Df/2e837eRs3M/+1uvGu1gLjM0CWXnXht4s+KZX2qDVRA/iCD+5yCCXP7QfCfYGXhjzC1NHb1CGKgfadpeA3IuO6tXG2NG5nzQrq4kJp5yrxLmPHVq8DnlRtO+BTfUArMAa1XvrBq7GMftxaBwsK6wl9k
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c278b14-66b1-4394-fe76-08ddf2407d0a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 21:08:14.7421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hv9IkSF71zn+7GYqgi4wut05ECZ2RjWGnYQD19YSUON5snDhYu9uOmQRasXx7UdDAEegq5d47jlii6VFZGAn908K4viTX3p4quE/mnuuZEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR17MB4787
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX3WjYuVxChTwb
 bifARy0zxfOne3ZnlRhrELcgl53oSSIg5lSDWlTtlMLyVV+4luIqNWoc8MLvnwhZKn7p3EGGMhs
 rYlT9nkO+NMXqQkJc4t7e04E89YJfgBKP+pkJji6v1t75jBOgLx4jdXJbF7CXJZKCP3v7U9nR5M
 vmnJ9W29FjK65CHAC4dIM5zdHGZVioTzqnYbtqu0J2cHxBRTJ+w4tCjSEVETzviYfGrYnRHvOG5
 0qO2h1fsWvXrIiLvz9pdsdQRAoDCwiqc0YrtgjdihaKYRDYMmO/jxAH75GRLGihSfKRfKi/V3im
 YKdQjLpuUjE2HefliW+oXsw5DuySbKQMuKq+o9FZLObE1dKHzwYZBTQfmegBunjyYOvCeF/vSSR
 UiRGO6rV
X-Proofpoint-ORIG-GUID: 89_WXwunIGZrQrlIuS95IQOndbzIRNBy
X-Authority-Analysis: v=2.4 cv=XauJzJ55 c=1 sm=1 tr=0 ts=68c48bc3 cx=c_pps
 a=SzVIhQP/G3AuXdMMEvt//w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=vu2TTH8h0NUA:10 a=F6MVbVVLAAAA:8
 a=J1LsNDdvFZZXQRbGIkUA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-GUID: 89_WXwunIGZrQrlIuS95IQOndbzIRNBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
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

Add support for DisplayPort to the bridge, which entails the following:
- Get and use an interrupt for HPD;
- Properly clear all status bits in the interrupt handler;

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
V1 -> V2: Cleaned up coding style and addressed review comments
V2 -> V3:
- Removed unused HPD IRQs
- Added mutex around HPD enable/disable and IRQ handler.
- Cleaned up error handling and variable declarations
- Only enable IRQs if the i2c client has an IRQ
- Moved IRQ_EN to ti_sn65dsi86_resume()
- Created ti_sn65dsi86_read_u8() helper function
V3 -> V4:
- Formatting
- Allow device tree to set interrupt type.
- Use hpd_mutex over less code.
V4 -> V5:
- Formatting.
- Symmetric mutex use in hpd enable/disable functions.
- Only set and clear specific bits for IRQ enable and disable.
- Better error handling in interrupt.
---
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 112 ++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ae0d08e5e960..239b89838845 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -106,10 +106,21 @@
 #define SN_PWM_EN_INV_REG			0xA5
 #define  SN_PWM_INV_MASK			BIT(0)
 #define  SN_PWM_EN_MASK				BIT(1)
+
+#define SN_IRQ_EN_REG				0xE0
+#define  IRQ_EN					BIT(0)
+
+#define SN_IRQ_EVENTS_EN_REG			0xE6
+#define  HPD_INSERTION_EN			BIT(1)
+#define  HPD_REMOVAL_EN				BIT(2)
+
 #define SN_AUX_CMD_STATUS_REG			0xF4
 #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
 #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
 #define  AUX_IRQ_STATUS_NAT_I2C_FAIL		BIT(6)
+#define SN_IRQ_STATUS_REG			0xF5
+#define  HPD_REMOVAL_STATUS			BIT(2)
+#define  HPD_INSERTION_STATUS			BIT(1)
 
 #define MIN_DSI_CLK_FREQ_MHZ	40
 
@@ -152,7 +163,9 @@
  * @ln_assign:    Value to program to the LN_ASSIGN register.
  * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
  * @comms_enabled: If true then communication over the aux channel is enabled.
+ * @hpd_enabled:   If true then HPD events are enabled.
  * @comms_mutex:   Protects modification of comms_enabled.
+ * @hpd_mutex:     Protects modification of hpd_enabled.
  *
  * @gchip:        If we expose our GPIOs, this is used.
  * @gchip_output: A cache of whether we've set GPIOs to output.  This
@@ -190,7 +203,9 @@ struct ti_sn65dsi86 {
 	u8				ln_assign;
 	u8				ln_polrs;
 	bool				comms_enabled;
+	bool				hpd_enabled;
 	struct mutex			comms_mutex;
+	struct mutex			hpd_mutex;
 
 #if defined(CONFIG_OF_GPIO)
 	struct gpio_chip		gchip;
@@ -221,6 +236,23 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 	.max_register = 0xFF,
 };
 
+static int ti_sn65dsi86_read_u8(struct ti_sn65dsi86 *pdata, unsigned int reg,
+				u8 *val)
+{
+	int ret;
+	unsigned int reg_val;
+
+	ret = regmap_read(pdata->regmap, reg, &reg_val);
+	if (ret) {
+		dev_err(pdata->dev, "fail to read raw reg %#x: %d\n",
+			reg, ret);
+		return ret;
+	}
+	*val = (u8)reg_val;
+
+	return 0;
+}
+
 static int __maybe_unused ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
 						unsigned int reg, u16 *val)
 {
@@ -379,6 +411,7 @@ static void ti_sn65dsi86_disable_comms(struct ti_sn65dsi86 *pdata)
 static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
 	int ret;
 
 	ret = regulator_bulk_enable(SN_REGULATOR_SUPPLY_NUM, pdata->supplies);
@@ -413,6 +446,13 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 	if (pdata->refclk)
 		ti_sn65dsi86_enable_comms(pdata, NULL);
 
+	if (client->irq) {
+		ret = regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN,
+					 IRQ_EN);
+		if (ret)
+			pr_err("Failed to enable IRQ events: %d\n", ret);
+	}
+
 	return ret;
 }
 
@@ -1211,6 +1251,8 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
 static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
+	int ret;
 
 	/*
 	 * Device needs to be powered on before reading the HPD state
@@ -1219,11 +1261,32 @@ static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
 	 */
 
 	pm_runtime_get_sync(pdata->dev);
+
+	mutex_lock(&pdata->hpd_mutex);
+	pdata->hpd_enabled = true;
+	mutex_unlock(&pdata->hpd_mutex);
+
+	if (client->irq) {
+		ret = regmap_set_bits(pdata->regmap, SN_IRQ_EVENTS_EN_REG,
+				      HPD_REMOVAL_EN | HPD_INSERTION_EN);
+		if (ret)
+			pr_err("Failed to enable HPD events: %d\n", ret);
+	}
 }
 
 static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
+
+	if (client->irq) {
+		regmap_clear_bits(pdata->regmap, SN_IRQ_EVENTS_EN_REG,
+				  HPD_REMOVAL_EN | HPD_INSERTION_EN);
+	}
+
+	mutex_lock(&pdata->hpd_mutex);
+	pdata->hpd_enabled = false;
+	mutex_unlock(&pdata->hpd_mutex);
 
 	pm_runtime_put_autosuspend(pdata->dev);
 }
@@ -1309,6 +1372,41 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
 	return 0;
 }
 
+static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
+{
+	struct ti_sn65dsi86 *pdata = private;
+	struct drm_device *dev = pdata->bridge.dev;
+	u8 status;
+	int ret;
+	bool hpd_event;
+
+	ret = ti_sn65dsi86_read_u8(pdata, SN_IRQ_STATUS_REG, &status);
+	if (ret) {
+		pr_err("Failed to read IRQ status: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	hpd_event = status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS);
+
+	if (!status)
+		return IRQ_NONE;
+
+	pr_debug("(SN_IRQ_STATUS_REG = %#x)\n", status);
+	ret = regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
+	if (ret) {
+		pr_err("Failed to clear IRQ status: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	/* Only send the HPD event if we are bound with a device. */
+	mutex_lock(&pdata->hpd_mutex);
+	if (pdata->hpd_enabled && hpd_event)
+		drm_kms_helper_hotplug_event(dev);
+	mutex_unlock(&pdata->hpd_mutex);
+
+	return IRQ_HANDLED;
+}
+
 static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
@@ -1931,6 +2029,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	dev_set_drvdata(dev, pdata);
 	pdata->dev = dev;
 
+	mutex_init(&pdata->hpd_mutex);
+
 	mutex_init(&pdata->comms_mutex);
 
 	pdata->regmap = devm_regmap_init_i2c(client,
@@ -1971,6 +2071,18 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
 		return dev_err_probe(dev, -EOPNOTSUPP, "unsupported device id\n");
 
+	if (client->irq) {
+		ret = devm_request_threaded_irq(pdata->dev, client->irq, NULL,
+						ti_sn_bridge_interrupt,
+						IRQF_ONESHOT,
+						dev_name(pdata->dev), pdata);
+
+		if (ret) {
+			return dev_err_probe(dev, ret,
+					     "failed to request interrupt\n");
+		}
+	}
+
 	/*
 	 * Break ourselves up into a collection of aux devices. The only real
 	 * motiviation here is to solve the chicken-and-egg problem of probe
