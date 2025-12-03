Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDA7C9E99F
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B7410E18D;
	Wed,  3 Dec 2025 09:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OxtwFCi8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A41E10E18D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:55:00 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5957ac0efc2so7357478e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 01:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764755698; x=1765360498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bf6xekrcsFMQsZdm4tiPKUq/zdj8GQcGkChPb3cjYAQ=;
 b=OxtwFCi86MAn8Ta6i5268EM2H9so+L+s5C3efNE6387mWtCHbrAtdhghyvc3Ky8+Zs
 G1f7nvXRWDRKs7ONSSdX2+5Xs6UnA+2vEGx5orZYcS0zw3MNkhppxuhKgFhhl1KgPKVx
 yPfFBA8AMYAByIdOOGC5CH9p9FS0QZFl39fXnt7pSz1ZBEQVTwefThQ8ccQe7blVV49f
 0UQNkvz6efWGnLXew3TTt0+l2a4On4qCD1wJKeQAU/K0QzaV9SlWezcg9W2+rUmlbOyl
 dtUOxKX751q+A010lLxbH/4gjRMuBSDOgUVMJZ6FJ7pQc1zpO8YzWv0sQdRSgt5Exs82
 RsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764755698; x=1765360498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bf6xekrcsFMQsZdm4tiPKUq/zdj8GQcGkChPb3cjYAQ=;
 b=q+dcBSu3GYMSw37qau0anezeXvPbsfwzbjMrQx115GDxZccDRyIeAwU8Rn4wJUQbFU
 9zrvPoJRyburjItaeVHZftwdgal35SWhuWVsfCNG4xxj32gVHf8XVW5iLo+6EDgy2tRd
 aLB63SmO/YTaEqpkoknS70c10kLZ99OyKJiJvRgn6idz+ydSco4d85iiRrOFzFMYZRaX
 hGzacpGg/wXZtGYL+iUMMnVbnEO9Csh4LAXEztZKqmMWuk5iAf1UMg3LlmcCtZYzm8HZ
 I33XwFlFpxIHXA+42L1d1PKULrpdsMSoVyE2ZlYiMkINUqbJ0VtT/AJedVpwWepch3rS
 EM2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwOYI2hsJqblZxZ5ATZu3V2S3Ej4YZWZrT738NKs26AHBdnhZS5I6b/O8Eox/bTyuucjCFH9Rf7Zo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgbHSH8FeHO5hAShlx0Fd4PCFAyKeQAqZnMJqpmsymGWfHQ4fr
 YVaozMEqkBU+tRRCJGzRUxheWLbnWw1mvLk1uHbv6nFAEeXcRAvUnjtfReG17yD9/5irOc1nKLQ
 3qpEsgtiAiP0EM3J5hDoy1C1FEVvMBnAVzjNk4/giwg==
X-Gm-Gg: ASbGnctR5EK7Oftjn6iP6GnzZA8/hfH5ClItKdP+CtrCG1W06o/VMpPhwdMpnTUIsKq
 l7TfFQ1l51ZzPrQQsF23gwToDGzKLdgkAXM42zTjcnq9XQX9svG/FpwfjR2Zm27x+K9IiBuOtak
 GidaY4fXFoFAVOTNbdp2hvfm5WPlbyKjdQkT2Xka6R5i/z1cZVSycvhIRqyzimjN/Fnk9KszlI8
 P42F6LbvhIgjH9DhoTQdgV39Wah2fYYtyEkwir9+Rt/srQI7zU8/rBVoQimycdhjh14Qrg=
X-Google-Smtp-Source: AGHT+IHPuIKwxz1VJ5GILJ384/PXefNP+n3NPV2VlQgZ4nbetMc71L02vArjvfuIYkxo4JwTlS+BXfDTbbd4MfnOmfA=
X-Received: by 2002:a05:6512:6181:b0:594:48e6:26b8 with SMTP id
 2adb3069b0e04-597d3fea0cbmr771950e87.39.1764755698430; Wed, 03 Dec 2025
 01:54:58 -0800 (PST)
MIME-Version: 1.0
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
 <5d6e8e0e-3129-49f1-8c5f-c2f837a36139@rock-chips.com>
In-Reply-To: <5d6e8e0e-3129-49f1-8c5f-c2f837a36139@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Dec 2025 10:54:45 +0100
X-Gm-Features: AWmQ_bkoUmfhb8re1685S4T8kLpKSzEGo5JqBtrDagJzf8b9dtmfohMBjnGs5MY
Message-ID: <CACRpkdZwgsbVezfQBRP6pX-o8TLvtFMt+M+rL7GrTmeuzN8xvQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
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

On Wed, Dec 3, 2025 at 4:10=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chips.=
com> wrote:

> It seems that multiple drivers currently depend on the CRTC being
> enabled and they implement the same atomic_commit_tail().
>
> Why not implement this in drm_atomic_helper_commit_tail_rpm() instead?
> Or why not use another common helper function for this?

So my v2 version of the patch series added a new special case
helper tail function to do that:
https://lore.kernel.org/dri-devel/20251118-mcde-drm-regression-v2-3-4fedf10=
b18f6@linaro.org/

It was politely NACKed for complicating the helpers library (short story).

It's part of the trail of how we got to this current patch series.

Yours,
Linus Walleij
