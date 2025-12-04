Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C743FCA2FF8
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BAF10E8EF;
	Thu,  4 Dec 2025 09:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5QddFXj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kz0dX23g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D804510E8EF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 09:30:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B48bFB5829394
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 09:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YHZIS/ifGG1Oi6aVWQjKLm6950VSJb+EI1VzQSHfDCA=; b=O5QddFXj5oDC78Eu
 AFD5D0c9iubG3vkR+/J2i1qxT3ElqH9myB2/Ni0eABOe4motCjDWJRqaRrzfrqmr
 rCqrsAW06wJ9Mdd+pN2kXo7dsrXcc/iAoOh5eOstWxEDjsbqDQRis+H+2rtbsdS8
 qioiEqo/yx7vrRucFB/2ccooRVd88Zf5F1qFJuS22jQvHC0nTkO4lKUPCX4VNQ6J
 dPnk2aMfigsN0+4dnNjpU3ExnmO/CEWqcr+BYlS7QncP05Jahf2jwcddRKDC5D60
 wSbIVCZZ2r3DQV9HrzD647Zkw6/IXXfQn/sPuTfJvyeLe85KIKzLCwwcXHdPVXl/
 O8mSoA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6xp06bk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 09:30:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ede0bd2154so1861121cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 01:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764840650; x=1765445450;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YHZIS/ifGG1Oi6aVWQjKLm6950VSJb+EI1VzQSHfDCA=;
 b=Kz0dX23gkrHt7v8TNtMCkeVAd3vbuOxd/49bnV0b0JRx+AlkY7h57aZpyH9Ilsqm7Y
 kyS446fiGlsMvR4l7/5BiKt3i4d92oiLwKA/7IZipdltke168TU2vrNNq69DObYsHTaj
 lrYYCFjHxISGwSyFsnD3ABtxGZi4FFMa+hintDRxcqLbtV+hpqHC1aE6HBls+W3yFtin
 B+giVM550arGpgxrfL7wBbGqG4+SbC33wtbkS8uV6liZaLnm6lcMR1oOd378xSWWWw4V
 EVhGb3GL+LGqb2uW1Jdbo9Z8MaIgqQPVM9NOTFX0si/lF5k9SxcngIBX2H3Xyg/1vloc
 vaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840650; x=1765445450;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YHZIS/ifGG1Oi6aVWQjKLm6950VSJb+EI1VzQSHfDCA=;
 b=g1H89rTRMORXWawaIQqv/+NvuAlHlC8HV8i9zdjI24PUU+GABNOO8CV7ttDJWkHvrd
 edphJasPKTenABc2/e7GGA1kFerLogfiWlHXECend/maRStQD2Xl+ZiBOS5lPa06hwvl
 V1ews7GEGSDW0hySjjJLigZW+AGYVyrUZRA2yceg68a5/hasOtbumqz3ewqMRFhlA9wa
 XBPKX92QgWZ8GcDjNBsx2roXZjiaAJ1wzgrFFJUnO/dBAfHhiiQJfguBme/SSOJhLLYa
 HAil0zQOYFGhcZRwFGImqyy6uur4lPXwCSF05KhY4b7hOlnCMgbInAj79UNRtqHkAiii
 A6Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq3jevU+miUsoYdsMs9UDV1ku39pxyviysyurBgv66Sq5+9TG7GwK5xynKvGJnkV5WZI93z0KwIS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpUNO1z3/69ZKLiARbwQvPkssM7JrrSmYeA3r6BAV9q8WtF3us
 qC74zGx8/xGs+M+JTwzNHcm03vqeePtpZ7f2dk7d1VZzRZQa+o3JBCtNAZPS6KW1wRN01t5PD2a
 d+sySi06uETfioMCisrUCNXvIhJATQNARLHEDfETgKvH0xAkb3NHYbgS0maMVp9H+UD0NiLA=
X-Gm-Gg: ASbGnctXhb41SDWOXSRfgq9EHlAy+qsbcCStj6oVGZQVDCdCWCUB92U6XiT8rCu4ZDF
 Fx/VE8MhvwsWYILT1JZZDzqQObQO3dVErEkMHeMNb5MFg/MxNOhMMtzjfAsYfLn2xEr++h8a8R3
 lZu69Kz3Ofo1tc1Upyr8ZJzuAMAEAJ0ObCOIUNLKazEcxGnLl2mQwoceUFQWZlbYRBihWOt4/67
 dtcjBhWZ72c1QEEdWvvFiqybzHeprBLCIUfhUGByvrUm7bwwp9p1buSjceQhmjqOxI+MGPaK2pH
 TMqSRrjAyQSfjb/KGDzSqr/e9hGtlWS4a6iXYz9uo9jzQ+GPMO+2+iES3dEMb8aYgKyaIWm7P5V
 X+wzykKjDTSBTWF+6zLihnbkN3lJGaYLJsQ13RVmQSwBrdn2SB7nD1DqtHwLpvGhMdw==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id
 af79cd13be357-8b5f8bffce1mr486936685a.1.1764840650301; 
 Thu, 04 Dec 2025 01:30:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNiLdjRNKO9ZcI4TFhvnmYWWXLXzFWvAeb2BmQ6tBMrffZy9O/0DUsPB+d6zCalUQC5juiFg==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id
 af79cd13be357-8b5f8bffce1mr486932885a.1.1764840649717; 
 Thu, 04 Dec 2025 01:30:49 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4975c88sm78208466b.35.2025.12.04.01.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 01:30:49 -0800 (PST)
Message-ID: <46d2aa15-6866-4777-a080-f983ba3769d3@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-5-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125013302.3835909-5-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RKW+3oi+ c=1 sm=1 tr=0 ts=693154cb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=OIU6w6j0321fZR4p8lUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dJH52yun1v8mefxWXNlx7W1UUN98af0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NyBTYWx0ZWRfX2EUC/9+UE0Fo
 hjk9X07j9F/PPy3/Rk2fH7Ca7wwJ/CjKy4CG0K3Up4aGjzVsABR6YFP7d2asjwhMFjb6pHgrw9j
 3U6ISagkq3BePlSlw6ttrWf/rCdcAzoHxc2Pbznaoyz9NkR2rtdH4vKt/xExCYbqYm715f6DBKw
 GbETcXrPsFr2O9y9DVPje9KBaIOhjoyReNGfHLj2AzPOIULZ5ANk17jO0uaxJfCQ2CauQ7GHJYk
 Q3bL+ZktZrJP35EusnLjYVzqpxPfGMrtXdIN6rIzR6v3RlgCcsWUREjSUqZPW4OQWGHGUXy/fhA
 z/VIfuR9/CG8JYpf7Rpvtht+zd50AWln6a3t6cHKRhObIblFS73f9jt6EfYFMF82EKreJ9TvvIL
 Q1DO4XgQP2b6hfMpI7zdJ1YnJVh3VQ==
X-Proofpoint-ORIG-GUID: dJH52yun1v8mefxWXNlx7W1UUN98af0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040077
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

On 11/25/25 2:33 AM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +					port@1 {
> +						reg = <1>;
> +						dpu_intf1_out: endpoint {

\n please

[...]
					port@0 {
> +						reg = <0>;
> +						mdss_dsi0_in: endpoint {

here and the other one too

> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dsi0_out: endpoint {
> +						};
> +					};
> +				};

[...]

> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";

1 a line, please

lgtm otherwise

Konrad
