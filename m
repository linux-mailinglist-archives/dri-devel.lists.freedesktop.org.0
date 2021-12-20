Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEEF47B1D3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 18:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359A710FD6A;
	Mon, 20 Dec 2021 17:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB29010FD56;
 Mon, 20 Dec 2021 17:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj81W/lhyB4F65IXS6g4OwjLro2Bmi5p2XF9tgcyvBO5ukLcCVB3Y0tAN9S0kqZ7CarSK0zOn+AinEPxEQr9337DXaV8EgNuBZMWtRTs1pjXs7fSiqthUkvmcHRHeqNpygxuUHx/egv5swZu0AoIcJg2TfNy9ifdHt9GI01Pipr2OHUB0fsxeiUwz66RbA0TVYpaULvPi/vByT3pk57HBO7f8ZkbMxfQ2uALZHkVS6aRjNQ1PjKZq5fbL4WTC1vn/DiC0om2PcUuAN19pqNvI9WP02MX91xCHIzoDgVlYajJ8hV/W/QyikqziXkjKMOT5B/L8lVMDEEi6gtFAqKWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAOcQ+MNo4W/63HYyzE81+Kye1QoP7IzV0j14PgafBw=;
 b=P9ofz420u0vO1iVa9G/e4hiuz1iQCBh1+92UTBPgcsJlyZCDhMe2kWp2iLQxdI+UnTECr+gdLpFworYXoLMMV6dCuvrZliEWP1fqu+VkztnM2x1GJrFJWb2XOSp0zCQdT6zT+npMlxvEBVDe0KUksHt5UqgktunFSBkri61Ky183K7kOWludVjNvcoHq3NZDyCsPJVsBRCbnqgMYOcPO3Fo6SxiOvHUD3pWhq4sQ8NrQQN6Z7Ztxd+wI4A1YlaZxXgq5P6GQCcjCrcfBFflyVikiCUGuVamrN9J2dqIr2MaVRRojLAKTyw7Nu8Sn1/zVeDHCWzn8IM5jfS1KImZHkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAOcQ+MNo4W/63HYyzE81+Kye1QoP7IzV0j14PgafBw=;
 b=DZh9Xjv0FQ/9MWz/2jiNRDro6ZsABpGOjrhUWQScj5uqInJdjeGAroowKIc+jZZsGUZ//vFi5vVDIXcvLhdErdZLYTohCb7eMTqr029fY7iO1vWz0eRiAUgIiqEDE3zuITv4FMnEy+zNBEyYoWlzV2pLX68yjBh80Y6KRT9cMV4=
Received: from CH0PR12MB5372.namprd12.prod.outlook.com (2603:10b6:610:d7::10)
 by CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 17:06:16 +0000
Received: from CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::31b4:ebc:1707:f563]) by CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::31b4:ebc:1707:f563%9]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 17:06:16 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [RFC 0/6] Define and use reset domain for GPU recovery in amdgpu
Thread-Topic: [RFC 0/6] Define and use reset domain for GPU recovery in amdgpu
Thread-Index: AQHX85Vl6Y7//ksphUKqFEe6OxGk2qw6/kCAgACcMWA=
Date: Mon, 20 Dec 2021 17:06:16 +0000
Message-ID: <CH0PR12MB5372A4EAE67D6F2C0B06F5DCF47B9@CH0PR12MB5372.namprd12.prod.outlook.com>
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <0a30778e-28b8-7d02-01e9-9db690227222@gmail.com>
In-Reply-To: <0a30778e-28b8-7d02-01e9-9db690227222@gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-12-20T16:44:07Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=388c775d-121e-4742-9f16-8120df13b1d4;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2021-12-20T17:06:14Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: 5f66de53-fd06-49ca-90fa-738c6d8de220
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17cedd16-39db-4a04-b377-08d9c3db0927
x-ms-traffictypediagnostic: CH0PR12MB5122:EE_
x-microsoft-antispam-prvs: <CH0PR12MB5122E6BD7116827CDB70FFFFF47B9@CH0PR12MB5122.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C/HqCMQfQREEfC5jHvKxAPU061ACt88bZ8mZbW/mNglx61/FcF2nK1tkBJtcw28w8xI7mpPY6YWjKSMOBhZWFlAoRaOS/E8zH9PqPOyERl9RlgWEJ7SfxamxId6cmN4IKhawFP1258dIaduM5gyXFHmL8OLFEIIxKfbWe9BFKk/qvYtgJY7N33OPlNCjFdDdBisrNHvjyBypghOj70CLw4xQk3Su64L3pl5yLBtsMBi8JjeWvUTsIzW5F8/duNS7Wxub8VZ9BeYR51+uKPrj4T13p8oNIEQabzwmsFg2dV3y/onrHFUOCF3QffjxnqCW7WXzPLjAs3se8d9Dj13SvnRMU774LP5kYCzKcdRFK8C57E+Ax5equ34ovUvEBgWfjMeN4XA9ZbGg3QXSwydelLt6U+0vL3wPj5tE9ehjjEFipmU2nQ3TrM8zU2h60/MZQI4DIRQUPq407hUGgaJbq45a5UXS3VRlpMMmCK45H2xDPNeSuDVRgGAwrA1xfBMuubEWp43zCx1/xhuggU+6UyCUYY/7tsdQA8vOn/9qIEaLMUH/af7Cg9vLBTASxvWrDomkG2DbJn0ShJM2u84Gd3lqOLH4BYbTwFSTHp/ynVR1MGE3llth2s3EhPajZ7Sn5ob83CYSLqk3pc/YArm4CE6BYKSEKmaNlEQeMfmlcc1OaKKiE+ssoofV09FX0eRgRTy47/3Td9w5Ncl6eE26+tqdDdqjWG/Xpdiqlvnto+diMHdERLtk91F8pUzgrtnGxMUHRubO+f/h+1g+LzWdG/mmIej7vgSFJtTyMswcPWc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5372.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(66556008)(8936002)(76116006)(186003)(2906002)(5660300002)(316002)(66446008)(71200400001)(54906003)(38100700002)(66476007)(66946007)(508600001)(52536014)(8676002)(64756008)(4326008)(33656002)(55016003)(45080400002)(122000001)(7696005)(966005)(110136005)(66574015)(38070700005)(6506007)(86362001)(9686003)(83380400001)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?aqbfNpJgv/XpSdAfnIFSG/MJI8FznmonNdxxJgFb8COUwxLFMg4M2zvIMP?=
 =?iso-8859-1?Q?wAjqS8JJ16xl8V6hX9W8ngG/zyAKOrCwNvY7vT6DUWtVk4L90JBdfSE57G?=
 =?iso-8859-1?Q?0fZDacnxngXxXoUcXHon/zSShRbB8cOCHFopHVMeCk2N55VNAUDLVXiTcl?=
 =?iso-8859-1?Q?souwLaIB4JnqpAfmdAyYZuVTsEoxqXCYOAPSL1TqNv8NlpFYaVvLvQVdzY?=
 =?iso-8859-1?Q?cGnVglhAd8FUIZS9ZzqBoyCT9Dfazg1XWD2Q2KYRWjKUrYJZZHzTcYc/i2?=
 =?iso-8859-1?Q?wBNmbe3J83nRN4vf7sl80YN+xZAIDZvJF4j2Lw3utmgUp+7Bg9GfGPN8aT?=
 =?iso-8859-1?Q?dNn8mcnYDqmYAe7sgVW8M8/MxxHEZw3A0G95W9xWZX/soz1Tp+KZOOL7W+?=
 =?iso-8859-1?Q?jr6iWiZdAZuCDpau4nDPbY95bIJCIxtBrjOqVsLBLhOpPcD69Bg1CzABQR?=
 =?iso-8859-1?Q?uPIh0M+StuyHfKcXboLqxwPdKybb5q9rP3wyewc2Rj+2hZW2qbh4UH6Nk1?=
 =?iso-8859-1?Q?31f4PeFRJFVVmxu+Mcvf3cmZSuHz/6RorOOyzJQagYKdBvO0Yt70glGGJ/?=
 =?iso-8859-1?Q?fR7scBUFSEUleg6R1zdrV8IVPo8yFls6kLjEGdX8kpv2vcnm6cmAuy33py?=
 =?iso-8859-1?Q?OA6K/8J/mISR5i3vLWygc2xts46+OASNUMG3MoR4nJZJGTHKqZ4ZvZFV6I?=
 =?iso-8859-1?Q?BjXhSz+dM8BXrEFng2oBGsQLhIlf5nhTq7lFvkQ0+E/OomDlv6CHpJjPlG?=
 =?iso-8859-1?Q?rmUooTpCCLoGYV6QbZsMpjU7wOo9bzoqtAbQAOPDeSBOSxtoFxS/wEYOaL?=
 =?iso-8859-1?Q?WQEggDzVJhwIkkrI2wlgmSbprRgnX9uaHpVdIi52AOiJrEoACHFxKu53qK?=
 =?iso-8859-1?Q?a29cn26bJzdDt0YWGRAijP7MtXtmsLD3SF86VJxeXUkzgT2bEC73IrFzAf?=
 =?iso-8859-1?Q?iBclBm0lm03kJkEmEFAPPHYsiEBmcJ5VrAMGjtmpzIsNxxY9bvTQPfLh/M?=
 =?iso-8859-1?Q?Df6AbuAnIHcTXrg8kmJf5zdhEctObEk7tDQh26KDM2nhMAwFk1tXtweQQG?=
 =?iso-8859-1?Q?cJBllkStiU4+E4BT9d3VJqyNuDAf3bMNErI3djsD+mnmdL/Z+eZ6F4FYdl?=
 =?iso-8859-1?Q?0nU4yhbI2M+agHZ8/cSmz8pgLWQqwm/SQW1NMIuuGXSf8u2hvKMGXYmA9I?=
 =?iso-8859-1?Q?egDim0Z1rCsW7MdMbR5OwzAzekhf4Ht+Ra2WCLI8f+Pwuhl0W7Up2YTcuv?=
 =?iso-8859-1?Q?B9woC7sKHnqXDgJrtVnms6emhxS9kRtESv19dFi78sMuqFGHyzbCXwSRjx?=
 =?iso-8859-1?Q?bDj5N/fTdWfcoTr8YxspAhpOniiOhYzfaIF/l6vVYDn8Ofot2RA0eWZ6mc?=
 =?iso-8859-1?Q?tu7DPx7ubLfDUH0BdXv/IlKcwYLGwnt47mGFThH2V0MTRGHDBnaFBeCS9m?=
 =?iso-8859-1?Q?yr8TYLQo8Eww4fdvusAcnSAVVv0jiyAt10fmk2njpK9VC7YAtfJIcv5Ifb?=
 =?iso-8859-1?Q?PspueczVVxpZrJe/ZdSNvWeRpf0eE7KI1mNrDZoJ/2sg3Ry/oMX3oTe2OJ?=
 =?iso-8859-1?Q?61mrNieUrLHvDVKMRNRHOJV+VjaVGp7zE5V71YVY6jb7RGlSzKoUVI5F/+?=
 =?iso-8859-1?Q?CLErP5JxRc7GUWX6K8tpA/f0IiT4wLvIV/YgkYtzfF20HXmtnvQkhhJg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5372.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17cedd16-39db-4a04-b377-08d9c3db0927
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 17:06:16.7550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1tcdGPyl5wtifGViNL06GB5qXXBDX3YLN390MwlUhc9VnZDBi+m2notf6kSgIp6j1m5kvu/nKw7h9CfOaGqvGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5122
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
Cc: "Liu, Monk" <Monk.Liu@amd.com>, "Chen, Horace" <Horace.Chen@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]


Hi , Andrey=20
I actually has some concerns about this  change .=20
1.  on SRIOV configuration , the reset notify coming  from host , and drive=
r already trigger a work queue to handle the reset (check xgpu_*_mailbox_fl=
r_work) , is it a good idea to trigger another work queue inside the work q=
ueue ?  Can  we just use the  new one  you added ?=20
2. For KFD,  the rocm use the user queue for the submission and it won't ca=
ll the drm scheduler  and hence no job timeout.  Can  we handle that with  =
your new change ?=20
3 . For XGMI  hive, there is only hive  reset for all devices on bare-metal=
  config ,  but for SRIOV config , the VF will support VF FLR, which means =
host might only need to reset specific device instead trigger whole hive re=
set . So we might still need  reset_domain for individual device within the=
 hive for SRIOV configuration.=20

Anyway I think this change need to be verified on sriov configuration on XG=
MI with  some rocm use app is running .=20

Regards
Shaoyun.liu

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Christia=
n K=F6nig
Sent: Monday, December 20, 2021 2:25 AM
To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-devel@lists.freedes=
ktop.org; amd-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch; Chen, Horace <Horace.Chen@amd.com>; Koenig, Christian =
<Christian.Koenig@amd.com>; Liu, Monk <Monk.Liu@amd.com>
Subject: Re: [RFC 0/6] Define and use reset domain for GPU recovery in amdg=
pu

Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
> This patchset is based on earlier work by Boris[1] that allowed to=20
> have an ordered workqueue at the driver level that will be used by the=20
> different schedulers to queue their timeout work. On top of that I=20
> also serialized any GPU reset we trigger from within amdgpu code to=20
> also go through the same ordered wq and in this way simplify somewhat=20
> our GPU reset code so we don't need to protect from concurrency by=20
> multiple GPU reset triggeres such as TDR on one hand and sysfs trigger or=
 RAS trigger on the other hand.
>
> As advised by Christian and Daniel I defined a reset_domain struct=20
> such that all the entities that go through reset together will be=20
> serialized one against another.
>
> TDR triggered by multiple entities within the same domain due to the=20
> same reason will not be triggered as the first such reset will cancel=20
> all the pending resets. This is relevant only to TDR timers and not to=20
> triggered resets coming from RAS or SYSFS, those will still happen after =
the in flight resets finishes.
>
> [1]=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatc
> hwork.kernel.org%2Fproject%2Fdri-devel%2Fpatch%2F20210629073510.276439
> 1-3-boris.brezillon%40collabora.com%2F&amp;data=3D04%7C01%7CShaoyun.Liu%
> 40amd.com%7C1d2b07ad556b4da5d58808d9c389decf%7C3dd8961fe4884e608e11a82
> d994e183d%7C0%7C0%7C637755819206627827%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
> iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp
> ;sdata=3D8C8UbdPmM%2FH6sdTYDP5lZfRfBdQ%2B%2FN7m6s%2FREW8%2BsoM%3D&amp;re
> served=3D0
>
> P.S Going through drm-misc-next and not amd-staging-drm-next as Boris wor=
k hasn't landed yet there.

Patches #1 and #5, #6 are Reviewed-by: Christian K=F6nig <christian.koenig@=
amd.com>

Some minor comments on the rest, but in general absolutely looks like the w=
ay we want to go.

Regards,
Christian.

>
> Andrey Grodzovsky (6):
>    drm/amdgpu: Init GPU reset single threaded wq
>    drm/amdgpu: Move scheduler init to after XGMI is ready
>    drm/amdgpu: Fix crash on modprobe
>    drm/amdgpu: Serialize non TDR gpu recovery with TDRs
>    drm/amdgpu: Drop hive->in_reset
>    drm/amdgpu: Drop concurrent GPU reset protection for device
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   9 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 206 +++++++++++----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  36 +---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  10 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |   3 +-
>   7 files changed, 132 insertions(+), 136 deletions(-)
>
