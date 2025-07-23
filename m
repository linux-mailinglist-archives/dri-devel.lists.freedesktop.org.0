Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5256B0F697
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 17:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADA410E7E6;
	Wed, 23 Jul 2025 15:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="MHCcow1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170C610E7E6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 15:10:30 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-75ab31c426dso37014b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753283429; x=1753888229;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UuChy1LULay+ShDL03IJdTFrOKC/jWx8pEhX699NilY=;
 b=MHCcow1rqX7ogpqlI5BDEJWN+J0MuvgkZ4TJEsNQqVpdvb9hWAPmuG/9nHqFKspbAm
 h06cJXRoIoBG8OHaSMKVN/d2Gy2meXjp366tL2sJ9+Bk5QJW5or44R0PnfpFUpD5G0s3
 PyV+dlkN4E1cCkjQBUurmkz/Pag1l31zVLfWfvZnNMXPXQPwWtwFjikFysmtGaAD+XDu
 xQ7WqWuzrU/keUUsHNs5fkh0BWhalV3frhTk3/RCMS2ovT0H51YZUu6tuM4DYTEYOCe4
 QFZuJrbW4vnlWBNFLLhc9sFTF/vxAlePbb7ThVbHW+CwgDiT5EvuNfgxaWk42W8dpqNM
 hpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753283429; x=1753888229;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UuChy1LULay+ShDL03IJdTFrOKC/jWx8pEhX699NilY=;
 b=jykOUbrcebeZVXk+7is9sUd6qrvldE8yZMASNCzRhJSkcIPVAGbBbp9FMUEYF1ycia
 vZH9gJEtby4m/sVagXOX3c5rQSuKL/5VQrXcAx3IZ9untbflWolh6KMk2OOgOr7O+B9T
 nYJa/i3pD+qtK234tLyExEFQaYBUbUljnIhaGdig0xjQ9yjB5cdwejQVbannvfQIT9CW
 VefBpthLyHaguR1fFOg8GO2FOzxK+b3vT/xd9LNnxZ/dAS3dAU25qjpBKQmQ0fRtjz/x
 y+CjdG2fciWSZXLdgomauQPAWMvoS8dsqEHMMzql1dhNH7I6gmuQoRqoJg0R04y7DsuR
 pIJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUCpXvR3B9PnFn2I9YrgV4DNf1th00YlTjxJbbzHLg+R9FG3ycxBMTDIpe0MuZase1FoNRw+GXZE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/zFdPa2Ln1Rv+Yhsfcpm086cNpyVURPmklspJWLTceCFwo38w
 dUs9TU0u7GLKEV/GtNoD4uPmfMS9QLf2o0mO6/ux7Xdg3T/8nf4mHarw4bJo02Ie1W4=
X-Gm-Gg: ASbGnctrAIFgwsUNxGOFSf3yCwm+/1FyriaS8dzO/DpT51FFHVX27anlfN3faKyBiOt
 Ql7DA9bYSq9DlhzTbIATIY+mDybaD0+HLDS6ZL2b8i45lwupUl5sQr02Tx5mS2E6cjJIQOBerUp
 llp/ZFKopdV0LkJ3q5oCt4+d7ye3frhUX4HPSSmlZBMLIyOO8++nr6wAL+SLNriHxW1YJi/1Q9b
 wKt7wRj58bovWDUON12upr4JGjd5xsRLcC/NAfPHMKvNh4J0374psXaMi2wX+iFRR3m2nLBOr0H
 tq/d4PFQxk7bYx0EzmDB/WL0tZ/gYWoyVjdpgP5xSHJI9l/NbH8MKM+aRsNewLuvMe5CrC39MoN
 0kyaFHwioP70JYaKubex+NftdIJv97Q==
X-Google-Smtp-Source: AGHT+IE+co2aDTbuxqywk9VXXdq95Qx32EuhMNzguqNw2C4YBMnkv2fPJd5DUodgNwdXPUs40Wvm1w==
X-Received: by 2002:a05:6a00:a1c:b0:748:eedb:902a with SMTP id
 d2e1a72fcca58-760353f328fmr4564271b3a.17.1753283429448; 
 Wed, 23 Jul 2025 08:10:29 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb1569absm9971551b3a.68.2025.07.23.08.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 08:10:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 09:10:26 -0600
Message-Id: <DBJJ3QS0PN8E.3VW8UD9HEQAA6@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: <tejasvipin76@gmail.com>, <diogo.ivo@tecnico.ulisboa.pt>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jianhua Lu"
 <lujianhua000@gmail.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/4] drm: Create mipi_dsi_dual* macros
From: "Brigham Campbell" <me@brighamcampbell.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250722015313.561966-1-me@brighamcampbell.com>
 <20250722015313.561966-2-me@brighamcampbell.com>
 <CAD=FV=XGO5y0F40oaOANW-r-q5qZPFYRwO7aQHi3R6Ag-aeMag@mail.gmail.com>
In-Reply-To: <CAD=FV=XGO5y0F40oaOANW-r-q5qZPFYRwO7aQHi3R6Ag-aeMag@mail.gmail.com>
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

On Tue Jul 22, 2025 at 10:20 AM MDT, Doug Anderson wrote:
> On Mon, Jul 21, 2025 at 6:53=E2=80=AFPM Brigham Campbell <me@brighamcampb=
ell.com> wrote:
> add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-8754 (-8754)
> Function                                     old     new   delta
> elish_csot_init_sequence.d                   758     379    -379
> elish_boe_init_sequence.d                    846     423    -423
> elish_csot_init_sequence                    9136    5380   -3756
> elish_boe_init_sequence                    10192    5996   -4196
> Total: Before=3D33880, After=3D25126, chg -25.84%
>
> So the new way of defining mipi_dsi_dual_dcs_write_seq_multi() did
> indeed give a pretty sweet space savings! :-)

Interesting! With as much as I've heard about compiler optimizations,
I'm kind of surprised that the compiler didn't do a better job before
redefining mipi_dsi_dual_dcs_write_seq_multi(). It's nice to know what
to expect when the rubber hits the proverbial road.

> This patch looks good to me now. Thanks for putting up with all my
> requests. I know this is a lot bigger than you thought it would be
> when you posted your first patch, but I appreciate you sticking with
> it!
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> My plan would be to give this series another week on the list. If
> there is no additional feedback then I'll plan to land it.

Thanks, Doug. I appreciate your patient suggestions. Waiting another
week for any additional comments or suggestions sounds good to me!
Thanks for letting me know.

Brigham
