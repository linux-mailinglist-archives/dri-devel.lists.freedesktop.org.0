Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC01A6C2FB2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 12:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC02A10E708;
	Tue, 21 Mar 2023 11:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E95610E708
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 11:00:08 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id cn12so12333242edb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 04:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1679396406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BnPH47VUGaW83OKFKwyvzlDoa9NRlqykULjc8SNFhY=;
 b=cPjEB1AyFBp/LcklB9JYIp6DclRBtYqWlcI28ZCUM+aehkUvz4BukhYhfh68Fg2mfK
 Giz0jsIzc4IETjk4lrsUwljY/PkjfrmJRB/QiwDd4AvrQIPECjqCJ5doHjIspl+3eQZf
 P5c74paQh/sRjNpJZFQHY7AW/gSowp7yedzz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679396406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0BnPH47VUGaW83OKFKwyvzlDoa9NRlqykULjc8SNFhY=;
 b=vEvKSAhx8QDXcBxXuqzkgR7NAMr8pPKnMRH/+CVsKUL0bP2RcIHSjtroFbWwFKlYvK
 H82hcenOZZ7W0Z7SxQVjDpvN4dWf53CzaKC8qjSh/LvppzpO5SCybnXloKv66kp/KFMz
 C9LqjXjAh3dgBVEhOV/ZPxqK75n/ZKe7WZKk7kwhPV42JDqZwE9ioqr1EkHloSSBSXgg
 lPjFwN7Vf76/ZsVhYvo76hodswXonSYpZJXbzE5EYdlbjI1F7aTlb33Zcv48APSdwjSD
 I+s0s1QjoJptyqJ0epB22zIuuoTq/MBEy3YnAUSB5f84aeunIfNFj1m9crsQFZacUU5G
 7DZQ==
X-Gm-Message-State: AO0yUKXizghejk/jSpOs78Sy+Lox/s1Ue4MCRA2sB72c+YBFqUFSqP72
 ETNpXeOWbkDjM/pGjZWoPlZTMXm/qhlugmWCnhwYHWO+4KaZDSCDAfk=
X-Google-Smtp-Source: AK7set+YkTLQJkyw1mMKNnGb6pXOL1gGqYnn3Dq3tgsojySRw5tTJqN9I1CjYgETRFCQq5vrYZC+Ja/f0sgrUK6hbrs=
X-Received: by 2002:a50:bb48:0:b0:4fa:4bc4:ad5b with SMTP id
 y66-20020a50bb48000000b004fa4bc4ad5bmr1423664ede.6.1679396406466; Tue, 21 Mar
 2023 04:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAOf5uwkDb=pkEV_qSshA7PnSxCV82sEwrmivAZhth48ae0S++g@mail.gmail.com>
 <87ileu8jwh.fsf@intel.com>
In-Reply-To: <87ileu8jwh.fsf@intel.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 21 Mar 2023 11:59:55 +0100
Message-ID: <CAOf5uw=g1mU1F=kD6M472LRaTWa2B=Sry4GDGXxDApoZknLfeA@mail.gmail.com>
Subject: Re: display band (display area vs real visible area)
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Tue, Mar 21, 2023 at 11:43=E2=80=AFAM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> On Tue, 21 Mar 2023, Michael Nazzareno Trimarchi <michael@amarulasolution=
s.com> wrote:
> > Hi all
> >
> > I would like to know the best approach in the graphics subsystem how
> > deal with panels where the display area is different from the visible
> > area because the display has a band left and right. I have already
> > done the drm driver for the panel but from userspace point of view
> > it's a pain to deal in wayland for input device and output device. Do
> > you have any suggestions?
>
> Do you have the EDID for the panel?

mipi->panel so should not have edid

Michael

>
> BR,
> Jani.
>
> --
> Jani Nikula, Intel Open Source Graphics Center



--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
