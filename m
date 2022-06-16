Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CFC54DEC3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 12:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CDC89FAC;
	Thu, 16 Jun 2022 10:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2110.outbound.protection.outlook.com [40.107.255.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E816189FAC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 10:16:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUYV04sTr+hfEZWT/P8r41nuCRaR7WbdxygoJa/B0ujBKP81SDS5cqa3yfDwGA3XB4o9+Y0brBqH9S37epwwSoW7hpyodZeu3Ecg3Al2WyTglPVd5nK1xZinYN6gf+rvSdUQGhur38evweeylYD83Tvz7NLuvxEpc6iAUTWPuEG6Be+pEIAYJeu5zjnUi81k+KgSSzWHTT+9OJX+QoEcu5RiT8UHRKqC6iA02nVEM7rDI2W98kym8FiFsA/2bG6DorGiMYUOrugXR+sQS+JVbZ9/9g0WHMSDycrusSlbKtF5qJ1XAKjo5ScS+asGSZ0Y1a7+Ek0/tojjzLuvIuEMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWtoDcUCX5zzVwG/ipCoPQOc323RqHXTrsUn62oILt8=;
 b=XxL4dtghhw7pxv5jUZQ4KgB1ie1Mr8kVmtGVT52qWXGIrELAdGphbzS9FDFUGwKs3LOz3s1oFcAvMTjgdDDHw/Qm0GAQXzTgpqiyOOQkRDu+yRfo73eqKEQClvbP7mUIl+UgkrejPQgRjtLoe9cALgbLoyENzvf4ql89JwAFyFJPkihM/cr3bgjkP0VGJyXKY5CcQG482ZBNinkWhpG10g7uU21oyzKRAbW0yyo90FkFGK6X95+tJ/pl0vlZ43DpUN/Y9WJIVXdreIJC8Yx4zGXX78ZeqAleXKnudyO3MyEAUfq02mMQwzIK0FGdfz4IT7DDcBKGzFz+saCrSm+SPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWtoDcUCX5zzVwG/ipCoPQOc323RqHXTrsUn62oILt8=;
 b=p8BH0ylXvxVSb5miotC27SB04HBR2pDx6YJ66McfxyY+BCUHdai67VjrIiu91JQTclOXSye3O39/5GQadVU3IN6PFtiasc8eUw7ldGtHXwRThNidr0lvptAoFpg84X+LCz3K7QBalm9YR6+8dfnSgBXcTOxxDQKRERwbHeek9MTUG2arrrurL9BostzizlNAntweAaM5ChGnTi8TbNXLeB+RQDh6/TbLJi7gqhOix0c/mmcwpwetw8AHEBoK//rQdI6nBRl1A5AwRMJuQTp9/VNcWrrvObCqB/B1/ZrXGX/kFzGoDOKVj3fG07mrT8xezmyUW+XVjj8bKFSaYiD2pw==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by SG2PR06MB2764.apcprd06.prod.outlook.com (2603:1096:4:23::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 10:16:06 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::7c42:9783:92c9:f237]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::7c42:9783:92c9:f237%7]) with mapi id 15.20.5332.022; Thu, 16 Jun 2022
 10:16:06 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: RE: [PATCH] usb: gadget: Remove unnecessary print function dev_err()
Thread-Topic: [PATCH] usb: gadget: Remove unnecessary print function dev_err()
Thread-Index: AQHYgWATtppy2IZglE2yH02xMWGTe61R0ViQ
Date: Thu, 16 Jun 2022 10:16:05 +0000
Message-ID: <HK0PR06MB320275CCAE8E424810C8907F80AC9@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20220616090410.128483-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20220616090410.128483-1-jiapeng.chong@linux.alibaba.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2e87e38-09bf-4375-9397-08da4f81397c
x-ms-traffictypediagnostic: SG2PR06MB2764:EE_
x-microsoft-antispam-prvs: <SG2PR06MB276475A37EE9ADE8EA8CCFB280AC9@SG2PR06MB2764.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wEG0D9mb2ByLwYRQS++geUu3JulF13vKfAPkmP5tSuZgyKJ/7L/KF0dT9c7ztZqyProP10fLIN3v9pdtpWI4VNHq+7zN8KFhKNUEBFP3O+X0UiPmZSlsG/3ZMrPZrwunwHPAzjzAFFpabuRSkeMnwfEFguzy88vZXkdg1By5bQQq0S3kEl3Fxtx+wvSRYgWRRiIIRbQaNm/klvVvhuEB/I34/x+Va7RO15hmx471ljefVv+AhAauIqcf+sVrNivPIEkzBZ1bXXRsjeJ+Iza4Ur0sfGvHjuBDdFLnONIfG3bgR+uvpX+jgJJq71nWYYxyO/LK4duXyFQghZZe5ba6Ng2ruUNn2s9Xt2iEVB77yyUsLfXkKsRARLtQDV0wKFE3EMCratfZVng0Bl+6YwrdlR66cPcd8iTH7+ri05hPBqWscq0qgSzXsw6XdLxSmoAuCNgAjQTgwdFGmILqvqICYiidrpSN0f4LIXlFH++z3CKOhu608WXzHexBz/n0i2UXTxWFSAqhprMZqNyLm8o+3ZypDC5AtqUF0E+0jxyf2lG+shwV2SEW1C8F5/NQrWqsTCpvIjdd0TXRvl3N+FEZRQTSAHUwjtkPAB+Gpy4T3eB31yZT1znqgybUUlnjjLJF2LUZzBH5AZid+ID+egfAwMhFPi1hSQ3epUQdR0iwyTdPlLiKgdmYNi694Mo8xo8Nz1LL9lD3+L1JklyfQxkJ4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39850400004)(366004)(136003)(396003)(186003)(41300700001)(9686003)(83380400001)(316002)(26005)(54906003)(6916009)(33656002)(7696005)(86362001)(55016003)(6506007)(66556008)(66446008)(76116006)(64756008)(66476007)(8676002)(4326008)(66946007)(71200400001)(7416002)(38100700002)(8936002)(5660300002)(2906002)(122000001)(52536014)(508600001)(38070700005)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hRoow4H3k7kMuIKUf3yIpFUSQVN51K+JKiUDbXoaQsa8zOREUeeKF/nSPVIf?=
 =?us-ascii?Q?25jJtUNUJMYPzkGAEdTAZfNz4URv/s6APABcxClopOA91se7rS4j3G+ESU8Y?=
 =?us-ascii?Q?+rCdg+kGyXQ4nq8WIJcJTIMXQoZQY+Hi+VeUIibc1rmFWrcbGSc+mGzMcAxi?=
 =?us-ascii?Q?EkQV0ygt2JnyOlullhaGNwHJL+1z7+QBOW2ZpAwp4pd/6zjajt9gjK5vo9FM?=
 =?us-ascii?Q?UB4feRsBdxRMpSrpbrEf2yuAJ91SNIQEGUmSVRn5fqq82kTn38/xe1KlwF9i?=
 =?us-ascii?Q?E+7XUq9LQuK8PD4yg+kLEAFO7uFCcJ2gpADZ3ZbngBL+88VJpR1cUbrHxZ9S?=
 =?us-ascii?Q?AJl0h1zkceirv5QNP8DG5qZy7HORXfXQbJTJxDFlHYmK/SdGyqjN+t+FV3uM?=
 =?us-ascii?Q?+6CC5y8ZhJa5I2m+I5FVqm78lTj42nTMDydStoonvBXcsuuz2IcRiJawSyaF?=
 =?us-ascii?Q?ZIsMaP9NBvOnK2gwphpNc6JkS/tPdG4+DbCzbNUKE0KDehnxMXicWxQyO4Tp?=
 =?us-ascii?Q?3S2SzBrbZj5U0/SMV0kQrwco/PUc9jOMPSAgUznerGYXE1xJSvKT4ZOTJn6y?=
 =?us-ascii?Q?8spTn0MSimg0i/E68J4mUZ3reWcpx4bV5LqbWfr4prQV9FilSwNfcKBJF4An?=
 =?us-ascii?Q?d/0IXdkPByG1/j51DakICYHqXf+1SniK9kifK9s8B2EnIVBckVNVusZdbfm/?=
 =?us-ascii?Q?fykTMxA/rPWaoxT7quXlIXZVHe7L2wHEhOHJNJpgnY86vKJ8vkjh9AHi3wvs?=
 =?us-ascii?Q?pnOmKzVuw/IaV+9B3aamtVdoXFd7/5QY7SneT0oLD/6qSHuV5pbSQff8N4Co?=
 =?us-ascii?Q?Mrcm3KfU5baOIaTUANeGE6yF47Jg21cZ6iDBaVXAdXBPXbKTHVmffvlcyxTL?=
 =?us-ascii?Q?M3FFjPzwR8aoBakgpur5PaPHG28UVbWvsSJPYQRDxNtr5PBDMg1Agk4DTqGB?=
 =?us-ascii?Q?7l4w3K5kzR6djGqmkEO2obCUWEkFJqTCq8Kv2qr3JA6cErSAchktPzt7pN//?=
 =?us-ascii?Q?24+AtmQg+T2fnOUclClJfsXdNU3Zj6InDDzKH2wZ7BPkX2gU/3fofTIHpiGi?=
 =?us-ascii?Q?7L7cXRJnZxkB1J/mlez6TQiaURIXVxELySFxIvPRjNEs98lTFuFifO/Oshz/?=
 =?us-ascii?Q?6q58t/7C8Q/yzVb216zDD7j85Nf1zcGy+uWzSFnqTCYD4bYMFpyBfCJIspqk?=
 =?us-ascii?Q?JAIljlmmmOrO4ro1hM/V+1hx2bAOOXr3QLNylsApQEzSfPRr90hjhKJxBiF1?=
 =?us-ascii?Q?oBXb72XP+yEK3RvUMeXiY2V+qG4d0WyZgwIDtcMyP86Sw3Pjh0eXdnve76FF?=
 =?us-ascii?Q?DatZmlydGGPDiGzNYJWw2h7rCJkgLxEmJULnlNA5Gc7Z7WU4rpI6hZJdGjXN?=
 =?us-ascii?Q?fkTXEx3NxRh10A8BZgI5Fjc/OdE42me1Sba0p3CJzVcvaxXjtxjG2Ov2qUcb?=
 =?us-ascii?Q?0f+3HnMnz4SIVEBlwuMZsl3OCntGXAM8XYKGS+p35L83EwJ1LY5M5y8rh7Bg?=
 =?us-ascii?Q?uEgeumLO55Xetk84cB3g3UPsRqJi3g84rFLuAhYmrjonYYj9CfRZo3GRoRO2?=
 =?us-ascii?Q?XXOB5fEXoA5XXkHsDjd+SSOBejQNrf3jMHMKgJGwSG3ejPuHKkP9VicQgjFb?=
 =?us-ascii?Q?64XOVqULPSVndHzs2JTE94waornqaKrsHJEbBBDg5YoM9N/YsRziYJFRonco?=
 =?us-ascii?Q?qjDbChoocL4Gom7Qs+TUB/URTw6gbjYf/vEkZ3/l1bkMUrl19J7UOzr93inm?=
 =?us-ascii?Q?j3Sz6z+clw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e87e38-09bf-4375-9397-08da4f81397c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 10:16:06.0031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: udPFDQJgl1IULP9pVKz2uQDHjlp7uFavP9NUZ8dHHwhQTtPs3zm2ZFM2BBe31pCObHltjYu1SHzmT61PLKwnjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2764
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
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The print function dev_err() is redundant because platform_get_irq() alre=
ady
> prints an error.
>=20
> This was found by coccicheck:
>=20
> ./drivers/usb/gadget/udc/aspeed_udc.c:1546:2-9: line 1546 is redundant
> because platform_get_irq() already prints an error.
>=20
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Acked-by: Neal Liu <neal_liu@aspeedtech.com>

> ---
>  drivers/usb/gadget/udc/aspeed_udc.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c
> b/drivers/usb/gadget/udc/aspeed_udc.c
> index 1fc15228ff15..2c3dc80d6b8c 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -1543,7 +1543,6 @@ static int ast_udc_probe(struct platform_device
> *pdev)
>  	/* Find interrupt and install handler */
>  	udc->irq =3D platform_get_irq(pdev, 0);
>  	if (udc->irq < 0) {
> -		dev_err(&pdev->dev, "Failed to get interrupt\n");
>  		rc =3D udc->irq;
>  		goto err;
>  	}
> --
> 2.20.1.7.g153144c

