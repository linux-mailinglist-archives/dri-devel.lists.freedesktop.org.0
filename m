Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7968415D37E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692656EB52;
	Fri, 14 Feb 2020 08:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A298825B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 18:11:14 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y6so7704505lji.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 10:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EuxVXqo0aLZOHDOucp4vbQndf0tOU7++wA3AtEmGBpw=;
 b=fAaIg/8ux70EQiQpgn3mUB6nFui/A2paoKIJeaWZbLEdTL5kpOBkJBUFHWxQFKCXAR
 hdga3DG2R/MFIRy7zFfSp4ZQKb3pvJjXw9Qcx+wRmcmwNZkXJIt/MConhjPzsr4Z4MNy
 dWu0arsyksu0AK7JqiqRgO11JmtdupXzDXpHAqpQABRIBaMXk5VdYgl43dB59tVRtRXj
 4uKHCwzDx4ufdChhKAmEqsFiZULQvn+btVHIwKwNlfcU6z642R4+mA0uyvG3LGNjigyi
 MIXAJ86LhHhWEsROWucZcslFhq4C2TaNszH9lD8VwEyrKQtR1tGumGwpZNHRzWNX4grS
 My/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EuxVXqo0aLZOHDOucp4vbQndf0tOU7++wA3AtEmGBpw=;
 b=e0K3App0ThjY/TZFwzPdJz/4HkpFRWCumdwtEzPotKe3Ks3JgDEStJWa/a3fLZcZLZ
 w5qBcjsjtlaRwh3DEqvLtqPr6wltsb5fhbah8DIXmnfBP0rwEy5RGe8UKbCS1nTKzrih
 TWfJg0qFCMTl98pKP4V56F8Zvl01uDBdvpSKDFpO7jzFpPzeEK6zipLDNI2sTzAwllcC
 WVBM5O3poDl6Y+Kqf8RmijrGKY4qoiaEkO76cjZi1n1yLSzVmAA7dSv6e8onpEoBcH5H
 p7Mo/nMkL1YmO9I8el2hVJnEUF+Nkl/6/dNmqpIi6BcSNC81oJ8s+A+g64G4hXPxjcio
 Cihw==
X-Gm-Message-State: APjAAAW266Jm31GFdIrMw+nJ6ELck5NhU/3ibyRk9D2YuByymBcoK7xN
 73A9PKexF2feXWGnBv+iGaI=
X-Google-Smtp-Source: APXvYqzzT+FLUGY7cXzPsygITqUHZQgOYAok8PALBHATY6k8I9bEwK7EFmVCMYTPxGMkzKG+gNRuhA==
X-Received: by 2002:a2e:9157:: with SMTP id q23mr11857429ljg.196.1581617472996; 
 Thu, 13 Feb 2020 10:11:12 -0800 (PST)
Received: from kedthinkpad ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id d24sm1655804lfl.58.2020.02.13.10.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 10:11:12 -0800 (PST)
Date: Thu, 13 Feb 2020 20:11:10 +0200
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/1] Support LVDS output on Allwinner A20
Message-ID: <20200213181110.GA25367@kedthinkpad>
References: <20200210195633.GA21832@kedthinkpad>
 <20200211072004.46tbqixn5ftilxae@gilmour.lan>
 <20200211204828.GA4361@kedthinkpad>
 <20200212125345.j6e3txfjqekuxh2s@gilmour.lan>
 <20200212224653.GA19494@kedthinkpad>
 <20200213092433.sc2rs7el63mwvf3y@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213092433.sc2rs7el63mwvf3y@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 10:24:33AM +0100, Maxime Ripard wrote:
> > > do you have a board when you have been able to test it?
> >
> > Yes, I have the hardware (Cubieboard 2) at hand, but I cannot change the
> > any physical connections on it. FWIW, it is https://openvario.org, the
> > device we are (painfully) trying to upgrade from old kernel-3.4 with
> > proprietary mali drivers to contemporary software.
> 
> What painpoints do you have?

So, even though proprietary mali drivers worked well for us, they seem
to hold us back to old kernel-3.4, and it started to get harder to avoid
various compatibility issues with newer software. Since there seemed to
be a good progress with OSS lima driver lately, we decided to try to
replace mali with lima. And that naturally pulled to switch to DRM/KMS.

The first painpoint is this LVDS support problem: after a week of trial
and error, I discovered that support was simply not there. But it seemed
that not that much was actually missing and after couple of evenings
deep into debugging, here we are.

Another one is the screen rotation: the device is installed into the
glider' instrument panel, and some pilots prefer it in portrait
orientation.  Under old mali setup, all that (seemingly) was required
was setting "fbcon=rotate:n" boot arg, and both linux console and
graphical app (https://xcsoar.org/) rotated "automagically". With new
DRM/KMS setup, only console is rotated, all graphical apps seem to see
the screen in its "natural" landscape orientation. Do you know if there
is any way to leverage DMS/KMS infrastructure to make screen appear
rotated for userspace apps (writing to /sys/class/graphics/fb0/rotate
didn't work)?  There's of course a plan B to teach the app to rotate its
output, but that leads to problem number 3.

And the 3rd outstanding problem is that app doesn't really work under
lima module and lima mesa driver. It starts, but renders a black window.
I haven't dug deeply into this yet, but it is possible that some opengl
API isn't supported in OSS drivers yet (even though app only renders 2d
graphics).

Hopefully that wasn't too much complaining for you :) If you have any
insight on possible causes or attack vectors on any of these, that would
help a lot. Also, please feel free to correct any of false assumptions I
make above, I'm happy to learn more about this.


-- 
Andrey Lebedev aka -.- . -.. -.. . .-.
Software engineer
Homepage: http://lebedev.lt/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
