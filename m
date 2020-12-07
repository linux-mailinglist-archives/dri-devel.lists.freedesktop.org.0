Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 247EB2D2604
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6976E977;
	Tue,  8 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF02D89D66
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 10:05:23 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id cw27so13063501edb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 02:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bDqs8unLqUQBle12hG2fZgMAnT4IQ2t1ZL0W4qAaIjU=;
 b=DjNlwraTdrC6aMTyoaa+aDktjNVBYbzEFa+X7FOVTwJNrgEW8p7AsEN5NuyiTa942e
 Ra6EG350cnKAfWF2J+wvv0/C0Rr41JfcWllIwa003oyGMzJ54+m6hDpglSILmxmxQku8
 +K2Ga/v+gjs18x8zBL+9+4JxbixyycYTlqLH6wyb4yQwGW0q/Xc8CZ0uPQ72yl1sRxeP
 JUQm3DsCuoA6rdbtzUeUIsBJE4dzTg4YN7KDuxS7gtdBFCpaYObPubnM8oXO4FwEYSdr
 bTmra2uZ1hsQ8m0DnkpWVqKpncPtadyBwJsuyNrovQOdw1CJwinGbD9iE/TW3uzsfDvg
 Z3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bDqs8unLqUQBle12hG2fZgMAnT4IQ2t1ZL0W4qAaIjU=;
 b=EVGMZOBWdEAmRGQd2OrYM97uWU77Ahb3n03cbb+GPGOhO2EgoJSodXqJDW4ccIm0rj
 AevtcKKDHlInAx/HK13XLM5nhV+VdZ1b4Stz/WhxiadXQYvDMQJ+Um6TK7/I2lYAnyyR
 iImFrzqe+npyVPC5dyTdo/n/xbo2yiRkQ2VU6w/3KG8cdbagG2hzSb5Y87vkjMZz6d44
 AFaijiBf1ID7dSIyBnlcestG0SoL2PyOfly5SrdXhxi4SrGzklltbFa46+CP/SDV7e1q
 xISNkc3CrgesJE15n4tS7JPxh9cs7d0Kfj1MBUNamjGlGob+cNsum+uyw3Shlgo11IxE
 nPhw==
X-Gm-Message-State: AOAM532DO3pzxNAj8Y5x012h9KIL+GCslLSSQh0oKwPlGaAg167yruSe
 Olm+N0czS/WG3sXQCQmrmg3bkIjmYN6DMGu10ImESA==
X-Google-Smtp-Source: ABdhPJybOjWcZFuQlJoclrltcHsYjSinmSYknKyo7h23Zu5W3WV9FwBY9ILLRWlaG6hrdJM7hxLmjSG7tU5ZBJu/gYY=
X-Received: by 2002:a50:d2c8:: with SMTP id q8mr18303584edg.375.1607335522608; 
 Mon, 07 Dec 2020 02:05:22 -0800 (PST)
MIME-Version: 1.0
References: <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <1607215171-36-1-git-send-email-jpark37@lagfreegames.com>
 <1607215171-36-2-git-send-email-jpark37@lagfreegames.com>
 <V01BVRDu5ULkPDHO-WKC98pTaPlU3acbwd99o01-R6bWW0sO9SVlKjTo8l-bvUd6C1BwJafiZGBQ5XeWMFPteVDoc0bURCtVCu2A8IVau3w=@emersion.fr>
 <CABjik9dC26tm0KzOc4SqWm-f-LW=+JbzZQuOR1fZJdZXowHaVw@mail.gmail.com>
 <C1hn9atmhrsfGrdxpjMd9sURb7AK2mpm0YkULfT-i160BF6miRFym6dmoBbzXK_bRi0j2L1lf8jbYw2b30yUYQRqaBaS5pxSKkCxxaK_y7g=@emersion.fr>
In-Reply-To: <C1hn9atmhrsfGrdxpjMd9sURb7AK2mpm0YkULfT-i160BF6miRFym6dmoBbzXK_bRi0j2L1lf8jbYw2b30yUYQRqaBaS5pxSKkCxxaK_y7g=@emersion.fr>
From: James Park <james.park@lagfreegames.com>
Date: Mon, 7 Dec 2020 02:05:09 -0800
Message-ID: <CABjik9dQUk48nUGmfnbQcK26U+Gtw2oqpyC44myEYU-Dgt5Lwg@mail.gmail.com>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
To: Simon Ser <contact@emersion.fr>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>
Content-Type: multipart/mixed; boundary="===============0822469974=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0822469974==
Content-Type: multipart/alternative; boundary="000000000000dc33c305b5dcf67a"

--000000000000dc33c305b5dcf67a
Content-Type: text/plain; charset="UTF-8"

The original code blocks in drm.h look identical to me. I see:

#include <linux/types.h>
#include <asm/ioctl.h>
typedef unsigned int drm_handle_t;

Good point about drm_basic_types.h. I'll change it to say "Not Linux" after
waiting a bit for more feedback.

Thanks,
James

On Mon, Dec 7, 2020 at 1:59 AM Simon Ser <contact@emersion.fr> wrote:

> On Monday, December 7th, 2020 at 10:55 AM, James Park <
> james.park@lagfreegames.com> wrote:
>
> > I'd noticed the #if could be combined, but they weren't in drm,h when
> > they could have been, so I didn't want to depart from the existing
> > pattern.
>
> I see. The original code really needed the two branches and
> drm_basic_types.h doesn't. But let's see what others think.
>
> > I think "One of the BSDs" is more informative than "Not Linux" if
> > that statement is still true. Given the aversion to making drm.h
> > robust to Windows, I don't think we want to imply compatibility that
> > isn't there.
>
> Well, drm_basic_types.h would be included on Windows as well from
> drm_fourcc.h, right?
>

--000000000000dc33c305b5dcf67a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The original code blocks in drm.h look identical to m=
e. I see:</div><div><br></div><div>#include &lt;linux/types.h&gt;<br>#inclu=
de &lt;asm/ioctl.h&gt;<br>typedef unsigned int drm_handle_t;<br></div><div>=
<br></div>Good point about drm_basic_types.h. I&#39;ll change it to say &qu=
ot;Not Linux&quot; after waiting a bit for more feedback.<div><br></div><di=
v>Thanks,</div><div>James</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Dec 7, 2020 at 1:59 AM Simon Ser &lt=
;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Monday, Decem=
ber 7th, 2020 at 10:55 AM, James Park &lt;<a href=3D"mailto:james.park@lagf=
reegames.com" target=3D"_blank">james.park@lagfreegames.com</a>&gt; wrote:<=
br>
<br>
&gt; I&#39;d noticed the #if could be combined, but they weren&#39;t in drm=
,h when<br>
&gt; they could have been, so I didn&#39;t want to depart from the existing=
<br>
&gt; pattern.<br>
<br>
I see. The original code really needed the two branches and<br>
drm_basic_types.h doesn&#39;t. But let&#39;s see what others think.<br>
<br>
&gt; I think &quot;One of the BSDs&quot; is more informative than &quot;Not=
 Linux&quot; if<br>
&gt; that statement is still true. Given the aversion to making drm.h<br>
&gt; robust to Windows, I don&#39;t think we want to imply compatibility th=
at<br>
&gt; isn&#39;t there.<br>
<br>
Well, drm_basic_types.h would be included on Windows as well from<br>
drm_fourcc.h, right?<br>
</blockquote></div>

--000000000000dc33c305b5dcf67a--

--===============0822469974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0822469974==--
