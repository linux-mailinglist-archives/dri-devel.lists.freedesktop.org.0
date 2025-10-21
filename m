Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA83BF6637
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 14:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E4910E2F7;
	Tue, 21 Oct 2025 12:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kx4/jx/g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B738410E2F7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:17:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8TdHO024209
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 62ij7qlH0jAbXbq+caCTrSlt+OeWrvirXMKUpKG5id8=; b=kx4/jx/gddJzriWr
 YETzYOVX786PvozAsP/T4Wz0FOx8akCyXqVgh5Q7dVI9f9K2ulbuUv4FKE3xhdHS
 cWXt/zrzBUWrlcTK0NHwzyeIYFcV8HPjrV+R/ojxtCu3MiFTFV8VS/aQT0FBfY8p
 UfeYLQZQ1kplAWEuGdy0ptYjmERUddoV2/kXuh4cJwCXlC4RsyBT2bR68L/Z9HET
 K6H89njqOkq7x+GQMrSxPN9JoCCiiqGvWscljfeGp009COA5zMeF/gtmbfAH7tFK
 MJX7SAEZ8AFP3tOAf3KgrHvAEwgGGMi1FwrDkkpQBmGOsW3e5oMKwonatNsWa+XJ
 6U7FSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w80p5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:17:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-88f3a065311so204924985a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 05:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761049050; x=1761653850;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=62ij7qlH0jAbXbq+caCTrSlt+OeWrvirXMKUpKG5id8=;
 b=QyrP7AKrCD3Es6Y1Wrksp5xKH6LuNujWyBUEEhgwGblgKDxO0h38x6Xb8OPl6suA4X
 +iP1+FgP0YcZGftvr1BF8OSZg7bxJq6ZW4A5F89uMXH0B9UpRD+RTqEt5F8pG+T8THH1
 vHz9wEfUaeX19AYA2Mk5/mU7PfsTxNVmdHxvfGDWRHFH677qj4/ZGMpyWeH9jizL5GV0
 5+aKrrovqxy1vQuiHwNBujq3qc/6d9AhJkmBbdqTfF9nnn6JMayocId/yDCxDtzJh+lA
 UrDkUVSWPvCfzjH5XwrYJeUTes/ImwGmSlfSS8S5f6OkpGXEiARC9IxAKgSuUr5jd4qh
 RlsQ==
X-Gm-Message-State: AOJu0YwR5RNEA5dvOUgu+TWQm5aF6bo5T4NfKGSX1spFezDv5Cwo1Lu/
 kswxo03/aZ+IQssIYLbq6iSBlH+q7DonkagnQpA6MO2mXa+xtQJ98uh/dmmJYAxq/5kSwzsyiDB
 3qUwzJLNkHfbZ1uMCU4nP86HgDpxRp7BcS70/Q6ybu/tm/sUioFJJDAB8gjhDYTL8sa99zso=
X-Gm-Gg: ASbGncstddQeOgzNr9UUkr639WdjRsN2kTwNP/FS89oLJiSqpjTwMAKxfZHBS/v5Igc
 jdYks2JBaX9Wy3QyzkPNSD7Fe886QWhdYQ2mL7x0c6tCr7NSzd3afvEwciWpCBLcVAkLaEm+4EZ
 8EA7Vx7iKUra+j1Su9aQxqp+Gpr4VGPbKWq0Cs/Sp1Wx8rbVVzhTK2jzNH1GePvxeFg1vEtnEvz
 CGYuQZHZghS+P57gMqkE6V4hHo37rjdi6Q9E7qN5fIhFoCgijXoilAiWEiZs7yQ2UvN3s0cw1xk
 I5c8Mnf8Ohqd7aFeLqvuUwjCTS+5vEpetEurRHgOCtS7grwiCQ7GrNDKV7k2XFBQQFLNWd5rxP4
 KkMGsyFXKRz488RMAo4CSn5mdmkPMwMZmpdT9OPmwMS+kMMZQtfL7OSKz
X-Received: by 2002:a05:622a:180f:b0:4e8:b138:2a0d with SMTP id
 d75a77b69052e-4e8b1382c71mr98419771cf.12.1761049049798; 
 Tue, 21 Oct 2025 05:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9wVa62A9QqlswXTFOtj5hMm5dxSnWe0OKPK/itVnOD6rHNI29MyrzCPqYx7/z+6jDyT0yqg==
X-Received: by 2002:a05:622a:180f:b0:4e8:b138:2a0d with SMTP id
 d75a77b69052e-4e8b1382c71mr98419361cf.12.1761049049358; 
 Tue, 21 Oct 2025 05:17:29 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c49430145sm9225871a12.19.2025.10.21.05.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 05:17:28 -0700 (PDT)
Message-ID: <e63dc4ce-8461-41f7-8dfc-3fe531d69f4e@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 14:17:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] dt-bindings: display: panel-simple-dsi: Remove
 Samsung S6E3FC2 compatible
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
 <20251021-s6e3fc2x01-v4-7-5e3ee21c688a@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-s6e3fc2x01-v4-7-5e3ee21c688a@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX1jklU5L+eQYf
 l5BU75UCUgEifT0Tm1Vtkq3rS8UgV5K4d9Fzp2qGxxP/UHdwCqLIxl0MTuWtyNnDNijXZb0AtQK
 ZbPKRnizk2+0tm3DiLFzG/EcEdCURRlmsWTfFL7s0V6jyOj2hFkQjkCsPTrS0tBSb+W70RvLhDb
 yMLMbFxEiAAoODL/Ou6ZMP6K5R1sQNOHAovCu+wPv6dancwnFP12UG/iwcJpYqlQbnzfJdWdKwg
 7HFzV37D2KR6EM5Fm3m9eiTBo8C4rZ+zxqLDiw2Y/5aSCPI3AUvENHsA5w4+f+L8w9Dak3Wz4ZS
 M8Q8rGBFdPk4n1+2cFWJk8RekLxOibU6tFag92/lCTs88CCqh0mBy9LF7G3BZp6rc7Rcc4WvxgK
 j5t1c/CfXt0jfhx/hJF48b4prMNVdw==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f779da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=BITFXGdF7uWLIDnxD84A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: q1mrohKNZbMwIHukyBl0m4KWY-UPYSL4
X-Proofpoint-ORIG-GUID: q1mrohKNZbMwIHukyBl0m4KWY-UPYSL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
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

On 10/21/25 1:53 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Samsung S6E3FC2X01 DDIC isn't Simple DSI panel.
> 
> This panel has three supplies, while panel-simple-dsi is limited to one.
> There is no user of this compatible, nor the compatible make sense.
> Remove it.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

I think you should squash this with patch 1, doesn't dt_bindings_check
error out when a compatible is matched twice?

Konrad
