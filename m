Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DF26FE128
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 17:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63AB10E4C4;
	Wed, 10 May 2023 15:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F05510E469
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 08:51:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f42d937d2eso8550395e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683708698; x=1686300698;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dlbrk4ZPhxYJQ2iwlQYUgs1YMic9U6ZFVKSub2IU5aA=;
 b=Yp8TzKP3TmqtoNZ+fCizpDtzsNuLZntoDVf8jYnpn9qBGzOCC7t/hwHmQBX3wV/ns8
 kySBKurqNOP4UJQGYmQ0WaW/LSziLYl5JVvzVzJwXkdxR2U44bplU/5IGsy+VoN0frEM
 gMooL/sEXvab+yLWktPd+iW7AQKIcBzV1nIupZqU5wnqlDFXJJAR33zfGr+1fPCdWiys
 LYNtW4YfILFX/wB5JuvE+Im8c7O7XbHODq4wDlxObrLPR9PHnww+Sn5SAgGB5bXud38u
 MTlB8+FvvuCbMP5zDJ+mHQilzaSyS5DEU4k7as1Q9Rd1Aj8Fe1VZORR7Gy58EBUwFFha
 UcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683708698; x=1686300698;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dlbrk4ZPhxYJQ2iwlQYUgs1YMic9U6ZFVKSub2IU5aA=;
 b=E/vNoiNH/Vp5+Aihh0OpESHAXU9NlM475BlwqoSjWknVGALHhuBs98nrlBvyBQitrj
 Xvt54yAQ6wV2fZuECgDHpE3WkL/3zExQq6rq8BJ71u3iRg9lYYCWaeai6Dh0omqNJVIH
 47IGBUxSr02VFaXhJF8OfGN+bfSir0UVHOcLjNGT9eLkKlRwXT3sYlh5LejPfPC0MWEu
 ImLsi7khSPnWOzDARL7uliS+4lNnqzM9oJ6TQJ35dLkLJLguVIXBm4Od2C7QyyB1157u
 5Y91TFIGPnmLIqU1f1LNwziiDQd3zfTm/z27jjdjAPPP7Px/NWpjTvSqJh+MKqfDEjCQ
 rOWQ==
X-Gm-Message-State: AC+VfDxOpcCr1GVZoaItiV8iACfkLqfNELwRLWbeun78SMq4GnCERVO/
 kweAxcUPGzRmFVnhL6KSh6g=
X-Google-Smtp-Source: ACHHUZ4AeXulhEHTiTvL5HA71WfLqKjAEc3fIwJyAKBWxzr5/LME6Z9PVS3weTa+vNfic/xkXytfZw==
X-Received: by 2002:a7b:ca4c:0:b0:3f4:2819:7777 with SMTP id
 m12-20020a7bca4c000000b003f428197777mr5585021wml.38.1683708697661; 
 Wed, 10 May 2023 01:51:37 -0700 (PDT)
Received: from [192.168.1.131] (cgn-89-1-213-9.nc.de. [89.1.213.9])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a5d5481000000b0030647d1f34bsm16850080wrv.1.2023.05.10.01.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 01:51:37 -0700 (PDT)
Message-ID: <9b89164a-bd8a-bdea-2c17-101428aba98f@gmail.com>
Date: Wed, 10 May 2023 10:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1] backlight: lm3630a: turn off both led strings when
 display is blank
Content-Language: en-US
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Maximilian Weigand <mweigand2017@gmail.com>
References: <20230505185752.969476-1-mweigand2017@gmail.com>
 <20230509132735.GA31274@aspen.lan>
From: Maximilian Weigand <mweigand2017@gmail.com>
In-Reply-To: <20230509132735.GA31274@aspen.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 10 May 2023 15:07:55 +0000
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



>> Use display_is_blank() to determine if the led strings should be turned
> 
> Shouldn't this be backlight_is_blank()?

Yes, indeed. Thanks for pointing this out. Fixed in v2.
