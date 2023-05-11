Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C008D6FF230
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 15:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D4810E1F0;
	Thu, 11 May 2023 13:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879CB10E1F0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 13:10:57 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-55aa1da9d4aso153657957b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683810656; x=1686402656;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XFpq6TfFDkhgvBTK4lDV32kTv2wLv5jHDb1iGqYi2iA=;
 b=U/2Diq/SUie5ovRJp2JaJUsY3qlL/vUyt9R+RMzFIuXciY16vnI8YnKAU3vD2Etej3
 U6NLh6qFlJH8kfCVEnnd99B60OrrxFQfBsIS6uuE/+uJoBwJx6MqbwMb8n1qZwGhIqvH
 12ytOTlEv17XGOZd3sX1dvMxbWzvDTJbGOcYwBavoUnb+tM6TnNNNtjL5wff3qgaKAnT
 OwGFlw10/bicU0uLToix+8aV/Za5qh7gMcEDPAxQEE9bjDxMi2kttQbWNQd1jdkQxRY6
 8OBxwBI4e2QcdsGPf2klRIa/pVSvu5BPr2Fb0aWyp3Cl7esGoY27PT/hwnCyli7hdgQ4
 lHaA==
X-Gm-Message-State: AC+VfDzuxcuYKsB7Juk15DrKC8xe3EErsM9VAnby+iLT6AEZC4bBlclH
 yz4zu2kY4csNg5PhOFYEjHFASrWLXwPsPg==
X-Google-Smtp-Source: ACHHUZ6KP9+6SLPR1qFXs1Wy0t5J/FQqQFje2QDabHeIgkG7Z83WnwEfvMS49RenZRfdgqOtBptb7A==
X-Received: by 2002:a0d:df14:0:b0:55a:3560:8ee0 with SMTP id
 i20-20020a0ddf14000000b0055a35608ee0mr23961501ywe.20.1683810656323; 
 Thu, 11 May 2023 06:10:56 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 z141-20020a0dd793000000b0055a446a9e71sm4859075ywd.40.2023.05.11.06.10.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 06:10:55 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-55a00da4e53so153650207b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:10:54 -0700 (PDT)
X-Received: by 2002:a25:3792:0:b0:ba1:e7bb:a3a6 with SMTP id
 e140-20020a253792000000b00ba1e7bba3a6mr17227303yba.18.1683810654067; Thu, 11
 May 2023 06:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230510110557.14343-1-tzimmermann@suse.de>
 <20230510110557.14343-2-tzimmermann@suse.de>
 <0e13efbf-9a48-6e70-fdf3-8290f28c6dc7@189.cn>
 <a2315b9a-0747-1f0f-1f0a-1c6773931db4@suse.de>
 <15fe1489-f0fa-bbf6-ec08-a270bd4f1559@gmx.de>
In-Reply-To: <15fe1489-f0fa-bbf6-ec08-a270bd4f1559@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2023 15:10:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8piLhEbV+pcWvdn1OEGH9N5FwDOQcqNcEjBx3=ThjXA@mail.gmail.com>
Message-ID: <CAMuHMdX8piLhEbV+pcWvdn1OEGH9N5FwDOQcqNcEjBx3=ThjXA@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] fbdev/matrox: Remove trailing whitespaces
To: Helge Deller <deller@gmx.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 arnd@arndb.de, linux-kernel@vger.kernel.org, chenhuacai@kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <15330273260@189.cn>, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
 vgupta@kernel.org, sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, sam@ravnborg.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Thu, May 11, 2023 at 3:05=E2=80=AFPM Helge Deller <deller@gmx.de> wrote:
> On 5/11/23 09:55, Thomas Zimmermann wrote:
> > But the work I do within fbdev is mostly for improving DRM.
>
> Sure.
>
> > For the
> > other issues in this file, I don't think that matroxfb should even be
> > around any longer. Fbdev has been deprecated for a long time. But a
> > small number of drivers are still in use and we still need its
> > framebuffer console. So someone should either put significant effort
> > into maintaining fbdev, or it should be phased out. But neither is
> > happening.
>
> You're wrong.
>
> You don't mention that for most older machines DRM isn't an acceptable
> way to go due to it's limitations, e.g. it's low-speed due to missing
> 2D-acceleration for older cards and and it's incapability to change scree=
n
> resolution at runtime (just to name two of the bigger limitations here).
> So, unless we somehow find a good way to move such drivers over to DRM
> (with a set of minimal 2D acceleration), they are still important.

DRM can change resolution at runtime, just not through the fbdev API.

Or do you mean the resolution of the text console, akin to
"fbset <mode>"? I have to admit I do not know if there is a command
line tool to do that...

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
