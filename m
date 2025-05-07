Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE2AAE028
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4B410E7D3;
	Wed,  7 May 2025 13:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AJSmOM+p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3334310E7D3;
 Wed,  7 May 2025 13:07:46 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-73bf5aa95e7so6449852b3a.1; 
 Wed, 07 May 2025 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746623266; x=1747228066; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kwhind8WBcIbv/C9JP+oZkXJQzZQNAjQBy+HdtDo3Bc=;
 b=AJSmOM+phAK1kl/DAMELv3LdKZ2UOikC1CC/tyRsReO9rpIU483atRRgwLhopxQCEp
 iD8t1PkYg9YcA0JkeydnJQYfbl3/XNbgtet/s89rIdkgXXF8QH/bpx+oEY6YgDzdvgOm
 OD62LZG+Nv4tYlaSs2c70/onIlPuTb+grqTGr9YrqbHEFQZaUarAHLmgkvs70nscwJuI
 izAkhjuVbh5nC3CEgssz+i2Aj8t+uFf7NG4CQFROymxqzsscoAjpOKFHz4aKixRdq0ej
 wxVWhfOfUkzDtCZhbC6iGJ7Wmeig9Bhd5jjhV0y2P01/Aq2vTA0JCYQ0/Gl4S8QZyYEr
 i2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746623266; x=1747228066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kwhind8WBcIbv/C9JP+oZkXJQzZQNAjQBy+HdtDo3Bc=;
 b=IA4hmP8za+RXsKGNEiT4Vp4yIg0yoBZjDRPjZH1HNdKvtVCWEPLNzDKa57RyxOLCbq
 2qF+iL2qkLcji9s8q/2rK7uISsMw2gNlXtIU2HpgtfZ3V6kFvMz/WUOGC3d8FCXx4Yis
 vJHFfJ3ktoEyzeNlimOAzAy7aAbuVNK1aQN0D/Yi5Ve0q0TuAlAviIgYD3XWIq41Ck9e
 DqKtY0omdem3KLP1440vdsQv5lGoOKOQbL18ygfmLg1Gp2Xrw/NC36OLXAgH5jATsrgA
 P+NA+IDkrCWuDj7/7kYA6n+OLI9UOs/rCWWVdQOS3XhKKHcD7ZP4IYan76sa6Or3xZ/I
 ZU7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkr/TH/GzTXM1u2kk+e2XPs4NgbEZdXTydgvT4+4+5XpqdbgoHnIVXZkxXMdMmwgPlxTCXxGT2QQ==@lists.freedesktop.org,
 AJvYcCXqItRge2sLMhziRnLP8riWEd6K8PYqmFVf9dTgFD9T7u8QyoCJ4LKtgUz9G9syu2oQvmUOVeee6V8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0b6GZyxQywh4Y2Nqe1FQUDd+Bztkqdl/LU6SypwqFB1MEzA+B
 CbaHsG4zOgTirK0bTIFCmBmbbL0/QZXTXFHDHwBzpEOh2CPAmeUvp5qG/JK4668X/QNjxbtAykD
 8RDXHZurnhPc2X8+NuV5CD5q1tKk=
X-Gm-Gg: ASbGncs+lQmfwCbH7Pq+Jml/dhpMFnqDyDRZdLDrslQuoR6w+Cq979wQAXMRtk4gZIc
 1O1EEf50r9LInWz4yX1p7faCFaq9Xjk22xKQ32FZN8SklT+nKE4Ftp5CMJdx4tZftWM6NKFiUMo
 XfyKpqMScq68dsppvCFW3P
X-Google-Smtp-Source: AGHT+IFsKM4SwlHcHAqI93o6LX5eVmvP60jHJkaKXXFf09vtRVqDaqjp++7kfmVIDfCN4TiGj/BBGOqa2OYaD6AqCDI=
X-Received: by 2002:a05:6a20:d817:b0:1f5:7cb4:b713 with SMTP id
 adf61e73a8af0-2148c0f6340mr4688620637.19.1746623265625; Wed, 07 May 2025
 06:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
 <CAOMZO5CK11wByq3BL9XZgvfFv1_kp94CNFMYDaEJ=WxcEFATJQ@mail.gmail.com>
In-Reply-To: <CAOMZO5CK11wByq3BL9XZgvfFv1_kp94CNFMYDaEJ=WxcEFATJQ@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 7 May 2025 15:07:34 +0200
X-Gm-Features: ATxdqUFtN2tIUuHmsB_NiGnAxikFEfXFsc3gynQ1WlFKNFdiLvGY_6sLmBCbXaI
Message-ID: <CAH9NwWeBKXbFkCydXq9mupAosVFS+Wvazq_Bmkt9D4CJNP5YNQ@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Fix flush sequence logic
To: Fabio Estevam <festevam@gmail.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org, 
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

> Hi Tomeu,
>
> On Wed, May 7, 2025 at 8:22=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.ne=
t> wrote:
> >
> > We should be comparing the last submitted sequence number with that of
> > the address space we may be switching to.
> >
> > And we should be using the latter as the last submitted sequence number
> > afterwards.
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>
> Does this need a Fixes tag?

Yes - based on the READ_ONCE(..) line, it should be
Fixes: 27b67278e007 ("drm/etnaviv: rework MMU handling")

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
