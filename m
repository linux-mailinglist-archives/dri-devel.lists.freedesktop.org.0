Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD18AB92420
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 18:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AB810E2EB;
	Mon, 22 Sep 2025 16:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZJpEBex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A6610E2EB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 16:41:22 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M9BASq029098
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 16:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=FtdMeCmECgtpkZBoUWcZZsux9z54H4avkx3+Sns9lYE=; b=EZ
 JpEBex/w2gzq9LBLYx9jy3WNa+HFfvxqmPrxEfgiXBoxe3P9YXG7nnc9OYDYFxUl
 uRoYZ4X4JmzRTIKxJHrr0mJKck8meUy5xLwgoQ1NIw6oWYP1F29wxXwV1rEeLKmh
 aCJKVt0ANSEWb0x16fLBuWq+tU6s/8gY+kqx09M+jNTmfFqtTTX1fMzjOJ+kFB42
 8uY0Ue1uXt286mBt6xgEFxG9W8ntHVF+rYdGQHqaGRZhvIqbRYbJ5nYheaK2s8oW
 5dJF6qa1LKBYWml3PK72VcOvLVQuZIGXnl7y9DMl1Ou5SprMEQBbIJpPlb9PB5RE
 dt3EgFOhsUJUGj+qivmA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk1abk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 16:41:20 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-3401e51eed5so1432811fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758559279; x=1759164079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FtdMeCmECgtpkZBoUWcZZsux9z54H4avkx3+Sns9lYE=;
 b=I4Xg9P+JKzf/xJVw1Mf/bXcpj1fmSSMe48RuzUvR94TJYuqDojIi30zz+zGfPPk/fe
 4epacGJbNgHauR8JB3saKS7AovapiYjcKL+CdlMRuyOn+Ch8jRjxjT74qK1313xKieXH
 mwm+8rfDENfXCVYXmJ3GWmXT0SUTQcH41sVoyi46+C91t3ZBCKL3bJ04GJW32yMcakrV
 swYJMCJgS5hm8RuKJ0Ogk98bnu9i2yftML+e4wB6BLoAhg62i7OimtnYAjbCihV/l0dY
 80o5NrdhsFeakPtvHLaQ8m+FiYm1bM/x+HVoRk/u7o2F27k60//UFW6EigwnTuCQiKWR
 rhrQ==
X-Gm-Message-State: AOJu0YyEMYI6MNzrm07F2cGYQ5Aykjt7XQosw31xNqzhW3Kv9To+Qq/l
 ZwSdolJ/GvFrM9eJL5MkwQtmJjZeAXN3oVtu0mLlDfJhzy0QaX1Ib+dQwDYXWK2BOwDyLRBFgbY
 XHUECwDTQk93Wt2+xmqCg4up7gqSG7lF//gayQ66jGWZ+m/P2phraYxhAPfPJV/EP/1Bx2M7pJ/
 M+u22pL0PGtOSH7UVBQrRhizZ30bXH6ew5d3zln4WG+IyNKw==
X-Gm-Gg: ASbGnctzzZF51lUASAtfive3DbKMiLDL120r6AaXnNX9uHNn9aiyRurX3dKVa1VBAyd
 6xU7LwOEE4x3MmJtwC2A5JJgvqLJDMWG3RN0PMD78oY5tLaaYCM//zxYrj0K7fy6rLEhUC6lFzu
 8rb4Ul9wmERgay644ALepv8pXTDeE5BbUb1296AfD71S/vPe2nj17+
X-Received: by 2002:a05:6870:d38b:b0:30b:7d90:1061 with SMTP id
 586e51a60fabf-33bb3aa4fbemr8480153fac.4.1758559279057; 
 Mon, 22 Sep 2025 09:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe00BRr9DREcT9bnPJbN6kAGzJe3/iKh6FfwvzMXGduNQeBkaiYRb6q+zyCg2PVw5QP/cBwl+pQh8UjxkI9I0=
X-Received: by 2002:a05:6870:d38b:b0:30b:7d90:1061 with SMTP id
 586e51a60fabf-33bb3aa4fbemr8480126fac.4.1758559278440; Mon, 22 Sep 2025
 09:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
 <20250723190852.18394-2-robin.clark@oss.qualcomm.com>
 <aNF6N8u1VIFSTaRM@linaro.org>
In-Reply-To: <aNF6N8u1VIFSTaRM@linaro.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 09:41:07 -0700
X-Gm-Features: AS18NWATpoQUy1WuNLcF8PMw4ReuD1LyrV28EHfT8AVJoyhMMAzSx8i4_uG81PA
Message-ID: <CACSVV033oJodLUS2cwTVeMc9Y3o4np3UgDyX=T8caspRk3--4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Fix refcnt underflow in error path
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 0tOByrLRlq-x0gjZwaN3eh5u7QT2L4tG
X-Proofpoint-ORIG-GUID: 0tOByrLRlq-x0gjZwaN3eh5u7QT2L4tG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX6uB+pBiys6V/
 +qTeHEWFdZbAJ4ReSVK3amE5hgq8L1kzvbAlY9QjLsQ1/bHHkM361/u51/WmG+TkYqf3gk5s9M/
 KtEsqeTbAH79wskjuFOFmoABt6rPCMY1qLqLzhza5hYuZ9n7zR26V87jmYrKYLIUPAYZOSVWjXy
 tn+PXGvy9p9zb3lk6KLAkTbpZ9eVlRgyoA9NtvDIZsoLH0iGVwvRR/v89WdoFQLwlhbT1vaIWUJ
 AJp5Q9hqzzBw8YK13QO9sb2h/roP/N3jukjfd77pKr7seBd/1zJu9eUkQOGZhe9ngrGN6+hC/cc
 r9WjYxLqOda0ScDYPWyjBXs9q7Q9pI81gTrkac4Da112euY2XHndBPX7aSE/lchyJbLhWHVP9xB
 NfXWJaKq
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d17c30 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=p0WdMEafAAAA:8 a=R0ktjqI1AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=feDOH3CU73OpSqZLB94A:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
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

On Mon, Sep 22, 2025 at 9:33=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> Hi Rob,
>
> On Wed, Jul 23, 2025 at 12:08:49PM -0700, Rob Clark wrote:
> > If we hit an error path in GEM obj creation before msm_gem_new_handle()
> > updates obj->resv to point to the gpuvm resv object, then obj->resv
> > still points to &obj->_resv.  In this case we don't want to decrement
> > the refcount of the object being freed (since the refcnt is already
> > zero).  This fixes the following splat:
> >
> >    ------------[ cut here ]------------
> >    refcount_t: underflow; use-after-free.
> >    WARNING: CPU: 9 PID: 7013 at lib/refcount.c:28 refcount_warn_saturat=
e+0xf4/0x148
> >    Modules linked in: uinput snd_seq_dummy snd_hrtimer aes_ce_ccm snd_s=
oc_wsa884x regmap_sdw q6prm_clocks q6apm_lpass_da>
> >     qcom_pil_info i2c_hid drm_kms_helper qcom_common qcom_q6v5 phy_snps=
_eusb2 qcom_geni_serial drm qcom_sysmon pinctrl_s>
> >    CPU: 9 UID: 1000 PID: 7013 Comm: deqp-vk Not tainted 6.16.0-rc4-debu=
g+ #25 PREEMPT(voluntary)
> >    Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN53WW 08/02/2024
> >    pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--)
> >    pc : refcount_warn_saturate+0xf4/0x148
> >    lr : refcount_warn_saturate+0xf4/0x148
> >    sp : ffff8000a2073920
> >    x29: ffff8000a2073920 x28: 0000000000000010 x27: 0000000000000010
> >    x26: 0000000000000042 x25: ffff000810e09800 x24: 0000000000000010
> >    x23: ffff8000a2073b94 x22: ffff000ddb22de00 x21: ffff000ddb22dc00
> >    x20: ffff000ddb22ddf8 x19: ffff0008024934e0 x18: 000000000000000a
> >    x17: 0000000000000000 x16: ffff9f8c67d77340 x15: 0000000000000000
> >    x14: 00000000ffffffff x13: 2e656572662d7265 x12: 7466612d65737520
> >    x11: 3b776f6c66726564 x10: 00000000ffff7fff x9 : ffff9f8c67506c70
> >    x8 : ffff9f8c69fa26f0 x7 : 00000000000bffe8 x6 : c0000000ffff7fff
> >    x5 : ffff000f53e14548 x4 : ffff6082ea2b2000 x3 : ffff0008b86ab080
> >    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008b86ab080
> >    Call trace:
> >     refcount_warn_saturate+0xf4/0x148 (P)
> >     msm_gem_free_object+0x248/0x260 [msm]
> >     drm_gem_object_free+0x24/0x40 [drm]
> >     msm_gem_new+0x1c4/0x1e0 [msm]
> >     msm_gem_new_handle+0x3c/0x1a0 [msm]
> >     msm_ioctl_gem_new+0x38/0x70 [msm]
> >     drm_ioctl_kernel+0xc8/0x138 [drm]
> >     drm_ioctl+0x2c8/0x618 [drm]
> >     __arm64_sys_ioctl+0xac/0x108
> >     invoke_syscall.constprop.0+0x64/0xe8
> >     el0_svc_common.constprop.0+0x40/0xe8
> >     do_el0_svc+0x24/0x38
> >     el0_svc+0x54/0x1d8
> >     el0t_64_sync_handler+0x10c/0x138
> >     el0t_64_sync+0x19c/0x1a0
> >    irq event stamp: 3698694
> >    hardirqs last  enabled at (3698693): [<ffff9f8c675021dc>] __up_conso=
le_sem+0x74/0x90
> >    hardirqs last disabled at (3698694): [<ffff9f8c68ce8164>] el1_dbg+0x=
24/0x90
> >    softirqs last  enabled at (3697578): [<ffff9f8c6744ec5c>] handle_sof=
tirqs+0x454/0x4b0
> >    softirqs last disabled at (3697567): [<ffff9f8c67360244>] __do_softi=
rq+0x1c/0x28
> >    ---[ end trace 0000000000000000 ]---
> >
> > Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_ge=
m.c
> > index 33d3354c6102..958bac4e2768 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -1114,10 +1114,12 @@ static void msm_gem_free_object(struct drm_gem_=
object *obj)
> >               put_pages(obj);
> >       }
> >
> > -     if (msm_obj->flags & MSM_BO_NO_SHARE) {
> > +     if (obj->resv !=3D &obj->_resv) {
> >               struct drm_gem_object *r_obj =3D
> >                       container_of(obj->resv, struct drm_gem_object, _r=
esv);
> >
> > +             WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> > +
> >               /* Drop reference we hold to shared resv obj: */
> >               drm_gem_object_put(r_obj);
> >       }
>
> This patch seems to break something for direct IRIS/video playback using
> dmabuf. I use a simple GStreamer test pipeline for testing IRIS on X1E
> (on GNOME, in case that matters):
>
>  $ gst-launch-1.0 filesrc location=3Dbbb_sunflower_2160p_60fps_normal.mp4=
 \
>    ! qtdemux name=3Dd d.video_0 ! h264parse ! v4l2h264dec \
>    ! capture-io-mode=3Ddmabuf ! waylandsink
>
> The video plays fine, but if I try to exit (CTRL+C) the display hangs
> for a few seconds and then the console is spammed with pretty much
> exactly the messages that you tried to fix here. If I revert this patch,
> everything is fine again. It feels like your patch does exactly the
> opposite for this use case. :-)
>
> It seems to run into the WARN_ON you added.

Hmm, are we allocating from drm and importing into v4l2, or the other direc=
tion?

BR,
-R

> Any ideas?
>
> linux-next should have IRIS support for the Slim 7x if you want to try
> this for yourself. Or alternatively, there is a backport for 6.17-rc7 in
> the Linaro arm64-laptops tree: https://gitlab.com/Linaro/arm64-laptops/li=
nux
>
> You can find the test video here:
> https://download.blender.org/demo/movies/BBB/
>
> Thanks,
> Stephan
>
> [  107.430721] ------------[ cut here ]------------
> [  107.435513] WARNING: CPU: 3 PID: 2040 at drivers/gpu/drm/msm/msm_gem.c=
:1127 msm_gem_free_object+0x1f8/0x264 [msm]
> [  107.630472] CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Not taint=
ed 6.17.0-rc7 #1 PREEMPT
> [  107.630482] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYP=
E=3D--)
> [  107.630488] pc : msm_gem_free_object+0x1f8/0x264 [msm]
> [  107.676630] lr : msm_gem_free_object+0x138/0x264 [msm]
> [  107.676666] sp : ffff800092a1bb30
> [  107.676668] x29: ffff800092a1bb80 x28: ffff800092a1bce8 x27: ffffbc702=
dbdbe08
> [  107.676676] x26: 0000000000000008 x25: 0000000000000009 x24: 000000000=
00000a6
> [  107.676682] x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087=
e69f200
> [  107.676689] x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 000000000=
0000000
> [  107.676695] x17: 0000000000000000 x16: ffffbc704bd46b80 x15: 0000ffffd=
0959540
> [  107.676701] x14: 0000000000000000 x13: 0000000000000000 x12: 000000000=
0000000
> [  107.676706] x11: ffffbc702e6cdb48 x10: 0000000000000000 x9 : 000000000=
000003f
> [  107.676712] x8 : ffff800092a1ba90 x7 : 0000000000000000 x6 : 000000000=
0000020
> [  107.676718] x5 : ffffbc704bd46c40 x4 : fffffdffe102cf60 x3 : 000000000=
0400032
> [  107.676724] x2 : 0000000000020000 x1 : ffff00087e6978e8 x0 : ffff00087=
e6977e8
> [  107.676731] Call trace:
> [  107.676733]  msm_gem_free_object+0x1f8/0x264 [msm] (P)
> [  107.676771]  drm_gem_object_free+0x1c/0x30 [drm]
> [  107.676816]  drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
> [  107.676852]  drm_gem_object_release_handle+0x5c/0xcc [drm]
> [  107.676886]  drm_gem_handle_delete+0x68/0xbc [drm]
> [  107.788743]  drm_gem_close_ioctl+0x34/0x40 [drm]
> [  107.793553]  drm_ioctl_kernel+0xc0/0x130 [drm]
> [  107.798178]  drm_ioctl+0x360/0x4e0 [drm]
> [  107.802277]  __arm64_sys_ioctl+0xac/0x104
> [  107.806436]  invoke_syscall+0x48/0x104
> [  107.810334]  el0_svc_common.constprop.0+0x40/0xe0
> [  107.815209]  do_el0_svc+0x1c/0x28
> [  107.818662]  el0_svc+0x34/0xec
> [  107.821838]  el0t_64_sync_handler+0xa0/0xe4
> [  107.826173]  el0t_64_sync+0x198/0x19c
> [  107.829971] ---[ end trace 0000000000000000 ]---
> [  107.834789] ------------[ cut here ]------------
> [  107.839587] refcount_t: underflow; use-after-free.
> [  107.844553] WARNING: CPU: 3 PID: 2040 at lib/refcount.c:28 refcount_wa=
rn_saturate+0xf4/0x144
> [  108.052928] CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Tainted: =
G        W           6.17.0-rc7 #1 PREEMPT
> [  108.063491] Tainted: [W]=3DWARN
> [  108.075627] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYP=
E=3D--)
> [  108.082808] pc : refcount_warn_saturate+0xf4/0x144
> [  108.087756] lr : refcount_warn_saturate+0xf4/0x144
> [  108.092704] sp : ffff800092a1bb20
> [  108.096141] x29: ffff800092a1bb20 x28: ffff800092a1bce8 x27: ffffbc702=
dbdbe08
> [  108.103491] x26: 0000000000000008 x25: 0000000000000009 x24: 000000000=
00000a6
> [  108.110852] x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087=
e69f200
> [  108.118222] x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 000000000=
0000006
> [  108.125572] x17: 0000000000000000 x16: ffffbc704ba1eda0 x15: ffff80009=
2a1b6ef
> [  108.132925] x14: 000000000000003a x13: 000000000000003a x12: 000000000=
0000000
> [  108.140280] x11: 00000000000000c0 x10: d2c95932de8ceaa3 x9 : 128386994=
077d608
> [  108.147631] x8 : ffff000840c0c588 x7 : 0000000002ac3ea0 x6 : 000000000=
0000002
> [  108.154990] x5 : 0000000435572e2f x4 : 0000000000000002 x3 : 000000000=
0000010
> [  108.162339] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00084=
0c0b480
> [  108.169697] Call trace:
> [  108.172243]  refcount_warn_saturate+0xf4/0x144 (P)
> [  108.177199]  msm_gem_free_object+0x25c/0x264 [msm]
> [  108.182167]  drm_gem_object_free+0x1c/0x30 [drm]
> [  108.186943]  drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
> [  108.193237]  drm_gem_object_release_handle+0x5c/0xcc [drm]
> [  108.198906]  drm_gem_handle_delete+0x68/0xbc [drm]
> [  108.203867]  drm_gem_close_ioctl+0x34/0x40 [drm]
> [  108.208651]  drm_ioctl_kernel+0xc0/0x130 [drm]
> [  108.213248]  drm_ioctl+0x360/0x4e0 [drm]
> [  108.217319]  __arm64_sys_ioctl+0xac/0x104
> [  108.221464]  invoke_syscall+0x48/0x104
> [  108.225343]  el0_svc_common.constprop.0+0x40/0xe0
> [  108.230207]  do_el0_svc+0x1c/0x28
> [  108.233650]  el0_svc+0x34/0xec
> [  108.236817]  el0t_64_sync_handler+0xa0/0xe4
> [  108.241143]  el0t_64_sync+0x198/0x19c
> [  108.244931] ---[ end trace 0000000000000000 ]---
>
