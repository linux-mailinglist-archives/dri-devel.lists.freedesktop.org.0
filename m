Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D43EABBBA7
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E542D10E3C1;
	Mon, 19 May 2025 10:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjF/tVJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C81D10E3E1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:57 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7Gcxo023178
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=; b=NjF/tVJVpJp9dnFn
 yL97Jgn2iUw0DjUTbHctm9R+QtGTwvfaFe88tvwg80d+A9CDrCNtQyDuRzC+lMs+
 KHvSdl7O9WApTPpzDiP1Pb8qXvc8OEh5PDpMj4al3sSsMXeKyOGJe2l6CaBtR75t
 GxJuuFCOreqNhlM/DAWIn7sTfncYev5bL0rr78iYBf9W7os0Z3u16f6FWVviStwm
 gKyRpWKw5XbAigpZCWADerZ7qZzf7s+9i7Sxls8yhwY5+YtddipxDvf1J7lxEu+M
 YI4626r0kYCln6/pHHH73sLlXwFLe++XUUHQ3/FvKdYG8hB+M3qyVvgVgOcGvTvb
 BrhoZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rn4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8c0a83f9cso49560896d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652336; x=1748257136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=;
 b=V5W0ZjO0qh+ZzV3ZF41A0GaC0uV4YfvV70M64OtwND13FUPY8fR/pnWm7G/dHN05eR
 iSsPhdeY3m1iSgmlgtVjB1heBSl3mgADoFxhoHNTFtXLcy8zYGFkcL9ve4ICy3EDoYXq
 bQUjucCWCT1rLPcpmVkLTpUYzWtrecofevpePU1VJxgo3IWx6JjLG/QJaimz2ox1iKiI
 iOH4fjoVDu+8BIrQJeYMmrZu8l2rhMVoYYw9M4SmDhAqJDFfthgaYW1nYxBTF1H3gzQR
 WDjv46lldW6jAifGpX9n6lGp0OZwvD7BtbNcVtbzd67CdVzByIa3sBjWNn6R0eTY4DY6
 VGGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxISoTWAbnpNtekNVbAKUZPWP+HV/GCq+YlGnHsNdDWNiQKZmc6uhgxHwsvwl2B5DItecokm2vilA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxecGvTM/433i1H5pQgXu7T44OAuxrpg4A7sYS5nChzHJJVcx8O
 dx6VlPEuQNaRmLF53O+yhdmlzUwsg6DnajdJTJC4e5wMn0spiMHgniLtI5NdAKlVvs4PL0WENi0
 KKD6pT3TfI8IX5yNno6C1UIfQjX20JLNY/4sXvjpe8kdmfBgRPHgv8wju1NKftaqDiAOBlxk=
X-Gm-Gg: ASbGncsdff2dzEhlSmWnNiQCs4q6+3bokiq9J0mR0AuP1h7BbWcivognexyOlK8inXm
 yhsa5zA4bGWKyGQ786azNoFFgTmFdnaiRjfwN733fJH4rKP5nE1Xyf21BsH0N67ovTOIfAOGl+B
 JQCNoWn45epKm+gH1HiJUDeTmJXkAJvSGDnGAbwbNjhHb28KvOKouChVNb0sD5C2fV4iBL4IXb2
 XiY3bORRMRNzyYE8k+A0n+2r+xJ9rds+x3kpyPSmI6MUV/b73kejS71HueYNwOlybuyuOvgGzsy
 ga6JZJWmnbLlTIVMOho6GY8EbvEAqMJIUeaAzJImcYQ/sU0bwk8CwZjEH0sJuge3XaDPUh5B/KE
 TlAgvleVsiGemJlZXJhY+8QR/
X-Received: by 2002:a05:6214:494:b0:6f5:3bba:837d with SMTP id
 6a1803df08f44-6f8b2d43634mr196493686d6.25.1747652335788; 
 Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh0901HTX646XfSkqw0SlUlwGL7S94w7htNY7rCEBwseDBwVnIRM7EgU1CqdTteJyLVHdqrw==
X-Received: by 2002:a05:6214:494:b0:6f5:3bba:837d with SMTP id
 6a1803df08f44-6f8b2d43634mr196493266d6.25.1747652335324; 
 Mon, 19 May 2025 03:58:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add interconnect nodes and paths for MSM8953 SoC
Date: Mon, 19 May 2025 13:58:38 +0300
Message-Id: <174637445762.1385605.6437405000222393314.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfX2yqgz/Q7ocme
 H9IelgsOKmrqyRYkhT7Ug7mozJPWT/pUZc/b6wVemolpBA10oqUwNV4SVH/fJlJNxVtUwlCJu7h
 6ufXffzmoJEwBc5M/BzXW6WZpQGapChUyEm/ZbBZU15kgRo7/EvsIG66hnqof7OjU+iX8RHnxuV
 q0XTCv3ePdDda4ohyhiyazmsLmZdREFgU209dxGNkSHNYkYsKN8HUHCIL+VLkjSCuSgDhtE/7fW
 1S0PtKaRoeuO8m0/oeKoWQj5VyLHCp/EZaRF7SKSIlsFjLnLrUzn16To/yZVeEqEMmigXy63akq
 uPAO7CWeFFT+0CKMzKUKc3QBr9XZjDj7z8uEK1tQQtBktBiytzDsEDpD139TbbqyTfkWFlsheRv
 KocJUaOKxgpAdFuDrqq6zUwTAAJDM70Zg/XRLAsY7w8+G9YhbK+WGE2iCYSpGnIHclSV9cVe
X-Proofpoint-ORIG-GUID: vi8ihTsWsyIsBGD60da-t72muwahpQBv
X-Proofpoint-GUID: vi8ihTsWsyIsBGD60da-t72muwahpQBv
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b0ef1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=j8xinkR703XPaYax9wUA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=909 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190103
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


On Sun, 20 Apr 2025 17:12:42 +0200, Luca Weiss wrote:
> Since the interconnect driver for msm8953 is already upstream, let's add
> the nodes which are required for it to enable interconnect on MSM8953.
> 
> 

Applied, thanks!

[1/2] dt-bindings: msm: qcom,mdss: Document interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6694d17843e8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
