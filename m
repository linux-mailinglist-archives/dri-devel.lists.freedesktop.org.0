Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7736DDDB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C506E103;
	Wed, 28 Apr 2021 17:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28C76E103
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 17:07:42 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id d15so21842691ljo.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 10:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GR7hKf7fNw0ovTS2B9IbzWhvenIGzwzqI1E/3AF1PEQ=;
 b=d9UvkCg1CeyvhE04LX7mXGh/zBDp0cwiO6q/gaRpc3WOVY+ojFQvZg7EjBeX/Jiu9R
 FTmZgbbYJ1YAsydfpOaxChtbOug8NpVgZzd0UUybISU9QkPB1GK2Qz2kycmp3p95KxCn
 k0NxpghCv9KA+nBMtxK9jfsBLB6zFZZYyp2Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GR7hKf7fNw0ovTS2B9IbzWhvenIGzwzqI1E/3AF1PEQ=;
 b=X+/syXINsHg1Zq5HrG0RAtxBo1ruT5PGJ3dYBfjxkRLsN8tWyUvhvtuHx5lAb9bLTz
 xtz7bR4lSL5lEAWPCV2zQbUsU6UEnmLLCo0SJ9mFVtnHiYjoMrUOeFH5zh9ePr/lvZbV
 ve2FBVGE6XAi+cg/r/XjUzM26IDS+z19TDCRHHPu+z3x3Hii/Rh7C4nfhPuBl0qKlQhW
 VxhsFeyYuBia+86ISKKbC08PmYLPNti1wabqz47M491djprYZR8sXTh853WQs+XFyn6o
 GwK8q2w6/zgnQSGd07NJ+ftTIMMCqHC6EtPgMfnjS2PnVWpOkpZLWOVlPvz5lm1JW2jV
 aUrg==
X-Gm-Message-State: AOAM5301EyRpPgBM9HVkQ7yvh91wwWo4yV0m7EjB5abKOCOqgvVtQ1Qr
 6V5MhmbKcgrVIX08jpj279MXN7tZyLvMJcMV
X-Google-Smtp-Source: ABdhPJzwpaKIu10liu5L+ZL/xfXNFe7vxPtzc+QQ82GOcRdPx+PrwS66lr/UJHReeq/PD0qeq4odlg==
X-Received: by 2002:a2e:90d1:: with SMTP id o17mr20875655ljg.92.1619629660990; 
 Wed, 28 Apr 2021 10:07:40 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178])
 by smtp.gmail.com with ESMTPSA id b35sm67623ljf.124.2021.04.28.10.07.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 10:07:39 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id l22so65735034ljc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 10:07:39 -0700 (PDT)
X-Received: by 2002:a05:651c:44f:: with SMTP id
 g15mr20755418ljg.48.1619629659309; 
 Wed, 28 Apr 2021 10:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txMo5f9QvPqdzt8g3CmUpyDFf2Q_0XS4V1FyjHX8WQPRA@mail.gmail.com>
In-Reply-To: <CAPM=9txMo5f9QvPqdzt8g3CmUpyDFf2Q_0XS4V1FyjHX8WQPRA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 Apr 2021 10:07:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh22MOMM5Paw-dHVvkp6W+UKx8mv_TNJ1TY9iaAMS1rLQ@mail.gmail.com>
Message-ID: <CAHk-=wh22MOMM5Paw-dHVvkp6W+UKx8mv_TNJ1TY9iaAMS1rLQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.13-rc1
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

On Tue, Apr 27, 2021 at 8:32 PM Dave Airlie <airlied@gmail.com> wrote:
>
> There aren't a massive amount of conflicts, only with vmwgfx when I
> did a test merge into your master yesterday, I think you should be
> able to handle them yourself, but let me know if you want me to push a
> merged tree somewhere (or if I missed something).

The conflict was easy enough to resolve, but was unusual in that my
tree had vmwgfx fixes that weren't in the development tree (ie that
commit 2ef4fb92363c: "drm/vmwgfx: Make sure bo's are unpinned before
putting them back").

Usually when I merge stuff, I can see that the fixes that were pushed
to my tree are also in the development branch. Not so this time.

          Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
