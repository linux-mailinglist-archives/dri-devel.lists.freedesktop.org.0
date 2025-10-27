Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83823C0E17F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A718C10E494;
	Mon, 27 Oct 2025 13:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMgqTSsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E9010E4A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:38:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RBJe5s2546590
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nlqNAIoTMPpjwqW+Bc96s3wX/9oSlIUuj/zs6ZRUaZI=; b=AMgqTSslhd3ndFOt
 dqaVTSoL9I0Zfjiaw8wgPnHdQHVb0/F5h87o/XiWWAoBiDz+LQfBn4koPhk41kVg
 nmXaJIjUB9k1d+TxZn4KW5VaLDHR1BAWdz6AmQbj6O33EFRrOjHwePLeznR/va0Q
 iVL063UKzUq1hnh86qwdKmwsbe33i7CqOp3la95J3+H57hCZkeAUQGINL7l8A9uH
 Sa2/U9m96B0ooVBVl0sbMowjZBT3TD+kJkuqtjWgiKjUv6ZVmHHaT53aeWKo2EZ7
 PJP1OSpcP9nalsnDkDpaTZtIqC1wnaBeheHY/UAWuy7gIBG/Rf0DkVu3yvGm6SAV
 tyP1yg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2gby9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:38:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8a4f7e885c9so30014085a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 06:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761572300; x=1762177100;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nlqNAIoTMPpjwqW+Bc96s3wX/9oSlIUuj/zs6ZRUaZI=;
 b=IRtvP80ajTY0ZN1DwrcfFsMNuFBifpj87RVW+U6w39now900mV2qIha4Bfbj5nzqUN
 RAJ+MKWKOPzKNeVrlI3LWGntWmpFy4tVZK5vb8YemAQ0dsihEtia65EuE+0gElQ8wgLy
 uN9uk5jugU1iagL/0V6jgnafXkNntvkCnzgJlT8nXPpt3rCeZgKHJ0R1sSgC+kWWdQvL
 XFgtIFXc95F9N/eGz0zQwxBguOO0STWqxahcMpXhjUJS73FU6loue4QJGSvp+CqC2tXt
 Bibw8pBcfERti6SztYfe3sj1Gt//Ys+D+XFVqQbRiYxaxzgkgbq6OJQYMMbMbAr1E3cd
 pRTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwSViTbytKnX6Ughl74Ftf71r/yj9Q9xFpOA+n3sllD9yO4t5nQOd34caRql/X1mOow+XuFUsu2fk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKMcLC1Eqc7yc9FeNhXQV0jLSa2TsQMgolP/eI4xPsBJXJJalg
 /eJY0HJwxv1jUe6uob5htmcTdlyWWVOanZdd00nCDU4FVpcNJQQXoVC8EvpH+w53SaG57cj27pE
 FydyO6owZWJHekR4+Ko7IZDiTO9kc3DxkSaHTHWFLMpps/4zXEsab+a9hVoclM8UyUgJlx+s=
X-Gm-Gg: ASbGncsLnisZmPbHD936F8QSd2lDn7QI0cg63xgJ6hUrmVpgRRDjC7z8s3bfVHNy+aU
 O6RTjeRZ0R8Lllodfds1KUuFUarzUrDcP5A0EUg5zSMa7AQpgwdQvY5ZeKRBbqJ6pl/vz7x5lgm
 bJ5mw1s0NwQlvk8hd99XVN6Bih4CWDo7DbzHayw0ha8LKhn7SH9wRYHhvlUA8ZSKQGsd4hOnoAb
 Yu2pkOIFZOceOOgNdInJ3BmsEll/t4/yHGXL6qs5yhMDYqPu2TUMAEqpqyNQMw2ynFTzaNoWKHQ
 kEfsjNVrKLTLWw9YDixB1tfEny6jYthct9t2Q0abNvrqSTr01W8WRBJ4SxflMYntycAFG5I3d6Z
 2jPx+tOxwUIomViLhTCYoIa2O0jJMHxvXdqtRWFG/VnNQaEXDSTyOh+ku
X-Received: by 2002:ac8:5e10:0:b0:4ec:fc4d:372f with SMTP id
 d75a77b69052e-4ecfc4d794amr21511151cf.10.1761572299593; 
 Mon, 27 Oct 2025 06:38:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM17AQ/vx93xjYF+FCEIiTUB1Xqjgbo4dv3HEB6b+9AnxRB7kb74w76dLXL0z+Y2f1ynGSYw==
X-Received: by 2002:ac8:5e10:0:b0:4ec:fc4d:372f with SMTP id
 d75a77b69052e-4ecfc4d794amr21510891cf.10.1761572299193; 
 Mon, 27 Oct 2025 06:38:19 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85398463sm747816466b.34.2025.10.27.06.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 06:38:18 -0700 (PDT)
Message-ID: <490a7cd8-b093-4f25-9c9b-85a3c2d86a6c@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HP-gjM_RMEc0xgqZDsmq37HrNO7TxY7n
X-Proofpoint-GUID: HP-gjM_RMEc0xgqZDsmq37HrNO7TxY7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNyBTYWx0ZWRfX5OaTroZnQ2Oy
 VAacgD6JDcBFalBhf6EK7oe4gDX92BEN02a9F6kG9VXARM7sbYBD60FrMyOXvsyiNL8MdQ3baKB
 hgbpZZf4nRkC3zgOg82nIfrHBHWRJVQkrQKwBhAEwz4+1jOsd3aoszL4BexoVUO3oXiHj/nFvWP
 jaazYZ6Y/APYEB749oxNuxqh+jjymwy4mdoiWzcCjbO4JpaEwm0AhgQ51XIMCJ4i4w/DPvWlKrR
 pYadm/x048MvZh9g/PNYijW0iLT6N9yWeD3AZbxCjuw7Nhw9xiez/JBvqpauszEvtzJrEr+y+xs
 x9YZQY6JfTBEgzTi2ZTlKIy+i4vYDnVeonOecoh4ZvF4KIaaz6OhyTLrP++T8FMp2QMN+1RbFqY
 fvIA4z2GlK9+6bmCN/TxofVbjifRWg==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ff75cc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=S0UzETgM28_sssm6r9IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270127
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

On 10/27/25 2:35 PM, Dmitry Baryshkov wrote:
> The commit a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for
> HW blocks") dropped all dpu_hw_foo_destroy() functions, but the
> prototype for dpu_hw_dsc_destroy() was omitted. Drop it now to clean up
> the header.
> 
> Fixes: a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for HW blocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
