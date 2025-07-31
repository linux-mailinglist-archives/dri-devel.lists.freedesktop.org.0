Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BD8B17764
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 22:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5089910E7E8;
	Thu, 31 Jul 2025 20:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D26i3El4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33ABC10E7E8
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 20:52:01 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3b78d337dd9so92358f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753995120; x=1754599920; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RRHNd2ZCWezMU8sh7ndHGqZnx2BwmZPaqx0vp8vaTJ0=;
 b=D26i3El42gw9thdzhykcnanbYiB5khhNWRf7Nq0Ok9rUJd4ijzrdbSHtGr38R96H4v
 S1QaqaO8fP9gCttfQkYWOof1d76m0XY5JHjlDqCN3KmbJiUN047EOR3abfOA6576fCcN
 xZQMGtQnN3YbuM71If55v+OVFMHfIAF2vLe+uCVNsU+VY9e/8stpz7zcDaNE17aHEqZ9
 IoTIKXbiO/RkmVdApi21gbeYslLb42yFpBlXGkwA5v1KpO06RcwMfUicZVcO9Cd+OBDa
 h3ofIelSvqCvt0yDwNPxx/+eTgORCHbeU5571EOV4XmQy7FxHwTKIObLeFL93whyE2Kq
 IrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753995120; x=1754599920;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RRHNd2ZCWezMU8sh7ndHGqZnx2BwmZPaqx0vp8vaTJ0=;
 b=PI+Iq/TvFyslBkdU40IFe8x+nIXWFKhfHqQNeKp++TlGRCzh48W3JP02ufiQo41/uP
 XrkcpQJwEX6kPjcVzZWkAfbrfuNWFCtJ2eA8lDw2iR/V3ofGE0leTsN9X+Yl/Eu1KURm
 CC9xDHISFvA0oPFR7g/itrsvncv7svDIEW4Q4N3aW8aYVaX+rGC0UQ7dnEddSRACD6UW
 P8bb1Sba6qXIJVoEvB+sNogr1NGnPaKKlzULsCEDK8vV6di42gL+tSCZHJpVy9MfZ085
 FMHjKht5XTLpZSwQRy5Fz6RJGuQYfHTqx7TgBsSyvramrGr8ziQ5znRZqA33MxdiGiiE
 1YbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmsxp095I0EFLvhfeLSX6AqObxq67a73YJv0LkzjCPY3TQ4iL8FcshssMlqJlNPuHVTu/q/NCT75M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJ14E5xDXbHmqVLZIL/wGC1XMo3ytBYOWhik5Olgj3PRLVpVi3
 iX9G8rTSQXebcPrUJUXAQxWD6lHbe8v+671pYK5wWhtg7iD65HCN9OALlR15Ob1CFXdassfHrlt
 He4WRpp5KN2IOuqRBBqdqUxXOW3814YPQ52tjpz2rgA==
X-Gm-Gg: ASbGncvEtyVxLFa73Hkjf9EGkKOYMYFEpPo9QSGejBruuUA9EcM/IWXs8i49hmjaNY8
 wYDFIXRoqMUzacHXV3c/BWpSEQY9/bMb8GeW1qSdeaCQIXZLbic+iD2tt5oto7qZVO9jpxcYvVn
 MQpJYCjrTBYApJVtBH+oJMPqMpD25L0BKy3E7Ms9ubhJPvvNSOQwptnNbEI6q4cv9hpXs7x8x2p
 madTilRZnA3QmOIUybu
X-Google-Smtp-Source: AGHT+IEwyDoX4uF/9YMToh0+WSQVrRidsSvYeXgHSGPP5jTwBijhyndShZR9merunu1Sixh2RwmDPnVM6baMrGA3w50=
X-Received: by 2002:a05:6000:2085:b0:3b7:9b4d:710e with SMTP id
 ffacd0b85a97d-3b79b4d72c9mr3914484f8f.38.1753995119691; Thu, 31 Jul 2025
 13:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <aCw9pYehCdfXXeiR@hovoldconsulting.com>
 <aG-QyF12rGY55gcG@hovoldconsulting.com>
 <d431435b-4ac0-44aa-922d-0bde126ca563@linaro.org>
 <DBIMQO2CS0I3.17XLZPKPCVW2S@linaro.com>
 <e9c63414-8434-4e35-a159-66df1864f9f3@linaro.org>
In-Reply-To: <e9c63414-8434-4e35-a159-66df1864f9f3@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 31 Jul 2025 21:51:49 +0100
X-Gm-Features: Ac12FXzd0YutQBM4VsTZ7ybOvRaAxugnGXJ2Kg3XZRdEMOsxc-OgmLq-KhYmTLw
Message-ID: <CACr-zFC+WcSYDZ8SEYO211sBVN_=oEXmSw_X6i6zdk6Y+prHFw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Neil, Johan,


On Wed, 23 Jul 2025 at 07:51, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 22/07/2025 15:48, Rui Miguel Silva wrote:
> > Hey Neil,
> >
> > On Tue Jul 22, 2025 at 2:01 PM WEST, Neil Armstrong wrote:
> >
> >> On 10/07/2025 12:07, Johan Hovold wrote:
> >>> Hi Chris (and Neil),
> >>>
> >>> On Tue, May 20, 2025 at 10:30:29AM +0200, Johan Hovold wrote:
> >>>
> >>>> On Wed, Apr 02, 2025 at 03:36:31PM +0100, Christopher Obbard wrote:
> >>>>> The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
> >>>>> panels. This patch series adds support for the OLED model which has a
> >>>>> Samsung ATNA40YK20 panel.
> >>>>>
> >>>>> With this patch series the backlight of the OLED eDP panel does not
> >>>>> illuminate since the brightness is incorrectly read from the eDP panel
> >>>>> as (to be clear this is not a regression). This is fixed in [0].
> >>>>>
> >>>>> [0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/
> >>>>
> >>>> It would be good to get OLED support for the T14s merged. Are you
> >>>> planning on sending another revision of this series?
> >>>
> >>> No reply for over a month. Do you intend to respin these or should
> >>> someone else take over?
> >>>
> >>> Neil, do you have the OLED version now?
> >>
> >> I'm not sure, how do I determine that ? Is there something specific in the type number ?
> >
> > Yes, yours is the OLED version, the exact models stated above.
>
> Ack thx, I'll test and re-spin this patchset then.

Sorry for the delay. I've just sent a v5 of this patch. I will look at
the eDP brightness patch next...


> Neil
>
> >
> > Cheers,
> >       Rui
> >
> >>
> >> Neil
> >>
> >>>
> >>>>> Christopher Obbard (3):
> >>>>>         arm64: dts: qcom: x1e80100: add epd hpd pinctrl
> >>>>>         arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
> >>>>
> >>>>>         arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
> >>>>
> >>>> Strictly speaking you could have posted this last patch on it's own as
> >>>> it doesn't depend on adding the hpd pinctrl.
> >>>
> >>> Johan
> >
> >
> >
>
