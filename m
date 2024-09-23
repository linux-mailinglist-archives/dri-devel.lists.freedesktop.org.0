Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC2397EB94
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 14:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601FD10E3E7;
	Mon, 23 Sep 2024 12:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v4etilWZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AB210E3E7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 12:38:41 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f7502f09fdso35054761fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727095119; x=1727699919; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yO+7OpIomOWl0iOTdvngOzd9ac0O1rZqsrTnwlfKJ3w=;
 b=v4etilWZrilUnH0kkN4ik5zwHrP/LnaKXE7lt387nRxcR2S2czQ1IYFpO5jyNjo8D8
 lxALleEX7pd9CtaZy4Q21W81Y+HX9Qry4E/o0LIv4zwPz2mQ1cdZDI7cM+Ifp3XlOVq5
 zxTrhIKbpi9CttF6uNAAA7Lsje8Yz99tfhcOivHfFRPenb+sEQXJR0+nrtaCn7VSYnuj
 lOniuTAUhxmlWhPr8BzJekRx5mIDhkXedj747aBsD+pWd1LA9b4aOvnsX8OkvIrG+Tq6
 ZxlUnEg7U55innGOCjtuBTnN5Wg6xwhGz4JP/+V+4fM+dBaAc8palKsKuBRvB5QGEQa9
 6ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727095119; x=1727699919;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yO+7OpIomOWl0iOTdvngOzd9ac0O1rZqsrTnwlfKJ3w=;
 b=JjPpAKLv/KcNMoH9Z6EFxDtvZq3zPGyteyuBYIjsMeyavKsVfHdgt0W9yQ2nnqj7PB
 TKMl7C6eEh2WbWAVWy6PJfnv2dMIoO1Fax23nBHJqtsR1PFzA9nUcqeLEp90apDG6KjU
 V5ZVQ4Dw2rNDRsz4v7OdQO9E1eX1UvxVDGOY7DrEk0J+1Dq1KAacAa6Qoyea5TS+psl2
 UCmWU47kgrgo+jeiAGJ8ur2vztAt1lv3eTZw7F7Z6W6h7MMmfNVe6t/TwSXeo5+t0lHV
 702j4WrLSzSRmfhDFJu9woxs52LGZc6Lu9EHcCM3khwaiEnNTbVpgRWpN7nUYYtCbGwv
 kkQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgXQ734M7pe+cRs+DEmBTkaTXjf7lqBHfuHsSdXU7Ay/hgnyTzO1ZH5vb7gS9xH+3xSbCyotBZQ/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2ImFSk/6FUS/C0SiVF7srx4x5NnLwCFfeoh/eE/T5HuOTO6Ui
 aoM/hnvNq0G5H1iBJVy2XHWP0Mc1A56GxoQBrcgUtB4DQca2DcpEe8Zv0Jqu3mg=
X-Google-Smtp-Source: AGHT+IFEfpLdWF67rNXJDjM6L650sxfmqOHP8oi42p0ZGCDagO7bwfQ0rGw+v0Zdf9oEWaOL9zCJVg==
X-Received: by 2002:a2e:a90b:0:b0:2ef:21a6:7c82 with SMTP id
 38308e7fff4ca-2f7c3de8567mr52052171fa.20.1727095119082; 
 Mon, 23 Sep 2024 05:38:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d2e1eb5sm28269521fa.27.2024.09.23.05.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 05:38:37 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:38:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panel: elida-kd35t133: transition to mipi_dsi
 wrapped functions
Message-ID: <wlz7n6cwldqiairefc27kku2gcbix2qcyx4xlzgwatfxweigta@2a5riplj64uk>
References: <20240923122558.728516-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923122558.728516-1-tejasvipin76@gmail.com>
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

On Mon, Sep 23, 2024 at 05:55:58PM GMT, Tejas Vipin wrote:
> Changes the elida-kd35t133 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - Changed mipi_dsi_dcs_write to mipi_dsi_dcs_write_buffer_multi
>     - Cleaned up error handling
> 
> Link to v1: https://lore.kernel.org/all/20240917071710.1254520-1-tejasvipin76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 108 ++++++++-----------
>  1 file changed, 45 insertions(+), 63 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
