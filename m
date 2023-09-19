Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297827A59FC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 08:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4714810E12B;
	Tue, 19 Sep 2023 06:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B910410E12B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 06:32:58 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9aa0495f9cfso1390047466b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 23:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1695105177; x=1695709977;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GbXneqlvqIGCYRFq8SaQCy+9zDbbsrcbESBLAJ+M0h4=;
 b=MkXibE7zdUgJUBL/QsSjv/lPcPA/MAXP6ae1zArw7rnFGC3JYNtl2EGyuF3ozrwNyI
 O3DIfzetQ+Ot2w78LeuJY0rWBRAHHpRb7cjyCvUhVMD4eJ9bEWvRVv9vuUnhuhjJJc8K
 ssmi6fDyD998L/N7iaQBWs6vyT/tQ/3ZiQ2biMMqkAxZYTKmBuNgwi8W6oPtW846iYR6
 LEKZwIPopKKkaXg8bVE33IPDDewODDOQaLIcM7Fx8W+zvzbY9NKIAjjY2dUHD2yQVK5J
 EqdT5hSZYdr37DKY9ezjIUOuw3cuOvuaFv3i5OyfDgv4+uSem6fTrFT+UAcYQQcKwaco
 D5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695105177; x=1695709977;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GbXneqlvqIGCYRFq8SaQCy+9zDbbsrcbESBLAJ+M0h4=;
 b=W6I/gPCdaChnk6vtaOQK8JTdUCWfxVhDL1vcbN1sme8tP5Jg+tAJ9Qfz8RhJ1YvlGR
 MsWMVQuBiBBFvxgTfJGoB+Y/uYA4o3U8T3rhZoTtsIdycjYykfrfr5ksvPr0D8ixpsWM
 XSeEuKsa4RS1ay3VcaKWl24a3vE2/25OfdnT+IRlrPsGAZ97VAZf3eZaqFivoe1ZTzuT
 p/p/M3JJefqCmRhM3jqiuH1mtxXB+B4gZkS1IpIt4rjXRuX+5SOuswWAoYxxfJN7GZA4
 jzjRRi/KkTQ5p12ItHEUprisQgwQr9dlWy49TtT3fEGE7A78suE+V/QVHcgF4rzRu8Q/
 YK+w==
X-Gm-Message-State: AOJu0Yz0nVt8Qc5usSb+jIe/5DJSv/qitV00I401PH5voSXzmGTFOSeP
 frXglWRtf4WvcOvHiyZGHdLgQReT+yXK7kxnvpCXdA==
X-Google-Smtp-Source: AGHT+IHpV5Vew41sZRDC2b41rJaSvmNBj24K6LKHAVA5Q188InmpQ7BMq5mvfnybMr2PJTT4+AhBMJwTFm7hYcrfhYw=
X-Received: by 2002:a17:907:97cb:b0:9aa:f7f:e276 with SMTP id
 js11-20020a17090797cb00b009aa0f7fe276mr2314608ejc.38.1695105176878; Mon, 18
 Sep 2023 23:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 19 Sep 2023 07:32:44 +0100
Message-ID: <CAPj87rOHctwHJM-7HiQpt8Q0b09x0WWw_T4XsL0qT=dS+XzyZQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add mediate-drm secure flow for SVP
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Sung <shawn.sung@mediatek.com>, devicetree@vger.kernel.org,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason, CK,

On Tue, 19 Sept 2023 at 04:04, Jason-JH.Lin <jason-jh.lin@mediatek.com> wrote:
> The patch series provides drm driver support for enabling secure video
> path (SVP) playback on MediaiTek hardware in the Linux kernel.
>
> [...]
>
> Memory Usage in SVP:
> The overall flow of SVP starts with encrypted video coming in from an
> outside source into the REE. The REE will then allocate a 'secure
> buffer' and send the corresponding 'secure handle' along with the
> encrypted, compressed video data to the TEE. The TEE will then decrypt
> the video and store the result in the 'secure buffer'. The REE will
> then allocate a 'secure surface'. The REE will pass the 'secure
> handles' for both the 'secure buffer' and 'secure surface' into the
> TEE for video decoding. The video decoder HW will then decode the
> contents of the 'secure buffer' and place the result in the 'secure
> surface'. The REE will then attach the 'secure surface' to the overlay
> plane for rendering of the video.
>
> Everything relating to ensuring security of the actual contents of the
> 'secure buffer' and 'secure surface' is out of scope for the REE and
> is the responsibility of the TEE.
>
> DRM driver handles allocation of gem objects that are backed by a 'secure
> surface' and for displaying a 'secure surface' on the overlay plane.
> This introduces a new flag for object creation called
> DRM_MTK_GEM_CREATE_ENCRYPTED which indicates it should be a 'secure
> surface'. All changes here are in MediaTek specific code.

To be honest, it seems strange that DRM is being used as the allocator
for buffers which will mostly be used by codec hardware which is not
mentioned here. I can understand that minigbm and gbm_gralloc make
this easy to implement, but it's not really right to add this all to
mtk-drm just to support some codec features.

NXP posted a patchset a while ago to add secure-memory support to
dma-heaps[0]. This would be much cleaner (e.g. avoiding strcmp on
allocating name, avoiding mtk-drm being a render node when it can't
render) I think, and also allow common secure-path semantics between
different vendors.

Having common secure-path semantics between different vendors would be
very helpful, because the first question when we add new uAPI is
'where is the open-source userspace?'. If there is at least a common
interface through e.g. dma-heaps, then we could have some standard
cross-vendor userspace code which would work well with the standard
interface.

Cheers,
Daniel

[0]: https://lore.kernel.org/lkml/20220805135330.970-2-olivier.masse@nxp.com/
