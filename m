Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D358374D4FB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 14:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CA010E144;
	Mon, 10 Jul 2023 12:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3FF10E144
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 12:11:28 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-57764a6bf8cso55285537b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 05:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688991087; x=1691583087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=72Wm2+Haf42PppkDwX2AiSMrYpGiUC/lF3qyDG6asRc=;
 b=c2qGo7Ey3zmra41lGonm/L+eDa9/QORi4gNwB7Q8QkF8g8sxejnoZbfmfm+AdsDxG6
 ltBpwee2rxxxrEe3BCtU1elWrSS5ySTeVhpk7+sgcmaLlS3di1A9g3FQrtS1VFppMNap
 hT35UjzG/z8ltSqh+mu514+DzQF7xdZUdIrpcpcO67hppLwoiJ2TT5Y6NCIfySW9PzC0
 AqmWl85E8CgkR0nfYWXnNgpZhFUhYKteOfSk6/9PlkUEMroq0O0Mt3xtOaO2R1Ri8s2B
 yT4X7Eu179hwkCvS/5z3N3aFgDkebvp4HFXSbZ5j50RaWzXwSGC6fiDgT/WIYaSehthm
 3jNg==
X-Gm-Message-State: ABy/qLZ2TjSnSYpdED6Z9Q6bhCavPfphlA5PuwsQPzREqWPb093zp0dk
 fceECBvEtw7CtmS59vYMaMyfdXwZJIHzdQ==
X-Google-Smtp-Source: APBJJlH0QDYJj7r33MzBj/l2+2Uqb2RoFAna8AjFT/r2SNfB/06scm2h5Tqm00vknaRCvPM0oDbBYA==
X-Received: by 2002:a0d:e403:0:b0:573:2ea0:da73 with SMTP id
 n3-20020a0de403000000b005732ea0da73mr13001423ywe.28.1688991087190; 
 Mon, 10 Jul 2023 05:11:27 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 t128-20020a814686000000b0057a68b6c2f4sm1944784ywa.133.2023.07.10.05.11.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 05:11:26 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-c5ce57836b8so5184864276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 05:11:26 -0700 (PDT)
X-Received: by 2002:a25:810f:0:b0:c62:9634:d39 with SMTP id
 o15-20020a25810f000000b00c6296340d39mr11075620ybk.52.1688991086188; Mon, 10
 Jul 2023 05:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230710032355.72914-1-frank.li@vivo.com>
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jul 2023 14:11:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=HzoBKhq3raBrE2B8XxsnJCvBKt6hEP-X7ExuuD-LUw@mail.gmail.com>
Message-ID: <CAMuHMdU=HzoBKhq3raBrE2B8XxsnJCvBKt6hEP-X7ExuuD-LUw@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] drm/renesas: Convert to
 devm_platform_ioremap_resource()
To: Yangtao Li <frank.li@vivo.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 5:25=E2=80=AFAM Yangtao Li <frank.li@vivo.com> wrot=
e:
> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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
