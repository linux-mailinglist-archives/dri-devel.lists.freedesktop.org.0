Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABEE2BA4C2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 09:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338236E88B;
	Fri, 20 Nov 2020 08:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3317D6E88B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 08:38:11 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k7so4522593plk.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 00:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QAUc4Ub5+Y3djr8Wh3AbCUd5SdWIv4X0tY5hn9hKdt8=;
 b=snNm9pC6XV1go7TTASQGweKXyAqpCr/SaohJmx+I2RzFXmitx7H/F02KJuuzXTfT1+
 cwSuCOIvlPm2GDpZOCinB+Iboyw79hJ2j7Ev39CHHihaudEtEnK2yJsuT9CcDm76qWMp
 LDEgTAsi1yoSEtlcEGwOTNR6dwc0POo5XRsV6caDp2Rhk9X71FsRLR8URL9kFRu+sCIf
 ZLL0D5IJVZ8cg858ij2Z8ofV7ebFDkjYC4+hrVDNbSD/6xUHbXa25BCrLTFz4gUEbAXE
 7tvzOrF8nuOuQXhaKzQoUqT0JZmYct1CIp3H778ndnMVDazSjFGkIMkIdGym98hYVL9b
 khaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QAUc4Ub5+Y3djr8Wh3AbCUd5SdWIv4X0tY5hn9hKdt8=;
 b=IZOzFZmH8nTIvQG2gYcxThxQERWy7dT1vx/yd4yoN9tPYcqq/MDD//ARLj2jzXTiLa
 AA7TuBPXNQwtauh2VQhpQ6ai+mQWON1+hhRfduiIH7WA5coYKEHKyJRuSgx6xkFdPg7Q
 +i1TKTHCQJF+pA1q4M2qRt/3H4+F8CKQsYhePl3dBlvVFOxBmX3de2sFtfDgIH4fLTz6
 3JV3n/A5iuheB8n2sTB4jhIJNguER7b2zql/499xDSxL15PwaNO8Vfiv0kwVgIi/UB/5
 pc7gyNKWi3dCa+I16FqgiLPFavspOPj3ZraOmja//qtXpW1CfYrkf/RPKXzSGrLhbu2W
 /viQ==
X-Gm-Message-State: AOAM532alsW/MTQJDy0jf7qLcyXE9IBE98jZKJKcDRoxQYDxxhe5L0GV
 gIbTWPVbkU997NNBWgMAVw==
X-Google-Smtp-Source: ABdhPJwlu2LHYylFDBD6KVOQDJWBCCnjVfbH4aRAQvBloxHrVnSqnSMTzRPOEsTTU1UbmLD35qMokg==
X-Received: by 2002:a17:902:244:b029:d6:c451:8566 with SMTP id
 62-20020a1709020244b02900d6c4518566mr12441583plc.46.1605861490749; 
 Fri, 20 Nov 2020 00:38:10 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id w18sm2715971pfi.216.2020.11.20.00.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 00:38:10 -0800 (PST)
Date: Fri, 20 Nov 2020 03:37:39 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 0/5] console: Miscellaneous clean-ups, do not use
 FNTCHARCNT() in fbcon.c
Message-ID: <20201120073245.GA24568@PWN>
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
 <20201113211633.GY401619@phenom.ffwll.local>
 <X68NFzaAuImemnqh@kroah.com> <20201114081021.GA11811@PWN>
 <X6/K/S9V7rj2hI5p@kroah.com> <X6/L/lE2pA7csBwd@kroah.com>
 <20201119083257.GA9468@PWN>
 <CAKMK7uF_AOrfTDVZwmxn_C-5sTBDu_v9KGH07wO5hTa98Z8Ucg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uF_AOrfTDVZwmxn_C-5sTBDu_v9KGH07wO5hTa98Z8Ucg@mail.gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 04:10:57PM +0100, Daniel Vetter wrote:
> On Thu, Nov 19, 2020 at 9:33 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > setfont seems to work fine, I tried Georgian-Fixed16 (256 chars) and
> > Uni2-VGA16 (512 chars) under /usr/share/consolefonts/ in my Ubuntu box,
> > including setting all consoles to the same font:
> >
> > for i in {1..6}; do
> >         sudo setfont -C /dev/tty${i} /usr/share/consolefonts/Georgian-Fixed16.psf.gz
> > done
> >
> > Font rotation also seems to work fine:
> >
> > for i in {1..4}; do
> >         echo $i | sudo tee /sys/class/graphics/fbcon/rotate
> >         sleep 1
> > done
> 
> Thanks a lot for checking all this.

Not a problem, watching my console rotating was fun :)

> > One last thing I can think of is tile blitting, but I don't have the
> > hardware (e.g. a Matrox G400 card, see FB_TILEBLITTING in
> > drivers/video/fbdev/Kconfig) at hand, nor did I figure out how to
> > simulate it after searching for a while.  However based on the other
> > tests above I believe vc->vc_font.charcount is set properly.
> 
> tbh I'll just go ahead and delete it if it's broken :-)
> 
> Userspace we have to keep working (and there's actually people
> creating new products on top of drm display drivers using fbdev
> emulation and /dev/fb/0 interface!), but kernel internal stuff like
> fbcon acceleration we can trim pretty aggressively I think.

Ah, I see, I'll leave it be, then.

Thanks,
Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
