Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC7A2D891
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 21:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B551D10E12B;
	Sat,  8 Feb 2025 20:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="M2mHI7xt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610E910E12B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 20:25:33 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso3239055e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 12:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739046327; x=1739651127;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cAwQ6v6YdN6RFTuWQVOHau4xzP3b5faxbAOmvcpMZPE=;
 b=M2mHI7xtcNFSpfbSPNN3cCfSdEeXiYBkD/dW/EgAYnYF/DMPcl1+ENyozyF6l/u6mA
 JGX5rUO9cNGtjv5UZB6MdWD8JTSOPC3crUlM+zgN9JFmq43F9WHysCwDKQ+YDE9kfgn3
 ewc0SR22pf4f0JCgnggS8/pLDwuOCnd7ewxqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739046327; x=1739651127;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cAwQ6v6YdN6RFTuWQVOHau4xzP3b5faxbAOmvcpMZPE=;
 b=vdoHUfnRtthsH1ztdWADZjmO+118rJwWW56q5UXQmP/cnSXjQcKzXs/6og6kJ631ce
 CgtSSaxwb4cFPH3ovZ2nTdjw1AOBulIuYec/OdWaHuh4UdMU2dzycA5lAmjhxcDqAfRk
 oQDTzJ72/6guOyQKRyGdOx6A7VWY2deV66WypN8w3wsTkBlN05zR+lpOdxDYEh7ABUPy
 IBpnQ9KzTIuo4Tg1XvFEdxDeaI2DUpNyf27TLtDHNL1R+MbnS7vJxpuZOPaOdZhUQGkO
 le1qaYh/d6yNvOaWzfonj6LX1tOaNslgKwl642oyyOdq3nDn2Elldk21UuEY5vIXWaW/
 eBbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw58PHnFj6QBPRHBPOFVm8oF1wydrNyYSDATzy8FoUYXJNzH4YZuhcXxWZaLr21hkIXZNjPes1Bus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhYCqSrAEy5dAYAGbtWvRRenJYJTpHPb4QLgtInFFS3A5fquyX
 bnCNfhfEAiE8aggv1CT5zz/WFHp+hh5LQtHTkQM6uDGxZrevRBH8rpWiCt7Pq83kUNy9NweY/s4
 DSmiw
X-Gm-Gg: ASbGncuXTC9rVUFPalTmCcv7nTTTBw11xOdPs3pwGTc70RxI0JG22ud29pzbk5UrLbi
 9N4Yja3LAME0wBKIQ46zesnv84yiv6tjTXn1OuwTFe6trll9SMZNCRFktrdiueMj9tRc6OJZaPi
 NCj9+4RBwkegZAl0+fJk8LSsaYAo8mMemEviT1hqnZCNOM7RJnsjMjLMvHarxLg3SEcOdgjHF3Y
 Zh/Rz81ap0yLzabmhMmcUaQ89GgIgfnbgSn6qd1V6UnDgN5IfKlA1MUPpOmqaPuaYfGfDlOceLW
 gAY816z+L6w2vFp5fXCPItX7SXBgbPcY2eyi2HQAPeUW95somghiDKA=
X-Google-Smtp-Source: AGHT+IEkyrnOPcidRKck9M0O6YhEeLEzGFSCt0CkuI4Kz78cVg0I+llBZR7x3m4Lst+zXTBvLBT0Vg==
X-Received: by 2002:a05:6512:159b:b0:540:2d64:4ef4 with SMTP id
 2adb3069b0e04-54414a60c39mr2949680e87.0.1739046327444; 
 Sat, 08 Feb 2025 12:25:27 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54412885e19sm740333e87.152.2025.02.08.12.25.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2025 12:25:22 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso3238976e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 12:25:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW6nQzx9qsuhYzMaXzdz9cU9piXdzrEoG3xuXlxSdpIErLofnNRi4ytEjC1Kw2cPpIYy5D2z+Y46i4=@lists.freedesktop.org
X-Received: by 2002:a05:6512:2254:b0:545:5de:f46e with SMTP id
 2adb3069b0e04-54505def563mr665702e87.39.1739046321893; Sat, 08 Feb 2025
 12:25:21 -0800 (PST)
MIME-Version: 1.0
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-4-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250208105326.3850358-4-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 8 Feb 2025 12:25:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UNaOrZVnhmj3cNfJoSj9fc2g5p8w+cfk6XwV1Bcz+a8A@mail.gmail.com>
X-Gm-Features: AWEUYZn-n6llQrHDzAHqyqfKx1wNx3VrYtKrPGjCS9vT4XhM_5671aX3dZRAK0g
Message-ID: <CAD=FV=UNaOrZVnhmj3cNfJoSj9fc2g5p8w+cfk6XwV1Bcz+a8A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm/panel: panel-himax-hx83102: support for
 starry-2082109qfh040022-50e MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
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

On Sat, Feb 8, 2025 at 2:53=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> The starry-2082109qfh040022-50e is a 10.95" TFT panel. The MIPI controlle=
r
> on this panel is the same as the other panels here, so add this panel to
> this driver.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 142 ++++++++++++++++++++
>  1 file changed, 142 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
