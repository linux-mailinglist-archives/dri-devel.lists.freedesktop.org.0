Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E527931695
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 16:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A37D10E3CA;
	Mon, 15 Jul 2024 14:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kNdpzdZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53C410E3CA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 14:22:46 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-447df43324fso507571cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721053366; x=1721658166;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=akLoDmbDPs+NEvbjDftdXeJMTJGD6oHfGcOTzt9l9co=;
 b=kNdpzdZQSI6NRZQqXv5CU76U64eO9tfcU3amOVWFk4ef9vd6+KIm1L4kuk4CM+HpoU
 v/lVYI04qEF0zlWNKNJi3j90GPceqgIZegNJR9CrES4Br+1zuM8j7xVU4XoPBPnGuVJi
 /fUYWqHCRMhap9KZtRzOC+jrgH5i0uHnyDTXJ9JbdmYWpRyPjGl+kowraNwCNCr3Rkve
 FV5BDlrM1fycEmnPWGE0hc193WGNkNJo/+hGrrer9c/WykJzwLaY+pyPAvRuqIps1t0k
 wtlqLqKgXqJqDcFV1c/6yFr/0ZJx81D+cWeZ78bob93wP/bc1OTiNrIHoQXfjcdOSysv
 wPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721053366; x=1721658166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=akLoDmbDPs+NEvbjDftdXeJMTJGD6oHfGcOTzt9l9co=;
 b=HGhrpE0S7waVnO3GnvKWmuTGlTQQwgykTifYc6+ztf7YyxIdkNV+132yjLgVQBATVh
 2PZxOPk5suUexYKs7P4o0XOPQQCBtFMxiRdJvJ9lUy6zYlA9mFt0AOnHNzIHGBeP/0IL
 BTzZRj0jGQTnDS0hifWLwv4/6WOWFvi9h//IVRFeQgeBKzlZHgEgmh+UFczle+GjJNNe
 /f9MGWW1226rk/cmriNvPAjOEAOWJCIgmhWik3b/IBoaeMOxqK8sLQxtfNa8nSFMrZQm
 Vc4nMmHL3ybbBoN9CNpCfrnB9Z9C2OqvkImYinMeGcqjxc2jk8XaiErtq7rfit2Txg3o
 7Lmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl0Qto8mqtHEnCJrL56O9Owi00JeICkHK2JcGjO9hUWb5Aa7e3INfl9p2csk9v7DfWxYoyXnvd/umNXuqHNYPNd/BSmCh61vKqjA3wtc16
X-Gm-Message-State: AOJu0Yy4ydZSqfaeYQxuDbERKJ5v0DD/1UikDF5pMg2J/1xEyaoKuKBf
 KFrx9Hi0LLdDyqxXI2AMM0br8rlwfEsWJZkf83LGC4kwWCBudSrn37MxjmbtmFNqE4Fv5bQr7E1
 xNhwwGVr9s56PNpAcJH5wXG7sBc7oIaZ6jI6Q
X-Google-Smtp-Source: AGHT+IHgg91W4475NpHdXcKHyv1HYgpe1WM8KIiuzYplyzBGaDbvdiQnNL6KYb2XilWjHQWvHuedrSmfj2F8s8OAIiE=
X-Received: by 2002:a05:622a:544a:b0:447:dbac:facd with SMTP id
 d75a77b69052e-44f5a31ec96mr5088861cf.24.1721053365546; Mon, 15 Jul 2024
 07:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240715073159.25064-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240715073159.25064-2-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240715073159.25064-2-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 15 Jul 2024 07:22:30 -0700
Message-ID: <CAD=FV=VHDksKiZXrauiipa3HjtK4sE5+dbmXmVfhFoM-RKQP6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 ekth6a12nay
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, linus.walleij@linaro.org, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Mon, Jul 15, 2024 at 12:32=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> The Elan ekth6a12nay touch screen chip same as Elan eKTH6915 controller
> has a reset gpio. The difference is that they have different
> post_power_delay_ms.
>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

FWIW things have changed enough between V1 and V2 that you probably
should have removed Conor's "Acked-by" tag here and waited for him to
re-add it.

I'd also note that when posting a patch your Signed-off-by should
always be at the bottom of any collected tags. For reference [1].

[1] https://lore.kernel.org/tools/20221031165842.vxr4kp6h7qnkc53l@meerkat.l=
ocal/

That being said, the new binding seems OK to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
