Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C076AF044F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 22:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6AA10E65E;
	Tue,  1 Jul 2025 20:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j46g3jw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E93A10E652
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 20:08:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561K6DYR025086
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Jul 2025 20:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=SBwuim71xsjKrmppSOuCTBnyW8diNS3nOYNdmIZw7yQ=; b=j4
 6g3jw/rSNac83Vw5OqjizwBTJSGIxKQuZ7w3pnOTNCo7pLgX2acd//rDyrjkoh5V
 pspMxnT/sGf0AcrdfQIgo+/dv7Fzy0LwYZpdbRrMAmKjsL8d5t7Dee0Y3ER0UT+N
 K1MKYhKu1HeSeH8SwpdT+HImUAh1EHNxeMzhht+6jXk/xo3pJ+X9MirXq35GbTip
 sCWHaCr46ad92JHzbNIkvtOu0iGTQrrKZ1rNqtd1Y6LvztCsVfx4H+SkaiYpLimN
 2Qli46Ngn7QQ4Kb3XAiiRLrAlxoQ5kdXWUygBUHYD++4ROIObq+68LowLDDSJXr+
 xqFLh3KlAIOQc3ELh8ag==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802221n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 20:08:33 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-40b4d900decso3227518b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 13:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751400513; x=1752005313;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SBwuim71xsjKrmppSOuCTBnyW8diNS3nOYNdmIZw7yQ=;
 b=DV6PExmaHRRciyb+x0UZKC4u1/7kY+Cvxzv/xSFZ2uWUVhAVJdKToh7Acf+V0ftsSo
 8AYU4i/pJ+1vl+tvm/90DIZg0wIsYq/+niU+KchahVVAkDcy9Wq9dEH2xE/dqROXwcpm
 H6/1AVsX5AeYGOh+K5CuIMWi28UQGwFHJcOZuuNoQCpI/k/TT4Uq1nbLh89v+3Bd8OTH
 FttRBIWL7Lr8k5hwQr+IaGiQRiQ9hz+N5Zdw3vUQcS6S49f/R+rKE9KuQ8JW3hThqvUX
 zLnJwylWTWEMf2/LFf1QugIBGHDbHZind6pu0/taTcgyXEQ8oaKg5YrPsYunaMv9HCro
 QhvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbL2VPgBPgZJaaT5ijWvvIMhUDkq6AHsrAfU/jJ4Ztu3EefzPhysdIHZ/vjTfaKvCziXpLZfPwvn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs/DRj/xhEAi0UmHRnkCaEer2UdgvYqfKEV5GH+Vvn69AyY7Ha
 BZ2GJ6X7ShfKipf0sTxQJuLrEDrzW7VF8uLCHHgoyzqP7pGKJMUl/KF4LMEZ3OIj8tNkzAz+DIG
 xwcdz38f8zcpBtYb3lkEKLgTFPdCmK99ZupmilynpNUVlCUaLhSbQAlPd6s9C4sw5XTn5664C/K
 1F5ZbvGgB9glJLH8cFQxRo3wKaEGYAB4ytBp5IYONgmEwJmA==
X-Gm-Gg: ASbGnctcfkZbe6+GSKcxgkbpuYlyDNViamw7wxnFs8KMvHr+nw2QuCO6dcZEUkSRNx9
 VRImXH6HeB6f8hjuyDNx2+e1R/5R4K/GgS0Ey3UuuPuv2NsnDKrJ3mFE0ylmAMBBrN91MxSXYvD
 IoSCHnn04A34kBSn3CcbXmOFxzoXKKgHJkqY0=
X-Received: by 2002:a05:6808:1692:b0:406:6825:da34 with SMTP id
 5614622812f47-40b887a1fa4mr41101b6e.16.1751400513020; 
 Tue, 01 Jul 2025 13:08:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTn8ar6KRE7VSflyhqGfSG2T9FoehvwwtG5pZ4XM05mL+wciurGhbrUT94vYFGe4aUoAWlNhJ+C3AxbpY9BTM=
X-Received: by 2002:a05:6808:1692:b0:406:6825:da34 with SMTP id
 5614622812f47-40b887a1fa4mr41070b6e.16.1751400512656; Tue, 01 Jul 2025
 13:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250623184734.22947-1-richard120310@gmail.com>
 <d040e32a-3519-434f-b6ce-1e63345b23c8@linuxfoundation.org>
In-Reply-To: <d040e32a-3519-434f-b6ce-1e63345b23c8@linuxfoundation.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:08:21 -0700
X-Gm-Features: Ac12FXxRhs58jxTt2spO1M6MN1lYbY9HfEItbXNYaAy8DhgQ6MfSeK4lduOTxIw
Message-ID: <CACSVV00YsGaKQZ-Tznb8maJbMih58ZRZEY_Ay3o=vtDXejOhtQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm: Remove dead code in msm_ioctl_gem_submit()
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: I Hsin Cheng <richard120310@gmail.com>, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: gI984mOBovYe_yU3TTUt9n0p-aItWias
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68644042 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=6xGJIMmgAAAA:8 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8 a=tHzW2L1M7Y5U8jh0s88A:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=aWz6Jz32kaLdCzdWRG-w:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: gI984mOBovYe_yU3TTUt9n0p-aItWias
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDE0MCBTYWx0ZWRfX1n9bjfC2yE1P
 iZNciXtJg300Q0QoHfdUzDschYGW5i7wIZBspsdfc9YF9GBhakx4cmcRdDQ2uXnQffZiykdVKs3
 9kaFFWAkyQKGUj1Jgm4x42KQh9vH0QEh4Ac+ZnwQ6b1ZbddHfyotOiTs0EH8p42+fPbkCHKHT1z
 D48W4L+m4Zh6kkOhdgCUAvbxL9tIt1scMGFERMLRuMLbe0H0bfx+E5zNWdmM4+5T4L5AaMnBow3
 ZaFkWjmrRi4/Zki6JJYa/+8vGXpxgXemwwF7K5+by3VAKzbuT6qjv+TnO2Qi86aB6lQQjhjI9PF
 8j/DwCy3kfwEv6KgckZU2gs+CH/ay3/2LJEGO0FtmLXCOSJ6g3RJy0vEE07VozgC/6nMLfKfX/z
 xC7NUmPpoMoxM+pnYnLVr1Q7CwjNZ/I/UTeGjuxjJ6AkXEn2iSI5KKKDYZ15vVPSvI8xLTYE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010140
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 1, 2025 at 12:38=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 6/23/25 12:47, I Hsin Cheng wrote:
> > According to the report of Coverity Scan [1], "sync_file" is going to b=
e
> > NULL when entering the "if" section after "out_post_unlock", so
> > "fput(sync_file->file)" is never going to be exected in this block.
> >
> > [1]: https://scan5.scan.coverity.com/#/project-view/10074/10063?selecte=
dIssue=3D1655089
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> >   drivers/gpu/drm/msm/msm_gem_submit.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index d4f71bb54e84..cba1dc6fe6c6 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -904,8 +904,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, vo=
id *data,
> >   out_post_unlock:
> >       if (ret && (out_fence_fd >=3D 0)) {
> >               put_unused_fd(out_fence_fd);
> > -             if (sync_file)
> > -                     fput(sync_file->file);
>
> Are you sure you want delete these two lines? It might not make
> sense to check sync_file inside if (ret && (out_fence_fd >=3D 0)),
> but it is ncecessary to fput.

fwiw, there is at least about to be a code path where this error
handling is not dead, once the VM_BIND series is merged

BR,
-R

> >       }
> >
> >       if (!IS_ERR_OR_NULL(submit)) {
>
> Check the error paths carefully to see if this is indeed the right fix.
>
> thanks,
> -- Shuah
