Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yISGGOtYpWnj9wUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:31:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B41D5931
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED8D10E478;
	Mon,  2 Mar 2026 09:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SfRyNhO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A636D10E46E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 09:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZPdUl8f3wOImFGxHyt6vUD740C4aYCUtC7HFxyGfBpcJX5X5M8a3Vjs2Gy3EZ38a4OaqRg8x8CB3jFzy1TQWzRmP6E2QRF+cPa/nLsNxNctWBBcsrX9mNck9R+MenVrMkBoMSkXb50iTIpiT2OD+Mh52JF0pig7zWEh5KHeO1PgkIDR0Zkn15A27JVUnP7aSRrlAVcaOVdwTnB5Rj/KciQSZx+1v6aeUysHhIwMRDuO4c23HBtv6fJtR6iOHPIzYInB2UL9GT3hz/f+nKH0nqvEiaRvhv/3N54Yb1lpPZ2obc6Mx1U/a95CkvRF+CaiXn1B88L0k4CEDv1efl+5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Z2MEal57E/MTI/ujDs/dv1j64I+XQXiqIB/ndGpi1w=;
 b=UscAtMNoK5JDlbh4x/++oyKW8pPn9ydcCFjwci5Xr8UQgRa7PdQWlk5GE6YPhqzkfyyzR2nYGo41aODVqY6fqoIg7NcitzQJz5bHIVLzfh6CZ4EMlIIOhSg1/yUGZRiRks9fM52lqiByslGWC6pVB9icj5VegOg6u1/ejlkUnEAXgEYN4osHfYajx/+CHfwAPnyBEaPQxS9+97col5E2zbZCx2nxQQfLilZpy8T0fF7s3/5Ce9MNjmh3UUPETn95dUVntoLs8FYDaltnWrEfif44eaahrSbHqyp0AQbNvpaO0rQtRn0K1qDbR6YczsnPm8uWbuqNj0RfvV4YbyKruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Z2MEal57E/MTI/ujDs/dv1j64I+XQXiqIB/ndGpi1w=;
 b=SfRyNhO8ZtNfsTdG+EpCvZAXiZwXbPtGylFPAQUbgtfUgCPGcUWIkYtYbXZdhXQDyPF890R/1oZVa4ZH+FHtE4TKKELVUzHu5iZ3su+5/Uw2cqSxWW9fqxOomjo9XbiuBXz1KBINpnpoSN3tFgjZWNO0aruIqQZXBnMSDtle7VQ7w46AW1SnIfjB9uqms9Z9PMJG3mAzkj43LJQxRRbzZizOAc3nOykkHSDdr0gNLYyah8EeE3pDXX3kubSu9OpUW0mQrZ6C3Qsu1S73ieF2afZiwreEQwt8gBYaV2VEFNh3h5aujXHfM5LmSzpUVe9D1fUVGduOca68sVu1a49NfQ==
Received: from DB9PR04MB9426.eurprd04.prod.outlook.com (2603:10a6:10:36a::14)
 by GV2PR04MB11685.eurprd04.prod.outlook.com (2603:10a6:150:2a7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 09:31:15 +0000
Received: from DB9PR04MB9426.eurprd04.prod.outlook.com
 ([fe80::9024:608b:852c:f484]) by DB9PR04MB9426.eurprd04.prod.outlook.com
 ([fe80::9024:608b:852c:f484%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 09:31:14 +0000
From: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Oded Gabbay
 <ogabbay@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit
 Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
 <frank.li@nxp.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi
 <xuelin.shi@nxp.com>, Alexandru Iulian Taran <alexandru.taran@nxp.com>
Subject: RE: [PATCH 7/9] accel/neutron: Add job submission IOCTL
Thread-Topic: [PATCH 7/9] accel/neutron: Add job submission IOCTL
Thread-Index: AQHcpyWRaHKAnAfS3US/TiAeRiQXwLWVEtCAgAXsqlA=
Date: Mon, 2 Mar 2026 09:31:14 +0000
Message-ID: <DB9PR04MB9426D1359D0E005C8EE04505947EA@DB9PR04MB9426.eurprd04.prod.outlook.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
 <20260226-neutron-v1-7-46eccb3bb50a@nxp.com>
 <09364420-1044-4c9b-9907-b92b06653eaf@amd.com>
In-Reply-To: <09364420-1044-4c9b-9907-b92b06653eaf@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9426:EE_|GV2PR04MB11685:EE_
x-ms-office365-filtering-correlation-id: f6fda990-281f-4018-267a-08de783e7328
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|19092799006|1800799024|366016|921020|38070700021; 
x-microsoft-antispam-message-info: 9ZaioStopPJMWl35AacocHfo34BN6t5rbI0G+DC255Iaw6WFxbNgSffMCLWzzPCXwJGk2VaBp7uWzRyw7KWsgjU5lCetNErwvhYkf9Ie8ce9bYQt9jjwAme73eaH/c+x2Kr9crZYKrDEKZUvtR6hBYGwKZUW0IEx/vFzgm/TI0Q6w6R1hhY8ZEjFNC+sf8Sqel35rCpaRhTdhtxqQQGRDtmhdfqzyUFE0L68HO0VX31aYmG+lWJlOV/J2csEbbXCKptnHNIIXPY1Ql4gxof/pDDVQ+Ct8Whp8lIkBF8RgGnEJk/BeFQ1V/oDAhygZeb3o8ptb4thlCMH08bD4Jq6O1qhAztQSWUjREE7HG7ufDIgbkMbvLWJbpQxr/R9OkWK2mPTlCG+oPpVXjxnp2a5YQLtS+v9v+2BMsfiuJxShT8WXsO5sMmrL5kWCq5EwavrYczo95N/Y5EATNqzjaDptr2e2EysZ8wDzPVy4wD6q6PjcG9X9m/AdszEqtzYNPWwFiLREcNEQHCggZGx0t8GbCqxQBm98+94LCsJq7kADfWnYfjVyV4xqTD/c/vmwQ7r+LY5gFNmYgbVwfGtHmacAbdqilNOG99cST99Q5tDImt+sSv6l9hagGjjZwUl06rF3dK0Dh4fm/Ui9N8HRCiiVqlFvVCNQ7nehjsnkBvjRacQVJE82Fe8x/OZeEX1jaslenJcbJ2+KP53p6sp0flvigKPh6riwvzpQliMiQT/lcy5k4duBc36Irqu9iit2FL6qy0m3Rnthx9yUkdn9CHbnwkrF5W5FTxbko1hF14HP7UEtzuRn6s5HxF1ELBAwcfp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9426.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?I+vtZikRtEmcvQcMACI8k6K//bb11FMC6LpecBH71Ahcb1fRSD2M2pgzje?=
 =?iso-8859-1?Q?/GqaZkUtBA3S9abKH9R/H+bzLm0U35DbHxmxO1KzQ2BU2FOKvgh/mLh6WP?=
 =?iso-8859-1?Q?QlcIp+PTPNuXFWfoMxAQG/hb8rSB2TLcbwfkeDZ/8YfU1UEaqIkoaMob0I?=
 =?iso-8859-1?Q?BKA9W4qqHOzlQ85KVu8axyuz5OrqAsvS4RvIsCrUVuMz+FDrpJ4+EX98Bo?=
 =?iso-8859-1?Q?Vly8R/5JIrPAvCCR/uC7rlH4KQ1L5bYzE76lzYGFAAEMY2slOpk9PDbzjQ?=
 =?iso-8859-1?Q?GWqKbOm2zChbraXcIZZXhXxzuaKgzM1FA7Xp9t3rL1/j0yHRHc4UWlW0s1?=
 =?iso-8859-1?Q?onIHIwK0QqFkdIhyytZRlV+6WZvFb9TDaWHd4ED/AqoneN2Ywra+jPKbfB?=
 =?iso-8859-1?Q?SWFY0gD5rnC/vk2OHfUmQbJfhA8k41vON46ZRmBD0M1alCCrxkqUpNeaZv?=
 =?iso-8859-1?Q?oi9f6O1ANnxjaJkHab59EMlbk3nUmIJk3v+QGtsZvAxTAsSRu5es+aMBAJ?=
 =?iso-8859-1?Q?PANPgnlpxXcmktLY58EECbDl+SmTVTG9psVcwEbGqAm9Dxcd1tMUTYwCYx?=
 =?iso-8859-1?Q?13yD617X9xBP5CceVK1R5AXt6HE52czoL0QGQgggUH2Yr02eflvq6sm+PB?=
 =?iso-8859-1?Q?BXM3A3MlTT2i18jvF7mPqUtvvY/SEpkabURoeUAs4ymrpWg8+v+OEp44RK?=
 =?iso-8859-1?Q?dxJd3X1V+rXOnIcrnasSrPx7lKJ+TO0pVXCyZ2h44bwyQv7AtGiUg8skJW?=
 =?iso-8859-1?Q?3OkAvmtf63muPpT22+omV25vY+l2Qgh7AMowJg8eCVH/yNHWx2Zp1/r8e3?=
 =?iso-8859-1?Q?zME1clqWco6TJ9u9bfOXxRST9BrUGTF61I92tH5VRdZTNBWxpLT/D/uaVx?=
 =?iso-8859-1?Q?gEwqS/pR8IZHrjSxcHyT3IQElA7K3hO23cWK7VfZY/AkAIVYHiqAg+2UAm?=
 =?iso-8859-1?Q?driVa7C0tlu+ZFnscEOPwnKOna23Q6oA1bKjwKs9UgY5Ux/kYa/iuk9Eh4?=
 =?iso-8859-1?Q?+F0abRZgP5e8k5ho+qFpKlUgiYoLwXKOTKrOZlNPnr2CN/UK3J1cuaYrSy?=
 =?iso-8859-1?Q?bNs48mfyit3NXwnzOfSdGUURyUExZLC2sex+YdpfH1U5Aun61MxjCWgQaE?=
 =?iso-8859-1?Q?y2XLg/dmLLxwbfIUmAQDZWLJwq5UicRWWRjJu7DFHRXw6AFJnpC5ONhFXK?=
 =?iso-8859-1?Q?CWC6iasKdE2exlQ+CZFaQw3S46qMgUYdpZVrYM/D+fRQrLTdswSGWSDlT0?=
 =?iso-8859-1?Q?pBDj6bC6QEdM9lxhx1CRLBnmTzRYNSWeneZzjzUotPB2F6SZoMWWGPSaWM?=
 =?iso-8859-1?Q?IXU2UwRzFraByBSCIL/+e6G27MLv6iC4Kp30SfcEMJT3EBTBdvKLzZpKhE?=
 =?iso-8859-1?Q?Cs4SaFA0fp7LHttU8kwvTdlvqVKJESUz6BYNFCVM8VuWfaBtkoUruykCVB?=
 =?iso-8859-1?Q?AU0mdCrf32wTDgvoZx3+tt591aUc/RBWuEotoIo4vPTaBGjXH/MVDOpZWe?=
 =?iso-8859-1?Q?9LI7nv36/Rdl+WO9CFrsPouXV4G34jBUAHgQ/tQmwPIMFU6B5WH1+kR/vF?=
 =?iso-8859-1?Q?d3p46+z6wovPi9NkcXTfYEfsdDIk87FXqntIzca9Tl0oOUhjITo4TCnrwy?=
 =?iso-8859-1?Q?r5OtC4S23KQDUL+2OBzVsQKWJSS1nyn8+mcPr3czm25CSrPnni4Rvvy1kj?=
 =?iso-8859-1?Q?wpvkyTTOqHZv81PPFybd7wI+ORgnjH6aSrhido5w5PlEruDykmipv+sXsx?=
 =?iso-8859-1?Q?b4s8vr2A7gPgMxaOlozJHYdzPJn1JI48VuXdCoeNms/xoHn5QLCZCcQjm/?=
 =?iso-8859-1?Q?EykAtIgHtw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9426.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fda990-281f-4018-267a-08de783e7328
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 09:31:14.7456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 04ri3rALIGnm4+yd8mwfcZokMYcr5CEnFVPAAQHiAPRzXYNc40ji1dWFqJONqS/rcFKDNOmL6PccOmBkuFqL6A2VKnRlsRZPKusfrdfdlYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11685
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:frank.li@nxp.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jiwei.fu@nxp.com,m:xuelin.shi@nxp.com,m:alexandru.taran@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com];
	FORGED_SENDER(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,aka.ms:url]
X-Rspamd-Queue-Id: B21B41D5931
X-Rspamd-Action: no action

On Thursday, February 26, 2026 at 5:00 PM, Christian K=F6nig wrote:
> On 2/26/26 14:40, Ioana Ciocoi-Radulescu wrote:
> > [Sie erhalten nicht h=E4ufig E-Mails von ruxandra.radulescu@nxp.com.
> > Weitere Informationen, warum dies wichtig ist, finden Sie unter
> > https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Neutron can execute a single job at a time. For now, only inference
> > jobs are supported. Each job has exactly one BO associated with it.
> >
> > When submitting a job, user also provides a syncobj handle on which it
> > will wait for job completion.
> >
> > We use the DRM GPU scheduler for job management. Large part of the job
> > submission code is based on the example of the ethosu driver.
> >
> > Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
> > Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
> > ---
> >  drivers/accel/neutron/Makefile         |   1 +
> >  drivers/accel/neutron/neutron_device.c |   8 +-
> >  drivers/accel/neutron/neutron_device.h |  21 ++
> > drivers/accel/neutron/neutron_driver.c |  28 ++-
> >  drivers/accel/neutron/neutron_driver.h |   3 +
> >  drivers/accel/neutron/neutron_job.c    | 367
> +++++++++++++++++++++++++++++++++
> >  drivers/accel/neutron/neutron_job.h    |  45 ++++
> >  include/uapi/drm/neutron_accel.h       |  51 +++++
> >  8 files changed, 519 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/accel/neutron/Makefile
> > b/drivers/accel/neutron/Makefile index 192ed896a9f9..ac6dd576521c
> > 100644
> > --- a/drivers/accel/neutron/Makefile
> > +++ b/drivers/accel/neutron/Makefile
> > @@ -6,4 +6,5 @@ neutron-y :=3D \
> >         neutron_driver.o \
> >         neutron_device.o \
> >         neutron_gem.o \
> > +       neutron_job.o \
> >         neutron_mailbox.o
> > diff --git a/drivers/accel/neutron/neutron_device.c
> > b/drivers/accel/neutron/neutron_device.c
> > index e5c09105be99..571ec906ad72 100644
> > --- a/drivers/accel/neutron/neutron_device.c
> > +++ b/drivers/accel/neutron/neutron_device.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/iopoll.h>
> >
> >  #include "neutron_device.h"
> > +#include "neutron_job.h"
> >  #include "neutron_mailbox.h"
> >
> >  void neutron_enable_irq(struct neutron_device *ndev) @@ -32,9 +33,14
> > @@ void neutron_handle_irq(struct neutron_device *ndev)
> >         /* Write 1 to clear */
> >         writel_relaxed(appstatus & APPSTATUS_CLEAR_MASK,
> > NEUTRON_REG(ndev, APPSTATUS));
> >
> > -       if (appstatus & APPSTATUS_FAULTCAUSE_MASK)
> > +       if (appstatus & APPSTATUS_FAULTCAUSE_MASK) {
> >                 dev_err(ndev->dev, "Neutron halted due to fault: 0x%lx\=
n",
> >                         FIELD_GET(APPSTATUS_FAULTCAUSE_MASK,
> > appstatus));
> > +               return neutron_job_err_handler(ndev);
> > +       }
> > +
> > +       if (appstatus & APPSTATUS_INFDONE)
> > +               neutron_job_done_handler(ndev);
> >  }
> >
> >  #define neutron_boot_done(appctrl) \
> > diff --git a/drivers/accel/neutron/neutron_device.h
> > b/drivers/accel/neutron/neutron_device.h
> > index 8e4df7462d82..0ed72965774d 100644
> > --- a/drivers/accel/neutron/neutron_device.h
> > +++ b/drivers/accel/neutron/neutron_device.h
> > @@ -9,8 +9,10 @@
> >  #include <linux/spinlock.h>
> >  #include <linux/bits.h>
> >  #include <drm/drm_device.h>
> > +#include <drm/gpu_scheduler.h>
> >
> >  struct clk_bulk_data;
> > +struct neutron_job;
> >
> >  #define NEUTRON_FIRMWARE_NAME          "NeutronFirmware.elf"
> >
> > @@ -92,6 +94,13 @@ enum neutron_mem_id {
> >   * @clks: Neutron clocks
> >   * @num_clks: Number of clocks
> >   * @flags: Software flags used by driver
> > + * @fence_lock: DMA fence lock
> > + * @sched: GPU scheduler
> > + * @sched_lock: Scheduler lock, for neutron_push_job
> > + * @fence_context: Fence context
> > + * @job_seqno: Job sequence number
> > + * @job_lock: Job lock, for active_job handling
> > + * @active_job: Currently active job
> >   */
> >  struct neutron_device {
> >         struct drm_device base;
> > @@ -103,6 +112,18 @@ struct neutron_device {
> >         struct clk_bulk_data *clks;
> >         int num_clks;
> >         u32 flags;
> > +
> > +       /* For dma_fence */
> > +       spinlock_t fence_lock;
>=20
> I've just pushed a patch set to drm-misc-next which makes the fence_lock
> superflous in most cases. Just provide NULL as lock when calling to
> dma_fence_init().

Thanks, I'll update for v2.

>=20
> > +       struct drm_gpu_scheduler sched;
> > +       /* For neutron_push_job */
> > +       struct mutex sched_lock;
> > +       u64 fence_context;
> > +       u64 job_seqno;
> > +
> > +       /* For active_job handling */
> > +       struct mutex job_lock;
> > +       struct neutron_job *active_job;
> >  };
> >
> >  #define to_neutron_device(drm) \
> > diff --git a/drivers/accel/neutron/neutron_driver.c
> > b/drivers/accel/neutron/neutron_driver.c
> > index c9a18bf52037..ceae1f7e8359 100644
> > --- a/drivers/accel/neutron/neutron_driver.c
> > +++ b/drivers/accel/neutron/neutron_driver.c
> > @@ -19,40 +19,53 @@
> >  #include "neutron_device.h"
> >  #include "neutron_driver.h"
> >  #include "neutron_gem.h"
> > +#include "neutron_job.h"
> >
> >  #define NEUTRON_SUSPEND_DELAY_MS 1000
> >
> >  static const struct drm_ioctl_desc neutron_drm_ioctls[] =3D {
> >         DRM_IOCTL_DEF_DRV(NEUTRON_CREATE_BO,
> neutron_ioctl_create_bo, 0),
> >         DRM_IOCTL_DEF_DRV(NEUTRON_SYNC_BO, neutron_ioctl_sync_bo, 0),
> > +       DRM_IOCTL_DEF_DRV(NEUTRON_SUBMIT_JOB,
> > + neutron_ioctl_submit_job, 0),
> >  };
> >
> >  static int neutron_open(struct drm_device *drm, struct drm_file
> > *file)  {
> >         struct neutron_device *ndev =3D to_neutron_device(drm);
> >         struct neutron_file_priv *npriv;
> > +       int ret;
> >
> >         npriv =3D kzalloc_obj(*npriv);
> >         if (!npriv)
> >                 return -ENOMEM;
> >
> >         npriv->ndev =3D ndev;
> > -       file->driver_priv =3D npriv;
> >
> > +       ret =3D neutron_job_open(npriv);
> > +       if (ret)
> > +               goto err_free;
> > +
> > +       file->driver_priv =3D npriv;
> >         return 0;
> > +
> > +err_free:
> > +       kfree(npriv);
> > +       return ret;
> >  }
> >
> >  static void neutron_postclose(struct drm_device *drm, struct drm_file
> > *file)  {
> >         struct neutron_file_priv *npriv =3D file->driver_priv;
> >
> > +       neutron_job_close(npriv);
> >         kfree(npriv);
> >  }
> >
> >  DEFINE_DRM_ACCEL_FOPS(neutron_drm_driver_fops);
> >
> >  static const struct drm_driver neutron_drm_driver =3D {
> > -       .driver_features        =3D DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
> > +       .driver_features        =3D DRIVER_COMPUTE_ACCEL | DRIVER_GEM |
> > +                                 DRIVER_SYNCOBJ,
> >         .name                   =3D "neutron",
> >         .desc                   =3D "NXP Neutron driver",
> >         .major                  =3D 1,
> > @@ -151,19 +164,25 @@ static int neutron_probe(struct platform_device
> *pdev)
> >                 return ret;
> >         }
> >
> > -       ret =3D devm_pm_runtime_enable(dev);
> > +       ret =3D neutron_job_init(ndev);
> >         if (ret)
> >                 goto free_reserved;
> >
> > +       ret =3D devm_pm_runtime_enable(dev);
> > +       if (ret)
> > +               goto free_job;
> > +
> >         pm_runtime_set_autosuspend_delay(dev,
> NEUTRON_SUSPEND_DELAY_MS);
> >         pm_runtime_use_autosuspend(dev);
> >
> >         ret =3D drm_dev_register(&ndev->base, 0);
> >         if (ret)
> > -               goto free_reserved;
> > +               goto free_job;
> >
> >         return 0;
> >
> > +free_job:
> > +       neutron_job_fini(ndev);
> >  free_reserved:
> >         of_reserved_mem_device_release(&pdev->dev);
> >
> > @@ -175,6 +194,7 @@ static void neutron_remove(struct platform_device
> *pdev)
> >         struct neutron_device *ndev =3D platform_get_drvdata(pdev);
> >
> >         drm_dev_unregister(&ndev->base);
> > +       neutron_job_fini(ndev);
> >         of_reserved_mem_device_release(&pdev->dev);
> >  }
> >
> > diff --git a/drivers/accel/neutron/neutron_driver.h
> > b/drivers/accel/neutron/neutron_driver.h
> > index cd52b5eb2d27..b709de74105a 100644
> > --- a/drivers/accel/neutron/neutron_driver.h
> > +++ b/drivers/accel/neutron/neutron_driver.h
> > @@ -4,10 +4,13 @@
> >  #ifndef __NEUTRON_DRIVER_H__
> >  #define __NEUTRON_DRIVER_H__
> >
> > +#include <drm/gpu_scheduler.h>
> > +
> >  struct neutron_device;
> >
> >  struct neutron_file_priv {
> >         struct neutron_device *ndev;
> > +       struct drm_sched_entity sched_entity;
> >  };
> >
> >  #endif /* __NEUTRON_DRIVER_H__ */
> > diff --git a/drivers/accel/neutron/neutron_job.c
> > b/drivers/accel/neutron/neutron_job.c
> > new file mode 100644
> > index 000000000000..316e361166a2
> > --- /dev/null
> > +++ b/drivers/accel/neutron/neutron_job.c
> > @@ -0,0 +1,367 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/* Copyright 2025-2026 NXP */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/pm_runtime.h>
> > +#include <drm/drm_file.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_gem_dma_helper.h>
> > +#include <drm/neutron_accel.h>
> > +
> > +#include "neutron_driver.h"
> > +#include "neutron_device.h"
> > +#include "neutron_gem.h"
> > +#include "neutron_mailbox.h"
> > +#include "neutron_job.h"
> > +
> > +#define NEUTRON_JOB_TIMEOUT_MS 5000
> > +
> > +static const char *neutron_fence_get_driver_name(struct dma_fence
> > +*fence) {
> > +       return "neutron";
> > +}
> > +
> > +static const char *neutron_fence_get_timeline_name(struct dma_fence
> > +*fence) {
> > +       return "neutron-npu";
> > +}
> > +
> > +static const struct dma_fence_ops neutron_fence_ops =3D {
> > +       .get_driver_name =3D neutron_fence_get_driver_name,
> > +       .get_timeline_name =3D neutron_fence_get_timeline_name, };
> > +
> > +static void neutron_hw_submit(struct neutron_job *job) {
> > +       struct neutron_device *ndev =3D job->ndev;
> > +       struct neutron_mbox_cmd cmd =3D {0};
> > +       u32 base_l, base_h;
> > +       u64 base_addr;
> > +       int ret;
> > +
> > +       switch (job->type) {
> > +       case DRM_NEUTRON_JOB_INFERENCE:
> > +               cmd.id =3D NEUTRON_CMD_INFERENCE;
> > +               cmd.args[0] =3D job->inference.tensor_offset;
> > +               cmd.args[1] =3D job->inference.microcode_offset;
> > +               cmd.args[2] =3D job->inference.tensor_count;
> > +               break;
> > +       default:
> > +               dev_WARN(ndev->dev, "Unknown job type: %d\n", job->type=
);
> > +               return;
> > +       }
> > +
> > +       base_addr =3D to_drm_gem_dma_obj(job->bo)->dma_addr;
> > +       base_l =3D lower_32_bits(base_addr);
> > +       base_h =3D upper_32_bits(base_addr);
> > +
> > +       writel_relaxed(base_l, NEUTRON_REG(ndev, BASEDDRL));
> > +       writel_relaxed(base_l, NEUTRON_REG(ndev, BASEINOUTL));
> > +       writel_relaxed(base_l, NEUTRON_REG(ndev, BASESPILLL));
> > +       writel_relaxed(base_h, NEUTRON_REG(ndev, BASEDDRH));
> > +       writel_relaxed(base_h, NEUTRON_REG(ndev, BASEINOUTH));
> > +       writel_relaxed(base_h, NEUTRON_REG(ndev, BASESPILLH));
> > +
> > +       ret =3D neutron_mbox_send_cmd(ndev, &cmd);
> > +       if (ret) {
> > +               /* Nothing we can do here, we'll reset the device on ti=
meout */
> > +               dev_err(ndev->dev, "Failed to submit job, device is bus=
y\n");
> > +       }
> > +}
> > +
> > +void neutron_job_err_handler(struct neutron_device *ndev) {
> > +       guard(mutex)(&ndev->job_lock);
> > +
> > +       if (ndev->active_job)
> > +               drm_sched_fault(&ndev->sched); }
> > +
> > +void neutron_job_done_handler(struct neutron_device *ndev) {
> > +       struct neutron_mbox_state state;
> > +
> > +       neutron_mbox_read_state(ndev, &state);
> > +       if (state.status !=3D NEUTRON_FW_STATUS_DONE) {
> > +               dev_err(ndev->dev, "Inconsistent firmware state: status=
 0x%x, err
> 0x%x\n",
> > +                       state.status, state.err_code);
> > +               return neutron_job_err_handler(ndev);
> > +       }
> > +
> > +       if (state.err_code !=3D 0)
> > +               dev_warn(ndev->dev, "Job finished with error: 0x%x\n",
> > +                        state.err_code);
>=20
> Not mandatory but you might also want to forward that as error to your
> dma_fence, see dma_fence_set_error().

Ok, will do that.

>=20
> > +
> > +       /* Reset Neutron internal state to prepare for next inference *=
/
> > +       neutron_mbox_reset_state(ndev);
> > +
> > +       scoped_guard(mutex, &ndev->job_lock) {
> > +               if (ndev->active_job) {
> > +                       dma_fence_signal(ndev->active_job->neutron_fenc=
e);
> > +                       ndev->active_job =3D NULL;
> > +               }
> > +       }
> > +}
> > +
> > +static void neutron_cleanup_job(struct kref *ref) {
> > +       struct neutron_job *job =3D container_of(ref, struct
> > +neutron_job, refcnt);
> > +
> > +       pm_runtime_put_autosuspend(job->ndev->base.dev);
> > +
> > +       dma_fence_put(job->neutron_fence);
> > +       dma_fence_put(job->sched_fence);
> > +       drm_gem_object_put(job->bo);
> > +       drm_syncobj_put(job->syncobj);
> > +
> > +       kfree(job);
> > +}
> > +
> > +static void neutron_put_job(struct neutron_job *job) {
> > +       kref_put(&job->refcnt, neutron_cleanup_job); }
> > +
> > +static void neutron_free_job(struct drm_sched_job *sched_job) {
> > +       struct neutron_job *job =3D to_neutron_job(sched_job);
> > +
> > +       drm_sched_job_cleanup(sched_job);
> > +       neutron_put_job(job);
> > +}
> > +
> > +static struct dma_fence *neutron_run_job(struct drm_sched_job
> > +*sched_job) {
> > +       struct neutron_job *job =3D to_neutron_job(sched_job);
> > +       struct dma_fence *fence =3D job->neutron_fence;
> > +       struct neutron_device *ndev =3D job->ndev;
> > +
> > +       if (unlikely(job->base.s_fence->finished.error))
> > +               return NULL;
> > +
> > +       dma_fence_init(fence, &neutron_fence_ops, &ndev->fence_lock,
> > +                      ndev->fence_context, ++ndev->job_seqno);
> > +       dma_fence_get(fence);
> > +
> > +       scoped_guard(mutex, &ndev->job_lock) {
> > +               ndev->active_job =3D job;
> > +               neutron_hw_submit(job);
> > +       }
> > +
> > +       return fence;
> > +}
> > +
> > +static enum drm_gpu_sched_stat neutron_timedout_job(struct
> > +drm_sched_job *sched_job) {
> > +       struct neutron_job *job =3D to_neutron_job(sched_job);
> > +       struct neutron_device *ndev =3D job->ndev;
> > +       struct neutron_mbox_state state;
> > +
> > +       /* We assume Neutron is stuck, retrieve current state and reset=
 */
> > +       neutron_mbox_read_state(ndev, &state);
> > +       dev_err(ndev->dev, "Neutron timedout, status: 0x%x, err: 0x%x\n=
",
> > +               state.status, state.err_code);
> > +
> > +       drm_sched_stop(&ndev->sched, sched_job);
> > +
> > +       scoped_guard(mutex, &ndev->job_lock)
> > +               ndev->active_job =3D NULL;
> > +
> > +       pm_runtime_force_suspend(ndev->dev);
> > +       pm_runtime_force_resume(ndev->dev);
> > +
> > +       drm_sched_start(&ndev->sched, 0);
> > +
> > +       return DRM_GPU_SCHED_STAT_RESET; }
> > +
> > +static void neutron_cancel_job(struct drm_sched_job *sched_job) {
> > +       struct neutron_job *job =3D to_neutron_job(sched_job);
> > +       struct neutron_device *ndev =3D job->ndev;
> > +
> > +       guard(mutex)(&ndev->job_lock);
> > +
> > +       if (!dma_fence_is_signaled(job->neutron_fence)) {
> > +               dma_fence_set_error(job->neutron_fence, -ECANCELED);
> > +               dma_fence_signal(job->neutron_fence);
> > +       }
> > +}
> > +
> > +static const struct drm_sched_backend_ops neutron_sched_ops =3D {
> > +       .run_job =3D neutron_run_job,
> > +       .free_job =3D neutron_free_job,
> > +       .timedout_job =3D neutron_timedout_job,
> > +       .cancel_job =3D neutron_cancel_job, };
> > +
> > +int neutron_job_init(struct neutron_device *ndev) {
> > +       const struct drm_sched_init_args args =3D {
> > +               .ops =3D &neutron_sched_ops,
> > +               .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> > +               .credit_limit =3D 1,
> > +               .timeout =3D msecs_to_jiffies(NEUTRON_JOB_TIMEOUT_MS),
> > +               .name =3D dev_name(ndev->dev),
> > +               .dev =3D ndev->dev,
> > +       };
> > +       int ret;
> > +
> > +       ret =3D devm_mutex_init(ndev->dev, &ndev->sched_lock);
> > +       if (ret)
> > +               return ret;
> > +       ret =3D devm_mutex_init(ndev->dev, &ndev->job_lock);
> > +       if (ret)
> > +               return ret;
> > +       spin_lock_init(&ndev->fence_lock);
> > +
> > +       ndev->fence_context =3D dma_fence_context_alloc(1);
> > +
> > +       ret =3D drm_sched_init(&ndev->sched, &args);
> > +       if (ret)
> > +               dev_err(ndev->dev, "Error creating DRM scheduler\n");
> > +
> > +       return ret;
> > +}
> > +
> > +void neutron_job_fini(struct neutron_device *ndev) {
> > +       drm_sched_fini(&ndev->sched);
> > +}
> > +
> > +int neutron_job_open(struct neutron_file_priv *npriv) {
> > +       struct neutron_device *ndev =3D npriv->ndev;
> > +       struct drm_gpu_scheduler *sched =3D &ndev->sched;
> > +       int ret;
> > +
> > +       ret =3D drm_sched_entity_init(&npriv->sched_entity,
> > +                                   DRM_SCHED_PRIORITY_NORMAL,
> > +                                   &sched, 1, NULL);
> > +       if (ret)
> > +               dev_err(ndev->dev, "Error creating scheduler
> > + entity\n");
> > +
> > +       return ret;
> > +}
> > +
> > +void neutron_job_close(struct neutron_file_priv *npriv) {
> > +       drm_sched_entity_destroy(&npriv->sched_entity);
> > +}
> > +
> > +static int neutron_push_job(struct neutron_job *job) {
> > +       struct neutron_device *ndev =3D job->ndev;
> > +       struct ww_acquire_ctx acquire_ctx;
> > +       int ret;
> > +
> > +       ret =3D drm_gem_lock_reservations(&job->bo, 1, &acquire_ctx);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D dma_resv_reserve_fences(job->bo->resv, 1);
> > +       if (ret)
> > +               goto out_unlock_res;
> > +
> > +       ret =3D drm_sched_job_add_implicit_dependencies(&job->base, job=
->bo,
> true);
> > +       if (ret)
> > +               goto out_unlock_res;
> > +
> > +       ret =3D pm_runtime_resume_and_get(ndev->base.dev);
> > +       if (ret)
> > +               goto out_unlock_res;
> > +
> > +       scoped_guard(mutex, &ndev->sched_lock) {
> > +               drm_sched_job_arm(&job->base);
> > +
> > +               job->sched_fence =3D dma_fence_get(&job->base.s_fence->=
finished);
> > +               drm_syncobj_replace_fence(job->syncobj,
> > + job->sched_fence);
> > +
> > +               kref_get(&job->refcnt);
> > +               drm_sched_entity_push_job(&job->base);
> > +
> > +               dma_resv_add_fence(job->bo->resv, job->sched_fence,
> > +                                  DMA_RESV_USAGE_WRITE);
> > +       }
> > +
> > +out_unlock_res:
> > +       drm_gem_unlock_reservations(&job->bo, 1, &acquire_ctx);
> > +
> > +       return ret;
> > +}
> > +
> > +int neutron_ioctl_submit_job(struct drm_device *drm, void *data,
> > +struct drm_file *filp) {
> > +       struct neutron_device *ndev =3D to_neutron_device(drm);
> > +       struct neutron_file_priv *npriv =3D filp->driver_priv;
> > +       struct drm_neutron_submit_job *args =3D data;
> > +       struct neutron_job *job;
> > +       int ret;
> > +
> > +       if (args->pad)
> > +               return -EINVAL;
> > +
> > +       job =3D kzalloc_obj(*job);
> > +       if (!job)
> > +               return -ENOMEM;
> > +
> > +       job->ndev =3D ndev;
> > +       kref_init(&job->refcnt);
> > +
> > +       job->neutron_fence =3D kzalloc_obj(*job->neutron_fence);
> > +       if (!job->neutron_fence) {
> > +               ret =3D -ENOMEM;
> > +               goto out_free_job;
> > +       }
> > +
> > +       switch (args->type) {
> > +       case DRM_NEUTRON_JOB_INFERENCE:
> > +               memcpy(&job->inference, &args->inference,
> > +                      sizeof(args->inference));
> > +               break;
> > +       default:
> > +               dev_dbg(ndev->dev, "Invalid job type %d\n", args->type)=
;
> > +               ret =3D -EINVAL;
> > +               goto out_free_fence;
> > +       }
> > +
> > +       job->bo =3D drm_gem_object_lookup(filp, args->bo_handle);
> > +       if (!job->bo) {
> > +               dev_dbg(ndev->dev, "Invalid BO handle\n");
> > +               ret =3D -ENOENT;
> > +               goto out_free_fence;
> > +       }
> > +
> > +       job->syncobj =3D drm_syncobj_find(filp, args->syncobj_handle);
> > +       if (!job->syncobj) {
> > +               dev_dbg(ndev->dev, "Invalid syncobj handle\n");
> > +               ret =3D -ENOENT;
> > +               goto out_put_gem;
> > +       }
> > +
> > +       ret =3D drm_sched_job_init(&job->base, &npriv->sched_entity, 1,=
 NULL,
> > +                                filp->client_id);
> > +       if (ret)
> > +               goto out_put_syncobj;
> > +
> > +       ret =3D neutron_push_job(job);
> > +       if (ret)
> > +               goto out_sched_cleanup;
> > +
> > +       neutron_put_job(job);
> > +
> > +       return 0;
> > +
> > +out_sched_cleanup:
> > +       drm_sched_job_cleanup(&job->base);
> > +out_put_syncobj:
> > +       drm_syncobj_put(job->syncobj);
> > +out_put_gem:
> > +       drm_gem_object_put(job->bo);
> > +out_free_fence:
> > +       kfree(job->neutron_fence);
> > +out_free_job:
> > +       kfree(job);
> > +
> > +       return ret;
> > +}
> > diff --git a/drivers/accel/neutron/neutron_job.h
> > b/drivers/accel/neutron/neutron_job.h
> > new file mode 100644
> > index 000000000000..bb7773aeb218
> > --- /dev/null
> > +++ b/drivers/accel/neutron/neutron_job.h
> > @@ -0,0 +1,45 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/* Copyright 2025-2026 NXP */
> > +
> > +#ifndef __NEUTRON_JOB_H__
> > +#define __NEUTRON_JOB_H__
> > +
> > +#include <linux/kref.h>
> > +#include <drm/drm_gem.h>
> > +#include <drm/drm_syncobj.h>
> > +#include <drm/gpu_scheduler.h>
> > +#include <drm/neutron_accel.h>
> > +
> > +#include "neutron_driver.h"
> > +
> > +struct neutron_device;
> > +struct neutron_file_priv;
> > +
> > +struct neutron_job {
> > +       struct drm_sched_job base;
> > +       struct neutron_device *ndev;
> > +       struct dma_fence *neutron_fence;
>=20
> > +       struct dma_fence *sched_fence;
>=20
> That looks superflous to me. You should always have the scheduler fence
> through the base.

Ok.

>=20
> > +       struct drm_syncobj *syncobj;
>=20
> Why do you want to keep the syncobj around?

No good enough reason, I'll remove it from job structure.

>=20
>=20
> Apart from those notes looks pretty good to me, but I'm a bit disapointed=
 that
> there isn't any DMA-buf support to review :)

Thanks for reviewing!
Ioana

>=20
> Regards,
> Christian.
>=20
> > +       struct drm_gem_object *bo;
> > +       enum drm_neutron_job_type type;
> > +       union {
> > +               struct drm_neutron_inference_job inference;
> > +       };
> > +       struct kref refcnt;
> > +};
> > +
> > +#define to_neutron_job(job) \
> > +       container_of(job, struct neutron_job, base)
> > +
> > +int neutron_job_init(struct neutron_device *dev); void
> > +neutron_job_fini(struct neutron_device *dev); int
> > +neutron_job_open(struct neutron_file_priv *npriv); void
> > +neutron_job_close(struct neutron_file_priv *npriv);
> > +
> > +void neutron_job_done_handler(struct neutron_device *dev); void
> > +neutron_job_err_handler(struct neutron_device *dev);
> > +
> > +int neutron_ioctl_submit_job(struct drm_device *dev, void *data,
> > +struct drm_file *filp);
> > +
> > +#endif /* __NEUTRON_JOB_H__ */
> > diff --git a/include/uapi/drm/neutron_accel.h
> > b/include/uapi/drm/neutron_accel.h
> > index 2f5639f2e0e8..a9e5682709d2 100644
> > --- a/include/uapi/drm/neutron_accel.h
> > +++ b/include/uapi/drm/neutron_accel.h
> > @@ -15,10 +15,12 @@ extern "C" {
> >   *
> >   * @DRM_NEUTRON_CREATE_BO: Create a buffer object
> >   * @DRM_NEUTRON_SYNC_BO: Sync (parts of) the buffer object memory
> > + * @DRM_NEUTRON_SUBMIT_JOB: Submit a job to the device
> >   */
> >  enum drm_neutron_ioctl {
> >         DRM_NEUTRON_CREATE_BO =3D 0,
> >         DRM_NEUTRON_SYNC_BO,
> > +       DRM_NEUTRON_SUBMIT_JOB,
> >  };
> >
> >  /**
> > @@ -64,6 +66,51 @@ struct drm_neutron_sync_bo {
> >         __u64 offset;
> >  };
> >
> > +/**
> > + * enum drm_neutron_job_type - Type of job to submit to Neutron
> > +device
> > + *
> > + * @DRM_NEUTRON_JOB_INFERENCE: Inference job  */ enum
> > +drm_neutron_job_type {
> > +       DRM_NEUTRON_JOB_INFERENCE =3D 0, };
> > +
> > +/**
> > + * struct drm_neutron_inference_job - Inference job descriptor
> > + *
> > + * @tensor_offset: Offset of tensor array inside job BO
> > + * @microcode_offset: Microcode offset inside BO
> > + * @tensor_count: Number of valid tensors
> > + * @pad: MBZ
> > + */
> > +struct drm_neutron_inference_job {
> > +       __u32 tensor_offset;
> > +       __u32 microcode_offset;
> > +       __u32 tensor_count;
> > +       __u32 pad[5];
> > +};
> > +
> > +/**
> > + * struct drm_neutron_submit_job - Submit a job to Neutron device
> > + *
> > + * @type: Job type, one of enum drm_neutron_job_type
> > + * @bo_handle: BO handle for this job
> > + * @inference: Inference job descriptor (when type is
> > +DRM_NEUTRON_JOB_INFERENCE)
> > + * @reserved: Reserved for future job types
> > + * @syncobj_handle: Handle of syncobj on which user waits for job
> > +completion
> > + * @pad: MBZ
> > + */
> > +struct drm_neutron_submit_job {
> > +       __u32 type;
> > +       __u32 bo_handle;
> > +       union {
> > +               struct drm_neutron_inference_job inference;
> > +               __u32 reserved[8];
> > +       };
> > +       __u32 syncobj_handle;
> > +       __u32 pad;
> > +};
> > +
> >  #define DRM_IOCTL_NEUTRON_CREATE_BO \
> >         DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_CREATE_BO, \
> >                  struct drm_neutron_create_bo) @@ -72,6 +119,10 @@
> > struct drm_neutron_sync_bo {
> >         DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_SYNC_BO, \
> >                  struct drm_neutron_sync_bo)
> >
> > +#define DRM_IOCTL_NEUTRON_SUBMIT_JOB \
> > +       DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_SUBMIT_JOB,
> \
> > +                struct drm_neutron_submit_job)
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> >
> > --
> > 2.34.1
> >

