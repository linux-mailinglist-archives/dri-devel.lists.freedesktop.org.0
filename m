Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AAC85AA12
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 18:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD25E10E2E8;
	Mon, 19 Feb 2024 17:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="fcppNbOv";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="WYNNYFoB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6A610E209
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 17:32:43 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41J7tBj3027763; Mon, 19 Feb 2024 17:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:mime-version; s=dk201812; bh=WmYR4NPXjWZegkAg3prRV
 LdkwQwq0hbTyPGi9+9kAfM=; b=fcppNbOvmLnhxzhvsN06vD+8CIef34aAnfvFU
 hNTo3AXVbNqYZ6SOdMsEWY8yNmCQDLJ94J2Mb3lPykUZQLcfVNTH7RBJzpnNiKBt
 r5++o5UGENnFWgqc9YTkKEM6hbVKoX5In5nXqMuRXrS6pmO/5khHueZ/HD/sTQ1+
 h4PRYcmpxRGKt/NlUOnCppZozOjaRJ14HhXVRam2dyhhe2q2Hl1UM2N/ASbutiNS
 XYC94YkgqWwYbGbueo/tgZfvcOFkjK6WhkAZFGT7Emdw20lsU42Lc5GxrRfHXabc
 frpfuRe6XCHZkiLQ9umFBqth6gyQEvSoAqSByIot9WQLYyAsQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3wanrvsrnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 19 Feb 2024 17:32:24 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 17:32:24 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 17:32:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP2Y3nlLuJjNkLAuFw+3j2FycoZ0EET7hzAbVQ1FhPeXXAjCgvk+2kkAVK2gPGUtFiQ86y6gSDwj/G5zAyzYNDs82G0bG2HEaW1Qq1Mkw3w35I1in0bKqxvE2eDk26fl1WEfc0hOwFDy109XxuaKGWodpaXe5BBWvcPxAVgsqQfgSkO7YlQ19jXeGTqd3XR2CHLVJQEO+dUt6m9Q9EIBW6FQc/W+2/HcEB0P9OiqrTRJkpXBFBdnuj3vahXwPsnypz+iRwKPfVtklnpyVlrdBoYtaPxGT7/EgxGmaxmTHf2aMS4hLtwRjSyEfeSWOmJjZ5quJvIwyoJX0+OozGvEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmYR4NPXjWZegkAg3prRVLdkwQwq0hbTyPGi9+9kAfM=;
 b=Wd+R1wZqeGwEN6nMgNlTGSrFxgJDOv3y2CAxHz9S4/qUnZf+NJBqGKkog7bz+wGrzQytdTU04WRImlIgJEz5JPb8xQ3rln1gnlvTkbsTjOGnCg3TlBuHRHaVRVGXdL6asJIPd0ldq09KPdWl2gov6+PBWxNMXiMfM2eBTy9A/tcC66uDu5Rvkd8jG7OfMfrtH3uUJHqnzblq+kzU+3349vhvw1tCl1zWi/rfi4ANImtb5biA/mYEiQumXD6wJkvHAzSTW+eCM5dUPPpKj3HYGnBC+6BORSauKzKGQhX039y/TSygEcKsQNPHZhoolp1kGEW3dUzRwWaYsTH0mOz1uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmYR4NPXjWZegkAg3prRVLdkwQwq0hbTyPGi9+9kAfM=;
 b=WYNNYFoBwR776D2OjR87ZE76G1TWdWpOsNgUvCduIlKbIY09TjHcb8iP+5graokeT2D7SU4yOxBIbz+6xMk9YFS4v3u14w/nEurNxSQOZ0WadBDi6zXW6X9kAIyevGba37DnEm47ATPqcerQqbGgTS5MQsGp1GZzArCWU7kvnbQ=
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::5)
 by LO3P265MB1980.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:10e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Mon, 19 Feb
 2024 17:32:20 +0000
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4b5c:d51f:da10:2626]) by LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4b5c:d51f:da10:2626%5]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 17:32:20 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Adam Ford <aford173@gmail.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Maxime Ripard <mripard@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Sarah
 Walker" <Sarah.Walker@imgtec.com>, Javier Martinez Canillas
 <javierm@redhat.com>, Nishanth Menon <nm@ti.com>, Marek Vasut
 <marek.vasut@mailbox.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Topic: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Index: AQHaY1mX3OQ3bT0DIkSDvqromulORQ==
Date: Mon, 19 Feb 2024 17:32:20 +0000
Message-ID: <a05dbb35-ea9e-4ee6-86dd-612c7aeeaf49@imgtec.com>
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <CAHCN7xKffJ29zyjoJVAcy3b_d=-zkFzbL=URj4yWJWzYvRdB_Q@mail.gmail.com>
 <TYCPR01MB11269CBE8429A31DE5002A5A5864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <nzrkujogauvn262ucxippwidyub6ikcohcjpbpn4hzj7rymctm@4owntgrmcquf>
 <TYCPR01MB11269CBAA20275E11D9AD6500864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <wxwad77x2mxhhwdsbgiytzn6x54t4sywodjhzefwldo277njiz@ru7z54wxgelu>
 <CAHCN7xJi-6W6x+OJmkNwOX45SM4WHD5zkN42ZOp8ZxFnp3YL5w@mail.gmail.com>
 <TYCPR01MB11269B2104687F091CFA3405F86512@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAHCN7x+BVYoeDC+Rt4PV-dxyMZ-0GyYfiRcXwmVWwursz5NAfg@mail.gmail.com>
In-Reply-To: <CAHCN7x+BVYoeDC+Rt4PV-dxyMZ-0GyYfiRcXwmVWwursz5NAfg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB3404:EE_|LO3P265MB1980:EE_
x-ms-office365-filtering-correlation-id: 1c6edfb9-9200-4e40-2071-08dc3170b9d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KlrluAb+HWo3ycprf9+ED2sbH6ZDOtVTBsfQ5jv+NIH5mutGQrBsyUkPTONsez7YJlUdEdV0RZ8jz8bWOsHVJZ0fHpNK8PkYk14HoQn6cy6EeqRS2I92/QMTdDZ4HpTYV7+RpPBTHLR8hbFPI5qIOxrvYbR1TlAaevnQIG3VoU2xSWyjYh0V4w++sOy3yCP9FU6SIyNzfjmKqc3/cwImbbWoJD0hoZge+Rp3dvzOXpEsIC2qxj9hxzHEzLH8bNb8sh5Yd1SDYHYMfMyagdSI7M0bM9vwPAtd91UzUp1EE761RY7EqAUAkJ3FeKE2DQ4PivFSkluuSvUFP2g1IFOi5Wm77F48arxPLNzZ9XsOEOKPR9dv5MqyQUHiXCya8MD6FHQt4tp6DQdZh8troMWw95x//TDuLDfosLdiOYmRHuEDJ0tXAhq0cOs1D9E6t3ZdXT3ymL0bshzwNVoC37cxyjMk3n1P9Ztb813scsg6kIpqr6cti+N1GDLpl7BrdzQNQkP7ewerii4R7C05ULsKGBG7Wr/wfOxg4mJrFIr81nvTGRNs9KrijAZm5wcS3davKHi2HeR+Ai2e9/QqqBtnwCiY1mmlvFtQt4NQXdjNJ3Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzR5ZWQ4T0ZiVXIxRDZ6clJPVkE5WWM3TWt5LzZGSjArYUszZmFLQUtBNFd4?=
 =?utf-8?B?QnBPakN4dWt4LzMzZHhmbEFoUWZWRGxuSTBlaE1QUW55eFFxVU5sdWhPSXZz?=
 =?utf-8?B?Wnk4REZoOEU2Z1czbFVYUVhwd2FzSXBTdk1lRWhRalJLWkMvNE9mQ3NJRTJU?=
 =?utf-8?B?TS93TXBxSHBibDhadkpxV0trT0Z4OVp4NSs3SndaOGFGM013S1QwNlZSTXFa?=
 =?utf-8?B?WWJVejVMQm1Gb3FIK2pvQW1HU2JGU3duRlFqajVDcGFITjlGZjRiaDFGdGYv?=
 =?utf-8?B?bXBod2RZOGR0Y2pPMGFyMUdxL1k4ZFVLN2FNTnlQQWlvaDdIRGNZbkdkdHNB?=
 =?utf-8?B?U2pXcDAwWGtrV3l2bTFWTEhaaG9lcXNJbnZRcnJpTzNpZjQ0RFFTeFFaYVB3?=
 =?utf-8?B?TmhuSmkxdHJiUnhBTWRhN1ZQcFpNUnY0aGZ3T2pGUEJzK1p4c1ppSkZNYms1?=
 =?utf-8?B?dG5PUDNweG5CaG9qc2Y2S0FxaEQ0SU4rYlV4Sjk2UEQzTGlJRWNLMFllc0Vz?=
 =?utf-8?B?QWxRTmxqR3Rua0J6dGgydlJaV3B6Vmp5OW93eTIza01peDlHWHliZTNjL1F1?=
 =?utf-8?B?VmN1b3ZLZWZ6VENyQ3VIYUdSQkE3SUNYWHpLaXkvMW0zOHdtWDFodjVvU3Vh?=
 =?utf-8?B?eHUybTcweWkrSUdCZC9nTWwrYUdITUY0Nkt4S0JIWFk3bDN3SlFOSGNPcGRn?=
 =?utf-8?B?Ykg5aTFMSFZPbkdINmdJUHE5VGVZWWlJYnpqSDBUV2t3VWRsYkRhYWIrbFc2?=
 =?utf-8?B?V25ORGJuSVZnMXNBNlNFYjc4N3luOWh5ZHlEUEFBaWFkdExuZEVBUE9LVDhO?=
 =?utf-8?B?MFF4MGp5d3A4bzQ1bEpqNGV3ZWJlTnBKYWRtRlZLZmZlZVVRMEdnQVRWbWxB?=
 =?utf-8?B?UlFkSkNONWFkRnBvK25wNmVXYmg5dmpQRGp1bXFuM3pWaTh3a1J1cjVHQlFL?=
 =?utf-8?B?RXMyVElTRGVQdW9BeXhvTFNwQ0xnd0NQVkI3ZFpSMzkrVTMzVVJZY1BPWjcv?=
 =?utf-8?B?RWdYSncrQXpFMW5mZzJGWlJzcm5xZkY1WlZMNnBjbHBKTll3WlhTTnhCRFRr?=
 =?utf-8?B?d1U2c2NIVEJPZlZZdmZWOHJiOU04QVdCZ2RJTjhwM0xVRkE1aUxoWXFrK2E4?=
 =?utf-8?B?WkxRTFFxREhad21Xd1BrbTRROGRPYy9Yb3ovR2J2bEpVY08rMmZTdWxBRGlt?=
 =?utf-8?B?bzV3Q1lLWFlyaHJyRWJFOERyMEhuK1lmNmNjbWEzUjd3ai9qM05vRUNyZWpw?=
 =?utf-8?B?ZEVmVFlORGVneEZyZXFTT2hlUlBjN3ducFhIQ0V0UzRGRzg4K2ZKNzMyejB2?=
 =?utf-8?B?dVhiV2llS0s3bXFWM1NYalkrYnR1NjVOdXc1TDJNSDFiTnJyQlo2ZDZWQ1Z4?=
 =?utf-8?B?MTZoVjJaUmU2dXJQSENqd08yYUFVU09udTRWVWxFRy90aC9PNktkVkhRdTZP?=
 =?utf-8?B?NXBMV3JvdUZvRWFDKytvb1NkOExVaVFEcS9vVkxEQ2p4TkE1UkU2bzg2S245?=
 =?utf-8?B?RzAwVU9UWDExUzl3eVE0Z09XMjdOSUdlcTR6QzhRWDdoTit6d0FOUGE3RTVo?=
 =?utf-8?B?bnJ0RGdsQjJ4TjRtS2UxVWo2YWN2U3VpSnZxRzRoL3BQdWtwK2t6SVkzRUhQ?=
 =?utf-8?B?YjZTall5VnJQcERoakt5cFIxbXZFeGJyTTR1di8ybmpod0N1NTV2R0xqb1Jn?=
 =?utf-8?B?bU9JSnhrUFBKcXdUNmhHd01nWG04VjlHZEhjbmNRNmN1TFU5ZTh5akVzTHhD?=
 =?utf-8?B?aFl5SENOMTZwcVI3QndsQitqV2FOK2NBWUpwb2dFY1VEVW15Z1ZJbk1tcjh1?=
 =?utf-8?B?YW9xTWlJSHVQSHNJWVpPUzV4VkNyd0VJSVJXK2U0U05xeGFsQ3hJTWltSHhl?=
 =?utf-8?B?WmhRcnNsbnJ6Z0hmd1lURHJxdHlDdWpiUldnRWZ1Qis3QTl3YVJCc2Z4N1I2?=
 =?utf-8?B?VXZ3OEpJMUpEV2pKYW5xbUNMbURrSWxqVHJ1aUtrTzU2T2t4UmtKV3ZBeUo0?=
 =?utf-8?B?bENEYzhjcml5S1BjVDVZMzBpYTRzWGNrMTRKQVJYYkc3U2lONDZlWTZ1VCs4?=
 =?utf-8?B?OUhQWjhrV1Rpc3dZNk9xQW8yaUF3bEkwU0JSWm12eUZzY0tTL3BNTmJ0Zkkv?=
 =?utf-8?B?Z0lxVE9uWW9XS3pGNFpFTk42cFJTZzJXNGRWZzhIZnl4QXd0TW5SeElVR3BB?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Aix8ELYVlghNoPTks37bcxNN"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6edfb9-9200-4e40-2071-08dc3170b9d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 17:32:20.3282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GOwFWldhfgQimNjL2JxNB6OU2bVuDacHIAm+dcx52b/l9bE8N1j/dWAackulOgfQt4B8YlPov0baiTIJnGUzRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1980
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: HdBl9zYOvnouqbK2kS7vtpo7ClLxw1kZ
X-Proofpoint-GUID: HdBl9zYOvnouqbK2kS7vtpo7ClLxw1kZ
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

--------------Aix8ELYVlghNoPTks37bcxNN
Content-Type: multipart/mixed; boundary="------------dI1S9z5QqJcHo0zOM6RJPqjk";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Adam Ford <aford173@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Maxime Ripard
 <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sarah Walker <sarah.walker@imgtec.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Nishanth Menon <nm@ti.com>,
 Marek Vasut <marek.vasut@mailbox.org>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <a05dbb35-ea9e-4ee6-86dd-612c7aeeaf49@imgtec.com>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <CAHCN7xKffJ29zyjoJVAcy3b_d=-zkFzbL=URj4yWJWzYvRdB_Q@mail.gmail.com>
 <TYCPR01MB11269CBE8429A31DE5002A5A5864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <nzrkujogauvn262ucxippwidyub6ikcohcjpbpn4hzj7rymctm@4owntgrmcquf>
 <TYCPR01MB11269CBAA20275E11D9AD6500864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <wxwad77x2mxhhwdsbgiytzn6x54t4sywodjhzefwldo277njiz@ru7z54wxgelu>
 <CAHCN7xJi-6W6x+OJmkNwOX45SM4WHD5zkN42ZOp8ZxFnp3YL5w@mail.gmail.com>
 <TYCPR01MB11269B2104687F091CFA3405F86512@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAHCN7x+BVYoeDC+Rt4PV-dxyMZ-0GyYfiRcXwmVWwursz5NAfg@mail.gmail.com>
In-Reply-To: <CAHCN7x+BVYoeDC+Rt4PV-dxyMZ-0GyYfiRcXwmVWwursz5NAfg@mail.gmail.com>

--------------dI1S9z5QqJcHo0zOM6RJPqjk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Adam,

On 19/02/2024 16:38, Adam Ford wrote:
> On Mon, Feb 19, 2024 at 1:45=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
>>
>> Hi Adam,
>>
>>> -----Original Message-----
>>> From: Adam Ford <aford173@gmail.com>
>>> Sent: Sunday, February 18, 2024 11:26 PM
>>> Subject: Re: RE: RE: [PATCH v2] drm/imagination: DRM_POWERVR should d=
epend
>>> on ARCH_K3
>>>
>>> On Fri, Feb 16, 2024 at 8:14=E2=80=AFAM Maxime Ripard <mripard@kernel=
=2Eorg> wrote:
>>>>
>>>> On Fri, Feb 16, 2024 at 09:13:14AM +0000, Biju Das wrote:
>>>>> Hi Maxime Ripard,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Maxime Ripard <mripard@kernel.org>
>>>>>> Sent: Friday, February 16, 2024 9:05 AM
>>>>>> Subject: Re: RE: [PATCH v2] drm/imagination: DRM_POWERVR should
>>>>>> depend on
>>>>>> ARCH_K3
>>>>>>
>>>>>> On Fri, Feb 16, 2024 at 08:47:46AM +0000, Biju Das wrote:
>>>>>>> Hi Adam Ford,
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Adam Ford <aford173@gmail.com>
>>>>>>>> Sent: Thursday, February 15, 2024 11:36 PM
>>>>>>>> Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should
>>>>>>>> depend on
>>>>>>>> ARCH_K3
>>>>>>>>
>>>>>>>> On Thu, Feb 15, 2024 at 11:22=E2=80=AFAM Adam Ford <aford173@gma=
il.com>
>>> wrote:
>>>>>>>>>
>>>>>>>>> On Thu, Feb 15, 2024 at 11:10=E2=80=AFAM Adam Ford
>>>>>>>>> <aford173@gmail.com>
>>>>>> wrote:
>>>>>>>>>>
>>>>>>>>>> On Thu, Feb 15, 2024 at 10:54=E2=80=AFAM Geert Uytterhoeven
>>>>>>>>>> <geert@linux-m68k.org> wrote:
>>>>>>>>>>>
>>>>>>>>>>> Hi Maxime,
>>>>>>>>>>>
>>>>>>>>>>> On Thu, Feb 15, 2024 at 5:18=E2=80=AFPM Maxime Ripard
>>>>>>>>>>> <mripard@kernel.org>
>>>>>>>> wrote:
>>>>>>>>>>>> On Thu, Feb 15, 2024 at 01:50:09PM +0100, Geert
>>>>>>>>>>>> Uytterhoeven
>>>>>>>> wrote:
>>>>>>>>>>>>> Using the Imagination Technologies PowerVR Series 6
>>>>>>>>>>>>> GPU requires a proprietary firmware image, which is
>>>>>>>>>>>>> currently only available for Texas Instruments K3
>>>>>>>>>>>>> AM62x SoCs.  Hence add a dependency on ARCH_K3, to
>>>>>>>>>>>>> prevent asking the user about this driver when
>>>>>>>>>>>>> configuring a kernel without Texas Instruments K3
>>>>>>>> Multicore SoC support.
>>>>>>>>>>>>
>>>>>>>>>>>> This wasn't making sense the first time you sent it,
>>>>>>>>>>>> and now that commit log is just plain wrong. We have
>>>>>>>>>>>> firmwares for the G6110, GX6250, GX6650, BXE-4-32, and
>>>>>>>>>>>> BXS-4-64 models, which can be found on (at least)
>>>>>>>>>>>> Renesas, Mediatek, Rockchip, TI and StarFive, so
>>>>>>>>>>>> across three
>>>>>>>>>>>
>>>>>>>>>>> I am so happy to be proven wrong!
>>>>>>>>>>> Yeah, GX6650 is found on e.g. R-Car H3, and GX6250 on e.g.
>>>>>>>>>>> R-Car M3-
>>>>>>>> W.
>>>>>>>>>>>
>>>>>>>>>>>> architectures and 5 platforms. In two months.
>>>>>>>>>>>
>>>>>>>>>>> That sounds like great progress, thanks a lot!
>>>>>>>>>>>
>>>>>>>>>> Geert,
>>>>>>>>>>
>>>>>>>>>>> Where can I find these firmwares? Linux-firmware[1]
>>>>>>>>>>> seems to lack all but the original K3 AM62x one.
>>>>>>>>>>
>>>>>>>>>> I think PowerVR has a repo [1], but the last time I
>>>>>>>>>> checked it, the BVNC for the firmware didn't match what
>>>>>>>>>> was necessary for the GX6250 on the RZ/G2M.  I can't
>>>>>>>>>> remember what the corresponding R-Car3 model is.  I
>>>>>>>>>> haven't tried recently because I was told more
>>>>>>>>>> documentation for firmware porting would be delayed until
>>> everything was pushed into the kernel and Mesa.
>>>>>>>>>> Maybe there is a better repo and/or newer firmware somewhere
>>> else.
>>>>>>>>>>
>>>>>>>>> I should have doubled checked the repo contents before I
>>>>>>>>> sent my last e-mail , but it appears the firmware  [2] for
>>>>>>>>> the RZ/G2M, might be present now. I don't know if there are
>>>>>>>>> driver updates necessary. I checked my e-mails, but I didn't
>>>>>>>>> see any notification, or I would have tried it earlier.
>>>>>>>>> Either way, thank you Frank for adding it.  I'll try to test
>>> when I have some time.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I don't have the proper version of Mesa setup yet, but for
>>>>>>>> what it's worth, the firmware loads without error, and it
>>> doesn't hang.
>>>>>>>
>>>>>>> Based on [1] and [2],
>>>>>>>
>>>>>>> kmscube should work on R-Car as it works on RZ/G2L with panfrost
>>>>>>> as earlier version of RZ/G2L which uses drm based on RCar-Du,
>>>>>>> later changed
>>>>>> to rzg2l-du.
>>>>>>
>>>>>> IIRC, the mesa support isn't there yet for kmscube to start.
>>>>>
>>>>> What about glmark2? I tested glmark2 as well.
>>>>
>>>> It's not really a matter of kmscube itself, but the interaction with=

>>>> the compositor entirely. You can run a headless vulkan rendering, bu=
t
>>>> an application that renders to a window won't work.
>>>
>>> I have made a little progress.  I have Ubuntu running on an RZ/G2M (R=
ogue
>>> GX6250) with a device tree configuring the GPU and the GPU loads with=

>>> firmware.
>>>
>>>   powervr fd000000.gpu: [drm] loaded firmware
>>> powervr/rogue_4.45.2.58_v1.fw
>>>   powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
>>>   [drm] Initialized powervr 1.0.0 20230904 for fd000000.gpu on minor =
0
>>>
>>> drmdevice lists card0 and renderD128
>>> --- Checking the number of DRM device available ---
>>> --- Devices reported 2 ---
>>> --- Retrieving devices information (PCI device revision is ignored) -=
--
>>> device[0]
>>> +-> available_nodes 0x05
>>> +-> nodes
>>> |   +-> nodes[0] /dev/dri/card0
>>> |   +-> nodes[2] /dev/dri/renderD128
>>> +-> bustype 0002
>>> |   +-> platform
>>> |       +-> fullname /soc/gpu@fd000000
>>> +-> deviceinfo
>>>     +-> platform
>>>         +-> compatible
>>>                     renesas,r8a774a1-gpu
>>>                     img,img-axe
>>>
>>> There is more to this dump, but it seems to repeat. I wanted to show =
that
>>> it seems like it's trying to work.
>>>
>>> I think I need to modify the powervr code in mesa to recognize the
>>> renesas,r8a774a1-gpu and associate it with the rcar-du, but I am not =
sure,
>>> and I am hoping someone might be able to provide some guidance, since=
 I
>>> think I am missing something somewhere. I modified pvr_device.c in th=
e
>>> mesa driver to attempt do this:
>>>
>>> /* This is the list of supported DRM render/display driver configs. *=
/
>>> static const struct pvr_drm_device_config pvr_drm_configs[] =3D {
>>>    DEF_CONFIG("mediatek,mt8173-gpu", "mediatek-drm"),
>>>    DEF_CONFIG("ti,am62-gpu", "ti,am625-dss"),
>>>    DEF_CONFIG("renesas,r8a774a1-gpu", "rcar-du"), };
>>>
>>> When I run modetest -M rcar-du, I can see the encoders and connectors=
 and
>>> I can display test patterns, so the rcar-du is working.
>>>
>>> I built Mesa 24.0.1 with the following options:
>>>
>>> meson setup builddir -Dvulkan-drivers=3Dimagination-experimental
>>> -Dimagination-srv=3Dtrue -Dtools=3Dall -Dgallium-drivers=3Dzink,kmsro=
,swrast
>>>
>>> I have tried to set PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 the Mesa
>>> documentation for the powerVR, and I have exported the variable for
>>> VK_ICD_FILENAMES to point to the powervr json file.
>>>
>>> when I try to run glmark2-drm, I was expecting the GL reddered to be =
the
>>> powervr, but it keeps using the
>>> GL_RENDERER:    llvmpipe (LLVM 15.0.7, 128 bits)
>>>
>>> I realize this driver is still in its infancy, but I was hoping someo=
ne
>>> could give me some guidance to let me know if the work to do is on th=
e
>>> Mesa side or the rcar-du driver side, or something else.
>>>
>>> I rebuilt both libdrm and mesa.  While I don't get any errors, I also=

>>> don't get the hardware acceleration I was hoping for.
>>>
>>> I even tried  PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1
>>> MESA_LOADER_DRIVER_OVERRIDE=3Dzink MESA_DEBUG=3Dcontect glmark2-drm
>>>
>>> ...but it only renders with llvmpipe
>>>
>>>     glmark2 2023.01
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>>>     OpenGL Information
>>>     GL_VENDOR:      Mesa
>>>     GL_RENDERER:    llvmpipe (LLVM 15.0.7, 128 bits)
>>>     GL_VERSION:     4.5 (Compatibility Profile) Mesa 24.0.1
>>>     Surface Config: buf=3D32 r=3D8 g=3D8 b=3D8 a=3D8 depth=3D32 stenc=
il=3D0 samples=3D0
>>>     Surface Size:   3840x2160 fullscreen
>>>
>>>
>>> I am not as familiar with the Mesa side, but if I can get this workin=
g to
>>> a point where something is rendered, even if it's not 100% compliant,=
 I'd
>>> like to push patches to the kernel and/or Mesa if necessary.
>>
>> FYI, the glmark2 I tested on RZ/G2L with panfrost is with wayland wind=
ow system [1].
>>
>> Maybe there should be an panfrost equivalent package for powevr is ava=
ilable in mesa??
>> That is the only difference w.r.to panfrost.
>>
>> PACKAGECONFIG_append_pn-mesa =3D " egl kmsro panfrost"
>>
>=20
> I am not using Yocto, because I am using Ubuntu, but I have build Mesa
> per the instructions they provided, but the glue that connects the
> powervr to the rcar-du isn't as clear.  I looked at the panfrost
> implementation, but I didn't see anything obvious.   It looks like the
> panfrost integrates with the kms driver, which I was rather expecting
> powervr would do.  I can tell the mesa library is build built and
> loaded but it's not attempting to use it for some reason
>=20
> The GX6250 that is supported looks like it needs some additional
> look-up-tables added to src/imagination/common/pvr_device_info.c
> inside Mesa because the LUT they have is for a different BVNC despite
> the firmware for the BVNC being posted.  I'll have to see if I can
> find documentation for the the features that are enabled or not within
> this variant of the the GX6250.

You can find device info for some devices which are not fully supported
(yet) in [2], including what I think should be the GX6250 you=E2=80=99re =
looking
at. I=E2=80=99m not sure how up to date that branch=E2=80=99s base is, so=
 probably best
to cherry-pick the change(s) you need.

Matt

[2]: https://gitlab.freedesktop.org/imagination/mesa/-/tree/dev/devinfo

> adam
>=20
>>
>> [1] https://renesas.info/wiki/RZ-G/Panfrost_for_RZG2L
>>
>>
>> Cheers,
>> Biju
>>

--------------dI1S9z5QqJcHo0zOM6RJPqjk--

--------------Aix8ELYVlghNoPTks37bcxNN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZdOQowUDAAAAAAAKCRB5vBnz2d5qsJ//
AP0W1k3pzJidPsIUsx6Vi2mzxtJXsuE+aWCkaF6FH07afgEAr4MIpKtlIjK+rkjUeWwtEI9M6N9b
HRlEMl1/qD8UUQk=
=Xtes
-----END PGP SIGNATURE-----

--------------Aix8ELYVlghNoPTks37bcxNN--
