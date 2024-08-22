Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A38E95B44C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 13:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCD910E86F;
	Thu, 22 Aug 2024 11:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="mXdt/8yj";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="EEjNHrue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 646 seconds by postgrey-1.36 at gabe;
 Thu, 22 Aug 2024 11:52:47 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BA410E86F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 11:52:47 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M5qDbP027921;
 Thu, 22 Aug 2024 12:41:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=xaoUM7E12H3OyJAcjxUBDe8MD
 jPuDUUtrViqo51rLws=; b=mXdt/8yjMi4LoBbKWisPAsbZ3Okz+lGNqeq+0P3fu
 VVht9boRAiMeIldl1WNcRurzGzHryRBlpEWZUmtG9Rj4H3Aa/Zkg0ELdrLoedXZq
 Tbe1TdxJviil2jUzdXdzzYTayVoaI9i1LBY7UctCajoSM5kB4VG3r0/Ssi4KmsNX
 MlbKOMbBRrEuvEi1ChtuvJs41ju5tBueMG9o7Q78oZ2Boggt+36ntTP6WqVDhzTj
 VCnTuEp0hvFt3VJSHzC6JXPma0Kn4NjKsD1IXRLdiT9Ik8D69+3YwnnoyJ+h8Wyz
 HPkCHVN7IrcqK7LZL0dGYbYVdkavVMGASssIAS/wUM8eg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 412kxvvj3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 22 Aug 2024 12:41:58 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 22 Aug 2024 12:41:57 +0100
Received: from CWXP265CU008.outbound.protection.outlook.com (40.93.68.1) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Thu, 22 Aug 2024 12:41:57 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnXDELMpuSYovqFR9gqafGs3t3fwHWWNS0wQ5x/P4iAyHC0KLDK8Tu11nVdlyIKtv6p3aTkEVNXtnuFOLghSFA86LXrCMw5pbYZGoK1NYaVjep2Fp4sNPOOpcxNNtLVU+J+uLNfjsBXfTW17gvfU2NzOurBW3iI5qY2PnuvaA/0jFPjH+pLSG1gf1ljsdvCnxdGUiXkj3CaiLQzjfJ22L/u6skxVqdejtjYSvarI3RXCp67gHfeUc36xn5BLbHW2bvm9TADjxbHJ+3D34WuPeAsgOEQTAZmuZnzlQ422qCVTL4UNhZq15Q842APNVi4k6Ru4DjqloFk8TcDMdz+c5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaoUM7E12H3OyJAcjxUBDe8MDjPuDUUtrViqo51rLws=;
 b=Qq6HQ3blH3JXrSORf92ji7fsOOCZMyWr/EDeAyLo9Xa3JkclgEaEAUkZVRudR4bUseySpbvAi3RXSnT9GaWJ5Jy25FKcAsCIAEV0joOkEvpvHm178hDCytqtdjURgDk4bxQGFmXR2sNddDiJxWn3sewE58vsiqm0h06WNGs5UquOnaT9wU7CQUeWtI//GA2McTXxZnWnUKoz9yo/WlV33cV8apMjglACAwOf9OZg3RRZ/m0lP8oU0HJam3domj98O9s0ZJgqHA3cZxmo7F7LbupY4busV9ERAwiSPIDpMxuMJAnlPkB9L6yPGbOvccI2r5Dwk2NhIDBf8jjprhRWSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaoUM7E12H3OyJAcjxUBDe8MDjPuDUUtrViqo51rLws=;
 b=EEjNHruedufZVatxp6Hyy+qEGKIXE5IR69jXjoWbV5z+WTB9erK2OdHe5TW6moCJyOC3TxFje+PeK887T1yDUrOhzgx0xsh4zJGX6k9fzSyXC3dAm5xN2Op1BbisL9EhgGpRpOfC/KJ+JHB5Jy39LkQefpIUSS+iCxOFt1IYUac=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB1875.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:5f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Thu, 22 Aug 2024 11:41:56 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 11:41:56 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Chen Yufan <chenyufan@vivo.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, "opensource.kernel@vivo.com"
 <opensource.kernel@vivo.com>
Subject: Re: [PATCH v1] ImgTec powerVR DRM driver: Convert to use time_before
 macro
Thread-Topic: [PATCH v1] ImgTec powerVR DRM driver: Convert to use time_before
 macro
Thread-Index: AQHa9IhKZecFbZjDy0mxgwtQB3hYNg==
Date: Thu, 22 Aug 2024 11:41:56 +0000
Message-ID: <cd240d42-a529-428b-ab99-982a29799820@imgtec.com>
References: <20240821092121.16447-1-chenyufan@vivo.com>
In-Reply-To: <20240821092121.16447-1-chenyufan@vivo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB1875:EE_
x-ms-office365-filtering-correlation-id: c8116ef8-b1f8-4233-dbed-08dcc29f6cfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VDlhQnFydEoza29ENDM5aFhJUGlUWERLc2lWMmhtMFUvOERNWHdCQndMZEla?=
 =?utf-8?B?NFVJazRleHp2OG95UkFjcUd3UE5WRnVySGxYQ1hRSFcxaUMvK2NsTVc1RFho?=
 =?utf-8?B?Qml5bW9lakV1c2toVVpQZWVEMk5tdGZ4eEp0NWRhbDVnS3ZoVmxSL1VpbE85?=
 =?utf-8?B?TUtEbVdTTU1UOTJBUGp0bnM2eTJUcjhpcnk0SEpDK2F4QnRZcWVFV3BOSDAz?=
 =?utf-8?B?aE9hWmJXcjUzc2d3bFc3R21zWkVTR2dqbzhGZ3RzcDdMcTY5S2l5d3JnczFR?=
 =?utf-8?B?YkpMRE56VkdZcmRKa2lTUGtPN1NiWWYyVjRROGJiTVNQL3NOcnBRWFlJa0d6?=
 =?utf-8?B?bzhpSzVRNllZYkZtWkpPUUlLSmVzbWZwMitqVmE1c1lmVjhtaXdsZ2pnelFM?=
 =?utf-8?B?OWpYMm85Q3ZUZDZKRnJZTE0wQzVhTjBVTTZPREthSklkRU1nQ2tGUG9tSzA1?=
 =?utf-8?B?U3dYNXlnRlJSUDJBTno4eDVyQzFvQVpwNzhUbktTUG15RjkvVHdkZXNOTDEz?=
 =?utf-8?B?d3g4R2twU3JTSUI4TFhNZ2kvU3ArdWpHemJoM3NhaCtvNEhtcWsxMnNWQ2tI?=
 =?utf-8?B?cjdSL0tVbnYxeko0M21zQzVSK3loQXh6MDhleWdtRWlneU84cDQ1WlRpMDU1?=
 =?utf-8?B?Ujc3WndwRW82OHBMc2VYMGVyeGdFMDVDNzIvTjZQeEs5eWhOMFY1ZC82TEgx?=
 =?utf-8?B?VG4zYWl5S2d0K2NKNHJ6ZERsVnoyQVpRV2ZOSXJKc0lQcVJ5NkoydVpNOWpB?=
 =?utf-8?B?NE9RVFJDT2ZhTVB0cGhKY2ZxcWp1eG9GQW9XS0ZaSzhWS08yVjhHZjNtQ1Zn?=
 =?utf-8?B?UHlRMkhNUy9BSGVpVjFXK1IyY3NFVElNeDJqdExNOWJWcXh3VHpkaVRnMjZm?=
 =?utf-8?B?eEtuWE51ZWNoUEJHeHI5LzFVeFI5ZGk1ZWVnajV3akVnVUZpMzJlNUNvN3dN?=
 =?utf-8?B?QzRjY0ZVdWZQV3FMQkQ5V2k2alQxV0Zrdkhhcm5tTnhSUWs4NG1GUEJmbnB1?=
 =?utf-8?B?OERIUUtYNlRKMG5GdEM5eU9JUWh1QXhtSFkrV2JNUGc2YXEzejhVWWxzdXBU?=
 =?utf-8?B?dHpHdkttaWVFNDlCVnVlek9DcTltZzBDbUNQcUVLYU1IbWFxVlhQRUorcG12?=
 =?utf-8?B?R1lDUS9xMnJmK0V6T2EvaklvT203ZDZtbHV5cUtLN3E2Mk42NktBdjFrNEZI?=
 =?utf-8?B?ZDRTc0s0TnRPT0tCM283UWNJNEVFendXVGo3OTBXWEpJZmwveGpNREZjdGs3?=
 =?utf-8?B?THNGbUZKeFpEYU9WS2puTC9vSmxDN216eGgrMHYyNFF4UmJKUVUxaDZraFR2?=
 =?utf-8?B?UURnYW9wSTI5OVh2RGNNWnlwbkloV0xhS2N0YkNCU2UrMDRhQUZpcEdYdEY3?=
 =?utf-8?B?L0dYUHBUdE83ZG1LMlhxcTNUbTVtOXBFWjM4aVhmTTV5OEtOS3ExencraEtW?=
 =?utf-8?B?MitVRGhkT3hiNFFPTEJJalRSNXZqMUR1SVpSZHdadGZmSTcxYWhWQkdaYXk0?=
 =?utf-8?B?TVJWKzQ4RW1EaG13aDZUTWEwVDBPY2NndDJuTXpFaW5KTXN4MnFCM1I5VUdK?=
 =?utf-8?B?VmNZRDFoQ2QwR3FKZWQwVjFvNEkxMlRWN3J6U3dIOUJMYWJaYUtmOFAyR2Rk?=
 =?utf-8?B?YmpZL0lLZmxZZFZEU25wdzZFTmRvWFAyOWhYZWdzaXVOVmZEa09udTUwUFI3?=
 =?utf-8?B?ajdzL245VVg5RXVRSm5VZWVtbHg4NE0xbFRlcy9lNGhNUEtFTmdyK2FpRkpu?=
 =?utf-8?B?RldBRG1yWEhSMHFSb040Y3BtblJFa1RGT2J2Slhsbjg0STdBYVpVeXBxaVBm?=
 =?utf-8?B?TWRvcEcxQUR5SjQ5TXBwYm9WUE1UT2c3bjluMDU5anZtb3dWZ0kwTkR2V1Js?=
 =?utf-8?B?bm9Qcjh3MTdOTXQ4b3UvN0Y3bmNjRDF4R0swaFZqb2NOemc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzMxbEwyb3RZdFlRS2UxZjArczRycHMwYkw2TzVFTXdEQTc0MmFDL2IwODNo?=
 =?utf-8?B?TkNpMlVoeVVHNU0va3paelVTY0U2TVplY2RBbDZVQWdlYTY1RTBlakZQM3I2?=
 =?utf-8?B?QVVUR2c1TktmS0Zxbm5HT0h1cXUyaWFhUFRNb3ptbHVqelo3WjNmOWViencz?=
 =?utf-8?B?OHd4MnV4Q3RFSDA0eTRCcWJ2UjZhbmhveUVrQWhlMHlSSGVnSWVaTmJ6U29h?=
 =?utf-8?B?cnd3b3dwbXNONlEzZnFmZ01xTXUwNzY4ZXlvUC94VWtsQTVRcXRzZDF5RUdT?=
 =?utf-8?B?aHVBS0VuWGQrOTgrVjV1NjlnUXdZM3BnckVUam1MN0gxUlIrMVZlL290SFQ1?=
 =?utf-8?B?NFhiZmVyRStSUitLT01NWkR6eUo3WFdRTnVwcXBJc21zQVpJaXl4QzN1cFpu?=
 =?utf-8?B?SS8wUURBSENOZzdrMnhYcUc1YUVUdnRISGR1cWM3MVZWcmt2L3pib2VLcFk2?=
 =?utf-8?B?OXdiV3RYVjJGWXJ1elVVbnJjZ2IrcWcxNWhmVHAyYjZIY0dQM3BHSzFGTlhR?=
 =?utf-8?B?VEJBQkJINzBSYkMwekVhZkViMStGa2I5SXZNOVJTZFpmVm1LSzBaTjh6MjhC?=
 =?utf-8?B?SFB3L1RPamlseXRvQVBVTndSZU5SVmxuRzFGcERIcWMrVmtDWC84bnNIM1Ez?=
 =?utf-8?B?Wng5Q1V6OGV3WW9xUGMrR3RwTjNlWkVNUzFEbXVjbmFiVFFqZkRkQXFxSXo3?=
 =?utf-8?B?N3Rvb05TMlkvbHRNMXB4SlJBdEN0WXRYcHBmeWZBMmlEUzZrVVJwM2RXNm85?=
 =?utf-8?B?eFB0VTRqbTV4cU5zbWEvQk1Odlo5eGYzWGEyRUkwZ0YyRFNZV1ZIUlZtb09Y?=
 =?utf-8?B?dk5Xc1NwN1cyT0JGRzJ2cVJyN3FmbGhaK0UzZlBGa01sZDZaMlVyMkkwYjZa?=
 =?utf-8?B?WTJsUE1UV2dPZ2FxdnU5bTM0Yzk4REUyWjlzSFpBWHI4UWxYNjBpYkZLV0dE?=
 =?utf-8?B?NGhVN29oNUlTMWdFRTZWUE9IUXNGdFg5NnZoTTRKNGE2L2FYNmtMc21rdzE0?=
 =?utf-8?B?S2liMFBORkdBOFU1bjVVRHpBOFF1Nmg0dmRiUGVhY3RYMW4vSlBzY1lONmtz?=
 =?utf-8?B?dGlXVGUrcVpWY3FQaStwUW0vUGNqTml0MHVUSFdJU0RJNVFzOS92VHViSDFx?=
 =?utf-8?B?Uk4vQmNvSlp0MkNUK1ZSc0J1TzRpTWlwbWFSSmhCdC9weU1OV2k1R0ppYTN5?=
 =?utf-8?B?Q1huc0cvNjlvSkZjdlk0VVNuN3VoUlZaTklZNnpwMk5qajZ2ODUwaFc5NmdO?=
 =?utf-8?B?aExiWHEzRUFVWXRmdzcrTjRENytybHliTUtlRk1FM1JKOGRaOEZEZEdGYTF2?=
 =?utf-8?B?TVJxb1R4eWFhK0pLeGlQbWU4TktwQlFGUWNlTlZNVWJoWUFPd1B4TndVdUVU?=
 =?utf-8?B?MUtjeGJEcnE0Mk4zd1NRNkNXSkh1Y2phUnBqOVhCVk10R0pHRDlIa3dqNGl6?=
 =?utf-8?B?bkF5WC9vY05ta0VlVVNBWHpYY29sZUYvMFpLTlBjUUI1bGF3cEM4MnZUR0RW?=
 =?utf-8?B?R2V1QUJEbWdseDFnVW5yK1RVdnhmVENKZWllOWZnc0FyUk9LSXBqaGFrcVZl?=
 =?utf-8?B?ZHNpN09PUHpiZWlHa0VDaEpoOWRUdU5NVjYwVENkeUtJd1NXaEtKMDBwT244?=
 =?utf-8?B?Ykp0Q01PYkNTQTBJMWNHcXRuUTBJZ2FsRHdXWG1OdXZ5TU9hcG1uYTFsYzNt?=
 =?utf-8?B?ZzVuTXVJcE9RNWMvNHdKR3pXWnZETlFzcE8vSXNwcEZTMFQ4dzVVeC9Gc3FP?=
 =?utf-8?B?aTY2ZmI2aFVvWUFXclBiaFd3TjVnbnZzTTlJSnlxcC9OUWl0K3BacXRIWVd0?=
 =?utf-8?B?UnNSTzJhNGhIcXlGY3ZlT3haL1dJVEQ3TW56eEJzMDU4ODg3VUtzN25rbkRS?=
 =?utf-8?B?RUZsYkFQMGRuZGFzczRWWHZZelpLbkhjOGNRelpvQnJhTHdvM1VtZTFZZzdv?=
 =?utf-8?B?S2ozN0ZKT3gxcEhwLzFScHl6aWljRmdtTjNEVVF5ci9aL2VkZ1dGd0tKcGZX?=
 =?utf-8?B?SW1NT3ZReDhQVFp0TXdYejJpZnU0cFB6SlBCU2JqS0ZsRVhhU2pKQUpZV2FQ?=
 =?utf-8?B?Vkx6MjFEQ0d6SC82bVVHZG5hL21DSXFZWGNsTmR0dEJvOUF5bkVEeHRYT1ZF?=
 =?utf-8?B?RGQrazdQUXhMbDFYUExaMGNvd1E3WFMza2JDQy9GUEx2MlVtSkFObWtUYm45?=
 =?utf-8?B?enc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fwWzFy3RF0aYWKFlKQLWqfpv"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c8116ef8-b1f8-4233-dbed-08dcc29f6cfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 11:41:56.3548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGS6n6Ck9U1bXnzPVeARtmqsKwHhQvAUG3sM0xHwZjVWnfa1Vc3oMHCGCG1qnUGowx4oVtVMEEHgcso/gXs7ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1875
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 1QWZlMaIN-OkY1pEksJzCZ62bbbICahc
X-Proofpoint-GUID: 1QWZlMaIN-OkY1pEksJzCZ62bbbICahc
X-Authority-Analysis: v=2.4 cv=fNZr3oae c=1 sm=1 tr=0 ts=66c72407 cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10
 a=WnR_qW7rlZcA:10 a=1WtWmnkvAAAA:8
 a=VwQbUJbxAAAA:8 a=sColX5iFZo2H8MQR3_0A:9 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10
 a=xa8LZTUigIcA:10 a=eBLFRIA6j8Jwhsye6OsA:9 a=FfaGCDsud1wA:10
 a=-_UHfarfsM-RsASml2Jt:22 a=AjGcO6oz07-iQ99wixmX:22
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

--------------fwWzFy3RF0aYWKFlKQLWqfpv
Content-Type: multipart/mixed; boundary="------------MCctYra0wEQTzLR0Kx3aALzB";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Chen Yufan <chenyufan@vivo.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Frank Binns <frank.binns@imgtec.com>, opensource.kernel@vivo.com
Message-ID: <cd240d42-a529-428b-ab99-982a29799820@imgtec.com>
Subject: Re: [PATCH v1] ImgTec powerVR DRM driver: Convert to use time_before
 macro
References: <20240821092121.16447-1-chenyufan@vivo.com>
In-Reply-To: <20240821092121.16447-1-chenyufan@vivo.com>

--------------MCctYra0wEQTzLR0Kx3aALzB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQ2hlbiwNCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2ghIEp1c3QgYSBjb3VwbGUgbWlub3Ig
bm90ZXMuDQoNCk9uIDIxLzA4LzIwMjQgMTA6MjEsIENoZW4gWXVmYW4gd3JvdGU6DQoNCj4g
U3ViamVjdDogW1BBVENIIHYxXSBJbWdUZWMgcG93ZXJWUiBEUk0gZHJpdmVyOiBDb252ZXJ0
IHRvIHVzZSB0aW1lX2JlZm9yZSBtYWNybw0KDQpUaGUgcHJlZml4IGhlcmUgc2hvdWxkIGJl
IGJhc2VkIG9uIHRoZSBzb3VyY2UgcGF0aC4gRm9yIHVzLCB0aGF0J3MgDQoiZHJtL2ltYWdp
bmF0aW9uOiIuDQoNCj4gVXNlIHRpbWVfYmVmb3JlIGluc3RlYWQgb2YgZGlyZWN0IHN1YnRy
YWN0aW9uIGZvciByZWFkYWJpbGl0eS4NCg0KSSB0aGluayB0aGUgcmVhbCBqdXN0aWZpY2F0
aW9uIGhlcmUgaXMgY29ycmVjdG5lc3MuIFRoZSBjb2RlIGFzIGl0DQpjdXJyZW50bHkgZXhp
c3RzIGlzIHN1c2NlcHRpYmxlIHRvIG92ZXJmbG93IGlzc3VlcyB0aGF0IGFyZSBoYW5kbGVk
DQpjb3JyZWN0bHkgYnkgdGhlIHRpbWVfKigpIG1hY3Jvcy4NCg0KPiBTaWduZWQtb2ZmLWJ5
OiBDaGVuIFl1ZmFuIDxjaGVueXVmYW5Adml2by5jb20+DQoNClBsZWFzZSBhZGQgYSBGaXhl
czogdGFnIGFzIHBlciBbMV0uDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2ltYWdp
bmF0aW9uL3B2cl9jY2IuYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaW1hZ2luYXRpb24vcHZyX2NjYi5jIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9u
L3B2cl9jY2IuYw0KPiBpbmRleCA0ZGVlYWM3ZWQuLmI3ZDVmOWNhMyAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jY2IuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2NjYi5jDQo+IEBAIC0zMjEsNyArMzIxLDcg
QEAgc3RhdGljIGludCBwdnJfa2NjYl9yZXNlcnZlX3Nsb3Rfc3luYyhzdHJ1Y3QgcHZyX2Rl
dmljZSAqcHZyX2RldikNCj4gICAJYm9vbCByZXNlcnZlZCA9IGZhbHNlOw0KPiAgIAl1MzIg
cmV0cmllcyA9IDA7DQo+ICAgDQo+IC0Jd2hpbGUgKChqaWZmaWVzIC0gc3RhcnRfdGltZXN0
YW1wKSA8ICh1MzIpUkVTRVJWRV9TTE9UX1RJTUVPVVQgfHwNCj4gKwl3aGlsZSAodGltZV9i
ZWZvcmUoamlmZmllcywgc3RhcnRfdGltZXN0YW1wICsgKHUzMilSRVNFUlZFX1NMT1RfVElN
RU9VVCkgfHwNCg0KWW91IG1pZ2h0IGFzIHdlbGwgZHJvcCB0aGUgY2FzdCBoZXJlIHRvbzsg
aXQgb25seSBzZWVtcyB0byBoYXZlIGV4aXN0ZWQgaGVyZQ0KYXMgYW4gYXR0ZW1wdCB0byBj
b3JyZWNsdHkgZGVhbCB3aXRoIG92ZXJmbG93Lg0KDQpDaGVlcnMsDQpNYXR0DQoNClsxXTog
DQpodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N1Ym1p
dHRpbmctcGF0Y2hlcy5odG1sI2Rlc2NyaWJlLXlvdXItY2hhbmdlcw0KDQo+ICAgCSAgICAg
ICByZXRyaWVzIDwgUkVTRVJWRV9TTE9UX01JTl9SRVRSSUVTKSB7DQo+ICAgCQlyZXNlcnZl
ZCA9IHB2cl9rY2NiX3RyeV9yZXNlcnZlX3Nsb3QocHZyX2Rldik7DQo+ICAgCQlpZiAocmVz
ZXJ2ZWQpDQo=

--------------MCctYra0wEQTzLR0Kx3aALzB--

--------------fwWzFy3RF0aYWKFlKQLWqfpv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZsckAwUDAAAAAAAKCRB5vBnz2d5qsNDl
AP4jZ8VW8VYt+PWpM98wRd/PzcK+ANv7uD4Hx+f2yOMoygEAsgJUcA3rOgF0if6qOt8v82NB32Dv
hQl/oWLG/o3emQ4=
=gcm+
-----END PGP SIGNATURE-----

--------------fwWzFy3RF0aYWKFlKQLWqfpv--
