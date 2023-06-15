Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 578227316A7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68FD10E4D5;
	Thu, 15 Jun 2023 11:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F7110E183
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:32 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b39bf8d5faso16630031fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828690; x=1689420690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEH34TZYFNlcgXLePl0rUEbgPVtd5P4NQ5yQ1rh0Ycs=;
 b=wPLej/DcXFmA7QyhANWlKW7XEHFm4RxK5csM8/Wxyo2gaFDJDzEtOLH/7FcUdjhuFl
 HjxgoLRttLDvBl9PDyPA4A3deeUw9TnrULc186HFhuudq2hSmNBPunPx1rjFA/gWFPxi
 6fkmPA6ces7a4Jf087biEp4cyt5ZJRP1UomrXpyxLjaPlaNtCWcwRMbQwOsCk16iCeFH
 zRvbxxIiz6MuOwV3tasE6Nlh9kT35kprdAqg+3mFkUS+Ry0h7Xy928Rj1OyXRKcNeLTh
 101oWFMYs8yP7VtA+sDWpHpfqaqTYbUB4tueHAs8ZnY5xEe5zW42svVCXpl0qHtDP7Lv
 NicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828690; x=1689420690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEH34TZYFNlcgXLePl0rUEbgPVtd5P4NQ5yQ1rh0Ycs=;
 b=HE2JQeC5WpZvHBJyzBy4wd1wHCzwlhjK0UX02o9IC7wbwehiJBAdfqed2ERgarKlBp
 MEvsQI7ropEanptmfn7VU8OtlJqTUPdc/QniGbDw/DEKhNyaMg5YrkS7/T4VhQjo8fFR
 jG8qjh5guv64Q4rvspdYDU8K6JZMge0AciLEP9c3/EUShvBh/85dWTvhZM8nF0hDaRXS
 5YgFR++4ywmKoboziIzTBqkBFYleqzKBSCE1DFSxn6QE0ZrIf4imJbRu1wkp1VpQWVo2
 dLEDG47UfSH7PdxwTu1awn3lRHE0jvdlfRrxxFPQlYLMr6v6nM91CVtpriKSdcNte4P5
 vNmg==
X-Gm-Message-State: AC+VfDyAjXuFkuwkiqW2M2I+2+GA+9aauzaWRGTliagT5Dt9Oam/shhe
 /ba/1eANMON7OduIhpZI0wpfkw==
X-Google-Smtp-Source: ACHHUZ5gOziE7LMMkWYZY0KDLUukoRZuf8MqOClCFeDYczkZvamTgwDM/zUUN35yU2xAfqg1R9IlEg==
X-Received: by 2002:a2e:6a09:0:b0:2b1:c039:e977 with SMTP id
 f9-20020a2e6a09000000b002b1c039e977mr7678787ljc.16.1686828690424; 
 Thu, 15 Jun 2023 04:31:30 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm: provide fb_dirty implemenation
Date: Thu, 15 Jun 2023 14:31:20 +0300
Message-Id: <168682860386.384026.12795500183060045026.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Degdag Mohamed <degdagmohamed@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 12 Jun 2023 06:16:15 +0300, Dmitry Baryshkov wrote:
> Since commit 93e81e38e197 ("drm/fb_helper: Minimize damage-helper
> overhead") the drm_fb_helper_funcs::fb_dirty helper is required for
> proper dirty/damage processing. The drm/msm driver requires that to
> function to let CMD panels to work. Use simplified version of
> drm_fbdev_generic_helper_fb_dirty() to fix support for CMD mode panels.
> 
> 
> [...]

Applied, thanks!

[1/2] drm/msm: provide fb_dirty implemenation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fda520976ef4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
