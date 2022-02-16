Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F614B912A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 20:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE3B10E294;
	Wed, 16 Feb 2022 19:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5014F10E294
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 19:27:11 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id hw13so1525188ejc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 11:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RBTCqD8W3d7/1ezQ2LdtCzAwaR6pXiQgPpkFprvW/Nw=;
 b=NyQGHLpcNJ66DePae6L2lXAF+RjeApP9G1Gfv+lxQA/P/rp4h5Tv/Dd68OLW5zUl85
 t2n4nl0x1bpUqIy6o2kASPQD24zOIPzswv+G024rhC/nWtWXv5KgLLsVt7hboPwHsvfM
 sRnwu+n8kjGWUn04zttiFAjNSEcFmNcPt3E/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RBTCqD8W3d7/1ezQ2LdtCzAwaR6pXiQgPpkFprvW/Nw=;
 b=EscfzQAUJopTNGJ2A57XFaJv86NWGFcMMVOrL1ZDaO4tefnSwLdYfDq0tbvmj7pnyh
 Nm67mBACLkPXwPsp+p/sJg30WS28KnVK3QfOnOIMoh78kJ5KJvJIZXEqidDALeZ4SOg+
 rgEBCu51bxe8Qhbf0xPgkR4bAbBe01sIoCohWcmqYL+qmK5k0Gzc8lNxMR2vSx/NksFf
 rHZgJN7VAF4uYc5niws9zUqomOMBEq48G/EUunPtl0HA1tTRGkl1l45+6rlcUks7yuNY
 JF04AIaHivco3+jC4RtD5F1BdErfL+D53Ig7PynmO1JSpNWwoSFh8ELh6JUrBhj8M97d
 0YKQ==
X-Gm-Message-State: AOAM532ocSlkgp8EUP7LoQc9S/5ZVjIoFjqxd3ARaWjilMvvWibD38Tr
 /bbDtmPOrulYpc+YjnpjTA1XxxYnWZSrmJZSbgk=
X-Google-Smtp-Source: ABdhPJwDu/c7XuYJw6RQOJn972WrthY9i58jqZMMR2K2kl894FMgsERO3xpGGH32V0yUgHxh33qujQ==
X-Received: by 2002:a17:906:e0d6:b0:6ce:7107:597b with SMTP id
 gl22-20020a170906e0d600b006ce7107597bmr3487173ejb.465.1645039629442; 
 Wed, 16 Feb 2022 11:27:09 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id qf12sm259335ejc.54.2022.02.16.11.27.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:27:07 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so4523581wml.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 11:27:07 -0800 (PST)
X-Received: by 2002:a7b:c938:0:b0:37b:fdaa:2749 with SMTP id
 h24-20020a7bc938000000b0037bfdaa2749mr2996574wml.88.1645039626622; Wed, 16
 Feb 2022 11:27:06 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1644494255-6632-2-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Feb 2022 11:26:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UZwuYRMNOxX6_W_z1PC-UNqvN=Mdtskn=djPPMRE122w@mail.gmail.com>
Message-ID: <CAD=FV=UZwuYRMNOxX6_W_z1PC-UNqvN=Mdtskn=djPPMRE122w@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: display: simple: Add sharp
 LQ140M1JW46 panel
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 quic_khsieh@quicinc.com, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Add support for sharp LQ140M1JW46 display panel. It is a 14" eDP panel
> with 1920x1080 display resolution.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes in v4:
>   None
>
> Changes in v3:
>   None
>
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
