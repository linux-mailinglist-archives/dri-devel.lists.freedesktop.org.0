Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2535314DEE2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 17:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA3689830;
	Thu, 30 Jan 2020 16:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6121589830
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 16:19:26 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f25so3957969ljg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 08:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4aauck1BwjHmPxReHY5+5wBQQQKQ71X2qt0RvmNdruY=;
 b=C79ZEneeywO5bDkFYspTf0mHqg+XFdEPkZsBeweiskD6zGKYsX69OLWfEGmiyq0kF4
 7cVO+mYrSPIpx8aclMNM6JP+nr3WlLliM10cmXlSndRjIxf2x6/xKP/br5BKDGTfdn+l
 Cdmuz/2CZ9lz/Lb8JfgQUlPOoXks5ZIoUYivY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4aauck1BwjHmPxReHY5+5wBQQQKQ71X2qt0RvmNdruY=;
 b=Oqx9oo31php9IhRfaaGCdsuMLF8/xLsXEaTgf0+GMonfM/7HRhpuPU3/vIRfJXAO3c
 mspC8tMlHDvlmuNF6ITkS80o5VvpMt8Tu6wvqyZ9I3RrG9oYrz/ZnKRChBVNAsKw9/Lt
 UVbLtLFCYJR3ZCF+jwrc4vUVrUWLbgnGJ5M1S6yM2o2/m7/v79UkndzNJykKaGxI9NyA
 AJ081vGd3HygdqCmhBr3+m4LLH3JRO1YPn9GBz4NxfhEkNBCbdq/Fw/K9v0HCFJRQ0qR
 2nT4UdQQGk2qB66zgiJQV2ZT919lRjPEyM+dCJGMJagEIATLD9aNBr1ScfBZuloi1XH1
 ZA/Q==
X-Gm-Message-State: APjAAAVF7bvXbxFTeJjUaOCiF9bzyFjeBE4Hg27zN0qhGhLTJErgjmHW
 zQq6Rop+rXFDtbKkURof4lGjzIvsn1Q=
X-Google-Smtp-Source: APXvYqxaemJBWmnPIe5jgy/ilrgKbJ8iWpNUFbkn0nZZvm14XeExpA0YlJ/+mmgB59WdQuh7/pskOw==
X-Received: by 2002:a2e:9a11:: with SMTP id o17mr3234798lji.256.1580401164497; 
 Thu, 30 Jan 2020 08:19:24 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id s7sm3201368ljc.50.2020.01.30.08.19.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 08:19:23 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id t23so2679625lfk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 08:19:23 -0800 (PST)
X-Received: by 2002:a19:4849:: with SMTP id v70mr3068446lfa.30.1580401163417; 
 Thu, 30 Jan 2020 08:19:23 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twBvYvUoijdzAi2=FGLys0pfaK+PZw-uq2kyxqZipeujA@mail.gmail.com>
 <CAHk-=wi31OH0Rjv5=0ELTz3ZFUVaARmvq+w-oy+pRpGENd-iEA@mail.gmail.com>
In-Reply-To: <CAHk-=wi31OH0Rjv5=0ELTz3ZFUVaARmvq+w-oy+pRpGENd-iEA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Jan 2020 08:19:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=whum_jLmptKrgV-fOvXZvHH68xbZU-wDSj1n9gWL5A5pA@mail.gmail.com>
Message-ID: <CAHk-=whum_jLmptKrgV-fOvXZvHH68xbZU-wDSj1n9gWL5A5pA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.6-rc1
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

On Thu, Jan 30, 2020 at 8:13 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> That doesn't seem right. If I do that, I lose the added GEM_BUG_ON()'s.

Just for your ref: see commit ecc4d2a52df6 ("drm/i915/userptr: fix
size calculation") for the source of those debug statements, and then
2c86e55d2ab5 ("drm/i915/gtt: split up i915_gem_gtt") on the other side
that just moved the functions..

              Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
