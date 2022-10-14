Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754235FF42F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 21:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9108810E00A;
	Fri, 14 Oct 2022 19:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D64B10E00A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 19:43:46 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id d13so3160757qko.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 12:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ntqa7zGUvdkoaNKtpLHO8d7zkjCXynPr2O1UReD4IS4=;
 b=hWM2nuldlpT1GwMRadltQROOJ1UcxNz93fNBUQqz1H1K167JFumRhZEeiTQWkjVXfg
 Q6dfF69dv0Ub4IbGPuT/aEC6safmfQ7+wewR1eHedHFcdBGVWJJZdsIIXYTH+n9f9MaM
 tkdNcAIkEUIs9mp+WRtSgbKZWXBPOEdFQpSGiYb4gYMsnZ+KkskKQYTX/qAEyVcnSefc
 LnxeNe+0odSobij0QTyJJaLHMxCHp8glAyf8tEmQ3761srW6hBm4AICPWoguNKQCp6qq
 bhv/68xmcuRtu2GDxIOARd+hOTv94EvWT9mMlzfKEYujG6HrqAgFc6riJN+4tptJZH+B
 xj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ntqa7zGUvdkoaNKtpLHO8d7zkjCXynPr2O1UReD4IS4=;
 b=2rId5ap9H/smzSujgcT1d4iwyLVt4F39jPuRRlFlYr9NNRKqH9Z+RbVX/NnvJsEOrL
 RJYM9QeQs/2GlWpkB+QNjEmSdqoNJnP0xQY4sYq/oLm32M+hhsFUDRxROgrfiznY3mS3
 Bq+3g43ri9XEX85r7GcEvkdi3A8cpKyRMG8xR8v3tevDpkmMvVhoddJ8CdL1OIokW6fc
 N0Fe73N7xhNJdTExoWk2I6o3jf77haBxfTlLZq9bGC0BUrttHKPonv2ol1VUJjIj//iK
 1fSAaEpj0lap5mh0WEJnhKTCZQSqkfutGnTMozmFrL0Huu1tSkeU2RCdskROmCOKgnMD
 AX9Q==
X-Gm-Message-State: ACrzQf2yBbyr5nwtfhP+RCOyLN8AU04/kTgfqLHLCTojNM7cnvinIrIP
 gBDwyldhYL0EpEJ5vdqS7HY=
X-Google-Smtp-Source: AMsMyM7RS0AmiKiMA7R11UCVLvA+bZi0iN1SPGMBs4/6FU7fKMs+/k0fGUYgFvupdcxmXvvGXN6hAw==
X-Received: by 2002:ae9:f707:0:b0:6e7:2317:8318 with SMTP id
 s7-20020ae9f707000000b006e723178318mr4897896qkg.571.1665776625680; 
 Fri, 14 Oct 2022 12:43:45 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 d9-20020ac85349000000b00343057845f7sm2540309qto.20.2022.10.14.12.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 12:43:45 -0700 (PDT)
Message-ID: <890f6ab1-f6aa-76c8-01e8-f7233143d7ec@gmail.com>
Date: Fri, 14 Oct 2022 12:43:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/7] firmware: raspberrypi: Introduce
 rpi_firmware_find_node()
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Michael Turquette <mturquette@baylibre.com>, Emma Anholt <emma@anholt.net>,
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
References: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
 <20220815-rpi-fix-4k-60-v3-1-fc56729d11fe@cerno.tech>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220815-rpi-fix-4k-60-v3-1-fc56729d11fe@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/13/22 02:13, Maxime Ripard wrote:
> A significant number of RaspberryPi drivers using the firmware don't
> have a phandle to it, so end up scanning the device tree to find a node
> with the firmware compatible.
> 
> That code is duplicated everywhere, so let's introduce a helper instead.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/firmware/raspberrypi.c             | 7 +++++++
>   include/soc/bcm2835/raspberrypi-firmware.h | 7 +++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
> index 4b8978b254f9..b916e1e171f8 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -311,6 +311,13 @@ static int rpi_firmware_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct of_device_id rpi_firmware_of_match[];

This shadows the same variable that is used later for matching the 
firmware driver and probe it as a platform_driver, what am I missing here?
-- 
Florian
