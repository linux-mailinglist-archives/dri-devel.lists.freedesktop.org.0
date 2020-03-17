Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B2B189020
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 22:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C768389A20;
	Tue, 17 Mar 2020 21:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BDE899EA;
 Tue, 17 Mar 2020 21:11:21 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t13so18821375qtn.13;
 Tue, 17 Mar 2020 14:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xWvKJyoLe0n4ETU4ROnZaZHuAR9Kb/xYlBn1Kyfb/2I=;
 b=LXbsNsQs4J0nFecJC/399qvy/mOdjr2TLKEU7IcaiIj15MdW3XtHHYIUCXrLmA2EDe
 lC0HSaXlNaEZcrTG0ZB12kbaBJgWFYmPPeEh9gkzSHi6JuqnXkhVE81aTGKPXhW2npXH
 QnxuI5ylHzxObV/1bEPpc48fhOtsfKzuN8cZ8NqbiJshGO+UJImchxjYvenmqkC9xN7p
 kZa03XoBt8HxySFJ9BPpDya4K8WvCj2ZE9aMv2/tQcQiNuB/9OvMn3wd+lUcMfm5h//p
 LzAi615dvaJFzaJ2N7wDUt+2Trr5clGGgFJ5uafG4DnRf1E7L4ji+gaK3pocNBdy/31b
 6OWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xWvKJyoLe0n4ETU4ROnZaZHuAR9Kb/xYlBn1Kyfb/2I=;
 b=A32iQ+Z8FCiZHsDa+ne+ZodbSFIRdr1thcVuq3cGwp6ZEbIeqcE1KZnxWVZoZ8n/S+
 ljyHJPTai+7nGnMvJgnmmdM/omhU7GeBNKx/vhGYfXI2KkHTE/KZEiGDqeWQwfBrKJjO
 fHovQ6ec9IiiAR0wg80TJqHwjvVwm5mJc4z9ofC8QYXrJylmlppVgxTSISXn4f9nRPQN
 bMNVYGGKkYvZo53tWwnlDKcxY7mmVy/Dqpo+JKH9ymoYzwiaXBZqu0bp/IVUK9MWOC6C
 +zOypCEH74JOhCUUPvw4uVdAa75g0uAtxGHb27GltGgcN2SBEuJ/N4/D8GIMoxjqDFam
 GFNw==
X-Gm-Message-State: ANhLgQ01xSC0SF52jaSqHaGXRsKBjFcAL7v33OlCpUM28m4GD1OfKVXe
 avf8WqfVNwbGaYFrT2aPh/XWycv76jS1zBKvTvS9a9jp
X-Google-Smtp-Source: ADFU+vuGxbpa7IcGW2QOR3phHUZCGMknRWrUEGcBgRBkqEmjDLap//vy6M5qkLglaPBCEjnZtB2CrJ+zpPeF41M+OuM=
X-Received: by 2002:aed:21c5:: with SMTP id m5mr1197629qtc.42.1584479480951;
 Tue, 17 Mar 2020 14:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200307135438.9981-1-yuq825@gmail.com>
 <CA+E=qVc822KmCh9whPqZJfQT8xRR-ZVEai6pSp0MGOFduD0pyw@mail.gmail.com>
 <CAKGbVbtP9qS7rt-uOMKNhFWsyUnmXPgKEkkpfT6aOf_nONdxBA@mail.gmail.com>
In-Reply-To: <CAKGbVbtP9qS7rt-uOMKNhFWsyUnmXPgKEkkpfT6aOf_nONdxBA@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 17 Mar 2020 14:11:37 -0700
Message-ID: <CA+E=qVeA+KrLZ1u9bhCSOXQbD4KD9Y93ad2SE9_bdDaAb9PNFQ@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: add trace point for tasks
To: Qiang Yu <yuq825@gmail.com>
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

On Mon, Mar 16, 2020 at 6:41 PM Qiang Yu <yuq825@gmail.com> wrote:

> Not concrete reason, as the comment, trace point when
> dma_fence_signal act as the task completion event, so not add duplicate
> one.

I see. Patch is:

Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

Regards,
Vasily
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
