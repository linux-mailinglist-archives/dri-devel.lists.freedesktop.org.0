Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001FDD04907
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 17:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0908B10E79C;
	Thu,  8 Jan 2026 16:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="R0sqWtpL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3703210E79C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 16:54:09 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-59b6d5bd575so2621877e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767891247; x=1768496047; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5tFEi7D1Ny0FGyhvAd0NOx+lhbZg2wFDhqn24TA+o7I=;
 b=R0sqWtpLEhsl3sWPSP3SwBHKzHQ5nPvWXkbtNwerNMJz68xEYkqHck0V/y9AT1JZpD
 qDzJLYnhVrajTEoow023HTV0ajDsLPhu8ZhfgyQP7jNPVjgafKJKZwq16BpFibJ5/Kup
 F5Al7Ufp9Lxk3rOL3BjvME9Hp5n0kWeHahmbHoWg48RlIP/VvEYSkEy+i2SH0eKH0HrI
 d/Us7h27/C83vESTzBlRSAiW10Efyx9E3FKRf25qkCgwC7HIaPvMzjq9hUEydUK4Oa37
 3wi5J7BwDI//5CC7+APO0DFDJJIpKeKEZrbGOxR5zNLDl/m2/00eBC8TWJkrewAvNdC7
 vKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767891247; x=1768496047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5tFEi7D1Ny0FGyhvAd0NOx+lhbZg2wFDhqn24TA+o7I=;
 b=GfkIb54dyVKVm4Ir3bD8+gbFtYiWvyqb8L3zK0r3PR3IMROmJoHOrI+HTtLGEuTO/s
 o+rYqIlR6zMBiOaTSWeAoKWCerY/M6rVVky2Kk2PHUzT8oVmUqBEXl9bleZmD/at0SYu
 dtzrTNS57vldc5FRKRM3MBcl0xmckqhPogsLEdRd2SoYmIm1r9KKwulJhd0Uq6akwhtT
 wdSmSL2GBXSV3vSu0xBqaTuesGYdmAHo/dsD8u5NgyQnJdwZLxgxEILVlkmeWB5baPSR
 Imuv9JGstQf6PkbKGNDHxo8Bc4ViUWWPV0xHgEwvfKmYEWjMq64i1kLSk1vPpbb14i9A
 N6dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlOtoummNb1M4h0C12f3G5yYCvc38OFD7ozPlGj5dquN8BWTVhIX1Fev5B5dQ8mQaeRwaG920+Cjg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbnOQ25tdydX+n9TTXXPQq35xWI93ukFrJRclwlqys2OSbVBts
 9Ykyz5hCtKbg9ENhr9hz9kPvvNF+r4g2FtTs7VbyiO5uK6zUX9onPZ1zSlLMw7pjO9hDmfZ8rwe
 Ju8jvnbI1cbhJ3WUlwX5Un+vbnriq++K2il2LZ0Waxg==
X-Gm-Gg: AY/fxX76DVADOmIs8+QZi7kFeN1X4+08/ChAdQ+9HfoviHDe4PNQpXCxSAXggzOg8bX
 S5VucgsciwG6470XQ/W22+lLvv8z0FQPR+WCa7I4UEwidz7RY+AchOrDXcbB15C/pbkO43477vJ
 rRXCIyRCZWRKiTPqkV1lUY5R0LL1Su8IyO61T6KU4yHqerDYcR8sDC3HZkdEMR4e5iEaNYQV6Xm
 sY3B8ncuRf658pxnnaFrs8eszqkzMuJRBl83vrZVWANLZFJGgLYMgDumC6J4Vzo13gGJ8LHFZUJ
 oAXcJBT1aesEpYDHNw+RAVurV8n2
X-Google-Smtp-Source: AGHT+IHcaq3Iod3MNNgnnvFFNIpcziSsOqmmFlOGlQ74iUyxAGstEgFcIYPH3qVrmLUpnmc350OzASEAfdSgs1QHSkM=
X-Received: by 2002:a05:6512:10cf:b0:598:de74:7a66 with SMTP id
 2adb3069b0e04-59b6f023bc8mr2163410e87.26.1767891247505; Thu, 08 Jan 2026
 08:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20251103170604.310895-1-marco.crivellari@suse.com>
 <20251103170604.310895-3-marco.crivellari@suse.com>
In-Reply-To: <20251103170604.310895-3-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 8 Jan 2026 17:53:56 +0100
X-Gm-Features: AQt7F2oYFLywsT6cVyy-Fw18Te-lDh35_yrTBGDJ2XEJK1ILpY0zCAOBMCVlL-4
Message-ID: <CAAofZF5iwRcEg9813aZf+Bib36u3K9MSjCwt478rzxuKW97gcw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/xe: add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

Hi,

I realized something in the meantime, looking manually at the patch,
while preparing the v3.
There is a bug in the alloc_workqueue() line in xe_ggtt_init_early():

On Mon, Nov 3, 2025 at 6:06=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 5edc0cad47e2..566163ab96ae 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -291,7 +291,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>         else
>                 ggtt->pt_ops =3D &xelp_pt_ops;
>
> -       ggtt->wq =3D alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
> +       ggtt->wq =3D alloc_workqueue("xe-ggtt-wq", WQ_PERCPU, WQ_MEM_RECL=
AIM);
>         if (!ggtt->wq)
>                 return -ENOMEM;

> -       ggtt->wq =3D alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);

The workqueue flag is the 2nd parameter, not the 3rd. The 3rd is max_active=
.

I will send a patch in order to fix this before proceeding with this
entire series.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
