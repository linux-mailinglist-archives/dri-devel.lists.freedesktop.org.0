Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62799A42B0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297AD10E19A;
	Fri, 18 Oct 2024 15:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Er5wgY1j";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="D4muzv0i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA7B10E19A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:41:58 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IBSmvl018297;
 Fri, 18 Oct 2024 16:41:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=BZKcoAYwqQov8ijGzTVVKFXh1
 9Hql2U8WjaG+HOgDjI=; b=Er5wgY1jKZ8XRAe/Nx+FPA+B5c5NSHkXU1QL/rWKp
 Qup1B8ux0ldGCkvhDytKmJ/wfhfhwDC/31LWMaSN42Qs1cSK6lgDwzFi6ArpLLLT
 N8IEn7QAqB18ZrAclrxnz6kI5tWrpuCW8+Vtk9Da97yTG5vWwl+cYhZsg5Vl7i+N
 o7qoycgHaYLopO8ZUT2xbmHAwIAuheQgmsVbm2fUmdhWMwBg6qJRaj+iuNWlhk/t
 FpGeN6TcjF5cKYCVgYukLuhMgBav00xY+wusGQQ9x5H2SYvSNDibIT2EvWPHJmWW
 631UnpudrQPtO8omndsV7BcjIliglN1UzwtsPVmknGpgQ==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazlp17010003.outbound.protection.outlook.com [40.93.68.3])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 42a3ac2nwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 16:41:38 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2fj0pUwQRAXVAu6IUM/8MM2sr33/52J35XVXJZXeg7etEU26dK2HDz/zF+RgUglLgYsX24r0ahHzyaw5KKJQaIYE3ShKuOH7/Rjop5dBT2kysSLt7A9Ya1dCkEPkVwCrWjjetf/IcfmijjNVMEBg2lNzWgAfaVP4T2cBFMUk9lfz1PdDE2CeB0omJTJNxhwpONrz8On53t7hxvZx7KvBBuGGW9byhme0baIRtKJ8Xf2d1RffS/Z6SRrdOS5IzVyBN8pdw+4EP2xpigcSxY7/vzyiIezpadL2+mezS/yPCItLwN2YhFSheQr3q5ghrb3py2E8v+BuXL+vC7eW/T2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZKcoAYwqQov8ijGzTVVKFXh19Hql2U8WjaG+HOgDjI=;
 b=J0WjVGUWeKAUN+ilT6/xt5/mmz41Hr9hpIGnrU+b2lm2QyjddWVZonw9cMP0V1hGDQMTBeZTzezaHLSyB3geRrYWTlQL05mOVCKdXdwUiNNnrMjPyuAc2ZwJjCeuBscbWDxFZ6eYZyeLKcUEyiZvvzbOrxYjE4ZAWBC8Kase30Qr2v9KuIe31qcCmiKdSvpbfMZRmFE9Dt5bUNrLovYOvJ/EMvXUb/7f/76d7KLgXeeA3JFBcofFSJnIzwWsAJwH17NkPEWKdaHZETa5fFQM9J3ih2lMFLVrqPm7qTcYllOofoLf7TlVJzxl+A3+d/WgkKLD7CJL6cOKRuLH7hf4Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZKcoAYwqQov8ijGzTVVKFXh19Hql2U8WjaG+HOgDjI=;
 b=D4muzv0iEl/ctaN1KgXxMT7yUgdvxQWJwK52k/xg9H+yxQy3X7ilCge5MGLwwfbASvBmS4RWFoIBu++a8kNfcbxMsIw7iWn6kUJntHQ8yQex6MsStSlUn/F4K8uPvSeICx0763N0WdXflgY9lQ4hrtjy16n/xK04GAsL8+vgNKw=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB2259.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.18; Fri, 18 Oct 2024 15:41:36 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 15:41:36 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Brendan King <Brendan.King@imgtec.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2] drm/imagination: Add a per-file PVR context list
Thread-Topic: [PATCH v3 1/2] drm/imagination: Add a per-file PVR context list
Thread-Index: AQHbIXQ3By0tkWHfnE+2c5pxM7UKeQ==
Date: Fri, 18 Oct 2024 15:41:36 +0000
Message-ID: <e57128ea-f0ce-4e93-a9d4-3f033a8b06fa@imgtec.com>
References: <d35a7455-1ed7-44c2-94fe-3d211a8a5e94@imgtec.com>
In-Reply-To: <d35a7455-1ed7-44c2-94fe-3d211a8a5e94@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB2259:EE_
x-ms-office365-filtering-correlation-id: 4a5b3e7f-0f72-4954-3b17-08dcef8b5995
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YVlIbjFuOVlXNzFuYnpXM3JyNVpFT2xaRWR4NU1JZk5qajVrQ1c4R3hBYjRR?=
 =?utf-8?B?NUNBMUFVTWsybW1ONnZlTmpHZGhRQytHdTNVRUtIR3ZDNlNUWi81NVlmUnNt?=
 =?utf-8?B?ZldMc1MwL3M2R0YvUVpQczV6ODlFd3E2RXlsTlQrdUhxUkZXSStIeDMwWjdn?=
 =?utf-8?B?ZGJvUWcvQ2o4aXNTbEVPbUN5VHcxdEtWMFlreWJJbkt6ZkFwN1dwNklVOHl5?=
 =?utf-8?B?NzdjM09yOTlieHJrUDh0eHRHZ3VBZVN3blRBRWRXUXJXc3ZpbmlLWGpSamt5?=
 =?utf-8?B?TXJoQVNsMTBKdWNLZ3Rvb3E4ZkZQK1pMVmdGdmNFQ1RYeEIzQks2ZEwzTXUz?=
 =?utf-8?B?dVpCTkNFMUY2aE03NWJwMHd1NzZPSkNhVEVxc0hDYUtma25GcCt6RVRDSzAr?=
 =?utf-8?B?S3FOMXZhNFY4aUlKaXplVmxFNlIvSGVkeFgzQkhVMk9aV2JycEttRTFJYU9l?=
 =?utf-8?B?Q0lWc0dzNTA1Y3ZuUWhuRGh6WHBDU2x4QWhST3lMMGNoUlBtZmtjMEh0d3B0?=
 =?utf-8?B?Q1gwcTEwcENLNkttOU9Ycisxb0MwOVVzNHZ0UUhPa05NZ3A3cSs0djJhc01h?=
 =?utf-8?B?VUtnNFN2Mmp0cCtXc21XYlFkK2UyV0MyZ3RGdDJSZzkyVW1LcHlLMEQ0K2V4?=
 =?utf-8?B?U3BCZVdOZm1yZCt5QTd6U09sbitPb3ArWTY0UmlzVCt2bFBBTVRPaGp0cmNP?=
 =?utf-8?B?VE9BNThGdDFHYng4SjB4aEhUcFNQYUNURXd5RVBLRmRVNGhrN0NIWTF2WFJ0?=
 =?utf-8?B?R1d1bFVTQUFrNUExYVgvZUM1ZUlIMUU4M1FnVkswcjYwdHJNb3F2cXFiRy9O?=
 =?utf-8?B?c09hUWZvaUp1U29OUDVrd3lTbjJJWmpkZFVJZzg5NjVqMU8rdlJFelgvdXo4?=
 =?utf-8?B?cXJsMFJ2OGhBb2E5Y1hXVEc3OFhyNk1FZ0ptS1NoWjV6MXZsZ0RIREI4YXRu?=
 =?utf-8?B?cU9wQ2pDaER6eTRkdDAxaURGbWJBK3lYYXJQeUYzeUI5c0ovZ0UrL05qazFi?=
 =?utf-8?B?ZW9HOWo1RXo1ODhmVkhtSjhZMEZMTCtrbFh4SnFuUkFzS3FZZHJyQWdaSms4?=
 =?utf-8?B?NXlIWEJhYk50NU8xWkNBdzB0NkJnQ2ZtYmlKR2I0TXVaZDBPVTRiUm5HSTcr?=
 =?utf-8?B?MXZqd3JGU2czM2grQWozOUFvWTdVOTk3SGxtTFhrTi9xYnRQWXdYZWxObkww?=
 =?utf-8?B?MDR5ZnJBWTkxM0ZPTCtocmJGSmE2clE4VUZodnQxRjd2Z29JQ25JK2pRZ2NM?=
 =?utf-8?B?K0t2KzNBSkdrSXNMUUxpSTVqTEZielErcnV6T0c4THZZcmlhWDRKclNVMTRv?=
 =?utf-8?B?N0t3SVJzcldvSkxNZ0U5U1NoMkxuNHM0WkV2THVRY25HQmpXRGxXdGN3cEI3?=
 =?utf-8?B?b1krTjI5N040QU5iREhZeUNPNDN5RkRwZUdVNE10Uzd5a1B2SjFzNlR1OEpE?=
 =?utf-8?B?bkhFT0U3WkhNUlQyQTZzYllEaFAzUkV2bDR4SlpFeVZQemJHMEVXc2k1R0JJ?=
 =?utf-8?B?bjdUdkZ6T1FiZHVrMm9TT3Q1eUtwaHYxVUl4bTZnUFpCMVBiYzFSNmJwQTdV?=
 =?utf-8?B?SGhGa0N4UmtwTnZqQllmOFlhcVFLdk5jSDVYM2N0YnF5ZTBtM2dSS3RNTmZV?=
 =?utf-8?B?TVNDMWYxOW43U3RGckpVOVZPbklwajlWQThnSSsyVFZPNjFlOWpIMFovNkdO?=
 =?utf-8?B?dFZSZWdqcVhiOTNEeDQrY2t6Z3F5c2djMDhNV01UMlNaMFhiQldXRDE1Ui9v?=
 =?utf-8?B?VUJDRVBqSDF3bWpEVnBxc0dqdVFQa08vR3daZkdpVW51d2NNT2ZMeS93MUdU?=
 =?utf-8?B?YzY2U0lYeFltaFRzQzMzU0pha3ovWWl0aU80aThhdHA2OS9EY0p6YWpKZ1hp?=
 =?utf-8?Q?k6olX1sIY3FQ3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHQvT1FIUElVRjJUK0daOGRhbzhpWFlMQmlZb0RhRGxTU1NmNVB2UU5sOG5C?=
 =?utf-8?B?RkY0cXg1cER4QVBRYU5SOFordkUyWmVDWFZUZnhQdTJQVGZmVlY0aEFZNHhP?=
 =?utf-8?B?L3QycjZSQ0JObG9za3p3eXg3QVQycC9mUlpsNmxYWUNIMSsvMWx2b09PbXhQ?=
 =?utf-8?B?dnJkSCttdlR6a0MyN1lOSmNHaW1yNzJpM1dvUFh2SVNjNUVIc1RFSCtKU3Bs?=
 =?utf-8?B?TmhFWGhoVWJMZjgyNjRTaWRrdkNiQllPRUQ5Q0JzTkwwZ2djRVovY21sQitQ?=
 =?utf-8?B?bE1KUU50b1MrNGVsRS9nQW4wdWhEczd5dkN0d3VtaGQ4MWdldnJQZGxJZWVY?=
 =?utf-8?B?WDdWWWNkZG4vUmE1UTJiY1dNV1kvWEJmalBoL3pCUDQ4SmNSYzlwWUFNeTFi?=
 =?utf-8?B?N3NURnBYTStxUU5HNlc5TVhXUWkvVHdWODBKZnZST0Z3MExqTk1EVkVXNTZM?=
 =?utf-8?B?VStET3owYm5yZkFxcnphbDl3Sm1UckJNbW9oMDI2cUw1RHhoWFllVDk1bFNx?=
 =?utf-8?B?cVZMLzJ4OFNHazJkbnZRZGkyOC9XRm16NXlnSDQ5MTFyTUxuTHFic1U3aHNy?=
 =?utf-8?B?TUUybGc2a3FPeVhuTCsyb1RjeEhKcy9wdVZyRzhmZTVIWjdqZHhJYVJCMjNL?=
 =?utf-8?B?cGhzbEVKQWx2UGRXazNmK25abTRhM1RXNU1ZWEtFVkhsNDRyeHhFT0swMURC?=
 =?utf-8?B?YzRNTFdjNUk5UHJCU1NJWHVOTTdvNzJKUmJnZGY1M0NrWFJ3ZUpsY3RDZVFK?=
 =?utf-8?B?SmJpR0h2Q0Q3Ry8yNThVYXhGUVR1RjJTSThCOE5pWkZrQ1RMNnFkYjdUNStH?=
 =?utf-8?B?d3hGMjJiMG01R2hFYXA2MXFCRzFqcy9sZnVyZ3lXK044Z2JNcysyYjRFY1o1?=
 =?utf-8?B?MG0zRkhMSnk5MDB1dEZWVGsvbGFsQVJndFFBemFUTEEzVUE2UG1FZDZxK3U4?=
 =?utf-8?B?WW5rUTBaMnFpckhBdVhadFNqMGtBSk1MSlRSTlNjZi90aEN0RUt6eVNaNkI0?=
 =?utf-8?B?bnZVY3B0Y0k1UE5yYTJEUTM4d3dsdTNKcTVrMUovajZtZzQ3QVhJVjZKRFRw?=
 =?utf-8?B?N2NDODJVcEpZcm9iRkNObUpTUjdaYmM1WnprbklSTXhMVUN5bXZzU3pPSW9r?=
 =?utf-8?B?b1dUYy90VTllczIveDhSMGxwZ0ZSUTJhNkhMWXJ3ak1TNmR3OWN0dldta3Ri?=
 =?utf-8?B?WmpodXdWYjZ6b05HRGgxQVJrQlZRNHE5dXNRQWI5ZE92TDhXMzZDeURkdUho?=
 =?utf-8?B?Mk1JemN0Rmw2WFNXbWlaQ1UzQnB1cTd6S0lzZzdqLzg3d0JEb1c3NVVzS3dh?=
 =?utf-8?B?aitHS3UrQ2xJM2wvcy9rMkxnNmtCM1Q2R2tLZmR1bnBqanhZTC9rTlZUOTFH?=
 =?utf-8?B?aEJKYXZGbXNVcmk4alp6WmRaN01Ndm12dnV5UTdFZGJMMWYrTnJjRUdpbmxu?=
 =?utf-8?B?NVJqSHdjanoxRDJMcEQrVWt3NmxGbW9lQ2E4a0RhcytqWENjZURYZmFMdmNt?=
 =?utf-8?B?K0t4bTlZcVJSK2tJUzBZK3draXVsZjJLQWR0NWxDK3ZZVlVYR1lWeGFwOXhs?=
 =?utf-8?B?cGZYeWNLeWlSSFpNS2liZUZIM2toUktiWUdjazhHdDBDQ1lpeEYwM1lwYUFG?=
 =?utf-8?B?djNJM0hYdTFTSE5aR3JKcUJIUkNPbW1Xb3BrcW5LT0k4MGZobW5sRXN2cnh3?=
 =?utf-8?B?cEIzNWJwTDV4aDBqMXZZZ2ZDS2RCdkpQN1Z5WVBPOStOS1gxaDRxM2NyWjBh?=
 =?utf-8?B?YkovNFRnVkhSNVFaRTRLZTlBalhuV1NncjhSbWVOaWVLeHhTdXYrSFdXRmg4?=
 =?utf-8?B?dVFaT0JFa1BDelAvYlBJTHpnWWpLNGZHcTR4T21DcnMxSTZrMWtqdmNuZXk5?=
 =?utf-8?B?blE5akg2eWd3ZUI5NFlEb0dHZEZEcHNneEJENTZZSXoyK2FRR0hSVnptVGsr?=
 =?utf-8?B?dm9OanZGa1AyUnBwMTZlRWwrMXJMV3FrM2k2UTFkSXljT0NsQWQwVFNaQnRM?=
 =?utf-8?B?RDdubXRZRkIveXlBL2Z3UGpIRzc0VWZJR1FVcVQ1OTJlSU1ScHpUWW9yRWZI?=
 =?utf-8?B?cG5TMHVjZUtPQlJPakxPQk44blYwKzlFdmVXeFZjdFVmVTRpb0pDM3ZsNlBh?=
 =?utf-8?B?Qy9makVJNXpqL0FLOGVaVStLTU1uTHVWWnV3K0p0KzFub29GNEZlcjJkbXRR?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ERztox0j2OvV0xh509bM4USL"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5b3e7f-0f72-4954-3b17-08dcef8b5995
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 15:41:36.1641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VOK57d2WcCabwPD4onX3hJlJjOJFZmXJwh8fG5t6ymbIe8S+VkCo1aGuTFnOeHGm90EiV2XCl6zsl/neVRDJ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2259
X-Authority-Analysis: v=2.4 cv=AcbjHGXG c=1 sm=1 tr=0 ts=671281b3 cx=c_pps
 a=Du42DVBbjaS4S3NNO6dabQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8
 a=ve1ODSZ0aD4dUIyBzsEA:9 a=QEXdDO2ut3YA:10 a=8WOXGegX6ja1v6kmIbUA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: ciBiJjBNHKyQ5E9F18mak3vZ0RkbKmas
X-Proofpoint-GUID: ciBiJjBNHKyQ5E9F18mak3vZ0RkbKmas
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

--------------ERztox0j2OvV0xh509bM4USL
Content-Type: multipart/mixed; boundary="------------b09EQw9QuDR00NrhfWJ3Rzkm";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: dri-devel@lists.freedesktop.org
Cc: Brendan King <brendan.king@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Message-ID: <e57128ea-f0ce-4e93-a9d4-3f033a8b06fa@imgtec.com>
Subject: [PATCH v3 1/2] drm/imagination: Add a per-file PVR context list
References: <d35a7455-1ed7-44c2-94fe-3d211a8a5e94@imgtec.com>
In-Reply-To: <d35a7455-1ed7-44c2-94fe-3d211a8a5e94@imgtec.com>

--------------b09EQw9QuDR00NrhfWJ3Rzkm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Brendan King <brendan.king@imgtec.com>

This adds a linked list of VM contexts which is needed for the next patch=

to be able to correctly track VM contexts for destruction on file close.

It is only safe for VM contexts to be removed from the list and destroyed=

when not in interrupt context.

Signed-off-by: Brendan King <brendan.king@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Reviewed-by: Frank Binns <frank.binns@imgtec.com>
Cc: stable@vger.kernel.org
---
Changes in v1 -> v2:
 - Add justification to the commit message so it stands on its own (e.g.
   during bisect)

Changes in v2 -> v3:
 - Add Frank's Rb [1]
 - Add Cc: stable tag

[1]: https://lore.kernel.org/dri-devel/1a206b08485a1ebea0aeff5306c0f5b6eb=
7c315d.camel@imgtec.com/
---
 drivers/gpu/drm/imagination/pvr_context.c | 14 ++++++++++++++
 drivers/gpu/drm/imagination/pvr_context.h |  3 +++
 drivers/gpu/drm/imagination/pvr_device.h  | 10 ++++++++++
 drivers/gpu/drm/imagination/pvr_drv.c     |  3 +++
 4 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_context.c b/drivers/gpu/drm/=
imagination/pvr_context.c
index eded5e955cc0..255c93582734 100644
--- a/drivers/gpu/drm/imagination/pvr_context.c
+++ b/drivers/gpu/drm/imagination/pvr_context.c
@@ -17,10 +17,14 @@
=20
 #include <drm/drm_auth.h>
 #include <drm/drm_managed.h>
+
+#include <linux/bug.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/xarray.h>
@@ -354,6 +358,10 @@ int pvr_context_create(struct pvr_file *pvr_file, st=
ruct drm_pvr_ioctl_create_co
 		return err;
 	}
=20
+	spin_lock(&pvr_dev->ctx_list_lock);
+	list_add_tail(&ctx->file_link, &pvr_file->contexts);
+	spin_unlock(&pvr_dev->ctx_list_lock);
+
 	return 0;
=20
 err_destroy_fw_obj:
@@ -380,6 +388,11 @@ pvr_context_release(struct kref *ref_count)
 		container_of(ref_count, struct pvr_context, ref_count);
 	struct pvr_device *pvr_dev =3D ctx->pvr_dev;
=20
+	WARN_ON(in_interrupt());
+	spin_lock(&pvr_dev->ctx_list_lock);
+	list_del(&ctx->file_link);
+	spin_unlock(&pvr_dev->ctx_list_lock);
+
 	xa_erase(&pvr_dev->ctx_ids, ctx->ctx_id);
 	pvr_context_destroy_queues(ctx);
 	pvr_fw_object_destroy(ctx->fw_obj);
@@ -451,6 +464,7 @@ void pvr_destroy_contexts_for_file(struct pvr_file *p=
vr_file)
 void pvr_context_device_init(struct pvr_device *pvr_dev)
 {
 	xa_init_flags(&pvr_dev->ctx_ids, XA_FLAGS_ALLOC1);
+	spin_lock_init(&pvr_dev->ctx_list_lock);
 }
=20
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_context.h b/drivers/gpu/drm/=
imagination/pvr_context.h
index 0c7b97dfa6ba..a5b0a82a54a1 100644
--- a/drivers/gpu/drm/imagination/pvr_context.h
+++ b/drivers/gpu/drm/imagination/pvr_context.h
@@ -85,6 +85,9 @@ struct pvr_context {
 		/** @compute: Transfer queue. */
 		struct pvr_queue *transfer;
 	} queues;
+
+	/** @file_link: pvr_file PVR context list link. */
+	struct list_head file_link;
 };
=20
 static __always_inline struct pvr_queue *
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/i=
magination/pvr_device.h
index b574e23d484b..6d0dfacb677b 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/math.h>
 #include <linux/mutex.h>
+#include <linux/spinlock_types.h>
 #include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/wait.h>
@@ -293,6 +294,12 @@ struct pvr_device {
=20
 	/** @sched_wq: Workqueue for schedulers. */
 	struct workqueue_struct *sched_wq;
+
+	/**
+	 * @ctx_list_lock: Lock to be held when accessing the context list in
+	 *  struct pvr_file.
+	 */
+	spinlock_t ctx_list_lock;
 };
=20
 /**
@@ -344,6 +351,9 @@ struct pvr_file {
 	 * This array is used to allocate handles returned to userspace.
 	 */
 	struct xarray vm_ctx_handles;
+
+	/** @contexts: PVR context list. */
+	struct list_head contexts;
 };
=20
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imag=
ination/pvr_drv.c
index 1a0cb7aa9cea..fb17196e05f4 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -28,6 +28,7 @@
 #include <linux/export.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -1326,6 +1327,8 @@ pvr_drm_driver_open(struct drm_device *drm_dev, str=
uct drm_file *file)
 	 */
 	pvr_file->pvr_dev =3D pvr_dev;
=20
+	INIT_LIST_HEAD(&pvr_file->contexts);
+
 	xa_init_flags(&pvr_file->ctx_handles, XA_FLAGS_ALLOC1);
 	xa_init_flags(&pvr_file->free_list_handles, XA_FLAGS_ALLOC1);
 	xa_init_flags(&pvr_file->hwrt_handles, XA_FLAGS_ALLOC1);
--=20
2.47.0



--------------b09EQw9QuDR00NrhfWJ3Rzkm--

--------------ERztox0j2OvV0xh509bM4USL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZxKBrwUDAAAAAAAKCRB5vBnz2d5qsPLr
AP98K26I8opLnhDYzQ+fb8rKiyE4BjweURmGG2yh1/jXtwD+KJiEOYSBN0j5+mDj+xigzxS6/R6r
b46XVL8xjAmiuwY=
=yNI3
-----END PGP SIGNATURE-----

--------------ERztox0j2OvV0xh509bM4USL--
