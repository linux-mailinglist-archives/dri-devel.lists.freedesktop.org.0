Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 911251EBCDD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 15:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69FC6E3BC;
	Tue,  2 Jun 2020 13:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EB66E3BC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 13:16:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v19so2907071wmj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=OpasVMisglYsuLwIdyOtQK0A81fANkOyysqk8CVIvx0=;
 b=kuDotpuhsY+MXpsr9Oy5OHDubwIUR/t6up0ak/ePcy2RYYIQAcRwYchPhLrdrqQ8ZC
 jDK8O0tZ+vCJrTENfDjEGHWnjEKoRkrWEcPXw3RXThiLDdTS0t0w+q1PM/ZIlowe3v6E
 wt0jXrNZ+k5dqoWCCoe7cAQEnilSIKZTVdFlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=OpasVMisglYsuLwIdyOtQK0A81fANkOyysqk8CVIvx0=;
 b=aVLrMnwAh+W0W3CmpCCfmLm6WYCtjCae12JfsLcT126KGURvkWxu+aQZQ6eFVnWEXw
 YNKKsXjHqEDiKSP8k7SHyN/xQl3uuzHBDG0KhXGGyXyrfc/kvox9GteWOddEIA24n3ZB
 rBEsWcSBTXZY7AOVf6451gGLWf/fVYH1dFWYQHxxw08uReSCSsItqxPfcq0J2Ajj/wlT
 CVpkGvNYzJrg/G+uuEC8DrY4XX9GAzoeXicZTfzdwW1hpcrSr0rQSCyodQIQY5pvbaSk
 Pc01HbcpaMeO1c5ZtxIpG4tqDLmAB/uHE+Fl/DWw3MjM7FKYX+g7vqLUbG2oVLnxsgc7
 rRPw==
X-Gm-Message-State: AOAM530jVm5esP5lz0ZCcirg/AMFX+fgEBtkLYOHg5z9DtiX5A6VsnwC
 WWyfwurlS39ClJvRWuACn34o3Q==
X-Google-Smtp-Source: ABdhPJyKXdTRZdaW33eS+W0IooJHz/fLbQxnKFQHG78T5To3m81jjbqdvxTgllHwNEE6P7CX/B+JFA==
X-Received: by 2002:a1c:2cd7:: with SMTP id s206mr3955987wms.109.1591103758685; 
 Tue, 02 Jun 2020 06:15:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t8sm2591537wmi.46.2020.06.02.06.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 06:15:58 -0700 (PDT)
Date: Tue, 2 Jun 2020 15:15:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: pxafb: Use correct return value for
 pxafb_probe()
Message-ID: <20200602131551.GD20149@phenom.ffwll.local>
Mail-Followup-To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, linux-fbdev@vger.kernel.org,
 Xuefeng Li <lixuefeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <CGME20200525071149eucas1p271b0c64a9d44429978e2099257681b70@eucas1p2.samsung.com>
 <1590390705-22898-1-git-send-email-yangtiezhu@loongson.cn>
 <be2f65ba-e26c-fe3f-82d9-d9532db496eb@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be2f65ba-e26c-fe3f-82d9-d9532db496eb@samsung.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Xuefeng Li <lixuefeng@loongson.cn>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bart,

On Mon, Jun 01, 2020 at 03:25:25PM +0200, Bartlomiej Zolnierkiewicz wrote:
> 
> On 5/25/20 9:11 AM, Tiezhu Yang wrote:
> > When call function devm_platform_ioremap_resource(), we should use IS_ERR()
> > to check the return value and return PTR_ERR() if failed.
> > 
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> 
> Applied to drm-misc-next tree (patch should show up in v5.9), thanks.

Thanks for going through all the backlog of patches in the fbdev area
every once in a while! That kind of housekeeping work is often
underappreciated, but rather important to keep the ship going.

Cheers, Daniel

PS: Of course also holds for everyone else doing this in other areas.
fbdev simply stuck out just now catching up on mails.


> 
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> 
> > ---
> >  drivers/video/fbdev/pxafb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> > index 00b96a7..423331c 100644
> > --- a/drivers/video/fbdev/pxafb.c
> > +++ b/drivers/video/fbdev/pxafb.c
> > @@ -2305,7 +2305,7 @@ static int pxafb_probe(struct platform_device *dev)
> >  	fbi->mmio_base = devm_platform_ioremap_resource(dev, 0);
> >  	if (IS_ERR(fbi->mmio_base)) {
> >  		dev_err(&dev->dev, "failed to get I/O memory\n");
> > -		ret = -EBUSY;
> > +		ret = PTR_ERR(fbi->mmio_base);
> >  		goto failed;
> >  	}
> >  
> > 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
