Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A84CA21A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAE110F436;
	Wed,  2 Mar 2022 10:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C669B10F435
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:25:09 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u1so1928254wrg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 02:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DKXEJNswJVuDL+USTupC0gsrP+tnzJ6kN2u2U+1FUvw=;
 b=1uadc+8xwzLc6ZK8m0P37ZJT+uedeMUjCltkPqP1ylyWtgKiGkYLcRu6zJi0OJo8mm
 j4iOS0r7Xwbo4O39e0yozgYePZsR/KMZSOHyxmx2fnTvxG5kxK9zzTSsSiKuIyv/roWy
 BgtsZgJ9Cw2Ri9EijxlM7CGz4N1b/dsKVUxuhxszVL0ze8na0blMev93VbomLITA2mwl
 ZVLOSPpZ4N0d57zQX/IoxnL9a1M6TEb2aXWkKDXEwXD6ctEyLuNGnO3zj2z53p3QKT8A
 zjqSLSJpNaJ2tc09NNIv1EKzNDFSyzybxdkL0Idm/v1gh+Wv+yE4wSKencIclieBvJ8f
 01AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DKXEJNswJVuDL+USTupC0gsrP+tnzJ6kN2u2U+1FUvw=;
 b=EFNByCh1hFqk1r4GgP7nTjY/i70UkfQEsc8kgO6eFpalLEd0BYz7eDxvDhymBcmGFe
 awWDCAo/bP5Z8rFxuFT/tgjNpU/KIryH+g/NAn7hPK7fwwdk/Ta8s9i2tLKgqWC7Mw5V
 +LZqt8rMg7kYUkd6vT1II0DF3ChV6gYBf9FWZwpBZIMZC/+JzqlepYHFhAd2YWjHluJm
 vsQvghx07QLHlX+QVOBosIpB5pW+FuVk6jPDuVdeJZhyHSjr5IPPjWABX6N+25ewn7cD
 ujIwByQxpkF79x8ZW8OB1MHPTAQ7vjB6qdSJp8NS4vuNgDu0n3TwNtDB714Efo4fG7Uw
 uY3Q==
X-Gm-Message-State: AOAM532DoPMq/cAKrIkMI98etiOqnvTo4tUVlQKujfxFFGeCYEBMlGo0
 86/wXakqjc2iFrfWToylvGNBSg==
X-Google-Smtp-Source: ABdhPJyX21sYi2BLzXTXHIOIRGn1aBhi3MP5O7ODmfsDwU/tAASzOj3FtCZTJSYmbicFsxAelIcUHg==
X-Received: by 2002:adf:8b85:0:b0:1ed:b97b:493d with SMTP id
 o5-20020adf8b85000000b001edb97b493dmr22392634wra.108.1646216706914; 
 Wed, 02 Mar 2022 02:25:06 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:3530:ddb:a61:e8db?
 ([2001:861:44c0:66c0:3530:ddb:a61:e8db])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a056000137000b001f046a21afcsm648621wrz.15.2022.03.02.02.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 02:25:06 -0800 (PST)
Message-ID: <fca28594-8d4e-dd2f-93a0-a052cb888d90@baylibre.com>
Date: Wed, 2 Mar 2022 11:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v16 4/4] drm/bridge: dw-hdmi: fix bus formats negotiation
 for 8 bit modes
Content-Language: en-US
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
 <5da069b6-8a99-79c2-109c-c85715165857@baylibre.com>
 <E0D3B7E8-0C8D-4119-8267-0556AB921B24@goldelico.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <E0D3B7E8-0C8D-4119-8267-0556AB921B24@goldelico.com>
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
Cc: Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

H,

On 01/03/2022 21:37, H. Nikolaus Schaller wrote:
> Hi Neil,
> 
> 
>> Am 01.03.2022 um 10:18 schrieb Neil Armstrong <narmstrong@baylibre.com>:
>>
>> Hi,
>>
>> On 26/02/2022 18:13, H. Nikolaus Schaller wrote:
>>> Commit 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")
>>> introduced a new mechanism to negotiate bus formats between hdmi connectors
>>> and bridges which is to be used e.g. for the jz4780 based CI20 board.
>>> In this case dw-hdmi sets up a list of formats in
>>> dw_hdmi_bridge_atomic_get_output_bus_fmts().
>>> This includes e.g. MEDIA_BUS_FMT_UYVY8_1X16 which is chosen for the CI20 but
>>> only produces a black screen.
>>> Analysis revealed an omission in
>>> Commit 6c3c719936dafe ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
>>> to check for 8 bit with when adding UYVY8 or YUV8 formats.
>>> This fix is based on the observation that max_bpc = 0 when running this
>>> function while info->bpc = 8.
>>
>> In fact if bpc = 0, it should be considered as 8, so the issue is elsewhere.
>>
>>> Adding the proposed patch makes the jz4780/CI20 panel work again with default
>>> MEDIA_BUS_FMT_RGB888_1X24 mode.
>>> Fixes: 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")
>>> Fixes: 6c3c719936dafe ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> ---
>>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 10 ++++++----
>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> index 43e375da131e8..c08e2cc96584c 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> @@ -2621,11 +2621,13 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>>   		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
>>>   	}
>>>   -	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
>>> -		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>>> +	if (max_bpc >= 8 && info->bpc >= 8) {
>>> +		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
>>> +			output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>>>   -	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>>> -		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>>> +		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>>> +			output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>>> +	}
>>
>> It should not select YUV here if it's not possible, so something is wrong.
>>
>> Can you check if https://lore.kernel.org/r/20220119123656.1456355-2-narmstrong@baylibre.com fixes this issue instead ?
> 
> Well, I had to manually fix it to be appliable to drm-misc/drm-misc-next
> and specifically:
> 
> c03d0b52ff71 ("drm/connector: Fix typo in output format")
> 
> My resulting patch is attached.
> 
> Unfortunately it did not work.
> 
> I added a printk for hdmi->sink_is_hdmi. This returns 1. Which IMHO is to be expected
> since I am using a HDMI connector and panel... So your patch will still add the UYVY formats.
> 
> Either the synposys module inside the jz4780 or the panel does not understand them.

By selecting the UYVY formats, the driver will enable the colorspace converters in the dw-hdmi IP,
I don't see why it doesn't work here...

There is a bit called `Support Color Space Converter` in config0_id:
bit	|	Name	|	R/W	|	Desc
2 	|	csc	| 	R 	|	Indicates if Color Space Conversion block is present

Could you dump all the config0 bits:

=======================><=============================
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 54d8fdad395f..547731482da8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3431,6 +3431,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
         pdevinfo.id = PLATFORM_DEVID_AUTO;

         config0 = hdmi_readb(hdmi, HDMI_CONFIG0_ID);
+       dev_info(dev, "config0: %x\n", config0);
         config3 = hdmi_readb(hdmi, HDMI_CONFIG3_ID);

         if (iores && config3 & HDMI_CONFIG3_AHBAUDDMA) {
=======================><=============================

If this bit is missing, this would explain the black screen.

Neil

> 
> Here is the EDID. Unfortunately it does not pretty print the extended descriptors for UYVY etc.
> so that I don't know the exact capabilities of the panel. And what I am not sure is if the
> jz4780 SoC can convert to UYVY or how it can.
> 
> root@letux:~# parse-edid </sys/devices/platform/13050000.lcdc0/drm/card0/card0-HDMI-A-1/edid
> Checksum Correct
> 
> Section "Monitor"
>          Identifier "LEN L1950wD"
>          ModelName "LEN L1950wD"
>          VendorName "LEN"
>          # Monitor Manufactured week 34 of 2011
>          # EDID version 1.3
>          # Digital Display
>          DisplaySize 410 260
>          Gamma 2.20
>          Option "DPMS" "true"
>          Horizsync 30-81
>          VertRefresh 50-76
>          # Maximum pixel clock is 140MHz
>          #Not giving standard mode: 1152x864, 75Hz
>          #Not giving standard mode: 1280x720, 60Hz
>          #Not giving standard mode: 1280x1024, 60Hz
>          #Not giving standard mode: 1280x1024, 60Hz
>          #Not giving standard mode: 1280x1024, 60Hz
>          #Not giving standard mode: 1440x900, 60Hz
>          #Not giving standard mode: 1440x900, 75Hz
>          #Not giving standard mode: 1920x1080, 60Hz
> 
>          #Extension block found. Parsing...
>          Modeline        "Mode 15" -hsync -vsync
>          Modeline        "Mode 0" -hsync +vsync
>          Modeline        "Mode 1" 27.027 1440 1478 1602 1716 480 484 487 525 -hsync -vsync interlace
>          Modeline        "Mode 2" 27.027 1440 1478 1602 1716 480 484 487 525 -hsync -vsync interlace
>          Modeline        "Mode 3" 27.027 720 736 798 858 480 489 495 525 -hsync -vsync
>          Modeline        "Mode 4" 27.027 720 736 798 858 480 489 495 525 -hsync -vsync
>          Modeline        "Mode 5" 27.000 1440 1464 1590 1728 576 578 581 625 -hsync -vsync interlace
>          Modeline        "Mode 6" 27.000 1440 1464 1590 1728 576 578 581 625 -hsync -vsync interlace
>          Modeline        "Mode 7" 27.000 720 732 796 864 576 581 586 625 -hsync -vsync
>          Modeline        "Mode 8" 27.000 720 732 796 864 576 581 586 625 -hsync -vsync
>          Modeline        "Mode 9" 74.250 1280 1720 1760 1980 720 725 730 750 +hsync +vsync
>          Modeline        "Mode 10" 74.250 1280 1390 1420 1650 720 725 730 750 +hsync +vsync
>          Modeline        "Mode 11" 74.250 1920 2448 2492 2640 1080 1082 1089 1125 +hsync +vsync interlace
>          Modeline        "Mode 12" 74.250 1920 2008 2052 2200 1080 1082 1087 1125 +hsync +vsync interlace
>          Modeline        "Mode 13" 148.500 1920 2448 2492 2640 1080 1084 1089 1125 +hsync +vsync
>          Modeline        "Mode 14" 148.500 1920 2008 2052 2200 1080 1084 1089 1125 +hsync +vsync
>          Modeline        "Mode 16" +hsync +vsync interlace
>          Modeline        "Mode 17" +hsync +vsync interlace
>          Modeline        "Mode 18" +hsync +vsync
>          Option "PreferredMode" "Mode 15"
> EndSection
> root@letux:~# xxd /sys/devices/platform/13050000.lcdc0/drm/card0/card0-HDMI-A-1/
> 00000000: 00ff ffff ffff ff00 30ae 8610 0101 0101  ........0.......
> 00000010: 2215 0103 8029 1a78 eee5 b5a3 5549 9927  "....).x....UI.'
> 00000020: 1350 54af ef00 714f 81c0 8180 8180 8180  .PT...qO........
> 00000030: 9500 950f d1c0 2413 0020 4158 1620 050d  ......$.. AX. ..
> 00000040: 2300 ffff 0000 001c 0000 00fc 004c 454e  #............LEN
> 00000050: 204c 3139 3530 7744 0a20 0000 00fd 0032   L1950wD. .....2
> 00000060: 4c1e 510e 000a 2020 2020 2020 0000 00ff  L.Q...      ....
> 00000070: 0042 3334 3332 3834 350a 2020 2020 0101  .B3432845.    ..
> 00000080: 0203 2171 4e06 0702 0315 9611 1213 0414  ..!qN...........
> 00000090: 051f 9023 0907 0783 0100 0065 030c 0010  ...#.......e....
> 000000a0: 008c 0ad0 9020 4031 200c 4055 00b9 8821  ..... @1 .@U...!
> 000000b0: 0000 1801 1d80 1871 1c16 2058 2c25 00b9  .......q.. X,%..
> 000000c0: 8821 0000 9e01 1d80 d072 1c16 2010 2c25  .!.......r.. .,%
> 000000d0: 80b9 8821 0000 9e01 1d00 bc52 d01e 20b8  ...!.......R.. .
> 000000e0: 2855 40b9 8821 0000 1e02 3a80 d072 382d  (U@..!....:..r8-
> 000000f0: 4010 2c45 80b9 8821 0000 1e00 0000 00d0  @.,E...!........
> root@letux:~# root@letux:~# dmesg|grep dw.hdmi
> [    9.622138] dw-hdmi-ingenic 10180000.hdmi: Detected HDMI TX controller v1.31a with HDCP (DWC HDMI 3D TX PHY)
> [    9.727840] dw-hdmi-ingenic 10180000.hdmi: registered DesignWare HDMI I2C bus driver
> [   10.103864] dw_hdmi_bridge_atomic_get_output_bus_fmts: hdmi->sink_is_hdmi=1
> 
> So please let me know which parameters I should try to printk()...
> 
> BR and thanks,
> Nikolaus
> 
> 
> ------
> 
>  From c84a3c4a500684e57b1243fe5386696c48fa1e1b Mon Sep 17 00:00:00 2001
> From: Neil Armstrong <narmstrong@baylibre.com>
> Date: Wed, 19 Jan 2022 13:36:56 +0100
> Subject: [PATCH] drm/bridge: dw-hdmi: filter out YUV output formats when DVI
> 
> When the display is not an HDMI sink, only the RGB output format is
> valid. Thus stop returning YUV output formats when sink is not HDMI.
> 
> Fixes: 6c3c719936da ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 43e375da131e8..0ec0cbe448e05 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2538,6 +2538,7 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>          struct drm_connector *conn = conn_state->connector;
>          struct drm_display_info *info = &conn->display_info;
>          struct drm_display_mode *mode = &crtc_state->mode;
> +       struct dw_hdmi *hdmi = bridge->driver_private;
>          u8 max_bpc = conn_state->max_requested_bpc;
>          bool is_hdmi2_sink = info->hdmi.scdc.supported ||
>                               (info->color_formats & DRM_COLOR_FORMAT_YCBCR420);
> @@ -2564,7 +2565,7 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>           * If the current mode enforces 4:2:0, force the output but format
>           * to 4:2:0 and do not add the YUV422/444/RGB formats
>           */
> -       if (conn->ycbcr_420_allowed &&
> +       if (hdmi->sink_is_hdmi && conn->ycbcr_420_allowed &&
>              (drm_mode_is_420_only(info, mode) ||
>               (is_hdmi2_sink && drm_mode_is_420_also(info, mode)))) {
>   
> @@ -2595,36 +2596,36 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>           */
>   
>          if (max_bpc >= 16 && info->bpc == 16) {
> -               if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
> +               if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>                          output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
>   
>                  output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
>          }
>   
>          if (max_bpc >= 12 && info->bpc >= 12) {
> -               if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
> +               if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
>                          output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
>   
> -               if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
> +               if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>                          output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
>   
>                  output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
>          }
>   
>          if (max_bpc >= 10 && info->bpc >= 10) {
> -               if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
> +               if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
>                          output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
>   
> -               if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
> +               if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>                          output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
>   
>                  output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
>          }
>   
> -       if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
> +       if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
>                  output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>   
> -       if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
> +       if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>                  output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>   
>          /* Default 8bit RGB fallback */

