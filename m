Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F8775D865
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 02:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDFF10E08B;
	Sat, 22 Jul 2023 00:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E5410E08B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 00:44:07 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-c84fd44593aso2410709276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 17:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689986647; x=1690591447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/YDucU2AULnNX/enS6tagh/a4vMGcAQyh4Z1e1ZemfI=;
 b=Vw0Mfa/cLMFs3BGzu8CsG5s/o2Psjecc6sUnoHVQEPgVviEW3wjDggeK7ViV4WQkeq
 /U66wCqYMfASqWxudA3f0w7XGlhrFsptwleIZYo/tiZj6N59BH9bDlRuCsjiQkw5qen5
 1dtQUa+E305zZVNorIO+2tmKc4cbbrxLHCmO2OpAmj7UsgrRPLP9u9an+vJOevT+kpGV
 cw7LXamFV7qJJt/M97c5OIEfvWLPwAw2x/0SjlyTKXxpVy59w/uEy9tIpQTR6349lvfm
 hxDa6j7ijHlHDJ9Kl/bk0AEutQ7zevpaVcXVwBd7F+KppcPaIOhGEzpQq5SERsgeIzPd
 RgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689986647; x=1690591447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/YDucU2AULnNX/enS6tagh/a4vMGcAQyh4Z1e1ZemfI=;
 b=QTUbMF20p5h+hUDDUdaxUxlulv6rHPkAAZ1E4dncqgZEqj69WnoVCpBcLMrtnlTczj
 gX6cAg6IdJx2iGGQtKnK75Mob9mQz4l4LMS8PBQmk2KW8MNK3/5btHfm+q4cMEW4S11R
 eEnFvaxQp6T3WtvNeRyP8G0G/d2VFLtL4PQc9MtI6+0rDKcyjuLG7x04UAQG2nm9eR8L
 csmvvwez3Tatz3QqJDWyVyTnMbA4/Idow+J5QRG69zpBqDQ9fM6DeU7h287Rvy6F3M0K
 fcJwlzCcTtYxO+gC/4hSUcY1r3/R1xFCB554kQ/zDwBbW64QsAUnKHO6Vilhlit9h3wC
 vNvw==
X-Gm-Message-State: ABy/qLYn4VR5aTm/Vj/X5njTaI/85AnbMiqYPNWVkHFPWUWz3fzlaF7F
 7184afJRwoe0lvKm2SXr2YOnbuOVHeroNjPOpZM=
X-Google-Smtp-Source: APBJJlGba0Oud4IpjcIQD0oP9QfXeafjv/79QHVBp7RKjRPESfCDIB6COTSHFOAe5OPJw+B+tUjTlrKgxJ39uqTEmac=
X-Received: by 2002:a25:d804:0:b0:d01:6e22:9291 with SMTP id
 p4-20020a25d804000000b00d016e229291mr2948454ybg.34.1689986647060; Fri, 21 Jul
 2023 17:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230719081544.741051-1-javierm@redhat.com>
 <20230719081544.741051-2-javierm@redhat.com>
 <87sf9gublz.fsf@minerva.mail-host-address-is-not-set>
 <CANiq72=A3PLGGPGnwL=gjX7LFsQL9N8W__ojxmVpj2uCAKvhQA@mail.gmail.com>
 <87mszou7kz.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87mszou7kz.fsf@minerva.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Jul 2023 02:43:55 +0200
Message-ID: <CANiq72=RBUdFdt8=k-AACxXWrbnqfiaiViNUNxvwzGNCDkjwQA@mail.gmail.com>
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

On Sat, Jul 22, 2023 at 2:13=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Oh, interesting. I wonder why that couldn't had been a fbdev driver then
> using FB_VISUAL_MONO01? I'll reword then the commit message before apply
> to the following instead:

It is :)

    .type =3D FB_TYPE_PACKED_PIXELS,
    .visual =3D FB_VISUAL_MONO10,

The original distinction was more about having a place where to put
small, simple displays that were not your usual "screen", where you
would typically draw a custom UI, probably controlled with a few
custom buttons, etc.

> Perfect, thanks!

My pleasure!

Cheers,
Miguel
