Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488365EE29B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 19:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043D210E482;
	Wed, 28 Sep 2022 17:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF98210E482
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 17:09:26 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-11e9a7135easo18087522fac.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 10:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7vQ2L03NmZjTjKW7aYlNCJZqth3/yEDQLyW9BQRTAy8=;
 b=A+bgUQTLuISMRGKf3gH1kVvGmP3b/AaIOap7gHgA/PD0nbgpIKholTwlPXLri1af0K
 cnXmQYCXr6Teuy/PYE/inGfAxECxd/mCvZF/wqKa528cfQv970CHoLHSzLvnxIGoeg2I
 Wt438dq+Wr6ck6v+tRyZuqUTQ439HqIxvfrIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7vQ2L03NmZjTjKW7aYlNCJZqth3/yEDQLyW9BQRTAy8=;
 b=Sp0YlKWgLuyubuonlCfwka4iREgSihaOv75xg/6ZsCKPwkPLkZnmb7ABXb26jnivDe
 EBQFA2nvAcvV6STJsracg0oy4upQn6zCXLBl5q3szAFwSKED9KTbS36mOCgniOXWCqxu
 GgiVLZSEM8RXb3O+hD0yrkQAnLQbShbEPayxCILZDI2rplUY+zGdPCrydaUvtn7V4yQt
 0s3V+rEdWOYrogHfCXlLGTMNASg0OSCmsQZXHCb/9pXKZH/3eHn51I5fx+ielFBn86Nq
 0avkPKFGFb36MqVeSSmBMcNu11YRg6GwVQRTHgGD9+VTOfNOP+vTdaCYOQHbPv1lkkTM
 gGXw==
X-Gm-Message-State: ACrzQf3//ZKe91srZNbDi7Nga6ISdn0KxEWZ51LBHetLS2g+TM5GWfTm
 MIMYk4H+/GpQJHwN4ew38+ig0BitBCX55A==
X-Google-Smtp-Source: AMsMyM6xiiUfhIMle9KPNfGYTjiV3NrTJ+ER1fbsyERpdB3dCO6qOeKbZ1ikYjLDuaF2wRmNxuq5dw==
X-Received: by 2002:a05:6870:c182:b0:12a:e54e:c6e8 with SMTP id
 h2-20020a056870c18200b0012ae54ec6e8mr6047530oad.207.1664384965034; 
 Wed, 28 Sep 2022 10:09:25 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52]) by smtp.gmail.com with ESMTPSA id
 m27-20020a9d609b000000b006370c0e5be0sm2375761otj.48.2022.09.28.10.09.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 10:09:21 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id
 u6-20020a056830118600b006595e8f9f3fso8593605otq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 10:09:20 -0700 (PDT)
X-Received: by 2002:a9d:2de3:0:b0:638:e210:c9da with SMTP id
 g90-20020a9d2de3000000b00638e210c9damr14921820otb.69.1664384960424; Wed, 28
 Sep 2022 10:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220928081300.101516-1-gwan-gyeong.mun@intel.com>
 <20220928081300.101516-6-gwan-gyeong.mun@intel.com>
In-Reply-To: <20220928081300.101516-6-gwan-gyeong.mun@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 Sep 2022 10:09:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivJwvVbMUKma8600F6qaVLZHT=BY90SEnjiHWw2ZUVEg@mail.gmail.com>
Message-ID: <CAHk-=wivJwvVbMUKma8600F6qaVLZHT=BY90SEnjiHWw2ZUVEg@mail.gmail.com>
Subject: Re: [PATCH v13 5/9] drm/i915: Check for integer truncation on
 scatterlist creation
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
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
Cc: gustavoars@kernel.org, trix@redhat.com, dlatypov@google.com,
 llvm@lists.linux.dev, linux@rasmusvillemoes.dk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linux-hardening@vger.kernel.org, andrzej.hajda@intel.com,
 linux-sparse@vger.kernel.org, matthew.auld@intel.com,
 andi.shyti@linux.intel.com, airlied@redhat.com,
 thomas.hellstrom@linux.intel.com, keescook@chromium.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, nathan@kernel.org, mchehab@kernel.org,
 mauro.chehab@linux.intel.com, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, vitor@massaru.org, luc.vanoostenryck@gmail.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 1:15 AM Gwan-gyeong Mun
<gwan-gyeong.mun@intel.com> wrote:
>
> +       if (check_assign(obj->base.size >> PAGE_SHIFT, &npages))
> +               return -E2BIG;

I have to say, I find that new "check_assign()" macro use to be disgusting.

It's one thing to check for overflows.

It's another thing entirely to just assign something to a local variable.

This disgusting "let's check and assign" needs to die. It makes the
code a completely unreadable mess. The "user" wersion is even worse.

If you worry about overflow, then use a mix of

 (a) use a sufficiently large type to begin with

 (b) check for value range separately

and in this particular case, I also suspect that the whole range check
should have been somewhere else entirely - at the original creation of
that "obj" structure, not at one random end-point where it is used.

In other words, THIS WHOLE PATCH is just end-points checking the size
requirements of that "base.size" thing much too late, when it should
have been checked originally for some "maximum acceptable base size"
instead.

And that "maximum acceptable base size" should *not* be about "this is
the size of the variables we use". It should be a sanity check of
"this value is sane and fits in sane use cases".

Because "let's plug security checks" is most definitely not about
picking random assignments and saying "let's check this one". It's
about trying to catch things earlier than that.

Kees, you need to reign in the craziness in overflow.h.

                 Linus
