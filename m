Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722B9576FB1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 17:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63E5916CE;
	Sat, 16 Jul 2022 15:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292BF915E7
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 15:19:13 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-fe023ab520so12803560fac.10
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 08:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGpMze8Cu0x5aw2jz/djjciZugDe/TnizDWYWXMdwrw=;
 b=hvh+ZXn27ZYbuIcHm+5baX0viLyxD9zAwNRcRcHRZhgmbBWaMgcnxPOR2Sc4IMCibZ
 C0ha3b32m5PMps1kCfPEoAI6+v6U+iEduO3Mc7NBcfwoUbtpfPtHETxcqKAyGxUd7Yif
 koRm+tpW/YDraYTfGXw2wyInOYdTKqQkLsXnJ5VEBDC6rTHwV/B7nCMhowFnzOHilHGM
 X0T++/P76k7eGh6OJxi4npjOiqHiF5Cjd6wNxSsaLzFRPVgFXIebxEi8zho7C0jZGV6n
 H6Av2TtX5t/FqmJXNKb/2GreIHtzbkD77k9YCusY7owoX9607IgUnBksp1Bbqr0q8IZ2
 4COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGpMze8Cu0x5aw2jz/djjciZugDe/TnizDWYWXMdwrw=;
 b=VifRwKQ+80azK6ZP3ApZgDAGf4UA+jTB7+sEsKwp0L1d9UdSV7HPLgObl+Ysu0aH9v
 nhe48B9lENKo1KXCKg9/fUN8rkkGuswP1YSpKKiVROYPBqvt4FGLNjI1GNsd3YkgC2a0
 vd4z2jc7K/76ul1VHaHULP2JeKWAToXQhDSy6GzKtlHAt0aUDIiCDKzFKbc0S/nBIaqZ
 aR2mDcHRaAIY9rD1myH2wsniWpvQq3DURgPBA4l//XahSeXJdu17qAUihzr0h2crUXQz
 xg637gN539ih/0/5fqo4HjGz8ZvQSJbBh0IEZiNCjQp2q4VCkFlu/JgrdldI3TeGKv6V
 ynKg==
X-Gm-Message-State: AJIora/EyDyhdo69XdfnOISzkTvRZQd8Jc9S+kRrWPPrAT1v/ROhpitN
 lF4NPgaE2cAIgeXK2JD+Bcx/Qg==
X-Google-Smtp-Source: AGRyM1vGN296YAzt/BeCYxhczcXUWMLFb+GMEusEzYT6LCFpTZKDhdqpfPXaxfKZZTkGU2MgUWYtzw==
X-Received: by 2002:a05:6808:10d4:b0:339:f690:1ac4 with SMTP id
 s20-20020a05680810d400b00339f6901ac4mr9650262ois.210.1657984752392; 
 Sat, 16 Jul 2022 08:19:12 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 08:19:11 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH v2 00/11] dt-bindings: display/msm: rework MDSS
 and DPU bindings
Date: Sat, 16 Jul 2022 10:18:55 -0500
Message-Id: <165798474063.1679948.9453224348232992822.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 12:00:29 +0300, Dmitry Baryshkov wrote:
> Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
> devices). Cleanup DPU schema files, so that they do not contain schema
> for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
> afterwards.
> 
> Changes since v1:
>  - Renamed DPU device nodes from mdp@ to display-controller@
>  - Described removal of mistakenly mentioned "lut" clock
>  - Switched mdss.yaml to use $ref instead of fixing compatible strings
>  - Dropped mdp-opp-table description (renamed by Krzysztof in his
>    patchset)
>  - Reworked DPU's ports definitions. Dropped description of individual
>    ports, left only /ports $ref and description in dpu-common.yaml.
> 
> [...]

Applied, thanks!

[01/11] arm64: dts: qcom: sdm845: rename DPU device node
        commit: 1d52eb6cc827d0f166c728a7577609de75b6b8b1
[02/11] arm64: dts: qcom: sc7180: rename DPU device node
        commit: 37e3558b79392ab864fe887b4593c5f737e063a5
[03/11] arm64: dts: qcom: sm8250: rename DPU device node
        commit: ce5cf986cdab1973df0042ac5b743d5df008c338

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
