Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350C3BDFC41
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009E410E88B;
	Wed, 15 Oct 2025 16:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="O2/y3NbD";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="bE+s3/dP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB6810E88B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:53:31 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59F3wse92443484; Wed, 15 Oct 2025 17:53:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=qaWK6OCDhbdYDmAXXGIHoETqT
 mDooNQQ4unSUxHfB18=; b=O2/y3NbDC3Cx51bxW681Sn43hnkcYjdMk8xX415FQ
 1lxjbWH9tE75lx0J+AiOppbdJW45+XJescXRirjqn9oSXf9Di9U7mqTQjE3xvEcm
 L63m22cZxdfvbHHHXtDGVAti7QIIoxOpvigAjaZaEcfHAkXkK4zEwKdcFGxivMVf
 kmBEeWnM5EwMCNDWJzscypLZ78vrRClIpmikafDbJLY0lhi/8pK4qDRLheBjaOkG
 xgf30Tl6d48Seef2hLBAxrzu1E+/kQZa8s99j8gQJzLXhDeXiF59KUS2RSCl6jO1
 lqdIX3JQXxSbtUmj5fVdkdDsTL3C0Q2749jk9iVP0herA==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021126.outbound.protection.outlook.com [52.101.100.126])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 49qfarvfpy-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 17:53:18 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYWgi/lNe6HKC5VKH97oGQdlicvnLEfnaZrnjtqySeYQHQSL3STQ++i0JgGrAgrRVioL27oOhubm4cibfhPrPNYX4nm7Dj7FcR3h7/Nt2vCAG9SkPzTSeTu4Qc/my19pTfqk88wdnbmkBWU6iBsc0Ip/uKzIXChsvMuUW6w1ywN/QxhAf8jp9hs+EW0jVJB6jfPzAEVIWpkwVTvdJV5Xqn0oHxga7x1WRPBesfXnnaWTQ0PdxsuO/6NRNSHzN64UY6vUJ24Cp2lykSSN9ItuTxJFhMk1tMmt9EsgUvxmZZtx7qeOMemndmgyYPjqBQcwgbV6hM7ldRce29PwYwiydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaWK6OCDhbdYDmAXXGIHoETqTmDooNQQ4unSUxHfB18=;
 b=cGXTVU7WuUDPMxSSk27EqHhum7nmyKqT2Vig5YvtgO0mONM85XwjQhl5GWCmvK5Q/b35XmVjyPBl60O3kHZE7c6Ibhr1+rJW6tNVUIG3Vjhghz+XVZOyJrD2SReAlZXzThyimNJkFxvypmt7lQSAlzQ0lqo2YBzMAnQ0N6WLdqHgnW5TXh6WNd0CArfqnCtU2s2lWEaZgVtxavIta4R0kpwUlDV+kMJI9EoAiwwvfTSDeRLQzXVAD/yTsPxLfJ2uyr3OXnmTvCJ4oH1QdICT0pSX64XwqPmaaNA/kR3mr8cEhb33xUrTBh7StgN8T0Ux+1vrv16OehyqBfs4iEDctg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaWK6OCDhbdYDmAXXGIHoETqTmDooNQQ4unSUxHfB18=;
 b=bE+s3/dP93FOWxhwM9rAgmZR17UIqjVehk48O4e1c9j3R+Pc6ENFhEwxtPJcCkmFow2qBHzawNBxBr+wcJDpzHpB9qxxGrfyfv+b3p9L9BuvJrew8rsheZKrw1Ff5v51EJ+QZMKApjI69WhbCwbV/6WwmRNrYoQ0R6LPPn86A9c=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB2654.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:145::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.11; Wed, 15 Oct 2025 16:53:15 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 16:53:15 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona
 Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
Thread-Topic: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
Thread-Index: AQHcPeoPh2hyEBgVlkGan7+MUq5EtrTDbJGA
Date: Wed, 15 Oct 2025 16:53:15 +0000
Message-ID: <ec1b25f0-2b93-48b2-8a9d-d78b4b564f51@imgtec.com>
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB2654:EE_
x-ms-office365-filtering-correlation-id: 018cbef5-2a56-4c95-1473-08de0c0b55de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?d2hxWW4rVUdzMCtMeTdNQnNqTTE4SGNBUmV5MmwzTFMwL3JlbE5Ld0VwRVdp?=
 =?utf-8?B?K2gxMUZBaWlmZlBkWStFSzkxVDdIQndpMXZVZnhLQkw1UXZpK2xIQ2NEc2ly?=
 =?utf-8?B?amp0cUozSS9MZnNQTXh4eVFYaHJJcS9WSjFNY2NJYVFXNjdtMTlMZDA3eFlE?=
 =?utf-8?B?MUFzdVcyQjNHYjh6RE9aN2NRWkV6eVJ0WXg5RzJEeC9qZnRKdXA5cVJtNlJL?=
 =?utf-8?B?K2xsMzZQd0JoUHlEbGtNNHZIU2s2Qm1kRDJaS2tBbDczNGgzK3NKUkRIbHZR?=
 =?utf-8?B?QkQ2ZDlVc0dvbmNQd25oaEJVclduYWM5OFhaNk9yWnR2MURCSTR2S25wZ21h?=
 =?utf-8?B?aXFkUXJ2UWNLeS8vVHJUR01ScFNLd0Q4ODNWbm4xU1lJQy9kZXhUWmVDVVFE?=
 =?utf-8?B?aG5uWWFwSUhVMHczS29adkcyUlUrUU5LZHR4ZXhuVUdXZWR2eERJU0VvN3Rw?=
 =?utf-8?B?NnRpV1FTSUxTOEVWRndlZ3prY1huU0c0ai9tQmo3dGxvZzdOQk9xSWRmQ3M0?=
 =?utf-8?B?SWdCbFdYeDQ2NGQ3RTZOMm43Tm5PSmZhRmVVK1J4OUJJODN0WXg4MDQyeFdm?=
 =?utf-8?B?NVlMdG56dEJuTGd5b1RGaE1nWmtQMUEvWjYvdWJsbWtwdnFYT1pPZmhSWnJ0?=
 =?utf-8?B?OVJCVndvdFdLN2ZaajFtNGlWZDV0WldOc0w4WXZCdjFxOTFlT1QwdEF6SW1Z?=
 =?utf-8?B?L1ZlYXB4akZpT3UzUzZIeTNjeC95ZUN3U0pCSnlBV0pyOFhZbytyNFhoMkdX?=
 =?utf-8?B?WjZvbnJZcTMxRWlLTFcrc3ZVeC9vMzlZV3dZeU45OWwzbDM4YWlYYTE0aENs?=
 =?utf-8?B?RkttUDNIUTRQVnhJMkwzVlJyT0hZNEhVSW0wS04rNUJXQnVnajhLVkg1VDdL?=
 =?utf-8?B?UlNzZTVIT1draVpVKzljL0Y2K0NMd0owZHpSMFcraCt6ZUF0alRlbTdnd2FZ?=
 =?utf-8?B?OS8rdHlpR2M2endrUk5MY1c5b0RzWkp5SXN2dXQ5M281cFloZ3o5MG1SdnZz?=
 =?utf-8?B?a0VEVDlGZzRlejdlak9FZTlKeWNzVXpUci9CSG53emhaV3JrSmdmVFFkZDhF?=
 =?utf-8?B?cVZTSG9RSlVhdFEycE5GN2JVQ3d1WHlmaS94MkZYQVpNcEtLZW4zeVJndHkz?=
 =?utf-8?B?bXBnbDRWMGRScmpMZmxKY1kvamgzTWVVZFJrWkprZ3JiMnpPdkFTa3Z0bld3?=
 =?utf-8?B?bWR4VHNPSVZiTm5pYTJYazE2TUVja2Q3cXc5Znlyd2IraW8velVRS2Qwa1Y0?=
 =?utf-8?B?UnFEYWZ0TkZnWWhXaVc0WnJIc0lZdEJzUGROUlZQZHAzdXZmanc2bHVxMVJo?=
 =?utf-8?B?ekxiMENDRUptY1R4bitieDcvOWJhSURJRm5lNysvT0ZpRnA1MHZ3YzlXakNO?=
 =?utf-8?B?NnRnbWxMSG44UUdJVlFoQlJtcEdZbWFuTC94b1g4dE4rTjVnVXB2bUdOdU8w?=
 =?utf-8?B?UW8rOVhkRFNvMGZqRzFkSXJreWVOdDRzMkpwU3cvMDhGR2d2VEsyS2hLSis0?=
 =?utf-8?B?R29zR2x5d2VTL0Y5UjVVUUtFYXNkOElicUlLam13VXpJaW1Tb2txcE9LOWZD?=
 =?utf-8?B?MXZ6dURkcFZpUFNNeFZ2bHBKUDYrc1Jqam5mMG5hbmR3K2N3Yk9NUTI3MkV6?=
 =?utf-8?B?NzRmdXc0QWwyU3lBM0UvU21DNSszVkxWOXNGU2hvWmZxMEVXaUJadTg4TkFa?=
 =?utf-8?B?V1UxTFRJT1l0VzRNMTI1OE5QcG9TVmtBNk5WcHhEbDJUL1F2SGRHMEtkVzFa?=
 =?utf-8?B?aVRaNmhjbkZEZERCVzhNa3ljbDlvRmZMc2FOSVd2cnZ0ck1JZTMrSmRCZFph?=
 =?utf-8?B?dXRQV2gwR2JYVEt2Q3duYUZ1bzU0ZWNDYkJyOVBWODllVVN6b3kvMVZMZVBm?=
 =?utf-8?B?ZFI2YVc3WnZEeTF2c3NkdklJa212eXloNUtJTmRUaDhOaUFvOHhTSWFvNFJa?=
 =?utf-8?B?VXpDN0hFRTA3d29tb2phV1RhQnVpU2lGdjRuN2t0cU1vK1VXcUJMWGd3K3NM?=
 =?utf-8?B?aGhHREl5aUF0b0tRMU1aaWVaYndZVlZqc2hFYzB0d2haL1l3TjJ5cWpPdUpB?=
 =?utf-8?Q?XjyVqw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWU5eVpEeGtCckdJeWpYMENOMCtSam1QVHM5K2RpSW40akdiNVdPUldwd0Yr?=
 =?utf-8?B?cTErazhtMUVua1FxZ2cybWRYRi83UUhyWnYrd2ZiOFRnQjcveDRvY0d0M1l6?=
 =?utf-8?B?T0MwbG5FaUx0VFBSRTV5U1pyVHFKWnJobmtici8zMDZOalFnUFRwOW45UitR?=
 =?utf-8?B?RHJSQkcrWXNaNVZ6VWNhTm9QQ2czd2xibHFzMkZVL1YxR0lGWGxnZnJldFdl?=
 =?utf-8?B?WXVpU3hFUkZSMkNQcHQxT2FOVlBRRXVmL1g2R2EzQmkySmRLZzJXT0RkcEZP?=
 =?utf-8?B?anF3aUNMZDdvZzlFNS8wNlUreHZ5MWZFWDJrV3JxZmR2WDdPaDlFOFZ5YXBS?=
 =?utf-8?B?Y0t1WWFQN2xBZEhIK3ZUYkhZVmlGczFucXdlN0R4QmlMRk4zRzF3OFVGY1ZB?=
 =?utf-8?B?YTlQcFA4MUZjbFc2ZXYwYU4rcTNRSGpDcTNpR2lqcmlyKzVUcWVYRFVmdVpI?=
 =?utf-8?B?cWJKSmVGOEh0L0VGOXZwcXZwcWpHSENmci91a2dTSmN4bHJHWVlMWFNTTnY1?=
 =?utf-8?B?bi9mNHNIa1c1RFU3dXlncEJIWnpJQzA3K0FKM29tY1hUZTVIeDJUaHBQcnk4?=
 =?utf-8?B?MGpaZ2FJVHZqWkRPenlvOUFJR0hmQ1IycXBya3VEeThnd0srQlZLenBiSk9w?=
 =?utf-8?B?YWd4b1NOSmZVVG5XUWgxbStWbWN1a0NzcjNIaENYaysyMmwvOVpVVml1NUl2?=
 =?utf-8?B?WWE3U3FLazk4OXo4YnFEelM0ZTJnbTV6MWJlRTNSQ2pXMEg5UWplTkExQUhG?=
 =?utf-8?B?TXRqL3RYK0pIaDZlRm8vN3Z4VkJ6WmdMOGdlVU9aOWdtWlRJV1p5Vy9UbC8x?=
 =?utf-8?B?U2ZTS2p4RVRIcnphRXBMWTU0T2RwbE5RTU5nak5rbXFrQVUveng3TWU5RTlI?=
 =?utf-8?B?QVhBdGRqSW83ek9yUWUyaWxkZVlOQ05CQXlBaTNhdElDTWE2QjlkTmFSNzJr?=
 =?utf-8?B?V2kzWS8zdEJpUHU2Y2ZpVERVUFJCZXFuUzg3UkprenJBc1h3dnhwbE5uMmJE?=
 =?utf-8?B?WVNMYzF4YTFlcEFORExFcUx1eWNzNTRyWFdyQlJSOHk0N1pDV2hUaXE4cHQ2?=
 =?utf-8?B?UEhNdW1iL01QYTBTVjFaMXRHNmwxbEtjaE1DVGIybTVBT1BOME9OTjdjbDR2?=
 =?utf-8?B?RFdicDZaaENyUldtenlrMXhVTnRSaGdyWU9ZeW41eGN3alRBOGZqVGdHMGhT?=
 =?utf-8?B?ZEJXWkplMEQrNDZPc2EyUTZqYURHT0JtK3ZvNndXaGNHNWdOSzJ4SzdYdG9V?=
 =?utf-8?B?SlZNQ3FmanB4SkF3V0FPRzFjYmhyd3kzcFViWEdabktjU2ZoR2hxOHViVlhr?=
 =?utf-8?B?clZNYlVCVzdPVHZ5WUtselhOTWJvajJBQ25UTFlsUit2Z1RVczhUaWlKUTY3?=
 =?utf-8?B?RTVtVEgxc1I4YTBWUUZjR2t1STFmK01lcjF0Z0E2bHJYQzNOYWozb0Z3SGNU?=
 =?utf-8?B?OVhlcHh6QldkZVV0dzh1QkFWUGJ3b0tDOUJDYVNXYWo3Q0R5RGszeUxLRjhw?=
 =?utf-8?B?d0VpNHdicXREb3MyMExpdncySWh4SE5Pek9kZjl5Zld0QzhyRWZ4dVRWc0gw?=
 =?utf-8?B?bk5ZVHJSVVpiTWE0UUd2aXAza3pSVG85KzE5RzhGeDh2dWg0TGs0Q0NNa2dP?=
 =?utf-8?B?ZUJNTERQVXIrekpmbWRVNmxrTWY4c1Rjc1NrNmFlbTZ2MytWMWZaUjg1cWFk?=
 =?utf-8?B?bXVIUGRLaEJpNkFmWnFLZXRKUm1aRWhUUnVMNWF0MExKcGNIZ1g3dXRUbTVE?=
 =?utf-8?B?d2cydVpSeDFhd21nT1NDaFFjMmtNOWpVRzd6Um5XdWJHMU8yVkt1TUJMWTRy?=
 =?utf-8?B?S0R3RFNxT0hQT29ldE02emJTa0djV2ZsV1hTQmNoVUJrRlVYVTVueTFBbXd0?=
 =?utf-8?B?MzRnWThMRVJlTGNzTXBwcjNWMkpBVzJmekZWVngrdWd4L3BGU0NaUC9HRFRy?=
 =?utf-8?B?VUNiaHBFS1A0RG9PRklNRnltMlFaaVArOFkrZjhIWEh3cE5QMkZPc3ZvNXpO?=
 =?utf-8?B?bWM0WVRmWnNEaEdkd1JEZkl3cHBWWEdwWWFEZm52WEJxdmgvOS9zNUdITUdG?=
 =?utf-8?B?T3ZKaEpvb2tLSmwvNlB5cUw4RnRMZEVjK1RXdzZWR29Sd1dvazlSdmR4N2Ez?=
 =?utf-8?B?SDZHSUs3ZmV2NXp1L3dhZ2R6Q09iZS9YYUIvYmQ4b1l6VmJwUE93cE4wTFFQ?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cil7KSGEmIfXcDeSMo0CtCe9"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 018cbef5-2a56-4c95-1473-08de0c0b55de
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 16:53:15.7523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uWRnvs1D/i99NsmHdwiQEgUVTrRQiOwquBPfBh4f7wCBPZgKctUAw5FnwbmnFqvZWtaAX5Wh4bBgYd/9NJ2t3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2654
X-Authority-Analysis: v=2.4 cv=O+A0fR9W c=1 sm=1 tr=0 ts=68efd17f cx=c_pps
 a=A0iqGUCyZdlyWs06AcuuUw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=r_1tXGB3AAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=HwmaPvt4cbKsgEULfvwA:9 a=QEXdDO2ut3YA:10
 a=9orijQCx9xXn66qMKNgA:9 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: MUCkeyEBef288RElvAvs7CMn-jkDcqk2
X-Proofpoint-GUID: MUCkeyEBef288RElvAvs7CMn-jkDcqk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDEyMSBTYWx0ZWRfXwfQT1uM9aheC
 3f3a++9mEsCGyYXVCw0DxJR7K/zoit4SnemmuNikJVLmDNkjTe1Fb1Gmm2h1g+OraWbVuAYINWb
 lV4VY552LSjipb3yTG5xF+GrkJ5zo99IZcGJOuYeiHb2q8063y5wZq8MdOTrNvq8TUeqm/lR75X
 Nm/S7+Uu4cQw8IKFogY/OI9hjqlTYqeaROsg2+P/c5vKmkN5hnsIVQJioGr4i0I4JNsZm/aXGiF
 2wa/etzwG10R8Ht9gq+Gy3H9wGVeQOJ7osSZEV8cxEBK8LBKkbJyLZupt6uR3QbQKs/WNdfewGR
 57zVIV4VgZQDjypvz0YdKEqx0+m/FQPXA0I6+YOZpRga9zyUNFd6Q3ZMh/jdme3N5G6w4ESqXOK
 ol4KA28U4YiESNzFl66Y/ieESYGvfA==
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

--------------cil7KSGEmIfXcDeSMo0CtCe9
Content-Type: multipart/mixed; boundary="------------jl0y2g0xFsu95UjylL6Gg0u1";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Adam Ford <aford173@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Message-ID: <ec1b25f0-2b93-48b2-8a9d-d78b4b564f51@imgtec.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>

--------------jl0y2g0xFsu95UjylL6Gg0u1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15/10/2025 16:38, Marek Vasut wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W SoC.
>=20
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Still not convinced I should be R-b'ing dts changes, so:

Acked-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Add RB from Niklas
>     - Fill in all three clock and two power domains
>     - Use renesas,r8a7796-gpu for R8A77960 compatible string
> ---
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a77960.dtsi
> index 5b7e79b413394..0f7e63fdd075d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -2575,6 +2575,22 @@ gic: interrupt-controller@f1010000 {
>  			resets =3D <&cpg 408>;
>  		};
> =20
> +		gpu: gpu@fd000000 {
> +			compatible =3D "renesas,r8a7796-gpu",
> +				     "img,img-gx6250",
> +				     "img,img-rogue";
> +			reg =3D <0 0xfd000000 0 0x40000>;
> +			interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_CORE R8A7796_CLK_ZG>,
> +				 <&cpg CPG_CORE R8A7796_CLK_S2D1>,
> +				 <&cpg CPG_MOD 112>;
> +			clock-names =3D "core", "mem", "sys";
> +			power-domains =3D <&sysc R8A7796_PD_3DG_A>,
> +					<&sysc R8A7796_PD_3DG_B>;
> +			power-domain-names =3D "a", "b";
> +			resets =3D <&cpg 112>;
> +		};
> +
>  		pciec0: pcie@fe000000 {
>  			compatible =3D "renesas,pcie-r8a7796",
>  				     "renesas,pcie-rcar-gen3";


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------jl0y2g0xFsu95UjylL6Gg0u1--

--------------cil7KSGEmIfXcDeSMo0CtCe9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaO/RewUDAAAAAAAKCRB5vBnz2d5qsLrw
AP9b3MuT2AaT1LVaSVPSfpFZd8Erx0fIw+UQA/TGe+OY6AEApB+zpsA+xOqsAGeMf1kOAYB9aEXX
J890k0Iueb0kigE=
=rjiC
-----END PGP SIGNATURE-----

--------------cil7KSGEmIfXcDeSMo0CtCe9--
