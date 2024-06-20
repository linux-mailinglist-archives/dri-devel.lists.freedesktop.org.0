Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55428910209
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 12:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE1410E8CF;
	Thu, 20 Jun 2024 10:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="c64mzPso";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="rXfjo7rS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 20 Jun 2024 10:58:40 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C641110E8CF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 10:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1718881120; x=1750417120;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RElIdpUpsy4QkeFjdNRo4HYGDBLrt592W3i6SIV3ths=;
 b=c64mzPsoHpacxamypcDiTlfR8hOA8AkKdq/EV+oCJfPSgh/yMoyAolDW
 /IOj44laTnEJfe/DAd6+D1JrV6ar4GTOEiHD1iWaH/KWaHPR0EBxr6Gdu
 tXns4J1cFK3upyoNNiO0vcXNYRUFeBVQnt/SN4xd5B1p5C+ENBxS1i9t9
 D9DevuPZ1QziubLosg7qUg1xP3M0O0UXPhCS1/82C9lygPWt77KW909y0
 BL4KehYGvIVL+0Bv8vTfl+igSn/MhE16dogQHO1Owm5H6XXQ9s58dbMBp
 d/2R9V8JGt33qFJzVE3DtBXUdTl6kY/qKaNacz8xxMnq9rdCfXVE67W8H Q==;
X-CSE-ConnectionGUID: vs1jm8x1R5K2VaTBWjMKXw==
X-CSE-MsgGUID: Yvo4MzoTS7mNYeWZ0xgdbQ==
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="28262925"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2024 03:51:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 20 Jun 2024 03:50:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 20 Jun 2024 03:50:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPHdw7Wg74MudyrHfEBnNbO1F8hQfW/C3E4vfg1262LL7CkZhuCNciFDhpJmujwExpRIhFus8hvpbagAUBe9qd146izxfmxFLcnYEer73jMmCrR3ANgRyKjMNaVIivU+au/66XVLaVhcsvmc3VDEDTgZu85a8q5xqI0Mau3gYu0CQLxqejfvEUr81/sWA/bz2OPAL0e1gSBzuR7+KdISIIviXrPiYr6rEWrcR0ui6BPm3TbyzXbobZasa090DXNbkYQ3ZfmS5AgS1nwcVCsKM6IOCta7Y3L1w5hnMabLIZ7ztb53RYUyNqaVqLzVPpkgPHNIp9A32qyiY1XJnpUphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RElIdpUpsy4QkeFjdNRo4HYGDBLrt592W3i6SIV3ths=;
 b=FIfFwV6k2LIMmvQ/0y/vuyiNQWomYFTfXqvIH4oTMfCR70JIFvt23n3cdMmSOCN3NsJiAqaBkR5qMwrLweDRudthxhJpKEyy/4sUyBJleXx+lz5OIEE6bFR7EuJAAAvlyQwTcelzVd7I/q62rqIXVDsCh/RqIRZonIVB0m/DT3+dy6TUMUPe3vh0oxDzzuUo1tubaUPaLKYDWdghwp548+mNepO9GqScQi9aX8UYWVVZrpDI7XqiqXHrxfKJKq1HXHnYQtT6npZoFjcfh/do6jNu3cNdqYMBwr28OuEOEscz30bpQdPmlPWZgCEgbFShT+E7OJNrgplvf9u2MIqzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RElIdpUpsy4QkeFjdNRo4HYGDBLrt592W3i6SIV3ths=;
 b=rXfjo7rSLP6GCxzfDecoWrWD94P2o7iwuicx1IttgMzxdoz1uNsjFdugbwU2D8kutOxrOkPegMqvnLRhX4Eb89kYM9Q3Ie9OjDIPnv3+RuNBBkh1k8JTXpu6ygEi5yZN/pujGE0eqEVl9MbUyFm8TrlGUf03RxN5TcYQMORZY/gk5yORenrkHjbGnEfwrDQkd8sXwSYYhBJLtyvQpFqIF4LKoGE8TJYU1SoslUKJV36s0fx9iWCJQQyNxLuxyrrzjDAT+aWPAl5iYnwR6wctdeotfEb04zqK06AkFsQxj7DjFtdWwwz/4yX37puV+HSr9NvxWRuTd19M5L9Af+aXIQ==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 10:50:54 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%6]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 10:50:53 +0000
From: <Manikandan.M@microchip.com>
To: <dan.carpenter@linaro.org>
CC: <dri-devel@lists.freedesktop.org>
Subject: Re: [bug report] drm: atmel-hlcdc: add driver ops to differentiate
 HLCDC and XLCDC IP
Thread-Topic: [bug report] drm: atmel-hlcdc: add driver ops to differentiate
 HLCDC and XLCDC IP
Thread-Index: AQHawu7smlu7Z/MmC0iwRi6tqIZltbHQedIA
Date: Thu, 20 Jun 2024 10:50:53 +0000
Message-ID: <4af97a91-5b41-4344-9c28-7a95e1c4be1f@microchip.com>
References: <8d3717ec-76d1-4f62-a1ca-043d9a6d2c56@moroto.mountain>
In-Reply-To: <8d3717ec-76d1-4f62-a1ca-043d9a6d2c56@moroto.mountain>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|CY8PR11MB7134:EE_
x-ms-office365-filtering-correlation-id: 00c795fc-d286-41f6-4149-08dc9116db97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?ak5BVks3ems1akhQM05VNGJoS0cvSWxkNnNHK1NqbW5IbGZLOS9UOHRyNGNZ?=
 =?utf-8?B?NG9zdzBSMUp5b1dnM0FSa0xobzl0UFVER1BVSExHRFhHZTA3YmlzRGVXd2tk?=
 =?utf-8?B?d3VyVGZtQ01DRjFkNzFXWlNnZ1piTSsvQTZTVnQ3RG9uMG5YcmNXQk5KMUd4?=
 =?utf-8?B?eUZLczJmOTdjMFRib1VYb2NKTE9OWE5pcnl6YUcvL2JkNDk1QVAydDZibDFU?=
 =?utf-8?B?S1cvSVdjbklhWkx0QzNxSTk5aktIMWN2V09WQXJIYkxNaXBwUWNJazByL0Zs?=
 =?utf-8?B?Q1pGZ1lpZXFtVkpESHVSSzRUa3JHcFRNZ1IrWVl6QnNLN1M0Yk1COXJ6Ry93?=
 =?utf-8?B?aDg4K0hzclR4QXV3ei9GN3d5QW5DcWFTVTBMdStTTnBjNVAyRWwvVUNaRGNp?=
 =?utf-8?B?QXJiUWU5SFY5c1QvTnVKVzJ4b1VoRllSbURpSUZJc0tEMDF5Znh1T2N3QnhZ?=
 =?utf-8?B?WUlrZFFNSktkZXJUMDZqaVRlQklsaDVlMk1VZmltVEVIdXNUVlpMOHFYNm84?=
 =?utf-8?B?MDFiRWdvNU9YcEROM1pBaXAxSHdTL0xhQ1FQckZCRjZ4MUNDaE1ZRnRXUERF?=
 =?utf-8?B?NVZhZldobGtOWFJSRkZYYlVXaTZHNlZiZVFFMnJ6ZjY3MVZXeFdRa0svNHZv?=
 =?utf-8?B?dGZWdDFMeHRzUDZpZExwbk1pQ0N6MmUvMndsNExsYVF5N3djdDg3ajRyd2Rv?=
 =?utf-8?B?QkVvVDFFK2tyc21yTktjaXBFaFNJVDlWOUFzNUJBZlJDUk56by9KOFJmd3RK?=
 =?utf-8?B?VzNERkpHbnFIdDJrZmNYSFJscWErSitZOHU1Rjc5RWV1YVRLTkFheUlkQ01j?=
 =?utf-8?B?VjVlaWZOQXVvVTRmYjBIRUlzTjl6bTh0REYrdXd5VW1ZWm5zREY1Y1JlVngz?=
 =?utf-8?B?a1FaVUp0c0tHcU9Gb1U4M3RmemlsQlA1dG5yZ05YTU5NNUgzaEl3bWxVWlJH?=
 =?utf-8?B?WTk5K29BWWE2ZWhVNGF0Qk5jV3owSmIzOXRiZk85azRtTHVsWTJwS3YxWkVF?=
 =?utf-8?B?UU9aaDVsNWd6SHNPNnQxa0NSOGNzVHE0aHFUVW0xVW1Jd2JOM0xpOVVGL3VV?=
 =?utf-8?B?Vnp0REVTVkc0emZlbmJCdnJCSFNxeGFWK2FraE9SRCtneHJGQzdwZ3ZQclor?=
 =?utf-8?B?bmQxNGw5WTJtWnJZU2ZCN0FEM1daMDRBdVowUzZ4cng3R1FjT1NSNUZ4WmNO?=
 =?utf-8?B?bWNldXFKNXVxd0gzKzNuWTYvcVBIME1lZkJFZStyWWV5dmVDYSt3WnlYL1hp?=
 =?utf-8?B?dFlOd2Z3QVJteThqeXJPNDV4bGFja0J0dXNnNDJ5NVJIZmxNeHZyZjF5MlI2?=
 =?utf-8?B?a2MySTJ3NnhxQmJNSk5QclVHZGdTWHA1QlhpY0RmZ1Z1U1h3VWhXalJIejVS?=
 =?utf-8?B?Y3JMTlZrbnBlZi9SMUo3eFJPMlYreEJMYmhwVi9hTCtYa05XQzc1RFFBWnJ5?=
 =?utf-8?B?TGpmcTlMa1ZzTC8xZ0FsUHZlV0hrTFd6dERINEFXZFNQdXRKd2lrTVlvQ1p4?=
 =?utf-8?B?dTdja3N3aE1MV3dCaUNlYUk4ejRWUitqWDBqa3duSm9ZVUd4RVVJcDN1eE9O?=
 =?utf-8?B?YWFjQk9icUJ4eFREUXhaaXhCRVBscllUdlRGem9Ma0dSYW1ZbE5xNUV5K0VJ?=
 =?utf-8?B?L1lXZTdkZ1l5dUtEVVQ4UC9zd0pKTFBGajBmUG5UN2NuVnlZMkxuOExiL0pY?=
 =?utf-8?B?Z2VxdEUxbUVEemJMYlJSVXozaDFscmxNY2Z2UzUzd0dMVDF5WWExM3ArS3BN?=
 =?utf-8?B?OWVZZXpJSDQ5L3NzeGJhYm1sZFNPVXI0SUdZR3FucmJYOG01U2F0L25wWjVO?=
 =?utf-8?Q?WX5uD7wz46GeOvCgvzwtP1C1+QonU7RMzrKfQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkRuTmhJWWlvNXBvT3NlZW4ranNnUGlmVytocU1rTlJzMGNYYmJsSk05MzdH?=
 =?utf-8?B?N2xHdlN5dS9zZUptNmd1blRNa29qdkNLSGpldC9vMG5IT3g3aGU5NE00Q0pO?=
 =?utf-8?B?cmpVY04vRVo0K3ZvajFKNEpOV3JKWHFQNURZbWNnQmJtL28wNEVZMFRUdDVS?=
 =?utf-8?B?WUlieDBUSGZTYWlUdFZ4OHBUWmh1UHhUNnlqZmErMHpISU9VdzZTRytJTVpK?=
 =?utf-8?B?cGIwK3V5ZTM3d2U1K3M3dlh6V09UR09Yb0NQV3oxQStRYzFmV2NVSE9Ec1dq?=
 =?utf-8?B?dGZOYitXa05OQzE5b0NocVV2VFp3UHBLeGwxbzZsZ2ZxemZqeUdGMm95UEhx?=
 =?utf-8?B?Yjh2Q0hjRzFrRG9GOHJyTURPVUlscmV6L3dremFCMGE1ci9IMXU0MHI5OWhL?=
 =?utf-8?B?ZGErZ3dwUVIvcVJzZXFZOGVSOHEwYW5EM055K1Y1aStpQ3krTVNwcDBXbWdx?=
 =?utf-8?B?T0JWb3dNSjBxOGRVcHl6RDMrZ0YzeDRnZ0ZrUFdSQmZtQWt6QlZnY1Y0Wndt?=
 =?utf-8?B?V3RQUk5mVUFTL3ZsZDkrSjllRytJMG1jUEVBaktvQ2loTUJRMFUxdlc0TGJK?=
 =?utf-8?B?WndLQ0F0ZlpCNWdaSHJjeEVLTzVsM3FlVFo0WVFRTDFqUHcxVkZoOFdCU0ZF?=
 =?utf-8?B?cm5CeVpoSU1pQUFYSmFNMDdKZXVFZmkxbWxLeVdMczdpMjZPWU1UTWsvTUJQ?=
 =?utf-8?B?SWZCQUZIbzJsblpUM3c3TlhuQXh0ekNwQUJUMG9qSmRodkwzSlVvaG9NT1Vy?=
 =?utf-8?B?YWVZZEQzODh2K3drRFdnVDZZdVllcVFFeTkzTWZocUkzWnpBL25UL1lXVC9C?=
 =?utf-8?B?RTdQdGI2bG1YQmxqc1l4WDNyWC80MjhhU3FsT3cwcnF0YTlFeVNjMUVHcXE0?=
 =?utf-8?B?Vy9rUXUxaDB6ZGhwdHhKUXMvai95SytGcmlwWXhQT1hpbklEOGM3b0FYUXdD?=
 =?utf-8?B?NzkzTEpNOFh6UUpobS96d3d6WTdLNndEb2VtZmkwKysxVzRlNVhjalpadzJO?=
 =?utf-8?B?QVNveE9lSnVxQm9jSmlxOG4xTFFwcDJRcERWNVFJemswOWVvTzUvSkpMc2ov?=
 =?utf-8?B?d01ocTNBZ28xM1BOUHdORDZkREJLMDNkQ1V4ZHpIbE9XQXBRcUVhbHVXY1lE?=
 =?utf-8?B?NXVacEdpU0Z0Mnh1ZkRwRkJPRjNIbzMxeSs3OFd1OE12REhESWNONGlDdzAy?=
 =?utf-8?B?TGFSNnZDdEFCMHpVNzJ1dWtISWJiOHE5NkI0Y1k2aDIrWWhxcmpKU2l4Z2Rn?=
 =?utf-8?B?MFRKbXRLekkweitNOUdrcHdWZDE2ZmkyT3hUdnRwakxKZXY4d1RHMldiY3dk?=
 =?utf-8?B?b0ZNby9oT3lIeUFKWVJ0b1NobVQ2MzhpbHR0SjNVVDdyc2ZaL3dla3RiNU1H?=
 =?utf-8?B?TXhkSGhZWExSZlQ4b0pzOUR0bEE0Tkgxa3AwNGMzK2lkMDRIdnJ0MFJKN0Vu?=
 =?utf-8?B?UWphM1ExWkp5Z01aRmNEZjdkQ3VDRkRNRjk4ZjlHYVkycVBjTngzL0duamIx?=
 =?utf-8?B?SXdlNkdGUG5DNHZOc296UkVOeWdjSjdNU0FibmJxMmR3cStLc01SVzJTa2s0?=
 =?utf-8?B?VmgyeVZiaFFXK3hVRFcyczJUZnpnOXVrQjhmV1pGd2ZidURTcllqR0cyb2x6?=
 =?utf-8?B?OGVHbzd2NGpZSld6OC9ENUQwazVZQWwveHU5cWsrNGtpVUVZYXBkZVl3Qm5n?=
 =?utf-8?B?d21meS9adTRHRFJ1a3R2bzFEdmFyVGorSkhjMXdkbG9vQWFyVzdyL0FoeDZT?=
 =?utf-8?B?QkRaV1RuL2lKYlAwaFpUSE5YcVZpVlEvVTRadjZYWDlGVklIY3ArMTFnN0Jk?=
 =?utf-8?B?cU1GTWRWc3VMVjF6RWZ4Q2txMC9ONXU4K2M1a1d6aXBHdkFFaUhkUTY1NVJK?=
 =?utf-8?B?SHdON0pxMkF0bEl1aVZ0Sm9GRVF6WThYUUpCKzVza1hPK2h4UVBUZWlnUC9R?=
 =?utf-8?B?RE1RMGwyYXdneEJNUElVekNZTnhSMHNDNHppYXdNeis3amx2cTlJMUZWQnI0?=
 =?utf-8?B?L3ZIeExJTnlmU1VXa3FQbXBwOWM2Uk8vbjFlZTg3YVpCd0RTMXBSeTNScnNL?=
 =?utf-8?B?ek4zSENkU1RZMzlqT1l0bkF5Sm0xV3AwdElhcG51SWZrN2FkMWZXVCtUWDR1?=
 =?utf-8?Q?VtU8injjAItHRot7NFTDGcaxr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65084A4CB20D224782EB012E2C9EFAD3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c795fc-d286-41f6-4149-08dc9116db97
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 10:50:53.8913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yjW8w6FHRWCfUVQr9K5uC+swRnrHdea0dSZ7bz/6fi/+ALVxucH4T6UV7lZIeWpDNgMpuxYkDClS0lJZHkEi/5Bp9/zPiGMsMTM5/RN8eaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7134
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

SGkgRGFuLA0KDQpUaGFuayB5b3UgZm9yIHJlcG9ydGluZyB0aGUgYnVnLkkgd2lsbCBwcmVwYXJl
IGFuZCBzZW5kIGEgZml4LXVwIHBhdGNoIHNvb24uDQoNCk9uIDIwLzA2LzI0IDI6MjAgcG0sIERh
biBDYXJwZW50ZXIgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mg
b3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0K
PiANCj4gSGVsbG8gTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4sDQo+IA0KPiBDb21taXQgYWE3MTU4
NGIzMjNhICgiZHJtOiBhdG1lbC1obGNkYzogYWRkIGRyaXZlciBvcHMgdG8NCj4gZGlmZmVyZW50
aWF0ZSBITENEQyBhbmQgWExDREMgSVAiKSBmcm9tIEFwciAyNCwgMjAyNCAobGludXgtbmV4dCks
DQo+IGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgU21hdGNoIHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6
DQo+IA0KPiAgICAgICAgICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNf
cGxhbmUuYzo1NzMgYXRtZWxfaGxjZGNfcGxhbmVfdXBkYXRlX2J1ZmZlcnMoKQ0KPiAgICAgICAg
ICBlcnJvcjogdW5pbml0aWFsaXplZCBzeW1ib2wgJ3NyJy4NCj4gDQo+IGRyaXZlcnMvZ3B1L2Ry
bS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jDQo+ICAgICAgNTU2IHN0YXRpYyB2b2lk
IGF0bWVsX2hsY2RjX3BsYW5lX3VwZGF0ZV9idWZmZXJzKHN0cnVjdCBhdG1lbF9obGNkY19wbGFu
ZSAqcGxhbmUsDQo+ICAgICAgNTU3ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZV9zdGF0ZSAqc3RhdGUpDQo+ICAgICAg
NTU4IHsNCj4gICAgICA1NTkgICAgICAgICBjb25zdCBzdHJ1Y3QgYXRtZWxfaGxjZGNfbGF5ZXJf
ZGVzYyAqZGVzYyA9IHBsYW5lLT5sYXllci5kZXNjOw0KPiAgICAgIDU2MCAgICAgICAgIHN0cnVj
dCBhdG1lbF9obGNkY19kYyAqZGMgPSBwbGFuZS0+YmFzZS5kZXYtPmRldl9wcml2YXRlOw0KPiAg
ICAgIDU2MSAgICAgICAgIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gc3RhdGUtPmJhc2Uu
ZmI7DQo+ICAgICAgNTYyICAgICAgICAgdTMyIHNyOw0KPiAgICAgIDU2MyAgICAgICAgIGludCBp
Ow0KPiAgICAgIDU2NA0KPiAgICAgIDU2NSAgICAgICAgIGlmICghZGMtPmRlc2MtPmlzX3hsY2Rj
KQ0KPiAgICAgIDU2NiAgICAgICAgICAgICAgICAgc3IgPSBhdG1lbF9obGNkY19sYXllcl9yZWFk
X3JlZygmcGxhbmUtPmxheWVyLCBBVE1FTF9ITENEQ19MQVlFUl9DSFNSKTsNCj4gDQo+IHNyIGlz
IHVuaW5pdGlhbGl6ZWQgb24gZWxzZSBwYXRoLg0KPiANCj4gICAgICA1NjcNCj4gICAgICA1Njgg
ICAgICAgICBmb3IgKGkgPSAwOyBpIDwgc3RhdGUtPm5wbGFuZXM7IGkrKykgew0KPiAgICAgIDU2
OSAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9nZW1fZG1hX29iamVjdCAqZ2VtID0gZHJtX2Zi
X2RtYV9nZXRfZ2VtX29iaihmYiwgaSk7DQo+ICAgICAgNTcwDQo+ICAgICAgNTcxICAgICAgICAg
ICAgICAgICBzdGF0ZS0+ZHNjcnNbaV0tPmFkZHIgPSBnZW0tPmRtYV9hZGRyICsgc3RhdGUtPm9m
ZnNldHNbaV07DQo+ICAgICAgNTcyDQo+IC0tPiA1NzMgICAgICAgICAgICAgICAgIGRjLT5kZXNj
LT5vcHMtPmxjZGNfdXBkYXRlX2J1ZmZlcnMocGxhbmUsIHN0YXRlLCBzciwgaSk7DQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXl4NCj4gVW5pbml0aWFsaXplZC4NCj4gDQo+ICAgICAgNTc0DQo+ICAgICAg
NTc1ICAgICAgICAgICAgICAgICBpZiAoZGVzYy0+bGF5b3V0LnhzdHJpZGVbaV0pDQo+ICAgICAg
NTc2ICAgICAgICAgICAgICAgICAgICAgICAgIGF0bWVsX2hsY2RjX2xheWVyX3dyaXRlX2NmZygm
cGxhbmUtPmxheWVyLA0KPiAgICAgIDU3NyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZGVzYy0+bGF5b3V0LnhzdHJpZGVbaV0sDQo+ICAgICAgNTc4
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0
ZS0+eHN0cmlkZVtpXSk7DQo+ICAgICAgNTc5DQo+ICAgICAgNTgwICAgICAgICAgICAgICAgICBp
ZiAoZGVzYy0+bGF5b3V0LnBzdHJpZGVbaV0pDQo+ICAgICAgNTgxICAgICAgICAgICAgICAgICAg
ICAgICAgIGF0bWVsX2hsY2RjX2xheWVyX3dyaXRlX2NmZygmcGxhbmUtPmxheWVyLA0KPiAgICAg
IDU4MiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZGVzYy0+bGF5b3V0LnBzdHJpZGVbaV0sDQo+ICAgICAgNTgzICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0ZS0+cHN0cmlkZVtpXSk7DQo+ICAg
ICAgNTg0ICAgICAgICAgfQ0KPiAgICAgIDU4NSB9DQo+IA0KPiByZWdhcmRzLA0KPiBkYW4gY2Fy
cGVudGVyDQoNCi0tIA0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KTWFuaWthbmRhbiBNLg0KDQo=
