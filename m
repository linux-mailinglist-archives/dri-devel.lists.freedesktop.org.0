Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C5C36E4F
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 18:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6243D10E2F3;
	Wed,  5 Nov 2025 17:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pv4jYy4I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8PVcF0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7870210E2DE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 17:03:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5E8CSG876646
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 17:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qyYx+66r12SMj/Ysz7zSUgAk
 oAonFWXlCXbOfXMij+Y=; b=Pv4jYy4I3b11wSUZ2im4uhyPzm/y+/stDpujl6ae
 SiNWLdcpi7Q11oQzcyjYzdYjIyNIV9TfBlxMNfiQJ1m+PJN5mUZoWSts3JG93ksJ
 UBkjQ64EkRdw/TMWyHM8bKnHGJJoYMkvYhUUNBWWf2IlinCVSQ6AgGl9KTH/WLF7
 F96b115k6lQXgRqyxp0hHDslt+Jl/+fl++2atmkU2kQFupy8OXAjI0Z1EvWZQprn
 Ktq5855P0EPs5kZjpDbjJP6/SRlwqS5jEsZDAK9b3EtlPjmjjn2M5EPrG6ALcTzN
 sOINubAo76eS/2Ob0dRw+m7S7oEbjs/Ltq6M46oKW84i0w==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88318jp7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 17:02:59 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id
 956f58d0204a3-63e0da26ae3so140151d50.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 09:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762362179; x=1762966979;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qyYx+66r12SMj/Ysz7zSUgAkoAonFWXlCXbOfXMij+Y=;
 b=G8PVcF0rM7VtGl3RlEMJ/xB0MBPAGBGgyt+Pkj4s78zphIbMK4pk22/9TN3OZo+p11
 bxiCoys38+nkdCq/PLdSeVEQuROiYG5HDmeGbitnNFSqIZhhP2xsx+Fp1+QVMsxEWmrD
 5ZMxkV4gvMjVZM4rATXjCg2ahwfwD0uJ6fdILBQaIl5iKxN1vdf06Ki8zPKKogOLIqkS
 t7elamOn5S7aNBHjD2if8/5wMqhzyg23ovwGXQSxokQPmOPcWJvn9RqPMLolgu+/Zd4Z
 18MA9Dw4TVJ3IKxBJeFcOT/iVP+0lkzTOjOtgDgd1sBdEdmMVwg2oo2e/SIbvAweVyHG
 QqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762362179; x=1762966979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qyYx+66r12SMj/Ysz7zSUgAkoAonFWXlCXbOfXMij+Y=;
 b=DntsUVX1O3G+EXHnVK0vArjuEzZQYg3GE84zylGOEdVKks8fGUE4ALSJBhO8ZIr+XS
 qb9vwgrtOcNih8QHN7wz/itilFR0BP1xQt6/pjb49XsGiQGhauQpiAcbDbN3MrD6GIY4
 Y79vPhqZGy+Fck/E4qq8qAUCDhtguNsqIwblMAjIQQSi07FiX9Iuo3RzNCKf0cxdQEeW
 VNoEYlI3h1CRHmbaKGjIcHTdoESq9kJT5mYP3WHJgRKnYrEb3h+EYcpOSTAc0uSCD4vc
 8yy0Lh2dogwFV3LGd+R4CKqO9TuhUoBhOtbxT/1fk2mAfvV6PapfC1rGOOXt5ywQLKe5
 Fqig==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6de36L4gsZ8mnUMFYNJNhxACWdmCBlwID9SmtAdGUclZPrNzGY61guSlmYOlxE5cZuII07pr9lGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDdlunX+YXluL/q8Fn6QtAdp3Cy6MS3X63i3wfrhHFNd5sxwV3
 Sp7qO5e830o0GVsoxAsH2ELmxJiqdodEAsDMG9idUmow592GCBW1uhlJEgHQ+ul/unEVlzvLSK6
 YfAefLbwt2igzpND9/IO76p1MlXBtpwX13TbMWs2YHc5usE6JbulPZT3lsYe0gH+CkDpjyqk=
X-Gm-Gg: ASbGncutY04v9UqetAYdW2gD7D1jTjqKzy6d6mUK2ZOctoOCOGRo6dfW0CGOi8o4vJj
 4XuRFriM6mnKBXZPPeZi4lx9Q6mjhdTzK7Yn+qhUWCG3CebcHUHeFdg5wgUL3wVBCbDD55I2WHQ
 KpI55DHQ/fLeMrOlYdMHw4Zil8vdGj50atS/TLjjX3RVyZ0cknL/k3gtoGVErr6MnQlvjjx5hDb
 E0rdbp1MinOm6nMc616Au7k4jp4oxh4x5jf/wHAaBNt4ce4jIXB0LohUPnyU4kp5WxtgBA52OHM
 9DjxZEwm8oBvkVtgXhEg+XLNRbU8e4MPtd9dyYpXzjE8Z1sh4jgxEZ/aOTtTADw58zGeso1eARO
 j0QdbKOXxRE7wYB9qynrNZLyWIdQqpHkyr/83qMXRWCOyvQNL8C8Uz9jl8IhEH6cMSobwx4tAJx
 +dZ+NErOneddhG
X-Received: by 2002:a05:690e:c43:b0:63e:3099:fe7c with SMTP id
 956f58d0204a3-63fd34c50f5mr3160645d50.16.1762362178866; 
 Wed, 05 Nov 2025 09:02:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTAmyohmCTXGVTToGXMGdUogTSBLrIX4kz1aq4q66xM2USJqaQ352zw9xnhAw2RV1nJjCJjw==
X-Received: by 2002:a05:690e:c43:b0:63e:3099:fe7c with SMTP id
 956f58d0204a3-63fd34c50f5mr3160583d50.16.1762362178181; 
 Wed, 05 Nov 2025 09:02:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-594492b411esm34691e87.105.2025.11.05.09.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 09:02:57 -0800 (PST)
Date: Wed, 5 Nov 2025 19:02:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/5] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Message-ID: <motuct5ezykbkta2wz7ek2vwnfaamphrl7b2wpv2bvu7qnnbmc@4j4aurlva4iw>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
 <20251105-a663-gpu-support-v7-2-1bcf7f151125@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-a663-gpu-support-v7-2-1bcf7f151125@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -TrYwmxo-el7rzvZazfTxdpAq3EPWDGh
X-Proofpoint-GUID: -TrYwmxo-el7rzvZazfTxdpAq3EPWDGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzMiBTYWx0ZWRfX4+vvwk5eCwO7
 8euOIwq0exzd5dGz+ClVWC+REfZF67J7ElPGaibkxirH6zq5aDW41T5/ArFSj0qY5++V25y57qG
 OPpHShQ4lhYJjhWMJVmeaJ0YWwnBXzLdHjJFIvXElP+WVTc6fCge247ZCwhGjdsDy9jGYxIm5lu
 3PPi5Hlvn8DrsYDj/2KfCwzstVdXg/9/UdU1FVwAh9h/T4K6QbMRTkegyWCDTIw+fqjsMpAFnhT
 E3WCnAluY2B2uOI8SA2YdK5VTZ/ZPAt8DypkYTH/lYu8NmRM2gaFhtMA+R6E1Hq033BPWMxkRAK
 NSopq6EOazGynulPKbcY7QXIxqCLZlT41QCjc68y91xmMiQZnOyP3OvlitsKy7ExhNNUCIXyGjK
 kGNrwcWsBeKYBK+jhboWtT7wJH+lmg==
X-Authority-Analysis: v=2.4 cv=Mdhhep/f c=1 sm=1 tr=0 ts=690b8343 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UQAiW8fk4jwks4S4FoYA:9
 a=CjuIK1q_8ugA:10 a=nd2WpGr1bMy9NW-iytEl:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050132
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

On Wed, Nov 05, 2025 at 10:15:46PM +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. Also, add the speedbin
> qfprom node and wire it up with GPU node.

Technically the subject should be updated to use 'lemans:' instead of
'sa8775p:'

> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 119 +++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 

-- 
With best wishes
Dmitry
