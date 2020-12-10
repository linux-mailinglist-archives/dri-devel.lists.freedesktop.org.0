Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D22D7149
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8416EC8B;
	Fri, 11 Dec 2020 08:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5F26E430
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 17:41:04 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id p6so3136632plo.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wg76jedNfKc/TU9UzquktTGoQhYb+6rN7M9SWX71cGQ=;
 b=U7xYP0DnAGJ++RJDicbYFohdbSw6+4dEKbL51GuDiOEwWCZ0sGYVcyfWyA7DPDyXch
 fc4vCdHmT2NtlE+Qvg/EFIw279PSUtxpDLsQ5CuCXmWrGsd8jlB18i9ODl3dGSRkRLCD
 184DyMd70p7xoWHzIdSrmEq5CBjpn6Hs9mgdfZTHpUdcS6MYj1yxqNS2jCciljxd7T/9
 sxBnbXUCV+k3qicWrYFZCKtSUrKemak5JorceOLmJ6A+C8Qkv1LFd96fsoRNfBGR+2pV
 4xXbbJ+6/vfv/zzldGFWywDgN3k5Etc2mDqMKeWOu3X8asj9O+CO9JcvuIZ/QpeiU3+g
 Ptqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wg76jedNfKc/TU9UzquktTGoQhYb+6rN7M9SWX71cGQ=;
 b=TcqE4X19Xe92adU+ev0eF+N5bYpDtpRdMVKRFrhov9G16BcbRaDW8gAvFxxGKXmvet
 mthOQK7nKJWEZEWtTEZ04tMwzDekiKiWns7Nf/Jhj4IEXZAygDwWyEb/mmzjlIdjVUha
 hahaAPV5qgf0h5BmcwGSx7ZUSe/KprXORxKjNI3/eADsngnobIf3vdHJZjZ6GjpRm6bZ
 HepaRWFMMdS1iFgJ5lad3ysHP1iJsAacB5UB7UYWCjsBCg9001HHISX/1kiZciTC8Pxf
 AGEJkydDgbqaEyQ33/oDUb3sXYeRmygTfi6UbzWK1lJDuKzV09S5P8wWIdLDl/wSZrc3
 ceOQ==
X-Gm-Message-State: AOAM532XGCwpX9rlgo8mQ4zNOia+oBCxPFQNcf2fRih6uUkhhbudiT18
 YBgJEAeR2A97jgdzhpA2e/zAWvn+X6s=
X-Google-Smtp-Source: ABdhPJy7sT9hqz16lIdJ9LTYu1ADeOZPUOYqL5kRiMhi+q82kvjQrH7ZjNig1UfhjJlmQh3ETeYDbQ==
X-Received: by 2002:a17:902:10e:b029:d8:d11d:9613 with SMTP id
 14-20020a170902010eb02900d8d11d9613mr1407576plb.26.1607622064190; 
 Thu, 10 Dec 2020 09:41:04 -0800 (PST)
Received: from [10.230.29.166] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id g85sm6912510pfb.4.2020.12.10.09.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 09:41:03 -0800 (PST)
Subject: Re: [PATCH 14/15] ARM: dts: bcm2711: Add the BSC interrupt controller
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-15-maxime@cerno.tech>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <46411f3a-9b0b-9bf6-8795-77fc11988f79@gmail.com>
Date: Thu, 10 Dec 2020 09:41:00 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210134648.272857-15-maxime@cerno.tech>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:08 +0000
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
> The BSC controllers used for the HDMI DDC have an interrupt controller
> shared between both instances. Let's add it to avoid polling.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
