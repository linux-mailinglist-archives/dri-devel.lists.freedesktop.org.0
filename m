Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDAE275218
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF3A6E10B;
	Wed, 23 Sep 2020 07:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA5E6E10B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 07:05:46 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w1so18737580edr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 00:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k5J2Eht8iwERJLC/7nmn6+F8QQIm7Qe9FlpuPjuUNh0=;
 b=IUP+GctGsxnWTAxoXSisdL3bxTaO/X6VchTniO6zByHcl+IugOcjctHGry3mNpZtV/
 s2eKdPi3BPHFt4kHJTrOXgNXY1vnr2vS0jlvXjhP+9VZi/5D3QQkPYeBNeKmafTJbYCE
 I6Ol9RQx+TEzIJD+IhllImdyZg6pAtLdgG/udt1RzlrWD5ZuBsTlHFTZe4spVvFuyYeB
 jtbvk5OYum9C1Rse+3e8WKpU3Qe9W8sy4SpjWZe3CCMElFyxQxMBdoHTu8HkvE8YzOrp
 1jyEjxCx6GWc0dHHLI7iCLTBKchBTKbL5nNaWG3vlc7SBXGcaH8ZL1jSwn4yhvU1fTDE
 7snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k5J2Eht8iwERJLC/7nmn6+F8QQIm7Qe9FlpuPjuUNh0=;
 b=gYPakpCimVX01w//hPFGsKmmTVhyodlhmQog6u8rwTiTrILqZBMjZDYy5RFUTGd59J
 f0AD0XaykWDyIQbimTyL3p54cgxwgZdZM6CYwTXeof/xWhiCWwApDbKUGLkP3+50dLqr
 k4+ctMnByuc7OnZpYVToewn6ra2izQjP/sv0yllHdHA5BwMGNJvlXHLXp8BjV+zJSzkp
 r2p/UfmqT27XptDGQVIo9IJt0PUestLYTY/+d80rC9LDvU6rJy/L+Z0Jud190x1Zm9U/
 AdBzN/Ceaj9NlwfgzgAZhOyzWjBjKa4i5s2DptHK3OzV5IMAWWIGtyLdJ7W1vUQd0nO3
 HB6g==
X-Gm-Message-State: AOAM533wxcvT5vXm9kpq4z2Y+tPEuHEj3wbEbWv1Shv7xbtSdBNQR0+2
 9erXpCW9JyM6rqpE662CIObXZCfi4W0KEsZ5wUU=
X-Google-Smtp-Source: ABdhPJyo7c1bRZQRQ6sB+ZAz5ef3egpcl4ZZjxNH5fj49RmNLHI7HY9A6iCt87WHujB5d9zRMwm0PHzz0MDVWvH+PrI=
X-Received: by 2002:a50:d987:: with SMTP id w7mr8205256edj.113.1600844745570; 
 Wed, 23 Sep 2020 00:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzrrjzx=msAadV8Ru_7shvOWdCunQt733Gy_fdyYS=4Xg@mail.gmail.com>
In-Reply-To: <CAPM=9tzrrjzx=msAadV8Ru_7shvOWdCunQt733Gy_fdyYS=4Xg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 23 Sep 2020 17:05:34 +1000
Message-ID: <CAPM=9tzf8+OhF0UXRRweCRwT8wXa4mdhTNT31rZwR1Rd9ZUzPQ@mail.gmail.com>
Subject: Re: rfc/wip ttm get rid of binding branch
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Sep 2020 at 16:27, Dave Airlie <airlied@gmail.com> wrote:
>
> Spent today trying to straighten out some of the ideas I had for
> dropping bind/unbind paths into drivers.
>
> https://github.com/airlied/linux/commits/ttm-no-more-bind
>
> I think it mostly trends to the right place, the bind/unbind paths all
> end up in drivers, you get a move/invalidate_notify or move_notify in
> drivers (only drm_gem_vram, still uses move_notify).
>
> I've only booted nouveau with this so far, just looking to see if it's
> a good idea or maybe I've gone too far :-P

I've thrown some more patches on the end to refactor out the common
code from the accel move paths.

Dave.

>
> Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
