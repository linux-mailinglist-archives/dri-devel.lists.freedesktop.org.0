Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15712AF7768
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 16:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2945C10E115;
	Thu,  3 Jul 2025 14:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFx1j7yj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6E610E857
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 14:28:36 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5638eSVR032129
 for <dri-devel@lists.freedesktop.org>; Thu, 3 Jul 2025 14:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aPQxTypkDSifWXr1kKb5YoV+sU4Et63WdriVs3pvSJk=; b=UFx1j7yjt7VtX1vf
 rZk4F/lhAvk2Zig6Ux2YGfDZtX/T549PlaPUYr3+cf9lVZMjt/Nq+gLTd50Tv4Sk
 TchvAD3U+ijhGb4RN2SCTVyibdVO9NVpbzdUmNUTHmNrYYE5q6XcIbtYSlo1BPSs
 AVrXwHN8J6c0ovDa/5CqpuNdq9gdaR4lQl5MUicrH9w6//D6bex9F2n9WV2gXe1i
 cAU4Ig6dd7Ku+IuHJUVGoOJIMs6ZyqTD3qejP8GFEeI68iir7GCMgRhlzfxVkgDy
 jziOm4hb/lEy57t2IkD/0Z9Zcs2d3YKHu/7WJI710zHS4AUgqKnGBRS0k/wkadMV
 DklyIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kh173-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 14:28:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a985909a64so13835371cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 07:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751552914; x=1752157714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aPQxTypkDSifWXr1kKb5YoV+sU4Et63WdriVs3pvSJk=;
 b=SzqVAKxzcySvJVC7s3O5Nx0vZfWKWEbYPcmVlvVxXVYckj4vtxackZJ2cOCmI3Mb72
 diSe12wqIZADzAgKiDhkrmv+vQ3YrZua4PsiZ4Vw2EGGpq5tbfROrErF1Y9FjH6wqPDW
 irn4v2lE/Mt8tVlwZdLyRfm/VLkWbYh5APd7LE6yeKib5GcHn4U34DKEUGLNrmMCue3U
 ywFf1agkN+PU642AqhTtJTrcUyp7LmDIVSi6U7IuVCXGrhseo21bzeMiHroHyQKKY7TF
 4Li15+o4huNL14qE+8QUJufZPbPA3bdoX6X7y01EQ9mdG8/EDT3INqmyeOi/WWCtA0Tb
 oUvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhLKuU972zjoPMrbNxoQol9JpKr5Er5a6MIqKd7uw6pdDw7EaQe0V9Ien433Z7X8VOjAzPUWN/1CU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAWn4gDtG0eS3la+l/frG2oSYJjoLQbZqhQTFHHgo5W6mSbdG+
 VOulpokHTRNWIjpxobAwrRWjwaRm4YweNq5FHdd2cStBdEcTj2KUbMiWgiLmPYNRMzotnt+yqev
 mxNRouSV5HhSQyOaaBGdn6aBrX7nwOppP2wPJ1fD0s7y1+2MmFH6BdgDwI2bKi/P5WgLMF0y3YF
 J6PmBDC8gQJEUP9+w3BsCAF0nT1kkLx793CAUOftZKDPq+Aw==
X-Gm-Gg: ASbGnctfBByl32IoQ0bBY+NcLFJr62HuEHGFMVe1As+ohOBbGBnmsVv1u5S5Sqi4XTJ
 YhKO0lnfkVCmdi8ycO4HZ01lQYQY4wpDZj93eXFVB0FSpBnR2/U3OKzs6WAslxWld7/2ZILdFBj
 3JcAfDWg==
X-Received: by 2002:ac8:5a13:0:b0:48a:e2ec:a3b4 with SMTP id
 d75a77b69052e-4a97690de8fmr114049931cf.17.1751552914172; 
 Thu, 03 Jul 2025 07:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhT0FsD7uVl5phvxFI/cNiRm8hqsPWi3kG29UqR5qXmGXlI/kuvyqMq4P1GkE5QfKubdQnQD4c3Jw0sIygX1w=
X-Received: by 2002:ac8:5a13:0:b0:48a:e2ec:a3b4 with SMTP id
 d75a77b69052e-4a97690de8fmr114049331cf.17.1751552913522; Thu, 03 Jul 2025
 07:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250629085036.765397-1-loic.poulain@oss.qualcomm.com>
 <yafvivvzvcuyopyisxbkb4cqa3cmv4uzn7df34pwk4kqg2r55n@wx6spgecaw6d>
In-Reply-To: <yafvivvzvcuyopyisxbkb4cqa3cmv4uzn7df34pwk4kqg2r55n@wx6spgecaw6d>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 16:28:21 +0200
X-Gm-Features: Ac12FXzaTzx9YfkCK84DA6YQHyPZZJRo6PMlwTGV2tIPqFEY4q9HMpAmvGKrPXw
Message-ID: <CAFEp6-2Z2CLD8AW475AH7FkBrtysXpfnAtWryHWRN+Noh2DZGg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68669393 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=ae2ZjgFDbcS0OE6Il88A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyMiBTYWx0ZWRfXxIV0eqhmzTE3
 E1kKAXMyLWd//t0axs0vhoYSN2iMw07kmv94mGdyBXgH7D7Sr4/ng55uEQRPrasR2Or6KiRgBa0
 wjJP/1MlUfayvy34thanQytaRfAffNakUhfaShFCgevR2JfhYMxHBntV/eaIiuQEGES1/gyjrzG
 CLNpjdM224EgurD6FrvTyL5KdnTuw/ex9DtKgjmO7myj3pinyNrX+in7DCXMKr/yASfVMHCpPTL
 j0YLVgKn4QKQ0ObpqaDBuiReAZwdcJxgLJoTVrInWt33TzXNltTfDUUytVUOqp82Wr3CFltKd6g
 kMAEAwpfTdSRA9BQjV6qgY8igI5QkTghiznibqBDCLYi4c/EqMnw+O/HUC9saS5vZ4ZJ+HlMIgS
 iFrl9gTKYRDg4stVqzpuEqU/M9d0h3n3YRf8AMBcrhThbyrca/CP7iQ76w3FJytpHQfaDeGQ
X-Proofpoint-ORIG-GUID: krmW8yi8fVFwarHWzVdHKYarA07YiPYX
X-Proofpoint-GUID: krmW8yi8fVFwarHWzVdHKYarA07YiPYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030122
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

Hi Dmitry,

On Sun, Jun 29, 2025 at 4:57=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Jun 29, 2025 at 10:50:36AM +0200, Loic Poulain wrote:
> > To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock must
> > be active for MMIO operations. Typically, this AHB clock is enabled as
> > part of the DSI PHY interface enabling (dsi_phy_enable_resource).
> >
> > However, since these PLL clocks are registered as clock entities, they
> > can be enabled independently of the DSI PHY interface, leading to
> > enabling failures and subsequent warnings:
> >
> > ```
> > msm_dsi_phy 5e94400.phy: [drm:dsi_pll_14nm_vco_prepare] *ERROR* DSI PLL=
 lock failed
> > ------------[ cut here ]------------
> > dsi0pllbyte already disabled
> > WARNING: CPU: 3 PID: 1 at drivers/clk/clk.c:1194 clk_core_disable+0xa4/=
0xac
> > CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted:
> > Tainted: [W]=3DWARN
> > Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
> > pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > [...]
> > ```
> >
> > This issue is particularly prevalent at boot time during the disabling =
of
> > unused clocks (clk_disable_unused()) which includes enabling the parent
> > clock(s) when CLK_OPS_PARENT_ENABLE flag is set (this is the case for t=
he
> > 14nm DSI PHY PLL consumers).
> >
> > To resolve this issue, we move the AHB clock as a PM dependency of the =
DSI
> > PHY device (via pm_clk). Since the DSI PHY device is the parent of the =
PLL
> > clocks, this resolves the PLL/AHB dependency. Now the AHB clock is enab=
led
> > prior the PLL clk_prepare callback, as part of the runtime-resume chain=
.
> >
> > We also eliminate dsi_phy_[enable|disable]_resource functions, which ar=
e
> > superseded by runtime PM.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  v2: Move AHB clock into a proper PM dep instead of manually toggling i=
t
> >      from the PLL clock driver.
> >
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 65 +++++++++++----------------
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  1 -
> >  2 files changed, 25 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/ms=
m/dsi/phy/dsi_phy.c
> > index 5973d7325699..015cb579c669 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -5,6 +5,8 @@
> >
> >  #include <linux/clk-provider.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_clock.h>
> > +#include <linux/pm_runtime.h>
> >  #include <dt-bindings/phy/phy.h>
> >
> >  #include "dsi_phy.h"
> > @@ -511,30 +513,6 @@ int msm_dsi_cphy_timing_calc_v4(struct msm_dsi_dph=
y_timing *timing,
> >       return 0;
> >  }
> >
> > -static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
> > -{
> > -     struct device *dev =3D &phy->pdev->dev;
> > -     int ret;
> > -
> > -     ret =3D pm_runtime_resume_and_get(dev);
> > -     if (ret)
> > -             return ret;
> > -
> > -     ret =3D clk_prepare_enable(phy->ahb_clk);
> > -     if (ret) {
> > -             DRM_DEV_ERROR(dev, "%s: can't enable ahb clk, %d\n", __fu=
nc__, ret);
> > -             pm_runtime_put_sync(dev);
> > -     }
> > -
> > -     return ret;
> > -}
> > -
> > -static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
> > -{
> > -     clk_disable_unprepare(phy->ahb_clk);
> > -     pm_runtime_put(&phy->pdev->dev);
> > -}
> > -
> >  static const struct of_device_id dsi_phy_dt_match[] =3D {
> >  #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
> >       { .compatible =3D "qcom,dsi-phy-28nm-hpm",
> > @@ -696,24 +674,30 @@ static int dsi_phy_driver_probe(struct platform_d=
evice *pdev)
> >       if (ret)
> >               return ret;
> >
> > -     phy->ahb_clk =3D msm_clk_get(pdev, "iface");
> > -     if (IS_ERR(phy->ahb_clk))
> > -             return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
> > -                                  "Unable to get ahb clk\n");
> > +     platform_set_drvdata(pdev, phy);
> >
> > -     ret =3D devm_pm_runtime_enable(&pdev->dev);
> > +     ret =3D devm_pm_runtime_enable(dev);
> >       if (ret)
> >               return ret;
> >
> > -     /* PLL init will call into clk_register which requires
> > -      * register access, so we need to enable power and ahb clock.
> > -      */
> > -     ret =3D dsi_phy_enable_resource(phy);
> > +     ret =3D devm_pm_clk_create(dev);
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D pm_clk_add(dev, "iface");
>
> This will break booting the kernel with some old DTS (before 6.0), where
> we had iface_clk as a DSI PHY clock. Please document it in the commit
> message.

Do we want to preserve backward compatibility and introduce some sort
of msm_pm_clk_add to handle both?

>
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret, "Unable to get iface clk\n=
");
> > +
> >       if (phy->cfg->ops.pll_init) {
> > +             /* PLL init will call into clk_register which requires
> > +              * register access, so we need to enable power and ahb cl=
ock.
> > +              */
>
> I think with pm_clk this is no longer reuquired. Could you please verify
> it and drop extra pm_runtime calls from probe?

Will try.

>
> > +             ret =3D pm_runtime_resume_and_get(dev);
> > +             if (ret)
> > +                     return ret;
> > +
> >               ret =3D phy->cfg->ops.pll_init(phy);
> > +             pm_runtime_put(&pdev->dev);
> >               if (ret)
> >                       return dev_err_probe(dev, ret,
> >                                            "PLL init failed; need separ=
ate clk driver\n");
> > @@ -725,18 +709,19 @@ static int dsi_phy_driver_probe(struct platform_d=
evice *pdev)
> >               return dev_err_probe(dev, ret,
> >                                    "Failed to register clk provider\n")=
;
> >
> > -     dsi_phy_disable_resource(phy);
> > -
> > -     platform_set_drvdata(pdev, phy);
> > -
> >       return 0;
> >  }
> >
> > +static const struct dev_pm_ops dsi_phy_pm_ops =3D {
> > +     SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> > +};
> > +
> >  static struct platform_driver dsi_phy_platform_driver =3D {
> >       .probe      =3D dsi_phy_driver_probe,
> >       .driver     =3D {
> >               .name   =3D "msm_dsi_phy",
> >               .of_match_table =3D dsi_phy_dt_match,
> > +             .pm =3D &dsi_phy_pm_ops,
> >       },
> >  };
> >
> > @@ -762,7 +747,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
> >
> >       dev =3D &phy->pdev->dev;
> >
> > -     ret =3D dsi_phy_enable_resource(phy);
> > +     ret =3D pm_runtime_resume_and_get(dev);
> >       if (ret) {
> >               DRM_DEV_ERROR(dev, "%s: resource enable failed, %d\n",
>
> It would be nice to make error prints to follow the code changes.

Sure.

Regards,
Loic
