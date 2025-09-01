Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD1BB3E14E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 13:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4271210E42A;
	Mon,  1 Sep 2025 11:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="dWvjX8zO";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="iRCl1gVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F62410E429
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 11:16:49 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5816f2aX1725151; Mon, 1 Sep 2025 12:16:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=fUp5C5i+XGNOUoWdkWVF72vO2
 Gx5P1YaVLv2lGY7iHY=; b=dWvjX8zOn3INy780abc+mlMjtv0vITTywWALnkQG3
 cN9fQO/y7GxmLf+rGsde4WO5vPH9TKHvKUtsw7ZE6SYt8W3lIbjf85cOptGRIAla
 YG6qY6LeHHn2tcB/8MoCk0xOF/mb4IH/P09ur0E972FNLC5zVR9OwbHJTWdjN8MC
 i+maA3A3ZGhBRYz9zi0PNP1z52he77BJf7D5ZlIUqstY7ajh8TwTY0tcgQhNP5bg
 yhRbppGhi53JJFJarqJmLk+GEQwYgY1lVF2hOHObibxVTyIO42Z3N/tnkxGxvHEH
 yLu+C3G40wOUpo85vsytpNfEiqul7Euj7KMTSdFMAJexQ==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022107.outbound.protection.outlook.com [52.101.96.107])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 48uscshts5-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 01 Sep 2025 12:16:21 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oP+tdOu58f1kwOeqyhq53OqNiUqTilTDcihC+yl4AvGKzIdlJJf9+kC9wgey6l0294uS3aMsRKO3ESSpFkYr24xyNWJs0/E2ab7R4oljlgxV2AN21vG5dy3ApeTJfw45EpkKL+f4UPeu4bikaq0l9lrPVAxQQPx6Bq54s+0+IMglgOECsAuI2I6vwHDQ4tQx8oGDIT4tiBKSKBwD2aX4ULqac84y9KhW9HdhZrf0xEQJEy16WKChV5vUUR7e9r+VqizOX3y76Cr1c4XFdiZ7rVdAEWCr7AIK9nnm6BCWI7FzR9SmnheYymHeK382FL3ox9eJpkCEkoMwvs+g9x6VSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUp5C5i+XGNOUoWdkWVF72vO2Gx5P1YaVLv2lGY7iHY=;
 b=KTfdGjVV+Xn93c8LGVQoJ0fR6BUfefpU29yL/SWt4qPGSmKKMSkfgcAaXvcOHlJynGpCipL0WkbOx4M+zyddjJ1WzbprF2IJ9JdF8FZDvLRb6oST8VmJ88JuHiQEwi/Z409FjbTR98YJ9ZsRzrBgbgSY8Fti1+3OCHqkhzw3E+HJcdPs3Wx+W7mSpbCjHxzYe+pCTPbw3CT4r0YlWpbWPYyxYnxNVR7yQ6s7iozl/taWP30q1Y1ZN3TR+IIfAe75cuvcINh7repP6xbUyWRjzAWvjwU3Tpy1TmCUlfnb0zO/fZ6iABGXjdDJsqpNKlxOZAVpu5bzeExgOSCN9eA6HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUp5C5i+XGNOUoWdkWVF72vO2Gx5P1YaVLv2lGY7iHY=;
 b=iRCl1gVATuom0I5UkQeEKafaoX1d6Hx/dqz7WLfsEoQ/Dndpo7JXbzuLKprwrICnnUJyufkcg5j6EOTRot2jnESExCRt6wp/xunpLoCJ0C2YZxzzID5E6ixRk1d6H8i+oF/ki4IQ8JkWHNIe+6oL+YMfnJapda9lRQ1mH5G7D/8=
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::5)
 by LO4P265MB6779.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 11:16:18 +0000
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6016:e25d:b539:1ed1]) by LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6016:e25d:b539:1ed1%5]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 11:16:18 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Drew Fustini <fustini@kernel.org>
CC: Michal Wilczynski <m.wilczynski@samsung.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v13 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Thread-Topic: [PATCH v13 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Thread-Index: AQHcE6V+m0GwzHkHd06R4lk48JBqc7R3FtCAgAGPHQCABZZzgA==
Date: Mon, 1 Sep 2025 11:16:18 +0000
Message-ID: <a329ff82-ca79-41ac-b61e-e843103f55a6@imgtec.com>
References: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
 <CGME20250821222023eucas1p1805feda41e485de76c2981beb8b9102d@eucas1p1.samsung.com>
 <20250822-apr_14_for_sending-v13-3-af656f7cc6c3@samsung.com>
 <aKjWiU4fQw3k77GR@x1> <aK-BwY8c-OR_WqNk@thelio> <aLDQjq9U_mDvMTJo@gen8>
In-Reply-To: <aLDQjq9U_mDvMTJo@gen8>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB3404:EE_|LO4P265MB6779:EE_
x-ms-office365-filtering-correlation-id: 416c6a54-7d01-4ed2-7373-08dde948f91c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?K01GL1NLOXNaMDlxSC9MMmt3blUvbnZ6RzlhcFlVdjlzUEV1QlZUa3NhYkFS?=
 =?utf-8?B?VklkU2tTeWNKcE5ObUF6QnhuSVFTWVBxSHl0ZW14U21oTTF1TEtXNTJNaU5x?=
 =?utf-8?B?VnZRd3htTTVBMUNFUTk1d0ROTTZ5L3pnVFZyLzhBOFdvOG90ZWtXbzY5U2VX?=
 =?utf-8?B?ZzQzWlZUVmVlSXFSOFArbTBGTFpRTE1waThhSjBWRkZjaUkxUzczaDcxeFFa?=
 =?utf-8?B?OTFYVkpURmxvK2MxV09Hb2lRYitEN3cwaWljTnNTVFBhVFNhTnoyYjc2WlU2?=
 =?utf-8?B?a3pYaHpibFR4S2VXMkNWR3pUbjVpdVhvOG5Mb1NsblhBQVlGTHdXajhMQU50?=
 =?utf-8?B?SGRZN01iWlczQVF1UXFDTmxmcUZlcUNVVHcyM3ZTdVpTRk9NR0ppN1hGRmVa?=
 =?utf-8?B?S3dVaEwyUGdwbGZZK05sRmRpQ3RJY2w2Nk5EZlFIOFZKdHBGTU8xRUo1Rmgz?=
 =?utf-8?B?QUhVRnlaSDRlOSt1cXV5OW9HKzk4aDJPeW5rZ0pWVnFQZ1VyMnFRYncxY2JY?=
 =?utf-8?B?Z1lxVm5waDJUQlRtK3dEQ0JCaHdtb1BlaTRzd1hjL2dZTTRTZllmZjhidk9a?=
 =?utf-8?B?dkZScjdVUTBUZzlCSHMzYzBKNG9WaFU4bHl3Mks1ZnVROFNYT01pTmgwM2Yz?=
 =?utf-8?B?VGV6SWRKZlE4bUFQMDhpcTRlWk4yMWNqSTB4MDQ4VWNlVk5EZGJyTFFFcUNC?=
 =?utf-8?B?MFY0NWc4QTVzUXRzYnBUWTc0bCtrWEVEbWJneDlMYkpTZTFPVVlYTkJmR3lm?=
 =?utf-8?B?Q0NXcFI0ZDBXRk5rSWhHeTBpclRRRWZ6YS8xV1ZKT0JNQkJrQTAydHMvdVBu?=
 =?utf-8?B?ZE4rQ3EraVp1L1J0NWZ5ak1GbWpDaDRyNUdrTkU4WVBxbHE5OWYwZGpla3V4?=
 =?utf-8?B?WmM3dHpsdTJ6dHZhdmJxOHVDb1pTaElRU1NmenF6aXpsZ3ZhazRJUzFTQ1pW?=
 =?utf-8?B?MGZJT0hkZ1VIejRzN3hzVUxHR3ZxTC9wNFo2d1FTTWMvTDFpRGRJNnF4TGJ0?=
 =?utf-8?B?RnhCNzhOWW94VWwvdEVmdGpRNm9rZHVtTFpuSWdMQVhLY1UxNGMrbVdvbkZQ?=
 =?utf-8?B?eFhxaVNEeUhnQzdNSm1ocUYvSkc4VGZBaHU0bWFtaFdSNEF4MVNtb1Bjd29a?=
 =?utf-8?B?WjJhT2s1Z1NkWWFHSXpMTUJsNmd5NTNzSHl4aGJSUE1aRm1uM1M2MHpuV1lx?=
 =?utf-8?B?TlA0QUtFelhVSGM1Nmk3dkFkSEtETjdKczErZlV1UU1vYndCVm5abTNsVkpq?=
 =?utf-8?B?Znp6Z1oxRXUxaWs2NXRjNm0zTUY1c0twSjROeEFPRU9mTE5ndlZsUnJiZU1o?=
 =?utf-8?B?NXJTVzNLaDF5TU1kekZHR0FoQncza25tcVNOVWhxcTFaa3NZVTErNmdJVUp0?=
 =?utf-8?B?V3RIanJLcE9MMkh0bUYrb1hhNUMzNHJsbzc5aGM4SGh2aDBDYVBlL0V4UVBY?=
 =?utf-8?B?UlNxQ1NvSDFsdGRRTWdJWVdOaWx1OHJXZ1ViRjA1NGF1RmlBd2lGQVpJM3Fm?=
 =?utf-8?B?YkhEdi80b0NBY3UrVDJWa3ZFZmhlK3RqR3hWckhaNzI4Qjh1b0dBYkQ3czZY?=
 =?utf-8?B?RXhkaHpnNUx0WVlMakpid0xhZnF5Y3pPSWZCRXlSU1o1azRpNDRQQWwwYSsx?=
 =?utf-8?B?aFZydElDY0svbmErNlVOd2htYUVFaG5UaDcycjdHMVFvazNycXJuc2dDSk5p?=
 =?utf-8?B?a3ZsM3lSV1Vhc0xRMnFhTnQwNUpYY3RuUGdWNStFZGZlekI1Kzh4bjMvWUZT?=
 =?utf-8?B?SjZiTEVhZ2JDL213eXl5QzVzMitzRTFDMVozZ3BxRFE0Ry9iUWdSdGRBWTVG?=
 =?utf-8?B?dGVJOEVVY2FTcENJUnB2QmNJM0ZkT3hodlFSM0JrNWFXRVh5NEJ1ZHFkaGgx?=
 =?utf-8?B?OVo0bHdWVzlDa0tDTlo0ekpiUTFNSkY4NGxmd1hYdnYxNzF6dmJWVnh5aERV?=
 =?utf-8?B?MEkzam1pcGpIVnB3R1hwalZHSG1SUFgvTmtmRmY0YjQxZG1qNWMvYWdmVmh0?=
 =?utf-8?Q?DPuEjg0yKS96l9sTvApldAX+LQvWHQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUVxT3V0ZlZzR1NKYzhJOFBUZE1lU2ZEbUN6YlRHdGQzakVDRGN2MXNlU0NB?=
 =?utf-8?B?UFo3VzQ5UnNHL2dHVmNnS1E1dmF2K1pZVkRXdWc4Smk5Rjk5ZlJCdkJxeHhZ?=
 =?utf-8?B?THM5MWxQYXFZNEMvTUFjZEFpQ0s0OFlWN2NIb3ZRUmlXVUQ0aGhORkFlaU82?=
 =?utf-8?B?aGN5T0dMQ3hNK1R3aVVaKzhGNEw5Z3FFVm9PTU1mTEhCY0hPWDBySGJwRU9O?=
 =?utf-8?B?MEd6NzF6a3B2VUQ3bzdpdXlJZVJYNUllbkd2ZWtGK3hvTm11UmgzMFdIYjBy?=
 =?utf-8?B?OW9YTDVsT2poRVdCUVpsQVZxUnVyRU9tZFg1OHMxZmJHeDNQLzd3WUNVYklZ?=
 =?utf-8?B?anpndmRpNm45NmdjOXBmc3NXZzR6eHdPZXhLY1pEb3hBWDBZT1BPYXE5a3A3?=
 =?utf-8?B?eGJ2MktDVEF5MTZIOEdIVFo0c09lTDVLVm9oVTZ1NjlTWlB2QWNYSmVKdk1q?=
 =?utf-8?B?NXNTWFlHb0oyaDl5R2ZBamV0MUdKMGVuMmVUaUErYUduRFhCOGxqa0dTOEhO?=
 =?utf-8?B?eW5RWG1iWEo3eTJkRDBXdnI2YWpHRnhzWEI3WDlJb24yeDJSc3NhZHNRb2F2?=
 =?utf-8?B?bldIbVJPMVQvQjE5NUNoYWphVWpZUWxNQ1kxMlFUeEpFdGhuaFkvV2VZb0da?=
 =?utf-8?B?eXllMjdmOXk1aGpkRTJjTEdWNHMxZVZwTEd6R0VhbVkxVnQwVHA4UXh5aHp0?=
 =?utf-8?B?aTFoOER1YjNyYUdiRk5Kcmk2VkdxL0pBNDFzV1dpYWE4THpLb2hTa2pDWTht?=
 =?utf-8?B?aWtsMlp1WFpDUXpRaldDamJOWFh1c2xHendzTXJuRUZaUzFsSWtGV3ZYNmVk?=
 =?utf-8?B?bFJMT0IxaW51ejdUZGFJWDBYRWllMkFCOUZjRkM1VFd3ZkhqUHkxZloybVdG?=
 =?utf-8?B?cEIxZEhUM3FSeEx6cUJTdU1UMyt0elM4aFk3OVVRNzhhSWR2QWRjOEdLOGgr?=
 =?utf-8?B?SGJFWHU0Wm85VDc4TGljMWxBaUFVanVYaVRKc1JUWjhqTG9QVUR2TllWSzZP?=
 =?utf-8?B?dFhDT216ZDBuNlQ3VG5kUDA1UW1lbXpUMENLazF5RzBWd3ZzRzE3YitnRW5Z?=
 =?utf-8?B?N2VBTnpsUGE5aWZVQUEwUHhuL2VBUGlRRFpiSVVNdG52M2RnVk8wNndyRFU4?=
 =?utf-8?B?eWVqVlQ2bUp2VWpMUEN2ZTFXQXV3RDY1ZjlIRFhzYlozdDZpaFY5Nm4xYUtt?=
 =?utf-8?B?OWxteWo5UnBMWk5rdVhIbkJFK0dEaTVEQ0c3M3BxK1ZjOUt4QTgvdHY3Wnlp?=
 =?utf-8?B?ZnloUGQrV25VeXVzN1MvQ2pYeFdWZzRrNjgrU2RubDY2dEhRTHdjNXN0MXhn?=
 =?utf-8?B?VUp6di9jYm1SOFRxdVRCU2lvZ21GaDZwa1R3UHdvNUtoUVRSZnFlVi9EWWdG?=
 =?utf-8?B?aDJncjdPWGN6U1hYK3F0K2M1Q0o4WTE3YmNRS3VsR3FXb095WU83RjYwdGdD?=
 =?utf-8?B?REhld2ZOWXdKMldhNkVoWmtQcmRjaVZ2YnNWZkZrNWozcHo4Zlp4VEFuZGh0?=
 =?utf-8?B?OXROS1Jqd3hGK3g0UGNCTGlkRTNjNlN3SUcvZzFYNk1uWWZhSVQrczRCZHBV?=
 =?utf-8?B?NXh5eGsyU2NpTkQyd2tyWVR1OWJ3SG5QemF0K0dRb1l0SnoyOXY3V09yRHlo?=
 =?utf-8?B?TkQyZDRkTXpsZUpReXFwSGxENmJnOWZlQzdub1kvWDRIb3dUUzUyTytMZzhp?=
 =?utf-8?B?MWpGcDdsUGw5TllPbkRHTTM4dnpxKyt6UFVIcjQxZXNGa3pRUE8yNHlEZGJp?=
 =?utf-8?B?TFhQYTlJRW5kYWNxWDlWaENGTndJUll0bUw3cUhxOENsb3E3NThud2E5V3Uv?=
 =?utf-8?B?WStxdVlJM0pIUEsweDRRNEtTVzdjRnF4cHdoNUlnMXc3eklFN1N2dDl2cExI?=
 =?utf-8?B?OUhadU1kZlc5NXZYU3R4T1ByN0N4eU55aWNjOW5nOU00dmwxTXJydStnWnEr?=
 =?utf-8?B?d01wb3VCakVyZFdtOFN3aUNSWm9LTGpUV0RZc2wvNDBTT083UzVnNU1YWWZT?=
 =?utf-8?B?UlFYNWRmeHVCM3ZmV1RIdVNmTTBzV2paZG5maWsvcmRVOWtKbDBnSjlya1ha?=
 =?utf-8?B?c091WCtGNlBiZHdrb09mdldjeFhkTURmQUJ6a09oSG9DVVdFcDhTYi8yZitw?=
 =?utf-8?B?T01iTDArVXNqdTAzY05rNXV0M0VCTzFoamdXNnBKR2c1VTdiMEdZVU1aNFR2?=
 =?utf-8?B?NFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rHW15qCDbrN0JgGXO6KhR1Ml"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 416c6a54-7d01-4ed2-7373-08dde948f91c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 11:16:18.2585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcFpaYedbm0lklhAe0sxd9/bTHVBpvGA4oHf+1MND8MQgrfm3OViTLUeBR0klzQFjlEFLymRPjlJEcMzg29UXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6779
X-Proofpoint-ORIG-GUID: OkPAhazwsNd0L6RMv2EwQDcDWJ1R_3v6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEyMCBTYWx0ZWRfX4z+tI3eoVt01
 tG+1nYYZ2tctIscByu5IGxHhjfI2vVccfmKEb/s1vzOJJVRegb2ula+WhCqeuH32mwMQ3WCH8Mo
 ymVRrHUc99FVMSuaX1LeIwbdNkRUQ2aE79t9xXQvlixoSqPj1Wm9y4nlahCoCsICjGN5VorCQpo
 fYhEDWbTtu97Q0do08HSw5RBFekSBEz/mcjLe67SoPxuzD9ccQquOfmWwG1vR/MWxd/yNHn/LIn
 /b2FUrLoH5Uus9cdgY2dgJi5PfwbaTUkgznofqQiTmTLnQcj1nKBQtH1lU98V1q2ivM4/JXF3A9
 34qVSiosAF5oChgbA3gLcOEhb6UYjP1etHMqvdmVCud9SjXJd2X+J192cmlI1M=
X-Authority-Analysis: v=2.4 cv=GtdC+l1C c=1 sm=1 tr=0 ts=68b58087 cx=c_pps
 a=BVlPTUHEdyGWsQesGsPzag==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=KKAkSRfTAAAA:8
 a=8TDWt9qEAAAA:8 a=hD80L64hAAAA:8 a=jfUe7C8prb4qZSu0H7oA:9 a=QEXdDO2ut3YA:10
 a=A9360hjEzD9n6dWme0IA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
 a=cvBusfyB2V15izCimMoJ:22 a=ERxVmvoQgHyZXf33qDKr:22
X-Proofpoint-GUID: OkPAhazwsNd0L6RMv2EwQDcDWJ1R_3v6
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

--------------rHW15qCDbrN0JgGXO6KhR1Ml
Content-Type: multipart/mixed; boundary="------------AVD6o0YOr3S6wgAVMLkw14vq";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Drew Fustini <fustini@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <a329ff82-ca79-41ac-b61e-e843103f55a6@imgtec.com>
Subject: Re: [PATCH v13 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
References: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
 <CGME20250821222023eucas1p1805feda41e485de76c2981beb8b9102d@eucas1p1.samsung.com>
 <20250822-apr_14_for_sending-v13-3-af656f7cc6c3@samsung.com>
 <aKjWiU4fQw3k77GR@x1> <aK-BwY8c-OR_WqNk@thelio> <aLDQjq9U_mDvMTJo@gen8>
In-Reply-To: <aLDQjq9U_mDvMTJo@gen8>

--------------AVD6o0YOr3S6wgAVMLkw14vq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28/08/2025 22:56, Drew Fustini wrote:
> On Wed, Aug 27, 2025 at 03:08:01PM -0700, Drew Fustini wrote:
>> On Fri, Aug 22, 2025 at 01:43:53PM -0700, Drew Fustini wrote:
>>> On Fri, Aug 22, 2025 at 12:20:17AM +0200, Michal Wilczynski wrote:
>>>> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEA=
D
>>>> TH1520 SoC used by the Lichee Pi 4A board. This node enables support=
 for
>>>> the GPU using the drm/imagination driver.
>>>>
>>>> By adding this node, the kernel can recognize and initialize the GPU=
,
>>>> providing graphics acceleration capabilities on the Lichee Pi 4A and=

>>>> other boards based on the TH1520 SoC.
>>>>
>>>> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can'=
t be
>>>> controlled programatically.
>>>>
>>>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>>>> Reviewed-by: Drew Fustini <drew@pdp7.com>
>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>> Acked-by: Matt Coster <matt.coster@imgtec.com>
>>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>>> ---
>>>>  arch/riscv/boot/dts/thead/th1520.dtsi | 21 +++++++++++++++++++++
>>>>  1 file changed, 21 insertions(+)
>>>
>>> I've applied this to thead-dt-for-next [1]:
>>>
>>> 0f78e44fb857 ("riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node")=

>>>
>>> Thanks,
>>> Drew
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git=
/log/?h=3Dthead-dt-for-next
>>
>> Hi Matt,
>>
>> Do you know when the dt binding patch will be applied to
>> the drm-misc/for-linux-next tree?
>>
>> I applied the dts patch but it is creating a warning in next right now=
=2E
>> If the binding won't show up soon in drm-misc, then I'll remove this d=
ts
>> patch from next as dtbs_check is now failing in next. I can add it bac=
k
>> once the binding makes it to next.
>=20
> I've now removed this patch from thead-dt-for-next and will add it back=

> once the bindings show up in next.

Hi Drew,

Apologies for the delay, I was on holiday last week.

I've just applied the non-dts patches to drm-misc-next [1], would you
mind re-adding the dts patch to thead-dt-for-next?

Cheers,
Matt

[1]: https://lore.kernel.org/r/175672521205.30950.2944854121832397083.b4-=
ty@imgtec.com

>=20
> Thanks,
> Drew


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------AVD6o0YOr3S6wgAVMLkw14vq--

--------------rHW15qCDbrN0JgGXO6KhR1Ml
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaLWAgQUDAAAAAAAKCRB5vBnz2d5qsD30
AP0bWTxsE/Z3/zziHqrl5bNC0sZ02ck/iu3wR/sjqsaa+QEAkNkKiVQhDI7hGWQGcBwhESlgG6EJ
4q0PHkG2igst6Q8=
=mK/y
-----END PGP SIGNATURE-----

--------------rHW15qCDbrN0JgGXO6KhR1Ml--
