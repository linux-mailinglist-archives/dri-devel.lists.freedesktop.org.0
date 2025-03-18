Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C846A66533
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 02:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00A910E308;
	Tue, 18 Mar 2025 01:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hz3mxBV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9B210E0E7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 01:38:04 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso361407366b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 18:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742261882; x=1742866682;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K/ZV1obHJJvpOeyrWEcG+XXBltinJU3zmrRmxtgKdOs=;
 b=hz3mxBV1Si42/m992hRXqs2ywzEQdwks5xbPKHV4iG6BIWxXf+SvgxwcMT4GPCk4gm
 pQLJ3TMX7EplUbuUzmScRblv42K0PXKL5KoNhA1WY5gL9ybVEGgJFz41J5h2W12brWWk
 oXQRaQE8AG53iRbvVC6M/N25UqGOXSnnLme0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742261882; x=1742866682;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/ZV1obHJJvpOeyrWEcG+XXBltinJU3zmrRmxtgKdOs=;
 b=bJFbT4tdGZ0nPsx+a1aHAWWbIA8BhkRc/xvEzDrs6vWG4i5fALNM1xQLwlMupGmAwk
 aZq5b7V+KfpnKcbFxmvRdSTUTilyMBq1/EBicOCz/ePOy6SPNz+nT3fCxYI38W6q5cpT
 /U69SZnC0OsOmEghdeNcS33QPv6y1jF+wXF8BhNKpMZ82lKq/qCFybwzXuwsPPbqZyTC
 y0Wxc5HG/vvnBRTMwcRlf8Gqo/llZVKkAUhSvneNx3cvQsSJ42jDoL3bElUJ8L0ESEdd
 3SK6E75y6p1UZpncfhuSb05Rkix5/u0EzQk4EsWGO7fm7Cop6EO5t2tGPCj9qWGRLR2Y
 +Q0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGjXeteNztjel//YtvZfuOB1/igD2Gu1dDDWUdzob/erPfoneLlC46wcnHhP8LJUtUCqghjPJGn7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkEwbWcjqJp2FydGNDaiIoVSy89QioZsgmX078oW8cAXPq9fcw
 hd3EpifsqqMOCwzgpNMmWKb7o5mInyAsiINCfVCqBH6Jb8uxoyfGShXMs0LYcU985548YFsQfw4
 =
X-Gm-Gg: ASbGncuabPNLzjT7VA7acM6MjRxoKR1yrL33RwEBj15awmsLkMsvaFtQs0hPQ5gYvme
 aJhT6UIp8sqUBtneLoF0uWFJ/RBmJ8GNH8+EKuDgGaSgXjnx1K32oV6Pvt9HW4lTTnkHmLR3sua
 FHfEfWyjAXAl5e6rbEPx34opYXFzqBmRQP6DnzLM0yAw9nGIPm/GQ38TnuREUq7UFZwUFLg2u/T
 tIp81Xa8BaloDJYeRQhLuGQLaCR4GtzshNB6qrQrTqFdDF2jEKhYRaHrlD2aRusf49leSBdBkVK
 GIee15cQ+gCifZ5pDIf8qnEAhgxyqlR/S+u6/LU5tCtVO7GeYRMXShZUu5fz5DHTKrjHFPGTw8h
 39qgYtfSb+wAtfYHQZrl4Rv8B1fY=
X-Google-Smtp-Source: AGHT+IG5fZDWiE6WjSa2+mW2bOIrhIrIokY7LJutGobfnG7LJvaxUIZDKPn5nJjk5ZS0GMyV/+srvQ==
X-Received: by 2002:a17:906:c10d:b0:abf:6f87:670e with SMTP id
 a640c23a62f3a-ac3301d8eebmr1582335466b.22.1742261882307; 
 Mon, 17 Mar 2025 18:38:02 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314aa6209sm747387266b.184.2025.03.17.18.37.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 18:37:55 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5dbfc122b82so3917a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 18:37:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU8oJ3rnJC330Q9DFWx+d7aULMuyruoTb28H7m3MKGfMi3gL5wUYxme4uL6cUcBvpebsHev5dcp9Aw=@lists.freedesktop.org
X-Received: by 2002:a50:9f8a:0:b0:5e0:8003:67a7 with SMTP id
 4fb4d7f45d1cf-5eb243d98a5mr29655a12.0.1742261874484; Mon, 17 Mar 2025
 18:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250228053650.393646-1-honglei1.huang@amd.com>
 <20250228053650.393646-2-honglei1.huang@amd.com>
 <cd9f85a5-0d99-4007-bba2-d792ac9d84da@gmail.com>
 <c2d1334f-6f5a-493f-bbf0-3e92789f128a@amd.com>
In-Reply-To: <c2d1334f-6f5a-493f-bbf0-3e92789f128a@amd.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 17 Mar 2025 18:37:42 -0700
X-Gmail-Original-Message-ID: <CAAfnVBk-JJKxJXAstwmgL4=EM15RHfVm4NQST+p3nE4xi2220g@mail.gmail.com>
X-Gm-Features: AQ5f1JpzVuL8DAkJ3h7mbIcow7lyWiC_9wuwpbNNFvjZi5QGZZAWjpvYu_VbRl0
Message-ID: <CAAfnVBk-JJKxJXAstwmgL4=EM15RHfVm4NQST+p3nE4xi2220g@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] virtio-gpu api: add blob userptr resource
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
 David Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: multipart/alternative; boundary="00000000000022cfe2063093f460"
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

--00000000000022cfe2063093f460
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 2:52=E2=80=AFAM Huang, Honglei1 <Honglei1.Huang@amd.=
com>
wrote:

>
> On 2025/3/1 5:21, Demi Marie Obenour wrote:
> > On 2/28/25 12:36 AM, Honglei Huang wrote:
> >> From: Honglei Huang <Honglei1.Huang@amd.com>
> >>
> >> Add a new resource for blob resource, called userptr, used for let
> >> host access guest user space memory, to acquire buffer based userptr
> >> feature in virtio GPU.
> >>
> >> - The capset VIRTIO_GPU_CAPSET_HSAKMT used for context init,
> >> in this series patches only HSAKMT context can use the userptr
> >> feature. HSAKMT is a GPU compute library in HSA stack, like
> >> the role libdrm in mesa stack.
> >
> > Userptr should not be limited to HSMKMT contexts.  Userptr can
> > accelerate shm buffers by avoiding a copy from guest to host, and
> > it can be implemented using grant tables on Xen.
>
> Yes, I totally agree userptr can accelerate shm buffers, but I currently
> don't know if there are any other projects working on similar features,
> or if maintainers have any opinions or better ways to implement them, so
> I temporarily limit this feature to HSAKMT context only.
>
> I am waiting for everyone's opinions, please provide your thoughts.
>

I wonder if you can emulate userptr using udmabuf on the host-side?

Essentially for the guest, it'll be a malloc'ed memory, which means a guest
sg list.  We can convert the guest sg-list to udmabuf using well-known
mechanisms on the host side.  I hope amdkfd can operate on dma-bufs too?

I do such a feature that would have a more generic utility outside of
HSAKMT contexts and not rely on Xen-specific grant tables  ...
checkout VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE in crosvm for an
example.




>
> Regards,
> Honglei
>

--00000000000022cfe2063093f460
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 6, =
2025 at 2:52=E2=80=AFAM Huang, Honglei1 &lt;<a href=3D"mailto:Honglei1.Huan=
g@amd.com">Honglei1.Huang@amd.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
On 2025/3/1 5:21, Demi Marie Obenour wrote:<br>
&gt; On 2/28/25 12:36 AM, Honglei Huang wrote:<br>
&gt;&gt; From: Honglei Huang &lt;<a href=3D"mailto:Honglei1.Huang@amd.com" =
target=3D"_blank">Honglei1.Huang@amd.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Add a new resource for blob resource, called userptr, used for let=
<br>
&gt;&gt; host access guest user space memory, to acquire buffer based userp=
tr<br>
&gt;&gt; feature in virtio GPU.<br>
&gt;&gt;<br>
&gt;&gt; - The capset VIRTIO_GPU_CAPSET_HSAKMT used for context init,<br>
&gt;&gt; in this series patches only HSAKMT context can use the userptr<br>
&gt;&gt; feature. HSAKMT is a GPU compute library in HSA stack, like<br>
&gt;&gt; the role libdrm in mesa stack.<br>
&gt; <br>
&gt; Userptr should not be limited to HSMKMT contexts.=C2=A0 Userptr can<br=
>
&gt; accelerate shm buffers by avoiding a copy from guest to host, and<br>
&gt; it can be implemented using grant tables on Xen.<br>
<br>
Yes, I totally agree userptr can accelerate shm buffers, but I currently<br=
>
don&#39;t know if there are any other projects working on similar features,=
<br>
or if maintainers have any opinions or better ways to implement them, so<br=
>
I temporarily limit this feature to HSAKMT context only.<br>
<br>
I am waiting for everyone&#39;s opinions, please provide your thoughts.<br>=
</blockquote><div><br></div><div>I wonder if you can emulate userptr using =
udmabuf on the host-side?</div><div><br></div><div>Essentially for the gues=
t, it&#39;ll be a malloc&#39;ed memory, which means a guest sg list.=C2=A0 =
We can convert the guest sg-list to udmabuf using well-known mechanisms on =
the host side.=C2=A0 I hope amdkfd can operate on dma-bufs too?</div><div><=
br></div><div>I do such a feature that would have a more generic utility ou=
tside of HSAKMT contexts and not rely on Xen-specific grant tables=C2=A0 ..=
. checkout=C2=A0VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE in crosvm for an e=
xample.=C2=A0 =C2=A0</div><div><br></div><div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Honglei<br>
</blockquote></div></div>

--00000000000022cfe2063093f460--
