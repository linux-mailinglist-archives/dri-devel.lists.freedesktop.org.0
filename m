Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2FD993D91
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 05:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E6510E02A;
	Tue,  8 Oct 2024 03:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IljllP2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9872310E02A;
 Tue,  8 Oct 2024 03:38:23 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53993c115cfso6524438e87.2; 
 Mon, 07 Oct 2024 20:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728358701; x=1728963501; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pjQV5PG9znaGBrtaMHn3b/2H4No4n9NWv2MWFM/8u1s=;
 b=IljllP2LhemnHFBwuyz4NOU6pAX56veUlufzXNCvGxS6jqltjJs1fLRVoO+ugG/A99
 R8/qdEYyZWtcukJzHNpur24jzMchBLGWp/cp5UfDgXEjAi/h1FKcjQeHRRSLe7lbdjU1
 vCFkUusVm8CrRo+YVmJbsBoc7TrkmtGg9ZjsGVF7cg/EJCUom+ElnCsTuknQxhyEMaRa
 0DJtmqDSTu/1y8+mDHIS/OQdzLIcXoqvUOSal+Y4YAbGZiVxvXKmnJVnIq9iQaPBBx0I
 Fyf0X1E07QNDGUvejHz2JcA2yvivU9zwD47B+7kcqwZM/vrLXZzt2L1BR6Y8HhRH8mKJ
 Kt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728358701; x=1728963501;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pjQV5PG9znaGBrtaMHn3b/2H4No4n9NWv2MWFM/8u1s=;
 b=JGO+FtcDnCdK0t9hTqcb4dVVualK44RuB/SfpkYuMPYydrsw7ZW5+ItX3fsifdvhbK
 jHBb3uw8r1KgWq51WY/5BTPbd0hRUJDvFeePiaCNSF8ns9+BKlH50hAjQabEaldXoYsr
 9sYFzJ+Ba+gbSfpxuG49MYyR/JjsRcMjGT+Qey2plNcrjKMtwW2q16gUHyE+iPldJi6C
 weSUEEN1Ho+doDAf0BXkiEpmUem1KsxFp9vNq2Ods6zH/ORZw+8zEP0qL3CsCrOrqG3X
 19iYWu3dGH/43ou/yC7lYtQt2uZ5xRPE/0R5AE8Mb5/uNB+825np2NOmH/80+fMUZOsN
 Nz0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY9MXmLFC9LsGXhot3BUCRP9lpj541mpDJM2hfxRENRCeBrszbO/Dg5cu931hlU4mjNSojpPx6@lists.freedesktop.org,
 AJvYcCVRTv5txnngIqBOTOakjNqs9KdocvlK2L7rIwOKH+lAAdQsCZ1faLqog9OIbCaea0POG3cLCC6Y0Lfs@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9IPeuUmmfKuBf+xmq8to7OR5ISKqZmVFpgDta4gR+sRS3C3cC
 /dHeHaZTkuv9CK56X7MnM5BRKQ5amO8ABP44uY4t0xZrSclE+0NmNezaeO4rjSE1H9ZWEpgtyD1
 67QRRiK5p0jfggvfLTighFzGSs58=
X-Google-Smtp-Source: AGHT+IFsZc1EpKPyldw9Pj60xnYfN/hd9IMOfZUali0NPVvTUoiF3RRl1v9EkanLhvx67ubudnp/8MkDuZJuHGTtcME=
X-Received: by 2002:a05:6512:3b13:b0:536:550e:7804 with SMTP id
 2adb3069b0e04-539ab876df9mr7312477e87.18.1728358701155; Mon, 07 Oct 2024
 20:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241004081618.27599-1-advaitdhamorikar@gmail.com>
 <00761132-75f3-41fd-b571-30b0cbe5565d@amd.com>
 <CADnq5_OKww1YZ1R_OytEMLcNVwdq=-ckc2gqQ+WMyOv6AZ9kqg@mail.gmail.com>
 <007679b9-b7b6-4385-9a2e-2be392cb5f58@amd.com>
 <CAJ7bepLv3Z9RwuxoBS3SfkMjeBkN1LRTjLEjT8Lv4Jdu-CXb6Q@mail.gmail.com>
 <82c60f1b-a52a-4bc7-a635-06198dba0e13@gmail.com>
In-Reply-To: <82c60f1b-a52a-4bc7-a635-06198dba0e13@gmail.com>
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Date: Tue, 8 Oct 2024 09:08:09 +0530
Message-ID: <CAJ7bepJrm9tJJMSZXz0B_94y8817X4oFpwnrTmUHeagOFgVL7g@mail.gmail.com>
Subject: Re: [PATCH-next] Fix unintentional integer overflow
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: "Sundararaju, Sathishkumar" <sasundar@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, leo.liu@amd.com, sathishkumar.sundararaju@amd.com, 
 saleemkhan.jamadar@amd.com, Veerabadhran.Gopalakrishnan@amd.com, 
 sonny.jiang@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, anupnewsmail@gmail.com, 
 "Lazar, Lijo" <lijo.lazar@amd.com>
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

Hi Christian,

I am not sure if I correctly understood what you meant,  just to clarify

When you say this
>No, all of this are numerical problems where not taken into account the
>size of the destination type.

>Saying that all of that are basically just style cleanups which doesn't
>need to be back-ported in any way, so please drop the Fixes: tag.

>And you should probably change the subject line to something like
>"drm/amdgpu: cleanup shift coding style".

Are you just talking about this message?
>> There are a few instances where we can use 1U instead of int as
>> harvest_config uses unsigned int
>>(adev->jpeg.harvest_config & (1 << i)
>> However I think they should be fixed in a separate patch?

Or is it intended for the complete previous "Fix unintentional
overflow" patch as well?
And I should just send a v3 with the two changes?

Thanks and regards,
Advait

On Mon, 7 Oct 2024 at 19:26, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 05.10.24 um 09:05 schrieb Advait Dhamorikar:
> > Hi Sathish,
> >
> >> Please collate the changes together with Lijo's suggestion as well,
> >> "1ULL <<" instead of typecast, there are 3 occurrences of the error in
> >> f0b19b84d391.
> > I could only observe two instances of this error in f0b19b84d391 at:
> > 'mask =3D (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings))=
 - 1;`
> > and `mask |=3D 1 << ((i * adev->jpeg.num_jpeg_rings) + j);`
> >
> > There are a few instances where we can use 1U instead of int as
> > harvest_config uses unsigned int
> > (adev->jpeg.harvest_config & (1 << i)
> > However I think they should be fixed in a separate patch?
>
> No, all of this are numerical problems where not taken into account the
> size of the destination type.
>
> Saying that all of that are basically just style cleanups which doesn't
> need to be back-ported in any way, so please drop the Fixes: tag.
>
> And you should probably change the subject line to something like
> "drm/amdgpu: cleanup shift coding style".
>
> Regards,
> Christian.
>
> >
> > Thanks and regards,
> > Advait
> >
> > On Sat, 5 Oct 2024 at 09:05, Sundararaju, Sathishkumar <sasundar@amd.co=
m> wrote:
> >>
> >>
> >> On 10/4/2024 11:30 PM, Alex Deucher wrote:
> >>> On Fri, Oct 4, 2024 at 5:15=E2=80=AFAM Sundararaju, Sathishkumar
> >>> <sasundar@amd.com> wrote:
> >>>> All occurrences of this error fix should have been together in a sin=
gle patch both in _get and _set callbacks corresponding to f0b19b84d391, pl=
ease avoid separate patch for each occurrence.
> >>>>
> >>>> Sorry Alex, I missed to note this yesterday.
> >>> I've dropped the patch.  Please pick it up once it's fixed up appropr=
iately.
> >> Thanks Alex.
> >>
> >> Hi Advait,
> >> Please collate the changes together with Lijo's suggestion as well,
> >> "1ULL <<" instead of typecast, there are 3 occurrences of the error in
> >> f0b19b84d391.
> >>
> >> Regards,
> >> Sathish
> >>> Thanks,
> >>>
> >>> Alex
> >>>
> >>>> Regards,
> >>>> Sathish
> >>>>
> >>>>
> >>>> On 10/4/2024 1:46 PM, Advait Dhamorikar wrote:
> >>>>
> >>>> Fix shift-count-overflow when creating mask.
> >>>> The expression's value may not be what the
> >>>> programmer intended, because the expression is
> >>>> evaluated using a narrower integer type.
> >>>>
> >>>> Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs=
")
> >>>> Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
> >>>> ---
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_jpeg.c
> >>>> index 95e2796919fc..7df402c45f40 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> >>>> @@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(vo=
id *data, u64 *val)
> >>>>     for (j =3D 0; j < adev->jpeg.num_jpeg_rings; ++j) {
> >>>>     ring =3D &adev->jpeg.inst[i].ring_dec[j];
> >>>>     if (ring->sched.ready)
> >>>> - mask |=3D 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
> >>>> + mask |=3D (u64)1 << ((i * adev->jpeg.num_jpeg_rings) + j);
> >>>>     }
> >>>>     }
> >>>>     *val =3D mask;
>
