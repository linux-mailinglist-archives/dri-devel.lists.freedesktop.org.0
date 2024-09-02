Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2776968322
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 11:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5339710E272;
	Mon,  2 Sep 2024 09:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="QtXZvesQ";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="JMQporWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760B710E283
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 09:24:46 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4825xQ8M003145;
 Mon, 2 Sep 2024 10:24:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=Zl8bhsAt4h3mEsAAqk626AQpm
 SZZfuuKr+iOK/Oo+AY=; b=QtXZvesQu+G2VbgVvL2fCirEBQOpH/CmAfTuX6BdL
 XWpjou6djsIFM5KpSWzJcruB2at6T6i7pAA1yscjQqyxDr6fCg76/iu2yLl4MsAp
 +QTlZ+t9WFHn+fKMX3RhYX6KH1bx58eKjtx/B3P3fydq9Vmnph0SHGx12aNVj9XF
 MYHhNe93Q9cvXE/tN1MCLoDir9PETRLxQ6QvqoIIvG3LB61ld+ypTC8SmMoVBIWh
 wQFSdY1QSVxPm2cE8eHTsUTAtHXS4/PJRF/Z003TIzgMuxx33T3Vm9bHOVLLrequ
 MHEZoKXeYbLqqrk6cIYwlnn6FXGC+t10OqM7cSwnctweA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 41bu8w9hfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 02 Sep 2024 10:24:32 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 2 Sep 2024 10:24:31 +0100
Received: from LO2P265CU024.outbound.protection.outlook.com (40.93.67.28) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Mon, 2 Sep 2024 10:24:31 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0Lj/5L0lZaNiQu4cQFKPMsOEMDocrGrC5KWrRDBicGcMQ+l1LKxt/Flk/VGzOhyXe1loXTW8y4SoWMdTF8zx6mmOY08aWdFgxNKzVfB+unK+KIKezUgPu8O1NbRj9smqw9vpPQ+h8tffXzKjb1iLJ3ZmyKeZyybg0eckWBVx4bnDHrMQnrBZGQDIMmuANhSRCwmupvBM9W7cdiJwlOo7lwUdJUcMlkMFgnZH4rLDHSL9IX6y/4XUFe3XxfpCpi6oWdUw7jmhuFSb41iDRMhCUH8/KNVanB0h7hVi+9q8DXlFxnDuk1I5IyTyQHxf7VZF/ql9OrY6UwS/HJV0a5VHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zl8bhsAt4h3mEsAAqk626AQpmSZZfuuKr+iOK/Oo+AY=;
 b=Qf1QNhw6Z7kh26wHu++oDdMIGr9W449V6K7jVpgbSQbED9+xYQXoGa4QD29JaNlxhnrJGMi3tnvUFX3tjmcVrFLaDYkgA9Ua5ED88OmhqwuQLl9slzaIxufc7nehJvZD+J5iAx7wcwUsI+4wUENwsBTdH+x8RqS+YnLNZOPBAeb+EHEq1sNwiYTTHUDJDnVqwlTQqZbZYFg6KwLs0SwygQ1afEKtzlBgoRgRuFhFqix20xPN/RNzaH/boJq2+Rdy0XE4065bQ5jN3N9hmimEbLGtbGcmSfNlOKZC0U1WGvLg/yjDCXerlhewOtcYyjfGUNcQmuQbyLf9nm+DMsWBlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl8bhsAt4h3mEsAAqk626AQpmSZZfuuKr+iOK/Oo+AY=;
 b=JMQporWSn4qKZyJ5Ez9hsQyVef6J8u1PibpDpQJ67aNZ6TnZv9avwO0kpFyg9oIgIfIU2Z9DSdxvlU+l8VMkDziNX06smFkdVlEcHq1Ix4eYK7YR0SMQWn3FBTkNaHs3KBYN7rVBQqS3a/LFAwJpy89t3XOPDSkkUfNJ+cUhiZo=
Received: from LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19c::12)
 by LO0P265MB6424.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 09:24:29 +0000
Received: from LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM
 ([fe80::54e3:e143:a879:2417]) by LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM
 ([fe80::54e3:e143:a879:2417%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 09:24:29 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Icenowy Zheng <uwu@icenowy.me>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/imagination: properly support stopping LAYOUT_MARS =
 1 cores
Thread-Topic: [PATCH] drm/imagination: properly support stopping LAYOUT_MARS =
 1 cores
Thread-Index: AQHa68h8l6BjzOU8SkGcVjXPtTF+wrJEXEAA
Date: Mon, 2 Sep 2024 09:24:29 +0000
Message-ID: <8e024981-c531-498e-8ae1-b20f0773f112@imgtec.com>
References: <20240811082813.245871-1-uwu@icenowy.me>
In-Reply-To: <20240811082813.245871-1-uwu@icenowy.me>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO2P265MB3406:EE_|LO0P265MB6424:EE_
x-ms-office365-filtering-correlation-id: 776a6ca4-5248-467d-6126-08dccb310bcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cEtPZkpaYWtZRWNzVVRmMEVKbzMxOFlCZ2Q0SzZEazJHNlhvbHJRSVFvS3lY?=
 =?utf-8?B?OWMvSFJkUVFMbm9scVZ1Mk12MkxORS9RMTg5Z3J1VFgvWngxam9XME1SWkE1?=
 =?utf-8?B?Q1VmNUxtRVpwdTRZdXRlajFjTVBRZHNWek4rZm1mT2h1RVBsTjc0cEJncHZr?=
 =?utf-8?B?bDVrblVEak5wbXMwUlVmcitsYUVHSmFVLzExSjFSd1htYkdWaEFDU0xaamts?=
 =?utf-8?B?ODk4VXp3TERweitrQTRSZURZRVZpSjhZWkk4QzhtSHJsSitBZUtaK0dDMkdF?=
 =?utf-8?B?Q0RvQ1hKOEl1b1k4Yk9yQ2YzUkhHR2ZCczY2WC9OaFZ4YWhWbmd1YXlOdGw0?=
 =?utf-8?B?LzM0S3JVWlc0eS9sZG5rWjhHaUN2enBVK0poTHRFU0NSQlpRTEVqMkdzQlhR?=
 =?utf-8?B?aUlWQThFVkdKRmFxNFJBc1c2cCt5Uk1xZXhLUHB5bjdndCtSei9jdlJTQkhJ?=
 =?utf-8?B?UEl0ZW1ucVJzM2M0MEloMHNSNmYvbVNyczNpbTd5WXJqb2dIcDZFUnBXNUlB?=
 =?utf-8?B?d2lIb3dUZHhzRjQ4T3V4L0xOUVBPZVByTjFnV0FDZEFCUXoxQXNTWEc2L0pL?=
 =?utf-8?B?RUhHdEpINVFKM0hRc0R5aWRJclB4eFNweWlEaTErNENHbFp4T0xDc3Vxck9H?=
 =?utf-8?B?Tll2bDZRZDE0eDQ4Q2pqVXdSUy8yTFc1eXJ2L3RPcm1JeFBuSHc1ZlFwQkJS?=
 =?utf-8?B?TGg0RGtwb1BTZ3V5YmNhWmpFeG05N2pJRTFtejZvTC9zR08yTk53blJ5d0lB?=
 =?utf-8?B?R3VSdWxQOWNHT0NnTnN0WGcvZ0xPZllBanE2SzF3ZFVmWkhsMURJdE5jbUtr?=
 =?utf-8?B?dUxoWTM3c2N0UnpYMEZDYzlzSDhBeVJLSnZlVXVZVHJaK2tIN3prZjZjVDhx?=
 =?utf-8?B?ZVZtTzNXbzU0aE9jZW9CVXN1eHNhNkgwV1JJL24wTzBlcnhqcXB6MGJjc0lF?=
 =?utf-8?B?ZTZlTkJMN2tLbHg3NWRtcnNlSjFvUHliaGxtSjZQV0tpSlJDdnc5K2VrWUpi?=
 =?utf-8?B?S0pwcGVEWndzVGx3L3ZwVHdZNEtXdVA1OHBONllGTlRnL2RnLzl6cW1RcnBU?=
 =?utf-8?B?bHNETkpTeWQ3QnNoWGNYdm0zT0FvMDFVSS8xRFZVVU4ySlZOWjFrenYwdlhE?=
 =?utf-8?B?ZHFHQUoxb3RpSlRKVERGTndGSzMwUGdaTmxoSWs2QXREWFU0NVNJL3luTUda?=
 =?utf-8?B?SE5xOGQvWURrY2Y3QWVLUVpLaWY0V01SbmQ5by9Gb29MSFZjV1YvamdGYVdC?=
 =?utf-8?B?RjVqaVQ0cmlKeHRNbDFvYU9KeWErWDhNVUdWeWpqbVdwdWpkSW9rcGN0OUF2?=
 =?utf-8?B?SyszVkZOd2hpbjgyaURzKzhvWmE1eHhXcWJZekR1S3JubWlYMjZXczJrUkpl?=
 =?utf-8?B?ZFpCd2lzaitvYi9kWW5mNmhsZGxoR25KeFlsVG1KZzNyam9mODIrMmZoLy9F?=
 =?utf-8?B?cTBnekVERmNsVWZ2RFkzdVFCUDVFZlhKVG9xNDQvMDhBNEl0dk9SY0VtdHRs?=
 =?utf-8?B?d1F6N0Vyd2dJUUNhaFlENnh1SWRXYndyY3ljUmhZUDlTM1hPWHR1ZkthUUpY?=
 =?utf-8?B?MXFDOG5RbmlWbDk3YmNDZ0xtMm1IMnlkckhFWXF4UERHaGwvcGIwZUU1TGdq?=
 =?utf-8?B?SlBiTGtRTDNXcU5MSTFuNDRuZEw2a0FVanNNcU9ZYjRqcXpta24rZVVudUVL?=
 =?utf-8?B?MDNQMnhEc0FZRSs0M1p4cXRQakxYRHV1dTdnWVFVZFE3VWVOQ3AxVFhlYytz?=
 =?utf-8?B?cUs0OEF3bFN0NXFoWFJ4RlVFTG9rLzUyUVNuS1FYV3RSYnkvWmE0bXVUR016?=
 =?utf-8?B?M0dCclRYejFqdVo1YjJOVC9kYko4RzRSb3FrbzNZRzlOMEExc082QTVEMHZY?=
 =?utf-8?B?MldseUk1MmwrOXRGcFg3OXN6dVM4aGdzTTFrakF5VGl5T2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUhEUi9hc1hTVzdDU2M0V005TWN0ekx0K2VNQkJPK0o2eDAyUFFkNXZWVUhH?=
 =?utf-8?B?Z1VEWmV6WkZ5U1RGMFZWVzh3bkRMQlhKM0s0UnBVcEY0OFVoK0J6UUFqd0Ft?=
 =?utf-8?B?M0QxVUdrT1pkM1NSZzhyeXRXNDJ0eGxUaEI3K0p6Sk5VVGlDWG4rRUdqRzJl?=
 =?utf-8?B?VEU5WG1seTZmSDRXTmZCZVVGQ29OUXJPcnZ2Y0Q1RlZqTzZFQzJUdnc0YmRi?=
 =?utf-8?B?V1F4QVc4cjlDNlRQcWk0WXptNGhvTW9waFpwcDJpTFIyU1B6NjNIL0RHeHZP?=
 =?utf-8?B?ekNPbGg0N0hiWXhucHc2bjVMQXQ0Z1ZFWEFvWll1OG1tMEQ5NXJaYm5PbWY2?=
 =?utf-8?B?MkZlTlE1K1U3aDRjTXUvMWZicXNtcDY0aU9xM3FodG1RRjRFbnFQcjBHdWwx?=
 =?utf-8?B?WDl0QjArQnQyZHIxbi8xa05lMDk4QTgzdG1lN2g0S0puSUlFRmJydEgvZzRv?=
 =?utf-8?B?cXBTMjNGK3liUHdDYjNwRFV4ditrTW9aWnQxNUY0NXJmM2NrbEx5NkZBb3Mz?=
 =?utf-8?B?WnZLSFk0UFQyaXcvdUFZbUpkNHpSazFOQkorazR0MHBHaTRlTjZDTS9VTmor?=
 =?utf-8?B?UTNFdmtCQ2UvOUJUc2lPSHdZbzRGNU5jRjIxeXFTbTVYcUFRSVBVcU5YL2k2?=
 =?utf-8?B?WkdUcmtDMFNaMkx4azBrbjNERC9VS1NRYU9pVHp0MUJBenprQWxUeTUvVTBo?=
 =?utf-8?B?bU5wa0NJWGJhSmtOM1BoR0x5UVBPOEZzVE5kOWFCdksrWVZXWDZZV0dOTEph?=
 =?utf-8?B?ay9POUhSR2ZxNkFNRUc5ZTJYU3ZOY0xOZzMwb2hhSEsxMWdpNnQ1b0xIZFJY?=
 =?utf-8?B?bCtLSDhjMUlCcUkwMTZGd0N5b0lOaFRkaDB0dVJhS3VLV0Zwc3BpNi8va0xT?=
 =?utf-8?B?a3JsOXBieTI5SVFNamNIVGh0ekxwSDJoeEdYTFZNVUxQK1N5eDUzQnIvWkRK?=
 =?utf-8?B?UkRZS2lrN2NXK253MWdTb3QvaVVMazN5U1pVRlU1dHI0S0pXNS8wTm5peExS?=
 =?utf-8?B?cDRDdlhmTEtDM1JWd0NBSW83dzI0RlZnKzhmYnZHeXVST3puRzdNRHBZUlpj?=
 =?utf-8?B?UmtnbTBFL2hUUVZ4WDFXTlFWWW9WeGJSaVYvZHZsYjAzM3Z4QlNMVHFOQzRT?=
 =?utf-8?B?cnlpOWEwakxwNGltZElYbHRpYUJXSVV0TVkvbDB6ZXBDRTV3d1BLRGR2RHk4?=
 =?utf-8?B?djZ4OXhueVp6ellTalA4SFZGb3MxQ0wwNU16enk4MVhxb29TK2xBVWZqdDBh?=
 =?utf-8?B?UW1Ed1gvcEViYXowcSt1YmJPMW1CQThTWEk5VFhjSENHMXJHTENoRUVNNnhM?=
 =?utf-8?B?RnN5cW5iMVBKTmdoajF1MlZzYVcvUTAxOXcxaGw0YlhlRGZTeWdTcEZqc21F?=
 =?utf-8?B?a1dkSHVzaDZUUzF4a2Qrcmx1dHZkWUQrMVgyWXUxQThVZDJoUlE4L0FKeXNn?=
 =?utf-8?B?ZTNrQlAzQ0x0U0VsU2dkUExrUWFMRmJPaWdiQjgwSUxwZkhTbkpBVmQyOVVL?=
 =?utf-8?B?cmJTeHdMRGdJN3padlpya0ZNaHc0aVh2SDFncGtZR1JIQzEyMFVucVpreTJ1?=
 =?utf-8?B?QnVzampWUE41cW1NV3ZRYjQ1KzFUM08ySHdwdVVzL0tQRUI5UVlkK0NNOCsx?=
 =?utf-8?B?SXdHUEVRMk5TOXlxdzdMVUlKVU1rb0I2eGorbjV2TXVYQ0FaNkZnVk0wcU9r?=
 =?utf-8?B?emdlK2htcmJrdlN3ZlFxdG92enVLN0xmQzBOVkhpUVRPcGxmZW80Q3g4UFkr?=
 =?utf-8?B?UmJjQTJlUjBSdzNRejRXelZkZ0d1ZkU1dUp2bWt3VUwrZzVTKzBWOXUrd0lO?=
 =?utf-8?B?UkRTYU83bCt2OHN1SXN5MlNKK2xMWG5KK3gwcFhhWXh5YzRFL2hKWkI2dStT?=
 =?utf-8?B?RHhkc2lvZFdibjZRVTlTVUp4RmdGUHloVWdveWpwc3hvc3BlNDFoSk1hY2JQ?=
 =?utf-8?B?Z0xCYytZNm5QeTZPRmJDYTRHdGU3NWlnK2ZjRzZRR0cwc2g1c29wbWlzYkdv?=
 =?utf-8?B?TVZteXF1RmdBY01hTFVRV2xjdzBuRVZoVGVYQU1rWEpaL1pteDc5UStHT1dH?=
 =?utf-8?B?S1kzNVMrM3FoYUt0emhJd3gwYmU0TGJWclhVZDVGR3h2UlJHN2hMZUhKbkxU?=
 =?utf-8?B?TFY1bDZibG9LcXd4L2x0VXB3TDRsU3M2R2s0bnRGZ2xwWVBSWUhkTnM2V3Yz?=
 =?utf-8?B?R2c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0I0HN0H1o0qENy3yfNpexnX0"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB3406.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 776a6ca4-5248-467d-6126-08dccb310bcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 09:24:29.1472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7wK33AIpOsyO0dois1FgDmSV3/GrRDS8+gyaeYEGbsUyLXlXM7tBx28SiF65hFxhlsom+KQuoaJznXFJOw2ugg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6424
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: lS3gSuaSjGEDq3PGF10uFhMMVDRCF8GN
X-Proofpoint-ORIG-GUID: lS3gSuaSjGEDq3PGF10uFhMMVDRCF8GN
X-Authority-Analysis: v=2.4 cv=F4AFdbhN c=1 sm=1 tr=0 ts=66d58451 cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=Rh40u_VJwaP7QjhkFd8A:9 a=QEXdDO2ut3YA:10 a=YxsiRhx3PS-eB7a0RZYA:9
 a=FfaGCDsud1wA:10
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

--------------0I0HN0H1o0qENy3yfNpexnX0
Content-Type: multipart/mixed; boundary="------------mTIlEmax5jBZZhK30lR0y0Fu";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Icenowy Zheng <uwu@icenowy.me>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <8e024981-c531-498e-8ae1-b20f0773f112@imgtec.com>
Subject: Re: [PATCH] drm/imagination: properly support stopping LAYOUT_MARS =
 1 cores
References: <20240811082813.245871-1-uwu@icenowy.me>
In-Reply-To: <20240811082813.245871-1-uwu@icenowy.me>

--------------mTIlEmax5jBZZhK30lR0y0Fu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/08/2024 09:28, Icenowy Zheng wrote:
> Some new Rogue GPU cores have an extra MARS power domain, which
> controlls the power of the firmware core and allows the firmware core t=
o
> power down most parts of the GPU.
>=20
> Adapt to this by ignoring power domains that should be powered down by
> the fiwmare and checking MARS idle status instead.
>=20
> The logic mimics RGXStop() function in the DDK kernel mode source code.=

>=20
> Tested on BXE-4-32 (36.50.54.182) with firmware build 6503725 OS provid=
ed
> by Imagination Technologies.
>=20
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

Hi Icenowy,

Thanks for the patch! It's great to see people getting involved in
getting this driver working on more platforms.=20

> ---
>  .../gpu/drm/imagination/pvr_fw_startstop.c    | 49 +++++++++++++------=

>  1 file changed, 35 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_startstop.c b/drivers/g=
pu/drm/imagination/pvr_fw_startstop.c
> index 159a4c3dd65b..4301a7aded64 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_startstop.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
> @@ -201,19 +201,28 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
>  				       ~(ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN |
>  					 ROGUE_CR_SIDEKICK_IDLE_SOCIF_EN |
>  					 ROGUE_CR_SIDEKICK_IDLE_HOSTIF_EN);
> +	const u32 mars_idle_mask =3D ROGUE_CR_MARS_IDLE_CPU_EN |
> +				   ROGUE_CR_MARS_IDLE_MH_SYSARB0_EN;
>  	bool skip_garten_idle =3D false;
> +	u32 mars =3D 0;
>  	u32 reg_value;
>  	int err;
> =20
> +	if (PVR_HAS_FEATURE(pvr_dev, layout_mars))
> +		PVR_FEATURE_VALUE(pvr_dev, layout_mars, &mars);
> +

This check is unnecessary =E2=80=93 the PVR_FEATURE_VALUE() macro already=
 checks
for the feature presence internally and doesn't change the output value
if it's not present.=20

>  	/*
>  	 * Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapp=
er.
>  	 * For cores with the LAYOUT_MARS feature, SIDEKICK would have been
>  	 * powered down by the FW.
>  	 */
> -	err =3D pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_i=
dle_mask,
> -				sidekick_idle_mask, POLL_TIMEOUT_USEC);
> -	if (err)
> -		return err;
> +	if (mars) {

I think you might have these conditionals backwards. This is saying we
need to touch sidekick iff mars is present, but the comments say this is
the other way around (mars takes care of powering sidekick, so we don't
need to).

Cheers,
Matt=20

> +		err =3D pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE,
> +					sidekick_idle_mask,
> +					sidekick_idle_mask, POLL_TIMEOUT_USEC);
> +		if (err)
> +			return err;
> +	}
> =20
>  	/* Unset MTS DM association with threads. */
>  	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_INTCTX_THREAD0_DM_ASSOC,
> @@ -267,21 +276,27 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
>  	 * For cores with the LAYOUT_MARS feature, SLC would have been powere=
d
>  	 * down by the FW.
>  	 */
> -	err =3D pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SLC_IDLE,
> -				ROGUE_CR_SLC_IDLE_MASKFULL,
> -				ROGUE_CR_SLC_IDLE_MASKFULL, POLL_TIMEOUT_USEC);
> -	if (err)
> -		return err;
> +	if (mars) {
> +		err =3D pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SLC_IDLE,
> +					ROGUE_CR_SLC_IDLE_MASKFULL,
> +					ROGUE_CR_SLC_IDLE_MASKFULL,
> +					POLL_TIMEOUT_USEC);
> +		if (err)
> +			return err;
> +	}
> =20
>  	/*
>  	 * Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapp=
er.
>  	 * For cores with the LAYOUT_MARS feature, SIDEKICK would have been p=
owered
>  	 * down by the FW.
>  	 */
> -	err =3D pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_i=
dle_mask,
> -				sidekick_idle_mask, POLL_TIMEOUT_USEC);
> -	if (err)
> -		return err;
> +	if (mars) {
> +		err =3D pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE,
> +					sidekick_idle_mask,
> +					sidekick_idle_mask, POLL_TIMEOUT_USEC);
> +		if (err)
> +			return err;
> +	}
> =20
>  	if (pvr_dev->fw_dev.processor_type =3D=3D PVR_FW_PROCESSOR_TYPE_META)=
 {
>  		err =3D pvr_meta_cr_read32(pvr_dev, META_CR_TxVECINT_BHALT, &reg_val=
ue);
> @@ -297,7 +312,13 @@ pvr_fw_stop(struct pvr_device *pvr_dev)
>  			skip_garten_idle =3D true;
>  	}
> =20
> -	if (!skip_garten_idle) {
> +	if (mars) {
> +		err =3D pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_MARS_IDLE,
> +					mars_idle_mask, mars_idle_mask,
> +					POLL_TIMEOUT_USEC);
> +		if (err)
> +			return err;
> +	} else if (!skip_garten_idle) {
>  		err =3D pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE,
>  					ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN,
>  					ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN,

--------------mTIlEmax5jBZZhK30lR0y0Fu--

--------------0I0HN0H1o0qENy3yfNpexnX0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZtWETAUDAAAAAAAKCRB5vBnz2d5qsGp/
AQCtdxR8nttoSRitFQMH5unUpq3dQt9FrsNPh8JRv4I56wD/b770XRQ0qDsC6YAZu/pV5t/IRA4d
uL6AAJG+nJBmZQU=
=UkdD
-----END PGP SIGNATURE-----

--------------0I0HN0H1o0qENy3yfNpexnX0--
