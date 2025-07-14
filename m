Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52091B049B5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 23:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A145B10E4F0;
	Mon, 14 Jul 2025 21:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BHqbWbPo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CF310E4F0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 21:47:49 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-311e46d38ddso4335436a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 14:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752529668; x=1753134468;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHUobGGDL83F/rNDnQcpYA+2CpRw+ILTCJaorukvyyU=;
 b=BHqbWbPovcFlSaeZzwA40RCBzhjSRBFus/Aa49AnYMVF7r6FeNpN0LkwJOc1zCMZ2O
 LCj18hX3W809PHj0tPgQTKXWiAcM3JGZQI8rYANmHRFk5oDoWztwIxw93/lvbaIkCoiB
 4ymEwS9ucPYPGORatVcsAcwkNPquRpEltAN/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752529668; x=1753134468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fHUobGGDL83F/rNDnQcpYA+2CpRw+ILTCJaorukvyyU=;
 b=QULupQOqlMLck6iXXVT6YXNvYLMOzFK5HeK7m0yEZx6JJRWrGaN4bGasB5J39JXZML
 jmIQR97rjMesm1Hc8JQuZs6ArZlZp7QOF1ri+i0Cmia3dne12mO1dhGa+0Rk8LNS7KwL
 nt5IiYHEafjuQy2n/V8HVx/xWts7PnvTcqb7SHf8HqPZ2IyNyXQhTuxXj+DqUI86XDwU
 7SPOGHkr4RfKcsygMT5ImF0vL/Sr088R6k+6EEdqifJJckcKjECQiefcoQjxcySjD5rq
 jJ9DsLM0W90LniDYp5VXUG9Zhy39uIpaOOe9i5TXO5lwt274sb/G847km6NhXkEPR5WU
 aYjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqyZ2JTIS/msgcPG9Ejf6rAZnXR5gyiY6r7kGNNvAmEDevhMwPkJGeI8gwqUOUvDuD5ngZwGq5eJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFmE+rP3A5wooQrhSYWbMXmyeZDktf/sOLnuAhUTVX9c7uM9V9
 yMJaefJBMicduhAd1urfvQ2p6ju+MMx3wv2d9i/gUH3YSvS0DpEEfGMo+X3r3Ww5tbQXhszIPwo
 tExs=
X-Gm-Gg: ASbGncuKdHGYBtvFmDnrEvXNkEBxJlT5nZqgDrqQzxzSgsGGDWzSB3auKdTUxyeybYA
 51L9verwGI0LPmjbSjWxf3cllcVJS6AxETjGef5ipYAHDujcEGv1A4NovZwI+lk33RByA+w63uA
 cHBaISUDDc/MXSXTyF2Elua3PljEhOkJeheQuzgbviHjp127YaKtCuPAznFSqY09HXZ2yXouvkX
 UaDSUFXTXEHFXr8XV155dUgMHX2G/0PGv8QsGvAedD6NCEWT2kmfV4hse/PyAmMI5yw06G5TiU3
 Dy0MQKfTK8XBsIrc680f+AE8us40YzkCX39AY4BjRwwZ15iWusLcJP8OaiM+bgNtR7G4Wvf4Oq1
 cd/zmW921IVd4oqLoq3SHEm+Ow0Wm4jgVA2P31Nnp8YQC6OkNuSXd1ArbLTHbEkQ95w==
X-Google-Smtp-Source: AGHT+IGtB7tFL3AHRv9DHGKCctCGap7/TkF/TfEV56b4Ob3zO+sWtD1rNLaMFUcnGEszO6nlu3IrWQ==
X-Received: by 2002:a17:90b:180e:b0:313:bdbf:36c0 with SMTP id
 98e67ed59e1d1-31c50c3290cmr22212978a91.0.1752529667982; 
 Mon, 14 Jul 2025 14:47:47 -0700 (PDT)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com.
 [209.85.215.176]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c301eb658sm13946144a91.45.2025.07.14.14.47.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 14:47:43 -0700 (PDT)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b2c2c762a89so3856639a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 14:47:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWMNCc56/TQkALIA7YujMtiJ015ZiGpVzg7VE1uNtvT/zw6H66sXWG89w/lz7iOXlwK+07l/9mTkl4=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2f03:b0:312:e90b:419e with SMTP id
 98e67ed59e1d1-31c50d7b487mr22879682a91.12.1752529663338; Mon, 14 Jul 2025
 14:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250708073901.90027-1-me@brighamcampbell.com>
 <20250708073901.90027-4-me@brighamcampbell.com>
In-Reply-To: <20250708073901.90027-4-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 14:47:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJ8yqzyivLTrVCzjtNOH1Y8BUOS_U80es8vJGBt3AdCg@mail.gmail.com>
X-Gm-Features: Ac12FXwFl16Z6-RJd6zYJ2xS_PM42hpyLDaAqwQv40cOctjOMerkyA2E6guYjpo
Message-ID: <CAD=FV=XJ8yqzyivLTrVCzjtNOH1Y8BUOS_U80es8vJGBt3AdCg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm: docs: Update task from drm TODO list
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, Jul 8, 2025 at 12:39=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Update TODO item from drm documentation to contain more applicable
> information regarding the removal of deprecated MIPI DSI functions and
> no longer reference functions which have already been removed from the
> kernel.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  Documentation/gpu/todo.rst | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
