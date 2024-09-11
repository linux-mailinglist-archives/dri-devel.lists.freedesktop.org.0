Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79C97575E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 17:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090E910E0AB;
	Wed, 11 Sep 2024 15:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="vUGRq5o7";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="YbH8/Xn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF5710E0AB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 15:42:23 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BFS125012979;
 Wed, 11 Sep 2024 16:42:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:message-id:mime-version:subject:to; s=
 dk201812; bh=G3TuO6/Dgep6K7+N3dydb/lL9+mHEQpsqLDss0nKBzk=; b=vUG
 Rq5o7YAaIemzx2uRLcu8wEPEZqRfm4YQlLMGtJC4v+IgTPppVc3xgVxh0TQQKuRF
 pRSIioelAY0OjMD+TuBteaMuTlLcxdK/O4yZqkFO+B+RF/xb1dM78itTyyV7w7yK
 IjhcY5kDQOHuQQXIdUbhZz10vGo7KUBCqBf/g96xjBaAUhfh9xyasmpjJNnJTxV9
 5XqZoFUUoxSgiwK98mBB+IgGmIvZ0YKGMuiddehiwRKC0xWeyXyDA6lMwtqIfhlK
 Vb+HqZac9eST/lIitvdPROP8ozoOPrsZFJ3N/YOopqWGYz5s6O9mG8Y9sufNOmOw
 XhUyuMIpJqXWuz6/0pA==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 41gewwbcb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Sep 2024 16:42:06 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 11 Sep 2024 16:42:05 +0100
Received: from CWXP265CU008.outbound.protection.outlook.com (40.93.68.4) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Wed, 11 Sep 2024 16:42:05 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY4sPPIrRRW199Fc9yuUvUVGzgkeqYUrUA2trDD6SxyAq4nnhD+QiBqOOM+qEcVsz7z8qRQ0dT6BxFNQ/q7yntEaJm386X0OHrfnGANfd8lNG8Bosg8LNAAV73kvzEA7z39423PBI4RnWcI+KlYtUpfVoGnVrH7vTvLjxzu/+GypCrLQE0Itnr1THwRQoYEWOL8YorCHhCluerlvtVv4rICUh5PwUjnowrXc6dNX/8FJ59XV2S1E49cViGllcpU53tqHECcnn7PaMamXjCcPDJJfk9/sE/196IxXxQKRJTu0Jh25hEWIgn1pICj5zXbVc1DDlXp1sD8KQYasOHNv0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3TuO6/Dgep6K7+N3dydb/lL9+mHEQpsqLDss0nKBzk=;
 b=mvXsarhqGVVOuPbuJ4lY6krtmvdqBipSQlgpvwo9cEln3/965trV3XmFp5r1kTclUG5uYjp/Us77x5HoyIsOu4bREQ2d1RAly7f+WVNj4yhtBa5kn7wP0OryMWZPzES0hKqtbs2XOcHcJ1NgmQyQiuMdzlqk8PwvL4SN0qxkuCSc32ZmH4OXgRco3HqCN/Z7pjHIiZiBqUKSNCAV9QrKMVOLedNx2e9aDiGyX/0DlJWSkuUs6irUcUbBIDmstCvAl2mnHOuPTViMUtKvOAbsOGgVcU+TiQBrAPHm+1zN3fuxh5Kze5LUpNE3RMv09Rh07TJCHZ/38OeFFn5iaohdHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3TuO6/Dgep6K7+N3dydb/lL9+mHEQpsqLDss0nKBzk=;
 b=YbH8/Xn8BMuS3pneIpidcSu2Mn+OlqDGlwrw0Lzu5WXegQfEy/hQO0RJsSpqQo8bYbNYSfLTfH4HoHiLPLs+Zfu+/zWf087cr9LYnR6eY5u1ygdKGshDd6ZYRgBi5ugmnl0sVdwi2IFJVJO3Gzy+S2DvxQ8MbXVN2zfnW/icXkQ=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO3P265MB2329.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:10b::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.26; Wed, 11 Sep 2024 15:42:01 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 15:42:01 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Brendan King <Brendan.King@imgtec.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] drm/imagination: Break an object reference loop
Thread-Topic: [PATCH 0/2] drm/imagination: Break an object reference loop
Thread-Index: AQHbBGElIsILCkyVDEG0AQHI7HqI2A==
Date: Wed, 11 Sep 2024 15:42:01 +0000
Message-ID: <dbfff3b2-84c7-400d-b305-64735193a948@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO3P265MB2329:EE_
x-ms-office365-filtering-correlation-id: dea2386d-20e3-4b72-75ae-08dcd2784798
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?citYd0l2UUR2cGE0Y2k4aURRcHAxbnJkTkJERUpHN0FHQ0tzRFZmZ3l6aXN1?=
 =?utf-8?B?YzZGbEhGNTNTbUlLUjlVMUNBK3Y4a2o5MW1jdnlQQis4UnNuMnNUUEoybCtZ?=
 =?utf-8?B?SDlzWDNRdXpOUjlnVUtuVFEvdjBHeEg1OHBuSmVpWTZWZ1A3MENRZ1hGamla?=
 =?utf-8?B?aTY3eDBVK0VGYThNTzR5L1YwdE5MYmNWSlVPb3FNaGRhL3dXemViOEh3ZzZs?=
 =?utf-8?B?cHVTSlJ2c052ZG8xMStBV25hSUdmMVJFOWs4Ly9sZGdqSGIxUUdBUVk3MGQz?=
 =?utf-8?B?TXJ5bVVIUFJaT1lkeE03c1ZISHN6eVAyN3RHbEtpWnVOcjhHVzhiNjBEWWtx?=
 =?utf-8?B?d1FXeHNKK2dOb2RiTnN0SzRPTkY3NEwvaWc3OGl1K2w2VUlud1ltUEpjYUJt?=
 =?utf-8?B?ajkwa0c3OTVFRmpGZ000MFlXMnpseFprTllyNUtQWUs0a3BWY2Y1Y0JhbGlJ?=
 =?utf-8?B?c1Z0RW91Mlc5eTJaYlIxZWxMYkRQcjVVdy9kTExCSlpJR3ZJcVVvbVhHcDFu?=
 =?utf-8?B?S0R6bllreEpUR2pQaTFyMFB5c1IxUXVTWGVTU0cwZlFMMW5RU3kwNGtURHBj?=
 =?utf-8?B?OVByMXlDNmM5bUNXY2hJUFU1WHU0YVBxRmdtYjJHMEs0RzdzZlIxUlBXRDdJ?=
 =?utf-8?B?VjNrckZqbkgxSkdneDNreU8zR2RhWG9YZm02ZkdKbGY3K3g1WXNTMWp2ejBv?=
 =?utf-8?B?ZFlFdm1lYXppZWNyQk01djU1bDZ6RFU4U2VxZ0tWc0FyT0JFaGpwc3VLWmxT?=
 =?utf-8?B?NWt5U0NWcVdSckZ5TnN4aVJBRlhZdTR3b3NRY0tVMnRYWFJ3QzJxNjlISHFJ?=
 =?utf-8?B?RWJMMHY3NjJQUEFyWUNrdXRORGZlc0N5NGJrM0h1SE4wR3ovVU8vTnhzS1Q4?=
 =?utf-8?B?TEdpbnRWMWs0c3NkLytNdGhIOWNhdnJDQXRuK0NsaXNVZ1crbGlZSENFMW5Q?=
 =?utf-8?B?TitKeW5FTXpNclB3eFJURmpYVXU0M29VaVZnSmY5eXpkYXR1V0xvanprZlNx?=
 =?utf-8?B?Z21kRlNUektqMkphNzZNVG9RRUhUeHUvYjJVYTgwNld2WWFKWHcwMmZOUExa?=
 =?utf-8?B?MGtZS3laOUI2Rk54TkhBR29icUUxNkRGamJ5ZzJkNktoek5RL25IZGFRNUtZ?=
 =?utf-8?B?MVRjbHIrSFBidnZkZkxzbENjM0lRU1NHQWdvNnBLck13dkNKMWo5K2lpejlx?=
 =?utf-8?B?cEpjKy9PSElEQ28yZTc4c0tKNUErY0JWd1ErMW9pakxEOXVuaVdBY1VCeit5?=
 =?utf-8?B?c3pUYzdMcUsxa05zMG1WcjUyMmVpT3BsVnE4cjdBa3pSUjR0dVhRb25MVVdY?=
 =?utf-8?B?YVpDL3hFNERKRU9WdTU2b3BFUHcrTzN1QzUxNTEvQ0pERVZSLzhFQzNVNEdP?=
 =?utf-8?B?ZEFnYWE1RHNVeEROQlgvYWFDVEV6SFdOTUcxYnVBeUxIaG4xWngwd1hDcHpP?=
 =?utf-8?B?dUExT3JiM1pBZmhwWCs3NlIxSUE0a3JkbEtUQWZyWkQ5UE1sSzZQb0UwdXAr?=
 =?utf-8?B?WTd1dGViYTZrd1dxYXM3Vzk4M0lVc3h3NXo3S21hMEU1NnU3cC93WGh1T1No?=
 =?utf-8?B?NTBLREZ6dUVMRmpOQ1hnN2dvUlJRTFI1SVkycW9MREtsQUNRekVHNFkxUEN5?=
 =?utf-8?B?REk2ZmpVZkFSM2RleGZ0blRCbUdBWS9kcUZYdUI0bWFBZm5NTGZSei8zdy9o?=
 =?utf-8?B?dGFVNHl0OUhzWTdiaGhMdldhei9HQzY1N0x3QnlMZS9qUFV1bUd6Zkl1VGdo?=
 =?utf-8?B?ZHRuUlhSdWN1ZzhIU0ROUjRLVVBzRUZObVpiWEJMUnp2SmExck5WdnZhczBx?=
 =?utf-8?B?M2sxcys3YUV0bitrNXM1L2ViVHJtOG5KWVg4NjdxcWpLOWx4L0w0QkhJR1JN?=
 =?utf-8?B?RVB2cnFlVHkyaDZWMUhuSUp0QU9nUW80T3ZJTmxJVk8xNkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aE1sMkhTbU1NeE1hMmkvNk4zZVRuK3pRK2pQV01kNFBhMjU5dklYTE9rc0pC?=
 =?utf-8?B?US80SlJHMnc3MnRCUzJrWURvYU1vT3BNUjdGdGdwMU9iRlFPZkFyU2hkTVNP?=
 =?utf-8?B?S2h6UWY0VFc3VU1yd1NTMGlJOVRWQXFIUjVadkMvQnJVZU1QakJ5b3pUSnBa?=
 =?utf-8?B?QWloTExQU25KdVRObGRRMUN4TGxCaWJYaHhFMFREOHMya2k3RzFjRk45RjVR?=
 =?utf-8?B?ckc0YWNsL1VxTWdTTW9uRkZFSEg4ang5cVFxTUFPYXFZVUhRUFNIQWdHY2dw?=
 =?utf-8?B?SmkrSWZoRFJ5T3Zwc2lEVDlsK3h2eXkyeFpRYVJKTW8wZ3VyYTdKS1VHcnl4?=
 =?utf-8?B?L21FQXNTZlFpdkgvTndmM1VBb08wM21QY0NMQWllaVZwTTU4d0lDcVhJUUxy?=
 =?utf-8?B?OHQ4dytsV3o4UkNVN0o1VFlEdTJ0R295VGJBelBqMHErM0t1bmdGRXZFNFly?=
 =?utf-8?B?TzA0eEpDUUJqL3p6eTgwcmNyWFRIYlFNOGpzT3VlT0Nxd2tzRTY3NGNHWUpN?=
 =?utf-8?B?WFdjaURsR1BWQjRlUGlaZCsrR2hhTzNoZDBvMkFoUlhRdUNQb3ZkTjJ3aS93?=
 =?utf-8?B?WllmNUl5UjduOUFGa1UyZTQvOHdadC83eUF2cVBSTnpjd29KSFZLTzdYdVdr?=
 =?utf-8?B?eWZkNTc3dmthSHIvbFc2WlpIQUxiaXVmdml4NnM0Qzlpd2RmNzJlM3cxd01K?=
 =?utf-8?B?Rm9nWGtJRXZSY0NxRlFORUhxYVYwc0E3cjJDZExkZmhhS3U1WnBMN3lYODhX?=
 =?utf-8?B?NHlKMFB2dDM5RGhCb3JoV1p3V3lJMFhiTTRiKzBlR2tjUGJrTld3dlJ2VWNK?=
 =?utf-8?B?ZXJBMGowK1NoeG5PNHpPcHJrOVNDSmhPS2pYcDJDeDBmeXNNMEFJcFpYeGVJ?=
 =?utf-8?B?ZHNXdUM3TXhtTU51TTVzZ3FoUkZkS0RYMno3S1gyZkNObUQ2WEJkN2NoMTky?=
 =?utf-8?B?WEs1U1ByYzB5anJCZUZDc3NLR05nZCtleFVHK3VoNEczTkNZRFQyd2ViVUFh?=
 =?utf-8?B?T01UQUp2KzBUd0JmQ0dZQTlicFgvOGc3S1FRWU5hc0RKMHgzaVhZc2h0d1o2?=
 =?utf-8?B?N0NtOUR1RnBSdXdNY2ZPdnhiOFVCTlgycVlPcndVQXh4ZVNSU0pCbEtnZlo5?=
 =?utf-8?B?cTdKOHcyMmR1ekJpWHRlTjNOMlVDbExJTFhHV1lQZmE1dWlNbGdlV2VaSTAx?=
 =?utf-8?B?UURjY3BYUkd1VUg2Nms2RmhmLzVCNysxcndrNHp1LzVydTB4bWd1dFRPNktY?=
 =?utf-8?B?TWY2dUdKaXhpVEs5SHZ6SDBoakJTRHpBWDMxQVRndnNmN1JhY0w0MlRsRU5s?=
 =?utf-8?B?UkZWUVFxMFg2Wkd0TEdEclVGVXZsb2VBMWxaS1IybTZuL2Z0cmhkQnZER3FR?=
 =?utf-8?B?NGxaamgxV25CVFR5ZFdIUFBWTHI0eWhXWDdJTm02MTdabUNSbnVOYjRpTzRL?=
 =?utf-8?B?RlpSOVRQdi9FWmtubkQxaFpTUm5UekVLS0doYVZwQko3aU1KMTE5N2lDYlkz?=
 =?utf-8?B?cTRWM21FNmsydlQxcjNteWt1NjVzY09XUm9HYmdHK2FxdmU4YWpING5iLzg2?=
 =?utf-8?B?R1lOV1NoOStDUnpReFJta0gxdmovdGJnWEFBTmFubmZmMThBWXlkRmtWTHAy?=
 =?utf-8?B?MnZaY2phTlJyeVI0NUNrM2dLWkFrRVBQSzRkU0pOYlZCd1o1bHdtWm9oZ3ZV?=
 =?utf-8?B?TXBMM1VsbUVHYnM4d2hzRE80WjQ4RVdOcWEyS042QmFtWlNIV2Vvb3NUWWpB?=
 =?utf-8?B?N1pjMStackJBbWd5bmljSTlxVytYT3RwUjBlTDZBalA4V2FpOTFIcUU0SVpU?=
 =?utf-8?B?MWVxNXZOZFJmTWFNK2doQ0FLdFpOTXRURVBXWE13eDJIKzBUdDhQampNdHFV?=
 =?utf-8?B?Y3lLc0pQT2VTVzBuNldsZTlTMWdVeTFoVTk4N3ljR1RQQko0akdDVG1kZlI1?=
 =?utf-8?B?MVJJQVNTVWhsMUxDVXVMUXArak5qY3hKWmhqTGNXdlpuRk5YYnVaUkNCcjNt?=
 =?utf-8?B?NU13Sm9BeTRPVUZjUTZ3dDV1ZWJ2VEtYT1dlcll2WjNabTl1RFBFamdqQzVM?=
 =?utf-8?B?WkU3TlNPN21ycEdJR1FnaWNnZXJmZ0VUMm52Q214UVc4cFh0Vm9IZFRUNkRO?=
 =?utf-8?B?UU9nMGR2SG1RRTY2S3dJWlEyd3FXVWhIRnphbnVpdlBQMERiZHRmNXQwVW94?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WrqmteKMb2UGEa0VDRFgfG16"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dea2386d-20e3-4b72-75ae-08dcd2784798
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 15:42:01.8614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OUxCs/pIKKSeUR9rdw9G9XGB2Ps9QRrZyHt0TVEyG/t8260vtfd6H7CKztq3xGw/pot35UJXZGhNyH9TimEOgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2329
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=V7Ev0vni c=1 sm=1 tr=0 ts=66e1ba4f cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=iqgTQx9cwIf3F_hPsnoA:9 a=QEXdDO2ut3YA:10 a=tLyVP-_u6bd0JCgZz4kA:9
 a=FfaGCDsud1wA:10
X-Proofpoint-ORIG-GUID: ajyFtsl_RsJdI38Yu5204Xwk2vIY2FkN
X-Proofpoint-GUID: ajyFtsl_RsJdI38Yu5204Xwk2vIY2FkN
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

--------------WrqmteKMb2UGEa0VDRFgfG16
Content-Type: multipart/mixed; boundary="------------IwO0NUzmz2x2EJVOCK6OuP0y";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: dri-devel@lists.freedesktop.org
Cc: Brendan King <brendan.king@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Message-ID: <dbfff3b2-84c7-400d-b305-64735193a948@imgtec.com>
Subject: [PATCH 0/2] drm/imagination: Break an object reference loop

--------------IwO0NUzmz2x2EJVOCK6OuP0y
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When remaining resources are being cleaned up on driver close,
outstanding VM mappings may result in resources being leaked, due
to an object reference loop, as shown below, with each object (or
set of objects) referencing the object below it:

    PVR GEM Object
    GPU scheduler "finished" fence
    GPU scheduler "scheduled" fence
    PVR driver "done" fence
    PVR Context
    PVR VM Context
    PVR VM Mappings
    PVR GEM Object

The reference that the PVR VM Context has on the VM mappings is a
soft one, in the sense that the freeing of outstanding VM mappings
is done as part of VM context destruction; no reference counts are
involved, as is the case for all the other references in the loop.

To break the reference loop during cleanup, free the outstanding
VM mappings before destroying the PVR Context associated with the
VM context.

This is facilitated by tracking the live contexts associated with each
list, implemented in a separate patch to make the main patch cleaner
and easier to grok.

Brendan King (2):
  drm/imagination: Add a per-file PVR context list
  drm/imagination: Break an object reference loop

 drivers/gpu/drm/imagination/pvr_context.c | 33 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_context.h | 21 +++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h  | 10 +++++++
 drivers/gpu/drm/imagination/pvr_drv.c     |  3 +++
 drivers/gpu/drm/imagination/pvr_vm.c      | 22 ++++++++++++---
 drivers/gpu/drm/imagination/pvr_vm.h      |  1 +
 6 files changed, 86 insertions(+), 4 deletions(-)


base-commit: 45c690aea8ee5b7d012cd593bd288540a4bfdbf0
--=20
2.46.0

--------------IwO0NUzmz2x2EJVOCK6OuP0y--

--------------WrqmteKMb2UGEa0VDRFgfG16
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZuG6SQUDAAAAAAAKCRB5vBnz2d5qsJsS
AQDHgS3ykQAHgZsKipbrXpnJcEYsMJmErCE9LTZcM7vaYwD7BzrXZSWkd/NP2VHMe1nuAWqfGsn8
m7aEzSWeisE9TQ0=
=QjqD
-----END PGP SIGNATURE-----

--------------WrqmteKMb2UGEa0VDRFgfG16--
