Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5EB83128C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 06:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C03810E13E;
	Thu, 18 Jan 2024 05:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6333D10E13E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 05:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705557064; x=1737093064;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=cEqdnPnf4HYrzcgFVm/7di/GOvEt3IIr54iyIJFCg9c=;
 b=toceBvVDR6YoblWq2VgyrIKeHTyW1iSGDmyML4Z1AnsXNYL4ijegGPYV
 TIKWFjz3XZMB+VqhrzskWwm75feAB5/BzdDg8b6tS3nhIpkvMANhmg/tA
 /kH34Pi17JYZYneDOVOuTDZC52TsgTKFLZhLUQXGy0AeeR+n9TxtkuSQF
 Po3ITJ6qvTohxIxJxMdRkVZZCbIBH7fCCFN18Qen9btbEyQY5uG9HBWoQ
 mIWYYJ4HNJ+yxYVQUs24pF8vGnNa7bpMizdV2rzmAR498tlkMMUpzcBdR
 rPxt+df+r+udS+T9qcoqdJNEM0NiBKapnyPCORa98ZjgYWLNCdduMWfcL Q==;
X-CSE-ConnectionGUID: WQ76XdzIT5KmW24LymELGw==
X-CSE-MsgGUID: EoFZfwZHQi+9BcB+hAPq6A==
X-IronPort-AV: E=Sophos;i="6.05,201,1701154800"; d="scan'208";a="182158580"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2024 22:50:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 22:50:33 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 22:50:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7m+WT9HAVMsmCMx6frDDU0CPQJdao6J8uIUb/DNpulJWMPq27lexyklfeDfP8yT4EP0B35H+QGkPr0VWw/UtHCm5aMqVze0nhWEaJHUPzDMikqvm9VueOzVxae52g18d68OwEpNRS7jYcopMg5ew/QqCuZE8GGxqbashyp0x9H8QBnAYiNB/7JorR+Chv1BQOyNJTzg1KXb3AcA1gLvJBnno4Vb3OKCXkW0NbDXv8fVT2RSERmHIs3AccyKzKJl+j1iAwydFnSgCC5ZbW4va1gAvumYiVvH/X0WCVZEacnNPb7YBC/IZOJsI34M+k3vf26PBo8HjkdMKLwOilwC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEqdnPnf4HYrzcgFVm/7di/GOvEt3IIr54iyIJFCg9c=;
 b=Gc0vqP9oHc3K26q/DT+bSKLAvyu5luzfTJ4ncA4z7+qlndeb0fm1YmQqgVOraAJ5qI98Bb07MEeqnBUPVn6OixVTLcVsJNG9bBzOpOcZIgyFILs9Vwi2DP1WE7rUq8Sr05IdLUEJ73Y9nWNdTD2FDu3290Ry9uL8EdynLpG0iRQ/NN7iR5ihEQ9oqRoyUTXYrmIT2iGaKbPzB8XMk7Kbc1Ihr75ex+JamJO3OxJcUwHMpojNM/drhqW6AeEi8kXe2JYMZlVq+3n4iBZN+Q9NFBvvjdiM9mkRzcxd5QM/i/FfZ/IC6MX9JCYO8ECL9LASAsG5GeMp3fkrvpbr3190sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEqdnPnf4HYrzcgFVm/7di/GOvEt3IIr54iyIJFCg9c=;
 b=GeI6wfJ3RkURRzDyu00nnv0HAzm5YcbcD5yrp4cfm1JknLYVqO8/Rl+UacCLz5PDOjo8JzaRWknmrI6hmFIyM/knBxemxlI37AKcxsjubhBaM4q0SALyJWgQvQECcpYpKFVOB7/4o6h1vrayiTUJASWwE3LYqjlHW9xTwrWar5jsL/XU9bTRSEiom2rPmdWKGIkNG6TWY5sx1Uf+UAz2wNwVmQAklHlcSqeXqLtet7RGgcpRXCbZ0hCjTaH3rZ7t17uHv9O47iJR8myqCpr04qGmOaJsXy2kOfJySWKCK2yIPbVjlzI0b32Mc+QqDN6XD/LIcGPp29UEXvilezxpCQ==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by DS7PR11MB6269.namprd11.prod.outlook.com (2603:10b6:8:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Thu, 18 Jan
 2024 05:50:29 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 05:50:29 +0000
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
Thread-Index: AQHaQ6+DDeklb90Sy0qUe1mJSbBgM7DTVpiAgAn6HICAAFf8AIABdGqA
Date: Thu, 18 Jan 2024 05:50:29 +0000
Message-ID: <551c6be6-9d48-4891-ad17-12e3c64cca8b@microchip.com>
References: <20240110102535.246177-1-dharma.b@microchip.com>
 <20240110102535.246177-3-dharma.b@microchip.com>
 <683b7838-9c19-4a51-8ec4-90ac8a8a94ce@linaro.org>
 <a59fe94a-feac-439e-a93d-3a90f7d05de5@microchip.com>
 <5b39c702-c74e-4cd5-accf-b6b8792e65b2@linaro.org>
In-Reply-To: <5b39c702-c74e-4cd5-accf-b6b8792e65b2@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|DS7PR11MB6269:EE_
x-ms-office365-filtering-correlation-id: b0dad323-b6da-4f1f-886d-08dc17e96095
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 052cLspJMkdjJuQKPzNyFR5yOCmWn1H+1dmylwCLF0VDw/H4Nxwmy/NC2+Ha46oFzHNO3F2AddM4UeYN9Eh0Z35xuDELrNWIkOFhxQQQANH/szRQ5/bzO9NZwdNorCtzuTLqVfHmc0JeHH02cdJ7Y41fLAN6RRpNs+o7H22flIG8TYXG5QtYH+SLqDvjccbvlRm3aRJwqO2fDupTsR2fJdl7iTwHf6XS/aZ7S58Yq36OtYMShOAgEFV6hrrLrGqrrMJOfu0T1DLKh4a4u9NVCr/eS22LD3rrOETQU6OCSJbOSl6Js+X5ruypXqWxhtJik1N0F7METymSny7pPTOhpP27XG2Cf5k8penlwuyOrI0uH/ggxB4OJhsaQRL0VDe4O9y+jIsWldvpXJRJ40Wl6R9rvYBK93i+dbeIY7O06SqttiUfMO0SU8x5PhRVrusMtLHoXXs8yKyox8LdQwpe/9m9BOs/UAlRVkjkb/69DWfrvdTl27yI+2gzB+IV5jsB7xleuJqSgetOnBHzYP5lnMatIx6moDC05WAzi49rsZ7fIvl+HsoVu7O6Fy2DnBhG8IU0TR/gaqlZzwqe95Br9DbX69GSpFIQAOoZiTe6Mr2IhjJ8C1sdafiBTBKv9C++hMIE1u6tGg9bbRvItrSrsi1zTGflNc6JSjT3rYnTJ+5XtrVkmtvrXmv9DAmTlFF3DKdNkiHj1NH8QdntKQ5JiSP8pBubVB3F1HsZdtn5ZBQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(1800799012)(451199024)(31686004)(83380400001)(86362001)(31696002)(36756003)(2616005)(38070700009)(66946007)(8676002)(5660300002)(53546011)(38100700002)(122000001)(26005)(64756008)(71200400001)(6512007)(66446008)(966005)(110136005)(921011)(66556008)(316002)(6506007)(66476007)(6486002)(8936002)(2906002)(478600001)(76116006)(7416002)(41300700001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHdRdTVLcGlKM2F2Vnpkb1dSdVNDOTNZTmhxM0hROXlWL2hYSUR4Tkpld21o?=
 =?utf-8?B?OFE2TExzK3NRbU16U0kxZnl4ZS85SERwYkdBQUpidkFzdVNiUkNnZzBtNUgy?=
 =?utf-8?B?MVFRcnJnTGxRTEIyTEVCVkVUbi9uQm5vNWltbm5mUHVzK1gwaEZrL3J2OHJm?=
 =?utf-8?B?ek1uUXlqajVvME9kL0grM1RJeXlIY0o0UmVHVmNVL0p2Rk5yNDcvbjA2Y3g1?=
 =?utf-8?B?YkdxVXdxa1VYWTROSG0zaXFObmowQkE0RTgvdm1Kem5mMjJubmxxU1hIZEF5?=
 =?utf-8?B?U0UzYXZRY1N3MStxODlLNUJkd0pLS0grU29ldVpnc21yUUxwMDM0VjN4Y29Z?=
 =?utf-8?B?QlBQQkJJWWlvNWl3OUh1UWZYeUVtZXlmT1JjUmdWTGQrM1RtWkc2R3Jid29o?=
 =?utf-8?B?V1M3cW5LUWExTXJQY2JYVG9seDhjdVhZbk9wbHhuZTIzVHFvYjBhekNDcG9a?=
 =?utf-8?B?dFNnUmo3MlF1TGxWVHhQeDFjdzVKcGx3c1R6NFo2RjIxWmhzbFdqd0h4MkRT?=
 =?utf-8?B?ZGt0cUVydklSRVJOQWVrSzA1M205eXQ2UTlkSU81UjYzOUQweUxENW04WVd4?=
 =?utf-8?B?RFZpcUs5bkh1QVB4QUFHQ1pzTjlhOFhKR2o1K1hJcVhJS2xycEY1S0dsakdD?=
 =?utf-8?B?R0RDUTlHaVdaRmJCSU4zVDM2d0pqbnQvRnZZQmdWd2hDR1F2STFrSGxWdG9K?=
 =?utf-8?B?Z0Rpa2ErRzdjSTVKU2RqWGhDRE5rSkNZZkYxWUN3T1hKWGdKVzlxZkRhb3JW?=
 =?utf-8?B?K0lxemM1TWVhS3lNcDdxOFZJTHVSMkt6eVY1bW9RTU5iUmxMOVFsSFRIeXpZ?=
 =?utf-8?B?ZDlKa2pzWlF1SGFHcG9pMTVQeVRlY09GZFYrbXpaUUovL2IxZmJjRDFLaWwr?=
 =?utf-8?B?Yk9lUVhURmNvcEsxemlnWWtMWWx6UmlBeWhxc1RTWktpMWhKQVZ0RWFZc0NU?=
 =?utf-8?B?dlgzeWFLQTFmUmlTUWV5VktrVVBoZE04TnRKYVNaNC9SY2xzOTg0NHBVbFNk?=
 =?utf-8?B?YzJadVUvQTRmekJiVTZJaERvT2dyeFc1NVZYR1o1aUFMWW80VHMxeGFXSUFr?=
 =?utf-8?B?dVZqWHFjdndaay9kSm85akZDYVRDZFFVUXZUNmh3Q2kvUHB0dzgwbnpIQ1dW?=
 =?utf-8?B?V2JLOGtUdzlrQTJ6UUNJd29PQzhTcTQ4REp1ZitMOCt1dEFmMUdDUlRmUGUr?=
 =?utf-8?B?VDhSaE0zdTg0VkFXZkl0eGZtUEtXa3dVOU5oQjFCb0NPKzJ6Ym9oOHpRZmpH?=
 =?utf-8?B?VjI3ZmZGckpRTTRLMVY0ZU5wUnhIWDY0UkljM3hvb2MrblVSVTZwcHFrbk53?=
 =?utf-8?B?ME1FMjdDd2ZwVGZmaEQ0NFBqUzh2Q0t2Z2FuNnk2cXdjRGI4QUVTNFNnRkRM?=
 =?utf-8?B?eDFCaUVza21XaTY5VTExNVNzNXpraUpJdFBHekw0aU4vME85ck9hWXhzMkxE?=
 =?utf-8?B?eVB4YlBVdHRTc1orczBHVzRxbklKdmgxeWcrRStIRkFneVR5SGl4Y2lnN2Vq?=
 =?utf-8?B?bHRpRnZtRGEzM2FXRVVBVlk3MEUwMVJXSk0yQXA1UlNnOHpKZkFBRi8xZkxL?=
 =?utf-8?B?dU44bFFPWnBhOUZTNHAraGE2SGljY1M0R28xREpZWDRnMnN5QmpPa0ZhdzlU?=
 =?utf-8?B?dmY0Sm9WSzUzZXhZTUhwOFIwZkszWmlJM2FuWTVtVU5vZFRFdnJLTUo4T1gz?=
 =?utf-8?B?Qkk5RkVWN2ZRaUFoZlh5WDc1Ynp2Q2gwbjFvcmZJb0o4Sy94UVNMSkt2VzJN?=
 =?utf-8?B?enFWNTBrWnJJNlFHdHlQVUFTTXpEdHFTa1hOZ0orZ2pZRC9vRjl1d0xaZmE4?=
 =?utf-8?B?ekUxTHJ0RlVHRnk2VWF0QmJnUUpBTFRJSjM0RXhweXRrSlV5MW1MbzRiZjla?=
 =?utf-8?B?OXUzdkdXZVVnV1JlTTVCaUh6Sk9oYmdXZlg5RFNOS1N4YlZmUHNFdHBJK293?=
 =?utf-8?B?QVNzSlh0L1FqSTdVc2ZFZ21PUktlclBPK2hmVE5Ua0lWT1J5Nm9NTDNqYk5Q?=
 =?utf-8?B?TmFhdWtEQ0tsOVZJTWRTVVFkZFpSYjd0TVE0emxSME15WVRkRm8xaFREbm1R?=
 =?utf-8?B?MitPVmVBL1lzdDRROThBKytiaUlDek1LVTdlWmJzb1BQU2FVdXM1amlDMlUz?=
 =?utf-8?Q?MlbQuJ4Z+AKBmVs8NDuFEQyFe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D5A6F13C155BC4CB9C30ADE6EC3778F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0dad323-b6da-4f1f-886d-08dc17e96095
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 05:50:29.4476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OFWjJ7d9Ia9uylafVmPfNq0GKJV9I7HhjZ0G3f6px+1Ie5KBni2W0IzQPyb+cPafKKO0ScyWhHUuHx9pZDkJVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6269
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

T24gMTcvMDEvMjQgMTowNyBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAxNy8wMS8yMDI0IDAzOjIyLCBE
aGFybWEuQkBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gSGkgS3J6eXN6dG9mLA0KPj4gT24gMTAv
MDEvMjQgMTE6MzEgcG0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiAxMC8wMS8yMDI0IDExOjI1LCBE
aGFybWEgQmFsYXN1YmlyYW1hbmkgd3JvdGU6DQo+Pj4+IENvbnZlcnQgdGhlIGF0bWVsLGhsY2Rj
IGJpbmRpbmcgdG8gRFQgc2NoZW1hIGZvcm1hdC4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTog
RGhhcm1hIEJhbGFzdWJpcmFtYW5pIDxkaGFybWEuYkBtaWNyb2NoaXAuY29tPg0KPj4+PiAtLS0N
Cj4+Pj4gICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2F0bWVsLGhsY2RjLnlhbWwgIHwg
MTA2ICsrKysrKysrKysrKysrKysrKw0KPj4+PiAgICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZmQvYXRtZWwtaGxjZGMudHh0ICAgfCAgNTYgLS0tLS0tLS0tDQo+Pj4+ICAgIDIgZmlsZXMgY2hh
bmdlZCwgMTA2IGluc2VydGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQ0KPj4+PiAgICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hdG1lbCxo
bGNkYy55YW1sDQo+Pj4+ICAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWZkL2F0bWVsLWhsY2RjLnR4dA0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hdG1lbCxobGNkYy55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hdG1lbCxobGNkYy55YW1s
DQo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTU1
ZDZmYWE5MTA0DQo+Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hdG1lbCxobGNkYy55YW1sDQo+Pj4NCj4+PiBUaGlzIGxv
b2tzIG5vdCB0ZXN0ZWQsIHNvIGxpbWl0ZWQgcmV2aWV3IGZvbGxvd3M6DQo+PiBJIGFja25vd2xl
ZGdlIHRoYXQgSSBkaWRuJ3QgdGVzdCB0aGUgcGF0Y2hlcyBpbmRpdmlkdWFsbHkuIEkgYXBwcmVj
aWF0ZQ0KPj4geW91ciB1bmRlcnN0YW5kaW5nLiBUYWtlbiBjYXJlIGluIHYyLg0KPj4+DQo+Pj4+
IEBAIC0wLDAgKzEsMTA2IEBADQo+Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBCU0QtMi1DbGF1c2UpDQo+Pj4+ICsjIENvcHlyaWdodCAoQykgMjAyNCBNaWNyb2No
aXAgVGVjaG5vbG9neSwgSW5jLiBhbmQgaXRzIHN1YnNpZGlhcmllcw0KPj4+PiArJVlBTUwgMS4y
DQo+Pj4+ICstLS0NCj4+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWZk
L2F0bWVsLGhsY2RjLnlhbWwjDQo+Pj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+Pj4gKw0KPj4+PiArdGl0bGU6IEF0bWVsJ3MgSExD
REMgKEhpZ2ggTENEIENvbnRyb2xsZXIpIE1GRCBkcml2ZXINCj4+Pg0KPj4+IERyb3AgIk1GRCBk
cml2ZXIiIGFuZCByYXRoZXIgZGVzY3JpYmUvbmFtZSB0aGUgaGFyZHdhcmUuIE1GRCBpcyBMaW51
eA0KPj4+IHRlcm0sIHNvIEkgcmVhbGx5IGRvdWJ0IHRoYXQncyBob3cgdGhpcyB3YXMgY2FsbGVk
Lg0KPj4gRG9uZS4NCj4+Pg0KPj4+PiArDQo+Pj4+ICttYWludGFpbmVyczoNCj4+Pj4gKyAgLSBO
aWNvbGFzIEZlcnJlIDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+DQo+Pj4+ICsgIC0gQWxl
eGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPg0KPj4+PiArICAt
IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+Pj4+ICsNCj4+Pj4g
K2Rlc2NyaXB0aW9uOiB8DQo+Pj4+ICsgIERldmljZS1UcmVlIGJpbmRpbmdzIGZvciBBdG1lbCdz
IEhMQ0RDIChIaWdoIExDRCBDb250cm9sbGVyKSBNRkQgZHJpdmVyLg0KPj4+DQo+Pj4gRHJvcA0K
Pj4gRG9uZS4NCj4+Pg0KPj4+PiArICBUaGUgSExDREMgSVAgZXhwb3NlcyB0d28gc3ViZGV2aWNl
czoNCj4+Pj4gKyAgIyBhIFBXTSBjaGlwOiBzZWUgLi4vcHdtL2F0bWVsLGhsY2RjLXB3bS55YW1s
DQo+Pj4+ICsgICMgYSBEaXNwbGF5IENvbnRyb2xsZXI6IHNlZSAuLi9kaXNwbGF5L2F0bWVsL2F0
bWVsLGhsY2RjLWRjLnlhbWwNCj4+Pg0KPj4+IFJlcGhyYXNlIHRvIGRlc2NyaWJlIGhhcmR3YXJl
LiBEcm9wIHJlZHVuZGFudCBwYXRocy4NCj4+IFN1cmUsIEkgd2lsbCB0cnVuY2F0ZSB0aGlzIHRv
ICJzdWJkZXZpY2VzOiBhIFBXTSBjaGlwIGFuZCBhIGRpc3BsYXkNCj4+IGNvbnRyb2xsZXIuIiAm
IGRyb3AgdGhlIHwuDQo+Pg0KPj4gSSBhZGRlZCBkZXNjcmlwdGlvbiBhYm91dCB0aG9zZSB0d28g
c3ViZGV2aWNlcyBiZWxvdy4NCj4gDQo+IFRoZW4gd2h5IGRvIHlvdSBzdGlsbCBrZWVwIHRoZXJl
IGNvbW1lbnRzPyAjIGlzIGEgY29tbWVudC4NClN1cmUsIEkgd2lsbCBkcm9wIHRoZSBjb21tZW50
cyBoZXJlLg0KPiAuLi4NCj4gDQo+PiBpbiB2My4NCj4+Pg0KPj4+PiArDQo+Pj4+ICsgIGhsY2Rj
LWRpc3BsYXktY29udHJvbGxlcjoNCj4+Pg0KPj4+IERvZXMgYW55dGhpbmcgZGVwZW5kIG9uIHRo
ZSBuYW1lPyBJZiBub3QsIHRoZW4ganVzdCBkaXNwbGF5LWNvbnRyb2xsZXINCj4+IEdvdCBhbiBl
cnJvciAiJ2hsY2RjLWRpc3BsYXktY29udHJvbGxlcicgZG9lcyBub3QgbWF0Y2ggYW55IG9mIHRo
ZQ0KPj4gcmVnZXhlczogJ3BpbmN0cmwtWzAtOV0rJyIgc28gSSByZXRhaW5lZCBpdCBpbiB2Mixi
dXQgYXMgY29ub3IgYWR2aXNlZA0KPj4gdG8gaGF2ZSBub2RlIG5hbWVzIGdlbmVyaWMgYW5kIHdl
IGNhbiBlYXNpbHkgYWRvcHQsIEkgd2lsbCBtb2RpZnkgaXQgaW4gdjMuDQo+IA0KPiBUaGF0J3Mg
bm90IGEgZGVwZW5kZW5jeS4gSSB3YXMgdGFsa2luZyBhYm91dCBhbnkgdXNlcnMgb2YgdGhlIGJp
bmRpbmcuDQo+IFVzZXIgb2YgYSBiaW5kaW5nIGlzIGZvciBleGFtcGxlOiBMaW51eCBrZXJuZWwg
ZHJpdmVyLCBvdGhlciBvcGVuLXNvdXJjZQ0KPiBwcm9qZWN0cywgb3V0LW9mLXRyZWUgcHJvamVj
dHMuDQpTdXJlLCBJIHdpbGwgZ28gd2l0aCBnZW5lcmljIG5hbWVzICdkaXNwbGF5LWNvbnRyb2xs
ZXInIGFuZCAncHdtJy4NCg0KLS0gDQpXaXRoIEJlc3QgUmVnYXJkcywNCkRoYXJtYSBCLg0KPiAN
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KDQoNCg0K
