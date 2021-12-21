Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEBF47BE71
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 11:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778D810F489;
	Tue, 21 Dec 2021 10:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F183410F4AF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 10:50:17 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id fo11so12059158qvb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 02:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TzZdj4RX/QXxZrZ1GTU0Kqu/1JYRTtnFGSwn3iVsJlg=;
 b=dXgcxeYccBnxvOokgg5QB22+5nqzF3W549vxLnmbT3fAH/EMs906NbQ2vx3/xz7cwf
 58KzJ7WmMLWHH+D/gWPdusd3S3op6GPJUO9ZZoTGgcX/PWtWb+NuSIKsW3uB0KImW7Td
 miHSx6SmXXWw3h4l6ySU+rzWX4mNwIryvJ9F6QeYBpB3AB+L/lth6bBhOZFVmqYjICMt
 ADRK3/Vv0YWl+rQ0pkC9Z402cZ0UeJ4KYbGC6IUh43ZzdMtGmHKQ5LvGGkLtsDt831/J
 mS9wk+xeaEuhawQA4k8mZpv44asE59qtbq9xZwgUkIo5uc0G6wDWoZmhaEm+P/pfJ8jm
 CHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TzZdj4RX/QXxZrZ1GTU0Kqu/1JYRTtnFGSwn3iVsJlg=;
 b=mE1mOsRzmKT0KMDpdPwzjWQQvAJlNVOsHEGx2FQ6zuPqhEcHk5ioAnWrhdWK7kjBYe
 FwBjXmFtJcpcBvp1AoDwm9IK6thES/A3o7UtjIhxr5Xjhs0uLzp8+UPyS2evIT2Km2Km
 KnrN46DiiEVne0Mfv0PkwKISmKTE2FSEHVhJ2diZFggQKyoHiyyUHHzjrLM5aATx4LKu
 sz0OwfDkBuKJKJhQ79d4d14mH/H0EUwZaLL39swk+r6GXQY8zo7e0JS9bpwiY9yUVmvM
 /TWoPO/aXnZqD3AcR039PrtIe1kKNmqpZg+JS3RDNoKSnGcH55jRaWuHfvvVoUjBMeT2
 v1sQ==
X-Gm-Message-State: AOAM530fzRxLT5YunKwoZngjJu2vyEmiRw6O7Nc6dEnqGjF4cfJcIRgd
 FVDwJe+6XhosU750kBnUBD4fk7tZAAd/t3YnuUB2uA==
X-Google-Smtp-Source: ABdhPJyjCP3r718zG2y9rZym1LLMLwBnbmF9KhPbfuMqZPHscN0Q1b4k3vZAe7XJuxJxP1nL312NQCDnvnIjGTXGHQY=
X-Received: by 2002:a05:6214:d0d:: with SMTP id
 13mr1681130qvh.73.1640083817001; 
 Tue, 21 Dec 2021 02:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20211221101319.7980-1-jose.exposito89@gmail.com>
In-Reply-To: <20211221101319.7980-1-jose.exposito89@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Dec 2021 13:50:06 +0300
Message-ID: <CAA8EJpqJ-tWmb5Ba6XSK59toCtLb3nRRmVH8da4Ud_rrRYytmw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add missing format_mod_supported functions
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, jernej.skrabec@gmail.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-kernel@vger.kernel.org, maxime@cerno.tech, tzimmermann@suse.de,
 sean@poorly.run, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Dec 2021 at 13:13, Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmai=
l.com> wrote:
>
> Hi all,
>
> When setting IN_FORMATS, implementing the
> "drm_plane_funcs.format_mod_supported" function is mandatory to avoid
> exposing a bogus blob.
>
> This patchset adds a bit of documentation and fixes the issue in a
> couple of drivers affected by the bug.
>
> I reviewed all the other drivers and I didn't find more instances of
> the issue.
>
> Jose
>
> Jos=C3=A9 Exp=C3=B3sito (3):
>   drm/plane: Mention format_mod_supported in IN_FORMATS docs
>   drm/msm/mdp4: Add format_mod_supported function
>   drm/sun4i: Add format_mod_supported function
>
>  drivers/gpu/drm/drm_plane.c                | 7 +++++--
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 8 ++++++++

You missed mdp5_plane.c here. But I assume that the proposed fix is
not correct, see my comments on patch 1.

>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c     | 7 +++++++
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c     | 7 +++++++
>  4 files changed, 27 insertions(+), 2 deletions(-)
>
> --
> 2.25.1
>


--=20
With best wishes
Dmitry
