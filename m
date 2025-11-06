Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4CCC3A327
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 11:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E2310E882;
	Thu,  6 Nov 2025 10:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="A1zyXzpm";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="MeXO3ckG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B8010E882
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 10:22:28 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A66w7ET879402; Thu, 6 Nov 2025 10:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=BGUiC90tYjb0pgV4TTkm2OB0U
 IRL9St0y2cDH7YNfTk=; b=A1zyXzpmohgkaFuzzdN8h4h4sRAO+1Yftz1RahpMo
 2l79/NtUYaIUfWmSyJUgH2VE1TIRwpCvMFaxq6aMdggQA3RIyN/K7Bv7DU8oc2hO
 4CG1a8m1nfFJFOSjHjduHiLbZqqDm1qGpnGo/TluY2WHdqz4unGjePEivnKHMo4z
 P1HKajavmT6e0AZGG+oQSx6M1NBsXEVgrLbBWRaaCfzPymPYjjMyxjq+t8LpKAOs
 U7kTNv3bLEMe1E1xuI3zOceGGQzU/FbNUEIm6rNP1m2x0bbOJ0L+tuf+rAfvRZFz
 Yu2rb3wQL/W45w80V6r3/0IEsdLtfBPb8l72Obpn+n20Q==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021129.outbound.protection.outlook.com [52.101.95.129])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4a7w9cs68k-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 06 Nov 2025 10:22:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZR/Bmc7AUBg98vL2d35dACvSr/XMiVolmwqsx1sZ0DNYl86Ogm4mjsuyqHpijGuWwpd2GMuAq4HMvyLHr7obNTebcawhLEqkmGBADM9VOqcfQcyStr5wpI49AzhdrKb7ioOyd6z5ucXppgVXGKdB+1N9lxKJ8OfMStgTrWGEabL77v3urvSu2TpP9CWjQQEngd+CjRSLmVRcRB0o5Xss8JmfG15KXa+H9KilE5CcTH8nCfjxtwQS0hDVI5VzqPNZYfixqkZKYh/ETe0pUceViUjKcpazBFaePbL7buw5Tfq8rbHgE+ZXVNGwmGUaDWusjJ4Sh/nxXYpdVLoyIFUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGUiC90tYjb0pgV4TTkm2OB0UIRL9St0y2cDH7YNfTk=;
 b=w4bbXsApmZnYF1vLhMccI3tLLgy5h9Bp/2hmKfnmDHLBgvifyIA8JP0UoqiqGil4YC0LvlInv8xWFNBPwHdYgxmPB6SBvNs4JJf08Yn1lgsR8u0Z31+ru38vg/ONn+hJ4fwiCwK+Ykb01vuAQQaeQJWUM4JYA6lD+QytSzNzI8DdymtEwKmClYZICakI6lWuBgtM54i3hKVkOyUAT7MlRrYXpHtNhPlhBRp3t55HG/FTBiKuRaJoqm/S3IfuxPkr+ulov5/Rusmpnv7N4UMRZhYCw0YNDuffc84uWpcbQPDmc1o4yIAWuhjJt39jjR2JOeG+ANsSv/RsOKWrebPzpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGUiC90tYjb0pgV4TTkm2OB0UIRL9St0y2cDH7YNfTk=;
 b=MeXO3ckG3WMCHkHHhZGXQ9AfeZ5h9JEyg+WMumY+8decFIj171WP/BgOqnCPR6amGpTmsBmoS9Mki3SW2QYUdvjOi8QieumQRcrv8q302L+FYKT2GPbQQ0xIyliuLGGZkFAsPjXUwyY0Hk1yBAT7HkUvjSm5AeAFKjlkBi8nfiY=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB6102.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:181::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.12; Thu, 6 Nov 2025 10:22:07 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 10:22:06 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
 <niklas.soderlund+renesas@ragnatech.se>
CC: Marek Vasut <marek.vasut+renesas@mailbox.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, David Airlie
 <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona
 Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE7800
 GPU in Renesas R-Car V3U
Thread-Topic: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE7800
 GPU in Renesas R-Car V3U
Thread-Index: AQHcTwczY2ZxbUV0Y0On44iy3+c57g==
Date: Thu, 6 Nov 2025 10:22:06 +0000
Message-ID: <71d52507-2457-475b-aa75-f2bcad4e3b6d@imgtec.com>
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB6102:EE_
x-ms-office365-filtering-correlation-id: 407313b9-93b7-4fc7-e299-08de1d1e564e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?UTFQNmUxbS9TemJEMElIeTQvSlUxNzAwTU5sY1ViY1Z2eVg4eWpuSHFaYWds?=
 =?utf-8?B?eFVjbmlrRThnMWY1YWZBdkpvNFRPVmhvdm5DR0pMRDAyUUZyWDFDVGFyOWls?=
 =?utf-8?B?TWg4SGE0bFZkZHdnRWpLNlFMcm1veTE1QmtNV05kZGdLaytST04zcmI5Tjhq?=
 =?utf-8?B?a2M0Z09xcnlKZEM5djU5SEp1Q0ZaZHJHSkl1Ym5ZRVpzUGt5bUo5UkRwaWVl?=
 =?utf-8?B?WmM5TVdTM21uTlo4Z200L2pCdmFnQUJpcGhJbXh2UUpMcVRJN2pYcjYxTzVQ?=
 =?utf-8?B?RGVEVUgrV2NwdW9lallNVXJwTGhlRkdoclljZ2ZmV3d1eWIyQndGbW5pYzBn?=
 =?utf-8?B?d3RwQzhndW9XaGZORmVVQlZaQXp0Ti92NVZaaGlIdEhvVFJCOXI4eVhmZjc5?=
 =?utf-8?B?akVSZmZNUW1aSlJyQUhDbUplZEdCRzZYNG5SMWZhYWlpblBaaWsyWVMrRGZF?=
 =?utf-8?B?TmViMWxBVWFZQ01Va3N2V3loQzJEaWwwY0krRWZ1S0grWkNuV3pkMlZmNEVy?=
 =?utf-8?B?Z0FqTFVFeWFXTTNzY2Z3UDNNdml3ZGlER05lY09QM1JodjBSTHo3SFpLdnhM?=
 =?utf-8?B?YS9udjViL3BqMDM4a01ZaTZSay95UWlpcWpPcWlMMWFPWW5HRVNkcllCM3Z3?=
 =?utf-8?B?RkEyN3dLR1NBZFZSZW5IZTdwRHp4b0h6M00vRGY5VDNsK0Nzd3ZTMkxlWGw5?=
 =?utf-8?B?QVFwUnRmZ1hxdUhLblRhTVllYThsd1JOdllsOU8ybksxTHM1TEpKeUVRRkVT?=
 =?utf-8?B?ZTh6T1N3SGlxNGwwaU0ySFFueGorSVF4VlpJMXFISGZzUzNkcVNHcHdqUEhv?=
 =?utf-8?B?NTI3d3BIMkcyeGdlamV3NTBSUUVOcFhJd0xBK2NreUVwMGtnVlNqU1B2NlRB?=
 =?utf-8?B?Z1FydlQ5RzdSTWx5WG9HMU50a0Rua1ZMclFZMGlzYmtDbjdJOFg1MG5KMlZs?=
 =?utf-8?B?OTJxRzlkN1RGa1ovaU13YmdBUDk5TFpFLzdWUklFeENVVDI3QlFiSGNxWjZD?=
 =?utf-8?B?dk5Ya0xaaTBaOHI0cnl2UFdndk5rRlhEVnZXNEdEYmczVHlTbDJVQ0ZBcHZm?=
 =?utf-8?B?Y0dPdzFldjNMN2pKemtrSklGMC9IMUttMUlrR3l6Wng5ZG5ncXlrRkFIOWs0?=
 =?utf-8?B?YXFINVQ1ODUrWElaVlVOTG1xTUo3bitnT1RCWklFRWM3NG43TkRibTdKSlVD?=
 =?utf-8?B?S1J1WDkwZythcFJGYnZMdkpXdzlSM1ZEUzB4Q3RPdy9BVlNxSVlQZXRNMUww?=
 =?utf-8?B?dlJiZnZYREZmTWVtaVU5c1FxdXZtRWFoOTlRTWpiYk5DOHlweFJUVGcwNTQ1?=
 =?utf-8?B?MjNVdzlINkZTZGNad3dzUVprRnpoY1FNNnBQTTRRQTA3MzVhd2dhUVptbnpQ?=
 =?utf-8?B?Ry81QThDNmVWUHhnbHlLdWpYWkNYc05HaVY3bnRnTzF2ZVZ2allnZk5JMll2?=
 =?utf-8?B?QXlmNjhBVG1oaTV1RWlQdHQ2TStBWTVQRXBuTVVpU1lld3UyamdCNVQ5Z0FC?=
 =?utf-8?B?dmF2alNWMkkwU1F0ckVFdUdXM1h0Qit5a0t6WVBvWThXdHovbFhlR21OQ2xo?=
 =?utf-8?B?R0xscWRiOEdiOHRtUXdUbTQ1NFhYVWFrOE5DSlB2TElIcDcxOFdBcnJOLzMy?=
 =?utf-8?B?ZjE1eUp0TmdrWHJydG42ZXAwdFZ1a0FqeUlvNWo2bXBLeTVGa0x3SzNnZFRx?=
 =?utf-8?B?WVl2cXdlL1pOVE9FZmRnZ2QxNXA3Yi9RTGVveDBsWkJ0eHR4dC9XWmZ2Yk42?=
 =?utf-8?B?T21CVXB0OXJpczB4ZWRpQS9NZ3djQWVyM0l4d0NrYjN1eFdveVFLUXFWOGww?=
 =?utf-8?B?VkdGdGw2NGpWMDhpd0dMMXN3MlQ5ZmRIWG9ubEtGRlJyaWNmak9tc0JTdW5O?=
 =?utf-8?B?NlhsV2tvOFRlbnpLSXZOTEFPZjJnVEIxV0dGL29JLzYvWUlxU2JvV25XdE5V?=
 =?utf-8?B?YS9iSnM1Y24zbFNxOUlEdnJ6aHR5UXNualM4dkNPVnF3YUtOSG13Mk5aR0dl?=
 =?utf-8?B?WGpDOXJpUjVITlAxeFpDdllROVJGRE8xVFBPZjBWT3ZjVnhoaVkrZWEyeWJi?=
 =?utf-8?Q?C/OiUI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFoyZ1Z3ZytiRjRsUDlUUmRNU09qa0JsQkQrY2V6QlJkY1lGSllwUzdXZ0Zm?=
 =?utf-8?B?S0JzY1NUUlV5NWV3ZlJJbnIxQjFkc29BcWMwUEcyMW9MUTBWMWk3ODkvK3RF?=
 =?utf-8?B?aFlkc2RRY1hYVzc0SzBzaHViOGZZSGRvYVlzMmhmTWttU1VEbVNKaWJTMU81?=
 =?utf-8?B?dHMxbitxZHE4WUxOV1dXcVBrQ05rSk5mUGwwTlB1NXJDUkY4Qmo0blR0VzB2?=
 =?utf-8?B?Rnp4SXRnT0RDNU12ckw0UzJsOTdCVEd3RmdFQ1g1WE9aUGlqbmNDbkNTWEZv?=
 =?utf-8?B?My8zcFljdlRjbG9jQ1hCc2VrZFMzbkpRV3NVSFlRWDVmVnd6ckloY0o4TlIr?=
 =?utf-8?B?dGhIdHUxbTNKM2toeHpVazZyWTJVOTVFUmlRLzgwZGN3T0dhK3B2aytTUzlO?=
 =?utf-8?B?ZnpIbGd4Y0hSWUlIZXFka3dya2lJck10VmlaY2UxRHJnREFuRUU3RjNPMHk3?=
 =?utf-8?B?ajV3b2hwYllHc0puT2ZzZzRvUEFMcWFuQk1VKzhxSSt0bnNtNWRBYml2QVcx?=
 =?utf-8?B?U0hRRkFoSkpzSE9BTGxTak01WTNIT1N2N3NqdzhuRDk3MVdwcml2eWJ3VFdi?=
 =?utf-8?B?eTBVb1VlQXJPK0ZJaG5OOGJGZWxXQ2VaRzdna1hxTEdualdYWWpRK2c1cDhH?=
 =?utf-8?B?VmZmZlBHeWhQeHQ2Q0JoeXp3K0xJOUp6RlJZVkZqMjlvaC96SStyaVE4MlY1?=
 =?utf-8?B?RU1OakJUb0QxSDd3aHZtSFhIdTd2Z2ozT3pheG1idjNRa1ZpbGxVZmFlRTlE?=
 =?utf-8?B?dWtUTDBpWkk2THFnS0xnV0Q5cDFuYkw1aGhyWU12RkRBYlBmZzVLUld4Y2JO?=
 =?utf-8?B?anROM0RaQ1V2Q3B3L09yWEV4bk56TzgvWjN3VnNxeVYyWDdPbEJ2QS90N0hL?=
 =?utf-8?B?NmV2dDVxNGJBSGtEOGlOcm1OcDBDaTVUYUtpQ0lpK3plcVMxdXBzankra2ky?=
 =?utf-8?B?WGVKNllLeWJEVzFacE5CUUt1dUdJVHVHVjM3NTJEcmhqN1ZVNnY5L1pubFVL?=
 =?utf-8?B?ZjdsanEzVnAyWTBFOW00RnZWOW1ZemRBVWJUZG1hTWN0NTRnVmp0aTNLemcz?=
 =?utf-8?B?Q016OVhoKzRCMjFpcllXaEJzQkJpT0FuRi9tc2t1cWtzTU5rR3VmMS9mSWZy?=
 =?utf-8?B?L1hrYmhCbjFwYWJHK1BuOWV0ZnRjOFIrR2ZxL3M4V0VranBjY00wcXBOc2R5?=
 =?utf-8?B?UnVqaTF1WmRxOVl6OXNXbFFUSmFtb3owcG1qMHNuYUozb0E5MGNyeXlZMWJB?=
 =?utf-8?B?Z2tlV3FQQUtJbHR5a3h4bmYzbE5nano2dVF6cys1ZEQ0SEt0aXRUTllXZmxj?=
 =?utf-8?B?SmhGUFlDT1B0UnJzQjlnUGNmeUE5SnIrRjRVcFJMSmVQN0ZNeVR4T1BxZ0dC?=
 =?utf-8?B?d2tVT0N0V1ZtelFHMHd0RGIzbDFpZGRrU3VVYnRGSEFsdkJIQUNZYkZUKzlk?=
 =?utf-8?B?d0I2QlZTZy9wT2tNbFVxeE5Zc3FkdU41eDEvZk05TWU5UExFR2JQVXBXWHRj?=
 =?utf-8?B?Wm5YQ3kwVTJITmM5SzlabWlEK1F2My8wU0F5bGpiYTZtVFhyblZPT094Mk9m?=
 =?utf-8?B?dUlKVko0c3Y0NFpTa05vdUgwcm83MHR3blVZck8xeFE4Yjh4NlRSSStSTVRC?=
 =?utf-8?B?L2IvTFYxelBEaEQ0dDdwOTYvYVJNbEpGRkFRS2J2M3RqdEFwSnVNMmh5ejN2?=
 =?utf-8?B?T0llWXRPTzFGNGU1TForcGhPQm1QamI1Z3dDZzhJajBUcFF6RkFWVEhmWVNO?=
 =?utf-8?B?bW5TTy9mbklWNkpUUzFVeGpYMUxJcjhhTDdXcGtNQjlySUdhOHNUdDJtK3Jr?=
 =?utf-8?B?dGQ0N3loVXFvRFFCOUlIREpKemlqQjV4VUVGWEFKMkpKTjBPK0NtS2tCRFhC?=
 =?utf-8?B?cTRLY2h1Z2NiZnFodnIxK25aN0QwZnBKTEtsbkZWZSt3UjFtdXlhcWdqV3d5?=
 =?utf-8?B?VFA4am8vQkt5UERrTWpWeDJxZVFheXcwYjZLUEJXT0c4SGRJK3krUGJ3Njdn?=
 =?utf-8?B?OW5lR3Q4Ym1OMVhOcS9BYUpsVDh3UDhNMGtCWEU3ZE9SMGpzUndjQUlYNjA0?=
 =?utf-8?B?aGZ6S080ZGtER1NVNXJDaW5Wb1I0LzdzY283aUI3ZU9PQ2U5S3ZsditlMGd2?=
 =?utf-8?B?Ym1WSitpaGc1U2JQWWJHTG4yTlgvdnJlRnZXeC9xeEcyd0k2dE5BeEFIaGlE?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U5FVuK70FGRR0MqBaTXZklHz"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 407313b9-93b7-4fc7-e299-08de1d1e564e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 10:22:06.6541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ivJNQn+YpwuJmDVD6KdJ57GvUlfOcvUk/kFyBR0wox+AuZa34fYl5BNAFt1zpXVCUrVagL8kYc6HdRcVJArS2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6102
X-Authority-Analysis: v=2.4 cv=bbZmkePB c=1 sm=1 tr=0 ts=690c76d9 cx=c_pps
 a=qFiPBzGsKAGc905BdHJa7w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8
 a=HUduQnBzl4Nmclyb328A:9 a=QEXdDO2ut3YA:10 a=407ZTWy2MjvXsIL74LwA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA4MSBTYWx0ZWRfX0l9zMxKlAkQb
 A3vGxQPDDUvpf2DfA0VYQf1ECUu46AMn4E61+Bi8ZcyjWDZAVKlNsNHLCzUisXj22kEUPRzukN1
 0Kvac/95fErhPRaTZls7GhA1KKtg2+LLgluHcrvwEJjW21D8dxd5z5oYgQhUEqz1OImDlkjoSB+
 /HXSs40kquEEfMbx749EMuV4fdxCrS3B7Yt6u2f52swPNJAFh8EIVc+95b+R3YcxtNII4ofZyNR
 DP1wpIbffvc2scdt2nFHqnOrp0IxyIXtvJXk8PFZizwfIfWzyzAL72GJVoBCFY899q0wAMz1jBi
 qQBxqX1XvgfPXwGA15P9Uk2lDBS/polSZZyUr1zpsQeZBRVqimuG/Cni76qgwDt6PBUSarHd3ci
 8MBT8QJCRGFcZHZCgQ9ofICGnU1vYA==
X-Proofpoint-ORIG-GUID: Zo1cuHExUW_yQQ2lj6-8Y-udJy8knWkG
X-Proofpoint-GUID: Zo1cuHExUW_yQQ2lj6-8Y-udJy8knWkG
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

--------------U5FVuK70FGRR0MqBaTXZklHz
Content-Type: multipart/mixed; boundary="------------Ogohi0oGqW0ld70zJbWaaR7J";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-ID: <71d52507-2457-475b-aa75-f2bcad4e3b6d@imgtec.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car V3U
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>

--------------Ogohi0oGqW0ld70zJbWaaR7J
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On 05/11/2025 23:27, Niklas S=C3=B6derlund wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A779A0 V3U SoC.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>

Thanks for your contribution!

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

I just have a couple comments on the dts half of this series that I'm
sure will be easily resolved, then I'll take this patch via
drm-misc-next.

Cheers,
Matt

> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index c89dbc92325a..142d6b0add85 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -20,7 +20,9 @@ properties:
>            - const: img,img-gx6250
>            - const: img,img-rogue
>        - items:
> -          - const: renesas,r8a77965-gpu
> +          - enum:
> +              - renesas,r8a77965-gpu
> +              - renesas,r8a779a0-gpu
>            - const: img,img-ge7800
>            - const: img,img-rogue
>        - items:

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------Ogohi0oGqW0ld70zJbWaaR7J--

--------------U5FVuK70FGRR0MqBaTXZklHz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQx2zgUDAAAAAAAKCRB5vBnz2d5qsAAs
AQCu4/zqXANDMeL3uMMeOaaY6bzFx5NodRSrTcr2PJZU2wD/QVPG+b+FT4SnecGSnvUZ6O4BLSsp
urehE4jLNgPRjgA=
=n6Y1
-----END PGP SIGNATURE-----

--------------U5FVuK70FGRR0MqBaTXZklHz--
