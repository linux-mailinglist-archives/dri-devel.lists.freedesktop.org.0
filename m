Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPHNKyONoGkokwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF111AD5FE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E14210E9FA;
	Thu, 26 Feb 2026 18:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d5ky7yk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6629310E06F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 11:49:54 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2bdcada445fso362272eec.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 03:49:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772106594; cv=none;
 d=google.com; s=arc-20240605;
 b=XJpKfbmWo+RXkW2qJtjH1aub5u9L4dZMExGgh/GNYcBwXpbfRk0YUGlBWDgahfllUd
 t/O4jcgbILEipLkIKCYFJJTxrMpJ37X1lVH3c8QIVwQEeqKWn8kFEjdV9pEzBnLktmaP
 YgJtSBoKZX8fAYsq9LwfqnSInG6xL6b9vHT97RxoL73u3qQ1cXdOfIHEuiy0Y2Owfw0n
 ymwmdfb6YrqWg2YjtwigQQEW2bhh1imEGE3qlXBpfq/AHJChCEtd/0sv87yW2FTQfCH0
 9n/YgkrPb/oHdPJZQP5+/QKFE9usVQfQT8icm0MtAOP52nJOJH01LLuc7f70QmJfhGmT
 D/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rgmPn19c/p+qMI402YeYidJ3CVeGin48tR6uiGvvny0=;
 fh=fugrFfXPAYRVDaKdkMcV97H9Qj4eM6xDrbBOT4hKJnI=;
 b=PugZIoK7b9hgqXtoM1wmInso+jDE480Cvtq90ChkryJ7F2U34zyETU1i2xmGaRq430
 I9xlBXt78j55yBQ42zmO4xC1Zx30FjkeN5dRr033E+0FdPCeqPAtn1wwbjy9E0CH/Jup
 ezOC4VhTIexDI+C592Lz3aVkXTXsNI2AVO7EvhBd+sEtwD8DPl0rYI3qlIrlBmI57Iyc
 gzmdrn+m6puCIRXD710Vhj9HCJvQHoNjk8g06dXyAfpVwuZHSO88vzWja/ovzQAAFyjS
 ql0mXQNAxtTGmPDr+VgBty5qMp+tzBSILgs0HtHX2wL+osJL75gOd1LQZ1NJ1Yl6Fnm8
 wOaQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772106594; x=1772711394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rgmPn19c/p+qMI402YeYidJ3CVeGin48tR6uiGvvny0=;
 b=d5ky7yk8O/YY3ZJGPWCeBHKe3wQ9GKgyzQOgM80BmFy3qywbnCNxIn+lzCqhceoQFs
 yJrezyck3WFpKWxNPC8R2ooTZYnEG7DIXQzgDGcx5UBb08rDxJ5gtv33Ge/j6oqBFbjw
 7c65Y5VTtXr81yrK5r3LbXmIm+k7i84vYw/oLK/2es9MafeGG7OFGWCetRCHXIuFFpXp
 5L1JccOyfv7kObtvbUf25oSEV0R1YHSAd/Kf1DFdNSB56dkpdCIFT7E1/BbENak1CT6G
 28O8ulUBRcosp0lgwFwbwJv2porQ38YwAXZB+TOGauKndQLLWlgDO17jVyYqhxeF3ENq
 bcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772106594; x=1772711394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rgmPn19c/p+qMI402YeYidJ3CVeGin48tR6uiGvvny0=;
 b=w+qqfttYA2O/cu+JWl+pF/1b/S842l+kFsq/3uvfYjUmw8Gro1MTS9SgHwpK3sLhoe
 AMW+9FvdekXnnuv3NQ71nhWc0tUWFjzolPQtZdLC92zJaSwqCVaZse+I2wmlbijWhyBo
 yby1uAZrEpgOHl5sSoLWOkMlRbvWgBzpyQRkj225IZCHv8hEHOmxeVX2EQBWF9MBxQSn
 XeDYxntqMGdB6BvinxTKbWy3HAFG6xpMsRvajJzNwmzvY2chdufrovWgdJcX2sovk50P
 PlD/XV3HWtbJw/Ju80/yNCUUJYoGG94gCq0hKt9uWKSM8dCX4ZVaWMwGs/AzEEl8ZY/p
 Ae9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWctdXEaYB2jwYUUkVdKCs/Qi8ti1uHgo6LO8A2U07kl1rZwDkSwwa7/XGnGQw9tKnkHfXbNk7ZVa0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6XeGi90ko/FoEw5cOY+4hMGeN9ziyBX1vCGa74roxlKsiVvui
 BVftT0USJJ7lM/a2EwU1eprzkXDsIyG12NH/pLKLFE7L3auF5sqQYsUyxGpTozzJJYjuUrZfSYP
 oO0Q3tmq7Ovb6pimLue3xUN/CR5bpLvI=
X-Gm-Gg: ATEYQzxhsmS+sJd+irdzBWcVwazx4ossjUD0/3Jq/79iZyAKXE9KHC1CMzmaPQIOMiO
 cxjfiMJbr7TMBdOC/Q/8twGjBomfk04XLm72+SmTD5PXiuXI6+2ICLOynIOm8bBSK0iKhsTj1fw
 NiHsxKRHmzQ24tiNoc7LMAVl9JkSvQlrXPfxH9R/2JcFUFIdSMv3fOtbB7muC8CHj6avqIKsoiU
 gdeioEVJ/QYO0pEMubULuuHvN8ON6Mhfx+CH1Usji80VNw+Nx8bxdBStvPuIhxeL3q1khGx9tdx
 PLQabwc=
X-Received: by 2002:a05:7301:580a:b0:2ba:749f:81a7 with SMTP id
 5a478bee46e88-2bdd1072184mr1276503eec.21.1772106593534; Thu, 26 Feb 2026
 03:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
 <20260223-panel-patches-v2-2-1b6ad471d540@gmail.com>
 <44283903-f11d-4b13-a6c7-6f0d40a3d00b@ixit.cz>
 <CAHuF_ZoZDJ9bGKv9FqAoJsBMjVeyHAJWqoc5NA3sshep3cdDwQ@mail.gmail.com>
 <c80683ec-9c34-430e-8007-7d5f9677263c@ixit.cz>
In-Reply-To: <c80683ec-9c34-430e-8007-7d5f9677263c@ixit.cz>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Thu, 26 Feb 2026 13:49:41 +0200
X-Gm-Features: AaiRm53RyeCUYF1TdO7He7BUB6Q3FObLNVXo7a9OvUo3vwH6_hGF0E-ikadLDVc
Message-ID: <CAHuF_Zp6Rhe0e2FCGgDYXhqRJTf6w5Ly0UGy5u2ORAQofiRCtA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm: panel: Add Samsung S6E8FCO
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 =?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4BF111AD5FE
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 at 23:24, David Heidelberg <david@ixit.cz> wrote:
>
> On 25/02/2026 22:13, Yedaya Katsman wrote:
>
>
> [...]
> >>> +static struct backlight_device *
> >>> +s6e8fco_samsungp_create_backlight(struct mipi_dsi_device *dsi)
> >>> +{
> >>> +     struct device *dev =3D &dsi->dev;
> >>> +     const struct backlight_properties props =3D {
> >>> +             .type =3D BACKLIGHT_RAW,
> >>> +             .brightness =3D 268,
> >>
> >> ~ 10% of brightness at boot? What is the scale? Shouldn't make sense t=
o
> >> set it around 50%? (just asking)
> > This is just what was configured downstream, it looks bright enough for=
 me
> > fwiw, I can change it if you want.
>
> No need to change it if it=E2=80=99s bright enough. If it=E2=80=99s usabl=
e when you
> power on the device outdoors with some daylight exposure, then it=E2=80=
=99s fine.
While testing this I found out that the max brightness is actually
1023, anything
above 1024 just wraps around, i.e 1224 is the same as 200. Will update the
max to be 1023.
I tested outside and it is a bit hard to see, will update the default to 51=
2.

> Also, since the user can adjust the brightness later, it won=E2=80=99t ma=
tter
> much either way.
>
> Thanks,
> David
>
> [...]

Thank,
Yedaya
