Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E47F43CAEE5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 00:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41656E3B2;
	Thu, 15 Jul 2021 22:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 15 Jul 2021 22:02:20 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0626E3B7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 22:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1626386540; x=1657922540;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8ant/l04O3DJwwALl5L0VhDIhR407G0tNuY6crTORas=;
 b=egBuudF1O0fY/y+Q911PVPdZRCFHg+OYKTqhhLpFftzYSA7bE6OmaTcV
 /LQ0IA+UHsidDAMNhi4a/9IOirjBr5s93GPCvr+jQl27RA4oRgHzvyrlk
 2zjrDDbLZNPQd98HAuEM17ZLmua7wy3of8iyvHpt9Wd+TG0b6a3100Zcz
 U6LEoQvf/8yiCCwur9KrlgR1Y04trt0oWYIvf8Iiif9JZGmnzPueHOdXL
 MejBJ5iv8l5GLQw/xBVefil2XbN/i3Itt8VD5L6VrStlTTkspAq/8jqjx
 kqdB9eWJoqtv+Y864CfxE+7DDxtSC7xL7A4OhyHTWwgW+ovp6zK8YHum1 g==;
IronPort-SDR: w5OifFeE6ZRbb9/r9Af6vtnaf/L0+Lu8ibYw9HB4qrDT+puCSZ/r9o8qpU6KV5V7u2Y/9xcW5E
 sG0rCArs6N7agXublg0cpSI1qt9tihD/l+NqTyRo6s+mnPx/21DeXl7aljuh0Mde7wd4yNekPe
 x4Y0mfzdjkOhqeLBcxvkzI3S0YjgHVPD+beohBUIU4jY8LswlGyrvrRoRTeXF9FvHQCEg5OijY
 oYtVTuoL0KAGEM7FCQnMrmMMQBq1ueJ93prRyZH6wFj2iSrJB9nzoC+1CL1eca8gVka68KZ9+L
 vD8=
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="136079218"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Jul 2021 14:55:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 15 Jul 2021 14:55:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Thu, 15 Jul 2021 14:55:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6fP2V0chmYSvZzs0Ha7qiaqjPtTDj1VduJuHW2uYvxdidZa4w46PCWfc66tf0/b15X0yxEvKKOnaMvuILghniTGqlUKlfUR08W0lnNYPosPllzglpRp752YcBhZGYV+55Q/P4eWD1PXrTU/xtt9ulnIHlqkXAqJunVc/4Y9RwpbC3/LQzw93hlcFjtNDvS1kMyz5IB5ldg+CVrfKtlZbfx5KkpnLKkw068Yzog26Qx5GjTszUzfBi6JhfRcLGr0Z6wOADgiAq/WGQmqHoUUXP2KIM/s8Bz/BeaqD3V6rKBCdsoScU7EQMLUMInLxDCZ6YjrF52Xa9z5r84gEg6+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ant/l04O3DJwwALl5L0VhDIhR407G0tNuY6crTORas=;
 b=BkINWj4ScPlFSX1PO8LsJJ6KkWbII6wdKXeNUgEyqAYpz5jea3BCmfWRLvsGV0Mo+jXOgRLutKU+ynq597VWKcdHRV769NNR1LuMOdjiiiIVeyUESwhKgfeHeCuUULJWRC7rLHoDuXgTYxdVyRYj7MrhaSMXgQ3leUDSBqkk6oOuM83uGWIGciOOtrc3Fg1cGxxU5t/Ju6+ObO+y/r6S7LUL7AJ3GGA+lZvae/q91bVcu6H36XY41J5Z2lSuR/GvpvsN4TlkSrdVEP4Kjgd2IutK8r6PdT2ojtoEcW/k2WS8OvZMCVby0DYCdZ5qgzVFMSvEpPte7U1o97dOxXwIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ant/l04O3DJwwALl5L0VhDIhR407G0tNuY6crTORas=;
 b=DlkoRxfyeiljeI1iweTkH97kTneZ0oyGNJM6DuaL1Cgx8Q6rgS6kuftt+1wbCbWFrc+yqNFUs6sqk4m9+0TnIcf1zlxZ+xvGTnIwcvX9NZVLFJsukukegTnSe7dkZYSUASPcTLSMkiKtuXRYxLyvFRXUb3Va+tM6dbxZUGhPfiM=
Received: from BY5PR11MB4007.namprd11.prod.outlook.com (2603:10b6:a03:189::28)
 by BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 21:55:09 +0000
Received: from BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf]) by BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf%5]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 21:55:09 +0000
From: <Dan.Sneddon@microchip.com>
To: <sam@ravnborg.org>
Subject: Re: [PATCH v1 0/2] drm/atmel-hlcdc: drop use of drm_irq mid-layer
Thread-Topic: [PATCH v1 0/2] drm/atmel-hlcdc: drop use of drm_irq mid-layer
Thread-Index: AQHXecQUCgzqZr/KAkuhkPnDxEd2VQ==
Date: Thu, 15 Jul 2021 21:55:09 +0000
Message-ID: <31b00450-3961-ff49-047c-d65e128753b3@microchip.com>
References: <20210711091926.552861-1-sam@ravnborg.org>
In-Reply-To: <20210711091926.552861-1-sam@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none; ravnborg.org; dmarc=none action=none header.from=microchip.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 360e28d8-f345-42e2-280e-08d947db36ef
x-ms-traffictypediagnostic: BY5PR11MB4274:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB427437F8CAFF49E7106CEEA0E1129@BY5PR11MB4274.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MUTijde3oBMHCY3ey5cFVsp9tw/qI7xd/ZN2QZBeA7SX64ojv17TZmixrypon8P5yuZs9cYbZqQodHJLWkNfwh9tcyXG6Sl7nL6r5IIhMgj/nIhRzMHyOvITyiN2S57RSy05RmDbXOK77+74FuA1FIqFkD7o1OSewmOWFdIv9geBXCaSGLBd6EGrv90S1RXErP9jw8kA2XjtgFlqGul2YIKAs7e9f44mnrimvUbMg87ViUd/WeefNJmetG8s3zJRc0WVd4JQyTw+0A8M56Iya6JwqPkkuSufebWvPF+/UkmFDbxm/H+onNBmQTVrVLGox+eSnvNYEHpF6srMO5Yg3glaCKzEuQtU5Dc9he6/FozCL4k+9pfoMg8Uug0hLAr6f3UZ4yPSpFoMC1adpwZmgbp6VUOF7sT+kh7eEh7wVpBigQs0QNaze0pZmvyKy8GYH2VWJWQ13GyAnRUl5/Cc39EPjiA2hIELjb7dZ6NEtZpgiuWdn+vySZrgRIrynCjAJCrIg8XV8KYFU0PkBrLicZpzLnOA7h+TK2/OWL+kvlhYCDFfWmTson2rwxZ/3nysjlzhktuXsLCfiRrEQHtL1B8X+8eyiPaSWelg/sUZy+jRQkNxkDigL1omin4LY6aXeWKOLhkmdxQMdDmOc3QlArRmOm56PCLc2c+L5GKY2sO9l/hJB4IU1++mt3PincgWMVCPFC0aTb8yHu4wR6KvEsv8GOdrsJcYat6o5cCTrELQIF02MhqohYjDUu7RrIuYZXkNywnUfDfjkaLGZjgJBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4007.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(376002)(346002)(5660300002)(8676002)(38100700002)(122000001)(186003)(2616005)(6916009)(6512007)(76116006)(66946007)(6506007)(6486002)(36756003)(31686004)(2906002)(64756008)(86362001)(558084003)(8936002)(66446008)(26005)(316002)(71200400001)(54906003)(478600001)(31696002)(66476007)(4326008)(66556008)(38070700004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHlwaXdUeTJ0aVBEQTgxQjA1cm5QQk92YzVCaWdjeUl6MjhKeXlXOEM5c3c1?=
 =?utf-8?B?eEpSMDVKbFQ2UkwrSkR1ck5Bc2kvLytUVDFLd0ZXaWhGYXBmaldaYkpoQW13?=
 =?utf-8?B?QUtvSGlJVTJCeENmeFhDMk9GQ1RvdEs1cUJKY1pYc3lXWnh5WUNYd0M4MjBw?=
 =?utf-8?B?SjRsbmxNaithN3dUL1pobUZ4L3JJWTJWT3lXMWpSSTFpOU5Jemd0T3UwYUtC?=
 =?utf-8?B?UVgzODBIUHlDbnNXNU1DN2V3UDRnU1JPT1l2TmJPZWJpcXd0bS9VWllyZjEz?=
 =?utf-8?B?Wm56cDZkK1hUR05iamF2UHB0RUZjSVpicnUxWHZxcUVpSGZLSWVmQVBjdFlB?=
 =?utf-8?B?a0xXVGhObGdXejYrT2h0T1hDaDR3bEEzcC9XMmVUWkhmaWZCQ053U2V5amhr?=
 =?utf-8?B?aTQwUlB2dkx1eFhVT3gzcXpwdWJlenpMWk42U21yVVM2TXNZUXdqL3JxcUpq?=
 =?utf-8?B?Nm12bVk1VEV4TlpvaHpsOTc3bnFoU3E0a3MyS0tUd0tqMHBaZjF3c0JrV0g5?=
 =?utf-8?B?QlpmRVBHWFRWbzdDTTlYbCt3NWgzaHYwUXBTYUNyRy9QdXRqbTFPMDIwTk0x?=
 =?utf-8?B?QnVnMHR5eEpubnNvcEloRFhZNnNnREdla0VpNW4ybUNzNG5TTVZBRmlWbEt5?=
 =?utf-8?B?UDhjd2xwY0l4M1lnZjFmbWhwc0xiM2VrRmoydVREZGQwYjhOSFFaNi93RWU3?=
 =?utf-8?B?ekxXM3VqVTUzOVJEeXRFUVpOc0doeGgyVlloekg1QlBjUWVZcVVDSnBuQU1I?=
 =?utf-8?B?Mm9McDhBOVgrL2g0UzBONTc5Ui9DRFE2ZVYxNUhDQUlLYW56SzlBL1IzcFpw?=
 =?utf-8?B?SFFnQ25wS1BqajdoTlpxai8rQ05ZNmhXUmVEWS8vYngrNC9vZE9nKysza2dH?=
 =?utf-8?B?ZER2dGRVUXZPV3VPU2NXcUh1WG9oazJzY0tJaGxheUdDM1dpZTYzUll3WXU2?=
 =?utf-8?B?WFhrRGswcXF1V1RxcWZQNXF3TDEvSEQ0bXBCS1JKNmNTR2N4YTFkbnZIZzBN?=
 =?utf-8?B?Q2dERW9qVVp2L01EVWVSdXFsa3E4b2tLU2FNZ0JDUElDcUdvTVdFRlI5dCtE?=
 =?utf-8?B?bkJ1UlVWWGRoTVByNXE3NmtiOElFQTNvRXpYbnBxcHk1aVNReGJkOXR1Tm05?=
 =?utf-8?B?c2piQ0gxOXg3NDFZVjRGU1Z1a0wyaGwwRTdmZ1BXZmdGbFNuVU5hdXdmL3VF?=
 =?utf-8?B?M25PeTBBRWxIRFRDKzhmZFNkWFNBQlpkN3Baa2ZEQk5IVXE4M0FrVjFvNndO?=
 =?utf-8?B?RHI5c1ZQMVZBQm5HTytMVGpEQjM2Tldjd1A5cExqNmpvNWFKcVRlYUtJMDlZ?=
 =?utf-8?B?bW9Ib2RZL1lCSFRZY3FmYVdIby90MDZuckVCSm9BazduNEZkRGxJdlNwc3BV?=
 =?utf-8?B?S3JkNnh2NFdDazhPVFdCeEI2eVNXeDVyS3E3OWVodFdhR3NjRHcrUnpXbEx1?=
 =?utf-8?B?NjgwcFpPR3FOQmt1dHZveWs1dE5xdWNDZkNrUTFINFU0OXBYRS9DVmlMYWVu?=
 =?utf-8?B?VHIwTHRId1Nwd3BxUmVYd3JNNFhmREZNR1NsM2lnQTBJK3lLTEF5dnNjQ093?=
 =?utf-8?B?a1NQYUhJL2NSZ2lMUGc2Y3ZYdDZla0pIcFRyV1JwVmhtTkFTK3lpODR2aXdY?=
 =?utf-8?B?UUgxMkJMa3dRSFlleFNzeXo4S3F1Nlpkam8zaTRHM1dCdlBjVDFXbXk4TTlp?=
 =?utf-8?B?MVN2UUp5cWp6TXhHVmxRelg1Q05DWXN5L0VBUHdNcVYxTnlIek0vUFVSNmZK?=
 =?utf-8?Q?8NMXw/GjA9pJj923oU5+mzHtMAfHLvn1+3N2Eej?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91A7EB3597005F418D32E4AFAA722DF2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4007.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 360e28d8-f345-42e2-280e-08d947db36ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 21:55:09.3349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DqLQ0+97oNYWD9o2Fb+htFp24uDJ/cF6logaWPRcokvf+VOcwPwfjRDZWJ4RNrQSZpOv3trPWFq3FX4AuoHc2Xxf5HuIqRxA7nWSdsCikg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4274
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org,
 dri-devel@lists.freedesktop.org, peda@axentia.se,
 Ludovic.Desroches@microchip.com, tzimmermann@suse.de,
 Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSB0ZXN0ZWQgdGhpcyBwYXRjaCBzZXQgb24gdGhlIDl4NjBlayBib2FyZCBhbmQgdW5mb3J0dW5h
dGVseSBpdCBjYXVzZXMgDQplcnJvcnMuwqAgVGhlIHZibHRlc3QgcmV0dXJucyAtMSBhbmQgSSBh
bHNvIHNlZSB0aGUgZGlzcGxheSBnZXQgb3V0IG9mIA0Kc3luYyB3aGlsZSB0ZXN0aW5nIHdpdGgg
YSBndWkgYXBwbGljYXRpb24uDQoNCg0KUmVnYXJkcywNCg0KRGFuDQoNCg==
