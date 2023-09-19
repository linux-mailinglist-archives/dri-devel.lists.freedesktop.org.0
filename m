Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A7F7A6F97
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 01:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83FD10E419;
	Tue, 19 Sep 2023 23:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F2F10E419
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 23:37:46 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-34fa117f92bso28205ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 16:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695166666; x=1695771466;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CBBvqgdHlaE7qrp16rL/k+TOy6ZHc5Otw9KkoIR3N0=;
 b=peA6TO4HrsFiEl0oYwAcL43jsqbfNxAgGs1PiNYIy65fPioGdwaDNhbTUggXo5AiTY
 m8SA44WrAcs0yN6htqVD524OeIfL8WTZkN8RnxWbgUVSNfgzb9xmLOSRJhKV3YEx1AIA
 qKxLUDVorMdg1EDVyierbrZZlGx4PO2y/cUZULvPln0o6mmtkhCqLiMZMZW4jirj3tO1
 pSMsoTt5bRoqwD84HY29+Fr/FiFE847qsLw6TSZzBO7iQsT0n4lBIMSVO4fcU81gmHp3
 IBvZRDDKpR+fdahM/Slw8lI63iRdrnFaii3rZKvHBFTF2LPdBJcB1RXtWurCNBv5MFMc
 0A7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695166666; x=1695771466;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CBBvqgdHlaE7qrp16rL/k+TOy6ZHc5Otw9KkoIR3N0=;
 b=WOdli4YDh453+ZkorgvjZfcrj+r9ZxEym6oAisLehdV0OauTZE31J5IGWDFO9OmPUl
 KU65HUYdiFlMK661SMijPlJ7D6peO3/pxwIGa+fmBb+kQNoUtm0XbpLiyJ7ZT63sZeMh
 9vq19Rm5FuYzrS28Yl3U+BPgMTudvWKSQW1WyKNQTbEFp719omwY8R5vw2z4q+xaFya1
 t4YTjEFgHAyOrNXJ6Es2OiWVhd1dTfPc+xBuXPP+D89CUqpbNz03wyb2P0vKSLBfjCZj
 uEtU+hPgA5hWk8UF/MmIejQRB8dFMIVTjyECiOVqHW4FKkb53B3nc3zHJap3cp1PLxOv
 rZWw==
X-Gm-Message-State: AOJu0YwXpjgHy72g+mLsmqbtjb667xQeFa0eUHN28vc2Kme5dXXprMe+
 7N9eb6VUSpGuAftu5DCnUpxFZvuedDezw3GZJtjA
X-Google-Smtp-Source: AGHT+IEkj4ZxRK6CIppUtSGaqRy1AaoOr04YDLb3I3H35DnusOgqyPctNPG82NvpQQR2jBPAph/dtWVJ+aWn6Xi3hns=
X-Received: by 2002:a92:c56b:0:b0:34f:5587:4353 with SMTP id
 b11-20020a92c56b000000b0034f55874353mr45782ilj.25.1695166665921; Tue, 19 Sep
 2023 16:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
 <CAPj87rOHctwHJM-7HiQpt8Q0b09x0WWw_T4XsL0qT=dS+XzyZQ@mail.gmail.com>
In-Reply-To: <CAPj87rOHctwHJM-7HiQpt8Q0b09x0WWw_T4XsL0qT=dS+XzyZQ@mail.gmail.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Tue, 19 Sep 2023 16:37:30 -0700
Message-ID: <CA+ddPcMw0K-zkjW5LEHA4B81E25_HSVHVnEF67Lp0jGGNNUAxQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add mediate-drm secure flow for SVP
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Sung <shawn.sung@mediatek.com>, devicetree@vger.kernel.org,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.corp-partner.google.com>,
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

On Mon, Sep 18, 2023 at 11:33=E2=80=AFPM Daniel Stone <daniel@fooishbar.org=
> wrote:
>
> Hi Jason, CK,
>
> On Tue, 19 Sept 2023 at 04:04, Jason-JH.Lin <jason-jh.lin@mediatek.com> w=
rote:
> > The patch series provides drm driver support for enabling secure video
> > path (SVP) playback on MediaiTek hardware in the Linux kernel.
> >
> > [...]
> >
> > Memory Usage in SVP:
> > The overall flow of SVP starts with encrypted video coming in from an
> > outside source into the REE. The REE will then allocate a 'secure
> > buffer' and send the corresponding 'secure handle' along with the
> > encrypted, compressed video data to the TEE. The TEE will then decrypt
> > the video and store the result in the 'secure buffer'. The REE will
> > then allocate a 'secure surface'. The REE will pass the 'secure
> > handles' for both the 'secure buffer' and 'secure surface' into the
> > TEE for video decoding. The video decoder HW will then decode the
> > contents of the 'secure buffer' and place the result in the 'secure
> > surface'. The REE will then attach the 'secure surface' to the overlay
> > plane for rendering of the video.
> >
> > Everything relating to ensuring security of the actual contents of the
> > 'secure buffer' and 'secure surface' is out of scope for the REE and
> > is the responsibility of the TEE.
> >
> > DRM driver handles allocation of gem objects that are backed by a 'secu=
re
> > surface' and for displaying a 'secure surface' on the overlay plane.
> > This introduces a new flag for object creation called
> > DRM_MTK_GEM_CREATE_ENCRYPTED which indicates it should be a 'secure
> > surface'. All changes here are in MediaTek specific code.
>
> To be honest, it seems strange that DRM is being used as the allocator
> for buffers which will mostly be used by codec hardware which is not
> mentioned here. I can understand that minigbm and gbm_gralloc make
> this easy to implement, but it's not really right to add this all to
> mtk-drm just to support some codec features.
The buffers allocated are used as the output for secure video decoding
and then rendering as well. So they aren't just used by the codec HW,
they're also used for display on the overlay plane.

And I'm the user of all the secure video path patches Mediatek has
been posting, this is for secure video playback on ChromeOS ARM
devices. (just mentioning so you know my context in this all)
>
> NXP posted a patchset a while ago to add secure-memory support to
> dma-heaps[0]. This would be much cleaner (e.g. avoiding strcmp on
> allocating name, avoiding mtk-drm being a render node when it can't
> render) I think, and also allow common secure-path semantics between
> different vendors.
>
Yes, I saw that now. I agree that having a common secure-path solution
is preferable. But the two issues you mention with this patchset
aren't directly related to the dma-buf heap implementation I think.

The ugly strcmp can be removed from this patchset...because it doesn't
actually need to check the heap name, it only ever invokes
mtk_drm_gem_create_from_heap for secure memory allocations...so that
should just be renamed mtk_drm_gem_create_from_secure_heap. The RENDER
flag can also be removed. IIUC, that's an artifact of how ChromeOS is
doing the allocations and that it's performing it on a render node.
That can be removed from this patchset and we can address that problem
on the ChromeOS side instead.

Going back to the NXP implementation...the main difference between
that one and what Mediatek is proposing (aside from all their vendor
specific naming of things) is that the NXP patchset does all the
allocation in the kernel itself and the kernel is handing out physical
addresses from the reserved range w/ no virtual address mapping. I
think that would mean you have to always allocate contiguous blocks,
which would be prone to fragmentation.  In the Mediatek
implementation, they are doing the allocations from the heap in the
TEE, so they can deal with physical memory fragmentation through
virtual addresses since they can do SG lists to allocate from
fragmented memory in the TEE.




> Having common secure-path semantics between different vendors would be
> very helpful, because the first question when we add new uAPI is
> 'where is the open-source userspace?'. If there is at least a common
> interface through e.g. dma-heaps, then we could have some standard
> cross-vendor userspace code which would work well with the standard
> interface.
>
Thanks for your feedback, I definitely want to work to get this to
something more usable by a wider range.

> Cheers,
> Daniel
>
> [0]: https://lore.kernel.org/lkml/20220805135330.970-2-olivier.masse@nxp.=
com/
