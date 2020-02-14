Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC61115D3AE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBD56F8B8;
	Fri, 14 Feb 2020 08:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4122B6F8B2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 08:19:59 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id n18so9720069ljo.7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 00:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f0FNgLnPWTEeOMv1dtdFcuHjTdzn6pGg8x44ibkEQPE=;
 b=tThJYyFgqDr0xjywQZpcUPswh6u2cBZitMBXL5HlvwWA/mmVulnlTwrHfoBaVo/rKo
 HegUHvyXUcIl9tZABp8eAoWjbCinqMDkumrHTSwh/hwDCSxJE7dU85/SlSpaeWaFviEo
 MCph3+YOCwsF9NiqaZ71muLOPxYjDA4G35LCPXBdDX71CGCZYxXvjNmRmbYy5Sbw8g28
 SpuH5UvD8RzQJCbp7mnH1ASd/6s/6DU7hmsujYfjr2CvFLdnXdz0GOVUguSlUgyshdaU
 XXe/61A3srbpQgboc8XsEHzBe7oLOR3kkjLGa35CuTe9shFEjooOntG5UckFPdvD5TE8
 pVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f0FNgLnPWTEeOMv1dtdFcuHjTdzn6pGg8x44ibkEQPE=;
 b=OK5JIj5IDS0SavFHaeaU8RCEZaVWBhC3qHvlGhshEYD0B138xB4B0qQFPIe9SJO47o
 oSzw9kDHq5pEy2Zd1LUPtV0Y6n3slQ9khvBScBf7S2yd8zGF4ZRGaHh2m6D2G+09QFIV
 w44XI1mM2aqBUBUDP/zdhDOnF2FGK3Yc6N9kbJTU7xkvAvDfyBjZ8op3R1iBKlp5cqHl
 CN7zA0J4dNeFvnj06/8MeGuc3GTFaR82KyHiX4mA1UcwOX7eWddGUG+8lEO8Ik3E0keZ
 M1f96qCaRhM+0apGOKN0shfITIlisy/Og94qWKPhmARVV5SB3k57P5UPMU12uvA009YE
 G87w==
X-Gm-Message-State: APjAAAUi45S8CT2JOv25wZcJyyzgC0ZMwSoGcYdinXVVesF4sg+XKAQF
 i/d/gw7JUogKj1egujN0l3K4Nr8j+xe2ZDYf+yggHjyYfNE=
X-Google-Smtp-Source: APXvYqy/sFLvdsy8AbVPYR/LBprLucz97Uq/5AQ1kxvx6NdtxQvxfagBozm3o+gZIAbeNZthrmn2zyDwBKBcUSMB3mI=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr1292161ljg.168.1581668397598; 
 Fri, 14 Feb 2020 00:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20200213124833.35545-1-linus.walleij@linaro.org>
 <CAKMK7uGDG7N1j53hPwNpnK+E=jiPDnEg3MofgC4fKmej_BUm2w@mail.gmail.com>
In-Reply-To: <CAKMK7uGDG7N1j53hPwNpnK+E=jiPDnEg3MofgC4fKmej_BUm2w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2020 09:19:46 +0100
Message-ID: <CACRpkdbuOutb0t+rnkM6dauWnEnJ3HzmZ86FWqbDjpaDHFu+Mg@mail.gmail.com>
Subject: Re: [PATCH] drm/pl111: Support Integrator IM-PD1 module
To: Daniel Vetter <daniel@ffwll.ch>
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
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 3:49 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> Looking around in the arm/mach-integrator code this seems to match
> roughly :-) I noticed there's also two more outputs for two panels,
> but not here. Do we not care about these anymore?

I actually have that hardware too (Integrator/PP2) and it is trivial to
support using the existing code, one can just define the panel in the
device tree. It might need some new define in panel-simple.c as
well.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
