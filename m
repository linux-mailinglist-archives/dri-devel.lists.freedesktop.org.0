Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC73806539
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 03:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C418510E65C;
	Wed,  6 Dec 2023 02:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ABC10E65C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 02:43:55 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-58d4968c362so4049760eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 18:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701830634; x=1702435434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lNRQu6oyNFbpjA1kqXJBdLfx5S4cnvF7XoM5bFKpgiE=;
 b=d/uuQzCWqvv5RCCnBpP4qNRIiv5XsO5Vi/2vlRsPzZuYI/6FSlbNqpxjJ8kCPKE7dg
 kPtT75vT5b2MpnhYiw4odKHqNo2NR8rFoL6FQ3LnVGKOvHZQkMp7M6PWyE8VaokoOhAj
 tI0dlFenS3rpvvxBX047XZdHqkMY8p8sU1EF0SsY4vmlMEMZ3oY/OgeE8A7XOE82joFN
 zgW6yxBYwUC/bTyDUhxj1iZIM7CmkgPb+4sxezS8Y17fRu511FlJ8nOeE9wjRMN2PL/h
 KiBnn7kN+o35+8N0f3xdfwS/XStQ7GZPeIzyyBpz5iKKyBU8JSOIrg2K9OZ21IJs1BsM
 SzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701830634; x=1702435434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lNRQu6oyNFbpjA1kqXJBdLfx5S4cnvF7XoM5bFKpgiE=;
 b=ZM4hChCnxt+bObPCH3Sxfj1P9eJB+QteH8PMXN2EIGOjRBWeFqtF0IfomgcxWfjjep
 NYaLzTlGZpyI+yRu1j4YKCimYAY/edsw4xzHH8Ms87boY9Vu7XZPMOAye02Autml/ZUf
 cfOWAek+27FyWyO9CtjiDy/FD8uOGdY/ga5hbtnnR8DqOtpXepOw1gG1KJib1a6te7hP
 bPwTOdcHubhY2M46IWIV4aGIDgLhsZ9Y32Ivp3yVGiogmQgB/b1vRcXFlGOQLzNYL8xg
 czeV8kAbVdfM0rDSBORVK3S1XemNcHBEtcilWRlHAvD1gPhp880/lIhOSInY2jhETPha
 x6gw==
X-Gm-Message-State: AOJu0YxmkWRYMjkqqd8dxr4G7WnD4o1TGU/dZ++d3tHniELt2AHXzjcS
 EqoBy7lxJHImooVWT5r4110nSUQ+6q+7imnV6Tg=
X-Google-Smtp-Source: AGHT+IE/01zByJdpwb+ejZn+nZCVZSSt1bpaoOMo+UVjmmFQ7HJnu/gZHm4xhXcv1QQlqg3R+sMuh9ZUGzC3iN8jO+4=
X-Received: by 2002:a05:6358:5921:b0:16e:5950:67c with SMTP id
 g33-20020a056358592100b0016e5950067cmr474038rwf.25.1701830633962; Tue, 05 Dec
 2023 18:43:53 -0800 (PST)
MIME-Version: 1.0
References: <20231206012831.2179356-1-festevam@gmail.com>
In-Reply-To: <20231206012831.2179356-1-festevam@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 5 Dec 2023 20:43:42 -0600
Message-ID: <CAHCN7xLiSpYN4BF4MGWdUypKf0YLaCsAq1RfSeo1xTOyAiyXkw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: adi,
 adv75xx: Document #sound-dai-cells
To: Fabio Estevam <festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 5, 2023 at 7:28=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> When using audio from ADV7533 or ADV7535 and describing the audio
> card via simple-audio-card, the '#sound-dai-cells' needs to be passed.
>
> Document the '#sound-dai-cells' property to fix the following
> dt-schema warning:
>

Thanks for doing that.

> imx8mn-beacon-kit.dtb: hdmi@3d: '#sound-dai-cells' does not match any of =
the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/display/bridge/adi=
,adv7533.yaml#
>

Acked-by: Adam Ford <aford173@gmail.com>

> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../devicetree/bindings/display/bridge/adi,adv7533.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533=
.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> index 987aa83c2649..e15ae072922e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> @@ -89,6 +89,9 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [ 1, 2, 3, 4 ]
>
> +  '#sound-dai-cells':
> +    const: 0
> +
>    ports:
>      description:
>        The ADV7533/35 has two video ports and one audio port.
> --
> 2.34.1
>
