Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D213A477A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 19:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F76F6F385;
	Fri, 11 Jun 2021 17:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A64E6F385
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 17:07:38 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id e2so10621832ljk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 10:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lOwkxf9QRi7C3lCfgqOaMKKdXM7YRsMkMG4gYcCEg7I=;
 b=hUJtNPjnc847EoQjZg/d561dlIomi/ORN/IB6rkSZqwqeECoGwZQRFJQb+QdwUYn9T
 gwvhv/DRfsqEqPJ1L/+W7BW/NLwxmhESeKzps5vuIMRmU1zEDrnRRjrssR42rdQ4pK6I
 xDo5ImsIUPlvP94FmFZNoRW0/65SEWbj3gJrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lOwkxf9QRi7C3lCfgqOaMKKdXM7YRsMkMG4gYcCEg7I=;
 b=os4dqmz3hOtnq5Kn/LjQyDSVXrRGlxlt9NkSMIwz3vIeZDKTK1L2RRboo0zW26R7AB
 LAim8vvha83jKJ9vYo+yYi0aR/UITEOL2EHKrWPPcX//hxAJfy0kLRsB872WjYa1znAI
 eaXtOlI3+Ksoa7ybacE1TzUHCVR6qMS/d1TT9eYU0jY860fcNl+3VscxKSlfaF1NIRlh
 WWeSeRPhUVxXmjkgUZkRbPjbUk5AbqXy41fFSHB8gv4FK2ynQQJasvYzOIjXLdWjVPjN
 FwPDqh+TO2hqcGi98pTGvOV22VzojEo6T3A+bcPTbRQbC/HeSa7SI95YKzzj3Y18ZPZ3
 0aaQ==
X-Gm-Message-State: AOAM5305sYE5ZBkGPJ7iFj16/sqerm0kg0o2KFwtxGrVNHu/+ISuomEW
 nECwRpg6YtfRhC2A9iJOPCkOuA+tPUdvM2UjnSg=
X-Google-Smtp-Source: ABdhPJyF6z+84MgQ/bKY0wnDmFOQhNIkVkeK0aA5DHXUyOAXi1Zkg8e/c664nhiRFRZ/0Z1/U5QqOA==
X-Received: by 2002:a2e:a593:: with SMTP id m19mr3898461ljp.103.1623431256538; 
 Fri, 11 Jun 2021 10:07:36 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id a1sm640273lfu.45.2021.06.11.10.07.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 10:07:36 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id j20so9533718lfe.8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 10:07:35 -0700 (PDT)
X-Received: by 2002:ac2:43b9:: with SMTP id t25mr3314299lfl.253.1623431255687; 
 Fri, 11 Jun 2021 10:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyyyQ-0QkKquLX4q=7=pjGeRxhhP=z7rfLjEbX7mSrh5A@mail.gmail.com>
In-Reply-To: <CAPM=9tyyyQ-0QkKquLX4q=7=pjGeRxhhP=z7rfLjEbX7mSrh5A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jun 2021 10:07:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgT1ZXOGRjBHbvw+GqY=qUv4oHv8BZ6FpSay6z_0FxkPg@mail.gmail.com>
Message-ID: <CAHk-=wgT1ZXOGRjBHbvw+GqY=qUv4oHv8BZ6FpSay6z_0FxkPg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.13-rc6
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 8:41 PM Dave Airlie <airlied@gmail.com> wrote:
>
>   git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-06-11

I think anongit.freedesktop.org is sick. Can you ask somebody to give
it some tender loving? It's just disconnecting immediately..

             Linus
