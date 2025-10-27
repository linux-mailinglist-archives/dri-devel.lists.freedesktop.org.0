Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABDFC0E41F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A2F10E4B4;
	Mon, 27 Oct 2025 14:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ZisVI/di";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="ZGCaIS/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F5310E4B4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:08:54 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R5AmQr3902300; Mon, 27 Oct 2025 14:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=1zG6+FqTZPkwJ9AMucMI9Mg4s
 QycaJVOnf4lWhSZaqI=; b=ZisVI/dim7d4iV1R/42X2lFkBhDgXbwWDfTStN0u6
 GzDtsId+VHFrt0oP4YBAtQob/Qq0cswQO0ij2vkZcwc4zejEhWWQxsNbJjnmIhAU
 tRXBQ66rLR1byQmA1F1TOIX5VjZSdvTvh4NYv04M4IzTPWq4xIWJ6/G1JSemO/rk
 VIi5ImTHycruhCUpEM+Vx//EzKtjWnXKmmpyuSTuiHLOvRs/GJT1/lVDVcPMWLVe
 C1yJRn4y+kruvpooq0Iviqpueij5NNG8wR2uzJUFm0IdmXIXcUhYuwxH1u5axFcG
 BXK2cH/cbfz4e+E7C0c/AiE7pkCbEg3DMwhy2Vie7x4oA==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021082.outbound.protection.outlook.com [52.101.95.82])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4a0mtn9ddh-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 14:08:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrIQzs+m3bMB6VJmnUEL/Vqe+LE7nMrIgfosLwr82fHEcCWVQEd79OzR1Ii0zsvB9aRRswh28xormgBmt5z/7BUtkRsC4zpHMma1Y/PBEZJs3IMBkxcX/YzwaWmwCDePCKBMBzi3Q86v4JZqpvlSw86msX0pxnWzfdCvQsE8IlM+jNY+tYvyre49kIS1fy8XDIUJxM8xKPmsErSZ4tiLzXuQbWc1OxPFUgyGGIbIhgtkM/EsE4qXvh8+avwkY4fQh3F4B19Hw0+/D1MIg60ajiWnJ3rE0Gbh1vntLnk8PC8dT6+CWqVOYjYJmQ0P426czvi0ALzQCS4kAJlgJqNTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zG6+FqTZPkwJ9AMucMI9Mg4sQycaJVOnf4lWhSZaqI=;
 b=Dl5ikwyX7o7j3TLFSBVSx32GaDMWWC6yAwCv8pdX5A5UJTX9TaM8ipDlawNq/y/DQ5OPUmpoWN1S8PDBLOCh8YQwc7dIVN5hpomzPjJ/5KMQUSKnVVF0VvasZyqIlAkdQWXg3qjwuOFXtR7+Q102frtqch3e2u0ZmCClfpNhx1eRSrvNkWoaEb+Uj13nShH/n7tMZCs2rtiDpq5cDvNoJz2ISi8fGK40SshKyhgGnqfAqElEolngQyriNbNX1gqjKBidTKqNNMzJI04rg0Vzozu/r2E364QQ5DP6c2O5vFasT4LfeFyC1wxOhW5NwxnFUaDtCIbKvD+X4uEjtIOTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zG6+FqTZPkwJ9AMucMI9Mg4sQycaJVOnf4lWhSZaqI=;
 b=ZGCaIS/1JzMFsrRGoyMVgysy+sjxTFh2Qnl/JkK0PXAIkOTIxuA7afBJMB+Lz28IVl9HerGX4mM61CdE7zdmeHAUdz957/XuF8e/gNqZJx/sFvaJmjxkNXhhEbPIA0C5ldtqU0nDHl4gf19fmHelhCJbJVzYcgIpWxgwGbFRfyw=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB2454.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:9c::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.19; Mon, 27 Oct 2025 14:08:36 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 14:08:36 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Frank
 Binns <Frank.Binns@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
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
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
Thread-Topic: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
Thread-Index: AQHcR0svGFD7V5ed2EWi4PgS5lmdWw==
Date: Mon, 27 Oct 2025 14:08:35 +0000
Message-ID: <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB2454:EE_
x-ms-office365-filtering-correlation-id: d3a5a595-f967-438d-66c0-08de156251f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?aksyWmorcE1GQi9qbVZKY1lkQk4rTUltb3Y5bjM1Vng3TlYzVG9ibjIwZDFt?=
 =?utf-8?B?dFM3MU0zR0VXK3J0N002dnZvOW1Bb2YxK0orTzJtQ2U4YThKQzNRTU55U2Rn?=
 =?utf-8?B?aVhMb0Z2N21aSXlPTU9lU25PaHQ4Z3E5UEFTNWQ2VEdIWFhLTnFCRDdHaVVh?=
 =?utf-8?B?TzR5aElySVk2eitFK2dRbEJJV1Jvd2lpZHd0SkpKdWNNZjRoZ2ExY3RPbHIr?=
 =?utf-8?B?OHVLeGR4Q2c0bjduMzc3amVwV1BTSUJKZWxsaWhCNTZMdUJNS0RuT1k1L1lL?=
 =?utf-8?B?R1JTZ3dMWVMxNTlCaHJQY1BiUk0vc2lBVjJyblVjVzB3Nm4raUV5dldpWlhr?=
 =?utf-8?B?WXk5Smx1dDVOb1IwYW5HUm0vVU4xVldCOEpDVFpYY0hGYy8rUzdZUzh4bnRl?=
 =?utf-8?B?R3g1RGRtcjB4UkNob09CZ05CclgxenlSUXEvTFNmNFAvaHlwM0MwMzZQODRQ?=
 =?utf-8?B?Znk3WWVld2k4SHpXdEs0R28rQjEwQzk4MjlVTUQ3UWVzMVNsdC8xUHJJMVlS?=
 =?utf-8?B?cFl2UDFuS21TcXdDdGpaclNYY1A2ZXJmdFJIMXhHU0l2S3dnbXdpb0l0RHhR?=
 =?utf-8?B?YUxFbU5ZbnJZSlVYT0N1Zy9wS2pCcHNBOHBTUEl0RU1nVEZ6aU5hNk5ZS0Zo?=
 =?utf-8?B?alVDNEtEeXNYYjlVOWx5enRRSHNpY3pQQUV2Zi9GdVlkSXQ0R3hCQU9Ta3hX?=
 =?utf-8?B?SzRpcXJ4WjNERk1CdERqZzBnR1VtR1VMb2h0S09pWlczNFU1QmlLdjB3Ritl?=
 =?utf-8?B?M3RHUFpheU1XYUJQSlF4aGh4dmFuVVFkNVVyODc1S3JydmJORFM4QkdZVmpD?=
 =?utf-8?B?RUVmSzd4cHRSWFkrZUlTaXl4aWNlNHlaVXFNV0k3NHNTalFzMXNVbDFTVTQ1?=
 =?utf-8?B?WGVNS0Q0d0lKNnpRSmp3Zml2bTJ5clltZkRrNGNXQjZ3RUVaYWFiK0ZHTHhS?=
 =?utf-8?B?bk94RENXeHJHeFo3YVVENVlqTnBsRHFtL2R5YkU5YzRSTkNXU0c3TXdGajdz?=
 =?utf-8?B?NVpUdzRYWFphSURoSExzdi9jL3NIVXJqTC9HVDNFQ2d2ejVoRURJb3RoUExh?=
 =?utf-8?B?VGpEQ2l3eHlvQTNWeVFZYnczZ0FGSXNVckRCVWFLM3MwbDd1eFFmQUxyN2hE?=
 =?utf-8?B?ZkVBS0hLajJGRmJVbU90VUNyRmVqLzI0VkVadzBNTTYxSGUzT2xpbjhrNjB0?=
 =?utf-8?B?UGF4YnlZai80RGpXZWd5UnV4ZkN1WGlacStNdm1CZmcwWVU2RmN5U2FTanpk?=
 =?utf-8?B?RENzV29VaTRiZVozMVppclVZS0t0WUJaaXhTWXlmRGpmYy91cG5oV0NWd0VQ?=
 =?utf-8?B?eWtPeERVT1JCZm85RlptQmdNSW83eU5IUmMyOWF4Z0tmVEo0b2JVdkxYalBm?=
 =?utf-8?B?R0NhZHRIWGVSeUJjemppbGlHeVBBSGlhc05UU28vNmZCV1JuQzhUZkN3M2Fs?=
 =?utf-8?B?cC9JRWcvMVpLcEhFZFRZL2xxc2dRbkdaTWczWU5WcTVwU3R3OEEwT2VyR2ZJ?=
 =?utf-8?B?bmhKN2dpQ0IzclcrUlZtZk5iTmtsbXo4QjlpWXlLNkFRSndRLzY4cE55Mkxy?=
 =?utf-8?B?Y2UvSHpvTlJYT0FpTU04czhNR3dhdnBtelNZeSsxRzhNUWt5dDB0d3YrTWhR?=
 =?utf-8?B?QnVlYnBGaDYxVENOck85TUY0OWxvNE5NamYxRCtuWU9nOEhTWU9DZTI4Y3Zs?=
 =?utf-8?B?VFdHVkFpalhSZThGS0ZIU0VZdG9HUFkxV1Z5Unl1UHpJRVRRZXJnVXc3dWJ1?=
 =?utf-8?B?TnJDRkFHV1YvYmNKcUIvSjI4clpEVE1FUDNxUW1lWHBWK1ptNzJrdWhyRzY4?=
 =?utf-8?B?a25qcjNkTW5OVWF6TE4wNC9ycmw1THppUmdyenp3SXg4aFpSUFpZUVhlR21Y?=
 =?utf-8?B?cmVSektJOXJIcmRlR3Y3YldyYjF5d2ZBMmZ1RDFCMWp2Z1hZRXRicnB1d1Y0?=
 =?utf-8?B?YUFETmpQWDdPRjFWdHJodTVXRndIVXpYaVF1Z2pkTEQ5VE5iTjlFWS9GWk9M?=
 =?utf-8?B?ajNWLytCRzF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3AwTFRHQlBPY01tVGxKZlRqVHJ1dWF2ajdscTM0TU00c1Y5NlUxVk9mUzB4?=
 =?utf-8?B?YkpPT0ZNNzZxMW54dENsa3Faajgwd3NBQnBvMVk5NWxtVUROMFlOSHdEM1VT?=
 =?utf-8?B?MWZDeGhuWU0veUZKeG1nd2pSeEFhVGZ2V3BDeEFxZEhxTnZ0aWFCL0lqUGtj?=
 =?utf-8?B?M21jVEVJRDl0RUdQVkN5UitPejNlbkhBSDVoZnh0SW9pa1BxVW9nRUlpUTJ3?=
 =?utf-8?B?WisyL012MXpxRUJ1a213ZHZjb2RXUnZLcHMvYVp3S05pN0RTdk1mZzVtM3VX?=
 =?utf-8?B?NkNHY29rKzVXOFFiS0U3T2o1KzhTYkV1eExrQ3ljNWxwOFg3TjBjR3NPbWpM?=
 =?utf-8?B?UjVpT05kME8yOUx0YmRJYStVZXVnNjA4K0N2c0Fzcnd6ajJsVlViZWFVQjF5?=
 =?utf-8?B?Rit4NHdlRjc4VmtVeWlNdlJMa1R6bEtFWmJQV054Sk1EcUFZRHlVd3p2K2la?=
 =?utf-8?B?Q0QvUnFnNEJNbkJwbjhKMVUrZUlpeU5VVGJNZ2xzaDNva3VOTERCdTdrWXow?=
 =?utf-8?B?Y3pSVGNScU4zbXVRR05HZ0k0Y2pPOHZJR3VMUTYzaitVL2ZpVFNYdW40WS8y?=
 =?utf-8?B?cXFsSVVHZ2d2RS9BZU5kM1ZlcldiM3cwd3NacFBMbkRRL0ZncC82QnkzMmxZ?=
 =?utf-8?B?QmxUUEl0UDRsVlZWeGlsR2xTd3dOU3FGQmdhVS9kRXQ2ekc5NTRWMkwyNXFX?=
 =?utf-8?B?SUluL0F0UjVKTWh4WlZnT29jVTBpdTRUQllOVTZWTzVNU2Qrb1YzQ1F2czFB?=
 =?utf-8?B?ZHd3VHBTdGJ4azNWZHJVRWM0WFZOMEoweDhURzN5RFJYVXFXekF5SmY3K0Iv?=
 =?utf-8?B?QjhXMlJmdDJUL1NTZ0V1RjczQnNkWU5IclNGc3prUmpwZnB6dnVzcHc3WFFz?=
 =?utf-8?B?Zkw5d3VmUGpmb2NWWnBydi8vZ3J2M3c5U2kzQnplVXo2dWVCQkdtNWlZQ0RN?=
 =?utf-8?B?aUlRK3FBQU1TWHZLSVJTUmxUM1YwVkNCNFlOMTVKKzdDbXMzYjdxWkFVVWZ1?=
 =?utf-8?B?TnVYa3c5NVlDaDZJVmpualdXdUpBc0YzbnFoS2huOHN1WDROdkZpNlpRTk80?=
 =?utf-8?B?aDNyeXlEM3VqZnFDaTBOWmxpQjM4OWQ1ZE9neWNJSzVnWFN4R0Y5bXE5NWJt?=
 =?utf-8?B?NzNjR1Y0WFAwMUYrZlFlaUF5VHVqdVJCZzNmT2hEUStlMW0xejFJUjd0Wm5I?=
 =?utf-8?B?SWNvakQwOXlIdGVGRFZUZ1NBK05nNFM4VlpHZVJVVmJTWXovQU5GWm9WdFJZ?=
 =?utf-8?B?OXRMVksxWkFyemFxSWZvYTB0RmlCd1FtNkRhUk5QZUQxNlZpR0M4aGd4WEhU?=
 =?utf-8?B?c1k0cXFRMFE5ZmtYaFYzOGVHTGtpczIzMHZyYVI4clhXZUtVNG9yNG1qWk5z?=
 =?utf-8?B?bmhOQ0VKTTAzRVR2M01DaVpUNll6RjBIdTBNZktmdThMTkNyK28wT0FBdGZ5?=
 =?utf-8?B?MWZSVUdPLzlGaFFmd3c5b1ZrUDlGTzc3ZEc3a3BvVzdpaEpwYlNIbzYya0lW?=
 =?utf-8?B?b01DTXJONlRvSFlGNVlhN0FzYS9PUEVTY0RWeXFnN0RsdXl3M3hZbkZtK3o5?=
 =?utf-8?B?aDQ3UGswMlVxZis3K3cvUXZSNE1DMkNMeE5qdFVRTzBUR3Z2aU5uY0Y1US92?=
 =?utf-8?B?SHFSMW1SMlVlREhVZmRVRmYxUWMwY1V0eGZmY01hcmtORlRHWWs2WjZ4cWZ2?=
 =?utf-8?B?Vi9KbE1QOXY3ZHZaZ1FQN2pqVnJ5aWJiU0hWR2pJRytzNTVIcHBUU1lwZDho?=
 =?utf-8?B?YkFWRHdibFZVckFtYXVqcWFLSGt5MWRBVjU0K0VrYmdTelR0cHN2bkFydnFL?=
 =?utf-8?B?aGErRDNQa1p0bUg4eGNmN2Q3TWNWcFZGWTVQV2NjY2J1Y0xIa0hkVWwrazcz?=
 =?utf-8?B?TjhOUW0yaVI5b0MrZTIySTlEY3I2S2xwaFE4OExoTElyNkVCdXhtcnhwTllO?=
 =?utf-8?B?czNsYjQ5aDZZTFR4UElDeEZnNVNwRU5NSGcxWkZzMVhtU0hSZThuUlYyTjN4?=
 =?utf-8?B?Y3d3Z1c4TTM4cnVXNDlFV1NlWFVxbXk5YUdZazBQeVVRTDlzNFlnMlhxY1lE?=
 =?utf-8?B?bG9hSjhxY2tOTVgvVkoxSWI1dktPVUpmejhoQW5vVTUwZ2NCV0k2WDZHT0x6?=
 =?utf-8?B?Y2lWQjFIOXBncHBsaDF2bVQrNmVoT2s5RHAzYnV0dGVFVTN1aXpqTytRSmM5?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HuS1szWq7ESCpKsq0AS0CVnd"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a5a595-f967-438d-66c0-08de156251f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 14:08:35.8857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XHbMUgaEsi8hAqDtuGfuP2BzmwyI20c/zcq2mNyxvxlJ8vKoFAzxJmNpSkSy90cmY73vPTufhc9wYVNqgkk9vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2454
X-Proofpoint-ORIG-GUID: 7s7Cb8plR8Kp78NBI59G1vElrh1QMaJm
X-Proofpoint-GUID: 7s7Cb8plR8Kp78NBI59G1vElrh1QMaJm
X-Authority-Analysis: v=2.4 cv=K8wv3iWI c=1 sm=1 tr=0 ts=68ff7ce7 cx=c_pps
 a=99EZdLM4+80yYTqod50AzA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=XYAwZIGsAAAA:8 a=b3CbU_ItAAAA:8 a=r_1tXGB3AAAA:8
 a=pGLkceISAAAA:8 a=yC-0_ovQAAAA:8 a=2LT2JS8uAdL3bfzyeL4A:9 a=QEXdDO2ut3YA:10
 a=XPJjqHTy6a0eJWBDa4oA:9 a=FfaGCDsud1wA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEzMSBTYWx0ZWRfXxuk9z1xjqCU7
 jHQIKo4H0//e3Iuim/7FovaZjNzpA5sCUDKOBsohwmeP+nZZwoJ+HxWII2kgf+V3Y0Ip/zsGV0B
 9EIgikztPDi62IiA3kfJ25WKIV8oo9WdknFspv5T6FnrN2kzG6SNgtokAwgAcWsAeCT5Gri8R8Y
 hFKxabbVSxPAuCawkwkm5fWnObo/s4wboELGaFmwquCZAULdpi6OGMNVEtvtEjq0PaYI4TzeduR
 FbhUc2Y9RJZb+1CHJZ3ikvz2VISHWkU8MWEAqh59j+TgF5c9hcEbHRAivKm+qNU6Y+rSeHls5XB
 MbISbnd1XFMjGNIGE1NNXgJnQkUfwrAacNUY5jW7EXh02fDJ6QOO9UqhME2dUT1fYQ02oO6zHAA
 bz6pALUEg9GIv6fP+6ssn1cmo5gRHg==
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

--------------HuS1szWq7ESCpKsq0AS0CVnd
Content-Type: multipart/mixed; boundary="------------qrveyIouWdw0gFUO5k9ZtqgQ";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Adam Ford
 <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
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
Message-ID: <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>

--------------qrveyIouWdw0gFUO5k9ZtqgQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Apologies for the delayed response, I was on holiday for the rest of
last week =E2=80=93 I'll apply this to drm-misc-next now.

On 22/10/2025 04:37, Marek Vasut wrote:
> Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

And just to keep the test bot happy:

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510242309.6p5FyVLQ-lkp@i=
ntel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202510250550.66T4zLPd-lkp@i=
ntel.com/

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
> See https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/=
13
> for related userspace bits.
> ---
> V2: - Add RB from Conor
>     - Fill in allOf section for Renesas GPU, set fixed clock/clock-name=
s
>       maxItems count to 3 and power-domains/power-domain-names count to=
 2.
>     - Use renesas,r8a7796-gpu for R8A77960 compatible string
> V3: Split up the allOf section addition
> ---
>  .../bindings/gpu/img,powervr-rogue.yaml           | 15 +++++++++++++--=

>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 829febd8e0f40..aa8b2069cc24b 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -13,6 +13,12 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r8a7796-gpu
> +              - renesas,r8a77961-gpu
> +          - const: img,img-gx6250
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,am62-gpu
> @@ -94,11 +100,14 @@ allOf:
>          clocks:
>            maxItems: 1
> =20
> +
>    - if:
>        properties:
>          compatible:
>            contains:
> -            const: thead,th1520-gpu
> +            enum:
> +              - img,img-gx6250
> +              - thead,th1520-gpu
>      then:
>        properties:
>          clocks:
> @@ -125,7 +134,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: img,img-bxs-4-64
> +            enum:
> +              - img,img-gx6250
> +              - img,img-bxs-4-64
>      then:
>        properties:
>          power-domains:

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------qrveyIouWdw0gFUO5k9ZtqgQ--

--------------HuS1szWq7ESCpKsq0AS0CVnd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaP984wUDAAAAAAAKCRB5vBnz2d5qsEME
AQD9nWGwHqSJYCszF5WFLc8N/iL4EgaJUg8LrVWrDvPt1wD+JNFCwebABTLksPfBiqbKVjhYZr+0
zn8JpTcyxigc5wA=
=TcKV
-----END PGP SIGNATURE-----

--------------HuS1szWq7ESCpKsq0AS0CVnd--
