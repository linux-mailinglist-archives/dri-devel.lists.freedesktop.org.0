Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7477F1EC4D1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 00:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F35E6E215;
	Tue,  2 Jun 2020 22:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD7C6E215
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 22:14:29 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z18so161935lji.12
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 15:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LLGNp0bYqdgoODnvR5dT8Alq+1KnKRZvTkwH6Z7/c6A=;
 b=M2QrFy/uhcAqgs+stRlkgrzMXz/FWWJpJ5dKW1BGDexrTXGHHVMZmsouEZMEH+k6At
 40O3iTvokENTGG6qULnrnjBRquHj5u8RPumGZHE1lWNorzc8sz3ZcexmrYgX+oqMyTE4
 bIaWbyJDbvrfvBVKL8D2l1wicRwTaRrctwaZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LLGNp0bYqdgoODnvR5dT8Alq+1KnKRZvTkwH6Z7/c6A=;
 b=KTN635D1+JWzwjZE4iV2dK/GpEAtSwNPYc0R/TH20GUMCDjknhyaaUyCgzLm80nB/i
 +sa8qKUae0vn220fFDh7OhbBPoeFGU1/87yDTId5kr8tXqIQHjeO8QhBjvPkxilxKTly
 I6ZBJ71w1vHkTgZVKrt+lXV2UbsRGzEKb+XHIFSWHw1up1Y17ovnpRhWFuCrDPRKsAs1
 UxMnzGhW8hCFxfK16D0iFcvfU1283Mwl6G9uXWrzaZuca/rdwfPjTv+2gf0qn9rklaoN
 np4f3W9lkH3SMKSDgnNNo+Cl9zKQvGVFI4U8oKc0LmWHXC3Oh+Aok5/5UlD8JLMglAIB
 uDlw==
X-Gm-Message-State: AOAM530IRrvPGwsMl/IghLjB9GMVUm2lqGRZcejhu7n2YQQYg3v7vRPK
 MM4yWOsc/aS5JvIFSQrcDM5UwhCzjNw=
X-Google-Smtp-Source: ABdhPJxKyrMMOptDt8g1dLI8F9ZMj767yPZCGPdLLCZNV04mTWe3rI3BNBUBxKsHfoZfQFhdxnh8fA==
X-Received: by 2002:a05:651c:93:: with SMTP id 19mr585633ljq.245.1591136066753; 
 Tue, 02 Jun 2020 15:14:26 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id s28sm88966lfs.3.2020.06.02.15.14.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 15:14:26 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id c21so33822lfb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 15:14:25 -0700 (PDT)
X-Received: by 2002:a05:6512:7b:: with SMTP id i27mr294066lfo.30.1591136065530; 
 Tue, 02 Jun 2020 15:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
In-Reply-To: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Jun 2020 15:14:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=winp5YQv7rFmUe2z=xYSuzF9t1mMt+_C_1iFwxjoqG6gw@mail.gmail.com>
Message-ID: <CAHk-=winp5YQv7rFmUe2z=xYSuzF9t1mMt+_C_1iFwxjoqG6gw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
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

On Mon, Jun 1, 2020 at 11:06 PM Dave Airlie <airlied@gmail.com> wrote:
>
> I've pushed a merged by me tree here, which I think gets them all
> correct, but please let me know if you think different.
> https://cgit.freedesktop.org/~airlied/linux/log/?h=drm-5.8-merged

Ok, I get the same result, except my resolution to the simple encoder
issue was slightly different. I removed the simple helper header
include too as part of basically undoing the whole simple encoder
conversion.

But other than that we're identical, which is a good sign. Apparently
the drm mis-merge in the middle got fixed up.

             Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
