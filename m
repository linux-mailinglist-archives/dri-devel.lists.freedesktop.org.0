Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCD61896E1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 09:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19AB6E880;
	Wed, 18 Mar 2020 08:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA866E26F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 02:19:44 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m15so1002296lfp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 19:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2+VfuB29bj2H8QrZo10ASzsk+M2zZbRzyQjPcMMzwV4=;
 b=T89vFjMXgz577doE0CXCapQR3nnlT34DYxkvP8owAxarl2u8Ugp/gO2BWu8ZhjYhud
 FvM0erR2Vd8I7CFJtw/8wNxC4LyznUteEbs2FMElFVKoITWmscb+dVDGL8m7nFitUuaa
 KQH58lbj+ETX2wNm3C80QAjU962ghiyEewfzCf9MJsWXAhHyWfn5/UzejTaUqnvWuArh
 UpCZ5NIxbXvZMAgueHerOK3kw+WX4ICjzeLY+Vbez0XvummtXUN3WOIJWUsiAhbPqlHM
 DictrMEoiaSsyo6b5hDtTkNlq0uKh5zRXlwsd0njP37fqO5UQXo+AfArZxNzJkjku+qI
 tOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2+VfuB29bj2H8QrZo10ASzsk+M2zZbRzyQjPcMMzwV4=;
 b=Z6wTfvKKkBcUyQkAhTRhNaC1wD7/+nEAx5jVqkPnSLQ82oyohebsxsBfcpiPiTNLrf
 zEOddh2dz6hWZ2Cnc8eeNtKHKdC/4+2cqLGcQiGK+HlONWpdMP2vb17zYRKI0HcEAkOf
 E+Owx2tlgAnU+qYVXAaa9g0wwHNJpZDg1ZDoIF6wnFGGLwLOZ1OJabXy4no14vrIoi2I
 DCDCY4enx4DSrPugwcfC1HU7Vf8zroRd8/asVv57wxSW/wbVflTPhyYzRCU3EubtCZrd
 cOd7SwqqZ+VxCJTOYZH3zu+LEoyD50g7g8V5hATwt8bmMJ87mVEyemGJc455JtGUG5lI
 Dzvg==
X-Gm-Message-State: ANhLgQ2+a3CeCeP1UzMjysO8gxGNS4GAiBaKc/kb2SwwqQPYRuO1mwZ5
 nS6j4+YUICnkHSsigz5xFGaz9iJ7XApABugth8M=
X-Google-Smtp-Source: ADFU+vvpU0kyxySDVrSQPRlOHLgNV3BJCSJ95MCdS4ihBCkxWEsR6ymOk2rRF3KseI9E+Lu10U20qB1TnPzWKh04oJY=
X-Received: by 2002:ac2:4191:: with SMTP id z17mr115723lfh.73.1584497983022;
 Tue, 17 Mar 2020 19:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <1583300076-28392-1-git-send-email-leon.he@unisoc.com>
 <9be2873c-79c2-2d02-f15a-1e6e0ff7e898@kernel.org>
In-Reply-To: <9be2873c-79c2-2d02-f15a-1e6e0ff7e898@kernel.org>
From: xiaolong he <hexiaolong2008@gmail.com>
Date: Wed, 18 Mar 2020 10:19:22 +0800
Message-ID: <CAN9aa7qfmY6nuVf7CLYLn4i5h28pDOMceup4vFNQmKM1gLdPqA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: bugfix for selftest failure
To: shuah <shuah@kernel.org>
X-Mailman-Approved-At: Wed, 18 Mar 2020 08:24:31 +0000
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
Cc: Leon He <leon.he@unisoc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> On 3/3/20 10:34 PM, Leon He wrote:
> > If the 'name' array in check_vgem() was not initialized to null, the
> > value of name[4] may be random. Which will cause strcmp(name, "vgem")
> > failed.
>
> Nit: "to fail" instead of "failed"

OK, thanks!

>
>
> >
> > Signed-off-by: Leon He <leon.he@unisoc.com>
> > ---
> >   tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> > index cd5e1f6..21f3d19 100644
> > --- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> > +++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> > @@ -22,7 +22,7 @@
> >   static int check_vgem(int fd)
> >   {
> >       drm_version_t version = { 0 };
> > -     char name[5];
> > +     char name[5] = { 0 };
> >       int ret;
> >
> >       version.name_len = 4;
> >
>
> return !strcmp(name, "vgem");
>
> While you are at it, why not change strcmp() to strncmp()?
>

OK, I'll change it in patch v3.

thanks,
-- Leon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
