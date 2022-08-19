Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0742A599ED7
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 17:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DACE10F3BB;
	Fri, 19 Aug 2022 15:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28F910F3BB;
 Fri, 19 Aug 2022 15:55:47 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 h9-20020a9d5549000000b0063727299bb4so3325617oti.9; 
 Fri, 19 Aug 2022 08:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=BcCj1m7KIf5adDuWbKKovxIK0b1svjA3E9fjFS29A+o=;
 b=dVKOGeildqf1O5aKP/wT610XNrQGNA+oIpVRrosLqk6a6FBex7J5AQ2uzynwm5iiAe
 OjVTeQr+sgoYtWavTWBFLXegOsICtcPa27vGiKjvFfXw4jrbRU38eGFCCUf80crfKUbx
 BrXgN0f+1KfiS0iamuAuvNfsGqhP/3Z1MU22tVFVswIGiZWDPu63QhBkgkHTkHg1+D/D
 Lof+7ofYRBIKj+EXAwn0Jd+2TZSjyGjURv7CdPXyYZHhv4efVY+B+SxqZ3yKCo+7/C+B
 wbcyk08SQLKVWg+vB6VTZHrtBHDEVCniY5GCmRFxqzlWXFAUlcKNu1Rt3F7Y+x454p97
 gBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=BcCj1m7KIf5adDuWbKKovxIK0b1svjA3E9fjFS29A+o=;
 b=H0EZP2iXUVjYaKy/8iEMwUrRJ8322klO8u+HmC1FFfGrprlmVMw5hn0l5wElQ7bU/t
 +iRHonmdpboe170e+1+ah5HNm3nJBMi0qM/TDswQEbTpAD6DvlmXrohvjNuFm6cMsns3
 mmjEjDMoQ/RLf1MqSWmTP5+hjd5gHy1HLVvsz0DSQTGk9R2QMO6xhiw1Ij5807/TdQbm
 adp0gVVA+428iPrcaT0jUk1waQ96UdZ1grszs83r1Xc+KqYj00lx7watfJB6xODQghi8
 RJrdhhfdmT4kpw+pEDy5zoVE53rOcirpjV3j1gTIBVClHb151jtK6vhSItWnrNwr6INT
 ouOw==
X-Gm-Message-State: ACgBeo3LnRjQ2bUAjSdkLAuUMYehu8/gVkTLXlG/YHW9OHDpxnLf8jpp
 hIlIHg/0mUcQgYZD/MwLrokMY4WGtEDOcDtZe9s=
X-Google-Smtp-Source: AA6agR5MYRRr45V7zsmVmIbcKqBVpevnWKu/lfOcT6ouAH1aduLN+EWiByU+tRdkgTCa5ollJJemUprGXt7c5VSqxK4=
X-Received: by 2002:a9d:c64:0:b0:636:df4c:e766 with SMTP id
 91-20020a9d0c64000000b00636df4ce766mr3253036otr.12.1660924546778; Fri, 19 Aug
 2022 08:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220811072540.964309-1-lizhenneng@kylinos.cn>
 <b23e4037-2030-32d0-d626-b5a846fcafeb@gmail.com>
 <db2a43da-256d-402e-882b-c05436d4e83b@kylinos.cn>
 <c3c1310b-5e84-e4e9-0df9-3f45c976a508@amd.com>
 <2f38b94b-0965-80f2-5bae-840765ffc4da@kylinos.cn>
 <cc30a694-c784-f42c-bab6-b45c70202c56@amd.com>
 <103b4a67-385c-68f5-f40f-39bbc1d9f723@kylinos.cn>
 <ae63a061-3fe0-ae46-51f3-46d80fda3987@amd.com>
In-Reply-To: <ae63a061-3fe0-ae46-51f3-46d80fda3987@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Aug 2022 11:55:35 -0400
Message-ID: <CADnq5_OXWiNPhrN2p1j6sTN7sgG76ioN1544aQYbCvyHbrZ1nA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: add a force flush to delay work when radeon
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>,
 =?UTF-8?B?5p2O55yf6IO9?= <lizhenneng@kylinos.cn>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Aug 19, 2022 at 6:07 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 19.08.22 um 11:34 schrieb =E6=9D=8E=E7=9C=9F=E8=83=BD:
>
> =E5=9C=A8 2022/8/17 19:40, Christian K=C3=B6nig =E5=86=99=E9=81=93:
>
> Am 17.08.22 um 09:31 schrieb =E6=9D=8E=E7=9C=9F=E8=83=BD:
>
>
> =E5=9C=A8 2022/8/15 21:12, Christian K=C3=B6nig =E5=86=99=E9=81=93:
>
> Am 15.08.22 um 09:34 schrieb =E6=9D=8E=E7=9C=9F=E8=83=BD:
>
>
> =E5=9C=A8 2022/8/12 18:55, Christian K=C3=B6nig =E5=86=99=E9=81=93:
>
> Am 11.08.22 um 09:25 schrieb Zhenneng Li:
>
> Although radeon card fence and wait for gpu to finish processing current =
batch rings,
> there is still a corner case that radeon lockup work queue may not be ful=
ly flushed,
> and meanwhile the radeon_suspend_kms() function has called pci_set_power_=
state() to
> put device in D3hot state.
>
>
> If I'm not completely mistaken the reset worker uses the suspend/resume f=
unctionality as well to get the hardware into a working state again.
>
> So if I'm not completely mistaken this here would lead to a deadlock, ple=
ase double check that.
>
>
> We have tested many times, there are no deadlock.
>
>
> Testing doesn't tells you anything, you need to audit the call paths.
>
> In which situation, there would lead to a deadlock?
>
>
> GPU resets.
>
>
> Although flush_delayed_work(&rdev->fence_drv[i].lockup_work) will wait fo=
r a lockup_work to finish executing the last queueing,  but this kernel fun=
c haven't get any lock, and lockup_work will run in another kernel thread, =
so I think flush_delayed_work could not lead to a deadlock.
>
> Therefor if radeon_gpu_reset is called in another thread when radeon_susp=
end_kms is blocked on flush_delayed_work, there could not lead to a deadloc=
k.
>
>
> Ok sounds like you didn't go what I wanted to say.
>
> The key problem is that radeon_gpu_reset() calls radeon_suspend() which i=
n turn calls rdev->asic->suspend().
>
> And this function in turn could end up in radeon_suspend_kms() again, but=
 I'm not 100% sure about that.
>
> Just double check the order of function called here (e.g. if radeon_suspe=
nd_kms() call radeon_suspend() or the other way around).  Apart from that y=
our patch looks correct to me as well.
>
> radeon_gpu_reset will call radeon_suspend, but radeon_suspend will not ca=
ll radeon_suspend_kms, the more detail of call flow, we can see the attache=
ment file: radeon-suspend-reset.png.
>
> Sorry  I may have mistaken your meaning.
>
>
> Ok in this case my memory of the call flow wasn't correct any more.
>
> Feel free to add an Acked-by: Christian K=C3=B6nig <christian.koenig@amd.=
com> to the patch.
>
> Alex should then pick it up for upstreaming.
>
> Thanks,
> Christian.
>
>
> Regards,
> Christian.
>
>
>
> Regards,
> Christian.
>
>
>
> Regards,
> Christian.
>
> Per PCI spec rev 4.0 on 5.3.1.4.1 D3hot State.
>
> Configuration and Message requests are the only TLPs accepted by a Functi=
on in
> the D3hot state. All other received Requests must be handled as Unsupport=
ed Requests,
> and all received Completions may optionally be handled as Unexpected Comp=
letions.
>
> This issue will happen in following logs:
> Unable to handle kernel paging request at virtual address 00008800e000801=
0
> CPU 0 kworker/0:3(131): Oops 0
> pc =3D [<ffffffff811bea5c>]  ra =3D [<ffffffff81240844>]  ps =3D 0000 Tai=
nted: G        W
> pc is at si_gpu_check_soft_reset+0x3c/0x240
> ra is at si_dma_is_lockup+0x34/0xd0
> v0 =3D 0000000000000000  t0 =3D fff08800e0008010  t1 =3D 0000000000010000
> t2 =3D 0000000000008010  t3 =3D fff00007e3c00000  t4 =3D fff00007e3c00258
> t5 =3D 000000000000ffff  t6 =3D 0000000000000001  t7 =3D fff00007ef078000
> s0 =3D fff00007e3c016e8  s1 =3D fff00007e3c00000  s2 =3D fff00007e3c00018
> s3 =3D fff00007e3c00000  s4 =3D fff00007fff59d80  s5 =3D 0000000000000000
> s6 =3D fff00007ef07bd98
> a0 =3D fff00007e3c00000  a1 =3D fff00007e3c016e8  a2 =3D 0000000000000008
> a3 =3D 0000000000000001  a4 =3D 8f5c28f5c28f5c29  a5 =3D ffffffff810f4338
> t8 =3D 0000000000000275  t9 =3D ffffffff809b66f8  t10 =3D ff6769c5d964b80=
0
> t11=3D 000000000000b886  pv =3D ffffffff811bea20  at =3D 0000000000000000
> gp =3D ffffffff81d89690  sp =3D 00000000aa814126
> Disabling lock debugging due to kernel taint
> Trace:
> [<ffffffff81240844>] si_dma_is_lockup+0x34/0xd0
> [<ffffffff81119610>] radeon_fence_check_lockup+0xd0/0x290
> [<ffffffff80977010>] process_one_work+0x280/0x550
> [<ffffffff80977350>] worker_thread+0x70/0x7c0
> [<ffffffff80977410>] worker_thread+0x130/0x7c0
> [<ffffffff80982040>] kthread+0x200/0x210
> [<ffffffff809772e0>] worker_thread+0x0/0x7c0
> [<ffffffff80981f8c>] kthread+0x14c/0x210
> [<ffffffff80911658>] ret_from_kernel_thread+0x18/0x20
> [<ffffffff80981e40>] kthread+0x0/0x210
>   Code: ad3e0008  43f0074a  ad7e0018  ad9e0020  8c3001e8 40230101
>   <88210000> 4821ed21
> So force lockup work queue flush to fix this problem.
>
> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
> ---
>   drivers/gpu/drm/radeon/radeon_device.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/rad=
eon/radeon_device.c
> index 15692cb241fc..e608ca26780a 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1604,6 +1604,9 @@ int radeon_suspend_kms(struct drm_device *dev, bool=
 suspend,
>           if (r) {
>               /* delay GPU reset to resume */
>               radeon_fence_driver_force_completion(rdev, i);
> +        } else {
> +            /* finish executing delayed work */
> + flush_delayed_work(&rdev->fence_drv[i].lockup_work);
>           }
>       }
>
>
>
>
>
