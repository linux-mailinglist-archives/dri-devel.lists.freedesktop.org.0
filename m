Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69123A0B656
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 13:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ECB10E65D;
	Mon, 13 Jan 2025 12:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I5l3SXM0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158D210E65D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 12:07:11 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e461015fbd4so5872422276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 04:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736770030; x=1737374830; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VuOOUnQTY0QerYIiWmEZgh6RmavFPsWyvnF/qYKg0dQ=;
 b=I5l3SXM0FcvSwD6OaksumLTSyMgnRJrgskkaB1pqSrwpNGIgZOTeE2xX4nwkbeovEl
 T7VbnFxhCK1it4TBvSsBbl3Gzj5596P/eQg5zi60s9t3kZJAIQPb1YcwA78CVHg27PgC
 IaGlANeU6vqZn9JTrJnjpM3sPVoXEfjunKO/TjcR+v2pZh+owI3UKdNw8iBrr68l51ad
 fC2dKSuXsoBhBAFmMun5YP4egD5pw3CVeoh94RjDInHL4aAoVJBH3mvGgtEiQzElqcZo
 IS61dlkVTow+ZTXotYFkTNypd90hUuOFINy0Xc8lOjoLd9lHL3GbjKtiuZmYSWeDz+tT
 O4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736770030; x=1737374830;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VuOOUnQTY0QerYIiWmEZgh6RmavFPsWyvnF/qYKg0dQ=;
 b=p3fgxdUqKtWu9cB6yzOgia36gVs/Djo2QxwV/pNqdMYIotalT6VaZCWy5sIyAM8WAp
 dk9q81jEvwfkAF2bZ9uBnw8lYjfeS06dj+AE94N09GNvS3d832HVsn1QjIBiHa38yM6K
 oiFLmDpwuTWOkXUMmRQlklHZlX6ZqoG8d179ihfDbpy3z2txwg1rMeed5jloWeTyWHUp
 ooJxskpuEm7WGG1FBcC8hpQ5xut1lIuJGWfBDUiTiObxxDfKgwagGVZ+JAtOAr22z8Lr
 +igGZzzgrQYnaNYLAGyQxCQ0fai3YD4z6bqp5tIGaBSS77JAo/pivHyoZJKyiYv1ycNt
 sFBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPFw4P3NzWtnhYdpi51PbAiL9bOwno0KrE4QgRRNx3mpXYQw9x/7KKmqMCepSTVRGRYdB3QK7Z0cE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5Sdvku4+2hN48UX1CBPRmP0P7XP2SFU6ix91hduu50vMOLJLf
 FeuMTCgnGBLxHFlNOXg+iexdR/fRu4hsk7l9Ep/f17Cs1DpSftvSmaialN6xRVJdcqyB5ILaj0o
 eD/W8Ayy5G23+qLZwxwtg5UFupIdlnQp70CKIZQ==
X-Gm-Gg: ASbGncuyV6s05zLBcoSw8jcxEoEeZFXkPM0w7JPR86OW7ovyVXl+P409a1FfJ3d+pvg
 VIYMHuk3jNKtUJZiTK4zv1tKZQY/nB49hHCNX5jfEkRU01l0WmeawPF9Mmj+UWOncbPBhUg==
X-Google-Smtp-Source: AGHT+IE2Ggi/9JwYKSlgJdaMlQoC/4xHBMvaVRsHC6bvJZsH6LznsqMSoumOLfLpcVZmPoKYeH0Qcf4MoD8dekdtOyg=
X-Received: by 2002:a05:6902:13c4:b0:e57:2a07:a975 with SMTP id
 3f1490d57ef6-e572a07aaefmr8595922276.29.1736770030213; Mon, 13 Jan 2025
 04:07:10 -0800 (PST)
MIME-Version: 1.0
References: <20250111-hdmi-conn-edid-read-fix-v1-1-d68361624380@collabora.com>
 <20250113-piquant-lizard-of-strength-ee5760@houat>
 <aed7387e-196a-4819-b24e-788c925e1dee@collabora.com>
In-Reply-To: <aed7387e-196a-4819-b24e-788c925e1dee@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 13 Jan 2025 14:06:59 +0200
X-Gm-Features: AbW1kvZSoUuiMTymAzM9iO-2TgE1AfpGKdqTck2tOJ4U_iRYny3UT-gPF8tjre0
Message-ID: <CAA8EJpqzGZx0PdPKZMEwf3iv9pfb+Cr6Mrjt+p21rUwN-RiNvQ@mail.gmail.com>
Subject: Re: [PATCH] drm/display: hdmi: Do not read EDID on disconnected
 connectors
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, 13 Jan 2025 at 14:00, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Hi Maxime,
>
> On 1/13/25 11:35 AM, Maxime Ripard wrote:
> > On Sat, Jan 11, 2025 at 12:04:09AM +0200, Cristian Ciocaltea wrote:
> >> The recently introduced hotplug event handler in the HDMI Connector
> >> framework attempts to unconditionally read the EDID data, leading to a
> >> bunch of non-harmful, yet quite annoying DDC/I2C related errors being
> >> reported.
> >>
> >> Ensure the operation is performed only for connectors having the status
> >> connected or unknown.
> >>
> >> Fixes: ab716b74dc9d ("drm/display/hdmi: implement hotplug functions")
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> >> index 2691e8b3e480131ac6e4e4b74b24947be55694bd..8e4b30e09b53b84cfd36199d56db3221a00085b0 100644
> >> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> >> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> >> @@ -786,8 +786,10 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
> >>      const struct drm_edid *drm_edid;
> >>
> >>      if (status == connector_status_disconnected) {
> >> +            drm_edid_connector_update(connector, NULL);
> >
> > Why is this needed? It's not mentionned in your commit log.
>
> The original implementation has it after reading the EDID, but I'm not
> sure if we need the explicit reset in this case.
>
> I was going to submit a new revision switching the order, as Dmitry
> suggested, or should we simply drop it?

If the EDID is not available, it needs to be reset.

>
> Thanks,
> Cristian
>
> >
> >>              // TODO: also handle CEC and scramber, HDMI sink disconnected.
> >>              drm_connector_hdmi_audio_plugged_notify(connector, false);
> >> +            return;
> >>      }
> >>
> >>      if (connector->hdmi.funcs->read_edid)
> >
> > Maxime
>


-- 
With best wishes
Dmitry
