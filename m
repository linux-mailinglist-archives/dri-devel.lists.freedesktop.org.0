Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE02C2D9BAC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 17:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CE06E301;
	Mon, 14 Dec 2020 16:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032D36E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 16:03:34 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id k4so17700222edl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 08:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1R4GDxWiInTOSiMoQjKp8/x2VzpM54rp3XHLP51YQwI=;
 b=GyFMqPkHOsBaPadZ6HtFjFXZjk+cf14fFCIW4LbNksT1dc+wrNHVjI3OqHC1c4AM1K
 hiiRlXmdVKCzS5LPE08sPD7/vwpJ9zwlxGi2Ltzvc1/pc4pX/J4Zii/bDjNBO/+nm+zb
 WXU75oZYhL+s86Ryl8i3J2YDU4OgLUUH59NUvvxpAA8EaHrKaU5PFYW4sS3DQGm6PBWf
 s5FX+0fssQ6Yzyo7VmXi6cGdNTM0od18eDZtyXsrr8br+x/FkfGCD+GcoHdHWYlCgHEu
 22WZnAPfRQVRdAWTI3FqrRSUa/df9L+T7wuFaZjVj2K3chEQSttqvMcCzyhh8VFQSnF0
 3SsQ==
X-Gm-Message-State: AOAM530p9lIz/zdYy8n7nL8rPgSd1pXLLrZ9jaX89nQgu2Nb2fDU5/Cl
 Vp8X5CrG1i/Vp5kcz+m1EkU=
X-Google-Smtp-Source: ABdhPJzHHpwR8U0nzeJSHKtRQNJXEPTkA0gNm/3ZDzH5g+76QEADqu0ZfPZUY/ikA7431T6AhNY6JA==
X-Received: by 2002:a50:9dc9:: with SMTP id l9mr25315986edk.377.1607961813452; 
 Mon, 14 Dec 2020 08:03:33 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id f18sm15784210edt.60.2020.12.14.08.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 08:03:30 -0800 (PST)
Date: Mon, 14 Dec 2020 17:03:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] fbdev: s3c2410fb: convert comma to semicolon
Message-ID: <20201214160326.GE2493@kozik-lap>
References: <20201214133317.3622-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214133317.3622-1-zhengyongjun3@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 09:33:17PM +0800, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/video/fbdev/s3c2410fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
