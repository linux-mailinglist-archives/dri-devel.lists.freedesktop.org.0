Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530CA716724
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 17:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682E410E3C6;
	Tue, 30 May 2023 15:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D9110E3C6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 15:34:52 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f3b9755961so5111724e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685460891; x=1688052891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i2URTcYLzfS3uayG6hfWA3AHqGO0fmjAhKx1B1Sb2rM=;
 b=mWVVzeJOqvdZKotjn24LlOTsbVHuks3mjQrNCBTgVMi6WHDE+eBCxalJiaLICMS3WO
 sZ7dw3d0s6b7D8JxZnJLTSC7RsSFo149WVQXN6zHPAmWxqnyHFX1WVy0p9httXIJyHrb
 vtj+4z5S4m3vES9aWTzOcrUQdTmRK4Nn2MovEafL9mJ9gtou5LjtN4XeDWyA1O+P86xR
 5ug8pdlnpq5mggZ2ME2n3og6rrJFuXI1iZqry0NUMkn99l4IBterbAINmOmjVlAevt9B
 HpS5VJ7z86yvYxTW6s1lchneiwb6q2cjFQTzvPTJrdr2jKd05lSQ8YKP/0QyMpWWjrm1
 1yRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685460891; x=1688052891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i2URTcYLzfS3uayG6hfWA3AHqGO0fmjAhKx1B1Sb2rM=;
 b=i76ilWxDEKV2CO5Jh8ZXvHCp33R7cB6z/kHRYy600xhZRfUp/DEDejxviOzOasmIqA
 VIxnp6qg9ZGulPer89aSnuyGCdadz6BgRwyOln2ajvL1Pg20+BZA1YWb9MR3wIjSxw4f
 hDg9SMxwdZ2z1oZtoyaBdMCxH4FSp+rxSjDzXy5+kqt+dqyJc2iHfhYO0wSq71HFvigz
 nPX8GkFuiB46QYRDYUkRk630SL8tQFowWxo0jUe1sY3Em6+PVFDdDqSszC7WdMbRG+N2
 tPUEtBWVybmM667PKflMVhjd/iDd7GHVXKB9Yendg5V6w89+V0vE9+2QQr6XbFfeqSxO
 o+BQ==
X-Gm-Message-State: AC+VfDxsxiN/mLGPK5+BlYEtbtwWtQxefbImeHqnD87rohppq2Zcyixe
 X5uG1Eup96Gh7GYFo3Yf1+wjlg==
X-Google-Smtp-Source: ACHHUZ4FyrPbuO3w8Yz55IQ8tPNl8p1FQbjxB/VnRrEwPytlMXkKP4diVJeC1A4YfCKLd8PG92PMzQ==
X-Received: by 2002:a05:6512:150:b0:4ed:b842:3a99 with SMTP id
 m16-20020a056512015000b004edb8423a99mr1137818lfo.59.1685460890667; 
 Tue, 30 May 2023 08:34:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 s2-20020aa7cb02000000b005105f002fd1sm4554734edt.66.2023.05.30.08.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 08:34:50 -0700 (PDT)
Message-ID: <10457cab-f9b0-c38b-9f11-36853b71c7e8@linaro.org>
Date: Tue, 30 May 2023 17:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/9] dt-bindings: HID: i2c-hid: Add "panel" property to
 i2c-hid backed panels
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230523193017.4109557-1-dianders@chromium.org>
 <20230523122802.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230523122802.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/05/2023 21:27, Douglas Anderson wrote:
> As talked about in the patch ("drm/panel: Add a way for other devices
> to follow panel state"), touchscreens that are connected to panels are
> generally expected to be power sequenced together with the panel
> they're attached to. Today, nothing provides information allowing you
> to find out that a touchscreen is connected to a panel. Let's add a
> phandle for this.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  Documentation/devicetree/bindings/input/elan,ekth6915.yaml  | 6 ++++++
>  Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 6 ++++++
>  Documentation/devicetree/bindings/input/hid-over-i2c.yaml   | 6 ++++++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> index 05e6f2df604c..d55b03bd3ec4 100644
> --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> @@ -24,6 +24,12 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  panel:
> +    description: If this is a touchscreen, the panel it's connected to. This

Hm, can there be different setup? Touchscreen without panel? What would
it be then?

Why only these touchscreens? This looks generic, so maybe in
touchscreen.yaml?

Best regards,
Krzysztof

