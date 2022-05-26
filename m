Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD70E535119
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 16:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BB310E1C1;
	Thu, 26 May 2022 14:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D68F10E1C1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 14:58:59 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f83983782fso18133397b3.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 07:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sfTa8XVvRW1iQz8Afci7PUrunTxrM+3anYqi5ZHWbgU=;
 b=NASTEjcWoY+Y/UljW8w6M11A180yLttIP2cuwdIWDRfzq0/OIEaMjtg9SD0ljU+oi9
 wlgYuL1eiB4YBhbIpJREawZ4EMbl8v/NJJ91gOZGTTOZj9TLgGSWSbJBBu14L/lGz3kj
 RNYTjYMK/NyO6AA7IMuWhJ51P9UkgXgwcGSI96fUhWDsJM0epg601uG00ct5v7yd2CWf
 AasWjChh1hmr6Z3P/S7XHZAakVJPhEDV2ZJuHTfZRgfiU/d/olvTLouq/q+NDM8unF9W
 cTulodDAvAPHXNl0j8WtMuc3VFY7Y6pZXuP9H7DUgidoe/sKF7Fm+Dhem5MPaeixJspI
 pAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sfTa8XVvRW1iQz8Afci7PUrunTxrM+3anYqi5ZHWbgU=;
 b=eb/Wpx1yM2gEmc0ttJV9UDyKPTCVTqZvlfCUtJIsjvKdnWoceVgd6DFlP9SWDbM01V
 EIrkpl2QkxZIRy3rCq+VqaYbgesA1DFiSQaALDqJThm6PTWZKzPeFxHj7czcFyCw/a0G
 hS77T/h56to0O1Kf9VvOAmDR1O5oBHLDHVhYM8wjTuIh3vS0fgDJeIdLbRfHoEs6roDX
 9t+ik1CaAbKfygphG/4fr8V9xcQMa6p7pyfL6zi/AG4rZbTY0suRn7C1BdHvTYVXOM4M
 xV1gVUE0tOOGuXLv5u7pOoKK+Qr3aenS+Xr+x5ZHFCdepubJXTUIw0zUS2v1jH6jVxWB
 2ApQ==
X-Gm-Message-State: AOAM530YU0XB2R+ThEapx7eYavglS/vJxLQKZrDzdJWsy6C6Ck4UARG0
 N41GNiO4i/HZiO5qsWZ0fvWtK8Xvn7IpJiMvWP1BuQ==
X-Google-Smtp-Source: ABdhPJwcL5Kq+XCXqJAWDizNvQB5UG0yEOnGjmvIi9DnQd8HoR1FQyIb0xaceM+/tDqyPxufoMAx8/OWsgJ3yFWBMnY=
X-Received: by 2002:a05:690c:97:b0:2f1:9582:6685 with SMTP id
 be23-20020a05690c009700b002f195826685mr40735795ywb.395.1653577138433; Thu, 26
 May 2022 07:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220506180216.2095060-1-jason@jlekstrand.net>
 <CAPj87rPwx6tL5NtcmP=589wWCyKvZpFfLveaGtsd2wcyCh-1=A@mail.gmail.com>
 <CAOFGe95eEkhGRiDcSb4mvVry1zMYB36aNYm3XWOKb4NESh7wKQ@mail.gmail.com>
In-Reply-To: <CAOFGe95eEkhGRiDcSb4mvVry1zMYB36aNYm3XWOKb4NESh7wKQ@mail.gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Thu, 26 May 2022 16:59:11 +0200
Message-ID: <CAP+8YyGwEAbsYV_ieDj-vDJYCzhY52yw=iqERJ40PjsPUDHB-Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] dma-buf: Add an API for exporting sync files (v14)
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

Didn't test the latest version of everything, but I can confirm the
UAPI worked fine for what we'd want to use it for with radv.

On Thu, May 26, 2022 at 8:47 AM Jason Ekstrand <jason@jlekstrand.net> wrote=
:
>
> On Wed, May 25, 2022 at 5:02 AM Daniel Stone <daniel@fooishbar.org> wrote=
:
>>
>> On Sat, 7 May 2022 at 14:18, Jason Ekstrand <jason@jlekstrand.net> wrote=
:
>> > This patch series actually contains two new ioctls.  There is the expo=
rt one
>> > mentioned above as well as an RFC for an import ioctl which provides t=
he other
>> > half.  The intention is to land the export ioctl since it seems like t=
here's
>> > no real disagreement on that one.  The import ioctl, however, has a lo=
t of
>> > debate around it so it's intended to be RFC-only for now.
>>
>> Errr, I think we're good with this one now right?
>
>
> Yeah, I dropped the RFC from the patch, just not the description in the c=
over letter, apparently.
>
>>
>> From the uAPI point of view, having looked through the Mesa MR, both are=
:
>> Acked-by: Daniel Stone <daniels@collabora.com>
>
>
> For reference: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/=
4037
>
> Yes, I agree it's gotten sufficient review at this point that I think we =
can call the uAPI reviewed.  I'm good with landing now.  Sorry that took so=
 long but the original version I had only used half of the new API and I wa=
nted to make sure both halves got good testing.
>
> --Jason
>
>
>>
>> Cheers,
>> Daniel
