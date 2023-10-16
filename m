Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A657B7CA625
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 12:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E262A88E45;
	Mon, 16 Oct 2023 10:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037CB88E45
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 10:57:48 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5a7c93507d5so51724757b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 03:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697453868; x=1698058668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MLo6lm8DCOrQa7cpbQxRmZ4AW2SzeQU7OJCzMZY1x2g=;
 b=eqAcI7sd5LgGYZcMC3EeWrRtxCppdo6o9ini/bba6TLK5YtcLXTj2N6fMR7J4c1t2x
 TI5I5JgqZUQlK7gESi8xO/gVTgdf7cY7ZjAAA+WBmHngjm05onxwhHoBWC2iItUjUDR0
 kpgONdvFGQyIRO1hlEXY6n9RWtNBjdpwduDkLWoD+daTBFXlmuv09GcEeIJkOG2M6uVS
 CQlIdqEY4xC2BQWC+g5m6khUFDm1Mron6VvVyRtjHBmQcZ+pc/yjXaE+iE9Mp+269Pzf
 oED7DclIh5XVl2lxuqgDLL57uFjnm3ctjuc0RQ/iuzhWpa86x8M8JIdzMQxDV02ottWx
 dakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697453868; x=1698058668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLo6lm8DCOrQa7cpbQxRmZ4AW2SzeQU7OJCzMZY1x2g=;
 b=oHTnb1Ojieb6tiBlbn5k84Yqe4qvNF99E5vsh3CXaVRPfcFwzZk/by5cSxbi12uU9i
 CXoWLpmJueJLrg+1qv1frxRIwMjuxiAA8rW7yqkKowB9/vnOVJXWox0M/Z+nYbzrZZPi
 w82eo7R8XzYc9PWtZpMq1bseZL4VaVtgfqO8ivqudUdTtbWjj8EgD4f6aTZeF6jGeS4I
 F0KaBCuao+MuDuCLMquoRrN5XYXVpSAItd0tDnQb2KLouLCgqt/w4SbjqDOrdLhbygdC
 U3IEOwVPbLgFp28jl8y65GjLTmgKzmKgIF1Wzv2PxXSdi4wR9RffKcjAQihueFNOYOc7
 BTPg==
X-Gm-Message-State: AOJu0YzKF6oHKa4o5mouzrEcCl0b6twlzl0M5DUlZEO1Q+6oipxQZS1Y
 ZjaM0JJE9weqTc19g2wYgQR0l6pXDB0vmNM9HjruD+XSz5reqg==
X-Google-Smtp-Source: AGHT+IHc7UWoEBo9CKelVYa69UU9KXXFr9P5dhwxdsEhcMwW8dLuDYlvP5XHBxrpFdYeirrlCzCr7lCvaT/m0X/J7YM=
X-Received: by 2002:a81:8441:0:b0:5a7:c8fa:c620 with SMTP id
 u62-20020a818441000000b005a7c8fac620mr18397132ywf.0.1697453868093; Mon, 16
 Oct 2023 03:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231011190017.1230898-1-wse@tuxedocomputers.com>
 <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
 <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
In-Reply-To: <ZSmg4tqXiYiX18K/@duo.ucw.cz>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Oct 2023 12:57:36 +0200
Message-ID: <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
To: Pavel Machek <pavel@ucw.cz>
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
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Werner Sembach <wse@tuxedocomputers.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 9:56=E2=80=AFPM Pavel Machek <pavel@ucw.cz> wrote:
>
> So... a bit of rationale. The keyboard does not really fit into the
> LED subsystem; LEDs are expected to be independent ("hdd led") and not
> a matrix of them.

Makes sense.

> We do see various strange displays these days -- they commonly have
> rounded corners and holes in them. I'm not sure how that's currently
> supported, but I believe it is reasonable to view keyboard as a
> display with slightly weird placing of pixels.
>
> Plus, I'd really like to play tetris on one of those :-).
>
> So, would presenting them as auxdisplay be acceptable? Or are there
> better options?

It sounds like a fair use case -- auxdisplay are typically simple
character-based or small graphical displays, e.g. 128x64, that may not
be a "main" / usual screen as typically understood, but the concept is
a bit fuzzy and we are a bit of a catch-all.

And "keyboard backlight display with a pixel/color per-key" does not
sound like a "main" screen, and having some cute effects displayed
there are the kind of thing that one could do in the usual small
graphical ones too. :)

But if somebody prefers to create new categories (or subcategories
within auxdisplay) to hold these, that could be nice too (in the
latter case, I would perhaps suggest reorganizing all of the existing
ones while at it).

Cheers,
Miguel
