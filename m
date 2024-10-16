Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51199A09A0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 14:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C43910E5CC;
	Wed, 16 Oct 2024 12:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="G2VpuAdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAD610E5CC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 12:27:18 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7b147a2ff04so38126385a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 05:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1729081638; x=1729686438;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BNLjlnEnDyHjV3CBswVgJafVhgghTbfH6ZETGps1FrE=;
 b=G2VpuAdhHyernyPp6KHVD1rWEQldz6y6c/FvFEYMKrbR1UnXxRb3sJC/SiFqMi3Z+i
 75jIYU/2b4CuAXhkvg/3M+ySJQbLBt1qN+Wk+ojIe2yih1eZxCwBe5rdSiME/D95FJVG
 s3ivx6v5UfrRPqsLE/tPujZRWxiBKrwKiWwjqjtxv9qW5/RheHdht44G7rKKekTsRKFg
 h76PHDUXHJe4UfR8SHjTZsGjIYMeEV5h9++d7XrM5+sVoO3dMB5Fx/b37kIetDP6A+R+
 telkm54WM2BhkFm7E6LMAHrPAdI9AQlLaIG/KBgNHo7PoPsfKJ9V3iTP3apHo8dJyXTF
 1eBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729081638; x=1729686438;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BNLjlnEnDyHjV3CBswVgJafVhgghTbfH6ZETGps1FrE=;
 b=IsNmBwDfM8nOC+0vsdnoS91UcSnuW9RYIyEt3Nmit6D1Ge3BCoCOgL1r0XLLGesgQS
 V3LSq70csKgyn00z6UalqVAT60TP3sMGCobsZfEPaU7gT0XBLXTgH3P6PpgOPaAwRPA6
 h4hp+5ee1SMbYmWmKXj17MFaIrjt0EsvrafDze1R9qP/NqfvlvCTJZI0iC1D5Lg8D5yG
 OK62c8iKiAUgNRtZWjkboGvm9xzL9OsLTlpLpjeTteUo1iZfGY9qEOrW5lhcUqXWiMtD
 cYMvy7Fm9jOQuJ40LLjS3CEMnfX9sO2RrdQDcGUOU1u42x7evH8YyyyTh65x7Co5bkQa
 2Nkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCrJU8qrhcZYjor1GpiLp8cfFJqr0sOFA/kFE++tw32FdeetVwQvAcAURCX+xdULj5kEnZsBkc7mM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy2uIQD1ufK5X5+JikpBW7S2cAQcsOFQTSv/Bt7ZTM6eAsB2rW
 ayqDAcjJYh/lD112IfzaL6QYDp7q+v0q2//CMappuQsn/j/5Z4J5NIGC1rGcx+DrGxEs8bsUcdU
 m8gR2IYtQwyGOkN2Wcs+qb7479GVaYYjgYVjcfA==
X-Google-Smtp-Source: AGHT+IEr2RGRH7z7eOPt4+/WSGTQZH3Rri8cgQyjmurOqgpwt74+wkRyeSLE84F+GLTwunyO3mI8dvjKyhWbsrjeDMI=
X-Received: by 2002:a05:620a:2989:b0:7a9:ab72:7374 with SMTP id
 af79cd13be357-7b120fc4b5bmr2484755985a.35.1729081637696; Wed, 16 Oct 2024
 05:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241014222022.571819-4-pZ010001011111@proton.me>
 <7b45f190.452f.1928e41b746.Coremail.andyshrk@163.com>
 <o_Cyz_ARcHj4zNlovv75MBwslIRhn3YWlscoNrlpLVobh7eWIMEQR5bNv0yhHx2KEx_gbYi_gH-8Y-CdvRZs9lZscz3-lhAbM50GXUdtSKY=@proton.me>
 <30940542.b36d.19290215124.Coremail.andyshrk@163.com>
 <1974DYrs9gLrQrZ5VwCglFgKDDK686iyqnS_g6uPB-s9wZ_4CqfZXPjmYWihLgrkRu7ptNjpkFeqB0uTt73RFId6cL8FowQ8LFltPmaKCoI=@proton.me>
 <1ae9f15d.e52.19292e05e73.Coremail.andyshrk@163.com>
In-Reply-To: <1ae9f15d.e52.19292e05e73.Coremail.andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 16 Oct 2024 13:27:06 +0100
Message-ID: <CAPj87rOmPyat12S4WUixiUBAsuAEEbyNX5VY2JS+wn5a1jux0A@mail.gmail.com>
Subject: Re: Re:Re:[PATCH v5] rockchip/drm: vop2: add support for gamma LUT
To: Andy Yan <andyshrk@163.com>
Cc: Piotr Zalewski <pZ010001011111@proton.me>, hjc@rock-chips.com,
 heiko@sntech.de, 
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, Dragan Simic <dsimic@manjaro.org>, 
 Diederik de Haas <didi.debian@cknow.org>
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

Hi all,

On Wed, 16 Oct 2024 at 02:11, Andy Yan <andyshrk@163.com> wrote:
> At 2024-10-16 04:13:40, "Piotr Zalewski" <pZ010001011111@proton.me> wrote=
:
> >Ok I get it now. Is such rework correct? - when gamma LUT for rk356x is
> >being set, instead of disabling the LUT before the gamma LUT write for t=
he
> >current CRTC's video port, active video port is selected. Selection is
> >based on if DSP LUT EN bit is set for particular video port. eg:
>
> If the userspace want to set gamma for CRTCx,  then that is indeed where =
they want to set the
> gamma on=E3=80=82The driver silently sets the gamma on another CRTC, whic=
h is not what the user wants.
>
> I think there are two options=EF=BC=9A
> =EF=BC=881=EF=BC=89return a error if gamma is enable on other CRTC=EF=BC=
=8C this is what we done in our BSP code[1]
>   (2)  disable the dsp_lut on privious CRTC, then switch to the current C=
RTC which userspace wants.

1 is the only solution that can work. Silently changing the colour
properties of a separate CRTC is not OK, since this can lead to
displaying incorrect content.

Cheers,
Daniel
