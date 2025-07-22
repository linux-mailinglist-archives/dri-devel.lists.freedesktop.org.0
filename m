Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E7B0DFDF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 17:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5D610E2E2;
	Tue, 22 Jul 2025 15:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fkJw/9X0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31C510E694
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:48:49 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so56412035e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 06:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753192128; x=1753796928; darn=lists.freedesktop.org;
 h=in-reply-to:references:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ldRIZOo7b+ExrUWiM8bxC7vu6GZt+hWk+F7iitUy7Q=;
 b=fkJw/9X0SQXu6a2/+/ViV28JTxuU3mX4+JgGFEablHtJNrOqBwj/BhGNk91xzSJkNo
 /ljUcW6BL4c4kQb9tArvAyifEDnFtkK6npXtkwmUgIPQlzjwk9tE0FL142Kran+5l1Cy
 Qh1sW8m/PHSf2k/F0zCEe/5RNuhoo7UzLbricjDKq6tWAO8dDhy6+G4sGllC/oVM1nFL
 7487/EYH2BLyuJC2Iru8OSR/Mw31cGw8ACRSaT990ardVjeyMnTA/4OiqDhwcI4VZU75
 Bb6seyktf1VKRwmVqWzQUBgzo70SAFAKgowzOgc9uLyMrGctaxSIJqZZnnM3KjfHqIC5
 o2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753192128; x=1753796928;
 h=in-reply-to:references:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+ldRIZOo7b+ExrUWiM8bxC7vu6GZt+hWk+F7iitUy7Q=;
 b=Au+qrHQZMYHW+QWfHJu7JEZWMVst5hnkwRHAbFRmZzNRsBygJJWNqNzwErIDyI1DCF
 W4tHWiuo4GhUu57sUzSM048ZA3rR/xw3A5l2qtzu6VVPptmS+8IspeLxnRr/BTeQL7w5
 kBZM6zeGgUT7ZMY69Be64erJFG7i1YM1L2s7dlVIpkytIjJswabPPJLujsb8+/vOW+u1
 tw+KSq25SKj4U2hjvWUpznRWhWWEWGymNm2cO2oTRSz9gJHQsfDGmFaf7ccbFc3lvT3f
 wQALqAAYlXdYfBbyJURWJ/3CYWDM9eTMeRs9jNeXewptoVhSy94ABMDZNoJG9Xdl0u6y
 i4jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3wg5hal90/l28I+U79x4IP7Hwg/5BW3FJdo7S/IlpWFm2pWn1TyZHNDjgdoY6l4iVJOUaih8rX+c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKpjwSoGxE7UTTS9vxbnkfFJ7D3YlB663M1IrtdRLOjT5PeDcP
 fDjZF8iAArD7q+py7ZxhZiRmvmt4DwQkJeuN3EsueCpDOXndugVqcbXW
X-Gm-Gg: ASbGnctgGyBywvyPV1iu1fug8gAZ0KvrwTDnB77v6nrcMO8QizMqklokuuTOERdTT2u
 ZC++eRq4X0G6yWd6sl5SEUSUjp14su99agS7nIDwI8TvFJjzvEfg2X2Oniba8rBr6KWYenTkBZC
 wgKnvYju6lLNZKsIWzS3Mde7fPPjojWxwRpddCQcqdJGgdoGTV5FIlsxgrEFU2GAOcbKwoVm9oQ
 Cn6i68jZ8NoLIJV+j2/Y2SJBTTIR7BVEA43amwndW1dgLe0ywYEQr3CPkor6jhY0XYv3WHSj8a3
 puN6Ov3KjPoy0QY+jjtlmT3jZw/pJJbC7hD6QmO5oHLXSk4Q1Dq4Upf+CgySlHlFYsj+HlYYnDV
 9lnVmomqqPx/GFbtZsV7czlDRyzPtR1lhQa1YV4P8RpiUGyOiQK1SJgtQCl5Q
X-Google-Smtp-Source: AGHT+IHOsD2HonrK3ieI5Sd51hJX0fvzUE7WJgdLvFb4OsH0yW2r6mqQo7lyaumurv4xcpwqbOBCnQ==
X-Received: by 2002:a05:600c:3496:b0:456:1b8b:b8c6 with SMTP id
 5b1f17b1804b1-4562edaa066mr235088475e9.14.1753192127819; 
 Tue, 22 Jul 2025 06:48:47 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45863a131aasm17025115e9.2.2025.07.22.06.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:48:47 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Jul 2025 14:48:46 +0100
Message-Id: <DBIMQO2CS0I3.17XLZPKPCVW2S@linaro.com>
To: "Neil Armstrong" <neil.armstrong@linaro.org>, "Johan Hovold"
 <johan@kernel.org>, "Christopher Obbard" <christopher.obbard@linaro.org>
Cc: "Douglas Anderson" <dianders@chromium.org>, "Jessica Zhang"
 <quic_jesszhan@quicinc.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Rui
 Miguel Silva" <rui.silva@linaro.org>, "Abel Vesa" <abel.vesa@linaro.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <aCw9pYehCdfXXeiR@hovoldconsulting.com>
 <aG-QyF12rGY55gcG@hovoldconsulting.com>
 <d431435b-4ac0-44aa-922d-0bde126ca563@linaro.org>
In-Reply-To: <d431435b-4ac0-44aa-922d-0bde126ca563@linaro.org>
X-Mailman-Approved-At: Tue, 22 Jul 2025 15:05:04 +0000
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

Hey Neil,

On Tue Jul 22, 2025 at 2:01 PM WEST, Neil Armstrong wrote:

> On 10/07/2025 12:07, Johan Hovold wrote:
>> Hi Chris (and Neil),
>>=20
>> On Tue, May 20, 2025 at 10:30:29AM +0200, Johan Hovold wrote:
>>=20
>>> On Wed, Apr 02, 2025 at 03:36:31PM +0100, Christopher Obbard wrote:
>>>> The Snapdragon Lenovo T14s Gen6 can be bought with a number of differe=
nt
>>>> panels. This patch series adds support for the OLED model which has a
>>>> Samsung ATNA40YK20 panel.
>>>>
>>>> With this patch series the backlight of the OLED eDP panel does not
>>>> illuminate since the brightness is incorrectly read from the eDP panel
>>>> as (to be clear this is not a regression). This is fixed in [0].
>>>>
>>>> [0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-p=
anel-brightness-v6-1-84ad1cd1078a@linaro.org/
>>>
>>> It would be good to get OLED support for the T14s merged. Are you
>>> planning on sending another revision of this series?
>>=20
>> No reply for over a month. Do you intend to respin these or should
>> someone else take over?
>>=20
>> Neil, do you have the OLED version now?
>
> I'm not sure, how do I determine that ? Is there something specific in th=
e type number ?

Yes, yours is the OLED version, the exact models stated above.

Cheers,
     Rui

>
> Neil
>
>>=20
>>>> Christopher Obbard (3):
>>>>        arm64: dts: qcom: x1e80100: add epd hpd pinctrl
>>>>        arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
>>>
>>>>        arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
>>>
>>> Strictly speaking you could have posted this last patch on it's own as
>>> it doesn't depend on adding the hpd pinctrl.
>>=20
>> Johan



