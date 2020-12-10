Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B273D2D716B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7226ECCE;
	Fri, 11 Dec 2020 08:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B79B6E430
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 17:42:17 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t18so3155217plo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 09:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xhC+Epifyxy2M2mKUYAu18Eq66Rlf4culR13M+Jrfco=;
 b=ZJ2ObQpYtkzEbRFv40oN+F65lAU6Ej9gKrE5tQPiv7ix/LuBkcvUf+qMUh+Yzoxr0g
 CyVLZ1mG/UZfuxW/V3MMPsaTBSe2CWI0mDNMfEr7mKEWwiKc4c3ZI8/xXiy/OOpRRB/j
 2IZpMCpurtGq6tzatn7TAJI7V3OuMaXrfCFpdbKTT1pfnFN4C5I4tNdDjJ+tPlKhyxqi
 przoNGt/m24R6bKMKywSL6UEGQQjXmxvANoK31VrYtoQFG7CIFwswmQLapaXt4wK37sA
 xHQJydZjUT4lKZk5SMNC/6y1kHtTG0Wl7+At0IEZBHpFHOPwp1+ijx3ZwuhElpY/pmj7
 20Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xhC+Epifyxy2M2mKUYAu18Eq66Rlf4culR13M+Jrfco=;
 b=WMztnN2SYRapg+oh4ey/WCSxRwSWkaZfeEhvmfNzXe8vDGppMEvMMyVCHzqdj/HfcI
 PDNnU/Gbu12WEG7zqB0cQYK+kdsBYpL3h8pu/HTYJjIAnSC+CHqacUnXhWR9olDea7i3
 NR9FK32Gn/XQjXJ2J7QkZuceT8i3/8yf3Dr3gC4UYH+I4HXNpc7YnWZm6+MWuKNh0l6p
 xJRZhaRqRjvApjTRDpnxzPclSuGN9fvWSlSoZIJmAfY37qjhkk2yuHRUPCD2ezaImRBp
 xOxf79M1cLdfg6XsWI8j4bHJx1OtJBBUK58HwX6xOgqEW1/z4G+xALfUVmusLgrXZCBI
 Tfrw==
X-Gm-Message-State: AOAM532iLZB5QoRj19k+PMyhjFl4BI1mM7PRx04Q40uqi3VYbuWR8Pi5
 Y4s/qXy+4MfhEfzD5GpwaETYV57K5zU=
X-Google-Smtp-Source: ABdhPJzIx+7sRPBlNWy2an1r0b10BKDTDvE4FtqZry01Hi8E5wwZE9KecaPEs1U2F02OehoELDCOeA==
X-Received: by 2002:a17:902:8b8c:b029:d8:de6f:ed35 with SMTP id
 ay12-20020a1709028b8cb02900d8de6fed35mr7278561plb.36.1607622136734; 
 Thu, 10 Dec 2020 09:42:16 -0800 (PST)
Received: from [10.230.29.166] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id x188sm6704941pfd.43.2020.12.10.09.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 09:42:16 -0800 (PST)
Subject: Re: [PATCH 15/15] ARM: dts: bcm2711: Add the CEC interrupt controller
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-16-maxime@cerno.tech>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <bd2c5b93-2ee3-23ff-5852-e3537619e0ae@gmail.com>
Date: Thu, 10 Dec 2020 09:42:12 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210134648.272857-16-maxime@cerno.tech>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:07 +0000
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
Cc: Jason Cooper <jason@lakedaemon.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/10/2020 5:46 AM, Maxime Ripard wrote:
> The CEC and hotplug interrupts go through an interrupt controller shared
> between the two HDMI controllers.
> 
> Let's add that interrupt controller and the interrupts for both HDMI
> controllers
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
