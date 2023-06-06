Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960067236CA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 07:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7E010E088;
	Tue,  6 Jun 2023 05:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA9610E088
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 05:26:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f7a8089709so19681665e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 22:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686029186; x=1688621186;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dDsCLYgxw0cAllMIv7aPZnktih/2jRXLUmlxWaBI1IA=;
 b=IwxvokNMCgzhhXOUSzqxqBgRxmi+htg/TlgMk4ZYeM32beHp0ygBO8euxAR0AQm+1o
 c41sqH0a03Ang8oPH4q5RE2TIZ7EzDBicWi5Upqo1LS+VH8cHLDoXkXA27jwp8wo48rf
 eZmiyl/UL9g3tnTKk1UqirKGm7+TsJwBv75CZSJH9zuV9IOtgE6Ar+SpSBJxi9gqZ6mz
 BpNyY5nVfJPTkaELNR9yt+4F16iw3qCLjesDjgrzXMwNg4ryEavCgFDHvFNOiEnpPwU9
 qlbDzpvSAdN661d7mnDQUfmS53+gK8Qv4j+Yvm6y3AX2CWfAiZFODcAcPaKId8yVzZ1t
 9Olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686029186; x=1688621186;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dDsCLYgxw0cAllMIv7aPZnktih/2jRXLUmlxWaBI1IA=;
 b=RoR1/uwCHCbA9UlaTMsOkSakpTrzO9jUMPpk0LoanKjlOAbLb+QsUfC5gcZJQE0R6T
 YB0SY+5Sqz15kMRdv6/OR5RaLosscLA725d40toAmNd0McZbupFWD8Bm0c8o8277vqoi
 CHoIlJ5ut/9f5rjZjcrUYCQiJfs4qLOvESGu8Z0mktWuywsGshN9vP7sBqX8bKTCvmw2
 15AsUircjpuIGQbCGLp19R9YNnBY2AVzggNT1QFs1AHHzfqu9odrmI5B7nhCZ9qVPwdQ
 tOhptJTW7sI827ooVD5m5MMnO4901aFSHQdq0Sorrl5ZyIifKkmkpKT6WCIJSORmo21q
 +HKw==
X-Gm-Message-State: AC+VfDzYRtPDJpUq8Cj2zIuQU9Fzgg3jVnk/iUMLybcT0okSTsMIc3Oc
 FTHEbIyL3gLcZIU/F4kjC8YvQQ==
X-Google-Smtp-Source: ACHHUZ7O2HWP67RgSNqCAyjbTAYsyzDWwhj4EAisp0m7UY5KYbL/2OK6vhedUYAPw7jtmm/0lF9awg==
X-Received: by 2002:a7b:cc8e:0:b0:3f6:766:f76f with SMTP id
 p14-20020a7bcc8e000000b003f60766f76fmr979213wma.36.1686029185900; 
 Mon, 05 Jun 2023 22:26:25 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f18-20020a1cc912000000b003f4e3ed98ffsm12686196wmb.35.2023.06.05.22.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 22:26:23 -0700 (PDT)
Date: Tue, 6 Jun 2023 08:26:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 11/30] fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
Message-ID: <dbff5ba5-f34f-41d3-b8d5-2bfb7d34df5b@kadam.mountain>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-12-tzimmermann@suse.de>
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 05, 2023 at 04:47:53PM +0200, Thomas Zimmermann wrote:
> Do not assing the Linux device to struct fb_info.dev. The call to
> register_framebuffer() initializes the field to the fbdev device.
> Drivers should not override its value.
> 
> Fixes a bug where the driver incorrectly decreases the hardware
> device's reference counter and leaks the fbdev device.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Fixes: 88017bda96a5 ("ep93xx video driver")

regards,
dan carpenter

