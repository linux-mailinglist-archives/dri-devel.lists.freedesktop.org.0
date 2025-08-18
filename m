Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868EEB29D65
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 11:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1060110E404;
	Mon, 18 Aug 2025 09:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dqT+pXPc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744A910E404
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 09:15:32 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3b9ba300cb9so2453714f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755508531; x=1756113331;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pk6MPUvzo+wcFgJnv7cQuSp/8wQRoxoagPFiRotgY0k=;
 b=dqT+pXPcijcvrYS4psNvWVEb9Nlkcp8C8pXZkZgg89rxijppFDmmP/zhQz3HJOKLwP
 ArYY6nDw1EZi8NVJTcTqmdi3oNKdfRbkvxg3DkzfOn6Uq29h4gdTpFZaNFdpqhjXx2ES
 kn/iYI8RsPYesrhcz+WFNOEZawzfYNvBAj+AAtSjS5sT/VvfnLxrEv2GP7u/Had3hXjj
 krFnwxSo2kDR8Gr5tHn/mMr/DVvT8k+6dkPydRcR8Olkzg6eyy0bcUCKmj85pT5x7yvG
 shntPR4eMIjQkWqvcOAz4gBG7R/Ux33749pLORTIYlDG0HNcIxzp29dvUxm0ECO3WtZL
 9Efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755508531; x=1756113331;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pk6MPUvzo+wcFgJnv7cQuSp/8wQRoxoagPFiRotgY0k=;
 b=QupkP87CvT5uFVnkaeJPbOVq8w0xu+2YFdMDSFNyy9cYFYT0LlZL5TKm4uNHain0DC
 nPysyw6KbJ3Fh+/iriih6AhdYZ/185VUl7e55skTSqID7YnwCoQOZYWcVxCvz941V9UC
 y4RebWtY5O7RLXr21aCYF5oICUEs1FhjgHA1cugnptwxEF3ciJwB0Y/70+IW8HjZqlMz
 064/Vl67flJmSt2wV8PKhqLlBEA7s2+K0gP2MCvggLz1hE/6kMdzUKmJzSaJQPFb8JmV
 vHp2oNVh3sc79sY45iUAH1FtKa/TX33Q574x6Jx4TnYSkAKwcIOkX/S/8T9Mme+lupEV
 aspg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFeu1CIH+GABEoammyXrwlt0/NPETzcDTNLUPifzhqcJBTTlkRxIDzkC8UAA5r4f0MD3cGepx9vAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwY5M6NMcdHB5D+Dj4sMkUCVGmwWx/qBYVl9I7rqj5UqxG/I+a0
 h8q1sfoMXWlT/CUuawJeCtBJ+kfYouWD6zIhGiQFRKoopBJrpO81UmLaorjaCovocmI=
X-Gm-Gg: ASbGncvCaZzs6KszSBdu6jHtVcKnFjI62kmb2M8iV7Mct3rg5oz9HJ7kyJvJIKtoEHV
 4O/BqY9uHCQtnbNsok52kwYarjh11ZiIL9A4QEIQk5xhq9dlbtVI8R1j2WIEodPbpQjk+Eet6p5
 tpFfoF/rZ3PLtxyusjlrGcosb2Ys17ywplO9luQPt/3R25T2Y7ZNYrUPBWoerMCHqJmMDK8f8Tp
 d5yaXYJZFyVx3P5jFIuL5Ix2aTVxsOhkwLeRcDwTlbwswSxhs5J/PZRKMYocAiQ9LGZWUlP5F5z
 b1RLgyW9ZGlflH0+am/12UL2iDzuEp1YzzWaWeFjhCZvD/LcB2elsrsCGjbMKg1BSXSxTA1rFxC
 sDET0f+frXOiIVmwZIxL+lT5Rd1NNGJY3M6xgrvLTTgo57OVy0Hiaqrr1TFQRxEVs0ONPYxSiDc
 2M0AwaPw==
X-Google-Smtp-Source: AGHT+IGb+Ck2Rc/beS4ZD2JAeOcF9Yx9/6P72Atsg9LKeyqqmAyuWKj+8gCMCQDmjg/gyjl81iEkpw==
X-Received: by 2002:a05:6000:3113:b0:3b9:53b:ee91 with SMTP id
 ffacd0b85a97d-3bb4c5b8043mr8984345f8f.17.1755508530770; 
 Mon, 18 Aug 2025 02:15:30 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bc5aba02e2sm9753021f8f.3.2025.08.18.02.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 02:15:30 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:15:28 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH 1/2] backlight: mp3309c: Drop pwm_apply_args()
Message-ID: <aKLvMLgZJ4fVLjph@aspen.lan>
References: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
 <2d1075f5dd45c7c135e4326e279468de699f9d17.1751361465.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d1075f5dd45c7c135e4326e279468de699f9d17.1751361465.git.u.kleine-koenig@baylibre.com>
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

On Tue, Jul 01, 2025 at 11:22:36AM +0200, Uwe Kleine-König wrote:
> pwm_apply_args() sole purpose is to initialize all parameters specified
> in the device tree for consumers that rely on pwm_config() and
> pwm_enable(). The mp3309c backlight driver uses pwm_apply_might_sleep()
> which gets passed the full configuration and so doesn't rely on the
> default being explicitly applied.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>

Sorry for the delay. I lost track of the review on this one so Lee didn't
hoover it up!


Daniel.
