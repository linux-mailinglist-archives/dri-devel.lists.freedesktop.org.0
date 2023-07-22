Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D302D75D880
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 03:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CD010E0B0;
	Sat, 22 Jul 2023 01:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114D510E0B0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 01:01:30 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-57045429f76so28503177b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 18:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689987689; x=1690592489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HgAKBTCLGko3WFZbluw/Ne8ucJz0BHQta3RW0S2hIRk=;
 b=LJQH6PoUH2lr8N6JBNj1lPRiAbArnv1CI14uzPKWm4ggEgemPpsC6f03HGJf0lAtKP
 scIRDJ1WOnSZuQCoAwbBGc0yYYx50JdWx6HyFaBwE6TYJ5P3bVreBqyMSsKlFG5/GvxZ
 ZQNaxuQdlNpcdT/65HJ/GiEYYfpSbVXAizKOb/JRv3FUl4KRKwvNMI0g2xuBG+tYqyiO
 OKSTfCdoTt8tnxABz6Wtrn3+uiHyHV0WEtTELlFk3AiJlii92eBTvBT5kIL/ORQ3Sf9g
 SmDHfqquHPED4OOgo+JBboYubJwdEpJAxyyFToDNx2W1uKddK7YUgXkerflXco2H8QQu
 oAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689987689; x=1690592489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HgAKBTCLGko3WFZbluw/Ne8ucJz0BHQta3RW0S2hIRk=;
 b=JxkNoJ+gxLTH+CljTvzfBBeWCzXy5almuLa7aZwRrAMBDKYZq3CIfBzV8+WgMHgTjX
 Y+xHHniI0tENs/LHQOM0OUZ6dRhY5wB+uYxcDaOvvseG4Q+ndZCcm1oTWr02MZPxYdmE
 n8xDGzKQUOw/t/m+FYhyfbaCgX45H8ABQlFvdVM/Ojb8eHW2JKYyPg62vx6SefKy1yZ9
 o5TFIqn8X8tQx2CdNkiMyrlcN8StR4sGSlc1Jeqpe9odun8/RusBeapG40IY1rCsBdJr
 m8ybNFkRhND9CU8rm33+Nc5dPLJeMz9U9PteEnw3hHiyI5WIJKN7E9Dm6KtsYngHCUlv
 YtXw==
X-Gm-Message-State: ABy/qLbPDymCLtyjIOXemrBl4y9Q5qQjXGQhVgMqnhX3apLz0p7T0IA2
 pHHSQj50y/VCxndw33Y8kp0Y0y9s3NCHDt/G3jw=
X-Google-Smtp-Source: APBJJlF0//QiQWtD+L/zdxm4m2v5yewUmFENZfqZXoW8TfgOJ3R2IFQidV6q5TbqWU9Fe4aXsfKC/kf56gdIg4lT7tQ=
X-Received: by 2002:a81:6a45:0:b0:583:a418:c3fc with SMTP id
 f66-20020a816a45000000b00583a418c3fcmr1764965ywc.23.1689987689139; Fri, 21
 Jul 2023 18:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230719081544.741051-1-javierm@redhat.com>
 <20230719081544.741051-2-javierm@redhat.com>
 <87sf9gublz.fsf@minerva.mail-host-address-is-not-set>
 <CANiq72=A3PLGGPGnwL=gjX7LFsQL9N8W__ojxmVpj2uCAKvhQA@mail.gmail.com>
 <87mszou7kz.fsf@minerva.mail-host-address-is-not-set>
 <CANiq72=RBUdFdt8=k-AACxXWrbnqfiaiViNUNxvwzGNCDkjwQA@mail.gmail.com>
 <87jzusu5uz.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87jzusu5uz.fsf@minerva.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Jul 2023 03:01:17 +0200
Message-ID: <CANiq72=UZun8=ibyKd7dJoxSZGaohg8-YEqxGb1RzXfELCV9AQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] video: Add auxiliary display drivers to Graphics
 support menu
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Nipun Gupta <nipun.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 22, 2023 at 2:50=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Got it. Then that's yet another argument for adding the auxdisplay
> drivers under the same "Graphics support" menu.

Just in case it matters for Helge/you: these may also register an
input device, e.g. the ht16k33 has a matrix keypad.

Cheers,
Miguel
