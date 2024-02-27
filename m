Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56494868C4F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C0D10E8E6;
	Tue, 27 Feb 2024 09:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="C5sevCx1";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="KVVJ85mQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53FC10E8C2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 09:31:52 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41R8u9BG015987; Tue, 27 Feb 2024 09:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:mime-version; s=dk201812; bh=S65yxxeBWkGGmdVnq7hzU
 VyJJNCJliz5dTPTf1T7UD0=; b=C5sevCx1+v7QGYWU5MHLn1AT3TMRJ6kQJfsGi
 EP89Nvr2huv5VxAkZEiPL0LF5hgGZ/Zxrzh1QVFni13l4qy/jTE1NwYs8d4/0sde
 CCNLhWHbRcTQZT/RpdJWD+KNIbyspfTD/qWdIsdRl84ftLqX+2YKvN5HNpdaoGlS
 O4Djww/GG9EF5OggxAC27dRuCm1ZgtKSlM+JFdArPrWoE8C6iHcpmyFS0eeLXRm/
 SC0r8al+7LuGw5m1x4n4lUY4Djhpf74r0CxdcWFkM0LxIpIrk+X9A4ngd4Ac07Ca
 1f/VVkoCtN5xhNzIRKsGvajcegHybBMiZKjR/bypyrOZTkXtQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3wf7kstcn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 27 Feb 2024 09:31:25 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 09:31:24 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 09:31:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdaNq2ZM0da7PH0EXPiKvI94kDJZg9wsa9/YpVwaVFgcN1jjuJ6Vw8XI9WQ055lLObxYNoRX2fd0gx6ECYy9Fy20yH+UeZOxv8wqqDMSFwmzn+ufHf9y4SNjKBUoKRfdgaksc6GbCVBWQdVgVGNEpn3obhmA2bRFrJwhEkCfJxzv/cb/TsbNknIy4osT9+A5MQBCxrDlO6aLT/x+gP9l/cnqKtaJjPiSON10U3rhidtkAlEDs3k2jswGZmIT/3tsvJlswoHdWU1OxxwS1jyK8QNgsubkTmnBytToE0l9zffn8900P1Jvlg1iJqvmjgLGIiVxdb6P7TKL4DD0rHCHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S65yxxeBWkGGmdVnq7hzUVyJJNCJliz5dTPTf1T7UD0=;
 b=CwTbaKPbwKf1MItiTGpIKwxAnZjh3QuO8b9zJrUVatH0g6rIHHevEQ/B3EA6XWX8sf7mIpYUZt4idJCjOR04mpb1iTFmycSCUPHD4WUAiYdF0f6kJUWNykbT8Qq8S3buBChEXeIWFX+dpe9Vs4CAYleH1RDhO9m7NkEEve3G+2PhDvnwfUE59iIyH0ztI2za8bD/eIG7gKqyLa5zf15uA0gFjugQg1EXMQuRkGLRlqm1/qKTSQNSE3aTIv4g72FUF8e6BZ6J4zorXcqn+Z+BkhS693htRqBfKcQMtOs6+W1cMcp0BNf9zIy5RRgZuQpxJZkXAz4TRF/dJl6MqdmcoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S65yxxeBWkGGmdVnq7hzUVyJJNCJliz5dTPTf1T7UD0=;
 b=KVVJ85mQ77JCdUcJNl2qI0WMq16CVL7xFPylGXrraXBl1IYU0NyD78Ju8vc6NAC3m1mq505seuNlzkgw5c49KBgUUpPBEno0Fxk8TZUK7rMR8n1+CJFkdteNBVupnOwZcaKDFB8zFHW3t3tMiv9/Pa2H00YBEtni7e13kDwka4E=
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::5)
 by CWXP265MB5491.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:159::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 09:31:22 +0000
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4b5c:d51f:da10:2626]) by LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4b5c:d51f:da10:2626%5]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 09:31:22 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Adam Ford <aford173@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
CC: Adam Ford <aford@beaconembedded.com>, Frank Binns <Frank.Binns@imgtec.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
Thread-Topic: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
Thread-Index: AQHaaV+5Tgg+LkpwAUmauR/SMCWjxw==
Date: Tue, 27 Feb 2024 09:31:22 +0000
Message-ID: <39aead3b-b809-4c9c-8a5d-c0be2b36ea47@imgtec.com>
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-3-aford173@gmail.com>
In-Reply-To: <20240227034539.193573-3-aford173@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB3404:EE_|CWXP265MB5491:EE_
x-ms-office365-filtering-correlation-id: 2d28296d-70ff-487a-97aa-08dc3776dc7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D7IEqc8J9lRLj499qLRSLqJfr2RUzrDvcU67wuK8ZRfQcHfPH/jYxFpbxIjlRAetWnpEu9/w8CeeQ3YnaxcWsPC3JOaNsFftSHs0BK7AQealzhLNsw3OMbO28G7IWF4wPK6OiAxhuH++usFWTFq4wOkDKS8qJu3aecDOq7seN1H+a8C4sXVHfXN8FlggMi90rwi18ALgSFGi0lbE4pJAokPCzlmRscOrDeh+LlE+4L1MESnm2EdDeHrL8Q388BIMJCWgQ3HIDWgGeTZLdMbRZb1QITTg2ebpu69UG4f6LDmLlfsmm2nrQVHkwT6PB6/Tp1OAstYSpOd0gX1tFjfTYPyG1aqYv5Vxbt+q+xsrksBSnk+WLkSoCtT9CqJSqeiewn0xikQbP/a4eUlghxMlgwZfw0gAc9p2kF4vPH9u2fVD+QMUyAXNb+K/MGOpp2AUjvQaRQk3yQAkvNcfc+kq+ruf8H18HB8kd2LBE3olLEy8mzRCyVCi7cOec2VYRrMEnePW/rzBf9xmw00h9BwLiPCBX4uSvtlI/ZZ0W/sgJ3XQGUES09kdir4A2RddUoDWO0HiYzJ7f+OFWE0Hy/ChRs0IvuH0HZv2RE3C3ZxKBcL4vrgpn+Uf95J6Uztay6koGKMVYTOUkC4a7BL1aV90lBsLcsPlalKc87G7/yc79E/FhyRZ3h6S11wIALqScbKhiKB87nHfkzcXGIMAo7Wjbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGsxWHJaRkRpWWtsOGJ2ak40b3oxeDZTQURsN21EZUp0ZzZKRnFVZnBobjUx?=
 =?utf-8?B?amRvTko1MExUMGRvZmxkbWV0NVA4ZHFDVGlFVFZ1dlZXRE5JUVhzVUM3eXM5?=
 =?utf-8?B?YS9HUUdJcGdFb1ptZDZQVDA2by91OStlZEtOTnBiU1RGYkNKdlV4SnMwK3Br?=
 =?utf-8?B?bTVRUVc1eFd4VzhydlBFVUpPSjNhamx4MGd4dFZUMjR3RHZydlVOU2dEcWNh?=
 =?utf-8?B?bkVuRUQzd0YvUW9QTGVTdDQ4VG83MWdrZnNBcmNPMFZRdnZGTFB6cmdiUkZt?=
 =?utf-8?B?REJlU2ZnR1lrZ2dma1pZRlBDaWdjOTAxS3JrVm1QWjNNRzI3ZU9HQkZnVWdw?=
 =?utf-8?B?ZWdTSXF0SjhER0tzTFhoYm1mS1p2dEl0UDhNU2RORnVHcDQyMklOcWd6THlq?=
 =?utf-8?B?U1NRZnNJQTdBU3VFbFA0eHBwYXg0NmcrUDV2NEMvTDNGaTcxNjBIWVF0VUU0?=
 =?utf-8?B?eHYwZGM1bkxBMkhpMTR3TG51dUgrUnJ1ekd5VGhlWXhBRjI2M1ZVVVdPTVdi?=
 =?utf-8?B?cllIQzB4Q2JJUFF4NWMxMUZIaStDcGVmcjJMeE1aTktxMmp5dFdHSG15ZXQx?=
 =?utf-8?B?a3R1L0kwRVBqdmFQczFxY3hVWDd5TFY3eFVDMldtRVBvQ0tGK0xIZnJaUmVY?=
 =?utf-8?B?TVFPaTF2RlFiMVdCQkNaeG1YNGFNZlppRThjRlFOZW9XbjA4Ulh4RFZVSEtT?=
 =?utf-8?B?amVzRnpqTnhvcUluZkhHdlpaSmhPdnBCb3pvN1BkOERZc1Judlh4K2QvdnI4?=
 =?utf-8?B?R3dwOG1CR3hPakhUamtZYkRlaTdzUHFIdVhyVmJDZkRKS3FFR1hCVE1ySGF3?=
 =?utf-8?B?cnFtdXdJcVErWklOVkUvandMNGRSbW9zakVmcEJrcmp0QVpSdmYrTUpTT0hY?=
 =?utf-8?B?RVBxcDRMN3hKaVVOZUd6dE56UlBpOExtcGQ4MHlwZVN1WWFhaksvY3M1TjVG?=
 =?utf-8?B?a05NUDhkbitMUXI0b1d6a2drNmdTeGpBV1dza2krMWZObFI0UDJjeE9CTW14?=
 =?utf-8?B?NUI1dkNzS3VjQUMrZnhGZVBCUDkrRVlxbVlLdjlsQWZTK0tUN1JXYTRYcWsv?=
 =?utf-8?B?WjljQkRiVzBqZW9aMU1NeGxBdHNyOWx5MVM2eUEwVVU0bG0ydG5vL1pSN2t3?=
 =?utf-8?B?Q2RrTUxLRWlraXJvMkxhMHFPWm82aDBKODhkbkxHOUd5TjBTQ3JyVVJtMkVO?=
 =?utf-8?B?U0h1SGpKMFlIMjBVNVQyeUcySE5jckVGbkJPM0ViYTVKeXNKSC9qU2NzVUNB?=
 =?utf-8?B?emloeG9xNGhzYXlFTS8yOWZ6SXBRUkgrN2xJazJoSHcwLzdZNDdZejA1U3Bl?=
 =?utf-8?B?V2FkTWRtZlBvd0IzeGFTditzZForbW1xTHRnbEw1YzNKWnp4c0xvWDJkY1BJ?=
 =?utf-8?B?ZmQ5U1IrZkdMZm9DSUwxVVlwNU5FeFk2eEUzZEJHc3gvalgwZnNHU0JVNHk1?=
 =?utf-8?B?VG5YMGVZWWdROGZmMDdxWjNLUUdCblZWTWNaVElOKzdhb0xnQjBoR01obEZC?=
 =?utf-8?B?Z25uQ0tXRzBGVExmVW9pQjhlK2paY0ZaR083cVZndk5xM01qZDlURDBHbndl?=
 =?utf-8?B?empmTDZHSmYzVG95dXdXejY4VHFCRW5VTEZIcGNJVlg2K25vR1hlK003dTlY?=
 =?utf-8?B?dzFacGp6dnNFUXlETjVpK1VPc29NKy9MallRUDluR3RJQisyZEdIZmJmVHZs?=
 =?utf-8?B?ZThjdGVMTmdVQTJscjRSdUxGaUlORC9rT2xNRENBTjg4Q3RVd0czYitCazBw?=
 =?utf-8?B?MFhjODZPa0xLbXA3UEJlQUpEOVFPWFJvRWQxQ3REMHd4emtoVFlwWS9NRXln?=
 =?utf-8?B?aW9wSTNOdEJIWitESXZFemFCZlRHVDMwNzE0NkVucnpWZTJ3elNINDFnSjVx?=
 =?utf-8?B?TUYxazNLNFZBTDJHTGR4VXUvQndQS2FnKzk2NFIzSmxvUVlNWmQxR1U4REtQ?=
 =?utf-8?B?SEx0MEcwd2xxMk0rQSszbytJZkJ5Z1JzT2VTR2FXQzhFdW14SndWdE1HeGRI?=
 =?utf-8?B?N01mNzlZZnZBZHpTdk9UM3Y4aHNJbUd2R3NEZmVSL0tjcE1rbk1EakFHMy9E?=
 =?utf-8?B?VUh1ZmdyTDBPQ3VySEZ1TStqSnJlZlZ2VmdKcHlLcGN1VE9WMDZzNFIzMnp2?=
 =?utf-8?B?NVp6blBZSGNJVFpmWWFiVWcxbnVraHF3OTBQVHJ0aDUwZ1dLQnhVY3FGbGtn?=
 =?utf-8?B?TFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YyZSrtIgnQPAf68GePbjaRAS"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d28296d-70ff-487a-97aa-08dc3776dc7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 09:31:22.4114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPwlsEuXLeKEqkk8icMlVH45rHaPxyCzzbvVK6k+aGpVhZ7+viwBrGuSqWZpJgYWlLy2K4mJCu3tGM5iq9//hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5491
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: oNxJ70SX80QJruDLGZEtQuHb55g9PSAC
X-Proofpoint-ORIG-GUID: oNxJ70SX80QJruDLGZEtQuHb55g9PSAC
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

--------------YyZSrtIgnQPAf68GePbjaRAS
Content-Type: multipart/mixed; boundary="------------EfAO01f9Y4wfebJn0Zgur0Tw";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Cc: Adam Ford <aford@beaconembedded.com>, Frank Binns
 <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <39aead3b-b809-4c9c-8a5d-c0be2b36ea47@imgtec.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-3-aford173@gmail.com>
In-Reply-To: <20240227034539.193573-3-aford173@gmail.com>

--------------EfAO01f9Y4wfebJn0Zgur0Tw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Adam,

Thanks for these patches! I'll just reply to this one patch, but my
comments apply to them all.

On 27/02/2024 03:45, Adam Ford wrote:
> The GPU on the RZ/G2M is a Rogue GX6250 which uses firmware
> rogue_4.45.2.58_v1.fw available from Imagination.
>=20
> When enumerated, it appears as:
>   powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58_v=
1.fw
>   powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)

These messages are printed after verifying the firmware blob=E2=80=99s he=
aders,
*before* attempting to upload it to the device. Just because they appear
in dmesg does *not* imply the device is functional beyond the handful of
register reads in pvr_load_gpu_id().

Since Mesa does not yet have support for this GPU, there=E2=80=99s not a =
lot
that can be done to actually test these bindings.

When we added upstream support for the first GPU (the AXE core in TI=E2=80=
=99s
AM62), we opted to wait until userspace was sufficiently progressed to
the point it could be used for testing. This thought process still
applies when adding new GPUs.

Our main concern is that adding bindings for GPUs implies a level of
support that cannot be tested. That in turn may make it challenging to
justify UAPI changes if/when they=E2=80=99re needed to actually make thes=
e GPUs
functional.

> Signed-off-by: Adam Ford <aford173@gmail.com>
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a774a1.dtsi
> index a8a44fe5e83b..8923d9624b39 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -2352,6 +2352,16 @@ gic: interrupt-controller@f1010000 {
>  			resets =3D <&cpg 408>;
>  		};
> =20
> +		gpu: gpu@fd000000 {
> +			compatible =3D "renesas,r8a774a1-gpu", "img,img-axe";

The GX6250 is *not* an AXE core - it shouldn=E2=80=99t be listed as compa=
tible
with one. For prior art, see [1] where we added support for the MT8173
found in Elm Chromebooks R13 (also a Series6XT GPU).

> +			reg =3D <0 0xfd000000 0 0x20000>;
> +			clocks =3D <&cpg CPG_MOD 112>;
> +			clock-names =3D "core";

Series6XT cores have three clocks (see [1] again). I don=E2=80=99t have a=

Renesas TRM to hand =E2=80=93 do you know if their docs go into detail on=
 the
GPU integration?

> +			interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains =3D <&sysc R8A774A1_PD_3DG_B>;
> +			resets =3D <&cpg 112>;
> +		};
> +
>  		pciec0: pcie@fe000000 {
>  			compatible =3D "renesas,pcie-r8a774a1",
>  				     "renesas,pcie-rcar-gen3";

As you probably expect by this point, I have to nack this series for
now. I appreciate your effort here and I=E2=80=99ll be happy to help you =
land
these once Mesa gains some form of usable support to allow testing.

Cheers,
Matt

[1]: https://gitlab.freedesktop.org/imagination/linux/-/blob/b3506b8bc45e=
d6d4005eb32a994df0e33d6613f1/arch/arm64/boot/dts/mediatek/mt8173.dtsi#L99=
3-1006

--------------EfAO01f9Y4wfebJn0Zgur0Tw--

--------------YyZSrtIgnQPAf68GePbjaRAS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZd2r6gUDAAAAAAAKCRB5vBnz2d5qsFgg
AQCiNxLMpvBRmyPQFb2pfg/LcsovWXmpGMrp48m6eZryuwD/Tvm6H7MEvMq1g/rWxSTOCPEoci2t
FYDgBFHHQserRA4=
=Xtw1
-----END PGP SIGNATURE-----

--------------YyZSrtIgnQPAf68GePbjaRAS--
