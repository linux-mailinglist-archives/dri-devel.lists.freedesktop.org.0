Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AEF3EF136
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 19:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A246E216;
	Tue, 17 Aug 2021 17:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FF36E216
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 17:59:52 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id x5so9361153qtq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 10:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PqH8vs5GnoYqbuEEJJZJEej1s3SuplbOXoOoWr1L3bo=;
 b=BQKKP7/8nXj24BS9UbGzCJiG/i8Dtcbs4Q8i8+YB1LVwlHrUQCBw0LZcWZhq03YrPU
 O92/GJGMVHfZ4CAp+VjVA4XCat9ig6WehlcJonaRdypWZJz/GrDdhwWujf1g4XywrkCv
 ctOnEwyuqxh8oUufgE23NToFB7uNatfQmoDMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PqH8vs5GnoYqbuEEJJZJEej1s3SuplbOXoOoWr1L3bo=;
 b=AERRR9uGKk/yRYOpPyCZZFZKLiGcrG5O02axEkat8zzeFNxLjlC8YHKWs14pCfPlxM
 ndWn0RcXFDscKjv47dRNKnncheml5Demj6PRJG7sn7vwicLge6axmAApcstSjNniLUtE
 76J9NyXxxIAJK3cD7lk9id6BS+XsAAtBbzYuR+Ww8EGAMffQRKRw0qIMcLKE4EdtaAig
 xusWN0NmsNNYdFA7SjSEtRyAp/1gl7dhEmQ6AN+DYQNPgdbSjyfU0FIKvNt7Phdp9J3K
 /iKlUBjllkw8q+uDhCDNR4c0IQNnjQ3hEubEQLb9iikzQK7mhNijvge112Zzw8IPXOQU
 gCTQ==
X-Gm-Message-State: AOAM533JeOD+8r91CPWRs2BtSphhQU2FKnJDz9w7xxTu8jkXo3+6ne2b
 vNSxd43kze3jcZUiXn0O3RRv6SsZODURYQ==
X-Google-Smtp-Source: ABdhPJxP0omBLQb6xxZUxzxNrxEOyXj3yn0l521fXZwjjyC8p14r/B8dDPxz1KzMyJ1SNmXZJe46wA==
X-Received: by 2002:a05:622a:5d3:: with SMTP id
 d19mr4245017qtb.211.1629223191280; 
 Tue, 17 Aug 2021 10:59:51 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id x21sm1878122qkf.76.2021.08.17.10.59.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 10:59:51 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id p4so41077296yba.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 10:59:50 -0700 (PDT)
X-Received: by 2002:a25:e006:: with SMTP id x6mr5546633ybg.341.1629223189634; 
 Tue, 17 Aug 2021 10:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210811175525.2125964-1-markyacoub@chromium.org>
 <20210812194917.1703356-1-markyacoub@chromium.org>
 <4ab4548f-34fc-27cb-928e-af2b8ab78b1b@daenzer.net>
 <CAJUqKUp6zrioRy4aK_ySM+1EMWfZqX1P-_u2RGsGB9PCBXLSAQ@mail.gmail.com>
In-Reply-To: <CAJUqKUp6zrioRy4aK_ySM+1EMWfZqX1P-_u2RGsGB9PCBXLSAQ@mail.gmail.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Tue, 17 Aug 2021 13:59:13 -0400
X-Gmail-Original-Message-ID: <CAOw6vbKJ3QhdVQ5dhE7M75hF5j5QaXNwxkys4+qPdDh9tU3Dcg@mail.gmail.com>
Message-ID: <CAOw6vbKJ3QhdVQ5dhE7M75hF5j5QaXNwxkys4+qPdDh9tU3Dcg@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Copy drm_wait_vblank to user before returning
To: Mark Yacoub <markyacoub@chromium.org>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 abhinavk@codeaurora.org, 
 Rob Clark <robdclark@chromium.org>, Dave Airlie <airlied@linux.ie>, 
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 13, 2021 at 11:48 AM Mark Yacoub <markyacoub@chromium.org> wrot=
e:
>
> Thanks for your review Michel!
> @MAINTAINER, could you please strip the Change-Id when applying.
> Thanks!

Applied to drm-misc-fixes with the Change-Id removed.

Thank you for your patch!

Sean

>
> On Fri, Aug 13, 2021 at 3:33 AM Michel D=C3=A4nzer <michel@daenzer.net> w=
rote:
> >
> > On 2021-08-12 9:49 p.m., Mark Yacoub wrote:
> > > From: Mark Yacoub <markyacoub@google.com>
> > >
> > > [Why]
> > > Userspace should get back a copy of drm_wait_vblank that's been modif=
ied
> > > even when drm_wait_vblank_ioctl returns a failure.
> > >
> > > Rationale:
> > > drm_wait_vblank_ioctl modifies the request and expects the user to re=
ad
> > > it back. When the type is RELATIVE, it modifies it to ABSOLUTE and up=
dates
> > > the sequence to become current_vblank_count + sequence (which was
> > > RELATIVE), but now it became ABSOLUTE.
> > > drmWaitVBlank (in libdrm) expects this to be the case as it modifies
> > > the request to be Absolute so it expects the sequence to would have b=
een
> > > updated.
> > >
> > > The change is in compat_drm_wait_vblank, which is called by
> > > drm_compat_ioctl. This change of copying the data back regardless of =
the
> > > return number makes it en par with drm_ioctl, which always copies the
> > > data before returning.
> > >
> > > [How]
> > > Return from the function after everything has been copied to user.
> > >
> > > Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
> > > Tested on ChromeOS Trogdor(msm)
> > >
> > > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > > Change-Id: I98da279a5f1329c66a9d1e06b88d40b247b51313
> >
> > With the Gerrit Change-Id removed,
> >
> > Reviewed-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >
> >
> > --
> > Earthling Michel D=C3=A4nzer               |               https://redh=
at.com
> > Libre software enthusiast             |             Mesa and X develope=
r
