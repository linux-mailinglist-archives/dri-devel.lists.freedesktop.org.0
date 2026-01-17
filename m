Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD215D38EE6
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 15:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F63C10E06E;
	Sat, 17 Jan 2026 14:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nSaMfCRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECDA10E06E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 14:04:57 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-34cf1e31f85so1554007a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:04:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768658697; cv=none;
 d=google.com; s=arc-20240605;
 b=TUTp468U/c+zsDC5wDvuEdPc6JAiAgUdOyeiqMicyfEo5Ouvpc6hG3pu7mq0qLbapj
 Q/Md/hb1e/BatyNJ9dNj+l9UAjnItwcoW2Oxn2kQFx5KNO4wSVHJAAe0v0km7HwcnU9W
 lva8hBJhXn7zWF+RCIxlwKZ+Uililim5UKgspzATa4K0FDmjnB3kOk4e5wQH3P3sh5pC
 aMIlkCk2LwM4cL5NEKoi7u7woHala0BNhJ/+8a/YNEOM56ngJsvOG4rD8sRZWL8IkUEk
 5D+WRlEMe68rlSjEYNjgbDZtmPg3oSO/nosNcVhHTuRwFgScc9+9MU6A5RmdxhknmQYC
 j6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=o0zJYKIcOw63QlxDIuh/u4oMuj+/FORjvTxLIWOQ0zw=;
 fh=lXyCz0Uhyc1Fwl7TaHc6YYjqbxo/FoC7nz+iWmZmTUA=;
 b=GspcZM7+2vnXQGgXTkurJUuSIhk8vyBbprhN1MBu495yaYLdEuFMJdejlD9d1NAfbD
 UrX0qeOsyZDOgYLjhL3Fa+PQwRKcPbE7bxsmHApUNxvO51bLN9fjWxBlyVEUeWgsQgiF
 2OA1pEMJqfh1szptioTzjz1kUrS77vUeL1fp77NFMGbGAw2sMxV/g2Wz4bumdjfnqJr5
 yy9MDYMDI9ChtaOGtuNcBk6YgwIzl8/fu+14h/DWfLBAFlyZgJd/YVbPu/fBZdUTl0ck
 6q99hlnoBXctphyj8peyZaJ0RjRNxTCJRclLgzSOP5RxrW1sDfdpYkQoT5pNso1H+EhC
 BxUg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768658697; x=1769263497; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o0zJYKIcOw63QlxDIuh/u4oMuj+/FORjvTxLIWOQ0zw=;
 b=nSaMfCRFHI4wRbL36EWvUCpl/l4CrlA7WYux0SiCyTWvUki4zzUkOEZgFScajRYRST
 tYsBxj6zvZ86QhdyS0ZESpmB86p+QUQ8obZGL88wvorNhAeUeL/eKdQ1s8R/+ecd+zf4
 vGYPL6PJ7ADc3EFjsB+OjlCZgTUp8VCA31jJXym6dGGaXE2XRCYlIbvUqhIVHBZsCnIl
 etDtxUa0V3PzYoc6My27yuZOfuMfJ0Rnk8aY2Xk1F1agqWA/NworsVbsOoMu2xK+30RR
 PQyFzSIIoMXHwS8Ew5QrmH3gVQ6xOhEL5qpHJBH8K5u8NDxg0xpqiEk/IQI6S7lFuRPa
 9vQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768658697; x=1769263497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o0zJYKIcOw63QlxDIuh/u4oMuj+/FORjvTxLIWOQ0zw=;
 b=nJOWcuP2iLUHqSnWuGpKRjzlfqy6J/K5026khhCpfyH4DvgpNSqlNAIqObOf+YifJK
 6QEv2lDjtDTKUy2RGbpxy45jNRHnet/gsPu2PiYTbvRpSVNgfSIKdYLMoBa+B8WVVisM
 SrLFs/FcKfUHCv32RkTOEFuINgbs0G6/sMQQ15pDeCBD8EE9bPCCyGDjDBSoz3PaKWlZ
 0L2tZ6WqYt4AvX7llqvLYZeb8odBYmlI8xTCv+Nbmnx4RO/j0vommerKEn8B7KLJgLLm
 985FxDn/4M8i6VtBtFjmH4gwH3bwyrX8XdL/H5MeBAqL8+2w6r/73F8d3pmS2+36Y8mt
 Zezw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRHTwCDc27ndVTaQtitMXnojLxQ5wEJMnxYvYWyyfCVJLg1djBfq4h9ASWWNtSzjuE3ztHbAdQnnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPMORRs9oPWF5U6zebI9Erf7JllghEk7QN+JniCeziVsb7QW4n
 DDhQ1rBY+ZcsRrJ26nEVg+FryHPDlz40fPxIMbkNPjPpDOPn9C/F5LqQHWzVDZ3IbnBgPSumO8q
 sKA5vrXmhJxOANpnxkWaAIqV/mge35G0=
X-Gm-Gg: AY/fxX6pbJkHK2/3eK84y299D8bblWRxJlAEBrAo7V/92kYBsUcJQBuk3a0ZODghWYl
 UZKyMUv8f1O3e0ANCvcJk5q+usNi5Ye+nMrV2OZJf5H0Ysdr9m5oyareYV+5mbOTwgxJWZohPF4
 NtcSggasWRl53GZpkx6JjpSDB81COA3LB+F8V1XVEn+U5g6myVd3zndjx47lVAee40oQ2Ha/+/+
 9aeAHJtxmOCIn07EADEr1zpZTIdmBWYaVqjP/866Yq1RYXIe+XrEx/ZEdcRYZ+G2zwuHg==
X-Received: by 2002:a17:90b:2e8b:b0:34a:a1dd:1f2a with SMTP id
 98e67ed59e1d1-35272f6cea7mr5369420a91.20.1768658697170; Sat, 17 Jan 2026
 06:04:57 -0800 (PST)
MIME-Version: 1.0
References: <20260113143445.889031-1-xjdeng@buaa.edu.cn>
 <2026011637-statute-showy-2c3f@gregkh>
In-Reply-To: <2026011637-statute-showy-2c3f@gregkh>
From: Xingjing Deng <micro6947@gmail.com>
Date: Sat, 17 Jan 2026 22:04:46 +0800
X-Gm-Features: AZwV_QhMdhXRqpAUPwcrRQXzIqnB78fS_tjtJ65FVa00ZjjEvdH2FAt11GktpJQ
Message-ID: <CAK+ZN9qE7C5E-17hKsoFiBUm8fd7JOLc3oJi=75=8DzBhjWBDA@mail.gmail.com>
Subject: Re: [PATCH v4] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
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
Reply-To: micro6947@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

OK, I have released v5.
Thanks for your help.

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=BA=94 22:47=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jan 13, 2026 at 10:34:45PM +0800, Xingjing Deng wrote:
> > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > reserved memory to the configured VMIDs, but its return value was not
> > checked.
> >
> > Fail the probe if the SCM call fails to avoid continuing with an
> > unexpected/incorrect memory permission configuration
> >
> > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access =
to the DSP")
> > Cc: stable@vger.kernel.org # 6.11-rc1
> > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> >
> > ---
> >
> > v4:
> > - Format the indentation
> > - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72it=
rloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> >
> > v3:
> > - Add missing linux-kernel@vger.kernel.org to cc list.
> > - Standarlize changelog placement/format.
> > - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke=
47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> >
> > v2:
> > - Add Fixes: and Cc: stable tags.
> > - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029=
635-1-xjdeng@buaa.edu.cn/T/#u
> >
> > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> > ---
> >  drivers/misc/fastrpc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index cbb12db110b3..9c41b51d80ee 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -2339,10 +2339,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_dev=
ice *rpdev)
> >                       src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
> >
> >                       err =3D qcom_scm_assign_mem(res.start, resource_s=
ize(&res), &src_perms,
> > -                                 data->vmperms, data->vmcount);
> > +                                                             data->vmp=
erms, data->vmcount);
>
> I'm all for coding style cleanups, but don't mix that into a patch that
> does something else.  Also, please indent this properly, checkpatch
> should complain about this.
>
>
> >                       if (err) {
> >                               dev_err(rdev, "Failed to assign memory ph=
ys 0x%llx size 0x%llx err %d",
> > -                                     res.start, resource_size(&res), e=
rr);
> > +                                             res.start, resource_size(=
&res), err);
>
> Same here, that's not right.
>
> And I don't see the real change here, are you sure you generated this
> properly?  This just looks like coding style cleanups, which do not
> match the changelog text.
>
> thanks,
>
> greg k-h
