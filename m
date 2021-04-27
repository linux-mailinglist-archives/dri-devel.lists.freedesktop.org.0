Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835FF36C8E4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 17:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546006E152;
	Tue, 27 Apr 2021 15:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50087.outbound.protection.outlook.com [40.107.5.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790636E94F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 12:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEDuW85kwMkDj3tuhkVhGRla3fBue0h5c1SMzVtHEYXPwkHZzwysQC+vkqGIzCcIgvckNq3xZ4jOtN23X7a8k8LCpc7leCGQ49UavCF4nLAP+wvbsRtAbOz6pB1ixIJpfwCR4ONDC1BW29QNCHLV/QMA46wkh0p2sYLCm83WQ9cASzQlOGHzFKhZT+YNYle5f7a7HL7OB2I/ujF2+PHDxGnhf8V/ONkRQoYJdb8h+HPi5zBL/hv93hWPCewld96fwp9aHm+asrKrXLG/bjofSsIyUpupnICGBM/iM0v+Rww+5347Fo9Ni/ijA9ZhyNakJWzxgr5iGJInduEm3e5lfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8Sr/lN8gi6IuzOSz4gBI0NYQYUgmRFne0Q3LI5Jvmk=;
 b=PC/IN+DDZsJfnT+AJZpRvq+AJnH5NnBYMMa61WHNMXj+F8cijpvoigbKf7ec/6bY2NxHUXQfkMQ12Ig44Xy1bMF3WGq6ffIS6uSgdqB+WZiAoQ0BXDV1m3qVncwAPIrB5Sp1oDdcTW754Li/TbElUnURdP5oYU3RYIRyLnqWmeaEfW2I/23NeC9P71aC0DK/m97DWmiFfZXW1kXeZv6blaW2W8dTI7VgK1P5WhmytB4gKxML7eotgzCi3aF6A/G2ij9igsgwu9YvgNXWWZsiTPjhH9snDiUWoa/32xKMm1IXipYZv1F4KGO9yoUESApw/ExDlwOAazxEvTWBsma5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=VARISCITE.onmicrosoft.com; s=selector1-VARISCITE-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8Sr/lN8gi6IuzOSz4gBI0NYQYUgmRFne0Q3LI5Jvmk=;
 b=a9fHP+x7IBHwaZIvnc9MoxOiV9JDDAYaURRQkaIbelcNuNH7tqTmCr1AXYFT1v10kmvhqou7BY7MYYsS75qQphZ9/65/e1xu4V5WoHA0kXqSUel/yGDK/hQByD/im4q1R+M9atANIfvwwP/IjRq83CZxHN9+L8uibGHHsyPuP1s=
Received: from VE1PR08MB5693.eurprd08.prod.outlook.com (2603:10a6:800:1a5::18)
 by VI1PR08MB3038.eurprd08.prod.outlook.com (2603:10a6:803:48::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Tue, 27 Apr
 2021 12:15:13 +0000
Received: from VE1PR08MB5693.eurprd08.prod.outlook.com
 ([fe80::9820:ee6a:c90c:d0d3]) by VE1PR08MB5693.eurprd08.prod.outlook.com
 ([fe80::9820:ee6a:c90c:d0d3%4]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 12:15:13 +0000
From: Felix Radensky <felix.r@variscite.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH V2 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
Thread-Topic: Re: [PATCH V2 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83
 and SN65DSI84 driver
Thread-Index: Adc7XugqQUbJOe0BQSaNytQBlkkdow==
Date: Tue, 27 Apr 2021 12:15:13 +0000
Message-ID: <VE1PR08MB56936A6ECD4335F815F2CCC0F3419@VE1PR08MB5693.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=variscite.com;
x-originating-ip: [31.154.219.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db1ba6cc-1895-49cb-f18b-08d909761c4b
x-ms-traffictypediagnostic: VI1PR08MB3038:
x-microsoft-antispam-prvs: <VI1PR08MB30384FE47BB612353A8B37CAF3419@VI1PR08MB3038.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AnmUIPwRJ18jHglI2P657xdJiTsfCHPz0WjQC2RCDVlX5QYGJMoP2Q5puGbr4tVjyUAiTOjCEm9i/DVvLtREBHkBBzyNYb46lB+Gj1VJD7RK2SnsmRxRVa5WNAmCwi25qYdtGM7RQFicmAlSvfWJpcz2S3ojZdWdqrllZbCpCKyUxFu1XZIrouDJBHOls03rpsOEJH3hXqVNRXGiyKxyHHd60+LssIZ1eNzwXalSpNfAORh7vqpIBkZDDL5JPjtxmICx6kFAlyfYqDPZs92TNTCDjouJjt/I3uOnkK5ZZ6ju33jIiFC3A2uK9PnTZMf/j+YYBWxZJai5LnM2Zvc9XMcQcUreB8szIj9wa+b+llM2Rb8VXNaaYppbxd9jZiYjXQoAa9kvazd3IAYcNns1ZDpTkoUId4cRmc5+rTmKfO0a0BjHK7ky6MJpr4KjNGceP78Q5uqRU3CIFQuKsF+euU4uwiIkDuhR7XR8ljwVv1E94D3m23nUWxTj2HB5BlXE+EVLbioolJH/19bxnRMGcmYjOWGpnHgjxyBOiTQRIyOef4qvPkeF4yswgjsG9viUXfjYaFapyzQ+wk9E47396jaUugrWmJ8S5ww5zZDQfHE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB5693.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(39830400003)(376002)(366004)(76116006)(55016002)(4744005)(64756008)(52536014)(83380400001)(7696005)(66946007)(9686003)(66556008)(6506007)(66446008)(5660300002)(66476007)(122000001)(71200400001)(8676002)(86362001)(2906002)(478600001)(26005)(38100700002)(6916009)(33656002)(186003)(8936002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?windows-1255?Q?NftSXCMkkO09c9fiH7xWZKNhs5OhnVsW1ZSG7MgTNoooso8rvb039yTP?=
 =?windows-1255?Q?pGlozJPdhDvRszHiXh208PoyOI7goDOJ4a2vNlUFcOeKbp5Q0av9XN/N?=
 =?windows-1255?Q?W23tODQFIognMTwxSZy0kMRvWLsXxVz67ykXKvL6YV1qBnKdW/SZVLVw?=
 =?windows-1255?Q?FKFaKvyTA9D67MkNZV9VZcPHq9xGBN/0ce2w489ncOvRIwE8Ipxs8yzo?=
 =?windows-1255?Q?+6UjkBSZ/23S6gsb2TLFq+CtRs7fMbMfhlJjOIyA1BCkEOwxEdQ1UZOD?=
 =?windows-1255?Q?xabOfCfcWbJkCAbUdm6OmbleBHOaeU1srTaPo3BNtcCaQFbafuJm0i2p?=
 =?windows-1255?Q?xD7Su59WUooGLyHA22SV/6yx7XaUat88bIIQpUIpmOIXMejEjbTvwhKP?=
 =?windows-1255?Q?FxDufVLyO+xjQHGi+xAt1LnaS2Wq2GqWhoRxcQmWlcomiRsBSCcr2VWX?=
 =?windows-1255?Q?5sWQvOFm9z9XcWfgpuSuJJa5zWsgIhhgCyx5z8orjhibgi/fG8YUDKIP?=
 =?windows-1255?Q?QSPZUW4q7dUA6LDeXmPbJm2TTBftz4aNxhp3Xlh+ls36fmlEqH1PyrYF?=
 =?windows-1255?Q?SvULZVhd4B7OncfQOwEn6+qhT6uBI7H30+gFDq0+dfCaIN1NYwR4A3sU?=
 =?windows-1255?Q?8UIP5/q26ZelN28UeH/8ltyLe1oeMSQnw5NPkb3lOOXCZ4oUOlMUpUaK?=
 =?windows-1255?Q?KLpkJyaXj0yTIt5xnUyLyV5QqdUCADoCVszupOpW6Gi7VQ0o821nuS0a?=
 =?windows-1255?Q?MagVIFoEFfnhmAFO4sSqvi7YrENcYxZUMC2cQD5BlMXdd2Gq7RcrFPAu?=
 =?windows-1255?Q?fP49RMvl5NGbG4yl4kb6Fa9vwT533QDNBc+A6pAnIXqZMNzVjbh4pi4P?=
 =?windows-1255?Q?poMRuhjNx+lhPg61uRX3LSS9XbJ4B6zE6zk4R45uvN4XPIMZbNMIWyGz?=
 =?windows-1255?Q?fpv1geIrcm/V06tsEFJV5ZArDm4AFNLjgoMOxM8S+reavy+MXOuUc6HM?=
 =?windows-1255?Q?LNljrgCxw4Ch5ksVu17nDjraieSpCsh8PmBFVioDKSlNCJP43fWLBugo?=
 =?windows-1255?Q?Vw+XPDnvBBmGfVRjxu/hgQ/3G0hP9SO3rAbwiHKm5xX5N0RNjqNz3XqC?=
 =?windows-1255?Q?a5I03IVOjDir3aONT0DZ1SMMoqFe8QUoPLxrCY7+cMXPFYOzZzaXAHKk?=
 =?windows-1255?Q?3BWGG4Z1rBmZB9DrORCwW2IRi6ZaqGOJ13xu6hDOaoFAx+dfuVBklODQ?=
 =?windows-1255?Q?JMbzsZYaHW3vYErRL0U7jYqpfjrgU1tL2RWzAOkDtJELAmLg/o16Y0OM?=
 =?windows-1255?Q?29INTHMhgU6uW6HNwNqKZEnKwQKxlSU9MLObRuM4J8QoMdl/ZNN0Nvjr?=
 =?windows-1255?Q?O8KGJPXJFxsanqUVlOutOUwQ4rtctKQIPGeT4ezOkezzl75ebQNnnWqs?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5693.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db1ba6cc-1895-49cb-f18b-08d909761c4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 12:15:13.3891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hj0z+5/ZNfxGRPQE4ll3eaYoGJHK/1pPd1UXBMo0Q24Cdhmh6/+D1KuqMbzbzkvoQoQTS00Bw7GxSV/MJTxuPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3038
X-Mailman-Approved-At: Tue, 27 Apr 2021 15:52:42 +0000
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
Content-Type: text/plain; charset="cp1255"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

oEhpIE1hcmVrLAoKU042NURTSTg0IGFsc28gc3VwcG9ydHMgc2luZ2xlLWxpbmsgTFZEUy4gV2Ug
aGF2ZSBxdWl0ZSBhIGZldyBjdXN0b21lcnMgdXNpbmcgU042NURTSTg0IG9uIFZhcmlzY2l0ZSBT
T01zIHdpdGggbG93IHJlc29sdXRpb24gc2luZ2xlLWNoYW5uZWwgTFZEUyBwYW5lbHMuIEkgdGhp
bmsgaGF2aW5nIGEgRFRTIGJpbmRpbmcgdG8gaW5kaWNhdGUgdGhlIG51bWJlciBvZiBsaW5rcyB1
c2VkIGJ5IFNONjVEU0k4NCBpcyBtb3JlIGZsZXhpYmxlIHRoYW4gZm9yY2luZyBkdWFsLWxpbmsg
bW9kZSBvbiBhbGwgU042NURTSTg0IHVzZXJzLgpTZXR0aW5nICJ0aSxzbjY1ZHNpODMiIGNvbXBh
dGlibGUgd2hlbiBhY3R1YWxseSBTTjY1RFNJODQgaXMgdXNlZCBieSB0aGUgYm9hcmQgaXMgYSBi
aXQgbWlzbGVhZGluZy4KClRoZXJlIGFyZSBhbHNvIHNvbWUgYnJpZGdlIHByb3BlcnRpZXMgdGhh
dCBhcmUgY3VycmVudGx5IG5vdCBzdXBwb3J0ZWQgYnkgdGhlIGRyaXZlciBhbmQgbm90IHJlZmxl
Y3RlZCBpbiB0aGUgRFRTIGJpbmRpbmdzLCBlLmcuIFJHQjY2NiB2cyBSR0I4ODgsIE91dHB1dCBG
b3JtYXQgMSB2cyBPdXRwdXQgRm9ybWF0IDIuIERvIHlvdSBoYXZlIGFueSBwbGFucyB0byBzdXBw
b3J0IHRoZW0gPwoKVGhhbmtzIGEgbG90IGZvciB3b3JraW5nIG9uIHRoaXMgZHJpdmVyLCB5b3Vy
IGVmZm9ydHMgYXJlIG11Y2ggYXBwcmVjaWF0ZWQuCgpGZWxpeC4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
