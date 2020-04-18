Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45D21AF332
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 20:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCDA6E096;
	Sat, 18 Apr 2020 18:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB5D6E096
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 18:32:12 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y4so5497958ljn.7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 11:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=roHWmvZVn6/F/wGdD9zKQyHgt7/0jSXot6B3J+TjEcY=;
 b=Ov5km4/W0JO/IIfYEyZciHkzHh2pF53WoxnC5p8aNLkfSv1bQrGKVHEY9CDHeQh3er
 0HrdAJD/5SAvLDL3+mS2NU67fvxAPyYejY9yZf+lpR9/I0C69GSpYjFN0VjsRdXdguFl
 x1ZeCfwN1w1w97BOGUUno/wjroNDI8xGjwVS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=roHWmvZVn6/F/wGdD9zKQyHgt7/0jSXot6B3J+TjEcY=;
 b=JRa5ItAFyyxWluRP4y+R6kr/2khL+KbqI823jVkp6sZaFB39zeBEWmLlVYyTu1ygfw
 Pt7+fApqdU2MJiZVMOOXX/6yIAOwxK/lV6V7uHxt1QD/BxRAJlj8kUhG+/LlBVRoC0L/
 dOehKBX+D8VMmAYOSH+c+JfQ2rOAwY/n3Wc0emECaJmNK5HOyhmcXODYAlj/PdPCz0Yf
 mnSdz1Pl2eHeY0I7b5WMkACF3LQc0OgEWkirwFMB3n2r1QQCIhbRqg9ywBAsxIcNIfot
 RIAsyAG050DNMIWHJR113FwhM2GDJgopwayc9awkgQ6R3JTXdu5XAsq4aknmNnp5hD6V
 PH4w==
X-Gm-Message-State: AGi0Pubtk7CcU0jSouqIibQM57iCzIclvQZ+LENwAIuFmjp0tq8l9/On
 I1pbVEoKv4B52VELt8CZvFCHy1XIDPw=
X-Google-Smtp-Source: APiQypKNNQGNZTvVopE8xC/earoKBXOaMskGchwHYwSPU97uQrjT76T5zcDvebPiinvSzGFw8/W7jQ==
X-Received: by 2002:a2e:9a87:: with SMTP id p7mr5349326lji.61.1587234730309;
 Sat, 18 Apr 2020 11:32:10 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id q24sm2319138lfc.29.2020.04.18.11.32.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Apr 2020 11:32:09 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 198so4544673lfo.7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 11:32:09 -0700 (PDT)
X-Received: by 2002:a05:6512:405:: with SMTP id
 u5mr5449960lfk.192.1587234728893; 
 Sat, 18 Apr 2020 11:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyt1N=QTmsyBKYzMqYJLbNzrgrnNoqQrzn3735ePSCODQ@mail.gmail.com>
In-Reply-To: <CAPM=9tyt1N=QTmsyBKYzMqYJLbNzrgrnNoqQrzn3735ePSCODQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 18 Apr 2020 11:31:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=whv=zGZO+6rrFLcv_OaM=pSRMXDVVSSZ06fiFaPq+XqFQ@mail.gmail.com>
Message-ID: <CAHk-=whv=zGZO+6rrFLcv_OaM=pSRMXDVVSSZ06fiFaPq+XqFQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.7-rc2
To: Dave Airlie <airlied@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 9:24 PM Dave Airlie <airlied@gmail.com> wrote:
>
> amdgpu:
> - Fix a regression in a previous s/r fix

Side note: if I hadn't been cc'd on the problem, I'd never have had a
clue what s/r stood for. I'd have assumed that it's some special
amdgpu term.

And the language in the actual commit message itself is not very helpful.

So please do write things like this out a bit more.

I expanded that "s/r" to "suspend/resume", although the change was the
suspend, and the bug was how it impacted shutdown, so I guess that's
not all that clear either.

               Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
