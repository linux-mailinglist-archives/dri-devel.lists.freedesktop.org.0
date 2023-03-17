Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107726BF2D9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE98910EF9D;
	Fri, 17 Mar 2023 20:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A3010EF9D;
 Fri, 17 Mar 2023 20:41:43 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 v2-20020a056830090200b0069c6952f4d3so3534740ott.7; 
 Fri, 17 Mar 2023 13:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679085702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfgcC/EbPu+ua6yDvUlTRHWlKkZNrCbAkKPEGXwikuI=;
 b=c18Tqa1zOd/o7z4A9WdW9+PmQDslW4G4YvMD30YdaQ7rRmNxBYBzx7KnFkmsc3Rd/X
 f0vhzOXNIY9aPKeWrY61QXH13zoH148CbovgQOK6L0oUZqf6VhmHMqHqksin9BFhnBHl
 eoup//n2VTIZeUa9y1nX8RXHr0cZZwB6/OCel28IRwbyTGgGe+MU5wdZ0isgPLkVLy7w
 RacaW8iW5dPJrW++PFE7EnCieNtPG3BOFsKQcZui23BkZvSWsjbl2OFOCVLLqgIV2Kw4
 zR0J1oQ8SvtoZgb3gxWvarjo50VzMP8m5ymGh4EH0Z4rpy1knvY5hQaCgE3lSqoLPySy
 lh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679085702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gfgcC/EbPu+ua6yDvUlTRHWlKkZNrCbAkKPEGXwikuI=;
 b=ZvrD/oguYDraDQkRlQobAdYaeVmTtrUEpQSDu0n8BWAEi4AFvPg+i16vuAdvEYgSzB
 MFjUa6+QqQxOzvMnBtym0gUFzKVj06WQ/jVrGQlouEnYQ4jok9qen4igMcb4xenhOvV3
 FW/j+RigOdwAITd0s4Neq+eDMERmblIqJKhgNy6TKN0J9xadgXkqQ+EdZUp6JbXudQND
 XzPhRJvDc4blWKCMUAZymizUTb4JKKZ3ypyTrcvDMYGUIUsIrY1VNW+I+PsJkovSmPGT
 zBgCpycHWPwBS/Wg61JdcCWAxd6I0poPyQtXWy2nYH6egR6cfg8RDzwDenVX0nc+xeMU
 mqAA==
X-Gm-Message-State: AO0yUKXlrNUHsswAkJ6u3jsxQ/4k+TAvsK005l+3vdEvUu0Q2/owyKtL
 v7d+Jy6yjcCOKfEiW8zlhYqghzk1X3UjOCko0So=
X-Google-Smtp-Source: AK7set8CqKuf/ulPOfBWE098fleAs19MAIbLvZv/D7H/MRyW2pFivWOvVXTWk3dGoLA6NMn+GK9iEDRd0TmwQ+gVYcE=
X-Received: by 2002:a9d:4802:0:b0:69a:b32c:9882 with SMTP id
 c2-20020a9d4802000000b0069ab32c9882mr298708otf.3.1679085702531; Fri, 17 Mar
 2023 13:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-33-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-33-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:41:30 -0400
Message-ID: <CADnq5_OPSz7mv3MHXY559pe_We45-C+Au4mgSoBEK5bcoaMp+g@mail.gmail.com>
Subject: Re: [PATCH 32/37]
 drm/amd/display/dc/link/protocols/link_dp_capability:
 Remove unused variable and mark another as __maybe_unused
To: Lee Jones <lee@kernel.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> =E2=80=98ds_port=E2=80=99 is clearly not used anywhere and =E2=80=98resul=
t_write_min_hblank=E2=80=99 is
> only utilised when debugging is enabled.  The alternative would be to
> allocate the variable under the same clause as the debugging code, but
> that would become very messy, very quickly.
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capabili=
ty.c: In function =E2=80=98dp_wa_power_up_0010FA=E2=80=99:
>  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capabili=
ty.c:280:42: warning: variable =E2=80=98ds_port=E2=80=99 set but not used [=
-Wunused-but-set-variable]
>  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capabili=
ty.c: In function =E2=80=98dpcd_set_source_specific_data=E2=80=99:
>  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capabili=
ty.c:1296:32: warning: variable =E2=80=98result_write_min_hblank=E2=80=99 s=
et but not used [-Wunused-but-set-variable]
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Wenjing Liu <wenjing.liu@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  .../gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capabi=
lity.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> index e9bcb35ae185a..51427f5081642 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> @@ -1284,7 +1284,7 @@ bool dp_overwrite_extended_receiver_cap(struct dc_l=
ink *link)
>  void dpcd_set_source_specific_data(struct dc_link *link)
>  {
>         if (!link->dc->vendor_signature.is_valid) {
> -               enum dc_status result_write_min_hblank =3D DC_NOT_SUPPORT=
ED;
> +               enum dc_status __maybe_unused result_write_min_hblank =3D=
 DC_NOT_SUPPORTED;
>                 struct dpcd_amd_signature amd_signature =3D {0};
>                 struct dpcd_amd_device_id amd_device_id =3D {0};
>
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
