Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B538573D9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 03:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3139810EA9D;
	Fri, 16 Feb 2024 02:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iqUAM336";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A66410EA99;
 Fri, 16 Feb 2024 02:58:17 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so2330735a12.2; 
 Thu, 15 Feb 2024 18:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708052296; x=1708657096; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qd7hJUCk8sUcOppUE5ku4QgyOK7+RnQJY5koudafqFo=;
 b=iqUAM336zMkMlAr4WpN2FxY73k2F6R2TRBJdJIYO+ERQ5J6x9LzWy07a/ahLvJd/eE
 xQ/JY7538vFxyX/vrgoMcf8gbb600KzZPa1cRY1gINPMtBDhPZ5zwpvR/11bzgkhQEQ1
 bpcT3GoHkWtQC1s8J9MdUCmep7K3GXHA41K+thXXnDHhjWhSdXZkIhTK34+zndYQbQTG
 HisenVW4b4g+HedNgUsQjj2VIdaml+J0GI9576+kT6hPELfwAogU2CSVJxp5fzXKCb5p
 wQ19SmV4JEdS3PGmr+HSTHcFszzz+H6gnJ34OSpqRJTJKP0e4VIV95ZR6yfNq1a1hdzG
 z/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708052296; x=1708657096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qd7hJUCk8sUcOppUE5ku4QgyOK7+RnQJY5koudafqFo=;
 b=xNzNWlCWnVXfxnYKbEi2NRwdJ1zhrxIoqoyiaH6CAss85vXAyBOCi+X5UZDv0E9S09
 FwYX+cfTXouZaNFNQoRIIgi2Ez/553mmfvXXV82+nqG6z7Sxef+8T4Ev7y+dk9MRpHZX
 IX3RfLnsRLA/w6tZepEjgnNLBIAGS1EvELLTyNsDOVyuZ67yJTVIQ6S9aqUJQXKVCZBO
 7vV1T02mdRQv4yviXQ/x2CVDTz3Jjd6rbuSRTcEIbAd1W70NLvU20TtlzUeWWEFPfUDi
 vakRL/KDlicSMLg2e+gi/QeDPruNGK3M9j7BsCDwiB6XJL1Zfqs3gZQMO76jDUJ/1gcb
 W0Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/zio75iEyjC8UsyMTVpVgzhQMSSxQFeOPqc3nABsz3pbTrIEcIwmGohfIOA9k4BiNIzQE7UvMlWPevKFYs9wC+LW/Hf8vD1SZz1UnRp8MvFWy+YziGOjy6IxBxoZ2X7PUO1cATdO4y5VW5HGikEXvdn81iw8Qb0Xh6O1y6v3+clOKK3D7w4mQOT9UNJM8dQPv
X-Gm-Message-State: AOJu0Yylaaejhn/DfdnTNbZ65cJ806p7UfBasHI9+VhMxYEccBl2ws4Y
 FoaSHm3C8paMb4YUAlJhYSr593Jj+EijDlNvt+RV/KG62lmBzhV1gB+cET98wXVwfqv3xmJroA3
 4mqxm1dH6otMjIO4Q70yGxtrhbjI=
X-Google-Smtp-Source: AGHT+IHVIVfxO7zTtl4/1YT56vZGIK/3JZ6/pVeZXVjg6YBv03FQpL1zwcv+bSYUOZ64crWdCsnXVFGyQvpSRgSvx1E=
X-Received: by 2002:a17:906:5a8a:b0:a3d:6198:54ae with SMTP id
 l10-20020a1709065a8a00b00a3d619854aemr2163599ejq.48.1708052295501; Thu, 15
 Feb 2024 18:58:15 -0800 (PST)
MIME-Version: 1.0
References: <Zc3iIVsiAwo+bu10@tursulin-desk>
In-Reply-To: <Zc3iIVsiAwo+bu10@tursulin-desk>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 16 Feb 2024 12:58:03 +1000
Message-ID: <CAPM=9twPjYvnAZQKEWrc2zvjTC4W2rfn9TWsHE8_QSgVUiPbOg@mail.gmail.com>
Subject: Re: [PULL] drm-intel-gt-next
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 15 Feb 2024 at 20:06, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> Hi Dave, Daniel,
>
> First pull request for 6.9 with probably one more coming in one to two
> weeks.
>
> Nothing to interesting in this one, mostly a sprinkle of small fixes in
> GuC, HuC, Perf/OA, a tiny bit of prep work for future platforms and some
> code cleanups.
>
> One new uapi in the form of a GuC submission version query which Mesa
> wants for implementing Vulkan async compute queues.
>
> Regards,
>
> Tvrtko
>
> drm-intel-gt-next-2024-02-15:
> UAPI Changes:
>
> - Add GuC submission interface version query (Tvrtko Ursulin)
>
> Driver Changes:
>
> Fixes/improvements/new stuff:
>
> - Atomically invalidate userptr on mmu-notifier (Jonathan Cavitt)

I've pulled this, but the above patch is triggering my this seems
wrong spider sense.

This and probably the preceeding patch that this references seem to
move i915 to a long term pinning of userptr in memory with what I can
see no accounting, and away from what the desired behaviour for
drivers should be.

It also feels like the authorship on this might be lies which also worries me.

Dave.
