Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC187B5612
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 17:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E62510E2D1;
	Mon,  2 Oct 2023 15:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F2610E2D1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 15:10:17 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso2362998966b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 08:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696259416; x=1696864216;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hGvlZvhZ8IdjmHbBmFirf4UrLKM7z0k+Ew0qRN9Yj8Y=;
 b=OkF8TDn/1XGDipjTTCFjWDugC7WBBmxxyrhYYkxrUjKrjwThzfmPgEIAASKEopB8zY
 VU8IoTmo32lh20Zol2PhIjJ4mYYFQ8+lwdPLtkQq3fcAYpB0Fxs27dZFPOKKVydRsIMo
 4oOoxZIS1ZrRt3cSHFIC0OUrvinjBPSFI3Mrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696259416; x=1696864216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hGvlZvhZ8IdjmHbBmFirf4UrLKM7z0k+Ew0qRN9Yj8Y=;
 b=EcgIL8K7uE0FjEU3ATQG5ul0g/MQFUFBvTVl1bgn302XB54toeVuy3IzdIVLEvHzWh
 VRGu42YChmA5SoA0Fv37gwQ8f5eH5vjUxYDC2OPRywFqeLSXjV97Bqv6rX4M4ySkrVng
 8D59gAjq2TidT88ufGJ1/v4RxJ5Crz/yZK3ngmVT7+EZ1kOhHPZWiM8LpPgTk81OCV7B
 69cwBJ4nNJDtvNF6YnQVRtfc4Gh70YJW1NT5IkkjA4XE1DEck5AIIvjHprPvJXbHGM0e
 +x9fYBEdETMvSxbcTUkpwZ3wl7xGx96p50VA66s3Xz1Y3fUI1dqE8aiNU0yw9s54GOiJ
 /OFA==
X-Gm-Message-State: AOJu0YxvOH8oGRGQCKD4uwnEIYWl8nYHSAPoBlj3BuJuGd3Nm+Er+hrd
 P79vuh7kClsNMyEadNrrWSfJau27t2UMIL8Y6NbnZuuZ
X-Google-Smtp-Source: AGHT+IFVb0HyCdQykM4LHk728yxoMgu+MEZ/3819WQaJaadKOogNq2+/pdsmxyEy2BgD+SMQ3j7WVg==
X-Received: by 2002:a17:907:75c6:b0:9a2:143e:a071 with SMTP id
 jl6-20020a17090775c600b009a2143ea071mr10466077ejc.17.1696259415689; 
 Mon, 02 Oct 2023 08:10:15 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 et19-20020a170907295300b009b29668fce7sm10776385ejc.113.2023.10.02.08.10.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 08:10:15 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4063bfc6c03so119945e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 08:10:15 -0700 (PDT)
X-Received: by 2002:a05:600c:3b87:b0:3f7:3e85:36a with SMTP id
 n7-20020a05600c3b8700b003f73e85036amr105096wms.7.1696259414844; Mon, 02 Oct
 2023 08:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <CACJMzRE=1S-aD4o68WHan7yYQb3zoLTZiUsMJw2B3d91O4D0ng@mail.gmail.com>
 <20230929215041.GC28737@pendragon.ideasonboard.com>
 <CAD=FV=WrA+0VjoSOVFh394W=Utu7ArvDsAV_+BcpptDi4o_TBQ@mail.gmail.com>
 <823b5c4e-6b26-4818-be71-72d36681c70f@Spark>
In-Reply-To: <823b5c4e-6b26-4818-be71-72d36681c70f@Spark>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Oct 2023 08:09:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WH0ff4BU=nOd2fU-noAG4XYejNv=Catojk0ppBfav1dw@mail.gmail.com>
Message-ID: <CAD=FV=WH0ff4BU=nOd2fU-noAG4XYejNv=Catojk0ppBfav1dw@mail.gmail.com>
Subject: Re: ti-sn65dsi86 linux driver using dsi clock source for pll
To: Douglas Cooper <douglas.cooper1@gmail.com>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Sep 30, 2023 at 4:41=E2=80=AFAM Douglas Cooper
<douglas.cooper1@gmail.com> wrote:
>
> Hi Doug
>
> That=E2=80=99s really good feedback. Thanks so much for taking the time t=
o outline that. I=E2=80=99ll keep investigating and dig into those areas yo=
u mentioned.
>
> I should have mentioned I=E2=80=99m also using the chip in conjunction wi=
th a full size dp connector which appears to be supported. Also, besides th=
e pll not locking I=E2=80=99m seeing an issue with the chip reporting there=
 is no display connected when it reads the SN_HPD_DISABLE_REG in the ti_sn_=
bridge_detect function. This seems bizarre considering it reports accuratel=
y when I remove the module and i2cget the value. I was thinking this could =
be a false negative if the driver is actively trying to configure it and it=
=E2=80=99s failing.

Any chance that the disabling of HPD in ti_sn65dsi86_enable_comms() is
messing you up? Do you need to avoid doing that in the case of a full
sized DP?

I've never tried to use it with a full size DP connector, though I
think others have made it work. One thing to note is that when using
sn65dsi86 as a full sized DP the code currently disables the
"scrambler". If you still have control over the hardware, it seems
like it's supposed to be better to pull up the "TEST2" pin and then
add code to the driver to properly enable the right scrambler for DP.


-Doug
