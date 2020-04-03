Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D843219DCD9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 19:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317C46EC42;
	Fri,  3 Apr 2020 17:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05F66EC42
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 17:35:30 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r7so7728877ljg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 10:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dKtIdZvLC52F10Y6xbDfkSl0Pu7i6ClghvBiyqtambU=;
 b=H93YJMtUtlhSvERgsd9+QhyHUPZkLUy1qm6kic51si2KSdRHYw+iGnwWRR0DJ77ORV
 3xhJqij/IkPg2b9Lu55rd/U1mC12Ln1lFm6QK1yRZIco5vcryPGAnK6GmQbZezzP4mVZ
 pLMW5K2NguR0k8OlPVuhXA5LY88rXpv3guptSz6yRnnQkfzV+aLqWY9UeGeT+9/4GwUU
 qJcDdwabAiF2N0zGWrQWk/vnZpPvgNjILUBcgrKfLybcaDm/YxuKR3GpNgsR20YpQDbi
 FYUlEKxEdw6FafJzwcZGXHiMvE8r+lmWV4uA+NmywPEtywsIlKEmYEKXpVmHee7e+LUk
 j56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dKtIdZvLC52F10Y6xbDfkSl0Pu7i6ClghvBiyqtambU=;
 b=dpSilCwNL60NAvDXiA30qkyTZ1hlIyz2f71dAIm4Sm8qp1zStD7ZkCEC74Kmy0fmHD
 WC4hxUhZMoOWAGzQMq41h6rjhQds+qSO2DOdlAasSvE6sM53wbxMKP27PJKPUtQPNktF
 9hs1gtnhHnSYsuakdFzUCSi6yTzVlBnsKSGFoPIMSxaiv9ldU/J5vOrCC07fdo008rST
 kxZM/JGG680woTdZS22HDoTDje9qQFr4ROgRKMOmVy0sELJP9EXa3spwwzVmIYqf9gGl
 t1dn8vBgvtB46ba62BbqxonAEYfoPfU6y+7iZkSd+dOuer/6TXhATj6Izxa+sg7tXHG1
 iI1w==
X-Gm-Message-State: AGi0Pubdy6hXnTqMKeae0uAUanKNRkMhlzM+xQ+48LcHs3JUO8F2YKTv
 GeBysqvtAFmxVmfM2dENP3bz1pVQUErmcmGg5utQKw==
X-Google-Smtp-Source: APiQypLs4HkiXBwOT8isUkymGTQ+IDH2CPTxP7O0KXPofVPFmo+KzfDaxV69aCpdnF7iK888NVyZKD1L0GpVYoGQfrM=
X-Received: by 2002:a2e:b241:: with SMTP id n1mr5037078ljm.22.1585935329126;
 Fri, 03 Apr 2020 10:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-15-daniel.vetter@ffwll.ch>
In-Reply-To: <20200403135828.2542770-15-daniel.vetter@ffwll.ch>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 3 Apr 2020 10:35:17 -0700
Message-ID: <CADaigPVeiE_cHA8J_d6oXm0Eftvmv28h0_bkDa3QSi0RQHa+JQ@mail.gmail.com>
Subject: Re: [PATCH 14/44] drm/v3d: Delete v3d_dev->pdev
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 6:58 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> We already have it in v3d_dev->drm.dev with zero additional pointer
> chasing. Personally I don't like duplicated pointers like this
> because:
> - reviewers need to check whether the pointer is for the same or
> different objects if there's multiple
> - compilers have an easier time too
>
> To avoid having to pull in some big headers I implemented the casting
> function as a macro instead of a static inline. Typechecking thanks to
> container_of still assured.
>
> But also a bit a bikeshed, so feel free to ignore.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Eric Anholt <eric@anholt.net

Acked-by: Eric Anholt <eric@anholt.net>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
