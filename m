Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555FB52387D
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 18:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FC310FC03;
	Wed, 11 May 2022 16:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56B010FC02
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 16:17:28 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id q130so3257165ljb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 09:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=puEukUMjobRiu6VL4L2nI73nB+b0/MudIIsYaS8fpK8=;
 b=J+dK9tuSgD/x1t0dwVrjJfXL5UaO3A7d5vlUYx478jq3ok51XqRUx9H/VrmwRYye+C
 uBL5/cDIQ7QoeCOds2mtpbN4jjbxPExHy3iDVbpjWLWb+05R2XU0SC8XV9HsHW+tnAbc
 P5gaNF4RRm9nmX0FyZI1/uWZ5vMBWTc1xG9+tiCf3XgK8JfryN6cJGvp2KtHKPZOMCWC
 m9zXabiy1Jz0ke1Et97sVtOFYyploht1/HI8JvRtzDqMSYKFm81ss3+2eJ8FMnNKEGz6
 uercJY6mwV2kCN9EKNg3TXU6ORLncUS44t6TcuNfiruW4OkvtUZuKr5LUFakg0+mGQd0
 YiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=puEukUMjobRiu6VL4L2nI73nB+b0/MudIIsYaS8fpK8=;
 b=MEH0iZgGQ28gF5Xx6EsfoU/djFWVcV4JHXcF1/fT+lrpj3iOUobUF5NyvQqTGu9YDy
 3JMduvIm7agq8aBrp+mtzRkhqkYMDWaXf4CmyVAcyrQkjU3QnpsFEI+DgJYgS5PTMIY0
 QJL1v2/LaOQufqi+ZCXvxj/CKJjJf0RmpFZmnnNbKdj6orXEeDeLR69ETXJ3wurEWykY
 qp8do1jdMVMk6yOtPhPkUUFzKwiFdv6r5YSYRnDH/VO9JaX5Dc6KFdQOZW//ttH63+SV
 eVjHVe8V617EJcxlOxQzJ3kj97vWpJlDLo7z0o7dlRd1PENqopf1P2z0ZkXUm7DwAq4s
 1DeA==
X-Gm-Message-State: AOAM532Y/QuW3YJrLE+pL1KXJ02LO3MjZ9xZnRRT3ksVJ3YXgxgL/QNs
 XaeLSztdNkiVFx5dz8Q2xmI=
X-Google-Smtp-Source: ABdhPJwdsU3w0YALq/Qkp/LIqwDvsMOn4fl+sXvw/dZ3txf5at4nGBDWtKQ44tHcUKawwQUnIFAwQA==
X-Received: by 2002:a2e:9d97:0:b0:250:85c2:1072 with SMTP id
 c23-20020a2e9d97000000b0025085c21072mr17377573ljj.501.1652285846734; 
 Wed, 11 May 2022 09:17:26 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 z26-20020a2eb53a000000b002509c3290efsm409113ljm.105.2022.05.11.09.17.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 May 2022 09:17:26 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAMdYzYpujdqejDz_K2M0aUhPYNFVgTuqnUwkOA6jcxgDdJ+RoA@mail.gmail.com>
Date: Wed, 11 May 2022 18:17:24 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <90DDF759-AF9B-40FD-BACA-AD1E76BF4C8E@gmail.com>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
 <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
 <0E6FE020-C95E-47CF-A9D6-AC3F2B2D334F@gmail.com>
 <CAMdYzYobfJ7WGN+UQ7t5e1Zy9knjfHLse8KzrGrHPfeMkkG0gw@mail.gmail.com>
 <9F2D8CFF-1EAE-4586-9EE9-82A9D67840BB@gmail.com>
 <CAMdYzYrz7DRj7F9hGaAPaTSiZkQ4eMNujAp8uPuE9geL6kAz4g@mail.gmail.com>
 <812AC0DB-A6D0-4DA3-BCDC-7743E8F61821@gmail.com>
 <CAMdYzYozewYUbM=Q+iJ2wdM5TrB6dGrjS6zh0qmVgWD4XPVR+Q@mail.gmail.com>
 <ABC61229-B851-4BB7-8B55-688F8A8D841A@gmail.com>
 <CAMdYzYrsaNED+oMj+z2b4fK7pt32Qg=nXDk3SA0KFDDCJ2XY0g@mail.gmail.com>
 <F1728C93-CFF8-4C51-B95C-A5049E0DC46A@gmail.com>
 <CAMdYzYpRVZ2hrGiYeQLqSduOZyKuZenw9bViS7oW7d3MWN7Z8g@mail.gmail.com>
 <CAMdYzYpujdqejDz_K2M0aUhPYNFVgTuqnUwkOA6jcxgDdJ+RoA@mail.gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 11.05.2022, o godz. 00:49:
>=20
> I've pulled your dts and with a few fixes got a working system from
> it. At least on the v1.1 board cec is functional:
> Total for dwhdmi-rockchip device /dev/cec0: 1, Succeeded: 1, Failed:
> 0, Warnings: 0

Peter,

Thx for this.
This is good news.

I see 4 potential root causes why it not works for me:
not mutual-exclusive:
1\my DTS has errors needed fix
2\my kernel config needs tweaking for cec on rk3568
3\my rock3 v1.31 hw needs some extra dt love (over yours v1.1) to get =
cec working
4\my bootloader passes hw to kernel in state that cec is non-functional=20=

 =20
May you pls send me via PM to piotr.oniszczuk@gmail.com yours kernel =
config & working for you dts?
If i fail with 1/2/3 then i'll need go with yours booloader...

lets try see is 1/2/3 with your dt and .config please?


