Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74331BDFC02
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3225C10E886;
	Wed, 15 Oct 2025 16:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="LhOlvGnm";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Sn3R/IOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F5B10E886
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:51:04 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59F9AIQO2989588; Wed, 15 Oct 2025 17:50:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=voiHJCiQN1ePaUU+dGiS6DNaM
 dsyfMb3PahcXYxJ56Y=; b=LhOlvGnm56YqECiChhjJabLSZ/3rdZOa9aK1ym3i5
 TDSLeAnC7G7B3GJrpRWliWRO34X9ezSJU3QGxtNOa56pguiDGbPIewKHwtZ6QMcB
 lbc1yW3W39jp0jPif/eMcWqwRffMOpdhaiK5ljXDU0Cfo6PC+dVqA+FSDWaJka7r
 AnygkNABByPRAfQHlHXW8B0pJJHNmN3m1FANACofMkpRF3bFz7DYbL0ZFKk4bpTe
 3e59DJFzzm+RmhLITtEZDjybRaomKGFY7p3HOh9pVu/w9xUMgpsTflAF+eKsHlAM
 OIe1UyC0/X9IibiiWZBWZMCz3DWbOZkncvZde5Xsw2dgg==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020094.outbound.protection.outlook.com [52.101.195.94])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 49qfarvfnk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 17:50:50 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBLhMGrfqPeMBOEwkY34QyE9HILhwIOyUWlCNtLepHKzVAI56+ryDrD4R6X0vtk29Suns1dLGG0Am9neGyKwiQDI8mVSBfmuyuXLL4eJ1LT6JXrNHskY09l0SqARhg5i8KSR1OASdyG6WCuHIUYWC/tkqkenwl5RZrxYtOXTAPDBg+pMGUgP0+2j3VBFiclqe3kmzKSwDXOQhvNAvUfXEzDDL1sqh6hiihr5PsvFg06MgMJjjqGOq143SGc/6KBGNyEhrwVIWUtL2E8mfaZTo47m+owwtR9C0tjiLhpz7IOmm0IBQ6hd1P2rV5Xg835CrI2gs+3rMx4b3aLtr1RJEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voiHJCiQN1ePaUU+dGiS6DNaMdsyfMb3PahcXYxJ56Y=;
 b=rCWfwewOblAL1OLDASjQNPLpflzXhDkBHINhTbwqrns1y/s2ojRdjrWPsw41pPnzuK80g4i27OXqwQ7ObzRTZUeBdy9vqtF1xigjPUB8MGK09D967k7edzKW7ImXPUGhMpm5kTyXLoQB2x8SnFOSUSMx7EmX/1mv+V8GAlCVEqLcuMr5H0NbNUBX8fxbygxBkruPJNkzeQn0Ep1nNULaX2rZpap9araDmNBPhIJZ3425NeCESO6CGB0GVT7h3j60N2ZfAtno4mXq5uoNtQm2Tza3YdtfAkGwd7RX/oxmewNxPs/zuzk5nGb9VNK9gSOxPVrvpSNXkD7yMDWKKlA05w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voiHJCiQN1ePaUU+dGiS6DNaMdsyfMb3PahcXYxJ56Y=;
 b=Sn3R/IObCVpFgs4/lPySghrviu/d4AIWuXnVyHNnq9/gisIdghjS95DqS8/lRZUpzIw0lynHmEmVLcGSEy/zLMXwSkkYf5Boum9lF6AOlZotZh+GZg9FvOVHi+P6ftq69Aq771vYjgCLG2l7F9yIAy4U87tTYtIIJMxdd9plKoc=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB2852.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ca::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Wed, 15 Oct 2025 16:50:47 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 16:50:47 +0000
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
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
Thread-Topic: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
Thread-Index: AQHcPfPacmpWfQF1GEqSWIOuhOXK5w==
Date: Wed, 15 Oct 2025 16:50:47 +0000
Message-ID: <807d4d4d-f1dd-4776-9543-2e8d997071e1@imgtec.com>
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB2852:EE_
x-ms-office365-filtering-correlation-id: 2b6a354a-612f-4ac0-a11c-08de0c0afd68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?NWJyelhnRGYxUytVZHV4ZjJUNE5FWlBYYWtuYi9ST0hBUmFIb3ZlWkNLYmly?=
 =?utf-8?B?QnJWK0dubWh1bzZIcUZLZktieFFVV29FV0dURVEzVGFWRkJpWk0yRDloWFFr?=
 =?utf-8?B?RWZPUWZIQUlHZHdvcXJCUlFqMnpLdStJb0R5eUZjWExnZUJaRWFUTGp6bmt1?=
 =?utf-8?B?czBpcWVTV1hBU1NWbFFXWXJ4cm13WWlVMm9CY095UHZvYVQvYmQydGVnTjR3?=
 =?utf-8?B?S3JURUZvU1NpV3pXbmh6UDVRZlNVSmszQWdwQ2NqT2U5L2FRRFdONk5neEFy?=
 =?utf-8?B?NHdmZStQS2FpWTcwZHpVLzJ3TytnYmJXWjhpOXdIRWRpRlhocTFCSmwzbHNk?=
 =?utf-8?B?aEZDYkRKMkY5M3VKalBuS2xNYUkxREJBckg2L1p5L0wya2dKMHR4aWVRbnRN?=
 =?utf-8?B?VXhJOHg1VWZXaW1iZTNCQ2l2SHdTTEZjcVlzUWtvR2VkSERrdnFvUUxkWUh1?=
 =?utf-8?B?c0pDK2lhV1ovRkZPNHlzZjUxQnRPSysrd1pNbWFKTng2cC91OHRJd3VuUldj?=
 =?utf-8?B?VzF2UG82Y0JKRVlTQWhmck93TkNOR3FkUWNZYkQ2OXhwY1J5YVZ0bkVDaTRx?=
 =?utf-8?B?Qlk2eG9OdXluRG5tVTV4U0p2T0FYL2htTjBzRGVsZnh2NDU5RHpCNGpHNW1E?=
 =?utf-8?B?ckoxRDdIY1FMMDBrc0sxaGkrQnY5anJCVVdRQ0FKSWorVkI0cG5wSmo4S0p5?=
 =?utf-8?B?SjlRUnlkM0U4WVEvTTFVcitzMEZON0Z0V044VkRBMnBzdUVNUjM0ZnVJMjA4?=
 =?utf-8?B?VC9GRlB5VkhzUTJjbk5QNWFpL1pGQVl6UDVvUUZ2b3ZocVF6dTlLL2p2RWh6?=
 =?utf-8?B?SHRpVWZveGxBZmhOTG1wUzFYV0RtZW8vT2k2RjNrRkgrMUgvQ29LYWFHV0sy?=
 =?utf-8?B?WGROdzZxZjc4TTdEZWh4MXVOUzVtVWZtV1krN2Q5Skt1S0lOSTN2enZNc3Y4?=
 =?utf-8?B?Tktkd3h5M0h2VlpzYkhlNEp4MGNDenJKVXNGanN6VVhOVFdCRU16RnhGQ0dV?=
 =?utf-8?B?eVZ5Q0gvckN0bTNHdVFvZUVlQjRhU1FCSk9GYjNVYVhxY1JydER5REdoS1Ro?=
 =?utf-8?B?bmd3WGdqdmNJYTAydVI0Qkc1Z0IxRHdiV09DZlYvQmdFbzNWK2F4OFhOSkhV?=
 =?utf-8?B?V0pxRTFIbm41RHdLVUZMSld4NUZHTU9ELy9wcW56SUsyTDI4eEJBdGcwMW5C?=
 =?utf-8?B?WG5VQnBZT3J4Zm1vVjQzUlExeTFheE94eCsvVkRWZkNZaEJ3MWxHMHIxZUdV?=
 =?utf-8?B?Q0crY2crOXRsa25SWjhldWZiL2YzMDdxRDdKc0lxendROTN2bzFzQnlkYlJs?=
 =?utf-8?B?Z0NGQlphMUwxdFZocTk1QlVXUWVQK1o0RXNvWU16QUdLalozcDBoRSs2R0c4?=
 =?utf-8?B?bzVxaGtXYThpV2pqcWNQMTFYRDZYcFd0WUE2bEJ5TEtlOFJFeFFDV3NueHEz?=
 =?utf-8?B?bm1FdHFqWjdrOXRsMzByR202ci9MZUQvaWxEODk3ZjVseGFtUVFBa3F4MC9D?=
 =?utf-8?B?SlE4eEVZTCtHcURjeUhmbXNJN1Y3a1FCQ1RWQXg5ak9maXNQcnYzMWNHc0xH?=
 =?utf-8?B?d09ORExRc2tmSFNZTGtZWGVWb2hZdDJBKzlWYjVUUld0VDdiNDVMU2xja3hD?=
 =?utf-8?B?dFhJSEZZVUxRMlIzT0k3WTFKQXdnbTcrWDhtU045UDVQZTRQdzREMXJ6bXVt?=
 =?utf-8?B?U2pyejQrRDhycll5bENXWTR5WDJaY3VveGNZbVpaMWRLN3g2ajRuenhEYTI3?=
 =?utf-8?B?NXV6Z0x3Nnh2OHkyYVpNUjlzUytyYkFoYzhMUkRFQ3pSdWtQZVVOb0RFNGpG?=
 =?utf-8?B?NXFuUUhkTEtNeDhCaXd3djZ3UXBxc0laY0c5OXRnczdacmtwaEtoTTN4eFNs?=
 =?utf-8?B?NkV3bE5qdGVieHhrbzhhSTRyenZ6YnU3cWdqdUpmRWhwUUdwYzlCWUFVclpM?=
 =?utf-8?B?cnBCVXU3WGNtMjgzam5DeUUyRDNwNmIzQXBFSTFsbm1mZ055emx4Tzk2cHNV?=
 =?utf-8?B?dlZuMWlXbUVBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(4053099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0ZtVFVac2dDcU1lTVJXcTJSL3Q4KzlOMlBISTllK1M3MEVIOFd3V2s5TER4?=
 =?utf-8?B?KzJXUk5RUXpOcUh6V0RlTDQ3cjdCdVVMWWJjMkNncFVVeFRKMXhrZmg3d2x3?=
 =?utf-8?B?Uzdpcmk5R0xud0tsT1J2alhYenU0Y0YrdTdYS1JoTmFEempXd3QwSCszQUI4?=
 =?utf-8?B?K3lCbE1pSDk5OVExcjJ6OEJ4b3NlUnlLQXNSNlI1WHpDRXUvdXpXbVVrTUIx?=
 =?utf-8?B?QTF2dk9yUjlGOWpkRHpwSHJDYlpaRzErb2pabHBhRVg1d0Zuc292Q3dvelEz?=
 =?utf-8?B?R3ovakZ1b3pHam1UQnZSazNDMURTckFvejZaMDBXZ2tTaGN0ZllmQ1N4MUdR?=
 =?utf-8?B?UmhFMnRVeXNlYjJTYzc2K1dtVEwwL0hmemc1OVN0QkJTS3RYVCtDOGxBMmtS?=
 =?utf-8?B?b2hBYytSczlWT2ZqVkVLNHhISnBOd1B3TFhxeE1laXVpYVNCNncwb25uQkta?=
 =?utf-8?B?T21hZnUwQnhkam1FcVRIOUdtSW0ya1VyenpUcDZmM01SbWdBbFlLemNFc25v?=
 =?utf-8?B?QnQ1eW02YjM5K2JsaXdseFZ5MlVYbGJETVlpS1hkU0RNYUNqaHRHMnRTUzVK?=
 =?utf-8?B?VEpvTEpucG8zaVU4NnRCeEE5U1V2aUlvc3haMTFETFV1S2VzWHFnM21NaTdj?=
 =?utf-8?B?M0VtUExJTXpCVytFak1GQlpVbmN1U2MyWHdmcWpWMkJDUHcySVo1SUpGUDlv?=
 =?utf-8?B?cUVCS3R1aWxHRktEajNGa3BpTzZ5THFBQnh6OHhyN1FSUlBoajFXUjEzSmFX?=
 =?utf-8?B?UkFuYno3MTFoRW5nZWdWd1Y0bUxDKzBtdUU5NEJPTi8vYmJTNzhaRG5oVlJx?=
 =?utf-8?B?WVVCQ1FrVlBkaDV1ci9UMXBHeFI1dE9kaGdnRjNzcVQ5M1dlK0w0TzRuSUtM?=
 =?utf-8?B?MnE5b0Q1Y1ZvUEZqWTYwdlZkRDZ1dUVSTlR3dktHMG44MlFtQXJ0RjdkMFB0?=
 =?utf-8?B?ZHJ2YUN1RVh5NCs0RDhHSjh6NTJIMWNYUDBMUDFqZjFWOFprSXBvSTV1b0x3?=
 =?utf-8?B?OUx1alp6b1E0L3pyY0lZOWhtalI2RThsNTYxTXF0c3pjbVZuUFFDaEdTdm1u?=
 =?utf-8?B?N2lNa2ZRbDFIelpoUWhxczRWU2IyR2dsTlo1WXhzVklJc1M1RlhJMzVNa0tW?=
 =?utf-8?B?TmY4aGJka3daeS9icVlKRDFJbWEzQXhkcW9yc0lmWmRFVzllNjVsOXkxb0do?=
 =?utf-8?B?UmtNMmNHSUVnMktBV1JtQ21LSmxhcUdjc0NSQjlhV2VSOWFlRXdaejFXTjIy?=
 =?utf-8?B?SGVQNW5pRkZEeVlPUUN1WndvR0IzanlSUjc1WCtLbjh6T3BUNWZHNkg0Ty9R?=
 =?utf-8?B?azRqeWVFbW1pZEE4UVBNNXE5b0IzQldMRGIweWRoWlRDVm5nZCswMHBVQXF0?=
 =?utf-8?B?cXVjVXRIYWpOMDNiZlg3aFpWWE1xSFJIRktvTEg3WkM2U25pT1BFaWZpTCtl?=
 =?utf-8?B?a2V6NHh4dkIvWnM2RUd5b3pHOHErQkZGVlphelc2c25WMHd2TWtnN0JGajBT?=
 =?utf-8?B?S0Nxd2cyZU1ocTlMYUtHamlMQW9EQmZPZEV6bThkaVB5ZG9Xb01SZ2JqMUVH?=
 =?utf-8?B?Y0tsNUNiY0FkZ1dNMjNzWWtMNnhDOFlsSVM1U2NLb3hISWw0TFBoR1gxMERP?=
 =?utf-8?B?bDNVaC9KdDlxb3lJYVB5aUV5RUpCK2dZRnhIQTNENUNwbi9NZVlsTENuaXRv?=
 =?utf-8?B?aXlJdGFGSlJpMXZCRnh0bGRzTzdLeFd2dnJ3T3AvV3BIYitGSU1GK005YWJS?=
 =?utf-8?B?MlJCK2MrTWVMak1icHlwVTJDMEJsYUxHNGFrbFFjL2I3b3JhYnJpNDlYRHVD?=
 =?utf-8?B?UXpNcWhvanBVMkFab3hYU3hCVFZUNXdCNVI2T09mTE4xK1djbWp4VXZZWU9k?=
 =?utf-8?B?QTQvNzNhMHFqYzJQeFdsQUovNmdjbHZSL0xZOUxnYmxFTWhBTi9lMEc0RmVJ?=
 =?utf-8?B?MjllaDNYTlAwTWYzeVNHQlI0K1E5RzBFTUV3OXZBK1BHRlpjSUk4eGc5OWxm?=
 =?utf-8?B?eU1xdkxaK21tbGhBMldhSEVjZ01paytWdHl0SUxrQzBEZ0ErRG96ejRuNDRB?=
 =?utf-8?B?eTdrejk0SjB5MjdVeTdac0JlTFZ1MDU1NmxEcFlvbW5BRyt0bFhjRFYyRFlU?=
 =?utf-8?B?VnlZeGg2QUpzUWIvdmw3VktzZkxXOG5RdnNnZXg1WmNLcklTSG5Yc2d2UDhM?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yaJ0vDNTmMhnuTH73sn4bRgO"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6a354a-612f-4ac0-a11c-08de0c0afd68
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 16:50:47.3643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ZYJW/3mbLk/lp5KHQptrATpUMBzb9g9PZKh4rE8hhT7EbojgMUKO7EMvB5HbKDZPMxMkUJiMgLsLix1VVmU3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2852
X-Authority-Analysis: v=2.4 cv=O+A0fR9W c=1 sm=1 tr=0 ts=68efd0eb cx=c_pps
 a=4pNTCdu0L3dWcbgVw3RgYA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=XYAwZIGsAAAA:8
 a=b3CbU_ItAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=yC-0_ovQAAAA:8 a=QyXUC8HyAAAA:8 a=2LT2JS8uAdL3bfzyeL4A:9 a=QEXdDO2ut3YA:10
 a=rqcP3j10TTrpEvGc4-cA:9 a=FfaGCDsud1wA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 1lZFE_46YvlmIq8pEBMtFwe1lbnASA1L
X-Proofpoint-GUID: 1lZFE_46YvlmIq8pEBMtFwe1lbnASA1L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDEyMSBTYWx0ZWRfX+pKhe3TyaIxc
 QDRWABUswWZIi6hgyJQE2lPPIIquxb4HJ0SfkXT8boZRHspE4CkZuZ9SRBalzJes6GxGaVMapX1
 PWPnctwP6H3H36k6sAnCIa7owGTP0kkln8UPw8NGmoN54OvgR34zTkLTz44QN2wOCAgQFWmUO2o
 zIp83uXCf7rXFwHLc3G0mcFMriX3cd7N+dqZrQ5MIeOsMWMSGv/BNwluJHB2OAuJ+lDb9GWja7e
 V20bDvu7YtCwlE2vCqdISlemkUo/iZhKLqxvNIkTjNV1hNYj5gtqMl4k5hLBHNnE4bUGK8XaaXV
 g/LKIDOehcH5ih+sfO2BF9RHW8KIS9p4MfSBwp7Ui9blPHZixFvAiGrMpoc2YaUaDO9934sPINp
 L9qNzPJ8v3O7Y+jbRTAAeQLbMKjLAQ==
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

--------------yaJ0vDNTmMhnuTH73sn4bRgO
Content-Type: multipart/mixed; boundary="------------YkoiuJzTAT9qNzTcG7n0mCCO";
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
Message-ID: <807d4d4d-f1dd-4776-9543-2e8d997071e1@imgtec.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>

--------------YkoiuJzTAT9qNzTcG7n0mCCO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15/10/2025 16:38, Marek Vasut wrote:
> Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
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
> ---
>  .../bindings/gpu/img,powervr-rogue.yaml       | 29 +++++++++++++++++++=

>  1 file changed, 29 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index c87d7bece0ecd..05fe9498dfa09 100644
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
> @@ -146,6 +152,29 @@ allOf:
>          clocks:
>            maxItems: 1
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r8a7796-gpu
> +              - renesas,r8a77961-gpu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +        power-domains:
> +          items:
> +            - description: Power domain A
> +            - description: Power domain B
> +        power-domain-names:
> +          minItems: 2
> +      required:
> +        - power-domains
> +        - power-domain-names
> +

Hi Marek,

Thanks for the updated patches!

Would you mind splitting this conditional block up? We already have a
constraint for 2 power-domains (see img,img-bxs-4-64), which should be
applied to the entire img,img-gx6250 compatible.

As for the clocks, for the currently supported GPUs, we have "mem" and
"sys" clocks that are optional at integration time, so those
conditionals are based on the vendor compatible strings (ti,... etc).
However, these older GPUs always require all three clocks, so it
probably makes sense to create the properties:clock{,-name}s:minItems:3
constraint on the img,img-gx6250 compatible as well, rather than the
renesas,r8... ones.

You shouldn't need to explicit list the power-domain descriptions at the
constraint level at all; if there's a build warning that they're missing
I guess the correct place to add them would be on the top-level
power-domains entry, but I don't really think they contribute anything
meaningful.

Cheers,
Matt

>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------YkoiuJzTAT9qNzTcG7n0mCCO--

--------------yaJ0vDNTmMhnuTH73sn4bRgO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaO/Q5wUDAAAAAAAKCRB5vBnz2d5qsG0s
AQCQSjquTtOPZUil0mB03f6nUgydCTwl8eLXzFwag2f9gQEAl7Jt0hpsH//MXboTxBjH3cwKN4KI
bl5dgAYHHK9YCgA=
=29+7
-----END PGP SIGNATURE-----

--------------yaJ0vDNTmMhnuTH73sn4bRgO--
