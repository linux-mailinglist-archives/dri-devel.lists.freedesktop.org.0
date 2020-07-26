Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 304B722DD66
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 10:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F00289C52;
	Sun, 26 Jul 2020 08:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7475089BF1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 08:58:36 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id f7so1708167pln.13
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 01:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E1yGJnuNpD4do6FBG5mJhUC2P0QZnCXgqJQvqFc7BYo=;
 b=boRNySGGJxBWJtX6SQlUK/nW6EuoNyYorWR+XRHUVvjzoi5RZ4qTUEUL/j0OAfTD01
 8uytWTN5ntgW32dfW93cE2A7YnZlTFkzK4bZOwwtDgpjSe/hB6j4kHgvwUJUAD7YA0F/
 gYnaRCUxQi+OiCr1i42eu4C8R3Fjqk9cLqIEfWxg37Gq6VQS1zWu7d1/IyMObeQRs4BY
 /N751t7kH7YTyEKqidIW6vBwXSaMrq/pfTNSHxHf/FR2XupdtBiEfnjkpcP4F0giG/1Z
 aoTVV0jNK6SAJ9HMncQ2e0kxB+lPJ84tVeEBM6PWbrDjbddFzpDo20a8wisiStSmvyaV
 BPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E1yGJnuNpD4do6FBG5mJhUC2P0QZnCXgqJQvqFc7BYo=;
 b=QmdJM0z8b//2Lfw40Ev4UrZVtDYbciJT22v/wn2MFqJN7VxFfQ6iFtoGnDwAwqHsNK
 mNQDcad3pLYXGOdxJwdYszIBlAeNMYy1FkJ4EdoCdlzMnkKb1Fcx6dnahiwuo+6UUSBc
 M73fM3EESa0Ymlb/BF66CkmEeDB8/xu67IONYEHcRlMOUwDlWNml0tTAGIBCA3KxmX30
 TBOtHZACjwV9sPsYG6YzYSpGdlak5EmOA4axcQRr3XbTcc6bXHF7KDXI3Tq8xR2lgMWc
 TgxuYAZ2HhdH7/ldYPMfYGAwcIjLL5miD5DY6MEFkQTkk4z7NTAmFg1NSKtFlN4Mxh+E
 6yLw==
X-Gm-Message-State: AOAM532H/pivRw5MZQc+sdWzRDHJ+A1yTMv3r76kkCwrRlAxIdT7GX80
 uTbxfvnVUtwkFPS2eNh1ZDxRHaIZKEadAJm3xsY=
X-Google-Smtp-Source: ABdhPJxC26t1TVcy2BCqXWYJOp1U0PTQPyZFkQTpOeUL9TGGQ4UfvPWOI+Hk4O0dYoLWVYDKACgPpCZivTvThQPKa4k=
X-Received: by 2002:a17:90b:3547:: with SMTP id
 lt7mr13187611pjb.181.1595753916026; 
 Sun, 26 Jul 2020 01:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200726050713.9461-1-gaurav1086@gmail.com>
In-Reply-To: <20200726050713.9461-1-gaurav1086@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 26 Jul 2020 11:58:20 +0300
Message-ID: <CAHp75Vf0F+vtgg_NB0dL5Ck9m4_7fEHyH84mWrhTOXrEoL5SGA@mail.gmail.com>
Subject: Re: [PATCH] [video/fbdev] fb_flashcursor: Remove redundant null check
To: Gaurav Singh <gaurav1086@gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Nathan Chancellor <natechancellor@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>, Qiujun Huang <hqjagain@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 26, 2020 at 8:17 AM Gaurav Singh <gaurav1086@gmail.com> wrote:
>
> ops cannot be NULL as its being accessed later without

it's

> checks. Remove the redundant NULL check.

Commit message doesn't clarify why your fix is the correct one.
Maybe it's the other way around, missed check in the rest of the code there?

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
