Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 210126B344B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 03:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9684710E2D3;
	Fri, 10 Mar 2023 02:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311E310E2D3;
 Fri, 10 Mar 2023 02:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3/ICjbQVgULP53XrU98s4OMXggBFM7Pbjx+SkkqFz10ob4IVamVElpJ6+AsEzmBXeX6oAlgq33D5KNuUNi+vX0l+mkfj1DeujtZuNLhgUduqbYerU4KSkjQkxMYk02ypCLGBSvIWgfItIHcLeJhUDfhqJ/gVBsWI6bhb3bNLxpglGCLOM6846X5CVVap5snXwjXCPsVVdmJzt13nC9O2b9QYxtdiJwXRxSq785A4SAPo68T3XF5ds6o1UPyit+PnQEEXhILLNV2k7OpHA+XNzFKmdKRT20DcHTpJ4dlYYeLEGYZ92UJ+9fQsP6sk7hWAEv5WMQ8oQCzVIqCYe4EJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10J0MijstHqxvpZIkREPQTsC1RD/Om28xHrvkn931zo=;
 b=AEDLB17Zxc+TSNG4SYaw7JZi/Wz1CNZGgo1gtdJ/ASylZGxq4l+otA8JO4Ltfffur2V0ESQoMC6y20VD2uzBZCEFHoAoe6m069+EvnKT7Psy1p+LiDMlT+9amGGuF8C/3dUWQKs5E49wUDLDUj3bldSoVmQJxK3PIf0trNFH+2ZIPkhgegYZHYpujS4C3aTGDFpKjnzpbU76GYumn3sbrz4YthSZOc6gBZjJ4Xy8h1UVpx7GAxoxiLJ0AwbakWDjoaOcXgu0nmAFsIjQMf+1ElmzRIF+KAaZvJRvJGeLyMKLzGjHDUdC45xJn5OKBSuuqS3C2/cfIO21IfuAeRIMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10J0MijstHqxvpZIkREPQTsC1RD/Om28xHrvkn931zo=;
 b=BU8Ud98iyQjdSlS6tJ/ptp0nB9Xs9YoaLdFAMZOsv+u90SStExWAgdaHKnWDe8tnAIGUMMXrERNk+q8EW7ykeSqyvaLBT6DaSpN8pwGuXbcUjDrstQD+urE6EA5GoFBE1c/z1oPMh31HZoUvhBkQM8c08i7BXb7fX4rsknMrTt0=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 CH0PR12MB8532.namprd12.prod.outlook.com (2603:10b6:610:191::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 02:34:49 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3334:46b8:da25:16ad]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3334:46b8:da25:16ad%5]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 02:34:48 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "spasswolf@web.de" <spasswolf@web.de>, "mike@fireburn.co.uk"
 <mike@fireburn.co.uk>
Subject: RE: [PATCH v3 2/2] drm/probe_helper: warning on poll_enabled for
 issue catching
Thread-Topic: [PATCH v3 2/2] drm/probe_helper: warning on poll_enabled for
 issue catching
Thread-Index: AQHZUuv3MFaL8uzT9U+5UnJDzEt2aq7zS8Pg
Date: Fri, 10 Mar 2023 02:34:48 +0000
Message-ID: <DM6PR12MB2619D2BA4DB1C093E1CBA3D3E4BA9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230310010136.2810776-1-guchun.chen@amd.com>
In-Reply-To: <20230310010136.2810776-1-guchun.chen@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-10T02:34:45Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=4e45923b-0060-4326-b418-ed097c2fe7fc;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|CH0PR12MB8532:EE_
x-ms-office365-filtering-correlation-id: dd939e7b-66fe-4115-d27e-08db211004d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /A0ASxm35sCZrjI+7kE/k070q4U912Bbizjgzbg7Clplrb70sL1KxI7WOvL8c3PgvWZTnymTmRYzj8iPYlXLGZld+pYpsYlwqnsq6EHZOYMvbZOXWME2ChI35nKxVvpaGdcrPrHwB7KZ1t6tpatcLWvuYyE14ZfXMeuvrHQRuzSxPQM1EV+nLoskqbMJvCZJsFRb0Qvjm+8ksj/cQn7FCpMlhGo2/VEa2upVJj4Gn1gzbloQtTQlbIb57YnXmmDfpP5MrxqZM5O37KmvKxpmhqldeNj5QxgBbe1OKBz1J4Jhve6XFF60n9x8roEMMczteJLE+CkiwaaSMUBJz0mdC7BE+WQgXKUQY372WxB7/jyyOg0l0abVX91fjMeWBPEAsOwNZt78+DHsRBp7JSTmHGY5gS8ZFvNqczg4HCyGLTdMVXe+GBlFLyyes/BoZ3DRHX6yPn7rvOC4KPPM7gss3qFszr3VccLOlb790ekXFR8IwlUX5lUek7Q3suzfYUMRdiZ6Tdnc/LnR4Y6wXGmDHy2epgMjBvj6MQwdtji9g/II8TAagFRBtf2cUgbyC34QgyiAIDw4wbSx4O2KFPmSGf/TNojNauC2zuP39HvRZbGygr300epppci2qFGadq1K/mwxao9ur+hEtSN11A3JOxnZJ7ayAiQ4mCnyC6c4PTQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199018)(33656002)(110136005)(9686003)(55016003)(26005)(38100700002)(86362001)(38070700005)(122000001)(6506007)(53546011)(83380400001)(186003)(921005)(4326008)(316002)(5660300002)(71200400001)(52536014)(41300700001)(478600001)(966005)(64756008)(2906002)(8936002)(8676002)(66946007)(66556008)(7696005)(66446008)(76116006)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U/ExHhYpuYhTN+L11bJCYJJRRqFnfngRR5lS3V2laRhpyYNmojYYCx+7Imma?=
 =?us-ascii?Q?VS89cTWVpoiW20/fC78QjySm7+oVFlNxqADaMdaQWq8LqYBGixAxo/f+6lhU?=
 =?us-ascii?Q?ZsA1XAx4VG/d8JNyk9ey0UqGtXhlzBvL0M2DFVT7HTO+QOOU+cYInh+xrTE/?=
 =?us-ascii?Q?jajU5rKRWyeyhOfBZZGsOnOm69OTQKDJuurTOGAGn+FhobbIxyuk5kvP4+GU?=
 =?us-ascii?Q?Vwt67vF5Q5FAAWIQ/7wGzU6Zd92kiBRJrZw4kFAnsX2Am35pxq+H2NaXANty?=
 =?us-ascii?Q?GKRXNh1+KVOlUHUgy4CkOtGetn7zXBSkBGDl/0DjPRqFD8g5TXatjLJPK/9W?=
 =?us-ascii?Q?sJdQ8eTRLgIgJU7KIOCWcTHPDC4tVBQFS7z3A1+4BT748Ewsao9AZVqc+k7l?=
 =?us-ascii?Q?axqLgCkFD5FEIBbgc/NWMusxIg04CH82l9bjFacBy86+AV7wjl05X0XLToF6?=
 =?us-ascii?Q?cVeHPdVIuomg3i8zFoVuSKOE03XOm7h0uT9FmDz970dgKXRrad7XA5fw/mAj?=
 =?us-ascii?Q?xBTkACyymNS0EiCiHMUL8n20QruR7P+jD22wHbfYLfIehWt/YfVPn9wx+YQZ?=
 =?us-ascii?Q?OZfSfdAIVhuPMTFD6lbyCQ0rP/+LTG5i/hqwG0qqtLojJNQaUaKFUw2BiJBS?=
 =?us-ascii?Q?hTS7CKC/sjDda6p+Yrbr5yWxSO+wnbK3IVxCGKeyDgMrh2AyUl/DBJcTpMGS?=
 =?us-ascii?Q?k/JRFpKLYAl5B1xjC7UVuV6oCTYY8pMmgDLs3Dyh8q/ZNuKxU9TwohVFzR3A?=
 =?us-ascii?Q?uEhNCQmsknEGM/8qc1VE7y94P2S+6vQe4OLFkEbsi1qCRwaxw1WcKsH+Lxn+?=
 =?us-ascii?Q?YUQue0PTjQ6wuOnsx2cHbkS0Ro5mfnMdEeMsiJyK89yzqcgsFygbkoFGmWuJ?=
 =?us-ascii?Q?aDnM1mYKuZ/9ctvU4eSDc41z80LLsM32Mgk3Qw6iSys2ES/uuBYsqpVOrTYw?=
 =?us-ascii?Q?hsMLy1lHdPbxpekX3Exae07MnjxNjv93YhMXSJT58hnjTZWyO6VQ6BIQpLnk?=
 =?us-ascii?Q?GLaCHSlQX7NSb7TdjWSKZ83euJp+PoWOdAGcou1lM4GU5ptMYjqlJ0cu60ae?=
 =?us-ascii?Q?nhl++JI+W1MYt3zlNWyA2LRzxLVsltpVkSN96F69sRHe0yVNocP4JQ8Pyjw4?=
 =?us-ascii?Q?NWZYrT1Xpoac9xPlnbfAzCCh9+R6mcWkVtHychBvBHTowUWV67VFIfp7m3y0?=
 =?us-ascii?Q?bvmYde/ShOeGR7rbBFOf0cliVhj3pVtXk2Bk+92f1s9zoFdE6jIdWsdq1jAr?=
 =?us-ascii?Q?cyo17z06fvwhaZqo3Q8ORcrCJ/25GxYZf8O0CuS+R0P7jn0snUOl4K9Qsrt2?=
 =?us-ascii?Q?+Q0WJTelVQtVGLG7hPIPqituOuY+mXO7ALHBzv2bqCWjrn6OVvs2R9/f1HPG?=
 =?us-ascii?Q?YInRw+who+zq3Gy2781JJAQhuOJfzyh5THvFRn4/a13QcXniBx5RctoUfMRw?=
 =?us-ascii?Q?n8J3IYLmQ8eYezScPsnxmO88U2HvHhRI4qyDuM4YjWnAeA5bp3GSeBYFNH5H?=
 =?us-ascii?Q?8yvBYAu7/o9s2CReNDjwUJW1otKrOrLsNsEqk0znK6LkNCtpfFlrmKmlH9Z6?=
 =?us-ascii?Q?5Xi0NrqbDw4260adw8c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd939e7b-66fe-4115-d27e-08db211004d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 02:34:48.7060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JnHtVWd51+f/xLSEBYsndqHS6xBMbI2DGlMnNoa9dA0Cv8Adh9t2kNCJ8zKMFQvP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8532
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Series is acked-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Guchun Chen
> Sent: Friday, March 10, 2023 9:02 AM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> Deucher, Alexander <Alexander.Deucher@amd.com>; Zhang, Hawking
> <Hawking.Zhang@amd.com>; dmitry.baryshkov@linaro.org;
> spasswolf@web.de; mike@fireburn.co.uk
> Cc: Chen, Guchun <Guchun.Chen@amd.com>
> Subject: [PATCH v3 2/2] drm/probe_helper: warning on poll_enabled for
> issue catching
>=20
> In order to catch issues in other drivers to ensure proper call sequence =
of
> polling function.
>=20
> v2: drop Fixes tag in commit message
>=20
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_probe_helper.c
> b/drivers/gpu/drm/drm_probe_helper.c
> index 8127be134c39..85e0e80d4a52 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -852,6 +852,8 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
>   */
>  void drm_kms_helper_poll_disable(struct drm_device *dev)  {
> +	WARN_ON(!dev->mode_config.poll_enabled);
> +
>  	if (dev->mode_config.poll_running)
>  		drm_kms_helper_disable_hpd(dev);
>=20
> --
> 2.25.1
