Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52A68629D3
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 10:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E25310E2EB;
	Sun, 25 Feb 2024 09:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BjOTrbvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4239A10E2EB
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 09:01:58 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dcc80d6006aso2139542276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 01:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708851717; x=1709456517;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHOo9UT8MHhr2LgNReIspvnQoZcPsNNtGDWx9q9Wwyw=;
 b=BjOTrbvFpZbkwrWeixvMpvNQIOictULp5yjKLt6HATgz5l1HngOshwLpqYxWztXG0H
 MAoNXotzTuwBeV6oQMk86q81bTDkYaV5AB9fKaSKjnybX4NkwMdPiMQS2nZ+4+18DdHM
 UKCOUN80XL8TJn8K7/NuCAEz76ovwLLdGEBOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708851717; x=1709456517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHOo9UT8MHhr2LgNReIspvnQoZcPsNNtGDWx9q9Wwyw=;
 b=T5B4Rqp/VMhPlJKCPtE2RoTFLGepCkLJgtf8Uw3+AwlD7Ya6jqEC1Qz0n8wYs0IVdd
 ytA5wlyYnvrB5ns/q/TSNxAe0uiJaP2cyjdR3IjfA1tQ7lBp76MPJ35pEPfzPcbrfOeB
 DwJERwaLrxYA9Fpfh3fYdpEpRS/2NkyJnckELqR96h9B7+aqRnzvkNwAgXIgX2FQQDHH
 +SZD8JgQ377EJclUvzgqpYg8gD7kndEQYI4iIeww/fgN8uVsQBJVb5oEpgo6/vAvmPCo
 WPycOkyWyIksPxxz5hycIvcqAXzeTrLxKAPm/8T6jeQtF8OYSm8NjJrGd6u//fGx427P
 sdlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYO8sy7PKXQ+2izjemooeaswJLgo5GsIOyLRM0Q+CjQeliVxO+ydVhq8LHKrF1SnFmqx8ar2LJMASRMVOKhomogIPef0LlXkIqLFpNMZ33
X-Gm-Message-State: AOJu0YzqY2EZ+6DMmJ1qygYRrNL+VUt8yaaS+NkNTTqMUBTgL2ffPpia
 I3D65sCwtoRpQgtCJPperbaczV79rWHBShJ/DyTs63reIZ8w9Sw8j+ZT5d9kH9DxdXL6GP1D9DY
 l6OQ7c/rgFOCtvAFA7qR14s7euUvrR1JUVn3zUw==
X-Google-Smtp-Source: AGHT+IF0+Bvf9OP9uHXcDAr26iDTEvPUt0IA61zwMjEFzJbfATCZMm5QQ6kC4Nnf7g8ZxzPXEFEftfYY0riDIv/CdlM=
X-Received: by 2002:a25:d851:0:b0:dcd:3f82:e803 with SMTP id
 p78-20020a25d851000000b00dcd3f82e803mr2521692ybg.39.1708851716970; Sun, 25
 Feb 2024 01:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20240131092852.643844-1-dario.binacchi@amarulasolutions.com>
 <20240131-gap-making-59055befaf04@spud>
 <494b51fa-0f0e-4c1b-add3-73b5fe0b3c29@foss.st.com>
In-Reply-To: <494b51fa-0f0e-4c1b-add3-73b5fe0b3c29@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 25 Feb 2024 10:01:46 +0100
Message-ID: <CABGWkvr8RQrUf0Uc+e83qDgqmzUT7OBcS4EDr2DFQnavfRTRDQ@mail.gmail.com>
Subject: Re: [drm-drm-misc:drm-misc-next v2] dt-bindings: nt35510: document
 'port' property
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, heiko@sntech.de, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Wed, Feb 14, 2024 at 10:47=E2=80=AFAM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Heiko
>
> On 1/31/24 16:53, Conor Dooley wrote:
> > On Wed, Jan 31, 2024 at 10:28:44AM +0100, Dario Binacchi wrote:
> >> Allow 'port' property (coming from panel-common.yaml) to be used in DT=
S:
> >>
> >>    st/stm32f769-disco-mb1166-reva09.dtb: panel@0: 'port' does not matc=
h any of the regexes: 'pinctrl-[0-9]+'
> >>
> >> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> >
> >>
> >> ---
> >>
> >> Changes in v2:
> >> - Rework the patch to drop errors found by command
> >>    'make DT_CHECKER_FLAGS=3D-m dt_binding_check'.
> >>
> >>   .../devicetree/bindings/display/panel/novatek,nt35510.yaml       | 1=
 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,n=
t35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt355=
10.yaml
> >> index a4afaff483b7..91921f4b0e5f 100644
> >> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.=
yaml
> >> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.=
yaml
> >> @@ -31,6 +31,7 @@ properties:
> >>     vddi-supply:
> >>       description: regulator that supplies the vddi voltage
> >>     backlight: true
> >> +  port: true
> >>
> >>   required:
> >>     - compatible
> >> --
> >> 2.43.0
> >>
>
> Do you plan to take this patch in drm-misc next branch ? As I have a
> dependency with it to merge a DT patch I can take in my tree
> (stm32-next) if you prefer. Let me know.
>
> Cheers
> Alex

It's been some weeks, so a gentle ping seems in order :)

Thanks and regards,
Dario

--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
