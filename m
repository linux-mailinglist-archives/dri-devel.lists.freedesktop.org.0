Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9864C30D3F
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 12:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B444010E5DF;
	Tue,  4 Nov 2025 11:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="n9aWKV+D";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="oyPDASAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2116410E5CD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 11:52:36 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A4BEatq493276; Tue, 4 Nov 2025 11:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=h6RPmaltbG+Cojno0IZljEh1S
 cp7bbuMhLAhBJF2RlE=; b=n9aWKV+DyFtoFxracx9IDCZuNFrASyUHvnKUwedXi
 ZHNFnerGlcesAf89clngvDRu/+1Jz5tOoljkAVYELD6/MguHPNN+vFRmWf7mOYrF
 C63D/UNaG3XwcDCfL4mmpLI+Ivi8/frhzY/bB3cpKaXx3tLFCsAQhwS2rWJD1sdO
 wy5h5FXEMkBzISxqq8qiOdjp/Qx4r215MjlgRzVkKRM3UJK5c9onJBTX+FYVswYA
 ah/W12XmusotGmunK3x90UDNZfDlAC7zLe8yIpxYjdEiv5Ej92xKo2HJjNu8o6k5
 zGUPxGYCYwICgaIPN3/CaMRfiPO2g35jU4XHzuvrKuzig==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020081.outbound.protection.outlook.com [52.101.195.81])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4a5b5wa8h7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 04 Nov 2025 11:52:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tn1BP5nlesv+W/1afsS1PxPBRDikC6toB+iUzDpvKH1kdYvduWqf0A3yYO96NFCDmDsOZ+E9ASb0R1Z4uCt/XsQJvJEKMB90EKEXtNJxPhqvGsy9kXULjMWvAtJ1fvLjKx1CYu2MiOzI1wlyi5tpN31CuJzi6Uk1HUaQ3lTKsLpMg2a7zTlzBAF5Eoa+MkN4RPjRVghN1BKLu2LVq3UMws76f38b/OHxFZjZttLhJMEN1kxt8d71ynOim5czlqAfd5a7uerpfOydPy3GCNnmR7Iv2h3P5t02Tph24ELwpIV4ze9uk/caSQtD6BYy4yF/olxQb6fmRWNr8GyZTVsCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6RPmaltbG+Cojno0IZljEh1Scp7bbuMhLAhBJF2RlE=;
 b=ISLvdUMnkGISOt6wd0Zqb0CwJV3gR4yDYDXJHOowcH0jAQL4MeMz/WZxBljQEF8Opb/2smMykiu2EUhgJfjztj6LGoHgZ2u/foFG10DjsTA5mUlGTAe0HILyNIYfkBDPYtVRizNbb4stBEYnj7H7Kr54e6nU65/qsSnraSkUMoGMFaSOSJP8e6jSvdHtomp2p07YnZDCKrvDD2s8Appvj7SNsa4do2Ee7vvB5qXZRN9UKZlxtwYAto8kwrJu9XX7a6MFCK8o2kxSexXLCMV+0nIFpVF08ooh5xPEE1g8SzeWE2d1AvzNkL0BZBoph58UIHTEcc5MRunlEBRG560yLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6RPmaltbG+Cojno0IZljEh1Scp7bbuMhLAhBJF2RlE=;
 b=oyPDASAukD04ILqGsSm0+T/bi/k7YhwXFREmLk/GRLuLUgeDM3X4g75Onk3MG63p7i8vOWkL6NgNzMgzN6wKRkx/Gagwq5q+pLQ+1KWGt1kpi5V9Q3j5usTEYaGkASHX82VbFOLHWwJV9RDm/GcZmfDcnw94s3fp9Ig0J7p1b2k=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB2935.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:c8::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Tue, 4 Nov 2025 11:52:13 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 11:52:13 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund@ragnatech.se>, Rob
 Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
Thread-Topic: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
Thread-Index: AQHcTYF1uLrZ4lHUBkqxng2sohkbHg==
Date: Tue, 4 Nov 2025 11:52:12 +0000
Message-ID: <10e39887-02b2-41bd-9ed1-f54481a3578c@imgtec.com>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB2935:EE_
x-ms-office365-filtering-correlation-id: c23182ab-14bb-4263-e20c-08de1b9897cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?NmU1dUFNYkhjNWgwWElOUC9TUU9PbTE4SE5EWExLRjBwTGhhUERxVmZBNWtT?=
 =?utf-8?B?ZjJKSmsrdXFhNDVOaTNGTHRUd2E4dzdyODJrRkptckhyNStLcXpaOXo3bXF6?=
 =?utf-8?B?bDEzU2pLNW05MlhkSjlNRFM4ZjRLNWdpKytXWnVleGJjdkpvS3BJNThOczhw?=
 =?utf-8?B?SmVUTW9MS1JjMGdLZi9YSzUzSlZpR3pOWWZlaGxUT2VYdXlGV0N2bmxkMmxj?=
 =?utf-8?B?WGxienZ0b2pKc1F6YWF0Mmh4YXpvRE5MbHpYMFhDZXZjRlRZL2Z2REtZMWt2?=
 =?utf-8?B?czJ2NU5scCtjSktYYlA1L2Noa1pKYVk1cnNMRHRHbGF1ZmFkSDRlb0dRLys2?=
 =?utf-8?B?cWlkS2FpdDB2MmxlYUQ2M2pRY1hObGFsMTJLOU9SM09KRG5LQ05ZRXViSWhs?=
 =?utf-8?B?aUVsQWhpczVWbVQyMTgxZ3NwZkRUcmpudnVRTnVoaFl2RjFyOEVNQWFWbVdi?=
 =?utf-8?B?aVNKaGpSNjlzYmVScFRlL2NmU05LRld5ZldTRnNjZmtmd3p4RG5NMlJrT2R2?=
 =?utf-8?B?VEREblVndkZrRnJybWFpRkVnODJhY3dBd0h3US9hSHZaZ3k0MkE3cnBTUlV3?=
 =?utf-8?B?UDZlaDN1TlBGampYTE9hN1FwQXdTWGpiT2xmNU1LYy9vM1BaVzV0NkxzQkgx?=
 =?utf-8?B?WjIzWHZ5bkJFd1E2T290OU5aK29UTjhLT1lSVGF5WVo5aVhBT1Vhc1BaU3J4?=
 =?utf-8?B?Tmxjb3p4SU1XcEdRMHpCeEZpUkdyZDhkTFdwajFMMDhaQmFqWkh6MElUV1E4?=
 =?utf-8?B?NkdyNUl1YnNDaVhwbHRWL2RNVXdqZEM2UVFHQ2tUYk5CWms1VUo5RHExbHBU?=
 =?utf-8?B?TkRRcCtSSmNqUm85aVJXUkcvYXVzTUR1TFp3MzBkVnFmRTJ0Ull3NVRyZXdI?=
 =?utf-8?B?bHJXWCt5VnREdUliS2hNVWxHTi9HVXdqUlFxWVdmQjVEbXgwQXA3cDZtTDV3?=
 =?utf-8?B?Ym5yWmVWelMzT2QrMU8rRSsycDlZWmgwRmx3QU9aQTl0TTlIdlNOOFpVaG0w?=
 =?utf-8?B?U1BHR0dybi9SaG1yOVJPdk5jMm5MOXZQOTZzNTVBYmRUT0R0QWZoYXF3RFhy?=
 =?utf-8?B?d005OFFMUmhWQi84T1RuWUJHbWZjVThJTk9WOEk3K2JMNk1adHZkUUt3QWpm?=
 =?utf-8?B?L1UvK0dxRExUNUQ3b0dCWW9BZVJHWStNeW5WT2Z3ZzBjMTZnMjFCZEhBS0Jr?=
 =?utf-8?B?aU5udmh3Y25ZekF6V2piUHZvOHFQNDE2UlQ2djgwTEl5TkZvMXR4WG0rTDFl?=
 =?utf-8?B?djc5aUp2OWdLSXFYRHVsRm12NXpBV0IvUU9OWHJFakdUcXE2ME9HWkg1V1JK?=
 =?utf-8?B?cUtHek02SkZyWDA2eEpYeHBxR3B4RzF1dFZxbG9oU1F5QVdhR0U1M0dUdmZ2?=
 =?utf-8?B?R3RrWDd4YTZOeG0vY3MydE1ZbjZPaE40YmlIM2cwNDB1cmlra096R0s3RzJQ?=
 =?utf-8?B?MlBuVWt4WGhhWklFUnVOb0FwNnREY0Y5Zks4UnRZSStFa3RLcnUxRHExTzV4?=
 =?utf-8?B?cG16anJscUxDTzQzbjJycUNDMWl3TGd6NDN6UEJjVEd4L09zVzR1dm1yNU43?=
 =?utf-8?B?SWhJeEJOZ1p6dnhEUGE0OWd4ZUhuK1lCTVBDZHBZdTU0V2x3M2ZpSUViZndL?=
 =?utf-8?B?ZXVlK1ZaUURPTWhFTkxQcDh4T0lHNXhXZmxxZVZlaTdreVJkRVdTaFB3Ykds?=
 =?utf-8?B?Q1J2WTE3Y3M5MzRnVVc5TkxWOU1xT1pIM3I2ZVQvWlFVNGV3K08rT2dXdVJi?=
 =?utf-8?B?UGhSWHNXeEwrVFU3b0VyTEpmS0JZSmM1UFBKUkU1TDZUTWlxQlZ2Nnp3clNO?=
 =?utf-8?B?NGpDTUc0YWdEd1lGK1B6M3hVUDdaQ1NNelpHdFBBb0g2SjlUcUVNVW9IM3Vw?=
 =?utf-8?B?Tlo2NTZlVzJpd3dhMWZHRkFBYjNhTm1kUGV2OHRtcFk4UWVrU3Z5cTNZbTNQ?=
 =?utf-8?B?MjBKYVpMSWRVdGQ1Y0RKbjQyQkY3NG8xUld1V2xqZ1lLd2ZJN0ErSDZLTnRP?=
 =?utf-8?B?THFJcnJPWU9kVTJhTTk3N2xWOHRrVHJheDlSV1RWZllONDlnR0lKQ2ROVnRq?=
 =?utf-8?Q?2C6p6x?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(4053099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkJPRUlzOW5Db3pzTGZUT2FudzBsRW4yNUozQjY1RGYzNjUvUWdQMS82aU5N?=
 =?utf-8?B?d2k5MkZhY05iZyt1QkpJUlErRFNhU3F0OE5KeGliajJxUTNUbjF2MFFVNVFm?=
 =?utf-8?B?MXgrNTJVeHA4S3g4Mks3b2JCT1JsS3pOK0VnNGpvbkNaMmtTejQrenkxUEJa?=
 =?utf-8?B?ZUFTWTV2TlBOdEt1ZVcvcXY0WGUwSUI3ZkxJMTFoSmtuWGliOXdnTzhGYjM1?=
 =?utf-8?B?VnpQZmhFa09ReGRndlBzWmtkb2hiMnBwRWl6a1M5MTBOeG0wY3FWM1JMWFlJ?=
 =?utf-8?B?cmh6b1VMcW11SURGNnYzbXN3dmFWK1FrY3VXUDBKeUJnNVlCbXFxRHMyc1A4?=
 =?utf-8?B?ZEpucFZlY055ekEybzZQWG1LbHRmT0J2UnlQaldGaVp1M2RxMHJERW1Zckpt?=
 =?utf-8?B?NXdxSEFYZVV4VnJ6dWxCeWZPMHM5WSt6VW9MaDhkQktaZzcwd1o3SlI1ZGxx?=
 =?utf-8?B?R0tpdlFOMnliYmlpWS9MQmtHTmRVK1RLRlJWYzZHYklXZE84aG9rdm1GWTM5?=
 =?utf-8?B?MkdGSGNPVFBFWDQ1eUZTRHFIMDJyK2RSOFRFaEQvTm5RT2UyV2dUVmdvSDZY?=
 =?utf-8?B?QUtybER5VlExWmNBTlJyOWlzellaaUlYNjJTTWs1SVBlSGdDOHR6R04xUmNG?=
 =?utf-8?B?T2F3NnNqdlNSVElIcDV6b1EwbHBMTndQaURwTHZrSm5iTjdSSUhhZHBxMHlq?=
 =?utf-8?B?enZHL1NrWk8xMGdRbGw5Ky9Sb2p1cjVjUUZhSkUwMjA2ZTd5ZkY4YzFoWmpk?=
 =?utf-8?B?WnU3TjFSZVo5RUtRd1dmV2s1TTNENkFVYzI2KzliVC95bzlaYWp6TTRJWUpR?=
 =?utf-8?B?R1RMM09GaHRtSmF2UGgrT1VzZGVzT0w5YkJsTk4xU1d5QkpRYWhYS1Y3WnFi?=
 =?utf-8?B?OTFtbkhMRE94bUxMUEZxQzROb05QSzE5VW12YVFDb0ZhYlFNUFFQK0tGdVdL?=
 =?utf-8?B?RHNsbkszT2J4aWZmSFIwYW1oY2NDRnptUWlZWXZDRkhiNkxIMWx5N3Fqdldr?=
 =?utf-8?B?TnVCQ0plZWJHQWNaK0lkNDBSOHlqYW1OU3NVclVrdXRzNzVzdi8yMkhPWjNq?=
 =?utf-8?B?YXRPT1JhNkE1MXcyemZWZlhjRS9BTEN6cERtaTVCOG5OZkdkMGRxUEp3VDVq?=
 =?utf-8?B?Mm1Md1NxenBqYU1DSUVZeGVoSmxnS2d3Z1N3U2s1UGRXTzFsVEE2R1hvbVBM?=
 =?utf-8?B?NkY2d3hyQmRBQzhLQy95Ymw2NVU3VW45S3daYW9GcElTaDFhZWRjVng4MSto?=
 =?utf-8?B?YXRVMXRrL1hQQll4NmdvM1FHWnhxZjRudGdRYW55NzRqM3p2TS9wMVU2cThz?=
 =?utf-8?B?ZE9Yc1VITnNqRnNLaUZUOHk4djdNdmVNblR0cXRjTW12SVpoSU9ubkh4VXpx?=
 =?utf-8?B?enJvbUJHTzBXY094blBRZWs3c0ZtMC84RVVZTHI4YzZzd0Y3WTJNL3RjTkVN?=
 =?utf-8?B?aGJsZUswdytJZW5KVm1nL3VwQlZnY1BOTXlCbWZCdEFwUVBGbmFoVnNRYUFy?=
 =?utf-8?B?STlqOE1Gakdzako1d0tQV3BCNWQ3MnI2b2VGZk9XOFo4cjdKRElxZGtvZzNo?=
 =?utf-8?B?U1lZdm5RdWNJRWRkcDg3UllodmM2bEw2dUVNZlU2WVhyWm1tMkFlWmZLU3BR?=
 =?utf-8?B?elhxa1lKUllYNHBtdVJrUEFpM2t6VFc0MHc3c2oyV0JNRWI5Rk5nd3RkakZW?=
 =?utf-8?B?RTRBcDJoakF2ZGtTdXArTVR4QzlGRkZrNWJweHV6VU8xK0tFRXdxNm5Ed0F4?=
 =?utf-8?B?VE5SUXBTOVVXNGk5UFRJV21Zcld5SGFncDY4UGFhd2htWm9oWit4aTYveldK?=
 =?utf-8?B?QzFncFNvclNIZ1ZadkRsVHRTcWJVZEVQS0Q1cm1FWTF5U3lqWjBKaC9DdW85?=
 =?utf-8?B?Wm45VUlXY3hZTzBFaE0yUkJ1emx0NXRDS1lCS1dhTFBlS3VmWjVWdjllVFFr?=
 =?utf-8?B?NVVwSDNXMmhpQTZkZXpyRHlQaFEybERnOVdEUCtKUjZIV1VqQ2J6aXZxcDBY?=
 =?utf-8?B?emN3UDM2MzJXY09SYkVac3duMG8vdEhTd0JwMVJrT24yT3ZUdTVqOTBkWk1Y?=
 =?utf-8?B?bW1XZDdnYjRpd1hFdXk5RDRTWHRtNytSL3d2VzlIS1ltU1lhcUZybnhwQVVy?=
 =?utf-8?B?dVBlMncxZWZDVDRLdkFZY2swdGZObkQrb1FxcHBya0hmdVB1Y3c5RVh5bUFl?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yGyXemGam70MJT0UahnujmhG"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c23182ab-14bb-4263-e20c-08de1b9897cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 11:52:12.8777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8vO/xIo3/HyBQb0wf9PzyXw7FUlsVnmL3txyHrG3bb+mQGHt5HQl3kc7tiHA+ZxsMAbdCHNn57JGWlGBK9P0xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2935
X-Authority-Analysis: v=2.4 cv=KrdAGGWN c=1 sm=1 tr=0 ts=6909e8f1 cx=c_pps
 a=1kUAmOluxU3IXyiQxloNzA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=AXnwN0U5XS7-B01MjRMA:9 a=QEXdDO2ut3YA:10 a=g7dyDe4kdxXR9aPJ7H0A:9
 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: s7EWEkEkpCcnnEdrhaXZ2_B8uA3OqGu7
X-Proofpoint-ORIG-GUID: s7EWEkEkpCcnnEdrhaXZ2_B8uA3OqGu7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA5OCBTYWx0ZWRfX8DaMFnNwgXLX
 FaBam0yF06TkbAP++RbBEbVm7qoY9pj0OlD+dcpo3ZHQwedGXWB47dCulykkVWpM4Mw8h0HKkxc
 X/DNEIL1J2VEDgeZ9A4EU8+ObNUeVkGB7K9dHgWRSWBHIJscrKrRVjFurO0R/qbGovCP0KBCxm1
 QWiGYF8uEnzGIft+mi6Kz1/JNRR8a3I6Rw87buobJnd2SFN6KPvpAgo1LUmuLFGBXQlR3e/IVcF
 M7DbPFHXW0u/Caf78+kHsN1ECAJCiOk1aqNm7j0pqmIZv3fJwKTPZOqByVRoA53ddqA0E5WFgCf
 edzbvmdJuNA94BqPRjnT8ZynSDt3+Pu6dmI71MxHO9tUGOJTuAyX9IO89o/nAuEqpgCF+n4pnjV
 8H9jJoCt2Fch53kuvoBKq5ou3/D7Nw==
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

--------------yGyXemGam70MJT0UahnujmhG
Content-Type: multipart/mixed; boundary="------------7ga7W7cDyx6Y9wDQ0jgLUWH6";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-ID: <10e39887-02b2-41bd-9ed1-f54481a3578c@imgtec.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>

--------------7ga7W7cDyx6Y9wDQ0jgLUWH6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On 03/11/2025 20:07, Marek Vasut wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: "Niklas S=C3=B6derlund" <niklas.soderlund@ragnatech.se>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++=

>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index a7ca6d3fdf10..c03efbedc397 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -19,6 +19,10 @@ properties:
>                - renesas,r8a77961-gpu
>            - const: img,img-gx6250
>            - const: img,img-rogue
> +      - items:
> +          - const: renesas,r8a77965-gpu
> +          - const: img,img-ge7800
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,am62-gpu
> @@ -105,6 +109,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - img,img-ge7800
>                - img,img-gx6250

Can you put these in the same order they're declared above? The way I
read it, the order is img,xxx in generational order followed by
soc-specific entries in alphabetical order (which is why we have
img,img-gx6250 before img,img-bxs-4-64 below).

>                - thead,th1520-gpu
>      then:
> @@ -134,6 +139,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - img,img-ge7800
>                - img,img-gx6250

Same again, otherwise lgtm.

Cheers,
Matt

>                - img,img-bxs-4-64
>      then:

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------7ga7W7cDyx6Y9wDQ0jgLUWH6--

--------------yGyXemGam70MJT0UahnujmhG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQno6wUDAAAAAAAKCRB5vBnz2d5qsFez
AQDIIntnGSMRWVh5L27XjJmlVtkqunttbGaNty9WilAVrgD/Su7vQfZixc1WOycj8pjeXQghyT0X
+6nC2nu+1B0PTwg=
=0Srr
-----END PGP SIGNATURE-----

--------------yGyXemGam70MJT0UahnujmhG--
