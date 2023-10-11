Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10BF7C48D7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 06:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A42910E43E;
	Wed, 11 Oct 2023 04:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F64510E43D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 04:41:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Orz4DhwtaofK5q7tJ5yPMtygjQrTXhfyLCOa1hf8NN7p+YuZEwm6H0R0P0yDTzQO4rm2eAO4wF2bo8Z7PN+KBR+wxTJ4VzlnUGZOT0qZHBMJginBdaNCrEnEXj4UXmi9cGBxFQyFhu6HEu/tL8snaRc3qs0pKN8I2BfjgOYeIYWm2uUKR1SAOPPZLWiRgxhLEl3shsHMdJLMN4T1TUnTNBd++RMM7KsjPk24LXdo3ycbMzFd7Ds5qgaBCDbG4CHJWdUYu7/311Tp7IBTvGjoZSoN0U5uLBhl8HXvhR7T0viSGy80uOV2g969G9AN3zREPKmotspBs3/74JDp8EreWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59TIBOd3ncd5K6NpEYhZkifaM8GeeCnA0jbvaH69QHs=;
 b=CjC02Xr2gyQ8YUXLsb3h2btMdSMpqyqrzlOtcxGeVYPpNGFrmwuk5bY0R+b0iE6anQWCq82ELZ3eOujfb1K3+uYwk+hVXa6XY+OnqC7YiAPp9OjmhuOlPJf73gd8OoaGJS59GH1/WaxnAOamOHxrqscZVbpdWQY+c0xSLZT95YQbEYADo4TsyxejxSIDN2mFPGG2eGQFiBz/j9blO/0FlBOyAGe8CKSYohhsd7ossAsxu/uR+jLk+jzufixmmk5kQoLv0PDRue3PoLfW3mVdK3hHFcEKBHZp0y95/xSswCbjx5kUebAnQuN/XWkbGC4VWBM6QB8gllRwPMWcxKlKGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59TIBOd3ncd5K6NpEYhZkifaM8GeeCnA0jbvaH69QHs=;
 b=WClpPP3PWieOvjbdIi/yQ1Ef0JDf4XHnW/p3CRrFx6cnEJl0fqiANE2fqSOeomhpTnLpyrMYDfvLBImBU5M6d+QXkdLf5lPzatNuK6OHXC+IQbM+9Q46zXpylHRhXRDO9YocM1Hgf3v59l5zpxOVbPmO6gcGynJZGNo/z2/thGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DS0PR12MB8443.namprd12.prod.outlook.com (2603:10b6:8:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 04:40:58 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 04:40:58 +0000
Date: Wed, 11 Oct 2023 12:40:33 +0800
From: Huang Rui <ray.huang@amd.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v3] drm/virtio: add new virtio gpu capset definitions
Message-ID: <ZSYnQbHUecuUlwvr@amd.com>
References: <20231010135722.1142265-1-ray.huang@amd.com>
 <2f8bcce1-6551-6c2d-481c-67502c82bc68@collabora.com>
 <2c162058-288c-9e9e-48d5-3b2ddb0cc1fa@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c162058-288c-9e9e-48d5-3b2ddb0cc1fa@collabora.com>
X-ClientProxiedBy: SG2PR02CA0087.apcprd02.prod.outlook.com
 (2603:1096:4:90::27) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DS0PR12MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e47431-ff28-4987-19d7-08dbca144368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: avabXcNwsSIKMtskYT+Zx+9vcUM4mJTqvt2c3EkXbCbDCUMvGFq7fn0qUPL/QPvGIcn00cSDwdf/KK9fSF8rJvZjbisQcWUKWzXLQnNjzNaRXrrazRHdh00WLuIE6iHPEO4jOm3S+42HP8HFPchjNI3kD/fJSyn3R3lN/Jq3AciN1V9YwSTfCwrwaTR6zZkmNV7X9AUlN2l66WlpZg3EZ7MEF79jGjNGeT08z9DTPgPUsp9Tkcf6+BuQtr8Eg0y7LNURgJot7FmzqTyO4OKiH2L6yyHaF6Dh8caninivF7c8FJ6gaIjiMjydhPVd8HXeXrGADwFB2KMPBj0XRnQ4VA42HRqUW55rSRY1ZHupZtBIBek+LsBfiOKiA2KjoJfH0Sv7aYrXYmIjLWWcYR86v01QAJTt10JMNL1jsQ+cwf1mHlimkYcGyC2nc8T1XDn0YrdCcqojXekZEkNQnUWEcmc6RlMtcvfHkP+0BuPk5m2zJni2nF7tgIEN1eu5Rx8d20tyy4TrOuPIarOZUifzlz/BWHmhTAdrKwkk23klngL8PnGzKjn2ARPJeZ2+S7EyQcuKyqZsP2i6kaYC5YufSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8690.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(66556008)(66946007)(66476007)(8936002)(8676002)(4326008)(966005)(6486002)(54906003)(316002)(6916009)(7416002)(41300700001)(5660300002)(38100700002)(2906002)(53546011)(86362001)(2616005)(26005)(6512007)(478600001)(6666004)(6506007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3qNtL2aDZ0Ri1Q48TZ7YFHCCsBNyZrocvoeCGnK5sSHJiNW1uvRvRSYaFgx7?=
 =?us-ascii?Q?QKLQGnCPCbNFnrqgylSoUPiwSF5pAmHhEnkkD37NDx6FdPbDm63rGo7x4jej?=
 =?us-ascii?Q?JRBd6++sQHoHmWWAdw89w9lBV28kx/W66jo5a+F6F2erxJz3h7sR+FbF7wCk?=
 =?us-ascii?Q?Csm08TdoS3RA7D0ZiKP7/MSGxu/BMWMBX7VUCtFILi1CJnAMboWesPHqqcFk?=
 =?us-ascii?Q?lQkO1oCqbAWJIFebqin+VWUZ5+MrfsAbLCJXB/VawmKuf01jvMA+fjGpzSXI?=
 =?us-ascii?Q?AWkgXAOQLOCdZBwdgKoySUfL0riChmJvCSt6AkkcXhsSnCvmuqaG5Vpz1dXy?=
 =?us-ascii?Q?arf8oBu00VNHp9zoDBgkgLV7v0bHQUGw2p3UODg09RVNqG6qllkZ7sbwl6PY?=
 =?us-ascii?Q?YDTsaBLkP7X6mgzrR783YJ+yMQFSa3rI4nARP8fkoH9kLVkooHekl4gfQQec?=
 =?us-ascii?Q?EVfNVIS1GDWbgfRuvL0yWUEjV7HPqdPLh3YJGFbawnphKiwqG9Xq/uizMXXp?=
 =?us-ascii?Q?JEtTjupuv3TfPwk+5p1l2FIGqEuyYOuX9WSL1HpEXkvHDPup+8/fOEvdzv6a?=
 =?us-ascii?Q?CFnJbReGKW3mlSnYeIzKKrHGAgRioldE8mwu1DtIKDY4uQnPRJGfOXYksliC?=
 =?us-ascii?Q?HpdectHpY8laDl0L4tWucir9budfWggHUBfulWOakYZVRI11d3QwOOPhE1vW?=
 =?us-ascii?Q?BUorL3bzSRR3hPia3HDzCfkbigLZLlhw/WNhSeajrMxVgDbG1iL+nkIosS5I?=
 =?us-ascii?Q?zNp3uuAhi5N5wvA6hZpSdWeAEmaUkZnMTTQtqgS/WqxTshZG65ARRIs2iGKJ?=
 =?us-ascii?Q?vylWHNku/trhO2ksds0vSOlSc5q71L1MdZhnwPlohSCm6jKFoI/S1voewJ0+?=
 =?us-ascii?Q?TekcI9pd4E0Ae3/ljncbqvpCrtHPFnUHGJSAviD4O2Q7LqOLxHv40RUqaaD8?=
 =?us-ascii?Q?duhoSANOQrO0t8puxxuMImYFyiTfMotTHFbWTBfJlG/ot1X6twT4XzIOhfof?=
 =?us-ascii?Q?Z80R2LAA/wioESdDT3obriBYWmAP7sGIJD/2QxDygo6QKcZqhGNNgSOCspJK?=
 =?us-ascii?Q?LMHXa3uf4alqa4/0UvWn5tEeTKNzhKWLBWC2XP7dNB+nKrEurKvStOz1/98L?=
 =?us-ascii?Q?ClzXN6bu2CNyY3NyN5stOC8Cirm15pDKdomcYznaQ1u5FfHapRWlvccZ5+7m?=
 =?us-ascii?Q?YarhfmHrbyS9Jty0Lpfvd+jrDmNj2dixAFWxCi7Q9TkY1ofgpCPsCLHZl8+J?=
 =?us-ascii?Q?03btEsZMnY4FphZ+JQOk0Mxx8XwoMxY4y+ica3vk9JGfGH2D3RGBOgj1rhcs?=
 =?us-ascii?Q?tSe5nVUgbPrUwaNppgeo8ocCsnjsMWXHb5wVtOKgRmUXXN4ALi9OvQzt8LO8?=
 =?us-ascii?Q?GivBNYwP0+nQalyXRwPJK7DMTUP8Ei6/nTJvm6579Ol2SStxi8zGIeDvBFd0?=
 =?us-ascii?Q?S7j/WOlCvZUWS5UpLv5YeRKG5N55OljwtmccEveCHn2UMBdprgRajeCbqJH8?=
 =?us-ascii?Q?zkZ3Gm95WlcMp1MLmg2gIkEl6UQDjYepAN7oH8smcIecEKAmwGoRU3FHpI8u?=
 =?us-ascii?Q?B9K5kWF88s8s0OmQ5WdRpkNOIve5uALhP56/xMpM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e47431-ff28-4987-19d7-08dbca144368
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 04:40:58.3992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEAOKZaSmITYylutvZ7BimmnMAB4oIwXEtwA5UOzcBmlBwEs08rrL6PHKTuG9y93CJIMVoWZbweB6XlFlauI7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8443
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
Cc: "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Ragiadakou,
 Xenia" <Xenia.Ragiadakou@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, David Airlie <airlied@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 11:52:14PM +0800, Dmitry Osipenko wrote:
> On 10/10/23 18:40, Dmitry Osipenko wrote:
> > On 10/10/23 16:57, Huang Rui wrote:
> >> These definitions are used fro qemu, and qemu imports this marco in the
> >> headers to enable gfxstream, venus, cross domain, and drm (native
> >> context) for virtio gpu. So it should add them even kernel doesn't use
> >> this.
> >>
> >> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> ---
> >>
> >> Changes V1 -> V2:
> >> - Add all capsets including gfxstream and venus in kernel header (Dmitry Osipenko)
> >>
> >> Changes V2 -> V3:
> >> - Add missed capsets including cross domain and drm (native context)
> >>   (Dmitry Osipenko)
> >>
> >> v1: https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/
> >> v2: https://lore.kernel.org/lkml/20231010032553.1138036-1-ray.huang@amd.com/
> >>
> >>  include/uapi/linux/virtio_gpu.h | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> >> index f556fde07b76..240911c8da31 100644
> >> --- a/include/uapi/linux/virtio_gpu.h
> >> +++ b/include/uapi/linux/virtio_gpu.h
> >> @@ -309,6 +309,10 @@ struct virtio_gpu_cmd_submit {
> >>  
> >>  #define VIRTIO_GPU_CAPSET_VIRGL 1
> >>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
> >> +#define VIRTIO_GPU_CAPSET_GFXSTREAM 3
> > 
> > The GFXSTREAM capset isn't correct, it should be GFXSTREAM_VULKAN in
> > accordance to [1] and [2]. There are more capsets for GFXSTREAM.
> > 
> > [1]
> > https://github.com/google/crosvm/blob/main/rutabaga_gfx/src/rutabaga_utils.rs#L172
> > 
> > [2]
> > https://patchwork.kernel.org/project/qemu-devel/patch/20231006010835.444-7-gurchetansingh@chromium.org/
> 
> Though, maybe those are "rutabaga" capsets that not related to
> virtio-gpu because crosvm has another defs for virtio-gpu capsets [3].
> The DRM capset is oddly missing in [3] and code uses "rutabaga" capset
> for DRM and virtio-gpu.
> 
> [3]
> https://github.com/google/crosvm/blob/main/devices/src/virtio/gpu/protocol.rs#L416

Yes, [3] is the file that I referred to add these capsets definitions. And
it's defined as gfxstream not gfxstream_vulkan.

> 
> Gurchetan, could you please clarify which capsets definitions are
> related to virtio-gpu and gfxstream. The
> GFXSTREAM_VULKAN/GLES/MAGMA/COMPOSER or just the single GFXSTREAM?
> 

Gurchetan, may we have your insight?

Thanks,
Ray

> -- 
> Best regards,
> Dmitry
> 
