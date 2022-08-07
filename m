Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A814A58C37E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 08:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A768FF3B;
	Mon,  8 Aug 2022 06:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867221138E8
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Aug 2022 23:37:20 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id v2so5345059qvs.12
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Aug 2022 16:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dosowisko-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tk4lJmjCtGQ9DW3EP5ELEcoY510rpB0Aq8haLsJgim8=;
 b=hPiC/xpk9PLSDyNSrz9zBfuUielDp9yQOmppp5dB5ek2MnhQl+Rdyf52nQoxsJ3XHk
 YxXLI3PNwFq3j7nt4S+Ot8w7GWLNM5vZ+CSoDybLzPf77p0e5/q6ZZydO6LV6C/TFBtj
 nmBpw5dKQaXWHBZ//4S/0yX5CXXQN7fI798r6NMFxQmING1+qwWNbBvZWyyy73ipiZjA
 WQOAouNrxsDc41WWUOiirkAbU9DwvGHjLNq6SaqYLF/OD1V47q2bN0uo/5tuDKqq1N1G
 DIeC3gGZxyGy9dHagESc4Pfeq1XD6ciYYT8c4RojlJ/9V7TVyxY65mq+u/tZOfZaL71y
 xPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tk4lJmjCtGQ9DW3EP5ELEcoY510rpB0Aq8haLsJgim8=;
 b=sYB0p1uWVJeuSbRvY2Iv2LdsfTVg0bhI8kAAx5Ij5TaQ5sjQ0f7FIDHYgU8Y280M93
 9csEELl4D00toKRpFHnoydN4TfnTvewQ3XT/UaYL/UkXaAMNILSPZxJGNeJiq5RPONjg
 ZkrvhnqyALoMc0NuVpIQnHxU8IbfM7iNcs8AK3zl2GY/1sXYHqajA4Mp95LKI+cQyKLX
 3SdNt+3x+SF3osz/eqtCyeK08R6xX8rFEgMU2Dm9NXwWRb4h4aBLPo3n655qn4YOcxhv
 fFBheLq/8OsyW0BXIzNifKwH18lk9pYU8Vc5U24RPkImdiCAfEDchtEpiJZhNSUv5nNA
 HDRQ==
X-Gm-Message-State: ACgBeo298jkqkr9uDc6rawrw4z80G1/ZIQs65knTC6PhRXRU4uqh5gfI
 Hwx4eMsAexPtH3ABR0jqe/5KExPqT8jqVFg69Tq0HQ==
X-Google-Smtp-Source: AA6agR4+YURb8O7hbK85WOABXS2cugTgh9dOqypwbBsLPxwDCsGV1dig2MD9ynFcaEIvVBtiJ/kgRP8D8DrRAWW3yyI=
X-Received: by 2002:ad4:596e:0:b0:47a:2ae5:b65e with SMTP id
 eq14-20020ad4596e000000b0047a2ae5b65emr7017175qvb.109.1659915439313; Sun, 07
 Aug 2022 16:37:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:620a:280e:0:0:0:0 with HTTP; Sun, 7 Aug 2022 16:37:18
 -0700 (PDT)
X-Originating-IP: [83.24.7.184]
In-Reply-To: <2beb027f324d4d60a1d1bf10fafb65ee@garmin.com>
References: <491b09b4dd40404c8559513713bdb17a@garmin.com>
 <20220806144700.0519b70c@ferris.localdomain>
 <2beb027f324d4d60a1d1bf10fafb65ee@garmin.com>
From: Sebastian Krzyszkowiak <dos@dosowisko.net>
Date: Mon, 8 Aug 2022 01:37:18 +0200
Message-ID: <CADZ+VTnQhYToj1JacMYTCHUavf7hhe8Ds-cEVB+=xmDukiZBzg@mail.gmail.com>
Subject: Re: How to test whether a buffer is in linear format
To: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 08 Aug 2022 06:47:43 +0000
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/6/22, Hoosier, Matt <Matt.Hoosier@garmin.com> wrote:
> Any idea what=E2=80=99s up with some compositors adding code to infer
> DRM_FORMAT_MOD_LINEAR semantics when the buffer=E2=80=99s modifiers are s=
et to 0?
> Wlroots, for example, added this as a =E2=80=9Csafety net for drm drivers=
 not
> announcing modifiers=E2=80=9D.
>
> https://source.puri.sm/Librem5/wlroots/-/merge_requests/63

For the record, that's an old piece of code from a branch that hasn't
been used for a long time already, so don't pay attention to it. See
https://github.com/swaywm/wlroots/pull/2090 for details.

Cheers,
Sebastian
