Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623990C428
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CED710E290;
	Tue, 18 Jun 2024 07:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3BD10E290
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:14:58 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6383f01d1deso14933707b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 00:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718694896; x=1719299696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/mPXpBtKaq4fENYlENLj25BgA6Zpb9v6MwGbSxQAog=;
 b=Ye4UDt+UTezz6DI+E4ROmKpSldjsuNFccJ9JJ961VwHGuJMcPDeiBMYiq63xi4ErNN
 7Ln7UCnEJgNfsyGyCw5r5wAH/hxG/HiqO3aOMrOxGXFxQGJUGst9adi/iGU+9X3mVoXj
 OtsIIbDKDUXJds3evnlpZV/CCdqaA4IOcqmiediUtmAfUBGBmJLEU/3pjg8tpmRFGX3b
 o+e7aBkOi354CBB8Yee9yOvucIBKHNsC8SlXvUpniR3hzuc7XsqGZcQhad5/8ATUetJw
 u8wF1tJcyC8UtIEW9PYaKCtrCtOwFmOjhFvldIQju+99wobzJ+E4DrRBm+IcKvWkdqrl
 dFwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSj0f0I/KLhqFNXW2kDtn9V4t1h+yiptMmcFaOuuhXYGK0DHr7I/x4936qnAOhXctOjVWeYRksJKHVsmzhDAuXRM7mk3F1k10mepdtnG8w
X-Gm-Message-State: AOJu0YxjoZwNENiMcN8XGUCyrGQN23KExMUUi40GOoShNaNObrgVlN3U
 KNubbhub33/1oSmtv3rvLduoW5hWO8/S4uRCd2aiNCN9jWyqbEYzSrL47kRD
X-Google-Smtp-Source: AGHT+IHrJUvtDAgUfo1NrieWccTLEViSIhXMLYWFAm3E2f4UACDedorOy2w3JYAq4l8LiOTEVzUKXg==
X-Received: by 2002:a0d:d749:0:b0:62f:6d69:c2d7 with SMTP id
 00721157ae682-63222c53f41mr93131527b3.22.1718694896586; 
 Tue, 18 Jun 2024 00:14:56 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-63278eb897bsm14050737b3.73.2024.06.18.00.14.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 00:14:56 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-62a087c3a92so49211877b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 00:14:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWMGFZtBWbBV52cexBB2r7Vzh9UjS3kuknUxCIlnR3yR4fe/8jKNF7ghsT/xqlb4p1tNUis7Cw8JajfLlW9V8l9zr7YjkfntOvfxf/4sdEC
X-Received: by 2002:a05:690c:f88:b0:615:3262:ffb1 with SMTP id
 00721157ae682-63222a56021mr139227977b3.12.1718694895868; Tue, 18 Jun 2024
 00:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240617-md-m68k-drivers-video-fbdev-c2p_planar-v1-1-8262753bb4e8@quicinc.com>
In-Reply-To: <20240617-md-m68k-drivers-video-fbdev-c2p_planar-v1-1-8262753bb4e8@quicinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jun 2024 09:14:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvYxJiwC6rU_tT3rCDnTO-R0KsNT9Sxxd5UGTC5Yab=A@mail.gmail.com>
Message-ID: <CAMuHMdVvYxJiwC6rU_tT3rCDnTO-R0KsNT9Sxxd5UGTC5Yab=A@mail.gmail.com>
Subject: Re: [PATCH] fbdev: c2p_planar: add missing MODULE_DESCRIPTION() macro
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

On Tue, Jun 18, 2024 at 5:05=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
> With ARCH=3Dm68k, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/c2p=
_planar.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
