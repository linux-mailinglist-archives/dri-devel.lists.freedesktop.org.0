Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658C46635A6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420F710E524;
	Mon,  9 Jan 2023 23:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2CC10E513
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:09 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id v25so15576173lfe.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUSIRNZZE79nkyMU9G9AqBIuhvo2pozCegvf/Srh544=;
 b=uJ5zkAXcPizQidJBAs/mQpb6fWttL+vM7ap+xLWfv4mHkzsnUY2SIk3ZL+Ks2/9mZS
 CPiNW2BlpphCd3ikKwzLVN93Tq2CQ5G3BdKWbDeerxtNAY0tJpbXdVfKhYPnl/u4kfqk
 DMhhtpZpwT7ExztXEodx/Hc/WdSZrpkqgq+qoUTsZoyzc4SJai1vZhMw7r2Vrpzm2CpL
 f6aSCnMdeQf81xHBjNUC5fMcRvJWkXTg1x10jUye/qG/z7i3iZ0HnNLQzAdft/2IV9vH
 63k12N6Q4HecofVPXg2mj8CCEIE8TyAAkTAo3JPi85MSU3EdDS/kJIbUc+Pb80YW1fpm
 u0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oUSIRNZZE79nkyMU9G9AqBIuhvo2pozCegvf/Srh544=;
 b=OZ/Q/ErB8QE0UOeatiZJ4lXv4VuC/GY+TBImOeyJaZjIk98Y095wAUzUGT4T6DnbS7
 xH/6+PaRnY/yO2OPflEXndOjblsVryIqQGrd6lJhI+wy1FrYddwacoSF4MuobFMIpSK3
 hr5JxCQyIP6Npwf6KYToiSo9dWhFkQgDaMP56MwZy/EhAi6kXr/bOj3PrPweefL32tqa
 IMMtF/TFk0/Tn7MlyWlOa9qYGnhko0w5f46tIyCQ1LpTs1K+ZWOcmPsECUhQYxlZyVjh
 IvWP21YxnORPvmdSrf0qGn/CagPhN131LEsVRiKBtx+xybnpiBgH6NHNXdioDju4tNuf
 cKYg==
X-Gm-Message-State: AFqh2krSPVZCR9nKO1tAyI/fz+ZTjNu+tmanqJobSohjE9Gmt6zD7zQI
 kmIoHlkJtqOZqFZ2wiKQXEAr7w==
X-Google-Smtp-Source: AMrXdXt5Lb1JdORz9wFKniYzT1NTeV6oyiJCRsJrJzp3Srm/OE2t1T4PW6ihA06QLlT0hzAYtUMKzA==
X-Received: by 2002:a05:6512:368a:b0:4b5:b90a:829d with SMTP id
 d10-20020a056512368a00b004b5b90a829dmr16791324lfs.66.1673307848857; 
 Mon, 09 Jan 2023 15:44:08 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 0/8] drm/msm: DSC Electric Boogaloo for sm8[12]50
Date: Tue, 10 Jan 2023 01:43:53 +0200
Message-Id: <167330408773.609993.1753222329751720759.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221231943.1961117-1-marijn.suijten@somainline.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
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
