Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38469555517
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 21:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6B810E710;
	Wed, 22 Jun 2022 19:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE3A10E710
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 19:51:00 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id u15so8824629ejc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7EYYCA1a6jouZjKaTCl5dk55FoE2AY8gMW7iTS3p80=;
 b=YyHRQMDzBGtFSgbJEleqZ+v2ngZJMSyRN4Vq5aPekUvQnGwBKBssuHcqGU1f7NgZmS
 IinJJYK9qm/TPVXhCy1KwfjfGSVx49xMh76WbXPMD4AQlBp26WLO1kKjdD+BPzzE2WVf
 aU6xOPhVjix6NMMadLkzGV8WEwwxawAcW9Re+FwIUPd3aK9OJPmbG1rzoQjmw6d/9uSC
 h9rlqFkE8ydCjrJ9dihyOzRQsBqWdoGluV4j16hLqIBxqPpdbjMk8sX4ROdLcNTc2iQU
 jrAPCbd99a8RrtMuW+jSTHg3NvMBo6KcMxaopIXrVtNMjfhBFBx+m8ZE9BuGcMyzCxph
 DQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7EYYCA1a6jouZjKaTCl5dk55FoE2AY8gMW7iTS3p80=;
 b=ZJMh1Va2ypdzf/IHMltL51HWL+fsgt1p0I+JT96vPo6SjQcAoavEcGaLyZ6olLoRCZ
 lCd45TF3dY9ilqcohj1E2VEuVjza7LlSfHixEdW0UYG8/fi87YtlFLwoIDb32eBjpB76
 PAPCKh7oxY3+ctz3ISd4ToU7OayOTYS8PTIr3/jjZsRA/cK76bg6K8zSx3mhDg7VCHpS
 Cq8xc2I8qvreYZ/+1+dMpvuIZpmMeszaovAsUrhpTJXJvymwHfeMCo9BE2WJwd/wVkRk
 nJb0gG8rYLVyTtJmckvkmRkP9jpkt1fHZJ4JWQwLH93VULpbAQRKxW5V/+oq52nTjB/S
 ZDzQ==
X-Gm-Message-State: AJIora88+B2+wg4/sUPpF5pSOUOBdEpqmksARNJ+BnUnQhuwamMGjfAz
 KQJn19EPgyBeKao2psxSSPgRsYPgzk2wQI/OAA4=
X-Google-Smtp-Source: AGRyM1tWYa8ZNIVBKeWAFuLuVWH3CsYwwxDjJi5gJSZWeSL/LUYQL5nA1GkdAGIAV8j9DTHxccJhdNdy3m9/xDtBMQQ=
X-Received: by 2002:a17:907:7e91:b0:721:9b87:7095 with SMTP id
 qb17-20020a1709077e9100b007219b877095mr4884259ejc.564.1655927459105; Wed, 22
 Jun 2022 12:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220621090334.54115-1-jiaming@nfschina.com>
In-Reply-To: <20220621090334.54115-1-jiaming@nfschina.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 22 Jun 2022 15:50:47 -0400
Message-ID: <CADnq5_NhCkCTwb=kOAZz0Y5sB-R2sHfWV_kT9+ACdME6FJ5Ceg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Fix a typo in comments
To: Zhang Jiaming <jiaming@nfschina.com>
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
Cc: Dave Airlie <airlied@linux.ie>, liqiong@nfschina.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 renyu@mfschina.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the patch.  This was already fixed last month.

Alex

On Wed, Jun 22, 2022 at 1:52 AM Zhang Jiaming <jiaming@nfschina.com> wrote:
>
> There is a spelling mistake in comments.
> Replace 'paramater' with 'parameter'.
>
> Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h
> index 45f5d29bc705..15b313baa0ee 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h
> @@ -120,7 +120,7 @@
>  #define PPSMC_MSG_ReadSerialNumTop32            0x40
>  #define PPSMC_MSG_ReadSerialNumBottom32                 0x41
>
> -/* paramater for MSG_LightSBR
> +/* parameter for MSG_LightSBR
>   * 1 -- Enable light secondary bus reset, only do nbio respond without further handling,
>   *      leave driver to handle the real reset
>   * 0 -- Disable LightSBR, default behavior, SMU will pass the reset to PSP
> --
> 2.25.1
>
