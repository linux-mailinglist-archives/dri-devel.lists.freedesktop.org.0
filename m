Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D2B389102
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D426E6EDCE;
	Wed, 19 May 2021 14:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929276EDCE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:33:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so821764wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DCQ/kFDivgK7GQNYhLKETXZZY70HNicwNr4SprqTshM=;
 b=thuJugNL923dMzFnEsVGIaIZZZrP03SU5WUwFJ/UlId06Fx0wC6czVpNH8MRjBrVSH
 Fw8hYXX9gbUBKkxhZupMKfoUnEiSlS+eFGv6OO33TLzo37AfZaxLMXQyPvdaGVrPAEYl
 CP49oxYDuaVorakDyLwZExpae5Z2LY0E1rD+AlhDeq7o7KctgMKZn54BiGptgXqaaF2I
 sO54wDuqUU/+iFx+/PASGI7pk9Szld6LZf50aDCv/nlUIYbK3z60Mk4Y8270ZqAb5/JO
 a4zp2vBSKO8uZrejZTUQa+FKV58G5yoRd3C2teZ0nEdcxOzc24Momse6vpHa+yZ0de8r
 U0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DCQ/kFDivgK7GQNYhLKETXZZY70HNicwNr4SprqTshM=;
 b=p8w6GVlFlTxthMQbtixiY8I+eaOUO1iuYFqoKuquiXEinAqqME4h2OkX+sOpDvUOtI
 EDg5J81tcUoN4vvJCjBTmhBpf8uMYgkMyMEpe4/6cv5iKPgCe+aU32XZlxxVNHZxJFz8
 VdmtFRYTh4iDgJXHdgOvDnvWjVgjmQq2lpZjweTsaRdFsc1XIsZTP16fJG23+sxmyPJw
 i92JUkzkuM1Do66Q3lrUkaYa7A6YGUr8L1vDbb7CYINeeyPGzbXJuK8ZM+T8Og7ty3nI
 403v9pHGtftWS/342BqooGNEKsl3ic2gDvn7V0sXVw5sHPug80ldz0UI1ef9/X6XRsO5
 vElA==
X-Gm-Message-State: AOAM533F1H28OviC2oyoM4EIi39VUJ9kSVjUVJXUs0MX+74b1196l2HA
 zNuptmppTDGr657hnIfXF/tn7Q==
X-Google-Smtp-Source: ABdhPJx4JB1bRalzDlI4ShWWTZFpYU2OBLRYrTfkbbKxLsPeJCa1PyVKw840yKYR+zYU6HfFI6ZKhA==
X-Received: by 2002:a7b:c742:: with SMTP id w2mr11918923wmk.76.1621434809298; 
 Wed, 19 May 2021 07:33:29 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id y3sm2894271wrh.28.2021.05.19.07.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:33:28 -0700 (PDT)
Date: Wed, 19 May 2021 15:33:27 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] backlight: lm3630a_bl: Put fwnode in error case
 during ->probe()
Message-ID: <20210519143327.GE2415519@dell>
References: <20210510095716.3302910-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210510095716.3302910-1-andy.shevchenko@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
 Brian Masney <masneyb@onstation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 May 2021, Andy Shevchenko wrote:

> device_for_each_child_node() bumps a reference counting of a returned variable.
> We have to balance it whenever we return to the caller.
> 
> Fixes: 8fbce8efe15cd ("backlight: lm3630a: Add firmware node support")
> Cc: Brian Masney <masneyb@onstation.org>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/video/backlight/lm3630a_bl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
