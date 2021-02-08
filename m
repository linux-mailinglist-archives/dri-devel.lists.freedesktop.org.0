Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26139312EF8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 11:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357106E442;
	Mon,  8 Feb 2021 10:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B436E442
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 10:28:03 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id x136so2860732pfc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 02:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HTp7udRkA3dd9a95DV07tgoiccHtwyBSjPKDtzZunfo=;
 b=e0Tn0I9XipZXByn0gqAsbWHGHwvggsizgJKiSlTjUCw6e26/D4lxqNzturp76cfDzY
 aPf72M1s2NE+7EZu81q/TMpPlh6nHZ6YJVgginoB8q6iubUk/4eEqN39psNOdFb3qQUL
 6nX+swa3yUsWz++0cCXzfXFw44RFcrxfJ4vjVug4PC1zOe0bLnvjQXkdYmkWXbyDth6X
 r3Cxbxe+fYEvLjMk+KmOhnpYYScKA/PgBRTr1V17mcoOM3ZaugAO2poZljsOZiRfPHn1
 ZYcphn3COqjQ0aR0PQnaLBgJ5KUjRQN8MF9LyOrliQCmgkW79IgQR8ZWaou0AA0rLzp9
 p57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HTp7udRkA3dd9a95DV07tgoiccHtwyBSjPKDtzZunfo=;
 b=mfaWVmaX6VdQmlZBvKQr8a5wEbCkA/PUGlsb7x1v3Cie6RNOa5152nY+tV70+SE6eH
 47OaqQyiBhTHxr36JLIIDUKI07gVKW+yEKA1ic7h6Psvmb71YL/xliW4a/mbTwDuFpuB
 TfqF9R1/rxyGiPy+unG7cGfmHb4TF2UWqcKsFyJcZhrt2w7eFgjjDOyb/rL5a+uU9VHZ
 ge+AHoG5kdHDS/nXMgomo5sRSrZ1OvpdePlzh8Oe6fhLq+ZdX2UAemLD+Ae++bhuupP9
 6om9jH7SMeePJNeXoa4i3A+rULNg/xl+/K6aDSVfv2l6WHiVXhH9LwKDyXQw19z6K+wK
 1gkQ==
X-Gm-Message-State: AOAM533VVuAeIpuJ7YIHcBuYOVRCuhvMpnuh+3NZk1cHEYGlB5FPMvDA
 CHDPDD1/17J2JRL5hYuUIXzeh4b6c8Noq3Vbds113A==
X-Google-Smtp-Source: ABdhPJxB34MNMwiU8/Kb3s3oSCJIPktd60uCekFOnvb0yo//2g/M2/R4HDZA4Ujeew57zrKclcJII8arYrvBJ52Hd8Q=
X-Received: by 2002:a65:654e:: with SMTP id a14mr16656393pgw.265.1612780083089; 
 Mon, 08 Feb 2021 02:28:03 -0800 (PST)
MIME-Version: 1.0
References: <1612689000-64577-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1612689000-64577-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 8 Feb 2021 11:27:51 +0100
Message-ID: <CAG3jFytz7p+3g_tboutC2qCNeNqZnTUJcn-cH-5TAmaWaCPByQ@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: convert sysfs sprintf/snprintf family to
 sysfs_emit
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Jiapeng,

Thanks for the patch. Feel free to add my r-b.
Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Sun, 7 Feb 2021 at 10:12, Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
>
> drivers/gpu/drm/bridge/lontium-lt9611uxc.c:858:8-16: WARNING: use
> scnprintf or sprintf.
>
> Reported-by: Abaci Robot<abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index fee2795..3cac16d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -855,7 +855,7 @@ static ssize_t lt9611uxc_firmware_show(struct device *dev, struct device_attribu
>  {
>         struct lt9611uxc *lt9611uxc = dev_get_drvdata(dev);
>
> -       return snprintf(buf, PAGE_SIZE, "%02x\n", lt9611uxc->fw_version);
> +       return sysfs_emit(buf, "%02x\n", lt9611uxc->fw_version);
>  }
>
>  static DEVICE_ATTR_RW(lt9611uxc_firmware);
> --
> 1.8.3.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
