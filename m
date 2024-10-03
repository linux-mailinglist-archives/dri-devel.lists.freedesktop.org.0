Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0CF98F815
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A7410E24F;
	Thu,  3 Oct 2024 20:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CwSDX4ho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199ED10E24F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 20:28:55 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id
 38308e7fff4ca-2fac5eb10ceso13888471fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 13:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727987333; x=1728592133;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nYIVkNsPyt+bQBwSMHMJOZjiBjar2atE5RRCUQ3xHXI=;
 b=CwSDX4hofcRIP+vrKJUY9WuYdGT1cDvV+QjUDUWh0pXIf1q1kHrNDQxGMUSIarTJpW
 3A3wUq7saPRKSMH7VxIQWiwNpqpjYTOzSyB8rYrDQ5Lqr1VOiO+sexN6FFyTIrMfrOn0
 dS6U69wa4eXMQEmwZSzFSqDaKzZLhk7ZPRreQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727987333; x=1728592133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nYIVkNsPyt+bQBwSMHMJOZjiBjar2atE5RRCUQ3xHXI=;
 b=ftOKdqVaG/8V9yls7JkSYyBI33tmB9veb3hGNPxvYp6bh4TBQxRY4jR+mh5YTSbixW
 mDlaQ9VzMIkIxiwVrTYpC8yjrZ/+Z+F9P6vPBslkrb/G19QY9+M7mttjKWK7nVs5f7Sz
 o5IU6jSfvdYareltE88F2G/95kuOXZtvzf5T9PBC7oo48zp/bMSiit59Bp7jxFVNbh2E
 IIql+TXE1xH98K3POLG7XSxqVh+KiuwcMYPzSMGTS+zg49K8wBzNODT2DzGFCEx3wZ6R
 2k6rr6vrdOR0MtQoodvP+5t+x9hHoZGnqB7gySLj6u1xmPolQSm7MmIVPXlFAY1WwTy8
 cB4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3rELKVC0jgtaEx6hCYgu2j3BR3lHbAiCRfW5g5yTSYyTnpM7SEGjgNLxakH5T30+mSNHsWStgzlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx87vCBeZZ9URyhYlMqArrhPs3WfN0ItnAwrw4nckqcihd+f3aJ
 htS8tLQX8KddOhuAacRXKv3X7SHQmYHSNnIr5Ue19QjbLTqo3dY2/ct2XcptIbZ68Vw3JTDn3k5
 V7lXM
X-Google-Smtp-Source: AGHT+IEqM2JyrZSZ8ISKXTSxyxQ5VqwnMDzCNa+q/lqMtI96ClyL/ew47bziqaeM91YYF4qEr8Sx9w==
X-Received: by 2002:a05:651c:b2c:b0:2ef:2c40:dd67 with SMTP id
 38308e7fff4ca-2faf3914675mr1283471fa.3.1727987333018; 
 Thu, 03 Oct 2024 13:28:53 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faecc6c56bsm2948491fa.92.2024.10.03.13.28.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 13:28:52 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fada911953so23808441fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 13:28:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX77G0t50d0DLg6kXq4gH0WrWkWnoW7UIW86szea1qApKzUUppAKGFLUOhQoHomPUWtIx5SJn365Es=@lists.freedesktop.org
X-Received: by 2002:a05:6512:2247:b0:539:933c:51c6 with SMTP id
 2adb3069b0e04-539ac17ec4bmr91249e87.29.1727987332011; Thu, 03 Oct 2024
 13:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240926092931.3870342-1-treapking@chromium.org>
 <20240926092931.3870342-2-treapking@chromium.org>
 <CAD=FV=V5Yf1shF2eKCYOxu=x48cScTh8WXkcm4Xvr1qJnSn1Kg@mail.gmail.com>
In-Reply-To: <CAD=FV=V5Yf1shF2eKCYOxu=x48cScTh8WXkcm4Xvr1qJnSn1Kg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Oct 2024 13:28:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URZRRoa1YNVTAx+jnfbP4tz+tn7sAaGR2-1yCWYVUoiw@mail.gmail.com>
Message-ID: <CAD=FV=URZRRoa1YNVTAx+jnfbP4tz+tn7sAaGR2-1yCWYVUoiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: anx7625: Drop EDID cache on bridge
 power off
To: Pin-yen Lin <treapking@chromium.org>
Cc: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Thu, Sep 26, 2024 at 10:15=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Thu, Sep 26, 2024 at 2:29=E2=80=AFAM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > The bridge might miss the display change events when it's powered off.
> > This happens when a user changes the external monitor when the system
> > is suspended and the embedded controller doesn't not wake AP up.
> >
> > It's also observed that one DP-to-HDMI bridge doesn't work correctly
> > when there is no EDID read after it is powered on.
> >
> > Drop the cache to force an EDID read after system resume to fix this.
> >
> > Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to =
DP")
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I don't think it needs a re-spin, but for future reference you're
> always supposed to move your own Signed-off-by to the bottom whenever
> you "touch" a patch. Thus yours should be below Dmitry's tag.
>
> In any case,
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> If these haven't been applied and there's no other feedback at the end
> of next week I'll plan to apply both this and the next patch to
> drm-misc-fixes.

Dang. My brain wasn't working quite right and I pushed these to
drm-misc-next instead of drm-misc-fixes. I'll assume that this is OK
because the problem fixed isn't exactly new and the patch will still
make it to mainline before too long. If this causes anyone problems
let me know and I can also land it on drm-misc-fixes.

[1/2] drm/bridge: anx7625: Drop EDID cache on bridge power off
      commit: 00ae002116a14c2e6a342c4c9ae080cdbb9b4b21

-Doug
