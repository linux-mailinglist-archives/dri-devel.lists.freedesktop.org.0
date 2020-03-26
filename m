Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FB3193642
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 04:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5766E22B;
	Thu, 26 Mar 2020 03:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A5B6E22B;
 Thu, 26 Mar 2020 03:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbmTRtXRw/YJqPUONdxATDVkWGHF0pTN8EiUY+MJ3TJblcGUWPgMICdUGpHDLutBnxy77uM3v1ooZ3+xrhE2vMwLv/Bu+49MnlTGEtbw96r+gg9y3lM3h3WhP1z36xpDRyo+vUU/Y5Gd3sz1pS1iZxLpbxYXN0t+1GoRV65OLWYiZh3XQDkoN5plMV9NtaCd0MC6vEcxO9olgonOrJpIV/7PCZbk5VE2I6qVzywCR2XSNW8QAUqSJYXh0OzqQW1168jwKjm1f74GJ21EMZMeOuMDvr539Q3XJ6z5neZms7VhYQsxXn8PoVDskDb60q0fCB4P2EJX5pFV/ccrAIJbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oq1zkxVYE2FDL5AePQUFNFePDwMAqPia81mwjVHyGpg=;
 b=ZJ5zeHzR1x5ZGelvOeYm+eBOcVRoXa/E9ZmOtyRFWHg73tsSgIOi5ddXuwS3KE3qxDQVtDQFkOhmkAaKAZ6PsSGqA7lnShfPP/fwySZCdKtt3Izlt62rDyzeEC+HE/4AuM62LQ1RDvI5Yu2INUBTBKWiJxIFfUattYdjHAaG0KqsDBHpx/oerebsUAh4wAAq72usA9UrgR0cLZF8fw0teyR8k0j9vcETkkGhjzOh0bT8LlJmMg4a82TUiyXcMdiouvkNq+k0ozj/EqW5LQ0zLIaAR3TlsguEAPo7kD0tyWf/ZAtaprj5BPEtUkHY1AhZgY2nd7QHM4SAbj3GfmIqJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oq1zkxVYE2FDL5AePQUFNFePDwMAqPia81mwjVHyGpg=;
 b=RzCCcL9RjyK7at3SJ6KktWfKZ86YKGv2ffEjjZynx1GwHcbBQGWXcZurAKlKwbFWDrIwhngUdmAD0G0HhEqjI383D382Kn+Muym9EAJ6+9WGjYkJCWE0lrUAQkzy/QZkzWGC48/eCZj3KCTGbuLOJZv+5sswETMYolVa7GtywvE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (2603:10b6:208:106::29)
 by MN2PR12MB4271.namprd12.prod.outlook.com (2603:10b6:208:1d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Thu, 26 Mar
 2020 03:05:37 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b%5]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 03:05:37 +0000
Date: Thu, 26 Mar 2020 11:05:27 +0800
From: Huang Rui <ray.huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: clean up the inteface which is not used
Message-ID: <20200326030526.GA10282@jenkins-Celadon-RN>
References: <1585150494-20989-1-git-send-email-ray.huang@amd.com>
 <9af74b58-fde7-70fc-07b4-2ed24690bd7f@amd.com>
 <CADnq5_MMwtBZE7KR-s1W3u__v3WF6F9r3Ja9Z1axMsmL8k8+pA@mail.gmail.com>
 <cde1d49e-982e-80a5-57c0-5dd46b07d6e6@gmail.com>
Content-Disposition: inline
In-Reply-To: <cde1d49e-982e-80a5-57c0-5dd46b07d6e6@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: HK2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:202:2e::30) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jenkins-Celadon-RN (180.167.199.189) by
 HK2PR06CA0018.apcprd06.prod.outlook.com (2603:1096:202:2e::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20 via Frontend Transport; Thu, 26 Mar 2020 03:05:35 +0000
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 314610a1-2a7d-4548-02f5-08d7d1328f0d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4271:|MN2PR12MB4271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42718743B06DDF5CE0F51590ECCF0@MN2PR12MB4271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-Forefront-PRVS: 0354B4BED2
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(966005)(9686003)(6636002)(45080400002)(478600001)(53546011)(956004)(86362001)(81166006)(16526019)(5660300002)(26005)(6496006)(81156014)(33716001)(8936002)(186003)(52116002)(55016002)(316002)(6862004)(66556008)(66476007)(66946007)(8676002)(66574012)(54906003)(1076003)(6666004)(33656002)(4326008)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4271;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8zKeYIOEcMK9av0aaMz4wmsKsv0DQeg+8c8XBzYuu75tHQar6bL0yz20/SswqmoelQYfdNpVQDFm3dhPL+GAB4kataXXMWTmrcquqvcbh+JE6482LI8Vv4tZcCGOY4dcMMlEl4JyvQlwu0MC40qyKi1sNDlVUXLzDtcwdzJhMiIWMXWTVrOzXMrw6/p6s0INIqjZp91of6p/LstFkNq0FXkmJS6xOPSCv2ogxFp7OeU+FET/nWuQgPc6YHs0/ByjWTupSrEYhxLrH7IVjd90Q7xc51Jca97/Atvt/HDgv2IBy95aOMTUofPdjtkW9HvqXwgVjPZQRtDhBZNHe1d0Xg4Wl0StG9r650ebx4FJie2LCOm8IiAPw120VUU3LqH9cxgLrODmBbVv47LcGs/qkzanJc3V3fLXW0R2lwlIrGFFVPPkbOT4Dnqz4QPqc3bRtiVPmvgVfxKzB0ltc9ELW6N1jfQcAOeJ1NdqvpNrI0E=
X-MS-Exchange-AntiSpam-MessageData: nwIWfUsorc6D1VDsCNc38Yxq9VIsM1Fm4hKOfpVIEVO/UFRF8KuR3y5xtOSIQFH9p8UarsGHB0USUFgws/VgXjPAaTPlpQ6kYiOOas06Z/57/BVW6lTdV5DKKsb75jB+2wnxorg4Eyw+Mk6/QV31GQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314610a1-2a7d-4548-02f5-08d7d1328f0d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2020 03:05:37.6778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Q+ZeYY915mtrdk0OUaSMrQdIfRllyuEHn/TsJjZ05rkoqqt3Cwv2y0c/sTenBTJajwbaiHQE5b9EWvMSiwUYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4271
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 01:30:31AM +0800, Christian K=F6nig wrote:
> Am 25.03.20 um 18:27 schrieb Alex Deucher:
> > On Wed, Mar 25, 2020 at 1:20 PM Christian K=F6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 25.03.20 um 16:34 schrieb Huang Rui:
> >>> invalidate_caches is actually not used, so clean it up.
> >>>
> >>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >> Already had the same patch around for a while, looks like I've just
> >> forgot to commit it.
> >>
> >> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> >>
> > Is it already in drm-misc and just hasn't made it into
> > amd-staging-drm-next yet?  I can try and rebase next week if so.
> =

> Ah! Yeah there it is:
> =

> > commit 5e791166d377c539db0f889e7793204912c374da
> > Author: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
> > Date:=A0=A0 Fri Jan 10 16:09:54 2020 +0100
> >
> > =A0=A0=A0 drm/ttm: nuke invalidate_caches callback
> >
> > =A0=A0=A0 Another completely unused feature.
> >
> > =A0=A0=A0 Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > =A0=A0=A0 Reviewed-by: Huang Rui <ray.huang@amd.com>
> > =A0=A0=A0 Link: https://nam11.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F348265%2F&amp;data=3D02%7C=
01%7Cray.huang%40amd.com%7C544ea2a584b94dd75d8808d7d0e23993%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637207542363429381&amp;sdata=3Dj9xr%2B%2F0apX=
3fcSVWRfljfRD%2BJVDzMe7tZ1%2FKVqZysjo%3D&amp;reserved=3D0
> =

> Looks like we haven't merged that into amd-staging-drm-next yet.

I also forgot to look at this patch before. :-)
OK, let's use your orignal patch.

Thanks,
Ray

> =

> Christian.
> =

> >
> > Alex
> >
> >
> >>> ---
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  6 ------
> >>>    drivers/gpu/drm/nouveau/nouveau_bo.c       |  7 -------
> >>>    drivers/gpu/drm/qxl/qxl_ttm.c              |  6 ------
> >>>    drivers/gpu/drm/radeon/radeon_ttm.c        |  6 ------
> >>>    drivers/gpu/drm/ttm/ttm_bo.c               |  8 +-------
> >>>    drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  6 ------
> >>>    include/drm/ttm/ttm_bo_driver.h            | 13 -------------
> >>>    7 files changed, 1 insertion(+), 51 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_ttm.c
> >>> index cd2bde6..b397148 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>> @@ -62,11 +62,6 @@
> >>>
> >>>    #define AMDGPU_TTM_VRAM_MAX_DW_READ (size_t)128
> >>>
> >>> -static int amdgpu_invalidate_caches(struct ttm_bo_device *bdev, uint=
32_t flags)
> >>> -{
> >>> -     return 0;
> >>> -}
> >>> -
> >>>    /**
> >>>     * amdgpu_init_mem_type - Initialize a memory manager for a specif=
ic type of
> >>>     * memory request.
> >>> @@ -1746,7 +1741,6 @@ static struct ttm_bo_driver amdgpu_bo_driver =
=3D {
> >>>        .ttm_tt_create =3D &amdgpu_ttm_tt_create,
> >>>        .ttm_tt_populate =3D &amdgpu_ttm_tt_populate,
> >>>        .ttm_tt_unpopulate =3D &amdgpu_ttm_tt_unpopulate,
> >>> -     .invalidate_caches =3D &amdgpu_invalidate_caches,
> >>>        .init_mem_type =3D &amdgpu_init_mem_type,
> >>>        .eviction_valuable =3D amdgpu_ttm_bo_eviction_valuable,
> >>>        .evict_flags =3D &amdgpu_evict_flags,
> >>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/n=
ouveau/nouveau_bo.c
> >>> index 1b62ccc..7dd94e6 100644
> >>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >>> @@ -647,13 +647,6 @@ nouveau_ttm_tt_create(struct ttm_buffer_object *=
bo, uint32_t page_flags)
> >>>    }
> >>>
> >>>    static int
> >>> -nouveau_bo_invalidate_caches(struct ttm_bo_device *bdev, uint32_t fl=
ags)
> >>> -{
> >>> -     /* We'll do this from user space. */
> >>> -     return 0;
> >>> -}
> >>> -
> >>> -static int
> >>>    nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
> >>>                         struct ttm_mem_type_manager *man)
> >>>    {
> >>> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_=
ttm.c
> >>> index 16a5e90..62a5e42 100644
> >>> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> >>> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> >>> @@ -48,11 +48,6 @@ static struct qxl_device *qxl_get_qdev(struct ttm_=
bo_device *bdev)
> >>>        return qdev;
> >>>    }
> >>>
> >>> -static int qxl_invalidate_caches(struct ttm_bo_device *bdev, uint32_=
t flags)
> >>> -{
> >>> -     return 0;
> >>> -}
> >>> -
> >>>    static int qxl_init_mem_type(struct ttm_bo_device *bdev, uint32_t =
type,
> >>>                             struct ttm_mem_type_manager *man)
> >>>    {
> >>> @@ -256,7 +251,6 @@ static void qxl_bo_move_notify(struct ttm_buffer_=
object *bo,
> >>>
> >>>    static struct ttm_bo_driver qxl_bo_driver =3D {
> >>>        .ttm_tt_create =3D &qxl_ttm_tt_create,
> >>> -     .invalidate_caches =3D &qxl_invalidate_caches,
> >>>        .init_mem_type =3D &qxl_init_mem_type,
> >>>        .eviction_valuable =3D ttm_bo_eviction_valuable,
> >>>        .evict_flags =3D &qxl_evict_flags,
> >>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/ra=
deon/radeon_ttm.c
> >>> index f4af6703..40282bf 100644
> >>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> >>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> >>> @@ -66,11 +66,6 @@ static struct radeon_device *radeon_get_rdev(struc=
t ttm_bo_device *bdev)
> >>>        return rdev;
> >>>    }
> >>>
> >>> -static int radeon_invalidate_caches(struct ttm_bo_device *bdev, uint=
32_t flags)
> >>> -{
> >>> -     return 0;
> >>> -}
> >>> -
> >>>    static int radeon_init_mem_type(struct ttm_bo_device *bdev, uint32=
_t type,
> >>>                                struct ttm_mem_type_manager *man)
> >>>    {
> >>> @@ -774,7 +769,6 @@ static struct ttm_bo_driver radeon_bo_driver =3D {
> >>>        .ttm_tt_create =3D &radeon_ttm_tt_create,
> >>>        .ttm_tt_populate =3D &radeon_ttm_tt_populate,
> >>>        .ttm_tt_unpopulate =3D &radeon_ttm_tt_unpopulate,
> >>> -     .invalidate_caches =3D &radeon_invalidate_caches,
> >>>        .init_mem_type =3D &radeon_init_mem_type,
> >>>        .eviction_valuable =3D ttm_bo_eviction_valuable,
> >>>        .evict_flags =3D &radeon_evict_flags,
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_b=
o.c
> >>> index 2445e2b..fd09bbb 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> >>> @@ -343,14 +343,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buf=
fer_object *bo,
> >>>        }
> >>>
> >>>    moved:
> >>> -     if (bo->evicted) {
> >>> -             if (bdev->driver->invalidate_caches) {
> >>> -                     ret =3D bdev->driver->invalidate_caches(bdev, b=
o->mem.placement);
> >>> -                     if (ret)
> >>> -                             pr_err("Can not flush read caches\n");
> >>> -             }
> >>> +     if (bo->evicted)
> >>>                bo->evicted =3D false;
> >>> -     }
> >>>
> >>>        if (bo->mem.mm_node)
> >>>                bo->offset =3D (bo->mem.start << PAGE_SHIFT) +
> >>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu=
/drm/vmwgfx/vmwgfx_ttm_buffer.c
> >>> index d8ea3dd..3f3b2c7 100644
> >>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> >>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> >>> @@ -736,11 +736,6 @@ static struct ttm_tt *vmw_ttm_tt_create(struct t=
tm_buffer_object *bo,
> >>>        return NULL;
> >>>    }
> >>>
> >>> -static int vmw_invalidate_caches(struct ttm_bo_device *bdev, uint32_=
t flags)
> >>> -{
> >>> -     return 0;
> >>> -}
> >>> -
> >>>    static int vmw_init_mem_type(struct ttm_bo_device *bdev, uint32_t =
type,
> >>>                      struct ttm_mem_type_manager *man)
> >>>    {
> >>> @@ -866,7 +861,6 @@ struct ttm_bo_driver vmw_bo_driver =3D {
> >>>        .ttm_tt_create =3D &vmw_ttm_tt_create,
> >>>        .ttm_tt_populate =3D &vmw_ttm_populate,
> >>>        .ttm_tt_unpopulate =3D &vmw_ttm_unpopulate,
> >>> -     .invalidate_caches =3D vmw_invalidate_caches,
> >>>        .init_mem_type =3D vmw_init_mem_type,
> >>>        .eviction_valuable =3D ttm_bo_eviction_valuable,
> >>>        .evict_flags =3D vmw_evict_flags,
> >>> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo=
_driver.h
> >>> index cac7a8a..5f60c1e 100644
> >>> --- a/include/drm/ttm/ttm_bo_driver.h
> >>> +++ b/include/drm/ttm/ttm_bo_driver.h
> >>> @@ -256,19 +256,6 @@ struct ttm_bo_driver {
> >>>         */
> >>>        void (*ttm_tt_unpopulate)(struct ttm_tt *ttm);
> >>>
> >>> -     /**
> >>> -      * struct ttm_bo_driver member invalidate_caches
> >>> -      *
> >>> -      * @bdev: the buffer object device.
> >>> -      * @flags: new placement of the rebound buffer object.
> >>> -      *
> >>> -      * A previosly evicted buffer has been rebound in a
> >>> -      * potentially new location. Tell the driver that it might
> >>> -      * consider invalidating read (texture) caches on the next comm=
and
> >>> -      * submission as a consequence.
> >>> -      */
> >>> -
> >>> -     int (*invalidate_caches)(struct ttm_bo_device *bdev, uint32_t f=
lags);
> >>>        int (*init_mem_type)(struct ttm_bo_device *bdev, uint32_t type,
> >>>                             struct ttm_mem_type_manager *man);
> >>>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli=
sts.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7Cr=
ay.huang%40amd.com%7C544ea2a584b94dd75d8808d7d0e23993%7C3dd8961fe4884e608e1=
1a82d994e183d%7C0%7C0%7C637207542363429381&amp;sdata=3DU%2FQma6upKeuE1czmXp=
MlRcdnBmITvQZ9UyKsrA7sqs0%3D&amp;reserved=3D0
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%7Cray.=
huang%40amd.com%7C544ea2a584b94dd75d8808d7d0e23993%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637207542363429381&amp;sdata=3Dg4ARa0zkuyQp8HgGyv%2BMD=
3892AbuYeXmHXCSfQN7dxs%3D&amp;reserved=3D0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
