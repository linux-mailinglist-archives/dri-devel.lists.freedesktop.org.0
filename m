Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA77D3510
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 13:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A448C10E1AF;
	Mon, 23 Oct 2023 11:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBFD10E1AF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 11:44:59 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-d849df4f1ffso3040837276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 04:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698061498; x=1698666298; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7b2hdSdEiM4o4XM7ucCEd7vEq2WMd68fJSI4N1cSH8=;
 b=flmOYTS/uYzqAnkDvH3+C9y4mGr1yEZWBzMHg+oNFEacnEaEhYGtwF2SQTGGsz8h1d
 TSwcgEM+4KnR5TfOHwwKnpaznseiwda2aBXw/PnB0zlGU/wQZTznbZ3ZqQi3LogIjQ7M
 Wm5KxhIMLbRSsWQ3577iJpuxwv8bZrqgYYYzNuuPTq1lkpyjf8LRrJfMDoox1EfAusbv
 J67yljB2emsfGOS/dOZ4qnm2BLb5+GtRhoVNfyS5jI7gbstb+PUdlua9VJsa+NwT3wEH
 nZIOjeuy4tm4HPnd8lZ1tOl3djND/sw0TP9BoIbtkwUE2SaRRzFnrIbU+wTbnB1JAc4+
 hD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698061498; x=1698666298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7b2hdSdEiM4o4XM7ucCEd7vEq2WMd68fJSI4N1cSH8=;
 b=dfZwbXk4nXw4vAiV2I8huqOQnjU+6aFDLP588HbU7uTZ3IvgJ37sywkOK6Mms2B4hv
 NB9fv9lysBgnLGZdVceMYTpR5m8O3H3T0sYYl9DtVEth8NzrEmEkvfwBVFaENQYThaez
 OZy4NFWh5Gdcq2iJbST7In9wLRuO2OCTF2FbTTSC63RoTFzw2c52Gn577H/d1B2RjlMS
 qb1CN5WqENN1kLOX6q+BuhdkVHo7CgviZfE7btRWPVJ/LKBQngSfgWtxx6fwEPOnLGwR
 I2Dc9roKFH8YnKhx3+jqAiqOIkcvr56CX/VtJXsVuHTsmmPH98f5k1HsXWcUbBXf2TDv
 dl4Q==
X-Gm-Message-State: AOJu0YyoFb5qrFjXjY4oe1we7Zp/DhxxWAhC5H8E2Uc3sNy3JsEVS6hf
 RJ7lGhmFEFM9ZycX6U+ukZ4mhdFanXp02fyccaA=
X-Google-Smtp-Source: AGHT+IEl1Dvvreu0PH8ctorZ6vOxpcr1R02nRfhTfWYX9itZ1OXyNVSNZR6ZVjHTnprtQGvXOyRPq6Kuilsh3emHPDI=
X-Received: by 2002:a25:428e:0:b0:d90:c424:53ee with SMTP id
 p136-20020a25428e000000b00d90c42453eemr9341179yba.9.1698061498418; Mon, 23
 Oct 2023 04:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231011190017.1230898-1-wse@tuxedocomputers.com>
 <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
 <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com>
In-Reply-To: <87sf61bm8t.fsf@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Oct 2023 13:44:46 +0200
Message-ID: <CANiq72kvZcNp2ocXoqBae9q2UW+RPQy3dXUr+QS-izKpM1yyoA@mail.gmail.com>
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
To: Jani Nikula <jani.nikula@linux.intel.com>
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Werner Sembach <wse@tuxedocomputers.com>, Pavel Machek <pavel@ucw.cz>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 23, 2023 at 1:40=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> One could also reasonably make the argument that controlling the
> individual keyboard key backlights should be part of the input
> subsystem. It's not a display per se. (Unless you actually have small
> displays on the keycaps, and I think that's a thing too.)
>
> There's force feedback, there could be light feedback? There's also
> drivers/input/input-leds.c for the keycaps that have leds, like caps
> lock, num lock, etc.
>
> Anyway, just throwing ideas around, no strong opinions, really.

Yeah, sounds quite reasonable too, in fact it may make more sense
there given the LEDs are associated per-key rather than being an
uniform matrix in a rectangle if I understand correctly. If the input
subsystem wants to take it, that would be great.

Cheers,
Miguel
