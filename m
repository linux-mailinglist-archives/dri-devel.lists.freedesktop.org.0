Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMEXOOOhpWmuCAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:42:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400D71DB108
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4A810E08F;
	Mon,  2 Mar 2026 14:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ACqoEC3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013004.outbound.protection.outlook.com
 [52.101.83.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB1B10E08F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:42:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQOJv/j2SoqQNa27SIE/RgT1krJEFODdGAga0lxlw1VcjutAUZg2EclqhrF/uN4SEP20kJmixHFZK2gA++umClMhQYXw/d/9iYK9MbEGleXVAq/pIbjC0IqjVIAioJYZ5SsbLWBLEDrtRgrn4Aia1qCrKANiFqDYpI0It2xoePhYL0TsuKFgix82vIZWqnuBQ9RKgvG2iHCenIEkOi8B1sRc5dZ/f+n+UBzud43M9jSy56Oyy9y9C8rIwkzG3kYc8mbiuRKDjH6EhKeR32vv8aNPixmAqBs1Yw5MSCulXR3DrAYyCB0FrMo+1uI9OgdDhoe4iMb9RAYmWXPFbjRviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVTBK5zq2JeOyMsEgIcxv9T4/QzrJRdysFrpGaKSoOU=;
 b=NuamxiZ1uH22rN8/ccmUCpyRlsPBfuatd4q9BELc8mLpRnl/PbJSX2+Jcpzq0iugHdSed4r12Q+Ge9yv8HB1BfZ3PfGKMOCjIYIaUehxQ5Eg4oVh0+nHc9ZLhSqUfmWqi1rqddB5KOVRafnT7iRZAP3mX2Nd9xXBdOJgc0xacuAR/DEI3Wv2sJc7Q9jYGJbsMHSCzd5jnUQOxesmHZZMy6ZJ4C1dJ1Af/PwaRIYeKJE5pU0Idks2dFza4blbebxTSYNlU2zH7UpO9IhDTKze8vq7hgQLininEnjgGH2X99+u1veS4wtPG7yqlc1r2uLgkUq0DUpsDCf2YCWvhGS50g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVTBK5zq2JeOyMsEgIcxv9T4/QzrJRdysFrpGaKSoOU=;
 b=ACqoEC3wIiSEUuqPq915xulh6f7eQKhkPkBt1Lx6WOuABgB1XdgVqBJlIADtJsMxi4RrGSb7hUD+RkAczmr+lwadxD44iEIqpwoEu/0fsMoIGxcDjlu1qiT4W7lY+SkLY2eRQEZ9RnbP9EkT/Y/6FmfAisWiYB0zOkyUqKpqtiY8zGSvytQtUSHsWYcSn1eLl7a9TfA7a9wPGsy17zvgNmbzYGRx9k16wvg3Yz4kA6X0POU0RrL/FC8TTxF5UNsLASCR174/5Wipi9ejzHZLN67sFbmptS5XSKO1dJz75ddEHqrPhpxkz1b0uUElmsXuGj1e/g2RgKfh8mY5bTt0Sg==
Received: from DB9PR04MB9426.eurprd04.prod.outlook.com (2603:10a6:10:36a::14)
 by AM9PR04MB8908.eurprd04.prod.outlook.com (2603:10a6:20b:40b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 14:42:33 +0000
Received: from DB9PR04MB9426.eurprd04.prod.outlook.com
 ([fe80::9024:608b:852c:f484]) by DB9PR04MB9426.eurprd04.prod.outlook.com
 ([fe80::9024:608b:852c:f484%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 14:42:33 +0000
From: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
To: Conor Dooley <conor@kernel.org>
CC: Oded Gabbay <ogabbay@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi
 <xuelin.shi@nxp.com>, Alexandru Iulian Taran <alexandru.taran@nxp.com>
Subject: RE: [PATCH 3/9] dt-bindings: npu: Add bindings for NXP Neutron
Thread-Topic: [PATCH 3/9] dt-bindings: npu: Add bindings for NXP Neutron
Thread-Index: AQHcpyWNgEFrUuUjek+Hd2v4H4n447WVSvIAgAYLbyA=
Date: Mon, 2 Mar 2026 14:42:33 +0000
Message-ID: <DB9PR04MB9426A255C4947DB273A17AB6947EA@DB9PR04MB9426.eurprd04.prod.outlook.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
 <20260226-neutron-v1-3-46eccb3bb50a@nxp.com>
 <20260226-unthread-reformat-92b855c4acf9@spud>
In-Reply-To: <20260226-unthread-reformat-92b855c4acf9@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9426:EE_|AM9PR04MB8908:EE_
x-ms-office365-filtering-correlation-id: 6b6b39fd-a85f-49fd-89f2-08de7869f098
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: 3zAgnS92fF2FgedtS1g5xPc3486CMA7r5rI7H41l2x/VEX5bL0oAaV5Wpbl+rYCzTcKbzP/6am07fjYppwH+9ZGLatE70HYdHZ4Aj9nZQ2eaDokyCKoFj6lUQICUFs6prMUTAWzCpgeP9j4VjDSt/ZNZt03iRD6gmeXkRvB7GPxvXyBZQ2L3lW9KBG775odTYa54qn/OSImvzFLTA36PaCFyn6sY7hCsfa4cmNDu4ATil2yeP/yKPpFDx8BY+D1O2ZMfjYMMmevn3q8tPT0R9w5aVic2pEstU6vBvGLTE+shHEjTOZyZSbt8l1a7/TlwN4D1GNrn5H/xB+xroWfH6e3DMKjkNpibbFb9C/IUFfEDjUYC7cbf42v0mh50CLGjkD60/gNodqSrZtkckGjU/BW77m44jMHYhFN//7wdEeXfR8aDKJe9KabEUlEuM64rwj3U+VAqDTJ0WRsxWQ/DjWrO+k5UItuFzzTC7bZ6vkn/PRQj7WLuyrUkREZs99D7dbEV6tueuU+fF3K6i6dMhKLzNnVVz7J+VEzTBxLMk/LascqfUmNfXuBMLaOZ2mFmmudeDPqVSCrkxr4xEVSHvO5hjJB7CNJ3tiGbx8UjxQx2p50nB+GP8vWOo98PYNVhJHG+jMqDzOVaO1zi99XCpQ8EAAU8086j29dVnBdl9rMgbKqBQz2vzxiJWMId5/pVbrja1BI3FwLWUdUsdqkgvZ+/JUY8oolEdcnC3v19Q0z4aTMOpiZmYxo5elUVy9MrSg97seBKmOxkm08/4DvxmBnSmOGexlwvcC26AkLmfpyOYGErNDMzZ1D2QoSseVqS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9426.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?L8+xtGjO123VigaQ57mv6E+UM0lk/Ew9ZeQQVfQJer658myAJdT6mX9OcC?=
 =?iso-8859-1?Q?3ROLRGfwQS0HBsetyFSMtX2uNuTFZFQp9PjuFNLYx8ytdxKfx1CReZVyIg?=
 =?iso-8859-1?Q?qPCNI3u+Gi+//o8q0BgXZAvQb/H/jlDEk95BMHECTlGlzDGDBbM7a2nrjz?=
 =?iso-8859-1?Q?CMds3LQ2GZl54hCeCTkFc3HsgCvfei+HCqpK9RS5m9cLkOEE5eoi0NY/Ia?=
 =?iso-8859-1?Q?4+LOGdGq1CtzgSViE50ehpEY8dshzXXE2hzfLwALLJAc85wXowvmdF9yPr?=
 =?iso-8859-1?Q?VApDOUBVU2DAh9SNJS7k+NZ5feXMtgFsfJPEgHDebd53AAhZE7qWQrIbB3?=
 =?iso-8859-1?Q?srimTXnk8VzVYrpBOw25IdWA4jXRygQ0gmt6C3al6NUYhgsLmqri1rzwzm?=
 =?iso-8859-1?Q?tajGCaUCT/GXuBBzQsi9cL1wLkTaZI2h0q6SDPOnLzqia3WSFgT6zlKPNv?=
 =?iso-8859-1?Q?Fwl0pmh+JVo/lgzp8m2R1P7Y/89lxC7JxEsqceD2lUkt3kWmoqxAs8mEQ3?=
 =?iso-8859-1?Q?FhiXVN5725XaFu8tHD7gsDwxY7z47ZddfVzLWnBNZ93hNXV/q8BijQKwTS?=
 =?iso-8859-1?Q?b/I5rzN5c+drPTosMNEy/Kz2n+bOlBOydD/azrJHZf2eNyBYxBoCaEOjFf?=
 =?iso-8859-1?Q?vyi8KDaysB1FI/Rb71H5qpth/nGShvsB895xHIenR+FZObuCopwJIDPl5S?=
 =?iso-8859-1?Q?urG88zoGc5tL9OU/yXOb9DYth8vrT83rlgdgwaqZMReX6whJLvorSmBFEE?=
 =?iso-8859-1?Q?8B5NheIp10zIFTj0HRrhaB/Wqy09rDnkoinkJei7SR0CvwXt/J+1B8hTJr?=
 =?iso-8859-1?Q?USUCX5pEYpKXV47rhn85xPKeMxNqdJtrl2I36yJ5K/BM9gv0+flSTq6rjq?=
 =?iso-8859-1?Q?i1edSBeNhCbfiTZaCRmuccy6jzgCwtiIfXKJGdP2Pjkk0Pb0c7TtFDVVHU?=
 =?iso-8859-1?Q?Kebso4FjW9mA6bbfpP8ssrcQ2eOP1z9iToctZTkCH1n86/MtGw/2TKnP4u?=
 =?iso-8859-1?Q?EeQ7fBpGEvtYO0RouVT9+wc8TgtjYWT3CUzagUPAYLFdRSiicQ/wO5kEQL?=
 =?iso-8859-1?Q?L2r0F0tvEav0rYZKJWIayhIZr1KWNIgLWxWG9lu62fcfRv/gFf51e3oK2+?=
 =?iso-8859-1?Q?vnkeeMf1rAOBHXOL2PpHkcmgUFC9k3GD0nKSf+hxo3CKVuI5u5UjgTSv90?=
 =?iso-8859-1?Q?gm7EZgMZ/JNFpWRv9rdFrC1zsoBxXGiWT6HApA9zLQEmJVqaMSo8S9ESRN?=
 =?iso-8859-1?Q?nuHh9JGi+tGKE7g0UktMucgFez9DL9/oYooXdi4ltzle/Lpx78VKn7AFa+?=
 =?iso-8859-1?Q?+/p5AVZOM2X0EenSPmi0ZfnI2PZxnWORdWgePHNd/xM+QUcfSUi07tlXnG?=
 =?iso-8859-1?Q?3rVnshA2o1fAvKLN1mIzDrvB9ztFgCXp8iDIQoHs3rNR+8vtskwfjXUGJv?=
 =?iso-8859-1?Q?CywFHOnZRs866SzRo2SgoqDFlK9JXqJ1B3ji7ne0tgtCQ9v7Fol7RMrRMR?=
 =?iso-8859-1?Q?nKmrd77pNpb9mFF1NlB4gBroVJva0Ul8RU1Lp3kZ159gfNx+YnUS18ubrH?=
 =?iso-8859-1?Q?/WEF2Z9+PETdv64pzXBl/f9jc6kWr4vvcyWheqyHnB7/ZZbn/BwOigXTrl?=
 =?iso-8859-1?Q?bmL7BzrUjczGNd8/y+r+O6cVcwiiBCScMWyeZJ1cRBSIkp9aLUPm5dc5bT?=
 =?iso-8859-1?Q?V4THrC4E+saoqRLEr6MgSp2pUwvzfajHDH5+ZsmYDyhNKfyO21bIAB76dK?=
 =?iso-8859-1?Q?eGULmzktR2D52/54OnPs2SDgBCNyzuJGWwziwiTOe0wY7v0j1vL8iMf0wc?=
 =?iso-8859-1?Q?NY0fN1g5qA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9426.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6b39fd-a85f-49fd-89f2-08de7869f098
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 14:42:33.6524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AkZWbcW1ozomRGcsGinOoPECMFbBCNbxS4Fe3T1sNvWQGQourWXQzgVB7KzAvaXtkX05EEG098ntoRh6fwrikpdldMfLJQQ+b1WVNlivFZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8908
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
X-Rspamd-Queue-Id: 400D71DB108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:frank.li@nxp.com,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jiwei.fu@nxp.com,m:xuelin.shi@nxp.com,m:alexandru.taran@nxp.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4ab00000:email,devicetree.org:url,nxp.com:dkim,nxp.com:email]
X-Rspamd-Action: no action

On Thursday, February 26, 2026 at 8:21 PM, Conor Dooley wrote:=20
> On Thu, Feb 26, 2026 at 03:40:42PM +0200, Ioana Ciocoi-Radulescu wrote:
> > Add the bindings for Neutron, a Neural Processing Unit from NXP.
> >
> > Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
>=20
> You are the author and submitter. What did Jiwei do?

Jiwei is the author of an initial, NXP-internal version of the Neutron
driver, which wasn't DRM/accel-based; I redesigned parts of it before
submitting upstream. He also wrote the initial version of this bindings
document.

>=20
> > Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
> > ---
> >  .../devicetree/bindings/npu/nxp,imx95-neutron.yaml | 95
> > ++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml
> > b/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml
> > new file mode 100644
> > index 000000000000..ba1f6851866b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/nxp,imx95-neutron.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP Neutron NPU
> > +
> > +maintainers:
> > +  - Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
> > +  - Jiwei Fu <jiwei.fu@nxp.com>
> > +
> > +description:
> > +  Neutron is an NPU from NXP targeting edge AI inference applications.
> > +  Initially supported on i.MX95 SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nxp,imx95-neutron
> > +
> > +  reg:
> > +    items:
> > +      - description: Register space
> > +      - description: Instruction area of the TCM space
> > +      - description: Data area of the TCM space
> > +
> > +  reg-names:
> > +    items:
> > +      - const: regs
> > +      - const: itcm
> > +      - const: dtcm
> > +
> > +  memory-region:
> > +    description:
> > +      Phandle referencing a "shared-dma-pool" to be used for Neutron
> > +      inference buffers, which need to be 1MB aligned.
> > +
> > +      The memory region must be defined with alignment of 1MB and size
> > +      should be large enough to accommodate the targeted ML models. It
> > +      should be marked as reusable.
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    minItems: 2
> > +    items:
> > +      - const: npu
> > +      - const: npu_apb
> > +      - const: npu_cgc
>=20
> clocks should be done as reg is, with the descriptions in the !-names pro=
perty.
> Not really keen on the names either, these are all npu clocks so the npu =
prefix
> is odd.

Ok, I will add description to clocks and remove "npu" prefix from names.

>=20
> Additionally, why is the number of clocks variable when you only have one
> platform?

There are only two clocks for imx95. I'll fix in v2.

>=20
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - memory-region
> > +  - interrupts
>=20
> Odd that clocks are not mandatory!

They should be, I'll fix.

>=20
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    bus {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      neutron@4ab00000 {
>=20
> "neutron" is not a generic node name. This should be something like
> "accelerator" or similar.

Ok, will fix.

Thanks for reviewing,
Ioana

>=20
> pw-bot: changes-requested
>=20
> Cheers,
> Conor.
>=20
> > +              compatible =3D "nxp,imx95-neutron";
> > +              reg =3D <0x0 0x4ab00000 0x0 0x00000400>,
> > +                    <0x0 0x4AB10000 0x0 0x00010000>,
> > +                    <0x0 0x4AB08000 0x0 0x00008000>;
> > +              reg-names =3D "regs", "itcm", "dtcm";
> > +              memory-region =3D <&neutron_pool>;
> > +              interrupts =3D <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
> > +              clocks =3D <&scmi_clk 68>, <&scmi_clk 67>;
> > +              clock-names =3D "npu", "npu_apb";
> > +              power-domains =3D <&scmi_devpd 20>;
> > +      };
> > +    };
> > +...
> >
> > --
> > 2.34.1
> >
