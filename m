Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEC14B8BB6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 15:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E02010E44C;
	Wed, 16 Feb 2022 14:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE45110E44C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 14:43:46 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id y129so6480517ybe.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 06:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XgrnaYKHskOlXJs/1klYY5AbJsq/3JrBvm/3jFaFCcI=;
 b=zHD4zlkqyouSou6Frxj+FBDEsmWPYp7dykicxCGusjzr0izk+5VCtn3WzEL7h3qAOJ
 cg1IBDSBhacvZmV2z0LdZ+PIvCn3IgF3pnk952jqa4gkIgDUzqTcnFdB/Xxv90wbopxH
 086lQq/DYuPkPF8KZORgOBhqi3iiH63VyWkXId716J5NJ4qzwA0xIWxjBL3VTl9gXbq3
 pL0LIFwYGfc2SKKcyRLFQNPXBk/62oI5rUl59IVNPEJLSecVgT81XCwQ6TDHU54kxsel
 iNXB9bqO702vkMOR0PldkEWvq2ABFqHy/RY55vMxLHXZdl6r7dhqNN2CNNINTCW4z/GE
 LEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XgrnaYKHskOlXJs/1klYY5AbJsq/3JrBvm/3jFaFCcI=;
 b=Flg4RsV5/wszdJFmDyIpLJvUDVXH7GJXkzI27l8mlyuput7K8t8jVkJ3lX7wX9Rgfq
 Pl8Qf6Ytvb7ARMNv9zxbxQCeYEwbv0D9QJEB3PFYfT2iQ0k3/LwJWCyIGe8zlj61z5+T
 Mn3Di1Lk4HqiMhqv3l0sIAnqq/+ZIoUYb73FIqsU0BjTaO+fEz2kopN5fs+9bgKLq3Y0
 vdPw+pYfNECPAw+KgabnpFyyVXlRDGZbv/qj1drZfQtD67naBKfO2QMmBQ0dyTaHbHvq
 1hwKujVaQ6eDsx1g8pAFFk4juNx32m9PXte2h1T32n5nuY9ppfimAd+nWIvfwpLO97N2
 mw3A==
X-Gm-Message-State: AOAM532CO6El927FuetKL+PXef7s9pzSEJdtXRhSQGnSGZjLBC8GVA+I
 i2wcqkjOMVvy9uFvRt8R4rnYKlUlmgOQCSXVrl8TYA==
X-Google-Smtp-Source: ABdhPJyLBkCsPf7RFdo7D+XfddRJsDaMRww/Kk9oVtiyazBgm6jBFbhC7N/2b+M538IJBrnMw29XJzhExOxOR6khim0=
X-Received: by 2002:a0d:dd8c:0:b0:2d0:c11f:6b0c with SMTP id
 g134-20020a0ddd8c000000b002d0c11f6b0cmr2551796ywe.385.1645022625857; Wed, 16
 Feb 2022 06:43:45 -0800 (PST)
MIME-Version: 1.0
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <f5381561-25da-61e3-5025-fa6dd61dd730@189.cn>
 <20220209084331.fpq5ng3yuqxmby4q@houat>
 <def50622-fe08-01f7-83bd-e6e0bc39fe1b@189.cn>
 <CAPj87rOgk8A8s6MTqxcTO5EkS=ABpHQV3sHsAp7Yn2t3-N_SoQ@mail.gmail.com>
 <adec818a-5c66-3b4a-6f27-bcb29b6c67d1@189.cn>
In-Reply-To: <adec818a-5c66-3b4a-6f27-bcb29b6c67d1@189.cn>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 16 Feb 2022 14:43:34 +0000
Message-ID: <CAPj87rOY0j7p5fduA+p-kT8HP7kc8f4j2Q=FkGutPPPvmV7zqQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
To: Sui Jingfeng <15330273260@189.cn>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, Roland Scheidegger <sroland@vmware.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Feb 2022 at 14:13, Sui Jingfeng <15330273260@189.cn> wrote:
> On 2022/2/16 21:46, Daniel Stone wrote:
> > Other systems have this limitation, and Mesa's 'kmsro' concept makes
> > this work transparently, as long as your driver can export dmabufs
> > when running in 'VRAM' mode.
>
> When using vram helper based driver, the framebuffer  is locate at video
> ram. the backing memory fb is manage by TTM.
>
> while bo of etnaviv is locate at system ram. Currently i can't figure
> out how does the buffer going to be shared.

kmsro will allocate from the KMS device (usually using dumb buffers),
export that BO as a dmabuf, then import into etnaviv. etnaviv already
uses this for imx-drm.

Cheers,
Daniel
