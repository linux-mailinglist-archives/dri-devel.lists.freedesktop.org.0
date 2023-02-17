Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15B769AED4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 16:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C97310F019;
	Fri, 17 Feb 2023 15:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6022D10F016
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 15:00:35 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id 10so1564761yba.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 07:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aAJZVe/vV3cZhcoC/T6LPsbBim3Szyhp2HbhCsQ0IWg=;
 b=BRIqLQEbheRuNrQkvbOWnTpYkviefY1N7WqRc2n5d1xhWSnQDAvZSdfzixOnlsbozf
 rL/DtFS+rCH5AEYp2AOqyaEtrx5DHuYhdiyThr9s8UinrUaP4Nz1rt+C8JM1FZB8ibqA
 g1KX21+r7aMkjLS6cZObmFBGyW22lc+4FDcbu9TxUefwmbIzgVva6xJ6d1IP743M0JRf
 3D+SUitLCuNKju7BgcM+j22wxbOVqK14MTsjaUO50co8BLGPp/rsfd2kHXy6pzpKbUDM
 BwUqw2W3aAJo3zTplXP+ij69l/iDZKro+/aFjZ1gTnHGWHEsD39GdX2qw/lbOdoYitoI
 +Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aAJZVe/vV3cZhcoC/T6LPsbBim3Szyhp2HbhCsQ0IWg=;
 b=qn6r0kfzVtlINZcsSnstlO8hq/5svejFrDiizgoSD78Mtx1oKFkZV+Jws7xnRn5B8H
 txIR03EAFV6PJHsofL85qUqpBuauJjwpyN5+Df+fkh/0sGLChAQ84uf6y6us64uBmodc
 WVQYc+4l0CQTWsV0c+/bZVdJE3OIY32TRNCMaX80oVbh760SnJSCYyBK7PtUSB/Yj13h
 3BpcijF8z6CvfZrzKTcSC/wZwL2n6q0PmYjyWK/cIlJSId4VpHSJceN9xHD7koZo0hBJ
 pxwnEXTOER/onio61lwssbY+4UGV4dsd3VgSL8umIV8NILTGJ+t9KzmCPRJXIKn+7TuY
 M2Qw==
X-Gm-Message-State: AO0yUKXMBS8I3doj1DP0cf3vS8K0E1Wvjx2G1RbbqCaztrgJ92GYDl85
 FzwDZtyYXvccrSl2iAFzROfV898y5XWpxug5muAT4A==
X-Google-Smtp-Source: AK7set/396tCXCL3hs7mfmUDKG5gkI6SJ/hiscL7WZo4zg8jYG8Tfo1g8h2dqp6+4echxmfk/EzFden3uzWm4n+qMfo=
X-Received: by 2002:a5b:4c8:0:b0:8d5:5d9d:d088 with SMTP id
 u8-20020a5b04c8000000b008d55d9dd088mr1204549ybp.229.1676646034321; Fri, 17
 Feb 2023 07:00:34 -0800 (PST)
MIME-Version: 1.0
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
 <20230215-sspp-scaler-version-v1-1-416b1500b85b@somainline.org>
 <CAA8EJpq1L32VQ1eQEk2YQWqCwHgdFQfuWPhQx=PmhzXvazLgPA@mail.gmail.com>
 <20230216083119.6ispk2xhahhzn5sx@SoMainline.org>
 <305a468a-d792-4f51-5a7a-bf38b9c685eb@linaro.org>
 <20230216214655.a3ajtegqwattn2rt@SoMainline.org>
In-Reply-To: <20230216214655.a3ajtegqwattn2rt@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Feb 2023 17:00:22 +0200
Message-ID: <CAA8EJpobXPSyEqZQ3zgwSqg6fC7pzQumWR9dDPdmGOemtS-epw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: Read previously-uninitialized SSPP
 scaler version from hw
To: Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 16 Feb 2023 at 23:46, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-02-16 18:34:43, Dmitry Baryshkov wrote:
> > On 16/02/2023 10:31, Marijn Suijten wrote:
> > > On 2023-02-16 04:22:13, Dmitry Baryshkov wrote:
> > >> On Thu, 16 Feb 2023 at 01:02, Marijn Suijten
> > >> <marijn.suijten@somainline.org> wrote:
> > >>>
> > >>> DPU's catalog never assigned dpu_scaler_blk::version leading to
> > >>> initialization code in dpu_hw_setup_scaler3 to wander the wrong
> > >>> codepaths.  Instead of hardcoding the correct QSEED algorithm version,
> > >>> read it back from a hardware register.
> > >>>
> > >>> Note that this register is only available starting with QSEED3, where
> > >>> 0x1002 corresponds to QSEED3, 0x2004 to QSEED3LITE and 0x3000 to QSEED4.
> > >>
> > >> This is not purely accurate. 0x1003 (sdm845) also corresponds to QSEED3.
> > >> I'd say instead that there are several variations of QSEED3 scalers,
> > >> where starting from 0x2004 it is called QSEED3LITE and starting from
> > >> 0x3000 it is called QSEED4.
> > >
> > > Good catch, I'll update that.
> > >
> > >>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > >>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >>> ---
> > >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
> > >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 8 +++++++-
> > >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 3 +++
> > >>>   3 files changed, 10 insertions(+), 3 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > >>> index ddab9caebb18..96ce1766f4a1 100644
> > >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > >>> @@ -324,11 +324,9 @@ struct dpu_src_blk {
> > >>>   /**
> > >>>    * struct dpu_scaler_blk: Scaler information
> > >>>    * @info:   HW register and features supported by this sub-blk
> > >>> - * @version: qseed block revision
> > >>>    */
> > >>>   struct dpu_scaler_blk {
> > >>>          DPU_HW_SUBBLK_INFO;
> > >>> -       u32 version;
> > >>
> > >> No. Please keep the version in the scaler subblk.  It is a version of
> > >> the QSEED (scaler block), not the SSPP's version.
> > >
> > > You are right that the new variable in the parent (SSPP) block is
> > > nondescriptive and should have been named scaler_version.
> > >
> > > However.
> > >
> > > dpu_scaler_blk is only used as a const static struct in the catalog,
> > > meaning we cannot (should not!) store a runtime-read register value
> > > here.  Instead I followed your IRC suggestion to read the register in
> > > dpu_hw_sspp_init, but my original implementation called
> > > dpu_hw_get_scaler3_ver in _dpu_hw_sspp_setup_scaler3 where we already
> > > have access to the subblk_offset, allowing us to delete
> > > _dpu_hw_sspp_get_scaler3_ver.  Would you rather have that?  We don't
> > > need the register value anywhere else.
> >
> > After giving it another thought, let's follow the vendor's approach and
> > store the predefined scaler_version in hw catalog (in dpu_scaler_blk, as
> > it currently is). This way we can still drop all QSEED3/3LITE/4
> > crazyness, while keeping the data sane.
>
> You want to drop the descriptive #define's, and replace them with magic
> 0x1002/0x2004/0x3000 and whatever other values we know?

And nothing stops us from adding defines for 0x2004
(SCALER_VERSION_QSEED3LITE) and 0x3000 (SCALER_VERSION_QSEED4). I'm
not sure regarding 0x1002: whether it is used on msm8998 and/or sdm630
too or not.

What I want to remove is the duplication of the information. It was
too easy to miss that vig_mask has version1, while the dpu_caps has
version 2. We are going to replace dpu_caps with scaler_version, but
the problem of having the duplicate still exists. I might have
suggested settling on the dpu_caps.qseed_type or on the bit in
dpu_sspp_cfg.features, but it seems that 0x1002 is not represented
this way. Unless we define something like
DPU_SSPP_SCALER_QSEED3_SDM660.

> That seems
> impossible to port without reading back the register value, which we've
> only done for a handful of SoCs.  I hope I'm misunderstanding you?

Newer vendor dts files provide this value, see the
"qcom,sde-qseed-scalar-version" property.
For older platforms we'd have to read the register. See below

> After all the vendor approach (in a random 4.14 kernel I have open now)
> is to read the register value at runtime but their catalog is also
> dynamic and built at runtime based on version ranges and register reads,
> which sometimes is more sensible.  Ours is const.

In later techpacks (since 5.4) they have switched to the property in the DTS.

>
> > Then _dpu_hw_sspp_get_scaler3_ver() can also be dropped (or you can use
> > it as a safety guard while doing dpu_hw_sspp init).
>
> That (safety guard) is exactly what Abhinav requested against, since the
> kernel (and our catalog) should be trustworthy.  I'll let you two fight
> this out and come to a consensus before sending v2.

I'm fine without a fight. Whoever adds a platform is responsible for
setting a register.

For the reference, as far as I know:
msm8998 - ??
(sdm660 - 0x1002)
sdm845 - 0x1003
sm8150 - ?
sc8180x - ?
sm8250 - 0x3000
sc7180 - 0x3000
sm6115 - 0x3000
qcm2290 - no scaler
sm8350 - 0x3000
sc7280 - 0x3000
sc8280xp - ?, supposedly 0x3001
sm8450 - 0x3001
sm8550 - ?, supposedly 0x3002

>
> > >> There is a block called DS (destination scaler), which can be used to
> > >> scale the resulting image after the LM. This block also uses the
> > >> QSEED3(,LITE,4) scaler block.
> > >
> > > Is this already supported in mainline, and is it the reason for
> > > previously having qseed_type globally available?  Is my understanding
> > > correct that this scaler subblk in the SSPP is merely an interface to
> > > it, allowing the same hardware to be used from the SSPP for intputs and
> > > after the LM for outputs?
> >
> > No, I think qseed_type is a leftover from having the same thing
> > implemented in three different ways. Maybe because of NIH syndrome?
>
> Could be, downstream uses it to steer its catalog logic for example
> (which happens before later reading the version register).
>
> > DS is not supported, it was removed in the commit
> > b033def8741aab3fb58e4bf6c1d5cd73b3beb357. I do not have a clear usecase
> > for this block and of course we don't have uABI for it.
>
> Is there no common DRM property to composite at a lower resolution and
> upscale the final displayed image to match a CRTC/encoder?  I wish I
> understood the commit message better :)

Yes, I don't think there is one.

>
> > It would still be nice to keep it in the picture though. It was the main
> > reason for moving scaler code from dpu_hw_sspp to dpu_hw_util.
>
> Downstream SDE already has this code moved to sde_hw_util as far as I
> can see (and SSPP and DS call into it).  But I fully agree as a
> mostly-oblivious-outsider: it seems like there are a lot of features,
> hardware blocks and optimizations not implemented, things which I still
> have no knowledge/experience/understanding of/about.  Let's first focus
> on making it work _on all relevant SoCs and boards_ though :)

For sure. I pointed to the DS as a reason to have the scaler version
in the sblk rather than in the sspp instance.

-- 
With best wishes
Dmitry
