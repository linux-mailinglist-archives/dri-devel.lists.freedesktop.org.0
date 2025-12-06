Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053AECAA0B7
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 05:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DAF10EBE5;
	Sat,  6 Dec 2025 04:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kyohsvY9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q//68PmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2406C10EBE5
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 04:26:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B62q7sZ2696630
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Dec 2025 04:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Hu8/G2En0ETKGGXX8lhZbAP0
 7xXmRzeu4TXO/qDJN6g=; b=kyohsvY9b5gIK5ZVV132WwNNX6yJfrn++PqAVQM8
 gchhMq91Y0qnqN4cgdOSPTZDQfXIDEKUlBBkdt667C+ZotwSODJ6v7pFcJlJVVMC
 kR7ybafxNc9xmbapUVBjaumurIVibe6nchqj39cQwUdniR6Xgw2Wbh+blUwqjHmH
 zmAs7oTx3nxpazR3tgwAn9tWIo1j2j8gKUZY7vOOL1/gHHi5R99HxRNpqoDdUBNj
 dkXvEYblsLZy6ypcVxTcITKocqt+1jS3UMZyGGvP9+k/F9A74M6wWpzrqZKIfkxQ
 X3ALGR2YB2X9AB1E9vqALEiZczH7tKrRGztUtHPvldMWlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avc2wg4dj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Dec 2025 04:26:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2217a9c60so413090285a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 20:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764995192; x=1765599992;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Hu8/G2En0ETKGGXX8lhZbAP07xXmRzeu4TXO/qDJN6g=;
 b=Q//68PmCiWlVbbMhuP+VZQjDbZ+SOngpo8A4AcEuM2OyIBFKjSiQ4p9whqAqywqnW6
 Bn7zJJAdlMBfnAaFj2weQCbV3+pyICdhYKY/HRCK3Rur/GYCqdzYruIw1Pqu/FeaEFNh
 08Cml3en7urSy2NzJpNQIAH0QDdvPk00k3hnMxFVZJ9B53s/DiczpHOfrHbi8P5ll8Ka
 YKTdxStOMo0690CCw++BVRBnN1ja6jeiRDTmam+stTdPBbfk9nQ9TrYAFH1b2reM5OOX
 5AZr7qfRw5wXXTrC00P7P7SpU/nV+cwVj0Nwzeauus/8URvhpUEqCPhTCFWndrhYvK8Z
 Jz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764995192; x=1765599992;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hu8/G2En0ETKGGXX8lhZbAP07xXmRzeu4TXO/qDJN6g=;
 b=H8Axb+XaWS5ZjrZIkSKRmJFx6a+/xZTapljfByW6NUQSLjEcjQRE3/ZOyzKwnpsxSH
 DguxhVMVjnaLpT4dqwdfy/zgcUF3oIOVxvUd44AEQ32qjL0ySs/Kk9U6c5pk4o1aSPyy
 Y330jO5dQAReGzVuTjcxaEadz/sLu5LKdC5VtOJr7QDboxGQglJKDE9s+osuCxlQajUu
 QDD4LbZl08hcikS/V2g85Alh3InXdDGL0GLe2ZF+v6tKap08dmtKLbQ4oE9I8fwda67m
 rcgtdrRzQ6lbc6hAalT4B55sKe+3q9RBoIIOdUvGYyaFP+7ziWtP6vdxj+OuO5OtWTO9
 zzWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZt3GSR7ydgpu/Y9dD9wAVJbFcZ6p1Ho9x3dlhXLDqzK97opmYEp0joacY0RfjrhQQCuk3bSL38u8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+1qTlw1jyjSqdGgOj5t3GKB2vbxXoAtclMwznyWh6a1Iqv1Y0
 FGPcect7kVyvmmzTdxWWrGPethHB+j7L0aOCUrjddHAeLap8uSEOa6Ncq0YJLUdUQ5WruWYQ8gK
 lzz7hjsaQ3j6MkHFaOjoOjX5ks+kKlJJ57ILjsdEH9PhasEA2ybaLB4POXS37JErsHlD0TrQ=
X-Gm-Gg: ASbGncs0qzGZZYAbUzC5YDzNcBAel5T686ROUH0KoGRtdymhOUE04Jgg0nsLKV043vI
 mMUY6D30EI5ZL3jRVtrta0RuAW3X/1xaTeppAeXmV1XyHlvTjCry0jvLFEmStklQT54E3RQ1LpP
 /zk+9KM34UPcp5yj5LyoAZLzBzt4FDRbMRiUT3IHoNT3CY3IBrsksHIt4pfPhpyBh/9hUN66+Y/
 4l9YhFK8e2UlZslihBiwFfU7rfxdpxQQxTSYvkE4qtR0Ixpjm4YceMGS6FHMYMSQD6QezCD2cCQ
 2DcG8WLkuX0PpfzvUYXEkMputlOrwu0yD51AXNgJwrbxASD4zIB8GJJKAQnSNfFAizdpCjhQOay
 gyCbiJcTOi6Z97YlOqL+V+FrYWXyKCTRjFB6jqTCIEITF391atxnzoFWtwE9xNtoIU1lZSwRwKl
 RkorOjSvKRJCt7xJeqDTyf+jc=
X-Received: by 2002:a05:620a:25d3:b0:8b2:e666:713 with SMTP id
 af79cd13be357-8b6a23befd5mr210650685a.42.1764995192568; 
 Fri, 05 Dec 2025 20:26:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOHLd2bPRMxNnPTsz0lp++zEjLAlPwtCJk+xAn1q+7cbKHH+uZHFLA7dyHx0CcMZMPHW8ySw==
X-Received: by 2002:a05:620a:25d3:b0:8b2:e666:713 with SMTP id
 af79cd13be357-8b6a23befd5mr210647285a.42.1764995192063; 
 Fri, 05 Dec 2025 20:26:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c2e4afsm2079237e87.95.2025.12.05.20.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 20:26:30 -0800 (PST)
Date: Sat, 6 Dec 2025 06:26:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 5/8] drm/panel: sw43408: Remove manual invocation of
 unprepare at remove
Message-ID: <a2fcngmfmrhc7jltvpmobj2xejdys6txcwbtyro5eyxx5g252b@fj27grtqjv2f>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
 <20251125-pixel-3-v4-5-3b706f8dcc96@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-pixel-3-v4-5-3b706f8dcc96@ixit.cz>
X-Proofpoint-GUID: zbF-A8W_B2k5jW-2QJyW-zMcnyDMqag4
X-Proofpoint-ORIG-GUID: zbF-A8W_B2k5jW-2QJyW-zMcnyDMqag4
X-Authority-Analysis: v=2.4 cv=d774CBjE c=1 sm=1 tr=0 ts=6933b079 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=i-udh5MX2JNcMYgkDNsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAzMyBTYWx0ZWRfX4Rzs6thQOZpW
 JlAxJ1ga6JI7W/zhVg3LwZ3apT7Kvc7PbQqT0wW3wKsCOLYWVmsvJ6Q3wG2w1kGJ1zMmNig5C+o
 ZHm3/LcrLj2CQ0VGe6u65fzlD0TRbpGpRwFMZ7HLzpNSgSwKkk65anuPZT9vIzteK8pBQVSRilR
 x31yMims3Brk8WJBJYBBTnapt2cymJDB4ISZO37nDpNCqhM/+/mrl47NUvbOqYhj0HVdZYP6LPs
 x2GiFYiv5Y9GHV/EXWqU7t3ToAoZ9AGrif7/3fQUvSIG7oj/mERfrUFDd4xT1tkQrRGOcYRlsyU
 1hBiPHZtqOpMRoisGIUaY76UG+hlyMy1k0GlaOcRw63yd2XKf9OrZHthFjbQ/QgQKAJhFrdVFE/
 uBT1RIgoLP3kQDd5Hwdx7H21+nJLNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060033
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

On Tue, Nov 25, 2025 at 09:29:40PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The drm_panel_remove should take care of disable/unprepare. Remove the
> manual call from the sw43408_remove function.
> 
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ----
>  1 file changed, 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
