Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB2F818B60
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 16:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D724F10E48D;
	Tue, 19 Dec 2023 15:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC61F10E48D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 15:40:15 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a235500d0e1so305153366b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 07:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703000414; x=1703605214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z28CWlKNnNm8FLZVai7/EGWCqrY9/wHM89gG+Y7cx2Y=;
 b=PAB7V5Zshphsahss9k2Xv806VURjNsGr82fnUpiWGScxCzA9nm2sFihbmKSunZeYD7
 EvNoUqtT9hTsZ860u8Hsv8d1HGZ7+gJlSszwMxYUk/KYAUuuXOIDan8tjm9v1rUyQhZU
 yGqu1hoCFfFrDTNJ31sDQR/bg+iirdU8xSB+iSGpjZOqOV73MTo4Hmk7N0UTIlPuRoSc
 EfioNvDy6uuipst9hLOSCHA2LrXSjbcLsYVSgS5ZsaXqL5LgVrgNNDcsBdhYQvfDryYj
 ov/RUTn0bl3kK/87Ug6zVcI4FFEkIZSX9VsNua7eIZ+wFd/iuxi/9IHxUfUYFpB/EqbB
 /TRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703000414; x=1703605214;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z28CWlKNnNm8FLZVai7/EGWCqrY9/wHM89gG+Y7cx2Y=;
 b=YOXt7zJgwgq5GM/xsQw0iQXCLHAnBOugsg4juTnNxUN8KxkwAvKzR4N1VJZw69m9Jh
 +Kk3cJIUx6v4dt0qLONHGZUwLMryb37m9CGijPPwbJPpNpUbbweT+N8hw9LGUJVfPGWc
 u35N2KNJJK4+HENAbXwZWbPzvPpr/CWboppHESYL8pfKtpnAdxf1MOroH76USs0GOnvR
 BJdlLvctMSWXv0phpvXMxCDlsufmFP5mDxiub2tis7lnJ30AIUXB3Ke393rIqldWLMqe
 ZlVtqbqbIXTtYfh0x1IsoAjKbE7ZGM1U/+HG3G3CFcvrlIIBoPdhmpE8CWAtXqGEDAvn
 l+RQ==
X-Gm-Message-State: AOJu0YzpgKh2Kwd2CgeOe2lA8rPVMa5RyGD89/VnxneFc92MWs8cLt6U
 k4PL06G0j2V6K4mo43BgSBI=
X-Google-Smtp-Source: AGHT+IHMdPQ2QtW5yU2b2dt9f2R5tCBBY9cZcDjn3kOiBkH32eq4Hro3OHpjk2HifsZJuPKZ+LswRw==
X-Received: by 2002:a17:907:6194:b0:a23:8918:2399 with SMTP id
 mt20-20020a170907619400b00a2389182399mr608683ejc.130.1703000413674; 
 Tue, 19 Dec 2023 07:40:13 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 wg13-20020a1709078f0d00b00a2687065e28sm307346ejc.45.2023.12.19.07.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 07:40:13 -0800 (PST)
Message-ID: <4aeef6df-2616-0741-00a3-6e45ec63f920@gmail.com>
Date: Tue, 19 Dec 2023 16:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] drm/rockchip: rk3066_hdmi: drop custom fill_modes
 hook
To: Maxime Ripard <mripard@kernel.org>
References: <f86ec29f-194a-800d-0aaf-9e16e551b37d@gmail.com>
 <410b116b-cb63-7ba7-3689-4f0832ab5796@gmail.com>
 <evaq3yfbqf4gchsps2qoojemtii7tmcss24aruiuze5kkzlnhy@mih7rky7viqz>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <evaq3yfbqf4gchsps2qoojemtii7tmcss24aruiuze5kkzlnhy@mih7rky7viqz>
Content-Type: text/plain; charset=UTF-8
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
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 tzimmermann@suse.de, andy.yan@rock-chips.com, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/19/23 13:55, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Dec 18, 2023 at 04:49:06PM +0100, Johan Jonker wrote:
>> CRTC size validation for the display controller has been added with
>> Commit 8e140cb60270 ("drm/rockchip: vop: limit maximum resolution to
>> hardware capabilities"), so we can drop the custom fill_modes hook.
>>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> 

> I'm not sure those two are equivalent. CRTC and connectors usually have
> different requirements and capabilities, and thus different,
> supplementary, mode_valid/atomic_check implementations.

Rockchip RK3066 CRTC and connector resolution max_output are equivalent.

From Rockchip PX2 TRM V1.0.pdf page 17:
- Video Encoder
  Maximum frame rate is up to 30fps@1920x1080

- Display Interface
  Support LCD or TFT interfaces up to 1920x1080

- HDMI TX Interface
   HDMI version 1.4a, HDCP revision 1.4 and DVI version 1.0 compliant transmitter
   Supports DTV from 480i to 1080i/p HD resolution, and PC from VGA to UXGA by LCDC0 or LCDC1 in RK PX2


Compared to the drm_helper_probe_single_connector_modes() this function added an extra max_output

Checked in rockchip_drm_vop.c is:
https://lore.kernel.org/linux-rockchip/20230216102447.582905-2-s.hauer@pengutronix.de/

+	if (vop->data->max_output.width && mode->hdisplay > vop->data->max_output.width)
+		return MODE_BAD_HVALUE;
+
+	if (vop->data->max_output.height && mode->vdisplay > vop->data->max_output.height)
+		return MODE_BAD_VVALUE;

For RK3066 VOP max_output:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/rockchip/rockchip_vop_reg.c#n506

This patch was made with HDMI in mind.

	.max_output = { 1920, 1080 },

This first part was added by Heiko, but not was not part my patch that I submitted:
-	if (maxX > 1920)
-		maxX = 1920;
-	if (maxY > 1080)
-		maxY = 1080;
-
-	return drm_helper_probe_single_connector_modes(connector, maxX, maxY);
-}

Original patch:
https://patchwork.freedesktop.org/patch/msgid/20190330095639.14626-2-jbx6244@gmail.com

+static int
+rk3066_hdmi_probe_single_connector_modes(struct drm_connector *connector,
+					 uint32_t maxX, uint32_t maxY)
+{
+	return drm_helper_probe_single_connector_modes(connector, 1920, 1080);
+}

Rockchip RK3066 CRTC and connector resolution max_output are equivalent.

Johan

> 
> Maxime
