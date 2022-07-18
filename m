Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D239578E2B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 01:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F7510F303;
	Mon, 18 Jul 2022 23:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B2410F34A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 23:15:03 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id e28so21916024lfj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 16:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HE1FwD+lN8EId4JRcmxRzN5D4z0DEF/FKKUfYD2j4LU=;
 b=LfYnTGomRy0mIuYpeTaogh+8jet4b64mTTilWC1/+nP98lLhQqbJ6n382kgReMEoDH
 WGDH48In8zPhwAKVCph+TvSagiEd7iIQ5IchM54aMRwuju+MCBZsyb+NsYh3nR8ycBZd
 jNVUiXrJGaViaEJktW6vs8s22PYMG28TenrVv486mYDHgsDeTxeK45VpBGTJQgdw2eKH
 QTMtbGIfxx7g+ibA/ocd9JRwxlw1KngjbM5jQid7xcBS4qpO5hPn/yf/wBejbcd2Yji2
 EP1ak2pOKL1E0/XImoo6eVOzlGbCFwbWhDP0bXJrF7s4mx/UkH8dZuDJh6S08Ov7H4O9
 2x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HE1FwD+lN8EId4JRcmxRzN5D4z0DEF/FKKUfYD2j4LU=;
 b=aEKnsRlYvBWx/fxkiAu84Er5WB36MwWs1HAWvLbtQ+dRQDwuDp4uJJKjtUSc18lZJ6
 uGRyBkNQG8kETNFdPrw2rPtIh03I5SIgho7pNYqlp8ZcC2uKM7pXV+zsfrqCiETJ1Get
 8w+6ZQrr2dl5L0COolG1KGjTEMv4VOwncVxyirh63U9+raq5Xc2OuTVBw6gPLnpUX1us
 R+vEV4f/NmBBNPMTxgJd+QgS5zGNzta0jtIoqXMkb7rbLBZgHjsZvN4idpnV5i4ILA2U
 FK95e+RFtWL6sg96bBKxzQx1a/GUOJA+GPQG26xoXYfqnmKV8u/xg4xSvpBZHviqXLrO
 9rHg==
X-Gm-Message-State: AJIora/2Z7+vZjZrWnUM4VyyUQcy95cEFY70oEk7GuyHqjHDLmbH65l5
 m66dPxeOuTgTZSjgo0NJojmMSg==
X-Google-Smtp-Source: AGRyM1uK4J89ps1im4BvW/EUBiHpmWPvWyOGFjewbSGsnwyFX0y/EZKtfhz97cRYx4yctS6D/Ew9yw==
X-Received: by 2002:a19:dc4d:0:b0:489:63cb:20c7 with SMTP id
 f13-20020a19dc4d000000b0048963cb20c7mr14857343lfj.101.1658186101548; 
 Mon, 18 Jul 2022 16:15:01 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x28-20020ac2489c000000b00488ab8914b5sm2827797lfc.213.2022.07.18.16.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 16:15:01 -0700 (PDT)
Message-ID: <af496488-6761-d1a3-18c4-85bc63e37b9e@linaro.org>
Date: Tue, 19 Jul 2022 02:15:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: add sdm845-google-blueline (Pixel 3)
Content-Language: en-GB
To: Caleb Connolly <caleb@connolly.tech>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Kalle Valo <kvalo@kernel.org>
References: <20220718213051.1475108-1-caleb@connolly.tech>
 <20220718213051.1475108-3-caleb@connolly.tech>
 <d8f24aca-2cdf-413f-2b30-ad41b81be1a5@linaro.org>
 <41a8cd51-f808-4fa2-b9b1-5c04c2aec7c0@connolly.tech>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <41a8cd51-f808-4fa2-b9b1-5c04c2aec7c0@connolly.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/07/2022 01:54, Caleb Connolly wrote:
> 
> 
> On 18/07/2022 23:13, Dmitry Baryshkov wrote:
>> Any idea, what is the issue here? Do you have the datasheet for the panel?
> As Marijn just mentioned on IRC, the driver right now only calls
> drm_dsc_pps_payload_pack() but doesn't actually send it. I haven't
> investigated this myself but I'll look into it.
> 
> Unfortunately no datasheet afaik, they tend to be pretty elusive. The
> things I would do for a phone panel datasheet...

as a side note: I checked the dtbo.img. There are three different 
versions of the panel programming sequences in the included dtb files. 
So you might want to check for the difference with 
linux-mdss-dsi-panel-driver-generator.

-- 
With best wishes
Dmitry
