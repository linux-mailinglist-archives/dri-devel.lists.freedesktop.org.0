Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A96B07985
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 17:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5004710E743;
	Wed, 16 Jul 2025 15:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTl83bTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B6E10E743
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:21:26 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G8p9tY024166
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1bUnE3yh/20Ghd5aYHGrfLlbtIsqPiIKnsI6KRLyQjk=; b=mTl83bTptn7jOjj1
 YljHgzUQtkN3PYRa63msvRQktH3WO7HRs58VbyD+6CIPoFQShma+bof1Srfau1vh
 E8cTHyOcBLeOymJiZz9781O3UEo2D7Ffeo7xvJZuSWS5mztZ3XqPJn6kcxOWpEav
 ckPuTztKdhdPgmHhQhifhYsonxfr77owcXbMSJ3IYB6jtehRI1scdz3qf6DZY7Lp
 vECtjuj4n8irBB2TyadW0RaAIJ+XK1RsIh9FS0Q6RcMe/WTjIyoWVmBpE9mVIQxk
 s+eH7uDtwFIKzDKbF03szmSAMB2TG2UupsOLtPlLg/fAw4LGufiTwsxb1w6gzdRf
 efS8DQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7h8gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:21:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7dea65840b8so57701285a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752679285; x=1753284085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1bUnE3yh/20Ghd5aYHGrfLlbtIsqPiIKnsI6KRLyQjk=;
 b=GZDWrLFAy678XvYNKlYRtFx9zNPleIgi3lCMczIJuj2o/8Pe1FGP3p58/tk6ad6rfr
 zvJlyKsbAcwLhXdPpo9ZDVhLdEb3VukEVF5WgmdUexJ5SbSYOkzhnxH519LZAVTE0ri1
 OzuxFfLr7mQgV7MKku+K54XLEZpnd75bxFJVv+7JyXx8vX25iw6o7rhSzJ0FbTVMgZ+K
 nj2QD4AO1aibeIw9e5lKOWUklw9typq2eE1STNSsk75Ef5pd+YFWvvhtccVYgucg0/I3
 5UWylBf2VW/aoSivCdMBEZ+aFgN3acQ4FedR9h+W1sgju/XA3WMawnVeLbrR1jy4qmNq
 KbEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8t+bxDVkXKE6lATkr6itHi95y86S20PwmHL3iCaHkdZIs5x9J3+AFtMtevIky4uT8FiZK9SqpweU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxatQmLrcI+lW4PMe7FrYdL/e9QBtWoSASyYwXEexx5m421sxl6
 Cp+dApwO0+3iGk1h2LyuhLvwRgQ/ITgvbRCzQm2OcCfmLssGJMTeJaYXvaxFhgLtVUOPMmLS4sj
 2B93KNjY+7nWjvyoA3L0/GC1J5FjKQb9POmcnRWK9ficfg22cGshO12YnZyRKdAxgJeKLwRA=
X-Gm-Gg: ASbGncuRog4yuUi7kZmis978ebEvjeTH4H4s/tohu22nP9T1i7VGAvYhFKUx211tGEC
 2weA9oJVWpQqnv5BSb/f7lRk7Awb4yZGx5+JM+6nsstAEmqAYyy9yRkyhZDtNHew7FA/t9fMIvV
 kdfr/cVLg1/b5sJgdK7e6nSJViWOFg8warE0hl00B1ljhH1EXGj65BxF7xSZ1lzbLBm3wUe8Fnm
 IGwgZ3iX/tV9oC89EmFw9Ocbgs4qFbKF5BSsj383WHdpjjhM72y5wDFTt6b1Sld6IFqQzm+usd9
 ksySEy5akErE4YmIVf8spRSDvMI8Mby3BOMCx4cRaucXEURp7xF1dj7VERhqW8yNeos3tLbS+Jw
 ezoI3VdwcXf2mf1QBbrA9
X-Received: by 2002:a05:620a:1a27:b0:7df:d668:22ff with SMTP id
 af79cd13be357-7e342ab1936mr216252385a.4.1752679284849; 
 Wed, 16 Jul 2025 08:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwUL4aOiOFKQWY6fr2mKEYH24z1mhZ4m8g2O2+qGwqBgjEmZmm+7igGSQAEYX3auu8FEpU1w==
X-Received: by 2002:a05:620a:1a27:b0:7df:d668:22ff with SMTP id
 af79cd13be357-7e342ab1936mr216250485a.4.1752679284383; 
 Wed, 16 Jul 2025 08:21:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8291bbesm1194624366b.126.2025.07.16.08.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 08:21:23 -0700 (PDT)
Message-ID: <9075ba23-cf47-411a-a6a2-96f89114b14f@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 17:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] misc: fastrpc: Remove kernel-side domain checks
 from capability ioctl
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-4-quic_lxu5@quicinc.com>
 <aepmtv6mxlzhpncwcwlmgfrb3m2c4xe2edl4y5qsnjpxmvivla@gwufrh37y473>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aepmtv6mxlzhpncwcwlmgfrb3m2c4xe2edl4y5qsnjpxmvivla@gwufrh37y473>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX40y0JQgW9W3K
 hYbGhCkOY7+eSmciv4Jq0KJGQXCtsWJDoAc6u8o5rdRaEywp7YRKfGSz3e7UmCKvQrJGREMBEuE
 9iPgw79ASetljnspS28mjHvYNbFsuU0esizvWGPTmL4Um+Qf1AdTN2hu147XcarO3kdNx5zNWgT
 c7JZKLOAwpfFxAB6w2Z6gols3YEe6ds5yg1E7/TGk0Mp/8JCraYvg7djM9ADsRaaXDcq/lKqqbU
 AYG4EWRR5TXhjnDfV9OXB0eWuT10Qo5W4swSQJi54Urlj1UXwJ0JXU4emIe7XI6u/QOD5eiDmKW
 bnlCM5FW01wHUKtezKJuYeyusgR/1EV1w1HJqQZ7QBjwozsC2Q2NoU1tFI2NaS0YJyQlgxF9EzE
 G3rWscmDuv3wOI1+wWaXdwoMD0wQP4eDcoR5DovIxF7G536wiPIkHJLUQdGnZ1iK3VDQ6WG8
X-Proofpoint-GUID: Qt98AdN7otQIV4yBOicXXg8Bl4azE3qX
X-Proofpoint-ORIG-GUID: Qt98AdN7otQIV4yBOicXXg8Bl4azE3qX
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=6877c375 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=d1jN1tAPt5WcxSkl4i4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=841 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160138
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

On 7/16/25 5:00 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 16, 2025 at 06:58:34PM +0530, Ling Xu wrote:
>> Domain ID in the uAPI is misleading. Remove checks and log messages
>> related to 'domain' field in capability structure. Update UAPI to
>> mark the field as unused.
>>
>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c      | 14 +-------------
>>  include/uapi/misc/fastrpc.h |  2 +-
>>  2 files changed, 2 insertions(+), 14 deletions(-)
>>
> 

Dmitry, your message is missing

Konrad
