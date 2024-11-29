Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B19DECF5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 22:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261F610E093;
	Fri, 29 Nov 2024 21:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DFnwdzXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E4710E093
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 21:31:58 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso30768371fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 13:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1732915916; x=1733520716;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tzXAb2AynyjsC1brv/v5xtyGzPL78eXMtSvB4G/f/z4=;
 b=DFnwdzXjZf6klVOs9Gz7ZZta0TmJhhgblrtz2PsU4aeA0P9W9lsUVZ4lmxmeNKT+/4
 TRDGOA2lQ6oof1T/Su1hDvrujfD1G3rR/pwv4dBqIuEGEWvkpqHBRpkeREBF6vBV+ibL
 C5allk/bqXl38uLKDisjLnc7U/81ddt9SaHtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732915916; x=1733520716;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tzXAb2AynyjsC1brv/v5xtyGzPL78eXMtSvB4G/f/z4=;
 b=RSDHr+MMr3MNgZyuinsTSBrR0fkZfziJK1ArLOk/c8iqtl3wlYyOh8qKZmNILcSaAA
 22jBXuUHhc+sxY7fsqZOwLfKmR41Y03K69IMGLTtnHKFJRPHewXUmW/JuuOAMQSMgqwl
 rOGvoii85nAQwe3fyiIsN1deYXy4jhfFyxbzlZ17ZEGsMRtDpu7xRNzajVzVUOvGmAF+
 EwSaztW4v1yilAQY1alEVIjtF5LIKlmHMIRGHuOAb/DuxR/Wo3Kj7Z0taKbUJ1jsoLxD
 EyzOs5k2GopxjzYxFTNnOYU61olei2hjIZ2X11YXW5NqajyRPDieuAX5Pm/HzoaB3cxs
 iiAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUByHwdwZGa4c5GyAcUIBsMFYnDIEFW7MgfjMxLkU3trnVEQKUMnU14CAhPyzph/X/VIG3OU9prSzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWyo0vKaVXQfQyx+nyjljZRL47X5FpbqAVrHS9ZHUfdXBQDmy1
 2/ABmBNygSUGtH8y2g5lhj2EPdf/c7dR14/xl7htgnCqttz0B2YJX/oIV4OZoCKuggXPkd9mxPk
 0OMkujg==
X-Gm-Gg: ASbGncsTcToxfQWApZkNWGijIBEIX2dB/gIvNmLf7zCJhyiBBGNiB48c5uZ61SQ5tLk
 QHktsbe8xC3cyr4k3z7HoSyCJd1m7MQTwbdU3FY4I7vinXBysfgAEvK/6ZajFVmaIbYF12iEuvZ
 tXZ5/HSxrhmuvpnezRYDOnfVZJlN2MksGmjT/B+4RrbOVy+i1IYmfLwvbZq6QNAFtbyycE/TvvG
 a88jEduIx3Nv3QRtf7l6/5uqEQeu3cV5SCecce0Qcfe7NGHhwrQ3mQjZvztorKUzlRSxBwQC5Be
 KJsJMjzI+Gsy6h114FYpYlna
X-Google-Smtp-Source: AGHT+IFcw4DKoo7nUVaU+0Kvy3jHqHxqFC+1BD8JUQiHjNPDwWsOn0KCTbFaGh8XCr0xuYBZjcaCQg==
X-Received: by 2002:a05:651c:2211:b0:2ff:bb68:4233 with SMTP id
 38308e7fff4ca-2ffd60e1ed1mr82044891fa.33.1732915915708; 
 Fri, 29 Nov 2024 13:31:55 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599953d53sm213332066b.181.2024.11.29.13.31.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 13:31:55 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-aa549f2f9d2so262769066b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 13:31:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW63GPZrt8h2rOSJ4i6g22UpUiFJsnf7zrN+HwUzCxY/qXetizJXerxzl8nF3Zz/pbaGwFvKP5af20=@lists.freedesktop.org
X-Received: by 2002:a17:906:18aa:b0:aa5:2c1b:d2cd with SMTP id
 a640c23a62f3a-aa580f353c5mr803914866b.34.1732915914141; Fri, 29 Nov 2024
 13:31:54 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tzpFOhQN3yCb4+OpLsfYVrq4mLuUS+SP=H=gq=qSLDz7g@mail.gmail.com>
In-Reply-To: <CAPM=9tzpFOhQN3yCb4+OpLsfYVrq4mLuUS+SP=H=gq=qSLDz7g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 29 Nov 2024 13:31:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh74-reWGqpP+i3O8usrS1Jr12UGGMCfaK58_0aK5Lw_Q@mail.gmail.com>
Message-ID: <CAHk-=wh74-reWGqpP+i3O8usrS1Jr12UGGMCfaK58_0aK5Lw_Q@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.13-rc1
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Sasha Levin <sashal@kernel.org>
Cc: Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, 28 Nov 2024 at 12:42, Dave Airlie <airlied@gmail.com> wrote:
>
> Merge window fixes, mostly amdgpu and xe, with a few other minor ones,
> all looks fairly normal,

Hmm. I've pulled this, but do note the report by Sasha.

The

        if (WARN_ON(!work->func))
                return false;

from __flush_work() looks odd, and is fairly obviously triggered by
this one liner in commit 93df74873703 ("drm/amdgpu/jpeg: cancel the
jpeg worker")

-       bool set_clocks = !cancel_delayed_work_sync(&adev->vcn.idle_work);
+       bool set_clocks = !cancel_delayed_work_sync(&adev->jpeg.idle_work);

where apparently the jpeg.idle_work isn't initialized at that point.

It looks like the initialization is done by amdgpu_jpeg_sw_init(), and
it looks like that cancel_delayed_work_sync() is just done too early.
But I don't know the code. Alex?

The other report by Sasha seems to be a 32-bit issue, where something
calls roundup_pow_of_two() on a thing that would round up past the
32-bit limit. Presumably it works on 64-bit.

But I'm not seeing anything that looks like a likely *cause* of the new warning.

There's a couple possible cases, although this one looks suspicious:

        adev->vm_manager.max_pfn = (uint64_t)vm_size << 18;

        tmp = roundup_pow_of_two(adev->vm_manager.max_pfn);

because it explicitly uses 64-bit types for that max_pfn thing, but
then does that roundup_pow_of_two() that only works on "unsigned
long".

Sasha - it would help if your warning stack dumps had line numbers
(using decode_stacktrace.sh, which you should be familiar with, since
you wrote it...)

I realize that requires some debug info, which might slow down builds
etc, but it would be really nice.

          Linus
