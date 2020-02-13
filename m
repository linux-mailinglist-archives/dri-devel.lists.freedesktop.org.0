Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8A115C06D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 15:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B7D6F5EA;
	Thu, 13 Feb 2020 14:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16B26E316;
 Thu, 13 Feb 2020 14:35:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuvlQbaRggb8b1ON9mteFCD21t7UQJg/nILc0yyP91Nv0mriLD87O862mkYiH0xKYppuvb9VvmckGeX5BVUMWyHg9amVFsx60GSTzD6yFv1z9fJ1cdP4+0IwuHpUYqP5RX3r0al0GPLmHLWnlg051krKEdexBKYR7ZcZ2BrdgtlCTXE64Wmpi5MIEkMeQ+PbPq8p3kjN6k8OyjEPHwSMmN2OwI9FlHURK5Eqtc/a6J+ZDQ2/U+3QYYywwT2kvAgFxPFDW1CSHuJGbA/IM8Qt1dqlt+/PjnntFFcwnAXD3s//PHCVe/QYcyonDI/cnNHc2XNkxAl+/pSw26RS5GOILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8d6X4XMBmNebd1aBzIxI1f2ok4CCinvLY1J9/kA6cM=;
 b=Y0b9azKYqR3f9VF5CoVv/OFFjejXwL6FJLVQ4bpi/OEub7KCzzLFfIpYAp7VAd4UCHFrMSAm//GWLRIogtI74TG9nBdPv/bG+y9D3OAqd9JQC6MNDCz+8vGfHZbapOYWkreEi52i+uUJTCYX1EdovA9ilou0bCYXnasA4Cqqv5Je5mn+cGLti5P/tawHl2+SG6IAz7QUlzLK7aW2dG1Tpink3RkeeFJnbpKU+gDZho3fjrCmihRrJn1fP39MJ21Mwqsa35AyzCUOkRJNZj/W/EPr/wMGqaVhk0Nx8+aeCVQ9LacUAkqOY5adQujSSp1PTcvQU240fjQVNij1OZPfcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8d6X4XMBmNebd1aBzIxI1f2ok4CCinvLY1J9/kA6cM=;
 b=sxMPgt7ZWOcSWp+vamJG55DZjR9dPoa1Qzgw5uyRsRBJgpbjgzo3zBztH4+M1t1KhkRnp8Z9qkdCbrrbz1jmEA+3HZWcAh9N3CNucXVuHjjoy8stkk8jlioAJXMn75rbAEbwM8yQolWLqXGhwlg26HOB1J27L9DgUR6QfdQ1s/M=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4405.namprd12.prod.outlook.com (20.180.247.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23; Thu, 13 Feb 2020 14:35:30 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f945:5c4c:9c3f:930a]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f945:5c4c:9c3f:930a%6]) with mapi id 15.20.2729.025; Thu, 13 Feb 2020
 14:35:30 +0000
Date: Thu, 13 Feb 2020 22:35:18 +0800
From: Huang Rui <ray.huang@amd.com>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>
Subject: Re: [RFC PATCH 0/6] do not store GPU address in TTM
Message-ID: <20200213143516.GC24828@jenkins-Celadon-RN>
References: <20200213120203.29368-1-nirmoy.das@amd.com>
Content-Disposition: inline
In-Reply-To: <20200213120203.29368-1-nirmoy.das@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: HKAPR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:203:d0::27) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
MIME-Version: 1.0
Received: from jenkins-Celadon-RN (180.167.199.189) by
 HKAPR04CA0017.apcprd04.prod.outlook.com (2603:1096:203:d0::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22 via Frontend Transport; Thu, 13 Feb 2020 14:35:25 +0000
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ff467fa3-0005-4f3b-5aad-08d7b091f978
X-MS-TrafficTypeDiagnostic: MN2PR12MB4405:|MN2PR12MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4405E2CA5CCFC6118DE2E213EC1A0@MN2PR12MB4405.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(199004)(189003)(6666004)(81156014)(2906002)(8676002)(956004)(16526019)(186003)(81166006)(4326008)(66946007)(66556008)(66476007)(55016002)(9686003)(33716001)(1076003)(6496006)(86362001)(26005)(7416002)(33656002)(478600001)(5660300002)(52116002)(966005)(8936002)(6916009)(316002)(45080400002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4405;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L5wVBJf/XcX0CXVskRZV4t2AtECWwMU1vKEse49vDqAcqgRVfGCRKCW+dad4FeSGTRS2GZDY5dmBvE9nKU7x01Dm6kMH7CYO8EWVx+YgSUl011jIJdwd4d5iHsKig/KtHFlykj/HnkVJ7avkY15Y+QrojoQnQazoLlFllxsboqmd30X58RA/wKVf69/aux7yWiImsDZyC3Xnzct5qojDz3YzBccumvpwUsTI297ZA2427S1kgjQDvdYJcYixqBrCtYoiRIrfAH4xTnkf6fzl4u9ncL0vAxqnBKatiA3H47ewQKZOFW76o2qPeM+fPv7mt3liiV/dz17Vs37WHf77rkUGWaxC3buXmfeJKETjS/t9KZJrycBakMdScXjy4YDBLm+beFiHM9s6G2V4GKnSdxA/eo7UGB80CVwEeelCbYbd0C+QgFxlv9dVvQ17ICauaauio6lFNrv9UQ9ZRBecGwA6bLgE6rKgjcWMaanW5Ijmgo6SFLmmAblIDglWObQS
X-MS-Exchange-AntiSpam-MessageData: eHp0QGLvw11/dMyqdohlqXpUbe691ooxB9aKcya0hyMXPQxcSYNqRn+rIgRivBPBq3jNQtEfws2MG1zxT4t6s9hBEroBTLfKJqP3fm8VaT7NUtW/CDnU0mvlMduwt8Ad4r35TE5dMjM5YOA72CAayA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff467fa3-0005-4f3b-5aad-08d7b091f978
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 14:35:30.0164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtCprbQs/5FyozewpSDE5eENiD2yx3KDFNTPoECB+dPhYLcAon6KrwCshdJpMgJCnNLF09oeCbtmiKGkE6RKxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405
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
Cc: thellstrom@vmware.com, kraxel@redhat.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, linux-graphics-maintainer@vmware.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, sean@poorly.run,
 christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 01:01:57PM +0100, Nirmoy Das wrote:
> With this patch series I am trying to remove GPU address dependency in
> TTM and moving GPU address calculation to individual drm drivers.
> This is required[1] to continue the work started by Brian Welty to create
> struct drm_mem_region which can be leverage by DRM cgroup controller to manage memory
> limits.
> 
> 
> I have only manage to test amdgpu driver as I only have GPU for that.
> I might be doing something really stupid while calculeting gpu offset for
> some of the drivers so please be patient and let me know how can I improve
> that.
> 
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.mail-archive.com%2Fdri-devel%40lists.freedesktop.org%2Fmsg272238.html&amp;data=02%7C01%7Cray.huang%40amd.com%7Cad8c8464b13e4764556008d7b07c3344%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637171919805856109&amp;sdata=zlA%2FHePGKcILKg7Ezc9CGc%2FWXJkRa5xmrBznvJcAomk%3D&amp;reserved=0

Looks good for me as well for amd part.

Acked-by: Huang Rui <ray.huang@amd.com>

> 
> Nirmoy Das (6):
>   drm/amdgpu: move ttm bo->offset to amdgpu_bo
>   drm/radeon: don't use ttm bo->offset
>   drm/vmwgfx: don't use ttm bo->offset
>   drm/nouveau: don't use ttm bo->offset
>   drm/qxl: don't use ttm bo->offset
>   drm/ttm: do not keep GPU dependent addresses
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 22 ++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 29 ++++++++++++++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |  4 +--
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  6 ++---
>  drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/overlay.c  |  6 ++---
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_abi16.c     |  8 +++---
>  drivers/gpu/drm/nouveau/nouveau_bo.c        |  1 +
>  drivers/gpu/drm/nouveau/nouveau_bo.h        |  3 +++
>  drivers/gpu/drm/nouveau/nouveau_chan.c      |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c       | 10 +++----
>  drivers/gpu/drm/qxl/qxl_drv.h               |  6 ++---
>  drivers/gpu/drm/qxl/qxl_kms.c               |  3 +++
>  drivers/gpu/drm/qxl/qxl_object.h            |  5 ----
>  drivers/gpu/drm/qxl/qxl_ttm.c               |  9 -------
>  drivers/gpu/drm/radeon/radeon.h             |  1 +
>  drivers/gpu/drm/radeon/radeon_object.h      | 16 +++++++++++-
>  drivers/gpu/drm/radeon/radeon_ttm.c         |  4 +--
>  drivers/gpu/drm/ttm/ttm_bo.c                |  7 -----
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c          |  4 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c     |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c        |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  2 --
>  include/drm/ttm/ttm_bo_api.h                |  2 --
>  include/drm/ttm/ttm_bo_driver.h             |  1 -
>  33 files changed, 99 insertions(+), 72 deletions(-)
> 
> --
> 2.25.0
> 
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cray.huang%40amd.com%7Cad8c8464b13e4764556008d7b07c3344%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637171919805856109&amp;sdata=lnJkwlCEbUmtsBhBY94rB3hRgaYg4ENQ0DNTXxxwPL4%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
