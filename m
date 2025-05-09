Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF3AB1363
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 14:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F6610EA2B;
	Fri,  9 May 2025 12:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl0GjNo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3388110EA2B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 12:30:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549CRCx9010634
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 12:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l84llEd8JLKaBllMEadN67nos+6Z843mYuJwRmu5tnQ=; b=Zl0GjNo/+5WV7EPn
 4aLty6QN0B4QEZiS1wOy5GR45AjjQMZxk+XfpKka+PdyTX0/EviO9M8R5oYCiW7e
 8i0LgoFSEtmSH+CfuSgbPYTBq2Ay9EryCfHLsqYD1OZUwBwlaE5wwIwCjcxWbg8R
 9QTdoFgzdQqwX0qRFKXYowco9/paEOSGPnSZUdxWx2oXzY05p0Reb2Tt3nMvTz0q
 chqbAzz3oauv5l7FJnd+DPClKz6vVWAuHkEdoDxT7I6duu1heMOow0xno0BJ6rcb
 4WQG8MQ964LhxdBktcwHjCT5A50M2lbnH4jge0FUJYGc0Em2WZ86f2iyaLc75SK0
 oaz/7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmmn0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 12:30:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c54734292aso56448085a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 05:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746793827; x=1747398627;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l84llEd8JLKaBllMEadN67nos+6Z843mYuJwRmu5tnQ=;
 b=Gu25U8suoNpRKx3oP+p3oECklqT4fyzmx1Khzs+tOGjhcyHihCIAhKzvUHVFBFnsu7
 OpIEEhcDQpefoSP83rUmmnC2CQ5g1zU4c9NijwiYmowkSkBFe5SIWkHUEKb738dS0rok
 BBkgm5QvrJAjMcqi5nFBVdSx5FBdKrfIy0eyXHrhVrccztXtzXpFJpU6TlnE5EPhk8kJ
 y/+1WXbaHLJV0gDO/uxonWjFal/dqf29JOKPa9v7lpuANj6UQ03G4yTEDlzxekJSaxxV
 3WiXrYOGY3/d0fXxLqNEX3PCNBIswM2lvSeP/l1Wng+yRB39yiV1zm92Rw7p1yIfnYW+
 tDEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSr5kYQxquALufZW1xK5M1A79ErpF4PKHukma/Iw7cmH1U8eE/CusS4vjtP8nXeS6n3d63gpaSt7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkmzWW2/FvnnuKAcatwV4fanH5aBzgtYVsvUEEkEYdc66ngMnZ
 MNkKBpQ2RD7wnTPXVkEK9SR4Z4wADWTSTj/aIMYt08p5N6+uxdBXsYItSbbZD1qmEzHvUrsobwN
 OB9Zjh6yx4+nAIo2FS8YeAaTHWMbBnR0KKwQPoq1cJKb0vAaiJTpVbgw4iLa0P0Qwmdw=
X-Gm-Gg: ASbGncsJ8Gz4iQxegUUEoOO3SsILQb9lCptJU09YPijU0ftY2oDAr9WGXCPmYl5zvVB
 R0cdWWRqEvbZnrqkt2iqRYFR2joLlnh/Ndr7On53MMIy366Ufegg+pBkzkRnjOP6YnIiQrRGQ3y
 vdamo+ffrgJgfz63FZNfbkUjSdhm9SR06m3uY6SzpIPOhZU6dftKIQNZJiQ/sZX1ID88io4T/C8
 T2P62eFuMClsk5DQvegwJ+zZ3Rq7sfOG+x3k+pDosAT3oHnh1D7Z1265FgDv4NcaBjXUZM3yO92
 vCv/9SBd69HvgeTWT55+mgtECCJosrsb9Vo3qXFmcxlzwXg1MpQ3zJ6RpbruyyIQiMY=
X-Received: by 2002:a05:6214:5197:b0:6e4:4034:5ae8 with SMTP id
 6a1803df08f44-6f6e47bc895mr17282396d6.5.1746793827346; 
 Fri, 09 May 2025 05:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbU6gmI8KLHNG4ho2OY5Av6zEE6Kq1HFOv+DgFV16MqINqCdZXRWO8sLBv9ZYej736PGPshg==
X-Received: by 2002:a05:6214:5197:b0:6e4:4034:5ae8 with SMTP id
 6a1803df08f44-6f6e47bc895mr17281956d6.5.1746793826703; 
 Fri, 09 May 2025 05:30:26 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cc4f240sm1317373a12.33.2025.05.09.05.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:30:25 -0700 (PDT)
Message-ID: <eddc2ea5-dab7-4c9c-89fd-23ed20b85ecc@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 03/14] drm/msm/adreno: Offset the HBB value by 13
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-3-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E5kUfJBVQG5Bk8nQTG7uqA7s8LjifuUtU9VYhpGAhNqA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7E5kUfJBVQG5Bk8nQTG7uqA7s8LjifuUtU9VYhpGAhNqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681df564 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HXtwfQqbK82wVydd0M8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ikw6qBIVaycAGRXJRhsFUMeubt5xVhjr
X-Proofpoint-GUID: ikw6qBIVaycAGRXJRhsFUMeubt5xVhjr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMSBTYWx0ZWRfX8t8v2enCRa2g
 6XTVvQxsXsYuaAcn8chkcEJedSF8vYIVgyyTTOfCzHy44iLbTEYBpgtGtQFjELdGM+/umCMjcaM
 LI6zcqan4uFd9bmH6FmSwMfwwqhQ5zp+s/0I/34FFb/ewUI1WtwAEuTqpiP/3obWWIElqgy1oSa
 Kajj+2Gcj15hn/IE0csHyYJ+FVCzTiN3kqjAe4oX5TSKMQ5kofHftpo1bq1/nszGrx7+v/Zc8co
 OAjmQ+/vEay1Bo+9gTcXNd/OR5irwKGdU8IqA85rJ6qVCG6NA8AiWrHyyTk+9NpujalHyoyjeqq
 jrxslZZV3OBbf/vBACDWOrdzhgEdZ22PwjjdHBFVXgVxPuEZCW4C8YlBgxP9k/Hqk5YpItnX6cu
 iGIqR4EIFScjKJqcS1DqJ0xjJLe6QObIqBRl02w+CyYEuUjiH09DCnIDFPZXjZRMUkf7W3TV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=906 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090121
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

On 5/8/25 9:03 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The value the UBWC hardware expects is 13 less than the actual value.
>> To make it easier to migrate to a common UBWC configuration table,
>> defer that logic to the data source (which is currently a number of
>> if-else statements with assignments in case of this driver).
> 
> Don't break the value exposed to userspace!

Bah, I keep forgetting it's there.. I think I'll alter the mdss code to
do a -13 in there instead to make it a little saner with the future
getters that return the x+13 value too.

Konrad
