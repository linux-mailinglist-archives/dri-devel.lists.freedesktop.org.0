Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AA3CA945D
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 21:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF35210EBAD;
	Fri,  5 Dec 2025 20:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJyymNa/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLGUjrtu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCF310EBA2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 20:34:16 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5FBMSs1077662
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Dec 2025 20:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ehuzl35F4YAd5WxwHE5AJrYf
 pPfLCfoNEcUsRWmL6k0=; b=lJyymNa/xcnscmqNakItzrmw/Ty4x8cGHG4fzKfb
 bzO21gbDHMrc8i3tmer42h//uSwpfR7UEs9xO/dnAuJ2TGHAva/xqNWwO/3RDbOS
 KFHI2qWC6itwoe8wBJGXHwOLzrHQqSqq+0ucYlATPP4JIKQ4wHedXKNhWb7Wjz22
 ceUEFFU3SytpmwW6TLsf1N1MwncE7jNrfiE8SxN194uIP20jbIupwiS8KZh3qmKQ
 78syJ+98W8HseTgiXNaQnG5tI1cwn3ectMxTSh4gjaiV9y0Jg4TCicTbm6QdBgYb
 NhtaMe7+MdIPH42IL8T30VPsyYKazOMMGahCXdMrJklgRw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aupa8tyeu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 20:34:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2e2342803so550802585a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 12:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764966855; x=1765571655;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ehuzl35F4YAd5WxwHE5AJrYfpPfLCfoNEcUsRWmL6k0=;
 b=gLGUjrtuJLhoh7y5dLlylATZgoD4lmsj3bUDYca1i4aWm/BWuXs276AI5RN4rxP0rV
 PUZ8i8EP6Uj2Yp5n0GMVXhFinEILao9EruJxANrS9r7/9OWQ+HxcrypH92/8AuXFyLY1
 QvjQUgyplezHuASrznjFpewCO+NaldfraVexV5G9k7N16RNbIzcRqHGjKDXPrhMlZ7+d
 +mOPXNhs5Ju5HfcbXRO0PfQfcAkzM/HPKPnzHuLp3NBrAiscx7nMeSQNaR5WJs+/x2VS
 3I4Qtb34NgeSSTOyzoBhmNlwqR5m7HfAOMuSZRaD6Cj+TIDQxQ+DrMN2lKiIWwd6+kh1
 KFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764966855; x=1765571655;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehuzl35F4YAd5WxwHE5AJrYfpPfLCfoNEcUsRWmL6k0=;
 b=BYSXtx0qRK9gDOYo7fgMxQLxwAmE3HnPU4/BG6ggQNuupd8HePLBaBnMtBQcq2VD6T
 8zqoMmkJpTBsacdDCoVfb/M/IdA2Djv2fMQS1QVlbjx+GkvF2o+Z4/uMgPigGvOcZwS0
 jcA02SxhTjuuFLDhg5F9cQFWYzAmCyq10OpCn48lrPwQaLGGsuMz7SqsxgK+DDBlOmoy
 NhIWoOlAuCRkQd85oid4oymDE5LnLMywKrqspq9I6S3IObUkOsOC85pJEtJrDUhgk21d
 Tw7KhGjdfuUBUQ87CP9lcIUS9FXZl5Hvxfupt1wosO/904AIiuI9qk8/kf322AxS0I7+
 +H3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJdMijYr093lYjm8JHVEFCJYbdkQNsPIqiO2h6WUxn+CA8wM3Z692oxAK2oo+WkFkDkV26zpAx/Is=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEuH7PakXTrj1maMD7Qz6X2JLtt0iq9R6poQDaz+tEMhYefO4V
 c94yGzsK0aQ3RxfCEjMlLF09yveflzJLZ5k2VI2Fmo6MHwvm74SxYJU8dmLNgIVA2ffiIJEa8Gr
 xNktzjyb67nRk4M7on1HvMlpd0q9VZ6n8jDtEn54Mb1Xmk79DVwBBir7mBcZg2a2KFwG9EeQ=
X-Gm-Gg: ASbGncs8kSs0GCnV+KfOuXQmaNPm8GPpXwYxHidQfGe/F57JxsD7ZvsdiEVgYSfChMx
 8+yteaziFpagm2U7mapZfAEKPSTdUkcGaJhjY23H+A5KIaH55daBynHLAMt0iBPhR6DLlhA2ptO
 c8KmOBnZSj35ttqagdICr/FXyiOdyFqG2EOusciJHn4uhI1Fam4wrhtywtTkcbsJUfIbiRBg1UT
 aXXdycx9XaRO0MmaCWkMvhA4EhFVNGFNOtLw51x/YlbgrPbFr/yGhebgsiVLsiio6wOmRash1//
 fiP4JCcpIsvhCM3Q3p1TyzcX9sHPRn0QU+1x7cSLU4TTSxyEmbWrqogD5AMX8JSQimHQTp+n6mW
 WsIaCTLk8v/7xe9L15B0uu3+buucTBGTXeB6QqQxOrIqK6UIdDQi1ycWEWhNjE7GoUmcNR1OTDv
 z1+v9EqAgl17sW/xQxgsCqD5E=
X-Received: by 2002:a05:620a:28c5:b0:8b2:1f04:f83 with SMTP id
 af79cd13be357-8b6a23e4122mr47642385a.70.1764966855113; 
 Fri, 05 Dec 2025 12:34:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSJwImahBezA+ehEO+rgt/lG9XeY7S3IiD1k9RLtugDrQeAM1A3hmwstsLFPwhVXBehFvy6w==
X-Received: by 2002:a05:620a:28c5:b0:8b2:1f04:f83 with SMTP id
 af79cd13be357-8b6a23e4122mr47637085a.70.1764966854603; 
 Fri, 05 Dec 2025 12:34:14 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c281aasm1781336e87.82.2025.12.05.12.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 12:34:13 -0800 (PST)
Date: Fri, 5 Dec 2025 22:34:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Message-ID: <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=693341c7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JECPFCAl0qZ1QQZhDD8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1MyBTYWx0ZWRfX1nVHZ6JYr2Ml
 f3sf0HhS7j33eOouNGuFZQ9zEoKtHAlQQoD4YD7OkeIT1fnbaLN8+pYqKSD5quYeeifcagFjG5y
 CYIBd8GX5c5E0WzbG8eqHuS8X92qlr0OZ5aWRZf6qzDYbytxzyaKMKRj7PChXiLFH/i2rIk8ucc
 oNG1z+jirT7znNeFNxtbAw7mFfCfAIbz/Yi8JaC2C6b2akZX89xaTeT0EYfwwX0NigG3fNplEdn
 U1Ac10k998mYSID9hyJOESe3gDBBfFfiEzt2ZHTYKha6Av4NmC+oIlwM9U3vTfkxgpk48KxH5/+
 Fum8XooljlAvB+QKS36ArCPbz3VawxOGzWFnRcBo2aaM6MDFISOHU0qT93sX9zcogEW5PmWbxVv
 Ajyti8OYp4IwLh/yqHUm/z28VhSSUw==
X-Proofpoint-ORIG-GUID: ngcD2M7Q7euLgyu3yXxAOIc9_tx0trN1
X-Proofpoint-GUID: ngcD2M7Q7euLgyu3yXxAOIc9_tx0trN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050153
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

On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> > On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> >> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> >>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>
> >>>>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>>>
> >>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +			gpu_opp_table: opp-table {
> >>>>> +				compatible = "operating-points-v2";
> >>>>> +
> >>>>> +				opp-845000000 {
> >>>>> +					opp-hz = /bits/ 64 <845000000>;
> >>>>> +					required-opps = <&rpmhpd_opp_turbo>;
> >>>>> +					opp-peak-kBps = <7050000>;
> >>>>> +				};
> >>>>
> >>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >>>> or mobile parts specifically?
> >>>
> >>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> >>> here.
> >>
> >> The IoT/Auto variants have a different frequency plan compared to the
> >> mobile variant. I reviewed the downstream code and this aligns with that
> >> except the 290Mhz corner. We can remove that one.
> >>
> >> Here we are describing the IoT variant of Talos. So we can ignore the
> >> speedbins from the mobile variant until that is supported.
> > 
> > No, we are describing just Talos, which hopefully covers both mobile and
> > non-mobile platforms.
> 
> We cannot assume that.
> 
> Even if we assume that there is no variation in silicon, the firmware
> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
> wise to use the configuration that is commercialized, especially when it
> is power related.

How does it affect the speed bins? I'd really prefer if we:
- describe OPP tables and speed bins here
- remove speed bins cell for the Auto / IoT boards
- make sure that the driver uses the IoT bin if there is no speed bin
  declared in the GPU.

-- 
With best wishes
Dmitry
