Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3126E8D6332
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 15:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AD110E694;
	Fri, 31 May 2024 13:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="D6Xe2XbU";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Pz98Oglt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5334410E7C8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 13:37:48 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V8P2xd004066;
 Fri, 31 May 2024 14:37:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=8YYp0TgROX4b0+yeBAUosWoOaj4P9FYB644toVdyFuk=; b=D6X
 e2XbUwimJeTebYMaNlSWskpRKQ/asBCyGmcZ2w25zZnBmMefXLOTbHwRyYDt8g25
 ieQL32JtCfgyg22v6JaC6BYWDZFdarSbwyA3LAwc7cE7I/4auRG3K5bDzgcpj+56
 vQmob/iFeMCGLjLA+S9OvNVFXgf4IaVkOhlQzt/vuGHKA6GWMCRfeSW6xizv2ygH
 35ll8WWcKrx1EzKu42L6QyFIJ51U0BbsEtFph2NHUeEhfJxfUC2LdG+AJcquoj1g
 81Y6kFtuQ7MI3FO9iyC7+OshD2Dx0sSLXACkCpUGCJI4ZTuFJyZlG52/ijhIyUqf
 IWUjPE+Ax8fQB5AHMYw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3yefsp2bsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 31 May 2024 14:37:33 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 31 May 2024 14:37:32 +0100
Received: from CWXP265CU008.outbound.protection.outlook.com (40.93.68.6) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Fri, 31 May 2024 14:37:32 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lecvw0jvBJmSJnR0+8SxT96AeFiKM68xrOyUPe63y0ITCJ0zFxFJ830Iif/7AWVNIgcNIfTffgsM1WoZLQOAXejWmiblj/yITVImVnkMNyNLidTUIwyiKsmlPlB08iNLebpHmf9jbhrx/MmWppgCnJuk5qzPsGXiA/xtCCGOvFrDyFNIUu/O7jmzp4+v5y6WWVnXIA4eotVe+ecYMQz/MbBMOcUi5yGTAnVAW2EnwoDmuAHXsNuYQTfLBMYOijCx8WLiv1SR88t9RBJlMnKBa4M+RuETksUhXHKfClzC6QVpyARB4ZnkT8jvOb21TAii/i11A8QeN8YCXOtBok9gYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YYp0TgROX4b0+yeBAUosWoOaj4P9FYB644toVdyFuk=;
 b=EqX2X5GkcZkOOXkEb3N+T826mw6fFVO3mkFeAAeVhvI+1oCv1eyhafId9lMd1njcp6rlJChwL61UWBZ4j8r8OVU8FceDMPLY0+SzXvxI7+Q7G4OAEU3exUzdivkll/3kwjslyma6h9rnEJHbX0rLZkiT+r1NgZrq1SmQZTwg10UDtILNQOmCFU7wGIWp85qfnYw5NufGLj1ppOjCgqawloXbGpIB0cqen1R7a6FziR87/Jf6O+dtQO08s0sBem/GPDbP6iqMnVc/2ro3pod0Q3q9sP2W1BOAwe6bfmC1wYkNNyIi0wI3VriDnoQLxcCHI2ukRi4zMvS++HY1je0T5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YYp0TgROX4b0+yeBAUosWoOaj4P9FYB644toVdyFuk=;
 b=Pz98OgltJsObtXJj6a4wscWZqCiXt6+mV5tkBfQvNQiDNpiqQCRfDNjkqfDXdWlmiDgX0r7uRUd/7ZMJpFWeo/hdU3P4zYD5yfILrc2B4NmQjdw68HUa1XDNUVSZfaRP8SDKsMysGQ45A7PXpY3vLCZcK6fYPw5PchH4ykECD88=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO2P265MB2941.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:173::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Fri, 31 May
 2024 13:37:29 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::db1a:5e96:699f:8757]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::db1a:5e96:699f:8757%6]) with mapi id 15.20.7611.030; Fri, 31 May 2024
 13:37:29 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, Matt Coster <Matt.Coster@imgtec.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "aford173@gmail.com"
 <aford173@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "wenst@chromium.org"
 <wenst@chromium.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173
 GPU
Thread-Topic: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173
 GPU
Thread-Index: AQHas1+uiLvO8xuIYU6nvMbpixGlAg==
Date: Fri, 31 May 2024 13:37:29 +0000
Message-ID: <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-4-wenst@chromium.org>
In-Reply-To: <20240530083513.4135052-4-wenst@chromium.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO2P265MB2941:EE_
x-ms-office365-filtering-correlation-id: afce45cc-91ba-46c2-e386-08dc8176d10a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|366007|7416005|1800799015|921011|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?QTlIcnNSVFBNOHFWRmJjbElyNXJkRTFTUmsrTmNpYnhuV3UyMnFQb2E1V1Er?=
 =?utf-8?B?Q1NiSi9oeWlUR0dHdkxEekxTUUh4ZUpoVUROU0V5OWpjRHlESEs4NkdjcVR6?=
 =?utf-8?B?T3pRSUtNdTZzeWttKys5UWhHVTRoMUtFR1NVNUwyVVJaRmluUEF6Zm03TExU?=
 =?utf-8?B?SVFYb042WW1uQ0p2d0FlYjIwNWJCSVViNHR4S1hpUWY4aDBBSWVwaWV4S2Rj?=
 =?utf-8?B?eHhtUDhXY0syeE1OclZtTVlTYVB1Tjd3bnFDUFltWHVBRWJBYU1TaEQzaTh4?=
 =?utf-8?B?RWpxN1J5NGltMFlZbHYrZk1ZNnNhOWJ5SlN5UlI4a3VYT0hkQ2FSU0RSNzVt?=
 =?utf-8?B?NnlZSCtFd2pHdHBYMW1Jd3lYS0l5YkdXaHFZOGJvdkVlKzhSRGhBbG9FOGpJ?=
 =?utf-8?B?SXN3dTBna3JVa0RDS0NmeCt2dXppdXZqUkQwcURTUkx2OVpoMEZLNVFEdU1M?=
 =?utf-8?B?cmJDcWJTZEFuUlZ4OHFEdVFJbWxlUnMvdWpBWGgvT3FXL1pUL1BxSTRQek1s?=
 =?utf-8?B?NjQ4N2JWQVJjUGwvenR6di9lY00ycG9Fd3JrcVN6Z3FCOXM3YXN1a3A4clhB?=
 =?utf-8?B?QXJkaDVZKzFhdXdaVWtMOTlMcUlsSzdjckFVanNkTi9aMjdlTHR5RE9CNXJy?=
 =?utf-8?B?Q3hqa0pUK0VWd1d1ZGJDUmo5SkpMY1ZObGRxejNMdEljRWs4Slo1dEwvMnBL?=
 =?utf-8?B?YWRwTVpxeml3OXVuOUg5c2hwSG8xdXQxZWxiUU9IbHpXdXRaRWJjOGxleDJo?=
 =?utf-8?B?blZYMXpmaFZ0bGh2MTVNWGdIQldKM0FDREg5bDA5TVlSTk1XYW1OYWtoWUhh?=
 =?utf-8?B?UmRneUR1aVpvenpUQ1JadmFKWTV5M3RZZnJ1b3VralAzN0VkMmpUSzZJYklT?=
 =?utf-8?B?VVhnY2Z0VnFtMDVqb1k1Z3NyZDV6d3FTUkRmL0xzMStxZGJIVWxQb3M1Y2lx?=
 =?utf-8?B?VjBEUWVWR1hsRVFLeXhrOHN1SUh2ckJocHladVI4c3hHdWx5Smk4dXNyUC9I?=
 =?utf-8?B?Rm03TlVVamNyUGgrNFJCNDA4NGJuUDhIQ0Vsck9xYUlUSTIzWitwT3RmL0hw?=
 =?utf-8?B?SDBuTElqOHNUMUdMU2FEbEVORFprUFozaUp0d2g3YmlBSURDVy9xRTA1aHRZ?=
 =?utf-8?B?OEZSR2FEUTdvNXNaL3ZpRlFwRzg2RVp2NDVJUmFCcWhMVTV4SHRzeTdIQ1k3?=
 =?utf-8?B?MldtcGVtMWtnSm9rVlJDVXQvdTZyd3U0MzlDS3RDVHBqdVNFOUtvb2pWZG45?=
 =?utf-8?B?aU1ua0huTWRkRVR6QkhQQUFmMUdpYlpTRUFiM010dldibXhFam1jZ0xSQzBo?=
 =?utf-8?B?TFNQbHNrcnFoeVdBRlVka1F1TVBnOTFNTGp6WklmUnpvejhXcFJoNEpMeWRO?=
 =?utf-8?B?R3BaOGovT2NUQnVtSXdhMVV5a1hMTmRHLzJzZU1LWmx0VTlQQmlZNnVvMUZy?=
 =?utf-8?B?SXB0UTZGTWEyY0xUVGpPczJrMng3OGxGcFNtdSt2d0wyY0YxVEs3WGpKR1NP?=
 =?utf-8?B?V28xOGFkR2MvZHlKcmhKRkxCY2JtaXZUV1NvQ3VPQzRBcXhPN2xtNGhDOGVU?=
 =?utf-8?B?VkRLcmRPUHRzTTRmMG5VN3FpSTZaM2FEWUhyL1c2citvY2gxUEJHWEdjdnZX?=
 =?utf-8?B?akZZeC9HSGppM25SNDdyVkZkSktDM1BYOFh2RmZLaW53dEF5SnBpd0Nla3BW?=
 =?utf-8?B?RUx2eTAybHEyZVBMS3BoNmJzdVNWY0NXREt2dTQ5am9sdjRvNHR3cENBSVZW?=
 =?utf-8?Q?OcFbcAtEy2IfjHvK/c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(7416005)(1800799015)(921011)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3dNbWVoYkVYd0lXMXdaVkxnbXNFSlpGREVGTkptNkNEWDJYY0FQY21HUVFT?=
 =?utf-8?B?ejhWZ09zVTdSQ01nejljYWF1cDlIMitGdWdtN0RFOERCQVcveDFRNmxicS8w?=
 =?utf-8?B?N01PcTNMSUxlbWg3dzVlSXJsY2RJbUFSb25HSHFCWXgxRWd6R01rQmRvRHor?=
 =?utf-8?B?azdrRW9RRWJQUXJPMWpaUG9VQ1lka2tzamsvcmwycStMaklUWkJ5TEZtNXFX?=
 =?utf-8?B?eFJsb0FoNnVyc1FhczFNQkpzQ2FtcVpNa2pvendPOC9PeDRVQ3dLMGdkM3NN?=
 =?utf-8?B?aFhKL2UrLzRHWlpYUEYzRGs1blRSQlZVdWQxUG4vZGVYY3B3LzB1UktSSlg4?=
 =?utf-8?B?aFNaK2VQL3NmVTBYT2JGRjBMZ3RWNXh0Y0lwamVHVklsWGRrOU1sV2c2QmhR?=
 =?utf-8?B?ejJiZ3JiRHJWN1VmRU5LQTlxZmtyaGhjcEpLMkpSbTlieDlGaUxWU3lmeDFy?=
 =?utf-8?B?M0wrR0orZ25aMElTZTVwUis4NnlRUG9mTXVpNXE2Rks2QlBtOW90WWVaN0t2?=
 =?utf-8?B?dFVCVS8vc0wybTZ3YTFIcXk4WTRQbEhXaDdqVm5ja0JBQ3EveWdycUs4dXlZ?=
 =?utf-8?B?d3VsU09NaWEzVHdKUStjT2ZZSW1XSXpMYkVUMnBKL25kbDk0VVBQMFdrYnFT?=
 =?utf-8?B?QlUrQjhzZ0VVMHFKZlh1OG55V3loeGs0U2QxaXdlVUpaSDVVZ1FsRm56Z3VH?=
 =?utf-8?B?VE91SVBpVnRGQVI4b21nSHZ1UDUybFVCZEcyZ1hvVVVSaVZKcWJDMEJndHZs?=
 =?utf-8?B?T28xTkhjemJXdzZjbUhGUFkzSE9uWUJjcTZkbmU0NVUyVDhJSnZiVUdXQ0VE?=
 =?utf-8?B?KzRZVVIweHNEbGVXK3VLZ3NxNDNZVDZVY21SWGdQWDRwejdvVkN3SzZPS1hs?=
 =?utf-8?B?VU5YQTdKbjUzZUhzUVo5SWI2QVJzaWNyaDM3VXQ5VXh6cVRHRE4xTGpSNnNm?=
 =?utf-8?B?MzZwTXUrUnZEM3BtTXNkS2NGODd6OHUreFZIMnZmYXlGUkZwZVk1WlRZaitk?=
 =?utf-8?B?TmJtSGcxbkdlTDNCNHErUVNiWVlpK0o4YnNTNWhzc3dFUm5xc2crdDJNdHBO?=
 =?utf-8?B?azVNakZsMUdSaHRYTjUyZlA0a3RxV0RUcmdoQjZKQlhLQ1UvVWZSaVdVUnpp?=
 =?utf-8?B?WWl0eTFFbkJkdnhwVjg2M09vNktQaWhBRk9vcXRvYmhuNVIzZVpTT09WVXVE?=
 =?utf-8?B?eHo4Y2ZORmxLRUlCRWNzM1lYNW1hNThxWXpBWXo0Z2srSEhMKzJteGdXSHhI?=
 =?utf-8?B?SEFPd1VmUW44RVJScWFiSWlEd0ttMisxcjlSampiWEdTUzZCeGRBSmxBbVBX?=
 =?utf-8?B?QWRCYytHMUNkVGo2RHI2RnlsMklHQmtmZmx5QW4rcnN1b2NoeDhxUk5YWGk3?=
 =?utf-8?B?ejFab1ZBUkJmTWdzZGhYOXo3K2UraEVJYnh0TWZ0dVNOZDVaWTRnMU93eWcw?=
 =?utf-8?B?NjhMTHE1UktpM0hBWlpuZHlWWDc5eG9wdS8rZ25ob28wdE9uSWloZkVmY2FN?=
 =?utf-8?B?b3Y2K1pMUXdOTGs0UlBXNkpHT0Q4YjArVnFJaWxtQXNtOUpLcVpsZytTZmNy?=
 =?utf-8?B?a3RMTmREQmN5ZWpJa050aVNLREQrNXNkZ0JZRjlzMUNvZElRWHA3dzgyZWph?=
 =?utf-8?B?bXlQNWtkR1YxTTRXbUhjVlhVaWZjTkhJL0U5dXo4eDNYVzkyTDhPMlV0S3ov?=
 =?utf-8?B?Q0ErSmUrRnBpVkY3WmplWmlmSC9QRm5xSXNXblNvRHhpVFhUUTY4TFh0V2ZG?=
 =?utf-8?B?c1dpOFVlRnBPa2Z4ZUtHRStrVDQ5YVE2M2VWRG0vMVRaaW5pWDBXV2E2d2ta?=
 =?utf-8?B?THlaTC8zSWdvLzFoSElIZ0FwU0xKdnk4LzROV3UrUVRNNFRDY3ZVRXdGRHox?=
 =?utf-8?B?d3Juc21GQ0syMDVnT2NCRnNTLzBDOTlLRHVVQWtSTGNzaUtOZ0tTbzVLMzlG?=
 =?utf-8?B?TnFpWFIybTNCV1JpcjU2NkdNN3BBWkVKVVE1bVQ0b3V1WElabnIrczdIYzZx?=
 =?utf-8?B?dWxVcGRFRVVMeUw4V2lhR0JhNmVyL0Z3eFFJaXRlOWc3Q0Q5NVpibHpSQjZt?=
 =?utf-8?B?a0xreVBVMnc4dnc1ZnYyRklGWDU0SjVMSmppWEE2UDRLL0tkb0pZM2lnNG5m?=
 =?utf-8?B?RWNhWUc5RU9JZmVzU3EzYmRuQ2pqaG1aMWtYWElTZXZLS3VrUk5na0xYL3ZH?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0345AFED463A2F46833E693DF82B75A0@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: afce45cc-91ba-46c2-e386-08dc8176d10a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 13:37:29.2933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+4v20bBxPpy/EWoUHUvyNh1iEWNTpzoTABanZWTWBeeJqMVr1IcfNrOMlKImvksE5uSq+Bs+kXaoRog4psiyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2941
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: bpySeVRPUdcSrWyGxdncvlz7XBfM48oj
X-Proofpoint-ORIG-GUID: bpySeVRPUdcSrWyGxdncvlz7XBfM48oj
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

SGkgQ2hlbll1LA0KDQpPbiBUaHUsIDIwMjQtMDUtMzAgYXQgMTY6MzUgKzA4MDAsIENoZW4tWXUg
VHNhaSB3cm90ZToNCj4gVGhlIE1lZGlhVGVrIE1UODE3MyBjb21lcyB3aXRoIGEgUG93ZXJWUiBS
b2d1ZSBHWDYyNTAsIHdoaWNoIGlzIG9uZQ0KPiBvZiB0aGUgU2VyaWVzNlhUIEdQVXMsIGFub3Ro
ZXIgc3ViLWZhbWlseSBvZiB0aGUgUm9ndWUgZmFtaWx5Lg0KDQpJJ3ZlIGFkZGVkIEFkYW0gRm9y
ZCB3aG8gc2VudCBvdXQgc29tZSBEVCByZWxhdGVkIHBhdGNoZXMgWzFdIGZvciB0aGUgUmVuZXNh
cw0KdmFyaWFudCBvZiBHWDYyNTAgYW5kIHRoZSBHWDY2NTAgKGFub3RoZXIgU2VyaWVzNlhUIEdQ
VSkuDQoNCj4gDQo+IFRoaXMgd2FzIHBhcnQgb2YgdGhlIHZlcnkgZmlyc3QgZmV3IHZlcnNpb25z
IG9mIHRoZSBQb3dlclZSIHN1Ym1pc3Npb24sDQo+IGJ1dCB3YXMgbGF0ZXIgZHJvcHBlZC4gVGhl
IGNvbXBhdGlibGUgc3RyaW5nIGhhcyBiZWVuIHVwZGF0ZWQgdG8gZm9sbG93DQo+IHRoZSBuZXcg
bmFtaW5nIHNjaGVtZSBhZG9wdGVkIGZvciB0aGUgQVhFIHNlcmllcy4NCj4gDQo+IEluIGEgcHJl
dmlvdXMgaXRlcmF0aW9uIG9mIHRoZSBQb3dlclZSIGJpbmRpbmcgc3VibWlzc2lvbiBbMV0sIHRo
ZQ0KPiBudW1iZXIgb2YgY2xvY2tzIHJlcXVpcmVkIGZvciB0aGUgNlhUIGZhbWlseSB3YXMgbWVu
dGlvbmVkIHRvIGJlDQo+IGFsd2F5cyAzLiBUaGlzIGlzIGFsc28gcmVmbGVjdGVkIGhlcmUuDQo+
IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzZlZWNjYjI2ZTA5YWFk
NjdmYjMwZmZjZDUyM2M3OTNhNDNjNzljMmEuY2FtZWxAaW1ndGVjLmNvbS8NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc3RAY2hyb21pdW0ub3JnPg0KPiAtLS0NCj4gIC4u
Li9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbCAgICAgICB8IDI0ICsrKysrKysr
KysrKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbA0KPiBpbmRleCAyNTZlMjUyZjgw
ODcuLjQ4YWEyMDViNjZiNCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2dwdS9pbWcscG93ZXJ2ci1yb2d1ZS55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbA0KPiBAQCAt
MTIsMTAgKzEyLDE3IEBAIG1haW50YWluZXJzOg0KPiAgDQo+ICBwcm9wZXJ0aWVzOg0KPiAgICBj
b21wYXRpYmxlOg0KPiAtICAgIGl0ZW1zOg0KPiAtICAgICAgLSBlbnVtOg0KPiAtICAgICAgICAg
IC0gdGksYW02Mi1ncHUNCj4gLSAgICAgIC0gY29uc3Q6IGltZyxpbWctYXhlICMgSU1HIEFYRSBH
UFUgbW9kZWwvcmV2aXNpb24gaXMgZnVsbHkgZGlzY292ZXJhYmxlDQo+ICsgICAgb25lT2Y6DQo+
ICsgICAgICAtIGl0ZW1zOg0KPiArICAgICAgICAgIC0gZW51bToNCj4gKyAgICAgICAgICAgICAg
LSBtZWRpYXRlayxtdDgxNzMtZ3B1DQo+ICsgICAgICAgICAgIyBQb3dlclZSIDZYVCBHUFUgbW9k
ZWwvcmV2aXNpb24gaXMgZnVsbHkgZGlzY292ZXJhYmxlDQo+ICsgICAgICAgICAgLSBjb25zdDog
aW1nLHBvd2VydnItNnh0DQo+ICsgICAgICAtIGl0ZW1zOg0KPiArICAgICAgICAgIC0gZW51bToN
Cj4gKyAgICAgICAgICAgICAgLSB0aSxhbTYyLWdwdQ0KPiArICAgICAgICAgICMgSU1HIEFYRSBH
UFUgbW9kZWwvcmV2aXNpb24gaXMgZnVsbHkgZGlzY292ZXJhYmxlDQo+ICsgICAgICAgICAgLSBj
b25zdDogaW1nLGltZy1heGUNCg0KVGhlIFNlcmllczZYVCBHUFUgbW9kZWxzIGhhdmUgZGlmZmVy
aW5nIG51bWJlcnMgb2YgcG93ZXIgZG9tYWlucyAoZWl0aGVyIDIsIDQgb3INCjUpLiBXaGVyZWFz
LCB0aGUgQVhFIEdQVXMgaGF2ZSBhIHNpbmdsZSBwb3dlciBkb21haW4sIHNvIEkgYXNzdW1lIHRo
ZXJlIHNob3VsZA0KYmUgYSByZWxhdGVkIGNoYW5nZSBoZXJlLg0KDQpUaGUgR1g2MjUwIGhhcyB0
d28gcG93ZXIgZG9tYWlucyAobGV0cyBjYWxsIHRoZW0gQSBhbmQgQikuIFRoZXJlJ3MgYSBjb25z
dHJhaW50DQp0aGF0IGlmIGRvbWFpbiBCIGlzIHBvd2VyZWQgdGhlbiBkb21haW4gQSBtdXN0IGFs
c28gYmUgcG93ZXJlZC4NCg0KSW4gcGF0Y2ggNiBbMl0gaXQncyBzZXR0aW5nIHRoZSBwb3dlciBk
b21haW4gdG8gTVQ4MTczX1BPV0VSX0RPTUFJTl9NRkcsIHdoaWNoIEkNCmJlbGlldmUgY29ycmVz
cG9uZHMgdG8gcG93ZXIgZG9tYWluIEIuIEkgYXNzdW1lIHRoaXMgd29ya3MgYmVjYXVzZSB0aGUg
TVRLIHBvd2VyDQpjb250cm9sbGVyIGRyaXZlciBpcyBlbmNvZGluZyB0aGUgY29uc3RyYWludCBh
Ym92ZSwgbWVhbmluZyB0aGF0IHdoZW4gd2UgZGlzYWJsZQ0Kb3IgZW5hYmxlIE1UODE3M19QT1dF
Ul9ET01BSU5fTUZHIGl0J3MgYWxzbyBkaXNhYmxpbmcvZW5hYmxpbmcgTVQ4MTczX1BPV0VSX0RP
TUENCklOX01GR18yRCAoZG9tYWluIEEpLg0KDQpUaGFua3MNCkZyYW5rDQoNClsxXSBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyNC1GZWJydWFyeS80
NDM1NDguaHRtbA0KWzJdIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2Ry
aS1kZXZlbC8yMDI0LU1heS80NTU4MzMuaHRtbA0KDQo+ICANCj4gICAgcmVnOg0KPiAgICAgIG1h
eEl0ZW1zOiAxDQo+IEBAIC01Niw2ICs2MywxNSBAQCBhbGxPZjoNCj4gICAgICAgIHByb3BlcnRp
ZXM6DQo+ICAgICAgICAgIGNsb2NrczoNCj4gICAgICAgICAgICBtYXhJdGVtczogMQ0KPiArICAt
IGlmOg0KPiArICAgICAgcHJvcGVydGllczoNCj4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gKyAg
ICAgICAgICBjb250YWluczoNCj4gKyAgICAgICAgICAgIGNvbnN0OiBpbWcscG93ZXJ2ci02eHQN
Cj4gKyAgICB0aGVuOg0KPiArICAgICAgcHJvcGVydGllczoNCj4gKyAgICAgICAgY2xvY2tzOg0K
PiArICAgICAgICAgIG1pbkl0ZW1zOiAzDQo+ICANCj4gIGV4YW1wbGVzOg0KPiAgICAtIHwNCg==
