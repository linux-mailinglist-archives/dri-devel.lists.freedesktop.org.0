Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E597317F466
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 11:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DBC6E856;
	Tue, 10 Mar 2020 10:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F7E6E856
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 10:08:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 6so15031406wre.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 03:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+TKoQn9uvIFy0ZoipeT/ZeN8Lwib0rvtajj+lUWGDRw=;
 b=WpNN9baUs0BSyN1oJfymmgXvgRLNBRQcKd8C/mu9ElAPG9DP1vn0Q6hWZnJrdaV6M5
 K2bCOu+hswGit+uAAK6xW3WFnGTWDKg2ueeEAwnXc1vd8wozobLvt9Rv/R4vLSG4FI7K
 h5Jroh64nQbsOg7slf0zSaQ5tqK/lGVRKLGZZWluOphASqEcZSxWUhZZtIyAAIVIvpQ7
 RChIHBw9EddVl9fITGkUpaHiTbx7VkYpwgN2/VOZ0BKLIvfQX5hK94uIVRzqkBO+dNuR
 58OzyB7RhAr6cEETLDaCASYIjD+mkW0GW9hDotytQN1GbNrZYjznJyapNaRJHEL0zvox
 B3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+TKoQn9uvIFy0ZoipeT/ZeN8Lwib0rvtajj+lUWGDRw=;
 b=oNYsIV5ruVjC3PNPkoLsxqiDJmLSmgyyXEjOO0rebkKlw675JA7qltaHHMSi3+m5kG
 xpdGZ0T0szBcuB2z6S46fNlS1qG2uf3aeWMthBECmiYe1E1XasuNwdAW7bNeJtT/R0To
 e/rGB9OK+JIQpOhnkiagiZNjJJt88cxq9p2yYRn+ZURpxkAoesf52eig3Wc5ERGdb1U2
 3SRL3VXFPeQea0WI08dvga0C+dkYDUjjQFXb7g8njeb6MBcGUrqYEJRa8AnIuoeJTG3i
 +wsGcJuv4Az3ItBeaxP3otuIGoOY2nPoirykrqqEiPJgwmJWqVkzTtzqnGMuMkEcmFMH
 eP0Q==
X-Gm-Message-State: ANhLgQ02HFhmrd/nJ09D+TBxb5Njy9Df4e1/7gMoo3CLucOC2zQlfRWj
 O/wikT+Nq/rOYePZe9DfHo/O7g==
X-Google-Smtp-Source: ADFU+vtohfjBcHjIXuAIDefzpKQsIiEGd5v4RV2wSiazaQrM/+Yvg1E4BxBgu+eJAkLX5ySbD+x34Q==
X-Received: by 2002:adf:f547:: with SMTP id j7mr27039739wrp.139.1583834894428; 
 Tue, 10 Mar 2020 03:08:14 -0700 (PDT)
Received: from [10.1.3.173]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w19sm3406275wmi.0.2020.03.10.03.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 03:08:13 -0700 (PDT)
Subject: Re: [PATCH v5 00/11] drm/bridge: dw-hdmi: implement bus-format
 negotiation and YUV420 support
To: p.zabel@pengutronix.de, heiko@sntech.de, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net,
 boris.brezillon@collabora.com
References: <20200304104052.17196-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <fb9ccd0d-8d7a-81a9-0a5a-c7ff959fcb94@baylibre.com>
Date: Tue, 10 Mar 2020 11:08:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304104052.17196-1-narmstrong@baylibre.com>
Content-Language: en-US
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/03/2020 11:40, Neil Armstrong wrote:
> Hi Philippe, Heiko, Maxime, Laurent,
> 
> A bad negociation was detected on platforms not implementing a bridge on the
> encoder side, which has been fixed in this version.
> 
> Could you check it doesn't break your platforms using dw-hdmi ? Especially
> patches 1-5.
> 
> Thanks,
> Neil
> 
> This patchset is based on Boris's merged "drm: Add support for bus-format negotiation"
> patchset to implement full bus-format negotiation for DW-HDMI, including YUV420 support and
> 10/12/16bit YUV444, YUV422 and RGB. The Color Space Converter support is already implemented.
> 
> And the counterpart implementation in the Amlogic Meson VPU dw-hdmi glue :
> - basic bus-format negotiation to select YUV444 bus-format as DW-HDMI input
> - YUV420 support when HDMI2.0 YUV420 modeset
> 
> This is a follow-up from the previous attempts :
> - "drm/meson: Add support for HDMI2.0 YUV420 4k60" at [2]
> - "drm/meson: Add support for HDMI2.0 4k60" at [3]
> 
> Changes since v4 at [7]:
> - Cleaned up patch 1
> - Added comment on patch 2
> - Added commit message on patch 3
> - Fixed invalid negociation when encoder is not yet a bridge (seen on allwinner & rockchip platforms) on patch 4
> - Fixed invalid defines, handled MEDIA_BUS_FMT_FIXED and cleaned negociation debug on patch 4
> - Added tags on patch 5, 6
> - Removed meson_venc_hdmi_encoder_get_out_bus_fmts on patch 7
> - Add off-list r-b from Jernej
> 
> Changes since v3 at [6]:
> - Added "Plug atomic state hooks to the default implementation" on drm/bridge: dw-hdmi
> - Also added these atomic state hooks in meson-dw-hdmi in patch 7
> - Rebased on latest drm-misc-next including patches 1-7 of [1]
> 
> Changes since RFC v2 at [5]:
> - Added fixes from Jonas, who tested and integrated it for Rockchip SoCs
> - Added support for 10/12/16bit tmds clock calculation
> - Added support for max_bcp connector property
> - Adapted to Boris's v4 patchset
> - Fixed typos reported by boris
> 
> Changes since RFC v1 at [4]:
> - Rewrote negociation using the v2 patchset, including full DW-HDMI fmt negociation
> 
> [2] https://patchwork.freedesktop.org/patch/msgid/20190520133753.23871-1-narmstrong@baylibre.com
> [3] https://patchwork.freedesktop.org/patch/msgid/1549022873-40549-1-git-send-email-narmstrong@baylibre.com
> [4] https://patchwork.freedesktop.org/patch/msgid/20190820084109.24616-1-narmstrong@baylibre.com
> [5] https://patchwork.freedesktop.org/patch/msgid/20190827081425.15011-1-narmstrong@baylibre.com
> [6] https://patchwork.freedesktop.org/patch/msgid/20191218154637.17509-1-narmstrong@baylibre.com
> [7] https://patchwork.freedesktop.org/patch/msgid/20200206191834.6125-1-narmstrong@baylibre.com
> 
> Jonas Karlman (2):
>   drm/bridge: dw-hdmi: set mtmdsclock for deep color
>   drm/bridge: dw-hdmi: add max bpc connector property
> 
> Neil Armstrong (9):
>   drm/bridge: dw-hdmi: Plug atomic state hooks to the default
>     implementation
>   drm/bridge: synopsys: dw-hdmi: add bus format negociation
>   drm/bridge: synopsys: dw-hdmi: allow ycbcr420 modes for >= 0x200a
>   drm/meson: venc: make drm_display_mode const
>   drm/meson: meson_dw_hdmi: add bridge and switch to drm_bridge_funcs
>   drm/meson: dw-hdmi: stop enforcing input_bus_format
>   drm/meson: venc: add support for YUV420 setup
>   drm/meson: vclk: add support for YUV420 setup
>   drm/meson: Add YUV420 output support
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 319 +++++++++++++++++++++-
>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 180 +++++++++---
>  drivers/gpu/drm/meson/meson_vclk.c        |  93 +++++--
>  drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
>  drivers/gpu/drm/meson/meson_venc.c        |  10 +-
>  drivers/gpu/drm/meson/meson_venc.h        |   4 +-
>  drivers/gpu/drm/meson/meson_venc_cvbs.c   |   6 +-
>  include/drm/bridge/dw_hdmi.h              |   1 +
>  8 files changed, 544 insertions(+), 76 deletions(-)
> 

Pushed to drm-misc-next

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
