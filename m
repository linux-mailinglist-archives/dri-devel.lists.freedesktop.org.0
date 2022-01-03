Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3AB483093
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 12:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD6310E130;
	Mon,  3 Jan 2022 11:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFA210E130
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 11:33:02 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so18121705wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 03:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N0OzaQNNJIq+kyud4Uc895pmB53bHPkNVDy1dZpq2BY=;
 b=S5YV6oLGkx9HLLn70EWetLIwKIpMhDDka9K6iTjBuiDp8tiI06mPD4nLh1AV6Cksig
 CyMwr/DzsD22E8GBRkQV9ACd9bjHjW0A+i2EHupKlg0C67AO+Bhhh+H7Ggq+qAeBKrOz
 Bz0lqvAaylJ2VItFZhZhiZUlpmNWXf5DePp89VDsNGOSYIELJLFDWx91LPCDOQZHeyVh
 1oqWxUB6gj009b8u4h49jD9C4+zGrnhK1uIQw0N7GoWElVhIH1XIK7m/6Vf5cKcpW0O+
 zT1+1zMDjfT2lNb/oks7qViaeU+gSNPdc44J/SEjm2Sxz3uku+bZMXtsLbN1jBI1k4sq
 dBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=N0OzaQNNJIq+kyud4Uc895pmB53bHPkNVDy1dZpq2BY=;
 b=q0wGxAOOUHJqtohfGupYqdM18gR5FmqObD+gRC1Ew59o1AcsxpW/IgNpZY/c2KicMm
 tWR5JoZqfOjk5ooc1C+0c4A0G1kmSLkwhgCrvQzltClxzmdODHecUYjkgadHXq0ga/KU
 pwJIHELCT+Q0FZC3hfFVQk2owKih7qTzVhPz6VacHvXoEy+vPP9TY76otg/X8ZdVCK6S
 qJD/tZrc2MC1hM86mymESIakltjUzMS7VNxkIixq+yX2Mv+cPWtRDF+xxijMYMq0U/cY
 UFAz+oEtDNBOInWIFpfXr7xAUACJDDONICHF/H5StpDtg5w/PsqKV0YBFzXIHr81u2cr
 v2PA==
X-Gm-Message-State: AOAM531uDLx90dYFSgSxFqy7hKLayncacT7GSDV6Ygs7iQhUlXkcm+rl
 8h3eL38svdSCiXapnoVpO+wRGVRIs8ehOg==
X-Google-Smtp-Source: ABdhPJxaKxKULNBrd2g60r7nvvEmGuq97mfXP3cU7zsuBf7u0Tovr+OYsByszfTTH5I8CBn4x3gaXw==
X-Received: by 2002:a05:600c:19ce:: with SMTP id
 u14mr34813970wmq.49.1641209580705; 
 Mon, 03 Jan 2022 03:33:00 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id p18sm47514860wmq.0.2022.01.03.03.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 03:33:00 -0800 (PST)
Subject: Re: [PATCH 1/3] dt-bindings: display: meson-dw-hdmi: add missing
 sound-name-prefix property
To: Alexander Stein <alexander.stein@mailbox.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20211223122434.39378-1-alexander.stein@mailbox.org>
 <20211223122434.39378-2-alexander.stein@mailbox.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <c4d5d774-6d9a-410d-b651-e452894e99eb@baylibre.com>
Date: Mon, 3 Jan 2022 12:32:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211223122434.39378-2-alexander.stein@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/12/2021 13:24, Alexander Stein wrote:
> This is used in meson-gx and meson-g12. Add the property to the binding.
> This fixes the dtschema warning:
> hdmi-tx@c883a000: 'sound-name-prefix' does not match any of the
> regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
>  .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> index cf5a208f2f10..343598c9f473 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> @@ -10,6 +10,9 @@ title: Amlogic specific extensions to the Synopsys Designware HDMI Controller
>  maintainers:
>    - Neil Armstrong <narmstrong@baylibre.com>
>  
> +allOf:
> +  - $ref: /schemas/sound/name-prefix.yaml#
> +
>  description: |
>    The Amlogic Meson Synopsys Designware Integration is composed of
>    - A Synopsys DesignWare HDMI Controller IP
> @@ -99,6 +102,8 @@ properties:
>    "#sound-dai-cells":
>      const: 0
>  
> +  sound-name-prefix: true
> +
>  required:
>    - compatible
>    - reg
> 

Fixes: 376bf52deef5 ("dt-bindings: display: amlogic, meson-dw-hdmi: convert to yaml")

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
