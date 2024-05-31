Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02288D5B8D
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 09:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA9210E33E;
	Fri, 31 May 2024 07:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D2D10E33E;
 Fri, 31 May 2024 07:33:28 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-62a2a6a5ccfso17839717b3.3; 
 Fri, 31 May 2024 00:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717140806; x=1717745606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qj6EusQ3A409SsVzLb4gC8GqQaE/mFAcX8PaYZZXXLw=;
 b=j/g9Xp6JwsX5osBKS0h0bKJUDsmOI1zRnSgb7wFxmZR0UgYdxfsV2muOdjRBe2S3e0
 yYdpZO6r0ZstERMTQ813NNCnAdJ45ID2Ca2CgaLhQxXSXdGjmiv86Ju9aPx7d7ePKdLw
 QBb72DMaVpT6Y5OvDEGkmjn3TIajTWb32k3Cwf+P1WIPUNObeeziqMwIkWjXEKie1Ap6
 gonmdThR0ThcagnCHyhGebF9RVD8Eje0GO/5AzCDBmixh92Adk0JFoUqWbyPMdyRge6v
 2A6TvqbUn869VDNSkDlYQL4djUekyCbnbz55u5Q1+kdkbpDABol8f3mNAaMZCFHMjr86
 LVEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5HC8zVx6FfH/sa0fFt1X5igpgaNFSTumzhdt7vaFLe3tY3QRMoXQ9gPcJ8HLGbHm5zylP7Htfbp6oJDn9zJIVlBQ691l+bzcUUaKLSm9S4I1rVKKI4i4hOeMDLAtP0s8yqCsRWq9V09FBOLie1ktM
X-Gm-Message-State: AOJu0YytS9NOsFmeJInxlgOADdIz+xQ7Bynj7JTm5xKeerv/ib68FSL0
 awydxb5yhkwG62s1UVwjKAPHrY+3gdu/3nbk+SlMxhwOO7eN4lpatC5yp95H
X-Google-Smtp-Source: AGHT+IGTxk0OZCv0sELQU1jUINdo83x6XtsQJgWrrcOLZUwCTFXQlyiqMYmuGfC81h6eDvNg/8oAnQ==
X-Received: by 2002:a81:928a:0:b0:627:a917:76b1 with SMTP id
 00721157ae682-62c798270b4mr9821057b3.44.1717140804352; 
 Fri, 31 May 2024 00:33:24 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-62c765b8c28sm2416777b3.28.2024.05.31.00.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 00:33:24 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-df4f05e5901so1809108276.0; 
 Fri, 31 May 2024 00:33:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWKm2784XY9qm8q4QgwONGZuUp++OSYUI5+B1ngbXJyUU2wasE7aU4lMb5O+CArmAeg4f77HerYWd6hf/kTPorZ1D9UgMjphdxq+IRKi78JfXevchoC5W2k6Mi95pQRX1xPGSw1XnFPzMCtZvrQDDlH
X-Received: by 2002:a25:d047:0:b0:dfa:56a9:8869 with SMTP id
 3f1490d57ef6-dfa73c48294mr1121789276.34.1717140803859; Fri, 31 May 2024
 00:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <87o79faq4a.fsf@meer.lwn.net> <D1N564M136RW.3CRPYTGKMW1NP@gmail.com>
In-Reply-To: <D1N564M136RW.3CRPYTGKMW1NP@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 May 2024 09:33:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
Message-ID: <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
Subject: Re: [PATCH] docs: document python version used for compilation
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

Hi Thierry,

On Thu, May 30, 2024 at 7:07=E2=80=AFPM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
> Alternatively, maybe Kconfig could be taught about build dependencies?

git grep "depends on \$(" -- "*Kconf*"

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
