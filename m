Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDB6A23FF7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 17:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A976E10E377;
	Fri, 31 Jan 2025 15:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="y2d3qYia";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="PmRu2T4e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12A010E378
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 15:59:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VF56W2028214;
 Fri, 31 Jan 2025 15:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=4S52QNc0oLKOsf3Qz5WCgbcpg
 oK+MJMIM8ZC43ztLY8=; b=y2d3qYiarIJT6Vgxw0ERPo4O+qAL9pmridU/ncSas
 93uTGzK+A+UWKz2G50KSRKs1unK0Mm9wJZoqrmoxjG95nHJkgszx3tzseZj5NsTR
 smmtNBOQlOqpYdEk39qw2zqOSIuVsxtvIvxp2kkbFFMw3wcX8FH9xAHwMcvhJr66
 q/FQaArJcwgBLZvnxv8WGYGjQI/HwmgKdoYOF12MfN6wcZo46EZm/SHo3n7qRLFz
 FVhRGxet+CegFHc+KTg831kUFoe4S8eNEs/ZVMCOZiKc92/owQV0XNkfSoIKt3U2
 6bxCyIlVdCbBpi2FzLp+9f2UWkUq2RMeY3T6fM1MpfYuA==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazlp17012052.outbound.protection.outlook.com [40.93.67.52])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 44ep3c302y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 15:39:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gw3Z+F3eNaBqOxRtTrSr8VEcazyRTc0kQMgZELfaKYbWbrratG8ljBUNqelcufUf4qm8DaddcCsvwhPZyo86fgUYnI+k49eBoNZ0sk9wRjj/xRPGSjfjWjo24XAkaz3g21ucfOuYqbddNZ69T775WSJRI2XVestuBbUkwVA7O7qM1gJcy2NQwPXnXb74kW04ZX9SHkv4B+WWae3WRQYXbq4h5j68kyEd5DkeZBnZRO28JRvdcJWS79B9fjuIONK+ZK8U/HaLiyd9i3+84wAf11lp50JLTU/YOEfdRUvC/PUabSOTxC8xmpn06Iq5Dh8lsuDhJbtQajvMa3JZL8j2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4S52QNc0oLKOsf3Qz5WCgbcpgoK+MJMIM8ZC43ztLY8=;
 b=vk3IavfCn/4AZhBf6v4cYmp10juuy6SYklx5IM80GBH1Fl/GhwHl/4n5HJBn1sn+aWMv+lqEnzdayHD94mI4Mlt808zsp2bwUGn/W7/So3Lh2xUQ6BsPY1RYt73YBhOpkcb9OR5D9gI2XRChMQU8iJ8hVfEyz8zx3fcO9B7EUlqbgWjOKOnbz1kvlaRr/XuTW+3qkLwShU21tH9jmZAFekpkNZ6hqaINgAhIaGd9ifO7+Mf1vnnzKWehUReJMgNtCFiDHMG/MTgiq5NkxU/zhkbOhFw5bLu0BS52n+BuRehwjZYb/X4aGvwdIrrSqRc7xYlVle/b2r55yUcuhcpe2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4S52QNc0oLKOsf3Qz5WCgbcpgoK+MJMIM8ZC43ztLY8=;
 b=PmRu2T4eR+p9J8ZT8Mm5JFcc4HgX1Z7GQTiUWtRdl4rXI6B+FwVfFdZc2SSRtyAmW7X6hImsbngpte0WtOTpbtpgF3UlLg+6E9EkOjBvEwSRJkRzNXKXPzxFmmctRaLOaMBKEKiouVHQeVp4BCt8GHci06NBzpBW9YFGHYNX7sY=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB5503.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:287::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.20; Fri, 31 Jan 2025 15:39:42 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 15:39:41 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "drew@pdp7.com" <drew@pdp7.com>, "guoren@kernel.org" <guoren@kernel.org>,
 "wefu@redhat.com" <wefu@redhat.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Frank Binns
 <Frank.Binns@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "jszhang@kernel.org"
 <jszhang@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 12/18] dt-bindings: gpu: Add support for T-HEAD TH1520
 GPU
Thread-Topic: [PATCH v4 12/18] dt-bindings: gpu: Add support for T-HEAD TH1520
 GPU
Thread-Index: AQHbc/ZYt0fdrtsWzkiY4ycg3g+HiA==
Date: Fri, 31 Jan 2025 15:39:41 +0000
Message-ID: <2fe3d93f-62ac-4439-ac17-d81137f6410a@imgtec.com>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194841eucas1p29048dc05a26475d8323a7a318a8c7a25@eucas1p2.samsung.com>
 <20250128194816.2185326-13-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-13-m.wilczynski@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB5503:EE_
x-ms-office365-filtering-correlation-id: 4c0e4822-821c-417a-cb3c-08dd420d7ad4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?V2ZyakpHbktOZk5vdExTTWRIN1c3M0N2N1hDUnozVENwWTVrQ29ubjBSWWFD?=
 =?utf-8?B?R09XYkRZSkR5RTRHcXVhSFphMWx3OHlnZ1V0MGFnOTZTVWx5UVQzV3Iwbndp?=
 =?utf-8?B?VWRhN3RMZjFiWUFqdmdSOXlSYTRyU1FNRmlCRlZuK21ERVV1ZUxIZ2ZEY3A5?=
 =?utf-8?B?ckNyeFkvWnR1Z2RVMlF5ZUFRNkEySkRObUE5WjFaREdFVm1BWUpzL1lJNHFa?=
 =?utf-8?B?eTZWekN4OVNRNlkrMC91Mlh1R2hURURjNk5xZ1RCKzFYMGcwNkpFeXRrRXVX?=
 =?utf-8?B?blRKVWd2ZE81TVNNUzdDeWFxUmZKRkJxK3dza1RibGVaWWJDZk1EVXgydlM1?=
 =?utf-8?B?RDc4cTAyczUvb1l2SDFTWWxERGE0aHVnMG9sRkVaWGNHRFpyL0hMS2FXTURJ?=
 =?utf-8?B?dFdIUGpYdEJmbVI0NFhvb3NzWWR1SXltT0k2TkNpVjBhQkkrSzhqQnFrZUFP?=
 =?utf-8?B?UWd1TVZBQSs1Nkk5NVlvb1hobGRaMFNxcjFORXBERnZrYXJjUFV6V1dJZHhn?=
 =?utf-8?B?d0hVaGxGNk1lSXN3S1BIQU1ZY1pPYWtMSzQyaUhlSzRXRjRJTnB6MHhJTllJ?=
 =?utf-8?B?bFl5WDhYMFVjSG1tRU9hc3d6cWFhUUxoZ1l3WWhBZG04a2s3VGVoMEVuR25r?=
 =?utf-8?B?Tko1N2Y2c3l1dklHMndQOVJMTjFENHE2Y2p4TWtMb08vSVVGdHJhZFBxWXMr?=
 =?utf-8?B?enE5NjJBbWJGOTFuVzJBd0Yxc3hvTVhxUkdQWEVCa2U2TzZlMENHQ0lQR2hJ?=
 =?utf-8?B?L3cxcnVnN21oL050MHFjV3ZIUWN6T1RHZXdkZXY5VE1MQ1hsblZaanJlZld4?=
 =?utf-8?B?SWRjQ1B4Z2UwVE1xOVRxUEM0S0xzSWpVSkNoUlBLWnNBL2UyWXR3YlNiYXBF?=
 =?utf-8?B?d3dFUlhPcnUwRGVXQ0w3TWFDUk1zWW1VWER3S2dWRGFZbE5iMFNPYW5GOHhM?=
 =?utf-8?B?WWZnSkp4RU54djJLSFNDSzNaNElxZTdPdmNjaHM5ODg2aUZnQ1J0TXVoT3ZY?=
 =?utf-8?B?bWhwc0xEYVNOTUFBVE1mbFNTN2ZlSkxrNXA5aHZDWmdvd0tPcllvN3J0aE0y?=
 =?utf-8?B?L3ArcEE3VS9mdi9PWERMQ2ZKczU2L2FudURWWUtmd285azN5QUdkVWcyUzZx?=
 =?utf-8?B?UXJob3BSVGhrRnduNTJ5MFVDcFNkb3BqeWJIYXhtamliOVFRUEJDTkMvY1c5?=
 =?utf-8?B?YWFHUG1KWXltcnh5NUIveVZvUndPbXErWi9tQmhpTk1FVFFua3pwTHJNdis3?=
 =?utf-8?B?SEZITW5UMEtZSGpqS3FnSUlFZ3A5Tzl6RXVlVzhTajE0NWt1SVhQSnZLZXRG?=
 =?utf-8?B?bUJEWDYwTWVZY3diZlJrWHNRaU1vSlVCL3BJdTJjZ3RFeG1uRHpYcWI2QjZu?=
 =?utf-8?B?bGc3SWFFbHBjMCtLTVU5V2NaWVZ6R2o3UDBtY3M0VkxaQ3o4d3lLVHI0MnNR?=
 =?utf-8?B?bHo4b3ZyY2xnYUQrM3hXWVp4ZzVGN3gwdmRUQlI3clI3ekQrNElUVmgvTkhu?=
 =?utf-8?B?dzdYeUhNakJpUWM5T2tjR2hPend4dWQxd1JrNTdNYXVHeGlwblVqTG9LTzUx?=
 =?utf-8?B?ZHFLeHFqSzYreisrTHQreUdvTXJiMmtoV0k4TlNqOGk5K25xeC9kYkpHUzRU?=
 =?utf-8?B?Rjc3dmdtUGtrZ3NVY01VeVlBcFZIaTJSdjdadEgybHVrSStPN3RxczdiSHRE?=
 =?utf-8?B?bG5PNjhFRStkME5yU29CWUJBenUrZnVrMVFPTCtBYnFONlVwTjJtLzBPa2k3?=
 =?utf-8?B?NWVKblJucUY4QWEzajI1dG9VL0RuZnFZcENqNnY5dGQ3aURicnhvZFVpUHp6?=
 =?utf-8?B?QnQ4QkdGbmFpQjJRblI3VW92NVY3YWk1QXg0ZllIMWFkeVlaalNNblg3WDI4?=
 =?utf-8?B?VERweU5sZEUyYm5HZDZxdVFkQllGNVY4bE9rc3JNc0NuOFZHZ0JGRkp3bkNw?=
 =?utf-8?B?SnZaRmwrYUJwTElrSUo0a1dwUWtGTUZBeXI5bFhmd0hIUWU0aVc3bVhWeTBE?=
 =?utf-8?B?clBRQ2dqQlZRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDlXQU1HR3NzRyswdGdUK053NnRtMUFQdlZzUm9FNHpXamNJUDhpb3JnTkZH?=
 =?utf-8?B?NUxIaENaem5PQ3U3cFd3MlJCUW4wZ2FnQVU2eU5RcGJrVnFKN015Y2ZVRENa?=
 =?utf-8?B?bytwYmdFV0RhR0s4VFdkV3U1S0I3a1BpT2YvNzZRT1YvZ0xtd3c2UGJIYlFr?=
 =?utf-8?B?d2hDOGQzVnMxdmpEa2ZNaG5SbUhNU0trb0w3MGZLdHMydnNMSGY0aXJneVhI?=
 =?utf-8?B?Nlp5YlN1c1NUMDNCSmt4YzdndjMybXNBNlFiSjJtaUpFMHA1VkxPZGlCdDVh?=
 =?utf-8?B?ZndXNkhacnVzVTB3STBhOU9jUTc5blFmekM4WGoyQlF5T0xtYXc1WUErZk1Z?=
 =?utf-8?B?S01PYVV5UWtRQ1V1bm85dlVOWGV0QUZzWWNONEZ2UWlJbHpsbnVzaVFXdk5a?=
 =?utf-8?B?OWRlaGNzUVRvYndoU3FQcUhBUlliYWdIRFY2TjJoTUtFdU1kUjB1MmpFaVMw?=
 =?utf-8?B?azNTVnpzSUZQTWFxQks4dE5tT21lTHRPczFIQXA5bUtOWmxRdExXdmFEYk9u?=
 =?utf-8?B?djlJcENtQVpFQjhaMlQweFZhaXhoaWo2MVJwODdSMDU4OEdEQkNxbUxVR3pL?=
 =?utf-8?B?bnBkczZTMlR5UzJVL0F5aWQyTEtqaFBXOVZabTdlQ3VoejZjSkt2TmZmMGZ1?=
 =?utf-8?B?UmsvdTdSMEY3SHdOZklXMFBOZi9STW5RRllZaHNwZ2dFby9BWlBzbmdxdU9q?=
 =?utf-8?B?YkxqUGQ1Q2tXZ3hUSjZUYkg5Zm5mL2RoczlEMG40UlVmMlZ4Tk0yRHZOSjNU?=
 =?utf-8?B?Ny8yaCtPZ2V4aDVncWVCTXBpbWsydmVNYTJlK3dyWkVaR24xcXNGZVZOelhX?=
 =?utf-8?B?K3BSTjZCZHJGdUpMcUlUblBKMkVUZEEwcXl2dTgxeEtkZEpUOTA5YlE0RHpZ?=
 =?utf-8?B?dEZTODRGVjZ5Q2UvdUVIcW5LL2h5VmZJcW1mYncxbXROSDJNM2lTZ2g2KzJF?=
 =?utf-8?B?Qm5aeGQrT1VvbEJIUEtoWnhjblJRU3JEaXpoL1hhYnlnNG43bEt6UWpiV3ZT?=
 =?utf-8?B?UCtPZGtiWlRyQUwveXlSVlFpL0RRVlpXK3VDVmtBRXNjQkNVZWlqbG10ZXZI?=
 =?utf-8?B?bFduWjFna0Z2ckY5MVMya1Zzak5mK3k0WjkwWEE5TlFZSjV6L0FBMDMyemsz?=
 =?utf-8?B?NTlSaW0rR2U2ZFNoS1gwRmJJZnJxRHF6UnB5cnhrZjgvc0lScFc3dFl0VzNI?=
 =?utf-8?B?YXJQd1pRQ1ZPNlhmb3UvVW1ENjdscmtOZnJVeW5jMVRYdExyc2JVSzNIZXFZ?=
 =?utf-8?B?dUQ3blRkaUVNbDFLcDE2RGhDOFVaV3N0QlY3VXZSYUlObTFDNUsyYkNhaE5J?=
 =?utf-8?B?czBvdzA4MEpoRjdtOFVtMkwzcy93N3ltcXJYRVpLa3N0ZmhHd0hoS2tEQUlr?=
 =?utf-8?B?VXhCOXo3RC9zOGg5RGgxNUNLSTkvM3BJWGlWSVBoZ1dsaldoWU1rbytVdlU3?=
 =?utf-8?B?RTJpNFA4Yy9BN3JSWjlPaU5iV095MGZ4Y3U4dVdBZGNvU1huL0pFZ1NDcWxG?=
 =?utf-8?B?RWg3ZFQ5bEdJYkRVRmNPR0R4bjRjQ1d5WVBBNUJ2WVVWVWczWVVndWQ3WVV2?=
 =?utf-8?B?YW5oSS9KdndxblhMcXp2U0lIeUxQbnluL0R2UERmY3FyUXRTTy9vUE9PbVZ3?=
 =?utf-8?B?ZWtxRVhYd09FbU9jeEdxcDFuNTE4TXB4Nkp6c1U3QjZhMmhGWEI3Y2tzRUtU?=
 =?utf-8?B?R0UxTUI5R2NhSGJSc0tKNHkxa2VkUGd3elFxMnhsVHRjWk1CMUdNZXA1SG5h?=
 =?utf-8?B?V0FXNXdEU2paNWVUaXlHTFdqcjk1b0tsMWp0ekhuR3F5WStrQk52N2xraW44?=
 =?utf-8?B?OTVvZlROT3hsVlFkd3NmY01qdWN6SFdabktMZHFTSFRzR3kxMnEwZEM5NEts?=
 =?utf-8?B?RzlUeU56cm53VDRad1dSUmtBako3c2hLbVVSSXMrUFlyQ29nMFVqdnMrMjE5?=
 =?utf-8?B?NjdpQ0ZXclF3NUd5T1RtbUJnbE5MSkQ0UElBaVQ3UEE0Uk1RUm0yZDQ2U0V4?=
 =?utf-8?B?QUtkWEk3Z0xOeGkzZ1JldEJ3ZjA2c1U2RzFJYVRrWmtpM1lZV3hFRUtZMWov?=
 =?utf-8?B?MlZVZDVySkljdHZrN3Vqekp0VWxBWVdoeGxWMkdRZ0VHNnMwbGpmZUtFaDlo?=
 =?utf-8?B?ZWo5WGtIbzNQeVJkMVd6ZGlvUVlwMVdqNnpUUlFNci9UWW41UkdJL2ZRWUVz?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------icqSmFcs0ol6qu0Qgm0EhTR5"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0e4822-821c-417a-cb3c-08dd420d7ad4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 15:39:41.8832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N41UDLQ6YCWho4wqCwQX2A2kFRBCL/+nLniwlEMp2avkXerni8BNKyNpB1hffRHOVo806H5kKZYAWR8pKXyaDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5503
X-Proofpoint-GUID: lSn58D18wfumlDUVw804SCDnQy3mQ5yG
X-Authority-Analysis: v=2.4 cv=PoBpbxM3 c=1 sm=1 tr=0 ts=679ceec0 cx=c_pps
 a=+8G7KV7MoNjfk4g9SO/OOg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=-fQqvUCQEPmyFsL1sjYA:9 a=QEXdDO2ut3YA:10
 a=IuWS7esrMLBfnw7xo7YA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: lSn58D18wfumlDUVw804SCDnQy3mQ5yG
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

--------------icqSmFcs0ol6qu0Qgm0EhTR5
Content-Type: multipart/mixed; boundary="------------cd8sO06lL6Rmmg9xS505TJSh";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Message-ID: <2fe3d93f-62ac-4439-ac17-d81137f6410a@imgtec.com>
Subject: Re: [PATCH v4 12/18] dt-bindings: gpu: Add support for T-HEAD TH1520
 GPU
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194841eucas1p29048dc05a26475d8323a7a318a8c7a25@eucas1p2.samsung.com>
 <20250128194816.2185326-13-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-13-m.wilczynski@samsung.com>

--------------cd8sO06lL6Rmmg9xS505TJSh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28/01/2025 19:48, Michal Wilczynski wrote:
> Add bindings for the PowerVR BXM-4-64 GPU integrated in the T-HEAD
> TH1520 SoC.  This GPU requires two clocks.

None of the IMG Rogue GPUs use two clocks; they're all either one or
three. The TRM for the TH1520 I have shows the standard three (core,
cfg and mem). I mentioned this on P2 ("clk: thead: Add clock support for
VO subsystem in T-Head TH1520 SoC"); can you add the missing clock here
too?

> Document the integration details including clock, reset, power domain
> and interrupt assignments. Add a dt-bindings example showing the proper=

> usage of the compatible string "thead,th1520-gpu" along with
> "img,img-bxm".
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/gpu/img,powervr-rogue.yaml       | 39 +++++++++++++++++--=

>  1 file changed, 35 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index bb607d4b1e07..b0d9635704d8 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -12,10 +12,15 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - ti,am62-gpu
> -      - const: img,img-axe # IMG AXE GPU model/revision is fully disco=
verable
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ti,am62-gpu
> +          - const: img,img-axe # IMG AXE GPU model/revision is fully d=
iscoverable
> +      - items:
> +          - enum:
> +              - thead,th1520-gpu
> +          - const: img,img-bxm

This is going to be the main conflict between this series and the other
B-Series series I mentioned on the cover letter. One of the main changes
in that series is to rework how our compatible strings are structured;
that would make this "thead,th1520-gpu", "img,img-bxm-4-64",
"img,img-rogue". Would you mind holding this change back until the other
series lands so we can avoid carrying a second deprecated compatible
string?

> =20
>    reg:
>      maxItems: 1
> @@ -60,6 +65,17 @@ allOf:
>          clocks:
>            maxItems: 1
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: thead,th1520-gpu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2

As mentioned before, this doesn't represent the hardware. Please bump to
3 and add the missing clock.

> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> @@ -74,3 +90,18 @@ examples:
>          interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>          power-domains =3D <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
>      };
> +
> +    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> +    #include <dt-bindings/power/thead,th1520-power.h>
> +    #include <dt-bindings/reset/thead,th1520-reset.h>
> +
> +    gpu: gpu@fff0000 {
> +        compatible =3D "thead,th1520-gpu", "img,img-bxm";
> +        reg =3D <0xfff0000 0x1000>;
> +        interrupt-parent =3D <&plic>;
> +        interrupts =3D <102 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clk CLK_GPU_CORE>, <&clk CLK_GPU_CFG_ACLK>;
> +        clock-names =3D "core", "mem";

You have CFG mapped to "mem" here. Out of curiosity, was that mismatch
required to make things work?

Cheers,
Matt

> +        power-domains =3D <&pd TH1520_GPU_PD>;
> +        resets =3D <&rst TH1520_RESET_ID_GPU>;
> +    };

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------cd8sO06lL6Rmmg9xS505TJSh--

--------------icqSmFcs0ol6qu0Qgm0EhTR5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ5zuvQUDAAAAAAAKCRB5vBnz2d5qsJUF
AQCD0JKAnBga6in10i6NbGYj4gArSjkg1YgWrQJ9UxDGJwD+LBl8Iw3i7RREhUwVo3SkQSEToBX6
6h9jXgpfJQOOGQw=
=lgkj
-----END PGP SIGNATURE-----

--------------icqSmFcs0ol6qu0Qgm0EhTR5--
