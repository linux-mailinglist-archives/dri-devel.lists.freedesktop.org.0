Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56493166739
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 20:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17366E909;
	Thu, 20 Feb 2020 19:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD006E909
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 19:33:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q9so3259030wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 11:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=E5S9aNFqrzMweT/fLedmBehI6zV6DT/E9arXjx8LiL0=;
 b=nOW1dJSzVFvP0XctGEk9bOJKCW15bXfIREw5h2tgDjQ7/Hy8IEAJb5xaKyMhtkXjx1
 zf6LOVFL1PjyR7nlfG8EuK4rtTnOanIvbqjgbBwBrAx4mjbJ2JEJjs7uehAUoeK7tB95
 fDZ4tbWQqoy4/TpwsJQMQiV/kE5TMUjp3ze8Yia7KWyx070YH2eGHlts6U9lccd7ct/B
 5Ullq95LMHp9mv1E73Yo8t5A1A8jZb66djGqxV4gy2dF/w7u4ycUdO2FiuSz7/dkbw4I
 eSzjvIHL1p/ecO+ONVa928EumIhfe/+oaG5d2PBDNKCf9V35Q50WJzrsr4maUjBrbwCA
 qRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=E5S9aNFqrzMweT/fLedmBehI6zV6DT/E9arXjx8LiL0=;
 b=Zm+vh8tDkXV5doTFWLz5D+Uza7Oape08090oFg0AxSTXhaLYDCwsC/4oQbrdJAyN2Z
 COCxgGujiITOvKubIYEwHQZT6YEjZF8oY1pUGBAJ8/T4BP4l+EDQB3It0D+Y2jKBb9ni
 3wFJBGHLUs+enH2V8112t9z/SCFWB1k5W9537ApTW9/EsBvpJPNN2cG5qLzy/gSF/tbd
 bCN13fT8p+xlzwo2+zwmqEx+Bkv9TsDRpYl1BGZwaed2XLzxzxNhKHuVN9nBqsrNSkWP
 dYCjFMHM9nY0XO+k23UH/Ghi8uVgAIjD8+0lRd0Pwq33uWPYu0g+FIu4JeOPHik8udNe
 6fIw==
X-Gm-Message-State: APjAAAVEhDPuTIKketL4RYlI1RaKZ80fxUrnb6cF+8mVfmYKTLIUajWk
 Nqb/lUiA84wS3IOtq9WDNJQUlg==
X-Google-Smtp-Source: APXvYqxe0BOqNhTYK0A0EeE+usRWZgwZqrZrRH7ay8qcw1krcOJVLuutSOD8sd+Ax/AYw3YPnyYC2g==
X-Received: by 2002:a1c:ddc3:: with SMTP id u186mr6081797wmg.103.1582227236703; 
 Thu, 20 Feb 2020 11:33:56 -0800 (PST)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:e35:2ec0:82b0:3115:825f:fd46:f0e9])
 by smtp.gmail.com with ESMTPSA id q1sm694991wrw.5.2020.02.20.11.33.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Feb 2020 11:33:56 -0800 (PST)
Subject: Re: [PATCH 2/4] drm/meson: add Amlogic Video FBC registers
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20200220162758.13524-1-narmstrong@baylibre.com>
 <20200220162758.13524-3-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <85b7dab4-0941-d31b-bcd7-3589d5040064@baylibre.com>
Date: Thu, 20 Feb 2020 20:33:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200220162758.13524-3-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le 20/02/2020 =E0 17:27, Neil Armstrong a =E9crit :
> Add the registers of the VPU VD1 Amlogic FBC decoder module, and routing
> register.
> =

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_registers.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> =

> diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/me=
son/meson_registers.h
> index 8ea00546cd4e..f784d7d1fe2e 100644
> --- a/drivers/gpu/drm/meson/meson_registers.h
> +++ b/drivers/gpu/drm/meson/meson_registers.h
> @@ -144,10 +144,15 @@
>  #define		VIU_SW_RESET_OSD1               BIT(0)
>  #define VIU_MISC_CTRL0 0x1a06
>  #define		VIU_CTRL0_VD1_AFBC_MASK         0x170000
> +#define		VIU_CTRL0_AFBC_TO_VD1		BIT(20)
>  #define VIU_MISC_CTRL1 0x1a07
>  #define		MALI_AFBC_MISC			GENMASK(15, 8)
>  #define D2D3_INTF_LENGTH 0x1a08
>  #define D2D3_INTF_CTRL0 0x1a09
> +#define VD1_AFBCD0_MISC_CTRL 0x1a0a
> +#define		VD1_AXI_SEL_AFB			(1 << 12)
---------------------------------------/\
				Missing 'C'

Thanks Christian for reporting.... last minute checkpatch fix gone wrong.

Will fix either in v2 or when applying.

Neil

> +#define		AFBC_VD1_SEL			(1 << 10)
> +#define VD2_AFBCD1_MISC_CTRL 0x1a0b
>  #define VIU_OSD1_CTRL_STAT 0x1a10
>  #define		VIU_OSD1_OSD_BLK_ENABLE         BIT(0)
>  #define		VIU_OSD1_OSD_MEM_MODE_LINEAR	BIT(2)
> @@ -365,6 +370,23 @@
>  #define VIU_OSD1_OETF_LUT_ADDR_PORT 0x1add
>  #define VIU_OSD1_OETF_LUT_DATA_PORT 0x1ade
>  #define AFBC_ENABLE 0x1ae0
> +#define AFBC_MODE 0x1ae1
> +#define AFBC_SIZE_IN 0x1ae2
> +#define AFBC_DEC_DEF_COLOR 0x1ae3
> +#define AFBC_CONV_CTRL 0x1ae4
> +#define AFBC_LBUF_DEPTH 0x1ae5
> +#define AFBC_HEAD_BADDR 0x1ae6
> +#define AFBC_BODY_BADDR 0x1ae7
> +#define AFBC_SIZE_OUT 0x1ae8
> +#define AFBC_OUT_YSCOPE 0x1ae9
> +#define AFBC_STAT 0x1aea
> +#define AFBC_VD_CFMT_CTRL 0x1aeb
> +#define AFBC_VD_CFMT_W 0x1aec
> +#define AFBC_MIF_HOR_SCOPE 0x1aed
> +#define AFBC_MIF_VER_SCOPE 0x1aee
> +#define AFBC_PIXEL_HOR_SCOPE 0x1aef
> +#define AFBC_PIXEL_VER_SCOPE 0x1af0
> +#define AFBC_VD_CFMT_H 0x1af1
>  =

>  /* vpp */
>  #define VPP_DUMMY_DATA 0x1d00
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
