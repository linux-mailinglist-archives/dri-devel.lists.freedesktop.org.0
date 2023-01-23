Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 572BD677E0D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 15:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563AF10E4A7;
	Mon, 23 Jan 2023 14:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CEE10E4A7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 14:30:56 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z5so10992391wrt.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 06:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Da+hSgaK1WT1wNbShCQdIMzhNbm+JCBNC1eXaZYQxFk=;
 b=tU8ACDmnm9fiGwunC7HIXCP8Ktp9bCMq5U11MQkNlNME2Huocmq5Et448WBGb5jai+
 ADGxO7Beqc8tuuXO3z+b12QKQgpZ+aw1iuRBTBPpm3V/vbBX8rFVkeoZivusI98OrTFf
 iD4SslwY72kanILbDAP1c7W8dz7RNMYC1W+uV3vThRUFxixBEfLQSsk3rNibOex3HOis
 AwkS3dP6OrrpfquzoZKq76Oe/PAoS0f1zYoWovWErMmxJ4yMlj9wEX1d7dU2eAnmZBqN
 1t8pwAoy3xyrZCfx4wCG/wc1ngIy1x/leAPP/vb8VANwRAjNfO9FuBpmADRF3zZjpTwJ
 1DUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Da+hSgaK1WT1wNbShCQdIMzhNbm+JCBNC1eXaZYQxFk=;
 b=W2CQV4nnGAHrkOFEdl+bFuHAeCSwrSWv7LQ4mVPXLg6R05LOwPmDE1EiKi+71eO0o6
 fkz35/mYYD8I9XvdzcsbN8tAAmc1F2Lljwx2uyXzSnTdR9pq2M2IDSB0VQjow/ldSRfS
 Zo3vnJlwnEJoEBt5vswgiv5r3OsXTcrS2C+lV98Gia3EEJ23krPItYQ78dsxy5UN1yBq
 ZTgPyfyjjDzrGStlHB9NCgRTlwpv+9gNA+3x+VEU9oJmd8APq5rGsUhuLi5GSuRdmXF3
 Xoab9wzdRRz/cS8y0xNvLMKM0OXxpKwpCVks5QjhijIGWetK6+g7IzAEslW5dlLrKQIw
 YbSw==
X-Gm-Message-State: AFqh2kqbut2afyebokkQJNOrfIIsmgWsU/3ti8K60DhhhvYYWeKik9fG
 MLTqAD2Y9V1DMpf2kSI2H2iO9w==
X-Google-Smtp-Source: AMrXdXu+/DzWFdvmrnHqMwUtpEwkMO5ieJgcY5ksKjZub1P+gC1GsvWZFBORDjzoRtJl3KmDgpB+2g==
X-Received: by 2002:a05:6000:608:b0:28f:29b3:1a7f with SMTP id
 bn8-20020a056000060800b0028f29b31a7fmr26030725wrb.36.1674484254755; 
 Mon, 23 Jan 2023 06:30:54 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 c14-20020a5d4cce000000b002426d0a4048sm5068204wrt.49.2023.01.23.06.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 06:30:54 -0800 (PST)
Date: Mon, 23 Jan 2023 14:30:52 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH v9 2/2] backlight: ktz8866: Add support for Kinetic
 KTZ8866 backlight
Message-ID: <Y86aHA5JMHPgkB9A@aspen.lan>
References: <20230120155018.15376-1-lujianhua000@gmail.com>
 <20230120155018.15376-2-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120155018.15376-2-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 11:50:18PM +0800, Jianhua Lu wrote:
> Add support for Kinetic KTZ8866 backlight, which is used in
> Xiaomi tablet, Mi Pad 5 series. This driver lightly based on
> downstream implementation [1].
> [1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/video/backlight/ktz8866.c
>
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>

Thanks for all the changes!

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
