Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A884329DD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 00:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44BE6EA78;
	Mon, 18 Oct 2021 22:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669006EA78
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 22:49:53 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id 77so16823282qkh.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 15:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bvrWgKEuwxW/WqAiRLeWwR9Aac9SzlLC9F/yKT1u3P8=;
 b=qheCn2692fQk1Ju79VEFKjyPaH84HNFqjt0IFzpussCnIwIw51p+GKC2SlaV8uLdb5
 gw7/avrIM3wOpHkz2tkTVXbXO65/8S/7enguvIYbh9xeLP2FOwmA4jXM5KsXyyl6qQFF
 I/CUeNAL7eFqeMktnhkb22CRUhkfBfdZMLKVYOERweyQTRW+jXuz0DOClqK8Nf84IFXD
 YXsxvHDz8xM3nFWFF7CBFFLiS5YYyPU2L6h9mZO/BClZ6c6nCby6GaHFC1o1tBEDWaZZ
 nc0LQt7lB0SUwvV7EBh96xAtUF3lzzvXZmOsXdrV54Vl348qxySuT8/KXIFpTKsBdvfU
 mr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bvrWgKEuwxW/WqAiRLeWwR9Aac9SzlLC9F/yKT1u3P8=;
 b=dqrsWANMUEXuRc+hi0pAVq2V95rpzBqJS8ZpOLf1K6Jf1r6Gjh6h1Krd7cc2rj6xcQ
 drKYMGnxpd7ypu55/RpFMzpq2MPMZTiMkd9H/Dg/r/vwuzg3GDahAJvlG80ZtabPYo+o
 MJXfPxgzU1GS7xAgZ+jWTG4wAStPaJRTgS5H7mly2fiIxMqmnH6bZMR0EVUo6xc8FO0b
 85d2I+PjmSkfu9w9vW8JIXlYdNjVTcfTVnKs/bNs+dRlkygBhS+cReVcVAWU3r7Vkn5r
 KF9POyMmnUALm8ftUEAR9pxYeXOJ4nhYHwxA80eFbCe8iRvtHg3TR5yVZsBJuZSHjxG5
 G9rw==
X-Gm-Message-State: AOAM533dyI6UC7aX9N7lMHb5RqEFGspySta2wtNZKnd6RN+rvJigaJ/a
 33Zo/2EZS5ztRsk92/dxT2M=
X-Google-Smtp-Source: ABdhPJz7zu6maU2w/MTtsq3vEKLpGQey9DAKwNEZkDN1u5XmzybmcAi4aVhRhJxW8S2RCteq+XXHQA==
X-Received: by 2002:a37:b06:: with SMTP id 6mr24625526qkl.352.1634597392453;
 Mon, 18 Oct 2021 15:49:52 -0700 (PDT)
Received: from ubuntu-mate-laptop.localnet ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id j23sm6682864qtr.23.2021.10.18.15.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 15:49:51 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/panel/tianma-tl057fvxp01: add panel for Motorola
 Moto G6
Date: Mon, 18 Oct 2021 18:49:50 -0400
Message-ID: <4000775.iezT5iszD9@ubuntu-mate-laptop>
In-Reply-To: <YWxeUd6PALatP7z/@ravnborg.org>
References: <20210808200854.187648-1-julianbraha@gmail.com>
 <YWxeUd6PALatP7z/@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Sunday, October 17, 2021 1:33:05 PM EDT Sam Ravnborg wrote:
> Hi Julian,
> 
> On Sun, Aug 08, 2021 at 04:08:54PM -0400, Julian Braha wrote:
> > This is a 5.7" 2160x1080 panel found on the Motorola Moto G6.
> > There may be other smartphones using it, as well.
> > 
> > Signed-off-by: Julian Braha <julianbraha@gmail.com>
> 
> Sorry for coming back so late. Driver looks good and is almost
> ready to apply. One detail you need to fix, see below.
> 
> 	Sam
> 
> > ---
> > +
> > +static const struct of_device_id tianma_tl057fvxp01_of_match[] = {
> > +	{ .compatible = "tianma,tl057fvxp01" },
> > +	{ /* sentinel */ }
> > +};
> The compatible needs to be documented before I can include the driver in
> the kernel. Please add a patch that document the compatible - maybe as a
> new binding file but preferably as part of one of the existing binding
> files.
> 
> 	Sam
> 

Hi Sam,

Thanks for your feedback! I've submitted a second patch for the bindings.

- Julian Braha


