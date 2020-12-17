Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AC72DDB7C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 23:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F047E89204;
	Thu, 17 Dec 2020 22:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1E089204;
 Thu, 17 Dec 2020 22:37:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exZvmIdHsTps5gR/Fp218CgNTTQ99jZjtYcjNdb0Co7pXD6Eeuf+M7FTCpET/AOsabOr7o4EHSwPG01OFMQLvFrg2stUk9Ocl3CqjnGzCUR8j46VZWgYpls05F0dVV9w0dahF5zG6zMDtF8p7gqmWKC7fPRu0AHiITezycAObUby+SoKswRAj9EMJikGhV0cs5B57/84fsFY5AH7ArRcq7lguTjODVNdMMRsHRj/Vd7AVNVKf9/PpC++MHZufwKTe6zazszecZEWOYMXbpsKE499UcmJhERy1LYTUEHXY8CrzSwhMElFTdJfRY4/7OWjTf2j7VAp5YHQkG9GA7MR/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g8/ePZ1SxZ93tW7Pk5vIF+ag+elfOAHi58N/hwpsjs=;
 b=jDtXm3o0AdPEhQJeWJcO4G/aNUM7oHPwhZCLFRvjPM1wVbRO1o1yUDvUwG/QbX5hRlM0asfSQEabJXwjnapvdtV8jpSTC/vP1cDdNB543uT0ACGteVXXQM81nFrhKV4DIqIaLhR2yZOxFy5GCciIm3Wvanyo3lM37/0DwDx9UwfOrCP0a3j/t0S7vjTL4AE+AgDQjChWwR5Q1u3TsH7bPcUesj3A1gS0YIcxdF0DyLzU6pwog/D6joDsGpV3t11iE2hAJX1h4BehLyzibLKQhzXayqih0m6VfV5JyS6qqis03Tunjta6Nc9X0vp7P58nTCVsmpQ+zb+QQI3ikvPu+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g8/ePZ1SxZ93tW7Pk5vIF+ag+elfOAHi58N/hwpsjs=;
 b=JxHR+XDkPKqDHQdSaidRKGpAArhprcmoRjqCRg2F+RNxL/aH8F7VQChUvAjzJIZ8WmviyJ6bFZ0whK4g8D0Dk8ZRpVRlBejivGUD9SSBLQg9a8ak8UOICQ8KLkLbARGA+rXHl4KJu4CKLeHNLHpmEtop95Mzb59zs1Nxt3YVG9Q=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR12MB1939.namprd12.prod.outlook.com (2603:10b6:404:107::12)
 by BN6PR12MB1185.namprd12.prod.outlook.com (2603:10b6:404:1e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Thu, 17 Dec
 2020 22:37:31 +0000
Received: from BN6PR12MB1939.namprd12.prod.outlook.com
 ([fe80::cc4e:c277:7731:85df]) by BN6PR12MB1939.namprd12.prod.outlook.com
 ([fe80::cc4e:c277:7731:85df%6]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 22:37:31 +0000
Date: Thu, 17 Dec 2020 17:37:22 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: Re: [PATCH v3 1/3] drm/amd/display: Add module parameter for
 =?UTF-8?Q?freesync=0D=0A?= video mode
To: Alex Deucher <alexdeucher@gmail.com>
Message-Id: <AI9ILQ.0CLY4SCTG5TE1@amd.com>
In-Reply-To: <CADnq5_M6HJ97gdHDU+gm8XnGpoaGB+eUwtrrqG3-235uO19dmw@mail.gmail.com>
References: <20201214222036.561352-1-aurabindo.pillai@amd.com>
 <20201214222036.561352-2-aurabindo.pillai@amd.com>
 <CADnq5_M6HJ97gdHDU+gm8XnGpoaGB+eUwtrrqG3-235uO19dmw@mail.gmail.com>
X-Mailer: geary/3.38.1
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: MN2PR16CA0045.namprd16.prod.outlook.com
 (2603:10b6:208:234::14) To BN6PR12MB1939.namprd12.prod.outlook.com
 (2603:10b6:404:107::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.0.173] (165.204.84.11) by
 MN2PR16CA0045.namprd16.prod.outlook.com (2603:10b6:208:234::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 17 Dec 2020 22:37:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2fb574b8-f5e9-4836-76de-08d8a2dc578d
X-MS-TrafficTypeDiagnostic: BN6PR12MB1185:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR12MB11859B82B94CC77BB4083A4E8BC40@BN6PR12MB1185.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6XYfrFxy2g75eU9cQRCPOCvHFy7+GeglPjE++1MHddS6avJSxWUbn+f3iC/DhxhbfYNroAqeNXF8tvwlqEFdNmhn7xoIvkn5cMvUODP2eF0KcoKTOuIXWHguA2A8DB6PkNW8KlZxUdGH+o9gKMHTknZfiO+FfYtSjnrgxWVxB69xcfYD6KwAH3Fi23+POzPYBuo/beaxhihzDq7I+DNlMiL7xoaWA6qwVSr6+RKgz/3DaQrTgemhF3Ip6tPYZqVyVDlZJsvnns6WN3MxaDckUplPYfjAkQV3xnIqISMwOujT5iL2VZBsosFabbhDAvmuFMBP3wgTZg98IfMoorHNkcc4KZq2EvWRVOsHrdMv3MvY3D5pBTApgPHuLQRs7Pb/+CyKBf8qz7E4wX8B92kTng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR12MB1939.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(4326008)(6666004)(316002)(53546011)(44832011)(26005)(8676002)(83380400001)(16576012)(33656002)(5660300002)(6916009)(2616005)(956004)(186003)(2906002)(66476007)(8936002)(16526019)(66556008)(54906003)(478600001)(36756003)(52116002)(6486002)(86362001)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?/QzJG4YOKWNtPfDu9OsS7CQdYS/xrtWSSq1n3cTuuXg3JXrU6KoPAlReW/?=
 =?iso-8859-1?Q?5CP3RDjTAGIt3gZwdWkDRhq+VOX9LHeEeY9XNIGIV4REti7RCbKSOb51JD?=
 =?iso-8859-1?Q?XOGictMIEJffooLFBfXL+u+6zhQfgWqcO//vXjynEMHBbsdG3aKH03Qu6n?=
 =?iso-8859-1?Q?RxgYClxUEr/JP/C70dBRkMu78VYIy94Gs3XSwHvn75MeZKqx6q9400VDey?=
 =?iso-8859-1?Q?YcqvR91VvIB+MBjrivGy5Jz1vN77eBkpLnuW2IpgpJyhLeq0PGivB/xvmn?=
 =?iso-8859-1?Q?MWSJnQaCjOw1+2oZAa0xo6ju2Ro2e+C2KqjcVrZK8xRFgRmfTKuVhHHmMf?=
 =?iso-8859-1?Q?qhB2ieGR6wXEMEXxCo8iNajqIX1MJsPy6wy6A6ovLCLtCm43c5Y3ryO86A?=
 =?iso-8859-1?Q?0rwIUtrBuFEe3MmbCvUctUbdhzSQJeiqkU0a5Ksn3eEHhm4PscVLn78svF?=
 =?iso-8859-1?Q?HMtNIGS9iIsbCzHNxYB7DOqtyDu4XhDt6juLRjvfE5H8yRUBgN4MeqO/bO?=
 =?iso-8859-1?Q?jPztfqegkzDKKITnYY5g5oRmH5b2uyAIEJq+SsIvl+foYKNzSpGNgh24ur?=
 =?iso-8859-1?Q?Q1eSuBIB1a9KqtqaYuzt43L3llIfX/icuGGce8TwAgZHBWiMHXiv4Iu7M0?=
 =?iso-8859-1?Q?EkUoNInfXVs0w3NYhFdOQDbTfvRoC54Tu0IFNdWYcdUFqLr6QZQ4KrWh7m?=
 =?iso-8859-1?Q?0aSR4M2zuX56+d5742693XsXgQ8KmTxXhCVMiP2Oio/u8Y4nzbbNXtempP?=
 =?iso-8859-1?Q?IZh3BoOmb21b4Lb4G/9j/lYWxdNJK511wSt8bOAqGD6YcA8zs/3taBAMcC?=
 =?iso-8859-1?Q?7rqpGsfUoRjlM0/6JFKKRyax08+MAdCba4aqwRDBh/1+7M0d8vfkptQ3fq?=
 =?iso-8859-1?Q?9S/v9Ialuhz6P4CfqmSb+Ds67M/P8he9lIBP4yHf92cXQ6uBBCO8RNzwoO?=
 =?iso-8859-1?Q?2vKXdASwbdY7+01wJVqaZTIlpzpsXlLiu1K96QjVWZ1wl2bznf1jJ5j9WY?=
 =?iso-8859-1?Q?GI5mRwFKKzmXXXDtlgw5C1v2SN81aF91C78z11?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BN6PR12MB1939.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 22:37:31.7069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb574b8-f5e9-4836-76de-08d8a2dc578d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55Qxij+OgfNXG6CaTb+ZIQUWlPJKvngqvgMcm953HcGUe5BfG37U1XIikUmp7TJk4gUqyntLFZgJhcZfETCweQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1185
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>




On Thu, Dec 17, 2020 at 14:11, Alex Deucher <alexdeucher@gmail.com> =

wrote:
> On Mon, Dec 14, 2020 at 5:21 PM Aurabindo Pillai
> <aurabindo.pillai@amd.com> wrote:
>> =

>>  [Why&How]
>>  Adds a module parameter to enable experimental freesync video mode =

>> modeset
>>  optimization. Enabling this mode allows the driver to skip a full =

>> modeset when
>>  freesync compatible modes are requested by the userspace. This =

>> paramters also
>>  adds some standard modes based on the connected monitor's VRR range.
>> =

>>  Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
>>  Acked-by: Christian K=F6nig <christian.koenig at amd.com>
>>  Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>
>>  ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 ++++++++++++
>>   2 files changed, 13 insertions(+)
>> =

>>  diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h =

>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>  index eed5410947e9..e0942184efdd 100644
>>  --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>  +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>  @@ -177,6 +177,7 @@ extern int amdgpu_gpu_recovery;
>>   extern int amdgpu_emu_mode;
>>   extern uint amdgpu_smu_memory_pool_size;
>>   extern uint amdgpu_dc_feature_mask;
>>  +extern uint amdgpu_exp_freesync_vid_mode;
>>   extern uint amdgpu_dc_debug_mask;
>>   extern uint amdgpu_dm_abm_level;
>>   extern struct amdgpu_mgpu_info mgpu_info;
>>  diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c =

>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>  index b2a1dd7581bf..ece51ecd53d1 100644
>>  --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>  +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>  @@ -158,6 +158,7 @@ int amdgpu_mes;
>>   int amdgpu_noretry =3D -1;
>>   int amdgpu_force_asic_type =3D -1;
>>   int amdgpu_tmz;
>>  +uint amdgpu_exp_freesync_vid_mode;
>>   int amdgpu_reset_method =3D -1; /* auto */
>>   int amdgpu_num_kcq =3D -1;
>> =

>>  @@ -786,6 +787,17 @@ module_param_named(abmlevel, =

>> amdgpu_dm_abm_level, uint, 0444);
>>   MODULE_PARM_DESC(tmz, "Enable TMZ feature (-1 =3D auto, 0 =3D off =

>> (default), 1 =3D on)");
>>   module_param_named(tmz, amdgpu_tmz, int, 0444);
>> =

>>  +/**
>>  + * DOC: experimental_freesync_video (uint)
>>  + * Enabled the optimization to adjust front porch timing to =

>> achieve seamless mode change experience
>>  + * when setting a freesync supported mode for which full modeset =

>> is not needed.
>>  + * The default value: 0 (off).
>>  + */
>>  +MODULE_PARM_DESC(
>>  +       experimental_freesync_video,
>>  +       "Enable freesync modesetting optimization feature (0 =3D off =

>> (default), 1 =3D on)");
> =

> Maybe just call this freesync_video so that we can change the default
> if we decide to at some point.

Sure, will do.

> =

> Alex


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
