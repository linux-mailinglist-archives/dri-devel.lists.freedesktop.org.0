Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4742DA39E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 23:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9954189FF9;
	Mon, 14 Dec 2020 22:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09A889FF9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 22:45:53 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id o13so11227332lfr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7NaDwH+o13pplnZETDzpNME+J09xWs3e8EEhHwcKak0=;
 b=ccYsGAkpyBJRTXebW7C/10KTxYSYkH7Io1+MOhcYKa9x0bSowk4sf2EaTjtwDjVwtC
 j5R0aUWOt8PkssLyXcMUWqsORAydSH314HhQlbVlcO0j8L3JeNgfFi2drjubqu+Nf0KI
 zTwXmqP0Si1UqYciCHWMz0hs+VAyjhxxAWLsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7NaDwH+o13pplnZETDzpNME+J09xWs3e8EEhHwcKak0=;
 b=Mdsj3V78j0JbR/OfvZjnyphqMTAZ2QXhBP4U8AJpolj3+cZZPYqiv2E5NYOLpWx45B
 LkyImNZ1x+6qoBLPH0pGzDyFSvpMq5NxeclDnPQcX6gQf676WPOQpFWgdCUWQ7Ov4hD8
 CUAg0ddZKDZpbQagl7DZpq+PcvEj1xFvlRJEL4dHiSVjSPBzA4Q9jo4R6e2I57G99E+N
 xTpOH7KtJ9KAQx5ClHezwpDYcpvb+LH0XNBiLsknMBW5wbzR17rYKZFKqa0b7Wjy2CsF
 MgANEYR7GGj5aDfGBckvdrYQ++xZdZRH8eTnyMKaJUNnhuOZdKpbps/4JN/9G9fWKxc+
 I5pw==
X-Gm-Message-State: AOAM531X1k4FuAPi86BthNLMbJ33VPX+PZoiI8g8uV3lvaiMTYbP640Q
 DXoPY/De06yy/bmp/J0fElZKdGZHFUGjpA==
X-Google-Smtp-Source: ABdhPJycY01b/BW8o1LfB813O/YJkU4MYSYV1dX8wo8S2skX2UOMnanRT7OWv0gIEFg8ZK5PSGLMKw==
X-Received: by 2002:a05:651c:286:: with SMTP id
 b6mr11636382ljo.232.1607985951572; 
 Mon, 14 Dec 2020 14:45:51 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id q13sm2239662lfk.251.2020.12.14.14.45.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 14:45:50 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id y19so34354557lfa.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:45:49 -0800 (PST)
X-Received: by 2002:a19:8557:: with SMTP id h84mr9754755lfd.201.1607985949442; 
 Mon, 14 Dec 2020 14:45:49 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tyNrbap4FG6qstkC5YTznqVebD=ye+4+Z+t42yQnL325A@mail.gmail.com>
 <CAHk-=wjue4aOyQQq+C6SEurwe6XABhMyNtsfn1goU==Hf_QUqA@mail.gmail.com>
 <CADnq5_MyMm+FmmbKHccDDOBryEdgbQHdw3rtuhUv=cvJrirHFg@mail.gmail.com>
In-Reply-To: <CADnq5_MyMm+FmmbKHccDDOBryEdgbQHdw3rtuhUv=cvJrirHFg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Dec 2020 14:45:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgLKJ6S0V0YgVWdcXVH9Zh8CEV5xPBUSFkJ7fywNLtqeg@mail.gmail.com>
Message-ID: <CAHk-=wgLKJ6S0V0YgVWdcXVH9Zh8CEV5xPBUSFkJ7fywNLtqeg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.11-rc1
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Mon, Dec 14, 2020 at 2:29 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> The relevant fixes are:

Ok, I can confirm that applying those two patches gets my workstation
working properly again.

Would it be possible to get those submitted properly (or I can just
take them as-is, but would like to get a "please just pick them
directly")?

I don't like to continue to do merges during the merge windows with a
known broken base - it makes for a nightmare of bisection when you
have multiple independent problems, and I assume this hits not just me
but a lot of people with radeon/amdgpu graphics?

               Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
