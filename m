Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D54387248D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1375112C06;
	Tue,  5 Mar 2024 16:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="WsEf5CGP";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="cWVUCnjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7C7112BF9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 16:42:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 425CvrsE022539; Tue, 5 Mar 2024 16:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=4jfHbkmuTq2vVXSw+KwcFd89aVPI9ObVIIMlmhGSqh8=; b=
 WsEf5CGPbfNqAvJO4yU6p1tnb8VJ3fucl7L5UNGrxTa1uN7hTe+bSOJu/VVVkBRC
 Vc63aGrE2ac0ZZF3zvTovhBx4KityJNs6QlrCyM58u4KNx2oNWOHRIKKU2GxFLih
 YsaCXVn5bR+jtZM7TdTFhiI1ACKY2L2PTJqLlIEFB6WhvnX5/HNJ1M4xOWqblkRN
 1TloPphwR0LvDQ7F5RJku5J3a4/RXN3eBD4lMRzFQjbY9zDRdH3S/+BH05qwG+mp
 zfXcEvevOrQC36d2Gn5mEDCAD0lIBZtyPZwc58FMaJ72600nVmqPJA/z8ezC6LbJ
 rQjodnYacWCpTB2R3kq5ow==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3wkw2wn23j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 05 Mar 2024 16:42:40 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 16:42:39 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 5 Mar 2024 16:42:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNr/OmSZtCnp8lqYJcQv/KW07ph5fzxwM+sqtnydOFlYEJ119Wgrv2AP7Ic4Z2iEanh0JUW17+kZSJ81LFqFuiy9fM3HbbIgEn6tsh5Ck4+mK+ixu/aIgPLn9v/QxXF0Zn+4Bg2CB0ED/pBLl4D7pfzQvtLd5rVBUrqfTcoaDONk7bDBu4BqDtPzCtZK01RWu7eB+tMapW3SgzIoJD8G9iy+9Nbw3g4b9YDaALeE5UdGSGfDPpGWrBmObCQ4OnmymttLYUB9oZT7xM9uBnHu1/48xixA2eFgLfS9HoFruoYBL2bbpECU3e+eNSjmIgEmGjDQWfvCdgB4L9RuzhiWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jfHbkmuTq2vVXSw+KwcFd89aVPI9ObVIIMlmhGSqh8=;
 b=aZiqk3chTfXrIt2p6iuBbIq+B5mW7o4E1/fWBRkts8sWT8uirNMoEsprSqcI2+sRNxegaq8XSeNhOpAQp16wys2HMiFPxErN/zd9b5kA5ySIQNxxn50A8Yx9370azXDCKohceTgax3MGm7wI/RulI4S5pUf4ZSG8v4QXVWTzQ7IbFnCzBLgVP9g9sjaogdttxtAi7XSUpXAbrwRS+HQ/8QVV9Zp2RwGdH53PVpemaIFmsucqu1QEH+IXmckYSGTbnnAdZ43Ma41iBKhBORSfU5eGLyd+weZTjs9M2Lk5X7pCxMovlFpcNCqpheMUSxp2zuzf8+i7XbhFE7EztDJwqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jfHbkmuTq2vVXSw+KwcFd89aVPI9ObVIIMlmhGSqh8=;
 b=cWVUCnjUI0fzPPIuvuUUbhNC4BSQ9VbOAQG/PrWGwHZlAYox1zDkTJgzCfOAFRjqwhtcXbAFP4noWO2iEHvggTbCaEQdpCTdSUg3GgZhfpGLEhg1vLKbjGqRQQ/Ez8Uu68OfOlHLi9xP1gsrU9q9ngHdEsxKbsxf2F0UQ/7di3w=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB2226.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:64::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.40; Tue, 5 Mar
 2024 16:42:38 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732%4]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 16:42:38 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "aford173@gmail.com" <aford173@gmail.com>
CC: "marek.vasut@mailbox.org" <marek.vasut@mailbox.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, Matt Coster <Matt.Coster@imgtec.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "nm@ti.com" <nm@ti.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Sarah Walker <Sarah.Walker@imgtec.com>, "mripard@kernel.org"
 <mripard@kernel.org>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Topic: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Index: AQHabxwhAsuxNgpg6kCzVhdiSsszGg==
Date: Tue, 5 Mar 2024 16:42:38 +0000
Message-ID: <9515180b63a41a419c2f7561feebde1da93a11ad.camel@imgtec.com>
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <76065296ad514898e2b8c29cd921c104b3692ae0.camel@imgtec.com>
 <CAHCN7xJ6uEghqDcUTKKQg7Lcg8uF55rz=vEHF=1xHRYfsDNGsA@mail.gmail.com>
In-Reply-To: <CAHCN7xJ6uEghqDcUTKKQg7Lcg8uF55rz=vEHF=1xHRYfsDNGsA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB2226:EE_
x-ms-office365-filtering-correlation-id: bead5262-f67c-4dea-8534-08dc3d33447d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6KwpZ/QVRC/QP/0P7qM8/RyWqJbNVAW+Uvl47t/gyohZrL45Y63cHe37BZVH/6AHntsFlOQeCXr2f5pIIGngFifpqVO9Pn59l+ZXDtHcZ/L/Nee/mvIcfzfj70G0Y5gnBjc3gNDZvzzwispBlE6PPnLPpXlraOebio/wtId1oul074wPzKMUe+W/qQyeWC8rp4Any3OlwmdtLsH63AldnnZq87Ge24QFTOHt8rY2Q5JXMjH+MqzNHPocboN0npR1GNglmSfpiZkBI1XnJPcph7W5lRDHcPOAFIyQmF0zQLDb+58MbhJ1B5/ThAcu6LilctKNWKYwm5s7VJnIxbazCg2Oz5FgzPVr/oscu/hIoWO/LrSA3D1s6dlTxnrK0aEWtA+WcfzlP0hV9j9aVWXRUVQY2AX5PjG/ei0N/9kOJmz/oTMifaJbhgR0L5lwhpn5eMkLVRc6xzbF+M5LZI1f85CnFNMBWb9/GP7AHJ7iQq+Ria6BHbRYTLWH4nezwePBlCY/XCq35kU9gfMV9o45/j1nbrI+iAruY0oB2NqUyMtpxdcBHlzbAQ5R1IB+Pl/BYd0fQL9dfoQpgB67dJ1SpfRJQFkivO8cNJ+xQPbbh3SwR7gq+SBlhrgXzIhWUpwMuST0ST4PlgM/9AycA40m85IyPVLOF2J4ZHB6efJ6HGg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2V3dDd1Z1oyUHJ4dUNIYlhzSXVXbUJwTCtXM1NIMVF0cG9EeHRoaElvdGth?=
 =?utf-8?B?dzVUZjM3QnBiUm9NOW9vMUtFMGdycmhtSmdXL20xVktBYnl3NHhVNDQrN1Zs?=
 =?utf-8?B?S2ovaHdxbXU3NmQvSFoyL2pmOHdWMGtnZElhNVNOaWpBQVJXdm5CYzcxSzA0?=
 =?utf-8?B?ckFpL0pmQ3VZRitjQ1BESFVvUnlqempvZUx2L0x4eUROY0dTYXZ6ODVxRUhL?=
 =?utf-8?B?NktoY3RGaThMelZuRWt1MjhKZnBsVU5BL2w0MDYwSndrdFFzSHpudnZET2J2?=
 =?utf-8?B?R1lqcXJDdzgrZ1pnYzVuWUZuNXVCME5uR0tOa2kxV3hoZTJYS2NsVHIrS203?=
 =?utf-8?B?c2ZjS2U1R0w5SVdBcFp5SkE1V0xRUGNUZDVyRTB6TkppaThxNE1mY0pNUlcy?=
 =?utf-8?B?N3puREM1elNjYjdDYmlvNW05S1RhM1BXZlhvS2d1ejd3QkVmZEltQzd4ODhN?=
 =?utf-8?B?SHZKWkRnTWpBYjZRb0FvSng2bnhOcXRLNjk0ODR0WmpObDR3LzRTYU91YUVW?=
 =?utf-8?B?bDFIZXJnL1RUejduRTI3WGkwN3JybFhUaHJTSFd4b2tPVHphdVBERmZhNVJK?=
 =?utf-8?B?K3NKTXR3WVFUS0VDUEFJRFBPanVVeFpZQWJCb3FXUThxNVBsclNzSGV5TDZE?=
 =?utf-8?B?MEtrbUZwWVZhcW1qbExzOHJwUzlIMnVWNUZZYW5OdlVrdFlmY1l3cjNEVG1P?=
 =?utf-8?B?SStjaHl0SUhvMU16NFVDQTdKTktOM29oV2ZOQmswNmUwVmlIZHR1RmRPWGJr?=
 =?utf-8?B?VURSNHovTXgxYnZLKzlvcnNic2xtUzNLV2pmSy9NeGpHSEVxdDlhYjdSRjVM?=
 =?utf-8?B?M3E4Lzl1YkFqZnpZc25lSnYwdEErS2VoZmxoTy9rRHNFbUZYR2h2WEdVZUR1?=
 =?utf-8?B?dlJqcGx3UnFjcFhmYVl0YkxnTUdYaVFla0pDZlZNalR0R2lZZ2QvQ1N4VUk4?=
 =?utf-8?B?ZXNVcjBKZGNhelhmeTgrTkk1REV4Vnp4UGVacCtUb2RscldoNmZ2WlU1V3RI?=
 =?utf-8?B?c1FWZGtBRzNqbGo5dlhWSTJYbk5TbGQyckhSVUhndTQyM051Y2hqdXJjdGVW?=
 =?utf-8?B?S01UaW1aQnh6aTA4cXVkSC95TTMvWlFLNk1YOXpiT1E1eXhuZVdiZXBVM2hu?=
 =?utf-8?B?MTNTbkdxOG1PeVRUMUR4TE4zYlNXMGw1NERJMHRWWDZ5SC9lQjV3WlBxcXpL?=
 =?utf-8?B?MmQ1Y1VzOFJzUmFvc2h5MWFoWE9qYXYrZGNzQXJSVWNNYi9ydVF3ekxuYUlp?=
 =?utf-8?B?VkpQU2JWMlRLTWZaVG0zeXJsd0hlYmt1ekhWZk1uTG54RDRrM2hlcXgzTjFn?=
 =?utf-8?B?d2c5ZTA3aDBIOUdXOU5pRnJMenpuczhmb1J4Z0UyeThxOVBzSXVIQy9wM0kw?=
 =?utf-8?B?eDlnbitVNitzY09nd3ZwUG1NTTRGNkQ0YVd0Q0NkaEhmR1JxMEJsRW5kdVI4?=
 =?utf-8?B?SW4zc2ljcWl3SWUvdGY3bjJpSzM2TXljUGthanU4L2F0ZlVXaCt5MTd1SU9K?=
 =?utf-8?B?bjFabkN0aFY4cDZEYThIdG55ZHQ4aitURXhvLzRPeEU3a3hGK2NYcHR1bWJM?=
 =?utf-8?B?eVExQ0dlSHZnZVhRNWMxcTNhc05SU1Rxb3pCMWdqTnQ4UUU3cVJ3bEpkemF1?=
 =?utf-8?B?UktvbDNkWVFmUmpDNFNDWDZqd1lkRkUyZEIyckVNL0JWS1J2VlgySmgxVjRU?=
 =?utf-8?B?S28xV3JwNWlWNkJIR0RRTVRsdnJkbkRvbis3SFhtVlJYbWp3YmEvTFl0Qnlv?=
 =?utf-8?B?czNTMDhudCtyc095QVY3NzZNV0pDbTJNbDh4TXVmTjlLdkpOM0Njd0ZrSXov?=
 =?utf-8?B?dzVOcTNOS3FVcTB1SVdnRFN0VHlVZ1dQaXdWa2Z6VWxXYkhtWGZhTStMbzMz?=
 =?utf-8?B?MkxCMmI5a1NjaXEyblpTcUFvY0V4MDlkdTRBZkMycFpXcVkxdkVXbkwyVDBG?=
 =?utf-8?B?OTJkbmdSVlJXVGhHS05vMndUM1pjQ21aYWZvRkdBOUlEUGU4bDdUL2VxQjVQ?=
 =?utf-8?B?ZFFONnFNdzJlQjNVaEtlMmV6ZzJodGJEbUV3OHNEK3I5Y2Jzb0d5aDhERUQ3?=
 =?utf-8?B?QmcyOVRYUkhZZU5aZFhpemRZeXVONkx1Z1JRN1ZnZlVtRjE4VmU3a0hWa1M2?=
 =?utf-8?B?U2tpNnF2Zk1iY21vdHBVSlptWU80L0IvM1VwYVlBZXMycVZxNFljZWpnd2Fo?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B7AC5CD55B51D4AA934842FEB1B46F2@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bead5262-f67c-4dea-8534-08dc3d33447d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 16:42:38.1188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXEDn/1NeRulvgZAHyh4andb/1Ud70zc6zf0Sdb8YDWAJJ63ZaF0YgCQfk0cyteHjEaWLITV1ZUnWoSB7tu6ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2226
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: O9dCjXoqkbNHgiSzeFyiCy3QiBwSzkau
X-Proofpoint-GUID: O9dCjXoqkbNHgiSzeFyiCy3QiBwSzkau
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

T24gVHVlLCAyMDI0LTAzLTA1IGF0IDA3OjQ3IC0wNjAwLCBBZGFtIEZvcmQgd3JvdGU6DQo+IE9u
IFR1ZSwgTWFyIDUsIDIwMjQgYXQgNTo1OOKAr0FNIEZyYW5rIEJpbm5zIDxGcmFuay5CaW5uc0Bp
bWd0ZWMuY29tPiB3cm90ZToNCj4gPiBIaSBBZGFtLA0KPiA+IA0KPiA+IFNvcnJ5IGZvciBub3Qg
cmVzcG9uZGluZyBzb29uZXIuIEkndmUgcmVjZW50bHkganVzdCByZXR1cm5lZCBmcm9tIHBhdGVy
bml0eQ0KPiA+IGxlYXZlLCBzbyBqdXN0IGNhdGNoaW5nIHVwIG9uIGV2ZXJ5dGhpbmcuDQo+IA0K
PiBDb25ncmF0dWxhdGlvbnMhDQo+IA0KDQpUaGFua3MhDQoNCj4gPiBPbiBUaHUsIDIwMjQtMDIt
MTUgYXQgMTE6MjIgLTA2MDAsIEFkYW0gRm9yZCB3cm90ZToNCj4gPiA+IE9uIFRodSwgRmViIDE1
LCAyMDI0IGF0IDExOjEw4oCvQU0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3Rl
Og0KPiA+ID4gPiBPbiBUaHUsIEZlYiAxNSwgMjAyNCBhdCAxMDo1NOKAr0FNIEdlZXJ0IFV5dHRl
cmhvZXZlbg0KPiA+ID4gPiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOg0KPiA+ID4gPiA+
IEhpIE1heGltZSwNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBPbiBUaHUsIEZlYiAxNSwgMjAyNCBh
dCA1OjE44oCvUE0gTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPiB3cm90ZToNCj4g
PiA+ID4gPiA+IE9uIFRodSwgRmViIDE1LCAyMDI0IGF0IDAxOjUwOjA5UE0gKzAxMDAsIEdlZXJ0
IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gVXNpbmcgdGhlIEltYWdpbmF0aW9u
IFRlY2hub2xvZ2llcyBQb3dlclZSIFNlcmllcyA2IEdQVSByZXF1aXJlcyBhDQo+ID4gPiA+ID4g
PiA+IHByb3ByaWV0YXJ5IGZpcm13YXJlIGltYWdlLCB3aGljaCBpcyBjdXJyZW50bHkgb25seSBh
dmFpbGFibGUgZm9yIFRleGFzDQo+ID4gPiA+ID4gPiA+IEluc3RydW1lbnRzIEszIEFNNjJ4IFNv
Q3MuICBIZW5jZSBhZGQgYSBkZXBlbmRlbmN5IG9uIEFSQ0hfSzMsIHRvDQo+ID4gPiA+ID4gPiA+
IHByZXZlbnQgYXNraW5nIHRoZSB1c2VyIGFib3V0IHRoaXMgZHJpdmVyIHdoZW4gY29uZmlndXJp
bmcgYSBrZXJuZWwNCj4gPiA+ID4gPiA+ID4gd2l0aG91dCBUZXhhcyBJbnN0cnVtZW50cyBLMyBN
dWx0aWNvcmUgU29DIHN1cHBvcnQuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFRoaXMgd2Fz
bid0IG1ha2luZyBzZW5zZSB0aGUgZmlyc3QgdGltZSB5b3Ugc2VudCBpdCwgYW5kIG5vdyB0aGF0
IGNvbW1pdA0KPiA+ID4gPiA+ID4gbG9nIGlzIGp1c3QgcGxhaW4gd3JvbmcuIFdlIGhhdmUgZmly
bXdhcmVzIGZvciB0aGUgRzYxMTAsIEdYNjI1MCwNCj4gPiA+ID4gPiA+IEdYNjY1MCwgQlhFLTQt
MzIsIGFuZCBCWFMtNC02NCBtb2RlbHMsIHdoaWNoIGNhbiBiZSBmb3VuZCBvbiAoYXQgbGVhc3Qp
DQo+ID4gPiA+ID4gPiBSZW5lc2FzLCBNZWRpYXRlaywgUm9ja2NoaXAsIFRJIGFuZCBTdGFyRml2
ZSwgc28gYWNyb3NzIHRocmVlDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSSBhbSBzbyBoYXBweSB0
byBiZSBwcm92ZW4gd3JvbmchDQo+ID4gPiA+ID4gWWVhaCwgR1g2NjUwIGlzIGZvdW5kIG9uIGUu
Zy4gUi1DYXIgSDMsIGFuZCBHWDYyNTAgb24gZS5nLiBSLUNhciBNMy1XLg0KPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gYXJjaGl0ZWN0dXJlcyBhbmQgNSBwbGF0Zm9ybXMuIEluIHR3byBtb250aHMu
DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhhdCBzb3VuZHMgbGlrZSBncmVhdCBwcm9ncmVzcywg
dGhhbmtzIGEgbG90IQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiBHZWVydCwNCj4gPiA+ID4gDQo+ID4g
PiA+ID4gV2hlcmUgY2FuIEkgZmluZCB0aGVzZSBmaXJtd2FyZXM/IExpbnV4LWZpcm13YXJlWzFd
IHNlZW1zIHRvIGxhY2sgYWxsDQo+ID4gPiA+ID4gYnV0IHRoZSBvcmlnaW5hbCBLMyBBTTYyeCBv
bmUuDQo+ID4gPiA+IA0KPiA+ID4gPiBJIHRoaW5rIFBvd2VyVlIgaGFzIGEgcmVwbyBbMV0sIGJ1
dCB0aGUgbGFzdCB0aW1lIEkgY2hlY2tlZCBpdCwgdGhlDQo+ID4gPiA+IEJWTkMgZm9yIHRoZSBm
aXJtd2FyZSBkaWRuJ3QgbWF0Y2ggd2hhdCB3YXMgbmVjZXNzYXJ5IGZvciB0aGUgR1g2MjUwDQo+
ID4gPiA+IG9uIHRoZSBSWi9HMk0uICBJIGNhbid0IHJlbWVtYmVyIHdoYXQgdGhlIGNvcnJlc3Bv
bmRpbmcgUi1DYXIzIG1vZGVsDQo+ID4gPiA+IGlzLiAgSSBoYXZlbid0IHRyaWVkIHJlY2VudGx5
IGJlY2F1c2UgSSB3YXMgdG9sZCBtb3JlIGRvY3VtZW50YXRpb24NCj4gPiA+ID4gZm9yIGZpcm13
YXJlIHBvcnRpbmcgd291bGQgYmUgZGVsYXllZCB1bnRpbCBldmVyeXRoaW5nIHdhcyBwdXNoZWQg
aW50bw0KPiA+ID4gPiB0aGUga2VybmVsIGFuZCBNZXNhLiAgTWF5YmUgdGhlcmUgaXMgYSBiZXR0
ZXIgcmVwbyBhbmQvb3IgbmV3ZXINCj4gPiA+ID4gZmlybXdhcmUgc29tZXdoZXJlIGVsc2UuDQo+
ID4gPiA+IA0KPiA+ID4gSSBzaG91bGQgaGF2ZSBkb3VibGVkIGNoZWNrZWQgdGhlIHJlcG8gY29u
dGVudHMgYmVmb3JlIEkgc2VudCBteSBsYXN0DQo+ID4gPiBlLW1haWwgLCBidXQgaXQgYXBwZWFy
cyB0aGUgZmlybXdhcmUgIFsyXSBmb3IgdGhlIFJaL0cyTSwgbWlnaHQgYmUNCj4gPiA+IHByZXNl
bnQgbm93LiBJIGRvbid0IGtub3cgaWYgdGhlcmUgYXJlIGRyaXZlciB1cGRhdGVzIG5lY2Vzc2Fy
eS4gSQ0KPiA+ID4gY2hlY2tlZCBteSBlLW1haWxzLCBidXQgSSBkaWRuJ3Qgc2VlIGFueSBub3Rp
ZmljYXRpb24sIG9yIEkgd291bGQgaGF2ZQ0KPiA+ID4gdHJpZWQgaXQgZWFybGllci4gIEVpdGhl
ciB3YXksIHRoYW5rIHlvdSBGcmFuayBmb3IgYWRkaW5nIGl0LiAgSSdsbA0KPiA+ID4gdHJ5IHRv
IHRlc3Qgd2hlbiBJIGhhdmUgc29tZSB0aW1lLg0KPiA+ID4gDQo+ID4gDQo+ID4gWW91IG1heSBo
YXZlIG5vdGljZWQgZnJvbSBvbmUgb2YgTWF0dCdzIGVtYWlscyB0aGF0IHdlIG5vdyBoYXZlIGEg
c2V0IG9mIHJlcG9zDQo+ID4gKGxpbnV4LCBsaW51eC1maXJtd2FyZSBhbmQgTWVzYSkgaW4gb3Vy
IG93biBhcmVhIG9uIGZyZWVkZXNrdG9wLm9yZyBHaXRMYWI6DQo+ID4gaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL2ltYWdpbmF0aW9uLw0KPiA+IA0KPiA+IFdlJ2xsIGJlIHVzaW5nIHRo
aXMgYXMgYSBzdGFnaW5nIGFyZWEgZm9yIHdvcmsgdGhhdCBpc24ndCByZWFkeSB0byBiZSB1cHN0
cmVhbWVkDQo+ID4geWV0IChpbmNsdWRpbmcgZmlybXdhcmUgYmluYXJpZXMpLg0KPiA+IA0KPiAN
Cj4gSSB0cmllZCB0byBwbGF5IHdpdGggdGhlc2UgYSBsaXR0bGUsIGJ1dCBpdCBzZWVtcyBsaWtl
IHRoZXJlIGlzIHN0aWxsDQo+IGEgZmFpciBhbW91bnQgb2Ygd29yayB0byBiZSBkb25lIG9uIHRo
ZSA2WFQgc2VyaWVzLiBJIHRyaWVkIHRvIGFkZCB0aGUNCj4gZGV2aWNlIHRyZWUgc3VwcG9ydCBm
b3Igc2V2ZXJhbCBSZW5lc2FzIGJvYXJkcywgYnV0IHRoZSBzZXJpZXMgd2FzDQo+IE5BSydkIGR1
ZSB0byBhbiBpbmFiaWxpdHkgdG8gdGVzdCBpdC4NCg0KSSd2ZSBub3QgaGFkIGEgY2hhbmNlIHRv
IHByb3Blcmx5IHJlYWQgdGhyb3VnaCB0aGF0IHRocmVhZCB5ZXQgYW5kIEkgc2VlbSB0bw0KcmVt
ZW1iZXIgdGhhdCwgd2hlbiBJIGhhZCBhIHF1aWNrIHNraW0gdGhyb3VnaCB0aGUgRFQgYmluZGlu
Z3MgcGF0Y2gsIHRoZXJlIHdhcw0Kc29tZSBmZWVkYmFjayBJIHdhbnRlZCB0byBnaXZlLiBJJ2xs
IHRyeSB0byBnZXQgdG8gdGhhdCBzb29uZXIgcmF0aGVyIHRoYW4NCmxhdGVyLg0KDQpBbnl3YXks
IGluIHByaW5jaXBsZSBJIGRvbid0IHRoaW5rIHRoZXJlIHNob3VsZCBiZSBhbiBpc3N1ZSB3aXRo
IHVwc3RyZWFtaW5nDQpkZXZpY2UgdHJlZSBiaW5kaW5ncy4gVGhlIHRoaW5nIHRoYXQgbmVlZHMg
dG8gYmUgYXZvaWRlZCBpcyBiYWtpbmcgaW4gdGhlIHVhcGkNCmJlZm9yZSBzdWZmaWNpZW50IHRl
c3RpbmcgaGFzIGJlZW4gZG9uZSAocGFzc2luZyB0aGUgVnVsa2FuIGNvbmZvcm1hbmNlIHRlc3QN
CnN1aXRlIHdpbGwgZ2l2ZSB1cyBlbm91Z2ggY29uZmlkZW5jZSkuIEFzIGxvbmcgYXMgd2UgZG9u
J3QgYWRkIHRoZSBjb21wYXRpYmxlcw0KaW50byB0aGUgYHN0cnVjdCBvZl9kZXZpY2VfaWRgIHRh
YmxlIGluIHRoZSBkcml2ZXIsIHdlIHNob3VsZCBiZSBmaW5lIGluIHRoaXMNCnJlZ2FyZC4NCg0K
U29ycnkgaWYgdGhpcyBjb25mbGljdHMgd2l0aCBhbnl0aGluZyBNYXR0IGFscmVhZHkgc2FpZC4g
V2UncmUgc3RpbGwgdmVyeSBuZXcgdG8NCndvcmtpbmcgd2l0aCB0aGUgdXBzdHJlYW0ga2VybmVs
IGFuZCBhcmUgYmVpbmcgY2F1dGlvdXMgdG8gYXZvaWQgYW55IG1pc3Rha2VzDQp0aGF0IG1heSBj
b21lIGJhY2sgdG8gYml0ZSB1cy4NCg0KPiA+ID4gPiBhZGFtDQo+ID4gPiA+IA0KPiA+ID4gPiBb
MV0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ZyYW5rYmlubnMvbGludXgtZmlybXdh
cmUvLS90cmVlL3Bvd2VydnIvcG93ZXJ2cj9yZWZfdHlwZT1oZWFkcw0KPiA+ID4gDQo+ID4gPiBb
Ml0gLSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZnJhbmtiaW5ucy9saW51eC1maXJt
d2FyZS8tL2NvbW1pdC9mZWNiM2NhZWJmMjlmMzcyMjFmZTBhMjAyMzZlNWUxNDE1ZDM5ZDBiDQo+
ID4gPiANCj4gPiANCj4gPiBUaGlzIGlzIG5vdyB0aGUgcGxhY2UgdG8gZ2V0IHRoZSBmaXJtd2Fy
ZSBmb3IgZGV2aWNlcyB0aGF0IGFyZW4ndCB5ZXQgc3VwcG9ydGVkDQo+ID4gdXBzdHJlYW06DQo+
ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ltYWdpbmF0aW9uL2xpbnV4LWZpcm13
YXJlLy0vY29tbWl0cy9wb3dlcnZyLz9yZWZfdHlwZT1IRUFEUw0KPiA+IA0KPiBJJ3ZlIGJlZW4g
Zm9sbG93aW5nIHNldmVyYWwgb2YgdGhlc2UgcmVwb3MgYW5kIGNoZWNraW5nIGZvciBzb2Z0d2Fy
ZQ0KPiB1cGRhdGVzIGluIGJvdGggdGhlIEZpcm13YXJlLCBkcml2ZXIgYW5kIHVzZXJzcGFjZSBs
YXllcnMuDQo+IA0KPiA+IFdpdGggdGhlIGZpcm13YXJlIGZvciB0aGUgUmVuZXNhcyB2YXJpYW50
IG9mIEdYNjI1MCBiZWluZyBmb3VuZCBpbiB0aGlzIGNvbW1pdDoNCj4gPiBodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvaW1hZ2luYXRpb24vbGludXgtZmlybXdhcmUvLS9jb21taXQvZmVj
YjNjYWViZjI5ZjM3MjIxZmUwYTIwMjM2ZTVlMTQxNWQzOWQwYg0KPiA+IA0KPiANCj4gSWYgeW91
ciBncm91cCB0aGlua3MgdGhleSBoYXZlIHN0dWZmIHRoZXkgd2FudCB0ZXN0ZWQsIEkgYW0gd2ls
bGluZyB0bw0KPiB0ZXN0IHRoZW0gb24gdGhlIHR3byBwbGF0Zm9ybXMgSSBoYXZlIGlmIEkgYW0g
Q0MnZCBvbiBhbnl0aGluZy4NCj4gDQoNClRoYW5rIHlvdSBmb3IgdGhlIG9mZmVyLCB0aGF0IGlz
IHZlcnkgbXVjaCBhcHByZWNpYXRlZCENCg0KRG8geW91IGhhcHBlbiB0byBrbm93IGlmIHRob3Nl
IHBsYXRmb3JtcyAob3Igb25lcyB3aXRoIHRoZSBzYW1lIFNvQyBpbikgYXJlDQphdmFpbGFibGUg
Zm9yIHB1cmNoYXNlPw0KDQo+IFRoYW5rcyBmb3IgdGhlIHdvcmsgeW91ciBncm91cCBoYXMgZG9u
ZSBzbyBmYXIuICBJdCdsbCBiZSBuaWNlIHRvIHNlZSB0aGUgd29yay4NCj4gDQoNCk5vIHByb2Js
ZW0gYXQgYWxsIDopDQoNClRoYW5rcw0KRnJhbmsNCg0KPiBhZGFtDQo+IA0KPiA+IFRoYW5rcw0K
PiA+IEZyYW5rDQo+ID4gDQo+ID4gPiA+ID4gVGhhbmtzIGFnYWluIQ0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9maXJtd2FyZS9saW51eC1maXJtd2FyZS5naXQvDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gR3J7
b2V0amUsZWV0aW5nfXMsDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJbiBwZXJzb25hbCBjb252ZXJz
YXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0
DQo+ID4gPiA+ID4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
