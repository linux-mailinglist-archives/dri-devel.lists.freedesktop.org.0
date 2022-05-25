Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8AA534A76
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 08:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A150310F6A8;
	Thu, 26 May 2022 06:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E08810E184
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 15:35:01 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ff53d86abbso199650647b3.8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 08:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eUkrGTrSQ/HvE4pkTTytLYos8pE2CZwRH56haednrI8=;
 b=kf5EZxUU0EZdGTD7+88GQlhPltRPmgGJN2jXjxqnKAKcR8B0sTiIlFFFMGA5v1pLAS
 aYaCuJFPcgAIRGNVnwsUZvCe2DOksWy1a90jzjzIJ8/3lrIb4TStqgOf4cyUWBzkr1rQ
 6+3dxc8fK1O58elAJRAKNhIOFswsuDTfS5seMM8UoVwLgDig6buFKN4B/eGgMT1Hgh0K
 0G0ms4C2dqWNaBe66YYZTu7wJGh4jw+j93XQOZ4MmgUf6JuupYVYGVlO9ZCKjzsNqyAS
 DCiNgvFwMkJrqbsuNbqddj5TD1AcXVvN4fguqUzsaqeQ8w43DtqOicsDT/yC3C4bMILx
 jRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUkrGTrSQ/HvE4pkTTytLYos8pE2CZwRH56haednrI8=;
 b=5I/9PsMnSKFmwmTxgjj+YEMKRCBO5ZyWof+v9+tEuVXT6B/5KZrKd5IRuMudF12sPD
 OjTuJ4MLepJCmojcHEOp99or4U/VWBqZh1iF49CjADD9Oc4YRmzfTeVfbNrhVCgGldAG
 5JLbf7OP49R5IjfDlc4EiqAt8RPutfM3Tem/tcfCiQqaaaUO1oH9bzBnjc0Ww2hitN4v
 7Bc1m+pimtc5maGGmYEg0vgK/XWm8NlhU76SOc5mPWG44tKcxr5DD0kVjQnXwTQDjkQe
 i111DAT8+wCAQe95fzcrr6yt4X8gFipd29/n2tAa4CtvksNpyciozfNR25/7IeQnWc1d
 UwiA==
X-Gm-Message-State: AOAM532LcrVb+cYN9nkj+knWp7NBLx6duGnP7Qs1ynL5NB8OXucMGguJ
 ijreJkL+kR6dWxhGZuNIUDYyq//p6Gsm3ZyM7KqX4RQf0YrEBA==
X-Google-Smtp-Source: ABdhPJzg2dbkBHs0hM+M9PZeq5YUUPQu/KPFQrKpUcmuV+JMpU7gu9UOXzsavL3DIL8mZscbhA80P/oZdLwEfrJd8ww=
X-Received: by 2002:a05:690c:97:b0:2f1:9582:6685 with SMTP id
 be23-20020a05690c009700b002f195826685mr35675326ywb.395.1653492900353; Wed, 25
 May 2022 08:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220506180216.2095060-1-jason@jlekstrand.net>
 <CAPj87rPwx6tL5NtcmP=589wWCyKvZpFfLveaGtsd2wcyCh-1=A@mail.gmail.com>
In-Reply-To: <CAPj87rPwx6tL5NtcmP=589wWCyKvZpFfLveaGtsd2wcyCh-1=A@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 25 May 2022 10:34:49 -0500
Message-ID: <CAOFGe95eEkhGRiDcSb4mvVry1zMYB36aNYm3XWOKb4NESh7wKQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] dma-buf: Add an API for exporting sync files (v14)
To: Daniel Stone <daniel@fooishbar.org>
Content-Type: multipart/alternative; boundary="000000000000f7230005dfd7d078"
X-Mailman-Approved-At: Thu, 26 May 2022 06:47:10 +0000
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f7230005dfd7d078
Content-Type: text/plain; charset="UTF-8"

On Wed, May 25, 2022 at 5:02 AM Daniel Stone <daniel@fooishbar.org> wrote:

> On Sat, 7 May 2022 at 14:18, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > This patch series actually contains two new ioctls.  There is the export
> one
> > mentioned above as well as an RFC for an import ioctl which provides the
> other
> > half.  The intention is to land the export ioctl since it seems like
> there's
> > no real disagreement on that one.  The import ioctl, however, has a lot
> of
> > debate around it so it's intended to be RFC-only for now.
>
> Errr, I think we're good with this one now right?
>

Yeah, I dropped the RFC from the patch, just not the description in the
cover letter, apparently.


> From the uAPI point of view, having looked through the Mesa MR, both are:
> Acked-by: Daniel Stone <daniels@collabora.com>
>

For reference:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037

Yes, I agree it's gotten sufficient review at this point that I think we
can call the uAPI reviewed.  I'm good with landing now.  Sorry that took so
long but the original version I had only used half of the new API and I
wanted to make sure both halves got good testing.

--Jason



> Cheers,
> Daniel
>

--000000000000f7230005dfd7d078
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, May 25, 2022 at 5:02 AM Daniel Stone &lt;<a href=3D"mailto:d=
aniel@fooishbar.org">daniel@fooishbar.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Sat, 7 May 2022 at 14:18, Jason=
 Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.net" target=3D"_blank">jas=
on@jlekstrand.net</a>&gt; wrote:<br>
&gt; This patch series actually contains two new ioctls.=C2=A0 There is the=
 export one<br>
&gt; mentioned above as well as an RFC for an import ioctl which provides t=
he other<br>
&gt; half.=C2=A0 The intention is to land the export ioctl since it seems l=
ike there&#39;s<br>
&gt; no real disagreement on that one.=C2=A0 The import ioctl, however, has=
 a lot of<br>
&gt; debate around it so it&#39;s intended to be RFC-only for now.<br>
<br>
Errr, I think we&#39;re good with this one now right?<br></blockquote><div>=
<br></div><div>Yeah, I dropped the RFC from the patch, just not the descrip=
tion in the cover letter, apparently.<br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
From the uAPI point of view, having looked through the Mesa MR, both are:<b=
r>
Acked-by: Daniel Stone &lt;<a href=3D"mailto:daniels@collabora.com" target=
=3D"_blank">daniels@collabora.com</a>&gt;<br></blockquote><div>=C2=A0</div>=
<div>For reference: <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/4037">https://gitlab.freedesktop.org/mesa/mesa/-/merge_reques=
ts/4037</a></div><div><br></div><div>Yes, I agree it&#39;s gotten sufficien=
t review at this point that I think we can call the uAPI reviewed.=C2=A0 I&=
#39;m good with landing now.=C2=A0 Sorry that took so long but the original=
 version I had only used half of the new API and I wanted to make sure both=
 halves got good testing.</div><div><br></div><div>--Jason</div><div><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
Daniel<br>
</blockquote></div></div>

--000000000000f7230005dfd7d078--
