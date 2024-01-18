Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2161183157E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 10:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5668810E741;
	Thu, 18 Jan 2024 09:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC05210E741
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 09:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705568908; x=1737104908;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=9wTDzaLcqkXgqQWTdO/s83OfbsZ305paXKssnUORZSo=;
 b=1iaUrdud7e9HZGhyKh42AICRKWY9p3T3zYVROpBnMKRqeYkpSE6Nj27q
 DPrND2ex/4TuRzuI3GeHK8AEHQc8vd0tGixT0nnlNArbvkND6l82OgH4e
 uS18ilD63mQgtDrdqQgchNrUhVNLBPU8/M+HKJknEjqR8pRm7IEuUusqx
 5EsVjCp1CPXoPeHzBLoflJOpagrhCnHca+T/bGJrZXrwMs9UHj4QrMqtB
 Ml9/dvDnrrjPPCAkl4UmUHTzqTPFwS2sLo9rZoTQSQCvnR5hFl8Xr7Y9c
 9NUwD8dI8gIjWQyMHQCdJ+9B4ITNAui7w56rkwvx0KlkyjBX1oX3iv6eN w==;
X-CSE-ConnectionGUID: sk4au6lwT86BvjokRnAwRA==
X-CSE-MsgGUID: TLryvuLZQrSsfdt4EgjCMg==
X-IronPort-AV: E=Sophos;i="6.05,201,1701154800"; d="scan'208";a="245650594"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2024 02:08:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 02:08:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 02:08:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5NlZAUBOLjpIoRH/WMMNPfgUPle5z49lysYpj359I7/bS1fL1DYP8u0TwitWyWLXXdAaHTJiDcyaH2mZnu09sVeQkh1kFwqU8lGfum2nBuo8PyQbjXmzvsGx9NYoGBiN8vWvUwsVaFe91sp9FaNj5o6suWcWoFTwMcnr1jSohts+TUrX9peUVWYSPG0N3HwFqH/0M8oQ91BYFV4XjcZne6wPrBCjChqze9j1hSZlYrssfjdeishHIQ6H7NX/X8Yp3gSEJSwuZ8Whp/Ovjur2C0Qz0S0lc4ksOy2eZjkqKQ5+auQN9+Gj2JsVw2X4Bqsfacoeq5OwhS7F4daD5gjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wTDzaLcqkXgqQWTdO/s83OfbsZ305paXKssnUORZSo=;
 b=dehtPmoLEatH0A+uGqdbQFH3vjgpbCKZU45Nl/cy627jrxXjGGDW2piu6NBqJ3QEbRBiV/Q7Je3y55f/An4ifq1oIYjRFkGbkVrW8lblQ5IGRa7uIdwU/KCrW8Ic1H5kW9WhxCfDI3j9UZe/fIqIGlfQddJYUuI7YFklDHfg8F9vzOccDTSyu+SRAwkfyhVTKCtPUFM6YfUDAK46xi/86v63XICE5YissKYpS5gknfzBHM/mLymq3iccNI0Y1lnmZ+TbDjt3PN7BnivQKm2cSC3mBY1VrVQsJraHidrBGr198AmLvNP/ndfQ7inGnYcpdp66j0jFsUO9ruYSzuIfGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wTDzaLcqkXgqQWTdO/s83OfbsZ305paXKssnUORZSo=;
 b=DWWYpza+ExJMiLEnkYOL+OXkESIR9vV8E7M7BSJSD8iRjHluKE9IR3663TBWFnIY5rIoMJ6EuWSM77ZjzPp0gRXoFpKWNKPCN+MHKiGerOinevzEnfvm1GZZQ/0tdJlLVWwPKWHuPvB+4Ale74OSoXRhSsjIu2A+GPzi0OV43lUuitgIRnt02KW3AOBvQ1dZDKcxqsmPGxag63sUax6ga/anRomahr5/pE7WsTwj7/ggeYWmPguWlcKo2uFW5hwyxzPjd8B1LkzpwXXLuDAn13+YyRob33EppesbKbthsWw9DeQt1PmxtI1/cUBk9k8k9XHQMyX0gG28XifTnpCe6Q==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 09:07:59 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 09:07:59 +0000
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
Thread-Index: AQHaQ6+DDeklb90Sy0qUe1mJSbBgM7DTVpiAgAn6HICAAFf8AIABq5kA
Date: Thu, 18 Jan 2024 09:07:59 +0000
Message-ID: <574fe7e0-86df-4a23-8662-0220cd3db1c4@microchip.com>
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
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|PH0PR11MB5206:EE_
x-ms-office365-filtering-correlation-id: 98c62b94-7ce3-4ed0-6111-08dc1804f7bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O06O/Cs+j8v6FRQqotEHRZBM9G8YGJSKlg3pMbA5ca16F16Y5nwXl7OSlmh6X2fBz+fjkLLuG0s1LTgAXdoz8kH5wIdKVE0I54IRCkM5lvmrbJr3Ii2ugLmwOUDsrhwEQDAnXhnBg8KpMaJw2zBRkE0HRKloOq0r93umQh59vK5AbtWbLR3u1avKD7GI/ooyP9iMFvvhnOe4Jnd+pquEl4N9iu0HNnX1pBhkCWyF5QQO0AciHOCqkg39eSlhzBlu310iFxQrpI5by87GtX7NYB37g+w1JNHfp0/MFVRTcwvaGYLm1XtBfltRbLvV4hYJEjqNsgQHgVc9kXrmwCvloGuiII26k/FKmeOuKdBrN1GDEdArLBkuU+omvky0ug2kJpZ8hKVF73fIsQ19jczOZP1gv+mgA/mA7gBep1hjI4u5KN88RRgZ8pxBeVQewf7Zb0C4/AfrAFSFEStRnpLolFfs6jGkMW1j2x7Y4BNrxo+pXpN0NiGZk6EQqN1t7c4Tm9bdIG+64liyi6rbBAhJ/NqcQNkyVwURZk7+88bZ5zysmY7RYHTH7B+YmycucyaTWmgItKMNwTy2g+BWKL+8/rf35M1aCfCxFXb3lmNw69iwXkx6r3mXtsj8BX9lRX1L5Y+pJ4TRs5+DwVicw0COIBwRXmGSMBFXI0PTVjDAaCPHWw4eabim/aeMJ8uOqFEm9/WKcEgq64XtQqIg2rSnCIAybpA3ddyhcFvU9Uuj1R4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(36756003)(6486002)(26005)(86362001)(478600001)(31696002)(6512007)(53546011)(2616005)(316002)(41300700001)(71200400001)(2906002)(6506007)(966005)(38070700009)(66446008)(66946007)(66476007)(5660300002)(76116006)(66556008)(64756008)(83380400001)(31686004)(91956017)(110136005)(921011)(38100700002)(8676002)(8936002)(7416002)(122000001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0d2NHNYcWhJOUgvc2NNbFVTMUpCeTllZFZPWFo0NU8zS1lqdElTamttQlZS?=
 =?utf-8?B?cEZhWFJ1QTkvK1QrVnlxcWxFd3dyaEQyRFRMVDR4b2sycnNPamNUdHMzV2hw?=
 =?utf-8?B?QTFUT29GM1BiWndQc1UySzFKTHpaQWtWZmdJSXM2c2hDWkNZc2tqUEtBc0dZ?=
 =?utf-8?B?djdTcjAwdWRJNklaWDl3SVF0ZG44ZzJkTHNrajA2eGtJRjRmcEVSOTBYYVhE?=
 =?utf-8?B?c05mQjNBb01VVU41cERWZ1JsdTdOMk5UL21NdTE3OGlaNkd3MFdMQkpqTWZ0?=
 =?utf-8?B?TkVDUDY2clIrMUJXUzAyM1FXUldTTldYemtTbkcwdnE3M0JZRHVaZWlGdlBE?=
 =?utf-8?B?dW5ydmE1Qy9zV0owb085TXI2T3lnWmRodlZSK2gwdlJCTE1Vc3B4ZGlDUFlL?=
 =?utf-8?B?bFNtSGhIVjhENVJUZnp3QUl6cXZkU2E5N1plOVFsMUNrdUJpRUx6OEsyRmR1?=
 =?utf-8?B?ZjBHM2R4eTVCNGQwVHRVa2gxUGFwME5DTE1wckxpZy9PcTlhVXJ0V1hCK3Ix?=
 =?utf-8?B?SFhTQUNpNHRyTmNHamM1OXNMcXRjMkJGdjM3Z0pjbW5NY1crWFR0TVByR1NB?=
 =?utf-8?B?dGJlL1hQTW94anVEeTF4aWt2Q2JZTVJpbDkxY3AvbTdSVFdOUFJ2bFdSam1a?=
 =?utf-8?B?YUdWY0JjOUZjbjZYangvL2NBZXdSSWh1VklWY09EcmpmdTkrWTlKN08wckVZ?=
 =?utf-8?B?K0I5UXBIRjA1YVNjcEtEQ01ERHJqU2l2T2g1VzhFaHZYcERMTGMxWU5SNmo2?=
 =?utf-8?B?RnNzaWxPVWlZdlNYaGRQMDVNamJpbUFIVzVQY2dVNzYrZTRJZVVqMmg3NE8y?=
 =?utf-8?B?YUhIRUsxL3RDM1ZMTk5zMTNXTHNCTTlkbkV6emkrcDFVcnhoVmk2QnFsUk1k?=
 =?utf-8?B?WEM2Q1dQWEFWdXpMcE1HeHFKVXE3N3dxa3BLYXNDbWlXdTNNUkZTOWRVNUhL?=
 =?utf-8?B?Um5JSmkvUGdKRVdRNnB5ZEJnRXhUaFl3eHVPQjVJT1pTeXcyN054TERHeDVv?=
 =?utf-8?B?cW15Z084VU16N1A0VGhMRnRUSTNpUEZiYVV1cTdQTDdnQ0c4bUJpdnhYYVdK?=
 =?utf-8?B?WTR6MWxaa1FSKzNjRUpJWU9PQlozdVdYdE5aWFh3a1Q2c3NkcW1LTWkrK3FN?=
 =?utf-8?B?WHBtUDE5b3E4cTR3Uk1FNDFqNUZ2S29CWHc4WUExdkJPckJIM0RLZU42TFFX?=
 =?utf-8?B?Y3hpM1R4OWJ0OXhReWZqSmNzejJ4UEFyTEFiVTBDWHFTMmtDSDAzd2o1WlJq?=
 =?utf-8?B?bFRRV0R5WHNBWXVIeWhzSlV3VTh3dkdtcmJhSTAyU0l2NzRpdnd6ZHU1d1I2?=
 =?utf-8?B?ejZ0a2c5NmdMRkJmZUtONDB2RE1odU1rWERYdlVvNVc5WVpKSEt6ZlB6WTB0?=
 =?utf-8?B?TWIxSE1hRUtHc3JMYXRvV2dZOG5XSzV6cXRUakh6U0ZIU2lGUCt4UGt6TW8z?=
 =?utf-8?B?b0RzaGdQNGs5cWs4bk1wZGZwZFpYdVUrNlg2cEY2NVQ5NFpCQVI3dzFjSVBQ?=
 =?utf-8?B?YVFoZlJUMmZIUTlmZE5rTFQ3SlVBcVBqQlVRckNjbGtlSElaVEhsTDZkVTFq?=
 =?utf-8?B?dW9ReHV0Qy9LdmtRZHA1dmp4aWpidXdtRVZpdVk3Sm96aVFMbkRPVWk2ekZQ?=
 =?utf-8?B?MWpoNHRmSng5bHdQNUQ5MGpvUmpuS2dNL3FxblBud2kwaUxQM1dzbFlWZTh6?=
 =?utf-8?B?QlhqcTUvKzJzR2FnV2hObFNGa0xoeFozOXIyUDdNZGtIdGJYY2IzTmNtZGNC?=
 =?utf-8?B?eTUxdlpWcS9hd3cxdlJINGxyeUVVNktCZkRJMG9vUGFXd2Z0ZUtWdzBsZVdI?=
 =?utf-8?B?RXNldG1udWZFbnV2OTluMU8zbTNsemhuS0RRYWxnbGlYNzFNUzg1enJHa2hU?=
 =?utf-8?B?TnVzR2MrWnB0UnVRYjFkbkF1UFhETDlWTUZSRTBnVjRDWUhEbTNyNkRlWklI?=
 =?utf-8?B?MnhuYnhEU3FCb2N1OTZQSWtSV3l3d3h4R0UzbFFQazAxUHJ1VDg2cHpMZmty?=
 =?utf-8?B?U01lM3pwNWIraU4zamhqbHdJYWFwaVNPZ1ZuTWQwMUYrTUh1MUg4QTh2VHEv?=
 =?utf-8?B?UW9PbkNZSm10KzIrcTJSYU8zWFVWV21hQWNKN1lJMnJOQUZGLzJmcC9VWjdq?=
 =?utf-8?Q?DoFSOVILILa24oyrKU1p5FQAm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4E092AAB05A81408CE8DF69FEB5B7D0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c62b94-7ce3-4ed0-6111-08dc1804f7bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 09:07:59.4722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /k5ZbbZUjlZ6QNwP1OGLPb3JlyJPf3+OObuW4lyFuP5BT4Xb1FBtaM6XB0NVDUrKR63zc7U9yk9r2OdOtUs8lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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
IGNvbW1lbnRzPyAjIGlzIGEgY29tbWVudC4NCk15IGJhZCwgSSB3aWxsIHJlbW92ZSB0aGUgY29t
bWVudHMgYW5kIHJlcGhyYXNlIGl0IGFzIGEgdHlwaWNhbCBkZXNjcmlwdGlvbi4NCj4gLi4uDQo+
IA0KPj4gaW4gdjMuDQo+Pj4NCj4+Pj4gKw0KPj4+PiArICBobGNkYy1kaXNwbGF5LWNvbnRyb2xs
ZXI6DQo+Pj4NCj4+PiBEb2VzIGFueXRoaW5nIGRlcGVuZCBvbiB0aGUgbmFtZT8gSWYgbm90LCB0
aGVuIGp1c3QgZGlzcGxheS1jb250cm9sbGVyDQo+PiBHb3QgYW4gZXJyb3IgIidobGNkYy1kaXNw
bGF5LWNvbnRyb2xsZXInIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUNCj4+IHJlZ2V4ZXM6ICdw
aW5jdHJsLVswLTldKyciIHNvIEkgcmV0YWluZWQgaXQgaW4gdjIsYnV0IGFzIGNvbm9yIGFkdmlz
ZWQNCj4+IHRvIGhhdmUgbm9kZSBuYW1lcyBnZW5lcmljIGFuZCB3ZSBjYW4gZWFzaWx5IGFkb3B0
LCBJIHdpbGwgbW9kaWZ5IGl0IGluIHYzLg0KPiANCj4gVGhhdCdzIG5vdCBhIGRlcGVuZGVuY3ku
IEkgd2FzIHRhbGtpbmcgYWJvdXQgYW55IHVzZXJzIG9mIHRoZSBiaW5kaW5nLg0KPiBVc2VyIG9m
IGEgYmluZGluZyBpcyBmb3IgZXhhbXBsZTogTGludXgga2VybmVsIGRyaXZlciwgb3RoZXIgb3Bl
bi1zb3VyY2UNCj4gcHJvamVjdHMsIG91dC1vZi10cmVlIHByb2plY3RzLg0KR290IGl0LCBJIHdp
bGwgbWFrZSB0aGVtIGdlbmVyaWMuDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0
b2YNCj4gDQoNCi0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpEaGFybWEgQi4NCg0K
