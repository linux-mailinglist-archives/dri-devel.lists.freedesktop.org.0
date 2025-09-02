Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E1B3FBD2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 12:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0219F10E64C;
	Tue,  2 Sep 2025 10:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvgMUzYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20D210E649
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 10:07:22 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SOps013850
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 10:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lioLz+MVb+lNAwEehrq912Az
 AcaUt5myxr/iYapOUHk=; b=SvgMUzYxGKdZZyKPhp1OwR6qTyNBlKhCOywOuZjT
 m2PHwjCOpXk0RstPf8TVPfcw+I8DnE5FYwJH85mR8yL3WAGkdRdBAt3KZ0J8ff0X
 tu3gOSYtQgcwXmwFu0SrG62EqNz9UlkzJ5jZecOdMJeNr/ilnazVs2rJV9HRUKNc
 LB8eLtxrT77Vj0vnUb6rT7ipr51cDfdEQE0OCdCwt8NgFkYzIHN04CImk7Q0JhZ3
 c4mmP3OOpAp3kmW39ju/kvvuC1l6KKP7R/yxAWLWmKESkC3jLmJ5uMCnJ1xh0VFu
 JWmXuHIlQ/SNQsA9nXpYpIB4dIj81gu7jnnGgI7Sjr3pEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0efhx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 10:07:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7f2942a1aa1so1410072485a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 03:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756807641; x=1757412441;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lioLz+MVb+lNAwEehrq912AzAcaUt5myxr/iYapOUHk=;
 b=RuWD29ERTZkRhJni8FauDSOa/Y6ufkOynoLt80EWcNIoLKcHPuNRqa4qoVRV7lh7Dn
 J0nmmHHiVUcISTokFHfrtvIR2ylGWH1/EhkitEChKOM74WtdIZ+zaFFoQzUH/+2jsaJy
 WfDxQUPVD7hK72oCxkqwhnJpSjOnNcWok0IM09KjNw+hkQSPGoFUL0mAX5gLzcu1SpC+
 GjPzJBMYGjZx6+u/TIRcdbarnCfesaIrFDsgqugFflewouymnwZegKGLNwWYh4nhCC5S
 wD9DbeVRBOvh+/dxmumgnynJheFHctWjijOyQ2vY3ePbs6+3jjDsy+dx6y6Lra04arZI
 G9ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmu7fPi9bny3XCMyxGtl++cm9zLar8lBorEJANL169jZHAAj56lvGemn95Cr7L0r7ebo8SiP3ZCnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUSxjEn4Y60Nf6BguQXPZnfd9SrkimCmsf9V3uSNEJmAY2MBfS
 zXwY4Lkgpodb8A7aXTuj/io7HzaKobbDGXCWtG0rw6MpTXDEKF3nQWG6p9bIJjG1KLk+W5drP5f
 TAdnGTRSXmjMP3MzIy4kSK66V2WaxCjuaF42hzaj053msx5+2GjscLyH7mxhXRc4JX2eZN8s=
X-Gm-Gg: ASbGnctWERMWNRKYcANSP2KUuyt5o4SoHo0PoBr3ri3LqCnI9sGvzcOH8VjVX9eWIF9
 iiFnS4P/5UI1VRNOR2kOwvzloXFfk1FiRm+4WTbI+LxFO5NGipadtjDMtYYLNA/B/m6f1FgyTXY
 ZV3b6QpXwJ2G4nLpv/KfrRkfq/SVG8bxNioDsPT+et41MwPPaxfOip321dfwjB1CusRrnTeHi4o
 PlTKD/3uEI0kQBw3ILZONc8kJ3PCxQIyjc4pljMAOdbzj1E1GkrvQY8zKBacxKwkOs874P4kqlU
 FJalUFyJncPqQWURnail7vsHrP2P+b4x8S209nLvo/b/MxDDh3HdAkQG9wUER9JWEOGSun8U7UW
 TGTYexZ3qek9ovqVg59hG7iVIR/49bIP+79b9dpmhrCZ9kGZeV+oN
X-Received: by 2002:a05:6214:1d01:b0:70e:782e:b259 with SMTP id
 6a1803df08f44-70fa99552edmr115899466d6.26.1756807640299; 
 Tue, 02 Sep 2025 03:07:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgdoQnMA6U5z0bGZ7Wuiih/B4hBhoB6kk4Yipx1tsvtcSQs2cJZx7DcWOnC6cpn/6Cs6Hvdw==
X-Received: by 2002:a05:6214:1d01:b0:70e:782e:b259 with SMTP id
 6a1803df08f44-70fa99552edmr115898976d6.26.1756807639672; 
 Tue, 02 Sep 2025 03:07:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c50317sm3922901fa.2.2025.09.02.03.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 03:07:18 -0700 (PDT)
Date: Tue, 2 Sep 2025 13:07:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 8/9] arm64: dts: qcom: sm6350: correct DP
 compatibility strings
Message-ID: <37ax7uhzopemvmz5fgtayzz3hmnxmfcbyjhwgfgkdglynuo5oj@fud24vsqodnj>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-8-2b268a43917b@oss.qualcomm.com>
 <20250901-defiant-illegal-marmot-7ce0db@kuoka>
 <abkkn4f7uca6tzjasltyysxecuuirxxvbjz6l6re5v4z6jlmuh@ugz6jtw6vo4n>
 <ddd0f518-f9e1-49e8-bbaf-b810adcd35b3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddd0f518-f9e1-49e8-bbaf-b810adcd35b3@linaro.org>
X-Proofpoint-GUID: L2vs6h7pFiidSNGVJIgoFf41OkLE8Xs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX7xSO2qDdWZPv
 VKZsnH2K+5497s8DjgczJkHrpsqJCJFwKcrUNtzqq2Z8xS0xfaLMbcgOk4spe1yOuACojbZ55/k
 ldN0NjZnNzlpQO4fn5hQS3WPyD1nyddkaMYgwpW/K5V/TP8mohMVaHlQWFtFOOpbYV1YbHSdnav
 Nm783Y+R/QETMVcrBj8WS1xrNGsQcWgXK/YldcXwbdvU64+ME7pLnFV/qqgHgaSmbARWJKdomdY
 pyfTlHbMXm9MKBZoYEgRQcC7CDSJHHrhNJLtwpXOPCzmVu7z3Vw2whbpXFCAa10JCwglfgqQhAr
 dfViskVxz/8vQj/lM4euATJSMTjGUeJ5GYvF5tgWZN3aZtXw/WkZ1NHAWEVb4cd6glqmbKO/X9j
 gwyXP3rA
X-Proofpoint-ORIG-GUID: L2vs6h7pFiidSNGVJIgoFf41OkLE8Xs_
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b6c1da cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=1RLsJLrTPffC7TqSMS0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

On Tue, Sep 02, 2025 at 08:07:22AM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 06:04, Dmitry Baryshkov wrote:
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> >>> index 2493b9611dcb675f4c33794ecc0ee9e8823e24d4..8459b27cacc72a4827a2e289e669163ad6250059 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> >>> @@ -2249,7 +2249,7 @@ opp-560000000 {
> >>>  			};
> >>>  
> >>>  			mdss_dp: displayport-controller@ae90000 {
> >>> -				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
> >>> +				compatible = "qcom,sm6350-dp", "qcom,sc7180-dp";
> >>
> >> No, that's breaking all the users.
> > 
> > WHy though? Both old and new lines are using fallbacks to bind the
> > driver to the device.
> 
> Kernel has sc7180 fallback, but what if other DTS user does not and that
> other user was relying on sm8350 fallback compatible? That other user
> won't have sm6350 dedicated handling as well.

Oh, a user which has SM8350 support, wants to support SM6350, but
doesn't support SC7180 DP? How hypothetical should be our users?

> 
> That breaking of users I meant.
> 
> With the kernel it should work, assuming SC7180-dp was introduced
> similar time as 8350-dp.

SC7180 DP was introduced several years ahead of SM8350, if my memory
doesn't deceive me.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
