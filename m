Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D102B2E607
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 22:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C62D10E7DF;
	Wed, 20 Aug 2025 20:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZOf84qUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1395A10E26C;
 Wed, 20 Aug 2025 20:05:13 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-32326e69f1dso320086a91.3; 
 Wed, 20 Aug 2025 13:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755720312; x=1756325112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DMT8gQy8g4ulSR+tilKyVevzgFxmeh4E1XZfeU97xY8=;
 b=ZOf84qUdhskPVzY4N+IQvUIo2UNevaOb9poHAf0IGDB96H6MhkxJII0AnaNKMz+vxN
 rHJh5iT0nIHFnpa37ucmPIafWYof51zHZJtLQEtNkTuOwaW1fxoSdGnfmvQ4JaLCOQ3K
 8bL7HfFy7BCGq3hEq46jM5SnTS8CvrKqrnG81cCOyYfvAnJFoDtCsn+3StuEg95zIGv2
 5ClFY7basq2SzDUJqm8Dd6xXZe2/KsOvvtcC5t2aLYCJqL9u+tAe2ImHAZycLsg3MLu7
 Nies/Ur5vTsjrVsmz7ZbHZmV9ry5b4BpCZfAo2wQFJQsorE9QEeVBEQqmfMtUVvfkWms
 uT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755720312; x=1756325112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DMT8gQy8g4ulSR+tilKyVevzgFxmeh4E1XZfeU97xY8=;
 b=UKELFRETp+hk/M1+9DKacSHyuoZyDXYKHvZLsHmDiIBW0X55Hdkjx5zrKBA3qvm4Tc
 mDsI/VQ2r/RUBDWyzpNVxUVLnbof6vmW1grQOebgYkaWhIFF/I9Efwoc98DT7yqXDZhc
 P4cfzRiS2SSrlmlIC+m+78dzlAitOd0NZSpthxOMuPL09cWCZzaO5lH9IthQojcwh+YF
 DzCpGrCCfH2IfZQnhS3zss9566YCbw/8vTYjDRlNZGnNDbro/+y3esFhPKfFrhptOouu
 t8o+Rn9tfDedJRljfk7OugxGWDcJiEq4ZzC21qSPaY4ACht3BDk81nMVWo/XLr8cMOqY
 VCuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/m2Mp2TcAaWYSI26Ujcn8OhkUAFQWGDg0VH026ry85VDIZyh1Nd6cR4fFa2cB7CMDNPzThneKlzfA@lists.freedesktop.org,
 AJvYcCW+cH9XPdqdlbE4AHjWqzuNZ88v9zMlaVx2mJyh742DBPBXlnWDfOeYm6CEE7/bllVbJ7hJ9drR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfkShw2VO+eo6HDJbGj9h1FUv/6WtGbgpqvDnZTReO8/a5ycbl
 cOutLGrsRq/AkjgSPawdb32VQYVe+aQh3hM6p+jVdjy0gA6A78dB2sk95LxaFQFqFF5RtMPM5p2
 5FhRu4DztIOmE2ya7+UBcgfXMuf6Dk48=
X-Gm-Gg: ASbGnctYjiklqMGDwOksbSL1Uxz+MVYzT7j2ncDBvGWYxdfrCXn+AkxtXfffSRup3/q
 PP2/UBDSDzEovp4uVRwLaVLIdyl7+bo0l8a60/NrBRsWTs55QdjvopjPyfY7NHQm3SNbO3QuWbF
 rjZRub3kqewVslyCmLXaDyOdmtljhVvbYxfI2Ra9DeXs07vlZ/3YZKNob+kMFyXPbKFgU0NneEv
 qbkRXA=
X-Google-Smtp-Source: AGHT+IH1Qq+bzYkRz1Cnps2zoGvMW0iVPgJd3Hpn9od4rUSylQIwnGGuSVnds0b9IhrA2E8NXaxvzNjI4YmB0N7B2Z4=
X-Received: by 2002:a17:90b:578b:b0:31e:b77c:1f09 with SMTP id
 98e67ed59e1d1-324ed195634mr144806a91.19.1755720312413; Wed, 20 Aug 2025
 13:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsO+EmR0QgFGjCbq74gzwbQbb76wjt1vOOOJnsCqj9hAhg@mail.gmail.com>
 <CADnq5_PdzYSzFL7KDsPV7zqX2avwn-NhSJqyVVPYF9LOMEyhWg@mail.gmail.com>
In-Reply-To: <CADnq5_PdzYSzFL7KDsPV7zqX2avwn-NhSJqyVVPYF9LOMEyhWg@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 21 Aug 2025 01:05:00 +0500
X-Gm-Features: Ac12FXx31T4QTbPwCQYmR0dHjxWtSJ0tOEBShMpNL4ncHjKi4hfVUoS4MlpvRRE
Message-ID: <CABXGCsMYpMXEFeycCXp6yJV8jUekOEtSpk0RV_==1x2bdJxVxQ@mail.gmail.com>
Subject: Re: REGRESSION drm/amdgpu: Radeon 7900 XTX hang & gpu_sched "Trying
 to push to a killed entity" since 1f02f2044bda (6.17-rc)
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Gang.Ba@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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

On Mon, Aug 18, 2025 at 7:41=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
> Should be fixed in:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Daa5fc4362fac9351557eb27c745579159a2e4520

Thanks.

Confirming the fix: v6.17-rc2 already includes aa5fc4362fac and the
hang is gone on my system with vanilla -rc2 (no local reverts).
My earlier test of -rc2 mistakenly kept a local revert of 1f02f2044bda
- sorry for the noise.

For the record:
v6.17-rc1 (d7ee5bdce789): regression present; cherry-picking
aa5fc4362fac fixes it.
v6.17-rc2: fixed as the commit is merged.

Introduced-by: 1f02f2044bda (=E2=80=9Cdrm/amdgpu: Avoid extra evict-restore=
 process=E2=80=9D)
Fixed-by: aa5fc4362fac
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Best Regards,
Mike Gavrilov.
