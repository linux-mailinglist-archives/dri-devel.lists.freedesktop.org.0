Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76351A0DFD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 14:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EFE6E86A;
	Tue,  7 Apr 2020 12:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4876E86A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 12:54:21 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id h2so1619321wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 05:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DDQFPolFWJWG/1IvUj6VCZMeUuQe9UfPCyLh49NqWnQ=;
 b=DmKskPnvJ2lpJeIsGzhcwv/8owTx4340QX4m9v6Q8vdZDAzvDUukqTEylSZbcdQSTr
 +c8t0LudacOOsHpZsbSCgqkWL+e1CDeQWr9sC/ckzEpkcMXUb9l61GXZjEv0IqHTrXEY
 aOzQtrD4XmRdAb9G4plKj9d2ESilYzVEA4rpPk/szIuXIhc983v4TXxL6qv8KGH+eOBZ
 WrPMK/PpcnAv8g6AQY+U6ROqM3ghLxSnGGlUfeVnQGyZb8Dod002XViJB8QYQVUasjU+
 6WyhZpq29RX+9anPVPGsUH9gljHBS08DO6Yb9UVyJhUqc09UO4Nk2E22JKUIC9dJCMux
 BrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DDQFPolFWJWG/1IvUj6VCZMeUuQe9UfPCyLh49NqWnQ=;
 b=Gquno63zR9ZRHK/BYkW+9yyQ8xjaXiTtTzOVCoTgwxY/fjar93Bksm4fRvhA0JuuR8
 qlg4OoF48GA1JQmjHkcvbnfLx9s6IEG0RG7PjyKTp64q3zFSXQcpD2jtc4ikoPDPuoLB
 diJLjonT+T1EOsGPC6TaQEyYgKQwU0p2vpwwNQMSxNF4kZ1ASKouOUtBcX4iThW0haI3
 xLj8h79Za5/wmLdTiQ9e0WVRYEtOL6Qim8iYOXYqsjQKWrqxpAEI2i8QfaSVehqzwV5M
 IcZxwhkJ9Q5/ZxVeI++Mjdw8j04AHpzmcMR2Itg6tjFiELBbw36S448S6+G0zijMZ4OZ
 rbQg==
X-Gm-Message-State: AGi0PubtzTLWTLD1HZg+A64E4oxUIPP2tBkuBXxkMzX3JmZ7iSyjmuYZ
 ZdNhpUW5IDHeJYI+2rHg9EYuoB13raj3CgOgVijqDQ==
X-Google-Smtp-Source: APiQypJrtBKg2Vle5BeUaQc/wKGKLGVLlnQbTOb2JCnNAinW2DxaTToWo3kU3CvEjKBo1qwIqhgs80xULfHVsux8OLc=
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr2315395wmi.147.1586264060559; 
 Tue, 07 Apr 2020 05:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAN=K5G92HHwFqH4FPeqfJkD-hj8HJBy+7dTWEg55BP_HnHFjKw@mail.gmail.com>
 <20200405112131.1b2c5fc0@ferris.localdomain>
 <CAN=K5G9kfQyDWJ1A+UXFtkNnZs3rryTRj2m-JaVAemJRD4CK+Q@mail.gmail.com>
 <20200407112317.0d531278@eldfell.localdomain>
In-Reply-To: <20200407112317.0d531278@eldfell.localdomain>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 7 Apr 2020 13:53:10 +0100
Message-ID: <CAPj87rPEGkrjRfWpjpU+6ttov2JtPMBROZS5so1CcGrbMHwYJg@mail.gmail.com>
Subject: Re: Curtaining API / Force blanking displays
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Erik Jensen <rkjnsn@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 7 Apr 2020 at 09:23, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> Maybe I should underline the read/write race:
>
> You do not get notified when a display server updates the screen, so
> you poll. When your poll returns a new FB id,

And that's only useful for Wayland systems. On X11, the server can
(and often does) render directly to a single static front buffer, so
whilst the observed KMS FB ID never changes, the content does. Which
you only know about if a) the display server tells you about it (so
the magic isn't all hidden in the kernel anyway), or b) you just
blindly update the content on a timer.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
