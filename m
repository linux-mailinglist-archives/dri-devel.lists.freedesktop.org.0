Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C94A14102DC
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 04:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40F16EEB7;
	Sat, 18 Sep 2021 02:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0691B6EEB5;
 Sat, 18 Sep 2021 02:03:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJ9ogV/g76IyhANF+np7sYRjdkjcn1shpEB025F7yuQiq+ynXSAQjDtpY3e+z9BIUAf3FGGl3CISQBkL9siWSQOUA9llNul+QP/e9k+Ic4MTTLvdilE5KyHmASLir4shsWHU0j5pWgbhc2YJrqwqI6SBJu42yPkJ5skg4moRsq5AWxS0chANSrfB8gSTPiERXEJfildOfwX8iZ3o6BiApWKS+aAwe2Od80X7y6w1Fn0c/ufhTbsLrnfeyXBIzk+QuOv8IMWKFjZ4guWQnELrs6x72HZ0MGSF+ILwKBMNL260nSTeJYcsza0+xazwoIX25TFBBhPLQLsHWMF92D/xJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Dd9BlHk5XQlf6K4FNONx6VveiAvrdZ5DcQsbh1C39MM=;
 b=muOjJe+3PTNN3c9pDNhsm2pzmCeGwNNEoDUErdES/cjNgOn9DZZVEenoBcRgTIVKCL2kXZFNIZMM9PN3Zt0Y/TNYyaYQkGHcRvgBtPjBjsa6HwG04XQoY41Ac1I3E468Uzi7QFSY64msQdLJDToNxxJR9LNafpysah5dvh8PgLOIfqyf0mtVHCVgyzPFdUXXLY3umN7UjpalcsDBfuvH0vCngvb5i5auKJAB4K7bgddQIYY0WXQhAJLafp69azW+2Y97ZpukvddG/Sxx5xgFqfEZ2XLsWI2S+dfixxeAZio86Y3GwqzfId7eU5gZ1xq17XfeOIe6lsxzdkWuK1CVPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dd9BlHk5XQlf6K4FNONx6VveiAvrdZ5DcQsbh1C39MM=;
 b=ROWOM3zjMbIuU0KwYm626qrI5Fmk5iGwPmbSMa6GumO4BYAEnB9emDAq3PWc+v5jLS1AbUuvk26PQFuDhnf+O9/p5XJGbsO4rWOs4W8Juml1aGkmD45/uYoBrC1jNP4AvbmyLObRI/mhAC1jpGSPH7UxnWXdHhTZrhvitCQOQp0=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB3082.namprd12.prod.outlook.com (2603:10b6:5:11b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.17; Sat, 18 Sep 2021 02:03:12 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::35c8:7b2f:1090:d3a5]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::35c8:7b2f:1090:d3a5%6]) with mapi id 15.20.4500.020; Sat, 18 Sep 2021
 02:03:12 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 1/2] MAINTAINERS: fix up entry for AMD Powerplay
Thread-Topic: [PATCH 1/2] MAINTAINERS: fix up entry for AMD Powerplay
Thread-Index: AQHXq99PEnd1TPBjn0mErcSMNMi3qqupCsgg
Date: Sat, 18 Sep 2021 02:03:12 +0000
Message-ID: <DM6PR12MB2619F66E5F1EEC39AAAD92D3E4DE9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20210917161540.822282-1-alexander.deucher@amd.com>
In-Reply-To: <20210917161540.822282-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-18T02:03:10Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=e16768e7-edf2-4b50-ab5d-2ab74ad3a315;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45be5560-3176-4c0b-b21a-08d97a487876
x-ms-traffictypediagnostic: DM6PR12MB3082:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB30826B5F0D8A287E5901C179E4DE9@DM6PR12MB3082.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ut6sE4/iP0ohogXBuTZcebXX0UtIKW6CT6mzb8SAqp2xDfv1vluSYmh+7lrR7bkOQLIpQ4Bdy5AK/T8QPvG7MFQXMm+S0bXJsYZpLova6PoDtn1RjVr/NpKxuE5jT3M0fgTYc0/woLhKiTnXaqK1toKmiw2V6ItG9YH3aa9x6GSG0SxOvBoaK+KR0qAzIlcQ0SmLPs9CtdsymhaMPtpmAYEs2H5L6xp1ocdRa5gdiJey70oZPUNaLQ7RXr/wQCxsJh4MzUVP/m5ZY/CifbuXq0Ldd/cBUW0F2du4Zb4reVK9hmSpjHsXLLOxOMwfEYUj0ZFTOTwXq0f2bD8/7VCB9Ih6U1zNEeUHTKgdDzCk3H5PZOAI1/TIA8rNW0DJOnhLT8UjCgUKEJVP+N91MKYsL+WKyH0VYbQUVI2MIFqur3+hQ/KDtx3MvuyUEZhSTrgcqWyXO+dKQAJbyOAM4GYNSaN6qquYKyUAkhPMAb+998uB688QNf1Yvksu1ecXya+SRmjNvB//KcUkrE5ywoYqXHuFdR6rCw5xZLa1HQqCYpltFZ+QqKtE43AzQL6URv39JZYXHeJefOi41jFagUGwDcwibSpx+hUp5slCAWKf+VljwMSGH+aNzV4oX5+JIlepU3j80dFURfW95EPY07oes90fm6QTrkkCOSwiFiX5E8vXBQQKQ/6Z2ZfJYiiWt+L0lfafZAD3hle79G0W9a4S6jhqxraXUPFt5QRYfObM9jrCGJW2zTNs1G35wikSHlIBzZxiGjAot/UmL4LMgNv+uvTjRKx9cL8/4nLC35lBSw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(86362001)(8676002)(66556008)(110136005)(71200400001)(64756008)(66476007)(76116006)(66446008)(53546011)(2906002)(83380400001)(66946007)(186003)(8936002)(7696005)(45080400002)(52536014)(5660300002)(38100700002)(478600001)(122000001)(33656002)(55016002)(4326008)(6506007)(450100002)(9686003)(316002)(966005)(26005)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BCRjSJT7yx0+m02BO57e83jOQF/XFdXKf8nMA37G+aXcqsCY0sZ2/K3Ym+tr?=
 =?us-ascii?Q?X2wkQ+XvMxqgE7hAGcsIfOa6qaJ8yd4YlQVZ6Wtv/2rtRbZaHPclqAAJ42ZD?=
 =?us-ascii?Q?4hRkS1v5rgjEuCfY3v3IaqISPmezuR2EY9YwUpbZd4mjkNBPZ+36P8QJO1Qo?=
 =?us-ascii?Q?VcvDhoeQVb1GyWl609CVD7sZj5fTLSJST4zFuQ74Hzq0fQ275eD/E1101CAj?=
 =?us-ascii?Q?tSQg0gQ/ryEdLnyX9WvetiKpYKSOP7FSP8Xaf617CRdgcpPB3vTnzQmivHTd?=
 =?us-ascii?Q?OagiU2OFciKtjrIP0OIgLA3dq7tFlbrXWfrVQkCJfaATO+JtxiNaT13SuKGB?=
 =?us-ascii?Q?qlaeEe5FVUCTNfQA3Ao1w8QUtkFNS9PRyimgcccdWZFCamiPadCl+U+/4H0Q?=
 =?us-ascii?Q?xDKxaWvWUtf1H+wE4+3J47en8tw4E9BFl6aCr3m2gN+/ko0kO94w2nDqAi1b?=
 =?us-ascii?Q?Q7NvQX+yPDMUGSCk04FGZMzVtsLqdlocaRamI5TyfXOyynhIECs0/6WSIFT/?=
 =?us-ascii?Q?NUkIKCDbJmZ0tLp+fW/uN0+FZgLglvNWjj7ie8CLjrVcThZ95xD54P2/YfTo?=
 =?us-ascii?Q?t+JFkNJE74g2I+oksQbCKmfrWCw9a5fKETjf87svFiuI2+TIr/HKO9VD3q6X?=
 =?us-ascii?Q?qEv5Jrxfh6yR8MrgyBQWcokpEu684EUJ5oo0kb/l1GkEac0i+0/r0MuRirRg?=
 =?us-ascii?Q?An52OCLCAvFwEjwZelXZonro2oSlVqQi1NLELm3hnkkRzmEdv9L7WpwI7rLa?=
 =?us-ascii?Q?SaIu+5njr/4qUX9jb43xJb4McS65zX90lPTA64FofS1Xx477aS0n1HRjpGtQ?=
 =?us-ascii?Q?OUFboUsvDAZAYLaOy03AN+rmiR3la76HNiuiSb2vIaMnRxmtkZ2kXzjTxfQU?=
 =?us-ascii?Q?aSB5ITTH8Tbx6D3/KgG6fvioS6owfurEaF3o5uzZhPoCD/d3nobgsLr2cANs?=
 =?us-ascii?Q?ChfPd2M39WH13b2V7RHdxzdc7f4M4NP69spoY/BaiSmZ0xsqk4a22Fd+urcq?=
 =?us-ascii?Q?vLE8gRC+/lQfKj57LJqrVeAMs27PWBYOwPOofZZPozB+MaRq22avW9Pius9T?=
 =?us-ascii?Q?9FrjT9ZOzzz140Z0aH4SkirP8HT8ayNqTZdRGXSCksueRjCIEjFkQJLi/ufb?=
 =?us-ascii?Q?S+xkq7WeS+MB0ccASgR3SHuEA6m/Gcbtdhp7qmN3RrSkVonCsO1wI3AZgS2I?=
 =?us-ascii?Q?bdfdMVoSGQOJZyepjNftqNMQIxoksjiwTb+n4JeLerTegLi3/VHVgCKxaljM?=
 =?us-ascii?Q?criOLojddftk29G7bpYT1n2xcvkfHyHeo7zeQXMsZ5GT8uy+mUZQt7jZdtJ6?=
 =?us-ascii?Q?sLkkUKDZX5D+sO/9V7XdDxFc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45be5560-3176-4c0b-b21a-08d97a487876
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2021 02:03:12.6354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iwq7S6F3cyC3zQDtFwrTWh9x8v+rxHUHa7Wc2ENFoYoJcNklkfAD8mNltJrIt7SB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3082
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

[AMD Official Use Only]

Reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex
> Deucher
> Sent: Saturday, September 18, 2021 12:16 AM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
> Subject: [PATCH 1/2] MAINTAINERS: fix up entry for AMD Powerplay
>=20
> Fix the path to cover both the older powerplay infrastructure
> and the newer SwSMU infrastructure.
>=20
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 851255b71ccc..379092f34fff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -972,12 +972,12 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/amd-pmc.*
>=20
> -AMD POWERPLAY
> +AMD POWERPLAY AND SWSMU
>  M:	Evan Quan <evan.quan@amd.com>
>  L:	amd-gfx@lists.freedesktop.org
>  S:	Supported
>  T:	git
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla
> b.freedesktop.org%2Fagd5f%2Flinux.git&amp;data=3D04%7C01%7Cevan.quan
> %40amd.com%7Cb6158a1eb6774e147b0008d979f67086%7C3dd8961fe4884e6
> 08e11a82d994e183d%7C0%7C0%7C637674921632876884%7CUnknown%7CT
> WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC
> JXVCI6Mn0%3D%7C1000&amp;sdata=3DqcP4K1JnXBAOluo7%2FwnoQUofGBN
> KpbTQJeOKPnUbmc0%3D&amp;reserved=3D0
> -F:	drivers/gpu/drm/amd/pm/powerplay/
> +F:	drivers/gpu/drm/amd/pm/
>=20
>  AMD SEATTLE DEVICE TREE SUPPORT
>  M:	Brijesh Singh <brijeshkumar.singh@amd.com>
> --
> 2.31.1
