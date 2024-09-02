Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD532968117
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 09:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F1A10E22E;
	Mon,  2 Sep 2024 07:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="u5/SjoQS";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="rPrqmsnH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741DC10E22E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 07:57:23 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4826xL3P031153;
 Mon, 2 Sep 2024 08:57:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=DD8FlHr5siX/bkjOsix+CoO0g789CO8h7vDonHgHPkE=; b=u5/
 SjoQS2oJ7zcfADERua96qjSxVrXQyj9yGTrKMPB+sKoov/TPyzn+8J8/unTTVAsV
 +d6aKAVgrxV/sgatIeCgHzdL//v0YSFnhPC+4MaTf3RTvRrwCAK5gaSJvut7Cjxk
 5/ZoceNbnN4rCaX9/rZgaydka08iwh4yjx+Z7O68g5tTAKVLoSfjg7MZX1Gag/J3
 R8vmtLPewXHT+cRILZQxSBkgRC8ePprjfeuaHjR/RhD7rtiKnRaXtAfPtFeYDyrT
 Bpk0Ndy0aQ7osbAwGwx8Ua3SRDNFylZ0o/cTjfAkhYF80+UdHx/lvPcuVJRGZ1CV
 /tcxJMJ4ov1DUlWXArQ==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 41bu8w9fd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 02 Sep 2024 08:57:07 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 2 Sep 2024 08:57:06 +0100
Received: from LO3P265CU004.outbound.protection.outlook.com (40.93.67.7) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Mon, 2 Sep 2024 08:57:06 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PE8R74hjyP/VfV+FPbmvYQbXmxXqLL7cF33wR9qsenpPoH3B26px2S2vF/b1+fPFWDW5Uz4S7gqXkqKVL55kYGkypBV61Fdg/40M9SkiI2I+/gjpjsnA7KKgVYQMxBl3hgFQucc7jldKwYV+VW/Srx1Q1FDN2+jWBOC6dGr5cmZOTwg1boWJhrNbmOJiOpPLvncav1NGYBPtHqHBIlKnsluRH8LPJidj454EOML6NWBRs5ahp0maE0ol4Qn6heDINGUcA5aNFTMvL3LKq45/oeY9YyicEG/deVAhNWBnyXzKBlf9O2hOr0eEYq48WYCcqbgJenzblapZsdGTIpT5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DD8FlHr5siX/bkjOsix+CoO0g789CO8h7vDonHgHPkE=;
 b=BFAucpDrxT4YsubYfMSquH5p9l9NVJvyDJIoJOG5vQSCcOcu1eZBn5uu5r17Y9/zklsLPRVVaKY2WZsm7AfQoAf4BfmkF0O64xNsBGdZPdoBVkAi9aANFXTrCNkQBtBEwyJ61l3IH9+xO66q7Xzcs2MvSFNMACct2DkzRcqpQba431XrtvH7hRhCULTgWF9IXiTPpTR5PUdN0e+rKu3e49Jm8AdNp8kaYXXBM0uDyZnWz+bL2XcpZ5IIDDu8Wx1EnyqRGBGcfSwANfaig4efD/bgqgu9QZ0zNc4ranuz8dT8Fr3ho8i18fOXGGSe6Yc+1HQ6TDa6yQNfDmW8ENHL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DD8FlHr5siX/bkjOsix+CoO0g789CO8h7vDonHgHPkE=;
 b=rPrqmsnHBCqIPXmD9PhSwaX4v/meYq6dIMQLdbz3Qb0eD9W+OIzey9j26wJChVJ7g7XdmTW8r4LwQ3yjjaaBMmiY293AMWu9tVHkztzgDpwUqZ5V6ak764e5+OV8q1e2k20n+EEB6FaiFNCjtokAp+p0YVUS9qZclF3C8RFCwCw=
Received: from LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:29b::5)
 by CWLP265MB6468.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 07:57:04 +0000
Received: from LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM
 ([fe80::53a5:42df:8e94:653]) by LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM
 ([fe80::53a5:42df:8e94:653%5]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 07:57:04 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, Matt Coster
 <Matt.Coster@imgtec.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>
Subject: Re: [PATCH RESEND] drm/imagination: Use pvr_vm_context_get()
Thread-Topic: [PATCH RESEND] drm/imagination: Use pvr_vm_context_get()
Thread-Index: AQHa+u4hLFRm7d1Buk+tCNSPNaKURbJEJYIA
Date: Mon, 2 Sep 2024 07:57:04 +0000
Message-ID: <ff8f4e86fcd7960da0d4ecbf79ebecf17d528fff.camel@imgtec.com>
References: <72fa30a5-ddbf-4957-ad5c-5c941747be5c@imgtec.com>
 <8616641d-6005-4b25-bc0a-0b53985a0e08@imgtec.com>
In-Reply-To: <8616641d-6005-4b25-bc0a-0b53985a0e08@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO4P265MB6026:EE_|CWLP265MB6468:EE_
x-ms-office365-filtering-correlation-id: decb4a9e-3603-4529-7f9b-08dccb24d596
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YWRzVXYxRTNCVGRJclBHUVlQWit2ZldqNjNzY1BwTHVDM1pobFJNRWRsSVpQ?=
 =?utf-8?B?b1hyYnZwcHVhYXpXQ0lRZmVEbXpUQkhQZHpWRUpRL0l5amgrNTJQcDFrdnIw?=
 =?utf-8?B?OHUwRUduZlZMQ0t1Ull0S2RPdDNHUEx5Ulo5ZStoK3VXYTBkcURPUlNVTllk?=
 =?utf-8?B?czErR280WTJ2MUhyeG8vQTF1OXN4YTl3WE95NTdaZ2dtL2t5NW5qb0FtMjQw?=
 =?utf-8?B?TkRlQW1SQTVLY3A0VlowMDFDN0ZGVlZOTkcrbWRSMHBsUlZZUHZQVVhCUWhH?=
 =?utf-8?B?dHg1RFhrZGlaWVZCekVLUVNhTG5FTXhSVzVtMDdMYnJYTy9BaHJUUTZXTGw0?=
 =?utf-8?B?ZDB5UnhKemt2VVQwSnIwSGk1MFY0dTRuUzg1VGhUNUphVmpxK24zZkl3dGow?=
 =?utf-8?B?aG5nclR4Y3JOMjk2VWpSenlxSzVNWXgwbm1IOUQ1emRWSjJlZ0xlMHVqQUI1?=
 =?utf-8?B?YThKQllKMUtUektDTXBkUEZmUmtWZ3ZYM1ZmV1YvOCtGRHp0anZoeFZCN1Nj?=
 =?utf-8?B?endoaGUycmM4OFd1TU1xbUZpNWZleHJEL3NMdjhKQVhKd2wxTmFsNDZRb2U0?=
 =?utf-8?B?c0s0elVPQ3BXL1F3YkhCNFVTSFIrNjdGY1hFSVRUaTR0M0hZS1VSMmZWQVJZ?=
 =?utf-8?B?L1pObUFyZm8wcGF2Z21ZL1dMcDY4QkwvRTNHNEd4UW9KN2MyWFVUYVVtVFdo?=
 =?utf-8?B?NHdyTkJyMGZqYW4zcHBRK1F2bTQ1WGNlNHFJMjdKeHBya1pVM0cwMnhIOC9R?=
 =?utf-8?B?S1k0MmJZUVlINkdncnEveXNQN0FxRDFHN2cwUSs4LzA3cGM3cUd0ZGpneGh0?=
 =?utf-8?B?Vi8rZmdwWm5ybEJWejVqTG9rTkFISlRhdGVhUkhOQmlNTjdlTEVOVzdRdzlR?=
 =?utf-8?B?ZjdsM0RPa0ZxN2d4MzFJSEtSQ1E3MjloOVZ5RytiaXUzWXJYYTVOWUg0M1ZX?=
 =?utf-8?B?Y1MvNGg1UE0zYW8rTm5HZ2h1MnY0YkhTZFFmZW82RlhWVE9iamgzd2lKbWVa?=
 =?utf-8?B?Umw1blZrWWY1dVhaSmg4RC84L3NFZDVSa09MY3RlZFo4MCtIRW9YajgyTWpU?=
 =?utf-8?B?MG9vTUc1ZDZXVUdVYms2L2loWWpLdHp3U2prelhDMXJldzdlU1dTdS9KeXhu?=
 =?utf-8?B?ZGI5SURyOEFGaHhBQmpQWEtRY2g4UGVEQVhMaDFLNHp0UmM0RGM1elJBRE00?=
 =?utf-8?B?RlhQcUltL2dmNUxXK0x5c3l2ZnpBVUxiZFdIOXd5SG5sWUI2eTgrV3c4VjA4?=
 =?utf-8?B?TS9ESktNOWFZZ3pETExDSkdac2dEQ1M4RHkyRWJHQkNjQS93YkVMSUR6V0Fh?=
 =?utf-8?B?cDVVUGswZURoVXZXUStnMElDUXpWem9YemVaSWxYaVZoeFNWRm1xa2JGSTg4?=
 =?utf-8?B?OElNMVdsdzMvRnlVOUJlSXBNQi9vUTVhV1k0MUlCSmlxVzRLVFpVaFVGUWYr?=
 =?utf-8?B?WlExeWdsOHYydWgrZmNFMzNYL2t1cTZFVUc1UlhZMmtiOHVFa1ZaeUFHR2ky?=
 =?utf-8?B?ZzJ5eW94OElBOExucVkvejlMN3VhVFJ5OCszVmJ5cHNjVzBhWTdLWHlBRnFk?=
 =?utf-8?B?U252NTd1clRGK3FUUzlzNFJKeGp0UmdiaWpYaVUxRmVaRlZxN2J0TWZOWXpp?=
 =?utf-8?B?WmNDcDZ1eDA5T1pncnlQdkVUM2RaMmdQRTgyTkdNSUIwTFBaWFk1NVlYVFJq?=
 =?utf-8?B?UDZXRmdBZHp5V08vVm85NlJ3Vkc2dTIwVFBQZDg5K2dINFZOZUI4bDJ0YURE?=
 =?utf-8?B?RzdNZk9Ycm5wOXlGeUkyV0pyUllVY3RyQi9DQjdCcXB3eGx1NTlxK1Vxcnlv?=
 =?utf-8?B?aVIydmQvZVVSUTZzSDBubWZ6c1pWYVJqSFlKeFRMWnMwUm01dEx0eHpTSFZQ?=
 =?utf-8?B?K3Q4SGoxeEFUdlJoS3BaSGlVZVFnZU01UHNMOEc4ckdobkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlRib2NHR3c1Q1hueDVMejA1UVFNNjgxMG9GMVNBU0VHVVlnQldRbE92RWI1?=
 =?utf-8?B?THRKLzFySEFjNUVTbTdXaVVzMmJDNUI3ZmdDSC91RnRicVdmWG9nSVBIVEYw?=
 =?utf-8?B?NjFRSmQ5TmRSb2pFYzIvTUEwY2ptZGpTM0kxMkN4eEVFRHB0QWNocVh0bUN2?=
 =?utf-8?B?LzlhQzJycTkvQysxVGtwQ3JXYm8xMTFCMUJqWGp1QzE4ZzVQUjdLOGNTc3Av?=
 =?utf-8?B?azE5cGhDMVVxckdLN2pRT2NTb0RrNzRjUXl6eC9Ic0JWc1JUSCtRM2Z2Y1NT?=
 =?utf-8?B?WW5sL0lpQStGem8vWThYUDZuMnhOdnd3QUFVUXI0QjdrcFdpT0J0a1dhbGtU?=
 =?utf-8?B?T0lXUHRhM25UVTdTdmh5cW9FN09PSE0vUXpRQ0hhd3FYMTVYaS9BbEJ6Lzg1?=
 =?utf-8?B?aXRIcFlzMURvckVJdmVvazd6TVl2SDJBdWg0M3lUU3M3TVdqRjMyNHFFdzFm?=
 =?utf-8?B?V3JPc3U4ajVFSjBnL3FZVUhlS1BvZzJXanA2Vi8vdUVOcERqcVNGQi9sVzdH?=
 =?utf-8?B?d2VRdnRKSHVpTit4aW13Rk82MlBiYzh3WkgzSG16enlXQ1lWM0Z3dGtBNC9Z?=
 =?utf-8?B?UmUydGxSa0ZGV3VOWExPRlBwZi9ockh6NU9WeUlBS1FINDBqQXBNNlBoK0Y1?=
 =?utf-8?B?SG55SDVnZ1hGYkZxdWNQbzdSVG9LeWhNSTV3djBhbnBMOEd3ZmdpbXg3N2xi?=
 =?utf-8?B?RVBVdUIwRVllWnUrQURJbUVaL01uTkhsVGZCYVJNYjI1OTNvTTJ0dG1jWVQr?=
 =?utf-8?B?MXc3aENvUGc3QjNNQ09DMTczYWRneXZLTnNlUlNVblh2YWNoWEUzNDVhVENY?=
 =?utf-8?B?b2YvRnA5YTNIeFRGS0NqQUx6ZzQwa0pzM0VtOVArQ21YTE1tZ3JlMk1ib0Yy?=
 =?utf-8?B?eEM3bmFWRjR0bFBYN2ppZHltd1FLTGs5VG8rSll1SEtjOXMyQlpjRkx2Z2lG?=
 =?utf-8?B?UUExTy9zVk1Qdno0Vm0wSk5RSjdYMWk3TlkvT041TDU1V2NlNlowZzZRZmVo?=
 =?utf-8?B?bm50Wk9ReisvVlNrc3g3RjA1bmtVNmwwYWVDMmRpUFFpWFAwdGs3RlRpa1lI?=
 =?utf-8?B?N0dyU2hSeVQ1M3J4NVpxaklsZHkxaEVpZkhjaTM0SUVSVDNURGFmWU13Y0tn?=
 =?utf-8?B?OTluN1l0OWJhbU93YUFXenp3WTdCdFdZNTlOamM4Y2VOcGNzV01Vc3RoS3V4?=
 =?utf-8?B?Y2cycmh1cnZFWHJmem1WYU9xc0trMDBHOXRlbElndmNndVVxVzVMR2hQcXVs?=
 =?utf-8?B?RnN1c0JqM05NZ1Fta2QzRVdHVHhBdmkyREVxbWlIVjFQYStoQ2xWU0hmU0kx?=
 =?utf-8?B?V2hSS3luZEFVcGlNOFIvem1HVElsK3BsOWlSeHMrQVN6TWRkd0lPN0xzWklR?=
 =?utf-8?B?NEtsVTBkQ0J2QVEwUXNCY0pIRkVRbW1RVk1paFExYVc1anJUMXhDMlRiWXdk?=
 =?utf-8?B?aFpTTktCZmZPTVRXNlU4MXo5Z1RDcy9GZy8xT1BKV2hSR3hyOG03YVhCT243?=
 =?utf-8?B?ZEYrWjNrSEk5NEJWUDhxK2QxSXlySGdXOXBzTm5aWG1EN3VzUFRxY05adnE0?=
 =?utf-8?B?VklqcHBmMXlxdGdtTWI4dkFlc3VYakpHQ1h3N1JXRC9EVmozNjVVOGtSTXBy?=
 =?utf-8?B?aTBKR0hHWG05Ykw3Sm9IdUgrNHlBZUJlQ2IxRTg0Qk9GUlB4dENuTnRXUTFI?=
 =?utf-8?B?YXB0aGEzZzh4VEpubjg2TXVnWmEzQ0NuZkdsenM0d3lIa2NmWHlMUElPVVZP?=
 =?utf-8?B?Z3JvQUJGNmUzSkZHQ3lQZjlCcXdWWEEwLzhDOExsbTFDMFE1VlQ3T0p0VmRo?=
 =?utf-8?B?TEp4Tzg0RU5vejcvTmYzK01XdzRtRndVc0FCTEZZNWliZmJ6MmNWZDdTNVpk?=
 =?utf-8?B?SzIzRm9iVHQ4RldYOExyRjNXZ0F5b3dDbVRtbzM4ZGd4K2dNdlhPVTgwQTBv?=
 =?utf-8?B?dEZ3cGpxS1piZFdpS2l6WGJKZDFvRVZtTXNCWjdtbWc0T0lUL3hORzltRm5F?=
 =?utf-8?B?NkxSOGpYMHpDK2FrbnNNTm80L2pJVXVXZ1YrUC9pb2NobjRXR2c4ay9aSDNa?=
 =?utf-8?B?Q0NmSWhNSTZOMWdIUXZITFA4bjJzK2NOUjBWUVczVWk3UVBGV0x0V3pRRHBi?=
 =?utf-8?B?VlRnV3ZHcEdWeEtncmo1RHg0cGpIblE1MTNKRVlSQVI4TExOSnFZTisyekZC?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8BDE0091CABE24AAA9BE73278EB59A0@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: decb4a9e-3603-4529-7f9b-08dccb24d596
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 07:57:04.2216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5OeUGQ7QFizhofCY/ksOgBGxS0roZo4lqitIAbq65JYG3fNGNMntYjMxJqfbGnxB8IIWr4RUf6tOvKc7a+3cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6468
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: RIrGGXiXQDaI0Cu2lplWj8LTvzeloxjM
X-Proofpoint-ORIG-GUID: RIrGGXiXQDaI0Cu2lplWj8LTvzeloxjM
X-Authority-Analysis: v=2.4 cv=F4AFdbhN c=1 sm=1 tr=0 ts=66d56fd3 cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=EaEq8P2WXUwA:10 a=WnR_qW7rlZcA:10
 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8 a=kcp3QwPq342mTDOhy2wA:9 a=QEXdDO2ut3YA:10
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

T24gRnJpLCAyMDI0LTA4LTMwIGF0IDE1OjA2ICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
SSBtaXNzZWQgdGhpcyBvcGVuLWNvZGVkIGtyZWZfZ2V0KCkgd2hpbGUgdHJ5aW5nIHRvIGRlYnVn
IGEgcmVmY291bnQNCj4gYnVnLCBzbyBsZXQncyB1c2UgdGhlIGhlbHBlciBmdW5jdGlvbiBoZXJl
IHRvIGF2b2lkIHRoYXQgd2FzdGUgb2YgdGltZQ0KPiBhZ2FpbiBpbiB0aGUgZnV0dXJlLg0KPiAN
Cg0KUmV2aWV3ZWQtYnk6IEZyYW5rIEJpbm5zIDxmcmFuay5iaW5uc0BpbWd0ZWMuY29tPg0KDQo+
IFNpZ25lZC1vZmYtYnk6IE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPg0KPiBG
aXhlczogZmY1ZjY0M2RlMGJmICgiZHJtL2ltYWdpbmF0aW9uOiBBZGQgR0VNIGFuZCBWTSByZWxh
dGVkIGNvZGUiKQ0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0u
YyB8IDQgKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJf
dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0uYw0KPiBpbmRleCBlNTk1
MTdiYTAzOWUuLmZmZDQ2NjUwOWQwYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lt
YWdpbmF0aW9uL3B2cl92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9w
dnJfdm0uYw0KPiBAQCAtNjM2LDkgKzYzNiw3IEBAIHB2cl92bV9jb250ZXh0X2xvb2t1cChzdHJ1
Y3QgcHZyX2ZpbGUgKnB2cl9maWxlLCB1MzIgaGFuZGxlKQ0KPiAgDQo+ICAJeGFfbG9jaygmcHZy
X2ZpbGUtPnZtX2N0eF9oYW5kbGVzKTsNCj4gIAl2bV9jdHggPSB4YV9sb2FkKCZwdnJfZmlsZS0+
dm1fY3R4X2hhbmRsZXMsIGhhbmRsZSk7DQo+IC0JaWYgKHZtX2N0eCkNCj4gLQkJa3JlZl9nZXQo
JnZtX2N0eC0+cmVmX2NvdW50KTsNCj4gLQ0KPiArCXB2cl92bV9jb250ZXh0X2dldCh2bV9jdHgp
Ow0KPiAgCXhhX3VubG9jaygmcHZyX2ZpbGUtPnZtX2N0eF9oYW5kbGVzKTsNCj4gIA0KPiAgCXJl
dHVybiB2bV9jdHg7DQo=
