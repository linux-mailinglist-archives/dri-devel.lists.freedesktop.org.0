Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB6436E947
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 13:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3343C6E20C;
	Thu, 29 Apr 2021 11:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9D86E20C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 11:00:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l2so14120678wrm.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Msus+T8FFBHOSU3k5jPbrR2jNlkFQwY/iHOUuwm2+eg=;
 b=OnOu+/rre7aumxpebhrr8WxgsQzNWoyxGoAEk5B9t+uIaTaEDQgPEjVxjKO7MHQcUE
 xjV/TWRaWTcdswqxpXkXKOxT29AEDQzRG+vtT9iD9fiSi7tvSMA7P+JsMSg5kFxUBzXa
 i06pKD6eCRosvtV47Al1sc2DtPam8lKP6hPdEC27kdHslljoZZ9iitgj5q/1regPPUC1
 kZxqo7Qz7VYdR6z11gFB8dzM6JjaGn1LtyPqpbFldKRrox9xhxMKF3pnHL0mwbL8REJ+
 lWAwgKmjPUFGwoDgBfJYi7M4QJm1oS5RMqaIzH8iP7DT0aywFo/2DiKUzXcKBexdGgmW
 kaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Msus+T8FFBHOSU3k5jPbrR2jNlkFQwY/iHOUuwm2+eg=;
 b=VYKQTnosfqcNBfHEp9HABomtUsdpr/OMA/pmSEz0J876laDcMeiH+ATRyBSQiA5dnt
 slnW04UxVp5JZBuzHmMpuv1ubl0hVUdphOYh4Spn5TYGhKkST4d7llkN2AJoEGmxQWrv
 5Onjmxrytt81qhHUYGno3CkT5ZQNp41dne53e56NlXdmCyJnOUGIgdYtgwi1H1vCA9cO
 n/TMxTjDApEKozMehG0XZSu/yoPQqiTK4m46LRgBBNIFevdsR8aLlXtMuPDi/H63cj2U
 BH6LD4jeQdjzKnM1iW/hIS7qKCz4Ulb0j6QjedplXsinyE05q1ScfqDPnp42rDbyDDXs
 flpw==
X-Gm-Message-State: AOAM531S3iJSpZSO0y1wdnMkHmtpXoQKSiZeQyTGdnEo3MTz2+enQ20I
 Ev2e5cW68t4c+iPDq67hNGGtTBnGuJOIVA==
X-Google-Smtp-Source: ABdhPJz06UIhzrefKU5bewMz7kCcoPQzkuFoCuV2vLGOj4aUW19bPQcy5imot37RLFZk6CAWiygFjg==
X-Received: by 2002:a5d:4707:: with SMTP id y7mr20951099wrq.137.1619694019145; 
 Thu, 29 Apr 2021 04:00:19 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id 18sm9806860wmo.47.2021.04.29.04.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 04:00:18 -0700 (PDT)
Date: Thu, 29 Apr 2021 12:00:16 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: pgeiem <pgeiem@protonmail.com>
Subject: Re: [led-backlight] default-brightness-level issue
Message-ID: <20210429110016.76huj54zijvhtuan@maple.lan>
References: <e_WDxLKZ_lxATxDaTMkr5jVLhIs2O0NQOSd-Inff7IMEU7i1QyX_BTldVJZgP_Yb-lgzTmpPxni_1YCQmhyGmi_ahjHbG5aCNtUngw35g0M=@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e_WDxLKZ_lxATxDaTMkr5jVLhIs2O0NQOSd-Inff7IMEU7i1QyX_BTldVJZgP_Yb-lgzTmpPxni_1YCQmhyGmi_ahjHbG5aCNtUngw35g0M=@protonmail.com>
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

On Fri, Apr 23, 2021 at 01:04:23PM +0000, pgeiem wrote:
> Dear all,
> 
> On a custom board I have a simple DPI panel. Panel's backlight is
> drive with an I2C led driver (PCA9632). led-backlight driver is sued
> to manage this as a backlight.
> 
> When using brightness-levels and default-brightness-level the
> backlight stay turned-off even if manually trying to set a different
> index value to brightness through sysfs.
> 
> I traced this issue as follow: When led_bl_update_status() is called
> the brightness value is returned from backlight_get_brightness() which
> call backlight_is_blank(). In my case backlight_is_blank() return true
> due to props.power = FB_BLANK_POWERDOWN which is != FB_BLANK_UNBLANK.
> 
> I traced why at startup props.power is FB_BLANK_POWERDOWN and found
> that in led_bl_probe() when a default brightness is set (>0)
> props.power is set to FB_BLANK_POWERDOWN which seems incorrect to me.
> 
> I made the small change below and default brightness is correctly used
> at startup.  I am not really sure this is an issue and if my change is
> correct or if I am doing something incorrect somewhere else. So I
> first would like to get your opinion on this and if correct will send
> a patch.

Makes sense. Please send this as a patch.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
