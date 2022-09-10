Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9025B4733
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 17:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5B610E1E6;
	Sat, 10 Sep 2022 15:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazlp17010008.outbound.protection.outlook.com [40.93.13.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3382F10E1E6
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 15:06:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLVYTfMTkB44hO3SkpvP4Wac17AHdPO/uH5auHKq+I0KmQwxSjwAU7CQo/DOK39m50MXjCiI/wDJxONBPJMGwylQaomvfaoze4tOFc3Uq4CVJKyavCq6PFWcaLKZOoLHMpN8eFhfJtUlxPjrtqsZaQ4M88k/tgfxMT5TEy8TleacTvJ8iZhfLE5WqQD6WW9dUqjPXeHlK78IVQZFEogQxVKw0cnesUVixber88AJDtvIFxIL9G6GHGvwmLqSNhV8SeocnjEPB3edWPQTdkf036wfd26j4ePBJCeyk70BbNQew7vywkj1BXrFx9x7dWvSBDDt70y1v9HmnMBPZ/uLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7umyuo1pRGEwBPU8hrx75kjUEt88GIqElLrn+RB0Tvo=;
 b=UJ5L8VIlDu/qo/SvH+apDkTSCsNt052g1nPu1PMtygHz3kA2Hr1b0kHoIe0domjJzZioyzlWusXKmdAbOlHnLbGNfWVWOD/fY0h9HdzXQgpKfP5xjnHZLA6I3xpj4debC8EyT/mGHgbndfuqqsKBlpCXDaHd9XxVoDH1uqJTPF5s+j7dbRyMdRyTwsTefL8YeIdS+RVguIJbOAO0dbLPcgdb970Yjvz0hK6Wd7ViuQaBvu7+51meZkmfDjjoe+PoxptBW98lHQGOanWly71w2iw4m+/1C24NtHVrcdAYB0w3tVeyUGJnAT7bl1rNFuP4hnFzjnZehcqb5fn0bmNLuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7umyuo1pRGEwBPU8hrx75kjUEt88GIqElLrn+RB0Tvo=;
 b=WjmXQ5dls512r5mU+ZqzBRdBcA1EB9nGAsOA/PtzzW53JpZaNqkLkDHxmk4XYNumsaToAuFaacJB1D7rUpR7BPNF7YGCgqD/MCuqEoMTSSrl+sBhhWWAdHT13xBM3Okplv6SgEL7FmedgWYTafqr5GRV3zpCK94sA0b27CPBwkA=
Received: from BYAPR21MB1688.namprd21.prod.outlook.com (2603:10b6:a02:bf::26)
 by DS7PR21MB3078.namprd21.prod.outlook.com (2603:10b6:8:72::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.4; Sat, 10 Sep
 2022 15:06:05 +0000
Received: from BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::17f5:70e:721f:df7e]) by BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::17f5:70e:721f:df7e%4]) with mapi id 15.20.5632.011; Sat, 10 Sep 2022
 15:06:05 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>, Saurabh Singh Sengar
 <ssengar@microsoft.com>, "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/hyperv: Don't rely on screen_info.lfb_base for Gen1
 VMs
Thread-Topic: [PATCH] drm/hyperv: Don't rely on screen_info.lfb_base for Gen1
 VMs
Thread-Index: AQHYxFqeZyyTuGSA2UqSz5UbRFbjFq3YxE8w
Date: Sat, 10 Sep 2022 15:06:05 +0000
Message-ID: <BYAPR21MB1688AD18A748A82CD5DBDDFED7429@BYAPR21MB1688.namprd21.prod.outlook.com>
References: <1662734639-27164-1-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1662734639-27164-1-git-send-email-ssengar@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=53f526a5-f8ca-4180-9736-3c5df5cf04fe;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-09-10T15:03:39Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR21MB1688:EE_|DS7PR21MB3078:EE_
x-ms-office365-filtering-correlation-id: 8f746288-50ce-4773-fa55-08da933dfbf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fosLitUVrz5ScuSdaaiKXdBPhz2AOo+LaZJ+Due9Rau4tV6NFp+O2atzrkfTUiI02IGao9nZtQUj9Un4gLqJJOVrjdFplXyBH2I6HQNXu+VkysKFQs5oGwVVRaYB7NBJA+V4UV8Rxfy2EUsdfKw4VydRalydOcKiTAr/zbhE2x5OKU5zniXlvCZUbaGTTum6nIEo+lbksfO6yMo7BLN8a3FUyD4Qjo5IJn30gGVEoy5wIZYXaLDUlunzNcrBuz06//lIDi6pnYFdLAQfUdoTqEYcOlIYiUn8o6JSuIu9G5YVKLqvBXlV9X8GytkWRovRwCpM0HGBEGi+w0kM57m7buuvO2nb2usDgjxgxqzU+7xFAiifNl3cDj+qSrGFcYk63+GvgM845Yb4aCqYzg6hGKb6u2mw5ftqe5K81UiMP94OuKOZKKi66jEj8eOf2Y7rvtIfOx+LA6HS8TfTiT6XSI9CdAn4AhZGpwD5YmkNfgoeyx0kmQA7v1HUOWcgP/Abv+aE2SaqWBMPUZp/ktTyxN2Tw40SC7/QRxH3bAu1ZaGUspnzj+dDr0YVDLzqzYLmBEyNiMlMga8MaaKV0krzo7LvkEpgBSmJ97ETSTFvfkJNcft4r6ywtIDnqWYb9xrlHK1DQjG6RrK9bbq5SeCcZdhFhTIy4P8uN2jexLds/IfU68/pXFfZmzQg+5aNnplbM7jyTSlo/PZr1pfS+Bh8Mcd/AqUy0R+d2Un5PCbvv+K8ISleeCw8WNbggthWS6gzWFWKwbHBbpGHtXvNwczNJL26laJUmfTQcSQvgkifF3jiDgEY3WpGzfwZ6j8Q1I7k
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1688.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199009)(64756008)(8990500004)(8936002)(66476007)(5660300002)(110136005)(316002)(66946007)(66556008)(76116006)(8676002)(33656002)(10290500003)(55016003)(9686003)(66446008)(71200400001)(26005)(2906002)(6506007)(7696005)(52536014)(478600001)(41300700001)(82950400001)(186003)(122000001)(83380400001)(38070700005)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+ywF666e0VBI+VkkZu5tS30UI0O+mshjI0LvOgpIGGx4IJB+nNSyJ6U9BnSi?=
 =?us-ascii?Q?e5w3w3Y/h12J8aifO5DwOW3qn59NOBoiF4+3S42H+/UmKSubY7sKZi4okpNw?=
 =?us-ascii?Q?lXRZQW2FSuzU5FmYtw58RMklrg3lAsPERMWHNgs/LF5JupuuCQJ5HkK8YdJd?=
 =?us-ascii?Q?4lwuW/u+fQ3YetQ8Qd8O2ozjkpO0eY0X7ucGnfOXW9o6OykJV87faNInqxei?=
 =?us-ascii?Q?OrhprTKIQf0LOOcyrRz9BuV/gD4S6oBg/zCOxyMHQdCqRkffq9oiytYmIwE+?=
 =?us-ascii?Q?u/3KhDErUjPkt7QGItU/fsfXGcKD3nifpP3SBmsU8YuVoVbzwDwBBX2VXD0F?=
 =?us-ascii?Q?Bex8sNb0pWr9pHFjhKmt97GqI6JfAIm8bbTEQpx6DLOSOkngVddN3/8B2E0a?=
 =?us-ascii?Q?W8Y+6h0IdFEgDuZifsXJFjgojoGjL+dZmegRgSstSUBHiCzl/xHbWi0AwO6Y?=
 =?us-ascii?Q?SMWHHE7qMlPKHKG+2uCrbiHBO47ga0j7OxJoesbwfGvbIcnlHwyQG9PCeDhZ?=
 =?us-ascii?Q?0vsmuQmNtMsSpo3FqEfRoNApOnpdAc0RUzPKkvK6UPlsPbUtIXIZYpjfhBRl?=
 =?us-ascii?Q?xErffnKd2jJiE85oBfEaD6AUWht9xS5RitRH+kQQXwzmhXa/0VJj4lNhDM+J?=
 =?us-ascii?Q?oJSQ1QK2piN5mLwJi2jSaLGEIKCfTnyNpL1arxzRG0XNY8BAHhlFxywGPuM8?=
 =?us-ascii?Q?jozkHInt6AfwrwdAwfc/O88bGxUBlJ+jCSDBHwghcJIqxVJh7MCacgOm/TFB?=
 =?us-ascii?Q?gwS/LnNT9TcmIbP2hRTdqE20UwANxfTZ6l/GNymMynAxd3qzBFgyBcfeUaF0?=
 =?us-ascii?Q?e2JiV/r8WgQ07P2QCfH69scSVxTDSbECEVeAoYfIP0ABtEIhsXR5ReUb8UiQ?=
 =?us-ascii?Q?JdZ+xIMzWXX5EzWwfln0Zcp1uH9Sj0CuXeotmLIghA68D4Bq+fstf8i1jv8K?=
 =?us-ascii?Q?189ICMWJAq7cNR8Q6ZeAAMoFZT4jOsFvNYvJq2PXsCK+nHjEnUXu2zdbIWha?=
 =?us-ascii?Q?cWzDn5T+2KmESorF+n6Q1yNT+eFQRdh0yrTHo1HU9XGQl6xY/90G5U36kI8P?=
 =?us-ascii?Q?CJDnbncwgFlMd0gipShDe6JsLoBgG1gh+BWZN/oPx1DJob2NMKI8ejexPjjy?=
 =?us-ascii?Q?jT5p8Acxm81s5xj85eVE/yB4KCKUmoOEjXDa8KOPq6Z5PnOFNhTRlYEO4riG?=
 =?us-ascii?Q?pHSw+7WRc5QOtIxK7g2p9n/TypjnXMV2/n3Zifu4QIND4EFdPld+XozdNZTL?=
 =?us-ascii?Q?u6Vh4Fm3KJiHOK76656o2HuX/pjOt8MUkeHZ0JPHxEHegjz6BN5pbILTuic5?=
 =?us-ascii?Q?U/64AdoYnIfpIID7xrHcPZ6BruYKVEMStGYAOCmTvabZTtWMZKHS12wN3aiO?=
 =?us-ascii?Q?WHgF0iYSdcVKOof/Y3Kc/3hwS2twclg53dFvl/dOPLqhUcvSKwmjtHn2NChQ?=
 =?us-ascii?Q?ZSnOGjPwCC6A0np6n5uzTSkkZDTSorlAKJYr8hYinv5ZRjzaQQzu3vy84QxS?=
 =?us-ascii?Q?CwGBMKjVIgdsUuMJMwz73UQq6gVNQHoLdTwEdVq4BrOEEgUT/Hq4YftIc0KO?=
 =?us-ascii?Q?bVV77iBN1kcX1FqnvixE47o2qI5MaQYNzY5MLfi4fuHfX3csJ8j+fNugUEyn?=
 =?us-ascii?Q?uQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR21MB3078
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

From: Saurabh Sengar <ssengar@linux.microsoft.com> Sent: Friday, September =
9, 2022 7:44 AM
>=20
> hyperv_setup_vram tries to remove conflicting framebuffer based on
> 'screen_info'. As observed in past due to some bug or wrong setting
> in grub, the 'screen_info' fields may not be set for Gen1, and in such
> cases drm_aperture_remove_conflicting_framebuffers will not do anything
> useful.
> For Gen1 VMs, it should always be possible to get framebuffer
> conflict removed using PCI device instead.
>=20
> Fixes: a0ab5abced55 ("drm/hyperv : Removing the restruction of VRAM alloc=
ation with PCI bar size")
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index 6d11e7938c83..b0cc974efa45 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -73,12 +73,28 @@ static int hyperv_setup_vram(struct hyperv_drm_device=
 *hv,
>  			     struct hv_device *hdev)
>  {
>  	struct drm_device *dev =3D &hv->dev;
> +	struct pci_dev *pdev;
>  	int ret;
>=20
> -	drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
> -						     screen_info.lfb_size,
> -						     false,
> -						     &hyperv_driver);
> +	if (efi_enabled(EFI_BOOT)) {
> +		drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
> +							     screen_info.lfb_size,
> +							     false,
> +							     &hyperv_driver);
> +	} else {
> +		pdev =3D pci_get_device(PCI_VENDOR_ID_MICROSOFT, PCI_DEVICE_ID_HYPERV_=
VIDEO, NULL);
> +		if (!pdev) {
> +			drm_err(dev, "Unable to find PCI Hyper-V video\n");
> +			return -ENODEV;
> +		}
> +
> +		ret =3D drm_aperture_remove_conflicting_pci_framebuffers(pdev, &hyperv=
_driver);
> +		pci_dev_put(pdev);
> +		if (ret) {
> +			drm_err(dev, "Not able to remove boot fb\n");
> +			return ret;
> +		}
> +	}
>=20
>  	hv->fb_size =3D (unsigned long)hv->mmio_megabytes * 1024 * 1024;
>=20
> --
> 2.34.1

Reviewed-by: Michael Kelley <mikelley@microsoft.com>
