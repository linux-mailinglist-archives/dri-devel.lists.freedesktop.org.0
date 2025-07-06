Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64E8AFA599
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 15:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B2189BAE;
	Sun,  6 Jul 2025 13:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bZsRHXtD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7115E10E2B6;
 Sun,  6 Jul 2025 13:48:27 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-748e60725fcso395264b3a.3; 
 Sun, 06 Jul 2025 06:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751809707; x=1752414507; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYKciehQldNCWNbYvySdSPRLgccg1yQ6KwqlWwrggR8=;
 b=bZsRHXtDuGlScUyo6nxUrbu6oCfFbcMEF/vTj3sLAUKS9dDWdbLE2fCbwgy+UTs9Np
 ut1c4jAtct9c/5Gfp3RI3yCizIrYfnhSWQIjcQNAuZdbddUzmbhI2WEAYMsd+DdAknSv
 XB6oWhUuIHz2fBTuzoHdvuTMcBH3uA8S22hlla88aB6xk8In9Y9tCxOMxYqfu6vQ6P9v
 K4IRaoZDTmjA+MxyDzPvwQd4GlGPDcHG6EV+cV6DujwHHro/Doled8W6Oq/rsh6equZM
 PS2RPi6fKNKt9IjuaHDOmK+Pj/Lajyop2clfR+3w1mpCbyQwBw0jumjlWmhjUaasx56+
 7f0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751809707; x=1752414507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xYKciehQldNCWNbYvySdSPRLgccg1yQ6KwqlWwrggR8=;
 b=w/ySrCYGJ3CYL7sv0F9XkPcBZ3zuih/T1GgyoqRKuJhbifXztBSQ1C/CZPk6NHbPdf
 tWhyAJ7n1cHHGP3XD6l05MigTF95aJtEre2fW0MCi6+/3G/33rFnI6dZkBW7FoQb7t1d
 BLADQF1Hx4/D/+dUIR2EAyb+0h3yTefFuMc/WfnZ/LeJOzOqCKX5/Z4iJRZLBdcUYrRh
 EWQRZeToMU4iu5mPSsj4LuGxXT3MMsrQPZhYdDtoPZCB07CW2JJwMILRCsbt0Axg/8M3
 JuV9ERfyGoO2wxgHKs9lok048hUHJDg0YUjxysxZaJmssJslrI5rrcGZjcuMsDvt+zxY
 kw0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/sVf7vdi9BF4DZzfHUlTR84Ecu8mi+PFpxp3wEcv2YPKN9oSloUjETHN/DgAYCueVwp96U+0Sgw==@lists.freedesktop.org,
 AJvYcCVJIGkcuWLz363bNQs+fQUWUCYCp4tLLT8vN0FflA9EUzpAD8iJDLNOFbqCXG3ecnQwpY3j2QPzKX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVlQqCSLRv+Qi57aAp1XowCjP5rTSEvzlDvB60dav3u96k+Qpk
 28VjR0D0PF/xdiLZ3Z8FGcb65BKGl9GuIKYpMf8LfhNig8G2EEhdQYnoX+YEaJLuuAzqz4QosXz
 G1p0Ll3O0c5HvkojeHsAwPPm6t0r1Los=
X-Gm-Gg: ASbGncv6NoNrTrbcRt3NmbFEZy/FrZ12bRUj9uRyGb88xr1lMrUvHOxE0oHQpIbSCXQ
 D6NS2Tse8/SnC/JyHE4Webaqp++Oq4pRqH0oIknT3/RAJMvE6rQgWadza5S7GQA+nWBLOSntz0N
 V2zwD6nPwrZ4GsxmHzohEZVfB5fH3J0In3txOUGQcTQa9L
X-Google-Smtp-Source: AGHT+IFqHFRxQ28XQjLZpfvmhn5YmIh0OO8Ja2iDdNN2ikIwdHYKc1UcSVFvIdbvc4AZLM+3HErNUU0W9hnjgzF5l0E=
X-Received: by 2002:a17:902:da84:b0:235:1ae7:a9ab with SMTP id
 d9443c01a7336-23c8723fc2cmr52851595ad.3.1751809706916; Sun, 06 Jul 2025
 06:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-3-f362260813e2@nvidia.com>
In-Reply-To: <20250702-nova-docs-v3-3-f362260813e2@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Jul 2025 15:48:14 +0200
X-Gm-Features: Ac12FXw4cJR6Uk3sqxMz-s6K2lBMkqlUu9xIxjdxhngi407laQ3US_Gq4qFUtwM
Message-ID: <CANiq72mW-tmqeKjH_5-Xz5jb54m2d4XfXX_Z6V6GpogfJ5TmgQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] gpu: nova-core: Clarify falcon code
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Joel Fernandes <joelagnelf@nvidia.com>
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

On Wed, Jul 2, 2025 at 1:32=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> +/// Security mode of the Falcon microprocessor.
> +/// See falcon.rst for more details.

Please add a newline between those -- the first paragraph is a title
("short description"). A few more instances below, too.

`falcon.rst`

> +    /// Local Framebuffer (GPU's VRAM memory)

Missing period at the end.

Cheers,
Miguel
