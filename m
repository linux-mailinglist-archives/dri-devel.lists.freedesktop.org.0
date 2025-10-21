Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F78BF54A5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E66810E59B;
	Tue, 21 Oct 2025 08:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="SkdXKv8s";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="bH4+u9iy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF8D10E596
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:37:58 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59L656BA984637; Tue, 21 Oct 2025 09:37:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=y8V1VhVyH1AfVaLGxXmuVXTIt
 QC3SH3enrWRAPj4BiA=; b=SkdXKv8sQIVxg9Eah+0c52jdPnzgbUu8QaBQmL61A
 onXGyWDpyf60vFmWr56WdqDpDib8/r07j6NdONcGavlnQeRm+pNoAjPInXqqO95e
 U1utLBXp3fI336g6MZ5Lm8gSCtgeposG2LlqbyyOqPAD1QTo3iJpWMpq/+8m/RJn
 BUyxI0NIBuvcU7rcbF2Mb6SYwu2NhNnXRHlRssdRu+EDUQht+mwcNHTNg8fPKt0O
 fJeI8QxA5S7CD9dkhN7uX26V1r3lyM0edoQnPb0vYCiJ0V3f1zmdmV4aXmFIJUob
 na6iKTkxfLN6x4HZCy1bygy83gbu2Tz9fB6n6Ms03w01w==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021119.outbound.protection.outlook.com [52.101.100.119])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 49v15qackf-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 21 Oct 2025 09:37:41 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQqKLoKAmnbSkLHfpQRDlUg7lkGKCTp/DOPrEDKIf1CSN3zTRfJ8w41QgbEjXGPadNKHocp4kv0z1sm8po+IY0z1AlE1N5fpZF/fOENm7WV1er5u2AjMPnOqcRb/FrnUxFEFHZ+LUl+Y9W36eVrvaegQE6dxvZr3yWnWl9mK50z37JNnXDeHDiWRxSSrnoDd3kaivBbPG6TZD1HortiN1t8NvafsCo11dzgPyuf+uAAU6oiuHnbIWlj1e0ckpmkj1x/nFfVDOrqgI+42AG93urmbVCCVBDLbooSP5XdzUCIj2bYgVTeIGA2mXN/XDp0t/5sK3V22YLJHU5zkgG5IvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8V1VhVyH1AfVaLGxXmuVXTItQC3SH3enrWRAPj4BiA=;
 b=y0gOnXhykHt6S88LasVq4ezKwBZf6V/vwY+NNdYaWAkvOqKKoamd6OdTLasYfKVwGNUg58qjjw7z536o9vwuxMz4gyLo1TCFEnJJ/fSMqM4+8FPUgeKZEEkawxG3jNWVpGQkXdn6ZnBhHjnfeDjkw+x5QLuqpn7V68omYtskd1VViQnQR2lfmTwGQ9F9P9KY60vpLXDHAESwU8xahbH+ZfKwFHCx3/14t/jsdTaVzoy3Hm93sqgiMzajP4PRax1cygGSnFzFnacTtJ/1FAG9qpR0rG6VIizARhRfQ1Rixdy9TThDDOZN4DRubCWYhn8zqdKpJ/80/ONuUObIo9bV4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8V1VhVyH1AfVaLGxXmuVXTItQC3SH3enrWRAPj4BiA=;
 b=bH4+u9iy1OAzlQJlXYbh/nhfRl36NUsA+++VbGJXHoYIqJixALg/tT1W3NAFAmeEcEvInCvSRu0+gEBFZM+eWhuVEeoM1SJPVCWQ2ssDvM9ncLT9qH+aPyiA1JuRQTMJP2ElX32D7nBIrB2fTfmTMkp+uCfhM9OPOLRpj4J4o3E=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB5417.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1bd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.17; Tue, 21 Oct 2025 08:37:34 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 08:37:34 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Conor Dooley <conor@kernel.org>, Adam Ford <aford173@gmail.com>, Conor
 Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
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
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Drop useless
 power domains items
Thread-Topic: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Drop useless
 power domains items
Thread-Index: AQHcQdRWkHcuvH0l4USaaIfJK922C7TLSw4AgAD9LIA=
Date: Tue, 21 Oct 2025 08:37:34 +0000
Message-ID: <d3a43b59-b181-4b82-beae-d5ec93491845@imgtec.com>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <855fdfad-1df7-43de-8a86-a938cc56a202@imgtec.com>
 <20251020-freebee-asleep-702062240cbd@spud>
In-Reply-To: <20251020-freebee-asleep-702062240cbd@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB5417:EE_
x-ms-office365-filtering-correlation-id: e1844b18-2146-41af-fdfa-08de107d1501
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?Zm85anZaMmJCNVBrRjVmVVkwRXQxZFBEZVRyNnhzWWtoRy82MDJnTVBKR0Mv?=
 =?utf-8?B?VWFrVlptRCtTZU4zQThJNS9UZ0VZRUtiTmNTN1hOTEdkYVRERkRoTFg2OThu?=
 =?utf-8?B?YmtDSWhjOEdqdTI0c2o3eHRFNTRZZUFNTEZVWmNhL0EzaU0vSFBKOWdvcEpw?=
 =?utf-8?B?eVNTWllnSnlCQXFEUWxQMHZtSUt3UjB2eE1BR0RLdmFweWFrMjNZbnJBU2Yr?=
 =?utf-8?B?S2lMa1J0TjlTdlRaY2N6eTVyU2MxdUJpWHpMaWM1NU1mZjJiWkNZZElOcGhC?=
 =?utf-8?B?Tk1HU082bEdGZG15SnRMZzJ6ODV1bUlFQk81TkcwNkVxc05WYnVYNHBnTTZU?=
 =?utf-8?B?Qk82UHo5dlp5bVJYTEJYdkxKaUYyOXZIbWZEaTZFd2Z1QmxrOHlxTlNHam9G?=
 =?utf-8?B?c0lqWk8zTkdnMGZLSXk4Wk1lUnAyRzNzTEhPUnF3Y1pzTlBwbGloWkQwTVhS?=
 =?utf-8?B?cWVjYnVCV0J5SEl6WkR0WkZzd1dQemRyQjNpMFZGRVNNQUlMYXU2bjZCZXNj?=
 =?utf-8?B?NkxXVGoyUkExNU5YSlNWVU16V2pRTUZ4Y3Jhdng4NkRXb2pzTnFyK3RYWGFo?=
 =?utf-8?B?VGRoOEdwdFFHU3RUMHl2a1hUWTVMR2FTVFhUTTA0MDZPV0FaSFpDdEs4NDFO?=
 =?utf-8?B?VUJKZUNydDZNbnZybVNqTDFRMGxDVmc1M1RpSkpxc2RzZVpUbUJPNnFzZE1G?=
 =?utf-8?B?L1FreTdnMndLVVA4K21na0tJd0d5cThGaHd2US9FQndLTzdTVUdqVHBsckdO?=
 =?utf-8?B?YWkyMkdMbzczYm1DQ0VEblNpd0xDdHN2OEpHZmd4eU56TUpqdkozZ3BsWFBU?=
 =?utf-8?B?SmVLcmZmZVFpUVk1QXF0cHRJSGJaRFg0YWxlbjFtYUJNNTFncVZxY0tzNHZE?=
 =?utf-8?B?Q3E0NkNCZnVyelhXMjc1SkJ6L242akM0dDFlWmRiLzBFVU1zbStHaFgvVmpi?=
 =?utf-8?B?RXVBODRYR0N3c0xrRy9TTFVOZ3VxYk9lbzVPNjJZWG9EUXRRODJOai94VnV0?=
 =?utf-8?B?L2JDc1VJMWRsaTRhc1FYa043SFBXd2FvaGRvOGM4eE1iUFdpT2RiQkVoSHh3?=
 =?utf-8?B?TE1OY2YvTWVFY2lDS0RBR0ljd1RKdERPNG84UDB3RHZLWEFPZXRCdWJOUEVY?=
 =?utf-8?B?R2hqRk1aTVZsZjFwenpGZ0h1MkJLWlpSa1ZtTmVGTXJFcDlFV2NVSXlpVzdo?=
 =?utf-8?B?T2srVE0wUEM1UTZKY1BJWWowbHlyT0lncXpHVzgycVFpNldyOXBZMlMyYUM3?=
 =?utf-8?B?YUxMQnR2aHMwTElIUU9FOFhFUUhKZVh4bUFoVjdoMzRFRzNhZ2JadVp4UWh2?=
 =?utf-8?B?U0xjeWpGOFBRVXY3K0Z0QVFlUWNTUHVTbjZBdHVieFd2dGw3VitNQnMrOXlw?=
 =?utf-8?B?S0pIZUF3NHkyUDlpUm9JVEgyUElFNitaaFNianIzODNiVWJDYjFJak4zVVhh?=
 =?utf-8?B?TjV5ckhKbUNPVUJpSGNZSjVyYk0va0IvSVEzaU9FZmU0UUpUNWpZdUw2cnRK?=
 =?utf-8?B?eVZScXJWSmFiNjZYK3VuVEJYV1MxTlBYOER2MWNReHVER2tOWlpXcDkrbWsv?=
 =?utf-8?B?VHNQeHozaGZFWHo1SGIwVjBUQzhsTXBxcWxuSzAxNkhhbnc4aTRJa0pQbkk4?=
 =?utf-8?B?V3YrSDZnekpKcFh4SWNKUVo0WWdoZHJRSzQ5TmNUNVdLd1pWb205NEJZbkZ1?=
 =?utf-8?B?dWd4QTF4OXlHYXQ5Nm1LZ2pnMWxzYm56QWQzN3VkbDJrVWNmajJKZ0VSNkJO?=
 =?utf-8?B?bW1jZ1ZiQTFEaitzOXpETkZjVVlteXkxbGowTHJIMHp2QmNGdnpabkR3NWVz?=
 =?utf-8?B?cTV4YmJwMm40eGJhZ1JERWdDTU91N0ovZzNoS1FndFJKMDhUZFR0M1JYbVcv?=
 =?utf-8?B?eEt0a1A0K3p6WlhTd29MeUh0N1E0WjJqWEIvb1FUWDFXbktPQ1pzaEtrL1FP?=
 =?utf-8?B?Y252WExieW1ZRU9JWVludFJWc3FhWVVkVk04ZkJxTTF5Y0cyc2h2blhTTjNY?=
 =?utf-8?B?RkRyYS9BQ2hxQ3RkUExoaWtwMC8razZPdHV0Y0ZjVG9ZMzFGSW5zbVRUeFda?=
 =?utf-8?Q?8o+K8b?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjljL3BWbG0rRUdkbDIxMytLT2NFZWhUZ0RyNVNMZmorbFRjVkVxZTBhNk4y?=
 =?utf-8?B?V2p0WGtEQlNQR3l1UjdPVVgzdjl4bzZqRktaSlJXODlRWUZVNWJqT0xRSG4r?=
 =?utf-8?B?bFE1SnZObEdyMy9CZ0RicTF0eHdnZ2tqcGM0UXJ2Wk1SNjdua0QyWWpMbC9h?=
 =?utf-8?B?WHplOXhLbWl5M3FWdkhQSEN2d00wb3NmVFZDMzRWVjNhVkM2VlduRjlDc09T?=
 =?utf-8?B?S3FncFpuckdPYm9vNlV4d2FTelVXNHBtRStWRjEzNHZoL3hZcUVlV0t5NTJM?=
 =?utf-8?B?NVdqMGZvTUdveEw5N21BNnBsMitIenVUQTZ2T0h3Y3c3LzhHSGxmQzJXc0lz?=
 =?utf-8?B?dFl6TlZhdjdUemhOWnBvdUVGMm13c1g4aThrUjBxTUFRTjA5eXR0OS91Q1h3?=
 =?utf-8?B?dkl4bHdGUndyaHR5QnNrV3BxRC9pU3g3QUVQUUc3b09iVzhYWGZ4ZllEWHl0?=
 =?utf-8?B?N3crUW5GZVAwRHc4ODI0R3JOempybk1mRm5ZbVJRY3ZIWjhRZzk4bHYxMnlY?=
 =?utf-8?B?K2hTeHlQUmpTNFIvTUw3SnZSQmFQTVVNczQvb3JNWEVtdUkxeUZFMklLNURT?=
 =?utf-8?B?L29GcDVKdzZvVWlSNENwOHZhN3hVd2d1U2FGYVhJM0hhdlhrUXFrU2RMK1VH?=
 =?utf-8?B?VEt3bXZBWVA1aG9XMmEwUUFvckx2S3hodnk2ZUFXbUFuM1VKYnJndmhtU3o5?=
 =?utf-8?B?c3NyLzRCclJjRjFEalVZWUIxUStEbmUzN3NsMDB6dXhscTU3TjFoTWNWSnI2?=
 =?utf-8?B?bkhoMEt6OGFYdkJYSXdaeXZqYXZTK2RYVkphVm1jaUlUYXFCMEI1Z3dPUjZL?=
 =?utf-8?B?U3pJbVRITzI0Y3VIREErS1FPWnhDR1RkaEtFb21NS3RXajBlNDZTK1ZBTEc2?=
 =?utf-8?B?TmVDVk9QWXJ4Mm1TL29WTkFhUW9HbHpCUit6QkJ5TjFldCsxb1ZrbmhBZFQv?=
 =?utf-8?B?S3NJZFg1dDhhMHVoc1haVVZlb1htMTdUaHNndHRZQ0ZtRG43aXVNSFNEYVBL?=
 =?utf-8?B?ZzNleU43aVJPbkVKTjJyM0tCU0lQaVFxL2pwZ1BYS3o4WXFGejZrMFlWdjdX?=
 =?utf-8?B?YUVIcjA5Y0N3VHVDTkZldGRKaG9oV2NGUGZ1WUtFeWEyd2Z3SVViMnFZTlZD?=
 =?utf-8?B?NXV6VEdCdkxXcEZkT0J4YWtvVFhRMnJISVFEWEJqcVZQWTZQZjVpRU1vY205?=
 =?utf-8?B?bjlIRGtaTC93TzZLTFhaV2tSQ1FqQ1BqTjQ5aldpbkc4ZEJPUW81MFV2UGRS?=
 =?utf-8?B?ZTJKQzB6SHJlbWtVTUg4MmdZU0V5b3V4WGlnTTdpa0xlQjZybTJiZDNmeTNZ?=
 =?utf-8?B?QXU5azd4TGkyRUJOSnFtd25zdTFzVGhCWktuYS90aXV6TElVMHlRNWJoQi9R?=
 =?utf-8?B?a082RW1DWSt4dXl4SkoxQVhlTWowd2dTOWZJYnBLZWxZU3RzUkpwNkNITU5C?=
 =?utf-8?B?NTVEc2NHVEFKNmtaaVhYanpRNE5XQ0xGVFk3OUZUaVZ1bnl5LzBzdGJMR1NV?=
 =?utf-8?B?T3M2TDRqUC9OWWpDZmVxRFEwRmp2U2lyOVBRREhMTHpPUDdSOXZ5ZUg3K3NL?=
 =?utf-8?B?QjN0U1lNVWlqZ3dMWWhacFJCdFFXMm9halNjQm5xMm5KSDUranJ5ZUltNlkx?=
 =?utf-8?B?L1NuZEJmdnV0VmE2TlRsT1VIbDBSZDZvUnFMOHNkbGF3ZkJPSWJwbGZjSHdW?=
 =?utf-8?B?K3E1NHUrbmxVeUdPbm1zRGNzNE5OV3FXcXZZSWd6bWF1Q09iNVF3Z3k3TmQz?=
 =?utf-8?B?UGRGRlB2R0RSK0pGYlJSOFI2SDA0enMxcXZRTEhQNVVqZFBsWWpla0M2QVlD?=
 =?utf-8?B?N2VTSVg0VFo3YTJkK3A3emRaTnFOSW9NdW9FNlVWZkRuTi9yVS9CM21Vb1NP?=
 =?utf-8?B?N3I4K2JOTkxMY3dBMGlWTmFpcWN2cExKdUd1aGtNZTVVM1lSODZXbmlKY1Y1?=
 =?utf-8?B?UnpXM2JOcFlTL2w5dzVFZ0ZydzBZcTNvZVhsaWlNQnZ4YVR2ajNkNHVGZGIy?=
 =?utf-8?B?RVo2N2t5UWtLRUphendZR3FjVm9Ecm0zYkllWC9iaXRrenpadURXbGRUWFNJ?=
 =?utf-8?B?RVI3MmFySzBZZ1RnY0k5eWF4UzBXcGg2YlJxVWZTLzhhN01NcTN5Qklnello?=
 =?utf-8?B?ei95SlNkMXVoSmdPQS9IazV6OG13WCtQdGpGU0Z0ckRFd3B1NWhDWHh0MUJN?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PqDDtEnr8XDK4AWm0mFXhBJZ"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e1844b18-2146-41af-fdfa-08de107d1501
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 08:37:34.2118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n7dMYEXWIk219i3NeacNdZzjRUlz68WJonkjIBKqCyiDg/RO+33HmdLVplu26h1ighmnDgbRZPgPwGMuoTetKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5417
X-Authority-Analysis: v=2.4 cv=VOPQXtPX c=1 sm=1 tr=0 ts=68f74656 cx=c_pps
 a=UMEdyM85sX7nMp2sbTDHWA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=XYAwZIGsAAAA:8
 a=r_1tXGB3AAAA:8 a=XDpr5nAawtO2Oyt5xJEA:9 a=QEXdDO2ut3YA:10
 a=xWFhHHFHXOYAM4_IESIA:9 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: pqQ0ZuN7__vDG8gOFNSlzF9oBMY8k_hy
X-Proofpoint-GUID: pqQ0ZuN7__vDG8gOFNSlzF9oBMY8k_hy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDA2NyBTYWx0ZWRfXwJO5asSaq7VZ
 VxCjT5Dv2MZPVGvtu9LvlQN5euhlM89XcprEdKxN3YQE3mLF2La7dFaCSxs311OkM1gdk1CIbOk
 IfW8C1U753o71oXrTdh82WwB1/J6SYtizAsNL+mqvWoeHQFOffF6gxtLQM2VJsDNnEg7zwZg5+W
 OXWXnGRPGgn3xXMeDOuHnJE6+aJWXpBCcF8mVofm3YbnodTZJ7hIeq3a/GtX8fg4xvklOP1P7+f
 LtCXACP2LjttTJeV9XV+GKshl7o7G+Ba7+Ot8ShpmXF/+EjJGj9QH0i6DmAzryF02ydDt0Xde5e
 edYBk5WTTSYKmB9ZTaufns2zqE/L01j9Mz2AIbLz5HzX0MJZ74KoeqKgsHTMF/mV10JmxVhVPld
 GD28iIDAz9I+WhqRBlry31o4ESYjSw==
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

--------------PqDDtEnr8XDK4AWm0mFXhBJZ
Content-Type: multipart/mixed; boundary="------------lgcw2yL0JxHER1UxajQZjGJ6";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor@kernel.org>, Adam Ford <aford173@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Message-ID: <d3a43b59-b181-4b82-beae-d5ec93491845@imgtec.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Drop useless
 power domains items
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <855fdfad-1df7-43de-8a86-a938cc56a202@imgtec.com>
 <20251020-freebee-asleep-702062240cbd@spud>
In-Reply-To: <20251020-freebee-asleep-702062240cbd@spud>

--------------lgcw2yL0JxHER1UxajQZjGJ6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20/10/2025 18:31, Conor Dooley wrote:
> On Mon, Oct 20, 2025 at 03:15:14PM +0000, Matt Coster wrote:
>> Hi Marek,
>>
>> On 18/10/2025 14:00, Marek Vasut wrote:
>>> The power-domains items: list is not very informative, replace it
>>> with plain minItems/maxItems instead.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> I would R-b this, but I want to wait for feedback from a dt maintainer=

>> to make sure this is an approach they're happy with. In the meantime:
>=20
> I mean, yeah - they literally provide zero value over the names.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Sounds good, you can have my:

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------lgcw2yL0JxHER1UxajQZjGJ6--

--------------PqDDtEnr8XDK4AWm0mFXhBJZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaPdGTQUDAAAAAAAKCRB5vBnz2d5qsGDd
AQD3xL4776z8JqGIi6OH0LzuWTyhOsXY6aCGLcZ6oBQGrgEAqK8ZHbrO59JSFbECC769rrWKS36J
kKIQAzhfurgTTgg=
=1Lk2
-----END PGP SIGNATURE-----

--------------PqDDtEnr8XDK4AWm0mFXhBJZ--
