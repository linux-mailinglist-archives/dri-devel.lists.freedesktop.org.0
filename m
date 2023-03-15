Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C686BBE14
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 21:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DEE10E336;
	Wed, 15 Mar 2023 20:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE23510E068
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 20:42:44 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-17aa62d0a4aso7483837fac.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 13:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678912964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sTJ2WQqzCp342VzXKKxKrb6Tcop1tbY216MnndJN7sQ=;
 b=hWgmkRx8RZmNnPKBjbZ3vIInOgxqUkG1Nli4lVeXL5nTKOCfHgWydHCGHT77yqdP2X
 MCaMMT8pGdJBc3FZS8SG6HpIFozsrOGGRKq5L7Kt5rmqKutwucBQXV1SJH4tQ8W5lIRR
 onHgFUXxvpBQstIBiFZNzfLlYd1zCe77tN1gCYOLeRuy9CLKEKzirEogPd0i1gnYDRxo
 w/IqIAYRcw/36WYC/Gw98J+NVF+8HwkE1mST+UlAvOZoar0Nd+r+3xhCl/uWIDUnNiPk
 OpO3sq+Kq2OXpaWeFtrTTIwwqUfY8Bn2ift/OMHZ1pyRYQP+4bhrWJH5oC2b/wxoDpO4
 gdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678912964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sTJ2WQqzCp342VzXKKxKrb6Tcop1tbY216MnndJN7sQ=;
 b=NQqG237Ep/ddnUoKnb1Dx2VeK/lDMKFsTSsQpfJ+FAuH7QopxDVa20hSr4t5Tszrdj
 sIxP3moK+DlkB/jX1VDelgoC8Y7YvWCzwB9sMSXIEnMWXL3ePW0qOu+v8RBSn6QqvAud
 Yk1hk0uUJmZaD30c4C+UpCXuuo+5Q0AIrTeh/GCv4BxyZbxZvifNgQcbXa3Imkr+kjvN
 VZpZ+qwxSyvWZ5xEGifS9I5SBRzZVy+dzaJd/spbXU+JjvBbWQXbD93BkvIuzBoMNp3A
 TFfWGGRxTCC0hV7tP1kBNYSX4yFoWXZ99sRGzi7BE6ZZVKSe90xPVx92rq6LV30btSX3
 dxhQ==
X-Gm-Message-State: AO0yUKUgo9VGt4fc6tl5dVTsxAeP5C9C0OtEx9vREmRngFQ5laYxwjG2
 OfuzIiBS4R1P0oFNsl55SCIxWjKJ4+6hZ/z/K/E=
X-Google-Smtp-Source: AK7set+FReR4XqbWnaRh930lCwNBx9FyHBIZTL6tblJ8yZ1fzNHd3HKWtbe1Xzi8G8WU3RzY9o0cqnRBhGX1FAXRI74=
X-Received: by 2002:a05:6870:7f84:b0:17a:d7c7:a19d with SMTP id
 aw4-20020a0568707f8400b0017ad7c7a19dmr771163oac.5.1678912963104; Wed, 15 Mar
 2023 13:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txaQfHkjs6nWcwBtnYQXtr996dyht7wasJ7QOovjepmAw@mail.gmail.com>
In-Reply-To: <CAPM=9txaQfHkjs6nWcwBtnYQXtr996dyht7wasJ7QOovjepmAw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 15 Mar 2023 13:42:31 -0700
Message-ID: <CAF6AEGtHLwUMU71bciM3HbmRePYYgiW8c07yzu5FXymOfemWjQ@mail.gmail.com>
Subject: Re: enhancing module info to allow grouping of firmwares
To: Dave Airlie <airlied@gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-modules@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023 at 1:35=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> Hey moduly/firmware people,
>
> We are facing a problem in the future of NVIDIA providing giant
> firmwares for their devices that are version locked with unstable
> APIs. Even if they weren't version locked we'd likely have to support
> multiple major versions over time.
>
> Now this becomes a problem because when you generate multiple
> initramfs and stick them into /boot over time the number of firmwares
> MODULE_FIRMWARE will match will increase and dracut will shove them
> all into the initramfs.
>
> I think one way to mitigate that would be to provide some sort of
> grouping of module firmwares that are acceptable, and having dracut
> only pick one from the list to provide in the initramfs (hopefully the
> latest one). That way the driver can provide a list of MODULE_FIRMWARE
> lines and userspace knows they are a group.
>
> I've just little idea how we could expose this via current module
> info, happy to try and come up with an enhanced scheme maybe with a
> fallback to just include all of them but was just wanting to get some
> feedback on whether this was something that anyone has ever considered
> before now.

We have a kind of similar problem with drm/msm and various other SoC
drivers that need fw which is signed with a device or vendor specific
tree.  We've partially solved that with using firmware-name from
devicetree to specify the correct device specific fw needs to be
loaded (ie. something like "qcom/LENOVO/81JL/qcdxkmsuc850.mbn") but
I've no idea how dracut should figure out what fw files should end up
in an initrd

BR,
-R
