Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5289392615
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 06:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CA66EE1E;
	Thu, 27 May 2021 04:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5D96EE1E;
 Thu, 27 May 2021 04:22:34 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id x15so3846010oic.13;
 Wed, 26 May 2021 21:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9DG+xjWGZv67nZFsC1Ee5TRyVRy4OYoOSwlGHHWJ58U=;
 b=l5L+bJvVQJRe0kOb+T6Yq6UuOZ5NfHBWYe+QjQ7AgzNd+wN4b3ZnT/+xjry1OUKU5N
 b7coSP0dZSCIsI8RQl16xUD53gX/HGThF6Grwe7Xg7Z8usXdJN6sZgHHUv26XnVfrU1o
 +ppKtu8BbRLChINfqvdf588PZrqLhmbZZ87cZzANzPyy1ETBrw4ACHMJkzsY0v8oEpkw
 fGTT44+uA014dkuBUxX5/v2Tqix4JRPNgfuvu1rEgcXKRE1U7D8cWCFm4N7lUn+vFitX
 G0q2S549q0TCFxy4SWASelCCEgXGhqrI6/zri1K9lvZGnYohCU+ZRWelJHA5FUwXtTYW
 6sfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9DG+xjWGZv67nZFsC1Ee5TRyVRy4OYoOSwlGHHWJ58U=;
 b=aQ10kWjhXCnPqHEBPgM1COpot9a+X1zi8quYo97BGhWE6PcA5sbDQK3voxX2h7tsJD
 5aAHfXqRbXOqJCI99ORpi0N0Q0rDt4sPmvudHo1eXPSCaMG0RixaS1HA4MJiSlvF/AjH
 M0DRUnh3ELe7AE6ZXAATvOSuSeOJ3in2WS38fJrPZnNq+X8vTJ6z26V6b//Tuii7NPKj
 p6zGtW4D+05tjSKIN1mpWVm+BO1s9CNhGZ2W8FvjKiKJ/5FdP9fk2ZqmIz+VxxaPAU3/
 sYvqrond4DFArVi45TESqdQMiKXFz3OCDEhRD890lqcLAQ2Nj3jJa7dyR3M8fITzFbCE
 wPzw==
X-Gm-Message-State: AOAM5332TfHshFpcOLJ0IRNlNZKUvR4aQIQ0zCfsPf9Dis4b2u/fJ+C+
 CDGmEgCTKFV6sEYOjKwTIlCHYiVMpt0u3kvXP+4=
X-Google-Smtp-Source: ABdhPJz0CbLS9N2IE55TBBnETmt0sI7XDgqlj2lorRpi5OkRDYWOIcqZMgSfJ+Zx6228a69CfujHU7uG5Czu0vDD8Ms=
X-Received: by 2002:a05:6808:206:: with SMTP id l6mr4057313oie.5.1622089353925; 
 Wed, 26 May 2021 21:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-21-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-21-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 May 2021 00:22:22 -0400
Message-ID: <CADnq5_OHSFsckrZ4_Oy64fT+fDOf4QXudkhpGeaDqXvTc4JwXA@mail.gmail.com>
Subject: Re: [PATCH 20/34] drm/amd/display/amdgpu_dm/amdgpu_dm: Fix kernel-doc
 formatting issue
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
>  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:608: warning=
: Function parameter or member 'interrupt_params' not described in 'dm_dcn_=
vertical_interrupt0_high_irq'
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
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ae0a95c5f1d8c..0b4841f377e41 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -605,7 +605,7 @@ static void dm_crtc_high_irq(void *interrupt_params)
>  /**
>   * dm_dcn_vertical_interrupt0_high_irq() - Handles OTG Vertical interrup=
t0 for
>   * DCN generation ASICs
> - * @interrupt params - interrupt parameters
> + * @interrupt_params: interrupt parameters
>   *
>   * Used to set crc window/read out crc value at vertical line 0 position
>   */
> --
> 2.31.1
>
