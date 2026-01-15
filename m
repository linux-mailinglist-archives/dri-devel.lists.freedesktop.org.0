Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D5D28A4E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 22:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B2810E7C1;
	Thu, 15 Jan 2026 21:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cw33jvOF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tsk2QYB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945F110E7C1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:08:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFY6ko2817319
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6CWr3YpvoBVCcskN6Xk0YpfdI325zkYISzpPc59M6Gg=; b=cw33jvOF2Hsg9vg8
 WObtnG9h/BL8Lt0TAyJT1iBhMAaJ/j5DBMNABjIKQ6QbQF/VPDF+45cNvPcXOzsP
 ox/zvf1RMn9QcHUSUtLg2U+D43Phk0wOJLM9tvCUBtPNdG+NIlyIrZUr6M9Pn+iA
 X8MTuK/w233EW6fqMJTcLbY9xTS9m+cTNbeeaunn3ObwKEjDLnCw3HplLAc1JODa
 l5m2MFfB7X74HFS7UZ5C5P9KwAtxZJqrszhv/TqvaOMtUqrn57Un1Ti5ADo8O3wJ
 xerSO4iLQaH7BSXj/lLve9fuvqvkmm1z/KgqveyabIy7RnGM2Ng3nCc7jiEq8/kf
 UkQ3xA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpwpxj2q0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:08:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52f07fbd0so604781185a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511338; x=1769116138;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6CWr3YpvoBVCcskN6Xk0YpfdI325zkYISzpPc59M6Gg=;
 b=Tsk2QYB2R+bMgBtoccAkv7O71dEixFSMl4+URqN8fswepLsu2DLSaoP9BhzLAN3J+r
 Q60zxeLeqkc1u/ZlATDe5NR3tIkTdc6bpADZwrbfFSgEKFRJfnvSeai5grmW6VNyzIba
 MTjxhW6TlxaXAGLhL5iA2wMAo8uYCHjbBlufBjj8/fwYDByMu0NS1fgDbhOtZ0IWeZhm
 AI2xsMCTLbHwTLRzobsfIpEqOse3CFBpjTHNijLfiQyfEhfzKTN8KdlY37LIPghAqLJU
 NkLHXj8yTOHUPP85hI5c21EJP7i3kCgYHljqILmpvBg+pFIUi9zuZGOWljnFAKPbbVGc
 sgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511338; x=1769116138;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6CWr3YpvoBVCcskN6Xk0YpfdI325zkYISzpPc59M6Gg=;
 b=Vcgu3/Y/7GJSKSeTo6Wei9HNyCdw9f7FMmx+t6nm0E6DT5qjvlZNAQ0qTY3a8khrq1
 waDnzOsImDdLFHLt+871piqkyzITFKNPeG2yKyB954Uw/XqJZKXHJyvVSyaYude3PN3m
 7XHTY4kz9I4sIZZvO50pqpDeeiVJo2Icrmy4fiSBp9ibnNe8iYKfQ4oviBdFZsY+ztSh
 FdAd9ivgh78sIx72l+wYp5motSEv2Ag3ZnsnrTDuTJrBBe9FfL0wcmeyznO+/RoU9CrH
 8ijo9qhiAqidjh1/bykzwHXxr63Hys7hHZN7nVNEAUUU6ZxWKy7BN+xGDH/gciLv7DwF
 CDPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQexdxEUMaX0OT7+S/xVy+fh+IM/NQWHAhIfjheRV6GqSzDFv8cHi2ZaP6UgPhAdAHY4vgxOQsjbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6yqx/OjBusflXs60olhXocXvAodO/v6a+svs9hGpzClWMr/81
 vSCvGnrE/jDWy/+3bkwmWhOb+P9iOEtz5QzN7qy0npbFb/zDYFhCQzuu/kRHogNtnHPAxPUk6HI
 6GgGRYlzIpcmlX3ztGqGZD6Tk2T3tWJjNU0gSzxnJgkqa/dHHb02LyC8V2BBgFI698kBgYXs=
X-Gm-Gg: AY/fxX6xDhGTO4YFMqLDeBjrXMdZAruDRWU96c08t+iPj/C36TSKQcBtVHlYnWKJSZi
 FnIWARQn0i9/inYjV49DScPH5uIAooVDJEnmSz+RC0UDLfybh5wdWJjw6I+rvFA9rpJKEh/hNgJ
 oVqTQNXItWJU5GWgkZVgEk3hMObeJYwnK7v7Iv63O4D+kiu8asN3pFewHdLMN3/bZFF5LLa/Y6e
 mLQwg5fGDbLmxNHRiBOQoC+JMV7yInYBCOcDE5iDu8Jz45BWw45vUnu7eeC/URkpPuabUR7a3RR
 xCntx3In+4fu8RU1yl5l6uY5/sxNaz0Eyk3dUnp/kSMc2bs1YTY+sxtlzz+5HJfV8vgsZ52X283
 OuITo6owlPaukNCx0z3XevenTnKuol8ECbXwr4DyNGxaCYSRozqzm9im64JxCcRhoU6kWS9EP3w
 eInY0ONwjk26ku/TPgtJLCQXU=
X-Received: by 2002:a05:620a:29c5:b0:8c5:359c:2821 with SMTP id
 af79cd13be357-8c6a6944eb4mr107585385a.42.1768511337897; 
 Thu, 15 Jan 2026 13:08:57 -0800 (PST)
X-Received: by 2002:a05:620a:29c5:b0:8c5:359c:2821 with SMTP id
 af79cd13be357-8c6a6944eb4mr107580485a.42.1768511337300; 
 Thu, 15 Jan 2026 13:08:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3a1746sm154628e87.91.2026.01.15.13.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:08:56 -0800 (PST)
Date: Thu, 15 Jan 2026 23:08:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Xilin Wu <sophon@radxa.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
Message-ID: <iqst4yq3z5jlpr6f3r7fqbkzaxtn5ugene2j7tcvaa6jy2jwdi@k5zgxvqgxymi>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com>
 <caf44ce9-48ec-45b4-b633-3a49b7705b1e@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <caf44ce9-48ec-45b4-b633-3a49b7705b1e@packett.cool>
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=6969576b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NaFzL-Qi7nr1PL-x3w4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EId6v9VXGpL2yPbz0dQIR7D0FoKKceCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX8RjmMCcbpv/W
 NIi70Bgt4br/OYBj5A4uKXVUmJuxFyEfYL7BnPr/34RTQ5PRMg7FTczwxofHrwlPZef4MNWvlpy
 uIKfENaYSurIaSdrt7SAJxv6eZ8AabrrGOiqGKmky0e0xPN8k9SEQbo1zoqkFTPbbIO49J/pSZK
 lp6vzHjslYEdbDa1x/9yBjy1o5UkvUBxS9ydZK/rN7SjbLFmUqgBdkbx0IYeTIIbCEyyrUJ+K5F
 6wgsp4RKr4RuHjd9DZO67EQb/ME2cF3IX8h+6d7r0ABTDLDBWWCSbkNTV8ACtdM+/nSKhbNnxS7
 FifWCjf6qSt7bWGHoTtp8IsG9ezdd/AhWUc1EUUmhbjIEkei7z7RCya0AXzS3UoTkQYlA0MMARG
 BacwOTbhGFnx6G/xqP/I9oFyxhJ1UT0gnQu3EbfFXwrH/SRj1g9JG4JhlNcqsthhZnKiBtFeNek
 hEJPWn/p3H4mkmFJnDg==
X-Proofpoint-ORIG-GUID: EId6v9VXGpL2yPbz0dQIR7D0FoKKceCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Mon, Jan 12, 2026 at 04:54:28AM -0300, Val Packett wrote:
> 
> On 1/12/26 3:31 AM, Xilin Wu wrote:
> > On 5/7/2025 9:38 AM, Jessica Zhang wrote:
> > > Filter out modes that have a clock rate greater than the max core clock
> > > rate when adjusted for the perf clock factor
> > > 
> > > This is especially important for chipsets such as QCS615 that have lower
> > > limits for the MDP max core clock.
> > > 
> > > Since the core CRTC clock is at least the mode clock (adjusted for the
> > > perf clock factor) [1], the modes supported by the driver should be less
> > > than the max core clock rate.
> > > 
> > > [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > 
> > Hi. This patch effectively filters out the 3840x2160@120Hz mode on
> > SC8280XP CRD. The calculated adjusted_mode_clk is 623700, which slightly
> > exceeds the supported max core clock of 600000.
> > 
> > However, 4K 120Hz works flawlessly with the limit removed on this
> > platform. I even tried connecting two 4K 120Hz displays, and they can
> > work properly simultaneously. Is it possible to bring back support for
> > this mode, or adjust the limits?
> 
> hm, interestingly on X1E80100 we didn't hit *that* limit,
> the adjusted_mode_clk (576318) was only above what disp_cc_mdss_mdp_clk was

Hmm, what is your modeline then? Xilin's mode params looks sane and
standard enough.

> set to (575000), and reducing the clk_inefficiency_factor from 105 to 104
> was enough to lower it.
> 
> https://gitlab.freedesktop.org/drm/msm/-/issues/38#note_3216051
> 
> I guess it's also sink dependent, like if the mode for some monitors has
> much more front/back porch etc.? What's the entire modeline that resulted
> in 623700?
> 
> ~val
> 

-- 
With best wishes
Dmitry
