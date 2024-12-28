Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0B89FDE35
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 10:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD9110E299;
	Sun, 29 Dec 2024 09:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scioteq.com header.i=@scioteq.com header.b="LieGh96X";
	dkim=pass (2048-bit key; unprotected) header.d=mail-dkim-us-east-2.prod.hydra.sophos.com header.i=@mail-dkim-us-east-2.prod.hydra.sophos.com header.b="XnfCXzsR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 520 seconds by postgrey-1.36 at gabe;
 Sat, 28 Dec 2024 20:48:01 UTC
Received: from rx-use2.prod.hydra.sophos.com (rx-use2.prod.hydra.sophos.com
 [18.216.23.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D0910E152
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 20:48:01 +0000 (UTC)
Received: from rd-use2.prod.hydra.sophos.com
 (ip-172-21-1-150.us-east-2.compute.internal [172.21.1.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by rx-use2.prod.hydra.sophos.com (Postfix) with ESMTPS id 4YLDk15xD8zPs
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 20:39:21 +0000 (UTC)
Received: from ip-172-21-0-105.us-east-2.compute.internal
 (ip-172-21-0-105.us-east-2.compute.internal [127.0.0.1])
 by rd-use2.prod.hydra.sophos.com (Postfix) with ESMTP id 4YLDk02JNpzvPs1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 20:39:20 +0000 (UTC)
X-Sophos-Product-Type: Gateway
X-Sophos-Email-ID: 31c973fd5a9c44e4820861fe70e45c34
Received: from PAUP264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp17011026.outbound.protection.outlook.com
 [40.93.76.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by relay-us-east-2.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4YLDjy6g1FzgY8H; Sat, 28 Dec 2024 20:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIJ1gqGa2U8JEfzsr9PO6eNz4o1yBWtdSNmreTHzq1zxe7r75iUlDhBhRD0og9xHd5kjaHdixbcI4k9+bjEqgEigYK/5ZKoKlMRjrPWTObjxkKr1PiOJOLr0l94Bljq6J812/Ux0iYU3D1xeF1Le4xqk0yDvziSLGV+e8Pg1UB0UTLZAVk02GNO4+a+Vqk4FmgZp8NtRx7GOa/B+wAMvlugRtLcyPy0uvkWz2vS6WoidWtZwxh2cHyk/acpdZKIiifWrkOQiaF78S5DlfGA5bRKV5sAzVdKqeMg0R4zoML8PKO02/ueaVWwhNBwQwKJuwVT/ilbVAtnsXl5OYpy5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLPbTEiJLhdqDIJ2nxHdZP1aTrQcw5lyVg2XnOS5M+0=;
 b=wQEAexZl8ZvQLHJdzVxG+9pxPGn/GNeFyeP+Nr7SO9Wf1WI6MoWFeIMguVB5lovvRulMRepFV0cOLNNl194qzcbyFYJENz/LHC96pLSY5qNbDwIZ9ty13krXCkwLvqFuEg5iKtdjLKlWw0pONJibMRhFSvijtzxzmhLO/rxCe2AdBSJiz1Xc5aWHvcUuAO7wWC9BEv8g1SET+ADJ13WM5Nw7HYoDuTN3qrBxozVwaTriFJ9LYg4n2t1b4R26cQLewCnj9z/Wg5DVPkxwo1PvIIYlfS3eDsQlVqhfqqbyO+0wnkc2A3lLEp5ehvvY08H1VIobwqLMLHz/z9OHE6Lung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=scioteq.com; dmarc=pass action=none header.from=scioteq.com;
 dkim=pass header.d=scioteq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735418354; 
 s=sophose3b6b7cefe1d4c498861675e62b33ff6; d=scioteq.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=NKOAuIhbZgGVQYk4DaOeKDB6Xa+gXX2E5998iPNEh9g=;
 b=LieGh96Xq2W/+AIG1uNmICCDQFhmkMCJb1FS9SLx5XNrxey9m7fM435Qn/i1hfhs
 oAm6dHFovn0K+mK48N0vODrylrzhNCFhjiJ9qRMe8zSFMjAE+rQWdx7IY9jBdpk6Qgv
 qTJNiIu4gftA/Umj0fKKxfSajx1tKVlYzlhUXOAVt9UxtQim7Q6zzTx1KUh0P4FP2yI
 rt5J8e0r3qVvM870790t8z2uS75Xsg1DRv8R5AYIMJLuNuD+pqCg5lQz+goaJiZ6j2O
 9BUGFWEU+f1F2eutOyb94hb5GgvqDkkEU+FUi2OILjBuAm1q/BErk5wzQYMQZHfEum/
 Q85UkE4XRw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735418354; 
 s=v1; d=mail-dkim-us-east-2.prod.hydra.sophos.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=NKOAuIhbZgGVQYk4DaOeKDB6Xa+gXX2E5998iPNEh9g=;
 b=XnfCXzsRd/a1bM+fMQkG9ClAbWDk2yRVzrhxUmMRkDoZFujZ3kOHJ1oTAWrAVPQ2
 34nflwyh8XuHr0Hdww+NFMlUQEVwvuUnvQK59gA6Ep02WDynKYQUXvsYyktmm5JEA+c
 KuxolD28lie7BUIRzp9ap2TAgNqoV0SEoMuE6Ylpgkymu2IDJRe3A3Kpl2q7uWIwBA5
 t6OaM6+O+RmOD2T34suN8XsEIkj84lxDXfioTZJZ1oIGjLW6WbfgDGieVspmWWgxT9k
 mumB4mZhj6tGLpUpaXOeF+JgANl/19u3qCH17hm95IeUd5RUP60d9YTukpsot8Q402Z
 BUgi6vx8Wg==
Received: from PASP264MB5297.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43b::20)
 by MRZP264MB2281.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Sat, 28 Dec
 2024 20:39:15 +0000
Received: from PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3de1:b804:8780:f3cd]) by PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3de1:b804:8780:f3cd%5]) with mapi id 15.20.8293.000; Sat, 28 Dec 2024
 20:39:15 +0000
From: Jesse Van Gavere <jesse.vangavere@scioteq.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: ADV7511/13 implementing atomic ops and bus formats
Thread-Topic: ADV7511/13 implementing atomic ops and bus formats
Thread-Index: AdtZZUmvw1C/rl0TQhus0UegErW9TQ==
Date: Sat, 28 Dec 2024 20:39:14 +0000
Message-ID: <PASP264MB5297B5EBA1F58342332B4002FC0F2@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=scioteq.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PASP264MB5297:EE_|MRZP264MB2281:EE_
x-ms-office365-filtering-correlation-id: b9ca2baa-8ad7-4422-115e-08dd277fb128
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Bfr4KyDKwimQjfRRppL7q69rfwTDuwD0V505YMc7gBgtbLC7a69rOL8RTQPW?=
 =?us-ascii?Q?dIt3+MDHhdvqfYT3bSD0Bdy5lc6663nmOyuxGmpcDaq1HRCnWyUdLkJ2Ze0E?=
 =?us-ascii?Q?bTinNNxDO3nEoQI0xovk1G12wkz9E0MRnl6gf3fogx7IgZ+faQoqi0pJ06NB?=
 =?us-ascii?Q?U4PZPypQHDw5gYCajWw+dgDwojCBgA18uUt4I4Oky+Q9YLEuw1Qd842EEaEm?=
 =?us-ascii?Q?b4WhY6yGGobMQXJf25Z6GKsEArOZ6/N3B2iZmhpNqVIIRRakR8OveoaANcte?=
 =?us-ascii?Q?qpXXL7wzjFf+1GHghpApm/ht1QKhrRFF6FNzZw5juVjSF4X0OF3nWKrO3mgI?=
 =?us-ascii?Q?2xCCDzFZZzPq8/vEInriQ+STPmz0+sY9fdqCR+wTQ4uNH8QADB2pgn1QLrbB?=
 =?us-ascii?Q?jSQ3Y0DEHdGWWa8j/Joc+hBDT4oB4VxoXhWD8Bq8v+qiFMlTIOyrtJ+trgO6?=
 =?us-ascii?Q?8yydlY9gGWYYwm3vKS/iT+zRq77PziSj6MhxamCWDjCalJKUYQi9Xs/3W62i?=
 =?us-ascii?Q?/iPsvXj8/vZn3xLWsaSxQdNJ1+JgJ1LGntAnSdHx4F1Cw42aCf3tJSpXpg3R?=
 =?us-ascii?Q?1fjHaRFcwpmV1qB5jTZkbeDixNMa5UA2xYbThUhpTvo/xDD/ySVjfOiS1tRx?=
 =?us-ascii?Q?8r6LJURUQ5zjywZPHgbaXA/5qYs3klFjCYs8PUVIBETltvx+qqWKC4oydY8m?=
 =?us-ascii?Q?6ULoT3KshRYo1478d/kYlodEEpUTRp2NId0EZe4UrA7bhZzQT9c/bxejt1GV?=
 =?us-ascii?Q?x9au6KcEPfm8FKa99qcRA6b04Mxq7usn18DqIQNMjHGD1gUJyjkYn2bIx6tE?=
 =?us-ascii?Q?8nHlLt3+zH4Jqjxs+xhg9XeIMlhsDLkgDiTloIYFrl15W1fXik94iKkInU2w?=
 =?us-ascii?Q?EBuc7ge95XgTmgEl4vnBGPvotJQ3tioj+ddFfyD2TFPvYFrloKTq2tAKjs0J?=
 =?us-ascii?Q?J7CBZd2V5MD0GFK6NLfwU+P3Wx2MApMovLGR6G6UIp5fy8DG3u7hxtY7lQj7?=
 =?us-ascii?Q?O5XDjMUEUwDfumL98UYtauOZLt9ensKCWKDzXNkNYqPFCxxygOqsmvRjAS7m?=
 =?us-ascii?Q?ml5JDVu+S1b3uRO4uXfQYwodDpVESAkfIUxbA0Q336hP5hkO00XMZIq589bs?=
 =?us-ascii?Q?YByiKK9JV3ujxqI71jCc6ss73f3l3H8tsWwrMucuF0VBLqBaUaiECcmcz9fX?=
 =?us-ascii?Q?nR6aTlVTzv3tJ2cf12lE6DL8TlZI9YzorblwgY2qOEZVcjP4wXoeHBHgObUx?=
 =?us-ascii?Q?UpfLlpE/RGkBinyIUwaP25M1cKVPEVV5vEPx4vFjY/hTMwfcXd523g6ASDNa?=
 =?us-ascii?Q?jI/Qrnpzz5jAXHdlAbgQiM+C1/NBfRSAgvHvrgo5VH/78n5rnpi2ZJIOuJrI?=
 =?us-ascii?Q?TGoUCauqkZkXYAUbttzv7VLGCF5wg2zwNcXkbrvbOo8AkkryaDYR/tN7M1Zk?=
 =?us-ascii?Q?m2saqMWxoyPVseoFSy5L4B81bInP/TIk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; 
 IPV:NLI; SFV:NSPM;
 H:PASP264MB5297.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE; 
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(38070700018); DIR:OUT; 
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cfhYPn36g73PSOMvAlUOIm+P2OuuQOEzxXInb3gnb0skCkzjzo9+t/NGyDT1?=
 =?us-ascii?Q?rgTmBi/g+Hq0RFP4ZuvjQFJ9pZ4IgDe4rlapqShrVJW5fokIrE0mIu7f3lKN?=
 =?us-ascii?Q?B3FYDURbfBgmDF3xnggzNlWM+qzIfopvv+ke2s7gPO8tblohrZhJPYGKbMJH?=
 =?us-ascii?Q?hOvwGBy+uvSTJ7zMN3OYuQEUSz+KFGKvXv1C3xrCu937C0CLwtY/OEaR7/Ra?=
 =?us-ascii?Q?bG6x2KxqLYURFks7Y+UIURyAQGTwtACzf/BOJToB02vst/22tqh18QE6ULK0?=
 =?us-ascii?Q?zB0nZNRxaRuEl1qBtZOoa4bqhF+fHUQD55nsr2DGZe8g5/RzKmZUtZFiEShb?=
 =?us-ascii?Q?Vetlso8mRb25gPwZbk7Fhdun4YKjG5IwAsx9lCNF/AcmnseY99OlqC9sCbQR?=
 =?us-ascii?Q?dm/tMQT76vwt1miHyHfRKMoiQrpUVK6gpNgIboEKpDSDHOBDDC6JS29f6K8X?=
 =?us-ascii?Q?xAN4Msm5n2V3nvrb4KyWDyFhInfkztgR0Jit8oTPg9k06stlA4JGi8m0A4sb?=
 =?us-ascii?Q?3C8L7ToWFQgI5q2Lx7BeTzI/aVNPWQWuIrJDQSD/tgjBPHHr6vCVVUD2pnqH?=
 =?us-ascii?Q?PB5Zu9IogPD0srPaReUVYr46mzj8XlH5ySvugSVCJa8KD1/RiqOVLPTHyP3F?=
 =?us-ascii?Q?C0bxFOyRbbvUQo4CIBBSlW86qUlujuOBmd68wOdBdliiNO/2/vPcu9g017A5?=
 =?us-ascii?Q?nFl+gFL3jOm09KFEKiYVvf7qtwmKIlYmnaG+MnzPtznOSLUXavAkY1XAW3kS?=
 =?us-ascii?Q?tLPvZCfFxV2brg/RXoBlUQpRk5DD9/d8ri9SwC/xoZorQJFCtmyzKrfFzxzZ?=
 =?us-ascii?Q?nl8mxB20dRjp1CzTj7kYJjNvriFDBhoV/gCxePQtcdssGAFPwmUALgMmmQfc?=
 =?us-ascii?Q?LpZ1pcQkyJO1atD9xYpQd5zUUFKml12qAW0/PihXph5JcyESXbc8aM/jscBj?=
 =?us-ascii?Q?wI9uGGGF9/N/+GizZzMPwpfEoqdv9bk5cKQMxzh3vTpqQkDxMSlKkH46+Yv0?=
 =?us-ascii?Q?xLNPdNbHF69KfPoX0icdf+n+cdQ5qYbuQczRJn4vPn0PQsH/lFRkdekmqHpA?=
 =?us-ascii?Q?kPcTfmHb/t3/hTUlflk1TmJUfs/1W0loDXMSX6bWoxtYiBT2zbtSkLRnfR9j?=
 =?us-ascii?Q?EYD7qCX+6Fj/h4omifB4/GJg1midqfpVjQmgMaLCeStF0G/lxz2vN/c1exo+?=
 =?us-ascii?Q?roFL6DCcfm+ocoPIBAkhTdCywGSUlc+uMnOC880ekZiv+YjTLbQEOyd6gSVI?=
 =?us-ascii?Q?CpV6hosIrQy9hng8uuCLTpHN/1RndB81Te/AQys6t2/NuaJiAFalPPUSAdj4?=
 =?us-ascii?Q?0rqrAbgtXTWXZqXLZwmbin9mDEGIyrO5af71YWP9F6OgsT0IOPzARbO+4nvB?=
 =?us-ascii?Q?FbNhaOtLcHM8Gk4UZD22VqY4iSINA88aRXToHLst16iRzOwlgjVCdviHYiq5?=
 =?us-ascii?Q?bwF0/xBoVBXpRPbcrgodZyAnm2nKZwXill5HDlO46duoPJTlprpw30Hjjk1c?=
 =?us-ascii?Q?V0HUUyheM8VUcQr+W+fx/LMab15r8Wxc8D63sBlAM52qz2WcpUqGJvRpGmyn?=
 =?us-ascii?Q?gSalS8P3VLcc71W+LYbXYJkIYQTKLJ9G3UdZlJSB7zm53BxH4/wNUiSFpDfp?=
 =?us-ascii?Q?yQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PASP264MB5297B5EBA1F58342332B4002FC0F2PASP264MB5297FRAP_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wZ115NZW56dLl0msNI6IaD+LdGkZ20B4Nu2yULLdlOh+cj80ijxjmSsCQ5xQSh596K9ZvGB3W+MAGdI6TCfqZLu91dywvMwRxWzRa3Rq94s6IRUHD58Oh2Nvs7gPk5ou6IOIssEIJyNtH4JI0/KV/txOnOm1AyKADPV9P9/hjYdHDyq08ye6yJb5JDTiXM/N21P2GALArrBBklbXb5Jcu4AWH8lZyRG0oBTVPkuE3uiYLRKRZKRJ59XdG6FTboLHhux8trQibkMlk+3A33bz5ub0xddimJZ8AGzvLaIyE5Wxc2NGBPV6iJ6eTR0p+21IGipTg98MfMOZjnpMdpP7yQ83LYhA5ZpEV8IDvy9VclQdcs7yQcUNi7UYwzLNUSzjarAt8XoGW1/L64QQdgaYfQJIN9zdfh5jrXEdBwLuRnKRy8a9HhxjqLGc1QYXw6ImcjMNENVJtSDUK8yaBUpCID4iWC96MAjg3fE8PwOJmEX8jJbEyiPjitPrFPeyDPA8pB//xNtHYx5MdRfwYXn+fREL3w9xyXHzNgtpHUV7qsJuYg/I2KjbevHsSvwwNumrSy2TK5XDvjXXtPbnvECUZezOauht2uCZ82tEjT72p4OJB9RBkKhNay24n0qYH4mcYzw3J/wt/3+3WfFu96/VkCh211Ag45jhnfHb91nOHPg=
X-OriginatorOrg: scioteq.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ca2baa-8ad7-4422-115e-08dd277fb128
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2024 20:39:14.2148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f3e5b271-16f7-46b9-bdb3-4271ac933ef0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K3DwVruSYMlxN9Ah9TVW3UQHTZapi3WZtaflO9gb14GGkg9Rhd22qNFCRsyQeJovTJvXr50AUsyGAerMu9rREnsCsVOsj0pqZLM6o2LmcAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2281
X_Sophos_TLS_Connection: OPP_TLS_1_3
X_Sophos_TLS_Delivery: true
X-Sophos-Email: [us-east-2] Antispam-Engine: 6.0.0,
 AntispamData: 2024.12.28.200346
X-LASED-From-ReplyTo-Diff: From:<scioteq.com>:0
X-LASED-SpamProbability: 0.124553
X-LASED-Hits: ARCAUTH_PASSED 0.000000, BODYTEXTH_SIZE_3000_MORE 0.000000,
 BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_10000_PLUS 0.000000,
 DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000, FROM_NAME_PHRASE 0.000000,
 HTML_90_100 0.100000, HTML_95_100 0.100000, HTML_98_100 0.100000,
 HTML_999_100 0.600000, HTML_99_100 0.100000, IMP_FROM_NOTSELF 0.000000,
 LEGITIMATE_SIGNS 0.000000, MULTIPLE_RCPTS 0.100000,
 MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_URI_FOUND 0.000000,
 NO_FUR_HEADER 0.000000, NO_URI_FOUND 0.000000, NO_URI_HTTPS 0.000000,
 OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, SUSP_DH_NEG 0.000000,
 TO_NAME_IS_ADDY 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __ATTACH_CTE_QUOTED_PRINTABLE 0.000000, __BODY_NO_MAILTO 0.000000,
 __BULK_NEGATE 0.000000, __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000, 
 __CC_REAL_NAMES 0.000000, __COURIER_PHRASE 0.000000, __CT 0.000000,
 __CTYPE_HAS_BOUNDARY 0.000000, __CTYPE_MULTIPART 0.000000,
 __CTYPE_MULTIPART_ALT 0.000000, __DKIM_ALIGNS_1 0.000000,
 __DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
 __DQ_NEG_IP 0.000000, __FROM_DOMAIN_NOT_IN_BODY 0.000000,
 __FROM_NAME_NOT_IN_BODY 0.000000, __FUR_RDNS_SOPHOS 0.000000,
 __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000, __HAS_HTML 0.000000,
 __HAS_MSGID 0.000000, __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT 0.000000,
 __HAS_X_FF_ASR_SFV 0.000000, __HTML_BAD_END 0.000000,
 __IMP_FROM_MY_ORG 0.000000, __IMP_FROM_NOTSELF_MULTI 0.000000,
 __JSON_HAS_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_DOMAINS 0.000000,
 __JSON_HAS_TENANT_ID 0.000000, __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TENANT_VIPS 0.000000, __JSON_HAS_TRACKING_ID 0.000000,
 __MIME_HTML 0.000000, __MIME_TEXT_H 0.000000, __MIME_TEXT_H1 0.000000,
 __MIME_TEXT_H2 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_TEXT_P2 0.000000, __MIME_VERSION 0.000000, __MSGID_32_64_CAPS 0.000000, 
 __MULTIPLE_RCPTS_CC_X2 0.000000, __OUTBOUND_SOPHOS 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __SANE_MSGID 0.000000,
 __SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR2 0.000000,
 __STYLE_RATWARE_NEG 0.000000, __STYLE_TAG 0.000000, __SUBJ_ALPHA_END 0.000000, 
 __TAG_EXISTS_HEAD 0.000000, __TAG_EXISTS_HTML 0.000000,
 __TAG_EXISTS_META 0.000000, __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
 __TO_NO_NAME 0.000000, __URI_NO_MAILTO 0.000000, __WEBINAR_PHRASE 0.000000,
 __X_FF_ASR_SCL_NSP 0.000000, __X_FF_ASR_SFV_NSPM 0.000000
X-Sophos-Email-Transport-Route: opps_tls_13:
X-LASED-Impersonation: False
X-LASED-Spam: NonSpam
X-Sophos-MH-Mail-Info-Key: NFlMRGsxNXhEOHpQcy0xNzIuMjEuMS42OQ==
X-Mailman-Approved-At: Sun, 29 Dec 2024 09:27:47 +0000
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

--_000_PASP264MB5297B5EBA1F58342332B4002FC0F2PASP264MB5297FRAP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey all,

For one of our new boards I have to get the ADV7513 chip working with TIDSS=
, the driver for this expects a bridge chip to have atomic ops and provide =
bus formats.
Doing this for our own needs was quite straightforward but I'd very much li=
ke to upstream this as I think it could be helpful for others as well,
I do have some questions I hope to get some answers on that could help me i=
n writing an initial patch.
I hope you'll forgive any ignorance on my end as it's my first foray into D=
RI.

- For all needed atomic ops I added the drm atomic ops helpers, except for =
atomic_check, looking through the
other implementations I can't quite figure out what I'm expected to impleme=
nt here, what is the expectation for
this function?
- Looking at the lontium 9611, only the input bus formats bridge function a=
re added there, which seems sensible
as the output goes out straight over HDMI, is it a correct assumption I'd o=
nly have to add the input bus formats for
the adv7511 driver? Part of me thinks this might not necessarily be correct=
 as it seems the chip can be chained further
than merely to a connector and I'm not sure what this would (or could) expe=
ct
- Does Input justification matter for the bus format? My assumption is that=
 left/evenly/right does not matter for the
format as it only relates to which pins are used and it's e.g. MEDIA_BUS_FM=
T_UYVY8_2X8 no matter which pins this is placed at
so I should just focus on the actively used pins.
- As it's a common driver for adv7511(w)/adv7513, would anyone know if they=
 all use the exact same types of input styles
(of course with varying color depth support) so that I could use ADV7511 as=
 a sort of superset for all possibilities and work
from there to define all the input formats?
- There seem to be certain formats in there that don't exist yet, such as Y=
UV444 12-bit VYU (if I do this right and read highest data bits to lowest,
which I assume translates to MEDIA_BUS_FMT_VYU12_1X36), should I just write=
 a patch for all missing formats to the uapi media-bus-format header
or is there anything else to take into consideration?

Best regards,
Jesse

--_000_PASP264MB5297B5EBA1F58342332B4002FC0F2PASP264MB5297FRAP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-asci=
i">
  <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
  <style><!--
/* Font Definitions */
@font-face
=09{font-family:Wingdings;
=09panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09font-size:11.0pt;
=09font-family:"Aptos",sans-serif;
=09mso-ligatures:standardcontextual;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Aptos",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-size:11.0pt;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
=09{page:WordSection1;}
/* List Definitions */
@list l0
=09{mso-list-id:88737249;
=09mso-list-type:hybrid;
=09mso-list-template-ids:-1062931850 167696962 67698691 67698693 67698689 6=
7698691 67698693 67698689 67698691 67698693;}
@list l0:level1
=09{mso-level-start-at:0;
=09mso-level-number-format:bullet;
=09mso-level-text:-;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Calibri",sans-serif;
=09mso-fareast-font-family:"Times New Roman";}
@list l0:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l0:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l0:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l0:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l0:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l0:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l0:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l0:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l1
=09{mso-list-id:206454758;
=09mso-list-type:hybrid;
=09mso-list-template-ids:-541035176 243155612 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l1:level1
=09{mso-level-start-at:0;
=09mso-level-number-format:bullet;
=09mso-level-text:-;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Aptos",sans-serif;
=09mso-fareast-font-family:Aptos;
=09mso-bidi-font-family:"Times New Roman";}
@list l1:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l1:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l1:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l1:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l1:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l1:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l1:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l1:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l2
=09{mso-list-id:354379703;
=09mso-list-type:hybrid;
=09mso-list-template-ids:-1058234614 -1514891570 67698691 67698693 67698689=
 67698691 67698693 67698689 67698691 67698693;}
@list l2:level1
=09{mso-level-start-at:0;
=09mso-level-number-format:bullet;
=09mso-level-text:-;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Calibri",sans-serif;
=09mso-fareast-font-family:"Times New Roman";}
@list l2:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l2:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l2:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l2:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l2:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l2:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l2:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l2:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l3
=09{mso-list-id:384183856;
=09mso-list-type:hybrid;
=09mso-list-template-ids:-1743476166 1759020786 67698691 67698693 67698689 =
67698691 67698693 67698689 67698691 67698693;}
@list l3:level1
=09{mso-level-start-at:0;
=09mso-level-number-format:bullet;
=09mso-level-text:-;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Aptos",sans-serif;
=09mso-fareast-font-family:Aptos;
=09mso-bidi-font-family:"Times New Roman";}
@list l3:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l3:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l3:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l3:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l3:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l3:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l3:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l3:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l4
=09{mso-list-id:628247142;
=09mso-list-type:hybrid;
=09mso-list-template-ids:722493616 516062886 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l4:level1
=09{mso-level-start-at:0;
=09mso-level-number-format:bullet;
=09mso-level-text:-;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Aptos",sans-serif;
=09mso-fareast-font-family:Aptos;
=09mso-bidi-font-family:"Times New Roman";}
@list l4:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l4:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l4:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l4:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l4:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l4:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l4:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l4:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l5
=09{mso-list-id:666633512;
=09mso-list-type:hybrid;
=09mso-list-template-ids:-98001648 730655268 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l5:level1
=09{mso-level-start-at:0;
=09mso-level-number-format:bullet;
=09mso-level-text:-;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Calibri",sans-serif;
=09mso-fareast-font-family:"Times New Roman";}
@list l5:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l5:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l5:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l5:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l5:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l5:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l5:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l5:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l6
=09{mso-list-id:1435857355;
=09mso-list-type:hybrid;
=09mso-list-template-ids:-417159396 -1625757136 67698691 67698693 67698689 =
67698691 67698693 67698689 67698691 67698693;}
@list l6:level1
=09{mso-level-start-at:0;
=09mso-level-number-format:bullet;
=09mso-level-text:-;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Calibri",sans-serif;
=09mso-fareast-font-family:"Times New Roman";}
@list l6:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l6:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l6:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l6:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l6:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l6:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l6:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l6:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l7
=09{mso-list-id:1741098059;
=09mso-list-type:hybrid;
=09mso-list-template-ids:-1553823274 351319478 67698691 67698693 67698689 6=
7698691 67698693 67698689 67698691 67698693;}
@list l7:level1
=09{mso-level-start-at:0;
=09mso-level-number-format:bullet;
=09mso-level-text:-;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Aptos",sans-serif;
=09mso-fareast-font-family:Aptos;
=09mso-bidi-font-family:"Times New Roman";}
@list l7:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l7:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l7:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l7:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l7:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l7:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l7:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l7:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
ol
=09{margin-bottom:0in;}
ul
=09{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
 </head>
 <body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap=
:break-word">
  <div class=3D"WordSection1">
   <p class=3D"MsoNormal">Hey all,<o:p></o:p></p>
   <p class=3D"MsoNormal">
    <o:p>
     &nbsp;
    </o:p></p>
   <p class=3D"MsoNormal">For one of our new boards I have to get the ADV75=
13 chip working with TIDSS, the driver for this expects a bridge chip to ha=
ve atomic ops and provide bus formats.<o:p></o:p></p>
   <p class=3D"MsoNormal">Doing this for our own needs was quite straightfo=
rward but I&#x2019;d very much like to upstream this as I think it could be=
 helpful for others as well,<o:p></o:p></p>
   <p class=3D"MsoNormal">I do have some questions I hope to get some answe=
rs on that could help me in writing an initial patch.<o:p></o:p></p>
   <p class=3D"MsoNormal">I hope you&#x2019;ll forgive any ignorance on my =
end as it&#x2019;s my first foray into DRI.<o:p></o:p></p>
   <p class=3D"MsoNormal">
    <o:p>
     &nbsp;
    </o:p></p>
   <p class=3D"MsoNormal">- For all needed atomic ops I added the drm atomi=
c ops helpers, except for atomic_check, looking through the<o:p></o:p></p>
   <p class=3D"MsoNormal">other implementations I can&#x2019;t quite figure=
 out what I&#x2019;m expected to implement here, what is the expectation fo=
r<o:p></o:p></p>
   <p class=3D"MsoNormal">this function?<o:p></o:p></p>
   <p class=3D"MsoNormal">- Looking at the lontium 9611, only the input bus=
 formats bridge function are added there, which seems sensible <o:p></o:p><=
/p>
   <p class=3D"MsoNormal">as the output goes out straight over HDMI, is it =
a correct assumption I&#x2019;d only have to add the input bus formats for<=
o:p></o:p></p>
   <p class=3D"MsoNormal">the adv7511 driver? Part of me thinks this might =
not necessarily be correct as it seems the chip can be chained further<o:p>=
</o:p></p>
   <p class=3D"MsoNormal">than merely to a connector and I&#x2019;m not sur=
e what this would (or could) expect<o:p></o:p></p>
   <p class=3D"MsoNormal">- Does Input justification matter for the bus for=
mat? My assumption is that left/evenly/right does not matter for the<o:p></=
o:p></p>
   <p class=3D"MsoNormal">format as it only relates to which pins are used =
and it&#x2019;s e.g. MEDIA_BUS_FMT_UYVY8_2X8 no matter which pins this is p=
laced at<o:p></o:p></p>
   <p class=3D"MsoNormal">so I should just focus on the actively used pins.=
<o:p></o:p></p>
   <p class=3D"MsoNormal">- As it&#x2019;s a common driver for adv7511(w)/a=
dv7513, would anyone know if they all use the exact same types of input sty=
les<o:p></o:p></p>
   <p class=3D"MsoNormal">(of course with varying color depth support) so t=
hat I could use ADV7511 as a sort of superset for all possibilities and wor=
k<o:p></o:p></p>
   <p class=3D"MsoNormal">from there to define all the input formats?<o:p><=
/o:p></p>
   <p class=3D"MsoNormal">- There seem to be certain formats in there that =
don&#x2019;t exist yet, such as YUV444 12-bit VYU (if I do this right and r=
ead highest data bits to lowest,<o:p></o:p></p>
   <p class=3D"MsoNormal">which I assume translates to MEDIA_BUS_FMT_VYU12_=
1X36), should I just write a patch for all missing formats to the uapi medi=
a-bus-format header<o:p></o:p></p>
   <p class=3D"MsoNormal">or is there anything else to take into considerat=
ion?<o:p></o:p></p>
   <p class=3D"MsoNormal">
    <o:p>
     &nbsp;
    </o:p></p>
   <p class=3D"MsoNormal">Best regards,<o:p></o:p></p>
   <p class=3D"MsoNormal">Jesse<o:p></o:p></p>
  </div>
 </body>
</html>
--_000_PASP264MB5297B5EBA1F58342332B4002FC0F2PASP264MB5297FRAP_--
