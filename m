Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 346425F3153
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 15:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E21E10E3A1;
	Mon,  3 Oct 2022 13:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A82010E3A1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 13:32:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b4so9803478wrs.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 06:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=jFcidIgnMF4iA6rkeqR14MU3xY3cSiM+6fdxby55k8E=;
 b=ZHDDn/eQFsBVSm2KaESZ4AbAM3rYIRB/WRjzyAttVH55qNisc5c/L3EuFfz8mHYy47
 boHC0sK9zR++4AIayQUVB0XfMevb+lzQ54H4MI9BqTeL1xA3ygDl5ncKzxdOg7yGacOP
 M2W2HWgFgHPqozVzRucHgF/ENvgzF1UGS4rZCuK6zXtYRI6wQoRp2mgvuoRf6wTqvrn+
 p4maafNamAugYVzFsqngi5N5NIpM4POcIuEzareo6elYCQToBL0KpcwCbCZpKMrlctNp
 p7cEkU+XGk5Kxd7TzhhbkxiruejKdaCkcvScxmIrUG27zCfqTTksxl3efL4sbFywQhFK
 SmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=jFcidIgnMF4iA6rkeqR14MU3xY3cSiM+6fdxby55k8E=;
 b=nHOEcoegxPeJCrIBm2BOo4XUX+DJGspTlmZHsffjn6huPiVNvYXSebJwWww5C8+R25
 rehqeyzLmdShgQb8j+UQ7XY+a8BjVRV9F93GzyBkzmC0+MhpXDxn3WfvDOfBZhXVf5vF
 ZUyfTNn6e66B0DIOYdIgu7C/usC6UP4h8Re1/9AlNa7WTGPt2D1V8+sVrdoUYioiTOBz
 Q9smLXUGv6rBS8efWo7lRsi+eKs6A0TSW3XKq9hYPcFsJiBfdndBndfwLb9dMJHeuSWb
 lIeUEFyPYCIiFNanRlEFG/dZ6ypHjNP06Oo7N9QGnhiOxJhxG434QMqo/3HfL/Y+MO1L
 m47A==
X-Gm-Message-State: ACrzQf0j88x9I8Qq2qZXOAxk5dYq5o5R2dhjXfT9P7DMq11wHrqRFGO1
 9H93EX25tujKv2e85/14GwK7Cg==
X-Google-Smtp-Source: AMsMyM4EavmXaTIPBSBJDcYj+OnWqmbjCSf0RehTV6iNPGMDkq+Oy7mO2MkjEGbh7WwqNdFtYUlmtw==
X-Received: by 2002:a05:6000:2c1:b0:226:e7d0:f098 with SMTP id
 o1-20020a05600002c100b00226e7d0f098mr13456352wry.578.1664803971644; 
 Mon, 03 Oct 2022 06:32:51 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 q18-20020a056000137200b0022cc7c32309sm9868663wrz.115.2022.10.03.06.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 06:32:51 -0700 (PDT)
Date: Mon, 3 Oct 2022 14:32:49 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [RFC/PATCH] backlight: hx8357: prepare to conversion to gpiod API
Message-ID: <YzrkgXyVLLer6ckn@maple.lan>
References: <YzN6A9Y20Ea1LdEz@google.com> <YzQpY2Llwsh/V4xV@maple.lan>
 <YzSTkJNAyyF7ufOu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzSTkJNAyyF7ufOu@google.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 11:33:52AM -0700, Dmitry Torokhov wrote:
> On Wed, Sep 28, 2022 at 12:00:51PM +0100, Daniel Thompson wrote:
> > On Tue, Sep 27, 2022 at 03:32:35PM -0700, Dmitry Torokhov wrote:
> > > Properties describing GPIOs should be named as "<property>-gpios" or
> > > "<property>-gpio", and that is what gpiod API expects, however the
> > > driver uses non-standard "gpios-reset" name. Let's adjust this, and also
> > > note that the reset line is active low as that is also important to
> > > gpiod API.
> >
> > No objections to the goal but...
> >
> >
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >
> > > Another option is to add another quirk into gpiolib-of.c, but we
> > > may end up with a ton of them once we convert everything away from
> > > of_get_named_gpio() to gpiod API, so I'd prefer not doing that.
> >
> > ... it is unusual to permit backwards incompatible changes to the DT
> > bindings[1]: creating "flag days" where hardware stops functioning if
> > you boot an new kernel with an old DT is a known annoyance to users.
> >
> > I usually favour quirks tables or similar[2] rather than break legacy
> > DTs. Very occasionally I accept (believable) arguments that no legacy
> > DTs actually exist but that can very difficult to verify.
> >
> > Overall I'd like to solicit views from both GPIO and DT maintainers
> > before rejecting quirks tables as a way to help smooth these sort of
> > changes (or links to ML archives if this has already been discussed).
>
> I believe I was able to convince Rob once or twice that keeping
> compatibility was not worth it (not in general but in a couple of
> concrete cases), at least while device tree bindings are part of the
> kernel. Can't find the emails though...
>
> I think we should consider several options:

I have to note that these are *non-exclusive* options


> 1. DTS/DTB is in firmware. In this case absolutely, we need to keep
> binary compatibility as we can not expect users to reflash firmware
> (there might not even be a new firmware). This situation matches what we
> have with ACPI systems where we are trying to work around issues
>
> 2. DTS is shipped with the kernel:
> 	2a. DTS is present in upstream kernel - awesome, we can patch it
> 	    as needed and have one less thing to worry about.

I don't think the presence of a DT within the kernel can be the basis
for any useful reasoning.

a. "Better" firmware projects aimed are likely to consume a DT that is
   shipped with the kernel and pin it (meaning the kernel cannot solve
   version skew problems by updating it's copies of the DT). I think
   tow-boot to be a specific example of this.

b. The fact there are are consumers of the binding shipped with the
   kernel isn't sufficient to show that *all* consumers of the binding
   are shipped with the kernel.

On other words I don't think the presence of a DT in the kernel is
especially useful to showing that neither #1 nor #3 apply.


> 	2b. DTS is not upstream. Vendor did not bother sending it. In
> 	    this case it is extremely unlikely that an upstream kernel
> 	    will work on such system out of the box, and updating the
> 	    kernel is a large engineering task where you pull down new
> 	    kernel, rework and apply non-upstream patches, rework kernel
> 	    config (new Kconfig options can be introduced, old options
> 	    can be renamed, etc). And then spend several weeks
> 	    stabilizing the system and tracking down regressions (in
> 	    general, not DTS-related ones)
>
> 3. DTS is not in firmware and not in kernel. Are there such systems?

DT overlays strike me are an example of this case. I'm particularly
thinking of daughterboard/expansion card examples here where the DT
overlay could be any several different places: firmware, an add on
boards I2C FLASH, daughterboard documentation, blog posts, etc.

That is especially relevant to this specific patch since HX8357 is found
on several widely available add-on boards.


> So my opinion is that while device trees are part of kernel code and
> have not been split into a separate project they are a fair game. If the
> change can be handled in the driver without much effort (something like
> "wakeup-source" vs "linux,wakeup" vs "linux,keypad-wakeup") - fine, we
> can just put a tiny quirk in the driver, but if we need something more
> substantial we need to think long and hard if we should implement a
> fallback and how much effort there is to maintain/test it so it does not
> bitrot.

To be honest my original thoughts were that for simple renames, a rename
quirk table shared by all renames needed to introduce libgpiod would
probably have a lower impact than all the "tiny" per-driver quirks (because
it could share code across multiple names).


> Anyway, I hope Rob, Linux and Krzysztof to chime in on this exciting
> topic once again ;)

I'm especially interested in a gpiod point of view! I have invested
quite a few characters in this thread. That is because, if accepted,
adding strings to a quirks table is much less effort for patch
submitters than having to demonstrate on a per-patch basis the due
diligence that has been undertaken to show that cases #1 and #3 do not
apply to the particular rename being sought.


Daniel.
