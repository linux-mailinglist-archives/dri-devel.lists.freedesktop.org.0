Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF1E9068CD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BED110E9D9;
	Thu, 13 Jun 2024 09:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B530510E9D7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:32:59 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-627efad69b4so7911237b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718271177; x=1718875977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lhk7FkMhRX3Hop+f1KznOVEB0LMy596r2N2+WQDXxi0=;
 b=dm8qLlu1G/vls278iX7pQhBRE3p4eMx0Mgnkcqc3Qu7u9Fj0JIG8nmmNZps3h6KvXH
 YVQyaHLZ/mPBUtsS886JltsTzUVNVQ8RYhVonGJTHdCI233JGosC4R+TiMj+9W3HAXXd
 e4iGE+J8JznM2bK1r2v4IAvcBctCAv4TIhqbU3eSw0b3wanYCi652qRgN3Eu2QZz901y
 TT2vYwHZ8gb2kGb+0afc7MKlZSr/T6Gvq4JLo+UCfEVlc2mOsFqY4AegTLOkzZ530k4z
 HOQKigPGHsacRgYUdQiXnp/9JBOIcB+rr4G4SLnyz4zhsTD6HC8FbXK2qabyDperefhX
 swAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7GxGbGwDQmUVbRipff2/v98Hea2dU1jL2Mv8Q4TO8h/MlUI8kISZOoUDIf5e1F8xirPcptGQGvFJotXXjmqAVO/vMJuTyOYQXezF/fBxX
X-Gm-Message-State: AOJu0Yz95cMhtKU7mcLYrQzSJkR/WVFEihpAcuisFl3UvFHBCfNS/oTn
 hKf0lUrjVL+QoWccXqInvfa7D/lf5fCcmhZWFjipAYtmMDkyVQXb88QFwIPG
X-Google-Smtp-Source: AGHT+IEAvaRpf0PpHr0Yu5QxQB63gt73Wl3DK/FRuYmPlkkfJVcT1Gi7tatVTpHyw2evqOmzDwqB/A==
X-Received: by 2002:a0d:ea91:0:b0:62a:530:472f with SMTP id
 00721157ae682-62fb9db1f0amr41432957b3.32.1718271177461; 
 Thu, 13 Jun 2024 02:32:57 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-631189a9c81sm1237867b3.46.2024.06.13.02.32.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 02:32:56 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-627efad69b4so7910727b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:32:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVFovTf47tFpZJKOw20Y8Piea2DEHCGcwMLF92+uviooqjRrEPSC/UOMXNugdJGHLY/HRMy59KokgnmJEO5dXljj4PE8q0gsy1JYWQ9/5E+
X-Received: by 2002:a81:89c2:0:b0:62f:74d5:5e64 with SMTP id
 00721157ae682-62fb8575257mr38097387b3.22.1718271175624; Thu, 13 Jun 2024
 02:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718199918.git.geert+renesas@glider.be>
 <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
In-Reply-To: <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jun 2024 11:32:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
Message-ID: <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

Hi Jocelyn,

On Thu, Jun 13, 2024 at 10:38=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
> On 12/06/2024 15:54, Geert Uytterhoeven wrote:
> > If drm/panic is enabled, a user-friendly message is shown on screen whe=
n
> > a kernel panic occurs, together with an ASCII art penguin logo.
> > Of course we can do better ;-)
> > Hence this patch series extends drm/panic to draw the monochrome
> > graphical boot logo, when available, preceded by the customary fix.
>
> Thanks for your patch.
>
> I've tested it, and it works great.

Thank you!

> You need to rebase your series on top of drm-misc-next, because it
> conflicts with a series I pushed last week:
> https://patchwork.freedesktop.org/series/134286/

I had seen that you said you had pushed this to drm-misc-next[1]
before I posted my series, but couldn't find the actual commits in
drm-misc/for-linux-next, which is still at commit dfc1209ed5a3861c
("arm/komeda: Remove all CONFIG_DEBUG_FS conditional compilations",
so I assumed you just forgot to push?
However, the latest pull request[2] does include them, while linux-next
does not.

Has the drm-misc git repo moved?

Thanks!

[1] https://lore.kernel.org/all/3649ff15-df2b-49ba-920f-c418355d79b5@redhat=
.com/
[2] "[PULL] drm-misc-next"
    https://lore.kernel.org/all/20240613-cicada-of-infinite-unity-0955ca@ho=
uat/

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
