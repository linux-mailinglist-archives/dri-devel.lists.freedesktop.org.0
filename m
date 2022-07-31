Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7C5585EA7
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jul 2022 13:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C8DBC6F4;
	Sun, 31 Jul 2022 11:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546ED113EBD
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jul 2022 11:32:49 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id e132so7390364pgc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jul 2022 04:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=9zxYvVb7b8LZLTBs71kugtnLomBjlBQUO9h/IsY7cyk=;
 b=I/HBjugbuX1kfRW3rikYJwk4ncEkL69ipDZZhQV2ws5vwB+xXuHZLLJw6evWq77VQm
 nuEJWV0PBIW/oG54TENBgeP7u3eWlbl7LPN+aLuhQ1vsrukH8hJn02xjvgR1tNRHTTW7
 sIHUE49DeSdRzNuGFRx8lPCmZm/e56cjXw5rQ/Spa1m2ShXrSFhmfK/J9oHW8Xo95kEG
 YcmBguqez2z0nLAaviwhhsNjJREcDOqKghZto3XjwtJRGk35YijN9dsMyAQ+rNVLjm5f
 ouWrXflh1JfCfxPGJ5A4r1sc7FTXYP17gS+eX+Pn153HqcIBcj6i5gg7Wk8d0bJUBaHJ
 j+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=9zxYvVb7b8LZLTBs71kugtnLomBjlBQUO9h/IsY7cyk=;
 b=gx+8udxCkQ1ROF6Vy11UXyZw/g9A+p/JroAcCFc8ylu9ZdpTIZF3xEHB6vDfmstUEq
 NXaoelAfzrfmt8+gRbtUH1Yr9OnkoAEgO4zFQ/NU7UMZ3YiANoMiRfFlttXGG9YGnruu
 7lnPm/CChJsY1gD+td12g9+De763L21patE0M6X/DUOEy4iqErsvvrGENrlMEYjDnW4V
 1PdZ9gnrfMplsdsf8u27UVdLUGAaz9G41ld5aEOQxHfRFfRVH46tPXjSgm4FJ3A34V/W
 LRaNDdHft3WwNmeQojCDBOxB9Xw5TN7qioVyAGmLm9OcU5NBPcR+Tty3TBEdUf2Vvxg5
 29SA==
X-Gm-Message-State: AJIora/QNXncAP3E6bR95W2yH4j6dVblXjOT8Ba8KqpVEMbK9TBZaa1S
 qCCbe1VAKzJsvTOii0Szqz/4/HRP4Z3zJA==
X-Google-Smtp-Source: AGRyM1u9NHvpHt5MchqETPsuNoKOmNKdCOuJGDsUH1Ao13fjbnfwEJmvsjIYwhFNGeGKRnGnQFmHnw==
X-Received: by 2002:a63:121a:0:b0:41a:6792:31e5 with SMTP id
 h26-20020a63121a000000b0041a679231e5mr9432755pgl.69.1659267168467; 
 Sun, 31 Jul 2022 04:32:48 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.145])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a170902e5ce00b0016c4f0065b4sm7358652plf.84.2022.07.31.04.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jul 2022 04:32:48 -0700 (PDT)
Message-ID: <166886f8-eb9e-f779-cf57-1ea353adc446@gmail.com>
Date: Sun, 31 Jul 2022 17:32:41 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] vt: Clear selection before changing the font
Content-Language: en-US
To: Helge Deller <deller@gmx.de>,
 syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <000000000000bbdd0405d120c155@google.com>
 <20220729065139.6529-1-khalid.masum.92@gmail.com>
 <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de> <YuV9apZGNmGfjcor@p100>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <YuV9apZGNmGfjcor@p100>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/31/22 00:50, Helge Deller wrote:
> When changing the console font with ioctl(KDFONTOP) the new font size
> can be bigger than the previous font. A previous selection may thus now
> be outside of the new screen size and thus trigger out-of-bounds
> accesses to graphics memory if the selection is removed in
> vc_do_resize().
> 
> Prevent such out-of-memory accesses by dropping the selection before the
> various con_font_set() console handlers are called.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

Tested-by: Khalid Masum <khalid.masum.92@gmail.com>

> Reported-by: syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com
> 
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index dfc1f4b445f3..3f09205185a4 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -4662,9 +4662,11 @@ static int con_font_set(struct vc_data *vc, struct console_font_op *op)
>   	console_lock();
>   	if (vc->vc_mode != KD_TEXT)
>   		rc = -EINVAL;
> -	else if (vc->vc_sw->con_font_set)
> +	else if (vc->vc_sw->con_font_set) {
> +		if (vc_is_sel(vc))
> +			clear_selection();
>   		rc = vc->vc_sw->con_font_set(vc, &font, op->flags);
> -	else
> +	} else
>   		rc = -ENOSYS;
>   	console_unlock();
>   	kfree(font.data);
> @@ -4691,9 +4693,11 @@ static int con_font_default(struct vc_data *vc, struct console_font_op *op)
>   		console_unlock();
>   		return -EINVAL;
>   	}
> -	if (vc->vc_sw->con_font_default)
> +	if (vc->vc_sw->con_font_default) {
> +		if (vc_is_sel(vc))
> +			clear_selection();
>   		rc = vc->vc_sw->con_font_default(vc, &font, s);
> -	else
> +	} else
>   		rc = -ENOSYS;
>   	console_unlock();
>   	if (!rc) {
