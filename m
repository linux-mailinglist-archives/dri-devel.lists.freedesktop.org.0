Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0180044CE75
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 01:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9D26E436;
	Thu, 11 Nov 2021 00:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37C76E436;
 Thu, 11 Nov 2021 00:43:09 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id v138so10823683ybb.8;
 Wed, 10 Nov 2021 16:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KbmbVjvohfrwAvo67OI5SINSyboo8b3+77H0HqyVNcY=;
 b=OI8+/SLWf+OyAM+7QxLLrisD6+kiuYIuroalbPfdjWD/X7jJbWB5OXT9d3T/MuuZ+B
 AcpJICUMbzU/wLqJkRHpBkr+wXSQ4/zH3l38oPklML2q/mJCwUj4GvXx+gSsvh2FcmdI
 9yaPgHPhEz40NH2f4h7+P9FBf1vvjQbZzHUZdZggTZHh0JddI/Apx9pl5H4o71h+ZGEd
 KRsBnVVWLyo/W5wQ0pfkMu/wPfLJlgPBTexSIMmXaoyyWaB2atXsSUd8tKhQd7o8wuRv
 WRlo5M6jkv7fUq0K/WTFVwwTwa2Ps07JKX4EV9uwyiVvbclDTirSdoV+2sed1qvvRAgJ
 YQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KbmbVjvohfrwAvo67OI5SINSyboo8b3+77H0HqyVNcY=;
 b=1O4png0UrhOn7vO2XkG+lAB/eFBBvdfV4zW1FUwxK9hIKVhihqXiybz+mlW4viS2oJ
 WKhp4fB/kP5I1xCH+fZlbpw3kp4EjnWlXcM28nK54vHBhfUCVijzPa5N1xVdXRqqcVNe
 YdFkyXIx8Vvc7I1k9GzqxiXEAcSR+gWepkt9iA3+tYY9EvEHGryStYa3QYHtJoGX9lcj
 J7TKnbR8nHOOSoyfhOBG26M57XzqBjICyAZoDy1YkBKnLc07jM22XgGycJqDNWZUrRUb
 YF8782Zr+l9vvVm7Kbh7JmcEGS9zneCl7QTUeYMWBCTA0WU0D8PocgPoCY9EubEKlGYR
 50QQ==
X-Gm-Message-State: AOAM533k+oOLW0lr1NGyt/bAAUH2uxDboyodvEQSB7P8tdapkrSWBZbG
 fxbQPdKWB8QEzzVsnCw4ywnP4REAaIWSsOL7Haw=
X-Google-Smtp-Source: ABdhPJzVkVw3Cb9WjUCZuLTa0Oz4USHiK2SWvXeQGXZzVq23gej8re/c16Co3nxcHf8xSL+tJbWVEvhikMqZzJwjDYQ=
X-Received: by 2002:a25:c6c2:: with SMTP id k185mr3967924ybf.230.1636591388838; 
 Wed, 10 Nov 2021 16:43:08 -0800 (PST)
MIME-Version: 1.0
References: <3d3bd0f7-c150-2479-9350-35d394ee772d@xs4all.nl>
In-Reply-To: <3d3bd0f7-c150-2479-9350-35d394ee772d@xs4all.nl>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 11 Nov 2021 10:42:57 +1000
Message-ID: <CACAvsv5ZwkwD_c+H1=QFYm1nwTud0gh+EHOk=ak_3oZCRVRVjA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: hdmigv100.c: fix corrupted HDMI
 Vendor InfoFrame
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Nov 2021 at 01:43, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> gv100_hdmi_ctrl() writes vendor_infoframe.subpack0_high to 0x6f0110, and
> then overwrites it with 0. Just drop the overwrite with 0, that's clearly
> a mistake.
>
> Because of this issue the HDMI VIC is 0 instead of 1 in the HDMI Vendor
> InfoFrame when transmitting 4kp30.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 290ffeafcc1a (drm/nouveau/disp/gv100: initial support)
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c
> index 6e3c450eaace..3ff49344abc7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c
> @@ -62,7 +62,6 @@ gv100_hdmi_ctrl(struct nvkm_ior *ior, int head, bool enable, u8 max_ac_packet,
>                 nvkm_wr32(device, 0x6f0108 + hdmi, vendor_infoframe.header);
>                 nvkm_wr32(device, 0x6f010c + hdmi, vendor_infoframe.subpack0_low);
>                 nvkm_wr32(device, 0x6f0110 + hdmi, vendor_infoframe.subpack0_high);
> -               nvkm_wr32(device, 0x6f0110 + hdmi, 0x00000000);
>                 nvkm_wr32(device, 0x6f0114 + hdmi, 0x00000000);
>                 nvkm_wr32(device, 0x6f0118 + hdmi, 0x00000000);
>                 nvkm_wr32(device, 0x6f011c + hdmi, 0x00000000);
>
