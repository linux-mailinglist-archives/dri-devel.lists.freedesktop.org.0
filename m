Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34EBABF6C0
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 15:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89C510E787;
	Wed, 21 May 2025 13:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHLUsocq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A2B14B4E5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 12:59:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XM31029063
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 12:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PQ8FelBJqVusuKqI01bafP6p
 gE/hxiJzISLHy0HpwSk=; b=OHLUsocqu+9QxrOtGR5b1KSyVIms2jesL2go7drl
 2ooIQ74FhKamY66Q2+4rbF/CcVtFhncW+d7IjQGlfS/6WxyhWco7BJM/fZfSbJSQ
 /jtP+SKQFdAmBjeaHs4qKhYeafhEr8G0H0NOpSco7EhBK61YtcRHRiy6zORt3dFA
 R9jpsIOb9YKPn99a/MzAs5bTku9R5dGOMcCVGZxnRFu/ajVq87JZRvC8SmJaygPo
 TturjWUKQhInUc8Xt0Jqc29IZc4VAv/Iq++KpDV7DW0hmSWfAULknkUOFReShf3y
 1wbqL4KTNLWE2IJXFHKjvMkZuXuJTuF077AiM2JOiy1cwg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf431ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 12:59:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8aaba2f62so128336986d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 05:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747832383; x=1748437183;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PQ8FelBJqVusuKqI01bafP6pgE/hxiJzISLHy0HpwSk=;
 b=pbqxIjBsn1NVve8wHZp8q+xD71l0EIXLB5KP9sacNgh/ivWqa3FBs1pfKeyFNAuhMZ
 5LeuHwKkbwByZlM8B4xpVLHk7DM5t8iCqg0mUutOlUQHm0dIvvZaOXLr+4rd9q5rKti1
 FkZg0ebp2SHTGRxEHfzhc1q7AbzHUU2fPtYHbQ7rq7sYHKAt9IN/msz0jCewNLnZK2pN
 G6PlHg7Akx2VI8N1ZT2KG6lwvVJqShSw5fnTPTt7UYP3D1seUzDpL0Ka8HGoGXs6F7T6
 STa+csM/CcltMJ/brx181OHs6AJnG/VHZ0ytKUIHSa0vTQNTRuwRVaR2eO/mCC8uMjeo
 qGug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmjGR/qTsf7g3XMvhFvCFgTRpVQtEuyjl9FnJr9r+ojhF5d9SVuJ9xIMPsZVEz7ofWcobV+ddA4Bo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfb8FhweDvMTV0V0hnEN2GzvytY8aiqN1ZF/G/KYA4uxbpd+zi
 TiUEs3KyRoRRGEuLQyXCMkbFL4VO3dxGC3bsQj8ULH+FAD6HEFv0BV2jPihIMHdsRMZxOlEdIYv
 rocdVbowonE2W5wOztdkbCWwpb1tjZVkRsWLJjkfdxPXWIwl138YDMpAn/23YjdHMgISOyGw=
X-Gm-Gg: ASbGncs6SzaHvtZXaa8g2HxY0uTVLuZAvDiOS0qKn4JL94gO2Qr2RX5YrfX9/LGjw3b
 3egJU1UIQpSAa30CLSRbVZBNKxr/ia5tvQUTJE7dyUo2lk5DOKPwoA6/qRZGHvg9F4vssRMKlAl
 UQoetyrrnNeD8riw7eZsIWPSLAUtR4hUjmWxHnqLUfKvij8W8aIdFe1NRfvepsz8SAns3CtuJfa
 Gr4g6dLUSCWHo9na7pj86TyyQeztbMq6iZcJ9OZ7WZbsCjXmH7bm+VP0yGzN4XFSswceGDD+BS2
 M9LYxgbkkgUCJipXmOTlCL8pvQ2ql2aNM6ZmbVmfj3FpwlNRKoXIzzaaYPaw113yD+CdzbdYFZs
 =
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id
 6a1803df08f44-6f8d03572a0mr205090426d6.15.1747832383567; 
 Wed, 21 May 2025 05:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUhnGy4gCGjXLtSemtXuIIR5DTpA42yEm9njhcNzOkanHSgLeUZ3VEd2gBEl+hjJ8sTmWA7w==
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id
 6a1803df08f44-6f8d03572a0mr205090066d6.15.1747832383172; 
 Wed, 21 May 2025 05:59:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702c9d8sm2856946e87.181.2025.05.21.05.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 05:59:42 -0700 (PDT)
Date: Wed, 21 May 2025 15:59:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
Message-ID: <ybbyhri7vydiyowr3iqrizefblrfpedk5it723o254vyklcd5c@cdx7rhx2f3rn>
References: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
 <3ywacd4x23zadvwikw4hdprgbgxxdmbcar3lyayy4ezmd5lcyw@3h2oosmbk6yb>
 <87af51dd-a35c-460a-af4c-813427cdaf84@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87af51dd-a35c-460a-af4c-813427cdaf84@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNiBTYWx0ZWRfX4MEVosvhdHbT
 psEtkEkzwKtBnwvQiwMleorMsg10QMDzVDpPDWoCQghL/jzGLRVMKVmetnylEKbZYmPkbmu6oJp
 8K/K8s8ffGmXuwtTUOjCYUDLUgW3dxpTNnPtT4Aju3jaii6oguqtNGfUClxS6ExL8jruMpB0MrB
 79U8uKEHhSmw1FyzYc5XH7IalLimd3l+gZyQTN+wTOPENJ3qZCipWvAB7JqpCeVfNVxNin8BzSU
 IKlTxogwVEWhpTK46Jcx8hOOpdA4Dsn/jcJ507UUkSfdvi0iAbzNgGZSbQvER05kEg5YGUZxEgZ
 9bbqNUjZEaSMMD4y0lwPW95O//w/E/WDSduCL2bRd/NkcrBnR4mTYwAjAnD4Lw9585xp8jQ9H0e
 BqCdMePaUFG7Rz6TeUpD6yzcPhQUShmjXsdCbFGpEB+w4Wo9XeNmhzITGrSVwQ+qo5eT4Rje
X-Proofpoint-GUID: Hx05JYCEki3tmNDiwFUYpwysgxkf5FVT
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682dce41 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=afxxqWxysUDinfw8BOsA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Hx05JYCEki3tmNDiwFUYpwysgxkf5FVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=735 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210126
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

On Wed, May 21, 2025 at 08:09:14AM +0200, Krzysztof Kozlowski wrote:
> On 20/05/2025 22:06, Dmitry Baryshkov wrote:
> > On Tue, May 20, 2025 at 01:13:26PM +0200, Krzysztof Kozlowski wrote:
> >> Driver unconditionally saves current state on first init in
> >> dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
> >> divider registers.  The state is then restored during probe/enable via
> >> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> >> dsi_10nm_pll_restore_state().
> >>
> >> Restoring calls dsi_pll_10nm_vco_set_rate() with
> >> pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
> >> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> >> tree.  This makes anyway little sense - VCO rate was not saved, so
> >> should not be restored.
> >>
> >> If PLL was not configured configure it to minimum rate to avoid glitches
> >> and configuring entire in clock hierarchy to 0 Hz.
> >>
> >> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Fixes?
> 
> Probably:
> Fixes: a4ccc37693a2 ("drm/msm/dsi_pll_10nm: restore VCO rate during
> restore_state")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> But CC stable would not be appropriate, since this was never reproduced
> on this PHY/hardware and we only guess a visible issue being fixed here.

Agreed.

-- 
With best wishes
Dmitry
