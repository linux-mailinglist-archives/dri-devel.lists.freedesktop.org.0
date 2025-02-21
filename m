Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A41A401FF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 22:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA38C10EB3C;
	Fri, 21 Feb 2025 21:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BqrhoDgd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AAF10EB3C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 21:24:33 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5e04f2b1685so3847555a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 13:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740173072; x=1740777872; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1762NVQXdGje3dlNxOQSEQN5RBB3Nw2JuPPfR11IEIw=;
 b=BqrhoDgdYDndq3DhzHGNBXJJEHuCd1wh20x0DO7882tdn91/rh2/ZxkHGbdyludYp0
 06lOEbXHGqGBENH+e5o1/bBp09oLW/eTURN3DoMuvbp9NGlIc/cfMRsHwQTUVVjER1Nw
 P0MARXX3Ss1cd39kBTM4Hotfyh0TVBnbmgQB1fuVsEJuIsQ42VSeo0V8od6rbhEAtSpA
 MPyorrIWCZ7N6aDYLyH5PHv/3y3Lbx6kjH5FMGx8STz8XuX2pzbgtXE1HJ9gtcS2wRrP
 zdMX8wPnricigDm982U2ZFrnHjX91rAxsvNJWQKWsaPXupX6s5flMaZ5T+I3l25USpLf
 qYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740173072; x=1740777872;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1762NVQXdGje3dlNxOQSEQN5RBB3Nw2JuPPfR11IEIw=;
 b=flMUchYdhqiUjs2nCh7W7ioaYyqbypgJcCT43owQVkaRJdFwwh2RBBQl5Wbss0JX70
 esn/IEvHx4oastkeVGSgBJCTaXpdCVehuM8R9tTzxycKVBd+eDrye0ub6RgQfigppDyp
 nuBKKV2MFdCXoQVPxcswQ7GN5GGlsY35Yawidu6hB2v5pxYPG8f26+AH2+T0rBkYFRin
 hF+Rn3I83UfzZsXx+oPAbGTp5jdfwezgGMGaIgYMdmkq3rJjgY3lJ9/okyHuqA0pKKh3
 /V/KtwZWAWbjU5TIwnm+pJAVGnyZQZVWvopofuiErUK6eedjcHQbFL6F30EeU3/wWi6a
 meYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx+t3Ucmtfpro13RdUpYSHnm5NR41p2XECZh9Womv3mxUOiehtKZxw1r0SfLVj5sgo44l3r9c7aXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0XSAReF2NKgMOAwlhjYthpv0WTNZ2pKJXhf1PL7sRaGgC3yW+
 d/vH25JMHj8QAGp6fvBB1v791Y8Ptqq6OmyiXfpVftW06man9gFZNDKKwwmpdQh9Q5OUcumcUEE
 o8n6zpG5cSQDubhUIOovBuivPN1s=
X-Gm-Gg: ASbGnctduG0qtu5GLurSZ/Yp+Os/r+8Ox/qGiWfGG3ZJTIZ11qgPXAbkNq72TJnP7/I
 ZpPzDoZ4lqc6hvDYtI352cpQnQ9Raw/TbyfmcPTWUlluk8AV5v8QcUekQZphjdyUfI4MabT59C4
 4+uMH8og==
X-Google-Smtp-Source: AGHT+IGHZ3p0Yhcy1NooWckT7km21FHzEsXX7wdW6PJ+zdzWXhvCub+62TXotrdDn5kDSCkT35k7Jp72jwVmVlApND0=
X-Received: by 2002:a05:6402:51d2:b0:5e0:9250:435a with SMTP id
 4fb4d7f45d1cf-5e0b7252eb7mr10284527a12.20.1740173072026; Fri, 21 Feb 2025
 13:24:32 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tyHJiMrF8nxXe=mhn0i5N1v-7RHh2TZfoz8BoUBBnuxzw@mail.gmail.com>
 <CAHk-=wiJYQwSMoor__B-8D71S8=Dn5BeAY6tOzSL4u3MEZrtcw@mail.gmail.com>
In-Reply-To: <CAHk-=wiJYQwSMoor__B-8D71S8=Dn5BeAY6tOzSL4u3MEZrtcw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 22 Feb 2025 07:24:20 +1000
X-Gm-Features: AWEUYZmZnwC1hboMSOHw37C9Yg-dylJMTIImEuvQIZT68-vvD-BB6UCjp2DW_C8
Message-ID: <CAPM=9txwcTE048cOGnSNfXqX+ykADgqDHRZmyfnLQGQ_9oRZTA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.14-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 22 Feb 2025 at 07:15, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Side note: I think you do something while editing or
> cutting-and-pasting that loses indentation.
>
> I sometimes have to guess at what the intended grouping is.
>
> In this case, notice the "More catalog fixes" entry for the msm driver.
>
> I *think* it refers to all the following bullet points up until the
> "Core/GPU" grouping, but that is literally nothing but an edumacated
> guess.
>
> So when you write (or copy) the description, can I ask you to not drop
> indentation like this?

I rewrite the MSM bits usually to align with others as they
subcategorise and nobody else does, but I can keep the indentation if
it doesn't look like noise on your end.

Dave.
