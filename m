Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EF1AC0BAB
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B74E10E2A8;
	Thu, 22 May 2025 12:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ijfQgpbG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D5510E2A8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:36:52 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-3fa6c54cc1aso5302143b6e.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747917411; x=1748522211; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E/nM7ohI+OhW9Q09hMJxUkW/sk0nV2AyhKtXe2v8eEc=;
 b=ijfQgpbGXOvYinVEYeszoUldD9pfxkMpJLTLGzQgluWH2BzQDS7/toCYF7QYj+06oK
 nYojGhgo4kyotsBGKdsJSyuVTljXywrWyw5pexiZyyZJtwI3zRXdrEFfZufsHXBfHnSS
 MtuhyQQNi9OaUt9dKJRJduI2JhtVFr/4TSmXjCc2IyHWbYZa8IIFsnmZYGRGtj4KhL7I
 vrorRjvUyO4RdbvNHzpu2CvMYC+AB+feBs+zEbonuCjV016H4B7fLu7Tn/YPmfER//FZ
 MN+NFJ4Z/zkAdhmEo964yJJrBcVNX7fCOjEts8q9HD9t0Vf9A9pkQBaliPYwqXaKG4rB
 1AHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747917411; x=1748522211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E/nM7ohI+OhW9Q09hMJxUkW/sk0nV2AyhKtXe2v8eEc=;
 b=K46XFECHTG5doQnvUFozUf5jjEV+WAk0FBzGhXj9NwUAMr9/QHFcC8jjbkUIqut1m9
 0nky/mo3LmryXkJmpIo1gl4RgtG4782rdiFFwgPIh9h3S3VvBpTPS7F/+YRXtto16URs
 1IlB80FcVQxX+qhg8cqJ+Br9MIHV9jrNy0mfJE1u6D5c+KmjBvU8lDgT0P28ZNXVkut8
 UKh04k8XAfRZBY87D+bzRBpMSpff67aD+TSTpULYmMAm4sRGipJC+riPwKO2rmKtLQFQ
 Go7vAOb9sl/fiGsnp4qPXlcpllEgbMpDB7qKwJ5MtyK3kTRR7W+8LIiANccf/NCoKe0k
 i1bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNMsB9+efff2yGBdSCLwSRXpK9jpOieS8zCFmPhZWIueahBENDWDh1VwzK1qS9lA3B5p7E9wOE/AU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO60nUV0hV0Ts+FmIpIWMSdg0Ut7CF9OMo+oH6m5H5hGjuyppS
 HjIXL8fPT+p1bTPX/pFc+WN9M9YexcxYkR4tRShDLwQG6Qho3/cTinwlpXY3KMqSF98zUjXfjtU
 w7vKycPSvCcNRjUFHB2OppvUosm95VCbEhgsa5rhihw==
X-Gm-Gg: ASbGncvLarh4o3qJnX/lxpTmKXAKTja5qGU0yyo/4ojHyoeuAVaB2DBlPflwCbP0S1e
 DbrHovUyg6WszR+LSVCayEVw3BILtbfgbEADxH94gBMMMsxYHZqCrj2C4mCRse2DoIKDeOr1HOQ
 hlXT+EHupFi9L8sV/rtPzBkZsPFJl7HlbnCw==
X-Google-Smtp-Source: AGHT+IFaxfBHByqapVV2RXkEPTMYtDPJFaizTF3QtPLs+N+jP8G9GyXQ9nHLQfE3byrCa1MQmfMacM+snhhkwuWXSyE=
X-Received: by 2002:a05:6808:338a:b0:3f6:a9d4:b7e4 with SMTP id
 5614622812f47-404d86f3f18mr17232381b6e.20.1747917411552; Thu, 22 May 2025
 05:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-3-jens.wiklander@linaro.org>
 <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
 <CAHUa44Ec0+GPoDkcEG+Vg9_TY1NC=nh3yr0F=ezHMbaeX_A0Bg@mail.gmail.com>
 <1a65f370-2df2-4169-85f9-c45e7c537447@amd.com>
In-Reply-To: <1a65f370-2df2-4169-85f9-c45e7c537447@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 May 2025 14:36:39 +0200
X-Gm-Features: AX0GCFtomK6Kj4MbJdPbWNPCFM5pduAepClCBqfPEiiU97RKWiikvixpOO2yK1w
Message-ID: <CAHUa44Hgu9DnmeGXAoFKkRBt6jFCAb6Mi5zzuuvVVSgsxDZQWA@mail.gmail.com>
Subject: Re: [PATCH v9 2/9] dma-buf: dma-heap: export declared functions
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 22, 2025 at 1:52=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/22/25 08:56, Jens Wiklander wrote:
> > On Wed, May 21, 2025 at 9:13=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/20/25 17:16, Jens Wiklander wrote:
> >>> Export the dma-buf heap functions declared in <linux/dma-heap.h>.
> >>
> >> That is what this patch does and that should be obvious by looking at =
it. You need to explain why you do this.
> >>
> >> Looking at the rest of the series it's most likely ok, but this commit=
 message should really be improved.
> >
> > I'm considering something like this for the next version:
> > Export the dma-buf heap functions declared in <linux/dma-heap.h> to all=
ow
> > them to be used by kernel modules. This will enable drivers like the OP=
-TEE
> > driver, to utilize these interfaces for registering and managing their
> > specific DMA heaps.
>
> Works for me, but it doesn't needs to be so detailed.
>
> Something like this here would be optimal I think:
>
> Export the dma-buf heap functions to allow them to be used by the OP-TEE =
driver.
> The OP-TEE driver wants to register and manage specific secure DMA heaps =
with it.

Great, I'll use that.

Thanks,
Jens

>
> Regards,
> Christian.
>
> >
> > Thanks,
> > Jens
> >
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>>  drivers/dma-buf/dma-heap.c | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> >>> index 3cbe87d4a464..cdddf0e24dce 100644
> >>> --- a/drivers/dma-buf/dma-heap.c
> >>> +++ b/drivers/dma-buf/dma-heap.c
> >>> @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >>>  {
> >>>       return heap->priv;
> >>>  }
> >>> +EXPORT_SYMBOL(dma_heap_get_drvdata);
> >>>
> >>>  /**
> >>>   * dma_heap_get_name - get heap name
> >>> @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *he=
ap)
> >>>  {
> >>>       return heap->name;
> >>>  }
> >>> +EXPORT_SYMBOL(dma_heap_get_name);
> >>>
> >>>  /**
> >>>   * dma_heap_add - adds a heap to dmabuf heaps
> >>> @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> >>>       kfree(heap);
> >>>       return err_ret;
> >>>  }
> >>> +EXPORT_SYMBOL(dma_heap_add);
> >>>
> >>>  static char *dma_heap_devnode(const struct device *dev, umode_t *mod=
e)
> >>>  {
> >>
>
