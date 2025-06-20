Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133D8AE1C59
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 15:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D7810EB59;
	Fri, 20 Jun 2025 13:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="foptFn1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2A210EB59
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 13:41:03 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-addda47ebeaso390110066b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750426862; x=1751031662; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hpVfOGJFxIZYsmMRUwFwqfFQVYB9k3K3K32rB5+Q7vw=;
 b=foptFn1+he2WB5jkrW5P76COgz8lnsbvEWv6H4eeUc8bcIjKpAgonrMcbiEJ7VVZKp
 OCnG526YfF/Xvwy7vMCODIYYTQyGxnzFvbPQe/XNEU59ROa14t5OchNGlGf51BGDcyGf
 Hbvqz3PpUj/251554ASpE+b2IMk5z/sSsRDKSy9GjDd2z6qTg9IxHGQEtR1z+nxtcFKw
 zAaXMF/olvTrsQgYInapl8feLCKV46CdEm9mnnB1oT6d83dKA6kLSFGpK/GvAzueufIp
 Jt5Lx8eMcXKIlLvuyVU9DyHCFJvpH0zfOVCf0l32qaWHM15j4OfBAYGEnRqalq1z6irS
 w5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750426862; x=1751031662;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hpVfOGJFxIZYsmMRUwFwqfFQVYB9k3K3K32rB5+Q7vw=;
 b=HLzpAqLNnbbxA/5jIFT+I2QmjTVGfmbRriRHKmsZMRDAuMliWZie6Sx9lZZ4jIYVnE
 zFPR6TOoinnPHfJ8JnxBwap9mICQmKpZCT/Gc+zOyban0hFkm9wuPYOXHWsaYoU3mQrK
 fT4+hOOdH7GSsdwGZ1J6/LotvXJDTuiGaLgm4B7AaexiO+UtCTaVHOvS3NtkzQLixvrQ
 fwl6zcNPnjbER+66P95oFJp/Ug42Ev8YonAP4MjTK9bSk4l9787e7xPaWp9J7rHunLib
 1yJ+0+jFxuMGsAt5g4DQkhYTeztP9CTsDJS3edEhut/mgIdgVPHhggqWnqmB6Q7cKE07
 1OXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC0nC5PTHfeBXqIJJwj0wTzQgdTeBImpea/G6jmgZAaa8O8SDMfABDqt1pRqZ0tWgWQubgMpfQX+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRglBl6VcdNvewcGk/IJD4EzD1Ib4851u5Y9hazYBc81xQuiVz
 sGslLX82B9jl2vSSWHQEITk2kRxdNOtJudMPwe0B4BwTDhn73YkjfHROmAWP9NZ3KWQ=
X-Gm-Gg: ASbGnct74dPJ751MaEAq0nmvndIwVlvGuBUo4i/Hv1o1YaIJNwanesavO/ILB/FU35H
 s+bp9d18B5YgpipxRR0bCyAausibvNZQRea9Oe9jE4+YaVrR5En1VrwPkzzTMwK89mCDozZxoZ+
 hLlnTCsP+yZFpweppda66a+rkIkSEvHaqT0aUR/cf2TWk3sHBzyGrYCQNNhTiBrj2OOm1xVv9uk
 OcaUu0GGQ//SiMx3x5vg6T5T8wUgL1CxO3gXieSFCdx9OXtd/kmBJf0Tx1i7qSRMPTbiQism2tD
 BomT04o0US3k5P36im5/fXhPI/ZxYQTIQ0tfNFP7xfRoFCJXeQYxBQhhjvg=
X-Google-Smtp-Source: AGHT+IGYKKslvR/1stzFoNBWMle6YgYw/c/0QW8ncwoZLD0lcIICIhoOzA/vRygSUJ7ruQCVGYAWdg==
X-Received: by 2002:a17:906:6a19:b0:ad8:9466:3344 with SMTP id
 a640c23a62f3a-ae057b98feamr276291966b.43.1750426861719; 
 Fri, 20 Jun 2025 06:41:01 -0700 (PDT)
Received: from linaro.org ([82.79.186.23]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae054080a98sm168650466b.90.2025.06.20.06.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 06:41:00 -0700 (PDT)
Date: Fri, 20 Jun 2025 16:40:59 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: include linux/io.h
Message-ID: <aFVk6+4pIMQs2imz@linaro.org>
References: <20250620124747.1928114-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620124747.1928114-1-arnd@kernel.org>
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

On 25-06-20 14:47:43, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver started using readl/writel, which are defined in linux/io.h,
> so this needs to be included here:
> 
> drivers/gpu/drm/msm/dp/dp_panel.c:33:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    33 |         return readl_relaxed(panel->link_base + offset);
> 
> Fixes: 9d47325ee063 ("drm/msm/dp: drop the msm_dp_catalog module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
