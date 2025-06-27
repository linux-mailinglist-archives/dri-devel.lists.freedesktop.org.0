Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C3CAEBEA7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 19:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A460D10E336;
	Fri, 27 Jun 2025 17:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bktBNDHk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BB110E336
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 17:55:34 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCLQtf017688
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 17:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xhtPwHF0fTtys7QWflgWfeVzTXfKtMLTUh3g+imGqfM=; b=bktBNDHk6uXDTEkc
 P3hPdPknqjLUHgdbQBnOxh0EkFLa3qjGh0hsd72BMxnmtzFKmSqT3MZn6H5wQFZn
 esyndwzb/ajSbcEuCUFWD6HeppBAWxX45VTf5anMua3JjOjDl+mRUxlIT2fh8DNb
 LFX7XX7JeuSDBYFs12oq1x0qRnbASgbjTqZmYwvKsNNPX9rzMduNHgdttdd4TY79
 htJBfVjiXzKr++u0m8uUbvkV8dJgth9Zp6qf3fbyWl1ej16lGxZrKGOczkqGWWEO
 qMsuPvV296TfDskYUzZ1Cu4EyhSKTYnjECJUlJ25z1D0BUiR4jJOgy6b2GMsZpN+
 HWYIcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx5xwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 17:55:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4a43be59f17so4162421cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 10:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751046932; x=1751651732;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhtPwHF0fTtys7QWflgWfeVzTXfKtMLTUh3g+imGqfM=;
 b=CZVMjUJmRrsZkoJAEOdaXoYISFI8FgpykRGdrveqYxJs55+AvaDlLTLBBjdwuv1gcv
 TYdkX6Q/wHtZqZxTFMFsSG7cI/5zAnFxN21fy1RwYpBmW8q4Yh/EHaj1rg1Enzy+vdDq
 qsJsz9nWeKdLAad96/3s4CFdMnQaRgsDXteLWpsBc+PaCDo6CsPj5Cu+aIGw1NaE9v9n
 /vpz9x2uxpVf7/rp0ILP/a3gDeu8ujpotYnVw7F6NmRNZaAy1GyZD7NH5WOfSxjKnmDR
 UAKU9M+026E0wbT5ExaYgd/6ig3hOKaTqaQaNM+4fbhBPORqGf94QfLell2x6hmyd5lz
 RgfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUULZj/Ddpn83wW4zex8NIoYd6XkxtT4L9/RQMc165c1pVhWJeGi7Pdz8QAM7vEc1d2a9TLc4ByWpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsVXahdPnubpT0gYnaQ+BOV++OXt3CoBT2p0/uUQernhQAAGGp
 W59jyuNN8V8UyXuHLeICG6nLoReZqA/97qKswcC8JcQiz/Im0UMBcSZX4oMnIqbLPeprZezPXZ4
 +TAVJCX+uDApCjObzI+eTQqrBOZusqiFQeJkMhfksrU83rx4bT/Q3P/Jl57hGqUShNHfQU6I=
X-Gm-Gg: ASbGncsIOgpqBVtoNhq0XmK2qHeh/fTUNzCFGnJcjL+S7KPdbmdA/gL04b7bJS9Vhqd
 5yH4agncQ/lRikoSWh7yJfg0eANbiTNfR5pGj2wlYoMhc4E7EM16Gxfo1B8giy6rbWQhDGm7bLg
 imDgrVm2fidEgHLoi2q7SJLwzTgQYAScBFX/NVSdI0t4+YPPqZnbcc09lIe3fkt2JRRAueEy7RJ
 l1CBnxUyPmhRDbJXHLrXxZGjBKr0295rC693ZjS6YkyeDQnxaXpU6/BaIKW2y5mPQQAls2/QwSZ
 D6VrbUck+DE3hqmRaViKLgeQKZRbZ6Dl6sfD2nYzh39T5khrwyn0r0Db9aNcbRL/ek3iMvoW8bU
 iJQs=
X-Received: by 2002:a05:622a:1a0c:b0:472:2122:5a37 with SMTP id
 d75a77b69052e-4a807390ff1mr1922951cf.4.1751046931715; 
 Fri, 27 Jun 2025 10:55:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjS6V7nSMnoKIToCQDAP4GKzUa5d91t9ousBqXncQjQ5eyhDeXwLOlzvN8i3GRTqy4F6YNGw==
X-Received: by 2002:a05:622a:1a0c:b0:472:2122:5a37 with SMTP id
 d75a77b69052e-4a807390ff1mr1922741cf.4.1751046931099; 
 Fri, 27 Jun 2025 10:55:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c828e1a96sm1778182a12.19.2025.06.27.10.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 10:55:30 -0700 (PDT)
Message-ID: <80912fb3-2af3-48b1-b81c-89bfcdb54841@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 19:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp4: Consistently use the "mdp4_" namespace
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pP5fpqyl_bzQCPU5Sv1C6OIdmF7Sap2k
X-Proofpoint-ORIG-GUID: pP5fpqyl_bzQCPU5Sv1C6OIdmF7Sap2k
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685edb14 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5MiDvfStR0l9wvLywkEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE0NSBTYWx0ZWRfX8tGsZ864ue7w
 VCDa6gZxEm/jsMB/5et/tnZ5qZeKWoErd1EaE5fQ4YW5ywgYZiMMCljhg0QepyERaWRhQpFgWDy
 qEJhtFYAThZ33xlNQzXPhjX9dKICPcs6s0vtCfIXa7+Xc4cPhcRlFj7hMqgPYA0Cc2OyIzZ2QtH
 eONNFadeQ8JYz6J2xTT/TrPzoZiQ/AQ5t+hEdxtP63HEqMKFYIxKEeZAGwpLLCSTf+IHkvU7BhI
 2BsHs9lPhDogUeqmA3fdg++KFurYqHOUeKBVFSAVjNj5WSixMko1FFW4AMfE3BlOif95b1iK+/P
 RPMawTFrVUccGluL4Vl8+VutrpjoSZB2dj8znVNDDtFTaLBFW+35chw2gLjmgS4fQiqGzW0lc04
 +Y+8d6KB58jZkWc+slsS2k4cxUO0vVXL10jFfaZVI5sUq0Qy1KVbM7l4MHctbf0MB858hsIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=882 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270145
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

On 6/27/25 7:18 PM, Christophe JAILLET wrote:
> Functions and other stuff all start with "mdp4_", except a few ones that
> start with "mpd4_" (d and p switched)
> 
> Make things consistent and use "mdp4_" everywhere.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Nice, thank you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

