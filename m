Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 987F13D7478
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 13:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6046E857;
	Tue, 27 Jul 2021 11:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6290F6E832
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 11:41:42 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 x15-20020a05683000cfb02904d1f8b9db81so13069584oto.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 04:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DVk/roXn7MDuqTNl8/MPtBH5EOXDiRDcUKDft9jM5Cw=;
 b=S8/vNhxVJWViK6VZinPpJgk0KHS8SoxUwHNSM7XwV2ugslXwoRBevRd5Mh4xY5EcdY
 h9dtOd1SBp1Pc6i4VGMyZ+V4yvThgyrnlgXi5gvREFemZj/ExmaGrbuUbm0j+AmVzoPO
 HMl109nuyZL1XTYqCHKsMMno4W9Y9UKDY39e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DVk/roXn7MDuqTNl8/MPtBH5EOXDiRDcUKDft9jM5Cw=;
 b=L8uqMnS5N0ackRjwqWltH7oNp49nCSN+lnOwB24Hj7SXkuEZAnPw9kKTxYKHyid3Go
 uGuW4TJccNd0TswjI/F3h12sVjgFK4yI0BKs6p+l9cxmZE3vZmoi5irryDKXY1T8daI2
 yOICnA+v2b+0X7hZnFa86r/8TNY9CFLxzArQXo/8vMg+BKBqOvQNsXnNqOEPfalYuUuW
 aiZT8Hr9BNX14WHsS2sV5WVMTmdTFv1Nv3KbQr5e9Gjj+P+/1MyjJeLDk2rz9Uuq9BMb
 /KLX4WLiLGwBrYLkK/kbJ1S2zb/XK1UzSk/EE5y+eUlwahUL42cFoqYuDUAp7UcEt3Ox
 mCwA==
X-Gm-Message-State: AOAM5331WPIaJSqvbtaTZLm+FuVN+GWjTO3waYe3usWnK38I4IjwBLaZ
 sJAy8oLnluYa9OaQPQ8uimBoBxnLCF6LSDKw7sHUXw==
X-Google-Smtp-Source: ABdhPJwwqUJE8UKjF7vKwaBCoePrBQHFhIEc5QZ1sCYFnwQrwt9cNdqIxKdScWiZ8ggu9u1j1HNhn1elDyZZOK7BcGg=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr15331222otb.281.1627386101729; 
 Tue, 27 Jul 2021 04:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210727111448.1443-1-broonie@kernel.org>
In-Reply-To: <20210727111448.1443-1-broonie@kernel.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 27 Jul 2021 13:41:30 +0200
Message-ID: <CAKMK7uFNFOTrcLbFW3eoziPaZaH9JFKJe1AVvJGT6wU_rqfUeA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with the drm-next
 tree
To: Mark Brown <broonie@kernel.org>
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 1:15 PM Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>
> between commit:
>
>   ebc9ac7c3dfe ("drm/vmwgfx: Update device headers")
>
> from the drm-next tree and commit:
>
>   be4f77ac6884 ("drm/vmwgfx: Cleanup fifo mmio handling")
>
> from the drm-misc tree.

I got confused for a bit how we managed a conflict here because vmwgfx
flows drm-misc.git -> drm.git -> linus. The 2nd patch is in
drm-misc-fixes, which makes sense, not in drm-misc-next like I assumed
at first drm-misc means.
-Daniel

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 356f82c26f59,5652d982b1ce..000000000000
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
