Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727E82B8D7B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1270A6E5A4;
	Thu, 19 Nov 2020 08:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702736E581
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 08:33:08 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w4so3550149pgg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 00:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AWtaE3tXlX6KkF6SbACxjxmzIgZO2jw7wJIis4kxiFE=;
 b=erzuebpFnP6Gt2cVg+ear4rCVwZ7bV1TMmBphb8RKyD3jrIiAaNEYF/RsgesHqObP0
 He6fyxoxyGGmeUZVMu55DzEB7jcra6cRQnvkfN30U6IDH2AVMoZ3r4zz+yw4phczW/Jg
 5DjouAw+3mtdOjcmUn00gTai5TFmLOOALsNQjAMBdj0hv+RDsdHAH6LIu1vdCvwZuRvk
 ABxoG8DSqgG6cKZwCREawmItYpU4ofbFmo8XNIFaxMPJZ2Bz3RTZj4T3PbEz2A4i54tL
 vDc5j2p+cebrIwdKl0TAv9l5C1jvtPY8WU0arSK9KRm8+cU0n/85YEKbOOyC1USDLDGC
 ff+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AWtaE3tXlX6KkF6SbACxjxmzIgZO2jw7wJIis4kxiFE=;
 b=CY8wVqIzM5dIkJCYVGjtV4tmzzd67o8XYHwDXET5IsrWD7LWOmFsTBA8UqxhWyNq8r
 AOg1pdlDXi90u7o67BPlLsWNE2R3guG3oKDimqTke5HLF7lY0qNLvjZrH3VlGS3//p4B
 ui8m/nhsKK80eYiNreqh7iVc2lWbNKYauekNHvIX5iarwyyL2Sagp1zVH8Y4WC/Ms/wb
 8untE3gKF46TFSXKEmr4yAH61jqi/Jxe47SjvbAC4H9V+i1C8bI0SkezGNcIu8H63V74
 D+qCFSY/GR2UbVBj8uXGF1T29jE6qcebvHdOVEB5ryNLu97zqLmGVLK2U6/GBas4U6ia
 3F8g==
X-Gm-Message-State: AOAM5338We/KYZW3OvPMKRguGdrS2c6nM2m5CzdG6eEhIuIafY9yD6K/
 ErfuoFF4+PNH3topxYgWPA==
X-Google-Smtp-Source: ABdhPJw2SvWZ1XI9W5K8nt/BB7nN8YTnKz+xeBgYnSGTG7BKTqQH4kXyF10cnpjO+13wTWBoHwQsNw==
X-Received: by 2002:a63:c745:: with SMTP id v5mr11584885pgg.389.1605774787959; 
 Thu, 19 Nov 2020 00:33:07 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id z5sm1626030pgi.27.2020.11.19.00.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 00:33:07 -0800 (PST)
Date: Thu, 19 Nov 2020 03:32:57 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 0/5] console: Miscellaneous clean-ups, do not use
 FNTCHARCNT() in fbcon.c
Message-ID: <20201119083257.GA9468@PWN>
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
 <20201113211633.GY401619@phenom.ffwll.local>
 <X68NFzaAuImemnqh@kroah.com> <20201114081021.GA11811@PWN>
 <X6/K/S9V7rj2hI5p@kroah.com> <X6/L/lE2pA7csBwd@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X6/L/lE2pA7csBwd@kroah.com>
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
Cc: linux-fbdev@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 01:22:22PM +0100, Greg Kroah-Hartman wrote:
> Ah, here's a hint:
> 	https://wiki.archlinux.org/index.php/Linux_console#Fonts
> 
> The setfont tool should help you out here.

setfont seems to work fine, I tried Georgian-Fixed16 (256 chars) and
Uni2-VGA16 (512 chars) under /usr/share/consolefonts/ in my Ubuntu box,
including setting all consoles to the same font:

for i in {1..6}; do
        sudo setfont -C /dev/tty${i} /usr/share/consolefonts/Georgian-Fixed16.psf.gz
done

Font rotation also seems to work fine:

for i in {1..4}; do
        echo $i | sudo tee /sys/class/graphics/fbcon/rotate
        sleep 1
done

One last thing I can think of is tile blitting, but I don't have the
hardware (e.g. a Matrox G400 card, see FB_TILEBLITTING in
drivers/video/fbdev/Kconfig) at hand, nor did I figure out how to
simulate it after searching for a while.  However based on the other
tests above I believe vc->vc_font.charcount is set properly.

Thanks,
Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
