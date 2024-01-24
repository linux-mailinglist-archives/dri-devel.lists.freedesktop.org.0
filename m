Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7C683A49B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 09:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F378110F652;
	Wed, 24 Jan 2024 08:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC8910F652
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706086558; x=1737622558;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DyxwFVB4PqIPfj3RPf1P7XuRnkrb8BL7r0a9akcFhBw=;
 b=se4KZ3PDzrzMoskqSeAslgbF3tfIvmrkr0Go020HJOPISaUvmt2tqIpE
 ddIF3v/KnjEJGqMN/wwsmsI1O0VJQsw8p4YVfbO3rHJowkPBKSJFjBRx3
 JNYU683LHhNxW3vLBl3O3E7RYtn3XQMgi+UML47urJxLUXH5Kk9exeYq2
 mYfu7bWtPUMyy6DETq3sSOpHK0dAsSLq3CSy4p3us+NKrlSDx44OP1c1s
 ONDgBXIdsOE8tixhO4vR8mQuo6X6qXvqU3lHyTvjCA3YT8A3zvKZ8NIpR
 tz5pq1Sw19rAmT6B2wZl9YVUbnovytjktYxxMOOkMnKzPMt1lkMh99HZX w==;
X-CSE-ConnectionGUID: QvwX5V0rTsesejUVGrstEg==
X-CSE-MsgGUID: OqkQ9UL9RQGMFWEaGxlRaw==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; d="scan'208";a="15218132"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jan 2024 01:55:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 01:55:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 01:55:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHfXFJh3p3N2csz2X0U3rxJMJ8izuKtUYX6f8FpgK/t2zmRn/vhXhDlKLqwmREKp0OlcEUWNq5d6jF+j4Q35MWc2vGvHT6T2IkCmVUaE2bo9AlIRTngKYEHTGRBFCNszakbCZdpGzcCcbqhXkTdFslTUR0XAmK7PsrZuGI5MTwa5NOErN6xoQMOZnSf3H+yNQZ+TJRdJpFItf2VIMFLPjg/AEHjEKMmpAFMdnvSjQkjexFFWfMtVC96KN2+GSbRbceNQrXRdnu7AIEFhv/pPwSsBZborRP+NN8qn8neSW7VwtRfL7AeM8hMEUWmeCqIIfn2vVbqgTHlzDWyRAzNh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyxwFVB4PqIPfj3RPf1P7XuRnkrb8BL7r0a9akcFhBw=;
 b=lx4W7/+MJg6RIBrO45pIy//b4JPl7Dv9+Mbhs6Wi/Vy2eWVii+vawypDLIyWRLOSzcxipRAk7bs4HIJHe/yDUKQk3MQKFx5lgmrzUuNCSOMQjePZqT678GJrJvaC/ipbsDC18XPnVuT6BIX8/BfTomDNPaFutzIYRdp9MDUZ6MJuAP/vXFKVfEfG3ZLt7Y3XSNKXeMfUXxEgTtQTMvUSk4wdfnGUSzJJy1ObAeV2D+Zt+MT2yTTMjao46RTvp+IaK3ogTqX0NvcvSd3nnU+YHyBnUywDgGWOUcbySxQcoCXC7nQs/heF8ZeO94wSkXXzRZKjeFGMWAmKXntj7dnsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyxwFVB4PqIPfj3RPf1P7XuRnkrb8BL7r0a9akcFhBw=;
 b=Ojb7TFxKT+dzrU5SQCgsKcq8sJBZo+/rlFat8QwoqmZP8Uvux3oa/sU2rrWs6Yzc7WXT+TvNHfZpxjdB5uJSXp+8LLBUJaUu/qa1ETp9TkZ9HSMaVSqxovUbTRCmZz6X/zTklUlOyOPRrQohjiWZ/l6wf4DHRFsRm+5kcOwj72bHiL2k/dQat0LeL8oMkpDB6EfYYnFIbuglD4OHpfM1m6LkNziEQXMxDkVmjwKyOi8r0ZuAQs+x/euppSyrgOFX1Pyhp17NB+2W26zIV61WN4XDBsgsUoksaDdSHKy8i9dYjpK06dgg3htRu6vLFYA3BcYMVEaou8KRDiFnZ/Z3dg==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by BN9PR11MB5559.namprd11.prod.outlook.com (2603:10b6:408:104::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 08:55:48 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 08:55:48 +0000
From: <Dharma.B@microchip.com>
To: <sam@ravnborg.org>
Subject: Re: [PATCH v3 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Thread-Topic: [PATCH v3 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Thread-Index: AQHaSfBtFpABnI0MwEGuolZ8EVFW4bDf9cIAgAGYQICAASXzAIAChPKAgADMmICAAqzegA==
Date: Wed, 24 Jan 2024 08:55:48 +0000
Message-ID: <c9931a97-ea2c-4cf0-84ce-3b6e88c280a8@microchip.com>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118193040.GA223383@ravnborg.org>
 <20240119195151.GB938671-robh@kernel.org>
 <20240120132356.GA345206@ravnborg.org>
 <6c6e4ddc-b3df-484e-961f-6efbd52defd6@microchip.com>
 <20240122160433.GB511247@ravnborg.org>
In-Reply-To: <20240122160433.GB511247@ravnborg.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|BN9PR11MB5559:EE_
x-ms-office365-filtering-correlation-id: a52847a5-d035-4390-a840-08dc1cba4282
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bqh+DIKOh3ieng45zh2JBAN6gcnKL2Da0wkNp4baTzXeHpKlzjOPGB3ct5HNlQ2feDH3zqIsJCbTFAoQbv1OeQVBMHI1OWAmNb9z6Ihurfd+u2yQDGBOZ0vnfttJs7TJ9lY81gMdtNXoByYPdPfWzQjor+8YYJgsewvb6Wz/OoAF2aQVkI8ruRtBjq8ox+pk5LJNFm1SbQEmBHHFpy+zv31/AeIiz14aXjiRqskHQeP0hZRb4AHywwECZ+N0VjY+yglZz7bgSYLrO+R5xcCtoeU6ngCLYY6UvvOI/5+WNCNmO809nCkwNG7mbtlXi7hOY3uRIZdG/jM7EJUZOvYri3/QhCsP3LDDPLsk3WK7SLUC3ux2dWBsQafyqrrgCUIQ+7JBEleo1YsUzDSEvh3ESovJ0klH2Bhc5R2fEDmGcr5p1IUvWFFTgJ67O5CJlOQzBIqhZ/W2RDML5VjMNJ3h2CY3XGz8Ug+L/RSjQzYuOhqcISdbbPVKB+n37XKPVGFH1mwFxyrYNrhH8gfpEq/uiNujHPOkCQDYYu4lqE4VKTWsjGp9boyv9jgXpLDq6lz73yuiH2VXuPzSxdVThLVb5j8UHgUhP8rg6PmBn7Hh7EpMMBdb2T+LrTCwtWwqSUKs6sYITLhFk1OWCq8ueV9t3iaVHKvfE2WVfiqSqnMVWTi5VZeUsXHPNArse//alGBeIsRzpJ0o27cCb9MqrXecwz3aEjjD9qIzSYLh6m45wls=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(136003)(39860400002)(366004)(230922051799003)(230373577357003)(230173577357003)(230273577357003)(230473577357003)(64100799003)(186009)(1800799012)(451199024)(31686004)(83380400001)(38070700009)(86362001)(41300700001)(36756003)(91956017)(31696002)(4326008)(2616005)(122000001)(38100700002)(6506007)(26005)(6512007)(7416002)(71200400001)(6486002)(966005)(66946007)(66446008)(64756008)(478600001)(6916009)(316002)(66476007)(76116006)(54906003)(53546011)(2906002)(5660300002)(66556008)(8936002)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkVjUEYzNzlTM0J4R3hCbkpDTW1SK2hhenpZMnA5RzJpQjF5M2dUTmkzOHBy?=
 =?utf-8?B?UGR4T05BMnZOOUFRVHpCS1oxQWpZT0ZQWjVoY3I4Y1dRQi9EckorQUlSOGZP?=
 =?utf-8?B?bVBTeXdqbVVzNCs2YzE3TmVTa0FncVN6UEQ0c0xpa3gwVnYzVTJPS29JUnht?=
 =?utf-8?B?U29jc2VrRG5mSDdIOFdsV292cmJZaE83U09LeEpnQ3VoeVo0ekVINjMrZ0gy?=
 =?utf-8?B?MW5jbzd2SlBvZGlYTCsrWWE5cmlpUDVvRi9ub1ltS0EyYXcxeVJmWFdFYUFD?=
 =?utf-8?B?N0hSNWNrays0N2lVSDhKa1NkQ0dEWDZLY1Q3OW5BT0MwZEp3bmtXT0FLQWRY?=
 =?utf-8?B?TS9zWlJIeXdSR1dMeUE4SDhQZS9TMWZENUdZVHZxOGI0ZEtSa0FPUFFZVW1F?=
 =?utf-8?B?OHhvQjlyb3oxcHFoMnVFeTMyVU9uQjl2NGJaZ1FCT2x4VHdpZkFBd1pFNHU2?=
 =?utf-8?B?cUU4eXZKYlFNT3NmOE5mNXdZRmgyanJZaVZYV21iMjJPZnMwcVZ2ZWtMa3FD?=
 =?utf-8?B?Q2k1UHlmVDhGaVYzaGNGRnNZSVBMY0FqemVUTGRESE1GTU0yTkZNaFZhWFY5?=
 =?utf-8?B?YTh5bk13dG1rdldhaGZOcWFIdWhkZ2lEV2k1Ty90MlpIWUp6dlMyQ3NPWFVj?=
 =?utf-8?B?b1lmbnY4em9lNktncEpFeHYrWTZOa2ZtTlE1WVZCbzlLOSsvcm9MTitwNmN2?=
 =?utf-8?B?VWtqZnl3YlRzR1pPT2V1Z2wraW9pZVZPRmtpZ3ZWN0FsNlVOSjdoQnNEL0pD?=
 =?utf-8?B?bVFnWWVDd0N6ZkZnRXB5UGRCUStOa2Y3WlRoQ21HdDROamM0VG5KaWtSWWZ6?=
 =?utf-8?B?VHhGUGFxKzhvVE5BWWh5eG44eGpmTExaUVhhSDBiU1dlWi8xV2hRSVArakVD?=
 =?utf-8?B?Wi9nSUI2Y2kzbWRHZVQ5b0xCbFZ3eHFMRmtwc3VEZmpmZjBVZ3pkcjNQS1hm?=
 =?utf-8?B?YWx1UFpEdjlsRmVOanFLbkxzc3pDYW9jV1JaNzA1TENYNWticnBRcmdVNzhi?=
 =?utf-8?B?NlBTWUVXTUR1c3YvVVRDVmhsOGhjYlBoYmFiMG9pNlljMmhlL0pWNU1jUm5z?=
 =?utf-8?B?dGRYajFVcllTRFk5c1Z1b2IyTzFSYXF5c1IvN3F1RTYxdHh0RXhXeGx0Tk1r?=
 =?utf-8?B?Ym1Tcy9CaVBPeWp3cWdXamRWOWpCMHNGUGdDNGhEWTYzUTNwNENZNkVnK08y?=
 =?utf-8?B?YnVNYmZQcnNrUjl0T0xxUVZhMTBpanhhN09zMU1WbmcvZnNjM2dvYklvU1JV?=
 =?utf-8?B?N1JpTy90TjhXWWtlMiszdjR3cVdxLysxSFNSY2toa0FrcjhqYTZVYWpSUjVO?=
 =?utf-8?B?U3RYcHRKM2ExMVlpYmthL2VpTS9VU05FeUxqNm4wakJiVGhWSEFpQ0ZDV1g2?=
 =?utf-8?B?VmFpT0NIOWM4RWhGeDNRYnZTSlBaRnFYZnpCWmtTU0ZMSzJpeGE5YjloSmkv?=
 =?utf-8?B?dnllcm5KTlNqek4rME5YTmU2UnhoallZTXNFaUJnL2NKaVVrZkxxMFB2SWZl?=
 =?utf-8?B?MG92UzM0ZFlrcmZvSGxKVytZS09Bd0Zxbmpnc2ZGRml3QkVmQUQwZkIvWjJK?=
 =?utf-8?B?UWdxMEdrbGlza2M0REp2SHYzSGhPbm5Ib1JiMjBBc2x3bmtNVDM2emdzU0tu?=
 =?utf-8?B?VFNhTjcxeXpCZTdRLzhsb1ZzczlKK1ZidkV4L0pFSWxNdTMrTlBCY3lCVEdZ?=
 =?utf-8?B?MFBBSGlXQlZ0QS83THhTQWpISUdCREczczRXQlFiZE9UdHFyOGRKWUlNdk9h?=
 =?utf-8?B?Y082b0llZk5kc0JCN2xOb2h6empLTEQ5MjhvTElKbTBSM3B6OEhHelUxbGR4?=
 =?utf-8?B?ZC9MRnRSVDYvdTNSU1JKTkRseFBSdVZFRnJnODEwVHN4YmVXQ29wdkdiL1pX?=
 =?utf-8?B?VDZmd0tpNzZMeVoxeVM4TDJQNGlva0taam1XNnh5cXgxSmZwYmFDMEQ3UEcv?=
 =?utf-8?B?YWdQcnk0RXo5eWc0b2NvNURMd2Qyc29KUDBHNFdrSWxhNDN0TDlhYzd4UXVv?=
 =?utf-8?B?R045eUU4MXpQVXR6K2pPTEkwaW1uR1NpRnNhVjZqbncwd1NnUFM4d0o2eDhu?=
 =?utf-8?B?SkpReEZaaWQxWUk1eWN2QThHZzhLbXdXVmtBQ2puZHBqWlJIaDF0ZjYyWVVn?=
 =?utf-8?Q?wxm7JfAWjH6ITaU5MfCo9YrDH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F260D2C136615944B567567119BC5C8A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52847a5-d035-4390-a840-08dc1cba4282
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 08:55:48.5026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mOByB1fhH8QMsM5DpbuMGzLm513BgEmGY1NJckTUUjlmKi8vcVXfqglvWXdVnNt7Q7/0JwwFi1g3XFu8TgiUyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5559
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
Cc: conor+dt@kernel.org, Linux4Microchip@microchip.com, tzimmermann@suse.de,
 alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, lee@kernel.org, bbrezillon@kernel.org,
 Nicolas.Ferre@microchip.com, dri-devel@lists.freedesktop.org,
 claudiu.beznea@tuxon.dev, Conor.Dooley@microchip.com, thierry.reding@gmail.com,
 mripard@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 u.kleine-koenig@pengutronix.de, daniel@ffwll.ch, airlied@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjIvMDEvMjQgOTozNCBwbSwgU2FtIFJhdm5ib3JnIHdyb3RlOg0KPiBbWW91IGRvbid0IG9m
dGVuIGdldCBlbWFpbCBmcm9tIHNhbUByYXZuYm9yZy5vcmcuIExlYXJuIHdoeSB0aGlzIGlzIGlt
cG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24g
XQ0KPiANCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBIaSBEaGFy
bWEsDQo+IE9uIE1vbiwgSmFuIDIyLCAyMDI0IGF0IDAzOjUyOjE3QU0gKzAwMDAsIERoYXJtYS5C
QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAyMC8wMS8yNCA2OjUzIHBtLCBTYW0gUmF2bmJv
cmcgd3JvdGU6DQo+Pj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBzYW1AcmF2bmJv
cmcub3JnLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVh
cm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4+Pg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZQ0KPj4+IEhpIFNhbSAmIFJvYiwNCj4+PiBIaSBEaGFybWEgJiBSb2Iu
DQo+Pj4NCj4+Pj4+IFRvIG1ha2UgdGhlIERUIGJpbmRpbmcgYmFja3dhcmQgY29tcGF0aWJsZSB5
b3UgbGlrZWx5IG5lZWQgdG8gYWRkIGEgZmV3DQo+Pj4+PiBjb21wYXRpYmxlIHRoYXQgb3RoZXJ3
aXNlIHdvdWxkIGhhdmUgYmVlbiBsZWZ0IG91dCAtIGJ1dCB0aGF0IHNob3VsZCBkbw0KPj4+Pj4g
dGhlIHRyaWNrLg0KPj4+Pj4NCj4+Pj4+IFRoZSBjdXJyZW50IGF0bWVsIGhsY2RjIGRyaXZlciB0
aGF0IGlzIHNwbGl0IGluIHRocmVlIGlzIElNTyBhbg0KPj4+Pj4gb3Zlci1lbmdpbmVlcmluZywg
YW5kIHRoZSBkcml2ZXIgY291bGQgYmVuZWZpdCBtZXJnaW5nIGl0IGFsbCBpbiBvbmUuDQo+Pj4+
PiBBbmQgdGhlIGJpbmRpbmcgc2hvdWxkIG5vdCBwcmV2ZW50IHRoaXMuDQo+Pj4+DQo+Pj4+IEkg
YWdyZWUgb24gYWxsIHRoaXMsIGJ1dCBhIGNvbnZlcnNpb24gaXMgbm90IHJlYWxseSB0aGUgdGlt
ZSB0byByZWRlc2lnbg0KPj4+PiB0aGluZ3MuIFRydXN0IG1lLCBJJ3ZlIHdhbnRlZCB0byBvbiBs
b3RzIG9mIGNvbnZlcnNpb25zLiBJdCBzaG91bGQgYmUNCj4+Pj4gcG9zc2libGUgdG8gc2ltcGxp
ZnkgdGhlIGRyaXZlciBzaWRlIHdoaWxlIGtlZXBpbmcgdGhlIERUIGFzLWlzLiBKdXN0DQo+Pj4+
IG1ha2UgdGhlIGRpc3BsYXkgZHJpdmVyIGJpbmQgdG8gdGhlIE1GRCBub2RlIGluc3RlYWQuIEFm
dGVyIHRoYXQsIHRoZW4NCj4+Pj4gb25lIGNvdWxkIGxvb2sgYXQgZmxhdHRlbmluZyBldmVyeXRo
aW5nIHRvIDEgbm9kZS4NCj4+Pg0KPj4+IFVuZGVyc3Rvb2QgYW5kIHRoaW5raW5nIGEgYml0IGFi
b3V0IGl0IGZ1bGx5IGFncmVlZCBhcyB3ZWxsLg0KPj4+IERoYXJtYSAtIHBsZWFzZSBzZWUgbXkg
Y29tbWVudHMgb25seSBhcyBpZGVhcyBmb3IgdGhlIGZ1dHVyZSwgYW5kDQo+Pj4gaWdub3JlIHRo
ZW0gaW4gdGhpcyBmaW5lIHJld3JpdGUgeW91IGRvLg0KPj4+DQo+Pj4gICAgICAgICAgIFNhbQ0K
Pj4gQmFzZWQgb24geW91ciBpbnNpZ2h0cywgSSdtIGNvbnRlbXBsYXRpbmcgdGhlIGRlY2lzaW9u
IHRvIG1lcmdlIFBhdGNoIDINCj4+IFtQV00gYmluZGluZ10gd2l0aCBQYXRjaCAzW01GRCBiaW5k
aW5nXS4gSXQgc2VlbXMgcmVkdW5kYW50IGdpdmVuIHRoYXQNCj4+IHdlIGFscmVhZHkgaGF2ZSBh
IFBXTSBub2RlIGV4YW1wbGUgaW4gdGhlIE1GRCBiaW5kaW5nLg0KPj4NCj4+IEluc3RlYWQgb2Yg
aW50cm9kdWNpbmcgYSBuZXcgUFdNIGJpbmRpbmcsDQo+PiAgICAgcHdtOg0KPj4gICAgICAgJHJl
ZjogL3NjaGVtYXMvcHdtL2F0bWVsLGhsY2RjLXB3bS55YW1sDQo+Pg0KPj4gSSB3aWxsIHVwZGF0
ZSB0aGUgZXhpc3RpbmcgTUZEIGJpbmRpbmcgYXMgZm9sbG93czoNCj4+DQo+PiBwcm9wZXJ0aWVz
Og0KPj4gICAgIGNvbXBhdGlibGU6DQo+PiAgICAgICBjb25zdDogYXRtZWwsaGxjZGMtcHdtDQo+
Pg0KPj4gICAgICIjcHdtLWNlbGxzIjoNCj4+ICAgICAgIGNvbnN0OiAzDQo+Pg0KPj4gcmVxdWly
ZWQ6DQo+PiAgICAgLSBjb21wYXRpYmxlDQo+PiAgICAgLSAiI3B3bS1jZWxscyINCj4+DQo+IEFz
IGFscmVhZHkgY29tbWVudGVkLCB0aGlzIGxvb2tzIG5pY2UuDQo+IEJ1dCBhcyBSb2Igc2FpZCwg
dGhpcyBzaG91bGQgYmUgYSAxOjEgY29udmVyc2lvbiBmcm9tIHRleHQgdG8geWFtbCwNCj4gYW5k
IHRoZW4gY2xlYW4tdXAgY2FuIGNvbWUgaW4gdGhlIHNlY29uZCBzdGVwLg0KDQpGaW5lLCBJIHdp
bGwgc2VuZCB2NCB3aXRoIG5vIGNoYW5nZXMgaW4gW1BBVENIIDJdIFBXTSBiaW5kaW5nLCBJIHdp
bGwgDQpzZW5kIGFub3RoZXIgc2VwYXJhdGUgcGF0Y2ggZm9yIHRoaXMgY2xlYW4gdXAuDQoNCi0t
IA0KVGhhbmtzLA0KRGhhcm1hIEIuDQoNCj4gDQo+ICAgICAgICAgIFNhbQ0KDQoNCg0K
