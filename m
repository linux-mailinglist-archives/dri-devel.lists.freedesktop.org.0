Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC52CB16B06
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 06:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CE610E46B;
	Thu, 31 Jul 2025 04:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aM9ZUHOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A505610E46B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 04:03:08 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ae0ccfd5ca5so59624766b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753934587; x=1754539387;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NPKXqdiNRfz9wDSlkjOv4OtDzi/lKSKsZRfJnPqPQXA=;
 b=aM9ZUHOuDUBqHxnaHw9cU6Lb51p14vnSxSrRKPiwnVIlqzOeKhWZoLNw4Q6QZMnnoY
 RMwI4JnC0h1V4NfL1EllMt0q5W2qYsvMuz+kic2XUr5UZY0aT0mA2Fa4XWGkLHJeTAmz
 vjdlzGvMAI1L7e5S9Adm2IcNCt8+pnAK4WhHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753934587; x=1754539387;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NPKXqdiNRfz9wDSlkjOv4OtDzi/lKSKsZRfJnPqPQXA=;
 b=nja7rrIYpUyNTCk5+j1U9bcUAo4doytEK7drnxfQgcxMk3EOd08F77JqTWLTYs1MIJ
 N5Ce4/PX5aBq0HAf2A2RhqEzfe/5QML1B1m/Bso2yzdxTk7dq67ZOFuHs6xwmmfvfCVD
 4x+Au46wJ8WoIPDrSeCuFh2NKSUfcxe7IZXSnmWv5k+wwhwhIlJifmzqEMXHEVUHaeTQ
 Z0KIcCURFQaU/ulNqUh+kVNe6He+kiGaBjblEbKwf7ofT6dVx7/UfhEAvXNKGAw3AggL
 ulI1b6tWPywNWpRL27ETZDiMmacT4N8novSTaXJpnyuzume/Zk6Z9MGKTaC7rlze17IK
 PCbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzepZXzxeOAUkjNA7XCYf0CzY2JMfea/QGUcOrUipB0Hor81kjkk+oT99tNitp4zK10wk+gVZWsf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6OXRXYewJMiICWp90vzkktlC8LHD7anWwHoY0V5/TvJGM2lMX
 fRKbigTw67vnXXwgMUPk1TtGSChEenCdev/5bBMBSsixWWT8fmZqTjC3pDpu9N6Q14fTu0deQ9U
 9IFaSM2I=
X-Gm-Gg: ASbGncsMKI8gfxDQF2xP6B/puRKR1Xd834rLOQEv7IN9yCNZsL9Ow6Gi6e0bhfmasu2
 V4iknXelMBPfL8dEsVhaKullcnductKf6smmucupg6NY+1VUV7nqHKKKnpJeAJkCMCVFV1TdEeu
 kRSwJixCdjAIxS3icItl0WLmXRNVkBMG+BJzbSKJyR1x1R6sg4YQyqriATdNYBYJSjjv75UmVg2
 wLmx4wrM2PZ4bqY11x7XofgfzV2Oy11SylDCx4UrshaVbINqVt/Lah+WK1ds4O819c00kmYbpib
 KTuzEewh4gQV1tzHC/FXpqCpZ+l5v9VVEsQgU+26Q5Y7UIPyEVJtqYHEmGIJ5aYxCLPNjDk/m50
 qx3qfkHOfuxETQqlg023Xa8Zxf7F65lBTFnFOvlq9jt8i7ynDn2XQEC88vVvJxt9gxbK6WtO8
X-Google-Smtp-Source: AGHT+IGiHigH/WgZmLfyRjQCSM7oPgoPe0niKncWD4XzNgHmN/YDaXEjTIjTUr8w0C9aA+hakkui0Q==
X-Received: by 2002:a17:906:9f86:b0:aec:5a33:1549 with SMTP id
 a640c23a62f3a-af8fd9c2024mr649508866b.40.1753934586699; 
 Wed, 30 Jul 2025 21:03:06 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a24366csm40457166b.143.2025.07.30.21.03.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 21:03:06 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-615378b42ecso774911a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:03:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWMz6xlgOhFy6mkOrMpqQ6S1rtGr5+Twiq+JYVNpGpPAJuVI4q2aQb+lNJA00SNqn6ZEzeQX7uZ9wg=@lists.freedesktop.org
X-Received: by 2002:a05:6402:358c:b0:615:adc4:1e66 with SMTP id
 4fb4d7f45d1cf-615adc425aamr743956a12.25.1753934585514; Wed, 30 Jul 2025
 21:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
In-Reply-To: <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Jul 2025 21:02:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
X-Gm-Features: Ac12FXwzEYQPZO5k4XVAeWdA0YWy0Y0i-TF-7I5eTKnrgbe7iqaulBg1IFiRC2I
Message-ID: <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
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

On Wed, 30 Jul 2025 at 20:40, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'm very unhappy with the end result, because it just results in a
> black screen at boot for me. No signal.

It's not something in the merge, and it's not something in my tree - I
see the same plain "just a black screen" if I try that commit
711fa2667d8b that is the top of your tree that I pulled.

I've started bisecting to at least narrow it down a bit.

              Linus
