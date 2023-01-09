Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE038663B0B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7B010E564;
	Tue, 10 Jan 2023 08:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28F710E0D6;
 Mon,  9 Jan 2023 23:16:22 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bu8so15527388lfb.4;
 Mon, 09 Jan 2023 15:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUSIRNZZE79nkyMU9G9AqBIuhvo2pozCegvf/Srh544=;
 b=e5vEgs1AJgdX8KOL3CKz7nrWRVPue1VdOQbOGTsXxqs0J1Ygz1ssgdEMVmvs/YirWX
 LiwCOS72zz28SQ80nm3FhaRsPrW9Yd5eb53o+UvnMnlmxNknc7I3IV523jLxA7OWbGxa
 5M/T3fQP1Ms0UatoLVeCNBZW7a2C7C6BorIB+3xcb9lF/AMG4Lb5ZFWBRVm0CXtWeijb
 b/nEic1A/Smb3ZMm5DUyYMpdMhAaY1wVGn0ZDqkyt0ibU12xoz7ESSapK8jCqfo+uaBL
 kz+O7R4SHFgOmPjZJvU+XbEwNuSeyHQfR9kx8kx1JVYSfWFQbxYy6D90J1PIKz7lPoJJ
 fwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oUSIRNZZE79nkyMU9G9AqBIuhvo2pozCegvf/Srh544=;
 b=0iJ3LQteb7i06y7xTQVtHdrl4MydnxQSlPKA5qVooDOLdjdXwPvucxpUWgrxq8iBpx
 apc3kmxO0ut2fp7acDR4ScKvn1xJbeLPq0UgJakVhJ9Syvq/mu89DrqfokaMrfHumnFw
 o+AhdcNoKqFo0jD9iMtofmK7gvoHLADHG16ZePy6u7kBQxsuOTjmPV/TmJsQdH5cwR4/
 vBuxOQNP7/XNiExylnj4wEaXFnALNAUy/em3dDn8jniD9dmsucWwckNBsnAC8XDCzhmZ
 h4ioc1+pMWtN51M+tELI0OL+D/u0zaM/iMgIgtNWmulFjIdRpWFz949jnP2go9pBdzjP
 CNow==
X-Gm-Message-State: AFqh2kqlfwempPwo+EAEzl7YFYnsY4PJ/ZdIECzeyW5JE1Tc8RR7PAvu
 GJC/duSvbL7y9sAsoaerrgU=
X-Google-Smtp-Source: AMrXdXtYdkRxLWFDDMg2agf6WmqCxIDsX34LBmbp8EzWMeALY//PoXn597+tUcIDHgQlLj4GX221iQ==
X-Received: by 2002:a05:6512:694:b0:4cb:436b:a70f with SMTP id
 t20-20020a056512069400b004cb436ba70fmr7100128lfe.64.1673306182070; 
 Mon, 09 Jan 2023 15:16:22 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 g12-20020a0565123b8c00b004aa543f3748sm1822460lfv.130.2023.01.09.15.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:21 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20221221231943.1961117-1-marijn.suijten@somainline.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 0/8] drm/msm: DSC Electric Boogaloo for sm8[12]50
Message-Id: <167330408773.609993.1753222329751720759.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:50 +0000
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 22 Dec 2022 00:19:35 +0100, Marijn Suijten wrote:
> This preliminary Display Stream Compression support package for
> (initially tested on) sm8[12]50 is based on comparing DSC behaviour
> between downstream and mainline.  Some new callbacks are added (for
> binding blocks on active CTLs), logic bugs are corrected, zeroed struct
> members are now assigned proper values, and RM allocation and hw block
> retrieval now hand out (or not) DSC blocks without causing null-pointer
> dereferences.
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: Wire up DSC mask for active CTL configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c2d2c62da1fc
[2/8] drm/msm/dsi: Use DSC slice(s) packet size to compute word count
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bbd1bccdcf4e
[3/8] drm/msm/dsi: Flip greater-than check for slice_count and slice_per_intf
      https://gitlab.freedesktop.org/lumag/msm/-/commit/85b5a40991dd
[5/8] drm/msm/dpu: Reject topologies for which no DSC blocks are available
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f52b965c9434
[6/8] drm/msm/dpu: Remove num_enc from topology struct in favour of num_dsc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9ce765395f41
[7/8] drm/msm/dpu: Implement DSC binding to PP block for CTL V1
      https://gitlab.freedesktop.org/lumag/msm/-/commit/086116ae1410
[8/8] drm/msm/dpu: Add DSC configuration for SM8150 and SM8250
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8cc4c9de15f4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
