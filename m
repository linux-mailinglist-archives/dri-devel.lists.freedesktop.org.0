Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3650CABA0B6
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 18:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7615710EB1A;
	Fri, 16 May 2025 16:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MItW8aR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A5110EB1B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 16:19:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GAfGiE018205
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 16:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OdHizHb7IuxrNJHGu0bm0O5d
 8pJGDXJ9pmm12RIOU2I=; b=MItW8aR9W3Iw+ODPZeqNt4Au+DvaYjveXh/+vnOg
 dm/hYgCHUFCWb7y+vLGWDb+tHN4zSlxYT4wF/zvdtzaygkyRJLRWB/2aQ34V5Nrh
 hKD6dSHdAxwBcretFC5uT2ndyQ5UkokTl8lXR2BIRTTKbwjtTCSCjuIbqxqyfLT5
 QS63PSuVC3w4+grRgY5KwJDPfj6YgxWbN0VM74d8LotqPU0rSJWAYiBugYciKVZ9
 qBbst25/aj7Ul1GhBehSmrRXqp/QZH69HoDq2YFsPsFVJ5vMeFnlSGdm2Veq/4zP
 zqTwnIoVlUV4tbKENkRoFF62pQvS6Bq9Pjmw9g8P7LGw4A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcntf1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 16:19:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b26e0fee541so1158766a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747412366; x=1748017166;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OdHizHb7IuxrNJHGu0bm0O5d8pJGDXJ9pmm12RIOU2I=;
 b=ljXHE9FSaEUPeNyKr+gQ+AjBkAzaLhyVFYA9DydPTuAQqodfNDwB3XKMyKCHWf1tai
 lT5lBM9FeInbdDPs8Ena5WKNhwgzOcB6rHlovlCiVth0oVOxr9YyHrY8ULkNtuO+kexG
 SSjUtkk5CiXocF+t4DDmPzcA+a0bjIX2nAMTb4jcHBZqKCBT9tZpZoSG6ShqkPoUqh9x
 6GjNdz+GSMyFpGxA/BTMz1lcSn+pKnAhuyKq3JjiCBM00nk6/vauzzIJ6K5SGIr75qgx
 xGp2a5NcST3AExCgICj5VHNbJcTwlDOSSic5cF9FjuWp8HNFc6ZCxv8I/jSphp3YCG7J
 qhlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7Cn1IDVMcDbpSfCxungpszddAYbIbRKHHh2Y8TG51p+Nrjnka7xnxwkPMUSO28iuTVFVOytQ5B6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuE6g+FIfIj66zHk6+8b6IOD6Bwyo+uPgBMHhBEOkokTIYXExv
 k5ZeQGmcg6Q/vqMlWtllnMQc1VtcWqc4F/USDRDdbI7hA4fu0OfDMXV5BJR7PtIE5V1tyrzNakO
 GHz7LvAyT75Q8JX2xXOubSjs8gu/qsbTegKle7NwPUi2u5Ay8oP8TDFLd9sLf3dzDkKVsg1r9r0
 YSDrdH1ejoRGbrpmgY6xzo9FKHSNacUrXkgb+wxjQ4xmI42F49h34LrA==
X-Gm-Gg: ASbGncsyJmts0Rn+5LeEHUiHRCzzkKtOqpYMjXqNZiAx3pp3eHHsgp8//3iWp2pDnLP
 fgk/TakALATusGQzp21HXW2fXnP9N3lAnadkgWBKjdDYmGXZJqdb0coRniQMd3FTkc2KChoTLt7
 CsqSm+W3rxnzwPqzxJGbsUoQmu
X-Received: by 2002:a17:902:dac5:b0:22e:4509:cb89 with SMTP id
 d9443c01a7336-231de21d4d5mr41482025ad.0.1747412366027; 
 Fri, 16 May 2025 09:19:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSVcF+K+W28H2kWBwMf5GyuWgdNhhGke3bb+WX4ooyAH/AXp2dXaZPpDFx8tw2S8pmh8/7WKHKH4LH3dgd+hY=
X-Received: by 2002:a17:902:dac5:b0:22e:4509:cb89 with SMTP id
 d9443c01a7336-231de21d4d5mr41481555ad.0.1747412365584; Fri, 16 May 2025
 09:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
 <f2brfgvsnwqu5rudr32fkjx6qiuut2im546mjqrk2ouego4npx@g6avls6o7kws>
 <24e419da-71f8-4b0d-9416-0fe4c63eed0f@oss.qualcomm.com>
In-Reply-To: <24e419da-71f8-4b0d-9416-0fe4c63eed0f@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 May 2025 19:19:13 +0300
X-Gm-Features: AX0GCFs30z0wUwczwcpcFSVo58xy4x1zGA8X22Qv0jPIM8FmHAw1HbbWJAzWeGA
Message-ID: <CAO9ioeVnbgWt8Ov0LF8y5dqydLM_7PhwHN3h=PEu-T2aibpkDA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: AZF3JEyVRaZXwlIvanDRECbu8MkADu45
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=68276590 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=YjGi-erzSBDx4MDg3asA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: AZF3JEyVRaZXwlIvanDRECbu8MkADu45
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE1OSBTYWx0ZWRfX09a5Zj969tPi
 kqdcWGf5f7p2T/K+ylcOAbcO2/HAUvibY+51tdym9DdzXZdHcLCr1XUptFYevllYqmZvidkKp6H
 QtfSspGlaZIkUaQi7/0/NLKohew53NoE4pqXSA9ubZGRwNBgG+PgLRt/J9JJfcTS8EYmjB5YSyH
 kvmofc6qWJOX78lHayeQZ5JdgemiEUcttZGy7pqHyLasmxkOFrgjvjshSdcmUnjQ8bHDNoghedH
 7xCutdRMBVYYx797Spz54TyCEBSblXeMINJj/HDVwaiViB/HGzh4mylbuOW7m/p1hvxagvj0Tuj
 /w3NXC3oMetV6NBUbXKYgRLuqQBduH+4fl+oQQxgrGrn7GY8DgzqMF8ytM0gVXTpbKi4gWHZzhl
 rg5yiAGDkFtqs68/MknDGDlBmegJee7uXgKNUHFrqSvteW1q6kN6FM3Hd6jLzOmuL7f8tj4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160159
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

On Fri, 16 May 2025 at 03:39, Jessica Zhang
<jessica.zhang@oss.qualcomm.com> wrote:
>
>
>
> On 5/14/2025 5:28 PM, Dmitry Baryshkov wrote:
> > On Wed, May 14, 2025 at 04:52:31PM -0700, Jessica Zhang wrote:
> >> Validate requested mode and topology based on the PINGPONG or DSC encoder
> >> max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
> >> off of PINGPONG or DSC encoder max width
> >
> > Separate commit for num_lm, please.
>
> Hi Dmitry,
>
> Ack.
>
> >
> >>
> >> As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
> >> for PINGPONG_0, there is some additional logic that needs to be added to
> >> the resource manager to specifically try and reserve PINGPONG_0 for
> >> modes that are greater than 5k.
> >>
> >> Since this is out of the scope of this series, add a helper that will
> >> get the overall minimum PINGPONG max linewidth for a given chipset.
> >>
> >> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
> >>   1 file changed, 39 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> index 0714936d8835..6131d071b051 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> @@ -723,6 +723,31 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
> >>      _dpu_crtc_complete_flip(crtc);
> >>   }
> >>
> >> +static int msm_display_get_max_pingpong_width(struct dpu_kms *dpu_kms)
> >> +{
> >> +    const struct dpu_pingpong_cfg *pingpong;
> >> +    u32 max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;
> >> +
> >> +    /*
> >> +     * Find the smallest overall PINGPONG max_linewidth in the catalog since
> >> +     * max_linewidth can differ between PINGPONGs even within the same
> >> +     * chipset.
> >> +     *
> >> +     * Note: While, for DPU 8.x+, PINGPONG_0 can technically support up to
> >> +     * 8k resolutions, this requires reworking the RM to try to reserve
> >> +     * PINGPONG_0 for modes greater than 5k.
> >> +     *
> >> +     * Once this additional logic is implemented, we can drop this helper
> >> +     * and use the reserved PINGPONG's max_linewidth
> >> +     */
> >> +    for (int i = 1; i < dpu_kms->catalog->pingpong_count; i++) {
> >> +            pingpong = &dpu_kms->catalog->pingpong[i];
> >> +            max_pingpong_width = min(max_pingpong_width, pingpong->max_linewidth);
> >> +    }
> >
> > Since we are skipping PINGPONG_0, wouldn't it be enough to return
> > max_linewidth of PP_1 ?
>
> I don't think we're skipping PINGPONG_0 here since `u32
> max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;` at
> the top of the function.
>
> >
> > I think, it would be easier to follow .max_dsc_encoder_width and store
> > .max_pingpong_linewidth in dpu_caps (and later add special
> > .max_pp0_linewidth).
>
> Ack. I think my only concern for this is that max_pp0_linewidth won't be
> set for all chipsets. But if you're fine with that I'll go ahead and
> make this change.

You can set it for all chipsets having PINGPONG_0. It might be the
same as .max_pingpong_linewidth, but that's not a problem.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >> +
> >> +    return max_pingpong_width;
> >> +}
> >> +
> >>   static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
> >>              struct drm_crtc_state *state)
> >>   {
> >
>

--
With best wishes
Dmitry
