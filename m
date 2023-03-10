Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3C96B4BB7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 16:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006B010E1F3;
	Fri, 10 Mar 2023 15:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8822C10E1F3;
 Fri, 10 Mar 2023 15:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJuI6caZGgeLk4+b0ksOGyyFR4jXgTteWr79ofERXCYX1x14tcnCOXbXY+kAjcFnNy/NMy6DLVgOoYAdaRrFXqI7v8cjXCpzwbmnU9UBR77lKW2gfBwR+M9/RDxk8CrqBjmna0wgfRz4GzkzE36zJXaIwJCMnVMr+Upb3vB4DBtHJbA5HfY8g/BWo9vpICbTube+R8GwW8n4RrBjonCx/efcgvVJx79AZke4tLHMONOZBfGFw8hn8RQ8yXeLpfL32MVh2A/h91jyn/ykdwBmHRP76kF/ymj+klBsZxtsWYYRuLS7axX3dixrU3+yHgoLtVwB1v12+yJQL6Das2PiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3jfglRaKWUPUmxMMhJeUe23C1OVw/4+WlNr45t8rS4=;
 b=W1LJ7SnrmLIPJC/P/q0quTZHafOUhZyenL20otsNivmlP4DbdB2MMbPLKoQEweuawx3APu1bl9KIW3o1AAhTztD5GCNkOP8UDUkJDMI8xkNPOdrt1inWwX6LNvCQ9gdr1zt+DKRapHgE/WWD+VjTWlPGuBde5YSejSS8zG9IkbD1Stvai3hGgNAa6EDxUg1GZr8SsGupwUPgbHe+b+CCyNsCnB6HqtDX0ontTOJVXwBKTEXb8if1c5qBor5tGXYWP//U2jcOEtPtLESEg9ktJxo4cF/fYo0fWcWc1PK3RmFsvw7V9u5arjLXdDAagkDYZbThj08XpDr36JYPboVXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3jfglRaKWUPUmxMMhJeUe23C1OVw/4+WlNr45t8rS4=;
 b=HKvxkiVChSl8LnBmFDkVMnxhY1ImwoRGdCtljU8flvqPSa2/0sGtnKXkrqlvlao9baNhzMJMwOdYZJ2UAdiOG6YHfwKQLJY6R51pFFctykrDOqn2fjdVUUbcp0vSFrDaAmmQCBuBoA3Diq3OokXttqxLMVd1WQaEw+f2Xw6TCWo=
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by BY5PR12MB4886.namprd12.prod.outlook.com (2603:10b6:a03:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 15:55:03 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::3e46:4948:b543:8dba]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::3e46:4948:b543:8dba%2]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 15:55:02 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: Re: [PATCH] drm/amdgpu: resove reboot exception for si oland
Thread-Topic: [PATCH] drm/amdgpu: resove reboot exception for si oland
Thread-Index: AQHZUyayQsObnHYUakqC8qgg99fvaK7zq5SAgAB1/ACAAAjaOg==
Date: Fri, 10 Mar 2023 15:55:02 +0000
Message-ID: <BYAPR12MB4614BA9C8C2E28A686B0AB6E97BA9@BYAPR12MB4614.namprd12.prod.outlook.com>
References: <20230310074000.2078124-1-lizhenneng@kylinos.cn>
 <DM5PR12MB2469FEB1E81CA99C51E7DAF0F1BA9@DM5PR12MB2469.namprd12.prod.outlook.com>
 <CADnq5_OzDzi_LKeNdk4LNa2SwWg8Jpieci8omJye_ASDyjW3sA@mail.gmail.com>
In-Reply-To: <CADnq5_OzDzi_LKeNdk4LNa2SwWg8Jpieci8omJye_ASDyjW3sA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-10T15:52:46.9036497Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4614:EE_|BY5PR12MB4886:EE_
x-ms-office365-filtering-correlation-id: 959e4608-7ac2-480e-b0fe-08db217fcf74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D7BI/792XUtoYhDygmQmOSwtcdy9tkmPVtBMCQeOwfWbi9CKzIiKAb0iYb5yQlV9H3fTLwwR+okL4TWvcD1l3Xp1p4g/rGMFxYkI+s0lSBkKou+x3hFVeZo8DbHvmPjXhb63Ytry+We9dmJ3+39OEEy1XSDhq/WJkkTwCfOPUT10Ri0iG8rS2FKfmRGj+YRGzdKRFcaYllUtQ1aVECBxSoIqpO7dEFgN1mjGlj8DeUA6zvuFW7ruuMXYA1imosGtdOm9MAbM6VlM8aMUWBaQoP4/FcLvz0uq98sf1Bl4a58tkp2eLRB30qPn4MqvPJopsHmmteX7dBKKPbKtAiiVOLvP1vAQYwXBkipxP4FpAfawsNOJdGxVEVRfYO4o8Lipb53ORiIFijAMCPqqAkA/MUsGpwTEX8RR/PfnCar4g8xf5aH433yVjNB0f84mydex09aAx3iiuYYgHHojufG+vdvt5cXI+9onvXiWvTaPjD8VUY1jIEdc9qzKWCbhc2Cy0J00j6D2aJRgynTI59czJqa0NhmHQyR9sqN26hRSaErvO2Z+e4aWpYPP5G23GDAXFhzJJvAhsAG76HKv4tmqN0tH2YtjjrkYX7dGQlEIwE0XBHWaNDdFU5x4wmSFyCVYwrKHk7IIsmMhq4biscn1l/xxz9fxjdvP0X8lD56r40NjZ3N4ACxdWKibsEqsHzokSfkTv+9r7eJE1UdyCwyAuQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199018)(33656002)(6636002)(316002)(110136005)(54906003)(186003)(478600001)(2906002)(7696005)(71200400001)(5660300002)(52536014)(66446008)(66946007)(76116006)(66556008)(64756008)(8676002)(4326008)(66476007)(91956017)(8936002)(41300700001)(122000001)(38070700005)(55016003)(38100700002)(86362001)(9686003)(53546011)(6506007)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m1PWYcq9yL2ccoAmwvkejUqoXCENGbwLy+gppafqKOWGZXUQ54d3J11c9OD1?=
 =?us-ascii?Q?8lQHkEov9KNd9U54qld7pnvnXz+MaQxboL7MsoI3FlKtINRzw+R4lOPb1H2f?=
 =?us-ascii?Q?D4T7T3uw6yvYafOMi62AXiytQtmDEiKruCgqkaN32RdNBE9VLU5KvxMnw69W?=
 =?us-ascii?Q?dmhPsEebDjVL8Qwf5O4/CXyCgcKK3AXZ8wnVtfYCb1iOk4A+gnr4lDOt8wu/?=
 =?us-ascii?Q?1qJ0OKqxdRiMJQIS7A3DlInB69qIJv9oYd3TNwHOiQ2TmdgDt+HP/pJ5X7Ig?=
 =?us-ascii?Q?m4CmbpTCbdp+sksjq44fcUIVW/qUzIqpJ4NrBLhlhca46ZTi+r6OFVG2WWYG?=
 =?us-ascii?Q?Qx27TrDuSixzRgI+kL+OTnFWoBqjbH5enhldH34X7XelQ7wEbRxXPqth2aSm?=
 =?us-ascii?Q?lhpZO0wA/nkHvtZaFGeW7CP7y7b55Wu1Y4L0bn1JLsYTxvt96GEKFiC5d3e5?=
 =?us-ascii?Q?KIRuyAIL0CF+gZ4FhuSFOoyo+fqPkkotsOPykPfpOlLQSpz5wi3fMJbayGy9?=
 =?us-ascii?Q?UT8clLEsuFGbecJqbswJwa6zEwYZ2U5IAKaTGEyKjuSIc6J0jPRaqS1dkVtx?=
 =?us-ascii?Q?sJrMTy9phiCOrx2aaggL4A/MeZw3hMODGqIoUwI02eS83JTEng25DeoeW6ek?=
 =?us-ascii?Q?vSmBaKeTrt59iRefIZr6NIARMu/XGuBh9TtTksu4Qc3Ph6jJTXnMbeLuWm5Q?=
 =?us-ascii?Q?9bsmSi/immES221Vhq8Zx+k2Me3gAV3AkP6EKzweGOKHQU+jruaF+/lNry8m?=
 =?us-ascii?Q?q0viUjRDwgYZalL5TuiaM1bZ7ReD0l06MKpMy1RatknSawlFy5jnVa+0ZAwM?=
 =?us-ascii?Q?EiO7URjhbmU0FwEUQadyOSSamF+//MLMe6jjyBxD3KFAIGYssHF6acDp1AXw?=
 =?us-ascii?Q?bME0U2hl8HJlJkWpZCRG8ZYcEQaOUqezRuBE0x3eJvhMIz1Q2YlUEVmKhiNJ?=
 =?us-ascii?Q?WkwvcSlBXeaX+Jryf69PHKiBh9xDEjBkvRjO6Xgos6CtDxvnpWYd6WrECeKB?=
 =?us-ascii?Q?i1VYsCzW1u6Sg0wFfwndI3plCSu0zk1Uv5TscuPv1gs1KxJHlwyvWszUGB6X?=
 =?us-ascii?Q?7MY7IoKq/HONDcwTnMYMey+qiFRNNNucercAuuHZcOTLSIXDxImP/KaQ2qSr?=
 =?us-ascii?Q?LcbxQZJXDgO7E1SYWbTfva8XiyZ/M5ih3tGdLJRZAuGxknHTnXHtW9FfHi6q?=
 =?us-ascii?Q?4AJTQpu7ItKgR8c6QJTnSMQo92cn0W1uma5/liEmKx96tnC6o+3Uw6qrS035?=
 =?us-ascii?Q?SUQdhnDXS98bpmimZdUTM63G5idOLvnMWOuhf4a84dXHKVaCYKfq9RdAsoC/?=
 =?us-ascii?Q?RCqTrttI3ZjX7CCBW6b7RldKcOSmOt69CQo20XxzmJF2ZJ4l15TFnZOYtsPe?=
 =?us-ascii?Q?UzVyVqnxLqoo4P6O37MjxfJuGGpINuqX70CW6xHbr7xERhp0XMvFTt9ep1hR?=
 =?us-ascii?Q?WNGON39dKIcdVr6fsDukBs0UA1r20MrBGK0pVLcVxeO+cdm+uWgFK4i9rlWf?=
 =?us-ascii?Q?xUO27KV2kjZDw3xZZ5p15P9eyf9IKIK5KT9had+aE2MRtpJeNUbKswUHhbCP?=
 =?us-ascii?Q?vGgNlUM7pW3v4ymyIuHcwhFv/ThPld4mue6RAMw3?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB4614BA9C8C2E28A686B0AB6E97BA9BYAPR12MB4614namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959e4608-7ac2-480e-b0fe-08db217fcf74
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 15:55:02.7526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgwgLy6ua4uqnAKmK+N7EYBbNMrAspnDnHCAwi7f+SF4BrtmA9SPdN069ZmyMEZw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4886
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Zhenneng Li <lizhenneng@kylinos.cn>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR12MB4614BA9C8C2E28A686B0AB6E97BA9BYAPR12MB4614namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

I recall that there was a previous discussion around this and that time we =
found that the range is already set earlier during DPM enablement.

The suspected root cause was enable/disable of thermal alert within this ca=
ll to set range again.

Thanks,
Lijo
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Alex Deu=
cher <alexdeucher@gmail.com>
Sent: Friday, March 10, 2023 8:51:06 PM
To: Chen, Guchun <Guchun.Chen@amd.com>
Cc: David Airlie <airlied@linux.ie>; Pan, Xinhui <Xinhui.Pan@amd.com>; Zhen=
neng Li <lizhenneng@kylinos.cn>; amd-gfx@lists.freedesktop.org <amd-gfx@lis=
ts.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel=
.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; D=
aniel Vetter <daniel@ffwll.ch>; Deucher, Alexander <Alexander.Deucher@amd.c=
om>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu: resove reboot exception for si oland

On Fri, Mar 10, 2023 at 3:18 AM Chen, Guchun <Guchun.Chen@amd.com> wrote:
>
>
> > -----Original Message-----
> > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Zhenneng Li
> > Sent: Friday, March 10, 2023 3:40 PM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>
> > Cc: David Airlie <airlied@linux.ie>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> > linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; Zhenneng=
 Li
> > <lizhenneng@kylinos.cn>; amd-gfx@lists.freedesktop.org; Daniel Vetter
> > <daniel@ffwll.ch>; Koenig, Christian <Christian.Koenig@amd.com>
> > Subject: [PATCH] drm/amdgpu: resove reboot exception for si oland
> >
> > During reboot test on arm64 platform, it may failure on boot.
> >
> > The error message are as follows:
> > [    6.996395][ 7] [  T295] [drm:amdgpu_device_ip_late_init [amdgpu]]
> > *ERROR*
> >                           late_init of IP block <si_dpm> failed -22
> > [    7.006919][ 7] [  T295] amdgpu 0000:04:00.0: amdgpu_device_ip_late_=
init
> > failed
> > [    7.014224][ 7] [  T295] amdgpu 0000:04:00.0: Fatal error during GPU=
 init
> > ---
> >  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> > b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> > index d6d9e3b1b2c0..dee51c757ac0 100644
> > --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> > +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> > @@ -7632,9 +7632,6 @@ static int si_dpm_late_init(void *handle)
> >       if (!adev->pm.dpm_enabled)
> >               return 0;
> >
> > -     ret =3D si_set_temperature_range(adev);
> > -     if (ret)
> > -             return ret;
>
> si_set_temperature_range should be platform agnostic. Can you please elab=
orate more?
>

Yes.  Not setting this means we won't get thermal interrupts.  We
shouldn't skip this.

Alex


> Regards,
> Guchun
>
> >  #if 0 //TODO ?
> >       si_dpm_powergate_uvd(adev, true);
> >  #endif
> > --
> > 2.25.1
>

--_000_BYAPR12MB4614BA9C8C2E28A686B0AB6E97BA9BYAPR12MB4614namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"" dir=3D"auto">I recall that there was a previous discussion =
around this and that time we found that the range is already set earlier du=
ring DPM enablement.</div>
<div style=3D"" dir=3D"auto"><br>
</div>
<div style=3D"" dir=3D"auto">The suspected root cause was enable/disable of=
 thermal alert within this call to set range again.</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">
<div><br>
</div>
Thanks,<br>
Lijo</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Alex Deucher &lt;alexdeucher@=
gmail.com&gt;<br>
<b>Sent:</b> Friday, March 10, 2023 8:51:06 PM<br>
<b>To:</b> Chen, Guchun &lt;Guchun.Chen@amd.com&gt;<br>
<b>Cc:</b> David Airlie &lt;airlied@linux.ie&gt;; Pan, Xinhui &lt;Xinhui.Pa=
n@amd.com&gt;; Zhenneng Li &lt;lizhenneng@kylinos.cn&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; linux-kernel@vger.kerne=
l.org &lt;linux-kernel@vger.kernel.org&gt;; dri-devel@lists.freedesktop.org
 &lt;dri-devel@lists.freedesktop.org&gt;; Daniel Vetter &lt;daniel@ffwll.ch=
&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christi=
an &lt;Christian.Koenig@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: resove reboot exception for si olan=
d</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri, Mar 10, 2023 at 3:18 AM Chen, Guchun &lt;G=
uchun.Chen@amd.com&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Be=
half Of<br>
&gt; &gt; Zhenneng Li<br>
&gt; &gt; Sent: Friday, March 10, 2023 3:40 PM<br>
&gt; &gt; To: Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
&gt; &gt; Cc: David Airlie &lt;airlied@linux.ie&gt;; Pan, Xinhui &lt;Xinhui=
.Pan@amd.com&gt;;<br>
&gt; &gt; linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; Zh=
enneng Li<br>
&gt; &gt; &lt;lizhenneng@kylinos.cn&gt;; amd-gfx@lists.freedesktop.org; Dan=
iel Vetter<br>
&gt; &gt; &lt;daniel@ffwll.ch&gt;; Koenig, Christian &lt;Christian.Koenig@a=
md.com&gt;<br>
&gt; &gt; Subject: [PATCH] drm/amdgpu: resove reboot exception for si oland=
<br>
&gt; &gt;<br>
&gt; &gt; During reboot test on arm64 platform, it may failure on boot.<br>
&gt; &gt;<br>
&gt; &gt; The error message are as follows:<br>
&gt; &gt; [&nbsp;&nbsp;&nbsp; 6.996395][ 7] [&nbsp; T295] [drm:amdgpu_devic=
e_ip_late_init [amdgpu]]<br>
&gt; &gt; *ERROR*<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; late_init of IP block &lt;si_dpm&gt; failed -22<br>
&gt; &gt; [&nbsp;&nbsp;&nbsp; 7.006919][ 7] [&nbsp; T295] amdgpu 0000:04:00=
.0: amdgpu_device_ip_late_init<br>
&gt; &gt; failed<br>
&gt; &gt; [&nbsp;&nbsp;&nbsp; 7.014224][ 7] [&nbsp; T295] amdgpu 0000:04:00=
.0: Fatal error during GPU init<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 3 ---<br>
&gt; &gt;&nbsp; 1 file changed, 3 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c<br>
&gt; &gt; b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c<br>
&gt; &gt; index d6d9e3b1b2c0..dee51c757ac0 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c<br>
&gt; &gt; @@ -7632,9 +7632,6 @@ static int si_dpm_late_init(void *handle)<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;pm.dpm_enabled)=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D si_set_temperature_range(adev);=
<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; return ret;<br>
&gt;<br>
&gt; si_set_temperature_range should be platform agnostic. Can you please e=
laborate more?<br>
&gt;<br>
<br>
Yes.&nbsp; Not setting this means we won't get thermal interrupts.&nbsp; We=
<br>
shouldn't skip this.<br>
<br>
Alex<br>
<br>
<br>
&gt; Regards,<br>
&gt; Guchun<br>
&gt;<br>
&gt; &gt;&nbsp; #if 0 //TODO ?<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; si_dpm_powergate_uvd(adev, tr=
ue);<br>
&gt; &gt;&nbsp; #endif<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB4614BA9C8C2E28A686B0AB6E97BA9BYAPR12MB4614namp_--
