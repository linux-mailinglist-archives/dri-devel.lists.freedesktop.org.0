Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE41B244B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 12:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B064D6E2D5;
	Tue, 21 Apr 2020 10:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605876E2D5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 10:48:16 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k13so14722006wrw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 03:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cnTRejc+/uL4VELD5S9dyRJFvDdbBy0cpuLmyvhwS9s=;
 b=s5V9HFggyHQI3S/Is13cCbi+DFRk9OXNv03ZCLemO22eVQnTvw6wa0I2K3rJUgzr2J
 ky0vhEj3I9/34wtK6VdeuefFZwXmOBG7RDkTXemgvZHWPoNQOmly2L3oCZdwZlOrY7xy
 flYH8gK+rzJBbcmYpN+x3f6+5XPKUBY9sDhQUkYoqxRMqTTl03w9RerMg8NyiXIa7GG1
 32Goq+0qgPVhjKMGK9bCeMiBlIhCRoMdBmq6H5At1TKTFDqeQXzYcOGK5YKVdPISJKr5
 fxoUtXZTyUUuW0LeF721zOnkCKrwZLUHVGCFXv9p84jhjCxkNdKYNtCSIGNH9R31t2lN
 RnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cnTRejc+/uL4VELD5S9dyRJFvDdbBy0cpuLmyvhwS9s=;
 b=mbmGVFmBc6TJyd2vZnNewcGA060lGllQCodk6yEgX92RVV8vV+53eXotrtkeQnvAtI
 3Inu9K/cijzUM81PkPqV1jRc8QFU16sDZaTn0THUHTVinm8nUcIO9RXUJfdGRTY6ZhnU
 Bk9mgY8uZf178h2ECwA5UbLifswIz2hgwsKaF/K9jrFmJkJOnz/KumRVznkAHSKGXUYq
 IUdMrTvJI3rAkB3VY4LAPihi5o/2sdT0/d1i4VXob3ciuizqhelxl8oO+9QKJ8dfNoTD
 TcWKizVFQ2UjTPDJXyIg/mt3xYLuOMK/UIuTQJcyDxtxd8gvJQ1Kp2zcOuDYLWUkwQnP
 ndYA==
X-Gm-Message-State: AGi0PuZ0N1n3tg/T+lh8hSgEGcEobLcY17u20KdybuRPFG33Rbrc1ESG
 hWSQSmoo9xVn7DvCoXwMPYaqrg==
X-Google-Smtp-Source: APiQypIwa9395B2krFNcNyyAdYelgCq+t4aZ7CohG2sc/JAmhxlawamK8jCMmwcNCyO2wqDtX33MEw==
X-Received: by 2002:adf:9441:: with SMTP id 59mr23118305wrq.211.1587466095006; 
 Tue, 21 Apr 2020 03:48:15 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id l4sm3222369wrv.60.2020.04.21.03.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 03:48:14 -0700 (PDT)
Date: Tue, 21 Apr 2020 11:48:12 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 5/5] backlight: led_bl: rewrite led_bl_parse_levels()
Message-ID: <20200421104812.kgsdgv2r7bu7iqhe@holly.lan>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-5-tomi.valkeinen@ti.com>
 <20200420160154.4xxv37fofx37ow7q@holly.lan>
 <2233a194-bc8e-99ba-d302-edd087a3adfa@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2233a194-bc8e-99ba-d302-edd087a3adfa@ti.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 08:52:02AM +0300, Tomi Valkeinen wrote:
> On 20/04/2020 19:01, Daniel Thompson wrote:
> > On Fri, Apr 17, 2020 at 02:33:12PM +0300, Tomi Valkeinen wrote:
> > > led_bl_parse_levels() is rather difficult to follow. Rewrite it with a
> > > more obvious code flow.
> > 
> > ... that introduces new behaviour.
> > 
> > There's a couple of new behaviours here but the one that particular
> > attracted my attention is the disregarding the "default-brightness-level" if
> > there is no table. That looks like a bug to me.
> 
> I think the previous behavior was a (minor) bug: how can there be default
> brightness level if there are no brightness levels?

I don't think this was a bug.

If there is no brightness table then backlight will adopt a 1:1 mapping
versus the underlying LED meaning the concept of default brightness
applies equally well whether or not a brightness table is supplied.


> The led-backlight.txt is
> a bit lacking (another thing to improve...) but led-backlight mimics
> pwm-backlight, and pwm-backlight.txt says
> 
> default-brightness-level: The default brightness level (index into the array
> defined by the "brightness-levels" property)

I think this implies we should improve the binding documentation!

The parenthetic text's main purpose is to make clear which scale should
be used when interpreting the default brightness. Just because the scale
is 1:1 doesn't render it meaningless.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
