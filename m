Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3456D07DF6
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EA510E819;
	Fri,  9 Jan 2026 08:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1EF10E817
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:40:21 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-55b09d690dcso1415854e0c.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 00:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767948020; x=1768552820;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WuAsW8sPlBb3HXHQgJVVkI+Y7zt+NEPceHiguDOxVbc=;
 b=l0cqtQscCfkE+QiFJ460vKJElqG6r2Hef2nGAnkZUIwSPqE2uYVYgVSJPH/NM7DhaJ
 oNqdy6tpJqkd36aPE33L6VsN6lNAhUXkw2ZR78B4hLo1Ig3vMLkAUysa33h0sLg+Danw
 Jcl9fAeFD2OQvF1MeXS1V04xd4m4JaVbV1K+OCUpDb6w+hnp5aUK4V+5QRpxPtbnEjFp
 QP6SzuCOawVJhWIQE4ael+WUjK6Xl1PQH9tuwW1vBBRGy/Hqm+4c/1ecAcORIaC5oV+j
 0IH6dry5F8iVPXBgyxzV2ndIuZzsj6XTw+DWXObffrcVJxq8YskbG7n0loXO2AvdwArR
 2ryA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfK8Fzafhid8/j7AnXnHnNyyhPoNLVyXtohExCzYlNRgvMSiV84YtdeGsQI+Lq/Dvw5K92XASy7Tc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxwc/l1TYkghTn0BkGTIfKLd55t9r9ZcAiL5x/hx1aNurRzwRag
 GcKzmAiHp2etMR92H5oIGwD8vJNIZLkCI6Xc7fo145ffh/dNcv1MJaFOM5dvnk/e
X-Gm-Gg: AY/fxX6OkVQHC4Stf1WVsdqgSiNt/nsC4SVt6x6BeGW8qx0jKQcnDGYm1KG6n/ucjMv
 UiXinR8LicFj3/i1DnBkAe3KCauEmV1bHRVOyW/NiOtxoLfv1aJ+djoeVAbNzOm5Orv763Cra8G
 6grahmCcdNlP2NIR7DTZdkBQrOZ/aotruJT9TwWpt58OTciuk40Q/AX/BJQ9Kyu0dSs0/YIoe5S
 /Cw/lQTqt2fq9ox/FgoEL/l4EGFl2vZJw5McJ5JTZiKKmjMZkRUjLfFXKpJjEBzvcDdExrOh4qI
 YuJgJ7qeDz+ggYjRojZ5Ps8tCUOMlXPdu8KKqB0HEFynn53PCzOsZVU1SdwxACTtv3+/crr//cN
 Xc43X0JFFY4TQSHtF+Iqmuf7jq4uMXJ1G8g7wLbPdCTzK67sgeuTh+UN3In3g2PinjuX/JqUoae
 VMjKRrlmoZ4veSx0IszrIVP/mHDos0nksRbWO1/FiRS4IQPifs8E82
X-Google-Smtp-Source: AGHT+IEPt1gRKW0Lt7n+jwIJ+ia3j/oMp2TLEPup4ZuabPry1uEsFIHuMNeTDRRKW8HWCa3pJP6Y0A==
X-Received: by 2002:a05:6122:d13:b0:55f:c2cc:50ac with SMTP id
 71dfb90a1353d-56347ff99b6mr2990571e0c.14.1767948020216; 
 Fri, 09 Jan 2026 00:40:20 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-563667cf148sm1159224e0c.2.2026.01.09.00.40.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 00:40:19 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-563497c549cso1792198e0c.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 00:40:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUcmTC07uCbjlVb4GgoJUoP+pT4wxthxSUJ3moV87KG+Lp0OsaltqWw8DqwxOC69EUaNgIuk1FT6I8=@lists.freedesktop.org
X-Received: by 2002:a05:6122:2887:b0:55b:305b:51b4 with SMTP id
 71dfb90a1353d-56347ffbd4emr3088425e0c.17.1767948019706; Fri, 09 Jan 2026
 00:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
 <20260108-custom-logo-v3-1-5a7aada7a6d4@kernel.org>
In-Reply-To: <20260108-custom-logo-v3-1-5a7aada7a6d4@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 09:40:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX04g+BfEuBt_0iCvmZiyCLp58d0QwnFtu3bM1Cv59TzQ@mail.gmail.com>
X-Gm-Features: AZwV_QhxZ4-tEsGEnK584clI_hiMcF81rYfU7L-GCTH9ANG1oGbPxo_i7btpNjs
Message-ID: <CAMuHMdX04g+BfEuBt_0iCvmZiyCLp58d0QwnFtu3bM1Cv59TzQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] video/logo: remove orphan .pgm Makefile rule
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org
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

Hi Vincent,

On Thu, 8 Jan 2026 at 20:06, Vincent Mailhol <mailhol@kernel.org> wrote:
> The kernel has no actual grey-scale logos. And looking at the git
> history, it seems that there never was one (or maybe there was in the
> pre-git history? I did not check that far=E2=80=A6)
>
> Remove the Makefile rule for the .pgm grey scale images.
>
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>

Thanks for your patch!

There newer were grey-scale logos. Linux also never supported
drawing them.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
