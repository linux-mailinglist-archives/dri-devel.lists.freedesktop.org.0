Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED067EDF3C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E9810E267;
	Thu, 16 Nov 2023 11:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B574210E267
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:11:13 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5a82f176860so7249397b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 03:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700133073; x=1700737873; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0RGeCL4pbInHPFxgrG6befW6cqWS0yz+u9JSBQ5zil0=;
 b=qChHKKxFIfiFJosnVhpWnnij2AxTFtZ1YLcIya23q2fJFLhyklTXnB2neEKwJ+q5SP
 ip/cQlMypuqqa/Xf1s8FofHawLy0eS6FZR5Zpvt6cd/vLKz+B0fFF84DufbNNkjiqBXk
 cnwi9YoxT/YfN+RsVQwMabFD/TkNWuGWMvGSW1YoQMtLFiTWFYlzw4BwePAJaKzOELkk
 M5yDlPlFz4mP7rseCnGJiopnV33dY4kVbc5K1PFcJ7yD5PvUAxGJWk/YFuYPB+77Ygpa
 z4VE9EjtnfWN+eOLv1WnRtn5RAHdZ/sWH3EaztdykUOc3u2dY+veh/WCNmA6Ex0gC9up
 Gnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700133073; x=1700737873;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0RGeCL4pbInHPFxgrG6befW6cqWS0yz+u9JSBQ5zil0=;
 b=a6wuR8Ku/opslOleP1z5xz0SnOjZVGn8ziMJaK4qRFJup4Fkyx05SA8+Qb97Lxmuc7
 GqCuhxZWH87LZvHBZAU1Fywf3VikPTozzewJKYfvRZC63A4NE7M3VFugeqOsuDvSWa/i
 Ir5VBoQunu4DbBS5JcJFfs1gMh+09Kv1x1wTpZMjetGiwvt6bJ5SOl4Zn2TMTnQItXEj
 q43AqRrQy0RR0E12s9lIVIrZ84cuP46c29BInRD2gJ6iKPXHjHr6vd6S/OEC3YYB2KY9
 dfRCQ/Mdu7Ht0rKQ+Ofd8k40MbmJDMKEH+8iSBMTPLuajzudAz+Tx5uBuuiuxOEsX4nr
 59Pw==
X-Gm-Message-State: AOJu0YyFMm8vTptnJ+C1YR/VnfnSg6yo+NoXkTaFalTGq1DxI7lTVmYn
 N9vz4cbh1iRy+sHLfEJgX1/SVC1zXeg/vAiK3SfSdg==
X-Google-Smtp-Source: AGHT+IFDnrrkc+6Nm8lx8gkkxzo53vg5vCzNzDQ4UR0BiVw1QwFwneAsH1tIZXYXEuKrRXeJmIubqNmURaGHwUUi8SQ=
X-Received: by 2002:a05:690c:368f:b0:5a8:960d:e538 with SMTP id
 fu15-20020a05690c368f00b005a8960de538mr4883776ywb.47.1700133072791; Thu, 16
 Nov 2023 03:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <50006160-f82b-4ec1-91a4-2ebbd7752e1d@linux.dev>
In-Reply-To: <50006160-f82b-4ec1-91a4-2ebbd7752e1d@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Nov 2023 13:11:00 +0200
Message-ID: <CAA8EJpokxcO2qXgZ=+f=J+6EhAS_7KkrNJ_oZgk=RMHfv8riog@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Nov 2023 at 12:29, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2023/11/15 00:30, Dmitry Baryshkov wrote:
> >> @@ -703,14 +704,32 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
> >>                                   enum drm_bridge_attach_flags flags)
> >>   {
> >>          struct it66121_ctx *ctx = bridge_to_it66121(bridge);
> >> +       struct drm_bridge *next_bridge = ctx->next_bridge;
> >> +       struct drm_encoder *encoder = bridge->encoder;
> >>          int ret;
> >>
> >> -       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> >> -               return -EINVAL;
> >> +       if (next_bridge) {
> >> +               if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> >> +                       WARN_ON(1);
> > Why? At least use WARN() instead
>
> If (next_bridge) is true, it says that the driver *already* known that
> it66121 have a next bridges attached. Then it66121 driver should certainly
> attach it, no matter what it is. Either a connector or another display bridge.
> It also says that this is a DT-based system on such a case. CallingWARN_ON(1) here helps to see(print) which DC driver is doing the wired
> things. Ok, I will remove the WARN_ON(1)  on the next version.

That's why I pointed you to WARN(). WARN_ON(1) gives no information to
the user. WARN() allows you to add a message.

-- 
With best wishes
Dmitry
