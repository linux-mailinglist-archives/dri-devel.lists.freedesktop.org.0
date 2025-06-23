Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5A8AE4F38
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 23:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAA189361;
	Mon, 23 Jun 2025 21:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jGtRmWlz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772F98910E;
 Mon, 23 Jun 2025 21:13:26 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-23496600df1so10180925ad.2; 
 Mon, 23 Jun 2025 14:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750713206; x=1751318006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qSuUz61O9R9DWRc6hYpmGsRWTEUvwzmHUEHSLXNcDM=;
 b=jGtRmWlzwonlbNmFGsLsjUlkk1dWbA3JIg+//N7koUwAnwLos3SDuLpOJcZDE3EvKe
 HP3XcqflNnh/FLiNH1CniW8agTfP7Oh7MaQb8d+9zPj6/Al4ltV3IWBtkwYwkTXo8DVf
 puywvc12XT+twr2xm2pKrP0DXOv+AzSx+h/NB/bsnIAKVs7S18MH9qpVT+avlgrZ9hr8
 pS0J+9lvkFvNY9H3kEm4Wfp+fVF/jPNH3C1ax0N5mgkNGEUKGom4fje5zAkTQROPNETd
 pWJEtoWZpRl8mc+kES3SntsUtdGKB5BKJfw1t+/6E8qWm8HHgQPt40Dx9MUQsAyUEX4I
 P9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750713206; x=1751318006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qSuUz61O9R9DWRc6hYpmGsRWTEUvwzmHUEHSLXNcDM=;
 b=LVc0xcCA3MwF63MZ3JlsmaU7Kx3NfxCdzGXuX8f7nEyY2EU7q8XCuC5h/Zxwi47LZF
 orKO4iSUHDfI4YL3jikOQKOEZ3rkMyKEZDgcO5iZ8XKY6m2oojOo0gSiQNEqIshL4QKO
 HB6DMvn0oB7M5Bgu44cCxex/wphmgMPkLE6xQVspMEEbeYK3bfYSwB7atOCAgPoKs892
 /PAvX4D9aoCJqBdRubJZAnAq8MxG9a7eQMef7DT9Z/lDB6XQCCGi1GHiqcjIaWMrDhgm
 MrAr7ZvkDYjhxT1wcQJ28mxGqTmruAG4vqA/HDtBXnwtCQiiFtBSkU21i0+bW8eeFFz1
 0JoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0CmlkM6XyNA6rsK5dmN3bGJM8UiGOOOZO7+xFhHVe+hfPik4tKal7ZQBMvfEbuHX8wXVV3QsWBas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH0JdcZ49KktnadUFW/qamNkr3HS2jrgfuqP1SmOh5JSD9R/RB
 H2pnc3Q+LymiGQPIjCvrFFatheKwH4TkcUH9lgfwROg1GSN79H64vkrx84dxbbP1dLr6D13Siyx
 2HbJlnENdZaNmIa0bijbUHxhC7b1Ght0=
X-Gm-Gg: ASbGncsSR7eUOTEo9DGPt3ShpuNz4H3RIirl0yUFC6TXfCYF2X/0W51PgRxkyzYubdN
 jeR7dnGpw8753vQUphBDphJmYlubmoJSJtx1Yc43Xb5Je96uhxxcNvSy2E7r1ILJdKrYGOPkfap
 qY9TrTgzJruT6AfN8RXH0j1qDTF2YRrSxGVUB3/zpoL4+P
X-Google-Smtp-Source: AGHT+IE4UEnMX4SHARtfc4Pz4EoCInMw0dZNhxIqb0vDlTIdHbQL8/0EkXkglubtJGt+k6Z/YskFdgQuNYDNBIIoMDU=
X-Received: by 2002:a17:90b:1cc3:b0:312:25dd:1c8a with SMTP id
 98e67ed59e1d1-3159d62a650mr8145127a91.2.1750713205892; Mon, 23 Jun 2025
 14:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250616160908.26333-1-tiwai@suse.de>
In-Reply-To: <20250616160908.26333-1-tiwai@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Jun 2025 17:13:14 -0400
X-Gm-Features: AX0GCFsFFe-2LvssttCw1mdTW5tv9Wrcql7NeIfnrDmK15SQFUge-Z5vCU9SLEE
Message-ID: <CADnq5_MWVPJ5XXS_78Kv5ZRPUZe7vFtMYomcun5mKePBhMX2UA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/amd/display: Add sanity checks for
 drm_edid_raw()
To: Takashi Iwai <tiwai@suse.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jun 16, 2025 at 12:09=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> When EDID is retrieved via drm_edid_raw(), it doesn't guarantee to
> return proper EDID bytes the caller wants: it may be either NULL (that
> leads to an Oops) or with too long bytes over the fixed size raw_edid
> array (that may lead to memory corruption).  The latter was reported
> actually when connected with a bad adapter.
>
> Add sanity checks for drm_edid_raw() to address the above corner
> cases, and return EDID_BAD_INPUT accordingly.
>
> Fixes: 48edb2a4256e ("drm/amd/display: switch amdgpu_dm_connector to use =
struct drm_edid")
> Link: https://bugzilla.suse.com/show_bug.cgi?id=3D1236415
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>
> Just resent, as the previous submission seems overlooked
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index d4395b92fb85..9e3e51a2dc49 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -1029,6 +1029,10 @@ enum dc_edid_status dm_helpers_read_local_edid(
>                         return EDID_NO_RESPONSE;
>
>                 edid =3D drm_edid_raw(drm_edid); // FIXME: Get rid of drm=
_edid_raw()
> +               if (!edid ||
> +                   edid->extensions >=3D sizeof(sink->dc_edid.raw_edid) =
/ EDID_LENGTH)
> +                       return EDID_BAD_INPUT;
> +
>                 sink->dc_edid.length =3D EDID_LENGTH * (edid->extensions =
+ 1);
>                 memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc=
_edid.length);
>
> --
> 2.49.0
>
