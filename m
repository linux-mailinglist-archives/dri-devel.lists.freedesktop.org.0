Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC28495BDB2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C7210EBB6;
	Thu, 22 Aug 2024 17:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QXC11LmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D0110EBB6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 17:48:08 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7a1dea79e1aso67341185a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 10:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724348887; x=1724953687;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C6QLFS/223EGiUxs5tjmNPrl8Nvfi/fSGuus5YjHYKc=;
 b=QXC11LmSCZIH4WL31rRDTDnalr06xBuVxqrpe08NW4Nn3uGPom4E8atCzglpFw5EA0
 IiXt+P6IaxC3AQlKzvATxpFgQvCsDl9/vEmO+OuCTchwr7si4n+eRLELqY7I9W1yWJOd
 ux31H7IUhI0tf1bXLWi8ama/7kSYKeT0W+al2/Is5bp+rCqi5fLnPbFoh5oS7z5TPXry
 EStpKLy4V8JGSrkKhu0VbpELuxuwWPeGtRLD75U4fF8hi3NMmU9I7AKy3F7BRm+czhs4
 ThoJ3Ukfs7xxRWpeWID8NmdDOaehULtQd0tVGzHAl/E7IqAn6py49drWNfutG6H9NG1d
 UjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724348887; x=1724953687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C6QLFS/223EGiUxs5tjmNPrl8Nvfi/fSGuus5YjHYKc=;
 b=oQ6edQzVcnl6TvIb7U0s1IdjvoTOoQSTJJ3oL01x/tzFCKTtF7aZskGvpAAWgJSwXo
 dyYQ/E9yV6g75p81PrO6ETFY0NANYTQ8w8LadypD9bFiFydDxiRXV9rJVZQVeNbVSAgJ
 7KU3aSk5jS07MgJp/oJdWX5KqnCVmytoYfhuIf4+RY8QECl50SjY/Mw0WD4XTcm+PEdD
 JKX0Pwq63rQxq2ynXmtMWqv1N2NYwdcZdHBjyKMFAYc8ehxFOegbUUw8xg5HJ3In3Svp
 9aH9B+XNcb3qF131c8oNeTtn3F+hBSy9DBU/s4ICsKWyLKVylU3hBJdk9H9x6o2uzUSE
 WZvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsKneivrHKTb/ZtuCJhnWcfqiNIYpKJLEzv0d2C0rP1TnlPtLKfeuUgbojDEohm/sOdtpbGpcYaC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+H6AUFfbqujMeQt8Ziw2PoDq6tuqGIyFwu1jjYOhs/M36uj0Q
 ndz5Peew+7GfcbCT+PQNvkFL6YWtipwBVg7gePreFMlkiI90Aq1iu2datsNQQNa/3HYYGh6Kdjg
 LinFqqWXuyPwZaExS/3Aa8JAOzBinDXVmYtUZ
X-Google-Smtp-Source: AGHT+IFGwUrobsK5fHxOpalWNdc1NoJwlmN9E5WaHLuT0VfpNOVU/eY0hrZCRXlucXyDgVbOqJoLAPunNzn8LMHOYzE=
X-Received: by 2002:a05:6214:5c02:b0:6b7:abe7:5665 with SMTP id
 6a1803df08f44-6c1567d96c5mr64521926d6.22.1724348887318; Thu, 22 Aug 2024
 10:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240722073136.8123-1-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240722073136.8123-1-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 22 Aug 2024 10:47:53 -0700
Message-ID: <CAD=FV=V8ivgWn5krEYzt5C4aiHMMK07mtMVwJaCeSQHG6ZscSg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add Add elan-ekth6a12nay on the basis of
 elan-ekth6915
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>, jikos@kernel.org,
 bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linus.walleij@linaro.org, hsinyi@google.com, 
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

Jiri / Ben,

On Mon, Jul 22, 2024 at 12:31=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> Elan-ekth6a12nay requires reset to pull down time greater than 10ms,
> so the configuration post_power_delay_ms is 10, and the chipset
> initial time is required to be greater than 300ms, so the
> post_gpio_reset_on_delay_ms is set to 300.
>
> The Elan-ekth6a12nay touch screen chip same as Elan-eKTH6915 controller
> has a reset gpio. The difference is that they have different
> post_power_delay_ms.
>
> Changes between V4 and V3:
> - PATCH 1/2: Combine the 2 const into an enum.
> - PATCH 2/2: No changes.
> - Link to v3: https://lore.kernel.org/all/20240716082851.18173-1-lvzhaoxi=
ong@huaqin.corp-partner.google.com/
>
> Changes between V3 and V2:
> - PATCH 1/2: "ekth6915" isn't a fallback, modify it.
> - PATCH 2/2: No changes.
> - Link to v2: https://lore.kernel.org/all/20240715073159.25064-1-lvzhaoxi=
ong@huaqin.corp-partner.google.com/
>
> Changes between V2 and V1:
> - PATCH 1/2: Respin the series on top of v6.10.
> - PATCH 2/2: No changes.
> - Link to v1: https://lore.kernel.org/all/20240704085555.11204-1-lvzhaoxi=
ong@huaqin.corp-partner.google.com/
>
> Zhaoxiong Lv (2):
>   dt-bindings: HID: i2c-hid: elan: Introduce Elan ekth6a12nay
>   HID: i2c-hid: elan: Add elan-ekth6a12nay timing
>
>  .../devicetree/bindings/input/elan,ekth6915.yaml          | 4 +++-
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c                     | 8 ++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)

I think this series is ready for you to merge at your leisure. If
there's anything blocking it then please yell. Thanks! :-)

-Doug
