Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95113851871
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 16:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3C810E73D;
	Mon, 12 Feb 2024 15:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="b55YFvcs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA8C10E73D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 15:51:26 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7baa8097064so220830239f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 07:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707753085; x=1708357885;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9CrURRj1kgeVHOJ09dw9bNpmlpnJTIS71/+YJ9slDyw=;
 b=b55YFvcsRBINiBXwoyYMhdELad3UAdFGWKyp2AuMM2ZGMIYEG3KTgzALgD6AcSRHZq
 t0biYgZCLyQ2kjlCvc3a0iW6EP9WEGu0hQ4kma0cBOeBUK/Y0Nw1GW9zIuY0RFudFqsR
 KnoYXqqaupTeHZbj2lA01tYfD7h1u6wmuHHgDwTNG1EEaZ3gLLoGDvAo1jb7TfHOGghO
 XbcJpJuHS+MSCp4YCF3VQ/FR/IfWKGgHaJVZI+hUybjKfCUuTfdLYxbnJ+ZELygqK2tP
 L/+jd42jHGnrN+LKYrRhVlejlX1QBqKsgwiO+iT/OoFuiKCrxj/qeHG+NoS47Sr0YdO6
 Mksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707753085; x=1708357885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CrURRj1kgeVHOJ09dw9bNpmlpnJTIS71/+YJ9slDyw=;
 b=LH31eGpuTivxwpVWcStqxUANXOhGTTJCc02LxkU1Z2iBsDoYuEy3MVcm8PJZ4n8/LQ
 lKKHoA75TMBnE3bL5n06O7iWFt4ETenxVJjJyQKJ0CaXrpoybBgh8csBSzZP8TSVASQ8
 O4bVO5BnLHJeRxiqvNH5ExfRJ3k0+zvaNwrPNR+HRcBlh2aPkQaXjWb3xROKV68skzaq
 K0tQqdQBnit3IA+u/4a7VKycIdUlhDiZSPYRQqyMQkZC2H76zX1vpAm6OUHKMt3pmhJb
 PcV7oJYxv5ukLX+gp0SJCbfVMd7x8eE8MewgPaXPUUFEcKo5nKeRaqsTCregGEnT3WAG
 d2zQ==
X-Gm-Message-State: AOJu0Yx/ZTneGo3JF/Xerdrh1JC35RQCcbmDVN9cnlS4wIpKpunPB5Wx
 s0wlHNXNsmOzvERSPqnB9VMT3C/guqeLnGd0Rtqm3TK6vTr2GA7Q2THmAeTKsMWGr4/popjKHcA
 eSlOGZWaWr2IudemylEk83i3G8bEmq8EXwEgA
X-Google-Smtp-Source: AGHT+IF4XWpo6trnD/hLTaZqecOY8VBPzcdUAPevFQVBcwQrHB7XjKhGtpeRKxncyFpZQb70F6+pazsovg8kIEz3Ijs=
X-Received: by 2002:a05:6602:179b:b0:7c4:3510:92f with SMTP id
 y27-20020a056602179b00b007c43510092fmr7761730iox.12.1707753085037; Mon, 12
 Feb 2024 07:51:25 -0800 (PST)
MIME-Version: 1.0
References: <20240212131323.2162161-1-panikiel@google.com>
 <20240212131323.2162161-8-panikiel@google.com>
 <170774854498.294434.14234480400138512065.robh@kernel.org>
In-Reply-To: <170774854498.294434.14234480400138512065.robh@kernel.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Mon, 12 Feb 2024 16:51:14 +0100
Message-ID: <CAM5zL5qx1sw=NSWE7gv3E80MCMJ4=tvc44WDAnBrfsJ2qQB3iw@mail.gmail.com>
Subject: Re: [PATCH 7/9] media: dt-bindings: Add Chameleon v3 framebuffer
To: Rob Herring <robh@kernel.org>
Cc: chromeos-krk-upstreaming@google.com, tzimmermann@suse.de, 
 maarten.lankhorst@linux.intel.com, hverkuil-cisco@xs4all.nl, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 mchehab@kernel.org, ribalda@chromium.org, robh+dt@kernel.org, 
 mripard@kernel.org, airlied@gmail.com, linux-media@vger.kernel.org, 
 akpm@linux-foundation.org, dinguyen@kernel.org, devicetree@vger.kernel.org, 
 daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
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
> On Mon, 12 Feb 2024 13:13:21 +0000, Pawe=C5=82 Anikiel wrote:
> > The Chameleon v3 uses the framebuffer IP core to take the video signal
> > from different sources and directly write frames into memory.
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > ---
> >  .../bindings/media/google,chv3-fb.yaml        | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/google,chv3=
-fb.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/media/google,chv3-fb.example.dts=
:28.27-28 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings=
/media/google,chv3-fb.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_bin=
ding_check] Error 2
> make: *** [Makefile:240: __sub-make] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202402=
12131323.2162161-8-panikiel@google.com
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

I was missing a '#include
<dt-bindings/interrupt-controller/arm-gic.h>' in the dt binding
example. I ran dt_binding_check after adding it and it reports no
errors. I will include the fix in v2.
