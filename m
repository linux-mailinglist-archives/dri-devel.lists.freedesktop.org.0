Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AB9824960
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 21:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E0B10E521;
	Thu,  4 Jan 2024 20:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEF010E521
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 20:05:51 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d3ea8d0f9dso30255ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 12:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1704398751; x=1705003551;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZvEetwkb9xaGP1xb5l25SZewPP7nYFLZIpeTOK182Ek=;
 b=AkyMFw/87rST3m/er1JHU9RQLoW6hRXX3mdcog+9/zQW0bIG6WmYGI6syFvgg/Uytc
 m5hMJ6+VebidSUC8IUjnI+B0juktCuhz+lVbICbZTr/XHc8/3hrsgoCemDJjmYgc/R6Z
 bdota8ITWphapa186SPPv0rkb+oy87oKolKgywf/pymjU0FYyxkc7AbudLBgFAX2tDDP
 jKWRQjEY+ZssSLxRBbHmzAvaczNNvi/3pm0BiZhxHN1h26tXa/5MoO8vPoMCIa9UfF9P
 LXBguMvSRZlohNPjfxa6IEGEyUD/qkpeoIloEQeQKSKdhz/Fb3bogUjyvpHMbP1LzZTj
 IpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704398751; x=1705003551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZvEetwkb9xaGP1xb5l25SZewPP7nYFLZIpeTOK182Ek=;
 b=iJ4icIz1YQkqwLksxFi5WcjF7NQPnE+MwnM64B6vxAhdMTrCyd6rN1MPJVIeZk9S36
 5Xc0H4Nl33gGDLG8NzW6YQWxzgW8Xi83qo5KLNYMpOC8lw2ZJvCswfo7YC0ALVE6JSqV
 2Vyf6+R3BeIy7KWWwqbyEN8tGX/dzfhVM4D0uJG4oGJzKdiX2hcCGsvHBIG83ClaI0G8
 gnH/Ti6cGT+bI8c623P2/VDjqd9lcIAvaLhyZE4Dux+9/AU1+xVVhIYiC+/GnRugraYP
 Xd6If6aVqFWvBmeObwsx4LYE6I3ln0S2QGcQ24jSXsv7uLEmMeM/xkvvdvvxMsUAd1MO
 a+Dw==
X-Gm-Message-State: AOJu0Yzedw30zzjvM0+E6po339Ztb7LbCfBEB0ES5/3hqqlevOBl3eR4
 xuvRILbNn47mqA9ElIEOWe4IyRZnHXjRafusJuAsFe5329E=
X-Google-Smtp-Source: AGHT+IFtpK9YJeU2jGd3Bpf25IdYM4Caale+wmgEjoLqzqnOsTKnfaX9VNsHJOZHlAHU0P2aZXIT9K2U0qLn/rFYSYA=
X-Received: by 2002:a17:902:fa50:b0:1d4:69a6:8a9d with SMTP id
 lb16-20020a170902fa5000b001d469a68a9dmr33072plb.19.1704398750899; Thu, 04 Jan
 2024 12:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
 <20231206081538.17056-5-yunfei.dong@mediatek.com>
 <ce2110bf-a16a-45ae-979b-7e41be2896cd@xs4all.nl>
In-Reply-To: <ce2110bf-a16a-45ae-979b-7e41be2896cd@xs4all.nl>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Thu, 4 Jan 2024 12:05:39 -0800
Message-ID: <CA+ddPcM6nz0ufF5NXUq7E_vF6HnFKrEEag5iUDAknT6=hWTCNQ@mail.gmail.com>
Subject: Re: [PATCH v3,04/21] v4l: add documentation for secure memory flag
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
Cc: Steve Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, devicetree@vger.kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "T . J . Mercier" <tjmercier@google.com>, Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nathan Hebert <nhebert@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 3:05=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 06/12/2023 09:15, Yunfei Dong wrote:
> > From: Jeffrey Kardatzke <jkardatzke@google.com>
> >
> > Adds documentation for V4L2_MEMORY_FLAG_SECURE.
> >
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  Documentation/userspace-api/media/v4l/buffer.rst | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documen=
tation/userspace-api/media/v4l/buffer.rst
> > index 52bbee81c080..a5a7d1c72d53 100644
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -696,7 +696,7 @@ enum v4l2_memory
> >
> >  .. _memory-flags:
> >
> > -Memory Consistency Flags
> > +Memory Flags
> >  ------------------------
> >
> >  .. raw:: latex
> > @@ -728,6 +728,12 @@ Memory Consistency Flags
> >       only if the buffer is used for :ref:`memory mapping <mmap>` I/O a=
nd the
> >       queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
> >       <V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> > +    * .. _`V4L2-MEMORY-FLAG-SECURE`:
> > +
> > +      - ``V4L2_MEMORY_FLAG_SECURE``
> > +      - 0x00000002
> > +      - DMA bufs passed into the queue will be validated to ensure the=
y were
> > +     allocated from a secure dma-heap.
>
> Hmm, that needs a bit more work. How about:
>
> - The queued buffers are expected to be in secure memory. If not, an erro=
r will be
>   returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``. Typic=
ally
>   secure buffers are allocated using a secure dma-heap. This flag can onl=
y be
>   specified if the ``V4L2_BUF_CAP_SUPPORTS_SECURE_MEM`` is set.
>

Thanks Hans. Yunfei, can you integrate this change into the patch please?

> In addition, the title of this table is currently "Memory Consistency Fla=
gs": that
> should be renamed to "Memory Flags".

Hans, the patch is already renaming the table as you suggested. :)
(unless there's some other spot I'm missing)
>
> Regards,
>
>         Hans
>
> >
> >  .. raw:: latex
> >
>
