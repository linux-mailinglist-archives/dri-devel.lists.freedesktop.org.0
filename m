Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB90340F00
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 21:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4294B6E972;
	Thu, 18 Mar 2021 20:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481EF6E971;
 Thu, 18 Mar 2021 20:25:35 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id y2so2697232qtw.13;
 Thu, 18 Mar 2021 13:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=4zDsIYOprog9B5y3rsUfED+L5wmiaQe7RHCQ6tBNZZ8=;
 b=l1jZXZhJnbHk/Wwj5LUfWeHHf0DsSlc2S/WOkB+XLmMY6hdLdL+m8NaTtl9g+dHJfk
 75seqGteupipnSIxVNSsg2h50hXYGJujoE51lkYPIntTapcp66qruTYST8JXpjUBb7gB
 eh9c7CZ+QAWeFkJfvbofIxhOyhXOPXwIHtmcDOOaldFrvj/6nZcQ5l22keEMoLvtfWJn
 E+ZUr2nLZB0grnAHkstVJjaiUF/LsCcwMAiSYZB2lwYeLVib60DnEh0hGSKGIkkp+f0A
 mwxhZML61fx+/d+F1Rw8BeAcPXRE36sPfo1VoTVadvENNHVhZP2APiiAJmdMFZXz1fLD
 wmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=4zDsIYOprog9B5y3rsUfED+L5wmiaQe7RHCQ6tBNZZ8=;
 b=OVltufNq4+iazBAN/nrGqyMZ7hSyR0FafSnks835FiywRrWV6BVrotYpvAS7pRVgcm
 JEDTEzdQWv7ugBHkmhxXH2mM5TU6EAK1SvmvHTx6anMHyYfMEbXLsKqRv3iqLqLY8JcV
 HjrvcA8CuDf4GZgr+sqO3JKBdTuX03x2g5LjTqkMyyONdjv/DhXQ4/X/Xu++n+eYcWJe
 5Fvlbr3GalptNNiU1YIvxywdsE5zmmww2PCFANdwCh0XdCixRcSMPVYeiFya7iKWK1//
 3HUwtcXMJ+c6piMY+wHJcgDE88KkDZ6jENDvLDA0dI87FP/GjzIYn2CZQdLbekH0Fnul
 SZ8g==
X-Gm-Message-State: AOAM532jkGusIigGCW+i+vGbQcM1UwK1SDWJnglNaLJx1XKzxdFSMn3F
 Al6fcBDU8rHvHd8vlodMgs8=
X-Google-Smtp-Source: ABdhPJy60341IL5RWjf5A6iwP0gHji6vmLyFby3B/GlwxwH3tTQoRECSPYLm0elA8Vvxk0A8+4rxUg==
X-Received: by 2002:ac8:4288:: with SMTP id o8mr5398682qtl.28.1616099134481;
 Thu, 18 Mar 2021 13:25:34 -0700 (PDT)
Received: from Gentoo ([37.19.198.63])
 by smtp.gmail.com with ESMTPSA id o23sm2225968qtm.31.2021.03.18.13.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 13:25:33 -0700 (PDT)
Date: Fri, 19 Mar 2021 01:55:21 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix a typo
Message-ID: <YFO3MYXwWbXwTgUh@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 John Clements <John.Clements@amd.com>,
 "Chen, Guchun" <guchun.chen@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Likun Gao <Likun.Gao@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Jiansong Chen <Jiansong.Chen@amd.com>,
 Huang Rui <ray.huang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20210318113308.1345-1-unixbhaskar@gmail.com>
 <b09b524c-1f3d-6231-29b9-f0eac3e77293@infradead.org>
 <CADnq5_OsrHGxmXeuEiV06qas7jJ0pvExqdrw-PmqpKvWi=0jOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnq5_OsrHGxmXeuEiV06qas7jJ0pvExqdrw-PmqpKvWi=0jOg@mail.gmail.com>
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
Cc: Tao Zhou <tao.zhou1@amd.com>, "Chen, Guchun" <guchun.chen@amd.com>,
 Dave Airlie <airlied@linux.ie>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jiansong Chen <Jiansong.Chen@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 John Clements <John.Clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1320007242=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1320007242==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+2goaO1049LHQE3k"
Content-Disposition: inline


--+2goaO1049LHQE3k
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 14:12 Thu 18 Mar 2021, Alex Deucher wrote:
>On Thu, Mar 18, 2021 at 2:08 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 3/18/21 4:33 AM, Bhaskar Chowdhury wrote:
>> >
>> > s/traing/training/
>> >
>> > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> > ---
>> >  drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>> > index c325d6f53a71..db18e4f6cf5f 100644
>> > --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>> > +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>> > @@ -661,7 +661,7 @@ static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
>> >
>> >       if (ops & PSP_MEM_TRAIN_SEND_LONG_MSG) {
>> >               /*
>> > -              * Long traing will encroach certain mount of bottom VRAM,
>> > +              * Long training will encroach certain mount of bottom VRAM,
>>
>>                                                        amount
>> I think.
>
>Yeah, I think it should read something like:
>
>Long training will encroach a certain amount on the bottom of VRAM;
>save the content from the bottom VRAM to system memory
>before training, and restore it after training to avoid
>VRAM corruption.
>
>Alex
>
>>
>> >                * saving the content of this bottom VRAM to system memory
>> >                * before training, and restoring it after training to avoid
>> >                * VRAM corruption.

Thanks.

>> > --
>> > 2.26.2
>> >
>>
>>
>> --
>> ~Randy
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--+2goaO1049LHQE3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBTtzEACgkQsjqdtxFL
KRWHLwf/VSZrbhSYrWqEci3El3RuohOKQEWAKRxH+FBbFypej1MzZn8MFVI0gjwm
Iw/qmk2zZcGiSrJR1BXSOFA4audev1Iy0x5I91rju+AZASDVWNk2CZHOZOIuR9GL
VC3MbDxIGZK/pcVAOOpqjXvvUZoToKQQvwcr2DzSpFnZ7rE3ULbrpopfWBfpS5rv
Giu5Arlad9IVrqZ/Kp0Hksiv8xRUL3y/+WbSDa9vsyj/hKMm2HrqJvISxFN7UDnX
sPd/5X+41RtOD2Q9PWY03gBfQshTXEkTZnNk5/bxoRecydv1XA1OXGMMTNdkKDzx
kwE39qzDORe0xeFLJv+gBIiQW73cvw==
=xiDw
-----END PGP SIGNATURE-----

--+2goaO1049LHQE3k--

--===============1320007242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1320007242==--
