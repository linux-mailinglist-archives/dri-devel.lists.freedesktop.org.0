Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0718ABA0A
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 09:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1615C10FB60;
	Sat, 20 Apr 2024 07:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j8Is7bCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6367F10FC30
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 07:11:22 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6ed2170d89fso2539952b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 00:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713597081; x=1714201881; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FHbZcO9eBlYnt7XFS3eJVcq/xDUoC37Q2+wGWYF99lU=;
 b=j8Is7bCvkGQXI4EGaMqsYymNVqH2Q5/Id3NYcH8oohVUHMeFwqXjQzImx7v4ymWxU1
 g2C5yhGYFpE8Txiqsb0APGQQjj6ToEnru77k26XwrMuxIOxwzGHTMWk4kEBiBPi4vbMi
 R7ifclq9QY5ed6+j4+c5A9bPSRuDvuAQexyArAWP1cQf4iTbosJT2lQVF6yAhu/3RzhT
 1CNV9aBYmbImtKBEX6DDzAEtkg+yDPmAtByxiK917Bw64/En8k9Cr4abhbMu96ftjxKc
 nxGQzZ8ma9gnfxJt3n2gxjcIo0seC71MmVUhhoupnbDg/nYtDSFY5rOJ6lfeesgifilt
 PB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713597081; x=1714201881;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FHbZcO9eBlYnt7XFS3eJVcq/xDUoC37Q2+wGWYF99lU=;
 b=n4NUb2z0ewZdXWMmrsKg7aZ+mvCTjhp2k6NeQR9HhCCHPLy2mxdYtO0OOv4Kofb7Nn
 3tYTDEwg3S7xiCQnELB2sszrcTs2o9VgRiyhWTNmCm+1fBm4+6MWX5+s3TBeXkK2ELFg
 zJRxZizI+Bk6Kdlf8p/hXzAN0T/9Znan6J0NLJK6bB8+5euVSr5ozwGZ/RDPIQeKzS6N
 pJG6UrqCiQoVG1ktMB6aU4vVOouRYm3qvzBAjzfwiCnOD8Y6eYuOGJY1Kw0JsC/2atHv
 Byovab4T3DI2o1PbCzbeiaBRdyPxG04nGHbs+BOGImyNdVqqDNaLxhW8oLGPgnQcsi1h
 VVAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGUA7DA0cncTekMzpsKBW4m+vbj2vhl0OiXak5YWyFwHaJfdkwZf3ht7JRdwp2iiiQoj7WRpjO6D5LQ7VZ6rOw7iImTYlgyAZvgM6uEt3y
X-Gm-Message-State: AOJu0YzM6c6uYqQ64CzggjdPzkqPYnZmIUgCGHT4wf1Bkam5+ox8kG9l
 0UyDGbrb0HMFBGbglZ5ELM9XQOOSuPS9fL0FgDwHQTDXoH8jtq4S
X-Google-Smtp-Source: AGHT+IF7/BjkCTlEQA9k75Hm9RDDzMxIE7GIDqYigrbGxhJScjrrK4MvQMABkzfgKwFrdwg3rGG2Mw==
X-Received: by 2002:a05:6a21:3406:b0:1a7:52db:6711 with SMTP id
 yn6-20020a056a21340600b001a752db6711mr10716105pzb.2.1713597081476; 
 Sat, 20 Apr 2024 00:11:21 -0700 (PDT)
Received: from [127.0.0.1] ([106.194.121.201])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a638c02000000b005e857e39b10sm4210958pgd.56.2024.04.20.00.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Apr 2024 00:11:20 -0700 (PDT)
Date: Sat, 20 Apr 2024 12:41:07 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: daniel.thompson@linaro.org, deller@gmx.de,
 dri-devel@lists.freedesktop.org, javier.carrasco.cruz@gmail.com,
 jingoohan1@gmail.com, julia.lawall@inria.fr, lee@kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Message-ID: <fe7df45c-b61f-4e8a-a13f-1e6a85cf83bf@gmail.com>
In-Reply-To: <yelspf4hfmmj3lnk3exyc6tm2lrsqlet623q2s5zrm2unba6nw@43ewuqdzckdg>
References: <20240419111613.GA12884@aspen.lan>
 <819a56c3-bbaf-4d5e-87de-78c1312c56d1@gmail.com>
 <yelspf4hfmmj3lnk3exyc6tm2lrsqlet623q2s5zrm2unba6nw@43ewuqdzckdg>
Subject: Re: [PATCH][next] drivers: video: Simplify device_node cleanup
 using __free
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <fe7df45c-b61f-4e8a-a13f-1e6a85cf83bf@gmail.com>
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

20 Apr 2024 1:13:42 am Dmitry Baryshkov <dmitry.baryshkov@linaro.org>:

> On Sat, Apr 20, 2024 at 12:22:41AM +0530, Shresth Prasad wrote:
>>=20
>>> Please fix the subject line to be "backlight: <driver>: ...". I came
>>> very close to deleting this patch without reading it ;-) .
>>=20
>> Really sorry about that, I'll fix it.
>>=20
>>> Do we need to get dev->of_node at all? The device, which we are
>>> borrowing, already owns a reference to the node so I don't see
>>> any point in this function taking an extra one.
>>>=20
>>> So why not simply make this:
>>>=20
>>> =C2=A0=C2=A0=C2=A0 struct device_node *np =3D dev->of_node;
>>=20
>> Looking at it again, I'm not sure why the call to `of_node_put` is there=
 in the first place. I think removing it will be fine.
>>=20
>> I'll fix both of these issues and send a patch v2.
>=20
> Just a stupid quesiton: on which platform was this patch tested?
>=20
> --=20
> With best wishes
> Dmitry
I tested the patch on a x86_64 qemu virtual machine

Regards,
Shresth
