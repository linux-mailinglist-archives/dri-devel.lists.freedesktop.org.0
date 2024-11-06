Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A615E9BE40F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 11:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F388010E6AC;
	Wed,  6 Nov 2024 10:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="U01hpmRY";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="ohp1lhOi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB9410E6AA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 10:18:18 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A66g64x020584;
 Wed, 6 Nov 2024 10:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=VFMrGe+GRpTqcdZMP/IxioM29
 VUJVDhR7uoQa3TY24o=; b=U01hpmRYBUfzDidsP18U3w2mUpdFbb65WvpLHERhV
 EtNWgYNCAf7KBGSyl+E0FTjQUMZhnLkQ9ai95c9/Bj56sVkb5coCS0TbUxCZHo2E
 ajzHG94OiTqSvdZTkoVhwcmk92+OZA69zWmhDqDpBfCMOu0e95FtvWR5a/+muL5e
 7eMTFZQgC/ddVuHpkqkCfIKJiiTYlDSfwVUYT4QQ9IRmhq2h9klHsqvi+WFLCrr5
 HbP8eoJfB2EIYaZKaFT0GTLhx1p0qbqYnN6DzZC5TN1uG8IBpSa2+0DKWExeneFo
 Jnh/GYPH3shbRelvYNapocUS4tCaNOP7jdnXx0JArFb3g==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazlp17010000.outbound.protection.outlook.com [40.93.68.0])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42qw838c3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2024 10:18:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C46ZU8bKZm+tB9z9C6U/1BxyiXv0uEyze1AYmSJ+4XpW77I1SfAf8V1LVprwtGOZlTNPhEV44GxUSeTIQovsJB2I7YOhPZanu4vOXTypsnDv2lN+xsmTNshpO7N8ADAntx2W+wm1L7/+bet8lGzQ+Y8fuXlO7sJytGJuMflsCRVJvRcG75hVZ0NM29c+RLH4nXkZ5TLNHHiLYRLoJ6/lZ4BjDZXA5+6FR1GyxAa5nI/WlyE8beKKOh+9CS7z055tOGNtZbf9DezoSzA4PYIi5SiYFVhvtowL6Lv3XJcmMJU7lcQmb0G0moX1ckgOCKx83w+wetkwPPngqCjv5O6qGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFMrGe+GRpTqcdZMP/IxioM29VUJVDhR7uoQa3TY24o=;
 b=mrqU0TbhPXwkT1xukjPhJ271+M7Lr6LaWlOl4GTWiLRMF7FzVeYeAxD2c05neaAyiGaOl+LkgDHWmvyhG/HbMTmWdKIgyqTYub67FhvA6aCv4HtRX5O4On76tdkZn4lyGP0UP95VBsEaf6ekBNYvhj7w0QfEI9hXBrY+BHLQbwGrkVVUriNRwcv5gyNids+tPL89vBTRvqej1NFvx160wgWiLcbOYI19uxpR1T/Mtxs+cSeOlCc5lDEBpdBLamkRNbpU498AUrg6VpyaQCPTtw3e8BLrcxvsyNHNGuPqKuGj6RUsNl27/UEoAgwEoPxxAEC+EELZWYT+D4gBxKlgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFMrGe+GRpTqcdZMP/IxioM29VUJVDhR7uoQa3TY24o=;
 b=ohp1lhOiY6IdcMWi+44Srb+W/KDkKtybYqIxObaTU4hXDiVkH7GF6L6C8/4argOYc2NNhYB7NGywGUM7FWn4Gb0OpfVzmpImMMnO+ZQdVmFjZvxighdGwYcFbOSbcayT/zbGCat1rQ82rUcSGeFbydREK1PhpMgO30mR1eKmm4o=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB7201.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:32e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.18; Wed, 6 Nov 2024 10:18:06 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 10:18:06 +0000
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
Subject: Re: [PATCH 04/21] dt-bindings: gpu: img: Allow dma-coherent
Thread-Topic: [PATCH 04/21] dt-bindings: gpu: img: Allow dma-coherent
Thread-Index: AQHbL5uOIBWg76M1VEe3oyjoWPxg1rKo+7oAgAEPZIA=
Date: Wed, 6 Nov 2024 10:18:06 +0000
Message-ID: <5e26957f-dc79-42ef-a8a1-597fb386ae51@imgtec.com>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-4-4ed30e865892@imgtec.com>
 <20241105-linseed-steadfast-98cd8abe898c@spud>
In-Reply-To: <20241105-linseed-steadfast-98cd8abe898c@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB7201:EE_
x-ms-office365-filtering-correlation-id: 046b1be4-3c51-492f-a89d-08dcfe4c4e1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VjlKRCtVbGZiUVRpdXdHY29QQmpFTVpIUlpCT2xjTDlrd1psZmVOYXBVSE1U?=
 =?utf-8?B?S0F1K0JrT2RhZkJaUHhmRk1iMlFJTjdremxTSWRTeVRrVElXWFlZNEF5bWtv?=
 =?utf-8?B?VzVlZGZnenEzRmlnbkVtTkE1NWp6SlNCMzdIUXp5K0ppWndRRFh1b2MrNkxU?=
 =?utf-8?B?SlozRWI0M0lBSTk0OFFzQVRDekZZMDQxUGhvNFY0UDN4Ymg3c2g0WStUR1FH?=
 =?utf-8?B?ME52aVd6UnlUVWF4RzFHbTlVbElOSm9nMEM1ZTVyL3FpYTNXUXVEcFhIbDNs?=
 =?utf-8?B?SDZUMEJJd283aGZtNnBHTnZjZEdaOGc0VjhwMEpkckk0U1lZYUxvaGZRV2M2?=
 =?utf-8?B?VnE5SkhtdEpoTDZmcWt1UHFxMzRIL1g1ajd6WVRwK3hGYlNvT1RqRFlIaGtm?=
 =?utf-8?B?aG02cGI1bDltOUhVR1NhS1doZ3dHTlpPQmRVTkJ4R3NCL3I2Wno4Z2MvS0dQ?=
 =?utf-8?B?aWVJTTk4SUROOGs3aVpGcUNKUVd6KzBkRDdOQlNaNGpkbFVxODBwVnMyQ0Fk?=
 =?utf-8?B?RFYyS1hyNFhrTXBtZmp4bDFKaW0vV1FBbnlpKzBpd3M1ZzNJQSt4Y0E3aERB?=
 =?utf-8?B?amduV1JDemJEVkZta0Uzc3ZGNWw1eGNZbjJDbUhlTzRRMzhtTmVWL1N2VTc4?=
 =?utf-8?B?SGNubGlKanVFejhZTmViMGJHbHFZbllRMlEyb2dSS2ZQdEN1bGY5UUM2Smpq?=
 =?utf-8?B?WFFQaVBEclY3MnhZczB6UDdWRFBhUFoxL28xYnc3QnlkbnAzSjBwT2tPeW83?=
 =?utf-8?B?dHpaWTNwWWo4UnJFeFZLN0ZLUmJSa3k4bTdtSGpESUYyMXhrOE1ISVJEUEZJ?=
 =?utf-8?B?dkVreFMyUGsrOVZOSWo3RHhNajZOSzdBZDRUaVlTNzdXUGlUVGdRKzRHOVBD?=
 =?utf-8?B?TmNRMEdvMmxuczNwb1RydnpDVStGZXR5QmprMzVqQ3hGRzYwWlhydzQ2VjRN?=
 =?utf-8?B?dFpCRm1Iejg3YjYwdmpqVTBCV1psS1JrdmhObndZcGdobHlpUHBLWldFV2FV?=
 =?utf-8?B?MmFWT0w0Rk9GT3VjYnNlMHNaVlZ0MGh5RU5rZ0RwTVhlTFBGdmpSRWNnTlJh?=
 =?utf-8?B?ZmsxOWRROWFMNUg4akM1aS83Y1V1cS9XV3pUenNaZm5WNDgzdExTSDEwamNs?=
 =?utf-8?B?ZkVZOHNXQXZYTlJLYlBrNDNCUGx5d25oWTRKWEVwSms4TG81VFpIYkVqVmdv?=
 =?utf-8?B?UTBBOGJqakhJYUEwbExqK0EvMkJjY1RadlI2YnRtUzRpRG5Sb3ZkNmZkS3VI?=
 =?utf-8?B?Ri9wd0RHQ3c4VGpZRVYvbFRlZnkwMWZjZndtUkNIZ0szSGRraGdnSzJkakdM?=
 =?utf-8?B?TnNlTjIxZi9WTHZTa0VmU2ZrQlhXRzZhOWV1UVBQOU5zdmluRVVxdi9SMG13?=
 =?utf-8?B?TEFoYlpDT0JqY0NpcDYxclVWRVJkakFJaEdEQUVyaFdwRHYxdEN6SHNsVlhR?=
 =?utf-8?B?OTE0L3BhQlpPWEhCeCtzMHNhaG1Xay9nVTNiNEQ1ckxQUlArNWZVb1ltMTMw?=
 =?utf-8?B?Z0JyY1hKUzlBMXZmUCtGSWhyS3JBTFc4OTZoYTRIelIranJJZlZMdHhUVUtF?=
 =?utf-8?B?MEQ4VkdLSWd5TVJlZWsxSEozS3h3cFNzZjBsVDdIN2F6WVM1TmQ4TVBweGVQ?=
 =?utf-8?B?UjArNG1TSkRmTUsyVVBqemdsRG9EQWR6dzZKVC9id3kwbzJrdGE5RW5XQWox?=
 =?utf-8?B?Z3RrNWhJYVJpaGNvRTdqRllRRXFHVWdPSFhEWHNSZStnZzgvTlF0WGt1cDRp?=
 =?utf-8?B?ckR1MENDd0lmZG5EbmFTcnpLZlViM2xOSHJPTUNLK3hFelJpbnVvYnNwK1A5?=
 =?utf-8?Q?TGIZz0Hg95pjp1I8bG3W2HJiTCMFsJwzEsRn0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmNkd01UVG12MHM4ckJRQ3pnRFZ4LzhNWkxXcTk4OEU0TndEUVo3RTVlRGZY?=
 =?utf-8?B?K0M2V0lYaTI2TnVLRnAvUkhaNEIyOVg0NDRkWFg0eUZMYlk5RnN4QWh0WjRM?=
 =?utf-8?B?RVNpQ0l5K3YxVzVzdkp2WlB1ZnQ2RTRTZG13QTAzWk1KaGVXMkxiSm9nUzhk?=
 =?utf-8?B?V3JHbFg3akpHMEl1bE1ITkhvcjBMNGdkTVZEd3Z3bzhZUEhobU1mUTB0Q05U?=
 =?utf-8?B?dTBRWnlRUlVsd05ycUdHd1JMTVBGOThJZlYrbzZFcFhGNlpTVEp0ZVV0TE83?=
 =?utf-8?B?eW0yMXhhV0dwa2hXNkMxcjhGTTlPY3VHSzJvWWxrZ2FwYVdnSGJLZ0ZNQWkz?=
 =?utf-8?B?akJ3U1lWRFpFM1ZaVUFhWER3RnNVZmNMT2g4UjQ3eVY4aFRGcnBRdWRoTUtN?=
 =?utf-8?B?cXpHdzlnOGJQdnpIUTlQMXd3MDZ2THpGb0NLd1RPMGZtTHFaZzlBN0piMzMx?=
 =?utf-8?B?NWhaMjk3K0VVMW9ZZ3ZJdjFSTUFpdkwwMyttemlrcy9sSlIvcHFNUUlIVTlF?=
 =?utf-8?B?NHQ0SFJVcStDaHp4ZCtSVmNnNVpCbnpMZllteGxJWlNrRHJPaFVSRThZMnJr?=
 =?utf-8?B?dFptQ2FlTnlibHVYUUFUeDB4U2xwSWVaWG5Xd3NYWm5ZMlI2dWRsb3d1OVlC?=
 =?utf-8?B?TjNPajVIa1pmTXpJbE1IcytpR2xjMWYxelpNcThWWnFIZEt0VkNjNXpLa1BX?=
 =?utf-8?B?em9vSGxKN25HTFdUeXFQdCs3TTJvN3BSOS9xUkNxRytIN25ZWlZVR2QvWTRs?=
 =?utf-8?B?OVRkcDlRNTJ5KzFtNTQ4d0FQeXBPV3dmcDZFL0pJV1NjeUFLcUQyUU5RcHJl?=
 =?utf-8?B?YXlkekN5VXhhYkNzWlhyWXpXdzZhbnZBZ3IxQjBqTzlNbExtZE9tL3E2UlZE?=
 =?utf-8?B?Z1YxM3RneWRoSFVZV2NhQ1J2eitmWHdIU2NjeDl3R29DYkNJZjZRRllIdDBa?=
 =?utf-8?B?MVZGTDdaRUNwZ0xjUHUyaXN3d1o4ZkpVcG04WVJScmYxMk1sYzE0UDZSZytk?=
 =?utf-8?B?OGRweVBHNld6TG9ENDloRU15ZDU2NEVaZmE2RFlTZEVDMFVZVCtMMjNvblZC?=
 =?utf-8?B?N2QxS1dScEpsRVRUMHFhcVYycUtpREN3bFZFRktoN2Q5VHRQVFFRd0NGb3pl?=
 =?utf-8?B?VytvanBsMXdjTk5rLzhuY0M2dTJBeGZaUHFCMlp4a1BJRkpDdm16UzhoVXND?=
 =?utf-8?B?eWxQdTlmNU85bVUwdm5ORUwxV0c1eEwzdmJHeHFyZEI5MEZmQkJ6bTRYcEtz?=
 =?utf-8?B?cU1UdjRCTWl5QWFZZC9BMkR0R3h5cXJYQVFOS3laUm5KdzNSZnZIVFBZUFNB?=
 =?utf-8?B?K0F3ZzZsNFpQUUNuTFBuZmJET01VTzJmWjBMdFV0Uk0vdkdFZGpOeG4ySExM?=
 =?utf-8?B?MkkzdHpOSUlNY2UxbllNUzJ5SHE1VnJVY05JUjBCVVZLK2wxYnJITTRXV2Ft?=
 =?utf-8?B?THJzYjhVN1FyTnBKV0FEdlZ3WTdnbWRacGRqb0wzLzIvM3FtZ3Z3MlpXekxD?=
 =?utf-8?B?bWpXN0VVZGI1NS9yeVlGeG02dGZDVWdsN3l3enZrblUzdGpvaW43dWVhYlp5?=
 =?utf-8?B?bERpenRFdFVLd0pUUC8zRmZhUmFLMlhCTzBkb3dGZmZYcVo5SC84M3djRU4w?=
 =?utf-8?B?d28vNFZhTnJGTkwxbzUxdlhodE1NeG1OMUR6MVNmMWV1US84cGoraTFoYy9a?=
 =?utf-8?B?R00wQStGL0xhcUFHbjFGL2dWSWxDZk5vSnE5VjFTd0dmM0R5NnRDN1hZWW9J?=
 =?utf-8?B?YUhPV09rRnRlUHVvL1RlUmRnOW96V29GeHc5WEExVHBsaXU2T3JTMlo3ZjNI?=
 =?utf-8?B?eW1Yb29VbTIyUTlvai9XbzJBMFJNTUcrNlljd1c3T0FLWkdUSDk5Q3F4RWhv?=
 =?utf-8?B?bFgxOCt0dzU1bXBNanhYWFowcGJlRko0NVR3Y2VscXMzcXBoVkFaVnNXVEkx?=
 =?utf-8?B?VmZwaTR2blpHTWVWcEVqd3BmR1FMOVE5RnNVMTVJWVpYWDJ4M3M5MDFnaGc0?=
 =?utf-8?B?ZURlTHlIbDhTMTZ5Z1RDaFVUVlBmakFINlc4MC81b2NlaStOZmJ0VDI0dE4z?=
 =?utf-8?B?SEhEcEN1QWMrUWRXbnhvOG9HSGFVVVBCWTRwRUduWWpaVUY5Y3FZZTd2dlFa?=
 =?utf-8?B?TzZZWjNjWVEvamtOZkJHOGZsOXVWMkpxVkplbUgzOThad2hOREIxMlA1clBT?=
 =?utf-8?B?aUE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8C14MFx8e9mKU6xhHhB07iKO"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 046b1be4-3c51-492f-a89d-08dcfe4c4e1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 10:18:06.1231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NYsv3hc7pSlFkLprgJBJdm+Xb7TO8iajd8xtEnV6wlywsauzVj8SqzOWCt/sdyWjGp12mtjdV7dKPyftWbHvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB7201
X-Proofpoint-GUID: NniYuYm-gE4oG66EEaP-jGQBOp_rUtA7
X-Proofpoint-ORIG-GUID: NniYuYm-gE4oG66EEaP-jGQBOp_rUtA7
X-Authority-Analysis: v=2.4 cv=dMT0m/Zb c=1 sm=1 tr=0 ts=672b4261 cx=c_pps
 a=mB5N+MKVSatK6YSWG2ccTQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=j44kWYELhBEY5p3SD2cA:9
 a=QEXdDO2ut3YA:10 a=DnBBr_fVM1EK-JxiNCQA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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

--------------8C14MFx8e9mKU6xhHhB07iKO
Content-Type: multipart/mixed; boundary="------------poELg2Zuwoc70o0tkSgJRX1O";
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
Message-ID: <5e26957f-dc79-42ef-a8a1-597fb386ae51@imgtec.com>
Subject: Re: [PATCH 04/21] dt-bindings: gpu: img: Allow dma-coherent
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-4-4ed30e865892@imgtec.com>
 <20241105-linseed-steadfast-98cd8abe898c@spud>
In-Reply-To: <20241105-linseed-steadfast-98cd8abe898c@spud>

--------------poELg2Zuwoc70o0tkSgJRX1O
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/11/2024 18:06, Conor Dooley wrote:
> On Tue, Nov 05, 2024 at 03:58:10PM +0000, Matt Coster wrote:
>> This attribute will be required for the BXS-4-64 MC1 and will be enabl=
ed in
>> the DTS for the TI k3-j721s2 in a subsequent patch; add it now so
>> dtbs_check doesn't complain later.
>=20
> Sounds like the property should be made required for that integration.

This is something I went back and forth on. Where is the line drawn
between things that should be enforced in bindings and things that only
ever need to be specified once, so should just be left to the dt itself
to be the source of truth?

Having said that, I realise TI could spin a new SoC with a new dt but
use the same compatible string for the GPU; the "single" source of truth
then wouldn't be so single anymore. I guess by making this property
required for this compatible string, we're saying any use of it must
behave in exactly the same way, right?

Cheers,
Matt

>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>> ---
>>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.y=
aml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> index 55f422be1bc5b7564e3e81f24c4b93857f3e12fe..8a1861ca960c48853b2cee=
f414f588cc343b49b2 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -60,6 +60,8 @@ properties:
>>            - const: a
>>            - const: b
>> =20
>> +  dma-coherent: true
>> +
>>  required:
>>    - compatible
>>    - reg
>>
>> --=20
>> 2.47.0
>>

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------poELg2Zuwoc70o0tkSgJRX1O--

--------------8C14MFx8e9mKU6xhHhB07iKO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZytCXQUDAAAAAAAKCRB5vBnz2d5qsLuG
APsFtLjlBXGdPmTFchn0SBzy7hFcrlqKda3EyjuD0TYagQEAjxEDBc6jxuQVamvYzmuQgDGfsx5r
4NGPq1rmHaD5lQE=
=tqSu
-----END PGP SIGNATURE-----

--------------8C14MFx8e9mKU6xhHhB07iKO--
