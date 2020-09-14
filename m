Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37512699E4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 01:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E646C6E821;
	Mon, 14 Sep 2020 23:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDE96E821
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:45:00 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id c2so1133918ljj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 16:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u4tgUNPtLOQN8BYq/DRY6HEVpSCCTykqICDxiRKjYGo=;
 b=mgfyvcA0BlB9Q6lIQG1I5drd5d6kfM+x/jklg9Rk9QGyTplU3I6PDm5HnpGF52QkLz
 H8OTsNrXyHJLhAd0lFDCZIO5eHGo0q+zTosz8FgOd6xx7imKjWvuqbuMs4ZauxZph8/T
 da9345Znz+AKry9I+P8+9e1+d/JpAaS2WAh9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u4tgUNPtLOQN8BYq/DRY6HEVpSCCTykqICDxiRKjYGo=;
 b=DI0nfVCZ1L7eg1b3dh/DMPjUgs/vkMYze0x34obtKBzK6Wxfp5CX3z7If9t7fmTQ5F
 1pzuHRk/dDoKfNG2gv2hgHSonYyoZ0OBcm+Zr9N0xi8u1bPA53kefoAHJAeW1l4i5E3g
 kDKLMc12KGlOGTqJoe2pWCNCxLvzeKsEkhYgEx4D6LOdxWTw/XAufOQeGBFT+dWQBzN6
 FcVS86miXF34fy2VEy24QEZit7DbhAWOKZcnDmxpU2Dhcj2hMmy5xaoGRyGE+So9zbgo
 B+3u7/x80YdaJjs2/8ac4D4fSNst6oJ+yKcV7tKgZyU7jJrbRvYCorgWJPPDyyq5sX6S
 XpQg==
X-Gm-Message-State: AOAM53152yjNA22VQEEJr/L32geaD+klL1FfsRcfgR9UyS/j2nM55IWi
 uQauW6or/vKk3Jv4Y/6m4RNM1AHPAXYTKA==
X-Google-Smtp-Source: ABdhPJzRxyUUa9+eqjBdYd004RGfIk71L4S8EWmFH6hHxb1VeJ6KriWClG0ApypYz5Yt3PnA1MkMJA==
X-Received: by 2002:a2e:9948:: with SMTP id r8mr5657062ljj.126.1600127098479; 
 Mon, 14 Sep 2020 16:44:58 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id i11sm3644986lfe.242.2020.09.14.16.44.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 16:44:57 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id k25so1208742ljk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 16:44:57 -0700 (PDT)
X-Received: by 2002:a2e:6f0d:: with SMTP id k13mr5412803ljc.250.1600127096702; 
 Mon, 14 Sep 2020 16:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-5-gurchetansingh@chromium.org>
 <20200902221514.GE1263242@redhat.com>
 <CAAfnVBnfbwc07au1OMec8g5yHC0D3yXc88nOtTopO4sitYf8ig@mail.gmail.com>
 <20200909070349.uyvg44xakdftibxh@sirius.home.kraxel.org>
 <CAJfpegsMEZoCQe7frsr9Kaq6EZsuRFWP3zs7sgrxnUDLzfcx_w@mail.gmail.com>
 <20200909092646.GA438822@phenom.ffwll.local>
 <CAKMK7uHzES32APTafwYjWc=-hswGe3q7Re4Rw354hKwA+mb0zg@mail.gmail.com>
 <CAAfnVBkbmxB7jdE3W2x3fjsiQYvJ1nimPNsk7qZnJKQJB7JrKw@mail.gmail.com>
 <CAJfpegvngPguV3PFtCnP05c12Pwm_+9yng4=FWaaGuDHtezXYw@mail.gmail.com>
In-Reply-To: <CAJfpegvngPguV3PFtCnP05c12Pwm_+9yng4=FWaaGuDHtezXYw@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 14 Sep 2020 16:44:45 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=tUuxWt+3LwkNm0-ByXYSjzsjA+4N-FREkcAA1yBcz=g@mail.gmail.com>
Message-ID: <CAAfnVB=tUuxWt+3LwkNm0-ByXYSjzsjA+4N-FREkcAA1yBcz=g@mail.gmail.com>
Subject: Re: [PATCH v2 04/23] virtio: Add get_shm_region method
To: Miklos Szeredi <miklos@szeredi.hu>
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vivek Goyal <vgoyal@redhat.com>
Content-Type: multipart/mixed; boundary="===============1239914534=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1239914534==
Content-Type: multipart/alternative; boundary="00000000000032283305af4e9fb1"

--00000000000032283305af4e9fb1
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 10, 2020 at 2:56 AM Miklos Szeredi <miklos@szeredi.hu> wrote:

> On Thu, Sep 10, 2020 at 2:28 AM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
>
> > That sounds like an excellent plan !
> >
> > I will send out blob v3 (incorporating kraxel@'s feedback) once the
> topic pull request (it seems Miklos will do this?) for the shm region
> patches has been merged into drm-misc-next.
>
> I split out the three patches into:
>
>   git://
> git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#virtio-shm


Thanks, pull request sent.


>
>
> Thanks,
> Miklos
>

--00000000000032283305af4e9fb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 10, 2020 at 2:56 AM Miklo=
s Szeredi &lt;<a href=3D"mailto:miklos@szeredi.hu" target=3D"_blank">miklos=
@szeredi.hu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, Sep 10, 2020 at 2:28 AM Gurchetan Singh<br>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
<br>
&gt; That sounds like an excellent plan !<br>
&gt;<br>
&gt; I will send out blob v3 (incorporating kraxel@&#39;s feedback) once th=
e topic pull request (it seems Miklos will do this?) for the shm region pat=
ches has been merged into drm-misc-next.<br>
<br>
I split out the three patches into:<br>
<br>
=C2=A0 git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/msze=
redi/fuse.git#virtio-shm" rel=3D"noreferrer" target=3D"_blank">git.kernel.o=
rg/pub/scm/linux/kernel/git/mszeredi/fuse.git#virtio-shm</a></blockquote><d=
iv><br></div><div>Thanks, pull request sent.</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Thanks,<br>
Miklos<br>
</blockquote></div></div>

--00000000000032283305af4e9fb1--

--===============1239914534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1239914534==--
