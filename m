Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16584EBA6B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 07:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22B810F1F3;
	Wed, 30 Mar 2022 05:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE15B10F1F3;
 Wed, 30 Mar 2022 05:50:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZyRiG/M4JH+xx64KoGk3OhFyc3dWXiQe9eCCT3hLIW6/pgF7wz+lU4kVNumaKdOxyFbFfALd8WrKZHZRpuEsmXw2QDqUvO/7ac0Ddlea1cgBkwTIo/rRmvEv8IY9fCHxrgNSvJ8aPq5Asgo4QveAY7EIAv3/D2cxFvxGt428w1BAf0UUlfTs++DlzECZwpvRWCVRl37mEpaIxw874AZdIwgngA10t3JzsjmoK4CDASobPQw+RLaB4rtauap9X3Knb+SkdNqpNokElTmMK55y1ygWC+Krg4xf9Z5tWvVBr4DKPAw7VKHEoSbekY8Qsj0jYVHmNM4nvxuYrxfE7KIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IylAr/Fhupo1eQoFcY3G/fkeblxXyQbBp8EiVekibu8=;
 b=hGBqjbBjYUdsk7lrkRRXsXnGOMU9NQyCWgyXA31zEx8+lA9giazrsJRZ8b8GlimARrntWmnWAEYiZDVjmC/1AGT9anvITUj08UJLjV2Kj6n4UH0uJbqKZR+8kLMleiivPnIIoST+wtajSJZwMEOTlWr+4MIZgk9wvtbhnZ2WYHh7l4nHFiVOyIMncac82YOkt3GqodJAqFSYZ0dc1NKDDM50uq/LDNZn6GXOO91wy//4rL2KEBeU3xOdu1CZc7K6+ZnDi/wv2Kf96a8d/Gl6HLct1FzXyTVYL469zdYp3oUaVk8XvMHAcR4WiCXOcZ2QG6JdpZ1XYu04eOHHy+8CRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IylAr/Fhupo1eQoFcY3G/fkeblxXyQbBp8EiVekibu8=;
 b=esxDVqSDiohISiTY90Ei3f7oR1sVv0LTD2Rxu3Bo/6HJqPan3INhjCA9D8i35CTbbC6/SQkqUTqcnjKXKNhvpwKqh9g832m1WICz29euh4GrJfZlmjczUtYpq/OqCT9XqzLbx3GJqUw0hzaKz0QQaa+gkT7AND5coKFTRU/VRf0=
Received: from DM6PR12MB4417.namprd12.prod.outlook.com (2603:10b6:5:2a4::12)
 by MWHPR1201MB0238.namprd12.prod.outlook.com (2603:10b6:301:57::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Wed, 30 Mar
 2022 05:50:10 +0000
Received: from DM6PR12MB4417.namprd12.prod.outlook.com
 ([fe80::b1c1:6413:66d7:b985]) by DM6PR12MB4417.namprd12.prod.outlook.com
 ([fe80::b1c1:6413:66d7:b985%3]) with mapi id 15.20.5123.018; Wed, 30 Mar 2022
 05:50:10 +0000
From: "Lin, Tsung-hua (Ryan)" <Tsung-hua.Lin@amd.com>
To: "VURDIGERENATARAJ, CHANDAN" <CHANDAN.VURDIGERENATARAJ@amd.com>
Subject: RE: [PATCH v2] drm/amdgpu: fix that issue that the number of the crtc
 of the 3250c is not correct
Thread-Topic: [PATCH v2] drm/amdgpu: fix that issue that the number of the
 crtc of the 3250c is not correct
Thread-Index: AQHYQ+HtHEdsDYy2xEGMPZ0gsUkubKzXVcQAgAASMzA=
Date: Wed, 30 Mar 2022 05:50:10 +0000
Message-ID: <DM6PR12MB4417A890753BBCFECD5AC7B4B21F9@DM6PR12MB4417.namprd12.prod.outlook.com>
References: <20220127081237.13903-1-Tsung-Hua.Lin@amd.com>
 <20220330024643.162230-1-tsung-hua.lin@amd.com>
 <MW4PR12MB566833076458CCAC433C4187961F9@MW4PR12MB5668.namprd12.prod.outlook.com>
In-Reply-To: <MW4PR12MB566833076458CCAC433C4187961F9@MW4PR12MB5668.namprd12.prod.outlook.com>
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
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2022-03-30T05:50:07Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: a96b8709-6d79-40e1-be54-965bbfe20d09
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56ed2c85-96f1-43d7-2fb9-08da12112707
x-ms-traffictypediagnostic: MWHPR1201MB0238:EE_
x-microsoft-antispam-prvs: <MWHPR1201MB0238C49CD8C84C28EDCA100DB21F9@MWHPR1201MB0238.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r8crS6F0PBoiOyOwgQXehF2Tz3C1zcrPBPVGLBlt/Pdfg+W/onddp4mB0DZ+MvcV+emV/4gsr5vADa+l5vyT8wCUnSyMS9QqBDLcOxLdnQfogMZsldVairUOstYlb9PfreyT+0AL33ZtTiWXaBb2H8mYePr1tyssL0M6O02OCWeQOFfJlzShrDUT6oXrJrBbChdidkx4tJFZD2P3ByiXQ7GX5trFYYRJINeecodp0R9GvRNADScf+GykQaa6k68MijZ++RQG0ygj0E84YcHW2Nd18JmzBZbBfuoW7q2MjuC7R1dx/VnBcruST56ObYCVZigtIdmVwwzfsVPbVFQ/8jSs3MWaJ5xhvnN6jNTm46FWxkc6BMY2K6i3alLUyKXDLEbORCC0KIkfwMH8WGjyt22rX+YRjy9Ugb4UHdOuP23U29YOKHT4/0JUDtbx5uJFHqe4X49AA21blhMb2TYqK6bHbbdsRYNfbXTHX4kMB6ozK8pKeZCP2/CkDZikIJ98u0VFWKLdTmiVcZ+FFWp2NNGTyg11eSi8vBgvGp4CJS3Z8qIMB40zKo/7F4tMeCGW11b3BNzVu10/iw9yyo0yFJU6CrU+OovROEgsEW4t6NwcfZ2bNKKfDf1+G7xt+CTeolp7bYiJh6cf4UvG4zGpcmmq0m+3tlAaqgusw6rYpdTKGrIl5vOZTFMznSdTyOcd5a8ybVVLTkd+1EX0dCFDyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4417.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(7416002)(8936002)(122000001)(38100700002)(2906002)(38070700005)(9686003)(26005)(53546011)(6636002)(54906003)(316002)(5660300002)(186003)(508600001)(6506007)(7696005)(8676002)(4326008)(64756008)(76116006)(71200400001)(66946007)(66446008)(6862004)(66476007)(83380400001)(55016003)(33656002)(86362001)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?scewt3/SX8qy6KyrUWWT3aeN924QFm3VGUck0Aaa+iqSpeLQrS4YBedd7g?=
 =?iso-8859-1?Q?97tgh8FoY955/tccnxATwsm0XhP6PMBk+lwL5cgCrmbbLBcp/UdLKdnWol?=
 =?iso-8859-1?Q?t3T6LkYlSRCR+orgJMyEprzn7+XvKdHR8OEWkaZARST1sWOx26X48V0Aqw?=
 =?iso-8859-1?Q?IJfX//MA7JmRWfCv5kpWpvNWj9RsXiBOs1BLEnqzlRpGmxxNwR/QvkoQh3?=
 =?iso-8859-1?Q?fsJ8X8b49O1OpfrSJPE+oErnWCoxNpkw0jx1auEDImu56Alh2CJT7bl8uh?=
 =?iso-8859-1?Q?V+y3Nr77VsfmJi/PSnha9KktTH8YdXY+D4HCL+sJMww6ftJqKktYST2TMD?=
 =?iso-8859-1?Q?UluxMT+LdI1F6kD5OcAgE5IblnzCXR1ZmCcMyx/OPxBESoAy7PFFwk3ZL0?=
 =?iso-8859-1?Q?X7YZHkQkNYLoA+B7rF2dHoIr8Hz4iykr/yGyGI7tRGU/bzZZVzdqK8s1X/?=
 =?iso-8859-1?Q?354uLWofTGtyd6CIoB0Mphe0sl7qj4P9AzAW+gXGRgoKoaXmk7hE9Ugnap?=
 =?iso-8859-1?Q?sldbeugvwPyZzIg4ULN3SPWgBaLdPW7ApvFIM8ifJE4xiXHkqFINXoGos2?=
 =?iso-8859-1?Q?mhl7NN4cztz/JRoPTdHOP94s6CVp7kid1m5tjN1NUK2qe0P/dGPXiDIsZP?=
 =?iso-8859-1?Q?ncFcvH2FRElnDduoIqXyTHFZLIUroU56dhsm3ppjL0Flg5Ko5be6xLvf+x?=
 =?iso-8859-1?Q?kLEP178Kpg1jPfCXZdpBQjzhR403XcQLcqvOb5CwP4VjIUquB+3MLYV5QC?=
 =?iso-8859-1?Q?Vj5o2ji8/PWTmWEjjbgYsOHlqk4F59qk1HwsYuKRRd/uePuu6JZbhNlGKn?=
 =?iso-8859-1?Q?Fx20CwY/87SZYElU0yDyDVGU7hVwtfN5aefea80pQV2TbE79vDXWC5BPsr?=
 =?iso-8859-1?Q?dwPR8210kByXj0ix99VEjOWTHL2d8VFqOJVsXTykG3fqOktUF/3u/QiLkL?=
 =?iso-8859-1?Q?RJ53DA9ntz9zGPHKIGwj9jqDvunouxo7Vl0lvbP/kVfTqova/lYPGO0C6F?=
 =?iso-8859-1?Q?oUmtUnieStEDb+O57adj8hs9JF9HV5rDo8AhB6WUm/7LxWXNzRlsIYuBYd?=
 =?iso-8859-1?Q?KACOMnRyW0x5+ZLcF+viOXFoZs0ZNo+a05/tPULUX81gAbdnrmcjhN9XMc?=
 =?iso-8859-1?Q?OI0Vu9Q+844XVwoip04Uez/WTVdS/TolTzjUztcaRSEz+b74wFkm50J9Yz?=
 =?iso-8859-1?Q?IpE4UaVqDdbQdnGOUPqYXWNmm2b7mroZQyOpUxGE7wtnR3GMy5RCfzHM+x?=
 =?iso-8859-1?Q?j6igkYCVypkgfJiA44y6S3hJLnwNv36liHCn/uTvfx8UeJpqWl9yM/JaTf?=
 =?iso-8859-1?Q?W9pb3hfIx4SgYxy6xmcK7UbBcN32/scCtGK0RV6amhUVf6TUBnN91Yy82T?=
 =?iso-8859-1?Q?fwkJBzrUHqtXJpRHLvXIlXK1mpm9oHhBc/eXAi0mI8SnMPQf6JxLmne3lv?=
 =?iso-8859-1?Q?dfsRxKSJAPuc8GjO+Gtm4grGf90tVHJJcg8wJFGyjABtX1/MTrFDnRefhc?=
 =?iso-8859-1?Q?Dw0uL8swcw2n6TbeyW4HquFUuSdRnhnf8XLJNoj63AFtaTIe3Sgioc8ZWd?=
 =?iso-8859-1?Q?RoVau5JQMUqUNXvB8JlyrPV3N/yVPIVk1qkgOcG/D97464CSAmrjmOnWjX?=
 =?iso-8859-1?Q?xJ4MtqYRRNWaexVcxwzP5NgVCtbwSNE3FJrItrJrEcVwkRFO5wUyxti5zr?=
 =?iso-8859-1?Q?t1IG/8FrXZ2fsq0t2gTu2T4hTm3mK4K5t3tb8zVh3srggx0LfL1ExEMybZ?=
 =?iso-8859-1?Q?YIPamy8fYPeHbCVKmNT+v/V9Bfx9nSdsX8DkdVqJWQF7J9CWg90x4rN3PI?=
 =?iso-8859-1?Q?uKec4I+Fvg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4417.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ed2c85-96f1-43d7-2fb9-08da12112707
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 05:50:10.3454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nWiwvinkNcZfUlVjf30H0lWwBmOHB7jdpPlI02gAngAsiXcc0BR/rmdSz1kh5Wz6/aGsB0zjeKUZL0dM9Kq+qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0238
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

[AMD Official Use Only]

Hi Chandan,

This issue we found on the Zork project which uses the kernel 5.4 on. So I =
just implemented it on kernel 5.4.
For finding out which is 3250c, I referenced the function which is implemen=
ted from another function.
Below is the part where I found it.

drivers/gpu/drm/amd/amdgpu/amdgpu_device.c-
	case CHIP_RAVEN:
		if (adev->rev_id >=3D 8)
			chip_name =3D "raven2";
		else if (adev->pdev->device =3D=3D 0x15d8)
			chip_name =3D "picasso";
		else
			chip_name =3D "raven";
		break;

BR,
Ryan Lin.

-----Original Message-----
From: VURDIGERENATARAJ, CHANDAN <CHANDAN.VURDIGERENATARAJ@amd.com>=20
Sent: Wednesday, March 30, 2022 12:30 PM
To: Lin, Tsung-hua (Ryan) <Tsung-hua.Lin@amd.com>
Cc: David (ChunMing) Zhou <David1.Zhou@amd.com>; Drew Davenport <ddavenport=
@chromium.org>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Li, Leon <Leon.Li@=
amd.com>; dri-devel@lists.freedesktop.org; Siqueira, Rodrigo <Rodrigo.Sique=
ira@amd.com>; linux-kernel@vger.kernel.org; amd-gfx@lists.freedesktop.org; =
Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.i=
e>; Sean Paul <seanpaul@chromium.org>; Louis Li <ching-shih.li@amd.corp-par=
tner.google.com>; Daniel Vetter <daniel@ffwll.ch>; Bas Nieuwenhuizen <bas@b=
asnieuwenhuizen.nl>; Deucher, Alexander <Alexander.Deucher@amd.com>; St=E9p=
hane Marchesin <marcheu@chromium.org>; Kazlauskas, Nicholas <Nicholas.Kazla=
uskas@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>; Lin, Tsung-hua (R=
yan) <Tsung-hua.Lin@amd.com>; Mark Yacoub <markyacoub@google.com>
Subject: RE: [PATCH v2] drm/amdgpu: fix that issue that the number of the c=
rtc of the 3250c is not correct


Hi Ryan,

Is this change applicable on a specific kernel version?
On latest I see IP DISCOVERY based impl for CHIP_RAVEN.

>[Why]
>External displays take priority over internal display when there are fewer=
 display controllers than displays.
>
> [How]
>The root cause is because of that number of the crtc is not correct.
>The number of the crtc on the 3250c is 3, but on the 3500c is 4.
>On the source code, we can see that number of the crtc has been fixed at 4=
.
>Needs to set the num_crtc to 3 for 3250c platform.
>
>v2:
>   - remove unnecessary comments and Id
>
>Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>
>
>---
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++++++++---
> 1 file changed, 9 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/g=
pu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>index 40c91b448f7da..455a2c45e8cda 100644
>--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>@@ -2738,9 +2738,15 @@ static int dm_early_init(void *handle)
> 		break;
> #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
> 	case CHIP_RAVEN:
>-		adev->mode_info.num_crtc =3D 4;
>-		adev->mode_info.num_hpd =3D 4;
>-		adev->mode_info.num_dig =3D 4;
>+		if (adev->rev_id >=3D 8) {

May I know what this ">=3D8" indicate? Also, should it be external_rev_id i=
f its based on old version?

>+			adev->mode_info.num_crtc =3D 3;
>+			adev->mode_info.num_hpd =3D 3;
>+			adev->mode_info.num_dig =3D 3;
>+		} else {
>+			adev->mode_info.num_crtc =3D 4;
>+			adev->mode_info.num_hpd =3D 4;
>+			adev->mode_info.num_dig =3D 4;
>+		}
> 		break;
> #endif
> #if defined(CONFIG_DRM_AMD_DC_DCN2_0)
>--
>2.25.1
>

BR,
Chandan V N
