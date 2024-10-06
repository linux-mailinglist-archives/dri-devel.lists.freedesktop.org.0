Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC029920D9
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 21:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD2B10E15A;
	Sun,  6 Oct 2024 19:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vqCqfg6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9D010E21D
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 19:46:59 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2facf48166bso42380051fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 12:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728244017; x=1728848817; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Nudt6VvmPjF0HbFLFck+5c0LXbisuTPtkHJzkxMI8Xk=;
 b=vqCqfg6hcIcK2PClcx420ZGNJxBKzCPLx6+dNxYZWsTOR1ww5kXWxbFDl/WXiIAsIr
 RsUP5lL1uAAc2OEXFYDbMWCorT+jsOhoyd2FxDUD2QKKTWmSMXdc1YBucnkfGl8kFse2
 7FGXPWnBIfsClTcXuz0mY9FNBAaJpA9BHzyX1tqg211ffvbkenCOhTJ5YvvNA3gG8CVM
 0yE3t0O14JuL8GQTZ31ud4cvKhfUhcF52hcMxTrq7cVLNHQIQEt8uJzX1ZomBxQnbKmP
 2nmXgmqxTD3MLPtRI3HhbEPMSu4wUMe5XbUg2Si4H14Qq9KV9fORv+tYnHUCBWzVpGjZ
 fm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728244017; x=1728848817;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nudt6VvmPjF0HbFLFck+5c0LXbisuTPtkHJzkxMI8Xk=;
 b=GF9a9ZdBX+0o4lyLP6SOVe1SjLqsBdZF1HL89gSsuAOIInmRnIzRVJBRmFVd7VMOsx
 6RvM5pSyLQN9qfTmPdur/lxsr/Uj+CyTwDdEBd6NMDQw4gfRJ8grGbyPDz4x4cCl/Rr1
 G5ZlqqYDPt4+SH+0LD1p+Qp5eifu+tD+eubXXqlHTs7vICf90vN9g7sE/HrgH/6VWRL5
 JU76UvUlb5vfF6PpIKIVXeioJEjHOCVH83BWQs2v/yOPvMFZUSm9zTjtgqAxkGWZUxVw
 DvtJbFnKy2z7zFSoQLlTHcHF91C1JRZ5D4O7rlO7pvrlUlgCXrBYv9njgT3o1hUdFBgO
 QXBA==
X-Gm-Message-State: AOJu0YwKtrcN2kqruAnnqWuIEoCImK0uvQe1cm6zrPrND7lUERcL9UBB
 jIgidWfDvgrZMHkodxTtaqoW6mIc7ewLk9PBZK/zumSJ/Kg9m0PG2CkDMjJQs2A=
X-Google-Smtp-Source: AGHT+IHQ40ic093FZX3v4B1HtEnY+cFajGIuhrqmUeVmOK/1zrCrTPpZ72nuQMgcgqEOYhJIrHyv5A==
X-Received: by 2002:a2e:f1a:0:b0:2fa:d84a:bda1 with SMTP id
 38308e7fff4ca-2faf3c1439dmr35177721fa.10.1728244016963; 
 Sun, 06 Oct 2024 12:46:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff23e0bsm610963e87.243.2024.10.06.12.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 12:46:55 -0700 (PDT)
Date: Sun, 6 Oct 2024 22:46:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 deborah.brouwer@collabora.com, 
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] drm/ci: add sm8350-hdk
Message-ID: <eoumkcfeiw5v5apczgthateomnhjs3ihdyjwcjppg4gwgdseo5@vh3loy4jlma7>
References: <20241004133126.2436930-1-vignesh.raman@collabora.com>
 <20241004133126.2436930-4-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004133126.2436930-4-vignesh.raman@collabora.com>
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

On Fri, Oct 04, 2024 at 07:01:20PM GMT, Vignesh Raman wrote:
> Add job that executes the IGT test suite for sm8350-hdk.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/arm64.config               |   7 +-
>  drivers/gpu/drm/ci/build.sh                   |   1 +
>  drivers/gpu/drm/ci/test.yml                   |  16 ++
>  .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |  15 ++
>  .../drm/ci/xfails/msm-sm8350-hdk-flakes.txt   |   6 +
>  .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    | 211 ++++++++++++++++++
>  6 files changed, 255 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
