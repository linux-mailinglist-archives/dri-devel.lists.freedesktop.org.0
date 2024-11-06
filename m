Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E753C9BE410
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 11:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6354B10E6A9;
	Wed,  6 Nov 2024 10:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="m32+VYKp";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="qORJdOcy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF8810E6AE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 10:18:24 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A68qKaa023051;
 Wed, 6 Nov 2024 10:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=GCWCrsXAsLjm4n7nnbHos2a7f
 NIUp+0ug4g5Kr7MLzw=; b=m32+VYKpXpL4LREXyvW2zjUFzejWpe384vOWT/mnm
 lORRrB5gootijvjsovhoAh+uNq8Gy+QbuCsoBaV5PtN4nC3RL5fb+3/e+ySefHo6
 IAzZYx2OFKdmj6c4o04OfA6XMPW0sUR1jeZXSXDYJUCn+Oz9mtPLBWWaoTJ5mJ/S
 XbEhCoQhIgTEJnlig22dUYR6+swQL3nwTaRC+O/rl9zYgWSz7ixALm+i9i3Bv26D
 pyz8yrmfjQpaB6Gh6FxIMIyAP3UJrqfRTdPcbYjFLVdURMLsUYBXt8+Fa23y5z8F
 /tINkJcCOiNjjk7ksrwaH4rj9KJAYCcIydzf+HJJ3bnhw==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011030.outbound.protection.outlook.com [40.93.67.30])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 42qw83ratc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2024 10:18:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Of7pvR/nqyLDqSYV9iX0dCDuUVi3mGc46r8B25TR/b2OFbKTMjt+cfiudCQGHTOXj5SKpKekkN4Xg97wHm+GbWJEDd6vq+mNolo0COSWWzTZqUCfaZgPHTAd/Qhst3xK3jXe+ht64ss1tdHKsZeNMiOp8y3AsYAbUV8KCispyVxkwz5kGmL2R/MelAwfZGYpO/6TyRTNSlj2y+ni1j//vl+Byfu74mpHA71NpjSRi3X63uWc6sT42jC5fHobGw5Z36lGBBylS9Aprx27RlobAveB0W6OpC9kamv+EmDYfUOuDBZyFs2ZSY3VaxWElo7jnH/KVrq8j/Gysdcd3PM90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCWCrsXAsLjm4n7nnbHos2a7fNIUp+0ug4g5Kr7MLzw=;
 b=gZocsO9ZPvf8HFqJyCrLVc1PuIdzbwkLt4Mgft91M6OLdDhQyb9oL2TxVnd3UXXA8KVQbulky9ythK12eQYnK/Fms7xeU7SdM3547jvcMrRJIU1RhMnJPYIjpjwtozvhPut2M5uefIF2CmdJkGX3veB3YoUV2fK2SJYF6xIRjPD/AaLAfZ3RHEQjXXjny7IyqSAdPFGLS5HKNgHCXTdMgEszSot4a3eT0BTBon+A0W/oxO7Dbb4kI69ysgICnLiF91Sc0V+Q9xwtbMYdGJjQxOZwvtKOE/lmz9WnyQo6/iaduXHkxDA1Hy9tbzjBXEPvyzazjb1VZxINtjn58+hZgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCWCrsXAsLjm4n7nnbHos2a7fNIUp+0ug4g5Kr7MLzw=;
 b=qORJdOcyceiVZLV5dJWyuhdUqKaYq5/OwXsAh0/i1O5ksblgtX790JAbqTcfFTdIvbMVTKGeOPyfXc6T/GfjRDFYclhRe5wtE6vIIBtnfaF8iIvCQhiPt0Y1mzpuM++KlBP3HSgv14/Ps8dUUZ/DbR71x4PDGcUFCdnOWU4QLXQ=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB7201.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:32e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.18; Wed, 6 Nov 2024 10:18:10 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 10:18:10 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Conor Dooley <conor@kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Randolph Sapp <rs@ti.com>, Darren
 Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 08/21] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Thread-Topic: [PATCH 08/21] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Thread-Index: AQHbL5uQ+BUfDOg4vkWwYh76aIUz9bKo+u0AgAEQNoA=
Date: Wed, 6 Nov 2024 10:18:10 +0000
Message-ID: <fd3d9f34-0e8f-44a1-ac21-2ee0c49d65fa@imgtec.com>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com>
 <20241105-sulfite-justness-d7b7fb98905c@spud>
In-Reply-To: <20241105-sulfite-justness-d7b7fb98905c@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB7201:EE_
x-ms-office365-filtering-correlation-id: 0ec26177-3fb7-402d-070c-08dcfe4c50a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?R2RrNUdGbW9FMjBOK2JPWXgxdzhTZGZ1bVJjRXNnK0JSeG1PYUdYOG1jUXRU?=
 =?utf-8?B?ays2bTRqRWhZaVd4cE1KeTlPYXZJNFJoQWFZYSs5L0pmTGEzRVd0T2tqemY4?=
 =?utf-8?B?bXpyRXZoYmIrNFNTbVAwTUlmaGwwcVRSeU5WeWZmajhYUmNHeTNjMGtnMWZT?=
 =?utf-8?B?QnpuZ1NONVRrSnJhN0hnTmw2L2dyR3ljWkVhSS9jeXB1dHkzeDZmRlY0QnNp?=
 =?utf-8?B?RFJkS2pDSThyTkZoMzNGOEo0eHI4SXFSKzNudWEzVGtyN1c5Y3p5dnFWWTA0?=
 =?utf-8?B?ek44Znd1NmdPbzFuaXNVck9mT2JtK1JHa3d0cEJ0MnVUMERpNkxUWmhQQ3Fk?=
 =?utf-8?B?bmRTandHUnR0aEU3MUsrNmlSbDZjOWlrMzk4WitweWFsMW9td1ZGYSt3TGlX?=
 =?utf-8?B?VjArRlZOSTg5eDFhZFVsbElhOTFJMHVNRDcyUjlYWXpqSU43dW02ekNtbGJi?=
 =?utf-8?B?K0tmU2R4cnlXdnRjd2dUL0M0STZjVVZzODNJMk5sdkFVaUhLQ2RUTlNOa0d1?=
 =?utf-8?B?dnVMRklBa3VjNkNiZlU3T2xLM3lLSlJ6amExUWxUSGpoYkdYSkR0WC80QUMz?=
 =?utf-8?B?dGltamNUeEZiSVAzVGVyRlI4bmFDN21heUZ3U1pEMzB5UXpjMUFFMFhWNStG?=
 =?utf-8?B?N2FQeVEvbTEybFNERkQwVUx4aG5KWjk3SW9YNm1nekY0N2tXM0dkVitxSmU2?=
 =?utf-8?B?L09pdE1zOEc1NkYyaEgwWHBlQnZkWVlyK1A0bFJFOC92SDlkc0RXZWttOWx3?=
 =?utf-8?B?L2czUGxUODgyTGltYzIxaDJwU1NXVnN0TUdZUEVOZ2pscFBBU0xRY3VRby9W?=
 =?utf-8?B?alRrVlh2OTVMdUR3THpDaHd5OWV2NHpWUmlWbENhY2N5K1RGT3hBQTZSY0ZB?=
 =?utf-8?B?SVc0Q1lmeGFERmlIOURuc0dmVkxpMXhuWlJjM1pUSlp5ZEJMVFJjMzhnZm04?=
 =?utf-8?B?TC9FQTVPa2x3OHg4NHpNNFVaRHdhQy9ycmdUMnN5S2lpNGxUc1BRdkljeGJ5?=
 =?utf-8?B?U3BYUnp1UlptNUpQS0p4ZWJ5d2JEZ0hHRDgvLy8zRVViWmlwL2wzQzlLUTli?=
 =?utf-8?B?REJWbW9uWlNpZkNlMERCbjlaVTc1V2pNaE9senIzV3k5UjhZR1ZtSW9ya3pT?=
 =?utf-8?B?YzArZDZMcCt5bklDVWp0VHEwdHdFV3EybVd6ZkhNMnY3Z3pOdWhYeXJLc0pH?=
 =?utf-8?B?b01FaUhyVmVUb0hpSnF0cVErc0tLanAyRWYvTnRabVBjZU5aaVdObHFhZGhF?=
 =?utf-8?B?Zm54QnFKNlRSYjhQSUtSbjc4Z1Y1dkxWTU16NnV4VmFobzdlMWZoT2RDdURR?=
 =?utf-8?B?NVlQMEt3aTZ6Tis4UUhZTUpya29lRklpMTB1cU9ZcVRCSEZoVVkyTlo3Qmdj?=
 =?utf-8?B?RlJtZFpkcnoydUtnSjJ4NzFWTG9hVCs5Tm9adFFuZTJHYmZzOUh4MmVHRVBN?=
 =?utf-8?B?Q2Z0a3haN3ptZTZ6RkUvdkFqSnFHQTYxbVNoWXFuak4wcGh0bWVyY0U3NFFN?=
 =?utf-8?B?RUZObkxNRTBCTlBBQkNDTzBzNEdRa0hQazQzeEZjVUt4NlJoUlFvclR3V3pZ?=
 =?utf-8?B?T1pPRGlMek9KZmprdENnTDMwRzBrTzdQa1g3ZzRuQXdLSVpvUTE2UG01R1hY?=
 =?utf-8?B?OGZEYWRPY1ZEc1k1amtwYURmTjkycllCMW5TbVV6RVNLcHpkUlpNb09NdXJH?=
 =?utf-8?B?b1ZpNEJGQVZlSy91b3hJOXB6OFU0Y2JmWklLVXlnUmRhSlVYbDI1UHBHZXlQ?=
 =?utf-8?B?VE5sYVNic0pHYUEyWjUxR0E5QUVveGJDVGRHQnc4TzBXdFpROCs5NnRGbzN4?=
 =?utf-8?B?SkVwU0cvKzNHTFprK3o5Njlham55bDFyalEweHhyd2xsU2R4UlhzL2FoemNM?=
 =?utf-8?Q?wrmfFDTTi9PAM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmVjOGNiaThEeG9DS2VRaThUUEhVTERFcWErYnNIMnVVSWFKL0FGVnNIem9k?=
 =?utf-8?B?NHEwU1BlNkxvK25xNHBuVDY3a0g3QXB0eEllSzZYd0hTRkQzQXhaMGVOT3BR?=
 =?utf-8?B?RE5sV3Vsa3J0REhrREZnVy9sZE1FSjFiSDNSYloySUxLM1pXVCtNU1JURGlp?=
 =?utf-8?B?a1hyNFpTYmUyQzRObUdmSmFNT2pKY0Rrb0l6UlVnZVZNKzVUY0ZpUEJGL29k?=
 =?utf-8?B?NUs4NG5QOFRBQk1ZZGNKVHdic1hycUx2TTdlQ0dydUJkaTA4Z2pTMklFWWNm?=
 =?utf-8?B?blVmalR3MHd3amR1N0pPWFdsamFTUHlvZW9zSGlHMEF2MUs3U21jcHpyODYx?=
 =?utf-8?B?VU8zeDRlK2lpRjU0T2Z4dHVmTHFVNGRDYXVYeDd3WEhYb0N3d0o1Ym9pL0Nq?=
 =?utf-8?B?VTVSS0xWaWZya2txbVhudmxxYmNGdGpJdkJZV2lBdUJxTnhsdGk5VFpKYm5F?=
 =?utf-8?B?empVYkdnMFZUSktTQWZiME9uVldvTWgvcFFXV2t0SlBmaWp6NzM5QXU4WlhE?=
 =?utf-8?B?UEd4M2JIeGluQzNBUXgrMy9ZZ2NSYUZmVXR6R0FXZXh6QTM1QVhQWFpNODhK?=
 =?utf-8?B?VFZxRVc3Zi9Ia29VczRUM3Y1b1hBRHJWNFFtRUhwVmF4Wmh2anNVems2Nm5y?=
 =?utf-8?B?bjEvME9uU29xcEEzck9YTkU4cDdpbG5MblNabjdXdUk0T0JzaEtBd2tmVFR2?=
 =?utf-8?B?d1ZrdnhNWllCNjVYTDhTb0t6Q1dXWmYwRWdENWpvWGxUZlEyUUJuQ1MzVDlW?=
 =?utf-8?B?ZFZveGRlcFRFV2FraVZJQWpGZkdaSFhYais2MkNvTHRDWHB1aGhTekZrRnZn?=
 =?utf-8?B?S21PWm9NMm5oWnFnMDBnbEEwVi9UNTZGMDhpYnRWeGU0WitxTlZYeXVIQlU5?=
 =?utf-8?B?RTI2MFJ5cXF3M0J5d2NLZlZzcndRbTB6MzV4d1RBZVZyOHd4eWFDVC9HUFlu?=
 =?utf-8?B?K1JMRFI5UUpweUU2d1laeCtVdUZWWnVGSGJWT2VJNERuZDMrbllkNGtuWFdl?=
 =?utf-8?B?UVVDejdGQnFZWVRvY1R6ZWtrZXNzeTRzNXhtWWhiRVJFK0dpekRKNTB0eWJy?=
 =?utf-8?B?UStxTkc4NkZIdzV4a3lkSXVVS3ZHa2FkZ3pEdXBmMTN3ZkYwNEZVTk0zcE9Q?=
 =?utf-8?B?MUpEeTBEODNtRWRVMlh2VTdqYTlLaUozU1lZb3Rlc2R2VzhsaWgzTnJCdXRh?=
 =?utf-8?B?TitFcnFjZmo0NE5ZaVVEanJnZGdJaG52U0c1VDF0TGN1eGlSS0gyNzdtZWYr?=
 =?utf-8?B?eWdSNUorRXpOdnlkQjdVOUErQ2hObE01UE1ISWl2RXdTVHdtNHVZQTNvbnV0?=
 =?utf-8?B?REh6UmI5MkJ3MHJTTXNFTExQNUdMdCs0d0hSb2d0NDFWaVNoMDQwRTRoQVhy?=
 =?utf-8?B?QnYrYXVaUHpVLzE4VVhkRHRKaVp4c3NPNUM5TzJVMG5JcGdhbE5SZkpCalRz?=
 =?utf-8?B?Tm55WEZ0YlNiZ0VxSEMyYzBiV3J3OHZjMDNPaGV0eStvWUQzaEhuNCtWUlJt?=
 =?utf-8?B?WUMzQXdvVS9pM3N5RHRLeHBzanIrcGlYQW83eE53UVh0N3ZNN0s1QnZTekND?=
 =?utf-8?B?R1NaOTE2TC8zVENyZC84MG9QUTNKTHBGR2ZtV0ZWR1pSRXhwcU83eUVyMmRZ?=
 =?utf-8?B?ZXFZRHdPam8rZ1RNK3Jqb3ZKNXVhZnVWRkRvLzJmanN1L2NEU2FidXVhWmgy?=
 =?utf-8?B?WUlBMUIzZy9ZTHpCVzREVEtZK3FodEttanIxZXJyYllGd0lVay9xVGtvRVFo?=
 =?utf-8?B?Z1kyZmNmM0RBVWZNR1g2VHdkK1ljVVhEOFIwVW1BWndoRkdKY1JGN2duL1FM?=
 =?utf-8?B?NlhmeXdWK1Z5Wm8vNG9OeWVld0RpWDlHZmoxNzdFWkdkL1hKbEQwWEZub0JI?=
 =?utf-8?B?WFFKT1BsMkpkbWdZMWdVTktnVDFvRGlCdy9rT2NxRndNczgvdE5KejhIK0tE?=
 =?utf-8?B?RjY4blJrRDEyVUk5Ti9OZGZzNDlZRW1LV1ZJRHJzQkg3eG1sYXZ5SmpPRTVJ?=
 =?utf-8?B?aElLd0dxQ3pkOEp5cVoxYlUwK09sZ1BrenNtRlMrQXViTEpDcndpRjVPZC9s?=
 =?utf-8?B?eElBWEVqaUF4Yll4cWVQRVRQZ09UL0RYMmFkNmIvbHF2RURsVWhlQVp5ZVpr?=
 =?utf-8?B?bG0zeFRScTBVZ002aVR5UDFiZnYzYWFaQXdlYy9iYjVaaUQwemhSSGg5UllU?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XzOpNSO3RShObokvrHvSqa8d"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec26177-3fb7-402d-070c-08dcfe4c50a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 10:18:10.3182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9nIiQuS9MQAgxj3UhUqoSKNu1TRUsq46hieMWnLoPsY0JeI5a/JkoQz3iVDN7bd4/fo7Oae0AjAXw8pntuhdpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB7201
X-Authority-Analysis: v=2.4 cv=CYNa56rl c=1 sm=1 tr=0 ts=672b4266 cx=c_pps
 a=cRjhvmALJ7+JJty0Yz2dHg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=XYAwZIGsAAAA:8 a=r_1tXGB3AAAA:8
 a=-wnHUmGVWltVZzVUIaUA:9 a=QEXdDO2ut3YA:10 a=mF5ayFQRYOIQQG1wrwcA:9
 a=FfaGCDsud1wA:10 a=E8ToXWR_bxluHZ7gmE-Z:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: d1-Bx-x0AoTS3ah2FGG0Y_o9N9AJyHjU
X-Proofpoint-GUID: d1-Bx-x0AoTS3ah2FGG0Y_o9N9AJyHjU
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

--------------XzOpNSO3RShObokvrHvSqa8d
Content-Type: multipart/mixed; boundary="------------X0n8iUjCyOyHzDQGH2EjMNa4";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Conor Dooley <conor@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
Message-ID: <fd3d9f34-0e8f-44a1-ac21-2ee0c49d65fa@imgtec.com>
Subject: Re: [PATCH 08/21] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com>
 <20241105-sulfite-justness-d7b7fb98905c@spud>
In-Reply-To: <20241105-sulfite-justness-d7b7fb98905c@spud>

--------------X0n8iUjCyOyHzDQGH2EjMNa4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/11/2024 18:03, Conor Dooley wrote:
> On Tue, Nov 05, 2024 at 03:58:14PM +0000, Matt Coster wrote:
>> +    / {
>> +        #address-cells =3D <2>;
>> +        #size-cells =3D <2>;
>> +        interrupt-controller;
>> +        #interrupt-cells =3D <3>;
>> +
>> +        gpu@4e20000000 {
>> +            compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,=
img-rogue";
>> +            reg =3D /bits/ 64 <0x4e20000000 0x80000>;
>=20
> Can you format this normally please? Drop the #address/size-cells down
> to 1 if you're against having 0x0s.

Sure. I thought /bits/ was the "new" way of doing things, but I'm not
really bothered either way.

Cheers,
Matt

> Otherwise,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
>=20
>> +            clocks =3D <&k3_clks 130 1>;
>> +            clock-names =3D "core";
>> +            interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> +            power-domains =3D <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
>> +                            <&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
>> +            power-domain-names =3D "a", "b";
>> +            dma-coherent;
>> +        };
>> +    };
>>
>> --=20
>> 2.47.0
>>

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------X0n8iUjCyOyHzDQGH2EjMNa4--

--------------XzOpNSO3RShObokvrHvSqa8d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZytCYgUDAAAAAAAKCRB5vBnz2d5qsHzr
AQDfS43acJTUXUbdGlJ8J4kHjf2Zrm9HbaNydKK+u8tkmwD/e+dJS5to0CLMhrWAySvYatJfw3Az
CXv/yad+diZ6EAo=
=MM18
-----END PGP SIGNATURE-----

--------------XzOpNSO3RShObokvrHvSqa8d--
