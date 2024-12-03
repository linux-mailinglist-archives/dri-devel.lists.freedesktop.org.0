Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112D29E1E46
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 14:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BAE10E45D;
	Tue,  3 Dec 2024 13:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dBwm9ck5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7C810E45D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:53:46 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53de92be287so8229223e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733234024; x=1733838824; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2z7Lw9AnAApn3+Fq4NPDiMReJ0TWjBn2iXkUvuhnlA=;
 b=dBwm9ck56PrZGeVWt0L+6jlrwX1EFsxpDDZT+LB1m90gDCmN9RiDn7QnSWVJTFfXe2
 t+20a7iVpQBqhx75Fu7jf8Tcbwdrs+K4GQUIgTY39T4qgkWs/CSPlP+vH/tK1uAhc463
 6UqBcZh1WliZKjBUAJJt0tNxfE9OLlR52sc+zjVUENHh1A0D41PR/Ac+rFnACsqRtR4s
 uiTuD96G26/++qMy5/1/BEKM5PHsin4rg8Tp8GWLs4z0mm3tc6nk7m6prpC5o3lam6/7
 sPCZgzZdGGWXBF4KX94VNcAFuKBQsoHdbYvmD30pTSR4GV2J7X7HQslQnZ/SEMehYjUs
 xuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733234024; x=1733838824;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y2z7Lw9AnAApn3+Fq4NPDiMReJ0TWjBn2iXkUvuhnlA=;
 b=MFMM90UaMo+9yNptjCpNvJSFZyf3f+6Kj65NsLcFJ01MDfQ3lVvp693cC71ezMJ5Yr
 6pgVFtc1cSZFyj8w9vJWguAkt2Q45Zmja6msy/NV1tVyhfzccLQf+JFOayshBoclJznu
 zsg5PLeBIfsrmxXzMiivQzTgoQjBK88V4HaFkEBbca4IiMihgZ/eW/4+4OgEIfgsPooZ
 g+bZEAm21MGWg6phq3X1B3Gv7GL9J+tB9k7dTA52H2qxjxmNRJxmDO3x73XvRFFpGKPB
 DKsqQnkZwHop0U7qx5yf0GiGE/NgSdZvXe873qJ7XXJNEMcQ/czV8D7PuwACQ0cydDJ5
 xgUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuwPi974hKSlqeFrLBriZepa5zk/n9ekBymON/tr+wFdNH6YK/j5zafZSnw9s5ElX7K0uTglh6Zvk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX4bHQT2tss+E2Oj1WHXxmtiD0LtT5/Lu7m8W+ECh+Aay+xZtX
 yEvOYkxXAN8atWPL/+QSjJha2Thb0EDDi1ItsvgFOknfGv7OX44eQoyf5IpDyrk=
X-Gm-Gg: ASbGncsBRdIK5OxqpCluQYikk1UKX9kq483uyHlDGaWVwhP54RxFOGAdVK/n5axwubK
 /ErGBaMldIXSgH1tziMXbv3/+kM1g3z4PSHUzileC9LYEvYlZBd5VvsQ38/iXTINi/fbApG9SPr
 IIcE00vBBPx0VSPG98Jutui3VqJQhAXNvmcBjKFLgKsW0fVMpV8FdV1IjivD0lzVPBqLDnlpAmI
 XG4tSnoEbjbuIwyNqwJK9yyTZz2umgFhLIW2t+FIpv+0pOAAE7FRpM2nKxUXT1VshBGQI8544mo
 l6U9ZSbC3LSIdjjWABTnIcJ0iT6ovQ==
X-Google-Smtp-Source: AGHT+IGIVJilF847DUoQ5IIjS97Q02Ms+T6DT7oFUW5dd74axuuCY4gvMyDsqnLd1Arq5x+/ERo8Kw==
X-Received: by 2002:a05:6512:b14:b0:53d:e7b6:c701 with SMTP id
 2adb3069b0e04-53e12a06d37mr2329892e87.33.1733234024535; 
 Tue, 03 Dec 2024 05:53:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e0d4dff67sm562441e87.10.2024.12.03.05.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:53:44 -0800 (PST)
Date: Tue, 3 Dec 2024 15:53:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 3/4] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
Message-ID: <lcr5i4s7it5goppdi5at6jplnrvb5xl4cmv22n5jtjdnlbda43@54z7afarengg>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-3-8d0551847753@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-hpd_display_off-v1-3-8d0551847753@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 02, 2024 at 04:39:02PM -0800, Abhinav Kumar wrote:
> msm_dp_hpd_unplug_handle() checks if the display was already disabled and if
> so does not transition to ST_DISCONNECT_PENDING state and goes directly to
> ST_DISCONNECTED. The same result can be achieved with the !power_on check.
> 
> Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
