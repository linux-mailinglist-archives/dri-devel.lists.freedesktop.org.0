Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C2C3977B4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 18:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86866EA8C;
	Tue,  1 Jun 2021 16:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B34B6E07B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 16:12:32 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j14so14939923wrq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=A+MnKSQdNE7K12Vo7bfXlH+u3+rwSbIwzZ/MH9R+hCU=;
 b=fXDfQLMj2a92S7LqF0+bJGD4ntsRpYtD+5eL7xdUED43yXcmpRM5EUYebILLUi4Pyp
 51tYm3ksYSnW/wqBfdt0v3sbGQl2ddGEEbax05rm6Vxxfx4ZcrMQFehscnJO/mxZdMlF
 yyJuQUqs3PYqhHpIODFRhzRD28vePHZ6eGk90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=A+MnKSQdNE7K12Vo7bfXlH+u3+rwSbIwzZ/MH9R+hCU=;
 b=ECk1kIpoIefLVcb41aCxf4RCOQ8BuOLKeo2qVwlZ7HKMspYrHRJ3/Kr9QYWIWix5UR
 V079pE8yK56veY7c/FxsrRsi3FU1jWYlXGzpjEkKrnbtAafCUzteiPwFeMbK4+xRqh5Y
 qD3t9PRPBTJZQaUXAcIXF0GaTIMJRfyuaUOuKqP+ACMwfuTn4j+HQIfqtvHyd9vjzkTb
 9/aziWtliMhAf9MMNwXVf7vzLSD3nETkdNLOfJQ1yIXZs7wxmjtIMY+ZcyhXpTI9KWsv
 Si9AuTtXs9BIfx/kbovoyoaAmCCR02NrgtF0chFe5oezf2OpuRTQBW7tMZAjMOTAkW7U
 2ijw==
X-Gm-Message-State: AOAM530T4MBVX+dIWbLzWwm/67bAqQUA8B8KcAhuQB0/vpgc3t3gS/cj
 MqMUd5uzhgxFBHb1YPWsDi8djQ==
X-Google-Smtp-Source: ABdhPJz05k0XhNrh1QSM0xrnZ9oif/CUuRvsxGK5dEIUsHJY4nwc/OA0AP5fRzpDHCNc7AElGuGyEQ==
X-Received: by 2002:adf:dfc7:: with SMTP id q7mr1257166wrn.292.1622563951262; 
 Tue, 01 Jun 2021 09:12:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h15sm18874800wmq.1.2021.06.01.09.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 09:12:30 -0700 (PDT)
Date: Tue, 1 Jun 2021 18:12:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] video: fbdev: mb862xx: use DEVICE_ATTR_RO macro
Message-ID: <YLZcbZVXnYBQM3n+@phenom.ffwll.local>
Mail-Followup-To: Zhen Lei <thunder.leizhen@huawei.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "Signed-off-by : Wolfram Sang" <wsa@the-dreams.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-fbdev <linux-fbdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20210601090852.10531-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601090852.10531-1-thunder.leizhen@huawei.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Signed-off-by : Wolfram Sang" <wsa@the-dreams.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 01, 2021 at 05:08:52PM +0800, Zhen Lei wrote:
> Use DEVICE_ATTR_RO helper instead of plain DEVICE_ATTR, which makes the
> code a bit shorter and easier to read.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Applied to drm-misc-next, thanks.
-Daniel

> ---
>  drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> index 52755b591c1489f..63721337a37787b 100644
> --- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> +++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> @@ -542,8 +542,8 @@ static int mb862xxfb_init_fbinfo(struct fb_info *fbi)
>  /*
>   * show some display controller and cursor registers
>   */
> -static ssize_t mb862xxfb_show_dispregs(struct device *dev,
> -				       struct device_attribute *attr, char *buf)
> +static ssize_t dispregs_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
>  {
>  	struct fb_info *fbi = dev_get_drvdata(dev);
>  	struct mb862xxfb_par *par = fbi->par;
> @@ -577,7 +577,7 @@ static ssize_t mb862xxfb_show_dispregs(struct device *dev,
>  	return ptr - buf;
>  }
>  
> -static DEVICE_ATTR(dispregs, 0444, mb862xxfb_show_dispregs, NULL);
> +static DEVICE_ATTR_RO(dispregs);
>  
>  static irqreturn_t mb862xx_intr(int irq, void *dev_id)
>  {
> -- 
> 2.26.0.106.g9fadedd
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
