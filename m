Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC11823B22
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 04:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E3A10E2E5;
	Thu,  4 Jan 2024 03:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59A710E2E5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 03:31:14 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-dbd7248ac28so89964276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jan 2024 19:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704339073; x=1704943873;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9n80u1CkaWzx8obyOyFuf0rWVWTZDVHCjinQCoRyPWM=;
 b=AVa1BZhZNiXhMemmoJNEI4IqXOHCdLTw3aSze/3WCErs1XAVTsd2Rv/WliRQzplOAV
 JB2XKBgVGHShjliPEpjY7CpVAwpDVD/8zCQxURlaxI5J8WOxLtRMktMoG9uo0ivRyNAM
 YMI23iO05qV/oEUOBlCQGAN9UaI42eXEibORE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704339073; x=1704943873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9n80u1CkaWzx8obyOyFuf0rWVWTZDVHCjinQCoRyPWM=;
 b=ZX+yf4obTPo1jpSxL5apr649f8gGJbDHfDD3aOfuUpM5YJlJaHGIv8zlfeRYSAR+/x
 znsTACH4T5CGpwfJBWHmn436veIsdHLYH9NlyfgapHOZmgtHreTsGjG9mdZDpkkFNn8H
 A8KmGnbVCuouYF92AGDdB2vSLtgCNvgHq7iKFTqnewTD2tXbOWTaTucWlCLPEJXXsqU0
 D3Z0ZpBfcKY5u5IT22Cq25nm7DYN1ctvNOizqS9+JSyBJanyrEy1of3x3k2R332MSNVW
 pCGNVmUrQtpkFjR/rCyMowH4tOAuTsrp+1bXtxM7P+NurkdFtXm2lp0nKL8aVouy0pju
 eEdg==
X-Gm-Message-State: AOJu0YwuC0jEW7WZbmdLrxETskRvDmKHlpzmhMIfHjbXXJq/tME4sXNH
 5Qz8Vf1q703twTZRMQzdzbd1Ibh4078kYZ297p2qCZYjhe7U
X-Google-Smtp-Source: AGHT+IGuaPvVtHJ5wEmfvzXQLBsZQkV2dtIVwKwQ499x5ahDUSFOeJ36BveDlqYMHrOi+9ZDmI4LmmToAKYZZcRFj38=
X-Received: by 2002:a25:a166:0:b0:dbe:a209:3305 with SMTP id
 z93-20020a25a166000000b00dbea2093305mr10023ybh.98.1704339073736; Wed, 03 Jan
 2024 19:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20231215235638.19189-1-rdunlap@infradead.org>
In-Reply-To: <20231215235638.19189-1-rdunlap@infradead.org>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 3 Jan 2024 22:31:03 -0500
Message-ID: <CABQX2QMm4ovL51sLOgi-bFtctLUgXuw-T2m0Qcja41HaR3XKkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: fix kernel-doc Excess struct member 'base'
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>, Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 6:56=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Fix a new kernel-doc warning reported by kernel test robot:
>
> vmwgfx_surface.c:55: warning: Excess struct member 'base' description in =
'vmw_user_surface'
>
> The other warning is not correct: it is confused by "__counted_by".
> Kees has made a separate patch for that.
>
> In -Wall mode, kernel-doc still reports 20 warnings of this nature:
> vmwgfx_surface.c:198: warning: No description found for return value of '=
vmw_surface_dma_size'
> but I am not addressing those.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312150701.kNI9LuM3-lkp@i=
ntel.com/
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Zack Rusin <zackr@vmware.com>
> Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |    1 -
>  1 file changed, 1 deletion(-)
>
> diff -- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_surface.c
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -44,7 +44,6 @@
>   * struct vmw_user_surface - User-space visible surface resource
>   *
>   * @prime:          The TTM prime object.
> - * @base:           The TTM base object handling user-space visibility.
>   * @srf:            The surface metadata.
>   * @master:         Master of the creating client. Used for security che=
ck.
>   */

Thanks, looks great. I went ahead and pushed this one to drm-misc-next.

z
