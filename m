Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181686710AB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C9E10E63A;
	Wed, 18 Jan 2023 02:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A823510E632
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:29 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bk15so22322679ejb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0JiIW4jdJdESp+XWdfOpWNkOvZv4eYC/Zwku6YKYIAo=;
 b=uaVExwDWCIJ0xQwsFvsIky+V+xINrX9hCx2pfSTY5maDB97Q1+SHOgSWIOd9Y85DEu
 qivbNZNWA7oug2IwDwENI40xE5EoTcKsYxycv1UKezFBQCdgcpniTeZkwUt2IaT6elWU
 LE0oTGaq3h1+e8Wkv8/S9kWPkvczwIlN+4M17pv4geo6kMJteYsmveZp7DkvpLd/fajW
 Q2Aqv5CTIToBIV7Oud5LIdOuWFFPf7uHSqacKbyl6plbDDWp1E9S5mP/fB39tAB73kRb
 5oRzR3TaZ2fIhzLyc8mfTuAFNTgRcCho5wfyj0dKTa07PFJHJ9lqu26vmk+lWum80WPm
 3w+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0JiIW4jdJdESp+XWdfOpWNkOvZv4eYC/Zwku6YKYIAo=;
 b=dAAEC9mx+2uQXhSR13662f6IPAP+XhUjFbqC3klfLMqOW1Rl9724nnpNf3Z7Jwnosd
 8e2rXGDXlTjsBamrJrPWNk54Irv/IWuKQfx/CbquLg+PtW/jBtzAMxDXxcmaJqX4qaEI
 eOlTdGsSgJ1BFJTrbRvSvu0SQUfP4zFhyIS86JJqeQZt0yVfQUBry7LI1EgqfdKoOQtD
 /9w9Q52ZCYnBbmK5sCjNt4bVoAR0lMAwb0HDUTdoN6qgkK7a9yq6NVCyljjRYFiPMK22
 8s1mTvwb61AGXgZ8aCtnnqx+JRsqe5AbyhSJIlIVmyq+ZAqrbCLWDBiIoNuzt5fBnXUC
 uT1w==
X-Gm-Message-State: AFqh2krSy+EIp8Pxf5aG9Ds695Bjef2Ohve+vZODHJv+oSK+msW6lshg
 2CCsf7uKT9BOAHmCB4m1YN1Kxg==
X-Google-Smtp-Source: AMrXdXuJIiZAj16VZgUuBRqA2k8+gGkvW5kulFivi6sXooiaAxXwgafM57hBk4Cu3ulhpAJuOQb6+Q==
X-Received: by 2002:a17:906:ae86:b0:84d:3d88:dff3 with SMTP id
 md6-20020a170906ae8600b0084d3d88dff3mr5179129ejb.25.1674007587942; 
 Tue, 17 Jan 2023 18:06:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: merge two CRTC debugfs dirs
Date: Wed, 18 Jan 2023 04:06:10 +0200
Message-Id: <167400670535.1683873.9301034219626704629.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112053659.1361298-1-dmitry.baryshkov@linaro.org>
References: <20230112053659.1361298-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 12 Jan 2023 07:36:59 +0200, Dmitry Baryshkov wrote:
> For each CRTC we are creating two different debugfs directories one
> using crtc index (created automatically for the CRC files) and another
> one using CRTC name/object ID (for state and status files).
> 
> This can be confusing, so move our custom files to crtc->debugfs_entry,
> effetively merging two debugfs dirs.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: merge two CRTC debugfs dirs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f377ea2c3c3a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
