Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEECEBD8F94
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC6010E215;
	Tue, 14 Oct 2025 11:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/G6qLDF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6713F10E215
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:20:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87F65018068
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q3zlQTUnJaQdMxPkf1IdgDBVPpkVTRW0DJoAFXU8XFM=; b=N/G6qLDFP+eAensO
 6eJghkWxbPoGOUd1xGV+yHwmCKe3JpeAqcXYFA8HtMsXmz/YHRi/g9YjJuXuQyPQ
 wi9dftRStvS0xDAuhIwkep+OsKngSKqgjVw1IBKcBaUG5cLXl1XaYyT6hGaKJy2Q
 8YWFDDq2JLAgtVT1xb+MvSXYrmlJrFCIdP37chmhvMqqzVXp3KmEawV5zw7/Njqj
 JanWyrxGInVCRuEL6rgC5BWc8tCHkTlz0g0wEajws0ShTgctgtE1a/ofEiwP6hta
 MQVfMDSG4GIERAiCXD7GvYagQs1Aq+F+KjZITK4WX01EcPUEf10FdGFrVnal+7of
 9hHnkw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfes080p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:20:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3306bae2119so2481712a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 04:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760440812; x=1761045612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q3zlQTUnJaQdMxPkf1IdgDBVPpkVTRW0DJoAFXU8XFM=;
 b=G4JKdzw97w6JYfOf28SjtqS5XzO8DNOT6Zn7Jy+F2UXM8EeQUBGUh6bKpsxApNQVxo
 GLqU1ha8Qs6DjKCC86OtIRVuSaskiezdeWxoyYT0aSet8T/y7wvMY2bknLS0lbv3f54M
 EQZ4HxBzPApEFAJDSDOK4D7PJ7lFGK3kliv+shID8QszYzB0xSdUplxRH7pKlwxcbPn4
 oIRqhK5MBNlFLBT3nxPh9jTjCEW5ALDxTbHpM9vOnY6PcRizqrjDGFnwLqXGZEir6PAc
 ZFiqtbZC/RlJ3bPAwPTgvZJxeI1sBhdrrUbAcAdx8N1MKjGPkIXOfIDAhEntSmaND+r1
 nDCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/cM36j0JLEu84HVCrt3RmfhynNvbpGOzpLQbNRn+z+LRyrTkcrtwS2kBi1Y/X7URMsrukT3VoXSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypcjcVQ0W33cNhEBmaVXHfuvh39HwRC3BQEQprzcoNhVH7IvVj
 D5wqPSAiAYErGnpaJitOCdKuoAPpxL2H4eKDfOOoOfnJQQhngvMeaFWG52f1l4b3vBfiSaIRgdt
 OScEqXiO6SozD1IdgOsdQ6cnegzAXTOnPpwwjFtJsE4DkKtfP2edgWj7bJvPYiAAwSn1TUYk=
X-Gm-Gg: ASbGncuQAGOype3yjlXTYKA7r/FfmNMb6poY9cB6e710QZNc7+NMPNc4THB8BG3RcOU
 eyMEhOE6Lps8tTUxlUubebUx+dDjwJwIaWfFsvg2zimYtutcUojtpRALUyMgFxeRz9YPBREAs7X
 V5fIti5B4RaGU7qQk8BFLu4BkabM3kWedIHCbUm0NjFWeAcd9xVkVBeDn30yZdmWPEUGGL/so+x
 /zlmqr5D42loyfGvQfWPVpiYoGWELoYm94qDcXA7rASHeMhop3gzyp4ukLFAhwOJTZOJC8L6xaE
 Q+M0OByNUWSD57Eze3k6hvgdtoq/d3lVKgGchCDQqOwuBHqdWfKyePnQ39i74ED/M1Qnzri5R8y
 kf1kVqBWVSdoINeDgHSOqFJYelbA29fT+5gM=
X-Received: by 2002:a17:90b:17cb:b0:32e:74b6:4ef9 with SMTP id
 98e67ed59e1d1-33b50f297f8mr16955323a91.0.1760440812498; 
 Tue, 14 Oct 2025 04:20:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8ccPgYpBB44vAXWCOVRI1VlGEHsze44hC1G2/E237fphW4r1GMjOiSsLUZtF1AZ5xwCYD2w==
X-Received: by 2002:a17:90b:17cb:b0:32e:74b6:4ef9 with SMTP id
 98e67ed59e1d1-33b50f297f8mr16955273a91.0.1760440811521; 
 Tue, 14 Oct 2025 04:20:11 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61a3cbf2sm15693949a91.8.2025.10.14.04.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 04:20:10 -0700 (PDT)
Message-ID: <47e72a8c-0dc9-4c87-9e1d-b4c60a178a94@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:20:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Enable DisplayPort on QCS615
 Ride platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
 <509e9902-2f74-484f-b5ca-e1605a221004@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <509e9902-2f74-484f-b5ca-e1605a221004@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ee31f1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iK4FTFApuVx0pu7eI5wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 9dWxrEiD_YZXi-5kW1NaYO_Hb2FJhfqu
X-Proofpoint-ORIG-GUID: 9dWxrEiD_YZXi-5kW1NaYO_Hb2FJhfqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX04htwszU4oTY
 2xSV7mY5fvcGMSjTIH9JXgD8DK9meeCOPL9yaJuJ9FE0wxHVnX1eC/+M7O5NTOjThbwLC//rK/d
 Jf8gVdzmBhcoq+xEFGKlFlJ7u0D88K4SvM27BMHa6cD2GKMzw+0MMglI8S9pYQf9s/Nq2yOwsNO
 MVvqAqJuz3+nxOILX0uriN2aw96QjpwIGAt51ViZMeZss+dE3jtIc58BdDYzPcx11hPtqxN8wKx
 PtuE29RYtaahFzPtFuuF7gqe9hCTc30XSZEDak4kmS1Hl7Rc8AkLAmJMDDXPcN+Abv1x9xO5TEG
 impbEE0cMLc8cwgStJd5geDEr1aczFE6H2lK0vasa0P2aB0E5L3yUDCreFkHQCcd+QPOHTr6EhQ
 8uwBBNRsAWN0lCUEuc4pXDud4U79bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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


On 10/14/2025 5:52 PM, Konrad Dybcio wrote:
> On 10/14/25 11:42 AM, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Add DP connector node and configure MDSS DisplayPort controller for
>> QCS615 Ride platform. Include lane mapping and PHY supply settings
>> to support DP output.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
> subject: "qcom:" -> "qcom: qcs615-ride:"


Ok, will update subject.


>
> [...]
>
>> +&mdss_dp0_out {
>> +	data-lanes = <3 2 0 1>;
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> No 8100?


Yes, according to the HPG description, this PHY only supports up to 5.4 GHz.


> Konrad
