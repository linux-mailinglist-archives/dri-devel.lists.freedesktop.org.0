Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC0784F815
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 16:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DFE10F57E;
	Fri,  9 Feb 2024 15:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="ZkpFn1SG";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="CygK9fJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C5810F57E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1707490961; x=1739026961;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lYokME3f6fPbXOKwN55gyhgDLlT7HrM6rBabLRJJeWw=;
 b=ZkpFn1SGBkrLoTSkUN62i8TQyHqIX/B81jUcKIx6xGq7kmyJ+9byANXB
 D6Cc0nXkt/gY2F/x90dTnLV1VT5bj2mOYTqKUGtPtTWqFPlSPP5nDthG7
 qu0+3nH41vA5lr28kY0TpIu5UdZbPQ1mADPOWmcetgT3vh7UpQK8DaRVN
 jlYFTqq4FFiE+DsA29SLo4ZYgRv4tsQM9c/VSkbDXLjkB0rij6RlEK1Pw
 FMse1rj4qmIRV80cPLRw7ezDBV5t10+9KJamNlFCGXx21ObqkyCl0nGOp
 DGeVX/5BhiC9D1A602mLW2/0WuJ9u+7vlbGccUYdVmipy8+nYrYitiLxT A==;
X-CSE-ConnectionGUID: DsYh7giESS2UWA4Kh92jMw==
X-CSE-MsgGUID: ao7hGwEuTku3PZ++QiBGZg==
X-IronPort-AV: E=Sophos;i="6.05,257,1701154800"; d="scan'208";a="246750269"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2024 08:02:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 08:02:29 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 08:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEHvZ5spg3UsvTp9mouYzM77LIdf6RQrSUY41pycaIDeruU384264wMbOO6RqNkYfnXViky3H8OECaqUJpXozXcWEdUL00UUCKI5gOwA3jZzjg4GPRWvZV2cgW96QC4sxtvZ+b0rIcibUfUfo4XQslOtmw/BDTGq3HCb5aph+9nmDxHnM7FXRufuf31wrBCfa/rNwWUV8c/yiHq7NkzQAStbyBs8umcNDqQ3wHjWUrANbTRj+fL0B2GGtztbbi/i43zJ9FMVwBTjcb2UHzalj2Zlj7ymG4mACuh8+ESBRSH6uOmI6EnNgyetTvRhCJ8EPS1LeA8pHk7RyRZiFbL4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYokME3f6fPbXOKwN55gyhgDLlT7HrM6rBabLRJJeWw=;
 b=lXUFlxeNN6R+oBSxyBHciwePOS2LHlEURBCiy1VUNE4zr/UUW06sbjrcUWPhhL8dw4zCAIKRnaR5pozE2jkrVq0aYdIEWJ3VoaB0rKD59bv38vDyrRXYNY3t5SyKmw0er5yxmSf5aFeE8CDkE1O4HPogzR1X/mQnrk1QT2cc9Ua+sPlgmAQ0+aSl/Y+iKIRrVOXFqeyaAG0Y1fswNG0LQExTgLinejp8NwiAxQbDET12rAJAi0QUcWVmQRLp2+2Jm0V/59IBKriT8hOvZoCHxSczgOk8Z/DaY7t3P03kfs7q+BsnN5nhqTVrfLKdcXBsaa81DExXveLD6pkJQrgf6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYokME3f6fPbXOKwN55gyhgDLlT7HrM6rBabLRJJeWw=;
 b=CygK9fJF9LxIexpoDu9dOW9gi7FVcw1e8zqhdzW5JmFVbUiSWvcbaNT+nrhbsR30DTdPhSK7slM4BFXFPTCfM7n4Pqb7LwUU3BorQy7cMXHq4uun2yrsTMCyYUVKL3eRR6gEgglBEqQ5FXqp5ErIZ+j3rjgc6f7+upcglVvMHfAP4p19r4OdZmFjUiLNyjV+28tFe3HbT3Z759woNu+uB8B80kNvVain5HJxtihNcpdqNZNF9ycrAswy8vSHii3lfVXjLVYJvXyfWNFKyGsLTV6+oyMl2EGSZL7iclv7uSF/SjSIga/pD6olVwWqTbadND6RqnaaFk79lFaSd2kzAg==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by DM3PR11MB8734.namprd11.prod.outlook.com (2603:10b6:8:1af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Fri, 9 Feb
 2024 15:02:26 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7270.025; Fri, 9 Feb 2024
 15:02:26 +0000
From: <Dharma.B@microchip.com>
To: <krzk@kernel.org>, <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, 
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <Manikandan.M@microchip.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux@armlinux.org.uk>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <geert+renesas@glider.be>, <arnd@arndb.de>, <palmer@rivosinc.com>,
 <akpm@linux-foundation.org>, <gerg@linux-m68k.org>, <rdunlap@infradead.org>,
 <vbabka@suse.cz>, <linux-arm-kernel@lists.infradead.org>
CC: <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: bridge: add sam9x75-lvds
 compatible
Thread-Topic: [PATCH v3 1/4] dt-bindings: display: bridge: add sam9x75-lvds
 compatible
Thread-Index: AQHaWbBvihkf+H6rV0avboHB5Zg4D7EAJ24AgAHrcwCAAAu5gA==
Date: Fri, 9 Feb 2024 15:02:25 +0000
Message-ID: <c82a3843-1b58-46ea-994a-8350544aa30d@microchip.com>
References: <20240207102802.200220-1-dharma.b@microchip.com>
 <20240207102802.200220-2-dharma.b@microchip.com>
 <2219df60-7235-4c37-b79c-25e7225cb7a9@kernel.org>
 <b314e446-e79c-4fa0-9b86-c58fa96133bc@microchip.com>
In-Reply-To: <b314e446-e79c-4fa0-9b86-c58fa96133bc@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|DM3PR11MB8734:EE_
x-ms-office365-filtering-correlation-id: f8ccd4e5-3b09-406d-8530-08dc298020a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UsZnUkYrUR4xW2BqiTlRt0VIAUnLb4T/+yUvN+Ca23rOZ/7aKYl6xV2RUTRIeTCkLw0smRlR0foWTHfBWs5K6xkzel6daY3UB7l9BbLtlyrx9pPPgnrgVBjwK6DDAQ3ROf+EUTRmMi8KQruNKJGCy1EB7shJQhRdpuJCrmKu16bj457Unc6r4FS+U1eOXrULemtcmhaXTN8rxr2sW2+M/69/6XEOv4hZ3VXVJI0/4F5cskNt81HoUdtbWHTTbd0TS6OjV9EmJJV7P3OuEIepobR3M+bqbaN/wJSjQgemtuq5nt0l5ZbK6FzIyxZN3gF11+I/RjrsBF0LCr0zrkrJhaepG6nQP4fejACu2OCNsEseC5G/WvOlxFFVTGViJ5fpcpv53KG/bEVRSfPS2Ap1GDvVlLSgILTfg2afVBRKxw4DEsSsnthmrXjjY4LVt70OgtKG8X2Fcrv41hQi3/0XYDmmZMiwm8CcU07g/0B5Iox1V7isGnnMfGG4NSfHtyJqmKScre/nSYzWXEczrPaIDNPvmFe3gaBEikM28I0I+3egOPCg0LKokFhx9NEb4VOIC8krHAzQtGqvhnbx1V7fS0T3TwDqVvOjw7R6kJgNZPJqcIJ3/AqnJfnIMZ8aiyl9zZTJRdsS4HWcd7rCJ9qxCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(39860400002)(376002)(230922051799003)(230273577357003)(64100799003)(451199024)(1800799012)(186009)(41300700001)(86362001)(36756003)(66946007)(6486002)(76116006)(66446008)(8936002)(478600001)(66476007)(110136005)(6512007)(66556008)(8676002)(71200400001)(4326008)(91956017)(38070700009)(316002)(64756008)(53546011)(26005)(38100700002)(31696002)(2616005)(6506007)(122000001)(921011)(7416002)(2906002)(31686004)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnBlTlI3QWNreTBXUlZIUUhGb2puamJhVG9taUpOaGp5aGJSNHFWWTU2WHRF?=
 =?utf-8?B?WlVFbDlUOXhPZGR2WFJhbWhRTHIxeHUzbWFiWUJYeGxkS2NsSnVXRlNPYkNq?=
 =?utf-8?B?Z0xCa1hxK1NmODVKMUl5ZzBKQ1UzVzNOdUtySTZFZEtScVhzNS9rRGszYWRq?=
 =?utf-8?B?OGVCcUJsMzRVVlVSZjlTSHZHTmpsL2t0WFRwVmN0T1N6VjZrRlFOYXlWZjc5?=
 =?utf-8?B?WlQ0QWVhTUFkWi92Rmk0emJucnBGZlc1K2pYVUkvc0llQ1hmblB2MmVldHJW?=
 =?utf-8?B?TXlIWXRDRi83K0lheUNOdVgwTjNzMm1rQVlzdEwrVTFTanlvTUN2bDVtVGcx?=
 =?utf-8?B?UnZvZ0pXRWlmZkdvaHBkUHFEWDdGN2N3YTlaZ0Q4MnZqL1pSRW12YytUN3Vn?=
 =?utf-8?B?NzgyRkpZZ0IwdXF2SFQvVktqdEt3SElqTlJNYnB2bm5UZVhmNVV2aWRLWDVt?=
 =?utf-8?B?UW5nSElEQ00yRWdkNlFzRUpMcjY4Q1RhQ2I0UkxlUGlXS05BcUFEQmtiRnFE?=
 =?utf-8?B?Qm12dFo5cTlUbUdqNVRSTFdkc0U5UlcwWlA0MS8yakxDWUJGUXg5ZXNaNG1s?=
 =?utf-8?B?WHYrcm1CMUdyMU00Kyt2a2dtS0RHWWJ4c3MvbzMxWkZDQ2VPTlE5ZjdkYXJZ?=
 =?utf-8?B?M214UFhNbHQ3YkZodjBhUUNXWUY1eE5mdHJkT2liNzliVlAxZG1RRXlrQ096?=
 =?utf-8?B?NlNMQnpVRkZxMnFaaTFwNzJPK05Hdi9heUVmMUNGc0JpNVhNck1xaG5QK200?=
 =?utf-8?B?WnowRmtTL21wb3JvVGNwSkdkb2hKclc5YWNlVFNRUlMxNHhxNU12VEhSdGR5?=
 =?utf-8?B?K0Rud3B5U0YwanJLTjRMbkRob2VvYWExbTBIWkMrWklsY21JcFFUWi9FZzRr?=
 =?utf-8?B?ODdFa3A3bnorcVZXSk5OYW1iVDZhNURvREFUNysrVVFEQ1IzbUoxbE9KK2Jm?=
 =?utf-8?B?Q0hyalJQdStvTWo5WGVrOUlNMEhENThsTFBkdy9sVGtzV2xXL0RiRExBdVZt?=
 =?utf-8?B?QlRVb3pLS1RiWlkzR3pZc1dBOFBHcFpzbTNnbHdSM2twcXlSczNzb2JwZi95?=
 =?utf-8?B?YWVuSnhyYVlvV2Rhd3ZaNVNSa1NmZnJlQktFLzBBamJiZEpqUVZtdGhzaDRt?=
 =?utf-8?B?STIySi9kbTBiVlpBbEZaS21KKzRTVXVPblZjVVp2V1hkOHd2MHhBYWgyMEEx?=
 =?utf-8?B?eUV6dXEyaFRwSSs4RStyNWJ0TE1JbHR3OVJ5bkhuVWtWOEtWRkQ5TG5ld2Z1?=
 =?utf-8?B?ZWcvQkJkRmxRaW9tOHB2VWZIbW8ycHowQ01tbnZxb1NNUVNQM0t6ZVRaemQ4?=
 =?utf-8?B?SVdrd0RET3YxQWRhUkJQb0Q0SnVMUksxaDlERjNsNFZBSG5MT0RXUWd4elRF?=
 =?utf-8?B?MlBIOUtjZC9OWkVOMUkvdm9STHBCRnZIeUIxUUtRZ0JtZTBuU01aWVdpSUVT?=
 =?utf-8?B?THIyeElIc29UZ29yNG5LWkMzdTFCNDZ0SCtUaHBZNVZBWUZOOTVqUE1BYk1E?=
 =?utf-8?B?ZjlMNUFOcmMvSERCd0JkOG1UZjZiZDBsT1lOMTVLbzN2TW4xelZIZlV2UUUx?=
 =?utf-8?B?SUJMN2xnb0FicnpVcHZIV2Z4QmRJUkZKdGhSN0IwclU5ZWZpN0plQlRURTBq?=
 =?utf-8?B?dVJTRHZpR3duaGc3K1FDNmJGWEN4RFFtNytZdmp4MFQvdzJHdFJWVDQ3bzg2?=
 =?utf-8?B?NW9PZ3M3NUNPOG9FRzhaMjRTQVU0Vll1OVIwOUtjcVVyb0pQVzVKRFFZMis2?=
 =?utf-8?B?NXc4cWdHeVJzd3owc0hVRlpRd296RWZmVGMxZFNyakRwaC9oUFhTSDBDZis5?=
 =?utf-8?B?eTZEK1pPL1ZYTXkrUm9Ma1RVenlkVVB6RjNrS2N1eW41NW9oVHlZWjVEOUxI?=
 =?utf-8?B?RHVLdHFZYUQrMEVDVTMrbUZNWjl6N3RNcWZHV09neHg3Mjlvd3AwcHZWVXF1?=
 =?utf-8?B?SWJWV3FZSUZOWVlKYnppOVl3TENPYW5FelRoemhtL0lBbm1WT2I4eGw2em9G?=
 =?utf-8?B?MzZaTjN0VlJIb3hRc1FlWjlSQkVOVWhDZ1FwenMrNldMN1kybHlKdTBvb0Zi?=
 =?utf-8?B?RVh0U3pvaGZNYzNleGxESEkwVTR4dnNHK0tZVmRGbGE4NUxnVWF4cnFrSEdZ?=
 =?utf-8?Q?y0fQGXXR8xrx9GW2wWNYZ4Xu5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF4A90EA106D2E409D7F1648A643AAA7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ccd4e5-3b09-406d-8530-08dc298020a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 15:02:25.8495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0uBNJ2cJo2F99nbkyElTNvt94jp6UORidW5X1/DffE3CFXNwE89kD4usQa8IIPovy+RYE63U56zFp4gX25Ejiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8734
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

T24gMDkvMDIvMjQgNzo1MCBwbSwgRGhhcm1hIEIgd3JvdGU6DQo+IE9uIDA4LzAyLzI0IDI6MzEg
cG0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IA0KPj4gdGhl
IGNvbnRlbnQgaXMgc2FmZQ0KPj4NCj4+IE9uIDA3LzAyLzIwMjQgMTE6MjcsIERoYXJtYSBCYWxh
c3ViaXJhbWFuaSB3cm90ZToNCj4+PiBBZGQgdGhlICdzYW05eDc1LWx2ZHMnIGNvbXBhdGlibGUg
YmluZGluZywgd2hpY2ggZGVzY3JpYmVzIHRoZSBMb3cgDQo+Pj4gVm9sdGFnZQ0KPj4+IERpZmZl
cmVudGlhbCBTaWduYWxpbmcgKExWRFMpIENvbnRyb2xsZXIgZm91bmQgb24gc29tZSBNaWNyb2No
aXAncyANCj4+PiBzYW05eDcNCj4+PiBzZXJpZXMgU3lzdGVtLW9uLUNoaXAgKFNvQykgZGV2aWNl
cy4gVGhpcyBiaW5kaW5nIHdpbGwgYmUgdXNlZCB0byBkZWZpbmUNCj4+PiB0aGUgcHJvcGVydGll
cyBhbmQgY29uZmlndXJhdGlvbiBmb3IgdGhlIExWRFMgQ29udHJvbGxlciBpbiBEVC4NCj4+Pg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhhcm1hLmJAbWljcm9j
aGlwLmNvbT4NCj4+DQo+PiBOb3QgdGVzdGVkLi4uDQo+Pg0KPj4gUGxlYXNlIHVzZSBzY3JpcHRz
L2dldF9tYWludGFpbmVycy5wbCB0byBnZXQgYSBsaXN0IG9mIG5lY2Vzc2FyeSBwZW9wbGUNCj4+
IGFuZCBsaXN0cyB0byBDQy4gSXQgbWlnaHQgaGFwcGVuLCB0aGF0IGNvbW1hbmQgd2hlbiBydW4g
b24gYW4gb2xkZXINCj4+IGtlcm5lbCwgZ2l2ZXMgeW91IG91dGRhdGVkIGVudHJpZXMuIFRoZXJl
Zm9yZSBwbGVhc2UgYmUgc3VyZSB5b3UgYmFzZQ0KPj4geW91ciBwYXRjaGVzIG9uIHJlY2VudCBM
aW51eCBrZXJuZWwuDQo+Pg0KPj4gVG9vbHMgbGlrZSBiNCBvciBzY3JpcHRzL2dldF9tYWludGFp
bmVyLnBsIHByb3ZpZGUgeW91IHByb3BlciBsaXN0IG9mDQo+PiBwZW9wbGUsIHNvIGZpeCB5b3Vy
IHdvcmtmbG93LiBUb29scyBtaWdodCBhbHNvIGZhaWwgaWYgeW91IHdvcmsgb24gc29tZQ0KPj4g
YW5jaWVudCB0cmVlIChkb24ndCwgaW5zdGVhZCB1c2UgbWFpbmxpbmUpLCB3b3JrIG9uIGZvcmsg
b2Yga2VybmVsDQo+PiAoZG9uJ3QsIGluc3RlYWQgdXNlIG1haW5saW5lKSBvciB5b3UgaWdub3Jl
IHNvbWUgbWFpbnRhaW5lcnMgKHJlYWxseQ0KPj4gZG9uJ3QpLiBKdXN0IHVzZSBiNCBhbmQgZXZl
cnl0aGluZyBzaG91bGQgYmUgZmluZSwgYWx0aG91Z2ggcmVtZW1iZXINCj4+IGFib3V0IGBiNCBw
cmVwIC0tYXV0by10by1jY2AgaWYgeW91IGFkZGVkIG5ldyBwYXRjaGVzIHRvIHRoZSBwYXRjaHNl
dC4NCj4+DQo+PiBZb3UgbWlzc2VkIGF0IGxlYXN0IGRldmljZXRyZWUgbGlzdCAobWF5YmUgbW9y
ZSksIHNvIHRoaXMgd29uJ3QgYmUNCj4+IHRlc3RlZCBieSBhdXRvbWF0ZWQgdG9vbGluZy4gUGVy
Zm9ybWluZyByZXZpZXcgb24gdW50ZXN0ZWQgY29kZSBtaWdodCBiZQ0KPj4gYSB3YXN0ZSBvZiB0
aW1lLg0KPiANCj4gQXBvbG9naWVzIGZvciB0aGUgb3ZlcnNpZ2h0LCBzb21laG93IGl0IGdvdCBt
aXNzZWQuDQoNClRoZSBnZXRfbWFpbnRhaW5lci5wbCBzZWVtcyB0byBiZSBpbmNvbnNpc3RlbnQg
d2l0aCB0aGUgcmVzdWx0cy4NCg0KbGludXgkIC4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAq
cGF0Y2ggfCB3YyAtbA0KLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsOiBmaWxlICcwMDAwLWNv
dmVyLWxldHRlci5wYXRjaCcgZG9lc24ndCANCmFwcGVhciB0byBiZSBhIHBhdGNoLiAgQWRkIC1m
IHRvIG9wdGlvbnM/DQozMQ0KbGludXgkIC4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAqcGF0
Y2ggfCB3YyAtbA0KLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsOiBmaWxlICcwMDAwLWNvdmVy
LWxldHRlci5wYXRjaCcgZG9lc24ndCANCmFwcGVhciB0byBiZSBhIHBhdGNoLiAgQWRkIC1mIHRv
IG9wdGlvbnM/DQoyOQ0KbGludXgkIC4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAqcGF0Y2gg
fCB3YyAtbA0KLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsOiBmaWxlICcwMDAwLWNvdmVyLWxl
dHRlci5wYXRjaCcgZG9lc24ndCANCmFwcGVhciB0byBiZSBhIHBhdGNoLiAgQWRkIC1mIHRvIG9w
dGlvbnM/DQozMA0KbGludXgkIC4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAqcGF0Y2ggfCB3
YyAtbA0KLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsOiBmaWxlICcwMDAwLWNvdmVyLWxldHRl
ci5wYXRjaCcgZG9lc24ndCANCmFwcGVhciB0byBiZSBhIHBhdGNoLiAgQWRkIC1mIHRvIG9wdGlv
bnM/DQozMA0KDQpBbnl3YXksIEkgd2lsbCBhZGQgdGhlIGxhcmdlc3QgcmVjaXBpZW50cyBsaXN0
IGluIHY0Lg0KPj4NCj4+IFBsZWFzZSBraW5kbHkgcmVzZW5kIGFuZCBpbmNsdWRlIGFsbCBuZWNl
c3NhcnkgVG8vQ2MgZW50cmllcy4NCj4gDQo+IEkgd2lsbCByZXNlbmQgdGhlIHNlcmllcyBpbmNs
dWRpbmcgYWxsIG5lY2Vzc2FyeSBUby9DYyBlbnRyaWVzLg0KPiANCj4gVGhhbmtzLg0KPj4NCj4+
DQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiBLcnp5c3p0b2YNCj4+DQo+IA0KDQotLSANCldpdGggQmVz
dCBSZWdhcmRzLA0KRGhhcm1hIEIuDQoNCg==
