Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC1D2F2967
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51546E09F;
	Tue, 12 Jan 2021 07:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F7889E0C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:54:14 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id p12so8131398pju.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 08:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hxC1qJrlI0mdrHZWwzeRQSreuKvyt9lhWexionM4bvc=;
 b=jxi/iFmty57nzeTvRbSd8YTGnCoBs+nIg7Xb3rogDOUe+DisU3WnALwowVXJyKCdf9
 SNIrJFrH9wUNxjvl8JlykHbNFo0sanCK9U2HLEtAA7DTdBwUqQxwSKiUlgXKN45UKMsr
 9IJ8RVGGpE1hds+aKcovVVyMX8n7xvHYhmCwhPe+81bd3a8pxpAoP8Gob1rCTxutFvpd
 eoXQoDJToMgjgIvROkHiTPbdzzORIvC2a3a1djItlqB8kTmdHgHHkyYIxOeXq1kUf9FR
 JII7XYS6E6qz3aoERJLkAcvkj4EcYuerXOaj8lnWULRHMEhH2Edrwiw4Ul+6RdxmbQ7f
 mDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hxC1qJrlI0mdrHZWwzeRQSreuKvyt9lhWexionM4bvc=;
 b=ljOzweBm4kluRfwX9/7C2hf8RppxZMCU8PX36NMyydiHepBV0EnWC3otVhTkXhZ2fz
 QLBzTM/XMziFHzLD06u1k1BdllNF57ZPlRcK7mvUyGbLYFv1buVVb/PTQYW72NtQpBcC
 qBVNuJk5XvwkxTJPTJQchPVVrIUrihAhMcOku+KQOuRKsFPy57s8TONdfqwIKulwLQkN
 whmdSD+YVtwJpYS9h2SSXjDKE5KssFFBP0yQHDyB8brQTGTtDuk49mtjb7CTqQjT7nJR
 vODHYmMrNw1xp3RgTrGN9+BFLno8+Odculqtys/Xfu+OUSICyEthQkFyHZmKAjrrBeHZ
 aPSg==
X-Gm-Message-State: AOAM5300snONxDXXi3bZx5f8LPzygQS6LqQ8IGSgl0askD/I0+dFkMU7
 vQctDVm67E6wZLoE8+jeIOQ=
X-Google-Smtp-Source: ABdhPJxZc9BlCRH4vHrwGcRGH4A9CVXGnll08SaLUdGhIqreT6BDwqmzNHnBS8fd2Kp2yKbARF6sXg==
X-Received: by 2002:a17:90a:4689:: with SMTP id z9mr145138pjf.87.1610384053835; 
 Mon, 11 Jan 2021 08:54:13 -0800 (PST)
Received: from [10.230.29.29] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id x1sm272433pgj.37.2021.01.11.08.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 08:54:13 -0800 (PST)
Subject: Re: [PATCH v2 01/15] ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-2-maxime@cerno.tech>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <000a8e5b-cb97-f413-6d8b-2f5a529f7137@gmail.com>
Date: Mon, 11 Jan 2021 08:54:10 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111142309.193441-2-maxime@cerno.tech>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/2021 6:22 AM, Maxime Ripard wrote:
> The BCM2711 has a number of instances of interrupt controllers handled
> by the driver behind the BRCMSTB_L2_IRQ Kconfig option (irq-brcmstb-l2).
> 
> Let's select that driver as part of the ARCH_BCM2835 Kconfig option.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Nicolas, I suppose you will be taking patches 1 and 14, 15 through the
SoC pull request, right?
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
