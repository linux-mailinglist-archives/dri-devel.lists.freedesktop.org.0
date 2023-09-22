Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F90D7AAA62
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 09:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2C310E626;
	Fri, 22 Sep 2023 07:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F215310E626
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 07:36:37 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-502e7d66c1eso3012727e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 00:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695368193; x=1695972993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQ5IUNNW5XM0w46Ddjoo+5lCOw4ZdTJm+91GIKNdxYo=;
 b=T/JV4/i0E9nT53i+ucP9F70quFVojLRnN2pqawXv5HMs9soNkBc3R0dGvVXjRhIUXf
 oqAQbThe03VYQv1oSlgM8YBTHW2GwTx1uWHeE9rBVW4IcU/UqSdpuQTxhX7g/h6YddIs
 cwaxQ3GCqFowNwtxZApSxbFk/hww/RIa4Mji9XQEN2bUN3YWt4QdxWxcFBMrmjxA0ii5
 oWNQaJHqpp0Nc5PkDPGJkvrz1JYdYUvMJth6uK15cQhRNqpMLbWlEKIHN5lieAbSJuMX
 vyjjuwyVoKRrl8XeA32pu7A0D5SFZVjK5ioRMDXiIVbnyoV0t03Oe/Y0EkOAtkigWf/V
 SpXg==
X-Gm-Message-State: AOJu0Yxr7qgIuAhW590RmqvrtCujX1rwYbNXVBajJ39x9vcmzZYBAl2g
 1d6SET7LE7kWLB8zpOQiKWC4qc7ViwTKQZhw
X-Google-Smtp-Source: AGHT+IG5yas2f/68E8pRhyvk37aHoV68N9O7VHOOPOEth2KymwaVKcyLAOMflYXveA9zBrUngsPqdw==
X-Received: by 2002:a19:3813:0:b0:4ff:7046:984a with SMTP id
 f19-20020a193813000000b004ff7046984amr6014384lfa.7.1695368192942; 
 Fri, 22 Sep 2023 00:36:32 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 w17-20020ac254b1000000b004fe8593b67fsm625397lfk.107.2023.09.22.00.36.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 00:36:32 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2bff776fe0bso30668771fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 00:36:31 -0700 (PDT)
X-Received: by 2002:a2e:7808:0:b0:2bc:b6a3:5a9 with SMTP id
 t8-20020a2e7808000000b002bcb6a305a9mr6713573ljc.37.1695368191602; Fri, 22 Sep
 2023 00:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230921132823.5723-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230921132823.5723-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Sep 2023 09:36:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwnGNL-Jr+c=7z0cPiddF05MgFSKFVHSdVvjT_aKkKNA@mail.gmail.com>
Message-ID: <CAMuHMdWwnGNL-Jr+c=7z0cPiddF05MgFSKFVHSdVvjT_aKkKNA@mail.gmail.com>
Subject: Re: [PATCH v2] drm: renesas: rcar-du: use proper naming for R-Car
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 22, 2023 at 2:58=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Not RCAR, but R-Car.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>
> Changes since v1:
> * rebased to 6.6-rc2
> * added tag from Kieran (Thanks!)

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
