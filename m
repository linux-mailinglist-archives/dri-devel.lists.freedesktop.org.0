Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B60CF3867
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 13:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B573E10E106;
	Mon,  5 Jan 2026 12:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="n8RVXFEy";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Ae+KnsYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954E710E106
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 12:30:26 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6056eOT53487097; Mon, 5 Jan 2026 12:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=HYjx0MqMWlH3XPyD1+rw1HPqZ
 clG6XZDD71MX1HKvv8=; b=n8RVXFEyEWW08VMA7Xul48Dy5aFSlY2w/LnLld+n0
 wZc+PL846aTByVm9Nz/Ju8vsLKn0bOQYpflJ96pg0mj3KIDPusMeGfGUquETVgAx
 P8jX5+3/vNQnILf7gK7hodt+z6fnLbzcNJz+HPCtMglzDq/nXvSZVMSDuCKiBL0x
 +UO6VryWzdWbE05F6P5u/0cQTnhtR+tfvgTfFa16rxD8m4qREVJj+dX0B6SLEMF/
 7G78m+L32UK/yKHxILEPd0VflvFO37ibG+wanE7PDUsXK8OEUcOBvVXvEJvEKH7D
 O7nHFNz5HL0uNvYtWTx34OJtNPAZY1FfswsCNUgsJ8oTw==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021109.outbound.protection.outlook.com [52.101.95.109])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4bet8s94a3-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 05 Jan 2026 12:30:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2LBk2WilYw2FYkfxcNSC1Xbyq6rbc9bRfq+4MiqW0BwWSGPiMRPgGMyDlt6ADySSxZnmhFqxkjMXKEtTaPT8wrDkD566NQmzT7ldshJ+kOqBrWv3cpNpQWB6cWzsFx0ZNq9F3mfxA35qrCzVUyW6M4O7b601X9h/sNgF/QhmRJ5H7hjHqXQiMX/70KowaRGU12eccuwNY7TalK89PxJptRhzioGayjvomDv/t12UlCJmzSvc2OkzfcGuUySWfI1TwqRu5wJAAvyGYmqe4qQ2KcfdtuJzwCT6Z2bHd/FT1WzYP5ipMEJ4wQNVUcbK49ZWf+PiQTVUjivDFpz47lwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYjx0MqMWlH3XPyD1+rw1HPqZclG6XZDD71MX1HKvv8=;
 b=tC5bxTMXOmhOSKbmYIeZC/AQljMwCKs868yKem7H1nkr/i4/EyYXJEUfqcTzf0Ox/FebkYcsCbwM5hL8Ldp9Oi/E/OtQYjxOSLQwobFXI4szcyyP+NIZ1ef+/ynxuLlpce+O113lfKL7O9tKxyqB2za2Pxou4Pn7Y/hldP2bYtkeQY+4xIRgof7cL8ZmkNhd9JMf8Jq1qCCjRES5g2J2GQy5jcUGvoyuncAK6gg5d/o2uFbzLTeYXa0sWYdg9sFbSJ1Xdy4KF1JtN2vA8+bxcWUb0WTFtYOp7XrGIwrFUWveH0PX/6+7GSry5goIpwAudufl6BCV+UoKrgWVxl0JAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYjx0MqMWlH3XPyD1+rw1HPqZclG6XZDD71MX1HKvv8=;
 b=Ae+KnsYZqw9FwqVjoymzYF4g/YTFyWHcOasRFI2ztMDArozy54XIxVjbGh6vUCn89hT/OO5XMmTNpytJvgTwTh5+0NysM2b1J3grx/eFfMcjXX6B+NWFRWVISa3avRMjp+ji6/jTc1/a24zAQ9At/1fJoA7R2IWjqLfG8rC7bG8=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO3P265MB2236.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:10d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Mon, 5 Jan 2026 12:29:54 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a737:7c4e:569c:d427]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a737:7c4e:569c:d427%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 12:29:54 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Brian Norris
 <briannorris@chromium.org>, Frank Binns <Frank.Binns@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Binns
 <Frank.Binns@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 04/23] drm/imagination: Discard pm_runtime_put() return
 value
Thread-Topic: [PATCH v1 04/23] drm/imagination: Discard pm_runtime_put()
 return value
Thread-Index: AQHcc4LlfL3aGPy6kEyW2NLgawIT37VDlvUA
Date: Mon, 5 Jan 2026 12:29:53 +0000
Message-ID: <3d7a7712-7a09-4978-a1eb-73282934bd74@imgtec.com>
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki>
 <8642685.T7Z3S40VBb@rafael.j.wysocki>
In-Reply-To: <8642685.T7Z3S40VBb@rafael.j.wysocki>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO3P265MB2236:EE_
x-ms-office365-filtering-correlation-id: 59570db8-de2d-411b-e4bc-08de4c562132
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?cU9FQ0lrVWJTNkpWTXVzMnNPMFhnY1Bxa0ZrVXd2R2dZeVp2ZG84Z251S29h?=
 =?utf-8?B?MXFiK2dzUit2a1FQSWxzeG1rU1JIOUFsaFhzcjZjeTJ2RTJ1RSs1cHdtWG1s?=
 =?utf-8?B?SVJGWnpxZHpzY0tEd2lmRE8vWW5GTFVKZlM2dDQ4UmhyMlJ2MTlMbjFzSW5T?=
 =?utf-8?B?QU9PRmM1aEx6V0JHWTE4YnVzWm1nZWVtWTNuaWtLUmxubnBYcWE4YUhsUGFa?=
 =?utf-8?B?ZmZDVzgyeGZXYXNYWFpKVm9nN3M5TG55K3BXRXF6VjFSSks3STJIWTFkaXhP?=
 =?utf-8?B?eVBzUE1LQ2xQZHVnMG9NUXVMa1cwRmdIczQxQzdXcVdqYkdVVS9nV01QckRv?=
 =?utf-8?B?QzRqNzd4R3ZLUkd4TWllZ3J2Qyt0R21PZGtvYWRTNFMwRTdRZUV6VDh4VGJG?=
 =?utf-8?B?cXk0cUowN1FicWFqbGdGbm9xRTU1Uk9URTA1NGY1MWludndPdCsrQStxNjl4?=
 =?utf-8?B?eWJWZnpuWnVzc1BsUW5pWFZ2TmlwMjNlNWltNHluWFR2bmUyZExyMTBpQ3ll?=
 =?utf-8?B?WEFkZUlDQVZMVU4xaitsdlB6S091b05BTjY4TVhIcytpK2t6OWhhMVJBeG05?=
 =?utf-8?B?Mmx3eDc3c2lOMDVTejJlTFFGdlk3UzV2OUE2K3JiRnIwTGJkVEpJVWtPc1N4?=
 =?utf-8?B?WHVpZFlrUnFEK1krTGlHaWtjZE45ekZUTUUxNkhaaERrWjFoTU9tbEpUTjRQ?=
 =?utf-8?B?TlYxM1MyYmVTUUtuN3BCbjdoZ3JMalFOY3NaTEhDVWJtWEpHZXRjY3JWVFVk?=
 =?utf-8?B?NVNvU1haaXBPZzVCTDFWTTJzRUV5WUpJcDFGb1hDQmtqaXhYb2JwUEJKOHBG?=
 =?utf-8?B?bjNEQ3I5N3AzclFGYzVEVlhJQ2I3cDhaY1p5b21GZytkSVJwTlZGbHVvUWVx?=
 =?utf-8?B?clY3RW9YaVZYRlN5a0xSWW9jNXJpUjFPc1NjbDNWMnhKSERzcllIbllaTXM0?=
 =?utf-8?B?YmxoZDcrK2R6c1BJYUp5M1ZlZTBpbUZxRGZySEtOSkI3ZDdmbTd6Tnh6aDZD?=
 =?utf-8?B?bUtrSUtiallzb29VdE5CTDNJV2tUZjQ3Wi9vanA1QmtVeVd6REJ2STFrUjZk?=
 =?utf-8?B?NlRCSHVhZHBZbW56REpsTWNxYk1FQ3drdkJodnFWRnk3ZHY3RXJaUFk2U3Z4?=
 =?utf-8?B?MlNPN1VzNFVXSkhLaUNLY0RVNkZuQ0cvdGRXS3Zrd3JycUNVV2RKZVg0SGNR?=
 =?utf-8?B?akl0QXo5Wk1JZXBPVGR5UnJDWXVTUys4aEJQSkVDSGNjb1h3QUNUU3paWDRM?=
 =?utf-8?B?TmtONWJMbG5jWDlJOWVTWkg5UjNDbUovd1J6OWhBaTk3VGpkb05ZYVo1UjdZ?=
 =?utf-8?B?WDVzbVAxQjc5QWhNVE5TSnBTeXNTQ2M3M09aeFNWQ0hhaW8rK0dUa1ZZZ3NI?=
 =?utf-8?B?TXFWUnpHVmFwMmdLemtiL0I1aHJWNHJDNU95S1Y2Tng4eW1sVDBXa2tkSy9N?=
 =?utf-8?B?blFPMk9RRm5FZXQzWTRSUGN6Q3FmSmVnQTJOc0xjQ2x1WGlZWmJGMmxZQzNR?=
 =?utf-8?B?emwrQlNJdkRHWGxiRmorS3VhS3dzVzI0UjRwdGQ5ajlEc3pVcVlRTFJMVHFa?=
 =?utf-8?B?NzVtdERUWDhYalZrQ25VQlBDSXJCV3ZGaE5GeUpnZExMbUxKY0pOQThob2d2?=
 =?utf-8?B?Y2FlRVpjVlNmT2ZKQXRtZnBUdzNmVjB0SXRGbkx0Ym05NW5KWHlyWFhYSFdW?=
 =?utf-8?B?ZldxVXRadjF4ZUozdXBHOXBQWnVuWUJFRmpOOHlTSDFLNnpycW9FL3ZLZUc3?=
 =?utf-8?B?Y1gyVnIzeFpEU1ROYXJ6OFdEZkFoQXFIN29PRmxaQUpHbEozT1ZLMVZnaFNP?=
 =?utf-8?B?aktlTWkzNERJNXNzT2c0UXVuQU5XSzlMSEdVR3hWaGdOMnFNWEdlUHJWT2Y4?=
 =?utf-8?B?TCtYT0FRWnF2bjArYnQyWjlUd0dmTmhJQ0t4Uk51c2dCWnZVZ2xFV2cxWjhT?=
 =?utf-8?B?dHBpTTA5cEErRERidzFrUExQZlFHdnE4NS9oRjRTMzVFZW9mTFFsbjZ4c2gr?=
 =?utf-8?B?blVlaGErMnBpSjYycE9GRnQ4ckc5YW1GRFFJdjUrSVZ6QlhSc1QzZ1o5aXRU?=
 =?utf-8?Q?v1Kmd8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0ZTSTdUY3hCK3h3ZFJ5RXRCKzBRU0tVSWpJMmV5Nk9uS2NyWHlBMzVMcm0v?=
 =?utf-8?B?TmdsYTBsQm1Lc1NaLzJCK3BGUm9IckcvRHQ2WS8zalRibyt1bHVsVkY3T1N4?=
 =?utf-8?B?dWpnVktCbjFwd0M5QWlmSENwU0YxRjc1ZmxNWDU5bmxackNUeUZOZmh2QW5r?=
 =?utf-8?B?dGdLTEJ2K1lZd0hTMkVlUGZHNWNla3BadVZubFovWWFKVVlpVGJScGF5WmQ5?=
 =?utf-8?B?aGhVb09MYnZmR3NUamErQjIvdkI5QjRrVlBpOEhsdEkzeUx2WWFNaGhvVSt2?=
 =?utf-8?B?dlVwbHIxSDZOVFdHSUZiRzgySDQ4WUVPcUExRUV0Y1ZtYmFzb3RZQS9pVkRp?=
 =?utf-8?B?bEtOMHVJVEtTeVo4TllUVVpsczhMdU0xc2Z4Z1JETGpQSzhKeGFNSW5QUmww?=
 =?utf-8?B?QUFZcVk4QS9SaUdselplajB0VmtOZzdveDJmZ1dtOWh0dGZPUmM2MnZLang1?=
 =?utf-8?B?Vk5zclloaEFuRHFKRUJkbFptWnBOWUZkc1dlbFlGMVpYanVSL1grN0tkRHd0?=
 =?utf-8?B?cFp1RjBhNUtoVVZBMEhHemF4aEhTbWlvWWFhU1pwOHBMWWpDN2dEUHlKVm9K?=
 =?utf-8?B?UDRwQzczY0hqbWVQWHdIUlNPQm56VXRqOGJnMVZYM3l1aVVRNVl2SENoMjhW?=
 =?utf-8?B?cktEZjZ5Z3B2bmRxT2wweXdGdko4cHFLWnBOOGtkdTZjY2huQWQzMTJuNTl3?=
 =?utf-8?B?REVsdEttbUlPUVhHaEY3N1RvdDlPd0tUOE1rNm9lcU9KSG5wbVNjK1VvalFB?=
 =?utf-8?B?Y0hLVDBqaFhSb3hRYWkzbWJ1T2xYWHNKSHVZYWpQdUN1TkZPdjAxUDROYS8v?=
 =?utf-8?B?NkNxVy9qSkZkNE93ZnlNM3pxd1NVd0x3NUJEVm9PYm94blQ1Q0NNVnhQdi9l?=
 =?utf-8?B?Z2kzSGtxcmZ0TFEvOENKQXhpYTFaYnpCeHoyN09ZcU0zREY0dE1weHh5K21M?=
 =?utf-8?B?bHc1dkhicFR2R3lKZWtqcnRWQWZ1SnZUNUlhRTQ3MTZIQlkwdW5Zc04rQU05?=
 =?utf-8?B?emtKQ1hveG9xZHhydFp6KzltUmM2ZGtZQU4zR3NsdjlRTnVuRHAzRHFmdmlI?=
 =?utf-8?B?VVNnaWE1WURNWHptcmxKRThibzZsWk00eHhuQ29QbmVpbUxSaklKL2QvZHA1?=
 =?utf-8?B?MFB2Y3UzRXlndk1pNjFDQzJLR2JIa0FlZVpuWnNjZ1I3NGJmeG1MbTBaQ0RG?=
 =?utf-8?B?UE9PVW5hV3FmSkVZRUJGRjBsdzdPVllwVUx6VndUMFBxTGpUWW5iL3VWWWlO?=
 =?utf-8?B?SUYrenVvbjB2WjhLMER1bWRTYjZEMDkwVTNoV3R3L0FhM1BDQWt2NXUySnV2?=
 =?utf-8?B?ZHY2b1dpREVYdVdmeXF4T1ZaZW5GN09jbXhVTUhXMGMyMVB1WjJRcUt6dmM2?=
 =?utf-8?B?Q1hWQktzSGVuRy9SVXptSlBVTUxwNjY2N3ZWZmxwT01BY3lUTk5CR1FaZFM0?=
 =?utf-8?B?VXFpblNVODcwZnk5M1lqRDRpZnNyeURsYTVrb2F0cXNRcE8vamNIQStzdEUz?=
 =?utf-8?B?ZWVndC96UjZQWitnUUFLS0d4Wk1kY3k4QVFncXNOSXpuOHJxYUlDSVlPc1cy?=
 =?utf-8?B?NU14Q0p3OU9yRFJIYzd2NW1XbjhCR2xIMDAvMGFza2ZXclNwLy83SHpYNnNa?=
 =?utf-8?B?bHI1MVVnY2tjeW5uMU1TaC92eHBaSmgrWmQzdWlBYlBCYXJSTzlzU1U2cEtl?=
 =?utf-8?B?OGc0RFN1ZGc5WDVNdCtqWjV0aHBTYTVDallZbEtYUVl0V2FObEt6MXlFVHN3?=
 =?utf-8?B?SFRQaXd6ZTZjb1p3Q0w4ZWxDS2R4aW1mM21nV2pUMzFITmRJSzlWdjF0RUtz?=
 =?utf-8?B?VTFiQ3plTjNhN3hBdnM1cG1uVjd6Y1VtZHhEKzhvdzVOU053cG0zZjg1TlVN?=
 =?utf-8?B?eDFvU3JieUc0cHh5VGFJMkFhbVMyWmU2dktCb2VXd0x2L2kxVmR1bGR1SXJJ?=
 =?utf-8?B?a1haNDlMQnlmYTFURmVOZFBERTgwaWdESnV5U285SEN3WVNSOGQyMS81QS96?=
 =?utf-8?B?QzdhbmI3UE42RGtTTjNHM3IrblJKeldIYmY5TzNSMUlHeHFyckdWVzVQaXdm?=
 =?utf-8?B?ZGE5czBsMUVPZlJkUDNCemJXREkvZi8rakRMMlZJdkRHM09YNDN1WkdGZUl5?=
 =?utf-8?B?WGRya0hHNXdTVGp6cXJaWDNqU3UzdUNSZ1lQbVkzQ0ZoRGNseWp4Z2ZTOXNM?=
 =?utf-8?B?RE50WVZLalJ2Q0VPTC8vby90a29ZUFlNc2RBbFhoQXlHVDBUUll1K0U3cHQw?=
 =?utf-8?B?VDFSbXpoV2ptcmhZWGpManZMaGZFd0Q3VFJFWkY2enAxenU4OXVrTjNJMk41?=
 =?utf-8?B?dEpnWkV0a09qS3hRRURpVUNSMENpVXhzZEdCUVhFcHoySVE5ckgwVTRza1FW?=
 =?utf-8?Q?wb1kmCLIvJHQtebs=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8mzTeOgA0999vxAQBEZ0s1Iy"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 59570db8-de2d-411b-e4bc-08de4c562132
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 12:29:54.0141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eu+MAe28iwWq1CCGX5knGy9whImAGFBg/EG7QatpgIIRMILSrjnIFhY9eivAIRqYP7055+8zQBIN8B+Y0EofMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2236
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOSBTYWx0ZWRfXzm7bwhcNvCQ7
 YGvANzP/NjkL/dG/WGCRbCQHoZnwd4YLrxfKEF804YAcirgJidWLBXAaYPhtat3XHhn7LfjifP/
 2BnsWzGL4Af2TbcOYYK8RvukianZE00XMG9SK5gcq5QU7VxIbp0RJhLfwPg+6I8lSGO1Hy1FLMm
 J+oLHTeq4DeBbhSIbDAM4XWhYDK8clqNSibkWOjK/VKe7ExJr/Ce9sayfMcTkj8dmiAFatU5U/l
 asUebKfHASu9qySrgrUY+ahWzPz6K5cDCb4ScSGGv7RzVFzZ4vpanFQERrI9ClYYbbzntZDCtZR
 S9OIuSEH5PoiGSmajxpMiaFFL/3wYPLaLMZ7xrVlDTmbdtWeev0IFlwtx8M/TyJd8ZbxU8yl+Ei
 50jgXLikfRRozvND6ILZbmxmCfJeaHxn3ISpnnbzaXTwAy85/JItRdMuL6/lHPpHYoyJO+hYPWx
 QoRSVRT7h7I1OVwwtug==
X-Proofpoint-ORIG-GUID: 56StBecKMDxNchzvO26BWtVRzPeMcg4s
X-Authority-Analysis: v=2.4 cv=LPFrgZW9 c=1 sm=1 tr=0 ts=695baed0 cx=c_pps
 a=br2friuahdj1whs55ABqZA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=r_1tXGB3AAAA:8
 a=W1iBsMics9B4uN7ZLE4A:9 a=QEXdDO2ut3YA:10 a=2TUvgaAlGgviH0cN4P4A:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 56StBecKMDxNchzvO26BWtVRzPeMcg4s
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

--------------8mzTeOgA0999vxAQBEZ0s1Iy
Content-Type: multipart/mixed; boundary="------------en1QrhNxtltHjtOZ1Q5fouGA";
 protected-headers="v1"
Message-ID: <3d7a7712-7a09-4978-a1eb-73282934bd74@imgtec.com>
Date: Mon, 5 Jan 2026 12:29:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/23] drm/imagination: Discard pm_runtime_put() return
 value
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Brian Norris <briannorris@chromium.org>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki>
 <8642685.T7Z3S40VBb@rafael.j.wysocki>
Content-Language: en-GB
From: Matt Coster <matt.coster@imgtec.com>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI
In-Reply-To: <8642685.T7Z3S40VBb@rafael.j.wysocki>

--------------en1QrhNxtltHjtOZ1Q5fouGA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22/12/2025 19:59, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>=20
> The Imagination DRM driver defines pvr_power_put() to pass the return
> value of pm_runtime_put() to the caller, but then it never uses the
> return value of pvr_power_put().
>=20
> Modify pvr_power_put() to discard the pm_runtime_put() return value and=

> change its return type to void.
>=20
> No intentional functional impact.
>=20
> This will facilitate a planned change of the pm_runtime_put() return
> type to void in the future.
>=20
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Hi Rafael,

Apologies for the late reply, I was on holiday. If this hasn't already
landed, feel free to add:

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

> ---
>=20
> This patch is part of a series, but it doesn't depend on anything else
> in that series.  The last patch in the series depends on it.
>=20
> It can be applied by itself and if you decide to do so, please let me
> know.
>=20
> Otherwise, an ACK or equivalent will be appreciated, but also the lack
> of specific criticism will be eventually regarded as consent.
>=20
> ---
>  drivers/gpu/drm/imagination/pvr_power.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> --- a/drivers/gpu/drm/imagination/pvr_power.h
> +++ b/drivers/gpu/drm/imagination/pvr_power.h
> @@ -30,12 +30,12 @@ pvr_power_get(struct pvr_device *pvr_dev
>  	return pm_runtime_resume_and_get(drm_dev->dev);
>  }
> =20
> -static __always_inline int
> +static __always_inline void
>  pvr_power_put(struct pvr_device *pvr_dev)
>  {
>  	struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
> =20
> -	return pm_runtime_put(drm_dev->dev);
> +	pm_runtime_put(drm_dev->dev);
>  }
> =20
>  int pvr_power_domains_init(struct pvr_device *pvr_dev);
>=20
>=20
>=20

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------en1QrhNxtltHjtOZ1Q5fouGA--

--------------8mzTeOgA0999vxAQBEZ0s1Iy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaVuuwAUDAAAAAAAKCRB5vBnz2d5qsDEw
AQDa115C5r16ApOVMFz/ifBD/Alz7Utq5tg5VGX5wYydqgEAyvYK7z4fbytv0bcWo+lw1N8Q1dC+
jJ5qkVpLPUHPhwU=
=tMaK
-----END PGP SIGNATURE-----

--------------8mzTeOgA0999vxAQBEZ0s1Iy--
