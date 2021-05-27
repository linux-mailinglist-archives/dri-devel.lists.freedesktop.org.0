Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C5A392657
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 06:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89186EE24;
	Thu, 27 May 2021 04:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557B06EE24;
 Thu, 27 May 2021 04:26:45 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id j75so3858532oih.10;
 Wed, 26 May 2021 21:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MAqtfQh3kqLNCeKLPTeKdUEM29PsijCc//DfraUHLwQ=;
 b=eqBhr8eAXHo+lVRn+9mISIFH3Gy2q+Zk8dohqjdKoojg0OgqzwQqg/0IEaIiA0jsVW
 6GaZ41eYjO/4AmuMb5xxcLJhsiXwAjOM8Qr6mDvVlQQzm1AAd5V/63pX8Sm0Pzi0NcJm
 gAh4bKbpmXUdqNzhxHUeks+X2gJEy5A0+DKQ6KsygLSrh2ui01rFbvoCLBDgXCFk3uyw
 QvUeEWGHZ0CvivmK8gqV+qPaIBcRvB0qZiCAeifLCaR3PyBEOdTi7y4uVyAZZA6SMPIY
 IBrx46ptfW+pDG3f1o/m9elVSGqs0PNpHr8abQWVO9k5py7B8jilH9Kv+4XTHyGLdK8O
 WEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MAqtfQh3kqLNCeKLPTeKdUEM29PsijCc//DfraUHLwQ=;
 b=ewjH48dNp3vBfVZNRvR3leA1t4QquPgXLBiBV8p6HEE+4PBzddFJ3YtyZO5UGr4cQm
 IEwTt6vPkG4Z24hgyhjF4flhMrTNWOKMjIAiYXVRFrHnqwZt4YDiuOWkkNdvA32A8Otc
 wBwYRBCEeS0IUqeecVnWEonmh96hAPdWX7bCJg3yGF7Ywbx3Ze67t+5KWVKTR/pbq9hB
 uQ5Foe0gbX2vO5rtF1M6GUxjJ707C1cBhYK+x12oG2xTQo2rUQPhYab/J7w9EHfKPMIY
 qdZ32QkFZaKpG0DDI0bYleRiz4FpttNcVh4bGGnD5x2P8+VneqGGXiy5AUWDJrPq7Ipw
 U9dQ==
X-Gm-Message-State: AOAM530EYzxorGI55tVZaox2zopemt1cAcWIOU9Ped1yi3wrKCrB41B4
 lqDD0064v8lQthpwZGVZdo78huO7SGRGSVZkIF0=
X-Google-Smtp-Source: ABdhPJzSqLPyykDzrtM8uq9qKFXoEWkTve47q5DnAyeOgEMSN6yyg5sq5O2i3SRoUEnG6rHpKT45/NvEAbzcnTful+Q=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr1079682oiw.123.1622089604710; 
 Wed, 26 May 2021 21:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-23-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-23-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 May 2021 00:26:33 -0400
Message-ID: <CADnq5_PsDZPaJxmxYJBv3sY17Wu=9W4Eqgtb2EDo6PgxdzgwWQ@mail.gmail.com>
Subject: Re: [PATCH 22/34] drm/amd/display/dc/core/dc: Convert function
 headers to kernel-doc
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
>  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3324: warning: Cannot=
 understand  **************************************************************=
***************
>  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3344: warning: Cannot=
 understand  **************************************************************=
***************
>  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3417: warning: Cannot=
 understand  **************************************************************=
***************
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
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 46 ++++++------------------
>  1 file changed, 11 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/a=
md/display/dc/core/dc.c
> index ef157b83bacd2..34c207f92df98 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -3335,18 +3335,10 @@ void dc_hardware_release(struct dc *dc)
>  #endif
>
>  /**
> - ***********************************************************************=
******
> - *  Function: dc_enable_dmub_notifications
> + * dc_enable_dmub_notifications - Returns whether dmub notification can =
be enabled
> + * @dc: dc structure
>   *
> - *  @brief
> - *             Returns whether dmub notification can be enabled
> - *
> - *  @param
> - *             [in] dc: dc structure
> - *
> - *     @return
> - *             True to enable dmub notifications, False otherwise
> - ***********************************************************************=
******
> + * Returns: True to enable dmub notifications, False otherwise
>   */
>  bool dc_enable_dmub_notifications(struct dc *dc)
>  {
> @@ -3355,21 +3347,13 @@ bool dc_enable_dmub_notifications(struct dc *dc)
>  }
>
>  /**
> - ***********************************************************************=
******
> - *  Function: dc_process_dmub_aux_transfer_async
> - *
> - *  @brief
> - *             Submits aux command to dmub via inbox message
> - *             Sets port index appropriately for legacy DDC
> - *
> - *  @param
> - *             [in] dc: dc structure
> - *             [in] link_index: link index
> - *             [in] payload: aux payload
> + * dc_process_dmub_aux_transfer_async - Submits aux command to dmub via =
inbox message
> + *                                      Sets port index appropriately fo=
r legacy DDC
> + * @dc: dc structure
> + * @link_index: link index
> + * @payload: aux payload
>   *
> - *     @return
> - *             True if successful, False if failure
> - ***********************************************************************=
******
> + * Returns: True if successful, False if failure
>   */
>  bool dc_process_dmub_aux_transfer_async(struct dc *dc,
>                                 uint32_t link_index,
> @@ -3428,16 +3412,8 @@ bool dc_process_dmub_aux_transfer_async(struct dc =
*dc,
>  }
>
>  /**
> - ***********************************************************************=
******
> - *  Function: dc_disable_accelerated_mode
> - *
> - *  @brief
> - *             disable accelerated mode
> - *
> - *  @param
> - *             [in] dc: dc structure
> - *
> - ***********************************************************************=
******
> + * dc_disable_accelerated_mode - disable accelerated mode
> + * @dc: dc structure
>   */
>  void dc_disable_accelerated_mode(struct dc *dc)
>  {
> --
> 2.31.1
>
