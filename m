Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E748C47DC
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 21:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5644210E781;
	Mon, 13 May 2024 19:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q5secG9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B32410E781
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 19:50:28 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dbed0710c74so4069136276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715629827; x=1716234627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/qKZTzYNiFMXq0/lcLabXSWeWsLTd94wbNDqyfK3Dc=;
 b=Q5secG9hR7DhmRMuXEomCpQJYjq11+WVbAl1VCLdE/d4AGb5PD/k1AL4Di7gsCjdEX
 ZK48RMJMy5ZLVpyrfwYs5LhgzpsrEZPNYSNOpshIR4BWDIpZxPvV/vsv3HhJRiqlBEMQ
 hXIxGys60ePE7Nmn5ptHsf3AW3X83i+tiqF1GsZpGuQMhXjpXPVmcQxez61dMNII7i0/
 NghJ/ca24sODzdQNf81W6azf4h6HWKArHovmKWhhbPZ5QDgdZPIY89rS1gyrvL10+/r6
 oiIlWke6KC6NdKs0Rm9q9xy1Z24kfNvhwjE9dRNnQ8D6gpM2E1g0uSthSGVMOafNkFcF
 hqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715629827; x=1716234627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/qKZTzYNiFMXq0/lcLabXSWeWsLTd94wbNDqyfK3Dc=;
 b=iFKNQ6gDgCA+KYuxZu1HKjK81Rznb5KCpDnTEjxLMCo1/luhxvpHtqfO40j8TuvdNx
 YWYR7X0t+Dg0VyaljFbE0qYlg2M8d0Qgnasf/3718+HmpcVx9FS0Z4jk7CYIA/vG8cPJ
 L4o338RfLTmqiEANzcu5LJoWta+mP/Da2J8R4eI/96ro6EPqiEihMzUm7Q3FU8hkpTth
 RhrvBK7KQXvjDheUPTNrSxhdGD/SCKGGAGFgttiaY9ZWK9Wp8Li7EyenyiLQUXz3K+LA
 AaEFtVOhtI14B4+nRt4jJmNYmx4hg1Uf/Bjz88Q8oLwzpBqLTvPik/7j5/rvhEszNs0T
 rcwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8ihpP3oUjoub7ap/HrYLzZjW1mOEevYfQUzoi3gbEI+WrN1POnk8RgCeUqu9LALOL0GLWo3rZeVaK6Q1ihczrmaRzqoMmeLRlHkjlM33f
X-Gm-Message-State: AOJu0YzXC+U3RttffJmTDLgQY/McDDIpc+9heM6cM8Sz9zQXNMmre5ct
 usY/+yx3kaEr8BlmAlt2fm3okxnBqD9HsJu0upVEDYJhn1eWw5wKz8gFCOYW+qjRn+4V7Dom3uZ
 qGoAgq8iVQ7VwiMBAmB7uWnZy/X8X7T4REaz0/Q==
X-Google-Smtp-Source: AGHT+IFnaKh2w4CELPExkFDCenu+egk7lmFps6WDdYu5ZgbYKuFj29ldNzVqJvgWYvBt/PEDOb2Sf4f/bh6t4gh8doM=
X-Received: by 2002:a25:870e:0:b0:de6:1056:c9e7 with SMTP id
 3f1490d57ef6-dee4f2f6b6amr9939798276.8.1715629827278; Mon, 13 May 2024
 12:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
 <20240511021326.288728-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240511021326.288728-3-yangcong5@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 May 2024 21:50:15 +0200
Message-ID: <CACRpkdaAUU0NM63ZYRNVy0gBEKG_5Ey1NVJuNOsohdEOuE0i7g@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] drm/panel: himax-hx83102: Break out as separate
 driver
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@chromium.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
 conor+dt@kernel.org, airlied@gmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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

On Sat, May 11, 2024 at 4:13=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:

> The Starry HX83102 based mipi panel should never have been part of the bo=
e
> tv101wum-n16 driver. Discussion with Doug and Linus in V1 [1], we need a
> separate driver to enable the hx83102 controller.
>
> In hx83102 driver, add DSI commands as macros. So it can add some panels
> with same control model in the future.
>
> In the old boe-tv101wum-nl6 driver inital cmds was invoked at the end of
> prepare() function , and call 0x11 and 0x29 at end of inital. For
> himax-hx83102 driver, we move 0x11 and 0x29 cmds invoked at prepare()
> function.
>
> Note:0x11 is mipi_dsi_dcs_exit_sleep_mode
>      0x29 is mipi_dsi_dcs_set_display_on
>
> [1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=3DzBQJUC4CB2wj4s1h6n6aSAZ=
QvdMV95r3zRUw@mail.gmail.com
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>

With Doug's comments addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
