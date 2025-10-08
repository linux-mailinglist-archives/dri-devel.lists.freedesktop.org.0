Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E1BC65D7
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032CD10E153;
	Wed,  8 Oct 2025 18:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PosQepT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBD910E153
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:55:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5RTi027708
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 18:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mxyhPRUmhe/CrZF5HttE0O7N
 aGBvDw13y3Fi6fBQnc4=; b=PosQepT/S5rU4yfEhPtpH1p53u69S6YbcJf7bauA
 9Gvp7DrWHjg4DYqj7CXedXg2wv0af9G8bvpzIs+AC9xoSpO4lMNdGYIpIVllFv9R
 jfWHcclwfdYEHmGrrXW+to+r1oxPlbfJ0qbQ25Yvan+0d+EwvxJNkYUryL4F3RMn
 zI5juMVuIiUTfjKPntYzkZXXZ8NQ8mWJPReh2dC0c4O1UiDd0JDDsdUDVRu6z5wL
 yvSJtbi0S95nk1H/HSmP5LqI5MOqFulhMIuPRmU6mKKH2kwLoqaBapi6HMiBg2J1
 CbuntreYl1m8erGOIcK43bvguN+A5AnYcKvshFWSBLX68Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nr9qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 18:55:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4de53348322so7713171cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759949713; x=1760554513;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxyhPRUmhe/CrZF5HttE0O7NaGBvDw13y3Fi6fBQnc4=;
 b=kn+4bbm5HY5oYRIZ632sd8XzdE3xCjFRJ/6tT3BoznnFQTVpQEKYwYOURo1qosz5Wi
 2fs85UMDjz4HJI2rHAksTNQGOZe6Z0yTzW3L5YyPImDCJfRQg+N+SHAYZ0nhz8dT7LHW
 n2sf6Uesl7r2Q2CR915x1nmKMd/S1CSvB61KSlshh+ieDIDu0igVtOYLCQrB6NPvwgf/
 QWTQsPt/c7D8O5MrY9L3YPXesI0RkE7idGapYNTbQOQTX/GjL/qxHOddvOKghReNx/+o
 WY6UWhwlQUP/ivZVHKGBYbcF7iwnPQOvW5XRjJeYotRJ7atspNqCup04byJAfSi3aTTo
 ECHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJvWuEsj8llkhJETx4JZbtOHiVDflc/SfM5ZYpgr2sBcKaEr6wSOlOU612ArB8kEkoANFKM68Tffo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeArpS05N38+oonxbOScD1+Fy5VBBfl07J/OE82JI76rMFKw4q
 2KKATsdljBFKducvwlJmwlW9O4BDqhVTaJ17w89dKIb6MxhblbCESBMzA8YC/ZeYBFzG4mu/32E
 fU2qKqvR/8REyY9JWcRG2NssHK/piesY9lcUjMJ6lV8VQ/069HYPE8UKzPKDhhbosKVmxyRvVty
 iwaoE=
X-Gm-Gg: ASbGnct5g4nHWwFFDhU/bDN2BHhxrqacwiXsLHe+g1Tsp5PFZNHSb5ogugGL0xee1DM
 x9fhYmOZqkZHLLyVAR1cS66pGuz9uCS3MoWGF4G09f0n8Qe858ZnEJh+dYmpixNFOrVkC8gEkD8
 cUgvBLa8IheVMrYZlyBrApMftPBdlx4Mh0DMNLRDK9q3HmxpU7uIezEudFusHCpPyrGc8tuFWQ+
 mhQXQiUM1Aytz0D6zK7CGJJgLMvpXvZqoUt+2GKW7yT97VIXjnkI+4vdzVl8wnKelreWRs07Ii7
 4Ida0w/bBSvsV5/+bbvFEC+E1edsCSjVSHpdIUWt6Bs47IKDzpRYkQaXH15NwBZZ7nHj3Q/ZZ7M
 HDiao6vc7flH+k/FiKoiyhugmBk9kUK/MJ60DiKCqYP4yKOHretZTycGqCw==
X-Received: by 2002:a05:622a:554:b0:4df:d1e5:47ac with SMTP id
 d75a77b69052e-4e6ead07cadmr64588671cf.22.1759949712572; 
 Wed, 08 Oct 2025 11:55:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9LU9w3HFmxqx8RGYdyppa1AO62f614MGbbNlcjJhmzBLRZN9Y8nGtrhlv25Odt++2usG2IQ==
X-Received: by 2002:a05:622a:554:b0:4df:d1e5:47ac with SMTP id
 d75a77b69052e-4e6ead07cadmr64588301cf.22.1759949712079; 
 Wed, 08 Oct 2025 11:55:12 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907ad9e03csm252110e87.83.2025.10.08.11.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 11:55:10 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:55:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: sdm845-oneplus-fajita: Use the
 freshly introduced driver
Message-ID: <pdiqqujrhzvkvv2gx3nhvh2y5jddulcfmhdv3sthlnmn4gsl7p@mj4omp3qxusd>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-3-21eca1d5c289@ixit.cz>
 <visvxwdwh2mcympwre6kx7xesvsysdjw6j33kewwibzfbgrbsi@dkcilnw7gk7c>
 <17b5977b-d0e6-4027-98f9-171b9e18b1bc@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17b5977b-d0e6-4027-98f9-171b9e18b1bc@ixit.cz>
X-Proofpoint-ORIG-GUID: cNCA4sJmNYet7oN64FasYcja7zrTztTB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3Atde/F+/tJV
 NU68UvzvR3h8GthpkHqUheieJFfFvnTu5U5F+2W5OI+stnr1HiFiDgNMxXF3Snu3+s38fEnz+fp
 /HzzXlGbPro51hQIiwHHOTWUkETadlZ1E622qvgv5tzKUzQT8cYr3V+F6FQgljnb+HtejXPRZvi
 R0qdTMiNkvCxShfUXgwRRJ0SNK5Fj0nPl8wF1cskzSbaDD6zarBrDuvS5J4XRNKZcEPj1f/uFlO
 iE18RIeFnCbYlFibwOtMLuqy22mI2DdXwsL4jPYqkWGwLdfzW8ienkITxMpcEpFeXvwDEVoejc4
 OU8UqLEHwsaed2SclcJ1bVClREGGqFCjgUo0FYxVbnA5z4WkOTydiUJeVq1T4OgMWyMgzi55sPy
 wfsSXI/v0T+pReSaly1RTcTeCG8vTw==
X-Proofpoint-GUID: cNCA4sJmNYet7oN64FasYcja7zrTztTB
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e6b391 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VQwtuX0fJDwWnf3U-QAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Wed, Oct 08, 2025 at 06:09:19PM +0200, David Heidelberg wrote:
> On 08/10/2025 17:54, Dmitry Baryshkov wrote:
> > On Wed, Oct 08, 2025 at 04:05:30PM +0200, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > Switch from older effort to support different panels within one driver
> > > (which already dropped support for the HW) to the freshly written one.
> > 
> > Please disconnect the driver and the DT description. DT can be used by
> > other instances (U-Boot, OpenBSD, etc.).
> 
> Just to note, there are no users (anywhere) for this compatible.
> 
> Would be the change of the commit wording enough in this case?
> 
> If not, I would then propose to use for OnePlus 6T just an extension as
> 
> compatible = "samsung,s6e3fc2x01-ams641rw", "samsung,s6e3fc2x01";

I like this approach

-- 
With best wishes
Dmitry
