Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA5173313C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBA610E60E;
	Fri, 16 Jun 2023 12:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E413510E60B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:30:10 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-bd729434fa0so596106276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 05:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686918609; x=1689510609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1jmeKu3xtS8CuR0+oM8t/t7adkpPRmpJZYzjWIEWdXo=;
 b=OlKCPuauWEnFDAWMvAW1ZQggCbsl2oMk0JfC9sIiqtoqkauMAjg5qztHJUOJL/6PgO
 P1h8H5Q7FjBfOBR52Klg8tfx1CWPl7E+bJ0V+nCLXYktspPAkU2xKeOSLvZI/VRR0q2s
 +ULjb8DRmKBkn/ToOYWnlHUw0EMAhq4BHKugFIaJ+Zl0k2mOI0D6NRiohGQd5GAFXofb
 LgXlOAla3xIgxKQf+LL5ljf/K3z20B4CPIRw3s9R2bStcuuohPsh/kmSjMP+qZO16IEc
 4kUrRCKWdDeZ27YR8klWVwhAulDS3gj3+NPqLwFsJ9hARYcDIAwVdMxWkFZzTTtFALp0
 6JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686918609; x=1689510609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1jmeKu3xtS8CuR0+oM8t/t7adkpPRmpJZYzjWIEWdXo=;
 b=Bg5Xd8ZshfrgeJ5MKhI7h8qdMedgwaL8jj9dC7dnqwX40wpa8wkptJs6kUY8BFMA/0
 BKNhNFCjT6Mv3B36FcM/Hn2pcF6VIMPR2lN+Nu5Alezudx+aYq0/KF2blOtOWY2zCLOL
 qsl69g/fLaeztnRmS7302B7ewFeFryB4gVPnHUJ+KG0kTuAI8/VPUnUaCaMfCM7Wiwx8
 LkTyPsqaTdA/t6SlEAfFeWxNwG1e9YPsir5ol5rWail1Fjy3hYSRUztRfxt0vBADTuSx
 nthKvgjeAmVH+XIXTw16agWOaY4YZ6PNQb1u+qTZpeXBBSIzakgbz6s4+IPh7JqbeBsj
 b1yA==
X-Gm-Message-State: AC+VfDyXK/b7MJpmi8apUFJ9A3Rmz8+BJ9G8eCjtTQ4rMDPrZWjWf5uy
 IQn5b+qKHWiPnY0R1LE5w+NfDrTKZTl1shs8lfxU5w==
X-Google-Smtp-Source: ACHHUZ5eiqLOX8m5o+3FG85CuBD8YbWABFmQ3Y2+GR2cao2FM3Slt9jzWvYP/nFyyutrZ/Y+lOG+b7OJrT7x2j8zHDs=
X-Received: by 2002:a25:c405:0:b0:bcf:b33f:ec38 with SMTP id
 u5-20020a25c405000000b00bcfb33fec38mr1905845ybf.33.1686918609664; Fri, 16 Jun
 2023 05:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
In-Reply-To: <20230613144800.52657-1-sarah.walker@imgtec.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 14:29:58 +0200
Message-ID: <CACRpkdYAAxvHLfEGFwaHQYvZRNhySNo7gSVEBSgGP-pusBwBnQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] Imagination Technologies PowerVR DRM driver
To: Sarah Walker <sarah.walker@imgtec.com>,
 "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
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
Cc: matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 sumit.semwal@linaro.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sarah,

thanks for starting this long awaited work!

On Tue, Jun 13, 2023 at 5:20=E2=80=AFPM Sarah Walker <sarah.walker@imgtec.c=
om> wrote:

> This patch series adds the initial DRM driver for Imagination Technologie=
s PowerVR
> GPUs, starting with those based on our Rogue architecture. It's worth poi=
nting
> out that this is a new driver, written from the ground up, rather than a
> refactored version of our existing downstream driver (pvrsrvkm).

This seems to be a fairly good starting point, a bit of trade-off
between latest-and-greatest
and recent enough devices that need aftermarket support.

I assume you are aware of the community existing around Series 5
(should be the immediate
predecessor to Rogue?):
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx

I don't know how active those people are these days, but I can see that a b=
ranch
was updated for v6.4-rc3 just three weeks ago.
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/tree/pvrsrvkm-6.4-r=
c3

I think it would be good for community building to make sure that you get t=
hese
people involved in reviewing, especially neutral stuff like device tree bin=
dings
but also to make sure no architectural choices are done that will make it h=
ard
to retrofit a proper driver for the older engines if this community
decide to work
on it.

Specifically I would ask that the DT bindings include all old and new Power=
VR
hardware in one go, unless they have very specific hardware definition need=
s,
which I doubt.

Also I think they could use your help to get the proper firmware for the ol=
der
hardware licensed properly from Imagination and included into linux-firmwar=
e
so they do not need to ship files on the side.

Yours,
Linus Walleij
