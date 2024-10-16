Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C59A0BD0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 15:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB54A10E705;
	Wed, 16 Oct 2024 13:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YBlUUwHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C8810E108;
 Wed, 16 Oct 2024 13:46:33 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2e2b720a0bbso1263972a91.1; 
 Wed, 16 Oct 2024 06:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729086393; x=1729691193; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jPG0IcYOOjj5wHuVKKI6JRMlVaZc1FuwPVrIRPhC8NY=;
 b=YBlUUwHj6IFqLwmHDoac+9Fw+XHAQ9SxwgG3P+QmiJ2WmXxrdAHabZhEfDF8j+floo
 EksUJ40YM4McLeY7P5J2yi3815dpVWm5VKNdpm/ruynqO5lj/z9GUB4hPTxEyE3XvxGZ
 HQiUK4161FFYEAKv3D3CGNqBGYZ8ArQQwLtNmngLB/xiixf0fQHZOGo3XiBgeRqhXW4E
 lV8DRiXEnaHXpx3JOcme4Qr4qa1NFt6Mq7OPl8DUoJrSeZL4oM9+5zfxaIxtG8sn97vo
 agoocbuNgsIHsLSDFWE8QZQNGaw55aVpBPNVo62HV9ZKgroB/d6IJfHeWH68HNBWj5C6
 VRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729086393; x=1729691193;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jPG0IcYOOjj5wHuVKKI6JRMlVaZc1FuwPVrIRPhC8NY=;
 b=SKfKf3riDEtEaHm1S6Mw2VQ6mfnnjYDHmcf5q6zSAMGtaZizqRPhtdliy2dheArpFL
 xnJs9oTB21GnOFSBBLXO9i+jtxOzcn7LfD8NQP93rOffiUw6Mt6i2NT0oVL0+wZpv4ZQ
 Z0KQRlPJALXNhpSH7BNSOTqaAIJOrHAWUKfiLlf05twuDdhnTMEdyzb0tNQC+db8mOF3
 OSd7m0iX7o9MIaQjXDizW7B3SWooRyicROtgXqZ0emisFQgpEe27wxMWrZqDrgDJMwwC
 OtAOd2sQTlRZOOlBQVEv4csSC7hDwTElGuRvCWDcbt99aajyh3veEJBRiqFmPCy2crHN
 tXVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW53/lz47NaitAKH9b/aPo+7hLPDruyMO8ijHgmFH1OctvJaLpVPpa66DOaoWxx9C7eCZ0XlOkunWG7@lists.freedesktop.org,
 AJvYcCWq2MVqeu4VY+sxwzeJWychj84lcfRI7GFmfKZJ3iA1B9ZPgkIA0hEaRSlB0cRrwKkP7OVedDXF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqwPgGrKGkr+FJVPUTa01ML42dyjXSoQhqn/8K2upxpsp1wWSW
 DQyCgvq9j5Ssl5Qqz+AoyB5E7jCpG5erza8wuPng+8k7yLyOfQCkOh6ebR/cvA1nqnrW8foLx9y
 Ba26rPjsq/MzrNK+OMWl5fY8fik8=
X-Google-Smtp-Source: AGHT+IEoKuilAg8K+XtVXLqF5yfwI5xMJwIGApMZqNyYsDLitBiVCJtxvmZTCf5OM5yAAauiAQRQ1RzI6SsBKSnROvE=
X-Received: by 2002:a17:90a:9a1:b0:2d8:9f4e:1c3d with SMTP id
 98e67ed59e1d1-2e2f0d7750dmr9535838a91.5.1729086393193; Wed, 16 Oct 2024
 06:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241016090812.280238-1-colin.i.king@gmail.com>
In-Reply-To: <20241016090812.280238-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Oct 2024 09:46:20 -0400
Message-ID: <CADnq5_NF1R=jNL1XT5JO9Obvq-bpr4qgsSE0mO+r17WkUSf6GA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistake "tunndeling"
 -> "tunneling"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Oct 16, 2024 at 5:18=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in a dm_error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  .../gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capabi=
lity.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> index 518e5d1f3d90..e05b8fddf2af 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> @@ -1637,7 +1637,7 @@ static bool retrieve_link_cap(struct dc_link *link)
>         /* Read DP tunneling information. */
>         status =3D dpcd_get_tunneling_device_data(link);
>         if (status !=3D DC_OK)
> -               dm_error("%s: Read tunndeling device data failed.\n", __f=
unc__);
> +               dm_error("%s: Read tunneling device data failed.\n", __fu=
nc__);
>
>         dpcd_set_source_specific_data(link);
>         /* Sink may need to configure internals based on vendor, so allow=
 some
> --
> 2.39.5
>
