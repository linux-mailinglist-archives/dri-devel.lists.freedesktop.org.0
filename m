Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DEC96286B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F38510E516;
	Wed, 28 Aug 2024 13:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="KEPnRghg";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="U5s1ONyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 476 seconds by postgrey-1.36 at gabe;
 Wed, 28 Aug 2024 13:17:32 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A78010E514
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 13:17:32 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47S65SJa027701;
 Wed, 28 Aug 2024 14:13:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:message-id:mime-version:subject:to; s=
 dk201812; bh=zc7wO1crYB+L2870y6hBfWcTpWloF9+TBp6CiSne3ac=; b=KEP
 nRghgDfJAP51neSMXhLTi8VmSnP/oVMYxPenk0DgdbKQRzcVl8aeJEQdUU2xqeGv
 ueSOBy6DAzL9plEX0/hW1Z7RqPN+ZG5fskinl+8E1Y5jjqqPArk7EE4CeUTWfPVk
 0L6NHA1lyzyEhkqlnT4sVXNdgVl0q+y8VY1elbTT6tIgF8PtBGxWyY+OYb5KFuXF
 jygxlJf689XBmytewDlBDZ/XeoTW95JyyjA1P/tBxQvVa3ko8jpCVb9XiUxgEB7z
 CjmZXFpFxLCvL9OlY1jxFxP9BPV9ER9P8qPXhiX4EJ/d7UE23ue1udaZas0vvSSQ
 9J8fSYoU0/MxPmJ/3VA==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4175ss31ta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Aug 2024 14:13:48 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 28 Aug 2024 14:13:47 +0100
Received: from CWXP265CU008.outbound.protection.outlook.com (40.93.68.3) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Wed, 28 Aug 2024 14:13:47 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vc/+mfrLG6Q6iNNySAdzp1/gbRWCmcaoL/pkgEzLkOeh/4P4vSQllBFMKMp0KfIDp0pi2Od582navLZHYxqAYnsDRmZTAP1fCtRLx8nufzD+mNeRWZ7RXUfhq/JPFTNE/WsPvyTstddZMf92lMUa+0k4x/H2ehqPdg2TOhYW8uJWrWZEgjIQEY0zafFykAq8NzwpaC0YyoIYBDFQQXuHCzAhRL8is/E6z4+Yxd7EZRmxzqrRYpkUiSQygc3U5ECMXX5eq2+X/z9NK9RfmeI4NQZGZ6Am7r7ehoWDexMX8tULzJObXVa2znOdQsGuIIvaPds9/x/8OLPBuQg7a7/bpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zc7wO1crYB+L2870y6hBfWcTpWloF9+TBp6CiSne3ac=;
 b=BZAagSEELM6gmxDmZGTuxwiA96T+oaUr0tuTKaOlIy3SpzxPkuniQ7NshTSdfS4YAv2KjKNr33OJhNreWE9b8eKoh46e5tArJYR9BnfxZlzZA3klVP4OQHQS5tPQlLWzs6EIR7PbUr5aInI0TMo8Sv0fK3AzXffqENZUMnDtSxcgrR9I33R5ZViRxNINKt2DWfCKV+OnFu2Eew6h2XQPEnE3gQVySo6kL5S5x32oHZYxWgPbE/wDqc5kCXKykJdtviyIfcx0gRgzRkay+29B4uYweEWJ5JU4n6DtSQCkVCQ0QngKS/tLEXMh2nNlCTSGnVlfQYaIAOGT6+e7xF6hCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zc7wO1crYB+L2870y6hBfWcTpWloF9+TBp6CiSne3ac=;
 b=U5s1ONyOsb0ucqIc/QtrFNyhqx93FM2E0UdsrtGt9RvlinaRjO4bHsyJMifCMfmhC6FWRrNPmbE8xEsPLQFbNDQ5clG1wnAn6gXOQrtT3hc+QBHJH7e60fdwbWdL7H41GEWhqLHkp2CzWUuJAVpGNBWRgHlHq0z9b54ysze/uWM=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO4P265MB6201.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:27e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.26; Wed, 28 Aug 2024 13:13:45 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 13:13:45 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>
Subject: [PATCH] drm/imagination: Free pvr_vm_gpuva after unlink
Thread-Topic: [PATCH] drm/imagination: Free pvr_vm_gpuva after unlink
Thread-Index: AQHa+UwcGN9gt+LUvkOIDStkvzixGQ==
Date: Wed, 28 Aug 2024 13:13:45 +0000
Message-ID: <9f26a943-1573-43a6-a919-d6425d9df34e@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO4P265MB6201:EE_
x-ms-office365-filtering-correlation-id: 1e58505b-89f4-4daa-ba67-08dcc7633eea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T0p4c0ljYUNuWmZwRFRTUi9IQTJRZVp0RzA0YmJZb3pWb0hnN2s1dXA5THQr?=
 =?utf-8?B?a1c1bG82TTZ0T3pubDB2YWNWTEtCcHhmbkNoQW5kQzR4a0JXRXhTcHcwbCs2?=
 =?utf-8?B?MEd5Q3pUUTluQ1FFMjh5eWpac1RSVm9RVXNEdkxYblhqYzQ2WmVpZE0zTTU0?=
 =?utf-8?B?RXJRR1dLc0U1MHFEMGtGeXVhWEM2QjNtOWtqWTFZYXJuT2NoaHpiMytRdmhS?=
 =?utf-8?B?emxwVlFhQzlWV0laZTlROXBjSTE4WHZoaEgyNGpnVUdCNXdEL0p1alA3d01s?=
 =?utf-8?B?aElud1JCTm0xWXBGYnFLd09uVFFvdzRZMHZUUGZOcVo4MkVaWHE0ak1MOVFD?=
 =?utf-8?B?WEZKMHRkK3dGRE8vTmNJUUl6SE1SK28ydHZpRkJPMEc5bE0vekJJWFVLV2wy?=
 =?utf-8?B?OStBUnlJVUpuN2w1TFRpZEl0b3haVTB5Z1NldWF3dEovVGxmeWp0VjNrWFR4?=
 =?utf-8?B?bkFEOFZzdWhSNjJNVThnbEN3bHlrTkMyWjNWVDNrb2pIQ296cjFiNGR4MUk3?=
 =?utf-8?B?NnJxU3BVWUh5MkhDdUJZajdnbmRyemg0WWg2bWV3VVpQMmFEMHc2dGUrNTdX?=
 =?utf-8?B?QlYxUk1TaHlTN0w2YzVLdWNLMVQvTDgveTNlaWU4alZBY0NWM0R1ZUlhQWRr?=
 =?utf-8?B?UkZoeHFRajhuRm5rc3hLZTNvVDZxYm50akZlb1dtUCtxMjIxdmFiQmp6R1BT?=
 =?utf-8?B?anh3NERkWnlIOC93U2xpNDJ2eVlWTlc0bC95eUw4WjdYemhPOTZ5ZHJBMUh4?=
 =?utf-8?B?blcwSWZWcHVpVHA4VFg2MnZxRUpNeGJNclVBREk1WnY0TyszWlRCZ0lZMlQr?=
 =?utf-8?B?ZnU0V0lXMUVCVTdEbkVsTWpGRDJxeGZTTVpTbFFNUEhWTlh4UnpCd2hBc215?=
 =?utf-8?B?QllTMm9TaTI5bkJOenk5WnFzb2VsTHFYMS8rOUxjc0NVZEpiRFNPMTFpck00?=
 =?utf-8?B?dU42cTF0UnBZSjBBYWdFUjBUenpLU2FQcDVPaVhJYWk5TWtnMTJaTUtOUTJa?=
 =?utf-8?B?TUhpTzZ3Y1lYMkR4Y0hPanVtcEMvMnZGclMvN3NaT3VSTjJONngyU3E0ekRT?=
 =?utf-8?B?b2dvc0I1S1AxSHkzemZtQU44TUpoV3ZrVW1ocCtBRzdTNG43VTRzODJ3MDkx?=
 =?utf-8?B?czVXUW4zazVyS3pvUm5wQ0ZoZWJsTXJSaDIxOEdkNnlEMHprNkNuTnA5NUFX?=
 =?utf-8?B?UkorK0NpZ0tpYlhkcmxPSHYvcHFadTh4VTRaVHQ0ZmhEM3V1ZnpEdHhnOXBt?=
 =?utf-8?B?dit3WC9yM2pIcXIzT0hkbjZhdnd4TXJObjdmT1hrYzhxcVE3ZFVWcGxGZ29k?=
 =?utf-8?B?UUxGejlPQ1pqM09qTmtjZ2dOem9mM1FldGRJQ0l4U2lhNWhJdzdtenNUaS9p?=
 =?utf-8?B?N1A3c0pHZnZpcGZ4VENrejltM3IzQUs4bVRFeERPQkZLQXo0N1cxd3dPeGVw?=
 =?utf-8?B?dU5oa2hkWW5ralBXQzdtV3d3ajlmWU4wNkp3dFlWWG9GSU93KzlHWEZsaHV0?=
 =?utf-8?B?dndESjNFMXFuTVRZbldhZGt0VGttY3EwRlJjeFRNWmdNSXFwbzNONFEwVmRh?=
 =?utf-8?B?SkNseE0vSWxHbmJubDZVQnBzN1d0ejVvZzRKZ0trZTlBQkRqdVlOMjA3VElm?=
 =?utf-8?B?emljSDN0UGpHeGxtRUhYdHdoU2gwWE93T0F3R1YwZ1BRNUEzemRqcnFGQ3d4?=
 =?utf-8?B?VFVuTmFhNDliZjN6aHpPK05aK1B1TEpiY2IwNzhyUUNJaFBMbjlxR05KUWN4?=
 =?utf-8?B?S21XYVFMUWtoS0QyQS80emtPRW5URzdxQ2Y4VmdCbDlGaE5ob01NM0tzd3Ay?=
 =?utf-8?B?SDVQSkpZYzE3emZ5QkZOZHhyREtDU2lESktxWmFjSHhKdk82MStJRzZ2aEpW?=
 =?utf-8?B?ckk5ekxjTXhvaWkvQ0lUd01XeTM5Ty9oT21MclFHRklXVEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnpNdjdxdXMxTzZ3S0VZbmtxNENtd3MrOVpxNWs0bXc3SEZUbEpkRFRiZGtI?=
 =?utf-8?B?TGxCRDZhVGFQSGREdTBjNElxR2RxRWRNY0JtQnplbGl4UStuS3lwVlhZRHhm?=
 =?utf-8?B?dnBvYVlPNUZlOGkzeE1LWVJQZUpqRk4wOTIrTEgvVlVZS0dRbGd3b2ppc0g4?=
 =?utf-8?B?VlhOS1lGV3REaElSZjl4NXdVYXNmcy9JNDNMZjRWdkNZdGwxRHNSeU80VVhD?=
 =?utf-8?B?V01BdU9MRTRmdDBIa2NHNm8relpVTWR4UmZwYldsRFNBbGRhbEJlNTU1d05r?=
 =?utf-8?B?ak8yYkRyTkxOUVNKZ3A1WGw5UnRhc1cxVE5uQ2J0V2VjOEU0UFJXemhvaVJh?=
 =?utf-8?B?Y3doQ25TTjBaeUlCQnRMZ0ZjZUJJMmVjbWFSVFdWT0NUelBpSjdlczVTenFF?=
 =?utf-8?B?dFJwTyt0QkZQSERkdjBVZzZzRHZtYXRhb01SSUJ1SS9qdlpEOUlhUjRUeUhE?=
 =?utf-8?B?UnRZY3Z3Qk1PaWpMYmpVTVBCMXkveUpJU2crTTUrRkZJNUxzUWRPckVsWU9L?=
 =?utf-8?B?NEFyTFRleDdGUy9lak8wT2UxOXZvNSsyaXNUMEZwL2xZS21ZRzhGMjNhWG9Z?=
 =?utf-8?B?T1ZCTit5UGRoZjkvdWs3Zk1kYlAxWGlpRXU1U3preDI3VnRJUXhTSUxJQW9D?=
 =?utf-8?B?ak80aVNqdnhmajJaU05BekxPdU5wVDk3c2crY3I4dWgySjRHam1aaUJKTTRw?=
 =?utf-8?B?bXk4ZndkSDZXYTNTeGcrMEZrMWRZdVlscGVhNSt4dkFsWng2ZURZOFFNS29z?=
 =?utf-8?B?c0UrQ21ocGlpRDFhS3EzYkp4Z3Y2YkhPZTZOOENEb20wNXhzaWF6MlFBZGVx?=
 =?utf-8?B?b3FpR0Z6LzNYZTd6Q1R5Skx5QzJNUDZsSXcrT2RVUUlHZlFUMkdqY3VaMWJp?=
 =?utf-8?B?VjJ6L2ZEd3cybEE5bEZLZ0Q2anVSVDNYcWpiUWdMbWJoZ1cvbnR5aUZMclla?=
 =?utf-8?B?ZWNiVDZZN3Qwc1RhWFcvbVprTmZuRDUxRGZyN3Q5QThobUJOeEJxbC80QnZE?=
 =?utf-8?B?TVBTbzZjMVFEbXBkK3RtVkdSa0l3djZvaVRlVzJEaUlJLzJhMWplTDVnbDhF?=
 =?utf-8?B?S2hsR3J4cWVWTTVTNWYwaFFzMjZmVVZXeEoyNnQydUt3T0RyVGVKRlp3QndJ?=
 =?utf-8?B?ak1OYW9JKzFtdDZSNWF3NHI1WXN2NXFpNnhNenM4aktrNXJ1Y2V1UTVabmpJ?=
 =?utf-8?B?cmM1NDRBTjF2dWRuM2N5dlF5V284T0c3bkloTUdieHFUNVRsSUdlditwbk9L?=
 =?utf-8?B?YVJ0V1AxQjk4LzBVaC9lb2haTnpTaDBYTGNzNFVaS0Nsc1BydW1DTzhYR1Fr?=
 =?utf-8?B?OUlLcjZNTVVqYkw0YllpQTVid2x1UFY5Zms0S0hCOG0zalRCV0p0bVFJQkRZ?=
 =?utf-8?B?YVJ3Nmd4VCtFMmFYbmw2QXhVNkdObVhiNjFXc3hDcm0ySE1RaFJGdTh1MVRB?=
 =?utf-8?B?MmN5R3FXdWpOQW9ncG9KRWhOM29iRHN4a1crbkRGcmJ3TDNYNjEyVHVVSE1k?=
 =?utf-8?B?VGRCOUtRZithem5zRjN0Tjc0Ritxa2R5ajN4QjI0WlNFUnlLWEw1M1F6Rmdq?=
 =?utf-8?B?VkJpTXlGd3diOEtSeTJFbm5lb21aQnZhSDZOWGNBZUJCTVI3LzhkaS8vWDRC?=
 =?utf-8?B?emsrWDB4OEk4Yys1Rk9SUjBEZ1ZHWG5RQy96WXFvc1B2a2ZLNXhTZzNJSDVx?=
 =?utf-8?B?T2ZLaHpBbnVsUlhXVWpPYlNkMmxyRXp3LzFBQUlqbHFqV0JPWS93d0pDTmJN?=
 =?utf-8?B?RlNWNlJHalZqbXBBMm9DeUpqaDM0YkR5SlBETks3bjZFUG50YmdvY1VycXh0?=
 =?utf-8?B?M3lkOEVHc1l6QnBDUlNrOHg4VmovZXlvaEJZNnRkSkFMdzdPZkVKVkMwVCtr?=
 =?utf-8?B?dGY4QTJMZXZGd0RlL1F6MmpNS0srV24wVEwxb3pGaU1IdHR3QUY2dVl6bFBq?=
 =?utf-8?B?RVE0NGdpaXlmU3ZwQTJ2SFFvWmswODFOM2VTMyt1ekZVWTNZU0pDb01MZmpE?=
 =?utf-8?B?M0xqSDdJZlhVZ2RMQXNiSU1kQ2FaaG5vWC8wUVcvcjRQeHR3TS8weXg2bGc3?=
 =?utf-8?B?UDhYODY5cFI0UXZUU1Q2UFIxYzRxZys2MmZFVDBIZHRCRXp0YUtKODVGcmlP?=
 =?utf-8?B?UlRxcEhaRUtKZHQrcE1mYmk4VTYrTE5TNjNzelNxdytBVGhTME8zYXRESVlP?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------X08YX7iTWMoy7JLM0405bLkf"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e58505b-89f4-4daa-ba67-08dcc7633eea
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 13:13:45.0933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5/duukJF9ysX9LrjX0Ofdu4Yp0ayRgGxJSFO0CU8+6NiKXEPxI2Q3EI9vdPuRvErTVNLU7ujkGTErLmOdkQ6TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6201
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=MeE+uI/f c=1 sm=1 tr=0 ts=66cf228d cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8 a=5cLMoERiDscuWAzwkZIA:9 a=QEXdDO2ut3YA:10
 a=YoM8tg08yh9GXzwF2s4A:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
 a=AjGcO6oz07-iQ99wixmX:22
X-Proofpoint-GUID: ZUis_eYqss9TThvFjW_gGvpEZ4hYj79x
X-Proofpoint-ORIG-GUID: ZUis_eYqss9TThvFjW_gGvpEZ4hYj79x
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

--------------X08YX7iTWMoy7JLM0405bLkf
Content-Type: multipart/mixed; boundary="------------EJCroG1jGYjStAlgv0aXel1h";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Frank Binns <frank.binns@imgtec.com>
Message-ID: <9f26a943-1573-43a6-a919-d6425d9df34e@imgtec.com>
Subject: [PATCH] drm/imagination: Free pvr_vm_gpuva after unlink

--------------EJCroG1jGYjStAlgv0aXel1h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhpcyBjYXVzZWQgYSBtZWFzdXJhYmxlIG1lbW9yeSBsZWFrLiBBbHRob3VnaCB0aGUgaW5k
aXZpZHVhbA0KYWxsb2NhdGlvbnMgYXJlIHNtYWxsLCB0aGUgbGVha3Mgb2NjdXJzIGluIGEg
aGlnaC11c2FnZSBjb2RlcGF0aA0KKHJlbWFwcGluZyBvciB1bm1hcHBpbmcgZGV2aWNlIG1l
bW9yeSkgc28gdGhleSBhZGQgdXAgcXVpY2tseS4NCg0KU2lnbmVkLW9mZi1ieTogTWF0dCBD
b3N0ZXIgPG1hdHQuY29zdGVyQGltZ3RlYy5jb20+DQpGaXhlczogZmY1ZjY0M2RlMGJmICgi
ZHJtL2ltYWdpbmF0aW9uOiBBZGQgR0VNIGFuZCBWTSByZWxhdGVkIGNvZGUiKQ0KQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCi0tLQ0KICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRp
b24vcHZyX3ZtLmMgfCA0ICsrKysNCiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5j
IA0KYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtLmMNCmluZGV4IGU1OTUx
N2JhMDM5ZS4uOTdjMGY3NzJlZDY1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lt
YWdpbmF0aW9uL3B2cl92bS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24v
cHZyX3ZtLmMNCkBAIC0xMTQsNiArMTE0LDggQEAgc3RydWN0IHB2cl92bV9ncHV2YSB7DQog
IAlzdHJ1Y3QgZHJtX2dwdXZhIGJhc2U7DQogIH07DQogICsjZGVmaW5lIHRvX3B2cl92bV9n
cHV2YSh2YSkgY29udGFpbmVyX29mX2NvbnN0KHZhLCBzdHJ1Y3QgDQpwdnJfdm1fZ3B1dmEs
IGJhc2UpDQorDQogIGVudW0gcHZyX3ZtX2JpbmRfdHlwZSB7DQogIAlQVlJfVk1fQklORF9U
WVBFX01BUCwNCiAgCVBWUl9WTV9CSU5EX1RZUEVfVU5NQVAsDQpAQCAtMzg2LDYgKzM4OCw3
IEBAIHB2cl92bV9ncHV2YV91bm1hcChzdHJ1Y3QgZHJtX2dwdXZhX29wICpvcCwgdm9pZCAN
CipvcF9jdHgpDQogICAJZHJtX2dwdXZhX3VubWFwKCZvcC0+dW5tYXApOw0KICAJZHJtX2dw
dXZhX3VubGluayhvcC0+dW5tYXAudmEpOw0KKwlrZnJlZSh0b19wdnJfdm1fZ3B1dmEob3At
PnVubWFwLnZhKSk7DQogICAJcmV0dXJuIDA7DQogIH0NCkBAIC00MzMsNiArNDM2LDcgQEAg
cHZyX3ZtX2dwdXZhX3JlbWFwKHN0cnVjdCBkcm1fZ3B1dmFfb3AgKm9wLCB2b2lkIA0KKm9w
X2N0eCkNCiAgCX0NCiAgIAlkcm1fZ3B1dmFfdW5saW5rKG9wLT5yZW1hcC51bm1hcC0+dmEp
Ow0KKwlrZnJlZSh0b19wdnJfdm1fZ3B1dmEob3AtPnJlbWFwLnVubWFwLT52YSkpOw0KICAg
CXJldHVybiAwOw0KICB9DQotLSANCjIuNDYuMA0KDQoNCg==

--------------EJCroG1jGYjStAlgv0aXel1h--

--------------X08YX7iTWMoy7JLM0405bLkf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZs8iiAUDAAAAAAAKCRB5vBnz2d5qsFCk
AQCvk72HeLL+wDMM/qWRy7go8fgC1He+mXqpL9SrL3e4aQEAmXB3HQP3TPuoGTwi2ZvewUBzruMW
iHpGELBu70gYuQM=
=V3iY
-----END PGP SIGNATURE-----

--------------X08YX7iTWMoy7JLM0405bLkf--
