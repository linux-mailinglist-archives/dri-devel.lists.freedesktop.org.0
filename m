Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D19565AE6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF50E10E6D3;
	Mon,  4 Jul 2022 16:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DE810E06D
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 03:57:11 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 y10-20020a9d634a000000b006167f7ce0c5so5137726otk.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 20:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tpGm935hK0zCvMi4UXdykwmGSiEUWWhJJx+dvD/hlhg=;
 b=lUCdH+9ROdX9eVFLGg1Hdi6x+9x72f0OOvPQsObuITi0djdkE2c6K1DKSbp946a8CZ
 Xayok03dMTvZclRhWQY2DNJLPHBg0mahJ1xcWjCdThyq9kNY5N4Dz6+jtd+GSgbu93ht
 7d6P/WLkMmrr6glTMycemIDhpd9oUHuNL89gVukn1jKhx3U0DFSUtUr4urWEGZrZQjQx
 BJ7FQN0R8RpB8ZC/vLYpCTw5LBoRydWksNS6E2rx3IqUa3Ftxlg40Vbs0oWxsXg3+nf2
 RHPK3NuS3RryYfNqvhUUVVfMT4HovAqfSPG/uz2tw/O6+UeIEKVnbBaCnAv5tHiGq5BS
 tBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tpGm935hK0zCvMi4UXdykwmGSiEUWWhJJx+dvD/hlhg=;
 b=ngi23h2SrqKAYLPzOU7LHLvH3ohO4Xpkwb6Nw+NB963L2BZbz0txYBDctYPk5sCmJO
 LvMpLJlEDkbh4o3nZvZlzgOf5A3PHMw1u9MSlegi637WXm6vDfj4nAvlciuZZe++qaYZ
 3XjMFBMHqFdVOUBOIbB87D2Y3G+L7dEynH7lqa6XJp8jlJeVB9Z6laoamRoUwsTjfh3i
 sbvNRo0rSoVPBTL3oApRwxr2k3gf5OR0ceiHb3U6yUfJty8e36ynMW+TxNZlNYh8AmJE
 lkGfy82+Um6xgMscNTsQOqqKGR4s2nysNUU4c3bcG7toWHK1Fid24tsQugudR0OJutWf
 BRxQ==
X-Gm-Message-State: AJIora+QImoLgCG6Iqh8yQopJdkVrBzMC9kAVaWkcx2YEhc0aLjg/5HP
 4DM28DXi2PriBg9vNC41oLaikA==
X-Google-Smtp-Source: AGRyM1tOheTx5aJCMD+ChKsvJOOxDNyWY9gwFq86CGt6bAUBqmoOPFrAkxKmRRyaoEA6c+/0AWqGOg==
X-Received: by 2002:a05:6830:6086:b0:614:d753:36e6 with SMTP id
 by6-20020a056830608600b00614d75336e6mr9852151otb.121.1656820630315; 
 Sat, 02 Jul 2022 20:57:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 20:57:09 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Subject: Re: (subset) [PATCH v3 00/14] drm/msm/hdmi: YAML-ify schema and
 cleanup some platform properties
Date: Sat,  2 Jul 2022 22:56:06 -0500
Message-Id: <165682055971.445910.10360989519902279271.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
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

On Thu, 9 Jun 2022 15:23:36 +0300, Dmitry Baryshkov wrote:
> As agreed with David, this is a continuation of his work started at [1].
> 
> Changes since v2:
> - Deprecated usage of phy-names for HDMI node, added two patches to
>   remove this property from DT files,
> - Fixed the uninitialized variable access in hpd_gpio code.
> 
> [...]

Applied, thanks!

[04/14] ARM: dts: qcom: apq8064-ifc6410: drop hdmi-mux-supply
        commit: 6ac2799c3096dc2fe6d65026efa8a6cf212976bd
[13/14] ARM: dts: qcom: apq8064: drop phy-names from HDMI device node
        commit: fe5651cc8e33b5fcdc351e36cd0cd4bff2f6192f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
