Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF49BAE93
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 09:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B455010E393;
	Mon,  4 Nov 2024 08:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c4vm7f1c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3469810E294
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 20:04:10 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-5ceb75f9631so3215553a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Nov 2024 12:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730664248; x=1731269048; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gR268y83eL4SoUEdjawan5CDepkw/mnuHvTL4r2CJLk=;
 b=c4vm7f1cJUeaXoNyXGcC8L9tYGEjbMGpWRxyPUq1A8ECFb9/6EPZPurtQP82UZCovQ
 M6jTSrn+SBRExTby9rKo9k/EYNb5/2S0c0/CWg1fmlDGyHTjNtF5g3oAiLCnco9qEc9A
 tyEYD2vMYzlkn9oVeXSR69g/mAmL/X8zL06JhsrF1PWduxuA7vIjZlPw1MTuHol+fpo4
 07j0g5k6r9Js2DnEx0c6WkqThCoqkSYw1C1EpN+0QlPvoq6U9KuNThBNIyRs3Qt1sTX1
 TcUTHLJfZ7Kf//5s9NalL27MTGKDbnZr8xKJwhTAqn5y+LyaN7b9wtme9kXFWWZUHiif
 CbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730664248; x=1731269048;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gR268y83eL4SoUEdjawan5CDepkw/mnuHvTL4r2CJLk=;
 b=RQcd9O9bFKXcXDDa53i6X8cCofsDmFV9Xj9jnw+Qc5IbWsauMgNBfa5cx+TszYxFv3
 l00Dla6+pa+wBuUxoXqPg//11QZkVCU6ZLZLGWYDkcEEAajc2HDrCxnioWtmL7iJTmh1
 Nc3TqcVu7tcheypZ0NaJFaFXnih8XTjOQRORZ2dIm80tkpimuXnU9sCCXqJ3sbDXUy9K
 /Z84MUKKi9HnYJGTVgqHELdITl1BgjIru7EgdSA6VCScWR/ddG6Akb7+5MauOvdSl5fp
 SWdKodH+RomWeUvudPSorxt/P/BC4Zh0+fijv/hE/PpVhQyvMxoO+zJX2lUvNP/eNBVe
 7EoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWUq2EQqfUD65JLykHP1odA77Uyk6aTlynTj4I3l9xlBewa2Tqq+yOb3y51kxqcTOquubwju7iQeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTOB2HH/lCxPCc0AkDNFOwqlEV5SxTFh4jYpaAm1ONgDmz2m1Y
 lmpvIYzkJNOdq/CFGO65E4P/Tx5SFfiWMtTZlfwPTG+Z9RB1ZsQZTj3h36PakUsHGFJmCVYWcaR
 7CtsFrqADqTetjLPMSp9AphYUnMs=
X-Google-Smtp-Source: AGHT+IGDRuhuq0N0cX8s7NHM21xtEJEGeWQ1015fSdIqrmyEUo1+bkLUpOXABC1DR1rL1Qb78zb58kMK2UI8U3k/OGk=
X-Received: by 2002:a05:6402:51ce:b0:5ce:d397:9ef with SMTP id
 4fb4d7f45d1cf-5ced3970c66mr2005372a12.27.1730664248190; Sun, 03 Nov 2024
 12:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20241101235453.63380-1-alexei.starovoitov@gmail.com>
 <20241101235453.63380-2-alexei.starovoitov@gmail.com>
In-Reply-To: <20241101235453.63380-2-alexei.starovoitov@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sun, 3 Nov 2024 14:03:32 -0600
Message-ID: <CAP01T76==8ABkB8ptWZZkwnTcfPHWzXUQ3oOjEiQOvod=WL2ZA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] drm, bpf: Move drm_mm.c to lib to be used by
 bpf arena
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 kernel-team@fb.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 04 Nov 2024 08:51:53 +0000
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

On Fri, 1 Nov 2024 at 18:55, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> From: Alexei Starovoitov <ast@kernel.org>
>
> Move drm_mm.c to lib. The next commit will use drm_mm to manage
> memory regions in bpf arena. Move drm_mm_print to
> drivers/gpu/drm/drm_print.c, since it's not a core functionality
> of drm_mm and it depeneds on drm_printer while drm_mm is
> generic and usuable as-is by other subsystems.
> Also add __maybe_unused to suppress compiler warnings.
> Update MAINTAINERS file as well.
>
> Signed-off-by: Alexei Starovoitov <ast@kernel.org>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
