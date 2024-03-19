Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD38088054D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 20:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C4910E6D7;
	Tue, 19 Mar 2024 19:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lqgZA1EV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44FE10E6D7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 19:17:45 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d288bac3caso75244021fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 12:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710875863; x=1711480663; darn=lists.freedesktop.org;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iRr24PEBd8zKAx1Le9fMouYvic4r4gqHNvWH1/xWkFI=;
 b=lqgZA1EVj6jetP5VZysSw4RaCw494ETWTX55/bCr+NKJLKJVpLMiotFe1DyLi7itbi
 QTi0yJa2UfWEyLrobQ4RCW2EUFLoWduXK5nQJNqHZ7LYkw783ldFtf2KdCNEfmR1oWX7
 r15+qsnwcPjws+XhytXhughKDyBcmlrcWc7P5XpXpaBnr5TVwT6LXj+jUWWGrMjwgW4v
 sFcZlni0KGEuBimy8LKsa7/UghIfq8ebA4aKB6jUdCCHpP86fB9DjjXc+prYXaximMaW
 LwA46o2wa1zzRT0V47aJcPGsGiLMwIOHnz40E3dm68TkMfK5KKMKskvCO2d99AsHFyZC
 nLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710875863; x=1711480663;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iRr24PEBd8zKAx1Le9fMouYvic4r4gqHNvWH1/xWkFI=;
 b=G7VpIzK96QzTaNm1tAwyEiBR1mJgtdR/n7AASG7KkxFZ5thZxqZexpDYR1OYCqoRU7
 DtH58FPfOq3Sk15sP+VcMmggJYJlfwaNYB9sDXvCLM7MlP9BrInIdHBvrXyiDty6dVWb
 aduw10pNv8eqvjZdyANKqHt1g3FWC+htt6Ia7XJfpeJ/G9nKL7I6L7GbQuluRUhCpHOi
 78fvTIjigqGGdia3CU5m6DyJFzoc+sXMWny2IWcC0wPfFQoCDhrKhSZN+fWwxRvrc8oe
 Vu2nnkRa/x5QkMXN3NQKmt8ET3k+VR2hFlN1Z8D4AxJEULeSSkU4HqYAwJKuyrBlczhT
 9krA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlw7tlrI1dCYU8WskwI67QEjFcP8vXyWpFZ+8naUXKfpwU66trPdsenzvR/cQ8Px99DY069HKHx2hDOs/wNiUTAtWQKDFvcNpYViVM56+d
X-Gm-Message-State: AOJu0Yxzx0tKqDKG2XVziUasbGPd+iwQIqIvKMxS5lWoBSLB2ABuF/sn
 A7IbBU3z0XNDZ+WBIngkBkXWTil4Yk+sNg54Y5hJlU26i0CXYfaG
X-Google-Smtp-Source: AGHT+IGlSWU+WJTvGzRzgGj9fqGvnGh3e2Ko7l558AcWQjhkyo46I+sS8R6jH2OPRnZf7A0DPrxOLQ==
X-Received: by 2002:a2e:88d6:0:b0:2d4:59c4:2d84 with SMTP id
 a22-20020a2e88d6000000b002d459c42d84mr10290669ljk.29.1710875863245; 
 Tue, 19 Mar 2024 12:17:43 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 u17-20020a2e2e11000000b002d4a92f29fcsm872357lju.77.2024.03.19.12.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 12:17:42 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2] helo=ester)
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rmexy-0000000011A-0kgf; Tue, 19 Mar 2024 20:17:42 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: sarha@kapsi.fi
Cc: "Kevin Hao" <haokexin@gmail.com>,  dri-devel@lists.freedesktop.org,
 "Jyri Sarha" <jyri.sarha@iki.fi>,  "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Daniel Vetter" <daniel@ffwll.ch>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: Re: [PATCH] drm/tilcdc: Set preferred depth
In-Reply-To: <60505d851dabcb597c5c4c1e7f76e859ff5d05a9@kapsi.fi>
 (sarha@kapsi.fi's message of "Tue, 19 Mar 2024 11:05:06 +0000")
References: <20240317033918.535716-1-haokexin@gmail.com>
 <60505d851dabcb597c5c4c1e7f76e859ff5d05a9@kapsi.fi>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Tue, 19 Mar 2024 20:17:42 +0100
Message-ID: <kmsqu3uax.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi, Jyri

sarha@kapsi.fi writes:

> So the trouble here is the 16bpp and 24/32bpp color wiring being
> crossed, right? I'd just like to remind that there is another option
> to overcome the issue by editing device tree files. The current
> configuration from some 8 years back supports RG16, BG24, and XB24
> formats, but on Beaglebone-Black its possible - thanks to tda998x -
> change the support to BG16, RG24, and XR24, by changing these lines
> before building a new dtb-file:

I don't think that will solve the problem. The unmodified
drm_driver_legacy_fb_format() gives RG16 if it is asked for a 16 bit
depth (and the corresponding bpp in the way that the X server does) and
RG24 if asked for 24 bits. So swapping the bits around will always break
one of the hardware-supported depths unless you can cross/uncross the
wires dynamically when setting the frame buffer.

Best regards,

--Frej
