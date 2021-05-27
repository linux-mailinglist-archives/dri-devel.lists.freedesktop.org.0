Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 946133925C0
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 06:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1517D6EE10;
	Thu, 27 May 2021 04:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0236EE0E;
 Thu, 27 May 2021 04:00:55 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so3214786oto.0; 
 Wed, 26 May 2021 21:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=APGqEQQKklVqx+e+nEY1OGGyF9cgDa3PPLqNkgcDFtE=;
 b=rod1T2rjLNLXdShw7Ee3xcuNeytqVwUBmsE+CS7Kpu0+oDCJrwSs75MoHtIRYv05Sh
 pLWZkEub70QUK/vtkQxFm25AjMRuHXziuIRJrgCTvDpx/QRFyO0VQLZQWx05GGPfpWny
 4XZ8RXpl0u2bXwf0RvlQVMHqsW/wpturxvUmoTD5Gf+kn+flUEMZn9Znp+iQzp2b4JM7
 4FbI0xd+hdRcnSGd5vNhApbwkScVen7K501N6iF4TfjMizkJVMuyPCdCxCSXIXX95bHk
 LUnot92cAmKveqIAuOiaxPwSGnGMHBf77l2ZN32aaw1lgaT7jTU5jQQtwgvU30QhoH3P
 zhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=APGqEQQKklVqx+e+nEY1OGGyF9cgDa3PPLqNkgcDFtE=;
 b=M3iZqyH9C+0UO1eeSoVCWiKKgQq727P8YDYXSP6GIQ3p3fFGxU7Yca/rvCEm+4E7hj
 YECADMbZAVqkxmzXv6TvBMexhDN/9KnSXbO3xOWv8z/0lBxIbdjKwOQuibXPWfZHF0vI
 Y1rDzxt+ukSdWDVA5Vt8rTrbnbZvc/PxV6Yd+/yss0aW2CDejF5amHh9hhcPnBd/fe7B
 5PJeAKelBGjxoMfVARGkOJzb0DMpw8texktF1AuEOTEXBxaIEIjWZLixTWU68nSrHiEu
 AA+X4jd+0F8aMvPRxuHJEErUe5PFwOdrwYc0L3OdRR8/lvxNbGuyqFfyVxdW5bNakDNT
 83Pg==
X-Gm-Message-State: AOAM532ut+8mWswVBsRQ28n9+7kcJKtu4bBCqqkiojPk5UVX87Uzcwuy
 9zTPNw+sqdU9TrgkQuqSiTw8GZHzfydku+ywvsE=
X-Google-Smtp-Source: ABdhPJwTFbg86d5m1kGBug4qpsnNlPlGtJmoEoSn/XOtNyLD3d3qLRkNElC/2g/pS6OEa4WVo7cLLlRk7eabZvjp5FE=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr1218750otl.311.1622088055142; 
 Wed, 26 May 2021 21:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-14-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-14-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 May 2021 00:00:44 -0400
Message-ID: <CADnq5_PLcwcmY88uecMh7FPYungfskpBgWmiy9qTJrE_k06MAQ@mail.gmail.com>
Subject: Re: [PATCH 13/34] drm/amd/display/dc/dce/dmub_outbox: Convert over to
 kernel-doc
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:48 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_outbox.c:30: warning: =
Cannot understand  ********************************************************=
*********************
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
> Cc: Jun Lei <Jun.Lei@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../gpu/drm/amd/display/dc/dce/dmub_outbox.c    | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c b/drivers/g=
pu/drm/amd/display/dc/dce/dmub_outbox.c
> index 295596d1f47f2..faad8555ddbb6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
> @@ -27,19 +27,10 @@
>  #include "dmub/inc/dmub_cmd.h"
>
>  /**
> - ***********************************************************************=
******
> - *  Function: dmub_enable_outbox_notification
> - *
> - *  @brief
> - *             Sends inbox cmd to dmub to enable outbox1 messages with i=
nterrupt.
> - *             Dmub sends outbox1 message and triggers outbox1 interrupt=
.
> - *
> - *  @param
> - *             [in] dc: dc structure
> - *
> - *  @return
> - *     None
> - ***********************************************************************=
******
> + *  dmub_enable_outbox_notification - Sends inbox cmd to dmub to enable =
outbox1
> + *                                    messages with interrupt. Dmub send=
s outbox1
> + *                                    message and triggers outbox1 inter=
rupt.
> + * @dc: dc structure
>   */
>  void dmub_enable_outbox_notification(struct dc *dc)
>  {
> --
> 2.31.1
>
