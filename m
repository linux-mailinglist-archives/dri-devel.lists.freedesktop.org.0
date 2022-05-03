Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 147F9517BDB
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 04:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041E510F3B1;
	Tue,  3 May 2022 02:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2070.outbound.protection.outlook.com [40.107.212.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E5110F3B0;
 Tue,  3 May 2022 02:16:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5QtN3acuiZ+lDzuMP0C9RyzOA2C96KVSaEuQvxHc1PgSpQV7SU13Q0gTPYMfSl/eF8kKd0oKkbAEo017LwjTDMELd0b8sRd2j+w+J7d1AvyeCBDuFUotLRUIm3Y8DNOHZC6WtzbATBCiEIdZkEcMcNEnyEn/dyTwwh9hH/mqLmB9VEOwTKrzfOvy8BDRbi8KPISOJb2lApDeSbe96tYy/m5r9qn9BgUZwLLcvkdf0fRe5JkafuXQV4bkAKe3xNve4RdQqgUqWSF4SlGuwSIAxp63cMOcVWCKnSPT5AW9qYqVNK3Vkl5y6kPS54TAkwx2qjttoqX8sg7yK9VruvjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ympg5lK76qsYXAkhTDk7UV1+P0XVaS6y6erqTOMjJQI=;
 b=YGu3Z+Y216pEG3FQKMFOKEcEEmO7zYvVOq8E4vqe3SOePaDqZlJiV+BfCIbugUHbUHSpX2hnPnnZb3zv32GJfp3f9k0UJTAyTBxwG9IpIbMK+AR62YWQieTUj9tTapPylqgyquvOkJLbLknqOf8WFBBA0Z6lgLeyyknjlTCtHfklSMpw+F/VtbXuShxd12xcEp273AJxt5nfbxoUCQXUiAMWnwceEJH1RNE8mvm7xsQHpMtOM+MQqfW+epKAF3ihapFYc4L4gTz9BBGUj+ibtHQDO9v1UY1+aAQrdMH8+VFpkKWLCVo1bfmAbO5Ml3TdJwzZCIDI+YkYow0YWzGekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ympg5lK76qsYXAkhTDk7UV1+P0XVaS6y6erqTOMjJQI=;
 b=eWnKHyE8MShQF6rVZesJ2zneWshUFnfWwZx8QlnuakRCtp/P3310GsGBzdT2pMLQdR5j+/J4OW6N+dlQL4y4hGiBEIE2A0fMUzf+oEeS8dgm6JOL9Zl5UyNQ0Uuj4qglG3+ckTgXBe2xggvZGkEukyJjmZBI5HwH2PBkh9tMG4s=
Received: from DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) by
 BN6PR12MB1473.namprd12.prod.outlook.com (2603:10b6:405:10::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Tue, 3 May 2022 02:16:00 +0000
Received: from DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::f0bd:73b1:ba7a:b551]) by DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::f0bd:73b1:ba7a:b551%8]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 02:16:00 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Gong, Richard"
 <Richard.Gong@amd.com>
Subject: RE: [PATCHv5] drm/amdgpu: vi: disable ASPM on Intel Alder Lake based
 systems
Thread-Topic: [PATCHv5] drm/amdgpu: vi: disable ASPM on Intel Alder Lake based
 systems
Thread-Index: AQHYW+NdClLw9DUGzUGMkD6pHBN1Sq0HEGQAgAVeo1A=
Date: Tue, 3 May 2022 02:16:00 +0000
Message-ID: <DM4PR12MB516887193B6139670B49056FE2C09@DM4PR12MB5168.namprd12.prod.outlook.com>
References: <20220429160604.2608782-1-richard.gong@amd.com>
 <CADnq5_OoyRmM+tWZ_nipfnNyxFVnyUH+R8Pc4-u2akeffXgssg@mail.gmail.com>
In-Reply-To: <CADnq5_OoyRmM+tWZ_nipfnNyxFVnyUH+R8Pc4-u2akeffXgssg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-05-03T02:13:43Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=640b487f-9e82-4634-9778-74b1aa1f7d24;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-05-03T02:15:58Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: dab8c646-ec4c-4802-ab74-9c814811214c
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4559925-f18c-4a1e-fb3a-08da2caadde5
x-ms-traffictypediagnostic: BN6PR12MB1473:EE_
x-microsoft-antispam-prvs: <BN6PR12MB1473EC7DA92423544BECCB55E2C09@BN6PR12MB1473.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yhOVvakuBdDTr4JR5HJZIViBSbE/dfJSGK77rGUFDqXt5rbm87DDuZPoqlBGS8m7C3Fl4IMxsPiTz4KW0KUra8Un4swNL9rOoSLFQ3qO7CAp9O+QzytqjIU4ebOYs7a4TfdE2HhDF+opQMQTMAYkxfKKY09OM5v2p5J/Wg6kKSL1p+dH6wsDnCUArkBIckVgiOVcG4yvPkEBoLEWxVOh9+skdzw29HQ9E09Uj4+F54cY8o9OVa3kVkjnvSGuZ0cRcGj18iybzdMxW1+lU0If3XTMK1vnHYx5869sIb97PQ3dv6C9EytydqbBVHNdEg2llgf9SjioaLmozrNa/Nxq1R/gWvuPbcTGTVP47Qo+oZxcAM65DxEXOJZ7knAEe8A5FcRzXI6lA8O5uTj7ETGcjM0Pf5BpiDPzUGm8Y95RbeUS9W+vurKNsK2tTsHYSTzczsohWFixvUH2gnVv3CZ7OdPWQRHgGc8TO5/ed7yPM6YDWhVwis7wDWzkir72asWN8lt+IiWUfK85m7f3akz4zQ/cCQHLP+TuHgOUO3dAnrkgk/imp6MXPQPYBmsTM9LsoqdgTd12HxPBu3RAR2mM031VDGvxy5AocZqKWi8P5vmNQryJrjqM7/8eMXziq4TF9OCrVLbvfKlE9eG9IUwZ0H/PTfs6FxtnOQRUFkGXoeFKN0EgAqidy8IdzFxnNxgCEWckra2hZIbrPNSNalKkn5Px+I8cWeN3VfZMHc4YLCvEqK9+RW3cLuacDrL+BbDGzyFm6VpgRGqsfa+7+z3dGKpfUZUKObsLiLn2s+qxN5o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5168.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(66946007)(66556008)(66476007)(66446008)(64756008)(33656002)(966005)(8676002)(76116006)(4326008)(110136005)(54906003)(186003)(316002)(6636002)(9686003)(26005)(2906002)(6506007)(53546011)(86362001)(55016003)(71200400001)(7696005)(5660300002)(508600001)(8936002)(38100700002)(52536014)(45080400002)(122000001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GNTO21lJ20MYd0Y4FAxfcPC2kFlHmVk7fZVhe0nVa+EfxFkyxb5yweLYNkhB?=
 =?us-ascii?Q?W7gMUgOpFXLoiA3UYrFh2i5WZapnmItkymbApGiay/b4ifNygsB7Lxxbqxe8?=
 =?us-ascii?Q?vkQwtNU5xoCFV/JH3u83yup1RGqUxSl8JvBwJaiM3R712XEOn2SclyG2Ch0T?=
 =?us-ascii?Q?Xc0SCA7IP1Iwz/fhMakuwOOEE/1qR1T+7vUoIxERTQb9e615/nsJctWla+MJ?=
 =?us-ascii?Q?8/ljeg1kuniS+ma4yVcuUtG71i336ix4ARYWyqAJcFB2NQDMmTReMP3ZEhbB?=
 =?us-ascii?Q?XZnWRvQUfy6KRBzbJTpqc6e4HYBG5fPwaLnexjXyUVJHFcxCaIp88rpC2OmW?=
 =?us-ascii?Q?WZVahRKiDRdOMAREGSEOXSJz5t4oXyFBBvmn65D+LaQBwEdLFi9N7Fvi8ULH?=
 =?us-ascii?Q?9QLCrqfsT+91VX+0db5KY3Httolibh91klFPMrEmGS3ot5mdpXCEh8W3dR9Z?=
 =?us-ascii?Q?TR9KWBVKIsi7zRdk8eRrnjp8KEQvH2EgafjvuPOgO+RUvAjLf8MoDrjz5RSS?=
 =?us-ascii?Q?4nW0Mp6dp8ou3yg2O7X/x3NwOci0eY6BD5NIE7TuMH7k0xE/yKQeNSZCKaZ7?=
 =?us-ascii?Q?p1AsX7htsoplbiq50YR8J48KV1rNFtdlCLKo/ewFAog3GsdDd5UiyXG5DYfD?=
 =?us-ascii?Q?/V0oLx8+c4AJZvFtnfeAhRTB2Y/H/Gd7rf8i4npph1Jv+dRU5gdwPL294tCb?=
 =?us-ascii?Q?Sxdfezo0tTT+ydzbQzZmIOEI6vF6AxGwpwGG+3BodGhHFh/M7oWlVDeuebpQ?=
 =?us-ascii?Q?bznih5M/8Z+os5NXWpTmAl4TBrjsoFPWICR9/ewnONwMmArtOYe2HwyAmiyH?=
 =?us-ascii?Q?tdzLZP1okKeQY77b1XE1TIxE/MfnOSPlZ+d9SZzzgrISdM1AjXswnEnV1OP0?=
 =?us-ascii?Q?nR2h8Tv5z0OxC0BEyFXZp6YBWdFoR8B/OgLnUwsg6Fs12OA1qc2VMs7aCNk2?=
 =?us-ascii?Q?kh74bI5pSjKg69No5mdr38YxEloI19tt2hDptwXSPnx/bW/XD7jfS8DAdRbX?=
 =?us-ascii?Q?jhl3I/6LfulHnvrU0y87Jk9uJiouDbL97yeJNtbbJuwBLRPkGfRo2eGxIDbx?=
 =?us-ascii?Q?cdxMj8xR6IpyHmGV1eQ7HNJsvkCH8W6SfTlCBgUEc8p86cM03elfsrhavud+?=
 =?us-ascii?Q?v0LP0n22QpoPCddlOSsN7KO66w0jZzKahAna1S+StuXI88DXpK5v3x4z0pRW?=
 =?us-ascii?Q?Nab9by58FnV0yu6pBoL2MRJt/HlggJzifBpMpUERD8KjzVnJrBJN7koO+mVP?=
 =?us-ascii?Q?EaheXz+lwkGXff08RAEN2tVLNc/hXxlx99FzWzGPRlPdMZshuMjzWxH7wS1I?=
 =?us-ascii?Q?GVvlDWMxN9aQ0rZYDRIZyeafKjBr15BPT41PFNxixv4EyFiyptk/2z/uB7eC?=
 =?us-ascii?Q?i51N8wBQ+knzERY+n2FnMIULNDgJgjzIynAvezcki0YAAhDnhgdryDLOSqRI?=
 =?us-ascii?Q?0mJfXWF/BX859+W1hDJ6R5QCq1/5TAShr90zzmLEDNJnpxcN+tU3bWW3GSJn?=
 =?us-ascii?Q?0p7WziKFlC6o67ikyt0mGs4OCAsOAytKfG8diQQEFJd2a1+4LTNG7RZ+7uR7?=
 =?us-ascii?Q?VOaYOwZpE/CRlyrzpujAGNSZCRIFuR29U4w6FZQP+xMM3rwh/Ja5fxN8L4Cs?=
 =?us-ascii?Q?PIUbKzsA0N61pYgcRIozxaZHM0LTGbGdna+FIQPPHYlbBmqe737c94116Fbv?=
 =?us-ascii?Q?ogLpXBfGPylI97GcG2nn/WTIUNtkeqAdATDvL3t3DzOmYIE3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5168.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4559925-f18c-4a1e-fb3a-08da2caadde5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 02:16:00.5090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L8GDSfIjB4UrEWIY2MiYLzZHh87fmuTGN0NO1QzRg1pn9lqMozhl4SswbKRyTij7YoNq1DPlkLzU0Vsm1vuAwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1473
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
Cc: kernel test robot <lkp@intel.com>, Dave Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]



> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Friday, April 29, 2022 11:14
> To: Gong, Richard <Richard.Gong@amd.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Dave
> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; amd-gfx list =
<amd-
> gfx@lists.freedesktop.org>; kernel test robot <lkp@intel.com>; LKML <linu=
x-
> kernel@vger.kernel.org>; Maling list - DRI developers <dri-
> devel@lists.freedesktop.org>; Limonciello, Mario
> <Mario.Limonciello@amd.com>
> Subject: Re: [PATCHv5] drm/amdgpu: vi: disable ASPM on Intel Alder Lake
> based systems
>=20
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>=20
> On Fri, Apr 29, 2022 at 12:08 PM Richard Gong <richard.gong@amd.com>
> wrote:
> >
> > Active State Power Management (ASPM) feature is enabled since kernel
> 5.14.
> > There are some AMD Volcanic Islands (VI) GFX cards, such as the WX3200
> and
> > RX640, that do not work with ASPM-enabled Intel Alder Lake based
> systems.
> > Using these GFX cards as video/display output, Intel Alder Lake based
> > systems will freeze after suspend/resume.
> >
> > The issue was originally reported on one system (Dell Precision 3660 wi=
th
> > BIOS version 0.14.81), but was later confirmed to affect at least 4
> > pre-production Alder Lake based systems.
> >
> > Add an extra check to disable ASPM on Intel Alder Lake based systems wi=
th
> > the problematic AMD Volcanic Islands GFX cards.
> >
> > Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> > Link:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla
> b.freedesktop.org%2Fdrm%2Famd%2F-
> %2Fissues%2F1885&amp;data=3D05%7C01%7Cmario.limonciello%40amd.com%
> 7C1fdb6c767a4a4b3f572c08da29fb3f1a%7C3dd8961fe4884e608e11a82d994e1
> 83d%7C0%7C0%7C637868456326825256%7CUnknown%7CTWFpbGZsb3d8eyJ
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C3000%7C%7C%7C&amp;sdata=3DLtV9WqUzB032KFmH2g%2F2BMtX2R6DyfM
> KqxCF1e2rHHg%3D&amp;reserved=3D0
> > Reported-by: kernel test robot <lkp@intel.com>

You should drop this "Reported-by:".  That makes more sense when it's a pat=
ch
that is already queued up and committee.  The bot just caught an intermedia=
ry
revision that wasn't committed anywhere, and it doesn't make sense here.

I don't think you need to resend out a new version for review to change com=
mit
message for that, this can just be fixed up when committing the change.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> > Signed-off-by: Richard Gong <richard.gong@amd.com>
> > ---
> > v5: added vi to commit header and updated commit message
> >     rolled back guard with the preprocessor as did in v2 to correct bui=
ld
> >     error on non-x86 systems
> > v4: s/CONFIG_X86_64/CONFIG_X86
> >     enhanced check logic
> > v3: s/intel_core_aspm_chk/aspm_support_quirk_check
> >     correct build error with W=3D1 option
> > v2: correct commit description
> >     move the check from chip family to problematic platform
> > ---
> >  drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
> b/drivers/gpu/drm/amd/amdgpu/vi.c
> > index 039b90cdc3bc..45f0188c4273 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> > @@ -81,6 +81,10 @@
> >  #include "mxgpu_vi.h"
> >  #include "amdgpu_dm.h"
> >
> > +#if IS_ENABLED(CONFIG_X86)
> > +#include <asm/intel-family.h>
> > +#endif
> > +
> >  #define ixPCIE_LC_L1_PM_SUBSTATE       0x100100C6
> >  #define
> PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK
> 0x00000001L
> >  #define
> PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK
> 0x00000002L
> > @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct
> amdgpu_device *adev)
> >                 WREG32_PCIE(ixPCIE_LC_CNTL, data);
> >  }
> >
> > +static bool aspm_support_quirk_check(void)
> > +{
> > +#if IS_ENABLED(CONFIG_X86)
> > +       struct cpuinfo_x86 *c =3D &cpu_data(0);
> > +
> > +       return !(c->x86 =3D=3D 6 && c->x86_model =3D=3D INTEL_FAM6_ALDE=
RLAKE);
> > +#else
> > +       return true;
> > +#endif
> > +}
> > +
> >  static void vi_program_aspm(struct amdgpu_device *adev)
> >  {
> >         u32 data, data1, orig;
> >         bool bL1SS =3D false;
> >         bool bClkReqSupport =3D true;
> >
> > -       if (!amdgpu_device_should_use_aspm(adev))
> > +       if (!amdgpu_device_should_use_aspm(adev) ||
> !aspm_support_quirk_check())
> >                 return;
> >
> >         if (adev->flags & AMD_IS_APU ||
> > --
> > 2.25.1
> >
