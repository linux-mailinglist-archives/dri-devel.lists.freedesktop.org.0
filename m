Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73DD9002FC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 14:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0217410EC18;
	Fri,  7 Jun 2024 12:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nJ/tGFTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E2410EC18
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 12:04:41 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6f94669cf19so961845a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717761881; x=1718366681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DsnAIOZzuHsMblCK5Wyo2qtzh+qW0N73ZweI2cUEP1k=;
 b=nJ/tGFTl2j51qOv1kHCu0t9ShuBgCL6XvOsKMBI3Q5vsl6spt49V8Vu/1P/AsqJ/Zj
 04I4MnD5mFgJlYBJMquZE6+GHZx4Og+w4ZM7aWVgOKVH6+fr1JJJ3eflxiNzd6NW4PBE
 LJgpXLeb5d4eJEbMUQlG2AroR4iK2ULCddVYGDDyfL3NZRncNSRsUwfIH7NEmRiujAhx
 Uu+ePtihtFQR+5vcgHgTq48yTtxb/Fm1W45Ma5oBtBOAZJkLpaXA5+aRsgzs+uSy6mKD
 pQOWZQxPtzKT8ApogYGXu5ZQD5184faqaIKnbYlIhRoZfdSyV+p13tjsZ6HNtsZG1Swq
 H+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717761881; x=1718366681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DsnAIOZzuHsMblCK5Wyo2qtzh+qW0N73ZweI2cUEP1k=;
 b=BNhR7OogtHbClrryL3DsGmqpEwKd032VcNseP5Km//NDSzTUco3elxCSmSRZ9GlJgA
 q5dzTXavu3Z9vSW4DEPZfB447rWxOHVYKU5AiOaYdHp51+MY6ZFpjbH2tqDpBTHgkM9q
 TYhTEJHhzOneHwJdIA07ILA8rQ6bn5KeBo9GrzIAzoYFn2/mafLxD8ShEvFh7jVnqPPk
 3yZlQe52giCHO5WG1ThWtI3MhdbhAFCDvPK/DEo/uSrCXQs95II7CTotCmxgmzxp96M0
 k+iORsf2vCGy6d1+KQBZYmv293mSuhJ3lYMauiiXWYyzvRPbhYZ3m8JWpXEUsQj7ym0r
 oc0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjXDfAlrxmygf+gL+Xt90lzPt9+3vssyKcJM+1s/P6U3zlqJcI2g8kuIsOY86wkPseUboh941ed/ZplFQyZ1CV9z7ms7TYzevO2bIc+gur
X-Gm-Message-State: AOJu0Yww+0SF+cdW0TxGqyeaCRuZ8yWCtsDxbCUa11tMy9OFSFaScBsD
 kmg/pUxce+YubOjnu9JsZhOxFuxGHTN0aM/d0mLGduV+caxwx7IBLtMTnRgCr/6MCkqoOcWEGXB
 oomin0Jg8JwYT0BSJ/1TJE+oFV3cgA7FbGaxEMw==
X-Google-Smtp-Source: AGHT+IETi62DUKnC9LFoGDVSrwVYfAj5bLtwDr84JTqNN4MYb1edwtz3sgiNUcALGr6HLEisP7i3zCXtYPAx8jBX/jE=
X-Received: by 2002:a9d:7d8b:0:b0:6f9:631c:c45c with SMTP id
 46e09a7af769-6f9631cc6f1mr222367a34.3.1717761880907; Fri, 07 Jun 2024
 05:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240601084528.22502-5-lvzhaoxiong@huaqin.corp-partner.google.com>
 <5yz4uct3dnxqflij34zasu6fhr42gyl6kjfjobftrwpsl6j4y6@3kzp4s3dxktw>
 <CA+6=WdSpHp6WRwZ3ta6ZR585ON9XSjWB5s1EjbhpBnWGWmhRAw@mail.gmail.com>
In-Reply-To: <CA+6=WdSpHp6WRwZ3ta6ZR585ON9XSjWB5s1EjbhpBnWGWmhRAw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 7 Jun 2024 15:04:30 +0300
Message-ID: <CAA8EJppknn-doN=1jNBiZFUqF5ZOPxb4jbNe5Cf8uHatS4cbfA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/panel: starry: add new panel driver
To: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
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

On Fri, 7 Jun 2024 at 14:51, zhaoxiong lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> hi Dmitry
>
> These two panels are not the same IC but their timing is the same,
> only the init cmd and panel parameters are different, so I made it
> compatible on the kingdisplay driver.

We usually merge drivers by the driver IC, not by the timings.

Please stop top-posting.

>
> Similar to this driver:  panel-boe-tv101wum-nl6.c
>
> thanks
>
> On Sun, Jun 2, 2024 at 12:26=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Sat, Jun 01, 2024 at 04:45:28PM +0800, Zhaoxiong Lv wrote:
> > > This Starry panel has the same timing as the Kingdisplay panel,
> > > so add starry configuration in the Kingdisplay driver.
> >
> > Do these two panels share the same driver IC? Programming sequences do
> > not seem common, so it might be better to have a separate driver for
> > this panel.


--=20
With best wishes
Dmitry
