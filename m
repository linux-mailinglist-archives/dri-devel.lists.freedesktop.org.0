Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9315E6BF2BB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEFC10EF89;
	Fri, 17 Mar 2023 20:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F7610EF89;
 Fri, 17 Mar 2023 20:37:06 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17671fb717cso6977065fac.8; 
 Fri, 17 Mar 2023 13:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679085426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6jAUWAsjb8Uz9ILX5OTMCjxKt4ND3D5QTEdP5IH68S0=;
 b=TiFHavIAdWdcSvK9iIqL+2o1p8PY1IDvNXIL8UvpnvHsK7salo86fcsvl9Z7kunJi3
 pEZQJxvWTWS52NbdvhLQ9oaCiBj2imzBRV7boWIqHKX/w03x4n63Ba1xzh7Te9L8CMs0
 lNQyaDnZuB5vd7TKK8ek0xQ1GVFiTsI7yQ4mSp+IslnEQFlWL+X00D7MPUXTli1cLvHA
 FEPX2f+r9t+nbmnXWppRKpMLxD++C7KQsupkLHhwyZ2OXGduh80FnPL90ku3KHLXWb6V
 acaq2LYPBRC8mw2smjLsbGdrvu5uuk8eEm7PHaq0nsTwMZ7dfzwH02uXglNaRoIA4fzD
 IEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679085426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6jAUWAsjb8Uz9ILX5OTMCjxKt4ND3D5QTEdP5IH68S0=;
 b=0De3LPALh/NK1lq+zbbhgZ4Ld6vJmkZlFOLEEx6o3938Zfd6KqQhSXwF4TqFOUt0co
 Gf2KXmjhZ3q1yBVuETYFaGAlcDVHE34WtG612vmRgATBdCd+Z/Wh4RYQ3mYDF7U1qdLD
 53ZLBQowQ6sXp94DnWPjZ03pqPzvDxN0FEj7F6/CE0xEKRYEqLBXMw04JMh+Tm2z0fiW
 Q+EZIlu6xg/QAleymN3n2tLv6lQRFbd0d7G1wxzJsoEmRsQ+GhA1BWQdrZpOXYd2/b5Z
 qyc4fXHIarxM2v2npyD+CTaEj94TgcvJYthncHEefw/eCu/ZyAfPt6kBp5r/aDGQo8Uv
 8w/w==
X-Gm-Message-State: AO0yUKVnH55FM/pLdAcA5VOrl+774TyBqgqHtZKTW21BgaWT8ZyGKkoi
 QRdPCb/9ePK7HC2evXpM5rWt4nhcSF3wxqOplDE=
X-Google-Smtp-Source: AK7set/VHvZw9ZF9BqferHz805M92pxF66D7DmlLkppGdaj2ODMrC5qXi3V3vS2RQjpMpih15u0OFc0xUXQgMP3Kyz0=
X-Received: by 2002:a05:6871:8a90:b0:177:a0de:992 with SMTP id
 tm16-20020a0568718a9000b00177a0de0992mr347691oab.3.1679085426100; Fri, 17 Mar
 2023 13:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-29-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-29-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:36:54 -0400
Message-ID: <CADnq5_O0mQWy5z-SeWryyVeBhhsDX_yrsiuHTUbDBBAscB6b=w@mail.gmail.com>
Subject: Re: [PATCH 28/37] drm/amd/display/dc/core/dc_stat: Convert a couple
 of doc headers to kerneldoc format
To: Lee Jones <lee@kernel.org>, "Wentland, Harry" <Harry.Wentland@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, Jasdeep Dhillon <jdhillon@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Mustapha Ghaddar <mghaddar@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.c:38: warning: Can=
not understand  ***********************************************************=
******************
>  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.c:76: warning: Can=
not understand  ***********************************************************=
******************
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Mustapha Ghaddar <mghaddar@amd.com>
> Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
> Cc: Jasdeep Dhillon <jdhillon@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_stat.c | 28 +++++++------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stat.c b/drivers/gpu/=
drm/amd/display/dc/core/dc_stat.c
> index 6c06587dd88c2..5f6392ae31a66 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
> @@ -35,19 +35,15 @@
>   */
>
>  /**

This looks like it follows some other documentation scheme.  Would
probably be better to just remove the extra * and make it not kernel
doc.  @Wentland, Harry @Siqueira, Rodrigo ?

Alex

> - ***********************************************************************=
******
> - *  Function: dc_stat_get_dmub_notification
> + *  dc_stat_get_dmub_notification
>   *
> - *  @brief
> - *             Calls dmub layer to retrieve dmub notification
> + * Calls dmub layer to retrieve dmub notification
>   *
> - *  @param
> - *             [in] dc: dc structure
> - *             [in] notify: dmub notification structure
> + * @dc: dc structure
> + * @notify: dmub notification structure
>   *
> - *  @return
> + * Returns
>   *     None
> - ***********************************************************************=
******
>   */
>  void dc_stat_get_dmub_notification(const struct dc *dc, struct dmub_noti=
fication *notify)
>  {
> @@ -73,19 +69,15 @@ void dc_stat_get_dmub_notification(const struct dc *d=
c, struct dmub_notification
>  }
>
>  /**
> - ***********************************************************************=
******
> - *  Function: dc_stat_get_dmub_dataout
> + * dc_stat_get_dmub_dataout
>   *
> - *  @brief
> - *             Calls dmub layer to retrieve dmub gpint dataout
> + * Calls dmub layer to retrieve dmub gpint dataout
>   *
> - *  @param
> - *             [in] dc: dc structure
> - *             [in] dataout: dmub gpint dataout
> + * @dc: dc structure
> + * @dataout: dmub gpint dataout
>   *
> - *  @return
> + * Returns
>   *     None
> - ***********************************************************************=
******
>   */
>  void dc_stat_get_dmub_dataout(const struct dc *dc, uint32_t *dataout)
>  {
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
