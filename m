Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F899307116
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02C26E93D;
	Thu, 28 Jan 2021 08:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDC989F07
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 13:44:40 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id e19so1215676pfh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 05:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=F4yViBKvPcHMiCuhvR3TKpgz0BdKruFE9Fx6bKd/1bM=;
 b=CHLUaMBJaZD75tNWX0pYhho4I1Ko/XOezyGiwjHJRD/y5tG2WxtAiMTZDIKNoyON/r
 wPegeIsTtHmap5BNZQT+U1QmzHHRcX5aFviOx7ua7vjrKB00GOxcvjUXqPUavNB8V6Nq
 LjHvjw7Vxi8WHqE6hPOtkf6WyeIy+w3yuNUN3iR7I7gZSfW2hu4DPKLmMFw+j3fAzlg6
 exSldKNhyQAM8m/FYYyozDmrmrcSpHZRxsZsRTYC6MZBVyRex63xAISRGIZ5UOWWC+OD
 bcxX0CBfEnwKszKuCkvDCNwIRvMP7S2qs/C7XRa/yHQU2c+ZnLAjdvtgRIrEFCowM+eR
 5oHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=F4yViBKvPcHMiCuhvR3TKpgz0BdKruFE9Fx6bKd/1bM=;
 b=pWu1qZTi4RknF6hTgtN2aZrF+7CtmY2sU70EebgD4crfBJKt38LvlSajnxlu75PjA8
 M9VLvLM021mVUdYj6GR0/aJnrHHwLiFyuD4tKvIstOlZ0pfVsMggxHb07XomfqyexjY+
 +4DXMpkwJ2Eqm8rrmAMXUGRyi13SSv93pAnMdjY4l34j/h8xP0/qVnOvmfQNB0dLTqAN
 itfyBHjNP8am8FAwtVfAIWsKy9u8FwkcJpP8x3MwSJooqMmtgwXzFH0dARXupm+xCO4F
 x0NdEU5hI0G1q49AoXuwGxvd9qC1qV/1M4h7DvmAmu8XjAfqCouDJLIOrg6b1m4xSEVv
 TTaw==
X-Gm-Message-State: AOAM5315Rpt6sls80E7AeEC9hf7jZtAhd8XT25DyI/jXNU1thCfIjmJl
 oQzjt0U4dgQduiBXMXQWbwc=
X-Google-Smtp-Source: ABdhPJw7p+CSCxPecQ050cCLDkisjTb/wNpT/CIqIzh6zq8+qdjHeGwEONhLztOwMBpq/aL32wCVyA==
X-Received: by 2002:a63:450d:: with SMTP id s13mr11086715pga.443.1611755079856; 
 Wed, 27 Jan 2021 05:44:39 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id o14sm2986305pgr.44.2021.01.27.05.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 05:44:39 -0800 (PST)
Date: Wed, 27 Jan 2021 21:44:33 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v9] staging: fbtft: add tearing signal detect
Message-ID: <20210127214433.00005c15@gmail.com>
In-Reply-To: <YBFmg3yHlORg1mhf@kroah.com>
References: <1611752257-150851-1-git-send-email-zhangxuezhi3@gmail.com>
 <YBFmg3yHlORg1mhf@kroah.com>
Organization: Tyzmig-ryrjum-8kedto
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 mh12gx2825@gmail.com, oliver.graute@kococonnector.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sbrivio@redhat.com, colin.king@canonical.com, zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jan 2021 14:11:31 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Jan 27, 2021 at 08:57:37PM +0800, Carlis wrote:
> > From: zhangxuezhi <zhangxuezhi1@yulong.com>
> > 
> > For st7789v ic,add tearing signal detect to avoid screen tearing  
> 
> I need a much better changelog description here please.
> 
> > 
> > Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>
> > ---
> > v9: change pr_* to dev_*
> > ---  
> 
> What changed in all of your previous versions?  All of them should be
> listed here, right?
> 
> 
> 
> >  drivers/staging/fbtft/fb_st7789v.c | 132
> > ++++++++++++++++++++++++++++++++++++- drivers/staging/fbtft/fbtft.h
> >      |   1 + 2 files changed, 132 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/fbtft/fb_st7789v.c
> > b/drivers/staging/fbtft/fb_st7789v.c index 3a280cc..9aa2f36 100644
> > --- a/drivers/staging/fbtft/fb_st7789v.c
> > +++ b/drivers/staging/fbtft/fb_st7789v.c
> > @@ -9,9 +9,12 @@
> >  #include <linux/delay.h>
> >  #include <linux/init.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mutex.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/completion.h>
> >  #include <linux/module.h>
> >  #include <video/mipi_display.h>
> > -
> > +#include <linux/gpio/consumer.h>
> >  #include "fbtft.h"
> >  
> >  #define DRVNAME "fb_st7789v"
> > @@ -66,6 +69,32 @@ enum st7789v_command {
> >  #define MADCTL_MX BIT(6) /* bitmask for column address order */
> >  #define MADCTL_MY BIT(7) /* bitmask for page address order */
> >  
> > +#define SPI_PANEL_TE_TIMEOUT	400  
> 
> What is the units here?  Where did this value come from?

hi,the units is msecs,and i got this value from a qcom mdp spi
drivers,and i will add the notes you need in the patch v10
> 
> > +static struct mutex te_mutex;/*mutex for tearing line*/  
> 
> Does that look correct???
> 
> thanks,
> 
> greg k-h

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
