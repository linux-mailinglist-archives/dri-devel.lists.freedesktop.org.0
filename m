Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C19EC6DF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB9110EA94;
	Wed, 11 Dec 2024 08:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QaE7KC0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A146F10EA94
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:18:30 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so28670761fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733905108; x=1734509908;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XskHzUQ0wP3xisQAsDVTIVaMiwmap3TuSXWv2UwOOoE=;
 b=QaE7KC0pAyqHaEwfAixAJUDuhlIIzm+PJTIYAqRmzjlajUJrT3lbtoMLibn4NvQ3FE
 XdiORWf75Tif1/AGIfgsAd3ezsgMTKimdtUFct/RvFoBsO1fZttZ5eNnEmJt3B088T5q
 kA3gQUYCRSFxAHp8K86N6c5VOO5BGlxHDysLbJp4Ykf2CVlH9AdRrgDnGy1QZHoq6ZsV
 rIF/vVaSGGzIp1H/YDSfcVbUDyzlkSSTdlTuJ7QaWcxxzvMIdo9di08S4A0BS100XLRq
 9i13mGbo8dIk8fF9Oq2LnXNexj1jt0S1glqTOpOvPmMtdjOnko80Hyq3u3PRZy9sNVcr
 oQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733905108; x=1734509908;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XskHzUQ0wP3xisQAsDVTIVaMiwmap3TuSXWv2UwOOoE=;
 b=LSg2AuNR3lAen7MfTUQ/srsY7cjEDIk2t27iPOv1NyQaaW/5rnaBpz/yFmMZOixOeH
 +sFcuk8DQDj88/fedbJKOgSQ+bqj+40Zo2UhW32EKiprZO3u/auuFD5uaiphf90hD0CY
 z7BxuLCuVeEpVgUxdEA2kMvTi61vxQ86ztlp2+oLscwE6eQF2xMrABfwfwMogYPPRoC0
 WJq5tS13HiwMTWeSVnt8zA2PTOzxQJj8bxiw5Codkpr/xD/te5Szr6vRUM/2qML2cgHB
 L6xxDBi6fmK5mz7EPXYFtxKUZAgEJSODRGOZUoVx+MIQSQW8Dbw7WW0jMvbaOtWYb0G+
 CQIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/+ioTPodxMC2oO8g/6DL/7/ptqWr/70UmSPqICfzk6ie5Bx1xQQf6ywTxhSP+1macQLkgC+oeZUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypuT4ItC3M2saWENhW1JNxQNTM1b+MZkZh/o0nxnzDHdjqocHX
 jh7zxg9HvHwl5jr6eeV//h7piWhSJgoeoVZ36FfmrA4LaNYzFU8jDWRGNzbYMG0PL3vFcv2z2OP
 gpOxYhz1fRmZ+sDNyMbroboOPbgrKD0wGjBpiRw==
X-Gm-Gg: ASbGnctxBTttDCXMtEG8EygHv7fGIxr176aLP58rN32J2ciNu5k6+5Lc/IYkjg5YZvx
 J0lklWJZlPMRZKnpsAQj2ZS0obu2fngC4a2+9021xXry1ol0Hk3/wDZO2hXbvq7c4eVk=
X-Google-Smtp-Source: AGHT+IEyqSnEBMMtZyEj5jF6bo6/CxMQUAS8l/Vem+Q0Tg0zwJltPimb/BXxYNi4dNa8OIsM4j3xdj7bHzlce3zdJRY=
X-Received: by 2002:a2e:bcc6:0:b0:2ff:c95a:a067 with SMTP id
 38308e7fff4ca-30240d08829mr5734311fa.13.1733905108362; Wed, 11 Dec 2024
 00:18:28 -0800 (PST)
MIME-Version: 1.0
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-8-583cc60329df@quicinc.com>
In-Reply-To: <20241211-const_dfc_done-v4-8-583cc60329df@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Dec 2024 09:18:17 +0100
Message-ID: <CAMRc=MdJuy9ghgLHxbygdHME2EkttZ7zBMJzCis=t94EUMbGiQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 James Bottomley <James.Bottomley@hansenpartnership.com>, 
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org, 
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org, 
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-serial@vger.kernel.org, netdev@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
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

On Wed, Dec 11, 2024 at 1:10=E2=80=AFAM Zijun Hu <zijun_hu@icloud.com> wrot=
e:
>
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>
> gpio_sim_dev_match_fwnode() is a simple wrapper of API
> device_match_fwnode().
>
> Remove the needless wrapper and use the API instead.
>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
