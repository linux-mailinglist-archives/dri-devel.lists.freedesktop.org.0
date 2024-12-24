Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E759FC191
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 20:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC2310E0C2;
	Tue, 24 Dec 2024 19:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TTFh8pET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA4C10E0C2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 19:03:51 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so5964824e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 11:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735066970; x=1735671770; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=73xr+4nW7tI5Q8EUdA8RN+bDlWklHWa3/CJKw3xIN0M=;
 b=TTFh8pETW9HV4w66/p8N9Am6SlOEIu2Sgal5wV5e0LEqneKUBxnk1F5X1aHmOpJx04
 nub5Ze1MzgdFk5/5J+lRD46Vukf4UlTwrc5RGjoThFFEYThxXRVwZt84U11eOWOILnaz
 +OSPDDWNzyutSkpSGUrdqXPuudI2thew3OcSNrVKQgKrwbwByFsyrD9w1Ujgk8XDGnq7
 LDS4p3wWgGEq/UWo0AlG7TcTIMaNNiVw1yt+lOC0hi0ZiOd3kgetYuF9o+bpm6KTRjWK
 eZIS25jdu8vh3srpDdPtFZXs0atzVnQaNMl2P+D00wRG2g85NTA15EOyLhxYVID2lhZ0
 iL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735066970; x=1735671770;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=73xr+4nW7tI5Q8EUdA8RN+bDlWklHWa3/CJKw3xIN0M=;
 b=SPSP5ayFvP3xFWpC3PC5KhkCze9hrlrbHtE31GzHkGLXEE31jO/1KZFKIpR6jDazWZ
 fnCzghDlYNYoX7418Nc6rYuQkrpmhKEz5FE9ftg5EQ7KUkacQXoV9DDZ5sk5Wg6lvAXd
 SfQx46kgJBMSdAXVPaMHrsfD1RycmqMCArMkHY6CyH5mDipAn5KVDnWSHYS5UpTMWivM
 4RPsErjV1W0OVVp5Xr14VD9LvknaO4rvREpgBnkywxofjt1g8HKfhaweyLvECf2dqjFc
 sCbOaLG41BluUhTR8fKHILFgalaJa3WVf7B9WoK5IW+jBgcjdMunDdDXNnusGS9vEXg8
 fHSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPz55q7jXIJsZ4CQmV8T+nH4Z3d2TQLXineggfaa/yAYt4j0Uf8yCCRnQtGNmj38a8RN7qsEPo+mE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7oeWxaH1WBbWEH0z+UhAmJF0JcPJHryRAHjsaHVD7LGhG8Xd0
 Dt0BFJmkrzQgo8lAurzh8jmPrVYNXP7i9AF+ISkgnCkPorF4xtVmZNRDBeNJ4+Q=
X-Gm-Gg: ASbGncvvBm2ejzDpu2YiZOWqAdHBLdQmKX+yGhmoXceuC3+HR3cNn6isthS16NV+vg0
 Y/cUaSWIfIMGla+2CVGnPnumBQkVPPg58lEl68teEX2uHjuB1tFJX0P+lp9dbEBaa3hmAfWMRP8
 cIy3BEqEapRDAWAKiTdi0OJiW5Yrcc74RE8WwmaS4sK7rIZT1RaIux1x87JmEq04k58LmOh9ZwF
 46iArY8c/484u4v5ySOF6Gl1QubHEILmx4rrr4xuexrCtiym8m+f49xE+jjWPGCZM7YddUH0au4
 jqiLXoD632DgKCdVN0fHoine4z8XJUqlqkVv
X-Google-Smtp-Source: AGHT+IGRRqF+ZS2dGVSRevYqm5xAB600XiBoocDLLIS2mngeeKBmAXeKQpUmYs5eMwiFTkvnqUIVvw==
X-Received: by 2002:a05:6512:b0f:b0:540:20a9:9ab5 with SMTP id
 2adb3069b0e04-5422956bcfamr4577754e87.50.1735066969977; 
 Tue, 24 Dec 2024 11:02:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238214a6sm1654539e87.195.2024.12.24.11.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 11:02:49 -0800 (PST)
Date: Tue, 24 Dec 2024 21:02:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] drm/tests: connector: Add ycbcr_420_allowed tests
Message-ID: <5cfzp45n47puqb6qko6wgn2oqkybuh4csuohashesrcees365e@fnwsuxskzesf>
References: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
 <20241224-bridge-conn-fmt-prio-v4-4-a9ceb5671379@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224-bridge-conn-fmt-prio-v4-4-a9ceb5671379@collabora.com>
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

On Tue, Dec 24, 2024 at 08:22:44PM +0200, Cristian Ciocaltea wrote:
> Extend HDMI connector output format tests to verify its registration
> succeeds only when the presence of YUV420 in the supported formats
> matches the state of ycbcr_420_allowed flag.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 60 ++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
