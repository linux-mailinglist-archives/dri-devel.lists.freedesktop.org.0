Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8A839265B
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 06:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572176EE28;
	Thu, 27 May 2021 04:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35D16EE25;
 Thu, 27 May 2021 04:27:43 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id y76so3876283oia.6;
 Wed, 26 May 2021 21:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZT5FSoIiyDWBnTxiiZjSflnBrLIqWN4cLVY+j1uJuFw=;
 b=NOsebllSQH9aGPkH2RcdDiA7CI9wsl8Hpi5SHlA5oOE4W2iuhAZkqa++V9Z05Auxds
 Evs7CXqCEtsKa8kFQEMlNAlypHu3MKIpvzzB8zzHtONxAbTp7+TZxZoEkhUzh5EujZwL
 Xb/5SuddSczb7ofmJlilPuHYw7Er6PtLPs5TIlfhQh2d6SV8eFem/zKXUFMnrA6GNEOp
 sSQlUdqSNzrenxnQKigNs0GMnzAqtYufSvIx1SNi+LwJlEqpdhgxbb39hDTnYReSHCkv
 T/TQs+TOWg8PqWnswYT8UFT28gEEyELwT6sYyrmtpl0Wraqt47p8zxpHv4WpStPXxhJq
 hVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZT5FSoIiyDWBnTxiiZjSflnBrLIqWN4cLVY+j1uJuFw=;
 b=fBr2BZ2eIs8rxTgfaVZ+e9L8Pl/VlJWpFf1En01hmRBN+yddmjURRdzkJeKdmwX3Rd
 XIZFfgBhbqoxSWJW1coEzG0Qlf8WwuyRrvU7fSFOPS752Qvay0AMUepglODlP1MDO9dL
 A1+T3nqIVH/xwkQaRRthP6G6nNwZjSUxaeH6LMPZop973gmXgcV2RI03ThRoNNANnuBH
 PVc6u0dT0EiWtGeabtBcxmW8MLBJSXzUd2SdcCf4ghitwZjoy8Zj47Mtu4E6Vj/Y7BJt
 mLqZlSrTD6SUQEt7BeQ99AVTi23SNcplecF+o1jWwBi7EdLpQ00pYPlGwKz6xMHLP6Pg
 G7EQ==
X-Gm-Message-State: AOAM530hFUxCdHVJDwynoHFkjsT49SdqVccjejxVwOfUokZE9C5h8nUb
 ZV8em2t20LuoHsl+g5pNwrFrkDtHpNETf8fGr8/7HyaF
X-Google-Smtp-Source: ABdhPJyp2LVtbVpT+fbmhtkDrJadl7HkNYyBL7sr6DFQn3FF+hx4ahAXpE26gzypq/t10zhPHs4p3/fFzj6NAYcKNtY=
X-Received: by 2002:a05:6808:249:: with SMTP id
 m9mr1097793oie.120.1622089663253; 
 Wed, 26 May 2021 21:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-24-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-24-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 May 2021 00:27:32 -0400
Message-ID: <CADnq5_OW=Zp9gA1V+avgSV-k7Kr38ZqSqVNMnT+URnvW3ptiBw@mail.gmail.com>
Subject: Re: [PATCH 23/34] drm/amd/display/dmub/src/dmub_srv_stat: Convert
 function header to kernel-doc
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
>  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv_stat.c:38: warni=
ng: Cannot understand  ****************************************************=
*************************
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jun Lei <Jun.Lei@amd.com>
> Cc: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../drm/amd/display/dmub/src/dmub_srv_stat.c  | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv_stat.c b/drive=
rs/gpu/drm/amd/display/dmub/src/dmub_srv_stat.c
> index e6f3bfab33d3e..70766d534c9c8 100644
> --- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv_stat.c
> +++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv_stat.c
> @@ -35,20 +35,13 @@
>   */
>
>  /**
> - ***********************************************************************=
******
> - *  Function: dmub_srv_stat_get_notification
> + * dmub_srv_stat_get_notification - Retrieves a dmub outbox notification=
, set up dmub notification
> + *                                  structure with message information. =
Also a pending bit if queue
> + *                                  is having more notifications
> + *  @dmub: dmub srv structure
> + *  @notify: dmub notification structure to be filled up
>   *
> - *  @brief
> - *             Retrieves a dmub outbox notification, set up dmub notific=
ation
> - *             structure with message information. Also a pending bit if=
 queue
> - *             is having more notifications
> - *
> - *  @param [in] dmub: dmub srv structure
> - *  @param [out] pnotify: dmub notification structure to be filled up
> - *
> - *  @return
> - *     dmub_status
> - ***********************************************************************=
******
> + *  Returns: dmub_status
>   */
>  enum dmub_status dmub_srv_stat_get_notification(struct dmub_srv *dmub,
>                                                 struct dmub_notification =
*notify)
> --
> 2.31.1
>
