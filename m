Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798C82FEC0
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 03:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7DB10E0B5;
	Wed, 17 Jan 2024 02:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC3410E0B5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 02:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705458162; x=1736994162;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=2i2dwHnYuOahxD1uAsoCzbOTY+Ya1JTrbuJ08IrnHEQ=;
 b=Sp68KnUSzqnec4YCKgwclUqV9fdafuVeqrrOgFeO5pvPajAqOoRho1uH
 791lHRVrL7mHx5oQHmwB8IKDM0cXMMdszdYfTvEnd0S41X9ugFj7pHl04
 H4er09mPpFV9bvzYZ2BKHgsFWSY//YekhEfkj9BtLOjHLMPJLvDtYBZat
 pp23o5VBJB4oHP0yJdCcqVrGihnxGSgO80jT2zrOb4ZOydl2nElnk62mh
 +Dm1gScf6UAYCFRQObWYrBqDTXJsrpYBKCOu9ZcAxKy4o5NYmcC2NPdIs
 8pCMaHLh4i28ycvFsoT7ks5MvX5Ei4ma3jBlYf/KnyNyrQ7aqInZJNu3Q w==;
X-CSE-ConnectionGUID: IMOTNjQBTzC7XtT7MIIPWQ==
X-CSE-MsgGUID: KuUoy48LQqSMRWpqx4xasw==
X-IronPort-AV: E=Sophos;i="6.05,200,1701154800"; d="scan'208";a="182075418"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2024 19:22:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 19:22:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 19:22:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d13qAdkkjtdxHQ3ZMLyOX7X5zPx6jCHmTuSrMa+kWNsggZp2OANrLOyU2zBV0VCndmO+1aFDhoM3FFEPWEcxkYxy0aFnggCLjTKb88MnW1hGpTbsqK7FnTmCJ1YaNGb0qCMxtEB+lA25+At7m+btevSfN+kn/PLv35ctdJxUfGRpwoBh65HyBDrrWqLREXfueoGWsG+R8hi7nEUEEs007jxv8uhKLag79ZKPiz3b22wcgHuEInHUDcE3IiQjaM4MWEcLp8kFo4c0y4W921xGYQ0lnkGDme1QFdP3mLRrqckaxaClTiz6Hd46vePSdsdSD3JCuIWN56P2fLqeCC+2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i2dwHnYuOahxD1uAsoCzbOTY+Ya1JTrbuJ08IrnHEQ=;
 b=LI72xUawiNXZQK7UKpNE0yKQ5bx4r8MLD5lqBLR2txuFFBzANkFaGYw99yk3jU9jRN+GrHa5rq8FD5CR9LR98gqSOwkkHwUnYmiibFEh6sMVPl7sxmzeFH6h+vYyUGfb0Mo735Kwx+wEJ0fowNDLBoGARX/xSc5YDCp83uoj/ex7Uj3toE3VJZz5V7rP7NBHc+teigFSX/XasTKt/g02aWeeN0zGni4oUV1Nug62J1gXoHFemm3XpYs7Tl3z3jisb0anCU82ZwzSkGpXFI4Be9o1UpaAuU3O3tobvUVUmQ0m1h+3LIfEKnIeDKGcGlBB7ew5Cej3at1yyu1eDYS10Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i2dwHnYuOahxD1uAsoCzbOTY+Ya1JTrbuJ08IrnHEQ=;
 b=rZDQLfptJ19MsqJ7SCfsrsYIgKMNCiiI9L/OOf+hzKqYYhJbRkocbBqkApOh5DTydMaKwI+hdBkKAeTE+ACpbrKTVDgjwmogmcSBBEzs81oIvGwELlFIRIPE37OHYN1rfw8qJcLcmJnfYTkI098cAScwUIbn36gFRZ6MU/b4Qyh+DNkEq3H+StUqx1t0dtEDO9jpH4XFcFvkI0lUdK8SE+gddLoBOmPXnTpfnrwGXZVrlhX3Xco7ApcyvWnEmnRbYt1vUxI0v7tUxXrEq2ppJgqwHkiqx5dPqGc66ZFsS2jCj25MBVm4mPSc4k5H3PrqZfjSss2lfi6Rf0wrmOTrJQ==
Received: from BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Wed, 17 Jan
 2024 02:22:38 +0000
Received: from BL3PR11MB6436.namprd11.prod.outlook.com
 ([fe80::96fe:b914:e84a:73fc]) by BL3PR11MB6436.namprd11.prod.outlook.com
 ([fe80::96fe:b914:e84a:73fc%6]) with mapi id 15.20.7181.027; Wed, 17 Jan 2024
 02:22:38 +0000
From: <Dharma.B@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <sam@ravnborg.org>,
 <bbrezillon@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <lee@kernel.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <linux-pwm@vger.kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT schema
 format
Thread-Topic: [PATCH 2/3] dt-bindings: mfd: atmel, hlcdc: Convert to DT schema
 format
Thread-Index: AQHaQ6+DDeklb90Sy0qUe1mJSbBgM7DTVpiAgAn6HIA=
Date: Wed, 17 Jan 2024 02:22:38 +0000
Message-ID: <a59fe94a-feac-439e-a93d-3a90f7d05de5@microchip.com>
References: <20240110102535.246177-1-dharma.b@microchip.com>
 <20240110102535.246177-3-dharma.b@microchip.com>
 <683b7838-9c19-4a51-8ec4-90ac8a8a94ce@linaro.org>
In-Reply-To: <683b7838-9c19-4a51-8ec4-90ac8a8a94ce@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6436:EE_|CO1PR11MB5073:EE_
x-ms-office365-filtering-correlation-id: f25e2b3c-ceff-48a6-3b10-08dc17032cba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VNx2SANWEksKeeQscv8Ph8r89z9Pizt+4sklh7AuT1Tfx04QT7cmjtN6SBIT4NiIQBUQj0Zb21nsGgwHngIRhB9Om/hkVyhnS4BFI38Lu4LSrUzrDioVsBcQMyFcO3XyyztOyDClApo9eaYnbxpZFXTfPBzAC6+qqhMuxZcZ4ibIDmuqdbGhR4BLfJZF4fEptWTR3QekrSNPpiCMSnaDH0mBxnszQ9Dx+HJZAJhZGFs0vzkj1GT0jcddgjjbP1nB0OBTNd+TugjoU6MR4hbi7clSFn1mjV48bf5XRf2SdSafuxzyKIeXWO5V05XOPwvJ1SW8+qD0FxT7nQVwzfnmcSe9fw11NTxVZBAgQD9QCnNKkQgBjNwhLAAq/gQLmElR5iNXnfB1gYjA/3pHiom09NynKIxJ0mrofzmkgw9EN6FD/mE0hqzfcfRJNf+7IljwbwvAF7sBsK4kNkmjpRdVxzOx43y0mG7gCDW73Wu1iGvZRgZC1nT3xVsBbKAfE1khXPE3Lrry9PVEtKvKoECyuw7Upbv7Fy/eiMddCAh0sAr5MuBqyD7r/iM1GBk4NUQYWjyGbiAS8UpEorI7aFCczF3x4HFhvoJKWtN7XR9QOx71HAqZmL4tcPtyeIQjFjt9k1S0fwMeDdXBR3dg8D3G1D4y76y+qyNqiXOXBUV2lyl5FuAFw0PNTtOUvaM2jVZ2LmCkoMBejCjd0Xtatl+wsW9IUB41oh1kP9VHaBumoFI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6436.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(136003)(39860400002)(366004)(230173577357003)(230922051799003)(230273577357003)(1800799012)(64100799003)(186009)(451199024)(8936002)(966005)(8676002)(7416002)(64756008)(66476007)(66446008)(5660300002)(66556008)(2906002)(6486002)(26005)(76116006)(71200400001)(2616005)(36756003)(31696002)(86362001)(110136005)(66946007)(91956017)(316002)(921011)(31686004)(478600001)(53546011)(6506007)(6512007)(41300700001)(38100700002)(122000001)(83380400001)(38070700009)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azFUdDFsYlJJYnBpemp3S3cyeno4RnIrcHh5OGJoeE9wTFVhWEJHMnNwUzRW?=
 =?utf-8?B?cHJuK0VHMERUc24xdHQ4NVljVktMYkRlQUVwbldzQ1FmTHM5UnhyU28rVUVT?=
 =?utf-8?B?QTloZEJ0K3M3ZVQxVkJ4eUpxVVlxK0xKOWNHb3RaYXYycU16ZHppYlMrUTRD?=
 =?utf-8?B?QWRCeEhWMUJLS3BQcEduSEI5K3pKNWlraDV6QThlMjVtamdFc3NEWGhQL2FD?=
 =?utf-8?B?MmJ6TUlxTWZrb0pJczlVOHpweUxtWnJpNS84MUNzL1RLK0pQQWQxZ0RpTGh3?=
 =?utf-8?B?ZWh5TWtpcmQ2Z3dSMnRoV0dadkp3QUowallQQmI5RTlEbHV4aWIwVzJ4cmg5?=
 =?utf-8?B?M1p2aEJQZG9JVkxQdnhNZ0F4Z29ESWJkOXNLclpPTmRqRG92bnNQZ2k4azRE?=
 =?utf-8?B?N2dheHkyNitWRUJHdlJ1OUUvbmlNZVZDd1ZWa3lIejNlWk9abHUvWC9WSENI?=
 =?utf-8?B?OGNPR1NoVXE2VW91dGpWZ1ZQOGpaQlBPWnJoQy96NXFXWWFIQUxkRU9vTzV6?=
 =?utf-8?B?WGc0Nzc3Y2lVRzVxekJzTUE5UkRZeWh0YTFPd3ZmRVJnV0ptNm44d1NHOG83?=
 =?utf-8?B?bEdyb0MyV3duUEp2ajV3UTYycUV1SHJZYUFkUEpiUlBGa3hNOW1XNWNlb0J3?=
 =?utf-8?B?KzdGQ1paRG4wZ3Q0QzlDZ2xXekFRald5YjNHTSs0dEw1K3EzOXpuOUt0ZGtj?=
 =?utf-8?B?eWRPcFR0a0IrYUFWZlJUam9ScUFEZ1owNDdpczJ2OGEvVGpMejJaSnptSlhz?=
 =?utf-8?B?aWxlT3ViR1l0cGJYWnU3UlYwZCtEM2lWbER4MWZ4dW5Ja2xacE9UbDFQa3Bz?=
 =?utf-8?B?TEtjMDZSUWdiQ0hqKzRYL2tTdnErbXNEMk5zeUM4QVhLVmxyZTFxSml0QUJU?=
 =?utf-8?B?OVpwT1BOd01ySmJQenoyTWRZcUpaQW5udGtveXVwWjkyOE5Fa3liNEgyYUtX?=
 =?utf-8?B?aWNpMkptaE5VOGp5TXZ3UTJDMUJIdnFENm85M2UwcTZ6TVNwVVdtU0hIN08z?=
 =?utf-8?B?VGFLU2U3TUpUcnlWU0ppNDlEUGlVUjQwdDl1RzJsVlpEazdzaGZua3VFZE10?=
 =?utf-8?B?aFpaZUZmL21NOTVmRk1ITWNrMk9ZdHV6emM1Ym0vMUpPYSs1aU5qdlE1QnJP?=
 =?utf-8?B?OCt2L05relpRNEpoWjJ4V2trSVIyV05RZW94eUoySUZVVEdqQVJQTFQyM3lY?=
 =?utf-8?B?V2ZNYVFrOHBrS0xQSEhScGhkYzdmV2Y5L3pQSURORE5yQ2lKbU1yYVNYS1hC?=
 =?utf-8?B?N3kyUUdDSDNXRytoNWptSzFzK3k1b0tEbnR2TVVMMTF3bVFTZVpxVWZWVVpD?=
 =?utf-8?B?OVpuZ3VCZmxkVnlpYUdLdGdRUUZjKytIeDVDeTgvQkNWOUljVDhqZG9reGgx?=
 =?utf-8?B?YzV1UHR4S0pkeVJWTFJFTVBGLzNmYWp4L2hJT2NDUFFXeVNjdmFycnp0dTRs?=
 =?utf-8?B?ZjZGbzhqMjFvWjhmUGlmY29Zb0c4NXkvejVaS2kwMkZuenByTS9ZUklBcWdW?=
 =?utf-8?B?dE1BNFdXSzFhM1ZIVEYwaHZkTkgxMmc5aFJVL1hmdEpZbW1lZXZvUnZPaUdJ?=
 =?utf-8?B?RndPcXFOUFM3cGxTZFpWTzFycnRsT1hHcmtIckRhbDYwNlJwSkxEbHQ5ZGgr?=
 =?utf-8?B?cFRsMFprZGNLblJPUTAwRDBrL1VqV3E3ZUlxdXFtazhyOWRiS28yWk50QjNk?=
 =?utf-8?B?WXJnYmJtT3AwbFgyNkh4VVdhUklJZGQwSXZjYjJHalpWWTVYd3dTekh1NXhR?=
 =?utf-8?B?VGtRbDVmb0U3OE5ST2ZpUjhqRDJiWXhoYzMxcHZQRVhqdHphaWI0SWg4SWEz?=
 =?utf-8?B?L2dLQ3kvNERvMGQ1a1EyRjloRU9aMXFxTHVncUQ3ZHNJeEw1YVY3anNBWDJW?=
 =?utf-8?B?QXUrRHhDL3lFQXQxcU1KNG9pUlZiRjJ0b3ovTlc4dS9Oa2V1M21LR1pudVpQ?=
 =?utf-8?B?WmZHMzVVbmpwTWRlOWNWYmpScm0zWmU2YkduWC9KdVBuRktDclVYUTk3YVVJ?=
 =?utf-8?B?RUtpMzJ3SUwwNzQzU29WUjBjd0tsSDY0bi9FMUk0LzFiVDFTbnVDbFExK3ZN?=
 =?utf-8?B?ekRHNzU2cmFheURBUTNDeGVKcjRlb2ZHQ2twaU9kQlRWUGN0S2RIajVsOTI3?=
 =?utf-8?Q?V/zvVD4R4lyx3hEUHxz0Pj5dM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA8EDC78869E5A4FA8423F9E91FDEB7A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6436.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25e2b3c-ceff-48a6-3b10-08dc17032cba
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 02:22:38.2218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ljxKndTZI+I4jEImfvtNtgU3vCQ7TdAd/JilNuJoXfbE93txpooSIkHV0yBL5vaLHQfjwtaUbx1+a2VoqpIYgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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

SGkgS3J6eXN6dG9mLA0KT24gMTAvMDEvMjQgMTE6MzEgcG0sIEtyenlzenRvZiBLb3psb3dza2kg
d3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gMTAv
MDEvMjAyNCAxMToyNSwgRGhhcm1hIEJhbGFzdWJpcmFtYW5pIHdyb3RlOg0KPj4gQ29udmVydCB0
aGUgYXRtZWwsaGxjZGMgYmluZGluZyB0byBEVCBzY2hlbWEgZm9ybWF0Lg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhhcm1hLmJAbWljcm9jaGlwLmNvbT4N
Cj4+IC0tLQ0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwsaGxjZGMueWFt
bCAgfCAxMDYgKysrKysrKysrKysrKysrKysrDQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21mZC9hdG1lbC1obGNkYy50eHQgICB8ICA1NiAtLS0tLS0tLS0NCj4+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAxMDYgaW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pDQo+PiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2F0bWVsLGhsY2Rj
LnlhbWwNCj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZmQvYXRtZWwtaGxjZGMudHh0DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwsaGxjZGMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwsaGxjZGMueWFtbA0KPj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTU1ZDZmYWE5MTA0DQo+PiAt
LS0gL2Rldi9udWxsDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWZkL2F0bWVsLGhsY2RjLnlhbWwNCj4gDQo+IFRoaXMgbG9va3Mgbm90IHRlc3RlZCwgc28gbGlt
aXRlZCByZXZpZXcgZm9sbG93czoNCkkgYWNrbm93bGVkZ2UgdGhhdCBJIGRpZG4ndCB0ZXN0IHRo
ZSBwYXRjaGVzIGluZGl2aWR1YWxseS4gSSBhcHByZWNpYXRlIA0KeW91ciB1bmRlcnN0YW5kaW5n
LiBUYWtlbiBjYXJlIGluIHYyLg0KPiANCj4+IEBAIC0wLDAgKzEsMTA2IEBADQo+PiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQ0KPj4gKyMgQ29w
eXJpZ2h0IChDKSAyMDI0IE1pY3JvY2hpcCBUZWNobm9sb2d5LCBJbmMuIGFuZCBpdHMgc3Vic2lk
aWFyaWVzDQo+PiArJVlBTUwgMS4yDQo+PiArLS0tDQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9tZmQvYXRtZWwsaGxjZGMueWFtbCMNCj4+ICskc2NoZW1hOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+ICsNCj4+ICt0aXRsZTog
QXRtZWwncyBITENEQyAoSGlnaCBMQ0QgQ29udHJvbGxlcikgTUZEIGRyaXZlcg0KPiANCj4gRHJv
cCAiTUZEIGRyaXZlciIgYW5kIHJhdGhlciBkZXNjcmliZS9uYW1lIHRoZSBoYXJkd2FyZS4gTUZE
IGlzIExpbnV4DQo+IHRlcm0sIHNvIEkgcmVhbGx5IGRvdWJ0IHRoYXQncyBob3cgdGhpcyB3YXMg
Y2FsbGVkLg0KRG9uZS4NCj4gDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAtIE5pY29s
YXMgRmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT4NCj4+ICsgIC0gQWxleGFuZHJl
IEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPg0KPj4gKyAgLSBDbGF1ZGl1
IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPj4gKw0KPj4gK2Rlc2NyaXB0aW9u
OiB8DQo+PiArICBEZXZpY2UtVHJlZSBiaW5kaW5ncyBmb3IgQXRtZWwncyBITENEQyAoSGlnaCBM
Q0QgQ29udHJvbGxlcikgTUZEIGRyaXZlci4NCj4gDQo+IERyb3ANCkRvbmUuDQo+IA0KPj4gKyAg
VGhlIEhMQ0RDIElQIGV4cG9zZXMgdHdvIHN1YmRldmljZXM6DQo+PiArICAjIGEgUFdNIGNoaXA6
IHNlZSAuLi9wd20vYXRtZWwsaGxjZGMtcHdtLnlhbWwNCj4+ICsgICMgYSBEaXNwbGF5IENvbnRy
b2xsZXI6IHNlZSAuLi9kaXNwbGF5L2F0bWVsL2F0bWVsLGhsY2RjLWRjLnlhbWwNCj4gDQo+IFJl
cGhyYXNlIHRvIGRlc2NyaWJlIGhhcmR3YXJlLiBEcm9wIHJlZHVuZGFudCBwYXRocy4NClN1cmUs
IEkgd2lsbCB0cnVuY2F0ZSB0aGlzIHRvICJzdWJkZXZpY2VzOiBhIFBXTSBjaGlwIGFuZCBhIGRp
c3BsYXkgDQpjb250cm9sbGVyLiIgJiBkcm9wIHRoZSB8Lg0KDQpJIGFkZGVkIGRlc2NyaXB0aW9u
IGFib3V0IHRob3NlIHR3byBzdWJkZXZpY2VzIGJlbG93Lg0KPiANCj4+ICsNCj4+ICtwcm9wZXJ0
aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+ICsgICAgZW51bToNCj4+ICsgICAgICAtIGF0bWVs
LGF0OTFzYW05bjEyLWhsY2RjDQo+PiArICAgICAgLSBhdG1lbCxhdDkxc2FtOXg1LWhsY2RjDQo+
PiArICAgICAgLSBhdG1lbCxzYW1hNWQyLWhsY2RjDQo+PiArICAgICAgLSBhdG1lbCxzYW1hNWQz
LWhsY2RjDQo+PiArICAgICAgLSBhdG1lbCxzYW1hNWQ0LWhsY2RjDQo+PiArICAgICAgLSBtaWNy
b2NoaXAsc2FtOXg2MC1obGNkYw0KPj4gKyAgICAgIC0gbWljcm9jaGlwLHNhbTl4NzUteGxjZGMN
Cj4+ICsNCj4+ICsgIHJlZzoNCj4+ICsgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICsgIGludGVy
cnVwdHM6DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+PiArICBjbG9ja3M6DQo+PiArICAg
IG1heEl0ZW1zOiAzDQo+PiArDQo+PiArICBjbG9jay1uYW1lczoNCj4+ICsgICAgYW55T2Y6DQo+
PiArICAgICAgLSBpdGVtczoNCj4+ICsgICAgICAgICAgLSBlbnVtOg0KPj4gKyAgICAgICAgICAg
ICAgLSBzeXNfY2xrDQo+PiArICAgICAgICAgICAgICAtIGx2ZHNfcGxsX2Nsaw0KPiANCj4gT2xk
IGJpbmRpbmcgd2FzIG5vdCBtZW50aW9uaW5nIHRoaXMgYW5kIHlvdSBkaWQgbm90IGRlc2NyaWJl
IGRpZmZlcmVuY2VzDQo+IGFnYWluc3QgcHVyZSBjb252ZXJzaW9uLiBZb3UgaGF2ZSBlbnRpcmUg
Y29tbWl0IG1zZyBmb3IgdGhpcy4uLg0KRG9uZSwgYWRkZWQgY29tbWl0IG1lc3NhZ2UgaW4gdjIu
DQo+IA0KPj4gKyAgICAgIC0gY29udGFpbnM6DQo+PiArICAgICAgICAgIGNvbnN0OiBwZXJpcGhf
Y2xrDQo+PiArICAgICAgLSBjb250YWluczoNCj4+ICsgICAgICAgICAgY29uc3Q6IHNsb3dfY2xr
DQo+PiArICAgICAgICBtYXhJdGVtczogMw0KPiANCj4gV2h5IGl0IGhhcyB0byBiZSBzbyBjb21w
bGljYXRlZD8gSSBkb3VidCB0aGF0IHNhbWUgZGV2aWNlcyBoYXZlDQo+IGRpZmZlcmVudCBpbnB1
dHMuDQpJIHdpbGwgbW9kaWZ5IGl0IHRvDQogICBjbG9jay1uYW1lczoNCiAgICAgaXRlbXM6DQog
ICAgICAgLSBjb25zdDogcGVyaXBoX2Nsaw0KICAgICAgIC0gZW51bTogW3N5c19jbGssIGx2ZHNf
cGxsX2Nsa10NCiAgICAgICAtIGNvbnN0OiBzbG93X2Nsaw0KaW4gdjMuDQo+IA0KPj4gKw0KPj4g
KyAgaGxjZGMtZGlzcGxheS1jb250cm9sbGVyOg0KPiANCj4gRG9lcyBhbnl0aGluZyBkZXBlbmQg
b24gdGhlIG5hbWU/IElmIG5vdCwgdGhlbiBqdXN0IGRpc3BsYXktY29udHJvbGxlcg0KR290IGFu
IGVycm9yICInaGxjZGMtZGlzcGxheS1jb250cm9sbGVyJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2Yg
dGhlIA0KcmVnZXhlczogJ3BpbmN0cmwtWzAtOV0rJyIgc28gSSByZXRhaW5lZCBpdCBpbiB2Mixi
dXQgYXMgY29ub3IgYWR2aXNlZCANCnRvIGhhdmUgbm9kZSBuYW1lcyBnZW5lcmljIGFuZCB3ZSBj
YW4gZWFzaWx5IGFkb3B0LCBJIHdpbGwgbW9kaWZ5IGl0IGluIHYzLg0KPiANCj4+ICsgICAgJHJl
ZjogL3NjaGVtYXMvZGlzcGxheS9hdG1lbC9hdG1lbCxobGNkYy1kYy55YW1sDQo+PiArDQo+PiAr
ICBobGNkYy1wd206DQo+IA0KPiBTYW1lIGNvbW1lbnQuDQpTdXJlLCBJIHdpbGwgbW9kaWZ5IGl0
IGluIHYzLg0KPiANCj4+ICsgICAgJHJlZjogL3NjaGVtYXMvcHdtL2F0bWVsLGhsY2RjLXB3bS55
YW1sDQo+IA0KPiBUaGVyZSBpcyBubyBzdWNoIGZpbGUuDQpUaGlzIG9jY3VycmVkIGJlY2F1c2Ug
SSBhZGRlZCBpdCBiZWZvcmUgcHdtIHBhdGNoLiBJbiB2MiwgSSBpbnRyb2R1Y2VkIA0KJ2Rpc3Bs
YXknIGFuZCAncHdtJyBiZWZvcmUgJ21mZCcgc28gdGhhdCBJIGNvdWxkIHJlZmVyZW5jZSB0aGVt
IGhlcmUuDQo+IA0KPj4gKw0KPj4gK3JlcXVpcmVkOg0KPj4gKyAgLSBjb21wYXRpYmxlDQo+PiAr
ICAtIHJlZw0KPj4gKyAgLSBjbG9ja3MNCj4+ICsgIC0gY2xvY2stbmFtZXMNCj4+ICsgIC0gaW50
ZXJydXB0cw0KPj4gKw0KPj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4gKw0KPj4g
K2V4YW1wbGVzOg0KPj4gKyAgLSB8DQo+PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9j
ay9hdDkxLmg+DQo+PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9kbWEvYXQ5MS5oPg0KPj4g
KyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5o
Pg0KPj4gKw0KPj4gKyAgICBobGNkYzogaGxjZGNAZjAwMzAwMDAgew0KPiANCj4gTm9kZSBuYW1l
cyBzaG91bGQgYmUgZ2VuZXJpYy4gU2VlIGFsc28gYW4gZXhwbGFuYXRpb24gYW5kIGxpc3Qgb2YN
Cj4gZXhhbXBsZXMgKG5vdCBleGhhdXN0aXZlKSBpbiBEVCBzcGVjaWZpY2F0aW9uOg0KPiBodHRw
czovL2RldmljZXRyZWUtc3BlY2lmaWNhdGlvbi5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvY2hh
cHRlcjItZGV2aWNldHJlZS1iYXNpY3MuaHRtbCNnZW5lcmljLW5hbWVzLXJlY29tbWVuZGF0aW9u
DQpEb25lLg0KPiANCj4gDQo+PiArICAgICAgY29tcGF0aWJsZSA9ICJhdG1lbCxzYW1hNWQzLWhs
Y2RjIjsNCj4+ICsgICAgICByZWcgPSA8MHhmMDAzMDAwMCAweDIwMDA+Ow0KPj4gKyAgICAgIGNs
b2NrcyA9IDwmbGNkY19jbGs+LCA8JmxjZGNrPiwgPCZjbGszMms+Ow0KPj4gKyAgICAgIGNsb2Nr
LW5hbWVzID0gInBlcmlwaF9jbGsiLCJzeXNfY2xrIiwgInNsb3dfY2xrIjsNCj4gDQo+IE1pc3Np
bmcgc3BhY2UgYWZ0ZXIgLA0KU3VyZSwgZml4ZWQgaW4gdjIuDQoNCi0tIA0KV2l0aCBCZXN0IFJl
Z2FyZHMsDQpEaGFybWEgQi4NCj4gDQo+PiArICAgICAgaW50ZXJydXB0cyA9IDwzNiBJUlFfVFlQ
RV9MRVZFTF9ISUdIIDA+Ow0KPj4gKw0KPj4gKyAgICAgIGhsY2RjLWRpc3BsYXktY29udHJvbGxl
ciB7DQo+PiArICAgICAgICBjb21wYXRpYmxlID0gImF0bWVsLGhsY2RjLWRpc3BsYXktY29udHJv
bGxlciI7DQo+PiArICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPj4gKyAgICAg
ICAgcGluY3RybC0wID0gPCZwaW5jdHJsX2xjZF9iYXNlICZwaW5jdHJsX2xjZF9yZ2I4ODg+Ow0K
Pj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+PiArICAgICAgICAjc2l6ZS1jZWxs
cyA9IDwwPjsNCj4+ICsNCj4+ICsgICAgICAgIHBvcnRAMCB7DQo+PiArICAgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+Ow0KPj4gKyAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4+ICsg
ICAgICAgICAgcmVnID0gPDA+Ow0KPj4gKw0KPj4gKyAgICAgICAgICBobGNkY19wYW5lbF9vdXRw
dXQ6IGVuZHBvaW50QDAgew0KPj4gKyAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4+ICsgICAgICAg
ICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVsX2lucHV0PjsNCj4+ICsgICAgICAgICAgfTsN
Cj4+ICsgICAgICAgIH07DQo+PiArICAgICAgfTsNCj4+ICsNCj4gDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KPiANCg0KDQoNCg==
