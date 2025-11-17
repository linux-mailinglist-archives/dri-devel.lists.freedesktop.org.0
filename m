Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91262C62B1B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 08:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6471110E2DF;
	Mon, 17 Nov 2025 07:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmsuOSKB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdq9mPnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639F910E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:17:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AH4o6dp3040399
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PiwJfvVVMehinBT4kd6bvn4EAk+lKQ58wOrHqcaREIo=; b=CmsuOSKBf7huko8O
 Iqp2RGfL5ES/CYKBPIuVeLQWFRq+Zc9Yux7uihmQbLh2rumPLFE/Sj64YFQpfTMy
 hxeG/KwvEOBC7e6LVWA7hZWtKVlre8qxgRFMcphdZmC393rq6fNLjLpvo8O+qyS7
 TlK5/9iMBMrCEcSXwXRFO/BEQKSV8/+hjou6QzXNNE1y7OQ/hcRP7YimqjeVbWc1
 9avJtM+3eMkeBx+1BvqZJeMGvKAShSUrkZ5BSyG+u0/5ia69+ZM66SL/84DWPpi2
 S5EKqR/iy2aNnUetboTOFKJL+O/WIr9b8WjCCvEJNGiqyFktf0Z6epForf8QT5zX
 C7jlXQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh03qxc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:17:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-297dfae179bso103817155ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 23:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763363837; x=1763968637;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PiwJfvVVMehinBT4kd6bvn4EAk+lKQ58wOrHqcaREIo=;
 b=bdq9mPnV48BupwE8Tf9bFUhDrGSedT2Gf2g88EBOWJhhwe7Wczm1G/FEH8/upSIv4Z
 JLuZt0VqNpVv/wRBZ1acVkLkqxXk9sDBAiCWYOJqaR/qVUg5v8pXj3igcoxSfzIB8PVx
 Ttzlz/xDUrDVsWU8owVXZ/GOVsXKGoKi9JkQaPdjM4T+ECu5D7dsglWoMJLWLnpSM80z
 HgnwhqGJv27m/CaFBPHoRvBway0g6tZNKK0sdgxlP1d2oK1F2ORqzwL4kUplU12NxbiH
 dxsT0Dsw06bj8RIVGOqZeu+cuOXsokmDILb6d1q8eIyd10guX5bQhjRXHPo25hwfBrKP
 B0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763363837; x=1763968637;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PiwJfvVVMehinBT4kd6bvn4EAk+lKQ58wOrHqcaREIo=;
 b=vUfnunrg5gey15nT/wIgn1fMNpDE8A4vIde+U3EElKtDvn0+Mj6wqWNd8XXz9f+aK5
 YslQ42zLiQlqJKiXsZIiqZ+RIi4Fc03sfALFhoxpd7VUnNwxGWAMui9M7USvFyL1/equ
 6HEJnNxkdlzEFMKoh5/9whSqISb+VboRUlRkqweg6RbMf8GFZArezJ+c38DIJI01ObUs
 G+V3RZVgEmpsd7cFYGpfv3kMaKMKNcgyAMv3FDwqz6BtCsbyTE+cdfQoRZiWFjhPr4Gq
 S6XBXEY9/ukgnkXrYBEtvPbKoaHwvhUSwqNGyASLToV3hcF6R+ABFzRcYiyMtKUpgHeW
 skNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW13gdUtV0hjV16iXmL+jYF1IqTftAWCGHqWBTUcSSH6/NEK4ruBp6OeD9/oTBJ9mKJl8aNsUx2So=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpkq2dSURmTUafTKrPpstmkGHu65FSRSQd0+o0HPxvaE8jvUOK
 DhCl8OBra2ghJkRgM8cGQTkAEh7DfSA4rqZplqUWWhoHQaJgxs3Rq5IWYaX6UXzvA8tdWoru07Q
 oWegy23WmMzyhA7BzeN3AP+NohlAN1nosSAxVsACYR7MxOTDbm55xE5b3pHTMy3KU8S7VKnrw/b
 6l33Y=
X-Gm-Gg: ASbGncszoI0SzMsiahPfkjeXzX6EwM1Ijjp52cam+PDFtYWiaeJQeGQLFH7nFPcMDCC
 Xv3RUgfzv/hbUf5JPvbyRO/RdWRjcXY0Ix9gSIfes5Vbdi28GkxI1Q7ZjSWV7OdYgzubPStflhA
 esUVIOQ+afGwg3vSBBsAXtoOwwE0Jm8xp70PJy6OAk1uceI6YtHK1NIu2o8p1VK5E/Qkk/fJWVr
 p24BXSLwtcjn/Y0sGq7STFQeJ/OUAbKB2BCg0UbCfTa6ITlCBBjtetm+S/FJEvUncod7Aaeh13j
 2dLsLxfTgNQaAS6iVj2/38x3QsmOa6W/dEgBLyh8RO4xS5FKzOlaEvefP1SvTOmSEA7UHIRPvxK
 3qxsdnuyZS8fGi40FQ5n3GZ7AiAxFMsk=
X-Received: by 2002:a17:903:1a88:b0:298:485d:556b with SMTP id
 d9443c01a7336-2986a6ad7fbmr135125025ad.5.1763363836859; 
 Sun, 16 Nov 2025 23:17:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9p7epjZsFFRyJhM3O74+beaP9CAALNA4xPtajAEIE8PuxecaBt3WowzT0DC6b0h7oHBn/Jg==
X-Received: by 2002:a17:903:1a88:b0:298:485d:556b with SMTP id
 d9443c01a7336-2986a6ad7fbmr135124785ad.5.1763363836402; 
 Sun, 16 Nov 2025 23:17:16 -0800 (PST)
Received: from [10.204.86.112] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2348afsm128849485ad.3.2025.11.16.23.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Nov 2025 23:17:15 -0800 (PST)
Message-ID: <73e6b7b9-7ecc-4137-aaa7-43a7fd950168@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:47:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>, kpallavi@qti.qualcomm.com,
 srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-2-kumari.pallavi@oss.qualcomm.com>
 <e387957d-b27b-47e7-adb0-3cc8c656ee8d@kernel.org>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <e387957d-b27b-47e7-adb0-3cc8c656ee8d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=691acbfe cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=QcTeDzwGlpf7cV9H6nQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0DvNaJLIMgHwowUVraVUIfDuJ9muyuIQ
X-Proofpoint-ORIG-GUID: 0DvNaJLIMgHwowUVraVUIfDuJ9muyuIQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA2MCBTYWx0ZWRfXxUtGth8Terwy
 8pB9PSm3gpua2N1eF7F3m8t1cAKzEF9N8OyyTWwkoyotr2PaTlMqpBnLFstLfdgeZyenT1hMnMd
 Lg+NT67aHwFGFc+CaP5UhBA7F7IUu9GstV665VKsm3stmEx57v0W/u7/Baixt+n9W+QakoTs8Oo
 JNQ6kbaBc/u+ftu182sB0ZriR0I/VUZ4mX4EP97FwUv6QD94I1md6AJvo5p0VTG8hB5Z3XwuJlu
 phFEWwf3MiLGcGcXMRcCDi4rNQgPgZtDr/JzK/fugNtUqdr0bPgiJpVa58RYDf+WC98h7SgO7bu
 XcnwEitMuI9rqnBb9mEGmkrMuGH29R8G3VHh//I0sM0XGFjO+hjafXUgkTq4yJXruPXBqlacH+0
 xe7qjzeOgflVP6YhuyxjB9l5HiT57w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170060
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



On 11/14/2025 9:17 PM, Krzysztof Kozlowski wrote:
> On 14/11/2025 09:41, Kumari Pallavi wrote:
>> Add a new compatible string "qcom,kaanapali-fastrpc" to support
>> for Kaanapali SoC.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
> 
> You not only did not bother to test it - there are obvious bugs here -
> but you also did not send it to mailing lists for actual testing by
> Rob's bot.
> 
> NAK
> 
> Best regards,
> Krzysztof

Thank you for the feedback. I did run the schema validation locally using:
make dt_binding_check
(as per 
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/), 
and the build completed successfully without any errors.
Ack that I missed adding the mailing lists in the initial submission due 
to an issue with the script I used for retrieving mailing addresses 
locally.
I’ll make sure to include the correct mailing lists in the next revision.

Thanks,
Pallavi

