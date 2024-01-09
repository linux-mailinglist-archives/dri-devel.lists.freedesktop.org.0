Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F4682835E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 10:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0251B10E38B;
	Tue,  9 Jan 2024 09:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6182010E3A6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 09:41:04 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4098U2Bt032649; Tue, 9 Jan 2024 09:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=MChJDc6I3ucO9NjHoKuQcdzaVGN2tFX/XpW+YKOGP6U=; b=
 V+Fkq1HMdm0URcDL4389PQlULG9eLCg2fr1tNiUhT133wp7ONq69FKePX5Z9Vmqk
 ng9uESyWZc0Qn39AGuw6PclbPup9pKOSTBXvNLIasIKjO2xHMIadHictShlGEMuB
 Srud8dTOppXi8w4M1zcbiLBpq7v4NrWSIIAuM7Qr42/G3CQ0vyPSDi7MXSxoJBjI
 OAHe3M4sycJ5v+5lHvw7ha1o1fViTUpWq0HzwYEjL2H2+s68C+yxrVyY2it/Bs5j
 JHPxvY5FUGqCeSsvVmIQQxXFLxMcNWC1fUeSQU7LBJ2O4kZJlFO2WoYLojSoxYUy
 FufeWwbXvYUhzzOFvCaoHg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3veytw25cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 09 Jan 2024 09:40:14 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 09:40:07 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 09:40:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxTwk6vjbt2IOpcQ4SSVv23o73W5ngEKuJHpV/DSeasXhp3ea+sEdUYHmYAzMQHLJJe39R2n5DXzgtdWrfPzA0fBSYk0jIr4ojfg8pMWOF9TQ4TA7yg/D9U9hGq3YijSDhobLUQzwmir3zQeVoCYBeNmEwvnvWuYdG36swE4n/JGPnTQ68abQFDOGFihxxapmuxwilvE+D4Mi2wSA9qrxeb+Ww+2USXBsy2elMzuA6k+B9peg0rSNIa4qDud/1/qb3fDm3dB33gvp1byboxWWjyA7tiUgshBj0jwcw83xk56GqHskB5ALCFn/mcP5Hiqx2XbwNrX/jXpzIFUiOQAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MChJDc6I3ucO9NjHoKuQcdzaVGN2tFX/XpW+YKOGP6U=;
 b=jL96fCmOxaxmyMrWqvptK13QQftfd41xrmx6dhUPlyKyBjc8khoHwLwdIMOFXbDK6MrEV0Pkr4uvteTo8ADQjhOZDMXs2VzWNdSeFdfnzg+Swr8DIPhaoTWblBBdXbUejJr8GogSeq5JlaGM7CqTDpWTJIoQd2fhGRcHjrBKBPGLMA5ZHkOEJBmVxERsnp2J2ouwd47PsA+fF8adPylgxOSK1+jUxkUHKrEtAK6NRv4YFEQF+UkluYtCXOBKKoBjFYp3F4t98mJvaOujXi9Y3IE+gOK64rbTv2nLhskxfWNhwM3jt2nW6To1rm16gqLpC03YZVHxv2pWzS0FSNZwXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MChJDc6I3ucO9NjHoKuQcdzaVGN2tFX/XpW+YKOGP6U=;
 b=pHTVbhB7RB65V9HR7cxprF6mHmafjbqNeiAjOlkHsUMS0S6pUJzuW7scnpdCBG7J2lwl54Ybrh+4JsCl5YlY3HW47pnYqk2IwhQEAz1Lequ8U2sHPY0hJ8RNi0EJ0izPWdKi6yZVrEwsHzk6hfm09E6zT9PRSV1PIF77ucMvjHU=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB5633.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Tue, 9 Jan
 2024 09:40:03 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba%3]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 09:40:03 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "kristo@kernel.org"
 <kristo@kernel.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "hns@goldelico.com" <hns@goldelico.com>, "afd@ti.com" <afd@ti.com>,
 "paul@crapouillou.net" <paul@crapouillou.net>, Matt Coster
 <Matt.Coster@imgtec.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "aford173@gmail.com" <aford173@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "tony@atomide.com" <tony@atomide.com>, "wens@csie.org" <wens@csie.org>,
 "ivo.g.dimitrov.75@gmail.com" <ivo.g.dimitrov.75@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bcousson@baylibre.com"
 <bcousson@baylibre.com>, "nm@ti.com" <nm@ti.com>, "samuel@sholland.org"
 <samuel@sholland.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>
Subject: Re: [PATCH RFC v2 01/11] dt-bindings: gpu: Rename img,powervr to
 img,powervr-rogue
Thread-Topic: [PATCH RFC v2 01/11] dt-bindings: gpu: Rename img,powervr to
 img,powervr-rogue
Thread-Index: AQHaQt/SLL1By6l7H0ymh5Pz9Pc+cg==
Date: Tue, 9 Jan 2024 09:40:03 +0000
Message-ID: <c7d3d992c7a6c4f4141769b16818a977a868755a.camel@imgtec.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-2-afd@ti.com>
In-Reply-To: <20240108183302.255055-2-afd@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB5633:EE_
x-ms-office365-filtering-correlation-id: 31534562-b0fb-405c-3eb4-08dc10f6f4a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HZMnMdjy+3ldB2Hm6d6IiIFpv8Hp7XAFAwHfPidoX7oIYVhQS9qugHv72QODYYzif8/WKPZgpoTIqS8zwXHdC70Xwdt/ZH4v5eBNErZ/2WT/3bHBwpcVCwvoGoSbcHS7kUoMxCVuowDYYMKrjyao1VeVabNQard5GJcYS7qGdLKcXqNetkeG9OcIoFhlXbIw3RbEiaZyE89RYWfIJ+Lc9ufINE2oUetccb4Nx3uy715EX1LWAfVK4jP9JMQmElsqb01M3HiJqPer7TEhPavQqn05S/C4T5gCpywZSiANMexBraav4wqLUsXJIoU7jzAsrX5875xTb1yFtv9vPaVMjsW7BirjwaUgBNWdWaq1JYm0gYKrDBZWz3VE04SnX2/sn0pJlmvjTxDOXx9qafSZNygYe/YbZY2qBK7iGg18XCugFkHNDWbBNc3or6MBVZ+wuaI8yWS153I96WiAnR1Szf3oApFm2f40Hv7hAhlxpvhy1l8uy+wEu3CkJBl5nJWApgIuKxqpVJbAGIVsgxvuWRQ5J/6PUplSF0sL6pXUtAFkhJqZU1BA2NfGRT+bqTvqYRqcvmdmoMCwLZuTSahg0FOtRfigJnik65ndAiM1gpFdsCIekEO9OsLCrw7WvH5G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(376002)(346002)(396003)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(7416002)(5660300002)(2906002)(86362001)(38100700002)(966005)(478600001)(38070700009)(36756003)(122000001)(6486002)(83380400001)(2616005)(6512007)(26005)(6506007)(71200400001)(316002)(8936002)(4326008)(8676002)(76116006)(41300700001)(54906003)(110136005)(921011)(66946007)(64756008)(66476007)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWs0T1FQRENWMlRGVkhVejgrMldSTUgvK285cEFPdlBiUXp4d1dxUzYwWmhI?=
 =?utf-8?B?Mm9OVjdTTUVKUVlkcFhXbDhPcXlKR2JDam9ydDNVUE54Y3B1MW1CMHJFM3dR?=
 =?utf-8?B?a2N0N1FJOTNwNDgwZUhqVFEyZEMyZHBRKzB4dVhUdXR0QVR5eExJWjB6Sjcz?=
 =?utf-8?B?OFpHTlJJZHUzK2pZeEtWVGJYNkt6cXJRTVdpdmtlRFdGSmVrT2d4aHJBNEhM?=
 =?utf-8?B?K2krTEEwbW44NXlRemh4LzRjRXg3N3lPc0o0bVE4b3l3Y2tWWUovY2lSM3NB?=
 =?utf-8?B?d3RkR2s1YkFmMFB5bC9Nc2Y5a1Z3SVBUcWtxeHEyNUlyN0I4VE1YWFMrN1Y5?=
 =?utf-8?B?TXdhR0kzUnFmV2d2Y013VUJvWE1kZDNaclpkWWNINFNJYnFZSTFST2piWDZ1?=
 =?utf-8?B?TWVSYkFkeGcyUExpVlJ1RGlETjhzcEtSZU5kWUVjYnB3WUZ1SWI1dk5CNDQx?=
 =?utf-8?B?VCtoZHZwdW1ia1NzR0FueGU2cVJUWDZCYnM2Mk5xYnFpd0t0bXd6aEpBYVJK?=
 =?utf-8?B?emo4UTdZcjBpUVdyUGlhU1NZNkVpSmM4QTVUNkxQVXZTajVBODVWcjhjK0tV?=
 =?utf-8?B?bVRNZVRuSDVzbExRQ2JQV3FJWjVkV1FsRThtVnlWVCtiS3V4bVFJenkydk9G?=
 =?utf-8?B?K2JIekdaQmNMMEhmbVBPSGxBK1JvRGFPTjhlMWF2Q28vT0lLNmsvMUNkK0VI?=
 =?utf-8?B?alZ2R3N2dkFJSzdNcXVKR3l0SXdMTkQ5Wmw0aDJzbml6Skl0aTloOXZWWmNN?=
 =?utf-8?B?M29aY3A5S0Z2Q2FaZnhEcndnSTllYVUyamNlSVQvUzVjU0pWZGdNZW12bWdt?=
 =?utf-8?B?RlhZTkQzNFE5WFEwYW5walhncVkvSjJ6bk1IcFA5TXRvTnJjaTM1NWs4Mm1y?=
 =?utf-8?B?Rzl2Z01wbTdVWmx0alRsQlVXTVhoQnl3R214QVlUcjd5QmM3NGlGQUk3ZitE?=
 =?utf-8?B?bW1pc1hzSUFBTkJOMlhTck1FMUYyVjJsajQvWTFaQjRqODd0ZTVIVG94SnUv?=
 =?utf-8?B?VnIrTVRsd21LQzN5U2FQeUErTE5EUGlNZmZZV0t6VUZxM3RSb0dkZmx4eW1Z?=
 =?utf-8?B?dVhjcGU5S3poelZ3MERPcFkrZGxMUXBCQ0E0TEdtU1FUT21IVXl5RnE0OVZD?=
 =?utf-8?B?QkhMOE1KNEtFVlFMTVIzQkNDVnQvQ2NoQ0UxMVBjZ3NBdGJSMEJ2cVFEaUFR?=
 =?utf-8?B?YytmUlMwZGVJQXBIdjdTV2F2Z2I3MkpmUW5UMGc5b3VUN2V1QmZQVjh4dWRO?=
 =?utf-8?B?eHhYamk2SXZtZDFYT29UTlNvMU5YdGFGcVBlc1J1VzM5MHUwdEcyblpnM2F0?=
 =?utf-8?B?dnpGbTgzZWNaUENKak9TbkZxdm1NSVdOWTU1MlptMVRnUDIrZURkbnJibVFS?=
 =?utf-8?B?Qjk5dzl1bkxGc2N4cFRUUHVjN1dXVmsrS2NiRFRkK2FqelBZVU9zYUZFcU1h?=
 =?utf-8?B?aGRISUpBRzQrVzNsN2NrWlJYWmlGcjNka2JmWWExZDRxdnIva1kyKzFpUTNX?=
 =?utf-8?B?dzA0dnNKdU5QWHpXQ2c2ZzRKU3VmcHp4N2VHaGZjaVp2Y1RtUjZFdFBoZ3I1?=
 =?utf-8?B?SUlTazJydWhxMS9BZ0YzeUlFUVJiUmtMamtXUzhOaDhSWDhqM00xNEthaGFL?=
 =?utf-8?B?NjA4L0ttb0ZTNWVBOXVJbkFYM3c5STRKd3VFOE91aVlsYWhlYWlYbEF2bnZO?=
 =?utf-8?B?ckNSZHZhTVdDaHVsVFRjVHZRcVBNWW5UTk94MktrTVhwTmw4c2tOaEx6S2Rz?=
 =?utf-8?B?aWZhZGJDMmpPUTlEYk9Sc1JCUDhkOE13RDYzeXVNQzZKVC9kK1lGeXJoRWRS?=
 =?utf-8?B?L0lQTVFBVVRKODZsQXE2Q001SEJnUGF3U0lQL2MyVUlVNzdOdllhMGllZkFn?=
 =?utf-8?B?NjlVbmh3cERGdjd3RmZFY3J0b2Rwc1I4OTBUK3dRdkZFVUZuWEUxVlk1QXox?=
 =?utf-8?B?VG5GaTc1Z05tbmMwS0owRzFHTTMxRWd2ZndMZjlwU2MyZ1Y2anFNMGhJUk0v?=
 =?utf-8?B?YU55dEZ3RmFMS0tVSnFUeDFEMlJLVEt1dG4vVnRMRmlwcFU0UHpiYm5lcFNF?=
 =?utf-8?B?TlR1V01OMmZ2RndOVVJuNUtBYm43ZzB6UFZTY2JPMkM3R0JrYStoZngxRm9S?=
 =?utf-8?B?YTJ3bDNjZDh2azhIM3BxdzJFK3VYTmVFSmQvZmVuUS82VWNpREp5alBSaGZh?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2F1F2AD91B26848BBD945484FA4C919@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 31534562-b0fb-405c-3eb4-08dc10f6f4a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 09:40:03.1494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cUGRfr4yNhSXF3l30odZVUuEpaxmEcEvNMgBa+9NW+JA3QoL95L4JP1UjZHKKrHPlMYVZ4cSenzwB4x7zpcA0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5633
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: bDpXwkvTKg2VeqjQlSlKmB0-RUS1Suxt
X-Proofpoint-GUID: bDpXwkvTKg2VeqjQlSlKmB0-RUS1Suxt
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmV3LA0KDQpPbiBNb24sIDIwMjQtMDEtMDggYXQgMTI6MzIgLTA2MDAsIEFuZHJldyBE
YXZpcyB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IERhdmlzIDxhZmRAdGkuY29tPg0K
PiAtLS0NCj4gIC4uLi9iaW5kaW5ncy9ncHUve2ltZyxwb3dlcnZyLnlhbWwgPT4gaW1nLHBvd2Vy
dnItcm9ndWUueWFtbH0gfCA0ICsrLS0NCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstDQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gIHJlbmFtZSBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L3tpbWcscG93ZXJ2ci55YW1sID0+IGltZyxwb3dl
cnZyLXJvZ3VlLnlhbWx9ICg5MSUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcscG93ZXJ2ci55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcscG93ZXJ2ci1yb2d1ZS55YW1sDQo+IHNpbWlsYXJp
dHkgaW5kZXggOTElDQo+IHJlbmFtZSBmcm9tIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ncHUvaW1nLHBvd2VydnIueWFtbA0KPiByZW5hbWUgdG8gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcscG93ZXJ2ci1yb2d1ZS55YW1sDQo+IGluZGV4IGExMzI5
OGYxYTE4MjcuLjAzYTgzMDhiNDFhZTcgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnIueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwNCj4gQEAg
LTIsMTAgKzIsMTAgQEANCj4gICMgQ29weXJpZ2h0IChjKSAyMDIzIEltYWdpbmF0aW9uIFRlY2hu
b2xvZ2llcyBMdGQuDQo+ICAlWUFNTCAxLjINCj4gIC0tLQ0KPiAtJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9ncHUvaW1nLHBvd2VydnIueWFtbCMNCj4gKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvZ3B1L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwjDQo+ICAkc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gIA0K
PiAtdGl0bGU6IEltYWdpbmF0aW9uIFRlY2hub2xvZ2llcyBQb3dlclZSIGFuZCBJTUcgR1BVDQo+
ICt0aXRsZTogSW1hZ2luYXRpb24gVGVjaG5vbG9naWVzIFBvd2VyVlIgUm9ndWUgYW5kIElNRyBH
UFVzDQoNCkFsbCB0aGUgR1BVcyB0aGF0IHdpbGwgYXBwZWFyIGluIHRoaXMgZmlsZSB3aWxsIGJl
IFJvZ3Vlcywgc28gZm9yIG1lIGl0IHdvdWxkIGJlDQptb3JlIG5hdHVyYWwgZm9yICdSb2d1ZScg
dG8gY29tZSBhZnRlciAnSU1HJy4gQ2FuIHlvdSBjaGFuZ2UgdGhlIHRpdGxlIHRvOg0KDQpJbWFn
aW5hdGlvbiBUZWNobm9sb2dpZXMgUG93ZXJWUiBhbmQgSU1HIFJvZ3VlIEdQVXMNCldpdGggdGhh
dCBjaGFuZ2VkIGFuZCBKYXZpZXIncyBzdWdnZXN0aW9ucyBhZGRyZXNzZWQ6DQpSZXZpZXdlZC1i
eTogRnJhbmsgQmlubnMgPGZyYW5rLmJpbm5zQGltZ3RlYy5jb20+DQoNCj4gIA0KPiAgbWFpbnRh
aW5lcnM6DQo+ICAgIC0gRnJhbmsgQmlubnMgPGZyYW5rLmJpbm5zQGltZ3RlYy5jb20+DQo+IGRp
ZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IGZhNjdlMjYyNDcy
M2YuLjViMjA1Nzk1ZGEwNGUgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJTDQo+ICsrKyBiL01B
SU5UQUlORVJTDQo+IEBAIC0xMDQ2MSw3ICsxMDQ2MSw3IEBAIE06CURvbmFsZCBSb2Jzb24gPGRv
bmFsZC5yb2Jzb25AaW1ndGVjLmNvbT4NCj4gIE06CU1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBp
bWd0ZWMuY29tPg0KPiAgUzoJU3VwcG9ydGVkDQo+ICBUOglnaXQgZ2l0Oi8vYW5vbmdpdC5mcmVl
ZGVza3RvcC5vcmcvZHJtL2RybS1taXNjDQo+IC1GOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLnlhbWwNCj4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbA0KPiAgRjoJRG9jdW1lbnRh
dGlvbi9ncHUvaW1hZ2luYXRpb24vDQo+ICBGOglkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24v
DQo+ICBGOglpbmNsdWRlL3VhcGkvZHJtL3B2cl9kcm0uaA0K
