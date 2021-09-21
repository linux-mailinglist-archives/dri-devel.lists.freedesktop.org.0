Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B96EF4135CB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 17:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD756E9F1;
	Tue, 21 Sep 2021 15:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4A06E9F1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 15:04:11 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id t11so3031510plq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=U5sHi8cjj306oaDb/RAXcVkT6LaUnwyG2i0jV8EMZXU=;
 b=14iJ+UOQEeWmwBidYb3ZlxxSmCpFBa3g6iXvn7L0ljJoEGakHlSEYQSufQV3/pWn7k
 RmXmNZoOrX2e/qhdKKODpeJg288zZawoWQ5Z3ZQLfbCTHhyrt8FDA8PhA3O0HcK1bD6J
 yUcmupu7CrDazE/5BqnZFO3TkN4L9ho2BmIU8+xEuXblGAYF32fghkbl5PekXw/k2+mE
 MnQjDB8mKe0PmNLzNJitE8kc/zhzXDkVF7X9NoDW1h08qWh4w1x54GXhSGQ7z33PR6qk
 oRqjS6nE+5Z/Q+uaDF4TQ/vV1b8aitFLwAxS36E3Mh2vsNOxOfc8zwIxrYUvg01yEaK4
 2u/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=U5sHi8cjj306oaDb/RAXcVkT6LaUnwyG2i0jV8EMZXU=;
 b=LqRpqAB+tdQs9xpxbidNYMiFO0LMmsFy1GkoJcy6Hcc8gWG0XvQ1HNEGOZEcJ934/T
 DaeyzIyUJFiWnMoBMaQ7FBLdd2YstMbNHhQUEgRikcpFlAx73LJ7LSFlnn2L0/ThhRJb
 AWo0z1mZdptOTAqbNZqHUz0KwTxJEZf5Trif15jugrxECbDgd5htobqpJoq8yVOgvLlL
 ulZxOe4Ap3u5Sq5xImfzX9oyMvdg0vQg4NA93B3n4bbbo+i5CzMFLp2G4LzPJyFLhEeZ
 r+0+0VBZmQtKG2TyyZPw86N7gMx9C7QEOfbQ6DecbcdCJ7ZWp/Q6EGNIibmWxvUEMeCe
 fx3w==
X-Gm-Message-State: AOAM530ssKyK4qLMoU2Epzq+darlPt7NGL1zSlIriet96hXhWNRyYo64
 FSdlmdJuI/QP9YvkcakXiq4EPw==
X-Google-Smtp-Source: ABdhPJyW5gW8ge2xfEG0UWnF9Yt+QwvDwtXjhnnktAGJe72JUfUp0V0dPz6+uQuDx7TpYQsDz6PgBQ==
X-Received: by 2002:a17:902:edc7:b0:13b:86dc:c9d7 with SMTP id
 q7-20020a170902edc700b0013b86dcc9d7mr27789483plk.88.1632236651341; 
 Tue, 21 Sep 2021 08:04:11 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n205sm17776069pfd.38.2021.09.21.08.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 08:04:10 -0700 (PDT)
Date: Tue, 21 Sep 2021 08:04:10 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Sep 2021 08:04:01 PDT (-0700)
Subject: Re: [PATCH v2] drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused
 warning
In-Reply-To: <163221552907.1876143.10392170678364292267.b4-ty@sntech.de>
CC: Arnd Bergmann <arnd@arndb.de>, hjc@rock-chips.com, heiko@sntech.de,
 kernel-team@android.com, dri-devel@lists.freedesktop.org,
 geert+renesas@glider.be, airlied@linux.ie, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, daniel@ffwll.ch
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-4c5264da-5502-4947-b32d-e9008a79ee90@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On Tue, 21 Sep 2021 02:12:17 PDT (-0700), heiko@sntech.de wrote:
> On Fri, 10 Sep 2021 20:43:18 -0700, Palmer Dabbelt wrote:
>> cdn_dp_resume is only used under PM_SLEEP, and now that it's static an
>> unused function warning is triggered undner !PM_SLEEP.  This marks the
>> function as possibly unused, to avoid triggering compiler warnings.
>
> Applied, thanks!
>
> [1/1] drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused warning
>       commit: f7c57a4566115657c16fd6603b6ef8a21bae5194

I'm not quite sure where that lives, but is it applied on top of 
something or is it merged from the tag?  Like I said a bit below this in 
the original patch, this has started to break the build for me and I'd 
like to pull it in as soon as possible.
