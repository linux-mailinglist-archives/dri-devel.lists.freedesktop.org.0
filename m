Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9526B10647
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB8C10E90C;
	Thu, 24 Jul 2025 09:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c68fSYgO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C65010E90C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:33:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXHsH028541
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mqPtRcbsCOw9EJIhatPqsdNe
 y6biej6WaprATCoZHfI=; b=c68fSYgOcIskSyM6amsMkBBy0BUZ63dZppXvSR6V
 ShYY/drd2v1u08mUGLBLhR+93YR1U7a9lqlgqG8AiVptN0O4i6AWGm2JleaNChuV
 U3irDMUEogVwhjLwmkTgR7qW8DluJ2yUv15RI9qYR80xUExaXLF8IdTkt5axpvO1
 /Uw/W2aSplfjChw42ZiluTY76yFQeIp4mWTOgVLVp7QjKBNxLD5sl2PBNLwz0cKW
 xuswAev07TGblCaGnrK1sfhwqlw9YYFisKb3plzSX2Ci0RDu7s27+dUZ44hovL71
 w/ogQ7YeDJShrUx2Z1yfRhi9aRevRPvrpnrywxBeJehNDA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1fhj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:32:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2349498f00eso17851075ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 02:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753349578; x=1753954378;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mqPtRcbsCOw9EJIhatPqsdNey6biej6WaprATCoZHfI=;
 b=D/xiewlPQhKY8FKrDtrkvpx5lbdO5ur3h9z3WKYqOLu0fVPgkQIvKAXclgFNorWJ5W
 diq+AVIYIqFkm51e4edkh+/xyD7RtJwZklhANLYAcORs4P5rJ0EytvR5cXkwCooUkeSP
 QeazbzrShuASMmNO3elga+Dx2cCOb8Xw7Udnzb/wTYfUJ/ZpVMBLvg8wDTE5BU6cilgF
 GyUgJVIckoOrx9TcbrEIzl8rKa9Eu7eQ1pmbiJ+8W5BWpLMkfqMuEljTnhFNaV0sb5uP
 mlmM3gLy598ht/YH2vwhmF5LN60M6IkEAgA0MO2u9fJKxL7ldslkHeIxBWYmQZuEeh29
 PyNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvH6RVqRBqwMVGSFAYkpINBS2M/hUcIOXhjzBVGf12PQjdEgUnkJVbs46mzBwX6+dai/17DMOXiiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykMNyx4sgr2TyDrZESVVZUEqTk9kE35P+mxPEk7v4nd5bExNN9
 MBgvFhc/Iwo0MvpDyv9pv3x5MvD3genOVvw1HnDM9Ary3kRqSzZCjmBdFLlch5W+NSWObQWRuw7
 jAp95SmfdVMhkuis0Fu+SxmzJKXihyrobGrsXxPZL6K7XFRuOWsKiwwrUOsnfU8AO+JEp/J9/rU
 ofiC8NB7VGr7HawPYTquOJWMwF8ci3E5Jx7WBS7VP/AF1Hcg==
X-Gm-Gg: ASbGncsftaNuzrPBg66sYPehrQwnGwZgL2cVwAZ/1veTfKJsQ0b1LgyJGAEtYFeRjYC
 bns1gO7mi/SnAuJ/8OMP5XCrxC+PqCyiP+gmCsdaIdhKG8tUVeTo+J5wjzG1+fW07+dxtkvO+EZ
 KByoXdxvyE1ZHyYoAsUXfMHBaJo0pUTePmaXg=
X-Received: by 2002:a17:902:d0d1:b0:236:6f43:7053 with SMTP id
 d9443c01a7336-23fa5ce54a6mr13650645ad.2.1753349577750; 
 Thu, 24 Jul 2025 02:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzcZWmBo9GRk2H2wGBOAXn/nV3iajdijuwc47ScbovcMfJiyNhRJm/ijNpez+vVpfMM1XLZpby4Ds8CFIu3OM=
X-Received: by 2002:a17:902:d0d1:b0:236:6f43:7053 with SMTP id
 d9443c01a7336-23fa5ce54a6mr13650325ad.2.1753349577252; Thu, 24 Jul 2025
 02:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
 <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
 <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
 <6612cd14-8353-4d3a-a248-5d32e0d3ca23@linaro.org>
In-Reply-To: <6612cd14-8353-4d3a-a248-5d32e0d3ca23@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 12:32:46 +0300
X-Gm-Features: Ac12FXzfi9ETqpAOxGcnUxM_fc41kHLrlMlbMTS6AIQ3Z-mT3xW4dKOu7lXyMDU
Message-ID: <CAO9ioeWeQ++qSaD5ukooqBg997=1pwwS80NHD_xiHz25ABmtXg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Op0b-YJda1H_jC4dnFo5AlzOmcsJy5jf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3MCBTYWx0ZWRfX/hRQCNnCZidG
 WbOVxFwXWT9upfdf59Vi+ue4u94TGcd/OETc1dnfhE5tzEmklE/wQF4KIeI877VQ25rCGBZe/b5
 GtCGOae2YtVPwHVG/pl30H3A2NTcd8qDI6bA6CWm8/c8ABCeZ7gJ9wk8GzlN3SdqF4JZMWzjbUX
 MS1y4Jw6zm3zvvPpEz+3qSy1AcYmrdXc92ajsobAqgxsAWKAcY5i88UV1QY3cwfdTYA41AA8vAq
 y64zgJ/i60x/aR79NSLamVuppxHamQ73bopt4rpVUOj/N7h0ywFR93IyD4+wSUhEhdvUBbAbhAG
 TEv8iviBEX0kSO+wDuDazSSdEDqvy4h8XWeMfLadzyYgqEFELa8T8CZab3wZ8OLPeSJUUB5SJ2h
 vKqGWS4eqowT0y+3dA08PEcDs1LkVzuSwseyd6qwuYfygE6QIyhDy1mzJWe2b/s3AR4pBckv
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6881fdcb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=2v3lhCP2OwN22-7ziQcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Op0b-YJda1H_jC4dnFo5AlzOmcsJy5jf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240070
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

On Thu, 24 Jul 2025 at 12:08, <neil.armstrong@linaro.org> wrote:
>
> On 20/05/2025 10:06, Johan Hovold wrote:
> > Hi Chris,
> >
> > On Fri, Apr 04, 2025 at 02:24:32PM +0100, Christopher Obbard wrote:
> >> On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
> >>> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
> >>>> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
> >>>>>> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >>>>>>        }
> >>>>>>
> >>>>>>        pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> >>>>>> +
> >>>>>> +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> >>>>>> +     if (ret < 0) {
> >>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> >>>>>> +                         aux->name, ret);
> >>>>>> +             return -ENODEV;
> >>>>>> +     }
> >>>>>> +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> >>>>>> +
> >>>>>> +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> >>>>>> +     if (ret < 0) {
> >>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> >>>>>> +                         aux->name, ret);
> >>>>>> +             return -ENODEV;
> >>>>>> +     }
> >>>>>> +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> >>>>>> +
> >>>>>> +     /*
> >>>>>> +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> >>>>>> +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> >>>>>> +      * the sink must use the MIN value as the effective PWM bit count.
> >>>>>> +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> >>>>>> +      * correct brightness scaling on compliant eDP panels.
> >>>>>> +      */
> >>>>>> +     pn = clamp(pn, pn_min, pn_max);
> >>>>>
> >>>>> You never make sure that pn_min <= pn_max so you could end up with
> >>>>> pn < pn_min on broken hardware here. Not sure if it's something you need
> >>>>> to worry about at this point.
>
> I'm trying to figure out what would be the behavior in this case ?
>
> - Warn ?
> - pn_max = pn_min ?
> - use BIT_COUNT as-is and ignore MIN/MAX ?
> - pm_max = max(pn_min, pn_max); pm_min = min(pn_min, pn_max); ?
> - reverse clamp? clamp(pn, pn_max, pn_min); ?
> - generic clamp? clamp(pn, min(pn_min, pn_max), max(pn_min, pn_max)); ?

Per the standard, the min >= 1 and max >= min. We don't need to bother
about anything here.

On the other hand, I think the patch needs to be updated a bit. If the
pn value changed after clamping, it makes sense to write it back to
the DP_EDP_PWMGEN_BIT_COUNT register by jumping to the tail of the
drm_edp_backlight_probe_max() function

>
> Or just bail out ?
>
> Neil
>
> >>>>
> >>>> I am honestly not sure. I would hope that devices follow the spec and
> >>>> there is no need to be too paranoid, but then again we do live in the
> >>>> real world where things are... not so simple ;-).
> >>>> I will wait for further feedback from someone who has more experience
> >>>> with eDP panels than I have.
> >>>
> >>> There's always going to be buggy devices and input should always be
> >>> sanitised so I suggest adding that check before calling clamp() (which
> >>> expects min <= max) so that the result here is well-defined.
> >>
> >> Makes sense, I will do so in the next revision.
> >
> > It seems you never got around to respinning this one so sending a
> > reminder.
> >
> > Johan
> >
>


-- 
With best wishes
Dmitry
