Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8D9392599
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A596EDFE;
	Thu, 27 May 2021 03:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FC26EDFE;
 Thu, 27 May 2021 03:51:53 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 80-20020a9d08560000b0290333e9d2b247so3155390oty.7; 
 Wed, 26 May 2021 20:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ObVfNwPVO2PC2rJ9mQ29zRLy3G1wFkbEiSVflWMxPk4=;
 b=bI4D1NOOpgtzq6luGnjJmHGV5j4sd9uC+nnz4zwFn2dCp2SPukZLmj+rS+Ra0LVncm
 kT+0/v11S2ccVthKIOH+C+b12P2XUqegYcFbGb2tM60SY1kfCxuhkjH36LnDNKarTmLe
 FlwSVyc7WBPgTFHmirMYMTQBiAxZv6mU4D6hIbDgZhtRbduzQphA2gwwMpTXgPzSMOjX
 8uY7xAnrhMsfsv+Efn51gD0Yk4EicB5y4rckTYSmlWy1rWoh9e+zPLuqSp9pW+vWbaSA
 nIAIH3JqV7zPtXopv8ahSj+4c9N5bN8YekfFmJTMhs7Kh/QZDs01vItMLmZqcX4ThW+g
 LeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ObVfNwPVO2PC2rJ9mQ29zRLy3G1wFkbEiSVflWMxPk4=;
 b=pFOYE4NcseXaLvblRj4e6Cx+/iyl40xg3ekB7V4zOoZYz6Whpi3naPhG1TlXOGRzNF
 ePbCKEZ4qerYvh5Ny0cdEOm9kxTsMMpstfKoYkyC5orUsH0ZAB4xk4sT/8JF0jQh7FAH
 bnKddE4DCN4o+4a8k9141ztI1QQXvpUcycGSkJ8y/55uVred3ik732zQ8C6Umf3KigHo
 cChVbLJuKqrahEnO4gXQkYM52hwAx68V8/kU0x0UtWMRZdhuvROZTYKzKtzuj+2pAYYk
 gFyOroffuaUfqIWqxbJbWRIOs+Eb+h3LnI0b+nxN3TcBtK0c0FZIav2CN9qmOgBtU3lA
 ZDuA==
X-Gm-Message-State: AOAM533VIjdpCgjjuC014WCI495U6r+QGvzw6ryuxTP6Xwqe766u+Y73
 Hgt1UkvqiHT1RO5kMfqTKbLrIw+TcnNMvd8aGvJqWLCt
X-Google-Smtp-Source: ABdhPJzoXaQbaKR/UK+3tvFkSVSQl0hgYg8KapNW/jKmqAowfs7VRGNg2OuJK2CjLoD3C/186iR8I/cCd0c4HRWXKmo=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr1201591oti.23.1622087513057; 
 Wed, 26 May 2021 20:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-4-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-4-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 May 2021 23:51:41 -0400
Message-ID: <CADnq5_MRrMWuCOrWx4iVrARkFs6HQzdQb8TMKMK4sm3bmNkv4Q@mail.gmail.com>
Subject: Re: [PATCH 03/34] drm/amd/pm/powerplay/hwmgr/smu7_thermal: Provide
 function name for 'smu7_fan_ctrl_set_default_mode()'
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:47 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_thermal.c:132: war=
ning: This comment starts with '/**', but isn't a kernel-doc comment. Refer=
 Documentation/doc-guide/kernel-doc.rst
>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c
> index 0d38d4206848a..6cfe148ed45bb 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c
> @@ -129,10 +129,10 @@ int smu7_fan_ctrl_set_static_mode(struct pp_hwmgr *=
hwmgr, uint32_t mode)
>  }
>
>  /**
> -* Reset Fan Speed Control to default mode.
> -* @hwmgr:  the address of the powerplay hardware manager.
> -* Exception: Should always succeed.
> -*/
> + * smu7_fan_ctrl_set_default_mode - Reset Fan Speed Control to default m=
ode.
> + * @hwmgr:  the address of the powerplay hardware manager.
> + * Exception: Should always succeed.
> + */
>  int smu7_fan_ctrl_set_default_mode(struct pp_hwmgr *hwmgr)
>  {
>         if (!hwmgr->fan_ctrl_is_in_default_mode) {
> --
> 2.31.1
>
