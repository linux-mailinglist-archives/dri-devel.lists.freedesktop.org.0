Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9288766D1C7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 23:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3DC10E086;
	Mon, 16 Jan 2023 22:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F22B10E086;
 Mon, 16 Jan 2023 22:28:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bggwTvN5JklP/SWJg87DMc8ZlwAoshicAvpMcute27hKgPYSQigbfUQGFDT6DDsJP5EzdbpdtJHK28zbK6wUQvFUgiSdwpE3iJQuri2RrVzb0Sy5kYyA6tzFSNCCz6vzVIwPDnsx8LfMlzHlNaO7XZIuAowLYYtEuFU/oV1khMO0ByfwcMFDl79L0YmG24r+ESYjo3zrqCIQbit/UlArw9QrXMl9DcxCCUIxYr0iaW76UEgSYrtkmmBLGp/fqKHreE3FOJExoT1Q6BMr8QYPXKsvnaXQuRF2/+2uHUgN+OH9o5Vxb79QhIVIQkUqQOAI62R1EPinqYMeot4Jh8GwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dei129KLsXTabOu2mPToUJLUvKWiXoDxZBZF+65WEwk=;
 b=airh3fCjaMlaMd/GQyOJbzsqlIeD0adzw/s3dGEDD9ej5ifsCpy2NZ6tniMRFwqZYNM8P7b3eK+RBYxdEwlvF17svr2AAwC75L6u76YA1tp9yoVYK61PsEnBoHcEivtVk9HLdp8qso+Fc5LAVHgdQbsB29/G2xBqCCAzxUos2FSXAamrgQikuSCoX7/sHHjeYfFA0+/Op15p4rOTWEWhKAaOQrJNQahYF6K5C7AS6PeM4t1PZXnU4CdxKM0vt3uP8gLZB4bs/rt+DNoDpqGTlYu+abqnVe2s+Lwt9t81bPCfqbAVTcoNUjtSc594WGaOKu4eYv546Xwry8sorY+IFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dei129KLsXTabOu2mPToUJLUvKWiXoDxZBZF+65WEwk=;
 b=sWRrSq+txpPU6BXKZHeugtLiDyxPkKfUMt3QINMmdFgsyF93wjjvVDJQAbXx7jTHvd33HCjxrk9d/XCFdvv55R+wfmbJKP09pHEfyldkv9iJr0gCRXjj9DobnZmob/unOYbGhNSljnLs4RAcpfXega2HNsDkH8RvRxQMRLBoA9E=
Received: from DM8PR12MB5399.namprd12.prod.outlook.com (2603:10b6:8:34::5) by
 MW4PR12MB6778.namprd12.prod.outlook.com (2603:10b6:303:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 22:27:58 +0000
Received: from DM8PR12MB5399.namprd12.prod.outlook.com
 ([fe80::3abd:f044:1e8e:4261]) by DM8PR12MB5399.namprd12.prod.outlook.com
 ([fe80::3abd:f044:1e8e:4261%2]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 22:27:57 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>
Subject: Re: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/dis)abling
 indirect SRAM mode
Thread-Topic: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force
 (en/dis)abling indirect SRAM mode
Thread-Index: AQHZKfBs6Qbh+J8bA0+4SCKi2+9+2q6hlSyAgAAJ24M=
Date: Mon, 16 Jan 2023 22:27:57 +0000
Message-ID: <DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19@DM8PR12MB5399.namprd12.prod.outlook.com>
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-3-gpiccoli@igalia.com>
 <CADnq5_Oh5Vdygo12evQKxw3w-ipRoQMvSNFHGcKtBNbSmtW7GQ@mail.gmail.com>
In-Reply-To: <CADnq5_Oh5Vdygo12evQKxw3w-ipRoQMvSNFHGcKtBNbSmtW7GQ@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5399:EE_|MW4PR12MB6778:EE_
x-ms-office365-filtering-correlation-id: 29d5071c-0dfb-46f1-4838-08daf810eb5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rPMl+0ijnO2CVoUtKM1idhP9pvCwHxUPaZo0RfUtZoA6gvFsMSZgpNlvqv+32urPvwOfsuxN3CMxEk36QErPPEN8L4MbxzZhuCaa5p5O8hKM7WlODWufq6WqJgZgH+7E5tbGAzgYaDz1KgSAkZZHwPBqm0eOPJI190u2Z0+qaHW8guLgrsJbi4+qLAniTeA/mWmlgf16z4IsIRC78AHmV5KsERFXbXoITy9m0iJ6sxead2kSUe4lC7jmnyJYgNjkWSxC1kZoQqRAlVICploDvMkpAhcL9ufsYr+alyRIKxNbtPnoVanIFfRoU07gYvcmbhE81Yx2KfVTQqbrdFMhacnvWifKmWuFqiQmCJIWAifEx//d+sqtmRW5Af9+hDlEQL8o5gubx/cxcYT2FiXCW5p8GCTnbClh/Z6nbCG+2FAmRBDEPtro/0ixuS5dlzJJELPal5SoWPn7q1fsXCr7FVnUWuUTuxqejKeiBxRoXY935PH1zdCReJaunq5p4fr/jPcxSaTz/Lh3SJsD4JNFckAB+5Y7WGULP1CSZnNrinQbCvwcJW94jCk2kcWfg6sHdfaYeKVaM56obTtyK5ee8T9gvlIlkVgh5IEVnR4IoijXym+z/den6qN/KGZUXUFNZ9Rt5LlOTulzhak6H9MDtZhop9TFV498eIhA81R/AIfOusI926VuRfv10P24QpKl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5399.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(33656002)(38070700005)(52536014)(122000001)(86362001)(5660300002)(38100700002)(8936002)(2906002)(83380400001)(55016003)(54906003)(110136005)(41300700001)(478600001)(53546011)(8676002)(6506007)(76116006)(7696005)(66946007)(4326008)(91956017)(66556008)(316002)(66476007)(66446008)(9686003)(71200400001)(64756008)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xl3/3nEiq6UeXbXr23hnrfQa62gwP1wId+2nyJYaT0Ka+RpDg54jlh39SM?=
 =?iso-8859-1?Q?8PuegsxkvJ+WIY+2o+OAMRXejmsuJJNsFHF8uBPxpSYy1fHlVee6S1gEPT?=
 =?iso-8859-1?Q?AmPOW/1xnn4pqAAYhNyd4dpSScKWquUbz/mu5fNUyQ/zZ46ZgN6gWhCTss?=
 =?iso-8859-1?Q?8uTGwRTCgLx3SByj2wzjbsygcYLPC27067OYpSPKqGukGKFwHjRBwVat1G?=
 =?iso-8859-1?Q?SfEYGgRP+QmkSEghuofa2pJ3KaEEQwu3r7K5lzcrOOG1nciBWoZgZyCg2m?=
 =?iso-8859-1?Q?WsBL+XHPa25CctV9M1Si6Q5+ymuhQvtvxz5dKSwk2cPuqurNfMkrJCw6pV?=
 =?iso-8859-1?Q?d4tMA8ZzdDy4nBdtDAurBBrl8irns5Mn1Qt+3DpvunXA7jDbBHlKb0Ab1S?=
 =?iso-8859-1?Q?JfZxjRdLUJjnEqDaoVBtT5DohlcT8lUzdl4cnW9vz0aKWAzE1YHQidACs8?=
 =?iso-8859-1?Q?QIgS8OML0rE+bFJvige5WmRdH5/cbiDbVxFwzPonuIMpk6rVMq0LK/Tgdf?=
 =?iso-8859-1?Q?XUVdjLT2xgK9/XNRs+cypfiWvLexfG8OL+SBfrD+k4YQ32Wh4ViGX9N4fE?=
 =?iso-8859-1?Q?hg2iXIjxccGlEHaXw7m4oGvdjzidSB8NStOE1Q3W4lEwXkUomvG6SQyXOM?=
 =?iso-8859-1?Q?FCu6k6v49Y4kRunsRd7euoyqepKGxHYjliMD/w6NWuqM5NRFXNBJvIpEVk?=
 =?iso-8859-1?Q?yaZhdiOTSIPEaF8wpftNTWEF+QB6WWaqozBYkZDadr0t2p5zohewAysOfO?=
 =?iso-8859-1?Q?xvJd38Og4QyKdyQOwQ4PW/MfpcF20v6jNYamnjW8va/J0+/GZ6qrdyBKAt?=
 =?iso-8859-1?Q?wq403IxreVbGi7glyOh6cz2omr7k39uy9wJTqjvrlqVo4TRfHitoufCMmK?=
 =?iso-8859-1?Q?lpGoObVr4auzta7+Pm7uNMd0X/PTUKH9IQLhY4KLY+bO0cI1bPkd9tDGBO?=
 =?iso-8859-1?Q?QAHCFyLsfMXK4I0HiBxPsYUbb0JNSMhyyxhow4NQuZ4J/2dbv4BywuZ64M?=
 =?iso-8859-1?Q?OZjMIBAzrH6tGQUXt4+1N9nmoVDZYbhMau/h0SexvNZxcRxnYncsVFjjQW?=
 =?iso-8859-1?Q?sMgsMmO4PjgmQcn5N5j7KbbjaRtMaQoYhGS/qZ966ZsFk64RjBgoxqfCVW?=
 =?iso-8859-1?Q?hHylqWv9Kg/giDodb1pRY1ABRA7nwP6Oig7DzNgpsubat+hRCsWn4jUee3?=
 =?iso-8859-1?Q?ddzvIWNHa3hsOkri2xdqCi7M3JTSsPlBijbBzSTEysleVWSBnxCl3QRm6Q?=
 =?iso-8859-1?Q?CB5CaJR/ZVDP2v9us/RtHXem7xZ3VoKIkY8xw2Q+KEspw10PJf/t8TQSFV?=
 =?iso-8859-1?Q?iIVeR/ind0xiDmNaZuBQVpMV9OXXyDZlnOGgbROBgQcxLeY3TUldETy8Lc?=
 =?iso-8859-1?Q?XtIenY8ZGtK2cVcbkjBjvmt2o+InauI2miYrrXlr3phsOCG01pWFX5L84R?=
 =?iso-8859-1?Q?miD6kOJuHs1Z/9CMNCUH/tVVoHVRPWYTvjEC6yVG5iOfkjkfSjQHF4HK+F?=
 =?iso-8859-1?Q?TGsJ10MAIdhGOuOazAhw4izMaI6OxrpHe7hMSjuH9X6nKq5SPQV19D/5xp?=
 =?iso-8859-1?Q?5uv7doSmh2tgSC0YJ5uQl0TTDccj3Ua+DF7+7ftFtHKzet2F0yTY9ZGWeP?=
 =?iso-8859-1?Q?7GvjKew8xD7CVQBXy8FrlXOl7vJCOSRD0zkQ5MeYf5YkRFMZB9TG+bRYYD?=
 =?iso-8859-1?Q?NMsSf6r2Wwowdx4AmW8=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19DM8PR12MB5399namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d5071c-0dfb-46f1-4838-08daf810eb5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 22:27:57.7736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vTf29p2U3n8yNvDau5tpbDmW+4HmMhpoMCQ4DwTLV36T+TuGunKxeOne1jQTmR+V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6778
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang, 
 Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19DM8PR12MB5399namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Secure part requires PSP load VCN boot sequence which is with indirect sram=
 mode.

Regards,
Leo

________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: January 16, 2023 4:50 PM
To: Guilherme G. Piccoli <gpiccoli@igalia.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Jiang, S=
onny <Sonny.Jiang@amd.com>; kernel@gpiccoli.net <kernel@gpiccoli.net>; Pan,=
 Xinhui <Xinhui.Pan@amd.com>; dri-devel@lists.freedesktop.org <dri-devel@li=
sts.freedesktop.org>; Lazar, Lijo <Lijo.Lazar@amd.com>; Limonciello, Mario =
<Mario.Limonciello@amd.com>; kernel-dev@igalia.com <kernel-dev@igalia.com>;=
 Deucher, Alexander <Alexander.Deucher@amd.com>; Zhu, James <James.Zhu@amd.=
com>; Liu, Leo <Leo.Liu@amd.com>; Koenig, Christian <Christian.Koenig@amd.c=
om>
Subject: Re: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/dis)abl=
ing indirect SRAM mode

On Mon, Jan 16, 2023 at 4:21 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> Currently the FW loading path perform some checks based on IP model
> and in case it is advertised as supported, the VCN indirect SRAM
> mode is used.
>
> Happens that in case there's any issue on FW and this mode ends-up
> not being properly supported, the driver probe fails [0]. Debugging
> this requires driver rebuilding, so to allow fast debug and experiments,
> add a parameter to force setting indirect SRAM mode to true/false from
> the kernel command-line; parameter default is -1, which doesn't change
> the current driver's behavior.

Probably a question for Leo or James, but I was under the impression
non-indirect mode didn't work on production silicon for most chips,
but maybe I'm mis-remembering that.

Alex


>
> [0] Example of this issue, observed on Steam Deck:
>
> [drm] kiq ring mec 2 pipe 1 q 0
> [drm] failed to load ucode VCN0_RAM(0x3A)
> [drm] psp gfx command LOAD_IP_FW(0x6) failed and response status is (0xFF=
FF0000)
> amdgpu 0000:04:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring =
vcn_dec_0 test failed (-110)
> [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* hw_init of IP block <vcn_v=
3_0> failed -110
> amdgpu 0000:04:00.0: amdgpu: amdgpu_device_ip_init failed
> amdgpu 0000:04:00.0: amdgpu: Fatal error during GPU init
>
> Cc: James Zhu <James.Zhu@amd.com>
> Cc: Lazar Lijo <Lijo.Lazar@amd.com>
> Cc: Leo Liu <leo.liu@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Sonny Jiang <sonny.jiang@amd.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>
>
> This work is based on agd5f/amd-staging-drm-next branch.
> Thanks in advance for reviews/comments!
> Cheers,
>
> Guilherme
>
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 9 +++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 3 +++
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 872450a3a164..5d3c92c94f18 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -215,6 +215,7 @@ extern int amdgpu_noretry;
>  extern int amdgpu_force_asic_type;
>  extern int amdgpu_smartshift_bias;
>  extern int amdgpu_use_xgmi_p2p;
> +extern int amdgpu_indirect_sram;
>  #ifdef CONFIG_HSA_AMD
>  extern int sched_policy;
>  extern bool debug_evictions;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 06aba201d4db..c7182c0bc841 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -187,6 +187,7 @@ int amdgpu_num_kcq =3D -1;
>  int amdgpu_smartshift_bias;
>  int amdgpu_use_xgmi_p2p =3D 1;
>  int amdgpu_vcnfw_log;
> +int amdgpu_indirect_sram =3D -1;
>
>  static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *wo=
rk);
>
> @@ -941,6 +942,14 @@ MODULE_PARM_DESC(smu_pptable_id,
>         "specify pptable id to be used (-1 =3D auto(default) value, 0 =3D=
 use pptable from vbios, > 0 =3D soft pptable id)");
>  module_param_named(smu_pptable_id, amdgpu_smu_pptable_id, int, 0444);
>
> +/**
> + * DOC: indirect_sram (int)
> + * Allow users to force using (or not) the VCN indirect SRAM mode in the=
 fw load
> + * code. Default is -1, meaning auto (aka, don't mess with driver's beha=
vior).
> + */
> +MODULE_PARM_DESC(indirect_sram, "Force VCN indirect SRAM (-1 =3D auto (d=
efault), 0 =3D disabled, 1 =3D enabled)");
> +module_param_named(indirect_sram, amdgpu_indirect_sram, int, 0444);
> +
>  /* These devices are not supported by amdgpu.
>   * They are supported by the mach64, r128, radeon drivers
>   */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vcn.c
> index 1f880e162d9d..a2290087e01c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -137,6 +137,9 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>                 return -EINVAL;
>         }
>
> +       if (amdgpu_indirect_sram >=3D 0)
> +               adev->vcn.indirect_sram =3D (bool)amdgpu_indirect_sram;
> +
>         hdr =3D (const struct common_firmware_header *)adev->vcn.fw->data=
;
>         adev->vcn.fw_version =3D le32_to_cpu(hdr->ucode_version);
>
> --
> 2.39.0
>

--_000_DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19DM8PR12MB5399namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div>Secure part requires PSP load VCN boot sequence which is with indirect=
 sram mode.</div>
<div><br>
</div>
<div>Regards,</div>
<div>Leo</div>
<div><br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> January 16, 2023 4:50 PM<br>
<b>To:</b> Guilherme G. Piccoli &lt;gpiccoli@igalia.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Jiang, Sonny &lt;Sonny.Jiang@amd.com&gt;; kernel@gpiccoli.net &lt;kern=
el@gpiccoli.net&gt;; Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;; dri-devel@list=
s.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; Lazar,
 Lijo &lt;Lijo.Lazar@amd.com&gt;; Limonciello, Mario &lt;Mario.Limonciello@=
amd.com&gt;; kernel-dev@igalia.com &lt;kernel-dev@igalia.com&gt;; Deucher, =
Alexander &lt;Alexander.Deucher@amd.com&gt;; Zhu, James &lt;James.Zhu@amd.c=
om&gt;; Liu, Leo &lt;Leo.Liu@amd.com&gt;; Koenig, Christian &lt;Christian.K=
oenig@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/=
dis)abling indirect SRAM mode</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Jan 16, 2023 at 4:21 PM Guilherme G. Picco=
li<br>
&lt;gpiccoli@igalia.com&gt; wrote:<br>
&gt;<br>
&gt; Currently the FW loading path perform some checks based on IP model<br=
>
&gt; and in case it is advertised as supported, the VCN indirect SRAM<br>
&gt; mode is used.<br>
&gt;<br>
&gt; Happens that in case there's any issue on FW and this mode ends-up<br>
&gt; not being properly supported, the driver probe fails [0]. Debugging<br=
>
&gt; this requires driver rebuilding, so to allow fast debug and experiment=
s,<br>
&gt; add a parameter to force setting indirect SRAM mode to true/false from=
<br>
&gt; the kernel command-line; parameter default is -1, which doesn't change=
<br>
&gt; the current driver's behavior.<br>
<br>
Probably a question for Leo or James, but I was under the impression<br>
non-indirect mode didn't work on production silicon for most chips,<br>
but maybe I'm mis-remembering that.<br>
<br>
Alex<br>
<br>
<br>
&gt;<br>
&gt; [0] Example of this issue, observed on Steam Deck:<br>
&gt;<br>
&gt; [drm] kiq ring mec 2 pipe 1 q 0<br>
&gt; [drm] failed to load ucode VCN0_RAM(0x3A)<br>
&gt; [drm] psp gfx command LOAD_IP_FW(0x6) failed and response status is (0=
xFFFF0000)<br>
&gt; amdgpu 0000:04:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ri=
ng vcn_dec_0 test failed (-110)<br>
&gt; [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* hw_init of IP block &lt=
;vcn_v3_0&gt; failed -110<br>
&gt; amdgpu 0000:04:00.0: amdgpu: amdgpu_device_ip_init failed<br>
&gt; amdgpu 0000:04:00.0: amdgpu: Fatal error during GPU init<br>
&gt;<br>
&gt; Cc: James Zhu &lt;James.Zhu@amd.com&gt;<br>
&gt; Cc: Lazar Lijo &lt;Lijo.Lazar@amd.com&gt;<br>
&gt; Cc: Leo Liu &lt;leo.liu@amd.com&gt;<br>
&gt; Cc: Mario Limonciello &lt;mario.limonciello@amd.com&gt;<br>
&gt; Cc: Sonny Jiang &lt;sonny.jiang@amd.com&gt;<br>
&gt; Signed-off-by: Guilherme G. Piccoli &lt;gpiccoli@igalia.com&gt;<br>
&gt; ---<br>
&gt;<br>
&gt;<br>
&gt; This work is based on agd5f/amd-staging-drm-next branch.<br>
&gt; Thanks in advance for reviews/comments!<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Guilherme<br>
&gt;<br>
&gt;<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp; | 1 =
+<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 9 +++++++++<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 3 +++<br>
&gt;&nbsp; 3 files changed, 13 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu.h<br>
&gt; index 872450a3a164..5d3c92c94f18 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; @@ -215,6 +215,7 @@ extern int amdgpu_noretry;<br>
&gt;&nbsp; extern int amdgpu_force_asic_type;<br>
&gt;&nbsp; extern int amdgpu_smartshift_bias;<br>
&gt;&nbsp; extern int amdgpu_use_xgmi_p2p;<br>
&gt; +extern int amdgpu_indirect_sram;<br>
&gt;&nbsp; #ifdef CONFIG_HSA_AMD<br>
&gt;&nbsp; extern int sched_policy;<br>
&gt;&nbsp; extern bool debug_evictions;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_drv.c<br>
&gt; index 06aba201d4db..c7182c0bc841 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; @@ -187,6 +187,7 @@ int amdgpu_num_kcq =3D -1;<br>
&gt;&nbsp; int amdgpu_smartshift_bias;<br>
&gt;&nbsp; int amdgpu_use_xgmi_p2p =3D 1;<br>
&gt;&nbsp; int amdgpu_vcnfw_log;<br>
&gt; +int amdgpu_indirect_sram =3D -1;<br>
&gt;<br>
&gt;&nbsp; static void amdgpu_drv_delayed_reset_work_handler(struct work_st=
ruct *work);<br>
&gt;<br>
&gt; @@ -941,6 +942,14 @@ MODULE_PARM_DESC(smu_pptable_id,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;specify pptable =
id to be used (-1 =3D auto(default) value, 0 =3D use pptable from vbios, &g=
t; 0 =3D soft pptable id)&quot;);<br>
&gt;&nbsp; module_param_named(smu_pptable_id, amdgpu_smu_pptable_id, int, 0=
444);<br>
&gt;<br>
&gt; +/**<br>
&gt; + * DOC: indirect_sram (int)<br>
&gt; + * Allow users to force using (or not) the VCN indirect SRAM mode in =
the fw load<br>
&gt; + * code. Default is -1, meaning auto (aka, don't mess with driver's b=
ehavior).<br>
&gt; + */<br>
&gt; +MODULE_PARM_DESC(indirect_sram, &quot;Force VCN indirect SRAM (-1 =3D=
 auto (default), 0 =3D disabled, 1 =3D enabled)&quot;);<br>
&gt; +module_param_named(indirect_sram, amdgpu_indirect_sram, int, 0444);<b=
r>
&gt; +<br>
&gt;&nbsp; /* These devices are not supported by amdgpu.<br>
&gt;&nbsp;&nbsp; * They are supported by the mach64, r128, radeon drivers<b=
r>
&gt;&nbsp;&nbsp; */<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vcn.c<br>
&gt; index 1f880e162d9d..a2290087e01c 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c<br>
&gt; @@ -137,6 +137,9 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_indirect_sram &gt;=3D=
 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; adev-&gt;vcn.indirect_sram =3D (bool)amdgpu_indirect_sram;<=
br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hdr =3D (const struct =
common_firmware_header *)adev-&gt;vcn.fw-&gt;data;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;vcn.fw_versio=
n =3D le32_to_cpu(hdr-&gt;ucode_version);<br>
&gt;<br>
&gt; --<br>
&gt; 2.39.0<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19DM8PR12MB5399namp_--
