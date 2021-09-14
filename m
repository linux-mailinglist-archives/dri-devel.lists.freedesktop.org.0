Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F37940A46C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 05:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330926E372;
	Tue, 14 Sep 2021 03:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600826E364;
 Tue, 14 Sep 2021 03:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYEoYm8iPnOVLnts8JB8NPQ1YsrN97mYytJrl1vwdRUa3sEQ1KIsek6aBW65ozIlcaV4VxlNkNY+SuzGzXF8xNbcf44+QhOBDwrbK2iiJuHr73euiHlAgogvJ0BE4UiXqCkCXAQA+ASxNGzjrAsEnmwwnwh8HbHZl0J+QdtX7bmGBIyw1XGmPbiUU9ce4GQSJn1UBvmzcqEMcLZI+YgSATqKr4hqNaICeVn1SM2IkAMuStvNKXN7aGoGQHjNG7cQxyI03SS9Ka1GBcSGmEtp0+iNHIaQQF3TlntgCWZ37k9BkWehBKdBZlk4Ed6OK9e6u0nh1bTWfFcq9VB7AmkymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=W2cbOheHAQxAuNI3YrWimjio7VGpT9g4Yk96yunacBo=;
 b=inJ3ybtIuX2AmLd6ehkHD9zXXEA05e7tI1mwGAe8bVsBr6HN+KaHa8ksPwH+N0lj90jDyb6wPScbEXbjx9lROZCOkoABBC7BSkWEslwG0wxAJsARTwmoAAtBHOXgYWzUv0WDE5xToPO7lJVMkry9t8sgmsPU5mo5t90Zg+fohbpLtSW7T2rwMHWvWRlPHauXaSUkfgBi4WCct61sHGdmbJQxhgvhSxNdNkr+u+jRuGQV39d5oyrxSzrhJqJNjot2sgtQ03R3GHaRbBi5uV95pdq0GrbLf8zUGnh4QfH27OqzjPo/Px3VzXb4fVP6emp59zTErZrC/lu3c413ElThXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2cbOheHAQxAuNI3YrWimjio7VGpT9g4Yk96yunacBo=;
 b=xtBhT5G4gHYV6X9oIeHjHbuj1XRdYMPIy+ozuSxvChOhTGFvnXygXRQbnicQ5l+Mdu7EHmu6FXaDbzB3ErFROVT9GCknZPdJnTwm31758f0Lrc9lcw3Hw9MKmNNWd2T8Ziu9qkXqp77UVUFrZCwQfCezrBoZ+Lkm7/BlVoHPX6I=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Tue, 14 Sep 2021 03:29:35 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::35c8:7b2f:1090:d3a5]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::35c8:7b2f:1090:d3a5%6]) with mapi id 15.20.4500.018; Tue, 14 Sep 2021
 03:29:35 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Gomez <daniel@qtec.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "Zhu, Changfeng" <Changfeng.Zhu@amd.com>
CC: amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>, Daniel Gomez <dagmcr@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [RFC][PATCH] drm/amdgpu/powerplay/smu10: Add custom profile
Thread-Topic: [RFC][PATCH] drm/amdgpu/powerplay/smu10: Add custom profile
Thread-Index: AQHXo8XNqgANshEo5UmmOxqpKK1IQKuY0nUAgADquwCACF5agIAAzRvQ
Date: Tue, 14 Sep 2021 03:29:34 +0000
Message-ID: <DM6PR12MB26191B294F3D9BB6A11C1ACAE4DA9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20210907085301.482579-1-daniel@qtec.com>
 <CADnq5_N3ue6c6XzX+Nu=adsfhCZ6jkUVwNvQqy-Z_TjjGgsPmA@mail.gmail.com>
 <CAH1Ww+QXyoE-YvCZhG3PQ0n43E0R8ydt=GMb08xYF3YqV8o5UQ@mail.gmail.com>
 <CADnq5_PDjTNjZLrkdnpQVNzivXhLRQp7RqB_kzMNUYY-Z+Qdfw@mail.gmail.com>
In-Reply-To: <CADnq5_PDjTNjZLrkdnpQVNzivXhLRQp7RqB_kzMNUYY-Z+Qdfw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-14T03:29:30Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=a57009f0-5122-462c-8f0b-f75e45db204e;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 194032a3-5fd3-4894-bb16-08d9772fdfcf
x-ms-traffictypediagnostic: DM6PR12MB4219:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB421976191BE7E5CEB7FE01D2E4DA9@DM6PR12MB4219.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5lP+owIYJA9+EOFn+/ji/UH2WFXFoACXvTQnivW8sgdn8+GEbspS+Is79pxxXewIFEb7Na5iBtjT/n8fyeOuQCjpttCqnazE2VcigkM77lZhdcFhB4kZEphlvBobaPzMNpa+ojDCnE8mGWdvAenBqj4B3UGjNRwapJLn44Hi9X8JcFUBETsvhY2hvImvSEcaH98YGN0X4qnQZPHu+XuKZgO7eXZ/kKXB3Q/oGqszl0ZyZrPmiQ91YBvh0Hl3GwdCDJyJ9/NFI2hJglEbSJyDH6n1SPOjx8j9Be9tTrZHaYB5+hC9xg8XPP0yjZsfrquKnaXCBzBb6yJxyIY5vnBQVYOzHNyWcvN7w0U3UvSOag5GQCsl37jaVbbC94SBPT/WiMxRyML58pzmBfn4rMowfcydX1ejt47swUdlhI9fxE4MlT8/+rgHeSJCceDxSWFVgvgeMRl3mGh1LCLRD4KyuAYTQPt9VKO8cttjJbjoMY4/0ey18Hl2DKPSHqjaQnkJqPup/Kp8iE/HxUc3n01XueF7RSMDZ+D5V3Q/5RgAl76E23G+4olk6y99fLVKRVJoEF5ze02WPcMYpCqoJfgJGZvW+C1/aaOZE3HpLrXPTHzCXw/RWYNXFMzA3DnyKbq5jn+JR1BpC59sZypysHARKcMzSgydT82ffsoq0NGrtsO1pse0pAwBHglqpWbNmhe3bGF3ayLvpvzvaZnMAbb9UTmJxvqvx99Krn4e3GMILdxKzVoyR3O3Q6rDDFFzk8nwAmnkBJ7kP1wTcW3JCHFXdSE0LkMbH+UQOwMt2kEDAJJa4w0VBSDB6cj8wzwGZqyzjzLT2P/cwCseWxSI1BoFXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(52536014)(4326008)(9686003)(186003)(26005)(30864003)(966005)(53546011)(6506007)(33656002)(38070700005)(5660300002)(55016002)(7696005)(2906002)(122000001)(316002)(6636002)(38100700002)(45080400002)(86362001)(110136005)(64756008)(66556008)(66476007)(478600001)(66946007)(83380400001)(76116006)(8676002)(71200400001)(66446008)(54906003)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mUtoA9xhEO6X/vTDlKptpfFcHy9bvfndM7rSISOQ0lUBMpChRSV5gBYyaxns?=
 =?us-ascii?Q?M3X8H+Zmx2rBGIAf6p/S/oPfdNa/rSSl5KYctVKnefY+rnVfJ/RMcRtcsF9A?=
 =?us-ascii?Q?gTIxtZRT7BO1VUIIoMm24vd0U9l8nsDv/5wGasUvH230/BebMZ50i9Co48Dp?=
 =?us-ascii?Q?+VQIpk0dknGCF8Nq41Uc6Fm1tGVYbSSbgyjjvYCLWzeVroy3UZicO/vMfJ3f?=
 =?us-ascii?Q?3FDbMqj8AQFJxk6Q60Pba9pxSkO/kcPLJDdimtwAKOkoiP7WiRwRD1/5n16T?=
 =?us-ascii?Q?6Q2aSgYLKMXvksGjgxZp60GC4lro80mnlbdiJfdsdUSBLe4Hmc4sEEmnEWNM?=
 =?us-ascii?Q?qKV+3Ac/eFvOlJHuYtsrU8epvlDKdkGzNudQ6/8Oc8U+SZmAZTgdnlPhSdcJ?=
 =?us-ascii?Q?HwM013Rgzms0YIkzW0rDuAjSSvJdDG6IDaQx9XLeZTALJefdu8l1bmDlhskZ?=
 =?us-ascii?Q?Ls/VtWgHKFD/CauM4dDiVHB+RvlcdeFfV/xYu6VaurnHe4v3/i/TcWKcA/AW?=
 =?us-ascii?Q?qE5YxX5rAxtmxfWhQ7Yq/sB1Rdf3xbfN+r4f9TcpUaqkzXoU9TUNb8+Y6Fvn?=
 =?us-ascii?Q?vZxw2bPScFKKzMNE3nA+DYm/vkODe5XIgJ4f0CSZuW5fHXWn9eOXFncAG0sf?=
 =?us-ascii?Q?/0EWq0Au4k6ZDOMP+ZumdDQz7wUNqu3ZxcCmzrUkkrivH3sS2cxrh7qcp4pI?=
 =?us-ascii?Q?7n7Oy0KAOmjq1s7nv4zCVTrEhpkAOTXnIAw4oSzqSZonA/9pw6yrjlahBaX6?=
 =?us-ascii?Q?50cMUtv9BhYKpguEXs+g/3IPgxU5OG8Zc0Tu4BDkzihsXsxmZd/ZcJDC/EzM?=
 =?us-ascii?Q?eILFxvwk6nH8zacmQwsB1utF4utbjpjaPoAhp1Vcc0hvITa+AdZWFpnRGH5K?=
 =?us-ascii?Q?6FU08zrCsCw+wKtkjq6b6V843CriNiZhYGzrXVN9EnRzn8lK/cfMNlmqPiVe?=
 =?us-ascii?Q?WOyf28fCsLQq+0lER5k43QUFcCeK01rkBNd+RrpvOp/PdDCWonA++swCKMMm?=
 =?us-ascii?Q?qs/iaSw+p9eCbAmFiCUxRQUFsIxj8mNZ9FRQvi1l+r4yE3QEx5UllePmwCAc?=
 =?us-ascii?Q?//obxwZJxkB2+YHrmI+ROKAliE+hzh9PY25Z6o2xxFUkRgdO/aRxddR0DOZR?=
 =?us-ascii?Q?qwQn43yuPtmUPmOg9d2pYkEr3cU+mTcYLk1yrlGVvg5tJVU6/EnisGrQfbl4?=
 =?us-ascii?Q?jtlWacmwTLp6W/SU7mmuafClenuq8HgVsFXhFjr5cdEBSbcnFGSpnsT2bVKC?=
 =?us-ascii?Q?OcwGcz8/jz/C25OcwlaLDiZAKVdlFGUSI/lgIojL4foOBbVrEVYtN+OYhj2j?=
 =?us-ascii?Q?6EG5p6bPq/KT5zEksxe4p5pI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194032a3-5fd3-4894-bb16-08d9772fdfcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2021 03:29:35.0098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LSIB6IUaqWWtcIJbPArhPAwiDX5BeuZQWCHkNdgWCWxRKvpF9UUSaB/YAqaY7NNg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219
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

Driver can exchange the custom profiling settings with SMU FW using the tab=
le below:
TABLE_CUSTOM_DPM

And the related data structure is CustomDpmSettings_t.

BR
Evan
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Monday, September 13, 2021 11:11 PM
> To: Daniel Gomez <daniel@qtec.com>; Huang, Ray <Ray.Huang@amd.com>;
> Quan, Evan <Evan.Quan@amd.com>; Zhu, Changfeng
> <Changfeng.Zhu@amd.com>
> Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI
> developers <dri-devel@lists.freedesktop.org>; Daniel Gomez
> <dagmcr@gmail.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
> Subject: Re: [RFC][PATCH] drm/amdgpu/powerplay/smu10: Add custom
> profile
>=20
> On Wed, Sep 8, 2021 at 3:23 AM Daniel Gomez <daniel@qtec.com> wrote:
> >
> > On Tue, 7 Sept 2021 at 19:23, Alex Deucher <alexdeucher@gmail.com>
> wrote:
> > >
> > > On Tue, Sep 7, 2021 at 4:53 AM Daniel Gomez <daniel@qtec.com> wrote:
> > > >
> > > > Add custom power profile mode support on smu10.
> > > > Update workload bit list.
> > > > ---
> > > >
> > > > Hi,
> > > >
> > > > I'm trying to add custom profile for the Raven Ridge but not sure
> > > > if I'd need a different parameter than PPSMC_MSG_SetCustomPolicy
> > > > to configure the custom values. The code seemed to support CUSTOM
> > > > for workload types but it didn't show up in the menu or accept any
> > > > user input parameter. So far, I've added that part but a bit
> > > > confusing to me what is the policy I need for setting these
> > > > parameters or if it's maybe not possible at all.
> > > >
> > > > After applying the changes I'd configure the CUSTOM mode as follows=
:
> > > >
> > > > echo manual >
> > > >
> /sys/class/drm/card0/device/hwmon/hwmon1/device/power_dpm_force_
> pe
> > > > rformance_level echo "6 70 90 0 0" >
> > > >
> /sys/class/drm/card0/device/hwmon/hwmon1/device/pp_power_profile_
> m
> > > > ode
> > > >
> > > > Then, using Darren Powell script for testing modes I get the
> > > > following
> > > > output:
> > > >
> > > > 05:00.0 VGA compatible controller [0300]: Advanced Micro Devices,
> > > > Inc. [AMD/ATI] Raven Ridge [Radeon Vega Series / Radeon Vega
> > > > Mobile Series] [1002:15dd] (rev 83) =3D=3D=3D pp_dpm_sclk =3D=3D=3D
> > > > 0: 200Mhz
> > > > 1: 400Mhz *
> > > > 2: 1100Mhz
> > > > =3D=3D=3D pp_dpm_mclk =3D=3D=3D
> > > > 0: 400Mhz
> > > > 1: 933Mhz *
> > > > 2: 1067Mhz
> > > > 3: 1200Mhz
> > > > =3D=3D=3D pp_power_profile_mode =3D=3D=3D
> > > > NUM        MODE_NAME BUSY_SET_POINT FPS USE_RLC_BUSY
> MIN_ACTIVE_LEVEL
> > > >   0 BOOTUP_DEFAULT :             70  60          0              0
> > > >   1 3D_FULL_SCREEN :             70  60          1              3
> > > >   2   POWER_SAVING :             90  60          0              0
> > > >   3          VIDEO :             70  60          0              0
> > > >   4             VR :             70  90          0              0
> > > >   5        COMPUTE :             30  60          0              6
> > > >   6         CUSTOM*:             70  90          0              0
> > > >
> > > > As you can also see in my changes, I've also updated the workload
> > > > bit table but I'm not completely sure about that change. With the
> > > > tests I've done, using bit 5 for the WORKLOAD_PPLIB_CUSTOM_BIT
> > > > makes the gpu sclk locked around ~36%. So, maybe I'm missing a
> > > > clock limit configuraton table somewhere. Would you give me some
> > > > hints to proceed with this?
> > >
> > > I don't think APUs support customizing the workloads the same way
> > > dGPUs do.  I think they just support predefined profiles.
> > >
> > > Alex
> >
> >
> > Thanks Alex for the quick response. Would it make sense then to remove
> > the custom workload code (PP_SMC_POWER_PROFILE_CUSTOM) from the
> smu10?
> > That workload was added in this commit:
> > f6f75ebdc06c04d3cfcd100f1b10256a9cdca407 [1] and not use at all in the
> > code as it's limited to PP_SMC_POWER_PROFILE_COMPUTE index. The
> > smu10.h also includes the custom workload bit definition and that was
> > a bit confusing for me to understand if it was half-supported or not
> > possible to use at all as I understood from your comment.
> >
> > Perhaps could also be mentioned (if that's kind of standard) in the
> > documentation[2] so, the custom pp_power_profile_mode is only
> > supported in dGPUs.
> >
> > I can send the patches if it makes sense.
>=20
> I guess I was thinking of another asic.  @Huang Rui, @changzhu, @Quan,
> Evan can any of you comment on what is required for custom profiles on
> APUs?
>=20
> Alex
>=20
>=20
> >
> > [1]:
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.
> >
> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git
> %2
> >
> Fcommit%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Fpm%2Fpowerplay%2Fhwmg
> r%2Fsmu10_h
> >
> wmgr.c%3Fid%3Df6f75ebdc06c04d3cfcd100f1b10256a9cdca407&amp;data=3D0
> 4%7C0
> >
> 1%7CEvan.Quan%40amd.com%7Cfdb9fc6f03f84cb69dc608d976c8b517%7C3d
> d8961fe
> >
> 4884e608e11a82d994e183d%7C0%7C0%7C637671426675410633%7CUnknown
> %7CTWFpb
> >
> GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> 6Mn0
> > %3D%7C1000&amp;sdata=3DNsmj%2BgJpv9QZj%2FKF57E9n7LJfcOc9Jg51jy0h
> eOPTRI%3
> > D&amp;reserved=3D0
> > [2]:
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww
> w.
> > kernel.org%2Fdoc%2Fhtml%2Flatest%2Fgpu%2Famdgpu.html%23pp-
> power-profil
> > e-
> mode&amp;data=3D04%7C01%7CEvan.Quan%40amd.com%7Cfdb9fc6f03f84cb
> 69dc608
> >
> d976c8b517%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376714
> 2667541
> >
> 0633%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu
> MzIiLCJBT
> >
> iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D8HqoOL9kiJSfdHelJI380I
> wVyhe
> > 8Zo5E9PwCa7jsoYE%3D&amp;reserved=3D0
> >
> > Daniel
> >
> > >
> > >
> > > >
> > > > Thanks in advance,
> > > > Daniel
> > > >
> > > >
> > > >  drivers/gpu/drm/amd/pm/inc/smu10.h            | 14 +++--
> > > >  .../drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c  | 57
> > > > +++++++++++++++++--
>   .../drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > > > |  1 +
> > > >  3 files changed, 61 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/amd/pm/inc/smu10.h
> > > > b/drivers/gpu/drm/amd/pm/inc/smu10.h
> > > > index 9e837a5014c5..b96520528240 100644
> > > > --- a/drivers/gpu/drm/amd/pm/inc/smu10.h
> > > > +++ b/drivers/gpu/drm/amd/pm/inc/smu10.h
> > > > @@ -136,12 +136,14 @@
> > > >  #define FEATURE_CORE_CSTATES_MASK     (1 <<
> FEATURE_CORE_CSTATES_BIT)
> > > >
> > > >  /* Workload bits */
> > > > -#define WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT 0
> > > > -#define WORKLOAD_PPLIB_VIDEO_BIT          2
> > > > -#define WORKLOAD_PPLIB_VR_BIT             3
> > > > -#define WORKLOAD_PPLIB_COMPUTE_BIT        4
> > > > -#define WORKLOAD_PPLIB_CUSTOM_BIT         5
> > > > -#define WORKLOAD_PPLIB_COUNT              6
> > > > +#define WORKLOAD_DEFAULT_BIT              0
> > > > +#define WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT 1
> > > > +#define WORKLOAD_PPLIB_POWER_SAVING_BIT   2
> > > > +#define WORKLOAD_PPLIB_VIDEO_BIT          3
> > > > +#define WORKLOAD_PPLIB_VR_BIT             4
> > > > +#define WORKLOAD_PPLIB_COMPUTE_BIT        5
> > > > +#define WORKLOAD_PPLIB_CUSTOM_BIT         6
> > > > +#define WORKLOAD_PPLIB_COUNT              7
> > > >
> > > >  typedef struct {
> > > >         /* MP1_EXT_SCRATCH0 */
> > > > diff --git
> a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
> > > > b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
> > > > index 1de3ae77e03e..fef9f9ac1c56 100644
> > > > --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
> > > > +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
> > > > @@ -110,6 +110,11 @@ static int smu10_initialize_dpm_defaults(struc=
t
> pp_hwmgr *hwmgr)
> > > >         smu10_data->num_active_display =3D 0;
> > > >         smu10_data->deep_sleep_dcefclk =3D 0;
> > > >
> > > > +       smu10_data->custom_profile_mode[0] =3D 0;
> > > > +       smu10_data->custom_profile_mode[1] =3D 0;
> > > > +       smu10_data->custom_profile_mode[2] =3D 0;
> > > > +       smu10_data->custom_profile_mode[3] =3D 0;
> > > > +
> > > >         phm_cap_unset(hwmgr->platform_descriptor.platformCaps,
> > > >
> > > > PHM_PlatformCaps_SclkDeepSleep);
> > > >
> > > > @@ -544,6 +549,10 @@ static int smu10_hwmgr_backend_init(struct
> > > > pp_hwmgr *hwmgr)
> > > >
> > > >         hwmgr->backend =3D data;
> > > >
> > > > +       hwmgr->workload_mask =3D 1 << hwmgr-
> >workload_prority[PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT];
> > > > +       hwmgr->power_profile_mode =3D
> PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
> > > > +       hwmgr->default_power_profile_mode =3D
> > > > + PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
> > > > +
> > > >         result =3D smu10_initialize_dpm_defaults(hwmgr);
> > > >         if (result !=3D 0) {
> > > >                 pr_err("smu10_initialize_dpm_defaults failed\n");
> > > > @@ -1408,9 +1417,15 @@ static int
> conv_power_profile_to_pplib_workload(int power_profile)
> > > >         int pplib_workload =3D 0;
> > > >
> > > >         switch (power_profile) {
> > > > +       case PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT:
> > > > +               pplib_workload =3D WORKLOAD_DEFAULT_BIT;
> > > > +               break;
> > > >         case PP_SMC_POWER_PROFILE_FULLSCREEN3D:
> > > >                 pplib_workload =3D WORKLOAD_PPLIB_FULL_SCREEN_3D_BI=
T;
> > > >                 break;
> > > > +       case PP_SMC_POWER_PROFILE_POWERSAVING:
> > > > +               pplib_workload =3D WORKLOAD_PPLIB_POWER_SAVING_BIT;
> > > > +               break;
> > > >         case PP_SMC_POWER_PROFILE_VIDEO:
> > > >                 pplib_workload =3D WORKLOAD_PPLIB_VIDEO_BIT;
> > > >                 break;
> > > > @@ -1430,22 +1445,24 @@ static int
> > > > conv_power_profile_to_pplib_workload(int power_profile)
> > > >
> > > >  static int smu10_get_power_profile_mode(struct pp_hwmgr *hwmgr,
> > > > char *buf)  {
> > > > +       struct smu10_hwmgr *smu10_data =3D (struct smu10_hwmgr
> > > > + *)(hwmgr->backend);
> > > >         uint32_t i, size =3D 0;
> > > >         static const uint8_t
> > > > -               profile_mode_setting[6][4] =3D {{70, 60, 0, 0,},
> > > > +               profile_mode_setting[7][4] =3D {{70, 60, 0, 0,},
> > > >                                                 {70, 60, 1, 3,},
> > > >                                                 {90, 60, 0, 0,},
> > > >                                                 {70, 60, 0, 0,},
> > > >                                                 {70, 90, 0, 0,},
> > > >                                                 {30, 60, 0, 6,},
> > > >                                                 };
> > > > -       static const char *profile_name[6] =3D {
> > > > +       static const char *profile_name[7] =3D {
> > > >                                         "BOOTUP_DEFAULT",
> > > >                                         "3D_FULL_SCREEN",
> > > >                                         "POWER_SAVING",
> > > >                                         "VIDEO",
> > > >                                         "VR",
> > > > -                                       "COMPUTE"};
> > > > +                                       "COMPUTE",
> > > > +                                       "CUSTOM"};
> > > >         static const char *title[6] =3D {"NUM",
> > > >                         "MODE_NAME",
> > > >                         "BUSY_SET_POINT", @@ -1459,11 +1476,15 @@
> > > > static int smu10_get_power_profile_mode(struct pp_hwmgr *hwmgr,
> char *buf)
> > > >         size +=3D sysfs_emit_at(buf, size, "%s %16s %s %s %s %s\n",=
title[0],
> > > >                         title[1], title[2], title[3], title[4],
> > > > title[5]);
> > > >
> > > > -       for (i =3D 0; i <=3D PP_SMC_POWER_PROFILE_COMPUTE; i++)
> > > > +       for (i =3D 0; i < PP_SMC_POWER_PROFILE_CUSTOM; i++)
> > > >                 size +=3D sysfs_emit_at(buf, size,
> "%3d %14s%s: %14d %3d %10d %14d\n",
> > > >                         i, profile_name[i], (i =3D=3D hwmgr->power_=
profile_mode) ?
> "*" : " ",
> > > >                         profile_mode_setting[i][0], profile_mode_se=
tting[i][1],
> > > >                         profile_mode_setting[i][2],
> > > > profile_mode_setting[i][3]);
> > > > +       size +=3D sysfs_emit_at(buf, size,
> "%3d %14s%s: %14d %3d %10d %14d\n", i,
> > > > +                       profile_name[i], (i =3D=3D hwmgr->power_pro=
file_mode) ?
> "*" : " ",
> > > > +                       smu10_data->custom_profile_mode[0], smu10_d=
ata-
> >custom_profile_mode[1],
> > > > +                       smu10_data->custom_profile_mode[2],
> > > > + smu10_data->custom_profile_mode[3]);
> > > >
> > > >         return size;
> > > >  }
> > > > @@ -1480,16 +1501,42 @@ static bool smu10_is_raven1_refresh(struct
> > > > pp_hwmgr *hwmgr)
> > > >
> > > >  static int smu10_set_power_profile_mode(struct pp_hwmgr *hwmgr,
> > > > long *input, uint32_t size)  {
> > > > +       struct smu10_hwmgr *smu10_data =3D (struct smu10_hwmgr
> *)(hwmgr->backend);
> > > > +       uint8_t busy_set_point, FPS, use_rlc_busy, min_active_level=
;
> > > > +       uint32_t power_profile_mode =3D input[size];
> > > >         int workload_type =3D 0;
> > > >         int result =3D 0;
> > > >
> > > > -       if (input[size] > PP_SMC_POWER_PROFILE_COMPUTE) {
> > > > +       if (input[size] > PP_SMC_POWER_PROFILE_CUSTOM) {
> > > >                 pr_err("Invalid power profile mode %ld\n", input[si=
ze]);
> > > >                 return -EINVAL;
> > > >         }
> > > >         if (hwmgr->power_profile_mode =3D=3D input[size])
> > > >                 return 0;
> > > >
> > > > +       if (power_profile_mode =3D=3D PP_SMC_POWER_PROFILE_CUSTOM)
> {
> > > > +               if (size !=3D 0 && size !=3D 4)
> > > > +                       return -EINVAL;
> > > > +
> > > > +               if (size =3D=3D 0) {
> > > > +                       if (smu10_data->custom_profile_mode[0] !=3D=
 0)
> > > > +                               goto out;
> > > > +                       else
> > > > +                               return -EINVAL;
> > > > +               }
> > > > +
> > > > +               smu10_data->custom_profile_mode[0] =3D busy_set_poi=
nt =3D
> input[0];
> > > > +               smu10_data->custom_profile_mode[1] =3D FPS =3D inpu=
t[1];
> > > > +               smu10_data->custom_profile_mode[2] =3D use_rlc_busy=
 =3D
> input[2];
> > > > +               smu10_data->custom_profile_mode[3] =3D min_active_l=
evel =3D
> input[3];
> > > > +               smum_send_msg_to_smc_with_parameter(hwmgr,
> > > > +                                       PPSMC_MSG_SetCustomPolicy,
> > > > +                                       busy_set_point | FPS<<8 |
> > > > +                                       use_rlc_busy << 16 | min_ac=
tive_level<<24,
> > > > +                                       NULL);
> > > > +       }
> > > > +
> > > > +out:
> > > >         /* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT
> */
> > > >         workload_type =3D
> > > >                 conv_power_profile_to_pplib_workload(input[size]);
> > > > diff --git
> a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > > > b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > > > index 808e0ecbe1f0..4c4b2b1b510a 100644
> > > > --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > > > +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > > > @@ -302,6 +302,7 @@ struct smu10_hwmgr {
> > > >         uint32_t                             num_active_display;
> > > >
> > > >         bool                                                    fin=
e_grain_enabled;
> > > > +       uint8_t                              custom_profile_mode[4]=
;
> > > >  };
> > > >
> > > >  struct pp_hwmgr;
> > > > --
> > > > 2.30.2
> > > >
