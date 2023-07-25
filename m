Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC43762141
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 20:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CA710E194;
	Tue, 25 Jul 2023 18:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B514110E194
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 18:23:06 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-d0548cf861aso4887388276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690309385; x=1690914185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q5yJxpU6xDG6OF8KLnCz3+16QubBrgDtPLOu99x0f+k=;
 b=odUBHZayifA8Q3Ee2DnhxQ9lBrv2pxZfnhsPxnsajjwuGiP3S10r/7gIdGifpD7FHV
 MvIOF8elF9HBBIsmg1pyGuISA+7Gmm4BuEKP/LU2AoDX3iZFXjE89i85m9KdcKRIc5B0
 gwh5Qaun4O7kOSGCGKEMDU7OMtWyf6Wf9HkEjyih1fmcQTyKYvnB4I/2Oj/i84nWcLZU
 lygrDhJ2JKqlmtiSVq9yQwjHO+ZZhchNRbrzTWUTUmD1XCwfU6I0lZAhels+NI1/n22/
 l0uzLftt8jSOFoJjSutvaqltNYjh4gJjuVaj4nIAvahV5GxnK9xgZDMalPBgLk6giZ/+
 KLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690309385; x=1690914185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q5yJxpU6xDG6OF8KLnCz3+16QubBrgDtPLOu99x0f+k=;
 b=djz5ba7MgbiUKAyUPSP10rP4m6gn7bQ0MvJuJ+6cODU2gCe3RiPPXdVUpIHahN6EO2
 hWucq7ji8Qx8YrJxFr05NY9jg3h4dXGTu5JpvliR82s+wysMTLiR+GLt2005yKt/muzs
 v6uj+toi+xFiqk/blGzcmmHmJIxRjDJArDH08iBb9eM5Stj0R33rVTnRsEPf0A7xqF1I
 7IFKKrWTpC6JZFJkSeKv00bx2GpofTuaDMALdsBIRn0HrBNkmvanlJzFYVLJ2X/f0dev
 4Md77/pbIHdRV5fHodvNgOTJlqDgin8FItK+0rsRLHjYosGObjytm5hllMf8gQ323oZL
 Dd/g==
X-Gm-Message-State: ABy/qLZ5CSEp5HTg+Bmo+x46cMVC4t8Hewctgpo9jSBvOoK2sJuBEqPW
 jRH+y/SkhvLoJ21fAZSZ+C2FdNXWZ7SJGki5byYFGQ==
X-Google-Smtp-Source: APBJJlEYujHAzIBUdxeqCcqRIaJLIz/gGWkCCmtMC4KMe82w8HOo1f30KheaXVSB1T+tfJLhBiwxEWpd91aypJAi9zo=
X-Received: by 2002:a25:6dc2:0:b0:cac:e20:90e3 with SMTP id
 i185-20020a256dc2000000b00cac0e2090e3mr9515996ybc.63.1690309385295; Tue, 25
 Jul 2023 11:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230719152007.197710-1-arnaud.ferraris@collabora.com>
 <20230719152007.197710-3-arnaud.ferraris@collabora.com>
 <CACRpkdZ2Fu8jyyyDd4e1yq8g4bDoj2gCd4KnntST8uYvDNKUZw@mail.gmail.com>
 <0623ebc5-eef8-2c93-040f-eeeabc79ce17@collabora.com>
In-Reply-To: <0623ebc5-eef8-2c93-040f-eeeabc79ce17@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Jul 2023 20:22:54 +0200
Message-ID: <CACRpkdY75A4NU3jyZfShNjd+mKhHmnNZY4+1YpAc=RanFBsX6g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2 RESEND] drm: panel: Add novatek nt35596s panel
 driver
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Molly Sophia <mollysophia379@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 4:16=E2=80=AFPM Arnaud Ferraris
<arnaud.ferraris@collabora.com> wrote:

> Their magic number sequences are quite different, however all the other
> bits (power/reset sequences and timings) fit in, which isn't the case of
> the other novatek panel drivers. Moreover, they have similar (although
> not identical) resolutions.

Hm OK I guess.

> I found an old (2012) datasheet for the NT35596 (without the final "S")
> which is marked "Draft", so I'm really unsure this will be enough to
> make sense of those numbers.

I would try to add the most obvious cases. (Such as "command FF", I
am pretty sure it is clear what that does.)

As I pointed out in some other review, long term we want to support
things such as gamma correction for panels, and then this kind of
information will help greatly, even small pieces.

Yours,
Linus Walleij
