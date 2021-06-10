Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF7C3A22DE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 05:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDCD6E448;
	Thu, 10 Jun 2021 03:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C136E448
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 03:38:09 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id m137so603446oig.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 20:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0U/fk/MXYvy7n95jBm2NzZAF/Mu+ygwwWB3XEVQHj2k=;
 b=g0waUE1xRelnBKD1wzy8+/s0IG7lHTQ568Rr/xx2D/sssSU7CvYEDXKpA/mEb7qRse
 lnYMVbaNNLzV5rW+AAYd6REsod7FerInoSSDHLFWP31otQAMD5r7rl7C+YTcEncSib1v
 4ejeEnQOHDZMKASc6TX4InOOklIXSzUW+mNTfPPGnORp3nRlqMghU7tNO4Ay0zeUmY7h
 cxranrxnvZWXrzEa9hWr15lemIA/qsb4dlzfNmbJeuZBqUSFU5UJFG+TcOgRg3rhDDIo
 jA0aS8d5TiULi6WoB4CFc1a3yilok5B/rWYhVXufgS9NfAGMQQuo00qASC+ucu1HvGej
 C3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0U/fk/MXYvy7n95jBm2NzZAF/Mu+ygwwWB3XEVQHj2k=;
 b=ejrNQvFhUewJVZC6jME6HpsujXd66EmiQ4L60TAJEIUNxLVJUDk8A0dbcCN90vedj2
 fUzlQ/KnDn5Xcvr3T3N8UAciLjWYaubjncLr50NVMYWCwnosrFjSID57wXtc4iBXpXUB
 4MePcC7B9UoF1FrPkeDjJ3LB+qGN9uh8IrmcljxD4IhN2KXnSyDob6pbGvRX6Rnz3pvZ
 S6CgYqQVGgixbNvuFqgoDZSgKSX/zFbBCut5DhboSDRC7DCYWB0Hm2354jjoclOUzRnq
 VahMsPfHO42ta5bhfkIBN2hu/K2Z015BVYSH1J9B+TkHdkzeSDeFh/+iJQhzOSuAww60
 1s5w==
X-Gm-Message-State: AOAM533eQi8xS2VkTcbILK6Qd7oXbfeag7t/cLKojRfviRssnkTdbAsD
 drs24vRupjgT4z1CdlcfPeDIxo0BDzEmuXVnpgo=
X-Google-Smtp-Source: ABdhPJweGAX1EfWJ1GgrsKutvaLa7N3DWZBpUBwUhp1hyRpKJx/BcmgEKV/8FZtJVSOIJvR843c88iYvYkBJd89l4LE=
X-Received: by 2002:a05:6808:14c9:: with SMTP id
 f9mr484134oiw.120.1623296288859; 
 Wed, 09 Jun 2021 20:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210610030344.117897-1-airlied@gmail.com>
 <CADnq5_NsAmBLMLmWsCc0VJO130z+ARhGXM6kVS_YD++nQ_Gy_Q@mail.gmail.com>
 <CAPM=9tyS7pjTAKXbs-1gXtMsy39ysNTKKOE-cidsg1xqLNb-7A@mail.gmail.com>
In-Reply-To: <CAPM=9tyS7pjTAKXbs-1gXtMsy39ysNTKKOE-cidsg1xqLNb-7A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Jun 2021 23:37:57 -0400
Message-ID: <CADnq5_MC5_qr3XFfZ2UoFDBG6vtgi+G6t51fZAicpq8DAhg1Ag@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use correct rounding macro for 64-bit
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 9, 2021 at 11:33 PM Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 10 Jun 2021 at 13:23, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Wed, Jun 9, 2021 at 11:10 PM Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > From: Dave Airlie <airlied@redhat.com>
> > >
> > > This fixes 32-bit arm build due to lack of 64-bit divides.
> > >
> > > Fixes: cb1c81467af3 ("drm/ttm: flip the switch for driver allocated resources v2")
> > > Signed-off-by: Dave Airlie <airlied@redhat.com>
> >
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> I'm going to apply this directly to next.

Thanks!

Alex

>
> Dave.
