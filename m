Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB9F4EBC7F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 10:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3C510F65C;
	Wed, 30 Mar 2022 08:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1B910F666;
 Wed, 30 Mar 2022 08:15:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwbJwpj/gx85Wm9ixEoPKBtCSZUllxm6OVFA9pburaYeyuZoCBWfTlj3nr54KiN9yyu7v3jOmixfsL6iooe7Q/PrzglyANRaWgW+Ha7Ga6wA/IpDL/y2QQXC+wKkoz42Po15WLwFOZWhhRBpP9xDcuwal8lfmyanWV7i/axsQta4iMcmWrQ5HHrxEnAzzlRt7RJwlRkpfMmvQRFRQdDEwQohYxZS1wv/Ls1CGnwBSGS5uafQlhTj6x66qO1/pjZXMTYy0J1zCDG9Ou/FpC0QBlkL9J92qq2FjBhghbo9SY6yxZI/5x55BcTWGlho7HZys+noocxAba+ckGGVuWrjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyG74hN4CyS8r03+TxY0MugUldj6qSLh4ottbnGn164=;
 b=Etbhu8UU353dZM7ZvVCIv20dS1iEYMJp9nPOCSH3lO8aXL/PKWIR4yQcZ0ctDx9nOvKGXQ5aBDaKXREVBc+j96Hu+nThi6IA/RJadH2E0jb4FhCjtb+fn/hw5UNCFY9emSPAMW89BwhCviCgffAyJABwjbbpfyx0ZY9dLDDKaR8lMfmpSWIEQ3NO4qIxZXYINIcu16VXS9KOkVxMia7Bil9Hz60U5GKiLDtyGynAvRrTWY8Z/GasQ8GI2pvhpXXFwwlskEQQIx1rqGKP+H/7VaGOemQRZaEXPi2OUgYPfTOxio/ZFdfp3pjOI0Ogm+0Kj4GPZMucne6OEcMQ9Iljiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyG74hN4CyS8r03+TxY0MugUldj6qSLh4ottbnGn164=;
 b=ankCbQgiIzgLC+hCjH6L2u/dOQHqdWRFlTGi85bGjL+2rIkRLb/VnJl9tK5dXC9oeBfr9XDS2KCn4wqjlCweVXJdrx9jEn34p1/OFVoADEb79GWH9TXC65hg24CKUCJUW+DF0eG3qxIc9VGtP/hU241inDTGzcFQQCHcW58ej7o=
Received: from MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13)
 by DM6PR12MB4532.namprd12.prod.outlook.com (2603:10b6:5:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Wed, 30 Mar
 2022 08:15:17 +0000
Received: from MW4PR12MB5668.namprd12.prod.outlook.com
 ([fe80::5d27:53d9:5dbe:49fd]) by MW4PR12MB5668.namprd12.prod.outlook.com
 ([fe80::5d27:53d9:5dbe:49fd%3]) with mapi id 15.20.5102.022; Wed, 30 Mar 2022
 08:15:17 +0000
From: "VURDIGERENATARAJ, CHANDAN" <CHANDAN.VURDIGERENATARAJ@amd.com>
To: "Lin, Tsung-hua (Ryan)" <Tsung-hua.Lin@amd.com>
Subject: RE: [PATCH v2] drm/amdgpu: fix that issue that the number of the crtc
 of the 3250c is not correct
Thread-Topic: [PATCH v2] drm/amdgpu: fix that issue that the number of the
 crtc of the 3250c is not correct
Thread-Index: AQHYQ+Hv6rbl9hCEq0aViheFKo1J4qzXTxsAgAAdKQCAACbMwA==
Date: Wed, 30 Mar 2022 08:15:17 +0000
Message-ID: <MW4PR12MB5668FB045433C4763D2E9D0C961F9@MW4PR12MB5668.namprd12.prod.outlook.com>
References: <20220127081237.13903-1-Tsung-Hua.Lin@amd.com>
 <20220330024643.162230-1-tsung-hua.lin@amd.com>
 <MW4PR12MB566833076458CCAC433C4187961F9@MW4PR12MB5668.namprd12.prod.outlook.com>
 <DM6PR12MB4417A890753BBCFECD5AC7B4B21F9@DM6PR12MB4417.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4417A890753BBCFECD5AC7B4B21F9@DM6PR12MB4417.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-03-30T05:50:07Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=3505200b-c97c-49a4-99ae-99d82c69e360;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd1af0da-7e13-47fe-9dbd-08da12256cb4
x-ms-traffictypediagnostic: DM6PR12MB4532:EE_
x-microsoft-antispam-prvs: <DM6PR12MB453221CCA74FB50C32099793961F9@DM6PR12MB4532.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nweH1f8BC1prj/ewWUeiu3tZJGsgrVf1tG8PjtTNtHVNxXCpAcVPpQn7ievW1wGHi/ho9ggS+6nkWqxd0knxLT2gk/PgBI41P7nAYb2pNfjcCt6rA83Saea2hC+0ByDljSupx3DxGD4XuiskHw8cG6p2xi+76ZcQZj23FdDZb3VSJMBv5o2JW86zfs6T+/ePR9zfXaFLxT8l09xdKws0pA/sEIL8W01XnOO6FmqPWA7t038QdeK+yfEwixOc+2odKzW14RdNl+P+AKb3CYlRoZ3hJ5zQOnAcku/rdBBj11msAVF0QbWKePnxhr5nRQ79SoRoFZvKjwVBC96moxBwAbCaHByWO51yO5cL+GlAh78xnecrG7FakrRBq7Ab0laJGJcTm8yb7Ohpry6eWdMaBslJ5MU0dmMy/aZBYXPv3aYazl4B0RyD7mvuMacCOiojy/Z+XfjZsh478ADgPuH5ssaBcKLUI+eZVza9KKze5AOUbMM2oocKarmI0NLDmOXF4FFSiaBodBlqEtISIj7D0FQ3Whyf/Wkx7HAbUCNYZ6/vyptDqk1lyI8Lgra6jmxCHh9PDr1nw9uhfzizSBKdI8NC2D1wOZ7CoN5hn7fhtLed3+W+/kr6yybrbohG7OqGfh4HNvfJFXH/TV762w9GrphIF3IikQlCqtqkzydaCzYvm3gF7E8bKLFzj+jkiJlT6vzfeWm1eFAl+zUIPYSXgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5668.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(26005)(86362001)(186003)(508600001)(33656002)(83380400001)(316002)(2906002)(6636002)(8936002)(7416002)(122000001)(52536014)(71200400001)(8676002)(38100700002)(4326008)(6862004)(38070700005)(76116006)(66446008)(66946007)(9686003)(66556008)(7696005)(5660300002)(66476007)(6506007)(64756008)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?g3rJMjlOlz4AjCOEDD3HMhHB3r9j3rPlgaJhwBvi93jLjqFWmuWaYll1IB?=
 =?iso-8859-1?Q?mC+P2k9biVJ4Nr9td5Yq76pUXZP2Ik1UbpY1YrGqY/BtTbZUT8G8tUOhuh?=
 =?iso-8859-1?Q?U6XKxR6RSzKkphMsdC547W1mtb5krQr+zUs8v3OOPPSR6eYSYgbuV8y45j?=
 =?iso-8859-1?Q?bDFeFbIFP4KP/7GpHg7YqLxmuNaItAD+xHFYKmvIX4YWgFujZ7BSfnB5VL?=
 =?iso-8859-1?Q?kxpoCyWPZHZ8pDqb1mBuk1+OMhmi6rRwcsK+SBXRD9DYvmZI/6g6EDsmlO?=
 =?iso-8859-1?Q?Xj/FKpIXb6zwTnhfhh2TntP2SzyUA3zHyiUZ8tWB8KUPk54dZPkW/vIwzt?=
 =?iso-8859-1?Q?NKtBELfETDSlLZR0GlgAYXiHyElAkAyIC+SUs29eaZXg/dD3Q7rUx6LCVi?=
 =?iso-8859-1?Q?SzP9yJz5zFTpq4PesvBrCwGzKawc7ky7nkqHqeYQzT4GO0om9ucKPgefym?=
 =?iso-8859-1?Q?vrR+oaEwPLmU33FYsoNXwWby8YRMepQTcKzxI4Gp1Jxkej8rYChYVhGBev?=
 =?iso-8859-1?Q?sFMbJ1BcAvvfsLz7UKV7mMwjzBSrmO30O057u/BtFaVwgG1CIAjSSqwK7t?=
 =?iso-8859-1?Q?vpaWAm0sJp0cztK0FSX/2efa8/WoxcLioHxNOvY6aRtUYGAJnsBhRYgrLx?=
 =?iso-8859-1?Q?ahyNEaDHpV23d+BirL1I/pvO8mO2vnft0bIkolbVMP+cRWqQ7k5OfK6E6J?=
 =?iso-8859-1?Q?tV3t6taY0zI7G2XYX2Up8rhjVnvi9hxCOdKGg7mVhNabNrvuTIu8sS4HTb?=
 =?iso-8859-1?Q?k+U3BpAzgXIJVzStOyA0uWLnbT8yolqoas0J4BQa7eJEML1oTWf/VYstHE?=
 =?iso-8859-1?Q?YYWcnMrJV5wmajbolDHDa7pGWvKCvdmoUNvTG1ZGwoa9AyPVEfD6OID6Mv?=
 =?iso-8859-1?Q?AiM0LNoSL6WMHiiBOKIwSysGCKbqh/Lx14cr9ZJLPuIHuUFDmdSd9LxxWr?=
 =?iso-8859-1?Q?6JwDRcpP6rRmOAiv0KkvZ5rHWT6SgB/KDcn4PwyQwplJi2POqwpMW8u1By?=
 =?iso-8859-1?Q?Ja83q+W7RhBJ83DRH5jTE+UxUP8F9RPDnjZgTQHCR8qGvdHfOC+hbTSAET?=
 =?iso-8859-1?Q?S52SWqfZVU2D0tYRu5kHvbWLvRJFE5fMg8FQYKV4KlgSYOt94zmYHfbQn1?=
 =?iso-8859-1?Q?oW4tFoQXGNYcKI8TyfkOs6ENIAw55hxHAAo5vV3yDbDXBjaxWx/gLyPUKY?=
 =?iso-8859-1?Q?5oFgiKXvcnHkaLXfClW2jv54Dd+yaDSTgu04+EZUDeNYb8t1/OLeFDzPMu?=
 =?iso-8859-1?Q?N8uQFmlxnd5LiEBsl5UQKri5Lnn/5wAvYrbd+Y0Yseyx1olTtkSh/psMPW?=
 =?iso-8859-1?Q?UvKKdXCyTf3ctlF0cahvJ7O1zlBvAR2xJlJbm4/1S0Jo9lxiBTCjF7HCF+?=
 =?iso-8859-1?Q?H7YfUMF99bLpY0ETcW4Qf4CtKWixm12XU3Ue3VCMz1o7SsXwSIK5HqBnKQ?=
 =?iso-8859-1?Q?GzUB0Yr/GOr9X7QFMqGKkO0K1UeO/Cp5FAKhEDN0UMGmMo/jdSORzPnC0n?=
 =?iso-8859-1?Q?xTm2rDvIZ3qCz++5EUWYMdUuotehXtyZuCt/XpjvTVeZey/2cNUzNYbHxj?=
 =?iso-8859-1?Q?hASA5NMmo7CA9IVUbgmbzqUzC993nLuDo9zz/szpiK45KPoMLCDeGu0j80?=
 =?iso-8859-1?Q?eyTvr0mMrtyLKiUi2BqKOZQBNsWId0PqCEAVfDS2EvFAiZFyTdRIYe/8Wh?=
 =?iso-8859-1?Q?OSmbaieJ9GegnoYAcp/qPgMvpblysbWdPjElFwi8J2XrmZImiEvFkOJnY0?=
 =?iso-8859-1?Q?osMHqrPOYSdSyR++HivqIClEM6ipbfEtEEE50rPzHNuI89Ev/HKxTX7Sw5?=
 =?iso-8859-1?Q?WRFQWqPRow=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5668.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1af0da-7e13-47fe-9dbd-08da12256cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 08:15:17.1650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6I7hqhJ1dfu/zYRIyuovZHRK7sjz+8Or3TpP1LqIcdgrHr2GEaNjbvHFc8t+Bubl+tgScPmOgY/q3a203OFqVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4532
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
Cc: =?iso-8859-1?Q?St=E9phane_Marchesin?= <marcheu@chromium.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Li, Leon" <Leon.Li@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Drew Davenport <ddavenport@chromium.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Mark Yacoub <markyacoub@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Louis Li <ching-shih.li@amd.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>Hi Chandan,
>
>This issue we found on the Zork project which uses the kernel 5.4 on. So I=
 just implemented it on kernel 5.4.
>For finding out which is 3250c, I referenced the function which is impleme=
nted from another function.
>Below is the part where I found it.
>
>drivers/gpu/drm/amd/amdgpu/amdgpu_device.c-
>	case CHIP_RAVEN:
>		if (adev->rev_id >=3D 8)
>			chip_name =3D "raven2";
>		else if (adev->pdev->device =3D=3D 0x15d8)
>			chip_name =3D "picasso";
>		else
>			chip_name =3D "raven";
>		break;
>
>BR,
>Ryan Lin.

Suggest you to rebase to amd-staging-drm-next tip and update your changes a=
ccordingly and re-submit.

>
>Hi Ryan,
>
>Is this change applicable on a specific kernel version?
>On latest I see IP DISCOVERY based impl for CHIP_RAVEN.
>
>>[Why]
>>External displays take priority over internal display when there are fewe=
r display controllers than displays.
>>
>> [How]
>>The root cause is because of that number of the crtc is not correct.
>>The number of the crtc on the 3250c is 3, but on the 3500c is 4.
>>On the source code, we can see that number of the crtc has been fixed at =
4.
>>Needs to set the num_crtc to 3 for 3250c platform.
>>
>>v2:
>>   - remove unnecessary comments and Id
>>
>>Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>
>>
>>---
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++++++++---
>> 1 file changed, 9 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>index 40c91b448f7da..455a2c45e8cda 100644
>>--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>@@ -2738,9 +2738,15 @@ static int dm_early_init(void *handle)
>> 		break;
>> #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
>> 	case CHIP_RAVEN:
>>-		adev->mode_info.num_crtc =3D 4;
>>-		adev->mode_info.num_hpd =3D 4;
>>-		adev->mode_info.num_dig =3D 4;
>>+		if (adev->rev_id >=3D 8) {
>
>May I know what this ">=3D8" indicate? Also, should it be external_rev_id =
if its based on old version?
>
>>+			adev->mode_info.num_crtc =3D 3;
>>+			adev->mode_info.num_hpd =3D 3;
>>+			adev->mode_info.num_dig =3D 3;
>>+		} else {
>>+			adev->mode_info.num_crtc =3D 4;
>>+			adev->mode_info.num_hpd =3D 4;
>>+			adev->mode_info.num_dig =3D 4;
>>+		}
>> 		break;
>> #endif
>> #if defined(CONFIG_DRM_AMD_DC_DCN2_0)
>>--
>>2.25.1
>>
>
>BR,
>Chandan V N
