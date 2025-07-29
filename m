Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6973CB154AF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 23:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2AE10E09B;
	Tue, 29 Jul 2025 21:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VcwKYUFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B35610E09B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 21:33:48 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2402bbb4bf3so33431685ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753824824; x=1754429624;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oK3zudS5L3oyJg6+qzi2hiSX0O/6W697rLcB9Z7qPcI=;
 b=VcwKYUFyGPZmQ54K8IU0r0xrWu0iNuY/2sFh243ESW6Afx4c+mbkuXiGv2hyrsqrdK
 lWGA4gGA/qoghvwosQfARwAGXwAWpsJLFe8A5UKTrSzQXQxxwdAFqGif45FtVpYX2R5P
 olvKa/e85abZ26JuvXJbqEUBnGlsjcltBzQK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753824824; x=1754429624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oK3zudS5L3oyJg6+qzi2hiSX0O/6W697rLcB9Z7qPcI=;
 b=fTWkktufKEbseRn3PPFsVJjkGyB0oewLdxX0arertbYqA6YCWqOsKraglnptQg7AGv
 SsyfkS6QUoSEwRmBH/l5nnp2zG9n0aejf5QamyDBmc0xmHlCAv6htkfNHEdwYiZjmQLF
 9tRhyd1rhj+KP5s/XD5HbMmoiOJ2knIDthElFFE5G7QjBBKY6Xu6Wbxsnc+nVw/mCSSd
 I3rW764Re/7OcvDXkaZBx63ZgBM3QKkJRdw240Os4tq3YvJJOLIE43Lrtzp5kBRkIGXC
 C8BQxB7vF+97j9Yp5xVFp2wq0G4dS5wqRxxEsf5KKWupL2S4TtX5nnA+GWC88mGbKVcI
 cNrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWuE7+czOFDoR7d0bLGVRThFdNYiqpAvNuO8HfbTUSYUxW3YV4C7G8GyI/TKzjAQ0FBJ2z5Y8ZTb8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxfu9zAiIQeaidpf+x/KzuudM0Af5hsxi8wl5Qa3ioUm49XcE1D
 ZFF/H49MT7eUA5SC2LHAgh4RTFtbzpMXuo3+BI8LNltZF5JqJp9zxdsFKaK8tV2va4PZcXc0ojT
 H7ng=
X-Gm-Gg: ASbGncvLIxsQQ5/dwFUYnjxLKpH4Rzjs+QmJIOkxu5NzTIhxz/m1fV8ZqOT6eOZZ56G
 tPOPaUkd9b+XJhCUxSjH6oOZu7qZ4zv1Oa454o7UJMirK07Wh5HkwbDc8uZkWzZVB8ovtSWCGNk
 j4OKEr0+3MTcMgqy0stObqurZcsZa7hHg0Uwa7Fa57cpVVzuLV1x7OFfSMsYZ2RBGmuDvswjHyg
 AjtvrqyIrS8CFFMC87E33sUV9ZzF2y8+JF4d9ZjsmWhwRdNjYqPx0cgtq+Hiq7OTJRCCIjkmgg+
 9jfE1HYFY6dhfb/jI93f0s0pPmQqix2hkAoQC/DRPtglRaiF8Jpg7cD/5AcvuJzez3MQLCAQQiC
 FKGzW5IUa5SG/0KFO420pDyaRiaFZTLSYnm1+mXFmULMaxhqIwMjeT1/mUNI8BfQKwQhC/qDw
X-Google-Smtp-Source: AGHT+IEbgAIBxyglb73SX6RXiYWJE+ocO09uj/IERrKixG595CF8kAzWgGod9unn711xThcNzp6RYA==
X-Received: by 2002:a17:902:d506:b0:235:15f5:cc30 with SMTP id
 d9443c01a7336-24096ab6f0fmr12307455ad.16.1753824824280; 
 Tue, 29 Jul 2025 14:33:44 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com.
 [209.85.216.45]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-240419a3f75sm43933755ad.35.2025.07.29.14.33.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 14:33:42 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-315f6b20cf9so6624616a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:33:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU7x5F7mT+NlPxEvA4+pFscFovCDq+Odl6cqwFALICQ58o4F1nxe3Bavu3aNYnYb22gNIcn15B6QPY=@lists.freedesktop.org
X-Received: by 2002:a17:90b:5623:b0:31c:23f2:d2ae with SMTP id
 98e67ed59e1d1-31f5de41b29mr1394160a91.15.1753824821327; Tue, 29 Jul 2025
 14:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250729054435.1209156-1-me@brighamcampbell.com>
 <20250729054435.1209156-2-me@brighamcampbell.com>
In-Reply-To: <20250729054435.1209156-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Jul 2025 14:33:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUdfTT4AJk77BFXWy7q_je0EbRKWc=nUVevbgitkn0gw@mail.gmail.com>
X-Gm-Features: Ac12FXz30yn8dPIvGy4yhci1kLmxkqO0_5A7uc1Q2WfPuAiJM5bHgzJdAchVJwg
Message-ID: <CAD=FV=VUdfTT4AJk77BFXWy7q_je0EbRKWc=nUVevbgitkn0gw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel: novatek-nt35560: Fix invalid return
 value
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Jul 28, 2025 at 10:44=E2=80=AFPM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> Fix bug in nt35560_set_brightness() which causes the function to
> erroneously report an error. mipi_dsi_dcs_write() returns either a
> negative value when an error occurred or a positive number of bytes
> written when no error occurred. The buggy code reports an error under
> either condition.
>
> Fixes: 7835ed6a9e86 ("drm/panel-sony-acx424akp: Modernize backlight handl=
ing")

I think your Fixes tag is wrong, actually. I think it needs to be:

Fixes: 8152c2bfd780 ("drm/panel: Add driver for Sony ACX424AKP panel")

Even though that commit that you pointed at moved the code around, I
believe the code has been wrong since the start of the driver.

Other than that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
