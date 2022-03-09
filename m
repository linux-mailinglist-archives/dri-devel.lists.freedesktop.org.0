Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF46C4D323E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 16:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A98C10E685;
	Wed,  9 Mar 2022 15:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2AC10E685
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 15:56:17 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dr20so6001108ejc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 07:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l6rzSBg+hycjyAg3vNgFOkzB2r7Wku4uLvqN81LLhjM=;
 b=oAhEDWHOR+wZdZZD6U5/mkxMVidolVS6sz1LQJ3eelAui4Co0GyuNOPxYNkA+mrbNi
 4eBicluFjI+EU0X1bYrUfywV5/WayNK9POkQeKQnRjA202XeqSF8jw2yYZqXmbKj6sEJ
 38dJhL/a1cmVFwkEbTy06O8qVbW7kuymRt9oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l6rzSBg+hycjyAg3vNgFOkzB2r7Wku4uLvqN81LLhjM=;
 b=m0MKxImuvbG3lcrBPkKFSlP1uidYLyKE/+u9ibvNV8H94OG8ubgNV9ndhPqXuFSxn4
 IC/YXpl9kcCnvzArr8Mxu7vCRARTpv2ZYTEsCAuujdupXh+GHCmD6lCZnfGl1FN2BVAH
 8QilLhkfiraWczDh0GSWZim9ASdzQqjMiKBC27UtC7SkxdZhn3H6OxOihh5e1SYS5jmW
 gmK4Sx2sXtCZjuJ29gvH7nfA4hqnjd5js+1889ckVi1Ao+DCb8OU8JVeSorr38LF/vUM
 ZI7/VFoAkzBegwjc93D4sVPo1vcLbsiyqSEvTCaMCxjuQ7NHfDa1i6Gm8B1iN+z3AHbW
 Qn1Q==
X-Gm-Message-State: AOAM532CVdC/TlurY0VZtjvmB/UL50yku2yvb0xohF8RssGb+HHr3eET
 +G87+WL4xq47NG2qtm7eKyfbIE2Nu9gPAo7X
X-Google-Smtp-Source: ABdhPJyQeRmMVYy+w+fkhEtvu94jRCrC8vk3Nhetfkx+aQytlgVkwLbPA4fho2zFX1gxpKq7vYlW3Q==
X-Received: by 2002:a17:907:7fa2:b0:6d8:2397:42 with SMTP id
 qk34-20020a1709077fa200b006d823970042mr400753ejc.218.1646841375323; 
 Wed, 09 Mar 2022 07:56:15 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 w22-20020a05640234d600b004165de83109sm985602edc.48.2022.03.09.07.56.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 07:56:14 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id h15so3739183wrc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 07:56:14 -0800 (PST)
X-Received: by 2002:a5d:5257:0:b0:1f0:1822:69ad with SMTP id
 k23-20020a5d5257000000b001f0182269admr229452wrc.342.1646841373661; Wed, 09
 Mar 2022 07:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
In-Reply-To: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Mar 2022 07:56:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V4oicW6ZVVyE3sNYxAdaEiGdjAZC77o-wjn3=fmfL6eg@mail.gmail.com>
Message-ID: <CAD=FV=V4oicW6ZVVyE3sNYxAdaEiGdjAZC77o-wjn3=fmfL6eg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: Add MAINTAINERS entry for DRM drivers for
 bridge chip bindings
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 8, 2022 at 11:07 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> The bindings for bridge chips should also get the same maintainers
> entry so the right people get notified about bindings changes.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

There didn't seem to be a reason to wait, so I pushed all 3 to
drm-misc-next w/ collected tags

46db48f25ed1 drm/bridge: Add myself as a reviewer for the Parade
PS8640 bridge chip
59c217b3dde5 drm/bridge: Add myself as a reviewer for the TI SN65DSI86
bridge chip
73a46da4fa7c drm/bridge: Add MAINTAINERS entry for DRM drivers for
bridge chip bindings

-Doug
