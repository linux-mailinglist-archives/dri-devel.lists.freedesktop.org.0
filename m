Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D201AA401E8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 22:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195E310EB37;
	Fri, 21 Feb 2025 21:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B6Z6HU9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C777A10EB37
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 21:15:36 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso498264166b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 13:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1740172535; x=1740777335;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LwDyl4qTU31EYFlp5dVtYKLArSitXPy3ISMIrVX8EG4=;
 b=B6Z6HU9A8iWxLn45XkWC2+Xj4eroyEeCcRgl72ZM1p0cCz00vhY1tVqAuOF89vvOMy
 26cW1pqXvBRtyFXkUjoKzD6vStNSSatLGOh22/7XEbNb0N80FS2fZ2O2v6HuJIpEQRuR
 tPARimhFJTZGyPNbsmjQTGkl+qRJCiBUiYM3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740172535; x=1740777335;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LwDyl4qTU31EYFlp5dVtYKLArSitXPy3ISMIrVX8EG4=;
 b=MOCZbmwcQ2p+d4MLTOW0gm6Xc7JUeXoHN08ujYP2LfqTA5VgdN0kZ4Uo7SxCfsCkXa
 Bh6tC5GO6SYkX5jdXvRKz8s1uxTSEjB1VKlAJRhfIihLzPTI67SvfhnZJY2f5XYKzgvI
 qrYw6EKyGktzBCo4vqTqzQvcB1y5T0xCFW1pXDuWqPGKRTYNgJQrIzktQ6Cm+KIjP9sN
 yp02nrK0AXkA0fHAeJ/KFXEB+jAhpUM7JB12Dq9tWp3RqV+cWjqIO9MTg9V1KPVajRW5
 kALExy0Yb9tcK+f5LXfShG3cyr865gN+TnHjtya8F0CGOqST9PZQ5z/2tFGB2zgj4Etp
 2bpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7BLmcawjxXfUFXidnvVbQM4mMN7uvtA62IZXVa0f0lW+2qZ9RFcN3LrtetwreqVtqkGTovqTLWWI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi1TxwbIlLI1NWXPlPFJu4pZpmcNO+yFcHzZ54V3jijzAfL5iU
 0hgmD06NJonkd+qWxvE99pn8kJ66au7IHQGI6369GIhMH/c+jki/nvSeqzrDTvSw3EclVcJcsK6
 YBDI=
X-Gm-Gg: ASbGncvhUeJCZbj1G/xu/roNK6qVvMYRdeJrQmSof12L6bqzSpeCIKAEGqIYbyhPcA3
 2gjYcwY2OrSgAfAYco8dSu06FVGSjhOi+LCQQ8LwDRZt+aC1fwX8YdSSaSGRRba46vuP2y0N1PV
 WbCm/IIu8EhD4VbkyrNO4hHrIlVRGJH1f5imwK/3VKJdH8uAY2D/Ws1i7q9uDxu2vV0eUj5SsGQ
 24xLEQJqpIYfInXgMBG0qHnB43hxMDT7gTnlxs1x+hG4w3qEZXpPORLE3plBf/WCeCPkrk1Jp/c
 hFvzh4yUeArmL5JTjOaOiV3ReWoW1EEny8SNjbd4W8ksPuetP2E2wl/vHJqSZuliRX98rBmrG3O
 L
X-Google-Smtp-Source: AGHT+IGHbYxHnAOaBcDnBIdDWxxksJwKiWE6uTRIrVsK4hUMdmrPiHxbH3Y7Si6O4BESVolqj5/qhQ==
X-Received: by 2002:a17:907:8688:b0:ab7:84bc:3233 with SMTP id
 a640c23a62f3a-abc0da3b026mr456453266b.28.1740172534744; 
 Fri, 21 Feb 2025 13:15:34 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbb4fd3af1sm805642266b.168.2025.02.21.13.15.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 13:15:34 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-abadccdfe5aso440451366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 13:15:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXTxH3sz2KMUG6Ee8kC27IrRh6xsNV2ZAZbZbhcmdfArCJbTuWAc1ve4EHrddKfH+3u//V0+4ozXpE=@lists.freedesktop.org
X-Received: by 2002:a17:906:c148:b0:ab7:7cf7:9f7a with SMTP id
 a640c23a62f3a-abc0df592b6mr489239266b.53.1740172533587; Fri, 21 Feb 2025
 13:15:33 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tyHJiMrF8nxXe=mhn0i5N1v-7RHh2TZfoz8BoUBBnuxzw@mail.gmail.com>
In-Reply-To: <CAPM=9tyHJiMrF8nxXe=mhn0i5N1v-7RHh2TZfoz8BoUBBnuxzw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Feb 2025 13:15:17 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiJYQwSMoor__B-8D71S8=Dn5BeAY6tOzSL4u3MEZrtcw@mail.gmail.com>
X-Gm-Features: AWEUYZnwpf68JgRFG_HmCCL32GS0Ch2KPkBiw_7IJ37MT9V30ylIZmtFeJqV1h8
Message-ID: <CAHk-=wiJYQwSMoor__B-8D71S8=Dn5BeAY6tOzSL4u3MEZrtcw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.14-rc4
To: Dave Airlie <airlied@gmail.com>
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

Side note: I think you do something while editing or
cutting-and-pasting that loses indentation.

I sometimes have to guess at what the intended grouping is.

In this case, notice the "More catalog fixes" entry for the msm driver.

I *think* it refers to all the following bullet points up until the
"Core/GPU" grouping, but that is literally nothing but an edumacated
guess.

So when you write (or copy) the description, can I ask you to not drop
indentation like this?

            Linus

On Fri, 21 Feb 2025 at 12:51, Dave Airlie <airlied@gmail.com> wrote:
>
> msm:
> - More catalog fixes:
> - to skip watchdog programming through top block if its not present
> - fix the setting of WB mask to ensure the WB input control is programmed
>   correctly through ping-pong
> - drop lm_pair for sm6150 as that chipset does not have any 3dmerge block
> - Fix the mode validation logic for DP/eDP to account for widebus (2ppc)
>   to allow high clock resolutions
> - Fix to disable dither during encoder disable as otherwise this was
>   causing kms_writeback failure due to resource sharing between
>   WB and DSI paths as DSI uses dither but WB does not
> - Fixes for virtual planes, namely to drop extraneous return and fix
>   uninitialized variables
> - Fix to avoid spill-over of DSC encoder block bits when programming
>   the bits-per-component
> - Fixes in the DSI PHY to protect against concurrent access of
>   PHY_CMN_CLK_CFG regs between clock and display drivers
> - Core/GPU:
> - Fix non-blocking fence wait incorrectly rounding up to 1 jiffy timeout
> - Only print GMU fw version once, instead of each time the GPU resumes
