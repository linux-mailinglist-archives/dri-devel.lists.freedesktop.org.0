Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6709826CFDB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E426E040;
	Thu, 17 Sep 2020 00:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473776E040
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:16:47 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k25so459462ljk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w5L98R4HJ8xELc3OrvyNwKtYOUMiE2mD8Ho/NQcXW74=;
 b=BD/CUp8lYrdKAHaKeAGUsQAgG4BLQQnChWbR5KHXHkYBf22Z8my3hBba5FAVGwKK42
 ZO5bgiKCdiUgtHo0uNAoWgJnnCUf9SCzFQK88b26dwaln1LNBQue5HgpB2D2k8OW/ecI
 PNvsjgeueP3lP2ye1imwIzE8+wpWYPhYJhNLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w5L98R4HJ8xELc3OrvyNwKtYOUMiE2mD8Ho/NQcXW74=;
 b=oxWb4DtPx5vKA1OsZ3cwzH1Mt4UM1gqssg8QD6vzyUfyRZsHTrpucQtFK8dxzm05Ps
 DWsTUaf95SHKJy0qGj34tJJryK49XrDh8KbJYk8mPML1EKvJ/cCf2GxuoN99cE6vHGkI
 eOQeuSerEdQeXLUbn0Xgz/8snTu+VcaHy0ab28itJLwS77RGF10Au+hJm1S2RUG7itjl
 //G6vrWlw5YNsll5zXBF5FF9i2E9RywmtYg0yuHKAXwR2kribhKaY2ElVh65qUBCHFzU
 2r3tL6Ovknxd+3/fcYsJ/KxZh9mqplVp6QKCeStXH/ma3Be2dwZ1eEHvJWtKVUP19GtW
 8dTg==
X-Gm-Message-State: AOAM532HUrigTeug5fOY7FLS+aCvc5I/XX9rzB+AygOvbyLDjwLOqVeu
 R69hgProWcQ/IMCUuABYHyL9VNAF2LWB9g==
X-Google-Smtp-Source: ABdhPJztihsylq9Ach7IhgOBLZRyWfG8+o30Gg0NnWwMZQF3ncXcFOrWnUldLf0NXcy2wtuN6clO8Q==
X-Received: by 2002:a2e:7213:: with SMTP id n19mr8961107ljc.326.1600301805286; 
 Wed, 16 Sep 2020 17:16:45 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id g11sm4888749lfh.253.2020.09.16.17.16.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 17:16:44 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id a15so451971ljk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:16:44 -0700 (PDT)
X-Received: by 2002:a2e:6f0d:: with SMTP id k13mr8594773ljc.250.1600301804199; 
 Wed, 16 Sep 2020 17:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-10-gurchetansingh@chromium.org>
 <20200909065536.c5rfbmd2rlpwrpn6@sirius.home.kraxel.org>
In-Reply-To: <20200909065536.c5rfbmd2rlpwrpn6@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 16 Sep 2020 17:16:31 -0700
X-Gmail-Original-Message-ID: <CAAfnVBmmwUf8GAaG2qDiqtP-0JPu-wA+D82x=rHUCfg7QU7eng@mail.gmail.com>
Message-ID: <CAAfnVBmmwUf8GAaG2qDiqtP-0JPu-wA+D82x=rHUCfg7QU7eng@mail.gmail.com>
Subject: Re: [PATCH v2 09/23] virtio-gpu api: blob resources
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: virtio-dev@lists.oasis-open.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1981493774=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1981493774==
Content-Type: multipart/alternative; boundary="000000000000930ac705af774cc8"

--000000000000930ac705af774cc8
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 8, 2020 at 11:55 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > @@ -100,7 +102,7 @@ struct drm_virtgpu_resource_info {
> >       __u32 bo_handle;
> >       __u32 res_handle;
> >       __u32 size;
> > -     __u32 stride;
> > +     __u32 blob_mem;
> >  };
>
> Huh?  This is not in the virtio spec update proposed.
>
> >  struct drm_virtgpu_3d_box {
> > @@ -117,6 +119,8 @@ struct drm_virtgpu_3d_transfer_to_host {
> >       struct drm_virtgpu_3d_box box;
> >       __u32 level;
> >       __u32 offset;
> > +     __u32 stride;
> > +     __u32 layer_stride;
> >  };
>
> Same here.
>
> >  struct drm_virtgpu_3d_transfer_from_host {
> > @@ -124,6 +128,8 @@ struct drm_virtgpu_3d_transfer_from_host {
> >       struct drm_virtgpu_3d_box box;
> >       __u32 level;
> >       __u32 offset;
> > +     __u32 stride;
> > +     __u32 layer_stride;
> >  };


> And here.
>

Separated out the virtio and DRM api changes, as per your recommendation.
The virtio spec changes should match v6 of the proposed spec.  Explanations
for these specific DRM changes here are in patch 16 & patch 17 of the v3
implementation.


> take care,
>   Gerd
>
> PS: cherry-picked patches 1-3 into drm-misc-next.
>
>

--000000000000930ac705af774cc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 8, 2020 at 11:55 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 H=
i,<br>
<br>
&gt; @@ -100,7 +102,7 @@ struct drm_virtgpu_resource_info {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 bo_handle;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 res_handle;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 size;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0__u32 stride;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u32 blob_mem;<br>
&gt;=C2=A0 };<br>
<br>
Huh?=C2=A0 This is not in the virtio spec update proposed.<br>
<br>
&gt;=C2=A0 struct drm_virtgpu_3d_box {<br>
&gt; @@ -117,6 +119,8 @@ struct drm_virtgpu_3d_transfer_to_host {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_3d_box box;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 level;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u32 stride;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u32 layer_stride;<br>
&gt;=C2=A0 };<br>
<br>
Same here.<br>
<br>
&gt;=C2=A0 struct drm_virtgpu_3d_transfer_from_host {<br>
&gt; @@ -124,6 +128,8 @@ struct drm_virtgpu_3d_transfer_from_host {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_3d_box box;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 level;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u32 stride;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u32 layer_stride;<br>
&gt;=C2=A0 };=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
And here.<br></blockquote><div><br></div><div>Separated out the virtio and =
DRM api changes, as per your recommendation.=C2=A0 The virtio spec changes =
should match v6 of the proposed spec.=C2=A0 Explanations for these specific=
 DRM changes here are in patch 16 &amp; patch 17 of the v3 implementation.=
=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
take care,<br>
=C2=A0 Gerd<br>
<br>
PS: cherry-picked patches 1-3 into drm-misc-next.<br>
<br>
</blockquote></div></div>

--000000000000930ac705af774cc8--

--===============1981493774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1981493774==--
