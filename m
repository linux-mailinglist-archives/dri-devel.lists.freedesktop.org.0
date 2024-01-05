Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF6825AF1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 20:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D937110E698;
	Fri,  5 Jan 2024 19:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2608E10E698
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 19:08:57 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5e784ce9bb8so7189547b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 11:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704481736; x=1705086536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NC2bJp2abkUAY3rCEbXohtWXjxySOLDcFj8N67lxtGk=;
 b=dblmZwQ5pvP42OrIpcnm0+OFfYv5N14ksxAjb2VK1JAfKCkIIoEwk6WhPJ4+mrGUWo
 fuqaezkTMUPA/uLDeVChnrv60aeF+wtOno57BuAmYszqEPeXFPro0beV0b0pbyTsle60
 6tP07Xv8UBEWYvya/kMQzTarUEMDHG9FIsUiiDzJTMUDim5lrbEJUV1fEI3Kpm9dJ9k7
 y+AP/EPuGExpRpEUw1FMI7HfaR0HS8FdbS+spb5tjXTRnJOi8iPsVqJDTBAIKAJ5lWYk
 kBMA+JebfDyDvH55giYOqgdT5MLlISqQN0mSzYNoQTaLeMyStVoogEWRLY7WG4kTl5sU
 ieEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704481736; x=1705086536;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NC2bJp2abkUAY3rCEbXohtWXjxySOLDcFj8N67lxtGk=;
 b=PKzYHYLArdR85k8/CPwWW9SMK26+Kp6TNIIiiFYMaB7u+OKaYQyA6LO8uVs3bmk3R1
 rHyZJ3NTxTS3Z+CExxWdxZqV6kJHvBW6tSf3gWYMob2EfBMPaVLsQ1uU01TTkm9iU/oI
 eURZ3AawFT2r8/ejrri3hBxQqRPVmPxbmDNvQDCQsWBDwVouRtiDhInnL6TSstO6Spol
 iPMXlFJTqPOKrnIlwux2lNDU/JnO/nae0d85bhYlubDDtj1qmmqGfUZQ3QmG1onAjg6i
 2GY1OgcgdMjMIO8fKfPXWHsS6GQD2PDjTheKEUOpVldeAWJ2AgcimXOrBa8hM9T02wiR
 igGg==
X-Gm-Message-State: AOJu0YzjFan2AQsadC0wTMdSWc8XNogWCnJSRZMKbAo3IcSlxSpLuEa6
 lhGd/HWtFxBDv1ZyPaIl8xKZJSlvT2RpxHntJeCA/RNZ2/Bxgw==
X-Google-Smtp-Source: AGHT+IEK0/3LJwUV4kqP2Gt6f/UKalZkGldGSpBhIQzQfzQExxk3vB697yusXLa/RW7IA6p/kyNMnVIY1v5ZBsrbO1k=
X-Received: by 2002:a0d:c785:0:b0:5f5:cdbb:534f with SMTP id
 j127-20020a0dc785000000b005f5cdbb534fmr1479204ywd.24.1704481736301; Fri, 05
 Jan 2024 11:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
 <20240104084206.721824-8-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240104084206.721824-8-dario.binacchi@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Jan 2024 20:08:44 +0100
Message-ID: <CACRpkdZ9uYj6geL+_NijdCP3mem-Lr+9RB1Nm4_hL3U480merA@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] drm/panel: nt35510: move hardwired parameters to
 configuration
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 4, 2024 at 9:42=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> This patch, preparatory for future developments, move the hardwired
> parameters to configuration data to allow the addition of new
> NT35510-based panels.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I tested this patch on the NT35510-based Skomer and it makes the
whole display mirrored around the Y-axis (text from right to left instead
of the other way around, penguins appear mirrored upper right
etc).

+       /* Enable TE, EoTP and RGB pixel format */
+       .dopctr =3D { NT35510_DOPCTR_0_DSITE | NT35510_DOPCTR_0_EOTP |
+                   NT35510_DOPCTR_0_N565, NT35510_DOPCTR_1_CTB },
+       .madctl =3D NT35510_ROTATE_180_SETTING,

Changing this to NT35510_ROTATE_0_SETTING makes it work
fine again.

With that change:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
