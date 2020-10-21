Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F414295922
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ED46F3F1;
	Thu, 22 Oct 2020 07:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C2F6EDBA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 14:59:22 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id n6so3430008ioc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6k/XYSEUOEGgJtf8vvP40kk63KUvYxwBohb5AD5L9SY=;
 b=Uas8VMvJb3Nf+3lkYLhC94/Gt7WxCwAQaQwhNOqLf0jF4vcAu34t+3r/EPFb4RPMun
 jDvAXbo6qB8QDoFkOMJ7+8w75mIZCM/uqDlsUcdIIKMdAI0yLrF2fLmgfRbxIR1p+EOu
 TE+Z+sqFKAZ/8ruxzDBaF4qs0Y4GUmFN8nPU3g9LVzxTrPAIwxqpKKnTkp06+UkD19lp
 3cC3J6UDcehBy/vEbX+nz7ytdAlDkXmEfU+fPuL2RqGgGDHUydnTl0GXXs4Dz8P6kDH9
 yJdznp2fiDIru90wkVoLu3HCYb35nrtAFMzBv6cFufl2B2VP+sFUEWjfuyMjvBxSW3xg
 2RRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6k/XYSEUOEGgJtf8vvP40kk63KUvYxwBohb5AD5L9SY=;
 b=Hl1PWGPIqx1iEzoedmq2jMAz6oh8q4XYn0KTELwOF+L3rHoXg0ap+ehFcOXYdB0zN3
 /xaVQiaD+6KtDESe9pEi9YP3syI40eXwvDYHxpyatgOG0tEdvCfq3sZcug8TszCi6EJd
 Xq7Kt+SetODCbZxJffVbPz2nkxx00bZwyvl1d1hulkOR7S70MheYFHytTJH6bchKKXJX
 woWUecSfRBipEWLkgV2ESVpqDvpTRVsev0QTL9ZBGkiE/CnAepUwne7e5NWoW36Hsrvj
 0/f3ik6xvyne8E2rE2a/yUIT2D+aW/K1IgkkacQvSUVcfIR9a4A2hB+nka0Mj3w+f16N
 Sarw==
X-Gm-Message-State: AOAM533UrhGtbU/XH1l2k4V24T5Kw5vMEKB3wJDbyMeLHau2YVlqkKV4
 zVYmBTv6IZsDBglJQVfmVI6PE2EiU50VavwUNEpJbA==
X-Google-Smtp-Source: ABdhPJzGpt6cC/w81fOJno84ShxWr6IIYetnsIIK7LhBI7wI28ceNMyVe/YvQpoL46ITXDpu7cStT8V/xmMbH5Kb9xY=
X-Received: by 2002:a6b:6b09:: with SMTP id g9mr3011383ioc.203.1603292361275; 
 Wed, 21 Oct 2020 07:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201021065404.1336797-1-kenbshuang@google.com>
 <xyxxV-NdH-NcnbRURBYThCKj5j6VFLMi0twD2wptimtzrod1EyQ_Rp5BYQoQlVKUXsmZGxhrltrYBW4dgD4UDvgKSgW2CAzt_Q1e5bCNWlk=@emersion.fr>
 <20201021083415.GN401619@phenom.ffwll.local>
In-Reply-To: <20201021083415.GN401619@phenom.ffwll.local>
From: Ken Huang <kenbshuang@google.com>
Date: Wed, 21 Oct 2020 22:58:45 +0800
Message-ID: <CAJxBc99xxc1S6CrE0KswPpY2Rf3KS0AQewNZQOfmOTbMWrtnTA@mail.gmail.com>
Subject: Re: [PATCH] drm: add client cap to expose low power modes
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: Adrian Salido <salidoa@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============0120903846=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0120903846==
Content-Type: multipart/alternative; boundary="000000000000aaa11305b22f9777"

--000000000000aaa11305b22f9777
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

It's useful in Android and other embedded devices to implement Always On
Display (ex. showing clock faces with less than 15% OPR on screen).

OPR (On Pixel Ratio) is the percentage of luminance amount over the display
area.
It's derived by gray levels of display image pattern and the backlight (or
OLED) driving force (or current).
ex: OPR=3D100% means a full white pattern with maximum backlight (or OLED)
brightness, while full black would be OPR=3D0%.

In userspace, when the client initializes, we can set capability via
drmSetClientCap() to ask the display driver to expose the drm modes with
DRM_MODE_FLAG_LOW_POWER flag.
Userspace can check DRM_MODE_FLAG_LOW_POWER flag to know which modes can be
used to consume the least amount of power during Always On Display.
Ignoring modes with this flag set during normal operating mode.

Thanks,
Ken

Daniel Vetter <daniel@ffwll.ch> =E6=96=BC 2020=E5=B9=B410=E6=9C=8821=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:34=E5=AF=AB=E9=81=93=EF=BC=9A

> On Wed, Oct 21, 2020 at 07:40:48AM +0000, Simon Ser wrote:
> > On Wednesday, October 21, 2020 8:54 AM, Ken Huang <kenbshuang@google.co=
m>
> wrote:
> >
> > > From: Adrian Salido salidoa@google.com
> > >
> > > Some displays may support Low Power modes, however, these modes may
> > > require special handling as they would usually require lower OPR
> > > content on framebuffers.
> >
> > I'm not familiar with OPR. Can you explain what it is and what it means
> > for user-space?
>
> Also since this is new uapi, I guess best explanation would include the
> userspace code that makes sensible use of this.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000aaa11305b22f9777
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>It&#39;s useful in A=
ndroid and other embedded devices to implement Always On Display (ex. showi=
ng clock faces with less than 15% OPR on screen).<br></div><div><br></div>O=
PR (On Pixel Ratio) is the percentage of luminance amount over the display =
area.<div>It&#39;s derived by gray levels of display image pattern and the =
backlight (or OLED) driving force (or current).</div><div>ex: OPR=3D100% me=
ans a full white pattern with maximum backlight (or OLED) brightness, while=
 full black would be OPR=3D0%.<br><br>In userspace, when the client initial=
izes, we can set capability via drmSetClientCap() to ask the display driver=
 to expose the drm modes with DRM_MODE_FLAG_LOW_POWER flag.<br>Userspace ca=
n check DRM_MODE_FLAG_LOW_POWER flag to know which modes can be used to con=
sume the least amount of power during Always On Display.=C2=A0</div><div>Ig=
noring modes with this flag set during normal operating mode.</div><div><br=
></div><div>Thanks,</div><div>Ken</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Daniel Vetter &lt;<a href=3D"mailto:=
daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; =E6=96=BC 2020=E5=B9=B410=E6=9C=88=
21=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:34=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, O=
ct 21, 2020 at 07:40:48AM +0000, Simon Ser wrote:<br>
&gt; On Wednesday, October 21, 2020 8:54 AM, Ken Huang &lt;<a href=3D"mailt=
o:kenbshuang@google.com" target=3D"_blank">kenbshuang@google.com</a>&gt; wr=
ote:<br>
&gt; <br>
&gt; &gt; From: Adrian Salido <a href=3D"mailto:salidoa@google.com" target=
=3D"_blank">salidoa@google.com</a><br>
&gt; &gt;<br>
&gt; &gt; Some displays may support Low Power modes, however, these modes m=
ay<br>
&gt; &gt; require special handling as they would usually require lower OPR<=
br>
&gt; &gt; content on framebuffers.<br>
&gt; <br>
&gt; I&#39;m not familiar with OPR. Can you explain what it is and what it =
means<br>
&gt; for user-space?<br>
<br>
Also since this is new uapi, I guess best explanation would include the<br>
userspace code that makes sensible use of this.<br>
-Daniel<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--000000000000aaa11305b22f9777--

--===============0120903846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0120903846==--
