Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED62DCBF524
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 18:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E60610E4E0;
	Mon, 15 Dec 2025 17:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="Nfe2GunN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF8210E4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 17:55:25 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8b2ec756de0so408508885a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1765821324; x=1766426124;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8aCiihqyfBhDBvKtwXzCvq/yRXu9gmrOv+bogwSRfMI=;
 b=Nfe2GunNAJQSKy6QYBDDUwSc5BOqGqusNxCmw2z7UFXshIq9/TUw6CMgAW7/AEpb7k
 Lp9AbicGN3qwsMeA1+zJaoW59ut2/ZG74ZJ9FQ66llmcZpgA0XRyspBhLJLdRgIIOwIE
 KY1X76yYZ4xsosw8/jxbXb1TDvK+Epaww9pIkf+rvCgBtVyOPIFQ0Lk5A3n/4VElP/SR
 xU0lpcFSawiWhOr3wM+z4E0RZPbMaExQQWzPW6KU5qWXKT2rJXCIWjQZZ740tu+f8kRq
 OdgAiJy1zhzLcUFw3hjKfbXt1UijF8iROKp+3Zxvyof+7AeEMJOmfGOIOEg+bknv7FWc
 4uKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765821324; x=1766426124;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8aCiihqyfBhDBvKtwXzCvq/yRXu9gmrOv+bogwSRfMI=;
 b=bL9nvA6fsFfVOXFIXBSQYIif6SP9vGqmIz2Af+Bt8P/jYTZB74/1OuLSXMX3E9pc3y
 v5o4pOpqmd/f2E+bRgd6LVpr2uRpmYCm/SB/5zxTe+iAMm+Tu6myCWHuMwx2F5ETwypA
 lQ4iiSAiCD2aDI3343gs6Am4KBYOHRRUyOYpahyoFlHkV4UNITnesYOoIAs5n2ZcSBLC
 SpBrjCpZXFMvIJ7jAYwDNRgDhoXmcTw35U2rSsZZg3aV703RURgTQe73LF+frIhZmBMA
 VqTuik2PbfScij38v7q2UyKPml3LPYXZalmG8syESt1hw4O7oflUkZyxeCxB7J++3lXd
 DuxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRVB2qcu6RIzO4kKz2rNWW3FQtmfoYQQqhtTd+epdDqjoGEvVrrwcW7TspE0Bvz5NnaHQPn5i/Nj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwboPjkEDpN1L5ppkynu1EqsMRKgGguRKEellXcOLCZpvcOKk8q
 JrHfSTnepoEynW7Ea5UYUztWURqHV7sRxLJcsKKhK+skC3lRTTKXb1OlUNK/rwIMppzghnt6iRA
 I1Efp+W+6EutLv9fKeULM1nQ3Q5fVIl7N6Way3F/FLw==
X-Gm-Gg: AY/fxX5ZGmxuxRRuswVf/CcAjRIK31GHAskqtCSj3ISOUetGhy0FN7pw66L1nhv0hwc
 r+TzoJZs3aOcRtRb/OSIreNq2Rc/b+/vh1cHGG7eyTVaaZSni0h7OWZWAWjXvTF29jpihQML/Mv
 B4wnbyA+F4D+kk5Qptux7KaJZhyurFPKeEgDUcpJMcqdPdPcfvRk1Dyr/8K26gJnGgGu1HmU6Hz
 Hvrd0dp3RIbcY7SyCXYChfnUV6iJ4iJr/7dajbfkfFHDmbRsOI1+b7diD7ATKGZ+7kYRlk=
X-Google-Smtp-Source: AGHT+IEquHwQ+urOMR2ohVWjSdQ8ANcymdBrTg3QcyuKio1k3FljEQrqH2T2Tn3/APITsfhyN5lzUFG1dY78glwUVow=
X-Received: by 2002:a05:622a:1e96:b0:4ee:12e0:f071 with SMTP id
 d75a77b69052e-4f1d04a585cmr184413841cf.20.1765821324595; Mon, 15 Dec 2025
 09:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
 <20251211-vop2-atomic-fixups-v4-1-5d50eda26bf8@collabora.com>
 <20251211223822.6eeabb4d@pumpkin> <14738785.uLZWGnKmhe@workhorse>
In-Reply-To: <14738785.uLZWGnKmhe@workhorse>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 15 Dec 2025 17:55:13 +0000
X-Gm-Features: AQt7F2oTFN8HvvMalRt84ZK6fte07GmPQ77VoQFhH6nEJYL6l1qYY_efw-Mj3bQ
Message-ID: <CAPj87rMeJWLm9J=7kMrEvbpzVOMiQc-TThSNE-Gfac7nhUB3bw@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: David Laight <david.laight.linux@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
 kernel@collabora.com
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

Hi,

On Fri, 12 Dec 2025 at 12:46, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> On Thursday, 11 December 2025 23:38:22 Central European Standard Time David Laight wrote:
> > Except that all the systems with PANIC_ON_WARN set will panic.
> > I believe that is somewhere over 90% of systems.
>
> I also like making up statistics. Warning here is the correct move
> in my opinion because this warning being triggered indicates a bug
> in the kernel code, and with PANIC_ON_WARN the user explicitly says
> they would rather panic in such a case than treat it as an abnormal
> condition that is recoverable.
>
> The reason why this condition ever occurring should be treated as an
> abnormal condition is because the DRM subsystem should guarantee we
> don't get a framebuffer of a format we didn't explicitly declare
> support for in the first place. So this condition being hit either
> means drm_universal_plane_init is broken, or the array of formats
> that's passed to it is out of sync with the conversion code, which
> is also a bug. Or someone managed to thoroughly hose DRM's internal
> kernel-side data structures, which is precisely the kind of thing
> PANIC_ON_WARN users want to abort for.

Yes, that's exactly it. We make all kinds of load-bearing assumptions
everywhere: that PM code won't pass in a NULL struct device pointer to
the resume handler, that our driver callbacks won't get called whilst
the device is runtime-suspended, etc. We could try to handle every
single one of those with if (clk == NULL) return 0; /* ??? */, or we
could not.

If you'd like, we could just delete every one of these checks and
replace them with comments, explaining what we assume the invariants
to be, and wait for an OOPS due to dereferencing invalid pointers. But
the MISRA style of 'handling' every possible impossible case is not
tractable.

Cheers,
Daniel
