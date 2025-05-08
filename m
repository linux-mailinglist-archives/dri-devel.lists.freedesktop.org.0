Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03C1AAF3D7
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 08:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673D010E8AF;
	Thu,  8 May 2025 06:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="BrDU9UwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02A210E8AF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 06:38:03 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4774ce422easo6901761cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 23:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1746686283; x=1747291083;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OeUWZlXhqMjN0+VbPG5w98gG2BE6Xlz6DNigcIg/m1w=;
 b=BrDU9UwY/sit/rOTzBrF/BAn2MzoDVAONDdm4Kl5bU3kTCy9fDUDZJNSLX4M3JC2WV
 jHlddnJDV+TfvGTu/EAtj3RgDLR4a9U832/8DwWJuthhDXKLsSJhhiVrTGMZqGNbgU9E
 0cGxf9kfMH2oE7T9cCD6BNMWLyDPKKBxcibjVqkt72GKhkems0M0qqm2yBQiWUPhiyAx
 7FJhtPyHvxhh7CSs4K+a+NoO7JqI5sy3Rt2vlpQjD3b2F3isEgNWhrXLmK72Q3iDPQIc
 pqAAbFHtdkgDspXsl8WEFjMBTYB+4mWNN8IZLHwKoqodDRS+OWaWXcKkXElwOCy8vFjr
 IIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746686283; x=1747291083;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OeUWZlXhqMjN0+VbPG5w98gG2BE6Xlz6DNigcIg/m1w=;
 b=wMWh4EeBSgG6G8nK+aFjvHrn+56GGgUTjPocqx4odzASv91fIZUzN6Fi+MotBgkqiA
 OA5Ia4n+Qeq6iJlEI1VVUxnbgfF55Mb0yqmkvzC76v4QnbN1bkPiTpDGdauToilpV3y9
 ImZzn96xmG32npfiw1V8KTS1aDnoivffCResVyM7AFaA9kU7noKMXTJtfabAPdyrwdvB
 wULjSIxc2U7s2kzM9sOg805KcDQe0W5JhjFduummKss2Tj0vcrpuc8m7QWwopyGYEeI+
 eBW1MjSRosXpZ1WOmZu7KB2UEhcIGr9xJ8w9dtjclmjNkwUUmlg/gV5UvTdCbwENiIUL
 qhdw==
X-Gm-Message-State: AOJu0Ywl/bQRP9lPbfwdBWbNkfYmNHjf83kRuhDcR8EjgPO8qYAq4t7I
 J2DBSTMeU6NyMIusd2ithwcPvt9/064vVXlzJB6TlzKBpz5BG774xgnbx9N/pofjOnmUOgE4SFh
 xwJlZVpk5gDndJ3nwTTs9TSGYTPzoR1lKMy6U2A==
X-Gm-Gg: ASbGncv+QYCWOMXZykv0lRQYblIiZkOA48Gwp9WLUf/fu+67SY6UZRHcZFiS3M2sGdk
 ycHm+cYES6Xj/NpAuuSEmW8ymN2mTMnDPt/8CPUH+rKevs22GX/tpsGsgcdfqyD82X+7rixmHfF
 GpHhLIA5dusQxPVa0ZXhCs0w==
X-Google-Smtp-Source: AGHT+IFueGQnpyz2oEGmr9uCKxN2BB55YnMagjxHXKsBYNu2CCuPWwj7XPCKY4sf1PkySb/tUjReRP2Uxco1va1ISZE=
X-Received: by 2002:ad4:574c:0:b0:6e4:3eb1:2bde with SMTP id
 6a1803df08f44-6f542a4cc6fmr101332156d6.19.1746686283014; Wed, 07 May 2025
 23:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250501091315.247788-2-robert.mader@collabora.com>
In-Reply-To: <20250501091315.247788-2-robert.mader@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 8 May 2025 09:37:51 +0300
X-Gm-Features: ATxdqUGHnFUMguiJlFqtnopDIgyCfci6Upo-vCS9UsHTOQyhoJz_Ccf-D96T6f0
Message-ID: <CAPj87rOL6ZnE0bmj1XffP+RJWEgivq1+xWnOk8g3O1oNarj_6Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm: drm_fourcc: add 10/12/16bit software decoder
 YCbCr formats
To: Robert Mader <robert.mader@collabora.com>
Cc: dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com
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

Hey there,

On Thu, 1 May 2025 at 12:22, Robert Mader <robert.mader@collabora.com> wrote:
> Unlike formats typically used by hardware decoders the 10/12bit formats
> use a LSB alignment. In order to allow fast implementations in GL
> and Vulkan the padding must contain only zeros, so the float
> representation can be calculated by multiplying with 2^6=64 or 2^4=16
> respectively.

[...]

> +/*
> + * 3 plane YCbCr LSB aligned
> + * In order to use these formats in a similar fashion to MSB aligned ones
> + * implementation can multiply the values by 2^6=64.
> + * index 0 = Y plane, [15:0] x:Y [6:10] little endian
> + * index 1 = Cr plane, [15:0] x:Cr [6:10] little endian
> + * index 2 = Cb plane, [15:0] x:Cb [6:10] little endian
> + */
> +#define DRM_FORMAT_S010        fourcc_code('S', '0', '1', '0') /* 2x2 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
> +#define DRM_FORMAT_S210        fourcc_code('S', '2', '1', '0') /* 2x1 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
> +#define DRM_FORMAT_S410        fourcc_code('S', '4', '1', '0') /* non-subsampled Cb (1) and Cr (2) planes 10 bits per channel */

The format spec here (and for the others) forgets to mention that the
X channel MBZ. In every other channel, X denotes 'may contain
arbitrary nonsense so don't read it, and feel free to write whatever
to it'. I think you might want to write this out as 'Z:Y' or something
instead of 'x:Y'. But honestly I'd expect people to still get this
wrong and fill it with all sorts of fun values.

Otherwise this looks good to me though; thanks for typing it up. A
VKMS implementation would be really nice for this if you've got the
time.

Cheers,
Daniel
