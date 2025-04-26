Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B58A9D6DA
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 02:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D1110E167;
	Sat, 26 Apr 2025 00:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FDI9oVfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5142E10E167
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 00:56:26 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5e5dce099f4so3636708a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 17:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1745628985; x=1746233785;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Em+2y0/Onk6EnYtiiChWd1rtBYQR732zIpd3lcrr3Xk=;
 b=FDI9oVfpagMJyCxgkh/QI48Q1+1avANci9avIX9/fEUavLSb3d06zRSNHPPUAD6s3V
 hNG/n+T0c/pHz3xMLgih5YASm0oqNijyH29FMnFayZDYVd7XTm3bzYKD5Q09mfXVjMnA
 s3XE+mwfp7cgPMW0crRx1+at0iGP6oruK7vRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745628985; x=1746233785;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Em+2y0/Onk6EnYtiiChWd1rtBYQR732zIpd3lcrr3Xk=;
 b=t/RaNuWvlKoBWX3SqA9qDd3NmsJUyCEBDmMmcVb2avjfUdsDfRzjhSuNOhtTml06h5
 /R87cn0t0QHIAtmu+TCLdKWVwaRLbyileO0BisICVTRkhM7mFmn45c04qpglAyaeNnlF
 qarMjEeyI8YaBwFjawCeZaKUGobeacTzHkN+teL+XYnAJebJ4+CgnlNaqza1uz8tFRlD
 KfiLp5HG88pT6Tet2xMImfrxj0UhUEIU0tO7T0w8dwpUpsxffG3+WlqII7ZuK6Tf/8EW
 DddpUQEDzrau+f2s25o2uxKFgRMtnOwU8NH/ows2ZUMsgY2x5SHkxkkINE0z9WEQvOzO
 AQRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3pyh9WK/j2bK+w0XX/aiiSIZvTwXnRF+U3HqDMzAGLr9A3U874y8LIYnMiWvCPO0yaxqdwwYI8e0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9LHkATl2a7rUNXltI9sN7LqbiwUMfKULOjF5kq54eocl9nF/C
 bP541A1ta60NLthDZaWRjVupKSE2UT1ouw2BZ2LNiAoUCvcos14Lq43wmmpLDcMybIQSb65f1+W
 Hzw8=
X-Gm-Gg: ASbGncu8EWx3YOeU259zwO62uon+OrKNmSr4m46YdAOMtGPVWRBZqW/Tyckdp4u3I18
 Db3tBM27x6Ab9p4669Yj0GlpsDXiGVVk6mCf2Bo2+ies32OzcuQtSNWjrs/4nTiPkvScmBM1Bf6
 et2cKI2fdpq3t/evlGAYXj8km2FA1IIc4xBiLLJc8dXPrtz42iIMIhk93Lu178QRbIB96f4/sjB
 kCW7fLYiyeSLykpOfnRc1W9sCtuixscfPC+mpJNl3PBhUy7iCe6xzQmsgrgxfCzYwy3/FZ90veD
 /ChswzMfP1ux11cRwkoOzraWZ6e58DPB5ZjwwuvJrP3s374GJwvTimNd9NnctajGKhzXlDmnw/w
 I2DnLe2zjljRuXCysTDMA4qCt2Q==
X-Google-Smtp-Source: AGHT+IEjcqNWkWm0uThl/pg5ijj6fWZ43TmeKk74sikIZ7iRBLCJt/up3gJGnoymukvRjnCNHlb9kA==
X-Received: by 2002:a05:6402:26cd:b0:5ed:1d7d:f326 with SMTP id
 4fb4d7f45d1cf-5f72278fc42mr3392174a12.10.1745628985176; 
 Fri, 25 Apr 2025 17:56:25 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7016f6418sm2025242a12.40.2025.04.25.17.56.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 17:56:24 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5e677f59438so4222514a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 17:56:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVwWmpH3zzxdAf2bqhiFWqyGfxqQzFPiIuh1qEiNaUMF+OCrD7gGogB/SDF+o1J/dKAOrHEVtvR/4Q=@lists.freedesktop.org
X-Received: by 2002:a17:907:9492:b0:aca:cac7:28e2 with SMTP id
 a640c23a62f3a-ace71399bdcmr380685966b.40.1745628983049; Fri, 25 Apr 2025
 17:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
In-Reply-To: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Apr 2025 17:56:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj+h6i94DyxGQ2Ez6tvp2sBs70EfY7Lp0N1umpwHL_VrQ@mail.gmail.com>
X-Gm-Features: ATxdqUFsc5Vl9i5t5E_wRus16PP7tDoqjOmUpZWiYCSfOvKDtoPPplMogMN2b3w
Message-ID: <CAHk-=wj+h6i94DyxGQ2Ez6tvp2sBs70EfY7Lp0N1umpwHL_VrQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.15-rc4
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

On Fri, 25 Apr 2025 at 16:12, Dave Airlie <airlied@gmail.com> wrote:
>
> Weekly drm fixes, mostly amdgpu, with some exynos cleanups and a
> couple of minor fixes, seems a bit quiet, but probably some lag from
> Easter holidays.

Hmm. Is freedesktop.org feeling a bit under the weather?

I'm getting

  remote: GitLab is not responding
  fatal: unable to access
'https://gitlab.freedesktop.org/drm/kernel.git/': The requested URL
returned error: 502

and when I look at it with a web browser, I get

    HTTP 502: Waiting for GitLab to boot

and it talks about it taking a few minutes, but it's been going on for
longer than "a few minutes" by now..

                         Linus
