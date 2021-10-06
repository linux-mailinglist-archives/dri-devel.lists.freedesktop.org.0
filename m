Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B188424637
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 20:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945336EE0D;
	Wed,  6 Oct 2021 18:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2097.outbound.protection.outlook.com [40.107.212.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49826EE0D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 18:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFUEdPXVhNluI7eemhTn4OzDnL3EAjjSivDUk1HTYu7aCEOD3buiswudkudtQceGFz1g+eCejOVTqcEl3cqU9aVQoPJQcxjRuyrv9CUA70K3kANe+W+lj6kcE8qR1gRfCI88TXAjqfup88Qpiku7WQpgZTmtkI3c8H2w/x565YGMs7ktl01ZVnyQfWjhjouawFkHhsnVolhAUmT4sMd4KdKs5pgVUIkAx/0dN4ZtT11A71UnVBV2/Dr9YzwkqTcAPEkqS6XG7QjXyOj38m4pH+icLt1WwvzHJYcKcE7wlkw+SbTHcap9JbsmCxH7KiU5E7UKufvWNmBkI7aaCZyzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK1IZozbk75EHeKtrH/Uu0VltMlx8qGhVOyB+XWhbHk=;
 b=IdCQvK7NMmzt8CA10RN4So3rsyEjZCwkyPCwEEcl5KAC5mEhsjVboo6GUw7OMKAfdLKrm+fvR8/1p2mjBY5O1mWnB+zyli3+dcUiLsPjcZbr7f2gOcEL+4SyCyAs1OEJ68RxuAJ2wY+jEXdo61xdQybywrU8GVXOsQK7UoLi7R4TULy8GWPcFPALBX5wxH7C5myIPDeulhQXgvQ/YhpVUM2Rq21EosC2/sfb2GAi0Sjewd/gdqWE+9n3/ckBqke9bRSaVjATgxF/95aD8GYtTStZYKpprVHSj3zDciRQJUMC35Ihu4Yk9tSVd1EpZkpAQAYLSoI6+bwhefwx+RkLPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK1IZozbk75EHeKtrH/Uu0VltMlx8qGhVOyB+XWhbHk=;
 b=dqyus2Td1sHL0iQ9mixA7SdBAte2eSQ5wISKxhfBMgFDj/e6Jo4+UP/iRGL50hZDal0G8oz2O8jwElpH3dM6qLvVVojFT5Ch/RVEbQYkyMr6SQ5FYiwVEB7qY0Bc4b79XAdPsnxy+AL0TgMLBS7dAZa9StLuIrWbxOVmO4dT3XI=
Received: from BYAPR21MB1270.namprd21.prod.outlook.com (2603:10b6:a03:105::15)
 by BYAPR21MB1272.namprd21.prod.outlook.com (2603:10b6:a03:109::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.3; Wed, 6 Oct
 2021 18:43:56 +0000
Received: from BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::78b5:7b19:a930:2aac]) by BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::78b5:7b19:a930:2aac%9]) with mapi id 15.20.4608.004; Wed, 6 Oct 2021
 18:43:56 +0000
From: Dexuan Cui <decui@microsoft.com>
To: "drawat.floss@gmail.com" <drawat.floss@gmail.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] drm/hyperv: Fix double mouse pointers
Thread-Topic: [PATCH v2] drm/hyperv: Fix double mouse pointers
Thread-Index: AQHXqzJC9UNAXIu01UiDkgfJCrQSMavGbYgg
Date: Wed, 6 Oct 2021 18:43:56 +0000
Message-ID: <BYAPR21MB1270B4AB0AFC1668C9D9009FBFB09@BYAPR21MB1270.namprd21.prod.outlook.com>
References: <20210916193644.45650-1-decui@microsoft.com>
In-Reply-To: <20210916193644.45650-1-decui@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=22a3bdc1-9e3c-48e5-8c8f-142d5246e4f1;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-10-06T18:42:49Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af13b4dc-c083-47c9-356c-08d988f9409b
x-ms-traffictypediagnostic: BYAPR21MB1272:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR21MB1272304431C5D1D5A967AE87BFB09@BYAPR21MB1272.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +p6lYHSjiWL6aUS/t6Wb9vBKkqs8OksZX/wzm7Zie4HDYJepyn0YAqPr6ehL1/NZ0Pv1bvIPLpRHVWwTpaPZQWvhm+eQ8IkgoO42coRdWUKyGOkcOjtmxlFLLgL7SUVXsZ6wYKEXz0sMm7pR8J/952ozXU4DA4ACcCneb9haVBkqPnRBywuZ67kfSv+vuYsSQk5LzoyrTYXoOATpnTgDeGuyaMuaQoGcW/TkD3kh4OjYcVUGBGba7z6sSqNTqSzM0S32z5yAAD5kAOSgsIOHICg6fdgoc1LuBxMT2Sr5sdWIyedcjFAu+sTdQkSupEtmhwxQgFm5YIOf7dcwgnbaswS7y4iu0Ae+1t3YVxrFoEKX4oExtrNkhR5zDEo0JgJA+TbfDRgohXTVjWHsO/Ib+v1VIJCi7FCzCDxUzAnMxKBFo5yW1uFwPIOHmha9IuDTNq3AtM/z/SCashTm0GL2scfNySvv3M+Peys8TmZJVX0TBgt39OhLjrv48RplFeJxS2lXq5J9SANysxAgKVNVFZSytj5z5Vtq0PVSfjJfeJC/Kjvxy38zkf0uKyp2GYix7TmZD/a3jekv4A/LC2x+g0jbbr2ujyNqyEnXGkpaT6bEQ7sTBym5m86c5G+irooCHl2rgRBzX2LNgEcKWfD5JpCu0NEnlle+GJi3QhoUknd+n/hycvNwNz7+IJkuFUtHM8aTDZ0VdmRREb4MFmS7/A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1270.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(186003)(33656002)(110136005)(83380400001)(86362001)(2906002)(52536014)(4326008)(5660300002)(54906003)(316002)(8936002)(10290500003)(53546011)(9686003)(6506007)(71200400001)(66946007)(55016002)(7696005)(76116006)(66476007)(508600001)(82950400001)(82960400001)(66556008)(8676002)(64756008)(66446008)(8990500004)(38070700005)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sB87bX1OfgH1/3rINC5rjJq5vCEqxi3CT6zCqkHGGPJDqTaOtZWuE7uv0Xbb?=
 =?us-ascii?Q?ZGAQUZISRF7GV2W1EVRgWKdbNfc7yL6h2i74/UdktQEo0qlV09SbCpUrufUn?=
 =?us-ascii?Q?XoxrlloxLqzAEajLA8CGikXGD9lQG1bn/eF7RMzFVOcAieBFZPDqTbc3VOhg?=
 =?us-ascii?Q?OYN/SscC33QZA5lrzQP6QJX1gZksUiFIuWtOV+wUvx0vzX2ZIVjJIzDQtatn?=
 =?us-ascii?Q?YkWeWnxa6afKQfEOb1HUPlM4WWwJn2gRzu5Fvvd7bQwI/Nj6sYwMbucQLHoR?=
 =?us-ascii?Q?XZ+zT7d2AqiA06gADIhLwcfEmwP9Iegpv/N+4RCGxS7g/X03s6XtgBuYkRF3?=
 =?us-ascii?Q?6veMUDwO9acZGd8atSrL+0TiyYrnJT6joV+BwlpeUz+DBUDgP+SEY1PbuOqm?=
 =?us-ascii?Q?j5OvP2AV/pHgI5twI4UCTgjvtVolD/Syfy294sW5qQyIWxmb+4hrUVHYPgoV?=
 =?us-ascii?Q?t5DYvZaVtv0qHNslz9AmdY86c0I6DeYgJTL92M2xvCRYkRuhloBLFfR7d1uG?=
 =?us-ascii?Q?82u/5ZNZXM/BtqdHc+y8DzuqchmUTMYNowDxSGbx10NY/J9xLvSeafzdYsT+?=
 =?us-ascii?Q?SmaJkeXmFUW9kq32Bi79/ymVaKY23lwFBJGmm49k9D/LuYf/FF09x674zeYQ?=
 =?us-ascii?Q?X00OrQfB7TO9G0VD46prGsOBVqbbNBTjIutjARQZKgZaNeLhqD0J825ft+pz?=
 =?us-ascii?Q?wsSFjlLAaRbXuOo8I7fT7IeRsDeHWAF9U4ekbPCz32LRj+Ob6YcFEAFmoCMa?=
 =?us-ascii?Q?cITxcl61IIRwsfMLsHD3Q8YxAtRbCaVh//x/dPT6sCPzqn6Bw5cVaHP6cnmz?=
 =?us-ascii?Q?NcuwyYa53pwCsIOZjdwjl5p4EUrpaQvRo4mLeqmgy2ndSDkIW8lf39xn8vTE?=
 =?us-ascii?Q?MOHp9V1vw4IdqBz1OppkwlKe/Ig5TjzVn2Bg9eANEgPASOTmyAsCBiE+qSxd?=
 =?us-ascii?Q?xsqDVjoTxhsvK01MvaVHFQJxZ1Mw1Waw1rNTj2WEP49KVVsXqHqPKo40vrgY?=
 =?us-ascii?Q?KmUHUGuxrKIY47FgmQgKxEyZLEtTfbU6NiOpAwoZMQuV+yT171QKlpc3KNLh?=
 =?us-ascii?Q?hKnL6TguEsOyHyQjoLCWyp+sM+lfMkpNE2kqUWkeArPxqYvDedfrdIaadE1U?=
 =?us-ascii?Q?5aJXIYJ3Z+1Fm6FzvxpQGJHspukJbNae/hKueKcohv9vfGxoz9WZagzCJu20?=
 =?us-ascii?Q?QBGOy773w3e23+OeVGG5iliNMJFRrmzQbiczPVIkVSjEQkVuQwr2JWpkEuqc?=
 =?us-ascii?Q?EXDfBxir4bbrE4qzhITkD1AJ6MGBVFiXF4eRyn6ciqRVyEBIiIwykapPlukG?=
 =?us-ascii?Q?o8w92zx9i55xvOdxBfwlTiCM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1270.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af13b4dc-c083-47c9-356c-08d988f9409b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2021 18:43:56.1004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxkh7UPcg5DmCKbL3YJw7mDxKA2OcdgwfaZBIvzN5WV23QE44DqKryN9PwVLXzVENcjrWS9ZrHyvQ3ESqNoJog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1272
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

> From: Dexuan Cui <decui@microsoft.com>
> Sent: Thursday, September 16, 2021 12:37 PM
> To: drawat.floss@gmail.com; Haiyang Zhang <haiyangz@microsoft.com>;
> airlied@linux.ie; daniel@ffwll.ch; tzimmermann@suse.de;
> dri-devel@lists.freedesktop.org
> Cc: linux-hyperv@vger.kernel.org; linux-kernel@vger.kernel.org; Dexuan Cu=
i
> <decui@microsoft.com>
> Subject: [PATCH v2] drm/hyperv: Fix double mouse pointers
>=20
> Hyper-V supports a hardware cursor feature. It is not used by Linux VM,
> but the Hyper-V host still draws a point as an extra mouse pointer,
> which is unwanted, especially when Xorg is running.
>=20
> The hyperv_fb driver uses synthvid_send_ptr() to hide the unwanted pointe=
r.
> When the hyperv_drm driver was developed, the function synthvid_send_ptr(=
)
> was not copied from the hyperv_fb driver. Fix the issue by adding the
> function into hyperv_drm.
>=20
> Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic vid=
eo
> device")
> Signed-off-by: Dexuan Cui <decui@microsoft.com>
> Reviewed-by: Haiyang Zhang <haiyangz@microsoft.com>
> Reviewed-by: Deepak Rawat <drawat.floss@gmail.com>
> ---
>=20
> Changes in v2:
> 	Renamed hyperv_send_ptr() to hyperv_hide_hw_ptr().
> 	Improved the comments and the git commit message.
> 	Added Reviewed-by's from Haiyang and Deepak.
>=20
>  drivers/gpu/drm/hyperv/hyperv_drm.h         |  1 +
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  1 +
>  drivers/gpu/drm/hyperv/hyperv_drm_proto.c   | 54
> ++++++++++++++++++++-
>  3 files changed, 55 insertions(+), 1 deletion(-)

Hi DRM maintainers,
Could you please take a look at the patch?

Thanks,
-- Dexuan
