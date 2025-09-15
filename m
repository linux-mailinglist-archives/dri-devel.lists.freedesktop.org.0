Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A9B583E9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF5D10E305;
	Mon, 15 Sep 2025 17:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="RjPbGoUw";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="UmE7wHmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C1210E305
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 17:46:14 +0000 (UTC)
Received: from pps.filterd (m0187217.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FAkCqw018507;
 Mon, 15 Sep 2025 10:46:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
 uTsRkEEJnqf12C1CgQXIWfyaxqCQHoDxnmVOzo0wYrQ=; b=RjPbGoUwMz5mJehl
 +blW9GdhqJu/sjagQ1HaGLFqCumFTat8iXAZEvmmNR5wyXCmIKOtJS/WiiiP9Ssg
 tIjt6Vnp2wnsT6kK139vFNVCgyLJylsOsWI+2rq9HojAxR0EQh3OP2cDKUilwKsC
 6kqW1N+Ttedmk9zPOQRL5nNDqSRFkNIFOtIoRl+hWxX02HMHepto+Ab+IpgJJMkx
 VK80Uj6cQ53dTmrFqujlzez0F3U92aU7P0FIHUdf6VUiCaAHIDTDUHnIDqhMIrT8
 fI67md1H40jWHcXjOB6muotsAX4MVeKm99oySuNwtQJJrUANDonouU0bLPSvrEnY
 pBgj8Q==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 49581eujcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Sep 2025 10:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRCM2tDJ6xhEnX2iE/A3hfsYubxGADw9zOCaj66BLSYqZZiyS8Z2ZSFj8q3TgOLKBf9V24DUfW84Jpw46Mp6WKsgpRTkB+zOoM00YGM+809CMcLHLh/Wh3MZIhAg6TljEjXN7g1qpaQ5nQi2E/aesl2aHCZUx8GnTaqoSvNw1ih2OBnqHbnAi4JLA+U75mr48+qT6IYuGTU8WwfQ1kWBAj7etVv2E194+JkT5bOozntUj/hWFzCLQtV6n7q4ojTHGrIFPLiecxSsjbvbQkriruTSs9py2a+IG1RqAIOK+rMo3H4s57VDyu9zp3eIk2NkaCMe8SeEwB+g1FovKnl7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTsRkEEJnqf12C1CgQXIWfyaxqCQHoDxnmVOzo0wYrQ=;
 b=ldbOcnC7fCMrM70XRsnlKwDZ9HCvg+BcxkTq+jry1o1hPABl/+zjLEfM6mCJWZmwncL652090WdkSs6GRTY8ZFphfuf9EN7ho/pM+4W/4XGEwZJZyMB96fEVeclllwBjnRfU8SBmwqgvAEjywCrSxhnOG41FYjS0EDQionzMNy5jvqJHyJBNHmko6/Avp0Njq+/CJahOG3wL6bsjdzDMhUlUYfmXp9LAfU1VKCHfnMKg34nqpehXUdX5EVEqeI+ZZBPByaSakAtC64DLS2OONVtOIDrX3MsR2b2sSUPwvffJW5aL0D8ICcdgiZEbMR8bZYOtcronWU9JkD7tDSfzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTsRkEEJnqf12C1CgQXIWfyaxqCQHoDxnmVOzo0wYrQ=;
 b=UmE7wHmTJcCQli+OKyETRIE4kQ2ctRpVsqvWBcaPMLBIQNF1vGLZQVr4HLCV3mMiOfoMpb5Gu7u0AgawE7Gx47iOn7x5WG6GSsF3HwSDXKEoYiWFxgKpWescNkkX+uknFnG2wp1PInt6oQQT+bm4Fim90ApdhaaseDWwQLItQPU=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by IA3PR17MB7237.namprd17.prod.outlook.com (2603:10b6:208:523::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 17:45:54 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 17:45:53 +0000
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
Subject: [PATCH V7] drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode
 with HPD
Date: Mon, 15 Sep 2025 11:45:43 -0600
Message-ID: <20250915174543.2564994-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915165055.2366020-1-john.ripple@keysight.com>
References: <20250915165055.2366020-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR19CA0018.namprd19.prod.outlook.com
 (2603:10b6:930:44::15) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|IA3PR17MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a050de-75d0-47d7-e4e2-08ddf47fb7ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ODhEWVF4L8a+P6Xr/tcaMDK0RlX4ltOC5EZSHAkXbTz8hpOucxzgpX0L1XjU?=
 =?us-ascii?Q?yO/xhtVFAYl/QKCLJ8f4GeuSpa5AjisjnAcyTJEPX2ywZ6RGaYEUKG5wOkre?=
 =?us-ascii?Q?ZxrHzLeh/7/jA376Ia66HRbq9ir7cbMRbCQfo+1MYO3c8F6+rCk05PeSEQME?=
 =?us-ascii?Q?RSRJV0V+Q9GXyGl+KIqFSLMU8PJNsyaeymtZExfWxU4YBmSBxwcixMw+za/9?=
 =?us-ascii?Q?6cVLXv6xGk1J2zOZ7lB4fPTYfxiF6ptHU5H63iRcJKpWKr5D+o0HVcu+W7NE?=
 =?us-ascii?Q?E35xiwKBi4/z3QgG5O7QxQtd3QQCe8AUmopf2yArBvQgoE+7LHQppmZrjM0C?=
 =?us-ascii?Q?pbrmtu3skDsdzsLjrbhoGmvPjQwMCj/5TtfMwysoh4quoqGmq/UzEyT+xnvS?=
 =?us-ascii?Q?5vofg2iP8n9WO2R4hJF1knxiQB53XBHZ0BoOsyS6pLwi+pfQuwEavksJMC4E?=
 =?us-ascii?Q?+HKvvjB3wkFQgChMiMSe73zD/zWNJZZzXhvB+0L1m9+y7td27UacK0MuYhEd?=
 =?us-ascii?Q?alG0wyHs7ICfoCUy3ta4SpI0xqGVcHrd3fupFsTivb2XKSeak0UNG/+/fhh8?=
 =?us-ascii?Q?h3bZJYD0spLKQIz0yweHhu9Wm+wGTZ2bQpSe9hhRNs0gr3qUctHiJapCbNB7?=
 =?us-ascii?Q?KwUpQmy7SGO1ev/yP7ERa2AcfUjoAIqedABPhniXCynlUqdVUCw7eDcIrBC+?=
 =?us-ascii?Q?9kD9eKyxOfMhEa4F6Fj/irJWztJgc7Z+r/LqF8Vc4eKIOaLT/HiQcqmGWJRu?=
 =?us-ascii?Q?caX7U3S2e6oJIszKkiEU/ZYrj8Wd6UNwC4dug4Ay5OkXtE5oXnYVCROxesTg?=
 =?us-ascii?Q?/QxXFVhdLNwTeaTsN9CYVGA7BXDgtF6z2pextNzpAGxFMQ9hGx7PlbhzJjhM?=
 =?us-ascii?Q?wW/Iome34meBBD3bioxpSCUyChW3WtYNAKRRP5wsAC0KT3ua7Z0UbDzy8Tnp?=
 =?us-ascii?Q?xwJjl+ELJv3fVWB3cUUBu+k1XpjfhlLMsgap2/IiDIPtLhF8SpCHQTvcSEPU?=
 =?us-ascii?Q?B3POAKrM9DxKxSHKEtUAf1ifKPldEGNM38lE7RVssLf0dKQatQVOHky4KRkp?=
 =?us-ascii?Q?TEw65uQln2fYqqVF6GoR6ruSJdZUI+FTP3OvtOBa07hjz3JGkssMWENkAn4w?=
 =?us-ascii?Q?bwiSgfDFJ/tKDNBcW4yxcS0xj3lqKt1hlV4+BYwDKuRqefRiYbhYBi09WRW8?=
 =?us-ascii?Q?u02nEj37hEMnWNoWNdm4duVltsNINDRBDkKWxCI5RHdotHTUUOs31LjP10gs?=
 =?us-ascii?Q?dlAHBJDi41fbVrlU/iB6lPvT97QpWG0KCGFKFLIDqiFyLKiaEn26jntWV4nC?=
 =?us-ascii?Q?LViU/ijKqkjWAfz6CMJBQallkuOllmKzWVoU8VL9gY5PfLiXGGZ28nRxqDCp?=
 =?us-ascii?Q?fyMJmBoKh3X45q3A1WmaiGFULpSgFEnCXhF0E3uU4J0emPthajLRinpBkwKl?=
 =?us-ascii?Q?vgMhae/2hVg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR17MB6130.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cl0rHyX3QUv5sWN/ZnjfmAGFFZYFwMeo3NRPmegd6fClh2vBL1Zx4KVcMyQh?=
 =?us-ascii?Q?Yf5KwRnc+pr3yunLbkPXLUT9dAof8gaEdbO6Cci2/+zmN8E8GRvYlm4arOgc?=
 =?us-ascii?Q?igjCK76+oC6SQCcVHGOiXBOIkcmqJuIbMVKCbG3hVFvADZVsl0ipYqD3239/?=
 =?us-ascii?Q?dsELP7n/cn0G1/2G5nYVCMO5Jk1CUeBjAuG0/+1WJGNxjAnw3NX/+VUQRO26?=
 =?us-ascii?Q?WHKzTg6mtfGaLaXAO/RzfuW9AwgF9HJCKoo17VPDHhhCzz4BKDXPFRGrmHiH?=
 =?us-ascii?Q?WJYoTYR+yqdZLBxnAJwEvySW38nAeKMs5pfmRZfT+2d+ApVo/3EM1EhR9MUk?=
 =?us-ascii?Q?nklAMvdLRy9WayJsMwL1IeTCAfmZZsBALOiBVkkMEEY9XyG9PKKF8KijnTaL?=
 =?us-ascii?Q?mfqgXMZHj1Y4qV+LiKc8BY3TW7JIyVPlVouWxeg2LsF085K0mxlw4dN/tZ3h?=
 =?us-ascii?Q?IPqO0j5I3XXFVXnCIgwlKy4qg4UeUwHslJNzkuYTnM2kgYM+RwyVBp9gDWiG?=
 =?us-ascii?Q?yIDI/brD3lby62cklZHZWo3rKhX+Vi/9gMn/0vki/HYuFxgspm0ClsgzZZso?=
 =?us-ascii?Q?I+WPkMvKkNInUgEwHkYgUORCu3Th5XTJRsOAgPPdG347gGDWflFp1nu5aQSi?=
 =?us-ascii?Q?oeA8wpsgWNWSkFAYSfn78+MJwfkRSZdMjIGus/dy9Z70XJr0N1S06AQWz9ZL?=
 =?us-ascii?Q?5XiAvdjQWGMwnmhc3rSRk+1OGlCa+BgCd2Vau5L14wev/MwTWe49OsYsAqC1?=
 =?us-ascii?Q?3qVgJaWQzOQkrAC3pNAOBRgYpfIcYPiC4O2qE251gem6F5Rz7btAXKv9XfWP?=
 =?us-ascii?Q?nGWrbxWMj0Uouood7cXLiE296NBi3hk3St3XBo+mZihTKxQt+KpCa7LD+1aP?=
 =?us-ascii?Q?p3BN+9DjKLwxd/agLQBQYj203DXJMG29tPr1DrebSPEq2K7Jvxbgy3SZGw0J?=
 =?us-ascii?Q?souM9Vj71eICp/qP7nRm7SJDqC3ggV3v0O6Fyqfdup65/QQD32Rdru77A4hz?=
 =?us-ascii?Q?9BdIz9SYYrxLc6+aoWTOYCUstnqQKHZn+IVgDh8wpXUQm7r8h7bAYfRbVYuY?=
 =?us-ascii?Q?/7zAqzniLxDKXbfz5XvK16aTTaBLF9cZy35OKEUkgTEGtu6mNAbALYfoJNSG?=
 =?us-ascii?Q?inIxnu7XrW/rdkIJ5gAmjR+66toGa8ToZTWxs3jAZRuPu6S3JRZzoFH/alW8?=
 =?us-ascii?Q?r3aST3u5R1ZbZ77siqvX+yd1XoIqAXAKWRn78GgSsnu+enL68Mn/0sy6+jor?=
 =?us-ascii?Q?ovlTs+1UAi/gIvPfgVxTXnOZvFJTcz4kGCkF7NO1fnrBkJw9OCzlvbgveeBM?=
 =?us-ascii?Q?1RWkvOMpFxSYLxNZ6MFEpFvNg5kzAgNRt2Hqn5U8p1/NDI3gotqt9DwLVvt2?=
 =?us-ascii?Q?Fscf+5ENdnYzgC1Xk4/MvCW6bd/Me9aAi4U5rMKsM5TmcBWghjDSTPfjXIBD?=
 =?us-ascii?Q?DhghryaA8kjYUt6U0/+PMV64luG1Fsmy89PQqQ+bc6n50Kyo5ftSGgW12fZ+?=
 =?us-ascii?Q?6rtB95iJtDG6PAbsfTEYZ8T93qUt4h0OnX24eMbs+aipeUJsoPIg6JyUX2KV?=
 =?us-ascii?Q?FR3y3FcNWXPV6yzZ0HVjXu4j9LOGaCM0JvSpG0wnU6kTxitx/F59ntf+kaa0?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: p1j4nMzBxmHdCSMkJ+6fLKtamhA133ue4oYiH6SQoBUwgzNhSoCBC9oyrqYsXnu8kqyI0X2bAC3NLTKYjc08wYIAZ5Z+7ky9PS8cGjD/QnpXC+UpGwsxxMz0KN7rYe+TaJjQH/b2EBUzV7/Noi7z9rhv2Y+SO1/ohtYLoT1G6YsXx4vefYwhGOfLs9Fcsf1hfbZ7qh4zLpZO+Jgef8Enzqfv+qiH+eVgasSxN2me8Nc0nMUD1fs1nIu6uP8JUKD0cyDE1TY3BoYuiSX2IqAf4084BTmu72tJ+ccXUI+q0CguIbvSOR2xPeOwFXKB36oVYHmzBGIgCzEg4JXF5RcDnwsC9Af02ttN5sumdLoy3yoo658LoWxPabDMzIjtiu9DDxhf6cYHSW8Ve+pkAg0Pz0AFsAuiqvzR6oK7VNaDJH/TIuQQ08Xclb4TLk6t0gzaV1Qxfu01f/nK10oJdYPb7k4lAojLkog202buHwHMFp1dac6NFpWQALxplxVfYLb8yZBgp1Tv5tsOfgPZaqXyI1jBVC4WH9dFJ9C0Hs7o9Z0GOpog3SLLVr/FtvmXTjhYkramNR7k3mV7bU144sALTtAtjzCSJvjmG0pxu99dtA7dGYOYn1Sre1jT/GeVmLIl
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a050de-75d0-47d7-e4e2-08ddf47fb7ae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 17:45:53.9027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eED1Tx1sFMjtyn8RaTFFiiGF3a+kOJKLQjp9ibizX3UndTeNWpDngR5/7octOgIgHgLvpD+AUvKgYTiaTK0VdQw5JOIaDbHxjw/8cjShnb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR17MB7237
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDExMCBTYWx0ZWRfXzuDjxwhEm1HA
 8tKSwcaDpMfFq6L16zZu4aNUgtRs7QDgHzGvfmKa/rSgw8+s/FQRX7Z+Ap7IHVVrWQGRCFfajJ/
 u6dCFKQ9yyJjrmGsmWqP1mx37ZO9I6xMRhmKbiew7CddMsfZgx6DM7IJgo/qzMWs+1a30RfqQlk
 aE8hJwr9n57YOGPYgdilrEtS2DdNIzB2nl9pHU/u5GwAj+XV+mYmUU3iFYCjJysgFurXG1oIGfZ
 G9hxcjdQXePX53w9CWRlCRJHACZXZRyWzSpQvIhBcBaZqyUwanb41ngC6sOgBnCoVRCvMtPp+Te
 Eol7q59P3htcO5yBqxjAZOsu+iFEoup59xgU7fv5Mlusg3XK1cZYEMe8QTAaiHfulN4y1G6FVN0
 DP7cXejX
X-Proofpoint-GUID: g02QL9Vi7tpPcPY7HRi8gDPlAW7Z_Hz1
X-Authority-Analysis: v=2.4 cv=XLkwSRhE c=1 sm=1 tr=0 ts=68c850da cx=c_pps
 a=y/K43w2UyI1TRv0bXhuaRQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=vu2TTH8h0NUA:10 a=F6MVbVVLAAAA:8
 a=_28Ee_KPWOKEt6bo-YsA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-ORIG-GUID: g02QL9Vi7tpPcPY7HRi8gDPlAW7Z_Hz1
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
V5 -> V6:
- Formatting.
- Convert pr_ to dev_ for printing.
- Add error check to regmap_clear_bits() call.
V7:
- Move status check in interrupt.
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 112 ++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ae0d08e5e960..276d05d25ad8 100644
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
+			dev_err(pdata->dev, "Failed to enable IRQ events: %d\n", ret);
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
@@ -1219,11 +1261,35 @@ static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
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
+			dev_err(pdata->dev, "Failed to enable HPD events: %d\n", ret);
+	}
 }
 
 static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
+	int ret;
+
+	if (client->irq) {
+		ret = regmap_clear_bits(pdata->regmap, SN_IRQ_EVENTS_EN_REG,
+					HPD_REMOVAL_EN | HPD_INSERTION_EN);
+		if (ret)
+			dev_err(pdata->dev, "Failed to disable HPD events: %d\n", ret);
+	}
+
+	mutex_lock(&pdata->hpd_mutex);
+	pdata->hpd_enabled = false;
+	mutex_unlock(&pdata->hpd_mutex);
 
 	pm_runtime_put_autosuspend(pdata->dev);
 }
@@ -1309,6 +1375,41 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
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
+		dev_err(pdata->dev, "Failed to read IRQ status: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	hpd_event = status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS);
+
+	dev_dbg(pdata->dev, "(SN_IRQ_STATUS_REG = %#x)\n", status);
+	if (!status)
+		return IRQ_NONE;
+
+	ret = regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
+	if (ret) {
+		dev_err(pdata->dev, "Failed to clear IRQ status: %d\n", ret);
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
@@ -1931,6 +2032,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	dev_set_drvdata(dev, pdata);
 	pdata->dev = dev;
 
+	mutex_init(&pdata->hpd_mutex);
 	mutex_init(&pdata->comms_mutex);
 
 	pdata->regmap = devm_regmap_init_i2c(client,
@@ -1971,6 +2073,16 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
 		return dev_err_probe(dev, -EOPNOTSUPP, "unsupported device id\n");
 
+	if (client->irq) {
+		ret = devm_request_threaded_irq(pdata->dev, client->irq, NULL,
+						ti_sn_bridge_interrupt,
+						IRQF_ONESHOT,
+						dev_name(pdata->dev), pdata);
+
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to request interrupt\n");
+	}
+
 	/*
 	 * Break ourselves up into a collection of aux devices. The only real
 	 * motiviation here is to solve the chicken-and-egg problem of probe
