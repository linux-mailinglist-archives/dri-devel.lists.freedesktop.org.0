Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C41739E01
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 12:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D8710E50B;
	Thu, 22 Jun 2023 10:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DA610E52D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 10:05:07 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f957a45b10so2679116e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687428304; x=1690020304;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jBO6o9D+DcMpniziEorxfJ2cHJ5z8r1Lg2ForQPrnOM=;
 b=ttrEBGs5dq6sP2JLrM396Vny+wGi75r2tazvT97qRA149UNYU+J58XA+tnaVqU+rO9
 pLm+MutKVBx78jketAlL+TpkwWv/L0ZZdc4OpmeNXJN25hLcbZUr7xomoTLheAwJga3b
 7692bupps7udmyz/gXr6x0toV6AMejcPokl88XjbOGG7Svjllpd2JCshPJeuYgEuIRc4
 B4TebXVlDjCBYldVKjCAu5vw85aHFOcKM7+sUf7LnSeRERsPSLRDIrnXoM+MemtKUnsp
 2Vi16UFUIIItAlCDe42F8/gfl/CNHagXOWKspjcPJjqk17HKlHYp7Tcdlup86hStb/dY
 15EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687428304; x=1690020304;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBO6o9D+DcMpniziEorxfJ2cHJ5z8r1Lg2ForQPrnOM=;
 b=TlsgQ/A5p7pjr6zBWjQBDmpfj1licfS7XuIerP7th0BEclM/TI/qhr8VP6IYY6kM+9
 IAWi6GkIsg+u1fgiJrS8+Qo6lWnS7YU33t1TRwVg3cAezqb+Y5FRXRkTncCNoIg6+huZ
 uivhQnamR+ZwQVBjGzxD3+R4udJrlWGCDh0fl/joaK0et2cZmiqgUXr+PYyHf7n25OV4
 M9of7uJ4C0P9CF93CCOUs+ZkHV9PZ/IDtBq1D/PZyXLTn2SGhMdmgXhYvvWLsh3RxKqh
 BwINVD6gxWPXinX9LvYIx50VMgy03azJ7so4esXPb/ziTukZepmYX+qttFQ79O+2EIxK
 KB6A==
X-Gm-Message-State: AC+VfDylQg7KmFopUduuYPEuv8c6pqPoAAI0rAr66atYdtxOhjoS74N5
 Gwh+HKTJrGaTCTMlXX8dkkMCsw==
X-Google-Smtp-Source: ACHHUZ5bGJe/bMaN8OD0rhofY4WigMcHHdO0Z+7SP4gipUI8R74sFBWZ83RHOD7qkM86tfBUxk+pgQ==
X-Received: by 2002:a19:7b0e:0:b0:4f4:d41b:f416 with SMTP id
 w14-20020a197b0e000000b004f4d41bf416mr9852674lfc.4.1687428303609; 
 Thu, 22 Jun 2023 03:05:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f692:a800:4794:385?
 ([2a01:e0a:982:cbb0:f692:a800:4794:385])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a05600c205900b003f9b1131a90sm7273138wmg.23.2023.06.22.03.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 03:05:03 -0700 (PDT)
Message-ID: <41f05dd1-56ee-b6f9-dcd7-f6b6e8d0f08f@linaro.org>
Date: Thu, 22 Jun 2023 12:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 ville.syrjala@linux.intel.com, narmstrong@baylibre.com,
 andrzej.hajda@intel.com, rfoss@kernel.org
References: <20230601123153.196867-1-adrian.larumbe@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
Subject: Re: [PATCH] drm: bridge: dw_hdmi: fix connector access for scdc
In-Reply-To: <20230601123153.196867-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi !

On 01/06/2023 14:31, Adrián Larumbe wrote:
> Commit 5d844091f237 ("drm/scdc-helper: Pimp SCDC debugs") changed the scdc
> interface to pick up an i2c adapter from a connector instead. However, in
> the case of dw-hdmi, the wrong connector was being used to pass i2c adapter
> information, since dw-hdmi's embedded connector structure is only populated
> when the bridge attachment callback explicitly asks for it.
> 
> drm-meson is handling connector creation, so this won't happen, leading to
> a NULL pointer dereference.
> 
> Fix it by having scdc functions access dw-hdmi's current connector pointer
> instead, which is assigned during the bridge enablement stage.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: 5d844091f237 ("drm/scdc-helper: Pimp SCDC debugs")

Fixes should go first.

I missed again this change because you again used my old baylibre address,
but git-send-email should not use it anymore since a .mailmap entry exists
upstream since september 2022.

Anyway, please use get_maintainers on the current working tree or use b4 to
get the most recent maintainers, reviewers & list emails.

> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 0accfb51509c..69c0e80b8525 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1412,9 +1412,9 @@ void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi,
>   	/* Control for TMDS Bit Period/TMDS Clock-Period Ratio */
>   	if (dw_hdmi_support_scdc(hdmi, display)) {
>   		if (mtmdsclock > HDMI14_MAX_TMDSCLK)
> -			drm_scdc_set_high_tmds_clock_ratio(&hdmi->connector, 1);
> +			drm_scdc_set_high_tmds_clock_ratio(hdmi->curr_conn, 1);
>   		else
> -			drm_scdc_set_high_tmds_clock_ratio(&hdmi->connector, 0);
> +			drm_scdc_set_high_tmds_clock_ratio(hdmi->curr_conn, 0);
>   	}
>   }
>   EXPORT_SYMBOL_GPL(dw_hdmi_set_high_tmds_clock_ratio);
> @@ -2102,7 +2102,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>   				min_t(u8, bytes, SCDC_MIN_SOURCE_VERSION));
>   
>   			/* Enabled Scrambling in the Sink */
> -			drm_scdc_set_scrambling(&hdmi->connector, 1);
> +			drm_scdc_set_scrambling(hdmi->curr_conn, 1);
>   
>   			/*
>   			 * To activate the scrambler feature, you must ensure
> @@ -2118,7 +2118,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>   			hdmi_writeb(hdmi, 0, HDMI_FC_SCRAMBLER_CTRL);
>   			hdmi_writeb(hdmi, (u8)~HDMI_MC_SWRSTZ_TMDSSWRST_REQ,
>   				    HDMI_MC_SWRSTZ);
> -			drm_scdc_set_scrambling(&hdmi->connector, 0);
> +			drm_scdc_set_scrambling(hdmi->curr_conn, 0);
>   		}
>   	}
>   
> @@ -3546,6 +3546,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>   	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
>   			 | DRM_BRIDGE_OP_HPD;
>   	hdmi->bridge.interlace_allowed = true;
> +	hdmi->bridge.ddc = hdmi->ddc;

I missed this one on my change...

>   #ifdef CONFIG_OF
>   	hdmi->bridge.of_node = pdev->dev.of_node;
>   #endif

I'll add:
Reported-by: Lukas F. Hartmann <lukas@mntre.com>

while applying and:

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
