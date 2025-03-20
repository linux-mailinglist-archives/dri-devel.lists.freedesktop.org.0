Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D123BA6A8E4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 15:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DDB10E62E;
	Thu, 20 Mar 2025 14:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wTYvG6Bv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAD310E62E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 14:45:07 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so752831f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742481906; x=1743086706; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okZxgShwz3RYL2XRi2ZqA6xqBFvvXnL42LzEF2ZGemM=;
 b=wTYvG6Bvoul/25djO4Kvz4OpyibBgUpxWb4V3bnf8vLZdyrEhMp+snNvW5kkibAcsg
 xSozuHpYOTnlp6992yliOM5Xc7fR45oRxSTfFgwnkiYiEU2FcT3EHPzGg09DGd17oARr
 hcEHhfTjOI5oe1JxscelRxbuqchNOMGuKFJ1BcjWYEyAB6UngHRFf+pErrQJkU/8G7Dh
 84ZX18PRebpPhLPKZnYLsLQKErzrk1wBkURFrg5BErzvOWeOnRZEiYyiicQ/w4NByNhw
 eUtbIONMR3P4DYyaaQcbHrTcRLPNghw74L0ObJT5HahMMzc4TAm5+itaGprmBu1S8xhi
 0MpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742481906; x=1743086706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okZxgShwz3RYL2XRi2ZqA6xqBFvvXnL42LzEF2ZGemM=;
 b=YN7NcVzwBP+pZX1UpvHqRxfyDtyj7sL0W3p/Apvdc0VW06pok1ig0MNb0tT0Ap6WV1
 GMFi+VrT0RfjbqXzQ/xgdTekKScGVDeHO4E7vDcyM6obpKLRuZJZ9CY9eQKtORM0Oi9Q
 GExsbuYP3fOypYKNlGSAlmHJvvndjEJ5bPgJ5p6KwXkdduyqfnQMCXSHtpvXCvgS5UPe
 JqaUTopqc6xE2o7KJ70vfkFU/983SuiuUU498axnoRRQx6PKNg1aETykEU/waOdOSwhf
 04//gRBLRTlyIWYXvwnu8GGLqTr2iG/UpijBFADB4PQc50inlv/CgikrP2rLjpBPmarQ
 1ulQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuLx8nPLYkBbcwu11FKniKNpR1faC50Ohz+o/hrIWfly1i6LyjY0QKSf65Dxon8N+yUoCNxCtOVh8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwylTmhP7qQQjnKK6FKtbgORJGz9Pf2LHHxi0UTpuGR7z6QB+Et
 2AJKGpVafOG7HISdWAWz8InY++UzAA+hNFtw17449G+aVTg8Ix/+MiKoV1EGmAaey3kJdylk2ng
 jnMWvsOU+mDnIeSZUmwmheuGucqEgxQsWvZTeNQ==
X-Gm-Gg: ASbGncsGt4cb0qI6XXosdbn4CwOaVjPp73RZa/fYlnE2E9Q01W/snYsS7AZVGDYTPs4
 v/i2w0CnQWLQUtdDgeczyw1LRhQcZ0ZDIWA1EbAJmFvbFmKn1h1voL30qpHfbetcAwRFtEGNkRu
 KjBqOFsS+fZ/97wLi479uuWA7qeKRtvHMPqXW1nvPOBvLsPzk/Fg+ipoYiuTw=
X-Google-Smtp-Source: AGHT+IGbWi0qgqJjSn8J0xXrp3LVunPSnpp5v5LSPRBApvlKNAC5baJfPEJEZlkXAvygQxz6UkBvwZxhJxala1yxGx4=
X-Received: by 2002:a05:6000:400f:b0:391:31c8:ba59 with SMTP id
 ffacd0b85a97d-399739b3f33mr5606547f8f.4.1742481906308; Thu, 20 Mar 2025
 07:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org>
 <zgzivcjcygbi272q3dmkff767cb45uoffwtx37ij23pi2g5ubi@j5bxjdbgqaqz>
 <CAD=FV=Xn2cEKQ+Uj5Okemo4_RJ-1uJ_SQ5X5TycJs5bYdNpcBQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Xn2cEKQ+Uj5Okemo4_RJ-1uJ_SQ5X5TycJs5bYdNpcBQ@mail.gmail.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 20 Mar 2025 14:44:55 +0000
X-Gm-Features: AQ5f1JrC6i7-T8NHX0lZyi2OWta0aE1vTDoug6ytYg33up7lQCpGbLgBq7tQswU
Message-ID: <CACr-zFC1ojVrvX4fCDO_M3_bvqLvBPSYuhMJUzXNwmjGjwpsXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add panel used by T14s Gen6 Snapdragon
 (OLED)
To: Doug Anderson <dianders@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
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

Hi Doug & Dmitry,

On Thu, 20 Mar 2025 at 14:10, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Mar 20, 2025 at 6:47=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, Mar 20, 2025 at 12:47:09PM +0000, Christopher Obbard wrote:
> > > The Lenovo Thinkpad T14s Gen6 Snapdragon OLED model has a Samsung
> > > panel. The kernel currently prints a warning due to not having the
> > > correct timings.
> > >
> > > This panel appears to work with the default conservative timings,
> > > so add the OLED panel to the list of supported panels with default
> > > timings.
> >
> > Are you sure that this panel can be handled by panel-edp.c correctly an=
d
> > it doesn't require a workaround implemented in
> > panel-samsung-atna33xc20.c?
>
> Yeah, I'd agree with Dmitry here. To the last person who wanted to add
> a Samsung OLED panel, I replied [1]
>
> It's much more likely that this should use the
> `panel-samsung-atna33xc20.c` driver, which gets the timings more
> correct for Samsung OLED panels (there's an extra GPIO it needs to
> manage). To use that driver, you'll actually just need to need to add
> a new compatible and use the existing one as a fallback.

Thanks; I will look at this and prepare v2.
