Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349DAB2057D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EA910E435;
	Mon, 11 Aug 2025 10:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pc1LXYLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1367810E434
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:57 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dL7Q013542
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=pc1LXYLl7ATW5RR/
 kv8JpWpVMMWw6zDJPpFQHQ7cxCdNIoJw23Y6C7KZquAnSB8OpJRQyTNuUJmSS2P8
 OshHPidOWm4CVWrVdmth4VW0r4vZPE55OsDDgssvmsUTt/BdbJ31BFlZgtSgKw6u
 E5FvUgMV20hUv8uySTQi+0+JWH6RpvQtQ7NoBGZErnvXEUYUFo47K2YZFiQxtGKy
 O8OpMdA7wDrjvoHYcdH2V/PTSigHqq6CGLD6XUhkV1u1O6BR68MvKKcxgpf5IP4F
 W1/hcINTOUS+nKozwZdV4icJmqr/nJyWezckGN2Zs8kVO1JGkW/50a5rEpNKXsX8
 CvANDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmm5f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e802190d0dso121462285a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908435; x=1755513235;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=R3JMDx6NiOMsr6dBiPJbNGKai+xYonINAl8EbwLV5Az7EbFdbwHaXDo21F6335eeGB
 fXoNHXr+HbaIZcv+cW2SdWBChB4TeyD4QPanSm/7U41JGaVAKQ3ivJoICB9yJ5WTkyWo
 SDtA5FBOap1yBBv73T7s/ULlFgmzO2X2BEcoQPfbqhuBr9LZ6aeJ/IYxXhRV/1uUBvSS
 ffuiKQw7KVz7y1GIxXMkjY4Kt3GQMrAB8gbhz99OPrT9gxxgvA0pK5ZNaAVul5EjQWhA
 9dQU0dUHee5cc7VUwxuKGh+WEaCzUJaRJxouCrILpyfCPkFyw0U4Hx6kRYmX/8lPzREt
 D6SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEAj3IIUPtlqyTiUNSDoJIseoz7ykQ2aG6/FIXm7gDB4RB50lzeS9e3I38hW8M25OtEYdTyrYLCWQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJgeWN4TbL+TEMt5hrrP68UMy5yX49KbL8knmhxogYQ3kzoIhE
 7rcCRf3p8dUCXoctG9tArNpSRpSxFvYnEi6Gs49r/80PBNVfv597Omt2dBe99F/+dsDyr66JWQY
 p6l9Ds854wGtlF6CakblL9lhLKNua/O8XQS8tjvNjmDCMOmLMMhe+1vrvaMbjkKjE/OMQ0kkm24
 YpZiY=
X-Gm-Gg: ASbGncv+C+31xwltR161pewhyXdBr0wV76cpEF29HD9yEuZt90raSwWrfAG2uRlsTSr
 K/eo23yBtdVmMlge995tZ7Ocu3qJqb9M3nsuOyiW9MVgxnAg8x7bI1fR/MzgIaBIkAmieIMePeC
 lrFAKTzdf+2EyuqP8mSvJA0avOI0vezYPRdEWPqZfcOX7H4F3rq34C6nYpjZ6JFgon51JciHIHx
 W5TN1A7csNJAma60aCRAfQI+02FcSPqsjM0Sh+OcMJ/xKQglP3Z3cKqQ7ZMgaZ3n2cnQ3DDJsSG
 DWgTGhnwlI0vGSMiInp93XVxWzlOdXcj7XTPYz5dhGH1SxHZTtkTJHzvwV9KpeUtx3JiXNSNOX9
 ygLydUC81KOI1N/MSpQ==
X-Received: by 2002:a05:620a:29c9:b0:7e6:9e1a:19 with SMTP id
 af79cd13be357-7e83b93732bmr541387285a.13.1754908435015; 
 Mon, 11 Aug 2025 03:33:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbXlR521bZxyPm/3VZyKzhpc/wr/UGlYqSFDZBHoNqcD9JWEIFdYtyNL9kNg45d9xLhLh1XQ==
X-Received: by 2002:a05:620a:29c9:b0:7e6:9e1a:19 with SMTP id
 af79cd13be357-7e83b93732bmr541385685a.13.1754908434580; 
 Mon, 11 Aug 2025 03:33:54 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:33:53 -0700 (PDT)
Message-ID: <09144409-48ea-4b74-aac1-32000424a46b@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=6899c714 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: HI4IRbDMGNrNME7YElgECzAMMYzB8pa8
X-Proofpoint-ORIG-GUID: HI4IRbDMGNrNME7YElgECzAMMYzB8pa8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfXxwhvCkViCMwU
 ZQSyfM75gHY2W7xKjfPXXqkMqYS+i3QvplxCcrcILbaX0y/mQVGa562v0T0L6PSTNmn4TSP8a7k
 q1bYiph8RKzmijjWFD3qRaDrEz3ysq3YBKxyjj29AqAMAWHqbvnuGJM15yf2N6LZaajpKprozZ5
 3Fj0YhrvAWhInH8Rykk+Df6JN5tE9iEJtNPyF3DPzYicLZJZdgmiZ472AV1x9eDhclVW3COlXhL
 8w3Ihsvdu3NeM2lpO5NU05gxxILeVPJoOP1RLF0Z3RtpYbzU5Ed5SjLreCBzRxAGx1pH0txifXW
 URX5Txg9aLvkg82CcMRj5ovRUjLk+ZO+K4l1Q0hmbhIBuH1Je0q+klUyD/Suq2O1QMo8CgoE7rw
 l1Sz7kWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
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

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
