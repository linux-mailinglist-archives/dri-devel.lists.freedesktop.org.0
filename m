Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C5240D048
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 01:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309F06EA7B;
	Wed, 15 Sep 2021 23:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF63E6EA7D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 23:39:17 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id c8so11079066lfi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 16:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aBBQhNKcJ7S9QoxP/HtV281nZhhfVswov2MKIAZ1mSI=;
 b=CnSAd403lCJazW4VjepNqelx5OCdrvYwJ7AmP9/ACc6XjkLmIb69C7EoJnXnzaCeGe
 mJ2MiJMshV9s6fU9xb3iff1aZ+2W6wrLA5SmBFM6TUQogufB91y0E0mg0GhZH1IKPPjL
 v13cW6VBg2UijxBMads5vzRxx3okEjSMprgDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aBBQhNKcJ7S9QoxP/HtV281nZhhfVswov2MKIAZ1mSI=;
 b=ohXmmLDnUbyL48yaeANNEkkOgWsZdGrr1UzfV5RtRkcPPEavdpd0I7cx1iypsmbI42
 wZ9cKR8WhfwZsFB7MVezbWeG+8vVjiUeSFDAUXLOgAeXb1Xj8zN8iCEeZCidm75wWBLH
 3+e0Qt2/0hfIMgAuRWzLeIaQ7RZkFrbEgAR3OVRo7DDHdldYZPymiWCRXbbyc0nQ8WbZ
 L5AsobZCMAy+cR7hkFP1GDng9eFD/pAPj7KC0nq7LkVo1yfcF5GjCUCygdF5Er6eHd9v
 rAtSb5pXDBiZrpEV5vZTsxd4qe29ZYGCqJQ6iL/3HgE7KE+L3Nf70FN25+bueWv0+UYi
 4ENg==
X-Gm-Message-State: AOAM531HA/jft/H0p9aDQ+m5d2Fgtbd/qcYOvF6vKjSqw0zmmh1LPeIF
 TLaRQtqhg/DQT6R3I3Bp3Mw2+d40vTfZzC9J
X-Google-Smtp-Source: ABdhPJxCj+SB7mv8rBzoOlWE+55NAAkhmwxOzQuXs38f4g85p7EgnEJooLcautXgsXK2Op0c5RnZ2g==
X-Received: by 2002:a05:6512:ba2:: with SMTP id
 b34mr1855739lfv.510.1631749155445; 
 Wed, 15 Sep 2021 16:39:15 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id m6sm104234lfh.186.2021.09.15.16.39.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 16:39:14 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id h16so10980322lfk.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 16:39:14 -0700 (PDT)
X-Received: by 2002:a19:6a0b:: with SMTP id u11mr1847172lfu.383.1631749154325; 
 Wed, 15 Sep 2021 16:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210909013717.861-1-gurchetansingh@chromium.org>
 <20210909013717.861-9-gurchetansingh@chromium.org>
 <20210915055350.sgfadzktcl5bngtq@sirius.home.kraxel.org>
In-Reply-To: <20210915055350.sgfadzktcl5bngtq@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 15 Sep 2021 16:39:02 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=z80_cK_Z3Gkk1WXUopkuPiF67QNrD8O8StmijApYqcQ@mail.gmail.com>
Message-ID: <CAAfnVB=z80_cK_Z3Gkk1WXUopkuPiF67QNrD8O8StmijApYqcQ@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v1 08/12] drm/virtio: implement context
 init: stop using drv->context when creating fence
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="000000000000b5153905cc113495"
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

--000000000000b5153905cc113495
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 10:53 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Wed, Sep 08, 2021 at 06:37:13PM -0700, Gurchetan Singh wrote:
> > The plumbing is all here to do this.  Since we always use the
> > default fence context when allocating a fence, this makes no
> > functional difference.
> >
> > We can't process just the largest fence id anymore, since it's
> > it's associated with different timelines.  It's fine for fence_id
> > 260 to signal before 259.  As such, process each fence_id
> > individually.
>
> I guess you need to also update virtio_gpu_fence_event_process()
> then?  It currently has the strict ordering logic baked in ...
>

The update to virtio_gpu_fence_event_process was done as a preparation a
few months back:

https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/virtio/virtgpu_fence.c?id=36549848ed27c22bb2ffd5d1468efc6505b05f97



>
> take care,
>   Gerd
>
>
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
>

--000000000000b5153905cc113495
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 14, 2021 at 10:53 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed,=
 Sep 08, 2021 at 06:37:13PM -0700, Gurchetan Singh wrote:<br>
&gt; The plumbing is all here to do this.=C2=A0 Since we always use the<br>
&gt; default fence context when allocating a fence, this makes no<br>
&gt; functional difference.<br>
&gt; <br>
&gt; We can&#39;t process just the largest fence id anymore, since it&#39;s=
<br>
&gt; it&#39;s associated with different timelines.=C2=A0 It&#39;s fine for =
fence_id<br>
&gt; 260 to signal before 259.=C2=A0 As such, process each fence_id<br>
&gt; individually.<br>
<br>
I guess you need to also update virtio_gpu_fence_event_process()<br>
then?=C2=A0 It currently has the strict ordering logic baked in ...<br></bl=
ockquote><div><br></div><div>The update to virtio_gpu_fence_event_process w=
as done as a preparation a few months back:<div><br></div><div><a href=3D"h=
ttps://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/virtio/virt=
gpu_fence.c?id=3D36549848ed27c22bb2ffd5d1468efc6505b05f97" target=3D"_blank=
">https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/virtio/v=
irtgpu_fence.c?id=3D36549848ed27c22bb2ffd5d1468efc6505b05f97</a></div></div=
><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
<br>
---------------------------------------------------------------------<br>
To unsubscribe, e-mail: <a href=3D"mailto:virtio-dev-unsubscribe@lists.oasi=
s-open.org" target=3D"_blank">virtio-dev-unsubscribe@lists.oasis-open.org</=
a><br>
For additional commands, e-mail: <a href=3D"mailto:virtio-dev-help@lists.oa=
sis-open.org" target=3D"_blank">virtio-dev-help@lists.oasis-open.org</a><br=
>
<br>
</blockquote></div></div>

--000000000000b5153905cc113495--
