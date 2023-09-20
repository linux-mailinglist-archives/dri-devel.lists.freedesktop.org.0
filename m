Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9447A8B9B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 20:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADCE10E537;
	Wed, 20 Sep 2023 18:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E6410E537
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 18:25:14 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4051039701eso13005e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695234313; x=1695839113;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VpTkUTk2dzioZKLIBTQ18yG7YDnHVOKB4Sat59PHtOs=;
 b=b49+uaW7GvTljV9qJ7Matd0uT7VNnqTZjLMEM7PR6XYaWlK3AlcUg//nPYvFsaO6Di
 eNDVg6mVzN2rNMLfcj8XDE1xSbAil6yJt4oYA/P5pqm1ojVGpNIM+p75i1mXTgw58P4r
 jQ/NZgDDNZ8oQnsCYGrzxGqn45RqP0ZTbaIcFqC8zwUfaFNGjPmMSim15kSrMQMz0DDV
 CRrYSPaqokpH3nspwfE3OKosg443umXjADBgDZWNOLCUNi+RG9s5B4FaTVC3fuQXYJny
 ZluQerPfuvId7yKYuQowQVdsG95lILQuNJi9+VMIGwM8/T2K68QgkhSTeumw6bhuXsc/
 xcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695234313; x=1695839113;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VpTkUTk2dzioZKLIBTQ18yG7YDnHVOKB4Sat59PHtOs=;
 b=OnJm7dIOAzGrY8zIWgfGbfvjZB8NGEVqPPW8rrV02R3zMXm0Lsxh1kwwzylc4i+cza
 qVvD/2DTmSf9ZBhKQsDTh8KOJHjOpN7Oz+onKByeLnewblSAWYvd1In3udhUvFYs+Vb1
 2OipmwCOb8641YvgretiNnHr+wb/l7WuE7nXjPvuUIWxBPKfn2FpVHKOFJS0JIzN7Sat
 SLXzuaIWJkMVzXVTBqAAlhrkl6TbRxAPyQz9POt7l6cctIV2EeHngDd5SprOjwCjPPQj
 5f0wkJFK4qeZLocYK3UMLkIpNgB3CDMzXn6HQMMbMK0c7Q8rVfXyg2YUMXMnmzmT8fmS
 X33g==
X-Gm-Message-State: AOJu0Yy/2NQame826ry+B5p1PDJn99qcTH2Tqekja3W8uMb7qLzQSKXz
 eFBtN92bn8HrsSmPXpmTkJg4w7AZFAF0zN4qZEef
X-Google-Smtp-Source: AGHT+IFSXkkSrtGDTTY0L5kfO+ZTbOYrxprKpii61xyoEksdD+ax+vTtjx8jczEku0If7HT3UPfPXkcJqmapyG/fxdw=
X-Received: by 2002:a05:600c:4e43:b0:401:c94d:d6de with SMTP id
 e3-20020a05600c4e4300b00401c94dd6demr7385wmq.2.1695234312781; Wed, 20 Sep
 2023 11:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
 <a0b32a1d93bc9d991f77ad3408fe7b177bb32889.camel@mediatek.com>
In-Reply-To: <a0b32a1d93bc9d991f77ad3408fe7b177bb32889.camel@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 20 Sep 2023 11:25:00 -0700
Message-ID: <CA+ddPcNPeo=z42fG24uoSMJ8M0uWB-huzXVKBm-seG=7b+50JA@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add mediate-drm secure flow for SVP
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 10:26=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89=
) <ck.hu@mediatek.com> wrote:
>
> Hi, Jason:
>
> On Tue, 2023-09-19 at 11:03 +0800, Jason-JH.Lin wrote:
> > The patch series provides drm driver support for enabling secure
> > video
> > path (SVP) playback on MediaiTek hardware in the Linux kernel.
> >
> > Memory Definitions:
> > secure memory - Memory allocated in the TEE (Trusted Execution
> > Environment) which is inaccessible in the REE (Rich Execution
> > Environment, i.e. linux kernel/userspace).
> > secure handle - Integer value which acts as reference to 'secure
> > memory'. Used in communication between TEE and REE to reference
> > 'secure memory'.
> > secure buffer - 'secure memory' that is used to store decrypted,
> > compressed video or for other general purposes in the TEE.
> > secure surface - 'secure memory' that is used to store graphic
> > buffers.
> >
> > Memory Usage in SVP:
> > The overall flow of SVP starts with encrypted video coming in from an
> > outside source into the REE. The REE will then allocate a 'secure
> > buffer' and send the corresponding 'secure handle' along with the
> > encrypted, compressed video data to the TEE. The TEE will then
> > decrypt
> > the video and store the result in the 'secure buffer'. The REE will
> > then allocate a 'secure surface'. The REE will pass the 'secure
> > handles' for both the 'secure buffer' and 'secure surface' into the
> > TEE for video decoding. The video decoder HW will then decode the
> > contents of the 'secure buffer' and place the result in the 'secure
> > surface'. The REE will then attach the 'secure surface' to the
> > overlay
> > plane for rendering of the video.
> >
> > Everything relating to ensuring security of the actual contents of
> > the
> > 'secure buffer' and 'secure surface' is out of scope for the REE and
> > is the responsibility of the TEE.
> >
> > DRM driver handles allocation of gem objects that are backed by a
> > 'secure
> > surface' and for displaying a 'secure surface' on the overlay plane.
> > This introduces a new flag for object creation called
> > DRM_MTK_GEM_CREATE_ENCRYPTED which indicates it should be a 'secure
> > surface'. All changes here are in MediaTek specific code.
>
> How do you define SVP? Is there standard requirement we could refer to?
> If the secure video buffer is read by display hardware and output to
> HDMI without any protection and user could capture HDMI signal, is this
> secure?

SVP (Secure Video Path) is essentially the video being completed
isolated from the kernel/userspace. The specific requirements for it
vary between implementations.

Regarding HDMI/HDCP output; it's the responsibility of the TEE to
enforce that. Nothing on the kernel/userspace side needs to be
concerned about enforcing HDCP. The only thing userspace is involved
in there is actually turning on HDCP via the kernel drivers; and then
the TEE ensures that it is active if the policy for the encrypted
content requires it.
>
> Regards,
> CK
>
> >
> > ---
> > Based on 2 series:
> > [1] Add CMDQ secure driver for SVP
> > -
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-=
mediatek/list/?series=3D785332__;!!CTRNKA9wMg0ARbw!mPocbQwZ4-25DmidvAgd9K5e=
XjNEhSyIKpvvYHPpdrq2PgS-hkYyHohzDvoJydD45UZp5JvY9DuDVFj1ltVnhGY$
> >
> >
> > [2] dma-buf: heaps: Add MediaTek secure heap
> > -
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-=
mediatek/list/?series=3D782776__;!!CTRNKA9wMg0ARbw!mPocbQwZ4-25DmidvAgd9K5e=
XjNEhSyIKpvvYHPpdrq2PgS-hkYyHohzDvoJydD45UZp5JvY9DuDVFj10sD4kHE$
> >
> > ---
> >
> > CK Hu (1):
> >   drm/mediatek: Add interface to allocate MediaTek GEM buffer.
> >
> > Jason-JH.Lin (9):
> >   drm/mediatek/uapi: Add DRM_MTK_GEM_CREATED_ENCRYPTTED flag
> >   drm/mediatek: Add secure buffer control flow to mtk_drm_gem
> >   drm/mediatek: Add secure identify flag and funcution to
> > mtk_drm_plane
> >   drm/mediatek: Add mtk_ddp_sec_write to config secure buffer info
> >   drm/mediatek: Add get_sec_port interface to mtk_ddp_comp
> >   drm/mediatek: Add secure layer config support for ovl
> >   drm/mediatek: Add secure layer config support for ovl_adaptor
> >   drm/mediatek: Add secure flow support to mediatek-drm
> >   arm64: dts: mt8195-cherry: Add secure mbox settings for vdosys
> >
> >  .../boot/dts/mediatek/mt8195-cherry.dtsi      |  10 +
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   3 +
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  31 +-
> >  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  15 +
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 271
> > +++++++++++++++++-
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  14 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  13 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  16 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_gem.c        | 121 ++++++++
> >  drivers/gpu/drm/mediatek/mtk_drm_gem.h        |  16 ++
> >  drivers/gpu/drm/mediatek/mtk_drm_plane.c      |   7 +
> >  drivers/gpu/drm/mediatek/mtk_drm_plane.h      |   2 +
> >  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |  11 +-
> >  drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       |   2 +
> >  include/uapi/drm/mediatek_drm.h               |  59 ++++
> >  16 files changed, 575 insertions(+), 17 deletions(-)
> >  create mode 100644 include/uapi/drm/mediatek_drm.h
> >
