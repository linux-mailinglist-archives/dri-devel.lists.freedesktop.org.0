Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B603891EF
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC306EDDD;
	Wed, 19 May 2021 14:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783216EDDD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:50:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h4so14296426wrt.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jzOpdXiLDWGUEJF2EPWEV2fpTf3RICa3e5yUqeDdorw=;
 b=fmjuW1CE4yNWATIkEhIlhyAcIxhBepjY8dpsjmF2trgLwRV+pzo0bH/7HF3nswJyw9
 tJjev238hlq7nt4aq8KDfWgybqHJQ1sVX3XVwNQYj5WvBXSwPyxY0wwnALzCORKlGvOA
 E1ZkZLwOqheyT+JGldJiWWmlyqeC/ObjpVEGdcx7Tk4f6iYftuJme720nKySAaPYgLvB
 UiYDdHFWvYRKcgYI91gMeWNo7XjlgwZ9ZOybn3JdM8O1CQ2VZIyh1Iy1J2f7t6hLOAzg
 0MEknxvzch90W0UK2WPHLw4NzZkINEn0mpEx+XL8Q4sleiVJ8VSIXtmgadfq6Hv8hoDB
 gPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jzOpdXiLDWGUEJF2EPWEV2fpTf3RICa3e5yUqeDdorw=;
 b=lo5697aPxsHRZGd0RxNSP1BXBQZFtOG5+EbHDTa4yidlTsT54liUf4fXQ8JdjP9hUI
 DYwt79s9dbVVupvem4heApG7EvKoOyOS+PGQNDKI8NM/ACDm2iAVPsA1eeVe4cJZo0qf
 h6nOSswxoMUxuRxqnGN4rRvsE+1UP86MRkS836Rff3yGiJP/WjYDlhgfJRrW7BLVytPW
 ZliCPVJdj744Aw3dkdU7d8dTbqtMZQOVY3A7fMBiNJNomtqXWGXrzHu4i5y59JpdLpcp
 Cff0F/xrAo0dkDssuTdIG9ttgRcI4jw4S12mkpOgxdLhYcN2S7zC6diDFbhguMFksug7
 Qg7A==
X-Gm-Message-State: AOAM5338+nkd6ELQHwo0WNzLVVX79DVGCfeY+vTixOFLRBDrk7UZ2Ej6
 DWzQxR8bXvBoXQzT77X5H2op4g==
X-Google-Smtp-Source: ABdhPJy4j2tptE/O7091QF9VE/9nmRwj16cpS+71mXYwcpZQStXYpsYFrQKNwdyhvJoa0BGQe/yvAg==
X-Received: by 2002:a5d:534f:: with SMTP id t15mr14628914wrv.206.1621435843140; 
 Wed, 19 May 2021 07:50:43 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id d9sm24271551wrx.11.2021.05.19.07.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:50:42 -0700 (PDT)
Date: Wed, 19 May 2021 15:50:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v7 2/4] backlight: rt4831: Adds DT binding document for
 Richtek RT4831 backlight
Message-ID: <20210519145040.GE2549456@dell>
References: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
 <1621262161-9972-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1621262161-9972-2-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 b.zolnierkie@samsung.com, jingoohan1@gmail.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, linux-fbdev@vger.kernel.org, cy_huang@richtek.com,
 broonie@kernel.org, dri-devel@lists.freedesktop.org, pavel@ucw.cz,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 May 2021, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Adds DT binding document for Richtek RT4831 backlight.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> since v7
> - Add allOf property refer to common.yaml.
> - Remove default-brightness/max-brightness description and refer string.
> ---
>  .../leds/backlight/richtek,rt4831-backlight.yaml   | 62 ++++++++++++++++++++++
>  include/dt-bindings/leds/rt4831-backlight.h        | 23 ++++++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>  create mode 100644 include/dt-bindings/leds/rt4831-backlight.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
