Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED97CEE0F4
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 10:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FEF10E0DE;
	Fri,  2 Jan 2026 09:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="RZVRLh7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F57210E0D7;
 Fri,  2 Jan 2026 09:29:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 602894JE035910; Fri, 2 Jan 2026 09:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oaW0Z6j0ZPnwG0r3uuBK5kv3RVSJzkfV4NzktJbSi/E=; b=RZVRLh7X4ntl8dfB
 tRQ0x4n5v3aI1mKFBP4ymFSYVg/Kgz+lPoPYML3uJ0k3SKf1I2GT3lzsuMwnEUIW
 RI5vvgJBfWsaGv3bKlaZx/RctV1RzlXnFsqJ3M9gO0AjtfgE2cARuIckXqZa07zZ
 uu6iW7eypk14uyq+iGn/t5kEICxXWX8+5TltRfJ6ZhowAMpIO0JL4SCnB2/9Ll82
 1vYohLTQ7vV9JDdF//iifyvE/HrNKhizH5oL6YnDkdg5noaNpvKSH1hmR+8XzLz1
 30XOYDob4FkFMGjbU5XBykF+0DYkJP+7rpl4Ok2gluoblTR2zAEKK9+8Lyq/7e1U
 QTO3fA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74c48q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jan 2026 09:29:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 6029TIAB006914
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Jan 2026 09:29:18 GMT
Received: from [10.216.5.234] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 2 Jan
 2026 01:29:10 -0800
Message-ID: <58b496b5-2847-4af7-8a34-e227e4324deb@quicinc.com>
Date: Fri, 2 Jan 2026 14:59:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: display: msm-dsi-phy-7nm: document
 the QCS8300 DSI PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <andersson@kernel.org>,
 <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <konradybcio@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonathan@marek.ca>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>
References: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
 <20251225152134.2577701-2-quic_amakhija@quicinc.com>
 <20251227-doberman-of-radical-variation-d30aaf@quoll>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20251227-doberman-of-radical-variation-d30aaf@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: zYsvGjGcXceGOpTB8rFMlvFOrGNmFuGV
X-Proofpoint-GUID: zYsvGjGcXceGOpTB8rFMlvFOrGNmFuGV
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=69578fef cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fWUcj0S4klb-w0UgOPsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NSBTYWx0ZWRfX5dJyz1g8G/Ja
 2vXNwTFU1hMK6ZsyFw0HozPYioy/cwffwIZRjGX5+rdMsSjFgGH5vq9tHbzBVGrJG5pJYjZCbA5
 kj6vAih44inI5tN0KPlYRHSG6xFDDzovdJMy6zYYSnMdeiKoi/GZvBbo1TtLogKn1bjtEAlJL2x
 pkafdL6lEskRwffpmi1u2msJxkDDD/vV4HQjBi6vURfLFaG6YdZ6nMZtpZK4xXD7ijVnfUjzkoU
 g+4W6k0JQBzr410vBvBvt6ek9xQCHoG7U+OHtgNDdjBhzqYREdaFQVEt6GZG6RXxrVpUPhdB8sN
 0bQ+VN2JLFopRoyVC39lJQtIFDGzRBjDHDTgIlF6U0gkZPAO1YdyH23DGrtdwIbo/pJngKyXbxF
 4M0Y2T27982MvE85ECWMuAHFpG/G+L0EnLIk5ZnSNPCaza+QlL6IxvcZXb8MOXc4NTpncRFoe0o
 q5D8BKIPNak2Aa+voyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020085
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

On 12/27/2025 4:43 PM, Krzysztof Kozlowski wrote:
> On Thu, Dec 25, 2025 at 08:51:30PM +0530, Ayushi Makhija wrote:
>> The QCS8300 MDSS DSI PHY is the same 5nm PHY IP as on SA8775P, with
>> identical register layout and programming model. Model this by using
>> a QCS8300 specific compatible with a qcom,sa8775p-dsi-phy-5nm fallback,
>> and update the schema to require this two entry form for QCS8300 while
>> keeping existing single compatible users valid.
> 
> Last sentence is redundant. I asked to explain the hardware, not to tell
> us how Devicetree works. Write concise and informative commit msgs which
> tell non-obvious things. Not what you did. I alreaded asked this - do
> not state the obvious, do not copy the subject.
> 
> The only useful part of your commit msg is first sentence - two lines,
> so 33%. Remaining four lines, so 66%, is obvious.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Can you please check below commit description is it appropriate  ?

QCS8300 uses the same 5nm MDSS DSI PHY IP as SA8775P, sharing an identical
register layout and programming model. Introduce a QCS8300-specific compatible
with a fallback to `qcom,sa8775p-dsi-phy-5nm` to reflect this hardware reuse.

Thanks,
Ayushi
