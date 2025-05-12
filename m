Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61807AB35F7
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 13:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C859210E36C;
	Mon, 12 May 2025 11:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="gZYmvowq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011043.outbound.protection.outlook.com [52.101.65.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A211F10E183
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:40:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wg7IFlF3G2CqYO+x5ZI8w8o7dKEqP7Lo3lih5jwrwQQqwSCLkobGRFVH+WtxJoUvPP0kcfj9njjJ0GRaqxbshSjZgbUziMIPkqogKThq/eLTBMAoOoajOCu4Kvh0hf0lIkl2ZOrKwgfvGqY/qPxuFDT5EHW82RBU6q8IzE5MpeLOxsWgC0VHuFZR+7rD9MoQt9Pe6BjwaYhYpN+fT2kWsBYXS0idXFmXlkw6DBHta288LtFj6Dq537cfjH8flS33DYG0fioIMrJX5o0h1Hs6tMRXhIRM6DPHnZn/ehbKwWy6D5Z0bM7MY+BZec0T4L7MpgX6/7bOmVHckEurlnM1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzuI+40ocM5x+sXIToY2xTjjvq/gT2JawX8pfzOHaOo=;
 b=nmy9n1icF5Dflz88euVUQALkHhdxPym/MNzpX6DIfSqmuaiepx7jRDiWc0X87/sLVTi+DDGR+RDiwv8wnK4QqipqCrENDV8nQPpbMNEtKNj7zUQybbKDToHuo4KM22bYyx4/eMHS4ggEZKOeqrZch/H6DN5+O6W9pGNxWdyJ8pL+nz2f7BY8Q5oZIkNXbbenjHMwM5sH/QNDS7FDGWniSxXP+PG8I7xRYV23KFxKxYTbQ72NjP1Ytznd9cGO/An4rV77heAryvF+ugEKgStcqMhWZtycAL8jzoU1CHNABzuvAUN6dtrkVd/wQDYMPi+9/uEtAf+0Nfa70Ovi8ZW8vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzuI+40ocM5x+sXIToY2xTjjvq/gT2JawX8pfzOHaOo=;
 b=gZYmvowqs+jEolIeJyD8oDQqQ64kEY1aKtB+5yxFTyqYWgD/MJeLeKPRwkMsfp0JN9/Zd5kbDIaT9bhiHG/MOetv4LIezFJBT+AO5aIn31Lp1cvCAqOvifOzGk7IttrV9/+0CV02hav1JCkZ2FMHq1VcrE0crfS2SCV6gHUVoeM42jKfPWLT1xrVPfKGJrJBRxqrW0K7ar/gCChCubv36EgZHMeGy3+92MpJBnLOKiNgZKX9VDkY3q90J/oYZyYYAfCwFmcffF536VLyXkyHh1mlJuux8NFyyp1zNh9+elDySo9FuLJw/ednb30LNCx8nh+FrM7WEfO4W2KAZXinPw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GVXPR10MB8315.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 11:39:56 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 11:39:56 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v4 6/8] backlight: led-backlight: add devlink to supplier
 LEDs
Thread-Topic: [PATCH v4 6/8] backlight: led-backlight: add devlink to supplier
 LEDs
Thread-Index: AQHbwy6KQi63IdReNUm0mQlOTxVNOrPO3syA
Date: Mon, 12 May 2025 11:39:56 +0000
Message-ID: <fa87471d31a62017067d4c3ba559cf79d6c3afec.camel@siemens.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
 <20240917-hotplug-drm-bridge-v4-6-bc4dfee61be6@bootlin.com>
In-Reply-To: <20240917-hotplug-drm-bridge-v4-6-bc4dfee61be6@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GVXPR10MB8315:EE_
x-ms-office365-filtering-correlation-id: b854b065-9835-4b23-ed1a-08dd9149b84a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YVIvcGhYbjB5SHRXNGNEZkZkNXNqS3NrT21qemsyeFdaTFhEREZEVm91Q3J1?=
 =?utf-8?B?V1J5T0oxY0tMdHhXdFRSZitiQ0dLb0ovSWYydXV6bHpUK0lta1JCVUtwNGU3?=
 =?utf-8?B?czZINlh5MTFxSksyVW5COURWaGhzNEZNRVU4ME41ZWJ0aGlxdmxKUkdIN21p?=
 =?utf-8?B?ZU93TlJqbjdXN1B0T0hxTEZRN21KdTJ4ak1aR1FiS3VlUWxQaWdQMzdGTTJj?=
 =?utf-8?B?WkVJdGVHK3hpdHVMdk0wcnBKSDh1S3g5MVVHV3N6S2pQV3ZFTXVvSlQzS1JN?=
 =?utf-8?B?V3pQTUZZQzlzTnNQVjFOK3VhRGJwUWU5cVRWU0t1Y2Z1eFQ1T1JCUjR1Z0o1?=
 =?utf-8?B?YVhMYlFEcms0cTFPbzFNT0R3SG9wcFN2U2JHamRac0ZucDNjbFAydXlsWVd3?=
 =?utf-8?B?bHE2NjIyc3YrM1liWXRsY1hzOTVqWC9oUTVQRHVvVzQya0ttazdWSFlYbHNX?=
 =?utf-8?B?MEVjSG14VTlRRFNmbnNnUVRvb0JqQmEyK05hKzViTFQrSy9RUy9VcVF3TCs3?=
 =?utf-8?B?UTRPN21YcEtleHdXVEJjMG1iU2RrYnZEejRFNDNBVEhlT0V2OTJ4V29BanJ2?=
 =?utf-8?B?S3krUUcrTFdUREdWNEt1Z0c4N0UrZytIVkNJRzJGYVdhZDNyUkUvbXc2QmZO?=
 =?utf-8?B?REE0MXZzSFRBOE1SeEFKV29ibW9uNmZEeW9yaFNqSWMyenYvWXUxcXlOWldS?=
 =?utf-8?B?d2F2Y00zdUlCVWF6TEkrSklLclU3bmo2N0tsczRRd1Z4bnV2Q0ZsM0lFekpY?=
 =?utf-8?B?dDQwaWJOYVo1b2ZFM1VKc012RXJNM2FpcWpFcVl1dG9IUUdVRVVMTkdWamhX?=
 =?utf-8?B?RnpaVUdmTGhkN2pQWlU2Uk55UnJSajhmaXdjcmFlT2UzTUhleXZXMjIvR1g5?=
 =?utf-8?B?bEdhdzB0bEF5UXR4KzNncyswS3VvUTV0SWFZaFpqTElJN2plZnNFQmpCZSsr?=
 =?utf-8?B?MVNpc0U5Vk9HNUVnK05ZWWZEeE1EcE0yaEY4YStCN2lHMmdQQk8wd0dxMldj?=
 =?utf-8?B?ck11dk9ibkNqSGVQQzBvTHB0UnNkUUd0cGYzNUZzTHBrelIwWjhIT0s4L1BY?=
 =?utf-8?B?ZEhJd2VJck9DcHN0dk1WVEFjVHF4eE5LOS9HYmU4U2RCOWswbmNHazcxd2dN?=
 =?utf-8?B?Y1FoQjZ2QWowbXZHVGV6TEh6R3d6ZFoydlpPc0JlMDgyd1o4OFpQNVVpeWU5?=
 =?utf-8?B?QjlqYkpkd2p0R3ppUXFWY0JzeVo4amJmRXU5MlhVbWkwcDg3a0dteVQ5NHBY?=
 =?utf-8?B?NkcvRk5pQXRYdER1dndyY1haQldKWS9tSWRNY3JHZEFUcy81dkZ0MHRBaEJZ?=
 =?utf-8?B?Q3BGMERBaVJxTjBzMmRvRjdVWjRaUmJQMDdzd2hxaG54WGM2RjVuc1lHZXd2?=
 =?utf-8?B?VS9rNzlHV0huMlIxR1pvSTR6Nk81aTR2L0wyemNMaUdjRGJqVEZvVWRvQ0tn?=
 =?utf-8?B?b3ppT1RSUzcwZGRxMlZxQXovOW5URVB3ZWcrUDhsT0JvRFo4VnZqUzNZMHM3?=
 =?utf-8?B?TGRkUmllV3g3WHVDdWNpSWF1SHNUWkFSK2JPM3BlS2RKOVdCeCtLUFdQMVR6?=
 =?utf-8?B?M2lpTXR1dmZTYWpRRkJ4M09hbnp2TVFVeTMrRGZvMFdPbVlYZS9SWGVtYnIr?=
 =?utf-8?B?OGdyNWxPTmNjblkxY3ByL3ZqWkJxSlFMaUtQYndBbnYvcVhHZVA0cTl2T1hS?=
 =?utf-8?B?dmhZbzJvVHpobFVwRUZQZmhoRmw0R1Q3MTBoNnJrcXIwRGZDNzdFOU8yb0VU?=
 =?utf-8?B?WmhTYTMrRlpZNTVqeHp1MmxtdThBWjRDaTF6S3ZiS0h6SDRkdWttTDVQb1pN?=
 =?utf-8?B?aCtCRmZpOXFWZndTeTBGNUQxVklNRitPdXhBUVlieTJKZzNFSVM3R3FFaWx3?=
 =?utf-8?B?TDRjZ2U4Y1VPanIwaXlPUFZUekwzYjBiRHlzVXE5V2ZXOG5QNVBRQmtWUjdl?=
 =?utf-8?Q?WuHPDhgPMYk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzNwS3BIQVMxRzd5YXNnL2VFOWxtZ3NZQkI2dmd3d0Z2M092Sm9QUkdjeitJ?=
 =?utf-8?B?TlFZczR4U21EekxRV29tWUhIeXYvN2tEb1hvQzFHWHRMSmFGTXZPaEpvaFFi?=
 =?utf-8?B?YlBxNk9YUTM5UzRZVHBFVmpONWRCM3FhcTVaV2RSSCszelpFODlaQ2NZaHpE?=
 =?utf-8?B?WEFBTVdYWGdGdlVwUkhGRXhzVldTRGE0dXhCQmpuang4SngxbVlMTFNuUzk3?=
 =?utf-8?B?cTBqQjlMRmdxTEVKR2J3L0ZCbnhmSVZsY1lKK2M1Qk5ZLzFwM3RSYkVjdENx?=
 =?utf-8?B?YkRkeVA3V3E3Z0dvOXA2VVEycTBzRVlRazJJdk1tMUVJaFo0ZUhEcUNzZUJP?=
 =?utf-8?B?QXZYcTZYdjYrVDhFVlRUZGNrdjk4VzZ4aEFRZlVlYUs0V0pGY3lBSWk1ejF5?=
 =?utf-8?B?eGdMNTRJZHNjaVpVQUpwT1FyY1R4ZmVsekRkK1d0dDg3WFZlemhMNWtmdmNP?=
 =?utf-8?B?NU9QMldtUTJkWHZlaVJpU3NCZ2pvRXZEakFoN29aNUY1cFMzVlVjOG9EU3lk?=
 =?utf-8?B?ZGhjVndpcGNhUEorSXllcWIrV2dqMytaTkozRi8xaThndWF0NWVVVWNROUJM?=
 =?utf-8?B?eXU1c2RNc2Fpbko5TVg4QVVobEdUSGl0Uk1wc2FpT256dmkwUE03elgxV2c1?=
 =?utf-8?B?NHdOZHptbzkyZ3k1WVR0cHNDNXJpMmFQemhPVFE4VFlsdlg3TW9yV2dPRUNw?=
 =?utf-8?B?NVVFcEJIMGRndlFONFJTUDkwY0kybExQK0VzVXQ1NGxjSWxnSExUNStnL3Ri?=
 =?utf-8?B?U2M5WjZTeFVYUWp6cElCa1ZtWFRTWmxBZW1oNnpwNDlDNFlLL05TeEZhVkpl?=
 =?utf-8?B?czl3NVRWb003SFUybkhrMzRTUmRIWU1XZ0tzN21LaExDUHBBaHBudUhNSXZC?=
 =?utf-8?B?Wkw2aTErOEJCVTIzUkZCUGpDUnNLczhYT1p1VFhkSVpvT09wMlRRTENJVjlT?=
 =?utf-8?B?clVmMWtISDRkNzIvV1BoamNFQWNOTXhvZS80K2lZVk5xRUkwZGtHdGxtaHF0?=
 =?utf-8?B?NXlFTVBmSElGdVU0ZXMwZjJBOXRCcFlnMS9SYUljZmx6dk1ORmgzU3ZCbUdx?=
 =?utf-8?B?T0NkbTk1Ui8vYjJZY3FyTTVmQmcvUHduWGM4T0NLQjZwaFR5UG0wa1lMR0Jv?=
 =?utf-8?B?VVArSFBCWEdDMkRtUCtadG5RMTJmbVhkZDZKMVhKL0p4U1YwbEplQ3Q3QjdF?=
 =?utf-8?B?OGJxdWZabnAyc1dyV2VweHc5enBHM1MzaGlEYmRGdGprdHpBRDk0amI2U2ZD?=
 =?utf-8?B?akhmcDJ6ZnJRQnZOb2l4UVhDR1N4eThTaUZwZm1CQ3ZSU3U2VlIrcHEycU1T?=
 =?utf-8?B?ZXNseEYzOEJUazY5bHNnYkplS212WjU4aUNLM0tSekdDWUE4elNxNU9EaE1T?=
 =?utf-8?B?Q1U1T3AvcUkzM0xwc3g2QmNSN2ZpK1E2RnNOZGY2NlZkK0xZVDhlSDkwa21S?=
 =?utf-8?B?RFkrWjhQM3NhaURDQzZTWlY5ZFl6Y2d3aXUvTy8wWkFUQlk4MU1QdGVZTk9h?=
 =?utf-8?B?c3ROc0VlUjkyMElDSWlOOEFQZzZnNHFCMG1haWNncU9GT3Nrb3h0eEtRRmFl?=
 =?utf-8?B?MTc3amQyNzY1Ymd1U1Y4dE1rSENXRGRYK1JleGs2a0ZtR0R4cTIrekxaYTZx?=
 =?utf-8?B?VW12WXhMLzdtSXFNcS9FVTBlOUtFYlB4M1BSQTFhWjd1aTV4TWNiTkc5NmZC?=
 =?utf-8?B?bmRMQzltb0tsclJNcGkwZmxzQ0lJOEp0SnFGRXI5MGRmdTNsZTRoclowMk16?=
 =?utf-8?B?R1A3K3VjOFJaejNmV20rdkRrK2ZoUnZQdjZRT3U5WEppaCtOMFJmeEVlK2VR?=
 =?utf-8?B?N1d1VGF5TGtBMERjdFFZQ3duU0dWU0NpUUt6VjdWRlZKZ3RHeXJFRDlVVTFG?=
 =?utf-8?B?RGV4dlVkekpqSFVEajVIZUx3Y1Q2bzhtSVlvTGZSOU9PNDkwSHMvY0M4eHA1?=
 =?utf-8?B?dzB0SGUyRElhNkxncUdGcy93Q3M2VEY0T2tKd2ViYzlNMnI5Qk9XcktGT1Mx?=
 =?utf-8?B?eFA0bTZhMVg1MmtpOUl5T09MdXBWSGxOdU11dWdZMWZ0aitjb25obUFid1Jn?=
 =?utf-8?B?TG5QZ0xTcmdZRkhtRDFvaFFqZ3dPWU0xc0dUdnZrS2JHc0xzM2NHL0xFeE4x?=
 =?utf-8?B?aDNZSTVTbTZ4bFRXTXREL3dIY1VoVWZzTC92eXRxMUpmMm9heERxTXRqdGZx?=
 =?utf-8?Q?LF7JZ0aJkkMsfy/UC55cfuU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91D091C21C8BD1449D998420D0F45C3C@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b854b065-9835-4b23-ed1a-08dd9149b84a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 11:39:56.6695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pEhpU2c+qvYNDWFfUmlBQGkOKaCYljeNex6g1jnyYvcEi1qDS1H94C4skmTbOfbMasZX4Gtzl44tiLZ1Mq4AeMgOr/zxHOBzjEAox3HDGEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8315
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

SGkgTHVjYSwNCg0KT24gVHVlLCAyMDI0LTA5LTE3IGF0IDEwOjUzICswMjAwLCBMdWNhIENlcmVz
b2xpIHdyb3RlOg0KPiBsZWQtYmFja2xpZ2h0IGlzIGEgY29uc3VtZXIgb2Ygb25lIG9yIG11bHRp
cGxlIExFRCBjbGFzcyBkZXZpY2VzLCBidXQgbm8NCj4gZGV2bGluayBpcyBjcmVhdGVkIGZvciBz
dWNoIHN1cHBsaWVyLXByb2R1Y2VyIHJlbGF0aW9uc2hpcC4gT25lIGNvbnNlcXVlbmNlDQo+IGlz
IHRoYXQgcmVtb3ZhbCBvcmRlcmVkIGlzIG5vdCBjb3JyZWN0bHkgZW5mb3JjZWQuDQo+IA0KPiBJ
c3N1ZXMgaGFwcGVuIGZvciBleGFtcGxlIHdpdGggdGhlIGZvbGxvd2luZyBzZWN0aW9ucyBpbiBh
IGRldmljZSB0cmVlDQo+IG92ZXJsYXk6DQo+IA0KPiAgICAgLy8gQW4gTEVEIGRyaXZlciBjaGlw
DQo+ICAgICBwY2E5NjMyQDYyIHsNCj4gICAgICAgICBjb21wYXRpYmxlID0gIm54cCxwY2E5NjMy
IjsNCj4gICAgICAgICByZWcgPSA8MHg2Mj47DQo+IA0KPiAJLy8gLi4uDQo+IA0KPiAgICAgICAg
IGFkZG9uX2xlZF9wd206IGxlZC1wd21AMyB7DQo+ICAgICAgICAgICAgIHJlZyA9IDwzPjsNCj4g
ICAgICAgICAgICAgbGFiZWwgPSAiYWRkb246bGVkOnB3bSI7DQo+ICAgICAgICAgfTsNCj4gICAg
IH07DQo+IA0KPiAgICAgYmFja2xpZ2h0LWFkZG9uIHsNCj4gICAgICAgICBjb21wYXRpYmxlID0g
ImxlZC1iYWNrbGlnaHQiOw0KPiAgICAgICAgIGxlZHMgPSA8JmFkZG9uX2xlZF9wd20+Ow0KPiAg
ICAgICAgIGJyaWdodG5lc3MtbGV2ZWxzID0gPDI1NT47DQo+ICAgICAgICAgZGVmYXVsdC1icmln
aHRuZXNzLWxldmVsID0gPDI1NT47DQo+ICAgICB9Ow0KPiANCj4gT24gcmVtb3ZhbCBvZiB0aGUg
YWJvdmUgb3ZlcmxheSwgdGhlIExFRCBkcml2ZXIgY2FuIGJlIHJlbW92ZWQgYmVmb3JlIHRoZQ0K
PiBiYWNrbGlnaHQgZGV2aWNlLCByZXN1bHRpbmcgaW46DQo+IA0KPiAgICAgVW5hYmxlIHRvIGhh
bmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAw
MDAwMDAwMDAwMDAwMDEwDQo+ICAgICAuLi4NCj4gICAgIENhbGwgdHJhY2U6DQo+ICAgICAgbGVk
X3B1dCsweGUwLzB4MTQwDQo+ICAgICAgZGV2bV9sZWRfcmVsZWFzZSsweDZjLzB4OTgNCj4gDQo+
IEZpeCBieSBhZGRpbmcgYSBkZXZsaW5rIGJldHdlZW4gdGhlIGNvbnN1bWluZyBsZWQtYmFja2xp
Z2h0IGRldmljZSBhbmQgdGhlDQo+IHN1cHBseWluZyBMRUQgZGV2aWNlLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4NCg0KSSd2
ZSB0ZXN0ZWQgdGhlIHBhdGNoIHdpdCBMUDg4NjQgTEVEIGFzIGEgcHJvdmlkZXIgZm9yIGxlZF9i
bCwgcmVtb3ZpbmcgdGhlDQp1bmRlcmx5aW5nIEkyQyBidXMuIFRoZSBwYXRjaCBhdm9pZHMgdGhl
IGNyYXNoIGZvciBtZSAoYnkgcmVtb3ZpbmcgbGVkX2JsIGRldmljZSBhcyB3ZWxsKSwNCnRoYW5r
cyBmb3IgZml4aW5nIGl0IQ0KDQpUZXN0ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFu
ZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29tPg0KDQo+IC0tLQ0KPiANCj4gVGhpcyBwYXRjaCBmaXJz
dCBhcHBlYXJlZCBpbiB2NC4NCj4gLS0tDQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRf
YmwuYyB8IDEzICsrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2JsLmMg
Yi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRfYmwuYw0KPiBpbmRleCBjN2FlZmNkNmU0ZTMu
LmJmYmQ4MDcyODAzNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVk
X2JsLmMNCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2JsLmMNCj4gQEAgLTIw
OSw2ICsyMDksMTkgQEAgc3RhdGljIGludCBsZWRfYmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gIAkJcmV0dXJuIFBUUl9FUlIocHJpdi0+YmxfZGV2KTsNCj4gIAl9DQo+
ICANCj4gKwlmb3IgKGkgPSAwOyBpIDwgcHJpdi0+bmJfbGVkczsgaSsrKSB7DQo+ICsJCXN0cnVj
dCBkZXZpY2VfbGluayAqbGluazsNCj4gKw0KPiArCQlsaW5rID0gZGV2aWNlX2xpbmtfYWRkKCZw
ZGV2LT5kZXYsIHByaXYtPmxlZHNbMF0tPmRldi0+cGFyZW50LA0KPiArCQkJCSAgICAgICBETF9G
TEFHX0FVVE9SRU1PVkVfQ09OU1VNRVIpOw0KPiArCQlpZiAoIWxpbmspIHsNCj4gKwkJCWRldl9l
cnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byBhZGQgZGV2bGluayAoY29uc3VtZXIgJXMsIHN1cHBs
aWVyICVzKVxuIiwNCj4gKwkJCQlkZXZfbmFtZSgmcGRldi0+ZGV2KSwgZGV2X25hbWUocHJpdi0+
bGVkc1swXS0+ZGV2LT5wYXJlbnQpKTsNCj4gKwkJCWJhY2tsaWdodF9kZXZpY2VfdW5yZWdpc3Rl
cihwcml2LT5ibF9kZXYpOw0KPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJCX0NCj4gKwl9DQo+
ICsNCj4gIAlmb3IgKGkgPSAwOyBpIDwgcHJpdi0+bmJfbGVkczsgaSsrKSB7DQo+ICAJCW11dGV4
X2xvY2soJnByaXYtPmxlZHNbaV0tPmxlZF9hY2Nlc3MpOw0KPiAgCQlsZWRfc3lzZnNfZGlzYWJs
ZShwcml2LT5sZWRzW2ldKTsNCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcN
Cnd3dy5zaWVtZW5zLmNvbQ0K
