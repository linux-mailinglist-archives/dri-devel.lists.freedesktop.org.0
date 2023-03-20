Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 048286C2051
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 19:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC55710E059;
	Mon, 20 Mar 2023 18:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50E610E059
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:50:15 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id eh3so50651493edb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 11:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1679338213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PE7joPFSPo91MljcNLKy5Pq7cC1AKr/PO4y5JXEPEWg=;
 b=gpuYOS0dkscNjwEuIVohmjELrl6r2lSuUu+c67EIEDrhfKQALn3zDjkqEi05IAEDXl
 odTX/o04IXoITLhCzJNrY7ipoPPDe9znicl/qUIs12X9Q4axHEEAB7CVBf3j/0Z3CL40
 Vdde7GDU1MEgjfb6BkAreZytiReYrq7QFtHNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679338213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PE7joPFSPo91MljcNLKy5Pq7cC1AKr/PO4y5JXEPEWg=;
 b=T/7XUsOTjatlLpsodNG3fW2RkRwYWdESTjrzSRBJHaBZ5U8zVyEq/TXaoYcumh84oA
 Al/NZOwxvr555qXxS/RTFcrZMAf0wZBxmHOdotv75ePOfKujf0sjBfoSb44rvPIfgyRZ
 jC/yoGWv0WW7Mg3WzivNjUA4wP2A0FB+eTS+19LXcQks960D3BTxltTmVEdoMK6EDufa
 rfJ0TCMKGZvWrjbnpRWo6Y3KUxpl4JiqQa7YZN/XBKRJV9dkqTQnb5bxcVJfMR8CNSP8
 ApkX5AnCF5W4H8oYDdcIVOcQpe9AEbEprFo65Sfu7GetDpQ3dCtyt6PfIUY2I8xbCPiU
 atdg==
X-Gm-Message-State: AO0yUKWPiUIp92DcxImXCxGlzh2Et1r99ouaMZpVNdDG9nd+RjYCv2KQ
 cCuOl+zEhnpzsFfZWdkQTlGxQRs+QVR4njCFgXsk3rmD
X-Google-Smtp-Source: AK7set+sAVW6LVgEMvjV+uh2Ka3NazR/BjUMHZ0FmDO7WHorPBZkUQAFc0xtTtrstFCt/sNdcnhCHQ==
X-Received: by 2002:a17:906:cc18:b0:8da:69ae:6ff0 with SMTP id
 ml24-20020a170906cc1800b008da69ae6ff0mr86079ejb.22.1679338213229; 
 Mon, 20 Mar 2023 11:50:13 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 i13-20020a170906114d00b008e0bb004976sm4748324eja.134.2023.03.20.11.50.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 11:50:12 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id o12so50681241edb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 11:50:12 -0700 (PDT)
X-Received: by 2002:a17:906:aac9:b0:927:912:6baf with SMTP id
 kt9-20020a170906aac900b0092709126bafmr17779ejb.15.1679338211916; Mon, 20 Mar
 2023 11:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
In-Reply-To: <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Mar 2023 11:49:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=whXi1qgeDLHbaCyMpZ4XXYqS=fT2daYAmWntEK2rhG25g@mail.gmail.com>
Message-ID: <CAHk-=whXi1qgeDLHbaCyMpZ4XXYqS=fT2daYAmWntEK2rhG25g@mail.gmail.com>
Subject: Re: Linux 6.3-rc3
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 11:26=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Hmm. I do my arm64 allmodconfig builds with gcc, and I'm surprised
> that gcc doesn't warn about this.

Side note: I'm also wondering why that TEGRA_HOST1X config has that
ARM dependency in

        depends on ARCH_TEGRA || (ARM && COMPILE_TEST)

because it seems to build just fine at least on x86-64 if I change it to be=
 just

        depends on ARCH_TEGRA || COMPILE_TEST

ie there seems to be nothing ARM-specific in there.

Limiting it to just the tegra platform by default makes 100% sense,
but that "only do compile-testing on ARM" seems a bit bogus.

That limit goes back to forever (commit 6f44c2b5280f: "gpu: host1x:
Increase compile test coverage" back in Nov 2013), so maybe things
didn't use to work as well back in the dark ages?

None of this explains why gcc didn't catch it, but at least allowing
the build on x86-64 would likely have made it easier for people to see
clang catching this.

                   Linus
