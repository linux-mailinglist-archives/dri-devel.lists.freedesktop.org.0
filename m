Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFCE6F5CB5
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 19:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF4810E10F;
	Wed,  3 May 2023 17:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839F410E10F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 17:07:46 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50be17a1eceso2696413a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683133664; x=1685725664;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tqgRjKeAlYwdSQZlNcCAAg86aRPeNLHNBU6nas3RZ6E=;
 b=J9QxD/1QXu+7IwdDU81QuY6jTbppC0cHLNpRQwNP60tcx3RCZvR71AQVXfzxRNMfH0
 W0ydkkEltICHurrgEIGDrzhZCvIez22yOFwaexx3D1eAkFC/QPapJStjEYmBDR3lo04c
 cXUxcSAnmC8BgCAfzYTsgSX7OpwOzMhKoQ+/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683133664; x=1685725664;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tqgRjKeAlYwdSQZlNcCAAg86aRPeNLHNBU6nas3RZ6E=;
 b=ALI+UZ3XORNYSXrdVnCQ+HdQIfK99Xhs4Ta3vV1c10FYaCgvyXV9cZWKDd8qR4TJZ8
 vslX17+0XSngvCCI4Q89fXNR8MPvxYo9KvmBYU57WR+j6a36U1pQlYTj6Rq/eCGpt5ji
 U/8tRy9nNak/fy4/jtBybjjrrCckoB8TfgO2QPrXparG+UejEy9M00awL9NmZuAMArhO
 LJA/ZpiuWM5OaH8+lM3PkI8yEkljk5xh9y0TXili+dWdDhMQ1BFLNm4GoA1WM44udoZg
 5cE1rWE5q/gSZBU9aWYMPBFwpzgxFeqJvJ91m1CQbs7OfLBCeWN9exb/F2px5fPOeTPI
 ic1g==
X-Gm-Message-State: AC+VfDzx9+5FcOXu1uWHXB0Ua/hAFQ4wRkAt8FC1S6hvi5rj4+PGvvYu
 MOsyYRP3P6UkBSe5B1WByhvcZdaC2R8gfMkz9Ck=
X-Google-Smtp-Source: ACHHUZ7ThpkhvTw3BZr4GoWM/E+VWswAEvNuULNZrcS07iOA1E2oA7HSwHnQ/b5N+ISgUEHqh1NAIg==
X-Received: by 2002:a17:907:94cb:b0:95f:a88d:2e55 with SMTP id
 dn11-20020a17090794cb00b0095fa88d2e55mr4396157ejc.3.1683133664415; 
 Wed, 03 May 2023 10:07:44 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 x19-20020a1709065ad300b0095381e27d13sm17271344ejs.184.2023.05.03.10.07.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 10:07:43 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-50bf7bb76d0so5067a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 10:07:43 -0700 (PDT)
X-Received: by 2002:a05:6402:2b90:b0:50a:20bf:d92d with SMTP id
 fj16-20020a0564022b9000b0050a20bfd92dmr83038edb.5.1683133663353; Wed, 03 May
 2023 10:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
In-Reply-To: <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 3 May 2023 10:07:31 -0700
X-Gmail-Original-Message-ID: <CAAfnVBnrUotph4TYJVu9Bohqv3m80t90V34TNhh-Tspxwsj-ZQ@mail.gmail.com>
Message-ID: <CAAfnVBnrUotph4TYJVu9Bohqv3m80t90V34TNhh-Tspxwsj-ZQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: multipart/alternative; boundary="0000000000001d933005facd18d1"
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@redhat.com>, kernel@collabora.com,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000001d933005facd18d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 1, 2023 at 8:38=E2=80=AFAM Dmitry Osipenko <
dmitry.osipenko@collabora.com> wrote:

> On 4/16/23 14:52, Dmitry Osipenko wrote:
> > We have multiple Vulkan context types that are awaiting for the additio=
n
> > of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:
> >
> >  1. Venus context
> >  2. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgpu)
> >
> > Mesa core supports DRM sync object UAPI, providing Vulkan drivers with =
a
> > generic fencing implementation that we want to utilize.
> >
> > This patch adds initial sync objects support. It creates fundament for =
a
> > further fencing improvements. Later on we will want to extend the
> VirtIO-GPU
> > fencing API with passing fence IDs to host for waiting, it will be a ne=
w
> > additional VirtIO-GPU IOCTL and more. Today we have several VirtIO-GPU
> context
> > drivers in works that require VirtIO-GPU to support sync objects UAPI.
> >
> > The patch is heavily inspired by the sync object UAPI implementation of
> the
> > MSM driver.
>
> Gerd, do you have any objections to merging this series?
>
> We have AMDGPU [1] and Intel [2] native context WIP drivers depending on
> the sync object support. It is the only part missing from kernel today
> that is wanted by the native context drivers. Otherwise, there are few
> other things in Qemu and virglrenderer left to sort out.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21658
> [2]
> https://gitlab.freedesktop.org/digetx/mesa/-/commits/native-context-iris


I'm not saying this change isn't good, just it's probably possible to
implement the native contexts (even up to even VK1.2) without it.  But this
patch series may be the most ergonomic way to do it, given how Mesa is
designed.  But you probably want one of Mesa MRs reviewed first before
merging (I added a comment on the amdgpu change) and that is a requirement
[a].

[a] "The userspace side must be fully reviewed and tested to the standards
of that user space project. For e.g. mesa this means piglit testcases and
review on the mailing list. This is again to ensure that the new interface
actually gets the job done." -- from the requirements


>
>
> --
> Best regards,
> Dmitry
>
>

--0000000000001d933005facd18d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 1, 2023 at 8:38=E2=80=AFA=
M Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com">dmit=
ry.osipenko@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 4/16/23 14:52, Dmitry Osipenko wrote:<br>
&gt; We have multiple Vulkan context types that are awaiting for the additi=
on<br>
&gt; of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:<b=
r>
&gt; <br>
&gt;=C2=A0 1. Venus context<br>
&gt;=C2=A0 2. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgp=
u)<br>
&gt; <br>
&gt; Mesa core supports DRM sync object UAPI, providing Vulkan drivers with=
 a<br>
&gt; generic fencing implementation that we want to utilize.<br>
&gt; <br>
&gt; This patch adds initial sync objects support. It creates fundament for=
 a<br>
&gt; further fencing improvements. Later on we will want to extend the Virt=
IO-GPU<br>
&gt; fencing API with passing fence IDs to host for waiting, it will be a n=
ew<br>
&gt; additional VirtIO-GPU IOCTL and more. Today we have several VirtIO-GPU=
 context<br>
&gt; drivers in works that require VirtIO-GPU to support sync objects UAPI.=
<br>
&gt; <br>
&gt; The patch is heavily inspired by the sync object UAPI implementation o=
f the<br>
&gt; MSM driver.<br>
<br>
Gerd, do you have any objections to merging this series?<br>
<br>
We have AMDGPU [1] and Intel [2] native context WIP drivers depending on<br=
>
the sync object support. It is the only part missing from kernel today<br>
that is wanted by the native context drivers. Otherwise, there are few<br>
other things in Qemu and virglrenderer left to sort out.<br>
<br>
[1] <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21=
658" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/me=
sa/mesa/-/merge_requests/21658</a><br>
[2] <a href=3D"https://gitlab.freedesktop.org/digetx/mesa/-/commits/native-=
context-iris" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/digetx/mesa/-/commits/native-context-iris</a></blockquote><div><br><=
/div><div>I&#39;m not saying this change isn&#39;t good, just it&#39;s prob=
ably possible to implement the native contexts (even up to even VK1.2) with=
out it.=C2=A0 But this patch series may be the most ergonomic way to do it,=
 given how Mesa is designed.=C2=A0 But you probably want one of Mesa MRs re=
viewed first before merging (I added a comment on the amdgpu change) and th=
at is a requirement [a].=C2=A0</div><div><br></div><div>[a] &quot;The users=
pace side must be fully reviewed and tested to the standards of that user s=
pace project. For e.g. mesa this means piglit testcases and review on the m=
ailing list. This is again to ensure that the new interface actually gets t=
he job done.&quot; -- from the requirements</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
<br>
-- <br>
Best regards,<br>
Dmitry<br>
<br>
</blockquote></div></div>

--0000000000001d933005facd18d1--
