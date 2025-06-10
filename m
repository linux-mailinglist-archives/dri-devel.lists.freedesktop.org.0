Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4829AD3590
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB39610E529;
	Tue, 10 Jun 2025 12:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+xFVZv4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD2210E52C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:05:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8ulFq025168
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h6vlCxhSQUvr82OIu6Fr1YYqY2ncYKV9HsLI2TKQjvA=; b=O+xFVZv4445XtnWy
 J+lVZ9O34FPA0XJVcZ11LUaUbsEPFvdYx7ianc2oPlQuCGwtmCY8BusCljtkalfF
 NVWP4JZbGRiwshmTnVHV0Op+WFJx6nyR3zBloNDJ47S/COpvvw3WyTo/2rHzlL2K
 COVLXIGiR2vHhi1HsmVPfphHtmfab0bXxrUbxCZDzvLUAerdbw9MAxLHtp6Qd/2G
 LODITej0WCU3gl6yT95aDB9W5oNNyn3uA/Z9F8l09LyU4eoLE2lsFWc+HkOUOJpo
 KC8oWvN3bpoStzyaXRmt30qM80N5AFAvp98+2v9wg3WLsVwKWsL42NXE46hoS67D
 VWIHoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d121eqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:05:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4a5a9791fa9so14727921cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 05:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749557146; x=1750161946;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h6vlCxhSQUvr82OIu6Fr1YYqY2ncYKV9HsLI2TKQjvA=;
 b=c3lPNE1vIzW+6zqRWaZvFRJLo9yPZ5YhMiuF5DK9F5QkfjaEZ2O1QAyMcRqpjz/7eP
 +e1Pjevfq4ifGZWpgY8Kps6C6W4ZeuhqC34oYPszgwYXbm2owFANqcroZ9kCBJkXJ2mn
 xLJRSqWdHKMt4SJBF53hQB8ZkCKOT0gjg6sFJhDYCdq9YlmRbujS/eVNNSZrGnVJxZJG
 piAv9gp000N0+7Jwe0QzI7vKgoO1DJTWGGCJ66wQrKlUQkeqWWHIQZ1YvlQoAmtWc3i5
 R6pm5TUdqoLg2OpoEh1MQ54w9lz+1MWyN5NXiL32QMgFM+E+VSyhUHl7miUU8ndnrwho
 Ptag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU//s9WLN4zM3TvErjhMFWz4miEcQi8zpnzKEnbJmB4grfXRjOdxBOEZ1dYGw7H+6u6IHQ+OKbXh3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfrz5umIHi2DQ5VxQR/Alj/5H3StN7AWi3mwMYhpwhKtwzIOSZ
 cdN0wYnHQdk+96HOEAXlld7NjGKNLzjb3PChvOC+3nwoice2o4KBvrPkkASjxZpha1VP+IPIhNQ
 EIon9t4HucxmWafUZoc6K0YpK5/VYoFxIjKTMaAiC5bh/TIK3cx86cpnoDndu/KcyrAlH9N8=
X-Gm-Gg: ASbGnctt2MNNfsARdQ3NcKWCFO8j4KJLL2kujtEeY82fCLWYsaCtl0MGxaIbyksWEhi
 jhcdj4eCLqgjQYaI644BkRTprFMIxH5Edrc0gSdhKqXMYzBv5V9ng2rweu+auDsiwgzzpW3CaKT
 dHbDGyOklMs+MRGGp/3vW+FWmv1AcXP6lDAQJ6Wy1ifJd80S5Cffn8X6lLj8GPu07Zr1efAfp73
 smnlh4bMUMhU/AX/Y+GrMJla2g49xlwIJI5p+EZHG+0Wk0oqVJ7Hw8OREdRtto4qr9dle5zbCBf
 wEATkrPOh5XBwr0uHN7JAdk/7nArbMF1OdowxmH2i8ArsGprjH9qWklxRLthvSnSyJL/LG8Jhb1
 L
X-Received: by 2002:a05:620a:4496:b0:7c0:bc63:7b73 with SMTP id
 af79cd13be357-7d33df22c1emr912842085a.13.1749557146335; 
 Tue, 10 Jun 2025 05:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy7jnQNdMKK3VoKnfpEBwRY1V91000OKDc59hXFCGtzyBYzwQtBOpr+Q1wE5lNHQT7AGzK+w==
X-Received: by 2002:a05:620a:4496:b0:7c0:bc63:7b73 with SMTP id
 af79cd13be357-7d33df22c1emr912839585a.13.1749557145775; 
 Tue, 10 Jun 2025 05:05:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d5f9b37sm710722766b.0.2025.06.10.05.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 05:05:45 -0700 (PDT)
Message-ID: <829d79af-cd66-4124-98af-7819d9476840@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 14:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/msm/adreno: Pass device_node to find_chipid()
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NifDAj6JG2HZfg0aSy5QhwObYAzFzr5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5MyBTYWx0ZWRfX+KRycjzy05rl
 xLQ2dePL1/bw1eH9I5GsWwX5Vhwddjcbbq1kW2s+OXRiZq9NqbwHSQrK7WOdcO0llKoGO15ihci
 1aB6bAYaGDsjWbRQ/2lOrW1/xhtkHj1itMTia7/C5umabrehV2kml4azgx5wdnBLSpdKWZymfzg
 S3P5aCVD17O7KW7d78g6o3TPHRXoLMwlKsk83ecz6CdBssauhKhY3tYDrC1bXuE2ggSQl1cQJIg
 G1sPsIIcDCRggKdPrH8M6yODV9sNltEe5IsTFKUzWMnBtlqfvKi3tb7+um+5Rmb9sYpgeNqHmiO
 LaNSAQ37+TChUlnrm3V0Easxyt/exvDOKbwoCsJbU7k9ja0SZdrbuYJtVYaYi5t5h8I9Ke8rfef
 4JhVrHA6A7FqdDxkKZ+w72tqyXIgbgKj3IbXbZf2HZehLVBePdOhGQUiVmQPs3S32ahFSWIT
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68481f9b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NifDAj6JG2HZfg0aSy5QhwObYAzFzr5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=849 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100093
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

On 6/9/25 8:24 PM, Rob Clark wrote:
> We are going to want to re-use this before the component is bound, when
> we don't yet have the device pointer (but we do have the of node).
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
