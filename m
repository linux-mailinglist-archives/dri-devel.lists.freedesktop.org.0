Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA075346FB
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 01:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA53A10E10F;
	Wed, 25 May 2022 23:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FFF10E10F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 23:24:18 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w21so2209044edi.9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 16:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izUkwPGGxBZu6bQbI1S3gbHIYHJd/Kx9MigGiHCcKQA=;
 b=D5mVvCtGLAYUINLafQ9DPym4MJXRyvQLXXWRjrx7n1C1uIfy36sHQGOdCF5ZndroFS
 ojwLK0DYMvLQiWqXThTIuQmhTToL+5gScEAtihj4NfqxoP3DZ16DKqcSvXm9o0uccQ4x
 DiJ6myHRPJJsJ/KmAp/PUbZBYGYej0SMRpdWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izUkwPGGxBZu6bQbI1S3gbHIYHJd/Kx9MigGiHCcKQA=;
 b=4dLwqV9H8hqR+uQWs1KxIXV3VIM1qYMnrncujqzAfrsbBwUZOodlPvdTuM6fgROZ4d
 LNUcVphdEksfiiVUoTizAjgTQ83BVQdSpkx5a8rSlcuPVV1Bxb+gFvl6WJeqG1hCmFRM
 yQKakdHNqway2PY8fvBkGDeV3wXQ00dOI16oyyHZc5zL6XelxKeLAqCI2vU5lxifXRg4
 rauR5ZaWXE0AdJ6LRm8cmncYJKX6dBsWO3R0C3gvjYF7Zp7HmhzMiArPp2jV4UA26LQI
 S8x0UyV3hmpM366W5q/iDPB1EVN5x3iKGPk5LnkNf/MIQ5KPo/pSyWN7f35WTadYXz+3
 GuTg==
X-Gm-Message-State: AOAM53295MSb2OxfPdSVZ4Sbjxe7mjQrSFw/6s+lVsxTsAOF6EGZe1Dt
 agkaW44RocOGqMEbwK+sES4bnLWrCRn4Wy36CZw=
X-Google-Smtp-Source: ABdhPJzJ0blFebEfQejN0UZ5jrEv07wL/jwBCxNfzNLxHtdFVhFe0/QpJG0E6G3NaQ3BIsjZcdQyRw==
X-Received: by 2002:a05:6402:4316:b0:42b:4d3d:c064 with SMTP id
 m22-20020a056402431600b0042b4d3dc064mr22855227edc.194.1653521056741; 
 Wed, 25 May 2022 16:24:16 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 b3-20020a50e783000000b0042617ba637fsm2825edn.9.2022.05.25.16.24.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 16:24:16 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id
 d5-20020a05600c34c500b0039776acee62so233890wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 16:24:16 -0700 (PDT)
X-Received: by 2002:a1c:7207:0:b0:397:66ee:9d71 with SMTP id
 n7-20020a1c7207000000b0039766ee9d71mr6432677wmc.8.1653521055778; Wed, 25 May
 2022 16:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw62EZfAm0PbiOPmMrpfR98QMFTWGEQcA34G4ap4xxNkA@mail.gmail.com>
In-Reply-To: <CAPM=9tw62EZfAm0PbiOPmMrpfR98QMFTWGEQcA34G4ap4xxNkA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 May 2022 16:23:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgg86+1n550uM3gkhpRyauvWySnRwPHHP6Mm90FF5f7dw@mail.gmail.com>
Message-ID: <CAHk-=wgg86+1n550uM3gkhpRyauvWySnRwPHHP6Mm90FF5f7dw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.19-rc1
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 24, 2022 at 11:07 PM Dave Airlie <airlied@gmail.com> wrote:
>
> AMD has started some new GPU support [...]

Oh Christ. Which means another set of auto-generated monster headers. Lovely.

                  Linus
