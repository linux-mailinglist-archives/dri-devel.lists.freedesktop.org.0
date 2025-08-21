Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD3B2F340
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 11:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE79B10E8BB;
	Thu, 21 Aug 2025 09:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="vmb+Ywws";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="QXtj1KEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E3510E8BB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 09:06:22 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 57L66OuX2840072; Thu, 21 Aug 2025 10:06:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=F7+PMqKVpbB9TWfb8gTyd6BAo
 QnSEy9v6vBeUD3fQ5M=; b=vmb+Ywwsj2AP4dWN08DVvOzzmSGbxnVJVSvadZ5QC
 IbQ41iN5ND5WJ8h+KZLIW7IrOMSzhM1nVkhDOK52Pk49SO1i0c2c6dmUAxa95p0M
 NY4mADpV7eadbIVixW/wyx3nhXXieHi7FoFpJEDY3YnkMcLkelpOayt/zT2NiaEV
 v+elx0WTxirZgbrG5yKOMLyfgxFUfXD8Lk4RA8s2qB2mqf+e4yFYubbuqOUigRQe
 z8J5ruQyNjnXetp+PWIDH02cQbq5ly8YqJBvyF4kgQoObk/AfSH5fCD6XOyex7V1
 S/z27RXvICvWFCwnXJuYN6d/4OERp+RQn0dy7eKx9WSRg==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022081.outbound.protection.outlook.com [52.101.96.81])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 48jg8k4y0x-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 21 Aug 2025 10:06:05 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcC7qn9eeBbBmXTih1fy7c2HlDALQQPIwoK/nYChcqjlxBA3DTRloK54ZD5lMAYkojS1bSdBMJ8E1GB8iZYdUdrEHAOwI7z4PtufNpeW/r/0eDQTDpAOaB/NIAJmCovDorIU7xGfAWe+0NooeZEDyGUgfU4P+1O1EyHMGm4lzKCsIcOhkq1pxOwYnAAlnCYIv6gha/I46purtAfrYA/d/11adD5B5CGNA7spDrkFuv4QeoCK6ceGUoHNaCGscuJklmBQS9a/1ikflEytVkIFevjP4aLYM4nHOusRiAWwAwtRhXJh90ndQbnQ/pS3MykTsZgCGWdQOhsOL2AEdnj8Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7+PMqKVpbB9TWfb8gTyd6BAoQnSEy9v6vBeUD3fQ5M=;
 b=M8VWbRlppj+5S55zZGa5/X03O4Fx1lidnsRzZlv6RRwJDYWQktfO8FmS504JGSOrKhyNtGDbHFgFjXIzjoIvx/pjw58auQP7HLFaxCRkR5X9SYhWVNkaPYpWHgurO0fsN4ucp94CAXAy5eiiJb+wwx2if+qrt5enJx2o3xdfVuXduzuAIDCGPIzHTtmhvIAxbs65gOPZhewCUNGcncBh2pC6zOaD74KykoEO6BV19MyLuriwldE9CpNgH3PeNWPb7GaVa4T7SMz4QRiV9vaNdFVTDxxdCb7A9ih/R1Er3VVrpPhXlU+P2oPfNy6jXEB+R65D0Q0tfiOWDQHg6SXa9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7+PMqKVpbB9TWfb8gTyd6BAoQnSEy9v6vBeUD3fQ5M=;
 b=QXtj1KEieGExa0RvaHv36HmYaQ2ia5k7Y9kOTvPA80W52wPseeSn5cFxMgNPywEcv9NB1eH/Ogv0r9or8xzxodvcJ3aTyvmX5uPmefrPagzVhuXoNR5nhX/1yajKe5BfDYqKzfv46TxJfkpMhRTwwQK96nYGj6I5Rl8gkC0wueQ=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB3609.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.13; Thu, 21 Aug 2025 09:06:02 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 09:06:02 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Drew
 Fustini <fustini@kernel.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v12 4/4] drm/imagination: Enable PowerVR driver for RISC-V
Thread-Topic: [PATCH v12 4/4] drm/imagination: Enable PowerVR driver for RISC-V
Thread-Index: AQHcEnrRiSAW7mx/e0OXzV6cfi5//w==
Date: Thu, 21 Aug 2025 09:06:01 +0000
Message-ID: <b70ec62f-e842-4f70-a4fd-b11afcfe46a8@imgtec.com>
References: <20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com>
 <CGME20250820085612eucas1p1ae19fd1baf24a0c445d1d439f944a2a7@eucas1p1.samsung.com>
 <20250820-apr_14_for_sending-v12-4-4213ccefbd05@samsung.com>
In-Reply-To: <20250820-apr_14_for_sending-v12-4-4213ccefbd05@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB3609:EE_
x-ms-office365-filtering-correlation-id: b4e43574-bcd3-4921-2bf1-08dde091f3b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?ak1BM0VPRDlrSnhoMklNMUJCYUltclFuVzF5cUpsV1psaEp4RUk5by91YThp?=
 =?utf-8?B?d0VjbUY5Q01HaWVLMi9tY1BBUGlpQWI2WC9vM0pIaUgwQmNLVU95NlNPdTR1?=
 =?utf-8?B?ZGRTRFM3WlMwUlkvSHo2WnZQZkpHSFNmRHJHWHRIWExFN3JkQ252M3hDUHVP?=
 =?utf-8?B?blZJTWNOS1lZQVU0cCtWcGlKeGxTTGZwT0lNWkVRaTdySy9OMlhkTXVEVnZC?=
 =?utf-8?B?ME5vRm55akpsYU9vMGF5anZIZnJvM0VmTng5U1N6dXIzdzdZUFBVcmN0Tmx2?=
 =?utf-8?B?RFNKR0JvQTJoc0pZWVU2WjBrTGJBYVV0Qmh0WldWWm5lVERiN3hIdldSdTQ4?=
 =?utf-8?B?cWpaYjRnd05Vd0pCOVJxeHI0aGJEOGpzdThvd2RFTTMwM1BhUE91UWpmdERj?=
 =?utf-8?B?ZTA3L1MvVTMydWw4d3JkV3JFZ3RmR21nbkNnNkRiQVlNTUVXQnJHMk1QZzVp?=
 =?utf-8?B?c1Z2bUdtenNUdW1qOE5Mc0puNEhEQTU5d1pTN1p3dmlTVXZQclBzRU84alhV?=
 =?utf-8?B?R0wweG9DYjNJVG8wV0ZOTkFNM0xDb3ZyQ3lEeVdCZWx6c2JDZVdad0hyY0NV?=
 =?utf-8?B?NHlJZFgrM2tHeDFycDRNdExKNEZnQzBFbVYzWkdoU2dyeDBrK0Q1UkEzMXp1?=
 =?utf-8?B?NTlSTFRzdERvY0lmcFgzODZDcGs1SEwycTM4cGhYdXNTb1owaFgzMGZsdWJw?=
 =?utf-8?B?eDNVaFEwbkVIbFVZN1VYNXRUU2VMdnE5VkxWaHZiTjZvaFowd2VFWE1henNx?=
 =?utf-8?B?RDNzOXBnZTNkWW9BYUdWMTQ2eW4zZ0E5MlRpbHJ0VjRXRFdKN0tWU1JoVEQz?=
 =?utf-8?B?ZXZOQWJoTFVzR0ZJUy9teGt5SWVKMC9LdU1heXJZS1lMR3l2bGkxRGNnMFFm?=
 =?utf-8?B?cXZPV05QVUhRTDJpNXhINGtxT0xzQ3NRWFVpbnUyTG5iM3RyMVVpaTVhMnVo?=
 =?utf-8?B?cS90eHBBL21wN2RiQ1BjMXpEUC9TTWtBNFY1YzJoUXh0VnZnMWppQXQ1dWRB?=
 =?utf-8?B?TGJQTnczb1hwWHRpakdsb0NUUk5weWNlZXk2WWMrZTZMdWpPbXdtREpmd0V1?=
 =?utf-8?B?dU9KNWo4TFVNSDJ4QU5MaGhrSWdIQklQaUZQdUkxMFFaQnVRT0hWUEYwd0li?=
 =?utf-8?B?d1g2SkVMYzVqSlIralFCVVZpSzJQNndFaWZZZGVxRUpCdm5PTHp0RWVTMTlH?=
 =?utf-8?B?V1d3MnBOY2dZWm9ueE5xKzJlS1RoTGVDQ0dGMEU1c0ROS1FGd3ZxaUxTSjJV?=
 =?utf-8?B?T0Z6RVFObTVia1hUVlpibEk5NjFhRzhsdjhQY2VleXNOMUF1a1Z3T0FxbUVH?=
 =?utf-8?B?WG9yOG9LNHVDNXkyVFBhME9xTlJiVjdKTzcwckpuS1pseFZiOStBU2xUMm9O?=
 =?utf-8?B?N1Y4enJKcHNCNUVuTEZHTXlLdUxmZURkWTU0SEtsR2ZZc0h5SlllSVNnU2xN?=
 =?utf-8?B?N0RqYUlKVW80M0RHTE5KQ1F6MHpKYlRHZFV2ZzcrRXZVWXp3TGlsb2pUKzJC?=
 =?utf-8?B?eTFZTWRDckhVTFlUamJVWXBNYU83NjRneDMvSlliRStjK01uekZ3d29ZRmox?=
 =?utf-8?B?TytGdGluZ21ZVWFOZXhHOGNCQktCbUoxWWlBMVgrZGVHVEM3bTZNMzhtRzEr?=
 =?utf-8?B?QzBhRU53bXV5NWMzOFVDQ1Z2WE9sUzJ4cEw1RlUzb0hKVjROY0w4UXRucVhl?=
 =?utf-8?B?ME8rdDVSeVpOWWpPdjkyemFtTENneFRJK21YU2ZrQ2pMRlVSbDNLSG5PTFB3?=
 =?utf-8?B?bWFaQVh4dVhHOGsxZUtOTFIyK2gwQXl4Z24yeVNzRzNOejJ6NUhNeEZRZHNs?=
 =?utf-8?B?cS9Mb1BpdUR6V3NUR0pPcmoyajl3czl3NnFGOGk5NWNubTFpc0k5bmliWVVF?=
 =?utf-8?B?cVl1LzI1NDA3LzV5anVoaFVuVkhwQUlDdTMwbHZVT3EwV21XOWx0Wi9FL0x3?=
 =?utf-8?B?MWxSeHgwTDB2RkxTeHluNnV3UmlGZGdydHdiaXprMTkwbVVyU29rV1NSTk9x?=
 =?utf-8?Q?ecPY08/gSnDuwQBuhpUMbS4ZeL1lDU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wk5ycHNIYnN2T1Y3d2FLUkdGa0xtK0Z6OXJ1QUM5aWVZNkVieThrWm02djVt?=
 =?utf-8?B?MStOdnFCSFZDU3pQajg1N0F3a24zUjVmNlNuVVIzWWtldktvYTl5NVUyYTlC?=
 =?utf-8?B?U2diNWVPZDJrSVk0VzVZa1N3c0JaYlhxWXpNOHNqVXhPMVQ2TlVYMnBtWlhi?=
 =?utf-8?B?aEhsZElRQ2lkUkxLRzdCeFRlTzMxQ2s4enNTRVloMDRhbzF1RWN5S05ucnFP?=
 =?utf-8?B?elFSZit6ZFU2WTVJb0pIQWVJa3dISlJGSlY5eC9ENng0VHJWY0ZPMFFuVGlF?=
 =?utf-8?B?dUttSDZORXRVRFc4cmRsanEzbzB3ZkxJdE5vR1U4MW5Da3BWYU1sS1Q2YzJD?=
 =?utf-8?B?ZmloK3JtSkNOOUN0Q2lkdGsreTdFN2F4RGI4UjZ2cURXdUdaUmw1SDI0YWNv?=
 =?utf-8?B?L1Q2NWI4cUJNdk5KRjRCZVFrTGhOYkNTNDRkSjViWXUvNExwY2JWWFprMngw?=
 =?utf-8?B?TitzSXNHN1pKQkUrVU4zSzZaRXBZSnFNZjdsNExKRWx5ZVdiOE9KTTVNRVhu?=
 =?utf-8?B?Z2F3c2RqK2JhSWdPenl1M0NqQXhPSW1lekwreTZ0YkJhTlZSVU4xNWpYdXZX?=
 =?utf-8?B?SGthTjdoWW44eUJUZ1g5cUFoRHBGT1lJMUhJdG5TZUFLRXdaVUYzQzNzeWRr?=
 =?utf-8?B?TDQ1SFd5MTFkc3FvdmpDOE9IdnViWGNibEgzVTJqWVVLS1I0elhQQzJweFhW?=
 =?utf-8?B?RzEzdTV3Y2twVVZhTERCYlhJcEp6ZXEyUkpGYnVoWC9xdHl6dkZ5QnBvRVJo?=
 =?utf-8?B?SCtuem9QcnRRZjRRV3BpbE9DaUUwa0tMYUN1MkZaVTRxKzFtSFM1RWE0NURq?=
 =?utf-8?B?YS9HeHAzTi95bHFPL1h2Y0Q5RDRDUys2WlpBSWVYK2w2ZnFWd25wKy9oTVJL?=
 =?utf-8?B?SnF6Sy8rTFlaM2NSYm9sekpjS2I1ekpqZk9iRHIwRzlYclc3RHZxcXZsZ29j?=
 =?utf-8?B?TU9QV2lOWVdpZVhacVJOZGRzWlZPc3ZWeU93UWF6N1N4WmJ0WTA5UFljN09l?=
 =?utf-8?B?WFdEd29QMXdjb3BGLzJCSVMyTU8rbngyTFRpdDBwU1loaUlkb01VVlZsR2NF?=
 =?utf-8?B?R3Q5NUs4RGpvQUU2MXlNSWxuWGZwYi9DbEpQTTBRRUVrNjlhS2srNEFVMHJi?=
 =?utf-8?B?VitOclZqcjRqM2lhVHhoT0FCaHJFMzFZQWhjM05CQTc4MWdMTVNRbzErMlZN?=
 =?utf-8?B?Y1A4T1JpQTl0bytVV0xvL1BMaUFWTWo5UEs4b1d6ZmdtaFNEMVAwT0ErT3lo?=
 =?utf-8?B?Q0ErWlJQQkUrb1E4M1l6Vkd3VHBxTFhnRzRvVjZicnl4L09rZ2Z2K21rcWt2?=
 =?utf-8?B?WmtVQ0ZTSGVCTXl2NFlNdENUZ252RHdBZG0rVEljUjJKM1ZhMEQyL29GcVpZ?=
 =?utf-8?B?bEQzQ1FuMnFIZjF3aCt5VUtYRlVwaFNXaW9CN052enkxUWJOOHBvZ3VnenNm?=
 =?utf-8?B?S2pmaVpBdEUyVUFZa0c5SVVMelZtUzljdUp1Q3Fpc1JTb2tjUG55TW5UcDRX?=
 =?utf-8?B?TFJMc1NsQmpmeTludVJFTjQ4aW8xT2dOTGRxWng5bERPWVRlT1JueGJmS0VI?=
 =?utf-8?B?S0JON25lMGo0RHBCd2k0Q2JYV0d2cFR3S0ZhWUY2Q1N6K2pLSGNQN1VZVitT?=
 =?utf-8?B?RmRTMUkrQ3NYYU8vZHBXOU8wRUhzTEFXZXd5ZzJ2UjY0YkVHUmhDZnFHZVE1?=
 =?utf-8?B?K1RmZ0FrQks3ZFBTNU1zMS9JRkNKUmtKUU1iVzVsZXNLWVd1dEFEeUNHVUo4?=
 =?utf-8?B?YlpHNGp0bk9PTW5TVjdubUNFRUF2a09HL1hrNEZ3T21ab1c3UlZCQ1gvV1Aw?=
 =?utf-8?B?R0xJbEN4bmJUajBwcENPb1JhM1hBbE1zTW5JalBOOEdVUzk3NWRRR0RGc3NP?=
 =?utf-8?B?Sm9kOVlkTkQ5MnZ4c3VvRFdvbHRvVERhNVE5NGxHbGRLR2h2dEtUQ1lpSjdZ?=
 =?utf-8?B?UzB3Qk9pcUliQXEvMlJURUp4UnRRWUN4WTF4YnB2dHl2VXlVVE1rVmJXbjBq?=
 =?utf-8?B?NGFveC9rYitVWGNBSzdtRlMxQVN6U0IyWlJIcFNLRUIwd1dNemJhSWk5MGdO?=
 =?utf-8?B?Y1NnS0hDRjdqcDNTSzVuM0FvWm9RZ09QVXJjQ28xMUFidTUyTUt6YTAzNWQ3?=
 =?utf-8?B?SWVrb1RMSG5qdnJ3dE9lRWpFRnFwdVF1WE9tQnVrYUNPRkwvanNGMnpmMXpn?=
 =?utf-8?B?VUE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3JN1tO1fLQA5yiuomdDOVC66"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e43574-bcd3-4921-2bf1-08dde091f3b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 09:06:01.9598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OkTJHF/Ds56XLhdt/W0DADTZYsiFOV9Ic+wlOzKJoKQfFLTeWcWpC0NgppxZCTSiioqPnGZtrJgs0vhGLBWSOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3609
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA3MCBTYWx0ZWRfX1ArUpfymRtWZ
 nogAXIxoY137R1yiEnNawOQiGMOkw4FJrabhrxYoKMIsM4CoUL5SWA6PeeoGkWAmYrtJjsr5iff
 ft5IzyLpVZPiPQpbqEoiCaBT8JNX9QjcLlDKJ/tOCgGrECCIochjUmw9Ut48ZoF8gerlz1AUug+
 hmNk/X9gIYfYAQjgdgTZir1s/wWTphpV2kunueNvebWpVSIbRcC7a4AGyHEZdddehRDZo27RrI5
 tgJi+FkR4EdcQl1N1RfJL0j37BF0ExZ/YyqqbCCu7rCcPhgEwTpKFpIFdaJZ+bACH+CmQ+fIRSn
 0uVCi/LpS0PBKKYgIOPzO74ApU60K307CawPRHMcszNEYB5TIfu9IVgCUFuf439/C0p8ibTougI
 RY0juo3OdsaN5pqj6lmRG1E1XmxQsw==
X-Authority-Analysis: v=2.4 cv=PtrKrwM3 c=1 sm=1 tr=0 ts=68a6e17e cx=c_pps
 a=qNN8Pqk4kVBllGMyGt3nCw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=NgoYpvdbvlAA:10 a=KKAkSRfTAAAA:8 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8
 a=dyAB22qJCiur462oi5QA:9 a=QEXdDO2ut3YA:10 a=64Gvs9E42N4A43GacRAA:9
 a=FfaGCDsud1wA:10 a=cvBusfyB2V15izCimMoJ:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: PjoKsA1M5wFGBp-tJPtE7Y_RVM9TAXUg
X-Proofpoint-ORIG-GUID: PjoKsA1M5wFGBp-tJPtE7Y_RVM9TAXUg
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

--------------3JN1tO1fLQA5yiuomdDOVC66
Content-Type: multipart/mixed; boundary="------------Kf0uONNkz6jPvKQzSiDIHoOz";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 Drew Fustini <fustini@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <b70ec62f-e842-4f70-a4fd-b11afcfe46a8@imgtec.com>
Subject: Re: [PATCH v12 4/4] drm/imagination: Enable PowerVR driver for RISC-V
References: <20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com>
 <CGME20250820085612eucas1p1ae19fd1baf24a0c445d1d439f944a2a7@eucas1p1.samsung.com>
 <20250820-apr_14_for_sending-v12-4-4213ccefbd05@samsung.com>
In-Reply-To: <20250820-apr_14_for_sending-v12-4-4213ccefbd05@samsung.com>

--------------Kf0uONNkz6jPvKQzSiDIHoOz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20/08/2025 09:55, Michal Wilczynski wrote:
> Several RISC-V boards feature Imagination GPUs that are compatible with=

> the PowerVR driver. An example is the IMG BXM-4-64 GPU on the Lichee Pi=

> 4A board. This commit adjusts the driver's Kconfig dependencies to allo=
w
> the PowerVR driver to be compiled on the RISC-V architecture.
>=20
> By enabling compilation on RISC-V, we expand support for these GPUs,
> providing graphics acceleration capabilities and enhancing hardware
> compatibility on RISC-V platforms.
>=20
> The RISC-V support is restricted to 64-bit systems (RISCV && 64BIT) as
> the driver currently has an implicit dependency on a 64-bit platform.
>=20
> Add a dependency on MMU to fix a build warning on RISC-V configurations=

> without an MMU.
>=20
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imag=
ination/Kconfig
> index 3bfa2ac212dccb73c53bdc2bc259bcba636e7cfc..682dd2633d0c012df18d0f7=
144d029b67a14d241 100644
> --- a/drivers/gpu/drm/imagination/Kconfig
> +++ b/drivers/gpu/drm/imagination/Kconfig
> @@ -3,8 +3,9 @@
> =20
>  config DRM_POWERVR
>  	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG=
 Graphics"
> -	depends on ARM64
> +	depends on (ARM64 || RISCV && 64BIT)
>  	depends on DRM
> +	depends on MMU
>  	depends on PM
>  	select DRM_EXEC
>  	select DRM_GEM_SHMEM_HELPER
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------Kf0uONNkz6jPvKQzSiDIHoOz--

--------------3JN1tO1fLQA5yiuomdDOVC66
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaKbheQUDAAAAAAAKCRB5vBnz2d5qsLhK
AP4pGdW9qprGETGInt6wcnLuCnxLr0lrFKNnRiwpwATktAD8CAELRzMSW+GCLaL3EZUZNZFkTaVF
VNSisLZRiBcWtQU=
=e1wG
-----END PGP SIGNATURE-----

--------------3JN1tO1fLQA5yiuomdDOVC66--
