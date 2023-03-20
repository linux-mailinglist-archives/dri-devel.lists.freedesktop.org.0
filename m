Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35756C25D8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 00:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55AEB10E66A;
	Mon, 20 Mar 2023 23:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26F910E66A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 23:42:12 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id eg48so53177761edb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 16:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1679355730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yh9V5oLNl71ZE8wLJrHU90qn5FMul3QSy4jMGg+s0h4=;
 b=N4wVROOxKzQ4OoNcx8r5uTzsGb3CGCAyBDkN21Yg7Ibmi8awtnbTHYbFslExfamja/
 XTM1YvfD/UrKoD1ItfOmSDYXiKENfbGZQ5liaJggvBqVMf0Hs+UTvdbIxy95Kszei7pp
 Wo0DXOsYVQZLQVXcTOkM9muZUJt416sTmJ7z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679355730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yh9V5oLNl71ZE8wLJrHU90qn5FMul3QSy4jMGg+s0h4=;
 b=hNi5fZ8ZsL0WWS21whYxvxq1Jr3riB/fVwxv4EEJrbWUgOPpu/z9RBdtuTWH5u4BbC
 uQuohcr8eiRGoa/3/9N9+I9DDV01+HPM+v/p9H1Gzf9l+xsScQ/lo3W0p3YTHAVeMUqj
 A7+IE9N0JEaRKhjQ+x8QqLP/JqzoSjDGloTbaYWk5TbXVML65A3GE8/QlFraar+nxeJk
 9YmlyPfKrlTpYS0dyrv3zoYP98UxFuGUTPMpcP7NnAt8G8mRJ+qGbinkxipjmDn5zDBj
 BEtIsy85H40KPuDpWapN+KAuT09A150RVmMgnMtG2UT34YquXbQSNp5Hx4PMNYJFtY/n
 LK5g==
X-Gm-Message-State: AO0yUKVFOAEiqacicQTJ6aAbWpwvQOM/jyhPfAcE8NBSl2zMhHkfOfUP
 lgcbeoP/48S0jIHkUTY6Er4DD/P89vF5T4IYOCSNg67/
X-Google-Smtp-Source: AK7set8oaI9FCF97P67QqW5czxbgHwrokq6ClKo7lZbq8e7+PBMK0UTy+Rg2J6Z57WKAEXnWhyRDzw==
X-Received: by 2002:a17:906:ce5c:b0:932:b790:932c with SMTP id
 se28-20020a170906ce5c00b00932b790932cmr890984ejb.44.1679355730758; 
 Mon, 20 Mar 2023 16:42:10 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 xo10-20020a170907bb8a00b008ec793ac3f4sm4965452ejc.192.2023.03.20.16.42.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 16:42:10 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id cn12so7651021edb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 16:42:09 -0700 (PDT)
X-Received: by 2002:a17:906:13d3:b0:931:2bcd:ee00 with SMTP id
 g19-20020a17090613d300b009312bcdee00mr395674ejc.15.1679355729667; Mon, 20 Mar
 2023 16:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <4adbed5a-6f73-42ac-b7be-e12c764ae808@roeck-us.net>
 <CAHk-=wgyJREUR1WgfFmie5XVJnBLr1VPVbSibh1+Cq57Bh4Tag@mail.gmail.com>
 <20230320220631.GA637514@dev-arch.thelio-3990X>
In-Reply-To: <20230320220631.GA637514@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Mar 2023 16:41:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=whf82-im76ovESE2RZBh5=Y3uR1GDbae60=TWjM7OkLdA@mail.gmail.com>
Message-ID: <CAHk-=whf82-im76ovESE2RZBh5=Y3uR1GDbae60=TWjM7OkLdA@mail.gmail.com>
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
Cc: llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-toolchains@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 3:06=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Right, this seems like a subtle difference in semantics between
> -Wuninitialized between clang and GCC.

I guess it's a bit ambiguous whether it's

 "X may be USED uninitialized"

or whether it is

 "X may BE uninitialized"

and then depending on how you see that ambiguity, the control flow matters.

In this case, there is absolutely no question that the variable is
uninitialized (since there is no write to it at all).

So it is very clearly and unambiguously uninitialized. And I do think
that as a result, "-Wuninitialized" should warn.

But at the same time, whether it is *used* or not depends on that
conditional, so I can see how it could be confusing and not be so
clear an unambiguous.

On the whole, I do wish that the logic would be "after dead code
removal, if some pseudo has no initializer, it should always warn,
regardless of any remaining dynamic conditoinals".

That "after dead code removal" might matter, because I could see where
config things (#ifdef's etc) would just remove the initialization of
some variable, and if the use is behind some static "if (0)", then
warning about it is all kinds of silly.

                     Linus
