Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9211425657D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 08:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC87A6E4E8;
	Sat, 29 Aug 2020 06:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699016E4E8
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 06:57:36 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id e11so1257518ljn.6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 23:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RPKsXhZunNis7PcwmiU7/1xUx2/k2mnVE9QiQtfTrAc=;
 b=FHuOQT3uJ2EZuQ2fyI+E+yPae31in8tiBSjSf5a8FYXA6aV/U8Zny9f/0XsgNzOTvr
 mTA64qUGONEAIdtTvyV6VYiYEQ/REc62qQlX+H/VaV37KlRBLTRARlSmSeIrUuVcyyTv
 FWfRyVnnuhJmYTlDwOW16siwVDFCF0MS/5dQ25hfKNQN9i7f3yDyclqbgs9WO8r5VGca
 jjc0QjseNcqiTYIFqj6dlAne8oeI7k09kLD+jtemRCvp05S5/wNUIPCg1NuS3zJ8xITi
 R7XTFmXkqWQzowuH/SIpL654tTIwzFE9AeuSaTjUq/qQFj7vaRcL6eyt06j0uD9VBqoI
 56iQ==
X-Gm-Message-State: AOAM533x3PLCSjWOC+EEa2cuq0o9Qg3VU5kse0B+Sp0+RoZ8zFFqTpFB
 J55ToPEikHNvUf74Byaqxkdny7mN6UjD8Q==
X-Google-Smtp-Source: ABdhPJzO/FBGk88ik4JtqrvPgH+B7tz03g+E3PDv3SZAoaYfpmebSJl2zYuCwk4BuSqbwKmDa9dfBA==
X-Received: by 2002:a05:651c:31b:: with SMTP id
 a27mr927004ljp.455.1598684254472; 
 Fri, 28 Aug 2020 23:57:34 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id l10sm309024ljc.65.2020.08.28.23.57.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 23:57:34 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id k10so842416lfm.5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 23:57:34 -0700 (PDT)
X-Received: by 2002:a19:c189:: with SMTP id r131mr1003217lff.186.1598684253923; 
 Fri, 28 Aug 2020 23:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200728134810.883457-1-maxime@cerno.tech>
 <20200728134810.883457-2-maxime@cerno.tech>
In-Reply-To: <20200728134810.883457-2-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 29 Aug 2020 14:57:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v67uiGdCRmoBwYbk8xVajWhYUmnb6n440wPG4FG0xnc4wQ@mail.gmail.com>
Message-ID: <CAGb2v67uiGdCRmoBwYbk8xVajWhYUmnb6n440wPG4FG0xnc4wQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/sun4i: backend: Disable alpha on the lowest plane
 on the A20
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 9:48 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Unlike we previously thought, the per-pixel alpha is just as broken on the
> A20 as it is on the A10. Remove the quirk that says we can use it.
>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Fixes: dcf496a6a608 ("drm/sun4i: sun4i: Introduce a quirk for lowest plane alpha support")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
