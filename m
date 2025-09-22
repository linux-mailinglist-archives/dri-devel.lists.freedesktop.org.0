Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639E8B9276C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 19:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5920A10E4E3;
	Mon, 22 Sep 2025 17:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLzOmE8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA29010E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 17:43:06 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHZdRX008992
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 17:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=yvgfuHDV+HWhZSkeRI3Pt16FGGVNb4TH8n/i52MwM3g=; b=NL
 zOmE8wLavsRCLuc23aBaXpL2n2/OVgmwBBv6t621NZ5i8QAv4DyQXNpZDfBkSxkv
 kqYkAfXhhKjyB+H84X0C0t7dzDZa5Wxxr+Qv6MnA4i1YOb7S/OfC8aqfgeeDVh4S
 B0/rqTZ0bGjre7DO2yP+EmLTFzVSdYkl19zmcd0o0Ka/+26N8TM3mD4/Nurzhpe1
 9s4Xyfb2ufV96986hxhPMrW8Qo1xd+m1XiabZoXUBlH+x9uR9FUDf4SR1mwB9B45
 sROklBhbOITms1+jG7dmJtC9EsekRsY2qkcElHhGQGn53cF3i8UfHRH/7MpEEn7j
 PFPk9aK3fWZ08Vo5329Q==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bb07g0pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 17:43:06 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-314f332e0d2so7866586fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758562985; x=1759167785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yvgfuHDV+HWhZSkeRI3Pt16FGGVNb4TH8n/i52MwM3g=;
 b=B7HmR8OILUqbaOY0bSekdTu7Vi7yxS41/MwKxcGgfVIxaDH879tIVEvSasWlL3TIoL
 dmsK8HPuxY4X7KdLXV0bLZ24n5w9n+B4caUb2mjcmXdqLf242McXqbttvz51b1LSi0tn
 hFHddkO5cWxZFRSaF88NdbeoXq4TwYXZthMwlYhw/IXKGMOMiweFPQEeqw/xdvFTq6lf
 erKdkCg6z9i++6di3kCjHkMVkiBVOEd0GPs9YELJ1RjA0vdrAIpYqnGp66wNLBlJJGxU
 +d1wle10uIEFgxbdU0pd4Zi9jZ8pmh2ssAfyAg7l1hWPxiVw/AnGgg+9AUBzHHLmqpvo
 CXeA==
X-Gm-Message-State: AOJu0Ywd75RfNwJgUeOtFLpw3Nca/4WVSWnSjlRy7eiopnCCIgA1QwTb
 0vECKQ3hmX8QER14h1uwk/1y2mDA83emEJRR3R6w7NLOa3gszvtpBRmyQvBYV0LvWeB21RAwvqz
 qDvxtCJinYLMSP9GUG3Y0O0Y3btVFznifcnp7MpWcPZ7W1X9pbcTAxFZFNP04IyULddDGnDdC6I
 kruchvPFP+Oneqo50yF/vDl630iM3NSpDHvRxSwyNbQlWTPQ==
X-Gm-Gg: ASbGncsmW+U+sUd9/NBA6NL02iso4LSTBcV8eC38Rvjywi1M3ASk/xkR0sZ5ccprBW5
 d8L0N8BUFW90A53l//QmxA2e1Ci1B/+RvvngN1IOh9Y9fnjkewIhkaoGrT/2D/Bbu/IpEEx+5o7
 NDvfwcMp3cq8QG87ANlQp271ldO5bFFG0Q+EBIhUwXE4EqTAX4rAgx
X-Received: by 2002:a05:6871:81d0:10b0:341:2ab5:7d22 with SMTP id
 586e51a60fabf-3412ab6015amr1979919fac.24.1758562985145; 
 Mon, 22 Sep 2025 10:43:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoA0dMMXMZm/AwIu12gzZ7XmnuJ5PuUXYj+3q/9EpvzDPqD1DiF05WqIK0oiCIbqyqRkx3oOwvpZFzNPaRND0=
X-Received: by 2002:a05:6871:81d0:10b0:341:2ab5:7d22 with SMTP id
 586e51a60fabf-3412ab6015amr1979906fac.24.1758562984723; Mon, 22 Sep 2025
 10:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
 <20250723190852.18394-2-robin.clark@oss.qualcomm.com>
 <aNF6N8u1VIFSTaRM@linaro.org>
 <CACSVV033oJodLUS2cwTVeMc9Y3o4np3UgDyX=T8caspRk3--4g@mail.gmail.com>
 <aNF9TGkEfYqfegrR@linaro.org>
In-Reply-To: <aNF9TGkEfYqfegrR@linaro.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 10:42:52 -0700
X-Gm-Features: AS18NWDhKnn8QaJQZWfqnPyi5wz3R825ji-5IThInATomz4gWftXC54tqlmJrZg
Message-ID: <CACSVV015U3=KpZqxzH7ySO=ok8k-0ff_-Yzc33SK_Smj1c-4-A@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=HJnDFptv c=1 sm=1 tr=0 ts=68d18aaa cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=rTF-Ql69s_4GWFK6w8YA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: c8_dQC5FTt8kq9DDNqiGptzkvDzpl9Ge
X-Proofpoint-GUID: c8_dQC5FTt8kq9DDNqiGptzkvDzpl9Ge
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE3MiBTYWx0ZWRfX8gAkI+vrVyBp
 G5xcfRw2XkgLmiCY+zEvXgg65x9t26HlrUfD1dTMxERj9/QbAprMJA+UZQXnZ6yCtJnUomS+3ib
 jY3ivcKWJohyIo29t7VoAndl8ceBjBQFPm6AAZl+b+I/jLEmSNZP3iCp9SQbnPMyRdlOcjdsReX
 K6ISaBtgIraNxgshnXKbkBKOaK1amzuf4Fb41PjyDigx+3l8k/qPNxCY+TIvy//NMJsf5eKrBAn
 9m7kyRXgCFnfPhR6iXt0bbWLz34VTMGu8WSkaGCC8smW+syQKiOopfRoelDZEQBO6NMrpFvdM2w
 +fPfXfBEW3JCIylOD/iMn2eH3+EwTML25ddFFDFbDZV+8pFvykKlOb9rW8F3jzODZqSio0BIxMo
 +Qu5ovgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220172
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

On Mon, Sep 22, 2025 at 9:46=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Mon, Sep 22, 2025 at 09:41:07AM -0700, Rob Clark wrote:
> > On Mon, Sep 22, 2025 at 9:33=E2=80=AFAM Stephan Gerhold
> > <stephan.gerhold@linaro.org> wrote:
> > > On Wed, Jul 23, 2025 at 12:08:49PM -0700, Rob Clark wrote:
> > > > If we hit an error path in GEM obj creation before msm_gem_new_hand=
le()
> > > > updates obj->resv to point to the gpuvm resv object, then obj->resv
> > > > still points to &obj->_resv.  In this case we don't want to decreme=
nt
> > > > the refcount of the object being freed (since the refcnt is already
> > > > zero).  This fixes the following splat:
> > > >
> > > >    ------------[ cut here ]------------
> > > >    refcount_t: underflow; use-after-free.
> > > >    WARNING: CPU: 9 PID: 7013 at lib/refcount.c:28 refcount_warn_sat=
urate+0xf4/0x148
> > > >    Modules linked in: uinput snd_seq_dummy snd_hrtimer aes_ce_ccm s=
nd_soc_wsa884x regmap_sdw q6prm_clocks q6apm_lpass_da>
> > > >     qcom_pil_info i2c_hid drm_kms_helper qcom_common qcom_q6v5 phy_=
snps_eusb2 qcom_geni_serial drm qcom_sysmon pinctrl_s>
> > > >    CPU: 9 UID: 1000 PID: 7013 Comm: deqp-vk Not tainted 6.16.0-rc4-=
debug+ #25 PREEMPT(voluntary)
> > > >    Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN53WW 08/02/2024
> > > >    pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--=
)
> > > >    pc : refcount_warn_saturate+0xf4/0x148
> > > >    lr : refcount_warn_saturate+0xf4/0x148
> > > >    sp : ffff8000a2073920
> > > >    x29: ffff8000a2073920 x28: 0000000000000010 x27: 000000000000001=
0
> > > >    x26: 0000000000000042 x25: ffff000810e09800 x24: 000000000000001=
0
> > > >    x23: ffff8000a2073b94 x22: ffff000ddb22de00 x21: ffff000ddb22dc0=
0
> > > >    x20: ffff000ddb22ddf8 x19: ffff0008024934e0 x18: 000000000000000=
a
> > > >    x17: 0000000000000000 x16: ffff9f8c67d77340 x15: 000000000000000=
0
> > > >    x14: 00000000ffffffff x13: 2e656572662d7265 x12: 7466612d6573752=
0
> > > >    x11: 3b776f6c66726564 x10: 00000000ffff7fff x9 : ffff9f8c67506c7=
0
> > > >    x8 : ffff9f8c69fa26f0 x7 : 00000000000bffe8 x6 : c0000000ffff7ff=
f
> > > >    x5 : ffff000f53e14548 x4 : ffff6082ea2b2000 x3 : ffff0008b86ab08=
0
> > > >    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008b86ab08=
0
> > > >    Call trace:
> > > >     refcount_warn_saturate+0xf4/0x148 (P)
> > > >     msm_gem_free_object+0x248/0x260 [msm]
> > > >     drm_gem_object_free+0x24/0x40 [drm]
> > > >     msm_gem_new+0x1c4/0x1e0 [msm]
> > > >     msm_gem_new_handle+0x3c/0x1a0 [msm]
> > > >     msm_ioctl_gem_new+0x38/0x70 [msm]
> > > >     drm_ioctl_kernel+0xc8/0x138 [drm]
> > > >     drm_ioctl+0x2c8/0x618 [drm]
> > > >     __arm64_sys_ioctl+0xac/0x108
> > > >     invoke_syscall.constprop.0+0x64/0xe8
> > > >     el0_svc_common.constprop.0+0x40/0xe8
> > > >     do_el0_svc+0x24/0x38
> > > >     el0_svc+0x54/0x1d8
> > > >     el0t_64_sync_handler+0x10c/0x138
> > > >     el0t_64_sync+0x19c/0x1a0
> > > >    irq event stamp: 3698694
> > > >    hardirqs last  enabled at (3698693): [<ffff9f8c675021dc>] __up_c=
onsole_sem+0x74/0x90
> > > >    hardirqs last disabled at (3698694): [<ffff9f8c68ce8164>] el1_db=
g+0x24/0x90
> > > >    softirqs last  enabled at (3697578): [<ffff9f8c6744ec5c>] handle=
_softirqs+0x454/0x4b0
> > > >    softirqs last disabled at (3697567): [<ffff9f8c67360244>] __do_s=
oftirq+0x1c/0x28
> > > >    ---[ end trace 0000000000000000 ]---
> > > >
> > > > Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
> > > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_gem.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/ms=
m_gem.c
> > > > index 33d3354c6102..958bac4e2768 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > > > @@ -1114,10 +1114,12 @@ static void msm_gem_free_object(struct drm_=
gem_object *obj)
> > > >               put_pages(obj);
> > > >       }
> > > >
> > > > -     if (msm_obj->flags & MSM_BO_NO_SHARE) {
> > > > +     if (obj->resv !=3D &obj->_resv) {
> > > >               struct drm_gem_object *r_obj =3D
> > > >                       container_of(obj->resv, struct drm_gem_object=
, _resv);
> > > >
> > > > +             WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> > > > +
> > > >               /* Drop reference we hold to shared resv obj: */
> > > >               drm_gem_object_put(r_obj);
> > > >       }
> > >
> > > This patch seems to break something for direct IRIS/video playback us=
ing
> > > dmabuf. I use a simple GStreamer test pipeline for testing IRIS on X1=
E
> > > (on GNOME, in case that matters):
> > >
> > >  $ gst-launch-1.0 filesrc location=3Dbbb_sunflower_2160p_60fps_normal=
.mp4 \
> > >    ! qtdemux name=3Dd d.video_0 ! h264parse ! v4l2h264dec \
> > >    ! capture-io-mode=3Ddmabuf ! waylandsink
> > >
> > > The video plays fine, but if I try to exit (CTRL+C) the display hangs
> > > for a few seconds and then the console is spammed with pretty much
> > > exactly the messages that you tried to fix here. If I revert this pat=
ch,
> > > everything is fine again. It feels like your patch does exactly the
> > > opposite for this use case. :-)
> > >
> > > It seems to run into the WARN_ON you added.
> >
> > Hmm, are we allocating from drm and importing into v4l2, or the other d=
irection?
> >
>
> Is there an easy way to check?

Maybe strace?  But, I think this would help, at least if v4l2 is allocating=
:

- if (obj->resv !=3D &obj->_resv) {
+ if ((msm_obj->flags & MSM_BO_NO_SHARE) && (obj->resv !=3D &obj->_resv)) {

(sorry about gmail mangling the formatting)

BR,
-R

>
> I would need to study the code to be sure, you probably know more about
> this than I do. I just run this command and it always worked so far
> somehow. :-)
>
> Thanks,
> Stephan
