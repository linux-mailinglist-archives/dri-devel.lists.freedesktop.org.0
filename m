Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4D15AC4DB
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 16:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E447810E0BD;
	Sun,  4 Sep 2022 14:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9BA10E0BD
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Sep 2022 14:56:41 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z29so9848532lfb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Sep 2022 07:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=fC3lh2YMOyHrManyFcmY7+Wx+z/ZpVeqWfU4+YdqBv4=;
 b=jWJ6WZaSrU9FfU2y0hsSVm6LyRs2Cu3lKLTVy/RIID88varEs+jkY7d1VruP3yuqf2
 mAjDDF9c1emAj8wh4Hyp2XPYob1i8GENIbDMHmBUriGC36YJARdCRPS2cE54QgvHWznw
 7mVrjAuI624Hp7e0UVmNr0mL9qJn4nh9sWzYQt3L7xdBxIrnipBwRYnPG8/RwEwyz6Xn
 1QH/Kv8YTC29XXLg6OmzqXsCbT1mNRAPKxYBrnaAEKHCIgdgBnT+aXqsbCZi0VC0x/cA
 mU8MXo4zaMwPyA4tYjptrWZoG66L8WfMu+HaYxEwAFKSSBPvKsti/VtABlRtYWul9Orn
 HeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fC3lh2YMOyHrManyFcmY7+Wx+z/ZpVeqWfU4+YdqBv4=;
 b=aI+5ZyH4rgygVSHkyZPyJNexoBxzPD4Hpqpl5FE8dUc/noiFRxSsvihFy/VSSxwgC2
 3daRsu/P4lA98/PHkrh+h7btWQkBho47mz/VBjmQ1DdRYyZugdUnWDTERZujlLwQxARy
 4yhZLQ2r+v5G0PIKyWw7NpcMdCXTuMiHPcySzRV8lmbP1vT7qSWhbLrtJUnGfvqPGurI
 ZhjWNSHrWNHvo0HpIamjFTGLI1oZdceAGdXidFJflbC1f/A8wKJM+r2W5Fc73ibDH2Ly
 WPWZgoa7uyIyO/zoMUnBJx7C0CH8jhW0wcXOwt6vswyfNt3jjVATPCvMisrPxqv8EyRO
 JUxw==
X-Gm-Message-State: ACgBeo3bGTb+oFQ2WBoRao3JMmM6DOvygc4uVCVgTlQ5oREMaghyN2sX
 xDYRgrw7h4dny0judw84IPs=
X-Google-Smtp-Source: AA6agR61c8An6mbrNZfhfHKEubyxAYbejF29KvnHLmiAlYpPv9/3q/F9sPfNQEADHmqOVrKU4YEokg==
X-Received: by 2002:a05:6512:4002:b0:494:5dc9:b2fe with SMTP id
 br2-20020a056512400200b004945dc9b2femr11247598lfb.687.1662303399672; 
 Sun, 04 Sep 2022 07:56:39 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.119.13])
 by smtp.googlemail.com with ESMTPSA id
 m13-20020ac2428d000000b00492eeabd6f8sm933897lfh.52.2022.09.04.07.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 07:56:39 -0700 (PDT)
Message-ID: <7294f049-f58f-6ca8-6315-ad062d775bcf@gmail.com>
Date: Sun, 4 Sep 2022 17:56:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v17 02/10] video/hdmi: Add audio_infoframe packing for DP
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
 <20220901044149.16782-3-rex-bc.chen@mediatek.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220901044149.16782-3-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

01.09.2022 07:41, Bo-Chen Chen пишет:
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 9e3aff7e68bb..6c0871164771 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1536,6 +1536,8 @@ enum drm_dp_phy {
>  #define DP_SDP_VSC_EXT_CEA		0x21 /* DP 1.4 */
>  /* 0x80+ CEA-861 infoframe types */
>  
> +#define DP_SDP_AUDIO_INFOFRAME_HB2	0x1b

Is there any good reason why this is not grouped with the rest of the
DP_SDP_* defines above?
