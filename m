Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B45980371C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 15:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF6810E1DF;
	Mon,  4 Dec 2023 14:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C9610E204
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 14:40:54 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3b8bb35cbc3so864821b6e.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 06:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701700854; x=1702305654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a/RL+qJZ9tCrBol6bLzqoJj0JTPrQjKpCz8GlkVVNs4=;
 b=QM/TN6GKCZv0Tcx2Ex59MkNQrRWJgzD2vDlve/FfoIezCW/bp3vNFoWB7I2EDSGJUJ
 DmLW3hK73DzX/6t9en9RbVYKOP/vpIzUcNnr5NBmcyn3UiUut59PrahOwRYSpeqOllFP
 G+p5vkhpRmB67shr17bvF4XUmDa5zRpKLEJapMWahiU0ztTUyDuxjkoaqvsfgGRF4kKG
 WewVish1VF74w8yzOf7pydXKyV+5rOQi1iZmFmQsl0dbW2exgUur+yQrHcKgLDoIihbD
 nEm+4IBJ/kG7hqq75Klhi0NpVtfJPyLzWosriRCwudbHRmUraBoM99XCEDfUJgYpap4Z
 TxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701700854; x=1702305654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a/RL+qJZ9tCrBol6bLzqoJj0JTPrQjKpCz8GlkVVNs4=;
 b=ChWu6tOTMll2hycWkTw7w/n45vun+tjg5VlCgmeusX8faVQvuMSNYsIpPaymVFAdAl
 /SLfThkRgh4kIUkKQqOF+yfWJvQMPZQ8Kb1xUCdhO5a1IOExqHVb7/UgS/UFdHv0Wo4J
 v8YtovTME10IQzBHR6HPTuKKFf3EPHtiY0e7ef2golAieesu0GvivQHtExVj9xuC2J+T
 3DKMkYfFJJvXUwkVH1+c9Ncll4Vlym/UCeSVyUZheMv8SwlaLbZm3yUT7govfdjFyqRd
 PXDbNnhHZo1VObdhcaJqr/LNSn61Y3qM6lQ5u+Ca+9/wBWfr0M/xqE180aCFKAqpI0KO
 pEWA==
X-Gm-Message-State: AOJu0Yyd3k7uY49azgoMdPJkh+BfjIfAfEgVWyJnSzqbZlDmdtxbiAOm
 mP80/RoPdXQxJmYtXahRn/kNbMBsUqjepWRU8D8=
X-Google-Smtp-Source: AGHT+IGOI6qcOGEUPSDtRDE0p5lbZQ5stLXkZgsAtuhVSAZljSoLi0AT8jurH0JCrCgPOP/Mb4+XR26LBbDWMFAwLP4=
X-Received: by 2002:a05:6870:569f:b0:1f0:d96:8d9c with SMTP id
 p31-20020a056870569f00b001f00d968d9cmr6345018oao.9.1701700854038; Mon, 04 Dec
 2023 06:40:54 -0800 (PST)
MIME-Version: 1.0
References: <96343bd1-2c61-47da-965f-26bc385ad268@nelint.com>
 <8734wixonl.fsf@minerva.mail-host-address-is-not-set>
 <1e756f21-10dd-401e-b327-7d629cceff2f@nelint.com>
In-Reply-To: <1e756f21-10dd-401e-b327-7d629cceff2f@nelint.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Dec 2023 09:40:42 -0500
Message-ID: <CADnq5_MKof2n5_Le4dH+5UAGi77p4UmWk6HSG-p=QMdpxKw80g@mail.gmail.com>
Subject: Re: fbcon on one of multiple displays
To: Eric Nelson <eric@nelint.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 4, 2023 at 8:52=E2=80=AFAM Eric Nelson <eric@nelint.com> wrote:
>
> Thanks Javier,
>
> On 12/4/23 03:11, Javier Martinez Canillas wrote:
> > Eric Nelson <eric@nelint.com> writes:
> >
> > Hello Eric,
> >
> >> Hi all,
> >>
> >> Is there a way to configure a framebuffer console on a specific displa=
y
> >> on a machine with multiple displays?
> >>
> >
> > Have you looked at https://www.kernel.org/doc/Documentation/fb/fbcon.tx=
t ?
> >
> > There is a sysfb interface to bind / unbind fbdev devices to fbcon's VT
> > (/sys/class/vtconsole/vtcon1/bind) and also kernel command line paramet=
er
> > to choose which fbdev driver is mapped to which VT console (fbcon=3Dmap=
:n).
> >
>
> I have seen this, but it's not clear how we can use this. In our case,
> we have a single driver for two displays.
>
> I hope to get a device on my desk this week to test it out.

Are you referring to two devices that just both happen to use the same
driver, or multiple displays driving by a single device?  For the
latter, drm drivers at least only expose a single "display" via the
fbcon emulation.

Alex
