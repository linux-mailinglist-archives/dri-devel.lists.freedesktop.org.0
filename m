Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E200A9F568
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7B710E5D6;
	Mon, 28 Apr 2025 16:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N1fjwyKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C112610E5D6;
 Mon, 28 Apr 2025 16:15:53 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-2cc4e4f0ecaso650173fac.2; 
 Mon, 28 Apr 2025 09:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745856953; x=1746461753; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=625Su6G6JIpX11Ojx93m4M2400O4rexIxBDv+Rj6McU=;
 b=N1fjwyKcS3qYk9gXvF8DHJwhIIO08xLma0lppOX0b5/k8Jq79vTxIZQFvQ3nrSkFl9
 33OaFNQ4XJZrXJXAGjXFClVpySCrn0Sy3MwUpGlUWtwj8NV5XsuDsO4vfN24DR3v8Lg9
 Za7hzGGpnD+dBGctaM6WvSxAk4+ORXK7Rem7xPAOrgAI/EER7RmFIbSdhXdYabzfS8rM
 3klaB7MQ6gBHfEXHOyFFukbgQ9cw24XBKT8Gc/PhmF9ZIftH3kSpPP2U8OXCcgmubROt
 p9vmpdoTNYfgNqciuMvqzmcQuAkXGBQhcMd5TkzfF1Kygjc+Ut/zsh9LAVKWdSkF4ykL
 GtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745856953; x=1746461753;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=625Su6G6JIpX11Ojx93m4M2400O4rexIxBDv+Rj6McU=;
 b=Db3M4OkWbM6m44YRIW9NC91R2fV35TwelgyT86UN15eGLYfd9QFk9uwT1we5HmXD1g
 86JQZm1hkhX/id+TyQnfMTzLQ3J0UDbHKPMnKhdeT1t4GepgjohMbHXRo2KGtDO9coWy
 m85I6Ym8d06irdvAlNe1aV8KDqm7eV8kO+uH6QQHYjuQx94ZLafOjwRRrs+9zdeqkSWo
 syFGRPKIr//s8EYnYAvfGL++g+2udZk0OeJPNda7ri6GW9feC0g/UzjWXG3Wz5h/kkMp
 eYzYGSloPD+HqpdeW0EgXStmQjqKLcC+BBzoRHGbjdsZ5+tGbGPqi9/7uy95pjno9qzw
 aeEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKfAx87wIpsZhM8jX3KpichBmVqIyH9jJFnru7BzvbHDNl/SVPfjU26fdBckt1LObg/fM8PB29@lists.freedesktop.org,
 AJvYcCWjKngXGD0H/FFkMbzU18wGmufP2hYKvnssLLkrl84r+Xvg7Jcst2NVZWOSwkDb04XVXCsRN9UosiiF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoAL0aoA1JJD2kKwX3yvbuPch/h3Op90Dg2oDvcCmoQdz777eI
 o0HNCHbu8OtciqAU/QiiDXoz6XoGsJCPWFTyu3OPitRrQl2EDusmSwH/WBNuhsqaqDpIo1i7OuN
 oVucWyTsnxQBeQHqfT1qhCYgTVGA=
X-Gm-Gg: ASbGncuxM1MbWyWNol4iCv21WF6sbYcyCGhgcEDGQJybBagtmwJVsV5/RjmKYL21enr
 j/kK7Ld5x3Kr0vtM2SQtq9txvvz5BU4urHKHZ2luBif8qexjEfWjMVYzDjNIh9sxNtfpdUVl6PH
 naFg9pIppfGVYRRJWTGab/dGccMJGyWpbhuA==
X-Google-Smtp-Source: AGHT+IGdrY1v6ZxJpECxVeTu+uVWa7p+zIj9G2pZJ7AvCvB2bYhWcha0KCFNzd0sQ+to2uZ2ncpldVtKgAZnSiOe5QA=
X-Received: by 2002:a05:6871:3785:b0:296:dded:7d82 with SMTP id
 586e51a60fabf-2d99d87b1e5mr2412837fac.7.1745856952737; Mon, 28 Apr 2025
 09:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250418083129.9739-1-arefev@swemel.ru>
 <PH7PR12MB56852EECD78C11BD15157AF383BB2@PH7PR12MB5685.namprd12.prod.outlook.com>
 <CADnq5_NLEUZget2naQm9bYH1EsrvbhJCGd7yPN+=9Z_kKmUOCw@mail.gmail.com>
 <BL1PR12MB5144467CB7C017E030A4C3E3F7BB2@BL1PR12MB5144.namprd12.prod.outlook.com>
 <9e4700f6-df58-4685-b4fe-6b53fc1c5222@amd.com>
 <CADnq5_O-tqQ4y7sNx0nMD_0aTFO0H7_vVg=umaPXUbBLFmwnJg@mail.gmail.com>
 <9d7392ed-20fd-4237-89bf-483f9930e09e@amd.com>
In-Reply-To: <9d7392ed-20fd-4237-89bf-483f9930e09e@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 28 Apr 2025 12:15:17 -0400
X-Gm-Features: ATxdqUF37oWobmIRsedM_vT_GOu3WjICoWYx2ZpZ4fn-y3KNuXo73_fRHK4QS_c
Message-ID: <CAAxE2A5TYC3L9D0+fqHEUyhWcO0rAJ2RqJWbUx3=1n5JqJMUyg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in list
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, 
 Denis Arefev <arefev@swemel.ru>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chunming Zhou <david1.zhou@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: multipart/alternative; boundary="0000000000007f251d0633d8ff88"
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

--0000000000007f251d0633d8ff88
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

USHRT_MAX seems too low. Traces for workstation apps create 20-30k BOs,
which is not very far from the limit. RADV doesn't suballocate BOs. Neither
GL nor VK has a ilmit on the number of BOs that can be created. The
hypothetical maximum number of BOs that can be allocated on a GPU with 32GB
of addressable memory is 8 million.

Marek

On Mon, Apr 28, 2025 at 10:53=E2=80=AFAM Christian K=C3=B6nig <christian.ko=
enig@amd.com>
wrote:

> On 4/24/25 15:40, Alex Deucher wrote:
> > On Wed, Apr 23, 2025 at 10:29=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 4/22/25 18:26, Deucher, Alexander wrote:
> >>> [Public]
> >>>
> >>>> -----Original Message-----
> >>>> From: Alex Deucher <alexdeucher@gmail.com>
> >>>> Sent: Tuesday, April 22, 2025 9:46 AM
> >>>> To: Koenig, Christian <Christian.Koenig@amd.com>
> >>>> Cc: Denis Arefev <arefev@swemel.ru>; Deucher, Alexander
> >>>> <Alexander.Deucher@amd.com>; David Airlie <airlied@gmail.com>;
> Simona Vetter
> >>>> <simona@ffwll.ch>; Andrey Grodzovsky <andrey.grodzovsky@amd.com>;
> >>>> Chunming Zhou <david1.zhou@amd.com>; amd-gfx@lists.freedesktop.org;
> dri-
> >>>> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; lvc-
> >>>> project@linuxtesting.org; stable@vger.kernel.org
> >>>> Subject: Re: [PATCH v2] drm/amdgpu: check a user-provided number of
> BOs in list
> >>>>
> >>>> Applied.  Thanks!
> >>>
> >>> This change beaks the following IGT tests:
> >>>
> >>> igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy
> @vcn-decoder-create
> >>> igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy
> @vcn-decoder-decode
> >>> igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy
> @vcn-decoder-destroy
> >>> igt@amdgpu/amd_jpeg_dec@amdgpu_cs_jpeg_decode
> >>> igt@amdgpu/amd_cs_nop@cs-nops-with-nop-compute0
> @cs-nop-with-nop-compute0
> >>> igt@amdgpu/amd_cs_nop@cs-nops-with-sync-compute0
> @cs-nop-with-sync-compute0
> >>> igt@amdgpu/amd_cs_nop@cs-nops-with-fork-compute0
> @cs-nop-with-fork-compute0
> >>> igt@amdgpu/amd_cs_nop@cs-nops-with-sync-fork-compute0
> @cs-nop-with-sync-fork-compute0
> >>> igt@amdgpu/amd_basic@userptr-with-ip-dma@userptr
> >>> igt@amdgpu/amd_basic@cs-compute-with-ip-compute@cs-compute
> >>> igt@amdgpu/amd_basic@cs-sdma-with-ip-dma@cs-sdma
> >>> igt@amdgpu/amd_basic@eviction-test-with-ip-dma@eviction_test
> >>> igt@amdgpu/amd_cp_dma_misc@gtt_to_vram-amdgpu_hw_ip_compute0
> >>> igt@amdgpu/amd_cp_dma_misc@vram_to_gtt-amdgpu_hw_ip_compute0
> >>> igt@amdgpu/amd_cp_dma_misc@vram_to_vram-amdgpu_hw_ip_compute0
> >>
> >>
> >> Could it be that we used BO list with zero entries for those?
> >
> > Yes.  Dropping the 0 check fixed them.  E.g.,
> >
> > +       if (in->bo_number > USHRT_MAX)
> > +               return -EINVAL;
>
>
> Feel free to keep my rb on that version as well.
>
> Christian.
>
> >
> > Alex
> >
> >>
> >> Christian.
> >>
> >>>
> >>> Alex
> >>>
> >>>>
> >>>> On Tue, Apr 22, 2025 at 5:13=E2=80=AFAM Koenig, Christian <
> Christian.Koenig@amd.com>
> >>>> wrote:
> >>>>>
> >>>>> [AMD Official Use Only - AMD Internal Distribution Only]
> >>>>>
> >>>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>>
> >>>>> ________________________________________
> >>>>> Von: Denis Arefev <arefev@swemel.ru>
> >>>>> Gesendet: Freitag, 18. April 2025 10:31
> >>>>> An: Deucher, Alexander
> >>>>> Cc: Koenig, Christian; David Airlie; Simona Vetter; Andrey
> Grodzovsky;
> >>>>> Chunming Zhou; amd-gfx@lists.freedesktop.org;
> >>>>> dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org;
> >>>>> lvc-project@linuxtesting.org; stable@vger.kernel.org
> >>>>> Betreff: [PATCH v2] drm/amdgpu: check a user-provided number of BOs
> in
> >>>>> list
> >>>>>
> >>>>> The user can set any value to the variable =E2=80=98bo_number=E2=80=
=99, via the ioctl
> >>>>> command DRM_IOCTL_AMDGPU_BO_LIST. This will affect the arithmetic
> >>>>> expression =E2=80=98in->bo_number * in->bo_info_size=E2=80=99, whic=
h is prone to
> >>>>> overflow. Add a valid value check.
> >>>>>
> >>>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >>>>>
> >>>>> Fixes: 964d0fbf6301 ("drm/amdgpu: Allow to create BO lists in CS
> ioctl
> >>>>> v3")
> >>>>> Cc: stable@vger.kernel.org
> >>>>> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> >>>>> ---
> >>>>> V1 -> V2:
> >>>>> Set a reasonable limit 'USHRT_MAX' for 'bo_number' it as Christian
> >>>>> K=C3=B6nig <christian.koenig@amd.com> suggested
> >>>>>
> >>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 3 +++
> >>>>>  1 file changed, 3 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> >>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> >>>>> index 702f6610d024..85f7ee1e085d 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> >>>>> @@ -189,6 +189,9 @@ int amdgpu_bo_create_list_entry_array(struct
> >>>> drm_amdgpu_bo_list_in *in,
> >>>>>         struct drm_amdgpu_bo_list_entry *info;
> >>>>>         int r;
> >>>>>
> >>>>> +       if (!in->bo_number || in->bo_number > USHRT_MAX)
> >>>>> +               return -EINVAL;
> >>>>> +
> >>>>>         info =3D kvmalloc_array(in->bo_number, info_size, GFP_KERNE=
L);
> >>>>>         if (!info)
> >>>>>                 return -ENOMEM;
> >>>>> --
> >>>>> 2.43.0
> >>>>>
> >>
>
>

--0000000000007f251d0633d8ff88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>USHRT_MAX seems too low. Traces for workstation apps =
create 20-30k BOs, which is not very far from the limit. RADV doesn&#39;t s=
uballocate BOs. Neither GL nor VK has a ilmit on the number of BOs that can=
 be created. The hypothetical maximum number of BOs that can be allocated o=
n a GPU with 32GB of addressable memory is 8 million.</div><div><br></div><=
div>Marek</div></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 28, 2025 at 10:53=E2=80=AF=
AM Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.com">chr=
istian.koenig@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 4/24/25 15:40, Alex Deucher wrote:<br>
&gt; On Wed, Apr 23, 2025 at 10:29=E2=80=AFAM Christian K=C3=B6nig<br>
&gt; &lt;<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blank">chri=
stian.koenig@amd.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 4/22/25 18:26, Deucher, Alexander wrote:<br>
&gt;&gt;&gt; [Public]<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt; From: Alex Deucher &lt;<a href=3D"mailto:alexdeucher@gmail=
.com" target=3D"_blank">alexdeucher@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt; Sent: Tuesday, April 22, 2025 9:46 AM<br>
&gt;&gt;&gt;&gt; To: Koenig, Christian &lt;<a href=3D"mailto:Christian.Koen=
ig@amd.com" target=3D"_blank">Christian.Koenig@amd.com</a>&gt;<br>
&gt;&gt;&gt;&gt; Cc: Denis Arefev &lt;<a href=3D"mailto:arefev@swemel.ru" t=
arget=3D"_blank">arefev@swemel.ru</a>&gt;; Deucher, Alexander<br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:Alexander.Deucher@amd.com" target=3D=
"_blank">Alexander.Deucher@amd.com</a>&gt;; David Airlie &lt;<a href=3D"mai=
lto:airlied@gmail.com" target=3D"_blank">airlied@gmail.com</a>&gt;; Simona =
Vetter<br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:simona@ffwll.ch" target=3D"_blank">s=
imona@ffwll.ch</a>&gt;; Andrey Grodzovsky &lt;<a href=3D"mailto:andrey.grod=
zovsky@amd.com" target=3D"_blank">andrey.grodzovsky@amd.com</a>&gt;;<br>
&gt;&gt;&gt;&gt; Chunming Zhou &lt;<a href=3D"mailto:david1.zhou@amd.com" t=
arget=3D"_blank">david1.zhou@amd.com</a>&gt;; <a href=3D"mailto:amd-gfx@lis=
ts.freedesktop.org" target=3D"_blank">amd-gfx@lists.freedesktop.org</a>; dr=
i-<br>
&gt;&gt;&gt;&gt; <a href=3D"mailto:devel@lists.freedesktop.org" target=3D"_=
blank">devel@lists.freedesktop.org</a>; <a href=3D"mailto:linux-kernel@vger=
.kernel.org" target=3D"_blank">linux-kernel@vger.kernel.org</a>; lvc-<br>
&gt;&gt;&gt;&gt; <a href=3D"mailto:project@linuxtesting.org" target=3D"_bla=
nk">project@linuxtesting.org</a>; <a href=3D"mailto:stable@vger.kernel.org"=
 target=3D"_blank">stable@vger.kernel.org</a><br>
&gt;&gt;&gt;&gt; Subject: Re: [PATCH v2] drm/amdgpu: check a user-provided =
number of BOs in list<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Applied.=C2=A0 Thanks!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This change beaks the following IGT tests:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy@vcn-decod=
er-create<br>
&gt;&gt;&gt; igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy@vcn-decod=
er-decode<br>
&gt;&gt;&gt; igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy@vcn-decod=
er-destroy<br>
&gt;&gt;&gt; igt@amdgpu/amd_jpeg_dec@amdgpu_cs_jpeg_decode<br>
&gt;&gt;&gt; igt@amdgpu/amd_cs_nop@cs-nops-with-nop-compute0@cs-nop-with-no=
p-compute0<br>
&gt;&gt;&gt; igt@amdgpu/amd_cs_nop@cs-nops-with-sync-compute0@cs-nop-with-s=
ync-compute0<br>
&gt;&gt;&gt; igt@amdgpu/amd_cs_nop@cs-nops-with-fork-compute0@cs-nop-with-f=
ork-compute0<br>
&gt;&gt;&gt; igt@amdgpu/amd_cs_nop@cs-nops-with-sync-fork-compute0@cs-nop-w=
ith-sync-fork-compute0<br>
&gt;&gt;&gt; igt@amdgpu/amd_basic@userptr-with-ip-dma@userptr<br>
&gt;&gt;&gt; igt@amdgpu/amd_basic@cs-compute-with-ip-compute@cs-compute<br>
&gt;&gt;&gt; igt@amdgpu/amd_basic@cs-sdma-with-ip-dma@cs-sdma<br>
&gt;&gt;&gt; igt@amdgpu/amd_basic@eviction-test-with-ip-dma@eviction_test<b=
r>
&gt;&gt;&gt; igt@amdgpu/amd_cp_dma_misc@gtt_to_vram-amdgpu_hw_ip_compute0<b=
r>
&gt;&gt;&gt; igt@amdgpu/amd_cp_dma_misc@vram_to_gtt-amdgpu_hw_ip_compute0<b=
r>
&gt;&gt;&gt; igt@amdgpu/amd_cp_dma_misc@vram_to_vram-amdgpu_hw_ip_compute0<=
br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Could it be that we used BO list with zero entries for those?<br>
&gt; <br>
&gt; Yes.=C2=A0 Dropping the 0 check fixed them.=C2=A0 E.g.,<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (in-&gt;bo_number &gt; USHRT_MAX)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
<br>
<br>
Feel free to keep my rb on that version as well.<br>
<br>
Christian.<br>
<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Alex<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Tue, Apr 22, 2025 at 5:13=E2=80=AFAM Koenig, Christian =
&lt;<a href=3D"mailto:Christian.Koenig@amd.com" target=3D"_blank">Christian=
.Koenig@amd.com</a>&gt;<br>
&gt;&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; [AMD Official Use Only - AMD Internal Distribution Onl=
y]<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Reviewed-by: Christian K=C3=B6nig &lt;<a href=3D"mailt=
o:christian.koenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&=
gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; ________________________________________<br>
&gt;&gt;&gt;&gt;&gt; Von: Denis Arefev &lt;<a href=3D"mailto:arefev@swemel.=
ru" target=3D"_blank">arefev@swemel.ru</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; Gesendet: Freitag, 18. April 2025 10:31<br>
&gt;&gt;&gt;&gt;&gt; An: Deucher, Alexander<br>
&gt;&gt;&gt;&gt;&gt; Cc: Koenig, Christian; David Airlie; Simona Vetter; An=
drey Grodzovsky;<br>
&gt;&gt;&gt;&gt;&gt; Chunming Zhou; <a href=3D"mailto:amd-gfx@lists.freedes=
ktop.org" target=3D"_blank">amd-gfx@lists.freedesktop.org</a>;<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" tar=
get=3D"_blank">dri-devel@lists.freedesktop.org</a>; <a href=3D"mailto:linux=
-kernel@vger.kernel.org" target=3D"_blank">linux-kernel@vger.kernel.org</a>=
;<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:lvc-project@linuxtesting.org" target=
=3D"_blank">lvc-project@linuxtesting.org</a>; <a href=3D"mailto:stable@vger=
.kernel.org" target=3D"_blank">stable@vger.kernel.org</a><br>
&gt;&gt;&gt;&gt;&gt; Betreff: [PATCH v2] drm/amdgpu: check a user-provided =
number of BOs in<br>
&gt;&gt;&gt;&gt;&gt; list<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; The user can set any value to the variable =E2=80=98bo=
_number=E2=80=99, via the ioctl<br>
&gt;&gt;&gt;&gt;&gt; command DRM_IOCTL_AMDGPU_BO_LIST. This will affect the=
 arithmetic<br>
&gt;&gt;&gt;&gt;&gt; expression =E2=80=98in-&gt;bo_number * in-&gt;bo_info_=
size=E2=80=99, which is prone to<br>
&gt;&gt;&gt;&gt;&gt; overflow. Add a valid value check.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Found by Linux Verification Center (<a href=3D"http://=
linuxtesting.org" rel=3D"noreferrer" target=3D"_blank">linuxtesting.org</a>=
) with SVACE.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Fixes: 964d0fbf6301 (&quot;drm/amdgpu: Allow to create=
 BO lists in CS ioctl<br>
&gt;&gt;&gt;&gt;&gt; v3&quot;)<br>
&gt;&gt;&gt;&gt;&gt; Cc: <a href=3D"mailto:stable@vger.kernel.org" target=
=3D"_blank">stable@vger.kernel.org</a><br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Denis Arefev &lt;<a href=3D"mailto:aref=
ev@swemel.ru" target=3D"_blank">arefev@swemel.ru</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; V1 -&gt; V2:<br>
&gt;&gt;&gt;&gt;&gt; Set a reasonable limit &#39;USHRT_MAX&#39; for &#39;bo=
_number&#39; it as Christian<br>
&gt;&gt;&gt;&gt;&gt; K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.=
com" target=3D"_blank">christian.koenig@amd.com</a>&gt; suggested<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 3 =
+++<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list=
.c<br>
&gt;&gt;&gt;&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c<br>
&gt;&gt;&gt;&gt;&gt; index 702f6610d024..85f7ee1e085d 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c<br>
&gt;&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c<br>
&gt;&gt;&gt;&gt;&gt; @@ -189,6 +189,9 @@ int amdgpu_bo_create_list_entry_ar=
ray(struct<br>
&gt;&gt;&gt;&gt; drm_amdgpu_bo_list_in *in,<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_amdgpu_bo_=
list_entry *info;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!in-&gt;bo_number || i=
n-&gt;bo_number &gt; USHRT_MAX)<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return -EINVAL;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D kvmalloc_arr=
ay(in-&gt;bo_number, info_size, GFP_KERNEL);<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!info)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -ENOMEM;<br>
&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt; 2.43.0<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;<br>
<br>
</blockquote></div>

--0000000000007f251d0633d8ff88--
