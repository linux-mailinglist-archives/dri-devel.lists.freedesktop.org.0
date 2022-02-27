Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C294C5FE3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 00:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4ABA10E179;
	Sun, 27 Feb 2022 23:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B496E10E179
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 23:19:51 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id u20so18479207lff.2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 15:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AJKFWkaNILgrND2ajpv99ahQRaE4hGQV9IUMvW6X5jc=;
 b=COC/4g+XK0ncFFdjTFjbGI8kwJnazvpy+Y8Z5kBv2abHG/7OdfJl8XVUO/gQJQXrgU
 7syJ6Bl4EH1rhevEXJDyJCzV6vXIrdiBYUsB99agtvA7QQFqI7pET+wt/bULnxpe/llB
 DoHBp+DrTOur4By7IXXtsNs4+hSllcxUFM+zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AJKFWkaNILgrND2ajpv99ahQRaE4hGQV9IUMvW6X5jc=;
 b=X1Wux4L7xkCHCRhAD8BTNmqN/uFmPXZXcBC7Gn+Xc+eUUMqVoYZUQXiafJfvHJZXoB
 mJaQt7B5AaIndqCMWuDXkxFFREs+jML9A1rSsbE/sVin9EbngXgikyu2qlwnwmUAbhQS
 e2V8OuDcdIplLZG5vEoL78q+mIHZpcyH8oH9O+8+a4+bw4e62Luntue2fyoucy+MxDB/
 BZUllYkW8vhTeWdr0DlBciuKoyHpCwTb+9/sFBZaJEeWVIOTrgDdi1koT9e4xrVb58YA
 TqqmJsJwpmH510lW5CEx9Fp9xR7VQ0LmCt4OwkpLpQ/dWe/WVqaxYq9JLP3sj1xNcxpS
 Ma7Q==
X-Gm-Message-State: AOAM533Xc5I1q9SaRQqKAwWGaEj3yqAwIw27hXe2+k4prfSrfVInKSMa
 08K8cpeRIgd1Gaf1CsVv3yDULvL+cZscGjE1A4g=
X-Google-Smtp-Source: ABdhPJz+Cqw6XbI+pHabLqZgICQi6/TDQcS78tiDUBFjSq8L5qImt/AiuhVGBFlk3vaAkAqbTdykvQ==
X-Received: by 2002:a19:761a:0:b0:43c:79ae:6aef with SMTP id
 c26-20020a19761a000000b0043c79ae6aefmr11518245lff.630.1646003989814; 
 Sun, 27 Feb 2022 15:19:49 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 h8-20020a2e5308000000b002432295576fsm1072703ljb.49.2022.02.27.15.19.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 15:19:49 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id r20so15089099ljj.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 15:19:49 -0800 (PST)
X-Received: by 2002:a2e:b8cc:0:b0:246:4767:7a29 with SMTP id
 s12-20020a2eb8cc000000b0024647677a29mr12717079ljp.152.1646003517979; Sun, 27
 Feb 2022 15:11:57 -0800 (PST)
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org>
 <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
In-Reply-To: <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Feb 2022 15:11:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
Message-ID: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
Subject: Re: [greybus-dev] [PATCH] Kbuild: remove -std=gnu89 from compiler
 arguments
To: Alex Elder <elder@linaro.org>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org,
 Alex Shi <alexs@kernel.org>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Hu Haowen <src.res@email.cn>, linux-btrfs <linux-btrfs@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-doc-tw-discuss@lists.sourceforge.net,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 27, 2022 at 3:04 PM Alex Elder <elder@linaro.org> wrote:
>
> Glancing at the Greybus code, I don't believe there's any
> reason it needs to shift a negative value.  Such warnings
> could be fixed by making certain variables unsigned, for
> example.

As mentioned in the original thread, making things unsigned actually
is likely to introduce bugs and make things worse.

The warning is simply bogus, and the fact that it was enabled by
-Wextra in gcc for std=gnu99 and up was a mistake that looks likely to
be fixed in gcc.

So don't try to "fix" the code to make any possible warnings go away.
You may just make things worse.

(That is often true in general for the more esoteric warnings, but in
this case it's just painfully more obvious).

              Linus
