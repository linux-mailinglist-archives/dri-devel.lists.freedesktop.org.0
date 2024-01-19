Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E0832EF7
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 19:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7300010E1D7;
	Fri, 19 Jan 2024 18:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9B610E1D7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 18:34:38 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-29065efa06fso23200a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 10:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705689217; x=1706294017; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zkKnoesKahkqO2ThUINQtzJ7lHkLPPLje48Y8+4TcIw=;
 b=NHMsWmMXllQk04ayyrRsLDyj9PFs5jPc71EGr4HTKleMeycLDKEdbO+EurfOxsAwuh
 AhKMoojNv5TCzGjO+XhkxpeaFR9F00PSHG1O45Ohj/6YZEACTAu1GbajWgQy20hDuCSa
 U8PXsanYk7I25M9XYnELmAjRBvl7AUOJWwvsJ3LzJdu1Er9iG7jhbFd9X30GgkqKICVW
 yT9PZ6aKsoAOA52IaK+o7MD0QLAF95ScOFaCul4CO0DdfKGCchpUd/3IGP/RCmFypX1R
 MmdMS8W/UtXmLmjH5SjBFTJAcsxvlecas7RBBpvkHSPf8cJKHy+sQOABBOJ4rIWmMQs5
 URUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705689217; x=1706294017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zkKnoesKahkqO2ThUINQtzJ7lHkLPPLje48Y8+4TcIw=;
 b=TAvlm2eQZO+0m3akxBmrf/zEqp//znLXxRRvuFn0zvFT9hUO5KbgLYVl6X8INTHJVc
 6EpauvXkZXhyX2KYDB87UsrH/vvfvQklddZfJwmhugUBPasT42WwtDP0NuJBgWOMLxJw
 edIeU3Jq9oPyhqEuWdTTUuDWx1hHjquyswCk3sEPyVyHMeuJrTTG44dJEwpb6G0kfQxf
 pTGWD5HYHgGAVfUNnc4yq+epFwwrNU5DK8UR5Z9n0FYFEGhibnb1MP7Kmjf8Z7UQnEs+
 65DKih34Lu+GI0tck6glVsAa7W4cnw0P/PKzW2ltfp+M9J3UOWNFkfZOvIgOL4aEIPvt
 aXJA==
X-Gm-Message-State: AOJu0YwOgWyQCZg6ijphCTQkjbME5YCwQquOCyzV8lkcIhn3dkMTt6LM
 kRp/b/ZOwzYPTh7+WGtvG89LBF+zxx0dpQyhaTDhSd58BWzyX3A7
X-Google-Smtp-Source: AGHT+IE3J3mk+o/jaEbN4lFdflrsPSNaC31PQjCmi5eiwC0XemD3b7u1le1I/qswQjFVSQuib1m0zA==
X-Received: by 2002:a17:90a:c7cb:b0:290:1426:86fc with SMTP id
 gf11-20020a17090ac7cb00b00290142686fcmr182985pjb.89.1705689217443; 
 Fri, 19 Jan 2024 10:33:37 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:97b4:2663:16e0:cf81])
 by smtp.gmail.com with ESMTPSA id
 sy14-20020a17090b2d0e00b0029005525d76sm4412592pjb.16.2024.01.19.10.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 10:33:37 -0800 (PST)
Date: Fri, 19 Jan 2024 10:33:34 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Message-ID: <ZarAfg2_5ocfKAWo@google.com>
References: <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
 <87bk9hppee.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk9hppee.fsf@intel.com>
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
Cc: Lee Jones <lee@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Werner Sembach <wse@tuxedocomputers.com>, Jelle van der Waa <jelle@vdwaa.nl>,
 Hans de Goede <hdegoede@redhat.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org, ojeda@kernel.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 19, 2024 at 12:51:21PM +0200, Jani Nikula wrote:
> On Fri, 19 Jan 2024, Hans de Goede <hdegoede@redhat.com> wrote:
> > For per key controllable rgb LEDs we need to discuss a coordinate
> > system. I propose using a fixed size of 16 rows of 64 keys,
> > so 64x16 in standard WxH notation.
> >
> > And then storing RGB in separate bytes, so userspace will then
> > always send a buffer of 192 bytes per line (64x3) x 14 rows
> > = 3072 bytes. With the kernel driver ignoring parts of
> > the buffer where there are no actual keys.
> >
> > I would then like the map the standard 105 key layout onto this,
> > starting at x.y (column.row) coordinates of 16.6 (with 0.0 being
> > the top left). Leaving plenty of space on the left top and right
> > (and some on the bottom) for extra media key rows, macro keys, etc.
> >
> > The idea to have the standard layout at a fixed place is to allow
> > userspace to have a database of preset patterns which will work
> > everywhere.
> >
> > Note I say standard 105 key layout, but in reality for
> > defining the standardized part of the buffer we should
> > use the maximum amount of keys per row of all the standard layouts,
> > so for row 6 (the ESC row) and for extra keys on the right outside
> > the main block we use the standard layout as shown here:
> 
> Doesn't the input stack already have to have pretty much all of this
> already covered? I can view the keyboard layout in my desktop
> environment, and it's a reasonably accurate match, even if unlikely to
> be pixel perfect. But crucially, it has to have all the possible layouts
> covered already.

The kernel actually is not aware of the keyboard geometry, it had no
idea if you are dealing with a standard full 101/102 keys keyboard,
TKL or even smaller one, if it is split or not, maybe something like
Kinesis Advantage360. Arguably, it could potentially know about
101/TLK if vendors would program accurate descriptors into their
devices, but nobody does... And geometry is not a part of HID interface
at all. So your desktop environment makes an [un]educated guess.

> 
> And while I would personally hate it, you can imagine a use case where
> you'd like a keypress to have a visual effect around the key you
> pressed. A kind of force feedback, if you will. I don't actually know,
> and correct me if I'm wrong, but feels like implementing that outside of
> the input subsystem would be non-trivial.

Actually I think it does not belong to the input subsystem as it is,
where the goal is to deliver keystrokes and gestures to userspace.  The
"force feedback" kind of fits, but not really practical, again because
of lack of geometry info. It is also not really essential to be fully
and automatically handled by the kernel. So I think the best way is to
have an API that is flexible enough for the userspace solution to
control, and that is not restricted by the input core design. The
hardware drivers are not restricted to using a single API, they can
implement both an input device and whatever new "rgbled" and userspace
can associate them by topology/sysfs.

> 
> Cc: Dmitry, could we at least have some input from the input subsystem
> POV on this? AFAICT we have received none.

Sorry, I was not CCed and I missed this on the mainling list.

Thanks.

-- 
Dmitry
