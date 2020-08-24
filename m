Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1E12512F6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 09:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B5F6E86C;
	Tue, 25 Aug 2020 07:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7510E8953E;
 Mon, 24 Aug 2020 19:09:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f7so10106605wrw.1;
 Mon, 24 Aug 2020 12:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=1/OwrF6O4VfIPs9S1xxSmo2BOW+0i4nsagYJC2DaJR0=;
 b=cFWXMyWnhZK5nA5qU9KqQ9s7hjZ3hz6kAsmKD3x6qC1cRjhnC6qDyns9g2XG0PXpYZ
 NfxulGrAmAF5NwG45URsOSf4qZX6nlueL2C1RtJYvp3d3PL5+Pr8zcIl03id53/GOLzM
 ealXfC2ehlkCBMi0nJfjcIdc+A5swPmfwC8NswkVKAkc0ctu57maYtebzCDgwu3sqnIU
 PmsRD/aY8njmxdznomtKxkz6sIuaAJ5/WzfwVGW38Xle0LMESS0xBV66v/+fPitw0ezX
 Yk6tJ2C+MjbgfDJfOJT1PrdE7P3X8XhsTktsd5hEguM8V9BM+2DO2c1JnDC4VmzlwmIM
 CVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=1/OwrF6O4VfIPs9S1xxSmo2BOW+0i4nsagYJC2DaJR0=;
 b=Lv1eTTER4arLmv5po1Q2NQi5L8E7EjtAITKSH3+PC/JaqCedpIiXw67dyeAES3Ap4H
 1Athu5KovUaT9fhb6t3pHulXreBp18nw6/zETjdaXzN/lhZJusbzKH5ZUoVmPawxUq/w
 VQVBpbxrbrTDkcg5IRAwDVooXuT+ufFSCEw1lMmtk1djqcdsY0ruONxWmj8H/KV66tkW
 2Novvu2yNIMPdEUC0aalhDeRx2uNE2pu8wKkKRCtz3g9sUE0q9pfotWYYSquDrdRQb99
 Uqth1zNagbRAHbwP0G6zS1IhTBJzM84XFFHB6Tt2yIPlteVGWLOs26vqUbqWWvw4I1ol
 d+Sg==
X-Gm-Message-State: AOAM531K/TGdrmviv7QNBP9mFRUA+KshAdZDAtt32BxAofOHGXuByfgR
 Sn5Ocl0gC6px2rIn+Oo4lctvWBk4wD3UC25r5TdCpZtBL6udhA==
X-Google-Smtp-Source: ABdhPJwLbaBmcJ0YU0Mm63DMRB1XUTp+nUhq0FoG7V+AI1bd+N1eoy8dCmFllCCCc33XNjvD+ws1FKPboGBlQG76Rsk=
X-Received: by 2002:adf:e8cc:: with SMTP id k12mr7385575wrn.2.1598296142108;
 Mon, 24 Aug 2020 12:09:02 -0700 (PDT)
MIME-Version: 1.0
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Mon, 24 Aug 2020 22:08:25 +0300
Message-ID: <CAJ1xhMUpqtKMuGUZdComskTqd0oOKCfDuVQT3+c13u=NSJLkBw@mail.gmail.com>
Subject: nouveau PUSHBUFFER_ERR on 5.9.0-rc2-next-20200824
To: bskeggs@redhat.com, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Tue, 25 Aug 2020 07:21:33 +0000
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
Cc: nouveau@lists.freedesktop.org, Linux-Next <linux-next@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since upgrading to linux-next based on 5.9.0-rc1 and 5.9.0-rc2 I have
had my mouse pointer disappear soon after logging in, and I have
observed the system freezing temporarily when clicking on objects and
when typing text.
I have also found records of push buffer errors in dmesg output:
[ 6625.450394] nouveau 0000:01:00.0: disp: ERROR 1 [PUSHBUFFER_ERR] 02
[] chid 0 mthd 0000 data 00000400

I tried setting CONFIG_NOUVEAU_DEBUG=5 (tracing) to try and collect
further debug info, but nothing caught the eye.

The error message in question comes from nv50_disp_intr_error in
drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:613,645.
And nv50_disp_intr_error is called from nv50_disp_intr in the
following while block:
drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:647,658
void
nv50_disp_intr(struct nv50_disp *disp)
{
        struct nvkm_device *device = disp->base.engine.subdev.device;
        u32 intr0 = nvkm_rd32(device, 0x610020);
        u32 intr1 = nvkm_rd32(device, 0x610024);

        while (intr0 & 0x001f0000) {
                u32 chid = __ffs(intr0 & 0x001f0000) - 16;
                nv50_disp_intr_error(disp, chid);
                intr0 &= ~(0x00010000 << chid);
        }
...
}

Could this be in any way related to this series of commits?
commit 0a96099691c8cd1ac0744ef30b6846869dc2b566
Author: Ben Skeggs <bskeggs@redhat.com>
Date:   Tue Jul 21 11:34:07 2020 +1000

    drm/nouveau/kms/nv50-: implement proper push buffer control logic

    We had a, what was supposed to be temporary, hack in the KMS code where we'd
    completely drain an EVO/NVD channel's push buffer when wrapping to the start
    again, instead of treating it as a ring buffer.

    Let's fix that, finally.

    Signed-off-by: Ben Skeggs <bskeggs@redhat.com>

Here are my GPU details:
01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce
210] (rev a1)
        Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8a93
        Kernel driver in use: nouveau

The last linux-next kernel I built where the problem reported does not
manifest itself is 5.8.0-rc6-next-20200720.

I would appreciate being given any pointers on how to further debug this.
Or is git bisect the only way to proceed with this?

Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
