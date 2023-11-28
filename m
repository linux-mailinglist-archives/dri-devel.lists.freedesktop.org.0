Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888D67FB5ED
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 10:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2ECF10E46E;
	Tue, 28 Nov 2023 09:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEDE10E46D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 09:35:11 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-da077db5145so4753667276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 01:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701164110; x=1701768910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBMv/wA3lNFrWGMX6+56IOyhOxT06+Dvulg5J77uN3Y=;
 b=ZiHyOJS9/m4KHRvtw/VJscDjqLPE5nHoa2GrOZO3j3fmW4CM1c82C7RXCw4k5P2HnB
 OsT9MtD2AB7NMEHfU2nWhvwfB5/txu3WOfljCGEnmRk44DyHZnTDS+fhkyRMwfkq7l07
 +5temBvzysDo8bzQbagBa+XIVez1xkVCU6JvBfgQ+Ovxh/0nzrTgm7j+J/0Z8HEVGdqI
 svfUjNNLdIPpxNGO8AaERP5LZhOmiJ4Zf36axSQZZYwbKNzbcQP5J8CETMMsJi8JHpBt
 xvRYYimjNFXGfFN96KI4B7H/ccXS1IelbbHMS3t4/gBmpSrBVBX2HRygn2bMb0o9JVrJ
 wOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701164111; x=1701768911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rBMv/wA3lNFrWGMX6+56IOyhOxT06+Dvulg5J77uN3Y=;
 b=nEFCjawlztBzlStbr2+yR7dJJHMSQmCv25ZyS4Z5UeqpwvNm35Tq8vCXg4Lk2Q9kK/
 X2vqpBa8HdGafAhG8kTV7LWuJF/nysITnMHEvMjJvHfUbBJwtHmALU/0VbU6M49zTOYw
 abkheAtogVeeZc15ThXTWMw9XKZSOs81svg856oKMNY/6qOLyiaFi/b4dCgD0ojooqsa
 bd/9ZKYQbCNsa4fOCHGYAMVoVu3+LWoDPuDVALBNtOubY5conVj3F7PTuf7wl70GvxVO
 9DijRO74ozZDCyOOAFQxSY0kid0ccBEhF39Mz0LwV6TXJc2I35X/shAxOO+nCAKHTeIz
 9uKQ==
X-Gm-Message-State: AOJu0YzfUiWOpr/oHFcpgibV0s+oJJOX032PG491qhzMVr3lvtouXREk
 Syxk51kwXfJULFNgPXEi0eIchvAgx9Q4gQOuS3IO2g==
X-Google-Smtp-Source: AGHT+IG//mF/Mgu+rXsQ4abhmBG1HAacPL2F14QYFPta7ZOzDia7ZILCE9dR/tAtxG02TGkTbCFAp2UKsb8hRCDJ0d8=
X-Received: by 2002:a05:690c:288f:b0:5cf:4e73:9444 with SMTP id
 ee15-20020a05690c288f00b005cf4e739444mr8498457ywb.42.1701164110732; Tue, 28
 Nov 2023 01:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
 <20231127232542.GB25590@pendragon.ideasonboard.com>
 <CACRpkdYWjHbgWQc46hGM3bg+5nf4NiveEZJmHrnx0X-=XsUDLA@mail.gmail.com>
 <80be087e-0341-487f-b6d9-8772d7c6128a@linaro.org>
In-Reply-To: <80be087e-0341-487f-b6d9-8772d7c6128a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Nov 2023 10:34:58 +0100
Message-ID: <CACRpkdZmowhDhCgnEYokjQC8T0930ZKEr18f5ZsM=ZmD0PDGig@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert panel fixes and original buggy patch
To: neil.armstrong@linaro.org
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
Cc: Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 9:30=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

> You can apply them now, or tell me if you want me to apply them.

Please apply them Neil (to drm-misc-fixes) order 2, 1, 3 for bisectability.

Yours,
Linus Walleij
