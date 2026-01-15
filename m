Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D16AD23A5A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B132110E727;
	Thu, 15 Jan 2026 09:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fT13+Q+u";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0w6KwTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CA510E727
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:42:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fx6b1582105
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Yui7Tq48OA9HPL3qsw2ljNXc8ZD5lhtis+0sqJdfnvk=; b=fT13+Q+uSb02fIzM
 h4i4rgC545w8qtyAkFc0kJOWypDAqXen8avlkePiwlf3UlPW7cpEApbtlun14AqX
 jGimsMdpQhV17pcZUXmj1FSwXBr49WZn65e2O97tQGzFiVSFgrOKQi58Q4ECfqoa
 7Wuhc1MhZBBj2JFlzGdjDJSIsHW8BNUcbH9quBQ/v7D6PFTfhlY5jS5KuuCCeATj
 ryZTZ0iJ5C2OC9OmIHqW1VFBS289C67L0Xn5vI6exhuEYFwXDDGr5KPcled1K3ls
 0HcUqBY1igIFN6mcsMu02Q6OsvJlBVf1ipt5Kb+gYUKYuECC1PUKUwFA0nIjqdSK
 JW/Z1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1pt18f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:42:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5029a8193c0so706461cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768470143; x=1769074943;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yui7Tq48OA9HPL3qsw2ljNXc8ZD5lhtis+0sqJdfnvk=;
 b=Y0w6KwTCZgn0LSGlSJhT4w7Q+E8VrS0ubUEzEoij5PTyWs5pkLkfAj5fOwMuHH9/4O
 FyNtFnznG5r+nlulfNlL0DlGWrCQWOgiVzc8H9YlXUz55GpsYRdI/rO08TtJffdkKwO6
 xlVyFRwQ6oxKj8l+cdOs9CGhVOMdEuUN92zoDvWARjBVEI1JPvneLTG0i22cKXpOD9Mo
 toVI1By499FZVzcdQ8gqCyqGGbX/uMQCGpc55s3Qx8XoWECVtLUyQ4PqE47KQuz2Yb3f
 F9UDqMh4BP/Vq6LSbNm8Ui1d8HehN0+TO7Iiu7HCz0HLxeLDv9PJsrtRng0IJ0r33ZNG
 ctbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768470143; x=1769074943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yui7Tq48OA9HPL3qsw2ljNXc8ZD5lhtis+0sqJdfnvk=;
 b=Mk6Qfamk9zh0fxeG7LjNSFf+g/kqvjf6sL0v+HauNZgFzm2NOu0uWSkj6I86f1nJmv
 YlA5GWLbxt8et6BGctqTmfR9NDGzCsga2oTg+FEkxeazgTNHzeHGZoDh9lDK50dIEPHr
 PvY/rd5oItjSD+vyqvRzhqRTJdHREUnF5EPxVln2uLHmrGzPjDLwbV5i4spOmz/KZery
 3P+OhdJsAORNFHqrnfBOylePC6RcN29MWeNBkNklxvw+nj9dOcJkM4KMiL9sHYBdl1Tw
 iTBG48RMPefuW7recU+tnQHqEMDesHlgKs2NxXgwTVMAGU1/ofQ6g0zgAEN2jDfXYzzt
 J+hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPGLdP7Y9aWkvZcavukj6PqDjbqo/yy+GLtLZoBaQN8RITq+mI4qtYdub1BsDAC+605XxrDU/z32M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjMmGtx79Yxhhn6fAIqb3Cxxcqm2LRyFElTsYVZZKOxUZraG1i
 gr6UnEfp6oZHQpXreVZE+8R2YoeEw+n47zTs5L/W3NjtoSLh9seZtbWqNHrmC2kK9KtAQS9Ve5B
 BLVUk7RH2KDfJ0ML2bbnQRebOW3mRaJPun15B+/BK02zNB8B1jhK+YlpQII1AQkgWEcHxSMWlFs
 TET34=
X-Gm-Gg: AY/fxX7C13kIcjMSShdJ9vZryp7JgkURY6iSfyVurQ2N1u2m/gDFbZNhgNtY4wn5hvw
 VD3iUv6pKNzAMJ7ivQmf/6xDayU9U87cF0wGv4z5/3mDAL07bC4uy+S3V2IMrOe407KypDMxaYX
 gpSEMfMNLJJwCrylD/uLVPVlJXeRGEQmL+lkgMh2grXYY+mPKiQVoh7zEltN0dqEAKBro7UmKow
 tvYh80p7fAVcSMzbj0pFya1yKr0S1D1pCTjlbYmHTod3iRUsHLQ3Zpp6TX6P7i+o2j/97nFtXqG
 fRQtOuGFNOrr5dPFY1z9eR8SFb/9NY+OEu9evKXa8ZyLplwTZ77WDX/BSsTr2+6hdyB4FRmdXNj
 ZG4Xw25HuoTdlbWmOwPdIaQqOyLcy5Qaqygqa0DbRVsMVG2K+Whcxn9NXnN8swr2lVCA=
X-Received: by 2002:a05:622a:1301:b0:501:46db:6b2b with SMTP id
 d75a77b69052e-50148535260mr61573261cf.9.1768470143240; 
 Thu, 15 Jan 2026 01:42:23 -0800 (PST)
X-Received: by 2002:a05:622a:1301:b0:501:46db:6b2b with SMTP id
 d75a77b69052e-50148535260mr61573131cf.9.1768470142796; 
 Thu, 15 Jan 2026 01:42:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86fee09163sm1459291866b.26.2026.01.15.01.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:42:21 -0800 (PST)
Message-ID: <8b44bc01-4542-4e80-ab16-10ddacc10e38@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] drm/msm/dp: drop event data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-6-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-6-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OCBTYWx0ZWRfX9guchF5Ji3Ts
 XhWz1kpsLmi122Fbq/Zjf15x+QquHZFnCZQd6NKexeWJtesHuhLfv88AsY6JLuqpH1okedI3kL4
 rPhuLz1swsHodBT/IdRP0SbMlzF8U1mURODmlZ58zM+FJ145CC8pwFEc6r8k7fKGbcVm5roD80w
 vbP+Eo71I+MBr2D98bio05Vo/TzbZcD0YS6K66FTiPzDAq2v7CdhMKqCp0vCN9eq1KVZ0plL3t7
 zjsHw9Vhe4PMiTiiT0rKoaMYxT1k6kyfLOR5c0gD73iTb792MHKfNCJpJIulz/PvHDS2N9vgozT
 EjlmgOU9y8jT0mJxgiE/TSWORrFIUKpS55zMxBk3wTAvQ+/Slslw8GvKPTkEJKFvXuQJhZDCe7h
 SwV7y70LBlJv57Jm2UtCf6i3jgFqj6qYhBbIB8rFdMXFhMcHIufDfin9HIdtlnJh86pArWvwLVV
 6t0+GeZqw3rrGNG2mJw==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=6968b680 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WKJx3f7KLcD3q_vraEEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: IzYI_MD-FimMvHFN6UlJ30K44n-Gka2X
X-Proofpoint-ORIG-GUID: IzYI_MD-FimMvHFN6UlJ30K44n-Gka2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150068
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

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
> it, removing also the argument from event handlers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

