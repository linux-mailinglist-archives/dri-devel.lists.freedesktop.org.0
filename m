Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A253A6623C0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FD210E3E3;
	Mon,  9 Jan 2023 11:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A947910E3E3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 11:04:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w1so7749823wrt.8
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 03:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F1o1h0/8Z9CTd9JzV9HYcBGjMEGQHN88SqgrqMI3CKE=;
 b=JfOf7Ybc+GU1nn8y1UcCvxhLZxdJnTmM6yTssoaGD6iHkSp9kw+vB/gkiSd9BYh1Ev
 0QFxzWP/4tG540eJGRXWjtCmZaqkjyjagRDq8bBhASM3grdf91bjsYv4KgV91OB6++4s
 YsO8YvQsF+0XVZ29S/f//4CfrmOe9Sy50FKX3juIAKrtyF082yVw33n51qKs/qdi7yYI
 5jeqjXKki1UkPiZnTc5D0T6QLRHn9xrUgbQ09ydGm4qnjFUmkdixeoByKFU5eYtKy7FR
 6A31HILTPPT2+/z7YlxLdMYcewFPN71b3Dgv09t0GfYu7LRrYZNWfX48SDylX3W4GzdP
 ASMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1o1h0/8Z9CTd9JzV9HYcBGjMEGQHN88SqgrqMI3CKE=;
 b=dyd8zdyqSudCC3mzFfqImnPTUyCo05GXp5ROX0XT0yvZDM7vO5IV2wCzJGbbPjc9TK
 gFg4yKXx8bF0NamGZya+3PNdHUgG4Y0crXa9DMim0twX3hbqqU5tswqjtJ9dDBslQwSd
 ED9Q6UMsxb+EncBDa9eeSaBxM2r71ZWJ1OucVDerhYUxdvKvqmKyhineMY3lTMwezEG5
 JG0WEtcAND4R6iyV61lS/qSC8wj+PKqZEwJ4EStVO8LWZvW0ca8cwcQPvnsAVs9kbNTW
 REq8923hejpdXd8jmH8mDnEG7Aj+suY7jiQMQrFloVV9+LrpH3Qc20+G0e/DMdC0zJhK
 F0dw==
X-Gm-Message-State: AFqh2ko1C4fVF5a0NtEyeabQytu2tBxUAp0KKBxzrfK2aGUQnXvosLDI
 KvZp0jMwCE9pOkLa5esD6Cwq2w==
X-Google-Smtp-Source: AMrXdXt0sWws9FC7FmSd3zSlUGnJeOxvVL6lisTvf8bQ3vSNu8uoGcg+vPo7j6+ZFs9pmgtUvQuw9w==
X-Received: by 2002:adf:d846:0:b0:29f:4e42:33c5 with SMTP id
 k6-20020adfd846000000b0029f4e4233c5mr14183491wrl.55.1673262277116; 
 Mon, 09 Jan 2023 03:04:37 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 z6-20020a5d6546000000b002bc371a08adsm2060413wrv.101.2023.01.09.03.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 03:04:36 -0800 (PST)
Date: Mon, 9 Jan 2023 11:04:34 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: sam@ravnborg.org
Subject: Re: [PATCH 14/15] backlight: tosa: Use backlight helper
Message-ID: <Y7v0wiBHXy7lH6tz@aspen.lan>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-14-1bd9bafb351f@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-14-1bd9bafb351f@ravnborg.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, Stephen Kitt <steve@sk2.org>,
 Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 07, 2023 at 07:26:28PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Stephen Kitt <steve@sk2.org>
>
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
>
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Just for completeness...
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
