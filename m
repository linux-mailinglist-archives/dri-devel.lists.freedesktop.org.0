Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5671E18BA14
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 16:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732886EA22;
	Thu, 19 Mar 2020 15:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527806EA22
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 15:02:58 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y2so1879974lfe.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=feOg6jsxkxi6fWBDUO+XNMssLgweGrSG6sVmw7vIQEI=;
 b=wSjnoeky5a0iCqkMcHwLyfztEdkkkJNz2jg14vSDUJoFU/FsnW6Zo3+TMZJ0gQ5Vaa
 vurqueK1uVeCjyWfk5DlqxEFgzsY56AcTMnAssA4SiS1VUBjNe9CD/4uS2WcpkdDi3p0
 RfYOgzpBscoypCgQJhtmsiGsspV2/1W8xQ7xZAfL1ZCMays605JDJF9c3W/DVJpugfTg
 00hz9TDvebvC099D/O7Mr1380DKY5QZFIhu0wx1HlBvsnb6DowYhMLq+gbq3f6pUpXhO
 JYmBtDvooiTrzbUHDnciYC95APVP+3f+qAxwt4FSZskWVwji7/wDFYAQo1hKr8XXbdvC
 mW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=feOg6jsxkxi6fWBDUO+XNMssLgweGrSG6sVmw7vIQEI=;
 b=L9imkbYyv/nCOIYSp/Lgh7D1PPck9av1stWyS4RrXkUg2W4iRWOWPFpZmeEvE9Yhh8
 fpogpuUpZG++nn5u2pY/bpdkDmdzbGzcG7Lh3oQ/JWS9JyMluGQhCvNstmm1PAsoFotz
 mhe5MgU5qFcgusOly+SYBLkyvKlkLtI8X4R8eaGn4K+Ih8eqDepYnBYVsr0JCdLRcKhP
 Z7m9xcHctZp4BgqpWDzmQP53LgQIOA/WnYNDqIGY8iPvNiXKjge+4FrC8a2O765AbqJX
 F8n8opZKETNQxDxrMqMXlZFICO0bA59tIX59ht4ax/nYKWH01UlTdMZQeyD1/uDGg0OO
 OYMw==
X-Gm-Message-State: ANhLgQ3W3bS2dw+FwbGIWXjdrgk78n3Y9GzYe9B6liEFeFNkydyMv8gE
 qqB5Gj2LBCEvON3+xk362O5A8KQlXomZLZ+oKtVcKQ==
X-Google-Smtp-Source: ADFU+vvcPsOkyc0gLWpLz2FATka54BCDTptPuBdkf4vs62+oqjQ52O2GaeYEbB3yCVZnmwvqEDUdKFF9bKbAzS0hna8=
X-Received: by 2002:a05:6512:247:: with SMTP id
 b7mr2405507lfo.21.1584630175753; 
 Thu, 19 Mar 2020 08:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200210101546.287565-1-linus.walleij@linaro.org>
 <20200318151709.GA3527@dell>
In-Reply-To: <20200318151709.GA3527@dell>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 Mar 2020 16:02:44 +0100
Message-ID: <CACRpkdbTDEbQ2q3L8ii3ZFDMnTNxdBQ2CKteynApXn7zp+Uptg@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch between Backlight, Arm, Unicore32 and
 PWM due for the v5.7 merge window
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Guan Xuetao <gxt@pku.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 4:16 PM Lee Jones <lee.jones@linaro.org> wrote:

>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git ib-backlight-arm-unicore-pwm-v5.7

Thanks a lot for queueing this up and creating an immutable branch
and all! Much appreciated.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
