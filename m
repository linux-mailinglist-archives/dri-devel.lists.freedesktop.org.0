Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E272DB9E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4093A10E349;
	Tue, 13 Jun 2023 07:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2132.outbound.protection.outlook.com [40.107.6.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FD810E349
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:54:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4+oyfQOPqXoCxp4V9c6DX851+LJnWwHOWKGUwwNyPxfOnjjckDmyqx+avDI2fMlKe7BtC5s4haGdPzt7Uzv2tlMnDt6x/jO1d2UCOa+gVHWjulpWcQxAgcxFxAm4dSzSiWj2TmmCvyLyse7vEE7xLLx37kb9e3j+Tx018fFmntDLxxiMaB4pR8cb80EhpxUDbp6fP4JG2TWus/RlMQ0kF2tK1wzuSrJ7z++flcnkV7Lh4IF2Im7J3Am2vUONVRDQVjeEu3PX+yv7GFF2Z4SS949AEyK3KhS+pCnflFTykWcwoTz8Ylb+3sOu12vdVbZi61qrxRuBdQjdxxdaH7epw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj4wD7+fg+Klz1x1oaDy6QvxHSAlltoqo6bgwM+o7gs=;
 b=ZjBMN7Y0yxkh/zc7vF16xRvTRuoZaOOSgrVa57IJ0FxdEoG4GsyviuE1HDkP36KWC6e83pUMvrupJH0J7yn3X53auWsTMOxdixdYH/01YdsV5bNiWfZZsGEcuq8XPsncIoyeawWsWAWnZ7Ra+2t1+NVTl/YLeDOxS9fSv199Ei05ZVk1U/IvBkmSxXUhtpk2ym99J6F8XzV1KDhlssGnnFVzb66hSzRXe27rYp6cKEpxVdcsCYNRhSXTvWZPAXpe34oD0PcwzByRI9cVESCbpkLYzMRBFUh5SvUpxuzvIWEDWYj8G0N7VbHX5Yh3w5a7D8psImPyA8jUfPmOwkihyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj4wD7+fg+Klz1x1oaDy6QvxHSAlltoqo6bgwM+o7gs=;
 b=c4HYj59ZN7SkKq7YecXpYgcum6GtZn5hwB22HSSSmVjPUnUp4awnZOJsmXcY4FhRuOyHq1uF6B3T6TKzgyhw8S/3dfk246Wp5qfUInafqh+NMujN+ACAjzLN3H5QfZakk6n4GoKbR8ZXV941/Lqq6KabFjFkCru8/WehEHbNvtwGUbydNfNjPLo14jKaBqTl2Fb9h3SKGb7anuHVi8nvu2EJ2mrL5pfJJHtguqRvetRfNHZCNt2nhxetlQtZU56vX6rCrKv7ES7s7190ML6lZ9RcCjxq1B3mnsIY4s4AwiGvAZcnp0cSP15BvFzcFG6Is8uWOMCwl4PzO21zGg5PFQ==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by AM0PR02MB5764.eurprd02.prod.outlook.com (2603:10a6:208:18d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 07:54:20 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::75e2:1d42:18a6:2354]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::75e2:1d42:18a6:2354%6]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 07:54:20 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] accel/habanalabs: reset device if scrubbing failed
Thread-Topic: [PATCH 2/3] accel/habanalabs: reset device if scrubbing failed
Thread-Index: AQHZnSaEFNKZ8knpy0mSoYv/Xh+vA6+IXjgA
Date: Tue, 13 Jun 2023 07:54:20 +0000
Message-ID: <5acacda6-1ac9-20a1-64a4-cb5e3a703af5@habana.ai>
References: <20230612120733.3079507-1-ogabbay@kernel.org>
 <20230612120733.3079507-2-ogabbay@kernel.org>
In-Reply-To: <20230612120733.3079507-2-ogabbay@kernel.org>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|AM0PR02MB5764:EE_
x-ms-office365-filtering-correlation-id: f1bcb042-cbdf-48f9-3a12-08db6be3658e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eKNwiz0J6XSa10D4yr4HIadEUKeyD7P8uOUQa++VHs0Twsi3h4OWynzqUxtnYbPoU6mvFK9MlZETkW8ssGdcf2tQZMPVP77Os8VwpKSM8HAKXX6D1DvwXrIH3M+0jqskPR9hOwuGWROz7qfP2Ga0o5Zk+dAjfE0Nae9AI49KW0dq3GepBGakYpr7o/V97qbhkeZpnrbc3zdSsCI7UGf1Gxcu1vPKppVelNwtzyfDx7cY7vwHaEIFSsWgTSFBLVYFTErJURpPNeSP0l41izTfjHGI9DoMRxDqeNsyYWQaCfQnqWHvkf0VuCrLU89m3dF9di1zwynbu4nsbWNc/78I6JQAwKetFtJPjWqctYiq6YvbAbYfILFdJVD8DWwsh6TtFhIAx1umJs+WlxvwuQ0b7TbVxOgNXPGkEZx7/7SiG3a9MyU8rO+TY6AKmp5wP+E6/3k01nHoOFIP96CI7u6MAV7kDV/AJ/dj9K/9EAyJM4JbvCtHNR0fBAAa+KELYj3Y/2AG67m8G8tMV8E1/mI1UJ9UOuoRT+r9ZErHd698tZNCVjjbGl5/RQHqIaHyOrLQEYOxXBm7XBB1Pd2Imwkzh8KUXJKYsJkrIlu1LLkiz0H882xVlcrcG4flooet/N4AjvE6TLg7O/SjxdhxtbweUYhsWa88wpsF/Y6wUHT8PCoWgZXvaxPtEt0eQzIvMHnv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(396003)(39850400004)(136003)(346002)(451199021)(38070700005)(2906002)(31686004)(8676002)(8936002)(41300700001)(5660300002)(316002)(66556008)(91956017)(76116006)(66476007)(66946007)(66446008)(64756008)(110136005)(71200400001)(36756003)(6486002)(478600001)(6506007)(53546011)(6512007)(86362001)(2616005)(83380400001)(38100700002)(186003)(31696002)(26005)(82960400001)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUthUy9mQzl3RUEyTlYyR2U2V2JFczVEeXJHSzdOb3hxT3hYK2FHbGpCdkl5?=
 =?utf-8?B?ZmlpYWpHMGlVWWJXYW1CandLazdrWHByRzN6c0NIM2NUWVViOWRXRjdadWwz?=
 =?utf-8?B?MkNRRW96SzZVNSs1QlVENmVrUGtYM2cva0dXUHJqQmhUVkZYTFgxUGJ5VE52?=
 =?utf-8?B?SDZqK01hd3lkV1ZQWE4wR2VjRE9iRGtJakdjZUxYM0J0NmcweVdZckVOVUZI?=
 =?utf-8?B?ZVpaaCttc1dicG9CUmVRYTRScmdGcXlsbmVmVDhLOTV0QUFsYUFIZ1JPR0xO?=
 =?utf-8?B?ZUF2OUx5Mmo4QzgxQ1VxbStmSktUTGltQ2UrWTRTQTFCVWxHenNLMVhQWnRq?=
 =?utf-8?B?MDdSeitNa1A1KzkyMEx4OXVpclZVZ3BhMXV0Yjh4REVpOUpibUVWTEZ5QWJo?=
 =?utf-8?B?SnRLalJoYndGVUdqT1YyUWZjcTZGbzdGOWY5QXBqdStKWGJaY2QzVFdDZytq?=
 =?utf-8?B?ajlQazBSck5ya2w3TWpsSUswWUhtWWFkQUtGRVVMeElrRVdYeWFkdlBiZlRN?=
 =?utf-8?B?bkREaUttL1NWNVA0Y3BjRW56R0pwUzVsZHk1Sk5zTGtCcjNUWW50U3dHeWRl?=
 =?utf-8?B?UU9MSVNGNk5lamZHdUE4Q0ZLWVVzbWQ5WG51Zzg0YlgzeUtsQVRqQ0F4MkUz?=
 =?utf-8?B?dXlRMnZzRjNXMyt6cGhJQVh3aEJUYlQyb3pjcGlveDU0QjFweGxTRTRuNjkr?=
 =?utf-8?B?dmZUZkJwallpVHIzcHN4SHFMTzhnMjUxc1ZvTGNhYXQrMG1hZmkzRnFXMlJr?=
 =?utf-8?B?bkpSSXJLcjhaRFlBN1VHM3B6TG5iSVdrZFhWdXpUbUtKaTlQUEQzeGdqRkJO?=
 =?utf-8?B?K0ZSamxTN0hzKzdxUEhveWJRaTd1R0FxN2NTaC9ZOE13NDJPaThqUC9ST3Q3?=
 =?utf-8?B?VThhSU9lSnNGTVBaekdGanRINFZPaWZnTUFKWm56VVllZm9KVS9SeCtCQ3Nj?=
 =?utf-8?B?dko4WVhlWkRad1dNZkJDUU0wQ09KN2FLRW45LzFuK1dBc3R0cWpibkN6S2lo?=
 =?utf-8?B?UkRvR052S2JrQXk0QXRFd0VaZE8zVU9vOVlTRHAwMnJtVFprY2lQMHJtWDF4?=
 =?utf-8?B?MjRrZExJRXEyYUNiMWFMUEZFN0Q5OEhFTFFNbmlVSHpJUzNIektXQmtlYWtz?=
 =?utf-8?B?ZEs0TWlSOUhvRS9STlYzcmh4MHh3ZnNpenBjSEdSZUpKWWFzU1ZTalhvaDBO?=
 =?utf-8?B?MzltTlQxa0ZhcmUzQ1JJd2hWVmdlcmFDY0Myeld1b2pTSWpmNHpkcW1sdjlH?=
 =?utf-8?B?Wk5ITENQMkdMbU5meEg2bWsyVW1NMUhTTVlRYzlmQ1VMTDNpRUtlQW9oY1JC?=
 =?utf-8?B?UkpIZ0tXMVFVa2U3SlYzbFFzdUdqaXd3ZUlFeVkwSXkrNWpQWTBXMzZaT29L?=
 =?utf-8?B?ZVNKdXRyZzlVOTl1VUFaN0JPTG9DMEZGTHVjSGRIQ0pFajAveEhoQStOa1RL?=
 =?utf-8?B?eVpZZEJUVGhDemJmRk9BeGpGQ3llUXBVRWowckJjaUF3NzNBR2ZBRkg2NGVq?=
 =?utf-8?B?S0xOdTc2VlJZazNxcVNTQlEzTVBlZ0dpM3R2L05qR2NNY09CaWdHWm5yZzVD?=
 =?utf-8?B?TlVzeWluZmJ6TEtEYzNOV2FUWjFTaSt2Skc1R1VXVzQyNDh6QXNNYnY4UXY3?=
 =?utf-8?B?WXpyeUo2TE1TT0VMM3kyMFZtZDRIRXZkVW95LzcwdGhMOE1mNjRZaUdnRExs?=
 =?utf-8?B?VktNN1lVTXViQnY3KzVvaWJTN3lSWEdwUDBtR2hNN0phOVNORndPQm1HODJL?=
 =?utf-8?B?RTl5Q0NleE5aSktnWVVBdEpraElWSUx0cEdzbnhyS1lLNDc3ZzA4WDlHaGM2?=
 =?utf-8?B?WkhuSm9HZDNJZFNuZGs0Z01HeitwNnFCYXdGMURZZkgxd3ZOM1VPRzNad0Z3?=
 =?utf-8?B?N3h2M1dIWjNwQmVHT2NOQ3QzMmwxcERIME5XVmw1L2tHUWl5MFpaR0VrU3p3?=
 =?utf-8?B?b2ZiMHBEblJRWEQ1MHVCYXBTNjVVSHFYVlorY1FWeVNpWm9qUzIrdEhyc3BF?=
 =?utf-8?B?SVpqNVBwZUlvZkN3bXYwR202K2FTVkpIOE0zbnNIa3Zmc0d5aUxGQlpXMEdi?=
 =?utf-8?B?cjdlcDNQRmlORkRDamxsd3J5bURwejY0VmZGazNvejZYZkRYNEhLQ3VSSk5M?=
 =?utf-8?Q?RAAY=3D?=
Content-Type: multipart/alternative;
 boundary="_000_5acacda61ac920a164a4cb5e3a703af5habanaai_"
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bcb042-cbdf-48f9-3a12-08db6be3658e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 07:54:20.8552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tnltd3M28i+ZNoYHVBJbPjyiz/zGBpIkPmI0b9SLzXP5M1/ueYH6bckMmo2SNkwib+2cJZ5sgYUwV6VJBvzPkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5764
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

--_000_5acacda61ac920a164a4cb5e3a703af5habanaai_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMTIvMDYvMjAyMyAxNTowNywgT2RlZCBHYWJiYXkgd3JvdGU6DQoNCklmIHNjcnViYmluZyBt
ZW1vcnkgYWZ0ZXIgdXNlciByZWxlYXNlZCBkZXZpY2UgaGFzIGZhaWxlZCBpdCBtZWFucw0KdGhl
IGRldmljZSBpcyBpbiBhIGJhZCBzdGF0ZSBhbmQgc2hvdWxkIGJlIHJlc2V0Lg0KDQpTaWduZWQt
b2ZmLWJ5OiBPZGVkIEdhYmJheSA8b2dhYmJheUBrZXJuZWwub3JnPjxtYWlsdG86b2dhYmJheUBr
ZXJuZWwub3JnPg0KLS0tDQogZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2NvbW1vbi9kZXZpY2Uu
YyB8IDQgKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24vZGV2aWNl
LmMgYi9kcml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvY29tbW9uL2RldmljZS5jDQppbmRleCA1ZTYx
NzYxYjhjMTEuLmQ3ZDkxOThiMjEwMyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvYWNjZWwvaGFiYW5h
bGFicy9jb21tb24vZGV2aWNlLmMNCisrKyBiL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21t
b24vZGV2aWNlLmMNCkBAIC00NTQsOCArNDU0LDEwIEBAIHN0YXRpYyB2b2lkIGhwcml2X3JlbGVh
c2Uoc3RydWN0IGtyZWYgKnJlZikNCiAgICAgICAgICAgICAgICAvKiBTY3J1YmJpbmcgaXMgaGFu
ZGxlZCB3aXRoaW4gaGxfZGV2aWNlX3Jlc2V0KCksIHNvIGhlcmUgbmVlZCB0byBkbyBpdCBkaXJl
Y3RseSAqLw0KICAgICAgICAgICAgICAgIGludCByYyA9IGhkZXYtPmFzaWNfZnVuY3MtPnNjcnVi
X2RldmljZV9tZW0oaGRldik7DQoNCi0gICAgICAgICAgICAgICBpZiAocmMpDQorICAgICAgICAg
ICAgICAgaWYgKHJjKSB7DQogICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGhkZXYtPmRl
diwgImZhaWxlZCB0byBzY3J1YiBtZW1vcnkgZnJvbSBocHJpdiByZWxlYXNlICglZClcbiIsIHJj
KTsNCisgICAgICAgICAgICAgICAgICAgICAgIGhsX2RldmljZV9yZXNldChoZGV2LCBITF9EUlZf
UkVTRVRfSEFSRCk7DQorICAgICAgICAgICAgICAgfQ0KICAgICAgICB9DQoNCiAgICAgICAgLyog
Tm93IHdlIGNhbiBtYXJrIHRoZSBjb21wdXRlX2N0eCBhcyBub3QgYWN0aXZlLiBFdmVuIGlmIGEg
cmVzZXQgaXMgcnVubmluZyBpbiBhIGRpZmZlcmVudA0KDQoNClJldmlld2VkLWJ5OiBPZmlyIEJp
dHRvbiA8b2JpdHRvbkBoYWJhbmEuYWk8bWFpbHRvOm9iaXR0b25AaGFiYW5hLmFpPj4NCg==

--_000_5acacda61ac920a164a4cb5e3a703af5habanaai_
Content-Type: text/html; charset="utf-8"
Content-ID: <C9C169C34373EB4988B220069853997B@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBjbGFzcz0i
bW96LWNpdGUtcHJlZml4Ij5PbiAxMi8wNi8yMDIzIDE1OjA3LCBPZGVkIEdhYmJheSB3cm90ZTo8
YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDoyMDIzMDYxMjEy
MDczMy4zMDc5NTA3LTItb2dhYmJheUBrZXJuZWwub3JnIj4NCjxwcmUgY2xhc3M9Im1vei1xdW90
ZS1wcmUiIHdyYXA9IiI+SWYgc2NydWJiaW5nIG1lbW9yeSBhZnRlciB1c2VyIHJlbGVhc2VkIGRl
dmljZSBoYXMgZmFpbGVkIGl0IG1lYW5zDQp0aGUgZGV2aWNlIGlzIGluIGEgYmFkIHN0YXRlIGFu
ZCBzaG91bGQgYmUgcmVzZXQuDQoNClNpZ25lZC1vZmYtYnk6IE9kZWQgR2FiYmF5IDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpvZ2FiYmF5QGtlcm5lbC5vcmci
PiZsdDtvZ2FiYmF5QGtlcm5lbC5vcmcmZ3Q7PC9hPg0KLS0tDQogZHJpdmVycy9hY2NlbC9oYWJh
bmFsYWJzL2NvbW1vbi9kZXZpY2UuYyB8IDQgKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNjZWwvaGFi
YW5hbGFicy9jb21tb24vZGV2aWNlLmMgYi9kcml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvY29tbW9u
L2RldmljZS5jDQppbmRleCA1ZTYxNzYxYjhjMTEuLmQ3ZDkxOThiMjEwMyAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24vZGV2aWNlLmMNCisrKyBiL2RyaXZlcnMv
YWNjZWwvaGFiYW5hbGFicy9jb21tb24vZGV2aWNlLmMNCkBAIC00NTQsOCArNDU0LDEwIEBAIHN0
YXRpYyB2b2lkIGhwcml2X3JlbGVhc2Uoc3RydWN0IGtyZWYgKnJlZikNCiAJCS8qIFNjcnViYmlu
ZyBpcyBoYW5kbGVkIHdpdGhpbiBobF9kZXZpY2VfcmVzZXQoKSwgc28gaGVyZSBuZWVkIHRvIGRv
IGl0IGRpcmVjdGx5ICovDQogCQlpbnQgcmMgPSBoZGV2LSZndDthc2ljX2Z1bmNzLSZndDtzY3J1
Yl9kZXZpY2VfbWVtKGhkZXYpOw0KIA0KLQkJaWYgKHJjKQ0KKwkJaWYgKHJjKSB7DQogCQkJZGV2
X2VycihoZGV2LSZndDtkZXYsICZxdW90O2ZhaWxlZCB0byBzY3J1YiBtZW1vcnkgZnJvbSBocHJp
diByZWxlYXNlICglZClcbiZxdW90OywgcmMpOw0KKwkJCWhsX2RldmljZV9yZXNldChoZGV2LCBI
TF9EUlZfUkVTRVRfSEFSRCk7DQorCQl9DQogCX0NCiANCiAJLyogTm93IHdlIGNhbiBtYXJrIHRo
ZSBjb21wdXRlX2N0eCBhcyBub3QgYWN0aXZlLiBFdmVuIGlmIGEgcmVzZXQgaXMgcnVubmluZyBp
biBhIGRpZmZlcmVudA0KPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cD5SZXZpZXdlZC1ieTogT2Zp
ciBCaXR0b24gJmx0OzxhIGhyZWY9Im1haWx0bzpvYml0dG9uQGhhYmFuYS5haSIgY2xhc3M9Im1v
ei10eHQtbGluay1mcmVldGV4dCI+b2JpdHRvbkBoYWJhbmEuYWk8L2E+Jmd0OzwvcD4NCjwvYm9k
eT4NCjwvaHRtbD4NCg==

--_000_5acacda61ac920a164a4cb5e3a703af5habanaai_--
