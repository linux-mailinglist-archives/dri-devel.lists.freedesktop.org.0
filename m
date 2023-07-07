Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E9B74B730
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 21:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0EA10E5DF;
	Fri,  7 Jul 2023 19:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248A310E5DF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 19:35:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbda07675fso05e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 12:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688758513; x=1691350513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NjTTuy3pR7yCwxc+ymqk+V4QgNVJ/yG4vdogUTF+H08=;
 b=nmCtPhlm928yluJDW7fvKvZ/+zzYDWY9FE3v70mZ+XNsB2fApZMKLaudto7gm1ZkPY
 tIBUBEtfY9THz82uKOIZKKSy87kT8hPbIkOaKH09qTPPfYTY5RtDgxAKL1XV4o2I3mi5
 zR0RuJ5WTdwSTsu1AK+gJI9GEiFuY9bO7MhN8gwsRkm0icR2oDo1u19AKofExxZM8jtS
 vvaLJg6x0rJIQ+9gjcXWNdGVFC/ZcRJcycmXuoYPLoO1rNJ0Y8l/2rYrG11ELU5m0IPY
 gSrLa6GyW7UNHev4K/72o0DyFnbRPTJB95x075l0qWTISPAgBRdQaL1Us5K3mSv+RAS8
 W8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688758513; x=1691350513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NjTTuy3pR7yCwxc+ymqk+V4QgNVJ/yG4vdogUTF+H08=;
 b=OKYBx19fnyP1VpLrK5nbkN0x+fwZ9vIZ3hPIZSijju97eAthywmWQI3aOKSz6E+a1+
 UtGbjFWhM05QZ9cSh4Sugqyw+ygTpllon1WX9VymDYBiIu2XJh/tynqII+hT/7Hc8mia
 GO2t+doy82MEzAGLKtFMzRWuJREYMEQIvzWx0GApi6fDuT0U/vXCwYZ/25FEs0lkpFrx
 AvIzhkofKVxV8RbS31Gv7GFKw/MqIx2cvPzE3/mmAdHD3DDFRYtUFrKupqVhMGUHZcA1
 FsoZqEX1WcjGM5pg96tureezOgA5rf4An9uDq8OpcomWnIQomxckFErWDxtYg73hjnko
 wP2w==
X-Gm-Message-State: ABy/qLZAn/rkv6hfwa78dvr8yOg8DxMI/FOfeyvVDEK5xUXknt+oF5aQ
 D9AO1HT5+aB6zuAc/QIuiAITnnpv4j2JIOt8aLc9AA==
X-Google-Smtp-Source: APBJJlHoDXrVRzZplAIxqvP5BGfmN0a1MoLsMFcOWAv9R9XEIWj3t/JVPls4FKxp06zmHVe2bjdVm98ZFJcGPedDjsk=
X-Received: by 2002:a05:600c:3c97:b0:3f9:738:4efe with SMTP id
 bg23-20020a05600c3c9700b003f907384efemr4804wmb.1.1688758512599; Fri, 07 Jul
 2023 12:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230614235452.3765265-1-pceballos@google.com>
 <6b49563d-e9e7-ae8e-582e-f4aead06de0a@intel.com>
In-Reply-To: <6b49563d-e9e7-ae8e-582e-f4aead06de0a@intel.com>
From: Pablo Ceballos <pceballos@google.com>
Date: Fri, 7 Jul 2023 12:34:59 -0700
Message-ID: <CAO9JgFx2i=S5P6_ndO85k3GFnggyJW1pXavc1emmSC3yjO8M7A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/display/lspcon: Increase LSPCON
 mode settle timeout
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 14, 2023 at 9:35=E2=80=AFPM Nautiyal, Ankit K
<ankit.k.nautiyal@intel.com> wrote:
> I was wondering if trying to set LS/PCON mode multiple time will have
> any effect.
>
> Unfortunately I do not have access to machine with Parade LSPCON chip,
> had suggested in yet another git lab issue [2].
>
> I have a patch for this, sent to try-bot, though not sent to intel-gfx
> yet [3].

I tested this patch and it did not resolve the problem. The error log
was repeated multiple times and there were still link training issues
afterwards.

> The timeout value was already increased from 100 ms to 400 ms earlier too=
.
>
> If there is indeed no other way, perhaps need to have this solution.

Yes, can this please be merged?

Regards,
Pablo
