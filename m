Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E376026E8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 10:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9B410E470;
	Tue, 18 Oct 2022 08:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51F010E470
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666081760;
 bh=fm0i1uQ9j+xRDrJ/tsIQ4TxqAKdNzMgiZeV5uu2HHwA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=CxwOQ13YqH/3cIQF142Ivdr7bP/7NuVsy8zBQ67GBUh8KpmxaXbDZhJ6yvePF5jRq
 AQklIUsK06n0OCKxPi4E3bUhKcllh+CqlBaGBt2hCM4OXE2qfCjFqqLfiH8H7yZMmv
 LlKOD2EoSvVardJk+BgGfX/FFc9k/M+1/AnL9KWE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.172]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqaxU-1pXE0l3U9Y-00mZ4G; Tue, 18
 Oct 2022 10:29:19 +0200
Message-ID: <9e63badf-fe0f-b341-a9be-12455ad98bcb@gmx.de>
Date: Tue, 18 Oct 2022 10:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] fbdev: gbefb: convert sysfs snprintf to sysfs_emit
Content-Language: en-US
To: Xuezhi Zhang <zhangxuezhi3@gmail.com>, zhangxuezhi1@coolpad.com,
 jiasheng@iscas.ac.cn
References: <20221018075118.922212-1-zhangxuezhi3@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221018075118.922212-1-zhangxuezhi3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ltNSdhYqtVEwKKEty5sa/d6o5jrNblDt1wfRzuwkNoXVsLM3XlZ
 /ne/TgIZZjA3PT/nMtHgWd9vArSx4Di/OFyBn6ftpGLieeIKRT+IWmCx2833MRAXdVzWAaW
 vrzJ1jkJ13IHQvaT3eaZfzxfyG7n7igMZDHaik667YRNrCkAXIt/Nsld3eITxT2dPpOXUeL
 i8hgN3rz4FDFwTXRI4CGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f4yUllfLw1g=:99/DaWHSnZUmO+NvJZ4sYL
 HEAlcdzbSWCo7X96f09U+4fagVO/dvivlWyQnFKnoXHq1p6svL/IBgZsaLnA5RQFPsTo7KFRN
 2/TLBNl/f4HOBRsT9KXNVyJmtTp1NeqPW/CSpdhoYYZt+UhUwGXp/3GZh3kxwqHtUmTBclBo8
 nbKaTlXsckIzoROMPu18n7b3QoZgJ6uWw0X2mROTk+UcQv745qUGPLNWmzR0B+POwL2ZobAXS
 WHYppGwyNk3D0IeE5fkeAtjKePOFnLExhnoUAe0nIHJYKOVXOZsH8WmQ7KhUQp/RgMjybVuQG
 U98o15uoXpceBgZAVJTmxeRKUXuRot2VFbk8SibRggVucKXElskLD0aMZ27+x31/123ys4HYW
 gsfngXQxhF8sdOdSrp0IoHju9cRICiJrIEYpKbP2zodolc4a82TXiguCbdlVukS5SV3OdhOMj
 Z1ye1bb7inaMvdohBw+vj0YpVlP+/VUKCBgmtrOuFMjqD3EMdZcIXtkakLZ5WEf/8zoD599Pg
 ObuiFzf9iMGQuXLVSpjFG31VvebEdvhZEL62Pm5PkZrtqJ/IvFuA9hurOb4G+maRzSaC+wjIZ
 DihQw2Wmj+TgYf0embE7HR0RALDZW+GRST+y4ptl0GLCYwqpmvMRTOfbJeHtntcMg7Bf8kwkC
 swqy6wYTqgxHPtlwC/uVU2A9JhdajUxGA/D8abXGb0PfK0C7NBOSDkqPMUzsnaaMC/mvz+u9R
 akXoDBnvTcDWWqSO2IJb2trzgAiyGSkrxu3+vImCnvZs6nCKfTPGmWbjtFf2+U2/uCyIj2mYP
 HOUld7y+3FTM6aVi/yt6eP8N80cMkhoOKYJNn+Rkub+i2sleYYuOPaJy3HJmvWrS8YzjkHkJ0
 6FWYfEdFAaSmBPOPJ6+watf6oDa+NmB8gtoPyfEmKSv/LuS+brfCpoOt8Vumuz7qW7LaA7P8z
 jO+K3pAIyWMiYptXBaim4qHnMQFelOOZGH1SQNOJ9PKXXqR3Dzt27vRIbNKUg88kKw/s04tCJ
 05h9nvY6rWXRBI4j80aox3irXHkiQpRZaVXHaSRvIoNkl5afmBonzAPLhXRzZAUJcfByPehV8
 3gG4dpUL+1PzZ71ebnPYAMz+yIJn9IhU5jiN5gKd2bsxCbYnLdNDZoLPwcxlJvdvUGFFt9my/
 VQZQvtxHApuqvVKl7bDUwXWaYR6uQ6gZFBHF6cbFc1boeyrSzPbemUM7uBaXOB5G9UYIzZA1+
 9jXo+8nPewIWtDjOjYAdpJ825CJtH0Nk9INwgg9t1zB1Rv4+kEO65l5QwBfEGXeFc5O2MlTTV
 qAKUoucAJt63qNpjWoHFg7vaJPA8LtXZ9LIcKcKAo0DcMh94uFxz5tDcLBBlYLWty4raRLxzZ
 xnD62xTvFKp5UXurD50KDWrJpWp56Gh+TLzbVu8+FEFZ/SeNC8BdtD19AYyzH0VMnRiP2GQBW
 ld/MpUL3PhfHEjkF+oW9bg2E2bSKxy/uZahoVvAR4H2YJQhKGa63MnrznLwcT/H6vxTaU3YRk
 AWDUsaumSXxV0Qlico+t48Klua2mOYms2ZVNuFqIakyhS
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/18/22 09:51, Xuezhi Zhang wrote:
> From: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
>
> Follow the advice of the Documentation/filesystems/sysfs.rst
> and show() should only use sysfs_emit() or sysfs_emit_at()
> when formatting the value to be returned to user space.
>
> Signed-off-by: Xuezhi Zhang <zhangxuezhi1@coolpad.com>

applied.
Thanks!
Helge

> ---
>   drivers/video/fbdev/gbefb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
> index 1582c718329c..000b4aa44241 100644
> --- a/drivers/video/fbdev/gbefb.c
> +++ b/drivers/video/fbdev/gbefb.c
> @@ -1060,14 +1060,14 @@ static const struct fb_ops gbefb_ops =3D {
>
>   static ssize_t gbefb_show_memsize(struct device *dev, struct device_at=
tribute *attr, char *buf)
>   {
> -	return snprintf(buf, PAGE_SIZE, "%u\n", gbe_mem_size);
> +	return sysfs_emit(buf, "%u\n", gbe_mem_size);
>   }
>
>   static DEVICE_ATTR(size, S_IRUGO, gbefb_show_memsize, NULL);
>
>   static ssize_t gbefb_show_rev(struct device *device, struct device_att=
ribute *attr, char *buf)
>   {
> -	return snprintf(buf, PAGE_SIZE, "%d\n", gbe_revision);
> +	return sysfs_emit(buf, "%d\n", gbe_revision);
>   }
>
>   static DEVICE_ATTR(revision, S_IRUGO, gbefb_show_rev, NULL);

