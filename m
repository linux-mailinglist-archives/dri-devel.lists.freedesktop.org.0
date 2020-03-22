Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D840218E5EA
	for <lists+dri-devel@lfdr.de>; Sun, 22 Mar 2020 03:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F330A6E03B;
	Sun, 22 Mar 2020 02:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DD56E03B;
 Sun, 22 Mar 2020 02:03:39 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g62so10566161wme.1;
 Sat, 21 Mar 2020 19:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ybAkI0orVHtL+UwZhseFdpLHgUln9AQt/W3YEzRYU9k=;
 b=qBpqltZ+sUdC6Cf3XNx3z2D2Sn+xsCIJmDcpwAxm6qCsXgilD9EmFHvrYCP6B0INCy
 nxNTA7oSCUkbwaiWzBBcz/NJf3nE4Zebs0FDaKCBIUJdaCGUUr/DqGsJ9L++FSTadZIw
 u2Pkbvy+HvHKdCDi+ii+Oa5FF4D9TMZwse+Y1vy/03jNvdQX7bZ1/OxPk2zBL481VzXq
 dFRB9yAmjQL9s3aRxw80As7h+suQ41TFP1qIJIPxsukNapFMU7QteoarXJR6Rd7JbHsj
 5y3qJeczKbvo1u81dv6fVfaSdpbCogYIlIISuA+BTArfYxvqhPtdR9I3nuFOhRWVtogI
 59YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ybAkI0orVHtL+UwZhseFdpLHgUln9AQt/W3YEzRYU9k=;
 b=QrwcVGzel5ZfTuKFaORzzI7FWU6y60Orw/wVft7MDoW3WDCpAGmo0TjY4ERJWMhy6e
 BlT7UE981V0MgG6z1cwHzvuA7iAkzow6ZYM6uIVPn/5UH5LDav/3gj/DmknGT8pYd4vQ
 Jq+6pcZ/PBlb/s01S8a9/jCy3hU/y3t4ZL7C206dCV6vHT5uOKyPmJ0/S5/qw+rjTBQJ
 BRqy+HY6kzRZXKZUc0RYlc8IB1krUzukcOpRTXMfaTtfzfewC1riH4Yu5OaAtOBeRcgu
 AQ+0XcvbnQ+HuE0piaERKCXaxzBLKkhi1I2RjDotVhKGY30AjMoUBeiZMzab2pv1oX3M
 g9XA==
X-Gm-Message-State: ANhLgQ20doYoJnWyclk5RwQ25wlJu4HSVA5O2QEszAKLv9QZJLSpzA1c
 MxvmaGhldumUF6j7s0AbTltTPjSJXLbtHswcwQc=
X-Google-Smtp-Source: ADFU+vvKuQawSuYs0h/dPxRLK9QjKyetQz+a5YZTDAJgWMT58dhuYLOJuOvBLlu6xj84AqZBSyKEYL2B9Zl3YneYZxY=
X-Received: by 2002:a1c:b7c2:: with SMTP id h185mr19505819wmf.67.1584842618163; 
 Sat, 21 Mar 2020 19:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200307135438.9981-1-yuq825@gmail.com>
 <CA+E=qVc822KmCh9whPqZJfQT8xRR-ZVEai6pSp0MGOFduD0pyw@mail.gmail.com>
 <CAKGbVbtP9qS7rt-uOMKNhFWsyUnmXPgKEkkpfT6aOf_nONdxBA@mail.gmail.com>
 <CA+E=qVeA+KrLZ1u9bhCSOXQbD4KD9Y93ad2SE9_bdDaAb9PNFQ@mail.gmail.com>
In-Reply-To: <CA+E=qVeA+KrLZ1u9bhCSOXQbD4KD9Y93ad2SE9_bdDaAb9PNFQ@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 22 Mar 2020 10:03:27 +0800
Message-ID: <CAKGbVbuJWLy5ei24LA+r7bX6MT7Moehj-cNT9BPFxGEQ4TJ8MQ@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: add trace point for tasks
To: Vasily Khoruzhick <anarsoul@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.

Regards,
Qiang

On Wed, Mar 18, 2020 at 5:11 AM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> On Mon, Mar 16, 2020 at 6:41 PM Qiang Yu <yuq825@gmail.com> wrote:
>
> > Not concrete reason, as the comment, trace point when
> > dma_fence_signal act as the task completion event, so not add duplicate
> > one.
>
> I see. Patch is:
>
> Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
>
> Regards,
> Vasily
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
