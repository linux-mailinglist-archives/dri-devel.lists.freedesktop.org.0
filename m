Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7971CA44722
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E2610E719;
	Tue, 25 Feb 2025 17:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="AXGzZrhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11022077.outbound.protection.outlook.com [52.101.66.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034A510E6E9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 14:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5r/SgZsiozoTDsPbyEI3uAdUL6ZmLEJMQG9WDfPj6zvklSWXVA7puNXseYRByxU28rZKVvVK3LbvniONaada5QMGZ1NsMJ/lkuTX6UwxsZYcyYL7tlTZx2s3E1a8OpXYd0luYEOoqG9JiSFA5Q4cZ9XwI1+WwVLd2Q8CIA8zg2uQ1Raf3WR2XMkI4aogVNx0HEv53niW2aqMCadCwN7A5RzQ5084uqIRhJeKJJ5byndMHe99YfOhErIrsPl1pzYcCtUJyRDzZ+V4z0OJZ/8C7dpU7cELoR2EGox25IuNu1vS0f4KZRCPOCh2kba+XRLrdoY/Td1NRhp62L7XtNCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTUxDrNQv+XTym9eeqeL2q0sswEM6ZCeFbI/+IB53FY=;
 b=KRCgl7IZ8LZv5Agmcvln+0NOVK1ri7d5IBItLV8eQ3pbLInM4weIZE/QC1kq7KJ4SobgEK2Bsy7HPQQy5Ktc/9WZ+7Qy7wFVIBy+nmuqtYm8E939OXntF+Oa8a+E/G2LZYxCsSlzU6j15wd0xKOu1VMT6HmC0iz+XzVr+O23VIpaJmsIG98Izh/v3al5FZevCDHiY2t3czgIsgW5EV/FXrmjTfmhJ3tku4+I02YjPKrAvOz9LfLTahzMfZhAfjwcqgaJ3nQ8uCohL8PGiePJl8rot9y9l4d+7uA20VsnilQChCLdPg2qDn/vxoijNJcTfXpqNjG46p72i/aK5P2E3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTUxDrNQv+XTym9eeqeL2q0sswEM6ZCeFbI/+IB53FY=;
 b=AXGzZrhCRkpXeGLYJef6Fin5AqACRhRf8iCXimdCmWHh4IdYbo717J4RpCaNFB/WOfJFfvM5ISqnsMeUPNNpM1ahdQI4IL0/GwWiHmuiyik/XvJABWY1DPLgrGXzIkp9aW/3+LygAVa5x4mdJU3hXDmzRDL9aIXF7Y03AIhJ9OS0KxKxzfgGhG3LYJhDebalhZrHs+fuS6n4LncuivQKZ0aiQW2+dxOivAkGgz1IunuVJfE7WARtnFuwSe2Nj6oFBiD7aP5ErMCwite+g5uVcBAI2Ko89gBIoZPLaoDVWsPP2WkhDRcuBMJIuSHebQy3qXWd8ljTxiDzF5N7AqAMOg==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by PA4PR04MB9269.eurprd04.prod.outlook.com (2603:10a6:102:2a4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 14:39:16 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 14:39:16 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Liu Ying
 <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 05/14] dt-bindings: trivial-devices: add GOcontroll
 Moduline IO modules
Thread-Topic: [PATCH 05/14] dt-bindings: trivial-devices: add GOcontroll
 Moduline IO modules
Thread-Index: AQHbhsMosk0/ripJzU6HkH3zRHdpDrNW7EQAgACtnhWAAFAuAIAABT4ZgAAkE4CAAAFNQQ==
Date: Tue, 25 Feb 2025 14:39:16 +0000
Message-ID: <PA4PR04MB76303307674B66B4118CC3B1C5C32@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-5-5ccbbf613543@gocontroll.com>
 <20250224204428.GA4050751-robh@kernel.org>
 <PA4PR04MB763009E88F6406CD84ACBD33C5C32@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <20250225-smart-industrious-groundhog-41deb2@krzk-bin>
 <PA4PR04MB76306D77C93FF2C51524BD95C5C32@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <20250225142043.GA2173114-robh@kernel.org>
In-Reply-To: <20250225142043.GA2173114-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|PA4PR04MB9269:EE_
x-ms-office365-filtering-correlation-id: 2502bd7c-4a28-40b4-d748-08dd55aa2e52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?yqxn6geKtpJ78H9R3TyicCVa3DBzpi7EH8yvRW8UYBORvsyYU2JhNZ4o/K?=
 =?iso-8859-1?Q?+jBXIt5mSNGOKKF7fG6pS5S5t1PGlafIuS4WclWYtsXCkFPbcjKsEJlq3P?=
 =?iso-8859-1?Q?NZLzkrjhgiI13oX9V/tYCDLsZgLM8bNk1PmvB6pEbeSSjnHtBw8qvfJEjf?=
 =?iso-8859-1?Q?8VbZcgOjXcPK8+IBG7NCgOeRBSDOz+o5Kb29h/lfvDw6xMiTTcetSUpFmj?=
 =?iso-8859-1?Q?UWNAjsM/gR9wMlKrBMc4Ip/rAm7UIhhjmylnkgEGUQucswoN+gpgWi2sQd?=
 =?iso-8859-1?Q?Wc3M640tfDBhz2eEzXpyzNLvIGKb1NneqUCcwLCrOZV2A8cRVs2WqkA6BM?=
 =?iso-8859-1?Q?McMp4dzTPPpC5MuTVu0LOLHjI0Fx7O0OPafYxpi8WwaJvKeXCJUWzgcSzy?=
 =?iso-8859-1?Q?x1H8v0/Y4o6OICPIGc4m1qW+YEfiXNOBSdVFjhx5gKZlXm2mqQTtiWWb5d?=
 =?iso-8859-1?Q?b3rIT+702zvNME9VLqNFt84a3dGELUtS6jJc1AA78e82CpvZKW3dy8civL?=
 =?iso-8859-1?Q?rQCx9YBEQ6gk9eQNRtYpRQ5muogpj/dc3hF53FdwUF4jLyMRZ+LedbU5Nu?=
 =?iso-8859-1?Q?c3sMeHx2I2k0MATlonuL8DMeK45sPZpLHfhCeDWIVFq66qdYkm40j0JUAu?=
 =?iso-8859-1?Q?T/DJ+I6J2RhR7EKZukYfuw14iEn4cSVbxHfzVf+40vof589f7zoUT6Ejqa?=
 =?iso-8859-1?Q?iifoXDXAjhdmh2BXZF74v5aFNuthvTEW16nfnaGXvr73QG8zyTYRjqVmn+?=
 =?iso-8859-1?Q?zyQTawZ1nmtQ3yShi1VhRlPv5dwgQXyM0uxdjS5kQSY27mddUoGcZdeOeN?=
 =?iso-8859-1?Q?Iu485EHDhAe58X9BykvktLrtDrtxRmE5+Or/LMILhkhOJpD9Zn/2ZXN7Pg?=
 =?iso-8859-1?Q?M68PV4x+ffAplYxQ4jCy1A+zjCCs51FPYg0YwXgSA6fPoUSv+SoHUKsNOo?=
 =?iso-8859-1?Q?PmUp8RdOygNoRsOzEs9PGxzCAeU+xnirmJGZIFrPQOPnq+WCiva06fccsh?=
 =?iso-8859-1?Q?Al0sPunekt1iW0MNEEXLw0JTvjPS2xImvDDDQeBDA3KfVXaHuEV+EjkcuS?=
 =?iso-8859-1?Q?yGdwat+T9sbydBEMyif8ph0t4AgaqQZpygy2pGgS4+diJJ+QfwmmZi7qzi?=
 =?iso-8859-1?Q?lywyHa23Isg/oh4mFY9fT1bfIeuqCUpXwtkp8ZzD4fTYJzEdno6LfGz42Z?=
 =?iso-8859-1?Q?6FmMC/6XJhQIXGa54EeLg1MV9hRJMuN8AS4mt69y3B3hKSsJW8+J+7v0Bk?=
 =?iso-8859-1?Q?Nlsvgk5edrYUpeX4Kl9jwatzmSPv6GrtbLtu2tT3fUi+o/aXLoIr8NSfKq?=
 =?iso-8859-1?Q?SCAoI4Cd39qVTIixREzHgEvZbr+ULDJAzyD1dh6FNUf/IQGg6NWbCDeSw1?=
 =?iso-8859-1?Q?I1WC9hqTA/7zgy8JNUFv5GzTERywCXfs1Ld0mcepNBfSLsy2fwLpjzoQ5z?=
 =?iso-8859-1?Q?ZSJcj0R92OUJTqHR/fSxl+o50ViORthhM5f7f4zC/rhv+jm98uFPiWBpkc?=
 =?iso-8859-1?Q?TXAzmg46kan/usK63E/961?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7416014)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?P140BimaGm8enNYiTcrD/v5JtTL/uCCEehdVOM3VnIUjBwv5XgrNBLxeHZ?=
 =?iso-8859-1?Q?qSPasWsmQa1af1dLhSS6Z2x3qDFDTqHEz8+kbAKA20/pwB3tkdWBoBuUX8?=
 =?iso-8859-1?Q?KT2DahbqlLxz6XY0iBy6rHOGTlO5pjffQsI1gTli+AuGIPk7h7Y+aPsoPG?=
 =?iso-8859-1?Q?2GRlpS9V5c+qQQZiir/02lBoUtVzDmpWYOktIZfAg1RByQhkbRIHX16A8D?=
 =?iso-8859-1?Q?ramu7Sd+PXY2c9B0xoTpgwiUTNGypKjQ+tPmyd4r+zH7N4BhobubK+qqqj?=
 =?iso-8859-1?Q?wlUy0MNv/PqEXWqglxkpqmTBCdWyZO/cm+ouvPnDvRO9CVL28SBCpVmOBL?=
 =?iso-8859-1?Q?QPt8+UFS1w4qmn2MzCOB63YIiY/hv7ZyIWMbL2uvbYWxNcRWgjBirvZHmJ?=
 =?iso-8859-1?Q?xAYxLW7QHjJxoBuVH2BWhvXNNmLe3Emei7j5S/LEOpN8x5bhKFXQivDRD9?=
 =?iso-8859-1?Q?wojyAMU38ebTubapkrstdR5J2heDGlgD+wka2iPkIcy1c7iIkd/Co1Cn9T?=
 =?iso-8859-1?Q?WaBJqZurZgPZAdX+O7gQuamPGZjuOYZ7YA8pR028mVlnsqfXFyj9Fn6niy?=
 =?iso-8859-1?Q?AbabRbHvJiI1zunIdDTKm1+SuEpp4hlBim00BoYG5WSwSj/MmQvE9bZyzx?=
 =?iso-8859-1?Q?QGgUvi+WMHA1nd4bhY7StYg7vWtnBwhfq0EU0+OXizoJwr3Eyz+ZeAJy1u?=
 =?iso-8859-1?Q?05aUMPa5DMp7W1lyj43v4lGZCMy97gNGkWAl2ABuD2vxRYgdvB3JYcYUY3?=
 =?iso-8859-1?Q?09PRBUe5dFhjNeWIgzLSgFnu2M8Arc6v5H2Vefw5E1IimuGDgrjDxdbxHF?=
 =?iso-8859-1?Q?Cy+Xvu+znqyKgPy87xJhPcc/RZHC4ATADZwrxOg59ff6Y9RozRaIzGIQtR?=
 =?iso-8859-1?Q?JsXIIBINHOqatKX3LauxP79j+dYQdKB2jYi0FX127K5Wt7g4QoUrCHn+zZ?=
 =?iso-8859-1?Q?IeldHMS/A+WRNQ8PCFSbq6U8nZ7li0ltXTGOTLSbRz6TafaYZ3NHAa4Waf?=
 =?iso-8859-1?Q?g46/6ghudYmVx/egpGtWQlu5KHBIKZdO1+fUaYeBxC34mWXapBcaJR2UQD?=
 =?iso-8859-1?Q?S0Xhyt2NhE0Nn2p2FVnELimqbuLFSZqUlRa08bm4AUhr4O8q3x5mJsV956?=
 =?iso-8859-1?Q?CVZ9SGi8ECneMAzQhxIegm5uo5+e6RIuyfTf9xSXrxXPsgLRQJ5R+qYGIB?=
 =?iso-8859-1?Q?aI2UhZlx2ScepBo1ha4SR6MVlKyHgyAU84oW5VOLc71bsZrV8DVyDHk+D/?=
 =?iso-8859-1?Q?rwLiHu6HODy881KAzcN0rHytDz02iRBcYgGEYPNPWh4fLIyxYAOWHb0CX4?=
 =?iso-8859-1?Q?VAmWDPxf3ggXd9d88r8x6gRWA1HRMgl8sD2N7rtuD7A4dFUWWg0iMX6LG+?=
 =?iso-8859-1?Q?joZuZ6/vprbJbpD8X/DwQiOZfQu5PtwiTu40N6P37bFZnHYK+6I2nkkOV7?=
 =?iso-8859-1?Q?ebXNlCGYFpVPuU2uFM0B8hJPHpmdQqrQyoI5/atik9rAmLUJQ2/Ebs1CFL?=
 =?iso-8859-1?Q?lnf+0q03mBjWoOfl8mR3NoKbj/kDfRNIU++P2xW2Ryrck8lRaFREEG0Ddu?=
 =?iso-8859-1?Q?2NbAvuf7302sH/ncjLh83AGde15VTwkIyDuEIyOJFf32SGopqgIPwYa5Wr?=
 =?iso-8859-1?Q?o64vCp311U3aB0Pv1SsFYKKV7VCsvTCTNrY+gP1L/PV5W5QfuI2yoVlOeE?=
 =?iso-8859-1?Q?xTITbIz9/M+XdQ4zjfVGQGDMhONkdoNl0S2DfEgsu3oaljvqvcjVgDQIrJ?=
 =?iso-8859-1?Q?XZmQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2502bd7c-4a28-40b4-d748-08dd55aa2e52
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 14:39:16.6213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4LXZL0fssP0F0IetxvDVX3E/F8Dy8e29J3XiNRZKd1ZFzXOwj5vps4gpPg7AutkbwM1MwrGBHIPYEQ9fzDpb+W146D/6NJkH5XQUqPipjTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9269
X-Mailman-Approved-At: Tue, 25 Feb 2025 17:00:13 +0000
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

From:=A0Rob Herring <robh@kernel.org>=0A=
Sent:=A0Tuesday, February 25, 2025 3:20 PM=0A=
=A0=0A=
>On Tue, Feb 25, 2025 at 12:24:09PM +0000, Maud Spierings | GOcontroll wrot=
e:=0A=
>> From:=A0Krzysztof Kozlowski <krzk@kernel.org>=0A=
>> Sent:=A0Tuesday, February 25, 2025 12:52 PM=0A=
>> =A0=0A=
>> >On Tue, Feb 25, 2025 at 07:39:52AM +0000, Maud Spierings | GOcontroll w=
rote:=0A=
>> >> From:=A0Rob Herring <robh@kernel.org>=0A=
>> >> Sent:=A0Monday, February 24, 2025 9:44 PM=0A=
>> >> =A0=0A=
>> >> >On Mon, Feb 24, 2025 at 02:50:55PM +0100, Maud Spierings wrote:=0A=
>> >> >> The main point of the Moduline series of embedded controllers is i=
ts=0A=
>> >> >> ecosystem of IO modules, these currently are operated through the =
spidev=0A=
>> >> >> interface. Ideally there will be a full dedicated driver in the fu=
ture.=0A=
>> >> >>=0A=
>> >> >> Add the gocontroll moduline-module-slot device to enable the requi=
red=0A=
>> >> >> spidev interface.=0A=
>> >> >>=0A=
>> >> >> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>> >> >> ---=0A=
>> >> >>=A0 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++=
=0A=
>> >> >>=A0 1 file changed, 2 insertions(+)=0A=
>> >> >>=0A=
>> >> >> diff --git a/Documentation/devicetree/bindings/trivial-devices.yam=
l b/Documentation/devicetree/bindings/trivial-devices.yaml=0A=
>> >> >> index 8255bb590c0cc619d15b27dcbfd3aa85389c0a54..24ba810f91b73efdc6=
15c7fb46f771a300926f05 100644=0A=
>> >> >> --- a/Documentation/devicetree/bindings/trivial-devices.yaml=0A=
>> >> >> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml=0A=
>> >> >> @@ -107,6 +107,8 @@ properties:=0A=
>> >> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - fsl,mpl3115=0A=
>> >> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # MPR121: Proximity Capacit=
ive Touch Sensor Controller=0A=
>> >> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - fsl,mpr121=0A=
>> >> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # GOcontroll Moduline module sl=
ot for spi based IO modules=0A=
>> >> >=0A=
>> >> >I couldn't find anything about SPI for GOcontroll Moduline. Can you=
=0A=
>> >> >point me to what this hardware looks like. Based on what I did find,=
=0A=
>> >> >this seems incomplete and not likely a trivial device.=0A=
>> >>=0A=
>> >> I'll give some more details, if there is a v2 of this patch I will al=
so=0A=
>> >> add more information in the commit message.=0A=
>> >>=0A=
>> >> The module slots have a number of pins, a lot of them currently unuse=
d as=0A=
>> >> they have not found a function yet, this is very much still a develop=
ing=0A=
>> >> product. The currently used interfaces to the SoC are:=0A=
>> >> 1. SPI bus as a spidev to ease developing new modules and quickly=0A=
>> >> integrate them. This is the main communication interface for control =
and=0A=
>> >> firmware updates.=0A=
>> >> 2. A reset pin, this is/was driven with the gpio-led driver but I dou=
bt=0A=
>> >> that would get accepted upstream so I intend to switch to the much be=
tter=0A=
>> >> suited libgpio.=0A=
>> >=0A=
>> >reset-gpios is not in trivial devices, so that's already a hint you=0A=
>> >cannot use this binding.=0A=
>> >=0A=
>> >> 3. An interrupt pin, this is currently only used in the firmware upda=
te=0A=
>> >> utility [2] to speed up the update process. Other communication is do=
ne at=0A=
>> >> a regular interval.=0A=
>> >>=0A=
>> >> What is unused:=0A=
>> >> 1. A potentially multi-master i2c bus between all the module slots an=
d=0A=
>> >> the SoC=0A=
>> >> 2. An SMBus alert line is shared between the modules, but not the SoC=
.=0A=
>> >> 3. A shared line designated as a clock line, intended to in the futur=
e=0A=
>> >> aid with synchronizing modules to each other for time critical contro=
l.=0A=
>> >>=0A=
>> >> current software that is used to work with the modules can be found a=
t=0A=
>> >> [2] and [3], one of them is a Node-RED module the other is a blockset=
 for=0A=
>> >> Matlab/Simulink generated code.=0A=
>> >>=0A=
>> >> If you know a better way I could describe this in the devicetree then=
 I=0A=
>> >=0A=
>> >You need dedicated binding where you describe entire device, entire=0A=
>> >hardware, not what your driver supports in current release.=0A=
>>=0A=
>> I see now that I also forgot the patch that adds this compatible to the=
=0A=
>> spidev driver. Didn't check for the spidevs in testing I guess.=0A=
>>=0A=
>> Could I write bindings for this device, and then add the compatible to t=
he=0A=
>> spidev driver for now? So it probes that driver, and then later when the=
re=0A=
>> is a driver remove the compatible there and keep it only in the purpose=
=0A=
>> built driver?=0A=
>>=0A=
>> So I'll write gocontroll,moduline-module-slot.yaml, don't quite know whe=
re=0A=
>> that would go. Define all these attributes in there and then add the=0A=
>> compatible to drivers/spi/spidev.c=0A=
>>=0A=
>> Is that okay?=0A=
>=0A=
>Yes. Bindings are forever, but drivers change.=0A=
=0A=
Okay that is great to hear, I was afraid I was going to have to drop=0A=
support for the foreseeable future. I'll get to work on those for v2.=0A=
=0A=
>Perhaps put it in connector/ as this looks a bit like a connector. Do=0A=
>you envision DT overlays for the IO modules? Or modules don't have=0A=
>sub-devices you need to describe? There's some effort to on connector=0A=
>bindings (for mikrobus in particular) in order to de-couple host=0A=
>buses/signals from the modules (i.e. so a DT overlay can be applied to=0A=
>any DT defining the connector).=0A=
=0A=
I don't envision overlays coming in to play here, everything should be=0A=
probed by the driver. Just needs the socket definition. The IO module=0A=
bootloader will communicate what type of module it is and what firmware=0A=
version it is running. Modules can be swapped very easily between boot=0A=
cycles if the lid is off, it would be very annoying to then have to mess=0A=
with the devicetrees. For most of our customers that might be too=0A=
complicated. I am still thinking on how to keep the ecosystem open for=0A=
others to develop their own IO modules, but I'll figure that out when we=0A=
get there.=0A=
=0A=
Kind regards,=0A=
Maud=
