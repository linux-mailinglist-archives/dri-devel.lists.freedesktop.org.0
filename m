Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C724255BA80
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A1D10EC59;
	Mon, 27 Jun 2022 14:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A47110EC59
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:30:32 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id n10so3533435qkn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 07:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=+cJ3oW5JhP5CUvm7VtdWYx3n1WPkEHSvCw63kv0T4LU=;
 b=zKSz6Fh1HpYzt9lkFd4E5jvmSjpRZNIYbJsVE9KPIGCT8TrvuwD0p98HjFoUKqxI9/
 c1EDzYqPD2Q5jinMHD+OTh0tm2cRoJhw279fQjgZJI8iqyBEeti0R2vTz6GL0vAKTFnw
 z8Qzj7kV8vLHrnNUFgIlfi1kgEy2YfDYtcEOHHG4Kn448ZEFGQAmmLG82T4LOOV1ZI83
 NldkkmZgsCMbxE3QLeNNFI3auIUy3idvVI5U8tQP2r7H6NZNzwU1Y/+hl6apmTacEwwq
 s47xzvu9mphE24bX7TpPAqcFQoJG617eSse6aEU5Zhm2ZKjapJg5EDAnfdKn9VUCbVHX
 EH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=+cJ3oW5JhP5CUvm7VtdWYx3n1WPkEHSvCw63kv0T4LU=;
 b=2MrRUORGKqBfV53HmgC4TX/INb2jVbNYX5YgvUPyET9a63Q3x3Zn32o78S2QwsNITk
 93TaUQ7dyV1my9Y/6LsDEOPjSXlIAI7Dbzx6m3b8GvzHPsriQCWjhTgfJOCUjDgg+JiG
 ycxa6N27mKIVRHomkjjddaFlmukutpWuq/YP9sb4aiEH8XKWqoWewD35/dDsZrE+xfWK
 0wD8uOFHIbhcVSmAEzHzQ1PuZQPg3eem/OcVaOLdJSNgA7MICO6Iq55lXN4Hbhpfq6Q5
 wTOd34CruZHz7iwdZkGBMtVhklbVfw96VTBg6Ust+hYj/4SbQ85duw9JVhatOeZZ4Jle
 c7pw==
X-Gm-Message-State: AJIora/3PiQPTnB/AliZpgt2gw2jsQomXBFrQMGhk4ty+oYsUTM/afDi
 q6UEVzlKwfbJIH+7g9rBDOV+1A==
X-Google-Smtp-Source: AGRyM1shh8VchPY9Xks8fxKysZypOt7C4DGr6K8kbqi9W4sY2Et67+Bx7c+FAJWcc3BX2aQrrTcYVQ==
X-Received: by 2002:a05:620a:4412:b0:6af:2f47:7de2 with SMTP id
 v18-20020a05620a441200b006af2f477de2mr2679155qkp.649.1656340231749; 
 Mon, 27 Jun 2022 07:30:31 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05620a404100b006a6ae636ce0sm9535296qko.131.2022.06.27.07.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 07:30:31 -0700 (PDT)
Message-ID: <b7b053603323ca241caa42cd5a6599b9263b9864.camel@ndufresne.ca>
Subject: Re: DMA-buf and uncached system memory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Lucas Stach <l.stach@pengutronix.de>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Pekka Paalanen <ppaalanen@gmail.com>
Date: Mon, 27 Jun 2022 10:30:30 -0400
In-Reply-To: <e67392e43bfc037db6969297b65b0b6945df8b27.camel@pengutronix.de>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
 <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
 <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
 <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
 <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
 <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
 <0abe475a7b4b04758c03a9d19b228e86d95ac1dd.camel@ndufresne.ca>
 <e67392e43bfc037db6969297b65b0b6945df8b27.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le lundi 27 juin 2022 =C3=A0 16:06 +0200, Lucas Stach a =C3=A9crit=C2=A0:
> Am Montag, dem 27.06.2022 um 09:54 -0400 schrieb Nicolas Dufresne:
> > Le jeudi 23 juin 2022 =C3=A0 11:33 +0200, Lucas Stach a =C3=A9crit=C2=
=A0:
> > > >=20
> > > > See for example on AMD/Intel hardware most of the engines can perfe=
ctly=20
> > > > deal with cache coherent memory accesses. Only the display engines =
can't.
> > > >=20
> > > > So on import time we can't even say if the access can be coherent a=
nd=20
> > > > snoop the CPU cache or not because we don't know how the imported=
=20
> > > > DMA-buf will be used later on.
> > > >=20
> > > So for those mixed use cases, wouldn't it help to have something
> > > similar to the dma_sync in the DMA-buf API, so your scanout usage can
> > > tell the exporter that it's going to do non-snoop access and any dirt=
y
> > > cache lines must be cleaned? Signaling this to the exporter would all=
ow
> > > to skip the cache maintenance if the buffer is in CPU uncached memory=
,
> > > which again is a default case for the ARM SoC world.
> >=20
> > Telling the exporter for every scan is unneeded overhead. If that infor=
mation is
> > made available "properly", then tracking it in attach/detach is suffici=
ent and
> > lightweight.
>=20
> That isn't sufficient. The AMD GPU is a single device, but internally
> has different engines that have different capabilities with regard to
> snooping the caches. So you will likely end up with needing the cache
> clean if the V4L2 buffer is going directly to scanout, which doesn't
> snoop, but if the usage changes to sampling you don't need any cache
> flushes.
>=20
> Also I don't see a big overhead when comparing a kernel internal call
> that tells the exporter that the importer is going to access the buffer
> without snooping and thus needs the cache clean once every frame and
> the need to always clean the cache before DQBUF when a potentially non-
> snooping importer is attached.

Ack, thanks for the information.

>=20
> Regards,
> Lucas
>=20

