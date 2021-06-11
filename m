Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A103A497A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 21:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189786F3C2;
	Fri, 11 Jun 2021 19:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79356F3C2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 19:34:48 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id d2so11079881ljj.11
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 12:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tUREJcjYiuBpO07752RlqO1e4KYkKB+aItYVhjDXKKU=;
 b=iF4sdKjoMB7UZrrRxeufPi9ePYSwDXXPzglnmrtaVzPpoegEkYXxnnkcfOCzD20gTl
 F23sUxrMmCCzdHs914CK6w9ifdgQQ1hY3RECdsEJMebwbc908ZvoQf2YqRRSj0Vq0RFU
 2+nY1hrCpSKAO7gRs+5W6FPiK1KtloKXlClbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUREJcjYiuBpO07752RlqO1e4KYkKB+aItYVhjDXKKU=;
 b=ielt5pbY0j1qx1j3p+dN2PJjBnNPpm72LEXh4rUCXcYkGC9dOXoYWu6xU3JGR3s36Y
 Sqzzunm4O+W59z+matKK9atS2A/HTu6bNxgWize6azJI++eo1QHyiEB0QOrcmU45auyw
 6tUDKZAiifRWn1dvpEIPmkxwsGuyn5kMeSkefLsC+/hGmbLgbYSyhZfpiFJdW2lPfJ5g
 E3TfgALAKpBF+uOg7X5zCvCH+fnI1sz+5s07UVo3FYFqBlTJEpWxCCXY9/CAswNEt4CD
 R2Yy+CDbyGMWweAhRy0oYwUNLoYBuwV/BgkzuxMDmxfPlIYmBnjTPXT9+TfEbFlEdrPi
 AIbg==
X-Gm-Message-State: AOAM533DZeawMjAo2a/Zf5Z0A7T/GeGp6u98B7H8mZGMJwY2aRezI2g6
 axWL5tzlapdgjI0gz9c4QSK83/+JicKyD/ICb5c=
X-Google-Smtp-Source: ABdhPJwHw0V7MFQ9Ub/ZCMDpe9SLgplxmEFLewy3ERZGoLNG7Q5S1HpzeC4JNXB4JTG0AsCNubVKWg==
X-Received: by 2002:a2e:9c4a:: with SMTP id t10mr4302124ljj.307.1623440086255; 
 Fri, 11 Jun 2021 12:34:46 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id b16sm826975ljh.93.2021.06.11.12.34.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 12:34:44 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id bp38so10203182lfb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 12:34:43 -0700 (PDT)
X-Received: by 2002:ac2:55b7:: with SMTP id y23mr3451884lfg.40.1623440083600; 
 Fri, 11 Jun 2021 12:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyyyQ-0QkKquLX4q=7=pjGeRxhhP=z7rfLjEbX7mSrh5A@mail.gmail.com>
 <CAHk-=wgT1ZXOGRjBHbvw+GqY=qUv4oHv8BZ6FpSay6z_0FxkPg@mail.gmail.com>
In-Reply-To: <CAHk-=wgT1ZXOGRjBHbvw+GqY=qUv4oHv8BZ6FpSay6z_0FxkPg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jun 2021 12:34:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiv-MFjHYDH4wCi401fomZHKRLSeaWJBYxRe8vq7tujQA@mail.gmail.com>
Message-ID: <CAHk-=wiv-MFjHYDH4wCi401fomZHKRLSeaWJBYxRe8vq7tujQA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.13-rc6
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

On Fri, Jun 11, 2021 at 10:07 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I think anongit.freedesktop.org is sick. Can you ask somebody to give
> it some tender loving? It's just disconnecting immediately..

Either somebody gave the site a hug, or it decided to just get better
on its own. It's working now,

              Linus
