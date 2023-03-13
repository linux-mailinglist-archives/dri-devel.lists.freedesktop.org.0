Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D46B841C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 22:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375C110E65A;
	Mon, 13 Mar 2023 21:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A28910E645
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 21:41:47 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id u32so6756693ybi.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678743707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aln1hEdgcCcgANtA4QqHK4LEQZjmm0gs9rDgqPgUYnk=;
 b=ewNFuqtOOszcIZvcI5yPiv2kkPkqnkbjivc3Lmd7hRnbBZpJOOcYEFwl9/4OzNK3mS
 LXb8fMYAdck8g1a9Ydd7PktnE6eIoS3G2tdtgwxq1URvRoQJ2CrxoVmfwm0SWcRIA5Dx
 TxBU6ePI814d8Lw+Xk2jXCuphm6VoXdhGgRGDhYtyuGQKrVAp5kxf8QiN3ohzK6Zadvx
 eiTbBJiTE/QKnLClSp4icth9JKYi3aIQuQBqPbClatA9mNqh0BftkQvRkNTgPOjiBut1
 szUogmoXIWqurNnj98S4tkowYAN9Wl5PRfjNE+FeB4AL6nc3OxDiVD/XjrynSCJVdTSs
 2hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678743707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aln1hEdgcCcgANtA4QqHK4LEQZjmm0gs9rDgqPgUYnk=;
 b=MnyyBmYrhNg6T/D/t8bfYgjmJgIxAJix70i3kbjZOeUwm3X7QARc59Ut8Rq2jRD/uT
 uyV/eT1LOhmDHHOP2WffogC94LhA1Xl2CQ2NgE9GTLVX/vq0bDIxSrPcc8EBE7aLEVIb
 yQ+oUo7ca0wVSGhv86PNI5b+ITf/qaJ3umpbmKBkrXPQ/v3skLZ4vtFGJOF5wu7NBOl+
 CUUsaC85oDCo7mXl/Un3MbM5kTCMK4K59AfOVmqmrGtOmuNUi2jvF3ByXhIM25lRXN/U
 3f5lWelX9r7J8mBIA3A7xu8kNZ0gMh3yVpmtMmW3td/q9copvJnvcORoD5516+qnSP07
 YY8Q==
X-Gm-Message-State: AO0yUKVvHZ5lqmURhXfL5eJ/TphRhab7hCBsgL2kdKj8PyzMEhTAMoow
 biuzpTkeFBEyrpFzx14csaV59OLoKDD22lN/u348WA==
X-Google-Smtp-Source: AK7set+R+YI9Nnas+5qiv6+jEi0Hs0zRL5Bqz75GQxapnR9lrv+JhLm/gXYEZWElQkVJe81BR8KBAxDNduDAH7eUSZY=
X-Received: by 2002:a5b:c48:0:b0:b1a:64ba:9cac with SMTP id
 d8-20020a5b0c48000000b00b1a64ba9cacmr3361726ybr.4.1678743706748; Mon, 13 Mar
 2023 14:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de>
 <20230313155138.20584-26-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-26-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:41:34 +0100
Message-ID: <CACRpkdYDpvpvURPCsdAMEd6s4_uU3UCpWoVLYkM8jh+wBM0ACg@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/pl111: Use GEM DMA fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, javierm@redhat.com,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 4:51=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Reported-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/dri-devel/CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUy=
wxkdszpTC-a_uZA+tQ@mail.gmail.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
