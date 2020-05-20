Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EF11DAC51
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD176E5A3;
	Wed, 20 May 2020 07:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70086E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:11:39 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id w19so835725ply.11
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 22:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/m6niOd1NL5NVGvyIcf8eZtiO7xInyuSa2CKuSwQQVE=;
 b=rIL2Lv/gm1aCjMYo+nB9G6CfhwFNR1U0F9OWcdjoQyTACOP0cRfWiEDLIB/9cT+Qf1
 RTJcfULUTufKreOyLZC58J7W9ze0mUIkJWeR/qle61XTP8ryw8uAiFmQV4QRgbtYSEBZ
 sCYpbT1gb5pHIUSLdbWKD2KT6t6ugXMjfASiGDzzlmKudPekPRTkt/D0kcpcO59zc2LH
 t4pX1x7GByUbosJWsQiEdUmKvFpsvedHoKC1Ym98Zu0MzlbQkH62pGcNqKA9N90lNB8G
 cB96zR9Bvg/gLL8ntuCXNhgx5U1gViyyuJGOMDAmu1qFWAf6GZoSPh/SH5+wBpNE85pw
 XMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/m6niOd1NL5NVGvyIcf8eZtiO7xInyuSa2CKuSwQQVE=;
 b=UNeDAJAl4V5WlbSDIZ93UwarROyHBAoPSEGtq7/Lsk5Da+D/A8wgJLVxC9un5/0pPr
 yriURyCdBhCQ3xLD98PNSDzOaIz2BYcgoMau+QrsPxlbVTzN8Fu3qjIeIx8KG6aTBQT4
 vaeKm87OXicO61RstxWlMlvaBhjuyMhBn2KSB1utFrESfeGIpEBOHdhuhnt0xXZs6hw7
 54JKpnX7bFS0PsKhIdMyHvhfkgg86d6M5JMFBG1ZosGSH9Et1Utm4/Pf7+gKJQ+3emED
 sRYfTh6UYmMT73AxbbOKXK64jtopSUH33au8dbYHndNQmvPmtwmJRL9QA/pW8jOlvNNV
 PLeA==
X-Gm-Message-State: AOAM532XI2LSevuBrxGUb0SsEnp/ExV/Ag9vfutziC7OHJVZj2DClf3A
 ERnbfvalAIt1XfoIGPSoovoedQ==
X-Google-Smtp-Source: ABdhPJxRIht5NenwbR7QLDBX/oTQxZ44KG81mQ0A140ugddejatOzrcwLqInWuhbQgy11IV/YtgYtg==
X-Received: by 2002:a17:902:ac97:: with SMTP id
 h23mr2858616plr.89.1589951499124; 
 Tue, 19 May 2020 22:11:39 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id k65sm966516pfd.156.2020.05.19.22.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 22:11:38 -0700 (PDT)
Date: Tue, 19 May 2020 22:11:35 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
Message-ID: <20200520051135.GA11847@yoga>
References: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
 <20200520045900.GA2105777@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520045900.GA2105777@kroah.com>
X-Mailman-Approved-At: Wed, 20 May 2020 07:34:33 +0000
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
Cc: Olof Johansson <olof.johansson@gmail.com>, wufan@codeaurora.org,
 Arnd Bergmann <arnd@arndb.de>, Jeffrey Hugo <jhugo@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, pratanan@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@mellanox.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 19 May 21:59 PDT 2020, Greg Kroah-Hartman wrote:

> On Tue, May 19, 2020 at 10:41:15PM +0200, Daniel Vetter wrote:
> > > Ok, that's a decision you are going to have to push upward on, as we
> > > really can't take this without a working, open, userspace.
> > 
> > Uh wut.
> > 
> > So the merge criteria for drivers/accel (atm still drivers/misc but I
> > thought that was interim until more drivers showed up) isn't actually
> > "totally-not-a-gpu accel driver without open source userspace".
> > 
> > Instead it's "totally-not-a-gpu accel driver without open source
> > userspace" _and_ you have to be best buddies with Greg. Or at least
> > not be on the naughty company list. Since for habanalabs all you
> > wanted is a few test cases to exercise the ioctls. Not the entire
> > userspace.
> 
> Habanalabs now has their full library opensourced that their tools use
> directly, so that's not an argument anymore.
> 
> My primary point here is the copyright owner of this code, because of
> that, I'm not going to objet to allowing this to be merged without open
> userspace code.
> 

So because it's copyright Linux Foundation you are going to accept it
without user space, after all?

Regards,
Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
