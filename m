Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6821111EE93
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 00:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA926EE10;
	Fri, 13 Dec 2019 23:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33146EE10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 23:32:52 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z17so435013ljk.13
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ZAmdP2AgE2PMn0iT/Xp6Z26PA725gvFmq8PIG5hVM8=;
 b=uxKpXv0bRZMMC4JfoyZ3hZSB+WtS/0eoant/ZCU+HKyeWAGmHwO8nC8fD93dcKJQdT
 Sx2wIZgqCJJ+roH4ymsYOY06DOR9dT5TMxSkhyUcy+La1K5gBBFQYdzIZDQhAYGvr2sc
 HMS8EBQOorcrYbXf9n37/xDZVHsqfyuKuPmr2OIouohDmlD19q8VVFfQhLhYkc+oJ4Xx
 j50NAbrxDPjkYbjlRJ+GH8gNs+23SDUBtE9Bcqidl95s9jtks/4tgXz3AH5rB8wV0lFs
 hrJkH2EWNu7ILL5A80GtA5Hehrf3dTkYyVlLb+gfUX71fiZ0EXyPL8Yp0XTnne7+K+ST
 QCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ZAmdP2AgE2PMn0iT/Xp6Z26PA725gvFmq8PIG5hVM8=;
 b=nUjyPmUcf2Edrm1i1SmJ9P/LP6p3DVuKWHTBqZ1WEhigc064IqrzVkSxFPpOOS6S8D
 xybR7fDGmSKVz7Z4F7yowB9XklogPvtgAEfSmk0MmvDTmk5gj7YoAlrhoYfXRJ3LRlMD
 b4oVkBsJOtsoyZnKkFYv8+ZqQipMqmq38ZxTgARLR9T5v0gWzq61e8tjLhGqoVHFwyiY
 Ba58SdxnX2j8XMdtvBc9YKm6nuY0fHcRiJUqxv90BUMpKPoyi6xgtI4FFLuLVHjohUfc
 dv/nCfKYA0tvbQhn7eNvpObCkbSVtR/4THHHd96jYnEC6sC+FaXTNvFP/aoIMFCtGc3f
 Ztxg==
X-Gm-Message-State: APjAAAUGsdCBXzxGxOvorbwdQ+M3+FQVp3MV5I6eA7YGdGVtCJru+PxT
 37rEE+do7KydoMGlvX1F/x60dRmtjX7SDno2aECPiQ==
X-Google-Smtp-Source: APXvYqz09nkLAPjpp9qkpigNRkFoHRn2ikLdodjm9FK2w8im83bd63AfeVGehbbzvOPaw/C2oCHgEUcj87JQwzOPBfQ=
X-Received: by 2002:a2e:8544:: with SMTP id u4mr11015020ljj.191.1576279971156; 
 Fri, 13 Dec 2019 15:32:51 -0800 (PST)
MIME-Version: 1.0
References: <20191205081116.5254-1-linus.walleij@linaro.org>
 <20191205131525.tf4n3kfnkrf6eksl@holly.lan> <87immkxheq.fsf@belgarion.home>
In-Reply-To: <87immkxheq.fsf@belgarion.home>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 14 Dec 2019 00:32:39 +0100
Message-ID: <CACRpkdbhZqHi2v8c2duhJECA_J2ZPtahQ6bPPc1b6Pfy3_o7ag@mail.gmail.com>
Subject: Re: [PATCH] backlight: pwm_bl: Switch to full GPIO descriptor
To: Robert Jarzmik <robert.jarzmik@free.fr>
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
 Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Lee Jones <lee.jones@linaro.org>, Guan Xuetao <gxt@pku.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 6:30 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Daniel Thompson <daniel.thompson@linaro.org> writes:
> >
> > ... I worry that palmtc.c is no longer compilable for some configs.
> I you're right, there is a very simple way to test it :
> make pxa_defconfig && make -j
>
> It should scream if the compilation is broken, and the kernel CI should
> certainly protect us.

I actually push my patches to the zeroday but it has reliability issues...

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
