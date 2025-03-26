Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB48A719CE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 16:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97FE10E6EC;
	Wed, 26 Mar 2025 15:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WnNpDrEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE8410E6EC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 15:08:47 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso4124990f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743001722; x=1743606522; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K6QgeinZ4T2CEETUj1UU3X0d9N2W6dwCixOfG2GPPgo=;
 b=WnNpDrEtXTXpWPnsTMsQUNHmR1u5jNoBwRmVFR6MvjpsHyeBeS7KgIwLjAaEAgmpsO
 HpmCSyM/jX5wkz+qnqSaEO7wjSCzkkwh9LpB91BJ869hDkPhMDD1LSLTitPWn0kFj13h
 q6Qc8GOr1OXRGsKNKrC/SrJROMU84run7SWIhXdRccuDi/YThDZl8BACKZ84CLii8ES8
 oEfmMqI+qFXy8aNy73xLpSktfXKX+Gufgp02i5Mq3TUSr+2DWiInr2nak8qe8JIQsvIg
 heHWL0QKZ1nZPrnn8xCuYjQsW16xHUp72yxTUitrXN1JDD/bMcPx+YFADy9uSq1lc7m4
 agVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743001722; x=1743606522;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K6QgeinZ4T2CEETUj1UU3X0d9N2W6dwCixOfG2GPPgo=;
 b=u2hCG8Ltw6F8SKNsqFaRY0vZtJu2yFvip5AlHzafWVBoE0Jon204XoQlYTaZHQk6JB
 MrKl0G8CEH0F4m+9sIqPQwKsYbnhS62TMW71il4xnb8CHDYttYuXcneLh8Al5x4VuwE+
 8GfJICz+bn5/N/G0g0mnMYRnqA+bZfHUCXcM6UVTVyWeAL12x2WPwKizxW5jvO/Sngh8
 xYDqw4spOfDHecgP8bhdY2QWOjwGvkNfKfU9DW3mfda7hjHWosxZVTSNNxYq/o0gszwV
 I7Rt070TkU3O28tCSN9h2Y8OlEma7aiYRpxMhGCD22DA+9l8ugcOs64kb+O5iC6RTII0
 QGwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeTte+U/2bfAzJqgAT80G4UQQJY0XEKD6VzMdwTFwOuzVcaPNveg9gjVg563cgmtn6Fe8fxnEPp3o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQvv6V5Zs1tRbfWgEbuYuZG6JT2UbbZ/aW3Y4nGCIKvfSjiyDb
 XKWrwKVgWLUFijCgjKS3sUtwwQHhrRKqH/uc5xqkM39PXLF+Oh6bEVemJRzAQwHUQuY5BXs2kNN
 Q/DWqwHzVND3uhDqqlTdrBOhj7amUUA3xmY5MUQ==
X-Gm-Gg: ASbGncvDBqhWdygDGVUSJIY26wtv91Fz9sN/PM2ndGhlUBPjzEclVe/9Pww8tTszVRt
 tL51mcvgfpDQ1nQJsa9JXi4vqPOhvnxwok+KrK5SONzvzSZ4cG3rONVpL1olTXSEAi7dxD5/B4l
 TtW7AXH0eHJoBPa7F4WaOrEQjoVg98qccTGXBOzqeeEzYKemtw6lCDZStiFek=
X-Google-Smtp-Source: AGHT+IFRX9Dag9WPYVZCjInr7s5+x9rD882OTti+EwgHv/CLcHvYu2T59wrDheZNF3bNaOL19EhKT3JrZA0RrFDharQ=
X-Received: by 2002:a05:6000:2b0c:b0:391:4bfd:6d5 with SMTP id
 ffacd0b85a97d-3997f9389d0mr12644513f8f.52.1743001721724; Wed, 26 Mar 2025
 08:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
 <2cfdf7f3-56a6-495e-83cf-1921a2e0ef8d@oss.qualcomm.com>
In-Reply-To: <2cfdf7f3-56a6-495e-83cf-1921a2e0ef8d@oss.qualcomm.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 26 Mar 2025 15:08:30 +0000
X-Gm-Features: AQ5f1JrG9jYOKFuYMJGa7mTyKExVbCzem5WJO44l_oFhXBZmwxNQppiXtjv4bCQ
Message-ID: <CACr-zFBFpqgHVRiH37ooeVJ4Jk1UA4AhP5J5L5yV8_CHBTG07g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/dp: fallback to maximum when PWM bit count is
 zero
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 devicetree@vger.kernel.org
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

Hi Dmitry,

On Tue, 25 Mar 2025 at 22:53, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 25/03/2025 21:21, Christopher Obbard wrote:
> > Some eDP devices report DP_EDP_PWMGEN_BIT_COUNT as 0, but still provide
> > valid non-zero MIN and MAX values. This patch reworks the logic to
> > fallback to the max value in such cases, ensuring correct backlight PWM
> > configuration even when the bit count value is not explicitly set.
>
> I don't think this matches the eDP standard. It tells to use MIN if
> BIT_COUNT is less than MIN, if I understand it correctly.

Thanks for your comment; that's a good point.

I need to re-read this section of the spec; but at least on this
hardware I printed the values of the registers and it seems like
MIN and MAX are the same, so I could switch the patch around to use
MIN in the next version.

   drm_edp_backlight_probe_max: pn=0, pn_min=11, pn_max=11, bl_caps=134


diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
b/drivers/gpu/drm/display/drm_dp_helper.c
index 6e519c58c2e84..2be2b00c8a531 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4061,6 +4061,8 @@ drm_edp_backlight_probe_max(struct drm_dp_aux
*aux, struct drm_edp_backlight_inf
                        aux->name, ret);
        }

+       pr_info("%s: pn=%d, pn_min=%d, pn_max=%d, bl_caps=%d\n",
__func__, pn, pn_min, pn_max, bl_caps);
+
        /*
         * Some eDP panels report brightness byte count support, but
the byte count
         * reading is 0 (e.g. Samsung ATNA40YK20) so in these cases use pn_max
