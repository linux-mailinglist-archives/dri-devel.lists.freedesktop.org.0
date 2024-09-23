Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BA597EB8D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 14:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6132F10E3ED;
	Mon, 23 Sep 2024 12:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IaKeivaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B7E10E3EC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 12:34:33 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso4838407e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727094871; x=1727699671; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=N49f57cTB1HFzUzgYfoooYdBFUEP0IAy2wA8kB5amCA=;
 b=IaKeivaUCvZDK/gWuViMIlynBQf0MSgNh+sxB66vOS0btyXuilz9/j6p8oiNAjgWO9
 slktA1/+odP1C4RUaBXWKShTGzo3HnJlrIddj/Z+9a+pK2iY40/5TV1iMGQkVzZCmpzF
 SWZpyMGC+S6E12XY1liQ/SkkQQ0N1PUg9jnnkbw43wqNnBzaNuqYc4Ca86W0C2yvl+ua
 xH5OKrK62ijaBNzAg3w+Vd3YQTmyWJFZsjraTiJUJRelrXt4QF9sN5bxOn3NCCP46Y8/
 PJvjGAKVvF3bmj62coKdqg9Mlf7BEtqrC6tSzocVwciJoks9OiP/51dRIhDfzjnYOB7/
 yowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727094871; x=1727699671;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N49f57cTB1HFzUzgYfoooYdBFUEP0IAy2wA8kB5amCA=;
 b=ETKI6sehNknMexO+bf3+2xekK/JVP+gnZXWaDXieoDPvrCb3Egnqgt1FqOTvajLHhd
 smN/uQ0/ecqmvVNBntnFqwrObTgd8W7GSR3IZn5FA9m8vWLHBAA4CPwIATDQJc4OCmzp
 h4EHVQ9rqp93mejnxU4V1Jup/4UxfhtLrrInrITyHxjaMfkAB+p+iFnFevBgYFj9fa7R
 5GN8bFmaF3jlCMakpXI6Jb49KIRs/qr7+4RvZPnvxCPzccoU1YO4LP6xTlmPrj/iQpDX
 bwyvDm/7bUfO7guXLdwqFW93/Wl3AM1/iqOAJFfsISqhsusSqQz4/N4Skj+aikvgXc7G
 MGvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpTU0CKJnuVtT06tJgVSllzm8PydThakKABMdoZ7GRZIXA0Jduu4Y80dWdFsCB0v2uw28YG6OI5Ak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdT/XzKyhFvGk2exjeIlfHJp5G2gHIHr9y0D1e0pSDxd/KhCwB
 Ius2CE12XLU+8gYXYZcSMr0Gd3UBtkBo+M61FW1XwxSgZmOSIyMi2Noo61JiaquhAfC8HF2llw4
 52uRvLQ==
X-Google-Smtp-Source: AGHT+IF/DFl2Yi5RkcdlR+iT6PwIVo32HuubtE9mc1DgRuA6fscZHZXvy947e5s+d+LPPRSSLjp9eQ==
X-Received: by 2002:a05:6512:3048:b0:533:4785:82ab with SMTP id
 2adb3069b0e04-536ac2d6a6bmr6515979e87.1.1727094871107; 
 Mon, 23 Sep 2024 05:34:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53687096914sm3251007e87.170.2024.09.23.05.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 05:34:29 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:34:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: deller@gmx.de, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev: pxa3xx-gcu: Convert comma to semicolon
Message-ID: <rsegcr3fhm5hfb5vbe7zlmvmffwmctoxv77kohoonswpqlo45v@qkg4rfeforyc>
References: <20240902075724.3824567-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902075724.3824567-1-nichen@iscas.ac.cn>
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

On Mon, Sep 02, 2024 at 03:57:24PM GMT, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/video/fbdev/pxa3xx-gcu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
