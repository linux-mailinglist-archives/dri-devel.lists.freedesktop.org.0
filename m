Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4DF9EE05F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 08:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D99810ECCF;
	Thu, 12 Dec 2024 07:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ntnKh4+V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F0610ECCF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 07:41:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385df53e559so209702f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 23:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733989292; x=1734594092; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lCiBP5LajWp59TfXrN2BswKGn4PoDtGZIDcfjDmBxic=;
 b=ntnKh4+VVFwdoQifRSx5IPHnyNUmJyFlnEm/nSA6bCbiSoDPNrZUCHO65Raap81T+L
 83V3Bo2apZiMKHkarUc4aVVylDiUbPB8lovRSeu1Guybzn942gc01fAU25vubskfP+sw
 DrUWwcOutInAdb+B31H8DELNlZIGX0XBZ59ArXWwqYaf67V84C5nToTEQW9NWlVwQZgv
 0IAMjCkvJqrcyU09F4Ui3cesZc7squ5L9Jjr1tBdFDCB1UYIzTioSlYoftJbozCXc1Ss
 RYswsafaA83RbnBfMKIeAzUHJ52I2VegJlJSjUpMi3zA3nRjBC1ysqxu6e9rZQ3fpGm2
 cIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733989292; x=1734594092;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCiBP5LajWp59TfXrN2BswKGn4PoDtGZIDcfjDmBxic=;
 b=XccM2qWgtdqCrvYwW7lDl9W5hows6gU+UyTOS9z+XQQDC0orDFK/ZWIWOReXBl3iJJ
 DM82EI9P+LSamSJ0J7eTyW7y7xm3kOv7VShbWDLk7VPOdfG0Y5fGlAPXHhrp+lFEEbRY
 55kGTFJuF7/IxRbE84kcoEu0yEahmY8ISbZsH2ID4PLNPDL1mpCrr85fCO47vhtdHybB
 qYB6kuLP1r/15jNml9mjsQljlnOzT36FjDbc9H12TJh2Tm2Aa9tiwjhjRW8rZmZeURPq
 p9vG18Xfyq572nGJJgeL0M/UOv3ZhQUDkB4kM924UhdBkzkWUwruDb/u63gn+CWedoxw
 w7dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/3xC2J9jHoojW+G8sYhTPjb6Hy1cjN57WaMy8/+IGNLHwoe5HE/cWl0gyynXu+bL4LNWrGJJvUIM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFq7Y0Q3ChTexv6dYq4tMP7gxjcdY7NtH/YZEa1BaKxM50MoKr
 yaiTZbkw4GSKkk65t3HUm2IG7yzA0H92OASpcDKx3hhNHUdctLfW82QWNbswIUA=
X-Gm-Gg: ASbGnctGCj460g/O8p9JOe8RVnyOM+sherBnZPqqKsIdm10CXVo21VO/u6+OY5G3+c9
 +3vw7c9CSZyGsMH3cLdAny/GIGKMZgnSaF+gTAwxoNGaj0M90JJS8Nb0ZZy4FDneBgYtW4AOg6M
 BHwyznTsFHmqqnZMnRiwrvzDYSzrS9XRkMYsXY5pLJOVhFSdOZq2tU3oU8JrVbLk+ZaHtyKykZK
 du0Vlqt/f2kiE9g/v6MJwGCGLfilAjKqic5EMIlHj96Smp+cm0yDMTf4aWYXQ==
X-Google-Smtp-Source: AGHT+IEUBdFsdH3/zl9+1ecjQiu8FDvSqp8rn5L2vqkxpaQDJnW7Z4na4oHc4eFvwzw41wm+iZtfZg==
X-Received: by 2002:a05:6000:156e:b0:385:f7d9:99f5 with SMTP id
 ffacd0b85a97d-387876c4827mr1605674f8f.51.1733989292439; 
 Wed, 11 Dec 2024 23:41:32 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878251df6bsm3167261f8f.105.2024.12.11.23.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 23:41:31 -0800 (PST)
Date: Thu, 12 Dec 2024 10:41:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <816f862e-762d-4880-9285-5a803e657e66@stanley.mountain>
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <20241204160014.1171469-3-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204160014.1171469-3-jfalempe@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch breaks "make oldconfig" for me.  It just gets into an endless
loop of:

  Default DRM Client
  choice[1-0?]: 0
  Default DRM Client
  choice[1-0?]: 0
  Default DRM Client
  choice[1-0?]: 0
  Default DRM Client
  choice[1-0?]: 0
  ...

I don't have to type anything, it just spams that forever.  It's weird
that it's 1-0 instead of 0-1.  Does that means something?  I don't know
much about Kconfig.

I'm using this arm64 randconfig as a base.  I type "make oldconfig" and
press enter until it gets to "Default DRM Client" and then it starts
scrolling endlessly.
https://download.01.org/0day-ci/archive/20241212/202412121555.Fp663tyH-lkp@intel.com/config

regards,
dan carpenter
