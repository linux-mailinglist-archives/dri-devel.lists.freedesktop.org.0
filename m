Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4D454B3F3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 16:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D7F112175;
	Tue, 14 Jun 2022 14:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3561124A4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 14:54:52 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id e184so15563762ybf.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LihR/YpoiS6kTa7IixTP/Uq1/4MG0Dt/j2hA9G8GvME=;
 b=lqlmy9xjO6CH2I33t6uB42AgH53avkAkZLjhTfuAkHxDklxcVVtwLqsEZadH9957tt
 D98EpI7oo7en9kK7B0p6Nm2zVhUsia/yU+q4EC8fqt/LyHYXDtumOFlP/FP1NLUXhFwc
 VKRg2J2Qrav7qOmj8zN6YgkcmUmIgA2CKIubg07zweQ6Z+F3bZRl/QvN/kinQ4VMXqoN
 JwlXoSqI2PmZSeNlK21z+/eZegMCzXh+wy7t7JF7+c1aGWXznBOI2chAEsuiR1u1LMdC
 RpxPs6CtJkBV+bfUhUu/j1QKfLS2YZ1Z1xyAHwqM1U8lZ+NcaZloDlFZVI3KTuU654CX
 qICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LihR/YpoiS6kTa7IixTP/Uq1/4MG0Dt/j2hA9G8GvME=;
 b=Orvf3C6q6+l/ag0IuBLmm6CWyR4ZK1Cwei/Df3925ziPDxXz/YdxqrsU9BTh2iUrxL
 0OkGu1YGmeWmlXB5zF6t5kFM2jSOOAr5WkM0AmZ2JKQQcMRj1xXIkzVkBaL5ZAg7wzzv
 VMZ2sIiDk9/jKFomhrflg5pPBuu6MqQD/5xffmHTyUasnAvAYlAvSC4be/MvOZoACnip
 pzCapbC2+Jz2Ttqh5Svd/8qxwAnuCnFarGFuYj3PbwPpS+1ShRULCxV5ncS/eU7Hshc+
 cM7rK6LxRP+wrCpwJdvI1EA89h/FDQ0DPc/bo3/zVghF4qJVvqpUTJQlAZ8AN3h+qrxo
 8+Gw==
X-Gm-Message-State: AJIora/83PB/9Hpz1Y195RVYc6lf3dta7JlnO/cC9oZaxsSfvNeqBXlC
 dLv4tN1Mf0A54pkq/zCnpmLRiTdoB5UPLMpFV+z1Cw==
X-Google-Smtp-Source: AGRyM1u3UZCJdO0eW05N6XYVHqAWIS0cCGEt7JCjN3RnRoa5IGvpBMY9YI8Lj5KYsXx5+HQXAST2eZciDrXazvIrkNw=
X-Received: by 2002:a25:ad85:0:b0:664:9682:3ce4 with SMTP id
 z5-20020a25ad85000000b0066496823ce4mr5541438ybi.280.1655218491318; Tue, 14
 Jun 2022 07:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local> <YqMH14MEqGZtujfk@phenom.ffwll.local>
 <efacab57ba2105c5b5faa49e85b9f582e0983332.camel@vmware.com>
 <20220613103310.4629f213@eldfell>
 <bcd08cc889e5861d39c115aaf3713ee4152faeca.camel@vmware.com>
 <20220613172511.6b3eac17@eldfell>
 <b25276d2448f69a5a3eb3b5a69cec7074a821d6d.camel@vmware.com>
 <20220614103642.48003975@eldfell>
 <e6e19009d7613bd84b135af025b90cf927377aa8.camel@vmware.com>
In-Reply-To: <e6e19009d7613bd84b135af025b90cf927377aa8.camel@vmware.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 14 Jun 2022 15:54:31 +0100
Message-ID: <CAPj87rOhse5seTEischn1aCJ57FFZsh85tJ7K-wGBj=b6wndJg@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
To: Zack Rusin <zackr@vmware.com>
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
Cc: Martin Krastev <krastevm@vmware.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 14 Jun 2022 at 15:40, Zack Rusin <zackr@vmware.com> wrote:
> On Tue, 2022-06-14 at 10:36 +0300, Pekka Paalanen wrote:
> > The reason I am saying that you need to fix other issues with
> > virtualized drivers at the same time is because those other issues are
> > the sole and only reason why the driver would ever need hotspot info.
> >
> > Hotspot info must not be necessary for correct KMS operation, yet you
> > seem to insist it is. You assume that cursor plane commandeering is ok
> > to do. But it is not ok without adding the KMS UAPI that would allow
> > it: a way for guest userspace to explicitly say that commandeering will
> > be ok.
> >
> > If and only if guest userspace says commandeering is ok, then you can
> > require hotspot info. On the other hand, you cannot retrofit hotspot
> > info by saying that if a driver exposes hotspot properties then all KMS
> > clients must set them. That would be a kernel regression by definition:
> > KMS clients that used to abide the KMS UAPI contract are suddenly
> > breaking the contract because the kernel changed the contract.
> >
> > Therefore I very much disagree that virtualized drivers need hotspot
> > info. They do not strictly need hotspot info for correct operation,
> > they need it only for making the user experience more smooth, which is
> > an optional optimization. That optimization may be very important in
> > practise, but it's still an optimization and is generally not expected
> > by KMS clients.
>
> I strongly disagree with that (both the sentiment towards hotspots and the client
> handling of it). I don't think we have to agree on reasoning here at all to make
> progress though so I'm going to let it go (we can always continue on irc or email if
> you'd like to try to conclude this bit but we could all use a few days of break from
> this discussion probably).

Well, it's just coming from two different directions:
* many current KMS clients want the cursor plane to be displayed as
the client-programmed plane properties indicate, and the output can be
nonsensical if they aren't
* VMware optimises the cursor by displaying the cursor plane not as
the client-programmed plane properties indicate, and the output is
sometimes good (faster response!) but sometimes bad (nonsensical
display!)

The client cap sounds good. As a further suggestion, given that
universal planes are supposed to make planes, er, universal, rather
than imbued with magical special behaviour, how about _also_ adding an
'is cursor' plane prop which userspace has to set to 1 to indicate
that the output is a cursor and has the hotspot correctly set and the
'display hardware' is free to make the cursor fly around the screen in
accordance with the input events it sends? That way it's really really
clear what's happening and no-one's getting surprised when 'the right
thing' doesn't happen, not least because it's really clear what 'the
right thing' is.

Cheers,
Daniel
