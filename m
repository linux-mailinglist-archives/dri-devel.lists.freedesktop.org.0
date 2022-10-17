Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB94601C91
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 00:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BE110E27C;
	Mon, 17 Oct 2022 22:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AC010E240;
 Mon, 17 Oct 2022 22:44:03 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id 204so12390056pfx.10;
 Mon, 17 Oct 2022 15:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8T9R90NQr0Cus17IiTSAkyfNN/tN1vR67SiHbRuEPI=;
 b=U2N8UnthPtqfKpR8N9pAjr8gPmCblQJD92zioxeGUg0fl8+yjDCMjfD6zMOO/0v3VZ
 v4e9j8lUGszk1F0sxLkQ1OLHVl692mVKtG+ONjc5J+2LAGvNad8zGpHHoG3QbbBjEEQw
 w6YGf71fhPQdZJ7aZy20CV0WoLdzeROnm/DDfxK04pOIJo83y76ALsWC4HXBeDsIPvmR
 sfktx0UYQbYqFXpVHqqW2GNVE95VDn73P2ptaFUqJfoZKiEfCk8Nrps91kIv7yV5gxYL
 v0SheJdFEL+/OB0gq+pqO8tCN/vkB3IdkSuiWIA2RC3KGLXyeaXaUgWXtqWhPHTX/h1o
 stjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8T9R90NQr0Cus17IiTSAkyfNN/tN1vR67SiHbRuEPI=;
 b=T4JNU1TwGG7aGLhxr2Dv2cAnt/NqzOxU2sw04wkKzCZhlErX7tqdI8KF7mkPw5ry2L
 CjXXbHlkcs45IMI3BcQ78DFp9Em3FQW86SZrSFM3avu3aXe/4qJyhZaCBKnqGTcwCnJn
 ugfCD+0D9TRUxZ5M1HTaRPtmpoFr1cPBFA5pqEQ3XvLbG5oeuOCwFYeYt4hiV+SxqHAE
 Rh2sn15F5/iVreeFS7aNKadgdtGM6GPLhAfGoc3H2rYp39dVHPWY+f23+8P/oTP717TI
 zTicBx9RQkBj1oEKjM5sqGGJBwUMjcePA5WC7yqE8Suyferke82CWJvsUBlEtDs6TPCh
 JM8A==
X-Gm-Message-State: ACrzQf1taqQoEv9glZ8gJDeqp6sz/jvN86idH4NBpM3Md8K6dA7A7vWx
 u3oINrdLxr1PFY0RT+m2wliDpm1ik5WARafrT20=
X-Google-Smtp-Source: AMsMyM79IeYRrUMTY0HLvtqCc2++5ANt+Zj8uvyOpxR0fR1UjDNuT8HK9/IMJyA2Zo8fWIUbzS5QGag+bo/+rF4c3Cw=
X-Received: by 2002:a63:fd4f:0:b0:45f:d7ef:9f94 with SMTP id
 m15-20020a63fd4f000000b0045fd7ef9f94mr35647pgj.137.1666046642898; Mon, 17 Oct
 2022 15:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNVp=R5zC9B3PXWJ5nddtt3gkRzDsAsRKvhXq7exGjSAg@mail.gmail.com>
 <f3bc34e1-0eaf-84ef-486e-b7759e60b792@amd.com>
 <CABXGCsOD+tDdFcM37NP_1nS9eLym7qC=jUQy3iqYkc1m2iQgxw@mail.gmail.com>
 <0d5f66d8-9852-b6a9-0e27-9eb9e736d698@amd.com>
 <CABXGCsPi68Lyvg+6UjTK2aJm6PVBs83YJuP6x68mcrzAQgpuZg@mail.gmail.com>
 <eef04fc4-741d-606c-c2c6-f054e4e3fffd@amd.com>
 <CABXGCsNNwEjo_dvWJL7GLULBPy+RmwsC9ObpowR_M1nQ3fKt3g@mail.gmail.com>
 <4d0cbb79-4955-a3ed-4aa2-7f6cdaa00481@gmail.com>
 <CABXGCsP19VFRgTx5yGn68iCK3NxPxi_b9MTq=AmHtFPv9xR5sA@mail.gmail.com>
 <675a2d33-b286-d1d0-e4e7-05d6516026c0@gmail.com>
 <CABXGCsOqrB5zPFCeLw-VQjePikwDq4EKFQGc9hbOb5f7tGLDgg@mail.gmail.com>
 <8e54ec49-09da-f345-35cd-430712f5a6ad@gmail.com>
In-Reply-To: <8e54ec49-09da-f345-35cd-430712f5a6ad@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 18 Oct 2022 03:43:51 +0500
Message-ID: <CABXGCsPXcG4BUDr8AtmtWHZh7kTw6pFsSedhxiEcuej5S0oJ7Q@mail.gmail.com>
Subject: Re: [Bug][5.18-rc0] Between commits ed4643521e6a and 34af78c4e616,
 appears warning "WARNING: CPU: 31 PID: 51848 at
 drivers/dma-buf/dma-fence-array.c:191
 dma_fence_array_create+0x101/0x120" and some games stopped working.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 5:01 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
>
> We have implemented a workaround, but still don't know the exact root cau=
se.
>
> If anybody wants to look into this it would be rather helpful to be able
> to reproduce the issue.
>
> Regards,
> Christian.

I see that issue was returned after this commit
dd80d9c8eecac8c516da5b240d01a35660ba6cb6 is the first bad commit
commit dd80d9c8eecac8c516da5b240d01a35660ba6cb6
Author: Christian K=C3=B6nig <christian.koenig@amd.com>
Date:   Thu Jul 14 10:23:38 2022 +0200

    drm/amdgpu: revert "partial revert "remove ctx->lock" v2"

    This reverts commit 94f4c4965e5513ba624488f4b601d6b385635aec.

    We found that the bo_list is missing a protection for its list entries.
    Since that is fixed now this workaround can be removed again.

    Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 21 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 -
 3 files changed, 6 insertions(+), 18 deletions(-)

The games Forza Horizon 4 and Cyberpunk 2077 again hangs at start.


--=20
Best Regards,
Mike Gavrilov.
