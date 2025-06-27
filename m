Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909BFAEB40D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 12:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537FB10E9BE;
	Fri, 27 Jun 2025 10:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZjfvoHAf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E694C10E9BE
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 10:15:51 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-87f04817bf6so1323179241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751019351; x=1751624151; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3qFR7cfAS/X16LAzwLj/wNbMxrS9YVqLflPC6mFUYo=;
 b=ZjfvoHAf8nozrHrOFrOayVWAXFpY7sObtfZar2ivO2c0+TlsSS3mQdSNZkWA2w8zCP
 cgnTbFWpw9FkntrCaF9Z4TvBEeq+9UfuMd+Ri7RnsMnaWY89ttVDZqHd2PRYVnHetrbb
 D5PIfgA3ilWwmhUGR7r4MuujkkQ1METPUMkTmyWGKm8UQKyphIAXzZdGs73nlYwWN+Is
 cHSmr4jR0i1Ph1oSmzbT+l7LDWaH7qrA+9INod2rFSwO+a/eKjVH/Zyzr1Od/o086sd/
 2zx94jbKQ1nu9iUc8jOEk9BDMAttqg53hgdfbzVNvXZ/y/KqxX+6MfxRun6zLqTFYwWO
 Xy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751019351; x=1751624151;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W3qFR7cfAS/X16LAzwLj/wNbMxrS9YVqLflPC6mFUYo=;
 b=qEE4HD7qzjun9zotRnjt8s9Iy1gkHfnWc+ZtyO/gNPdqNRzCwDbYlrtOEsnNs6Dvtn
 giVo+YMOzZDJN9d+nomZBbOdbxjWCFXWsbMjy+9pIFhEFRVd/KYy7i5V5DCcwTqzhbOI
 kGJ3Ka2scfaNaBAFLqdnOv0jdM/2ne01DHl6JGHInIQymyDgmM6y+nXsJyfZXXSM3HT6
 kPkEcqNw0iJcMNZCa1rgN64JBcGGVE03z5hJIQhOxFyodeYrd7ZMgz+4awZkASUgGuVY
 bk6Y90EysXgV9zKUlA0LBTDVdp8Vs828yzqhKW9/7O9yn/Y5KKg9U6uYKcZMu3fk021P
 V+3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrPetLaHmRJZJt12k4pxZjXLEtMmWwDtu2bUNdDpVittkPw3FKQy9OVQRlhDeVU0RcqYlWNArWmek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWOEgP+BqrlYz9g3IcmEVXnLko7cEHIWHuZbl0IwwnQXJ/277H
 A3aH1kh5MQUiFM/HO9fX7iFJVidVFajOpRdxnWdjmtZzarKgvQzu67AdmDJhdh88FjYKL3iEbcz
 EGgerjbcDX5salnXI3kpTUJrSQxbR96Q=
X-Gm-Gg: ASbGncscUaEdOC0wIElBwpUoi5Mb4a5w0pbmifKNYR6qZLNOOxiirCxlcl9/pfvTOr4
 P3rq3yeV9WQrjCe5KZrpajdndV9sp6aWYXzZgtNqVAmhUVNTewXgIJbUbSLulU/ijPSrUYG7nyn
 AU9qfXMDxgTvLTRsa+j9KG/VHXuNPQ+cFFt2TEYqxT/g==
X-Google-Smtp-Source: AGHT+IF+zTXlE8TphxlFmfZTtMV7oCo6MYa180Y0AG9PxdjoTKxOQADyJ71mo4br1mdkRgwuFP5aO2OpnO/3e6XLJPA=
X-Received: by 2002:a05:6102:440e:b0:4c5:4591:ffda with SMTP id
 ada2fe7eead31-4ee4f78a70fmr1764599137.21.1751019350729; Fri, 27 Jun 2025
 03:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <CAAQKjZPAsE8LGE00fWE1aPj03b6tu1rk9ScTDSN+HeKzVXMZvw@mail.gmail.com>
 <20250627-garrulous-cuddly-flamingo-b4ebcf@krzk-bin>
In-Reply-To: <20250627-garrulous-cuddly-flamingo-b4ebcf@krzk-bin>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 19:15:12 +0900
X-Gm-Features: Ac12FXzHboYrFxSlMZbUjKMAban_KcR6H0q7HqOUTH-xXDeKHhkBse3ecLJumpQ
Message-ID: <CAAQKjZO4grfoT=NYATNV5JojYgOyD=WwH4DgFTVcXEagXoFf8g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
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

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 4:51, K=
rzysztof Kozlowski <krzk@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Jun 27, 2025 at 02:02:37PM +0900, Inki Dae wrote:
> > 2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:2=
1, Kaustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=
=91=EC=84=B1:
> > >
> > > Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> > > - May optionally require an IOMMU to initialize a display region.
> > > - May require a port connection to another block, say an MIC or a DSI
> > >   master.
> > >
> > > Document these bindings in the devicetree schema.
> >
> > Applied.
>
> Please wait for DT review, giving us few hours is not enough. Please
> drop the patchset, needs fixes.

Got it. Reverted.

Thanks,
Inki Dae

>
> Best regards,
> Krzysztof
>
