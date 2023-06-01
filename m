Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E84771932A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 08:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2245E10E523;
	Thu,  1 Jun 2023 06:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC35010E523
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 06:24:41 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-38c35975545so366855b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 23:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685600681; x=1688192681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zw/PLdejSOOhdMojrkpHv6kbGbIckwHXaTlQeGr0fQA=;
 b=ldqo8I1ZFe1N9p0hUD/y+O96/gkSxwGMtyrtr0vLkXy13ssXgthV1bK8KPN0f3oe/+
 dgBj9tsb07Dx3hLPmjOPiDqhYROD7lFMrT94tbpTawIjR4M+4ISQeq8u16jr1sNOI8ms
 911xAUKSaHDtaUAFnKFjObelcAv1pRsFrmaZjX/5cUjvf5Z7r9G2klQkHStKkuwII29K
 aPquw++85/mFcr++zQ0Nl5TQkBJaOnhPu0XvjOzhJsNp1VGTWVPxOPFqKrQBHaQGejpo
 btpaP7XLh+Apilqt4IAWQk+LDC9H687IGFHz7pJFhjPBQ/s1zwGb2j3Et/uPA7kskoTP
 giiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685600681; x=1688192681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zw/PLdejSOOhdMojrkpHv6kbGbIckwHXaTlQeGr0fQA=;
 b=jmTiAVSpyKbfwV3/z8DWFKLYKydBjl36DLEaTkp6IsobufcgK/Jk489Wv1AemhfDcJ
 hQ8y/dQ4Ra28Fa9BUuCrdo9hrHTuL9jhOFduxk6kZUm9/EUsDFpFPvsLk8bMpuNY2jqv
 BxS8yaoaBuNI0NCPukvEQQ2CzfCSeLsmWtwTIKy3DxWLFA/y0pPn18ibV9aYH/PTCJA3
 yx5c/tzLQhwNPnjqH07xOOMNHDLzfMMqq5MeLrMhxPHXEPLx8YjShZAKHmt+W67gOgU9
 ALum62n2UJ41/MT1zpvpwFOxZvutOy8qx2rybfTeZaO340TWgssNwY9YRx8qJ+IdI53O
 kieA==
X-Gm-Message-State: AC+VfDzMvq7nhwYZvXgriolHAFezZYcarmqKoYwKeyg+mLxIiSNjHzS6
 j0rkQ14bXrid7A6zripX4HnCCm3B89Dyfe5IDNRA1QDw8bA=
X-Google-Smtp-Source: ACHHUZ6LJjG4qXXFiaYpYZ8GJtOrTsePACEr3VJJENMaQvLYozQu9PqneEJspVZPW52eoUXUzA1vwyulg3y+X6KMVW4=
X-Received: by 2002:a05:6808:150a:b0:398:34b9:5200 with SMTP id
 u10-20020a056808150a00b0039834b95200mr7893980oiw.51.1685600680748; Wed, 31
 May 2023 23:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230531184527.1220305-1-l.stach@pengutronix.de>
 <20230531184527.1220305-2-l.stach@pengutronix.de>
In-Reply-To: <20230531184527.1220305-2-l.stach@pengutronix.de>
From: Ying Liu <gnuiyl@gmail.com>
Date: Thu, 1 Jun 2023 14:24:29 +0800
Message-ID: <CAOcKUNX86mqvpsT5LgertJcqdXCftTBEPRnA6dCuBrOXyv+=hQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: lcdif: force modeset when FB format changes
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 1, 2023 at 2:45=E2=80=AFAM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> Force a modeset if the new FB has a different format than the
> currently active one. While it might be possible to change between
> compatible formats without a full modeset as the format control is
> also supposed to be double buffered, the colorspace conversion is
> not, so when the CSC changes we need a modeset.
>
> For now just always force a modeset when the FB format changes to
> properly reconfigure all parts of the device for the new format.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)

LGTM. If the patch shows up in dri-devel patchwork, I can get it, test
it and provide my R-b tag if appropriate.

Regards,
Liu Ying
