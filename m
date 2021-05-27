Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5146939265F
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 06:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334B16EE2A;
	Thu, 27 May 2021 04:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F376EE29;
 Thu, 27 May 2021 04:28:34 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so3223294otp.4; 
 Wed, 26 May 2021 21:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gQjxsSRS4ydNcXF9pucXevV0+AhUrLegN/w6TYUgMI8=;
 b=QlQmjDn6z94Pppj7T6ya1xFBxp8g7V7WNNOAuKdXGgb3KDrkqtwkVDa6QjqQfRWAxp
 IehrTUHtLS6NFrBncRzcTsQYiZLw15sRT9wEdEuiJcwgEBde2WYAlf+7AmR9kfiGNuZ/
 q4lE4PWUKlArihSjZ0aEAajWdrfiiShwI9I3Zrqfw+sskK/FPr8tndpzOOWMHVEuRSyI
 AablOMg/nR5ZmgAAx6xrK52OsbC8erqhiH3+7HcgZZV5Ko0y/XryB6h6vXXQsoArMNOG
 1B6TC8GDa4ygPY+cHmdd8QpGCUk6GYBr2iasz6lLidikx0ODqbPVS8CEinxSeBkQ/t6D
 EZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gQjxsSRS4ydNcXF9pucXevV0+AhUrLegN/w6TYUgMI8=;
 b=b/J+JgTgS741XHpdaNXEOns/yNM0PKQ9EoCHpnw257Fjn/6+ENVVcKCfyAab6DNEXP
 V/nfNoWi99fheAAdPBNYMp6CkliTk5970zZaPD8vumAtbapOfWbj3VqB989BvN9iGkCk
 WCScdskyF6hlgZyFJo2BipgEzOd6XSzHK6hjkcF2YKwZS3HaXLtslc307MmKIZ5bSF4R
 e2h03SfHJ/0SLOrIgnR3gZl3joLRtaz4xaMuD6PqXuJis8Me+xk91PPyTwk4emhYiliO
 Y8Oiuy5nHj/70dcCBa0SZCMHWadkJEwOMs1dM0lYIflKWPg3zUzkdOjJUmCsb7r2MSQF
 E+Sg==
X-Gm-Message-State: AOAM531ePrEl3cRa4PjsILI3yoTpPwjkbwmCfWFTpn/KGQuAlyKPAJTF
 J+NirZUtT7j3GQp8xG3BAKHrAwQWL6r6D+8kqG77JuJ8
X-Google-Smtp-Source: ABdhPJwiWfCa9s13Zp943GQapPrNqWbSjjx7yv0ThfuE4qmncVu1XyBw6yoOio/ydrfKDSgu+OHAnDnDtboArgAq9J4=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr1339496otl.132.1622089714372; 
 Wed, 26 May 2021 21:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-25-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-25-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 May 2021 00:28:23 -0400
Message-ID: <CADnq5_MnDkxiRYmLa4J8ezVXhX6VSL4rffTCRpaeq7f+BVqoag@mail.gmail.com>
Subject: Re: [PATCH 24/34] drm/amd/display/modules/hdcp/hdcp_psp: Remove
 unused function 'mod_hdcp_hdcp1_get_link_encryption_status()'
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:48 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.c:374:22: wa=
rning: no previous prototype for =E2=80=98mod_hdcp_hdcp1_get_link_encryptio=
n_status=E2=80=99 [-Wmissing-prototypes]
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c b/driver=
s/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> index 26f96c05e0ec8..06910d2fd57a0 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> @@ -371,19 +371,6 @@ enum mod_hdcp_status mod_hdcp_hdcp1_link_maintenance=
(struct mod_hdcp *hdcp)
>         return status;
>  }
>
> -enum mod_hdcp_status mod_hdcp_hdcp1_get_link_encryption_status(struct mo=
d_hdcp *hdcp,
> -                                                              enum mod_h=
dcp_encryption_status *encryption_status)
> -{
> -       *encryption_status =3D MOD_HDCP_ENCRYPTION_STATUS_HDCP_OFF;
> -
> -       if (mod_hdcp_hdcp1_link_maintenance(hdcp) !=3D MOD_HDCP_STATUS_SU=
CCESS)
> -               return MOD_HDCP_STATUS_FAILURE;
> -
> -       *encryption_status =3D MOD_HDCP_ENCRYPTION_STATUS_HDCP1_ON;
> -
> -       return MOD_HDCP_STATUS_SUCCESS;
> -}
> -
>  enum mod_hdcp_status mod_hdcp_hdcp2_create_session(struct mod_hdcp *hdcp=
)
>  {
>         struct psp_context *psp =3D hdcp->config.psp.handle;
> --
> 2.31.1
>
