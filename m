Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC16E2209FF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 12:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2C66EA89;
	Wed, 15 Jul 2020 10:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46166EA8A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 10:30:01 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k6so2004995wrn.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 03:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vUsZLQ84Hi9x0wI6zL+CozjB+XFKrnOu7T7rlGxAhwg=;
 b=H6scWjiciZChmIAQ/TmN/waKkPyDiubzGYB5FxjXv2oDpFwsiKIrFRCzF4SIlvP3+9
 Cen3s46RiyL0TD3DULVwUDwtHQCtSaWQ24fmAcKtapNPl6EnLtgDKXzFGsWO5vzoJ31I
 UWJXTW+8d/Y3TcTZAp2gdIh/O538p8mdu4z0SneB50Yai1dzlxCpKk2dERvduE20kaK2
 7l3kBXKNnrbm6jDeY/gu6GLEzCtJ4RbSBDsGxtPW9wA7aI0llgRc+qQJsJq8IPAo5Ak8
 0z2ZfIsWU8e01P+M63xfbP/bP3Ews3ER1bpMglKHDTfCCXFSkJnceIRd/OK2M8Mw5ASC
 rueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vUsZLQ84Hi9x0wI6zL+CozjB+XFKrnOu7T7rlGxAhwg=;
 b=RWy6QtqkzyJPpC1yQLyTP73fSWK7Fj9HDC+Gc1vahO/JYR4Cvx0WakgG3WVNE60B8o
 yeuSorrhhHsz6d+tEd21y+0CBqsOB7avA7AIjflx1JenWDodd8KLOEWXzDnaLttCCRNL
 MCaxcGIPXyjwIA0YS08E1aZRczkCtq/zjzmWlsjmDrRR9MGiKFdX20UuIhGtMlm/WgDA
 T6u7xBkVNaK1LPzcIF2f7K0USEkVPr/iO5GuGjtEje1LWuAZcS/HLHH/vqF8eS9XVTbR
 zKGOd1BRL8fM6JWzrm/wCuyy56zA1LooenjxKUEWAvmMx1mPPE2vqAo5Ykct0vlMl2nl
 5dWg==
X-Gm-Message-State: AOAM533G4efhAxwZIsjcBAqF5QvQzYj0dobyLpkdM+fK4HaLmaA+J4Qm
 LckQ8IZxeEKcS3FYIggGwYvIE8lj0xadh8V4P6AIiA==
X-Google-Smtp-Source: ABdhPJxKK0aRo+4vI2Ej1Nue/VQbR5yQUHzsFMkvTI//+PRCIZ5qiavZFCl8KGRLp0wXNxbuqVBWoiQ7bQLb7/Oonac=
X-Received: by 2002:adf:b18d:: with SMTP id q13mr10439960wra.256.1594809000278; 
 Wed, 15 Jul 2020 03:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200715100432.13928-1-chris@chris-wilson.co.uk>
 <CAP+8YyF9djTo++3Gww2NNkOE_=fu9n+HzjoN7e78pVgJf_SP7A@mail.gmail.com>
In-Reply-To: <CAP+8YyF9djTo++3Gww2NNkOE_=fu9n+HzjoN7e78pVgJf_SP7A@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Jul 2020 11:29:49 +0100
Message-ID: <CAPj87rNhUZEqCYcwAvEQ5jfNVT3X6kcjhK7wqPeHpNt-nbTfoQ@mail.gmail.com>
Subject: Re: sw_sync deadlock avoidance, take 3
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 15 Jul 2020 at 11:23, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl> wrote:
> My concern with going in this direction was that we potentially allow
> an application to allocate a lot of kernel memory but not a lot of fds
> by creating lots of fences and then closing the fds but never
> signaling them. Is that not an issue?

sw_sync is a userspace DoS mechanism by design - if someone wants to
enable and use it, they have bigger problems than unbounded memory
allocations.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
