Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4840901841
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 23:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CB610E2B9;
	Sun,  9 Jun 2024 21:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U6N0IsNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C248410E2B9;
 Sun,  9 Jun 2024 21:19:22 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6b07d83b8d2so189006d6.1; 
 Sun, 09 Jun 2024 14:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717967962; x=1718572762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFOvTdjQjjhoh4wsKRpCaTJdsFlZLtgchfZ+i+kPTAg=;
 b=U6N0IsNXlNXOELjNgxBgP9KiR6VycVM5haifMkir6VMvEmlgvM7mc0Ktf5VzaJOgNN
 XaE3Pj/Xtuhwn0vZKwWhuVo88Bk15yKJVqPULtZyOD1avP3bl8JGUzRfsrSRts7Sxxi6
 1ZA2jAD8vRDUr4pk0rPA/CbRjXyrpV6DUnKoYbFWChvuU0w2Ob7pPgZnEuYp8yRYDWov
 Sw/B5fXhRTumR0sAizI2OANooI9oKQyciXS3edQ0bN1NBBbk1TfOeDxb1tU9WZkTzI/x
 dsA4bD4l7MTYpcHxukFyfgmWbqRngHOtn4vJz7Duc55M5aTX/hrhSf0F6doTyguvRpP1
 oBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717967962; x=1718572762;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HFOvTdjQjjhoh4wsKRpCaTJdsFlZLtgchfZ+i+kPTAg=;
 b=cPrMkMbXVg/6Kow1SgAA8Atd73XZO9a4hieBuL5eYopOFTBDHwXjzvrF2EmbLzF/pA
 4J3VL3KbQ7K7tZKho21a+yg/Fr1TBge0+WsmC11G25c0LpXlVd9qb2fN3e1+CygGTn8l
 u1g/PKM4sTMhF++gp0PVcxnG4LUY2cTPgtPV05v3lu/kedaRCmSOSSrpIcjrT67o7a+9
 yiqnFW7rqz/0SfZGYM5EBflv4Uh9lOAPpv85V9CsaRa2q+b/umxkhamXZUc6UHKcjmwb
 WsuttwsBeFJl5r7QK9OR3A8oi4ZUFAeOBqzOJACY9/umXAZUQXbFKSFSS2rUp4hF4JZy
 40Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnQ7GbuUSz0Ns1+uLcDWGM9GsJ5hdycNsXbEmHYw643ez4TZOrSpdaGxQG/6jEXHjiH8knHCtj3lyYeXJHAIc8vDn2SbJyR/JsLrgqKROcto8KVggJ4yeUwCirEEMQfNYML+zCqiP0Sgi8rnGHjQ==
X-Gm-Message-State: AOJu0YxohQQaYZFthC/WvG0ZCZY7DaaBlJNnSpmp/deKp0ken3PRLOSm
 QKipujl2JJSp7BfNQlxuHSHJgdiaz4Z/Wk3Gi9rlOQaPrVzFnLQq2Okssn9SfUlD9MdONynx3ZS
 VLmZLJBlFhUiAfU5uZoqP/3jlEks=
X-Google-Smtp-Source: AGHT+IHVRz+3tbYJAWHmxuulkifl8hVs+5TI6OkCO7MdTRYn7FXiijjkzZmf4d5Z+6MXekrvUQQFP9LP3HkDuvHn8H4=
X-Received: by 2002:a05:6214:27c9:b0:6b0:7369:e747 with SMTP id
 6a1803df08f44-6b07369e7e8mr33592676d6.2.1717967961699; Sun, 09 Jun 2024
 14:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
In-Reply-To: <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 10 Jun 2024 02:19:10 +0500
Message-ID: <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, Rodrigo.Siqueira@amd.com, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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

On Fri, Jun 7, 2024 at 6:39=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com>=
 wrote:
>
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
> @@ -944,7 +944,7 @@ void optc1_set_drr(
>                                 OTG_V_TOTAL_MAX_SEL, 1,
>                                 OTG_FORCE_LOCK_ON_EVENT, 0,
>                                 OTG_SET_V_TOTAL_MIN_MASK_EN, 0,
> -                               OTG_SET_V_TOTAL_MIN_MASK, 0);
> +                               OTG_SET_V_TOTAL_MIN_MASK, (1 << 1)); /* T=
RIGA */
>
>                 // Setup manual flow control for EOF via TRIG_A
>                 optc->funcs->setup_manual_trigger(optc);

Thanks, Alex.
I applied this patch on top of 771ed66105de and unfortunately the
issue is not fixed.
I saw a green flashing bar on top of the screen again.

--=20
Best Regards,
Mike Gavrilov.
