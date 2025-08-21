Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFF4B2F335
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 11:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EF210E8B9;
	Thu, 21 Aug 2025 09:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="v5GBF6oU";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="lev84u4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFE910E8B9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 09:05:15 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 57L4Kf812738248; Thu, 21 Aug 2025 10:05:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=6rj/ONxW1RDWlvfpaEI3zpQWp
 NdIWAyFwKCDvuMDOUQ=; b=v5GBF6oUVzlKzFTUDzz2/W5vTqHyJ7UGDLrprHNqK
 LkxUJzP33TJd2fa2pRfXPlrWqSkV8Q7GlaiQ2sH6TI3Bifz+iqA+rtcrIvUaZhbQ
 ZtR3K4Oxk0C1e/pk/qma9ncRiyaXry/GmHNabwxoLcAgAPjRO0Fe9E08IcP2KPX7
 +LtGOpim/QSezfx1pb7BI9w4ACOnog2eB3OvPz6v7MAGYin+lsNKRO5Wd8hPsGdJ
 XHoHYYV278BKjtnTduWgS8bLaqXSLPrCH4z9FJFRZ1bdgvPcsc8P8qRcLY3/LPI2
 rNLHeQ22TK8cSDzXrCfTwP2JPXaBpt+VuaKyydzjNjraA==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021143.outbound.protection.outlook.com [52.101.95.143])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 48jj2qnafk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 21 Aug 2025 10:04:59 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/4JQ/Ah2naUYeUB9rN6iGe3B4va6bow7HNR8DsucT3YDW2bPsc/VNBESmJyeZUTJaXE/WZWBVHhBJhsjQsjr+UsjiLawos8j59/Uhal4RIFVwsALEnfxWUtrtxc+p8owcA0A8E+hTVXygnTlWNgMNXcgl9MwA3w+rmlahDWdUjPNGA40CbdtstXdChQ6Ge1+di9GP4tBJwuWwnuIUB/aTVTEVoEbGUfydUJFlk/fH+yd1VlXp+p53lm3y5CEkEQlE3pb+lhXiFrslA/hLPxAfweBFJYLFws2z9kFT9ndXbmdKg44Nn4SWSa7UHs15ed5H9xYNXP3ioNnZJHGP7eQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rj/ONxW1RDWlvfpaEI3zpQWpNdIWAyFwKCDvuMDOUQ=;
 b=Gl5D86e4Z9QNygnV5G1yd3Xw/SDOv+jv8JNEXZ0dioX3PjrBAiDHE/6bp906mnhJMqfUtp6nhkDMIyPpy2SqwF/slxsEX4orwALUoUw5ZNQe9GLWj/JFCPVk7s9uxQC070+0zxFKeR0X86d+IY1j/qw5/iwnihnHT356L0ldzWqlkXQTqWLqhDD/XarM95PKyjGBxCiHGDyudbutc7WYaoGJD3bTdRPBTqPmRvIU3Eb5Oyi1m44k5otbPP2rwO8VXu+czEWc7uNtN4uGHySJOx/qDL/qyfCCwVqTM+iH40TsKdO8xVK+Cea+g+jlvC2sfqpBQB3bMadPjnl24BfwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rj/ONxW1RDWlvfpaEI3zpQWpNdIWAyFwKCDvuMDOUQ=;
 b=lev84u4A8dgEZtPf6MyG8hvyaaqLuDlWVQF60XvzRWGXNvp8HVI4BmG1jE6TQZRDmcL2xIaAO5s3Z818FyHSErO/C/pbFJzft3onOTuExGqsgoRD8+iovSdgOiJJkXQ2Iimy85pZilK/SC7ubF+EYrqVCsy5L17ZY9a18ijLePc=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB3355.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.15; Thu, 21 Aug 2025 09:04:56 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 09:04:56 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Drew
 Fustini <fustini@kernel.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v12 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Thread-Topic: [PATCH v12 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Thread-Index: AQHcEnqpbcIg06VMUkWTBTpzjTfpRA==
Date: Thu, 21 Aug 2025 09:04:56 +0000
Message-ID: <140f5acf-cc58-4e48-a512-df6cd1654594@imgtec.com>
References: <20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com>
 <CGME20250820085611eucas1p28b42ff015f422b418e95555d4e696521@eucas1p2.samsung.com>
 <20250820-apr_14_for_sending-v12-3-4213ccefbd05@samsung.com>
In-Reply-To: <20250820-apr_14_for_sending-v12-3-4213ccefbd05@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB3355:EE_
x-ms-office365-filtering-correlation-id: ba1f6855-dc15-4e9f-481b-08dde091cc72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TXk1YllZdGt1MXdIMlROVUViNzhCaUROS3VhVjBHMkNLK0cyZzYrUFIzU3hn?=
 =?utf-8?B?Vk9uNVpOK3g2TTY4cjVuSHk0dFVkdkZDRHdySWxWaE16aS94U1NsRWw1LzVh?=
 =?utf-8?B?bFJEM2tZV1kycUZxK2ExRGg0K2ZPbytrczBLZk5QbTYrUjMrNVVVSVBWU2Vw?=
 =?utf-8?B?TmxjVFptelFocEZqVHY4MlhyQ2Y3elNkNmxjQjVpaWhVcC9Fcncyd2NKa3Z4?=
 =?utf-8?B?Z1hiakY0amY5V3RvaWZhbDdDQmlMZTBLWVowT2E2VXhkbzZoZU1EYlZJcXZK?=
 =?utf-8?B?SDlCQmVuaWFjaUNkc1FDMjBiaG1UeCtmWHo4N2FwV1VjL1FNR3pJSEIycC9o?=
 =?utf-8?B?azN3QTlxYjBLOSt3SDhWUEVMaTVERnROazhEU21VclBOdWp5V2xMQjkzTGp5?=
 =?utf-8?B?U3ZObUN3cjI3aDVtNTV4OXJvV0RRVzFyMWxQZkltdEwvV0ZOcjVFQ0d0Nzcr?=
 =?utf-8?B?RFgrajZvR2VsQ2JrQmtSZ0VyUE5PRlhZbjBFUGR2K0tPaDZzUVcwT1FXbGQ1?=
 =?utf-8?B?REZNdGJtcERwVlhTUnRjOEkvT1NRUW8zU0NESFF0ZkEvOGl6czRaSGFMR2I1?=
 =?utf-8?B?TStDNE1JcVh3RlFXZXFlek0yM1kxR0VMbi9Qakordk15VlZkYlZGQ2lTQXMz?=
 =?utf-8?B?RHFtZnhRWXRBYjRNME9QdXdrZmE0OHN3U1pFbk9Vd2Q2WHVZYlNXMWo5cmJV?=
 =?utf-8?B?dHdKVEpjRzRpTGNJemRjV1h6YU8yTk9SMEUxaGRxYXRaZUtTS1I5b0k1TE81?=
 =?utf-8?B?RkI0WGY1dFFJMGdMTFNDcG4wbkVIZ1VKb251MlVsYkN5Qk9abFdkS3lhSmMv?=
 =?utf-8?B?VGJOMFNmNEpJQTJWTlNvbFE1MFRXd1JwYXo0K3d3aDBubTBxUnIwbDhJank5?=
 =?utf-8?B?cG41WkJTOEZCRUlQNnBJUmtaT2p5WmVBSGhqS3ZGK0Q1b2hLTloyV1ZDWnZL?=
 =?utf-8?B?bHBZaUQ1OEhwUlBIWkM5ZUFPaWcxSUZvMXpWYWQya3FTUjNNTTlFWVNvdllm?=
 =?utf-8?B?L1V0L2U3WjQyVWhQNzh3WEkya2h5cm1MRWs4SHpHU3lhZ0hFOGhPRzY4c1F5?=
 =?utf-8?B?VmxxZ09YMi91UUxheERuRmNxdk9tMEZHc1d0TGhQUVE5UGpJRDlOOUxEcndm?=
 =?utf-8?B?QnI2OTlzUCt5bk1lSTREMU0vc3RnUEZuTjBzTnJDU01DNHBDRG91ZHVKVHRi?=
 =?utf-8?B?a0dzRjdQcDFHUy9iVjFxTk92Nk4rOWM0REM4aHpLeE9Mcy8zT25kdy8yeUFy?=
 =?utf-8?B?SFV5ZjdUbXlvOHQ5SlYyb0tCbk5rcU9GaDBnczh5WkhOVGxvcHhvOVNnZVJj?=
 =?utf-8?B?aEFhOFBxQktEeng3OElWREY5WXBiVW80WkZvR1U4MkRGYVU3MDAxN2grYXRp?=
 =?utf-8?B?bmppUndKZXR5V3g2RURIOE53YlhHUm5nLzI2UGZDWHZlYng5Wmd6K0U2d2xi?=
 =?utf-8?B?S3AxWnIrZElMTVNhS3prMjIrWTFuUkVmMGxPdjFuT3I3MkJ2aEtzUHREcDRx?=
 =?utf-8?B?eWk2OHdOVkQwV0F4eXFiVE10TFNleG1lRncvcW9neW53ZVRzdjUwSUdDaDBu?=
 =?utf-8?B?b1FQNUhBN3hib0VEdlp4QVp2TlRjVm5aa3d5cldUc1RPK3BrbWF5Y2cxRXU4?=
 =?utf-8?B?djRRVW01aDFZTFo3VkhtV2JFSjJpbzVGK0drYVdYcndEUGpJV0VGMjJYUitx?=
 =?utf-8?B?dm9DQkJ5YTNRRWN3Qkt3L3N2dGJiSFZYMDh1NjMvWG1jczNnYm5GVDUxMity?=
 =?utf-8?B?alQ4cS9rU2x1SW1TTnJFMitST1lvd1U2bGVBMHV5SWQ2bUc1elIvbTI3a3dP?=
 =?utf-8?B?NkxiT3VVSC9xOEFoeUg2VWZXWHJFTVp3YTVEMGlWdlB1dnlhemNSa256L29v?=
 =?utf-8?B?cTB6UG9oN2dnQVo4RDBFV0xvUElHN2J6c3RZWDBaZ29ISWE5UjNHaDAwQWlx?=
 =?utf-8?B?Mnd1SG9NK1pMUzRFMS9Jd3o3M01uTEtLU0hJUWNNTUYxL1NDWThFR3lYM0RH?=
 =?utf-8?Q?qtwTdrUBrVjQvoJQZVxONhMTRcKSb0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnMrTFJRaEpnZERoUkkzSlVma0g0cWlsVTk5bVpFbllMYjk2U1dRL0VGcUd1?=
 =?utf-8?B?TnVtdWVzSUJCb3dCN2xNenRIdWVObHJKTkVmSjRldmNzL1p3ZloweS81SkJx?=
 =?utf-8?B?RWVhZlRvTzRLSnNETm5VS0o0Z2FkNHBKeE5HK08rWWFncFVwWTBzaFZzTXJT?=
 =?utf-8?B?SUpVZzRKRlR0QXVzVzlXUjR2NThFUVdqd3ZZSXloT0lOZHhuK1UvUFEwYTRY?=
 =?utf-8?B?Ymkycy9nNXphYlJKN2NkNGJFRlJJVWhmd2I4cUZSS3RlTm93TUo1Y2t2VUU0?=
 =?utf-8?B?aDhYL3lieWRFVk9wWS9jVHZKUklvSGw0M2tScExFVXl6UU15bkxaUmJUTkYx?=
 =?utf-8?B?ZDQ4OUxlN2xrMEpEaDVXMXhFYlBSWitVUTZBSjkxdGpkbzdUWG5XbVZCaGxU?=
 =?utf-8?B?ckIxUTlkNGkxdThQQXF1RlpTamRMRU5aMFBudzZuajNHNW1sODBqUWc3Q0Nx?=
 =?utf-8?B?RzFINDhIMXF2QWNTTU5Wd2Q0QlhlS0VQdzJOeXd0elVXNXIwdjRCQkM0djB1?=
 =?utf-8?B?MVBnVkF0T2ZJbGUyVjhia255K2JaYWFrSzhCakFxQW9TQm5kYml0K2pmc0Ev?=
 =?utf-8?B?WHRreHd6YlByVGREQTQrVndXT3J6ZTBiaVBTWHg5N2dJam4wMjdBWks2U2ky?=
 =?utf-8?B?SnY4eGMwdUxXR21ld285T1RPVkVOUHlvdDhKY0dnZFUvOGJNTk9CRjVPUE1W?=
 =?utf-8?B?TFJWU3JiUTJvSmYrQkk5UkVCeDlUdGQvdEhQQ3FnREZoMkRTYlpyQ0JtL3Vo?=
 =?utf-8?B?NXJiZllWQmVvaUY1c0RVR0xrd3hiYWhlWElxQTdHNlJlb3FvSENIU0tWbHhl?=
 =?utf-8?B?bGtrWVl2eXZSRnp3NjBHbXhldHIxNG5BUktWVmlVUm56Yk1jcTN4bVlnekhI?=
 =?utf-8?B?eklLdlU3c0lvS1pENkVoQkh1a3ZFSGZla1VNK0tlWkJHYTNMWjVtbGJGL2VD?=
 =?utf-8?B?UVZlb0NTR285M2tRbVZrZWhyektybVJPLy9UV09VS0dQVklTUFZXRGg2YXV0?=
 =?utf-8?B?VEUzNndYa1NiZDVtbWhqOTVLMjdZOUdsa3lCKytoaEFuVC9FVFB2TFlhdWZJ?=
 =?utf-8?B?WGxHWVBTaUlqa2YzYUZTaXpGN2xiM09KKytXRHpQNEh2L2xPYjFFYklqVHRp?=
 =?utf-8?B?YjhONjFnVm03QUhmeHR5SHl2d0c0ZVNKdXpqNC9OemZQSG0yOWwrTmtJU2JF?=
 =?utf-8?B?NUpvUnkvbk8vK2lxWTJIZTAzYU9tTjJkdE1ZMEw0L3lsRnJ3aDBpUnB2Vzds?=
 =?utf-8?B?M0paUlQvVEhNdFExSE9POTdSdmpYbXRmbE8yVXdwY0VWeDRIL1hlZDh6REl5?=
 =?utf-8?B?Rjc2WCtaSlJjUzc1VjdnbjFid2RRNWpXNFZkSk1oV2NhbTVFbU5QNGphT1Yw?=
 =?utf-8?B?Sitabis3eDEwU0FXYW1ycGhhaUQxU2pSNWlrRXRrMGRtREpaUVVKNGlwaDhD?=
 =?utf-8?B?N2NydFBiaUNJN29ZZUlwL1lwbDNJYU9WK1RSRnh5Q1hub2wrT3p6cllvMGtL?=
 =?utf-8?B?Mml0bXA4bkZjWnZQRjF0bXZjZGVMZUZWMG9CZk1FS0xVSkdtaHJOempuUk5l?=
 =?utf-8?B?dVFCR3lvRVQ3RGNRRUJ0MUlXeUljNEFhMFlQRGRoWWV2SHN6c0RhY0hYZUlF?=
 =?utf-8?B?VHhyOVQ4QXBWblZnTEVsQlJob3VwWlpuRUZFSFBoVW91L2Rsb3ZLZFQ4NmRW?=
 =?utf-8?B?RDV1Ni9sTVZMMXBxTVRBZGdyWFp3NjdwQ1VvRTdhUUwvNVcySkdJV3dnMjlt?=
 =?utf-8?B?YnlEN0Q0aWN2cUtScVdBSjNtSUpjbzZ1YmJhWlBQbkZWdUhIS2FWS2xWakM1?=
 =?utf-8?B?aUtWNGhpdDJneTRzazZwQW5lTmhYc25salFZdk1oRTZuVVNQcDZXNzNkdVh1?=
 =?utf-8?B?SkNIbk8yRG5GVDBLQVJtc3BsYzN2RStQdVc5MHFuSzBmUzFBODYvMDA2Sk9s?=
 =?utf-8?B?SFdHWVRmUnBweU5MZ3JlSmh5ZlRDSExyZU9zbzd2YmxzcVc2c2RJRm1BaWdI?=
 =?utf-8?B?akFET1pWNEZ2aEg3MXhaektsUjdOWUl3eGp1WkRjZmtQVXZFTEpoVkQxWUxx?=
 =?utf-8?B?U2JUcGlRUG0zOVR3U2pxakFUMDBjM1cvTGVBY1VYa0hRKzJMdWlJbzZPaW5K?=
 =?utf-8?B?VnhsU3Q5NTNpd1p6QVNCaDZhTWN2K2FVbUZUalVZR28xdlVTYVdWOWJZRlNG?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Nm7mlWgDen4jAQGzGQ9CQLSW"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1f6855-dc15-4e9f-481b-08dde091cc72
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 09:04:56.1371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qER6aivC876NOITUR74alE4NK2bNwPXdgpqWwcul3/GmZcXKeFppAZesUTa5lQsaUMfNt9KMSCQPFVrXUQitWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3355
X-Authority-Analysis: v=2.4 cv=FodcP2rq c=1 sm=1 tr=0 ts=68a6e13c cx=c_pps
 a=aGDofOi8WJPiWJRw30jVnQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=NgoYpvdbvlAA:10 a=KKAkSRfTAAAA:8 a=8TDWt9qEAAAA:8 a=hD80L64hAAAA:8
 a=r_1tXGB3AAAA:8 a=xg8DPpzYlEs_fmHTD0IA:9 a=QEXdDO2ut3YA:10
 a=9QUpyA29SLtxPItSLAQA:9 a=FfaGCDsud1wA:10 a=cvBusfyB2V15izCimMoJ:22
 a=ERxVmvoQgHyZXf33qDKr:22 a=t8nPyN_e6usw4ciXM-Pk:22 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: LaJh3yTkr87FGmutQsGrCP7EAA4JfVx1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA3MCBTYWx0ZWRfX6PwcoGsTaRHi
 55uqhJh2YMcsNZpMgoMaZgzKw/GneVwokUZ6Nf+juNlezim4huTxs3WbVhWBFUv+WV4wLDoTMYv
 16nb/XO3obIXGumXv8MWe0LCgHHYGHuVVM8huzx2FV9odEuUQi6zjqXUHJ5gLsfHz4PJyyIsxk3
 3SG6IwEQjtDsx75XaLDK/R4qO8SvnjR2njpeyjdDTmZka2W9i2g6glfpVzpKNtGZoF7O+l/xeRR
 QloNu12W7iduQ2b/gZ8ncU+hBM5EJx3R1XuP4zgsskGsIcL2YtKa2Okg368SjU1jB3OJD9G5i3p
 rIDZ3aasp2PJU7Syru7tXN8t4TigNtnbMZEw1PD47kZStPALsdxCLA3VLtF4CNN9Wodrcx94T0y
 g9ZIml1R2gWVyNdJQ8ZzMFcQzF5O1g==
X-Proofpoint-GUID: LaJh3yTkr87FGmutQsGrCP7EAA4JfVx1
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

--------------Nm7mlWgDen4jAQGzGQ9CQLSW
Content-Type: multipart/mixed; boundary="------------uWXKNEBIdGhyn3rBwTlt6nrN";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Drew Fustini <fustini@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <140f5acf-cc58-4e48-a512-df6cd1654594@imgtec.com>
Subject: Re: [PATCH v12 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
References: <20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com>
 <CGME20250820085611eucas1p28b42ff015f422b418e95555d4e696521@eucas1p2.samsung.com>
 <20250820-apr_14_for_sending-v12-3-4213ccefbd05@samsung.com>
In-Reply-To: <20250820-apr_14_for_sending-v12-3-4213ccefbd05@samsung.com>

--------------uWXKNEBIdGhyn3rBwTlt6nrN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20/08/2025 09:55, Michal Wilczynski wrote:
> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
> TH1520 SoC used by the Lichee Pi 4A board. This node enables support fo=
r
> the GPU using the drm/imagination driver.
>=20
> By adding this node, the kernel can recognize and initialize the GPU,
> providing graphics acceleration capabilities on the Lichee Pi 4A and
> other boards based on the TH1520 SoC.
>=20
> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't b=
e
> controlled programatically.
>=20
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Drew Fustini <drew@pdp7.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

I still don't really know if I should be Rb-ing DTS changes, so:

Acked-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dt=
s/thead/th1520.dtsi
> index 42724bf7e90e08fac326c464d0f080e3bd2cd59b..6ae5c632205ba63248c0a11=
9c03bdfc084aac7a0 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	gpu_mem_clk: mem-clk {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <0>;
> +		clock-output-names =3D "gpu_mem_clk";
> +		#clock-cells =3D <0>;
> +	};
> +
>  	stmmac_axi_config: stmmac-axi-config {
>  		snps,wr_osr_lmt =3D <15>;
>  		snps,rd_osr_lmt =3D <15>;
> @@ -500,6 +507,20 @@ clk: clock-controller@ffef010000 {
>  			#clock-cells =3D <1>;
>  		};
> =20
> +		gpu: gpu@ffef400000 {
> +			compatible =3D "thead,th1520-gpu", "img,img-bxm-4-64",
> +				     "img,img-rogue";
> +			reg =3D <0xff 0xef400000 0x0 0x100000>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <102 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk_vo CLK_GPU_CORE>,
> +				 <&gpu_mem_clk>,
> +				 <&clk_vo CLK_GPU_CFG_ACLK>;
> +			clock-names =3D "core", "mem", "sys";
> +			power-domains =3D <&aon TH1520_GPU_PD>;
> +			resets =3D <&rst TH1520_RESET_ID_GPU>;
> +		};
> +
>  		rst: reset-controller@ffef528000 {
>  			compatible =3D "thead,th1520-reset";
>  			reg =3D <0xff 0xef528000 0x0 0x4f>;
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------uWXKNEBIdGhyn3rBwTlt6nrN--

--------------Nm7mlWgDen4jAQGzGQ9CQLSW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaKbhNwUDAAAAAAAKCRB5vBnz2d5qsOeR
AQCRcjM9RYclbacLnp/u83N/Bmx3MOLJPu//aUAlhiBmAgD/UfediiYOnznxOWkrZ1pOxF/CCiiG
cAGZQUyOP9thTQw=
=uqlj
-----END PGP SIGNATURE-----

--------------Nm7mlWgDen4jAQGzGQ9CQLSW--
