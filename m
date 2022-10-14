Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AAB5FE84E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 07:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B1C10E415;
	Fri, 14 Oct 2022 05:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD1610E415
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 05:05:07 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id g9so2592531qvo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 22:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c58OXeLn4p9khAmfcGXdtPDfOgfwmf+kmuPnuHvzL7o=;
 b=KzF1jdXnGbTJGSkKyBE4RwB3Ujud9hmwzc6rWNY2CUDd2lzj6W97T1r7U909VWQ6H5
 ToXCuBuLX463El6MEE+4YLVdbhFN/u0nIg4r+vKcwDlBvvT/iUI+qi2WGeKZLkd7Z1ZU
 fxFCJ5ptXsQOl6XMySW4b7Rcwfny+qwPFyhmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c58OXeLn4p9khAmfcGXdtPDfOgfwmf+kmuPnuHvzL7o=;
 b=t9kdui4NRqBW0Dx9R1kUU9nMce/YE8zuN0z/kxjCm2WcTmtHwa4UlO3FqMFNZjFvqM
 UxTfxPMiozdi0WJ1uroNA1l17+anjbp7/okAgrnKZKyDipYfrStB6GBjoaDLYVXhz7FY
 fISTe77kuCdCDHhu9RVNCxlor02nfeuU/j2AIRPQzHrDW0TTbzfstJXuA9WvusqsqZHz
 lLFC4F0MYMPgZLs478IagXEgayQh3cliHsHPxZSf+Z7UnoQent+f/EGpzA2c3PDI0LH7
 E79AYuoCfEJA8nP0hJRIAnvo6p4W8nN4zdnhDvlmYd1giv6XJgAHpGBx5IsR2SXNaE4s
 /5Nw==
X-Gm-Message-State: ACrzQf0evCfahdlitmma94Z37jUIVPxJoD8DiFu0bj2eriHlHtKFoyLQ
 NhI0nU9EtLkT24aisve8DShb9gj4jTmbrQ==
X-Google-Smtp-Source: AMsMyM7giFy6ZyLPAw9r0NMb8tsnzJV/qFhT8+L2kjm1I9j2k8p/qTgu5V69KZf98JewpeDvyAjh+g==
X-Received: by 2002:a05:6214:e83:b0:4b1:d0c9:371 with SMTP id
 hf3-20020a0562140e8300b004b1d0c90371mr2593619qvb.86.1665723905026; 
 Thu, 13 Oct 2022 22:05:05 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 t26-20020a37ea1a000000b006b5cc25535fsm1517335qkj.99.2022.10.13.22.05.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 22:05:03 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-345528ceb87so36192117b3.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 22:05:03 -0700 (PDT)
X-Received: by 2002:a0d:fe07:0:b0:360:c3e9:fc8a with SMTP id
 o7-20020a0dfe07000000b00360c3e9fc8amr3101468ywf.441.1665723903437; Thu, 13
 Oct 2022 22:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9ty3DGWa8vnfumgSrpSgWnixWjikb6C0Zk_5bW+deKLVQw@mail.gmail.com>
In-Reply-To: <CAPM=9ty3DGWa8vnfumgSrpSgWnixWjikb6C0Zk_5bW+deKLVQw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 13 Oct 2022 22:04:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=whStfYqRSsFXeoCmTeJu0VHNwfP_tYO7pKDMw-uQpraDg@mail.gmail.com>
Message-ID: <CAHk-=whStfYqRSsFXeoCmTeJu0VHNwfP_tYO7pKDMw-uQpraDg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.1-rc1
To: Dave Airlie <airlied@gmail.com>
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

On Thu, Oct 13, 2022 at 5:29 PM Dave Airlie <airlied@gmail.com> wrote:
>
> Round of fixes for the merge window stuff, bunch of amdgpu and i915
> changes, this should have the gcc11 warning fix, amongst other
> changes.

Some of those amd changes aren't "fixes". They are some major code changes.

We're still in the merge window, so I'm letting it slide, but calling
then "fixes" really stretches things. They are fixes exactly the same
way completely new development can "fix" things.

                      Linus
