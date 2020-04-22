Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8A31B3A1A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 10:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5BA6E359;
	Wed, 22 Apr 2020 08:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA426E359
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 08:30:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k13so1314414wrw.7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 01:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=N198uR7DHjzE6ifgeJ0vSDotBvsASzMwI3aPwyINxz8=;
 b=OOdahWIVeJP86hKdDj+G+A4SUywqZHOA9g2/p2WSYlkN/b3XF/jhbWsKiAo8q5cuI3
 a9Tuo5VujiToojBzvN6J2ib1eZyZc7RhxrkwygQ3WdAHKksC5twnENsK3+j4HOAEmFdf
 KkduORTEnAXCmHj717psnhxt/iRMMkuRAf/is4BXVzzW38BF24/NDAhK++JE0GNnwQgl
 gjDB3bp+aUbmkSgTdUZg8eVHe86xt4NdwbMzX8zDiyAaAskV5InUIPVVCIlSXx5xDaxS
 Bf0NCpWD4FaKvMY8bXyR7Ptr2k9PVADSXEXHdmQUV8VYtHJoumLwgXzH1ZJPS1PLUiHZ
 3DnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N198uR7DHjzE6ifgeJ0vSDotBvsASzMwI3aPwyINxz8=;
 b=NaXTFnQub0PM8CTS3IiYwCDPmHi2JX58Io7cALSrys9ueBCzzXBBdPfHdZfA+Pb3dU
 q6hahlBlZYhsaQcD+/+lMqG5fV9NjxZm781tYiFbr5v1xM41825mmLplaOfo71+yIm4g
 HzN1PCV9TuoWFHArUK7ds5ofsAk0yXsnr/nY3RZ2iDWiMk3IQHQb+W6L0972KAbsDfXK
 g3zIMcu+1trdKcmQSuxnXH0P7orDHj7wfL9CRK88o3CGB1pFH+e5dokgbSD/BePBEKrb
 VvMo9cr1AP0G9QVldeBUSDRmZyvlMMdZa174plMX6SXLMHhwjzflhDFThlzRmvGPeJCL
 rxAQ==
X-Gm-Message-State: AGi0PuamswSCqsb6dyhGwfiQZvT8YCDZC95JzS1oXPqxy87jlwgMGuK/
 YA6UMk+Txb9I1WqijWaFeT82Kw==
X-Google-Smtp-Source: APiQypJGdzse3wJsfuMTdqC+mxzZ6VnuBuO5qZKa8jUH1hHazlsfCuwyDvd2tOAPfdYzma2kYhOO3w==
X-Received: by 2002:adf:9564:: with SMTP id 91mr29278554wrs.246.1587544237873; 
 Wed, 22 Apr 2020 01:30:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 36sm7374394wrc.35.2020.04.22.01.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 01:30:37 -0700 (PDT)
Date: Wed, 22 Apr 2020 09:30:35 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv3 4/4] backlight: led_bl: fix led -> backlight brightness
 mapping
Message-ID: <20200422083035.wiujphrt5k7o244v@holly.lan>
References: <20200422065114.22164-1-tomi.valkeinen@ti.com>
 <20200422065114.22164-5-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422065114.22164-5-tomi.valkeinen@ti.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 09:51:14AM +0300, Tomi Valkeinen wrote:
> The code that maps the LED default brightness to backlight levels has
> two issues: 1) if the default brightness is the first backlight level
> (usually 0), the code fails to find it, and 2) when the code fails to
> find a backlight level, it ends up using max_brightness + 1 as the
> default brightness.
> 
> Fix these two issues.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
