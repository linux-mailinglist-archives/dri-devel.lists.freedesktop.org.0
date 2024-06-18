Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0741A90C427
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CC510E214;
	Tue, 18 Jun 2024 07:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3C010E214
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:14:50 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-62a2424ed00so59180107b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 00:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718694889; x=1719299689;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rz6LJGzD4G8AYqhBAzwk0Rq4f7QZMRwIAsp6KRs4lxo=;
 b=HuTwSI7Zlt48jJ4N87aop6qaLaELQgbvsyEGhMNvN5B+Bw/2/u0pESboUGe4VjygNy
 ZAmArqGRYj00njarXqcJCWXwjXKXFH8PfDTCSk8CFwrugZjBrwKvrWHaMcmNvB7c2jrl
 vkNbYlP3rV6IZC02RAlFytZZsECb0GotVYOWo01O6G/cEznzYC++/d0qlyqNwFAxz5NH
 HuE+bYJ2RQRJGx4xF2Cpw/7lzPs+7J2+IPe9B2T8VH6u6IJVsxvDZbEr8kiuGbZ8qYGn
 z4ETlID1kH4Flb1fBDtTXsKu4XMAauksF3Uegqznezq7z+59RbVYKk7vrH8ODIAma1Wf
 F74w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWntRNDiJT5HNDBvvLC2TpIXryu7XH/dxlizb1MJN34Hxe8p2QzPk3B/FyeGzr+sgG9jM7z+h+SX69ZFnMT49Gv9CRKL4YNHt2uHhtMMRpE
X-Gm-Message-State: AOJu0YzKhjUKt1YY/dnGo7t4LNIr+oQyaWRKcJH+wZvtKv5VcoVKarO6
 9Sjg33kFP18nfW6de3yuClYsLo8ZDtwIhHU3imoDAC4xBYcRQjnT4aUW3ewB
X-Google-Smtp-Source: AGHT+IG627/tBnadmmyh0iHKt8rNaxRzQDisjJAbb9s5zb1lTR9iJv0TaQ7FgVn30+3Kk6n/mwQVLg==
X-Received: by 2002:a81:4311:0:b0:62d:18f5:6f76 with SMTP id
 00721157ae682-63224fe8657mr113207357b3.49.1718694888742; 
 Tue, 18 Jun 2024 00:14:48 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-631183d79d9sm16921377b3.18.2024.06.18.00.14.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 00:14:48 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-62a2424ed00so59179897b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 00:14:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXIaTgGxjGf0gGU4/bLFcEWYFEPqm/SZwAypCBZgog4aBLRu/2ph9erTburn2slEFcklP9Dy/cmgu/iWDPRNcNbwqVIkTe2zn5hVn5xI9Us
X-Received: by 2002:a05:690c:24d:b0:62c:efa2:a091 with SMTP id
 00721157ae682-63222a58bc1mr110730687b3.14.1718694888087; Tue, 18 Jun 2024
 00:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240617-md-m68k-drivers-video-fbdev-amifb-v1-1-85f74746ecd4@quicinc.com>
In-Reply-To: <20240617-md-m68k-drivers-video-fbdev-amifb-v1-1-85f74746ecd4@quicinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jun 2024 09:14:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6G6sXpJmtHXCZobuOstvn4Kw-90mpky-ZXPcoe_ezUQ@mail.gmail.com>
Message-ID: <CAMuHMdX6G6sXpJmtHXCZobuOstvn4Kw-90mpky-ZXPcoe_ezUQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev: amifb: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

On Tue, Jun 18, 2024 at 5:14=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
> With ARCH=3Dm68k, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/ami=
fb.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

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
