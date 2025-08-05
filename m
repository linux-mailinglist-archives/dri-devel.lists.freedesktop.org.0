Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B298B1AD77
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 07:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C8510E468;
	Tue,  5 Aug 2025 05:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvfMhJFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9425A10E468
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 05:07:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574KPIBk020068
 for <dri-devel@lists.freedesktop.org>; Tue, 5 Aug 2025 05:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RGDGlIBOS8QFQQwkn/fuebKk8DgDBz/tM3/dLliE5IY=; b=lvfMhJFpd24bhbTP
 O0kG2q+A5fVGCkz3i9v56lGSGUPn8WnufnbPMlvV5MbKP57W5QtOAmWlaRmEBpao
 nSKDSuh8YmLPKjb6xMP+/Y6JFgsLDYIld9SJc3BZszmXWt34qD0hzAZIMyKdy4v4
 /zWjAMprFk9X2vSrNSKCNzfEMqIbqQw6/ZSropEZITO3K7coDCUoRPmnPSIWLCJm
 0SbZYz2l/2ZutflB8CkZN9UACsZ4A7JNNyc5cTXVZySLVkOVoyT0M/RcjPzsgpcW
 88eNv1NJOeFvXWtEMFRf2UREtFg4biDamrXHki0+PnxKHyErxtwsIBm/+z+ysfOz
 hZrJSA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ak5a403x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 05:07:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7074bad03d5so117534426d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 22:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754370442; x=1754975242;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RGDGlIBOS8QFQQwkn/fuebKk8DgDBz/tM3/dLliE5IY=;
 b=g5Lz1XAFrxefKQuzJhptlkGOKfF49VgIfk4OXNfl/BJPc9cNRXrEOgDhz2I+xOE3nn
 QlOlBr+Un3+179YwoGLoHsJEFD6BiKZW79q+s1GeluRSTXVpFwvBhk+QQ7QUS3QywWrl
 q91og7Ve8FmyDp+xvGyLsAQqr96Yyhh8M+IKCvujedspuTEikKzEnEN8tngQnjas6LIP
 KFdCj4tKqgnZt/GgVSZYOyVsE2qTrmyfkghXHcV3yqOk+M1o9HpjL/6k/nMJryILGTyu
 9V2TyXIgrpGTbqJ54DDpuMuTAKnw3AHUlAIJIsNFQ8hL8EMw7GJ/pvP3GOWphAEdsBnG
 LsMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeZbwxPV5rGPWeiA/chtgVsMRNAVoJiGQ1RY4AoRs4tpdPNE31FR38I3YeuYuxwwYHcc8/130gImY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcHrzsrBAAEv9wVjsAzXx9gDYy2s+71Yk8tG1KGlolPtb5T++c
 eegAIupMaJT6mnALUla2YZOiL3G3L6WZ5aWdpxDLJ9dyDNGR3QsqcUc+zhjjbpHgiQgW+r308BQ
 bdPX8rkU6WAop+THYlDMSqfwHCb/RmEcUEH8J/hI9G9th3FzMwFP6b/JbAUwwsWs3l+wmC/0=
X-Gm-Gg: ASbGncuF1i0PldzCh3QqPvS9hmwAMPmMAtMy7KofOX6XwgbMaijY3+xb5ktPEbzEFGP
 X/xbqEhrDjqpGKCbJXR/NoP3JHkqVAsO5y4K98Ax9o2p5zCPLYNRZ9B1kIAD/SfbT83BARAYaRM
 L1dkOcCARqPktskmbQKNeuPmp6dN58BcheKldpHnYMYYAXYEN/ureCsw/9bfybXKy/LLH3oJTD+
 73yOT9Nxhgek+SJjHy0NbbF2T8Jb6KNtNu7JPM+3Jkn3delonJvJfGiFyqKW5eAeyEbFkN943L5
 FiYWN6T3mlgFd7GPAa8bsuCJlk+2R0rtQlcsCQ7qlMZm8ZnuDRDWknPHPtdHv++58u6ES/Dlbd1
 BvmWmIb37D/y98Kxy0erryR6vtsShMDeDh8gJ9/aHkVbQjpGttq49
X-Received: by 2002:a05:6214:4015:b0:704:9b5d:ef4b with SMTP id
 6a1803df08f44-709367094c8mr164062936d6.26.1754370442604; 
 Mon, 04 Aug 2025 22:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN3RBZkH/ni6lalhr3Yl6Hm5Hxp8OvzmpE/5Ch5pnBaCVPtzbmvTCMAnzgDBAbFiiWNiQ4yA==
X-Received: by 2002:a05:6214:4015:b0:704:9b5d:ef4b with SMTP id
 6a1803df08f44-709367094c8mr164062496d6.26.1754370442018; 
 Mon, 04 Aug 2025 22:07:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88cabb7fsm1838792e87.146.2025.08.04.22.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 22:07:21 -0700 (PDT)
Date: Tue, 5 Aug 2025 08:07:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <kg52pqpr5ygfw3usru4z5e6vniqiexiewyplpru433tilvwyzi@stwgmyxie4k7>
References: <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
 <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
 <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
 <6612cd14-8353-4d3a-a248-5d32e0d3ca23@linaro.org>
 <CAO9ioeWeQ++qSaD5ukooqBg997=1pwwS80NHD_xiHz25ABmtXg@mail.gmail.com>
 <a9df2561-95d4-47a5-b5df-5874b71937a6@linaro.org>
 <5d86adfd-e16d-4072-b5a8-4f128a2c9adb@oss.qualcomm.com>
 <aJC0GLAeGneb3WFR@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJC0GLAeGneb3WFR@hovoldconsulting.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzNCBTYWx0ZWRfX1TgBHnwOHmXg
 dDPrhRuDaYrYfu7m3kekGw+d+qbCzqbB4iXHsLNCsnYf9X07FYRiUKJvN9YUsyyp/pNN5pMYnta
 P5lVAj4QiEyB7qUDI06UEaeKg3/a5t8WeMClFyfuRo49ShF6VQbPZoqewaM5R9E8vqWdO32XldT
 JmdWzFc44TFGrxqhpBxN5UlGU0i5eKHJh7r0KzYNYR4x9Qz0ABPa8m5dp8IbZu+p77FXiwDO4+M
 QyxiLkg79YlXeAgap00uDoFGalrN3rzsrDxgGl9YJ5GMs0HVZF+++a6eTfRXgGFVM+aW016g980
 Ho+6d+xPJpOT7FkzaSsdxIuTknyX3pgVpMeYf0xpoKUXkyp/0qlx1LhnPAcFxZDSxXkFTMHc8GM
 2Iyx43mtj/A2TUz8B96tXkJ7UFZwdY5p+Ym/ugJZU0aGMY8ugz74mCPDolbTyFo94L42V2c3
X-Proofpoint-GUID: Uw94eNUVH7_LViMaWyZJPRvwr-KG9y76
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=6891918b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=NwXsR5GU8CxyA_XcHSkA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Uw94eNUVH7_LViMaWyZJPRvwr-KG9y76
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050034
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

On Mon, Aug 04, 2025 at 03:22:32PM +0200, Johan Hovold wrote:
> On Thu, Jul 24, 2025 at 02:09:10PM +0300, Dmitry Baryshkov wrote:
> > On 24/07/2025 12:42, Neil Armstrong wrote:
> > > On 24/07/2025 11:32, Dmitry Baryshkov wrote:
> > >> On Thu, 24 Jul 2025 at 12:08, <neil.armstrong@linaro.org> wrote:
> > >>> On 20/05/2025 10:06, Johan Hovold wrote:
> > >>>> On Fri, Apr 04, 2025 at 02:24:32PM +0100, Christopher Obbard wrote:
> > >>>>> On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
> > >>>>>> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
> > >>>>>>> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
> > >>>>>>>>> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct 
> 
> > >>>>>>>>> drm_dp_aux *aux, struct drm_edp_backlight_inf
> > >>>>>>>>>         }
> > >>>>>>>>>
> > >>>>>>>>>         pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > >>>>>>>>> +
> > >>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, 
> > >>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > >>>>>>>>> +     if (ret < 0) {
> > >>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read 
> > >>>>>>>>> pwmgen bit count cap min: %d\n",
> > >>>>>>>>> +                         aux->name, ret);
> > >>>>>>>>> +             return -ENODEV;
> > >>>>>>>>> +     }
> > >>>>>>>>> +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > >>>>>>>>> +
> > >>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, 
> > >>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > >>>>>>>>> +     if (ret < 0) {
> > >>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read 
> > >>>>>>>>> pwmgen bit count cap max: %d\n",
> > >>>>>>>>> +                         aux->name, ret);
> > >>>>>>>>> +             return -ENODEV;
> > >>>>>>>>> +     }
> > >>>>>>>>> +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > >>>>>>>>> +
> > >>>>>>>>> +     /*
> > >>>>>>>>> +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > >>>>>>>>> +      * If DP_EDP_PWMGEN_BIT_COUNT is less than 
> > >>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > >>>>>>>>> +      * the sink must use the MIN value as the effective PWM 
> > >>>>>>>>> bit count.
> > >>>>>>>>> +      * Clamp the reported value to the [MIN, MAX] capability 
> > >>>>>>>>> range to ensure
> > >>>>>>>>> +      * correct brightness scaling on compliant eDP panels.
> > >>>>>>>>> +      */
> > >>>>>>>>> +     pn = clamp(pn, pn_min, pn_max);
> > >>>>>>>>
> > >>>>>>>> You never make sure that pn_min <= pn_max so you could end up with
> > >>>>>>>> pn < pn_min on broken hardware here. Not sure if it's something 
> > >>>>>>>> you need
> > >>>>>>>> to worry about at this point.
> > >>>
> > >>> I'm trying to figure out what would be the behavior in this case ?
> > >>>
> > >>> - Warn ?
> > >>> - pn_max = pn_min ?
> > >>> - use BIT_COUNT as-is and ignore MIN/MAX ?
> > >>> - pm_max = max(pn_min, pn_max); pm_min = min(pn_min, pn_max); ?
> > >>> - reverse clamp? clamp(pn, pn_max, pn_min); ?
> > >>> - generic clamp? clamp(pn, min(pn_min, pn_max), max(pn_min, pn_max)); ?
> > >>
> > >> Per the standard, the min >= 1 and max >= min. We don't need to bother
> > >> about anything here.
> > > 
> > > Yeah, I agree. But I think a:
> > > if (likely(pn_min <= pn_max))
> > > is simple and doesn't cost much..
> > 
> > Really, no need to.
> 
> It doesn't matter what the spec says, what matters is what may happen if
> a device violates the spec (e.g. if a driver triggers a division by
> zero).
> 
> Always sanitise your input.

Agreed. I hope Chris will now post v7...

> 
> (But there is no need for likely() as this is not a hot path.)
> 
> Johan

-- 
With best wishes
Dmitry
