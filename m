Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9783BD813
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 16:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D266E4C7;
	Tue,  6 Jul 2021 14:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F766E4C7;
 Tue,  6 Jul 2021 14:00:20 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 e85-20020a4a55580000b02902579a1a1393so1474446oob.6; 
 Tue, 06 Jul 2021 07:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/GnHAbokkse9CugRmFElMjvp9JZ+A9ohrcEc2jPZiTg=;
 b=DEqIryYBGcUed7HgCEbSFEgyk8OiDFQ+u0MnF83z3PZiCHimhlFeviHMiKA2rRt+TP
 5VW2+PwXS8YY+dKR/DgB+822gfXhAo0g6EvyEOUeuYyJR2fGAlqo4FoIhqg+BEi0R84M
 4WBHBdTt1G0/Fo8RuDV5zN/IHwE1wRtVYYO4pDKGW2oV1wycNjvnYEOCUddjGI45Ew2k
 SnOK7DBQWWfxh17ZEktSBnVyfRwKsDdETfRLqo8zXs+lOriBTQnG/QbBfbAuid0HelBY
 Ao6Bd5hJm4x3tacccykg3HVGb5vpJu/cm7UppCkfhEdPptHbNRArIbaFzquX3rs49jVZ
 NmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/GnHAbokkse9CugRmFElMjvp9JZ+A9ohrcEc2jPZiTg=;
 b=BQwXsVG5/50RpnDeTsIvKkPgpBnY9kcmSTt451xgqGuRtNzsA2xWJ1bFTB0teG5NkB
 H9cIM3Ma0s9BD+hoTNOpJyDRdKknr/IGhqCG5lXvpFDMzujyWNY4PWXeI1WqvFrw0GAw
 h9FgMB0QZ9wviEDj3Cck9PVZQdN15ueVdIMekPpGS3DbWJ8FDnWShJYkldeFf1KpQTf9
 oaQUKIClYll8pjn9/prLSJ9d7FqE0sXMOO9j/nethVQM2Z6a9olDZJEfiafxLw4id9rd
 MmUAG5S2FyeLyQzj5MuZMH4UDGqyjqgokTZuJ92o9zqfPPZoMitz+fa2s64jVQO7PbW6
 aP8g==
X-Gm-Message-State: AOAM531faMscAFrau3qul6bLZPZ5IUHgiqMTW4rzhFkG4lt7LHed8DTT
 U+ueWoBh04jWM5d4KYeKmUfdLrgDX5JSL/hdHGY=
X-Google-Smtp-Source: ABdhPJwWDwMyFrj8stYkzuIgh4nFkXxkm3YhsPqNE4ZGGZlUxsiMG3CmLDhKuCFmoUR1JeZW5g5BMjYlOoqOwK4otGg=
X-Received: by 2002:a4a:dc09:: with SMTP id p9mr14242920oov.27.1625580019894; 
 Tue, 06 Jul 2021 07:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <20210705130314.11519-3-ogabbay@kernel.org>
 <20210705165226.GJ4604@ziepe.ca>
 <CAFCwf100mkROMw9+2LgW7d3jKnaeZ4nmfWm7HtXuUE7NF4B8pg@mail.gmail.com>
 <20210706135451.GM4604@ziepe.ca>
In-Reply-To: <20210706135451.GM4604@ziepe.ca>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 6 Jul 2021 17:00:07 +0300
Message-ID: <CAFCwf11p_uNKLV7SgjmShVgoRuSCax4DQmKZEdydK2SBrH6w8A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] habanalabs: add support for dma-buf exporter
To: Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: multipart/alternative; boundary="000000000000a3cd9a05c674d7d6"
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
Cc: Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Christoph Hellwig <hch@lst.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tomer Tayar <ttayar@habana.ai>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a3cd9a05c674d7d6
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021, 16:54 Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Tue, Jul 06, 2021 at 12:44:49PM +0300, Oded Gabbay wrote:
>
> > > > +     /* In case we got a large memory area to export, we need to
> divide it
> > > > +      * to smaller areas because each entry in the dmabuf sgt can
> only
> > > > +      * describe unsigned int.
> > > > +      */
> > >
> > > Huh? This is forming a SGL, it should follow the SGL rules which means
> > > you have to fragment based on the dma_get_max_seg_size() of the
> > > importer device.
> > >
> > hmm
> > I don't see anyone in drm checking this value (and using it) when
> > creating the SGL when exporting dmabuf. (e.g.
> > amdgpu_vram_mgr_alloc_sgt)
>
> For dmabuf the only importer is RDMA and it doesn't care, but you
> certainly should not introduce a hardwired constant instead of using
> the correct function.
>
> Jason
>

Got it, will change
Thanks,
Oded

>

--000000000000a3cd9a05c674d7d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jul 6, 2021, 16:54 Jason Gunthorpe &lt;<a href=
=3D"mailto:jgg@ziepe.ca">jgg@ziepe.ca</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Tue, Jul 06, 2021 at 12:44:49PM +0300, Oded Gabbay wro=
te:<br>
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* In case we got a large memory area t=
o export, we need to divide it<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * to smaller areas because each entry =
in the dmabuf sgt can only<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * describe unsigned int.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt;<br>
&gt; &gt; Huh? This is forming a SGL, it should follow the SGL rules which =
means<br>
&gt; &gt; you have to fragment based on the dma_get_max_seg_size() of the<b=
r>
&gt; &gt; importer device.<br>
&gt; &gt;<br>
&gt; hmm<br>
&gt; I don&#39;t see anyone in drm checking this value (and using it) when<=
br>
&gt; creating the SGL when exporting dmabuf. (e.g.<br>
&gt; amdgpu_vram_mgr_alloc_sgt)<br>
<br>
For dmabuf the only importer is RDMA and it doesn&#39;t care, but you<br>
certainly should not introduce a hardwired constant instead of using<br>
the correct function.<br>
<br>
Jason<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Got it, will change</div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=
=3D"auto">Oded=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000a3cd9a05c674d7d6--
