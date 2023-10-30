Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F6A7DB924
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 12:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D656F10E0F8;
	Mon, 30 Oct 2023 11:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDD310E267
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1698659912; x=1699264712; i=wahrenst@gmx.net;
 bh=8DG53bRWC7HD8srUEcGGZ52c3WRSH/lUlx5eOMlNbkg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=WDOoQVavNSVUo/hLC8Q0XCFyMOfG6pLRHgZmFR1NZZ8+pKpfKAVNJ9rB4jD8+ICs
 BrlKk81ZrRto/pYV/ub7SBBTL+cmbWAvjb/DwQb2fSv2YXtAbXwcAetuD6g1V/kko
 DrakSP54kw3hPPOQhHNRiUYX5w1vInTqPruqJiQFlQlREP1zesD/Afoo07e0ev4f4
 Y+hudxciEWrjbsFhQIZPT47OjgsGAWFU00NcgAN0aUraw8zMRsPFvtlxqGtUC8pLt
 4iRsKcFWrIZlqHGjc/V5U6Suv5xvuWvAMjI0dHUgM2RZRe0bdFDpS+loSieOyHvBm
 6whihDilhmPR454ZVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCtj-1rUoBE48V5-00bIXP; Mon, 30
 Oct 2023 10:58:32 +0100
Message-ID: <613c4107-26c5-4d48-95c2-15ac8fcca33c@gmx.net>
Date: Mon, 30 Oct 2023 10:58:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/v3d: fix up register addresses for V3D 7.x
To: Iago Toral Quiroga <itoral@igalia.com>, Maira Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
References: <20231030082858.30321-1-itoral@igalia.com>
 <20231030082858.30321-3-itoral@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231030082858.30321-3-itoral@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i7K8BTkCf7cMTMajNtA7E98DVK1Lv208pyAkUSVPWGTMYf61jvz
 CqMx5ecM6x2EX21XLqYXBeV5/A1z4sZ7dx1qxo0/A5eY4OSM0miztFqtkQablbH3AJLR4Rb
 OTegG4q4Fnm4gn2mmdDf4JWLvWHRCs0yez5cI6TsfrpBXjwDEs8RBQBhw8AVStTjz2fynOP
 33znsu/vAovfaLhIj1tAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3QULnmU1KR4=;v34whNbJ/SkQTDPCmeFi/h8DURJ
 2p9/ISP0VsjLYkWCAZeKZFETefLP/BbspFd0K6aqlzYZPXv4DJGGNBGyKsZHxzEYRNDF+61C1
 A+vdo0+Ylesn9F8/Cin+F/okxDzzMVSHARTrL3x6RsIuTSJlN/mkhnp6pS109SOs+tlDFUQVm
 ZgSgYEJuN+TyDubGuLVc3zWe0AKAYMlQji0Io087ZhF3KsAJd2kJycXyAvQwxwHWtJw/Hv/38
 K3zah3qY7167OXhwd6vkZ1xQsePVrLIx16tWNVq0Pmxc97J9KgJP+m9pZ13Pe4mB+htHBDjaH
 24/BCp/KNNoLCC0aiMvT+WkU0EhP6AZpa0+V6u0k7yjPypNM0c3JqwSbwvLEFhplgCCtkGTLm
 cI+DhiFfuIGheOIlwLFk4Rkd13NZlV6lHi595MbkXuwzLS6Rd1tYtSQUkhOyNnBRFrmMw77V9
 RhJs96AY3avW2LX4PGn3baFolST1KoRPh4u8/rt4zvC0jxtxvVi6U7MKmxwB7OYGu0FjUbofe
 eJ/PJRm5Xr/xd7W3fEl2fe9ZaNclx6vxj+MckmkzMY0CBfXvMIPUCxTywairCfqBSHS8hWGqs
 E7OoAfOSOjusAOmkRCoZvi7sekuA/s/Ij6o8dMwpCA4o8UGLgKKix82TPWfwrFlCfdfobgK9N
 qMNBHcbhXC9QdH6yYHhO5OkP7TfWQ7DX+btrfK+V0XUN9BVycK6IhKY3gZly4cIdy+TGCKrPt
 3tvuD0RuQprrykzBLZUCVYgxtOMOSiir+0G4/xRY4u4TBQM4G/E1+3o+j4ZuyIoWQ7cPZYS1G
 XSoz71fVKrl7gDvU0Jz+kxWhzM0WCouD2YGCNLGlg3YkNYFsfc6OOrWdU6LlyQlNoUUWMyxcj
 VgqJvY+bmGOgyXNf4uk71iENgOc9XHUjI541O9em0Lskj+BVVfWLL3NxjL42Ibx6ID5dLFK17
 eEAFjQ==
X-Mailman-Approved-At: Mon, 30 Oct 2023 11:41:13 +0000
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iago,

Am 30.10.23 um 09:28 schrieb Iago Toral Quiroga:
> This patch updates a number of register addresses that have
> been changed in Raspberry Pi 5 (V3D 7.1) and updates the
> code to use the corresponding registers and addresses based
> on the actual V3D version.
>
> v2:
>   - added s-o-b and commit message. (Ma=C3=ADra Canal)
>   - Used macro that takes version as argument and returns
>     appropriate values instead of two different definitions
>     for post-v71 and pre-v71 hardware when possible. (Ma=C3=ADra Canal)
>   - fixed style warnings from checkpatch.pl. (Ma=C3=ADra Canal)
>
> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_debugfs.c | 178 +++++++++++++++++-------------
>   drivers/gpu/drm/v3d/v3d_gem.c     |   4 +-
>   drivers/gpu/drm/v3d/v3d_irq.c     |  46 ++++----
>   drivers/gpu/drm/v3d/v3d_regs.h    |  94 +++++++++-------
>   drivers/gpu/drm/v3d/v3d_sched.c   |  38 ++++---
>   5 files changed, 204 insertions(+), 156 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d=
_debugfs.c
> index 330669f51fa7..f843a50d5dce 100644
> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
> @@ -12,69 +12,83 @@
>   #include "v3d_drv.h"
>   #include "v3d_regs.h"
>
> -#define REGDEF(reg) { reg, #reg }
> +#define REGDEF(min_ver, max_ver, reg) { min_ver, max_ver, reg, #reg }
>   struct v3d_reg_def {
> +	u32 min_ver;
> +	u32 max_ver;
Is this documented some where which SoC has which V3D version?
