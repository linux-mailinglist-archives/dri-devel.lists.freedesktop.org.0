Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B00736EA03
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D47C6EE74;
	Thu, 29 Apr 2021 12:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F330A6EE74
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:07:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a4so66689905wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DlVKMT7L//8Ys/KEtlICcv3pJE51rFih7kUJSYAFHl8=;
 b=V4dCmkFDhaf76olIdnOPcJ5mRgpWWQQAVMb7jh5Tr9h61KEIFH7++q4rGS3BHnqYp4
 aZU0QjgMe8277oaRMyQz4Jg6MhXYl/u3lppuXYMk86F0gKseG1m9DOtbbvUIXWhAlHzW
 8NTsKwOm/abwlnOqzts+9Az69xyssBaCffPjRemNVltfp0PsSu2mYe1MVucHS/Is7P66
 JWFICPN0kuU9rXB5j3kyDveRJLyoipq4piQU8yTaXawVJMmzF7a8AezMy3HZvXnENuiK
 ExsqnTGCmwqDZpuqDOlied5U6OFvJ2B8YadGfVBj+Bn9NC73ZrsXGCd9ObkGhxeMdvSO
 UTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DlVKMT7L//8Ys/KEtlICcv3pJE51rFih7kUJSYAFHl8=;
 b=kGzOcdu3hgblZb+ujVHDODghechJZEADBHBLsfx5fr0a55wsqphFi5oGYuBd7Iy+dO
 /gBo883YIt2/FiWcQYw+z2Gzrk0u6cMosvjcBrg4CLpXZAdyaL8/ZyO9lsftOM7EJCOQ
 OnaOf8uUz/t3LCzlUVv8xKuxG/q1XWJ5s9c+9xvaN33wXRGAHFveFb/WSsP1PelYGspB
 hLlopymrWUbK/nDSH8YpTreZi/XGvMtCXU33+fpqyZiJxR/QBL3dyssgqHvEISlIjoCs
 KEtn2VgNoJpLFEdD9r6zB43hkUYSvI97snHMOL/L0hMEQX4xmYcRuRp1qmhgYoOd5YBs
 VIwQ==
X-Gm-Message-State: AOAM532kPg4K5I0nY35VmNJ8cZJyJoJLrEeq/d9aPo7o6ajHkAfeHHk1
 qidWsppRFcVcv/sfhUWbmcKs3cvV/ywjeQ==
X-Google-Smtp-Source: ABdhPJzA67Z/Dpq+Vr83ArKnLvhb0xEthGXH5ZaguZGouzWtgIQj/WvI8TN4jDe6vuz1Qr2v8zUy8Q==
X-Received: by 2002:adf:e40c:: with SMTP id g12mr6151300wrm.11.1619698049558; 
 Thu, 29 Apr 2021 05:07:29 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id c16sm4626718wrt.83.2021.04.29.05.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:07:28 -0700 (PDT)
Date: Thu, 29 Apr 2021 13:07:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: pgeiem <pgeiem@protonmail.com>
Subject: Re: [led-backlight] default-brightness-level issue
Message-ID: <20210429120727.vdei5rt6avfo6xxp@maple.lan>
References: <e_WDxLKZ_lxATxDaTMkr5jVLhIs2O0NQOSd-Inff7IMEU7i1QyX_BTldVJZgP_Yb-lgzTmpPxni_1YCQmhyGmi_ahjHbG5aCNtUngw35g0M=@protonmail.com>
 <20210429110016.76huj54zijvhtuan@maple.lan>
 <iOsaGQwBS7Kf3OTapGfH6piU_e_SL0O_FyccdxfGlPCCVF6oHrjk4pMrqAbMA7S8DjTPKs47t8e4C_dq5fjDT5rasK5GSkFTWpW5j9saxTE=@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <iOsaGQwBS7Kf3OTapGfH6piU_e_SL0O_FyccdxfGlPCCVF6oHrjk4pMrqAbMA7S8DjTPKs47t8e4C_dq5fjDT5rasK5GSkFTWpW5j9saxTE=@protonmail.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 11:31:20AM +0000, pgeiem wrote:
> On Thursday, April 29, 2021 1:00 PM, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> 
> > On Fri, Apr 23, 2021 at 01:04:23PM +0000, pgeiem wrote:
> >
> > > Dear all,
> > > On a custom board I have a simple DPI panel. Panel's backlight is
> > > drive with an I2C led driver (PCA9632). led-backlight driver is sued
> > > to manage this as a backlight.
> > > When using brightness-levels and default-brightness-level the
> > > backlight stay turned-off even if manually trying to set a different
> > > index value to brightness through sysfs.
> > > I traced this issue as follow: When led_bl_update_status() is called
> > > the brightness value is returned from backlight_get_brightness() which
> > > call backlight_is_blank(). In my case backlight_is_blank() return true
> > > due to props.power = FB_BLANK_POWERDOWN which is != FB_BLANK_UNBLANK.
> > > I traced why at startup props.power is FB_BLANK_POWERDOWN and found
> > > that in led_bl_probe() when a default brightness is set (>0)
> > > props.power is set to FB_BLANK_POWERDOWN which seems incorrect to me.
> > > I made the small change below and default brightness is correctly used
> > > at startup. I am not really sure this is an issue and if my change is
> > > correct or if I am doing something incorrect somewhere else. So I
> > > first would like to get your opinion on this and if correct will send
> > > a patch.
> >
> > Makes sense. Please send this as a patch.
> >
> > Daniel.
> 
> I finally believe this was correct.
> 
> A link between the panel and the backlight was missing in dts. With this link the backlight is turned on (props.power = FB_BLANK_UNBLANK) from drm_panel_enable function after enabling the panel.
> 
> Let me know if you disagree and still believe I should send the patch.

The original logic is definitely wrong.

However that doesn't mean the driver will be fully correct after fixing
since it does look like is missing the logic found in other similar
drivers (pwm-bl.c and gpio_backlight.c) to handle the various different
cases w.r.t. handover from active backlight by the bootloader.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
