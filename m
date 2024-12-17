Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F99F4BDD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 14:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7AA10E16E;
	Tue, 17 Dec 2024 13:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DPP4tAbp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2766910E16E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 13:20:19 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so5843678e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 05:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734441617; x=1735046417; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FstVX3CFTj+42MS9laftTg04okRbVpQOvmKeh9DZMHs=;
 b=DPP4tAbpCzmPfTViiZOTZemJH8UL+TMmbfUmPR0NSUWqpXWe1SwBjK38/cQ+PU8n/t
 Q7HTOi0PKhVuJ5rIeLylFax65tPd5RoUiMbBUy2upDnGJ12/B7HhWrLpjV8aH7nFoOCF
 PM6xTpqi8e1FXpy9QdBuhkEiTboKvq9dlXAMse4NZlVml3EZA3pj3hQAbsodfMB9YbvB
 TnDYouu4iIkAcScY1+KnzyXtehqWO3C4cAsjNGeBsXORdUrchxh+TSuw1nBO3O9EYa3E
 0ad7p5pjlo0bUS3mm5T4SQoxv0Zypl69fyK5JTu+OG9cZAEA/7VQ6wouVsDpC+6csvDL
 f31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734441617; x=1735046417;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FstVX3CFTj+42MS9laftTg04okRbVpQOvmKeh9DZMHs=;
 b=w9o4ZPevqZaI0S+mwsqkzj7QxnhnSEF4htrxScNp1/YND/EdE9EtNwKAEOTUMAnOIl
 m+FFELWXzyX92tmP4B+nw15CqPmA9QEjUGb3tcDHQO73++snVOV7L9gUm8iEGD2QcxAz
 5PcRoatll+CYGpNTpaICk1VxcocQtZ4aLfAlHf4b7SjGpxknFJarJav9VC/hGCuEZENb
 ZKpA7r0wJHRdgOlRa3d4vd+9Ii6Unh72VoktzhzS28SzT4MCz2W7mmq3lXYA57isodaa
 KhD5BPEAaMBLGz6HxJSOXPAvSQUCq+ePaX2Q4hsAtKOyYG8PWDbjsUVCAXyS0q/B4dXb
 Yg5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3qcmqVFAi+UdgaSGJ/wDbF3PqX7phPdOQ7cQ9vram3OiqtLJOkYJcyIO7mQiE38/ng021JMRnO2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhZYV0EtAxhk1LP8JDijsWCjqbruloalbdQyyxCfkvw0MPXhi4
 qt9no1LVp0H3tfZAEGYiuHpU/2urmEpWHpG1cM1ie3J4vLr36/aORL6pgW7i+IaWLYp0uzaLGVA
 TGW/tF2oZIxeo99BY1FELflPmLsA=
X-Gm-Gg: ASbGncuvi+3bgiiIJ0ePDPphSe3/9YjzrWG8q6XmCCaUmfSTrYvl9R9LUXBmxe4XvQ+
 M999dZvj74oKYwmh7/2kmM4rwKk3XR37LWZcA7mSlaW6kD+043aqw5zcgmz0CidG0sZrU
X-Google-Smtp-Source: AGHT+IFFx90kPbpMheYOE1177/QLK8nVCI4FlXeGlR99M7gIZTPd37rucl/NQo0g2oJIrbiMhA6SNFXFscAA/m2smM4=
X-Received: by 2002:ac2:4e04:0:b0:540:21d6:d681 with SMTP id
 2adb3069b0e04-54090555494mr4984098e87.19.1734441616935; Tue, 17 Dec 2024
 05:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20241101135406.47836-1-festevam@gmail.com>
 <173073495749.210192.9138587910771237679.robh@kernel.org>
In-Reply-To: <173073495749.210192.9138587910771237679.robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 17 Dec 2024 10:20:05 -0300
Message-ID: <CAOMZO5BVLpQecZH4vvmRi=KfZ=MvCgUQ_tUKjvUzMGO=wTU-MA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, shawnguo@kernel.org, imx@lists.linux.dev, 
 conor+dt@kernel.org, Fabio Estevam <festevam@denx.de>, 
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
 krzk+dt@kernel.org, a.fatoum@pengutronix.de, dri-devel@lists.freedesktop.org, 
 andreas@kemnade.info, marex@denx.de
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

Rob,

On Mon, Nov 4, 2024 at 12:42=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Fri, 01 Nov 2024 10:54:04 -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > imx6sx.dtsi has the following lcdif entries:
> >
> > compatible =3D "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> >
> > This causes the following dt-schema warning:
> >
> > ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
> >
> > To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
> > 'fsl,imx6sx-lcdif' fallback.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>

> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Can you apply 1/3 and 2/3?
