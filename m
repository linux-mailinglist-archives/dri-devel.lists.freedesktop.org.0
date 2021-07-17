Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B203CC680
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 23:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4437C89E86;
	Sat, 17 Jul 2021 21:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06CA89E86
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 21:43:01 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id s17so8606751ljo.12
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 14:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mLF1skfBW0gvZzwCxxdZix3vRJTMSgcW19qrBGOZZk4=;
 b=s6YxieFcHITLcNkgs55oloVrenVVGve4xWor4pMaf2xcH98EABDBeLg26f185GC4Ai
 TDphri0bmhs4vHW+MGtkR2NisqRq2eMW1FiUajdocTV3Awc8NVLB298x8INDjwzRkMW5
 PpkaHlPHnPsuxqUPJzHC2L04F1XEGkgd/EtJzGcqBwMC0qghyc+in/xWMD3o0OhUajva
 0yFnhgbYkHPXlAsN1JDTskF4gKjHoskihFYlElvn9ECsKm29hIZCoNXrHtJaEvYjZP/5
 AYmDd3ivFALcl40qH7XxrUy+cfn1jxO90BXOs5+0pteITwBy5yEUWQjk8uqae3UKKqiu
 DAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mLF1skfBW0gvZzwCxxdZix3vRJTMSgcW19qrBGOZZk4=;
 b=IB1wJJzjJirus95gfYs3OQNOBXEvPfgGzE+TFvavPUC7CKFeQaUFQaCF/qMlyGqRm0
 rTymgYc8Ra9A8HjRvDWYSuEiFrfDuPeuWWh5wc4cp+WEsQYqECTgSr1Wg0lZ/Qg6PIJu
 U27Q8R4f/nTALUzJOwACvNQKCPqVAhTiUxGbwwsFMihgKGxEoR1ZR9tgssO0HeuKlFYo
 D3c9tOqMSDKmiMftuNhXitsY8nvon381l3SZkb36kUlDsM5wdn7E/rnkbhz2fgRuKkyi
 DcpztQDN5vHzS+LHTye4mHfghJq2ICGc6byNMNg0Hf0Vj4N9+jRDx6+mOLkcDVaXJt9P
 b8BA==
X-Gm-Message-State: AOAM532aeJ/g+wZBukY3MZ2r7o2GDYUgBqTc2IitMNalee3TSoyHPlJg
 ykb8tB7Co61/O0TGEXFneNaZPA==
X-Google-Smtp-Source: ABdhPJz5aT4S0NpwIXlVRfFVKwWedsyH3dqoJ+sg2ZNoSyV4AActMHx1Uix1R+SNJutxZpO7+Ggt/A==
X-Received: by 2002:a2e:743:: with SMTP id i3mr15614690ljd.266.1626558180199; 
 Sat, 17 Jul 2021 14:43:00 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id f9sm1469830ljf.73.2021.07.17.14.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 14:42:59 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id A9F591028D4; Sun, 18 Jul 2021 00:43:02 +0300 (+03)
Date: Sun, 18 Jul 2021 00:43:02 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm fixes for 5.14-rc2
Message-ID: <20210717214302.mpfil765uji5dnb7@box.shutemov.name>
References: <CAPM=9tzb9KSspAtVkSH3pYN97hQ815MoOBTSiuHzUJnnb2fhRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9tzb9KSspAtVkSH3pYN97hQ815MoOBTSiuHzUJnnb2fhRA@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 01:41:18PM +1000, Dave Airlie wrote:
> Hi Linus,
> 
> Regular rc2 fixes though a bit more than usual at rc2 stage, people
> must have been testing early or else some fixes from last week got a
> bit laggy. There is one larger change in the amd fixes to amalgamate
> some power management code on the newer chips with the code from the
> older chips, it should only affects chips where support was introduced
> in rc1 and it should make future fixes easier to maintain probably a
> good idea to merge it now. Otherwise it's mostly fixes across the
> board.
> 
> Dave.
> 
> drm-fixes-2021-07-16:
> drm fixes for 5.14-rc2

Dave, Daniel,

Looks like the fix[1] for nouveau regression[2] is missing. Hm?

[1] https://lore.kernel.org/nouveau/20210609172902.1937-1-christian.koenig@amd.com/
[2] https://lore.kernel.org/lkml/YOC4uekpD7iA3xPi@Red/T/#u

-- 
 Kirill A. Shutemov
