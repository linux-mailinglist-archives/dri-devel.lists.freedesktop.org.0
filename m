Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1229268FB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 21:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C28710E8F5;
	Wed,  3 Jul 2024 19:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MkYZe133";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E7910E8F5;
 Wed,  3 Jul 2024 19:30:27 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-70af3d9169bso569905b3a.1; 
 Wed, 03 Jul 2024 12:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720035027; x=1720639827; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/U6ngBFMEaM22hRVrjS/ul8UiOi4VYKooMxA6n2arXQ=;
 b=MkYZe133+Rv5yJRdAdWlJGzWrNRgVmbdEwX8dWcU2O8n9tGzblERUd2+E9Rmc+2xuw
 Uy0f3pgSEfTsrrpQh+xWGhozSKJjXz0t9T0ekHR4BpI74naCQD0E1d6aOP4Fz/lQYvng
 pYIL1+tRlvyiRyl3lmDzlhWVnUYxKjrhFPBX98EQK5/6Bc4YDFYf3b/MZmUj+fYUPvn1
 cQOXvPVcqKmxqoNtfPchuEHy/q7hJ+TfDXHpKzov4OvqaVVHL4DtkLx0NUJiYpij55We
 kCis38YE7y+qEjkLS3QVOuwRZrSJ/rDJ8evlm0O8c8nAytOohh2Y0bkAFOt8aQowz3uk
 AHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720035027; x=1720639827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/U6ngBFMEaM22hRVrjS/ul8UiOi4VYKooMxA6n2arXQ=;
 b=YADfV0foD7gxs/DDdlCKAUj1V+F6SS8W3mlCLRW5YAkCJi2jUW8JwNKJyO3EYzev/8
 1foUc3xRYDHLtPr84chLJCsLaBFtgvpj97R0BKgyWMNyNUDxSboNFOrEYJ30BKu5zYmC
 dr6awRes5ZgPsu1YnDZ8Zmcw3qiZpwRP7NtAv5B4zE+meHJOkTvIBzDKhQIdNq4YMFQ2
 ApghUy/n/WdbwdLLneFpxv8H1LpuxD/PoG1tyznIGyj/WGuhXENlqI0DPLXyRLWT77sK
 Flovzn1b0WVjsIxt7VS9FDhwN27o68S1wIb7e6LfdjPP4xbV+XjWC+3dOeTFNzFAygNm
 uM4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdyHMDcGg5LHOa8kzg9q8D1XU9NFspgVeCzA5NVtO6O9DiyoOJ2YAvAa5QJjWWTp8oJooTYmHZGhOz8XapTJU+NC68dnvUBn+IjYajg5s3
X-Gm-Message-State: AOJu0YxZge4njcG/NsO67ftyftZlEng1SVjzGSdClTgU/oqttfXaIlx7
 /UNNnUQZKbedxzrk6RBy9HnxFA+JYWq3A7iELsjm9b+JLi0sBaxiZWorIFEtc98BihDzPthrqu1
 C6Zyw1Dnv8hTKLOIWYtZ+GsBKCfM=
X-Google-Smtp-Source: AGHT+IGvFowGCy5DqP8snrHrgHcRADL1PlajGDFe7dlJJE2VbHp1mckoRqvyEJpjnbJEQ2nFa7KRFCanrM00uxzR4hk=
X-Received: by 2002:a05:6a00:178f:b0:706:5bf1:586f with SMTP id
 d2e1a72fcca58-70aaac1f08dmr13143325b3a.0.1720035027159; Wed, 03 Jul 2024
 12:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240703191341.239296-1-hamza.mahfooz@amd.com>
In-Reply-To: <20240703191341.239296-1-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Jul 2024 15:30:15 -0400
Message-ID: <CADnq5_MsjcqbCg4ZjjLEkmyu4x72e+ago9tecHBfjezvTrU8hA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add an entry for AMD DC DML
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>, 
 Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>
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

On Wed, Jul 3, 2024 at 3:20=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.com=
> wrote:
>
> We want all DML changes to be reviewed by Chaitanya or Jun. So, add an
> entry for DML to MAINTAINERS.
>
> Suggested-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7fec8ddb8d5b..d2fb60fee7e8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -950,6 +950,13 @@ S: Supported
>  T:     git https://gitlab.freedesktop.org/agd5f/linux.git
>  F:     drivers/gpu/drm/amd/display/
>
> +AMD DISPLAY CORE - DML
> +M:     Chaitanya Dhere <chaitanya.dhere@amd.com>
> +M:     Jun Lei <jun.lei@amd.com>
> +S:     Supported
> +F:     drivers/gpu/drm/amd/display/dc/dml/
> +F:     drivers/gpu/drm/amd/display/dc/dml2/
> +
>  AMD FAM15H PROCESSOR POWER MONITORING DRIVER
>  M:     Huang Rui <ray.huang@amd.com>
>  L:     linux-hwmon@vger.kernel.org
> --
> 2.45.1
>
