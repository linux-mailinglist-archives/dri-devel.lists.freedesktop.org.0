Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 813A6851878
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 16:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC8510ED84;
	Mon, 12 Feb 2024 15:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="PdPszgOO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7523D10ED84
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 15:53:01 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7beda6a274bso132847039f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 07:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707753180; x=1708357980;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ga0BKab3mro7xv/pvLTvYj5RDzbbT2tT8OrhfimfXY=;
 b=PdPszgOOUJXLrfVE4c4AINrRJmdMkCrEMoQgGDJ13895V67c0jjaiMij85l3Jigsgz
 1LI+pe3O5VuKPuJKeNVDlN3HlI7M6jDxydAGsa+z0BNCAEzv+u5JiWEAmaOTgDF2IZl6
 Uo5g7/iPzrHWKtl+kBNK/CiDuJoC2bleN28Mk2IsPgvI2Wf761zGq0/qDewbHpXOzjdy
 K3x3vpsgwnLcujiCRh57b2H024jNjS8Xe2oHp+YkgYJLkbP/0pyO6TaC8jTh0+gAmsIS
 THDIIacZbso/k1BwHyowgrN7Y22MV0jI1F8EpowJ+5wv6N9VQgx/zFa2fspF7zng+UuB
 HjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707753180; x=1708357980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ga0BKab3mro7xv/pvLTvYj5RDzbbT2tT8OrhfimfXY=;
 b=oz1GBwsP62xGyFOE2KepNKZTCyZQjatitSCkXp38Bz//elzZhOFGXBsZz7gNeGziEf
 /gYuKj2MuTTdAa7vHjl4r4/KwArzLETHLWkpaN7BCnx5I2a7NjM9b+RW2A5Y6VJKt75h
 imY7kSlf0JEEvP/1GQKTEAjea2o2CvuJa0eB46yNWPtqWwymZMxVfdky0NuGFAiYGLB+
 pYGXWubQ8L/SHLpLxrXDEgyt6rxfcAgkZSZM4k6pNwJiIWOnvEtkTcrJx30z4jYQSB+w
 TbeKioDBJ0ekX4Gfi56o2GZhtwPVmu3ZK8zWEsqRjjgIh//nxNQFWZ2/hCPFZGXDeLBC
 B9+A==
X-Gm-Message-State: AOJu0YwnvmaRDIAF0pIL88GpNsq0G7v2RO1rSkpoOY9gh6jO+b5MDjrU
 WLy+RN8oXjPwE5rrOFaO8Ylk3Oz165b3i+YvkFgfocH8HlSp6+SGp8yTkfVjL3XmAdOgDqYGY2b
 ueB8K1eth1F0XGH9BgJApiI1OB1Pr3PLwwfTj
X-Google-Smtp-Source: AGHT+IFaG5EUEd3w22+15UIe+fR9vs0Mizvgy4uB3bklxmWtpF0mFVHrOZPdEsANkshqajsm1XKOVsyrbwBB5whufrc=
X-Received: by 2002:a5e:8d0b:0:b0:7c4:3b9e:f766 with SMTP id
 m11-20020a5e8d0b000000b007c43b9ef766mr8640816ioj.20.1707753180672; Mon, 12
 Feb 2024 07:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20240212131323.2162161-1-panikiel@google.com>
 <20240212131323.2162161-9-panikiel@google.com>
 <170774854550.294485.3708612918527188826.robh@kernel.org>
In-Reply-To: <170774854550.294485.3708612918527188826.robh@kernel.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Mon, 12 Feb 2024 16:52:49 +0100
Message-ID: <CAM5zL5r69im5OENJa0drmZ=Er=uMgJJUC_d3FemZaLgq12in0A@mail.gmail.com>
Subject: Re: [PATCH 8/9] media: dt-bindings: Add Intel Displayport RX IP
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 conor+dt@kernel.org, airlied@gmail.com, mripard@kernel.org, 
 dinguyen@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 robh+dt@kernel.org, hverkuil-cisco@xs4all.nl, devicetree@vger.kernel.org, 
 ribalda@chromium.org, daniel@ffwll.ch, chromeos-krk-upstreaming@google.com, 
 mchehab@kernel.org, akpm@linux-foundation.org, 
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org
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

On Mon, Feb 12, 2024 at 3:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
>
> On Mon, 12 Feb 2024 13:13:22 +0000, Pawe=C5=82 Anikiel wrote:
> > The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
> > Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> > capture and Multi-Stream Transport. The user guide can be found here:
> >
> > https://www.intel.com/programmable/technical-pdfs/683273.pdf
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > ---
> >  .../devicetree/bindings/media/intel,dprx.yaml | 125 ++++++++++++++++++
> >  1 file changed, 125 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.=
yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/media/intel,dprx.example.dts:28.=
27-28 syntax error
> make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings=
/media/intel,dprx.example.dtb] Error 1
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202402=
12131323.2162161-9-panikiel@google.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>

As with the previous patch, I was missing a #include in the example. I
will include the fix in v2.
