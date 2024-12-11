Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE39ED1B2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5F210EBAA;
	Wed, 11 Dec 2024 16:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bLRrrtAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC79610EBAA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:29:52 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-3004028c714so42722771fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733934591; x=1734539391; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=osyXKRqUv4PvfNbOFslNjYYNVIaS0mD+W2/0VCKnb7I=;
 b=bLRrrtASaxcLUUjSdvR9TYLFMfcKsAZZAqCejj+QHvEdv9Lm2OoMhfLP9dGK4dYQKt
 ipejwWaDPz8//xavWWeylwm1gDCXtRotHpL2ToW9gkMBhQjS8kIzzPG/0g/SlQ8BzoJd
 Wav6yzs6IWKovggUQA6fYvTDJ+IU5sRWL/TckkbUeJsX05ChX0FSWUkQoxOb9FyHGoo8
 R6vNF+OVbW0PaB3oHWNd3ycVhkI+nXqHK/px1ZdPU6VDaIOgwJvEBov1kOpLaFBqKvid
 z+tcol0I3s/IxJkulVw2jO0em87eTJHxk9VE6n4IE2p6IrSflW1vdE/aoWW+9yxIYj+i
 jWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934591; x=1734539391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=osyXKRqUv4PvfNbOFslNjYYNVIaS0mD+W2/0VCKnb7I=;
 b=dx+R+otZyiJ2tUIwPcidoky8RLQECHjs8ipsxSxKRnLiBh5XW4WER+vhTra003zW7E
 Sm/aqvy+ufZxvHHr+209vnT3p0fSfqMs+ND3SWZcMFkr9Ec77rZILzo0EuYHUdQ2X9YK
 0IZiSn2cfLaHrlVhXfpfggohhr6a2WJbOoPR3pE5uhhzMJVtrO2VK8hinW9vztSamdfE
 YW6N6+d/g/GCzt3+4asNELfC7+mj2z/h8TIVaVvpTLtb65P76F2wTJcS3TakNdw7r8Nb
 3AokhvFQg1sKoz8WNRoKx1qXxj881VsP5cvfQ/iCl4VmkHe3z3QjhFNyswUtBqPdvOS6
 n9tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPPMnsVQF7sGGRm4cuSZt8Hwq8T6izOPimDPS96MzHIR98LHBTwNe38wQ49BNMIUPVjtOZ4gtcV6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXqPBI0oBugfIYVpVYGHq+85ilKXHGODSAC8ixyb49FcIW0bLf
 jS8bQpl8AnaPKP7w0O3Lxxekf2nKP1amcQkPDYQz0VwGAMa0mRXUy3REp+73YLaYgDdukNIF7ll
 GzpzCwkMQID9E6NWjTVG8I5+5KT0=
X-Gm-Gg: ASbGnctI1SBjs5xt39ynwOYH350vNUfcqVvsjN27xpGbRWTe7TraZSLKvhWy4jGV5ER
 /b6KfX4aS4OS+eXAoqi6ewiYxAwBhR1Vs1uIuLbateoN1EYRjtGcOww/xE33nTSY2PY0=
X-Google-Smtp-Source: AGHT+IGYVMJ6W3ctYMQ7NC8ivi8cFDMpjmorS0+eO9pMHQYMNw+7Ad3Tj/sNuMyEstWHwoEfJ1/yML70vfdfCV99C5I=
X-Received: by 2002:a05:651c:221a:b0:300:2c9f:ac51 with SMTP id
 38308e7fff4ca-30249e0465cmr677441fa.2.1733934590663; Wed, 11 Dec 2024
 08:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20241210105705.116116-1-festevam@gmail.com>
 <yujvdu3s6v7z7th2lrdscqfxocx2zy2u4owakisvnjppz2udqv@5ok2rcf4exd4>
In-Reply-To: <yujvdu3s6v7z7th2lrdscqfxocx2zy2u4owakisvnjppz2udqv@5ok2rcf4exd4>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 Dec 2024 13:29:39 -0300
Message-ID: <CAOMZO5B3810+4RJsPUtL3ASxqpDd+UmC=GcY6t8-ad7NZXZLjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add compatible
 for AUO G084SN05 V9
To: neil.armstrong@linaro.org, shawnguo@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
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

Hi Neil,

On Wed, Dec 11, 2024 at 6:31=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Dec 10, 2024 at 07:57:04AM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.
> >
> > Add a compatible entry for this LVDS display model.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> > Changes since v1:
> > - Added devicetree@vger.kernel.org on Cc.
> >
> >  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Would it be OK for you if Shawn applies both patches via his i.MX ARM tree?
