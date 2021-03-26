Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BCE34AF2C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 20:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E4E6F47C;
	Fri, 26 Mar 2021 19:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D976E222;
 Fri, 26 Mar 2021 19:16:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYsNs3KTuYA/I2IS3J10TCwja9n3CGEIrtg/IPD17hmi59RjCFpACv7yzDT7o9JQSnOcn8PpECwczM404GanmEY6nZ9kplH1GaURTAQxblhz/A2wXIzbHNtBE8pcWCAdWuZftqXU7x5C7OjZJAXBs5EWpKK2kduZTCj1YXcrV2/4Z8aqHdPAHQSVoXM1E3cedRLYSXv4NUZoCP9yMlgKmN9GDUJIRLyxBxfgltmabFOcBSxOolOdNR4pzqt4EU2PiuokyV5CIn4jxp6atUFa4TWPgmjIgT/6gq9GkZ8UEIf/kv47HDhSeYQIw9istcZREWc5Iq7dLPebvwfMEqILbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ds3HFd+PVkB0aGmEjVivKcDtZQB3DpZsOyD0FGZkjg=;
 b=lscOB7wzq/U7rOBKZREhkcmZHzveH3jeszZQNCWEpOdLBsG+p8JSeuMUvIuYst+KIL19u0X03q0a5R/cCk17qEUyIqX6rBlL0fuFV9iP7z23iGWcJ5J7GMsPecKk/KhQuSOKnqOabitDZeUkb4Hzxgc04H7sYlgTllshLizgxVvjj2CkRg1r8QcKSFLwnz7jgHSqup5kQE/V2Bv2RzabI1t+V6gRwFhXXouhYEMLI/QyCQuwv4KF/z1uyf+67ur2QI2dIGltqhnFPLrH+ucmK9PoJLhPM4dWNEO3awwRNEj9avtiYHwPWRp2BvTVUx5O5apMIv5ycLPeoSe2CwtAZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ds3HFd+PVkB0aGmEjVivKcDtZQB3DpZsOyD0FGZkjg=;
 b=xzE/Fmt1gHCpCO9dNTw8qJTE2erJqy6Vjwl8i9yA5buUdJMUkszQ0F7LZIqIyunXRA+TmMeac/VBnUWo73p/5HOmnmt83+BFxMhJzxu/ocoYNIQakBRz9Fi7GO46jjsms0S3J/Oc6WaJCEUHXpLv5vGPiP0xJgNGi308kqhtSwY=
Received: from DM6PR12MB2939.namprd12.prod.outlook.com (2603:10b6:5:18b::24)
 by DM6PR12MB4513.namprd12.prod.outlook.com (2603:10b6:5:2ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 19:16:41 +0000
Received: from DM6PR12MB2939.namprd12.prod.outlook.com
 ([fe80::1887:4978:1b79:7cc1]) by DM6PR12MB2939.namprd12.prod.outlook.com
 ([fe80::1887:4978:1b79:7cc1%5]) with mapi id 15.20.3977.025; Fri, 26 Mar 2021
 19:16:41 +0000
From: "Zhuo, Qingqing" <Qingqing.Zhuo@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Alex Deucher
 <alexdeucher@gmail.com>, Lyude <lyude@redhat.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: RE: [pull] amdgpu, amdkfd, radeon drm-next-5.12
Thread-Topic: [pull] amdgpu, amdkfd, radeon drm-next-5.12
Thread-Index: AQHXImsQ+NcSeYEKrkax4CRZdApZdKqWoPmA
Date: Fri, 26 Mar 2021 19:16:41 +0000
Message-ID: <DM6PR12MB29399D347B6D933345E313BCFB619@DM6PR12MB2939.namprd12.prod.outlook.com>
References: <20210218221531.3870-1-alexander.deucher@amd.com>
 <CAKMK7uEWiGqt4=KpX2ov8OZ4SMD1mJMAQo7D6QezHwT0Nhdpgg@mail.gmail.com>
In-Reply-To: <CAKMK7uEWiGqt4=KpX2ov8OZ4SMD1mJMAQo7D6QezHwT0Nhdpgg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-03-26T19:16:38Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=77bc6890-6154-448a-99f7-e12ee2ac4245;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 24f214a5-c0b2-48e2-cc28-08d8f08bafd9
x-ms-traffictypediagnostic: DM6PR12MB4513:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB451392BA335F034DC61624F5FB619@DM6PR12MB4513.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:404;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uTt01l3gBQCmYML07NX2KExZopGSCJGw3xJ74V8YogDdJ46aI3EkGMxpBhYWWSJiUyGnennszswMTjzyKa5/EKcP0fzMn0o3DCA932oby7oCpl41gkxxPWWly89qaeeYK1Rxm0nPmwBzFJRmbIPT1IiqvE7Y/z/eR94hCULe3G11K7AtnqCY7+3XIaboI8MLX5qJ5I9BTTu8ki+uruYtKam/4/q6SvzuXh8YCdlv9UOI2Zz84TNaI3s88S+p0Sy4dOWsS9skaNOxJTLvwhuMuudLryEZVJRIfvTrSyFtZ8vP/bWRQWzSP2jBX5KBqMsFfK/OpT0L/aiNp+rmNaPelhLJ0dCfLeDWKzQo3rn3oju94j6p83GtpL7V5UECMSuqhcbu6HqEtOoR1d3bUtbSoeO1gEmQvOajCK8mBfCPauLlJrbanPaAt4KajB3v2nitxxRMDWmUC17PLjdPja8CR1Fx6rZLLA6KwmQkl3Bv3cj/RoMAVSgbeujBuzx8I089l5qaXr7lij0GoLcCnGrmBXmPzub1fJhMMwzy1dCh2z5Wh/R8UrHcRb/IghIPpL7p121cfqDPG54utpLJimyJHQT/9oa2MDIONckCzlEWeCqiRmEa8qF0uyscQvZ6sNfkVgFXNdpOfVOKZFwJpzlcMJCt8xYzr0zzOltFuNsCu9dbER1QjhEYMagrywZvikmncyGSlYGvO7WQkRnJLZ2Gnb+REvr0NA2kEKFBjn3SI+w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2939.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(54906003)(38100700001)(9686003)(55016002)(110136005)(316002)(2906002)(30864003)(71200400001)(33656002)(26005)(6636002)(478600001)(186003)(8936002)(66574015)(53546011)(5660300002)(6506007)(83380400001)(52536014)(66946007)(66446008)(64756008)(66556008)(966005)(76116006)(86362001)(7696005)(45080400002)(66476007)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-2?Q?YHbVG5vLF4fySrE/E+BzwGmTa1sfCjwRXHQdZgeHxDIG7Vd8fyOWARFiKX?=
 =?iso-8859-2?Q?v8FxJ29/mY92Tq6m2fUHn8JHzd5yt8ckf+XZJe1sBhpjowjnOGigE/vaED?=
 =?iso-8859-2?Q?BWuLIRS7lLiGRCT9rS+8vwuizP6Z229i9ItGm/9jOmuAQAH3z6gkxhiKAx?=
 =?iso-8859-2?Q?6ldyr8RM+iEvbMc6c775ebKk53iRLm/tOkdJPCML/AYGXMLyOEkx+dgRPi?=
 =?iso-8859-2?Q?QiNzNsDLdCUEC2QlW/XU1tq1l2/eP1fzb6Y+S8SDUth+ctNQiTXUZWfng1?=
 =?iso-8859-2?Q?G2KBwxklA6PspQJ31zQFz7MptkLRBL+vBdYdw7cluD5mA7ubza/wqMFXBa?=
 =?iso-8859-2?Q?84KWnTIa41Ngqe2C9ppXQ/4Q7RK70CzpGCPMQeCID4KMn2lUcxwf5zJ7ZK?=
 =?iso-8859-2?Q?38G2YtIJtR22uizUCc1itGvdKg+i+HkJhXE7F81yTJ4i/y9h28RM2JyWv2?=
 =?iso-8859-2?Q?7gzCLhc/xFoxhxMRbm6X9Nsz9Ji0LfuqlE+a3/Pu1+N+suQszv26u+AdRo?=
 =?iso-8859-2?Q?9Nq4NGFQ8y+0KXZgLog4YPQUIOY+ccp0c+qNw+xkd4UF+9qSCT3rcW+3KH?=
 =?iso-8859-2?Q?d02xQ8rdIbaJ/4QRshLCM+PWiTBtany76FuND0L5kRP3cLMgUFF1IX8nGT?=
 =?iso-8859-2?Q?idW2U54+dmHwjHYwJQADlBR5fYcdaqLnxGF9Q1IGkGhNfbzK98+bDdPkuW?=
 =?iso-8859-2?Q?oTL24+e8iPt6YLtSRrakEiLx/LWUjNBQMfJuLkV5+opM1REiaNvvGhG4qL?=
 =?iso-8859-2?Q?h3NLHJJfBx7RfJ7ZRp7eb0LQS5mtM8kRFXHmIXnGt2bIgfAvYagrOOhcA6?=
 =?iso-8859-2?Q?ytnBfnq2QXCirNbcy7LcUGszHgvWUeehgLyIhT4rADOSr8rA19nfzvWC9d?=
 =?iso-8859-2?Q?ocP0OBJ3rUSVJMOYHCJeJZo6jbfd0aG4ibOGs5Wr/jHP1RbYTEJaurK77F?=
 =?iso-8859-2?Q?kALSCzWY+scAE4Rmue4r3lu6OdPX5TysKnMQwzjQksOT3XS4eAKlQW8PFA?=
 =?iso-8859-2?Q?BtOvSe0cnp3GKEWitE4jBk6qr4YSYgkUbmdixA5s7wmDEXSK/syk7QxmmH?=
 =?iso-8859-2?Q?aSAm/+zCkWevzVdoiIOQhgDIEZe7FP8ofmaQyp/z1ydEITIuV64uBEYfN+?=
 =?iso-8859-2?Q?MhC+GCuWfdf0z4uX7eleFcMLJyU078+036tWAV5QLRJ59V9wcs1+n0O0yU?=
 =?iso-8859-2?Q?+PMcPxXIZSy/9b+I3LBYkpKaFeQH+ekb+Co1s1uRL5WrWJDpVDBmAemysB?=
 =?iso-8859-2?Q?uZJC0HbCLNGYRcRg2rp2CpkaXK2ffxOsfWc0aGn6ObhABXvFSH8ChICRFN?=
 =?iso-8859-2?Q?7p+0vzCaJyqO9yIsFXvHHVu9tQek47q/VB2qLFAJPPCK6RoUJTnUayIjWC?=
 =?iso-8859-2?Q?Gpv8KUwSKf?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2939.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f214a5-c0b2-48e2-cc28-08d8f08bafd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 19:16:41.2223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zGeDeuEKaIIKIePssdABSrSx/h/FqwMcR0TWhvtac2p+IhBfCSs7xsuNtfZlrhTJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4513
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

On Thu, Feb 18, 2021 at 11:15 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>
>> Hi Dave, Daniel,
>>
>> Fixes for 5.12.
>>
>> The following changes since commit 4c3a3292730c56591472717d8c5c0faf74f6c=
6bb:
>>
>>   drm/amd/display: fix unused variable warning (2021-02-05 09:49:44 =

>> +1000)
>>
>> are available in the Git repository at:
>>
>>   =

>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitl
>> ab.freedesktop.org%2Fagd5f%2Flinux.git&amp;data=3D04%7C01%7Cqingqing.zhu
>> o%40amd.com%7Cce0d1ee6a18b4a95366008d8f082048e%7C3dd8961fe4884e608e11a
>> 82d994e183d%7C0%7C0%7C637523789263486288%7CUnknown%7CTWFpbGZsb3d8eyJWI
>> joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&a
>> mp;sdata=3DIg3OkPN0X8OtCOHDJqV%2FZSEOsL7gPs8OMh9sXDniR2w%3D&amp;reserved
>> =3D0 tags/amd-drm-next-5.12-2021-02-18
>>
>> for you to fetch changes up to 6e80fb8ab04f6c4f377e2fd422bdd1855beb7371:
>>
>>   drm/amdgpu: Set reference clock to 100Mhz on Renoir (v2) (2021-02-18 =

>> 16:43:09 -0500)

> Pulled into drm-next, with some conflicts, please double-check.

> I also spotted

> commit ea3b4242bc9ca197762119382b37e125815bd67f
> Author: Qingqing Zhuo <qingqing.zhuo@amd.com>
> Date:   Tue Feb 9 16:36:41 2021 -0500

>   drm/amd/display: Fix system hang after multiple hotplugs (v3)

> I think it would be good if that could use the drm_vblank_work stuff from=
 Lyude instead of hand-rolling your own.
> -Daniel

Hi Daniel,

Thank you for the suggestion! I need to look into further and will do so as=
 soon as I have bandwidth. =


Thanks,
Lillian

>>
>> ----------------------------------------------------------------
>> amd-drm-next-5.12-2021-02-18:
>>
>> amdgpu:
>> - Prefer Bhawan's unused variable fix
>> - Fixes for high priority queues on gfx8,9
>> - swSMU fixes for sienna cichlid
>> - swSMU fixes for renoir
>> - mmhub client id fixes for arcturus
>> - SMUIO fixes for navi family
>> - swSMU fixes for vangogh
>> - GPU reset cleanup
>> - Display fixes
>> - GFX harvesting fix for sienna cichlid
>> - Fix reference clock on Renoir
>> - Misc fixes and cleanups
>>
>> amdkfd:
>> - Fix for unique id query
>> - Fix recursive lock warnings
>>
>> radeon:
>> - Remove confusing VCE messages on Oland
>>
>> ----------------------------------------------------------------
>> Alex Deucher (16):
>>       Revert "drm/amd/display: fix unused variable warning"
>>       drm/amdgpu/smu12: fix power reporting on renoir
>>       drm/amdgpu/gmc9: fix mmhub client mapping for arcturus
>>       drm/amdgpu/si: minor clean up of reset code
>>       drm/amdgpu/cik: minor clean up of reset code
>>       drm/amdgpu/vi: minor clean up of reset code
>>       drm/amdgpu: add generic pci reset as an option
>>       drm/amdgpu/si: add PCI reset support
>>       drm/amdgpu/soc15: add PCI reset support
>>       drm/amdgpu/nv: add PCI reset support
>>       drm/amdgpu: drop extra drm_kms_helper_poll_enable/disable calls
>>       drm/amdgpu: use runpm flag rather than fbcon for kfd runtime suspe=
nd (v2)
>>       drm/amdgpu: reset runpm flag if device suspend fails
>>       Revert "drm/amd/display: Update NV1x SR latency values"
>>       drm/radeon: OLAND boards don't have VCE
>>       drm/amdgpu: Set reference clock to 100Mhz on Renoir (v2)
>>
>> Anthony Koo (1):
>>       drm/amd/display: [FW Promotion] Release 0.0.51
>>
>> Aric Cyr (1):
>>       drm/amd/display: 3.2.122
>>
>> Bhawanpreet Lakha (1):
>>       drm/amd/display: Fix unused variable warning
>>
>> Dale Zhao (1):
>>       drm/amd/display: fix type mismatch error for return variable
>>
>> Derek Lai (1):
>>       drm/amd/display: Add DIG_CLOCK_PATTERN in the transmitter =

>> control
>>
>> Eric Yang (1):
>>       drm/amd/display: move edp sink present detection to hw init
>>
>> Fangzhi Zuo (1):
>>       drm/amd/display: Add return code instead of boolean for future =

>> use
>>
>> Felix Kuehling (1):
>>       drm/amdkfd: Fix recursive lock warnings
>>
>> Gustavo A. R. Silva (1):
>>       drm/amd/display: Fix potential integer overflow
>>
>> Jan Kokem=FCller (1):
>>       drm/amd/display: Add FPU wrappers to dcn21_validate_bandwidth()
>>
>> Jiapeng Chong (2):
>>       drm/amd/display: Simplify bool comparison
>>       drm/radeon: Simplify bool comparison
>>
>> Jiawei Gu (1):
>>       drm/amdgpu: extend MAX_KIQ_REG_TRY to 1000
>>
>> Jun Lei (1):
>>       drm/amd/display: revert support for DID2.0 dsc passthrough
>>
>> Kenneth Feng (3):
>>       drm/amd/pm: enable ACDC feature
>>       drm/amd/pm: enable DCS
>>       drm/amd/pm: enable LCLK DS
>>
>> Kent Russell (1):
>>       drm/amdkfd: Get unique_id dynamically v2
>>
>> Kevin Wang (2):
>>       drm/amd/pm/swsmu: unify the init soft gpu metrics function
>>       drm/amdgpu: optimize list operation in amdgpu_xgmi
>>
>> Lang Yu (1):
>>       drm/amd/display: fix 64bit division issue on 32bit OS
>>
>> Likun Gao (5):
>>       drm/amdgpu: support ASPM for some specific ASIC
>>       drm/amdgpu: add SMUIO 11.0.6 register headers
>>       drm/amdgpu: implement smuio v11_0_6 callbacks
>>       drm/amdgpu: switch to use smuio callbacks for NV family
>>       drm/amdgpu: support rom clockgating related function for NV =

>> family
>>
>> Marek Ol=B9=E1k (1):
>>       drm/amdgpu: fix CGTS_TCC_DISABLE register offset on gfx10.3
>>
>> Nirmoy Das (6):
>>       drm/amdgpu: cleanup struct amdgpu_ring
>>       drm/amdgpu: enable only one high prio compute queue
>>       drm/amdgpu: add wave limit functionality for gfx8,9
>>       drm/amdgpu: enable gfx wave limiting for high priority compute jobs
>>       drm/amdgpu: enable wave limit on non high prio cs pipes
>>       drm/amdgpu/display: remove hdcp_srm sysfs on device removal
>>
>> Qingqing Zhuo (1):
>>       drm/amd/display: DP HDCP Compliance 1A-08/09 tests fail
>>
>> Tao Zhou (1):
>>       drm/amdgpu: enable gpu recovery for dimgrey_cavefish
>>
>> Tian Tao (1):
>>       drm/amdgpu: fix unnecessary NULL check warnings
>>
>> Wayne Lin (2):
>>       drm/amdgpu: Add otg vertical IRQ Source
>>       drm/amd/display: Add otg vertical interrupt0 support in DCN1.0
>>
>> Wesley Chalmers (1):
>>       drm/amd/display: DIO Supported for virtual displays
>>
>> Wyatt Wood (1):
>>       drm/amd/display: Initialize dmub_rb_cmd unions to 0
>>
>> Xiaojian Du (1):
>>       drm/amd/pm: make the error log more clear for fine grain tuning =

>> function
>>
>> Xiaomeng Hou (3):
>>       drm/amd/pm: update the smu v11.5 smc header for vangogh
>>       drm/amd/pm: modify the power limit level parameter from bool to en=
um type
>>       drm/amd/pm: add support for hwmon control of slow and fast PPT =

>> limit on vangogh
>>
>>  drivers/gpu/drm/amd/amdgpu/Makefile                |   3 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   7 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   3 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  19 +++-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  18 ++--
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  15 +--
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   2 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   9 ++
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |   1 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   8 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   7 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  10 +-
>>  drivers/gpu/drm/amd/amdgpu/cik.c                   |  33 ++----
>>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  28 +++--
>>  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  72 ++++++++++++-
>>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  72 +++++++++++--
>>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  66 ++++++------
>>  drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             | 114 ++++++++++++++=
++++++
>>  drivers/gpu/drm/amd/amdgpu/nv.c                    |  44 ++++++--
>>  drivers/gpu/drm/amd/amdgpu/si.c                    |  42 ++++----
>>  drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.c         |  77 +++++++++++++
>>  drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.h         |  30 ++++++
>>  drivers/gpu/drm/amd/amdgpu/soc15.c                 |  26 +++--
>>  drivers/gpu/drm/amd/amdgpu/vi.c                    |  36 +++----
>>  .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |   4 +-
>>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   6 +-
>>  drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |   1 -
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   6 +-
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   3 +-
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h |   2 +-
>>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   8 +-
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  22 ++++
>>  drivers/gpu/drm/amd/display/dc/core/dc.c           |  40 +++----
>>  drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   4 +-
>>  drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
>>  drivers/gpu/drm/amd/display/dc/dc_dsc.h            |   7 +-
>>  drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   1 -
>>  drivers/gpu/drm/amd/display/dc/dc_link.h           |   2 +
>>  .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |   2 +-
>>  drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |   3 +
>>  .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |   3 +-
>>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   6 +-
>>  .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |   2 +-
>>  .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |  15 +++  =

>> .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |  11 ++
>>  .../drm/amd/display/dc/dcn20/dcn20_link_encoder.c  |   2 +-
>>  .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  11 +-
>>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |   4 +-
>>  .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |  20 +++-
>>  .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |   7 +-
>>  .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |   7 +-
>>  .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   7 +-
>>  .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   2 +-
>>  .../drm/amd/display/dc/dml/display_mode_structs.h  |   1 +
>>  .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |   2 +
>>  .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |   1 +
>>  drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  29 ++---
>>  .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |   4 +-
>>  .../amd/display/dc/irq/dcn10/irq_service_dcn10.c   |  31 ++++++
>>  drivers/gpu/drm/amd/display/dc/irq_types.h         |   1 +
>>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  29 ++++-
>>  .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |   2 +
>>  drivers/gpu/drm/amd/include/amd_shared.h           |   1 +
>>  .../include/asic_reg/smuio/smuio_11_0_6_offset.h   |  35 ++++++
>>  .../include/asic_reg/smuio/smuio_11_0_6_sh_mask.h  |  41 +++++++
>>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  49 +++++++--
>>  drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |  21 +++-
>>  drivers/gpu/drm/amd/pm/inc/smu_types.h             |   4 +
>>  drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |  13 ++-
>>  drivers/gpu/drm/amd/pm/inc/smu_v11_5_ppsmc.h       |   6 +-
>>  drivers/gpu/drm/amd/pm/inc/smu_v12_0.h             |   2 -
>>  .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   2 +-
>>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  30 +++++-
>>  drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   4 +-
>>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   4 +-
>>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  15 ++-
>>  drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  32 +-----
>>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   | 120 ++++++++++++++=
++++++-
>>  drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   9 +-
>>  drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |  12 ---
>>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  28 +++++
>>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   2 +
>>  drivers/gpu/drm/radeon/radeon_asic.c               |   3 +
>>  drivers/gpu/drm/radeon/radeon_vce.c                |   1 -
>>  drivers/gpu/drm/radeon/rs690.c                     |   2 +-
>>  drivers/gpu/drm/radeon/vce_v1_0.c                  |   1 -
>>  86 files changed, 1147 insertions(+), 342 deletions(-)  create mode =

>> 100644 drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.c
>>  create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.h
>>  create mode 100644 =

>> drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_11_0_6_offset.h
>>  create mode 100644 =

>> drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_11_0_6_sh_mask.h



--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7Cqingqing.zhuo%40amd.com%7Cce0d1ee6a18b4a95366=
008d8f082048e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6375237892634862=
88%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D0U7l7fCO57FF7kUPI4tzQFTyLvMhSE%2FELR3=
D1xf6hcY%3D&amp;reserved=3D0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
