Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54688B279E3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 09:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB93110E07A;
	Fri, 15 Aug 2025 07:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ysq9u5PR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FD710E8A4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 15:26:46 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6188b7532f3so1728306a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755185205; x=1755790005; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x0ATXr2Nl31UigtZ5RYCFMOWdPLQriDr6UruK6BdCBw=;
 b=Ysq9u5PRfSGiUGwvXVAF0OjewYVMcfuU7WIL247fzYcwkcwRMI9dFAKrn/MrxtiZ7l
 OwwCg0BXvbiIwi/R+hFiLu4vrIcgnobT9F+JYfe7wlHrCGE97FvmNyzp5B0x1o8oEJQd
 lZxzMQ8Ot2fV7+T1YNLCsNXCwC1ISvpIsyCTDkeh1kAd8pZt77dfxgeyKm0rvgmN3Qde
 cjPj4Zdo2PpT9fAFm6W82Bm8KH1Poc70bE++64pdvmecY/XY6jROLVsvU15MtY8/RC58
 KuiWlcWncPISOrjOgW5ptaNm5XtIFh53WAtJxGoAFrmOIj3evfRaTn6M+OpYjR0R/elt
 NKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755185205; x=1755790005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x0ATXr2Nl31UigtZ5RYCFMOWdPLQriDr6UruK6BdCBw=;
 b=BAaabF/ExRTTo2oUo8XcfAUTO4rbpbgtPRFg7uiAqh41uTcmmAITCTha+WTDMZk+dt
 3Wd5bmXQH5psP9pe752G9mQrL0X98LdC1yCPf41jioSHLpWe6EeuSJCejBtTewR5WWg3
 65Txaehvwh3+nsJDJBLM7N/rZ09fyD7tZufHXF8LpufyPTZgBlp92PGEmkLXOpDGy3TC
 Js/AK9vJcLORIATxI4rgj08AgNSm4S0PVuwQ/LNlbNXTjhZ+QRvu+4/KkFT4hyqex80M
 3WHFVqCBWdoDEQb93++NY04ju+pSTbwUFp9CiT6K+e+ErNqKK5EtSx2l0a10Te7kjByH
 Ql9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcwo5RriPBju5UtwuVGXI9a2H29b6WRcH2+4MH455JsqCwV/q7kcbaHqAVUWpnmtDM7csuOhNlgDM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA3hilGtk/G/4gwtGumcMHTU2HMy0RiyKF5nP2sIGNebyy+4xf
 4KPaxOd48UXqu08Wh0TQD9lLmRK1AOHC0F8/lM9FJsNU3FGh8+mY5JxfP0DgPHeYl4ek/gS79QZ
 4qu6aoACpqPSgjfT7QKrxkCpEhIiuF8A=
X-Gm-Gg: ASbGncttB5a8wEK2kho/4SQb1teUVjono0PcP14LmN9X/ZDbC/1lf6xnml0ooARZzn9
 qAUnk3Ro+cRThHFg/JFj020z+txqE5B5/KRJBcUn2bqgJAjBn1o0H704OXqQUfSQ9EH8T9Ri2c2
 NjlQuHhUZ0FP6t3pFUeRrdXCeO5j6XuTuymlJncWE9EaRTayPcyT7bcUZc2+sxF3XliZLjb6l9h
 F2HKoT0tGHFG0fxHCKaaij3zp5TVizO1A0J79qK
X-Google-Smtp-Source: AGHT+IFaH4/XqovJvZKgaoBvJGob3p6sLhyi8f3uMOrsQAygbSES9yh+Jy0UUeqvRXi/EyTKzpocs3VHvgLycA+Pow4=
X-Received: by 2002:a05:6402:23d3:b0:615:6fae:d766 with SMTP id
 4fb4d7f45d1cf-6188c20fc9amr3036201a12.26.1755185204751; Thu, 14 Aug 2025
 08:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAJE-K+BcU2vQPXyK9bdWTkRD_jreEcmD6zmnKrwut_7mCNv7bw@mail.gmail.com>
 <854286215216fe5242f3232032625b4fbe62074e@intel.com>
 <CAJE-K+Ca95Qx_6sbj2S=PfwXbMoaK5A97yWqQutTVN4aKQdu+Q@mail.gmail.com>
 <CAJE-K+AgxF-n5bg8++NcKphPBb4xHYeg-wBzAYNHUzM+KhpUHA@mail.gmail.com>
 <ac039b0fc2c59bcd3d313c2fbe014a657d58bbb7@intel.com>
In-Reply-To: <ac039b0fc2c59bcd3d313c2fbe014a657d58bbb7@intel.com>
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Thu, 14 Aug 2025 20:56:32 +0530
X-Gm-Features: Ac12FXwxwODJiaxSbxM-qiObs_49kRS9qt1_wrDFZ5w48L3ylzch1euCADwZrNY
Message-ID: <CAJE-K+DRgj4S7x_paXQjQcCQ9RYzxS4su8n2GqgJu3bAoGhL+w@mail.gmail.com>
Subject: Re: PATCH[1/1] DRM_GPUVM.C : htmldoc error due to multi-line code
 inside comment
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "dakr@redhat.com" <dakr@redhat.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, "airlied@gmail.com" <airlied@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 15 Aug 2025 07:17:25 +0000
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

On Thu, Aug 14, 2025 at 8:13=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
> Please read [3] on how to format and send patches.
>
> Use git send-email possibly with git format-patch. The AuthorDate and
> CommitDate stuff from --pretty=3Dfuller do not belong here.
>
> Separate mailing list discussions from patch emails. Possibly add a
> cover letter for the explanatory texts.
>
> Use 'git commit -s' to add the Signed-off-by trailer properly.
>
> Please look at git log for proper Subject prefix, subject, and commit
> message formatting.
>
> [3] https://docs.kernel.org/process/submitting-patches.html

Thank-you Jani for the pointers, I will keep this in mind from now on.

> Really the only two alternatives here are adding ".. code-block:: c" or
> adding double-colon at the end of the "The expected usage is::" as
> suggested in [2].

Yes, the latter is working with no errors.
Thanks,
Sidharth Seela
