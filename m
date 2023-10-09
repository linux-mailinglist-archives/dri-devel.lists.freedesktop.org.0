Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE777BEAE9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 21:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F6010E1A1;
	Mon,  9 Oct 2023 19:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8857110E24C;
 Mon,  9 Oct 2023 09:13:14 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1e0ee4e777bso3016088fac.3; 
 Mon, 09 Oct 2023 02:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696842793; x=1697447593; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+6j4vvxY4EqozcmVPKocYKAhoEnZR1RKLlrR38PBlyo=;
 b=PbeU41nl4zfNFRy+W5DTLzhlzvaot7kVIzP455xk0x0pXLnEmAbuNc5c2cCVmiwhkX
 QVOq2P4vB2TasZ1RkNBNH27j6z2Y+JuYjriG+Oke8kvsBY7jbkg9vXZ1vc6395quXpzr
 UseiJ6IdCt55GKkusur2/sPkEczHazzFhWJeh65xvbXFI5aBzLMmMjlPF0Qn1jM81aRo
 iCgPH7WEnx0uiRbWeRXtZmWC1zcTH1O2DSGBXy8KVm8ex62QHi+rLEJvOMEZh2DQeGEC
 MnjYUaly+U/UUu8wGBo5DLYO8IvvaAZ5f6SYgHptmhkug2f7ClYGhu3SzjVrt4DAEauD
 cd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696842793; x=1697447593;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+6j4vvxY4EqozcmVPKocYKAhoEnZR1RKLlrR38PBlyo=;
 b=TBT+0nqu2MiDsiBbc1CL4Syf/1W3WtMHuLM+Y4VGnWKeLu+gpGzJn4i0Pyr9hpiAeK
 CxTKW+Ob3kq7+1lsVrpb5HgExCgnHeqtRT433tdDX8JWh4VVAym6yw3Z/RM1Ly/21I1h
 7YVfK9D5PaSlOnqtFKW1SpK5HqBJ44MlZ3ldZlF54n6SiBYK8+1dQjJcat3iw5cvOzrO
 tLJ3A4a++jsLg15PUkBaZo95gKT0UYmB347rAlIN91SSANcUW/vD2KzaK+ve1GEjP0FX
 9LKkAJg1h+QWsap3YHzK0DyszwUAn3tB8s0uFl0lDhLc2Hm4Ps8wvRb8SilLBK0W3qvx
 GsHw==
X-Gm-Message-State: AOJu0Yw2QnY3Vb7FR54y4Mo9F8f8n46BuBche3t9FEMinm6+OVBEp14k
 wAw/ntAHJmuXVWTra3W6wrKX8NgW2DUKpsDPGjU=
X-Google-Smtp-Source: AGHT+IFC5K5ukyGxfSgYqssv30cv3lVT+tGyeW1gq1ro6ijzaWIOfHM87jWQp/uZiGRud8xNqHx7+THodnZg3ePCxhs=
X-Received: by 2002:a05:6870:5ba0:b0:1be:f8d9:7bdd with SMTP id
 em32-20020a0568705ba000b001bef8d97bddmr18638659oab.6.1696842793555; Mon, 09
 Oct 2023 02:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230918-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v2-1-8ae12071c138@google.com>
 <202310061323.05B262D@keescook>
In-Reply-To: <202310061323.05B262D@keescook>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 9 Oct 2023 11:13:02 +0200
Message-ID: <CAH9NwWfM2E=M1u_LnRLXkXqbJapR0aga2kex=uc3YBMkdP2fHg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: refactor deprecated strncpy
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 09 Oct 2023 19:52:41 +0000
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
Cc: Bo YU <tsu.yubo@gmail.com>, Justin Stitt <justinstitt@google.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Fr., 6. Okt. 2023 um 22:23 Uhr schrieb Kees Cook <keescook@chromium.org>:
>
> On Mon, Sep 18, 2023 at 01:34:08PM +0000, Justin Stitt wrote:
> > `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> >
> > We should prefer more robust and less ambiguous string interfaces.
> >
> > A suitable replacement is `strscpy_pad` due to the fact that it
> > guarantees NUL-termination on the destination buffer whilst maintaining
> > the NUL-padding behavior that strncpy provides.
>
> Friend ping. Who can pick this change up?
>

Lucas is the one who is responsible for this job.

>
> Thanks!
>
> -Kees
>
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Cc: Bo YU <tsu.yubo@gmail.com>
> > Signed-off-by: Justin Stitt <justinstitt@google.com>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
