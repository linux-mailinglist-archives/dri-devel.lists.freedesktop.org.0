Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EFA3496D8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 17:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD7C6EDB3;
	Thu, 25 Mar 2021 16:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26756EDB3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 16:31:37 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id v3so2345727pgq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1rk0lMdfic6T8FzgQX46kyAy/H7cmQtjKeViSHPt/tc=;
 b=Oymlkos7+dYkFe689RLE6JqTySCe5lGo30nijzNu/xlA67II/D0MTcuokaPt0Ec7An
 22NENOJwiiU6SBiMqJ6jr0ykPSNnm0HSU4TzBMtNqUOwaMzRNvyULYgtNyw52HD3oPq+
 /Sbj7D+lqzfGxHDdq9I+yQaBhdIo4/IGyRHoQZxhTfbJm51OFCKz91kFe46Oq4Kh5Z7M
 qO23FtQz7six/ftkTZcf/QA4MWzAgWDtJlJP+nNRQkhz39sd0E4uhUaq6cQgDNmkwSiF
 vf5rbhwaGBYbcjD6kuW2y63/lBLm1jQURAOW9INo5W90QZb/am8HkPhzaC2CgSYQeLxy
 xLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1rk0lMdfic6T8FzgQX46kyAy/H7cmQtjKeViSHPt/tc=;
 b=fFvAQz6tXWgujyZ2WA4wK7U63k2UAeDE6QFPaniOeCC7eLc6zGRyEsk4tTZY/EFXEe
 60e2IneSrNh/PEds0EqLzWUM4RwBVFi42qVMuBw89HuNBNPVm2AD/CQUiwWImPRD4Tfk
 inwLR5q1M4+VKZx/Dm5ZDNlazz/5/ydGC0Xu8YjeX4lKmqQ7raCBhPau7D2lU4ndI6Rh
 zbByasdI9YSnJ3Z0M64SgnERQ2yA2esyBHrun61TP8hmdkHg+04zVSAYX+BZkq6u1Y9y
 mJ4pClTIF53GTVFacZ6PysfbtGOyJMtgRBldO6LkAqo8y6CoJ4nfeFq0rqLtXfDVR8t8
 xgrg==
X-Gm-Message-State: AOAM53139TYZ37QPYgrswy/OWu12Vbk3SioPQgF3Ui0QLqz2yEEHR3w5
 SM2qGFh135tPn1IEohHzzEGLIFgxTjVn7UKfO7/YOw==
X-Google-Smtp-Source: ABdhPJwEMYCDOMvtNtf62LxlQetuFPcjrxC72s4cpA+AUgsRz7y/xZBYsBvAVTWJ8AOGwiqKr5YWUH+koOSXOkvwlLM=
X-Received: by 2002:a05:6a00:b54:b029:207:2a04:7b05 with SMTP id
 p20-20020a056a000b54b02902072a047b05mr8916394pfo.12.1616689897368; Thu, 25
 Mar 2021 09:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <1612689000-64577-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1612689000-64577-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 25 Mar 2021 17:31:26 +0100
Message-ID: <CAG3jFyshwH3szLESkYXjFokVbBqELHswpwkLDAArJg+dWJ3nbw@mail.gmail.com>
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

Pushed to drm-misc-next

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=fffa69aa6b1c89853cd00dea969e4754633596d7

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
