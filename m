Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603CEA2AEAC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 18:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B2910E8EE;
	Thu,  6 Feb 2025 17:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NPlyZANY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADBF10E8EB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 17:18:02 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5401c52000dso1211640e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738862279; x=1739467079;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ueAPYpXJvcfTr/q+Id1IwP1ydGbx5eYC+BvmtKb8pog=;
 b=NPlyZANY308VId5ACUQTrtuwAr4ioNTRuepDy+RZN4P6btaUSsxipw4iOfKHqQZBo/
 Ec5wP+qm6K/ezIoXvuukTRb6i+b6EOW1ZuNjZ1NgFNvZ/2FTSq4oKyJG5HqeDNyJr4/H
 U5D1ULzCXo0MkOqOueffkeVpzvVbyravzp8Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738862279; x=1739467079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ueAPYpXJvcfTr/q+Id1IwP1ydGbx5eYC+BvmtKb8pog=;
 b=EfEpBkapCEwPOoVRE9sUCjQmjfZ82SQAZMFsVoau+/HWY+r1ptpb8a06pNcetle4pX
 SdUAnD0FC33fg2ZP5BoEzxARkt2nGHfX11MHf/hpJlEonPfK6gsBbHXzURRFWMKmuFXA
 zpe/yyDa1swUwH09zJ7R1Q4/btrCQVCGjb0x1lEDN2HXbjB/61S0w3x+Az+2p5uyI/AS
 1p045q0KKJOC5zlEMPIpiJLkO8l0KFVMAFTLWGutB9SCPKFBxzhIsLISrW/hhFvYz4C5
 YRsqjX81ob/NZ/3m6P19gaM6eDhSykDJ1LDI+sQQKhsaliPISIR2SKyhGE84WRlMKltq
 RABA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDOYwnSEmyJ8EcPnFE/Yx8YZBnOlhD2FPnJOgX5ULnnThUJl9Rt1LXpFoLZGHN+ZTPJrKhc88Z13c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMw9RZhR+okkgXafSrZCaouQUYXJwFyxVIpaviUHMxuVRI7QJA
 /O/bzcjbiMbj4BYcwFtJadKwCzeO++9gb+MtrL8jCLhm+2cJJnDeUexW4yiyqh55ScCuNyWonJQ
 RpA==
X-Gm-Gg: ASbGnct+m7aTIAn1n8y2mOt1/iMwFhLg/3Mw87hoKcJJWobJV2LrWepwWmVuj3t+sIE
 OHDqndyfSwKLbItlX35f8tALFs1lUqqsQed5ZRT+9V2EPcFhrP0v0HGel3M+hg3g2uqysW4GUS6
 TCNDLY93vORANbtnwE1ji99+5AkTz1gkTaG1mxoJojcHGgjwR5hvI04Wifrxu27IN+8G3IFZrei
 YT2V1j5tO/8iQF9Q24NfXYJD16EUqIWBa/Zzow15rUNopl34YokY8Uk2472jnTN1hsIR/ojGRXj
 gq4s658p+/Cawd/t+clHEmoxe5mwxS+mHr2CXsuGtDSfYQlYWFoR7DE=
X-Google-Smtp-Source: AGHT+IHX/g+RuxEOZ7cmm8IW8Yc9qKugCUnTTDJjWZAOHjdD+HK6d85PF3IkWPETFBzCy0R7MxIXMA==
X-Received: by 2002:a05:6512:3c8d:b0:543:e3fa:616d with SMTP id
 2adb3069b0e04-54405a67395mr2295001e87.40.1738862279375; 
 Thu, 06 Feb 2025 09:17:59 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544141e3592sm720e87.127.2025.02.06.09.17.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 09:17:56 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5401c52000dso1211541e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:17:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWsqfRC6QW4ninFvKmrm8OEBUKr3+YEBi2aGYjTClmHpSpnsTm2MoaIlEk/iYHT7tcDIZczYMy67h0=@lists.freedesktop.org
X-Received: by 2002:a05:6512:280e:b0:540:1f75:1b05 with SMTP id
 2adb3069b0e04-54405a181d4mr2811882e87.19.1738862275685; Thu, 06 Feb 2025
 09:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-3-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250206131300.1295111-3-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 09:17:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W0jvGESB59f_Hnz3tL8y37YdX77nx0hO+e0KK5TngPpQ@mail.gmail.com>
X-Gm-Features: AWEUYZkNkoAXZHBbfT2iBqqpLsWvoirtpsqxceL-idOINtHwPQs__7CAWjInIok
Message-ID: <CAD=FV=W0jvGESB59f_Hnz3tL8y37YdX77nx0hO+e0KK5TngPpQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add compatible for
 CSOT PNA957QT1-1
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
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

On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add a new compatible for the panel CSOT PNA957QT1-1. This panel uses
> HX83102 IC, so add the compatible to the hx83102 binding files.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
>  1 file changed, 2 insertions(+)

I haven't personally run this through DT validation, but this looks
good to me from a visual inspection.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I would assume this lands through the drm-misc tree and it'll meet up
with the vendor-prefix patch in mainline. That'll cause a temporary
schema validation error in drm-misc but I think that's OK, right? I
also wouldn't personally object to this landing through the DT
bindings tree. As a simple drm-misc committer I'm not sure I have the
official authority to ack that, but I've given my blessing for stuff
like this in the past and haven't been yelled at yet.

For now, I'll wait for a DT maintainer to give it a review and guidance.

-Doug
