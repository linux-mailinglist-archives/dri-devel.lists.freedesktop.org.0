Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACEF53B4F0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 10:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5457A112BDE;
	Thu,  2 Jun 2022 08:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5A6112BDE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 08:25:13 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id x12so4150304pgj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 01:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x2NGVK3ecMQmaSm/x/Ltq/st8dTSwNqY+rsrQ93ARxg=;
 b=jc6TkZPdF34qvkPaOsthSV7mmEZvVf2sOSBCZE0TIrNEZQ0qLy0uFRR2GN0uwmVGKM
 Y9FSd486m0gUl7cG6gJiMTxfjpzF5gLQe03S2ni4wyQN11A4eqqG53a3F5PxR8CMun5E
 XiBcFzESnMdpb8EiQ8S3z72pu4lz122VAyWoC7CoBKJTSP373LAotX5OH0EQeFRt9LdZ
 Bx1n/fLCgBzSw9DHz/Jd5fxq8CLkZRYIof8CA3lq870EXSdQzUf+hPjPcqFiIrzB5RvZ
 Z2uFpZwT1zOREgraxUWrtCFiiGqfwyAfSRqdpl1asAS+n2xKgL8QWVG4c3uO9izlCsl9
 pDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x2NGVK3ecMQmaSm/x/Ltq/st8dTSwNqY+rsrQ93ARxg=;
 b=y/VTOIHKuUFOTH5q080RBXvOzITzs3OETdc0jaiPA/40mA8wclQhhQ5jtX/NGzuG7Z
 6MnMSLR+4XX6dBJ62Gsgw9aL6vNChf2PCktJhCkUiHeHlbJ48tjGULNKwm9G2AqQ1yfc
 1w4Gu+wBYNMv+7312JSQm7twC6F6DqRvz/LzL+XpxLEyztvbREf9NtBVgE66GJKEPkN6
 PG55LzgsDIwNOYfVX6q/GO1D55gSVMgSrs+vNQdxn7jewtXVl9MpzazVIfY12a/NQp8+
 ZodVRBDl9Iteh1YoxxTbizFRyHp62ZDusSpsdsHChJ2QsHYDL4QMFyL47vs/jdQlk6/6
 M8UA==
X-Gm-Message-State: AOAM531AUZzvc7lk8xypQGCOEbz33vw1bRtmanx1YpWrpBsMHxEVhA3+
 3L96LWSLth/wFDRRfEaFsgkli7aOhFg96naMxbk=
X-Google-Smtp-Source: ABdhPJxdaxZfVyttIyFl2Xtrm0P2nA2t98lJywz/DUY7UhvNHVye505VrOw5VIzkRXBl6bMh8PTdM2L7cWgK0/xxPWQ=
X-Received: by 2002:a63:8449:0:b0:3fc:85a5:5b69 with SMTP id
 k70-20020a638449000000b003fc85a55b69mr3191172pgd.261.1654158313021; Thu, 02
 Jun 2022 01:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_E15665F62AAE22B108A00645874D3F53CF07@qq.com>
In-Reply-To: <tencent_E15665F62AAE22B108A00645874D3F53CF07@qq.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 2 Jun 2022 10:25:01 +0200
Message-ID: <CAMeQTsYNQ6_zfVKLS5pdA2q4s6UnHVWNmyG2ijGDnmDnzzetqw@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/gma500: Fix spelling typo in comment
To: 1064094935@qq.com
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 pengfuyuan <pengfuyuan@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 27, 2022 at 5:42 AM <1064094935@qq.com> wrote:
>
> From: pengfuyuan <pengfuyuan@kylinos.cn>
>
> Fix spelling typo in comment.
>
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
> ---
>  drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h b/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
> index 600e79744d68..7efbd7c45c90 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
> +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
> @@ -371,7 +371,7 @@ struct psb_intel_sdvo_tv_format {
>
>  #define SDVO_CMD_SET_TV_FORMAT                         0x29
>
> -/** Returns the resolutiosn that can be used with the given TV format */
> +/** Returns the resolution that can be used with the given TV format */

Hi,
Can you also fix the /** at the start of the comment. One patch for
both changes is fine.

-Patrik

>  #define SDVO_CMD_GET_SDTV_RESOLUTION_SUPPORT           0x83
>  struct psb_intel_sdvo_sdtv_resolution_request {
>      unsigned int ntsc_m:1;
> --
> 2.25.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus
