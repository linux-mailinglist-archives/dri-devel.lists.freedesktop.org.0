Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF4487B94
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 18:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E8810F3CC;
	Fri,  7 Jan 2022 17:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B883C10F3CC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 17:42:16 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b13so24858084edd.8
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 09:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qlTeTJ7EDTm7c9BXsTdwqcJ1U93LI0ovtC5oLv7HJ/8=;
 b=EzDtmhckdMcxUG26G41m9/0kVjTMfBYbN416j3lPs9mAd5lJ4W+Nk53u+bcN8Nof4h
 6RuLaXCBf9fWX78BJbfmYuj5gh/YjzAfy3o7qlM/BlWCqaJs0c6/2nWx+SGMA2/6rME+
 RkUGyAPUccxm6eDTAVNFU0couQa8OdlCouNYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qlTeTJ7EDTm7c9BXsTdwqcJ1U93LI0ovtC5oLv7HJ/8=;
 b=b8VARW0zicdcsPs1sWxKvw1j0/lOqIsSoikNzXmYI7VamJ5xWCOkbsMpxpHSuWDMPh
 zEX22Y9ys4UU+lgZcCHnv+eqel0oLAWq7pUdhYRsFbLpeKe1Nz0jSMXcB/P6Y+/j1oYU
 /J0zUKnLMHIzNq6D3VFMKCFh22jKeSWsNMiM+mSsOCHyn9EGDOHXhhQQ4FrxRBmFvJ2/
 2jrhiL+V+aargzn0a6n/pMt4FXS7+HCB3cGBoBHzloXfP916UIEdIOHIOPCzTLaxJRyo
 wAtWqJB1Mzx7KPOR+lG0zvzAy82sU95LBEUty7eYp/6zCNopQn9jZlN//Lpo8xvoJFmq
 Eh3Q==
X-Gm-Message-State: AOAM530sWvnaKXXeE5Pj0NvPOpzOMF1sFHfKbIuEpr8qk12TBN6dRgv+
 GjOJIAycFlZz9HW2C/Ce8RhW150E4x5edG9oUCg=
X-Google-Smtp-Source: ABdhPJzbsL9TETev/JX95s032rK0Rw7r+ez6EYAyGPrFPqSBAX6m2gQVK+XgO00FJxd45xTrGI4EhA==
X-Received: by 2002:a05:6402:1a57:: with SMTP id
 bf23mr11072894edb.381.1641577335117; 
 Fri, 07 Jan 2022 09:42:15 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49])
 by smtp.gmail.com with ESMTPSA id nb20sm1582482ejc.25.2022.01.07.09.42.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 09:42:14 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id e9so10940725wra.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 09:42:14 -0800 (PST)
X-Received: by 2002:adf:f54e:: with SMTP id j14mr54539331wrp.442.1641577334232; 
 Fri, 07 Jan 2022 09:42:14 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twnYJ8SrVzJEEH+Vksibomvk5CE+Nn6BXKYwLG_8r=GJQ@mail.gmail.com>
In-Reply-To: <CAPM=9twnYJ8SrVzJEEH+Vksibomvk5CE+Nn6BXKYwLG_8r=GJQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Jan 2022 09:41:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiyfiVoci-LHaY=e70zOpAoUqwoaFF4iD3xm847PkK1CQ@mail.gmail.com>
Message-ID: <CAHk-=wiyfiVoci-LHaY=e70zOpAoUqwoaFF4iD3xm847PkK1CQ@mail.gmail.com>
Subject: Re: [git pull] drm final fixes for 5.16
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
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

On Thu, Jan 6, 2022 at 7:23 PM Dave Airlie <airlied@gmail.com> wrote:
>
> There is only the amdgpu runtime pm regression fix in here.

Thanks, from a quick test it works for me - the backlight actually
does eventually go away.

It does so only on the second time the monitors say "no signal, going
to power save", but that has been true before too.

So I think there's still some confusion in this area, but it might be
elsewhere - who knows what Wayland and friends do. At least it doesn't
look like a regression to me any more.

Thanks,
                Linus
