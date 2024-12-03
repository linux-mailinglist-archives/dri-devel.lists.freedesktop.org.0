Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771859E1E4E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 14:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF9D10E477;
	Tue,  3 Dec 2024 13:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PMfkfRx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D45410E477
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:54:33 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53dde5262fdso6433450e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 05:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733234071; x=1733838871; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7uNJWGh5QWIcANOkbpAmV+WuUq2lB7oYxMgbIDfhiSY=;
 b=PMfkfRx+s37M0Mt657K49wQiD4Xw/WHZERw0HfxpbT1NnibekdJJgsZfqbK6t+WIeY
 Y/3NYpnLbITfE722ACcgsAjcsocfOzVugGPleDhFncXx9zBmfpbu0VivDB4PequXY0dR
 Y9FNdqnbI7xTFuIsXvjBZX7Ud0yp1Na2g7oBeYNH51CJRvgWfxE1uSKfNOiFE1IBTz3A
 H6Jt0gH5//dlnP5Wy/J1W+wt7CfZTKYFNq7KZzS9+aTdsB5FDnYyg5nIKE/NVAsKtYnT
 grLcOBGV+vNty/yFTHJ5jF6tj0rT03WQ3gyHZVk1FA6kNciRsHmvKkveC91C/bm5bCiM
 iLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733234071; x=1733838871;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7uNJWGh5QWIcANOkbpAmV+WuUq2lB7oYxMgbIDfhiSY=;
 b=TqXUlla2T2XIO0y6v9QfS0sBqVWpzEhSfHPbq8SoDA2HBqLc2PM3H+Xf2KZ6nzTb4S
 Oi6zE3EFwLOGsUralFcxYaMqyZQQR6WhxCWFCRxg1UmVqwIWp+3fzZAp6ABXMS21eQFY
 4ZO6ceGRZgL54K+uH7fa4HankZ7qonZwOK9VoYfJeaVrcpQGwK8h+2v617tvwT/cYKU1
 1cHvd0XvG1a4lzk0g8rHEH6pqxPJ/+Wsfv2IxE28e/8cyIx1bHhb++GnFzR1Fx2rZnus
 GiuUafsh/n7VcHfIHcTOBURvfXYwZ2YKg44Gx0QwH8ojyG1KumQjYc7qgwuvaOQXJWhe
 IroA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQZLT17VESGqYYQs00zb8TfwHVDUjMLYsL9tFr57/2egQrw3l9CRsqRTgrBXVFqIBrAlIjTz8/654=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyfaPqkrz5+RoxwxCCDvQ2WK/IKIxfpdy3ITigsFysQ4AsqOuH
 XxIvRpp2GTj7XT4ty7ct+2EHL1DG34H4OCQwDszI9rR+AaSr3OBQxDiB3exA64kyD9CbcEAHqEO
 8
X-Gm-Gg: ASbGncvjV2hN92z2YRMKH7lGekY8i6NUXAjETsjH64bOhGMKLK7WFv0qfJoIBHkq0GG
 IwVw4jXJ8WLFViupjVIZIsTnr7r5vw3mrObyWbAKizFo+HXwGu7trl7ghrzSB47QzPhgnz1eRVs
 pBDpHgj1u2Rha/ilQBjoUYMI+Ug8HgAouz/mfX8uVuyrlYLyIiuFoBCq4cDjOwvqXvSPvBAwRaE
 ZF2A1BVgtg6VZbmqTa6kAuQz9ZfVSVQ2M8QEs30zRbzHAysFZ6xrmMR3R0TBDr5FbpPtXbwPn8F
 TUHya3gBSNqIrYcQ9iYW9RCTY1KVLQ==
X-Google-Smtp-Source: AGHT+IE7c1Kb8HtD45thYMsSVhmzZ9BdudadoQnajTE11NmQT7idsUke6l4BDT5LccQiDuRy+BsDXg==
X-Received: by 2002:a05:6512:3ba3:b0:53d:d443:1ab0 with SMTP id
 2adb3069b0e04-53e12a22f2dmr1693409e87.43.1733234071182; 
 Tue, 03 Dec 2024 05:54:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f0e6sm1833037e87.154.2024.12.03.05.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:54:29 -0800 (PST)
Date: Tue, 3 Dec 2024 15:54:27 +0200
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
Subject: Re: [PATCH 4/4] drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
Message-ID: <3fy3klftm7tlr3oki26dros4xbfs62hw3edw3ebsbcuxpcd4w4@l7uesddnkjbs>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-4-8d0551847753@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-hpd_display_off-v1-4-8d0551847753@quicinc.com>
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

On Mon, Dec 02, 2024 at 04:39:03PM -0800, Abhinav Kumar wrote:
> ST_DISPLAY_OFF check in msm_dp_bridge_atomic_enable() is used to check
> that if the display was disabled while still hotplugged, phy needs
> to be re-initialized. This can be replaced with a different check as
> it just means the hpd_state was still ST_CONNECTED but without display
> being powered on. Replace the ST_DISPLAY_OFF check with a combination
> of connected and power_on checks.
> 
> Since all consumers of ST_DISPLAY_OFF have now been removed,
> drop ST_DISPLAY_OFF from the list of hpd_states as technically
> this was never a 'hpd' state anyway.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
