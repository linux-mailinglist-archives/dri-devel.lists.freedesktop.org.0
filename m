Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03F3589FD9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 19:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2309ADFC;
	Thu,  4 Aug 2022 17:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5512A36E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 17:25:39 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id tl27so558613ejc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=SSuMHfi3kcMSgnyvItLcQACEgUeRMPEBufWTkyyNck4=;
 b=QVKp1nRXrljkSMaNE8czkVxdfvvVkB6enkHU8DpRs4rDPd/IV28vYtSJ2DcN6VZ5x5
 lWrhBmOP+alvOf1/u9pSH+k/Yawyo9kwUoC4cbA4lM9Om2EGUojfr+k1wJNPyhp8hlyd
 wEPOZsiacLpiQpfseuIX8HIbQmJhiObDpdlIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=SSuMHfi3kcMSgnyvItLcQACEgUeRMPEBufWTkyyNck4=;
 b=mpvpZc32nc9UayVYkMzvmolw70aJoONqAPKH+7HorZAqiVHzOPptPBqZQbrIo7qDcx
 KmrPq2dVSIMf6fjGa/WEdIbXg1HBoOgpwgoQgJul+5QYVj4Tc9hW+tbbuC58qLioP/9O
 iq3g05Vb9anFo2C5H7S8A5NV9n2tJ/iGmZ1/0Tde6Sgzk4dcVJmIj5JYEsowK6dJn6Zc
 kwdw6gqdnUk9WaEmrO5XPunyJN7PB1Q6I3xcTVgIitrDOU0m72j0JxB12IByDXLokSfB
 izJklM+lowiwfhKGANfZdtHXw2sl4GKj+FNxI3azf+Ypm9tigXCT0NhwwLLOJrLNRtux
 bizQ==
X-Gm-Message-State: ACgBeo0+3F1LfcBJiIBMoHpn+appPMynLYYewPTsH4GFEbaBAW2KJeRu
 67QBiTByYj3kavv0gBBPWYwaXpocwiGlDsQD
X-Google-Smtp-Source: AA6agR4pzwQ0Y/CMbgYz143YNT+LIOBxF7u9Uku9nqgP6dlZPirCLoX6wjZJHyyCxWBLNcgZwdeAAg==
X-Received: by 2002:a17:907:6e14:b0:730:a229:f747 with SMTP id
 sd20-20020a1709076e1400b00730a229f747mr2242971ejc.202.1659633938179; 
 Thu, 04 Aug 2022 10:25:38 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 w10-20020aa7d28a000000b0043cf2e0ce1csm934721edq.48.2022.08.04.10.25.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 10:25:37 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id c22so269182wmr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 10:25:37 -0700 (PDT)
X-Received: by 2002:a05:600c:1d94:b0:3a4:ffd9:bb4a with SMTP id
 p20-20020a05600c1d9400b003a4ffd9bb4amr2128779wms.8.1659633937248; Thu, 04 Aug
 2022 10:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220804055036.691670-1-airlied@redhat.com>
In-Reply-To: <20220804055036.691670-1-airlied@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Aug 2022 10:25:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiDQceAojsjRTtd=Rq4h3pkU8C1uFj97EuWkYWGQk_6Lg@mail.gmail.com>
Message-ID: <CAHk-=wiDQceAojsjRTtd=Rq4h3pkU8C1uFj97EuWkYWGQk_6Lg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: restore plane with no modifiers code.
To: Dave Airlie <airlied@redhat.com>
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
Cc: Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 3, 2022 at 10:50 PM Dave Airlie <airlied@redhat.com> wrote:
>
> With this applied, I get gdm back.

I can confirm that it makes thing work again for me too. Applied.

             Linus
