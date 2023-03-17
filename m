Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4533E6BF2F4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3071510EFA4;
	Fri, 17 Mar 2023 20:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7693610EFA4;
 Fri, 17 Mar 2023 20:44:52 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id bo10so4710674oib.11;
 Fri, 17 Mar 2023 13:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679085892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfjuORG0Jk52NuAgQu3T61JWbt/fIRebBWYt5aRa1ZI=;
 b=E+D69mswJ38gpG+o+TpBZWu3nQbx3WGZ+PxFFDc6B4aBvWUijpyEZ6+lW/Md4K7bgG
 YeN4xDZ6uMZ20L2cCic7ERg5ddZVY7DQbhLBjnlsmhAKI8c5qvTsPu0X2LC5tQH1FxJK
 awdevvB/k4KdAK326XTtYvv7jC62PWCwmOf59onO3m17amCM+G6ZkbWWyxk1yNJJc2N7
 1HS4n1Rf7NDsLfEK58+OdjbWgI3lXn5Amwrc4ePADLlUYIvgy7MYcxGzFeJqkcLpH2X4
 yRyvwUb9CariBy5Oj9GjxL6DRGV8dv38t3081Mv8pmSPSWp2XjR6jhL7zAwPod6A717P
 afKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679085892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfjuORG0Jk52NuAgQu3T61JWbt/fIRebBWYt5aRa1ZI=;
 b=5sgEj/Q7R1W1cfFSpHcU8/2bq+/OplLdQ7GLi9Qq7pzAR4w8Gz2iro/L4e6APspMLr
 5Ina4p/qmPZng0ZsB+LdpZErbdkwQWWH2IMraQmvhqRFSlD0lv9zZRM3+9nQMMctrX/f
 pqEvsUUoCQVqUNEaj1gZkeuXOE4Bc+Zev6CTohI6jga2Eum/EDYGVwfpnsy8quv6Spua
 aA78dy39IXOwlKJjrQ91tJM79OK4Z9D79CS1WmtqeuSdASHQJpYccnC51lyvirTaPeCk
 qj7/c+i/46Lo2DXksYk9eQ1YJrNOKLS/64h+G3f6EL2neFgj1wd7Mw0OrVdSLC4QAhE2
 6Xew==
X-Gm-Message-State: AO0yUKXz2UGyrtFO5UeMujbqy6+i4AAJlkVrepJB08dMi7Zl158TZgUF
 hw2611rSreOzG0NMd0ODbxbrW3WaBoBLNnVBjQw=
X-Google-Smtp-Source: AK7set9EwHcrr2T4dPN90TCsm3UZrcSmjMFi7iytpPcTOGxCLy25G/jRQq3nXnlzQf+1bY4uyO02u9vF+S40Y/rMA0E=
X-Received: by 2002:a54:449a:0:b0:384:692c:56c9 with SMTP id
 v26-20020a54449a000000b00384692c56c9mr3629617oiv.3.1679085891801; Fri, 17 Mar
 2023 13:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-37-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-37-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:44:40 -0400
Message-ID: <CADnq5_MhMNbcChfaQ=qbk7=F0xQ+nHvFf6W9Q+rEqXm0Zac14w@mail.gmail.com>
Subject: Re: [PATCH 36/37] drm/amd/display/dc/link/link_detection: Demote a
 couple of kerneldoc abuses
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

On Fri, Mar 17, 2023 at 4:24=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:877: warn=
ing: Function parameter or member 'link' not described in 'detect_link_and_=
local_sink'
>  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:877: warn=
ing: Function parameter or member 'reason' not described in 'detect_link_an=
d_local_sink'
>  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1232: war=
ning: Function parameter or member 'link' not described in 'dc_link_detect_=
connection_type'
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Wenjing Liu <wenjing.liu@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/link/link_detection.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drive=
rs/gpu/drm/amd/display/dc/link/link_detection.c
> index 9a4cfa777622e..67addedd89563 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -832,7 +832,7 @@ static void verify_link_capability(struct dc_link *li=
nk, struct dc_sink *sink,
>                 verify_link_capability_non_destructive(link);
>  }
>
> -/**
> +/*
>   * detect_link_and_local_sink() - Detect if a sink is attached to a give=
n link
>   *
>   * link->local_sink is created or destroyed as needed.
> @@ -1185,7 +1185,7 @@ static bool detect_link_and_local_sink(struct dc_li=
nk *link,
>         return true;
>  }
>
> -/**
> +/*
>   * link_detect_connection_type() - Determine if there is a sink connecte=
d
>   *
>   * @type: Returned connection type
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
