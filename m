Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF8C27E562
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 11:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EBB89C82;
	Wed, 30 Sep 2020 09:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C0989C82
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 09:40:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v12so987397wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YB7AakyQd7CL2zmCeAUBvGEPuC69+hG9+Pe2SkWFFNM=;
 b=fG7q4eP2Tl4eo04zP6qjfsjx5voOrFQeegCnPhv/Yji9l+so9t4XoTMLHz7iA7WfIN
 MeCuen9wnPRbU8MsR/u8NS5Ij8uHIDTSJE1h2HA/lfnNt8lGBJU26N+SqSrfRsG9fFQ7
 ldqBC0olVDT3kLwIZgack9xQ9XbstFNq36Gn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YB7AakyQd7CL2zmCeAUBvGEPuC69+hG9+Pe2SkWFFNM=;
 b=cKU9e+fXRDThK6hjHV6HCzvejqNGYyBM7ASsnEECtYwy4l7pUkeLB0gIwHi7Z66VAH
 cIS/RRZffgRJAQU8GNCC1308oeQyrYTEQ7TVXBkg1p0Jm8n6/k1a+0NBSBg7x0rYaDGt
 N+FWQuPOZcb69gREn+YldHe9HWEftJygK7VQo9OkPfFtiUtthiFVraaqQ6DhksJTfr2S
 UVzQOQaIHTR7OM6gcRWme4/b10Qh0Cof3liXjqxBqSIBJ1XyT759FyY9VUkZVR0fAqBT
 qS4WSMSoqbt2juemhMawOE1TQ5Xw1O2iyPSXpUG3Yh6p5VICPYvydDz4Pz5k/7JmDeck
 3gOQ==
X-Gm-Message-State: AOAM5326+wYXojSsETLTxYs8gDMy3QCTxNzZAwv36becckYVNrmsoerL
 7zpSMI6lK/GQw6/4BHD5Okz6YA==
X-Google-Smtp-Source: ABdhPJzK2umvAHdCdHgriUhGB3rMUgsGmxl++CvBC69+cgoRXAU/LmXQyrtnigPQ34g5q0S1VU+YJQ==
X-Received: by 2002:a7b:c753:: with SMTP id w19mr1955747wmk.157.1601458842462; 
 Wed, 30 Sep 2020 02:40:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k15sm2004760wrv.90.2020.09.30.02.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 02:40:41 -0700 (PDT)
Date: Wed, 30 Sep 2020 11:40:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Revert "video: fbdev: amba-clcd: Retire elder CLCD driver"
Message-ID: <20200930094039.GU438822@phenom.ffwll.local>
References: <20200928200856.1897023-1-pcc@google.com>
 <0dc9f36b-417d-bfad-9eb7-858c3041ff0c@baylibre.com>
 <20200929093201.GL438822@phenom.ffwll.local>
 <CAMn1gO7w1wUo3e9vUmGeF7fp0K9mq2ydSskX2xD3H=Kndzhc+A@mail.gmail.com>
 <20200929164828.GP438822@phenom.ffwll.local>
 <20200929165206.GQ438822@phenom.ffwll.local>
 <CAMn1gO4csAWAnk5rwfzfW5SVTddj7E84kKG2T-qjGiOmObSXnA@mail.gmail.com>
 <CAKMK7uG5KP15tKVZpwmTnU0rM2VwRpESYk_=B0MuOWt5j3Gp1A@mail.gmail.com>
 <CACRpkdYoOVeEkF6RiJSUykJfmJUthXNHMdTUmu+02OXRCgOd0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYoOVeEkF6RiJSUykJfmJUthXNHMdTUmu+02OXRCgOd0A@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sean Paul <sean@poorly.run>,
 Kevin Brodsky <Kevin.Brodsky@arm.com>, Russell King <linux@armlinux.org.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 10:29:22PM +0200, Linus Walleij wrote:
> On Tue, Sep 29, 2020 at 8:44 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Tue, Sep 29, 2020 at 7:49 PM Peter Collingbourne <pcc@google.com> wrote:
> 
> > But aside from all this, why is this blocking the migration from fbdev
> > to drm? With fbdev you don't have buffer allocations, nor dma-buf
> > support, and somehow android can boot.
> 
> I do not know how Android does things these days but back in the
> days it would request a virtual framebuffer twice the height of the
> physical framebuffer and then pan that up/down between composing
> frames, thus achieving a type of double-buffering from userspace.
> 
> Given the type of bugs Peter is seeing this seems to still be the
> case, Peter can you confirm?

We have the overallocate option for the fbdev emulation to support this
use case of flipping buffers. So this part should work I think, but maybe
some other parts of our check_var/set_par implementation don't work in a
way to make surface flinger happy.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
