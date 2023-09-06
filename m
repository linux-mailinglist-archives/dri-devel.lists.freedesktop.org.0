Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF4793956
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 12:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A8810E5BB;
	Wed,  6 Sep 2023 10:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50C910E5BB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 10:04:19 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5922380064bso35098647b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 03:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693994658; x=1694599458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zyzWCEin3x+EhbNaVLFFdZWqxuIQ53ywEYEIxkPUfzw=;
 b=bNi80lW7rVxeffEyWvs7Nq1b7fhybrEVdj7pAjp8RA7/oYJzZX4NkJSV0AN95l6XMR
 5AikcHz0bGKQTHBxDDrcbq7q02zCoCD5LpNppQsjKzdT+w8ztfutQG21z8r5ikCkPGsP
 8oJNKmkctNbAm5W8EoZaXMQyotOSZ9UePsRv2ozh+JcxFzR4Fid6yjMpzc/B1VAGZq6C
 gKd7fQoklEpKbopI/GaPCRyRCmNSGtxwCHnvw+G0+fBysGgxO+yuXgNcok/bvkGesbbr
 UNDDW9tjHNTBySyjqJ5kaSeVF5k+FLv+OP+VGxCfi7O/e474PT6ahruc6itWNsY3jdfi
 +wDw==
X-Gm-Message-State: AOJu0Yy9FFDaQ6HjEW+NAOjHsKunpLE0RaeE5+ev6JB8MeF6ZeJBMmYd
 luYe8a/Vkqh6bzZEKL4j/6oY3efe0E/03Q==
X-Google-Smtp-Source: AGHT+IHgNK4FFeiMm9fQBmh3CXhK6ZLrFdtsYqi6lGOf9FlRdnTn//DlPBSGkhJgX6XYuCJcdd1kfg==
X-Received: by 2002:a0d:c342:0:b0:583:f78c:994e with SMTP id
 f63-20020a0dc342000000b00583f78c994emr16206474ywd.42.1693994658318; 
 Wed, 06 Sep 2023 03:04:18 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 m186-20020a0de3c3000000b005837633d9cbsm3596805ywe.64.2023.09.06.03.04.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 03:04:17 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-d7d15e6884dso2756400276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 03:04:17 -0700 (PDT)
X-Received: by 2002:a25:ab8e:0:b0:d7e:891b:cde7 with SMTP id
 v14-20020a25ab8e000000b00d7e891bcde7mr13785322ybi.2.1693994656878; Wed, 06
 Sep 2023 03:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Sep 2023 12:04:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcLO2jOAzy5+Njm+0AvKFBoyxroehDL4_3HhU4HfPdaA@mail.gmail.com>
Message-ID: <CAMuHMdVcLO2jOAzy5+Njm+0AvKFBoyxroehDL4_3HhU4HfPdaA@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the comment
 in rzg2l_mipi_dsi_start_video()
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Biju Das <biju.das.au@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@denx.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 6, 2023 at 11:44=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add missing space in the comment in rzg2l_mipi_dsi_start_video().
>
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/all/ZPg7STHDn4LbLy7f@duo.ucw.cz/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
