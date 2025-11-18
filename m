Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00489C69657
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 13:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F39110E492;
	Tue, 18 Nov 2025 12:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwRRu+MC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T90FoTMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C9310E492
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:33:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI8Dt7h2194259
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xWH61jHILhuuM/eqN9zZnCfpTwI2FbUKKoAu6Ut/IXg=; b=KwRRu+MCgOwJ74KV
 IByhtwyp+OmF+NIBMsdfaKXEwLINLdNDBc9uP8PHmzmN6nLD23Gp+Te+umlxSy5W
 D54l/pGPqxwaYZbNgWBq/PYy9Kc7nS5lt1ZFcIJNEhxJtDQPaiUT7GUKcaLu4k1k
 PHBRFAZ+Qs6rBcqY52VBEU/jq2Ceah/+JDHXqzV5ImIm2JUf0Trl0kOTv2SPlc9P
 3eDWW7niR427sTkCU6w3WjCOu2mgZr9W8CVZY4ERG5/uT0nteGIfe7Iqm9LiJeKX
 TzFl2cpMScntfOXXJRhPc9wgUC960x/MAi4raLq2uBfb+SCTlUj2xpSdMHy+tbs3
 PYNYtQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y8r34-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:33:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed6a906c52so14259621cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763469207; x=1764074007;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xWH61jHILhuuM/eqN9zZnCfpTwI2FbUKKoAu6Ut/IXg=;
 b=T90FoTMHug0c5YrZj578z4FqE3UDu6udMc28ILKQ9SZeCYVdv0SKPNBsIBPcTZU9l7
 YVe/kT7eXRtykKkwpfr91+rAEQz5JzbO1lEpFAOACx2+samRxcvGvsvU7uHHfb9dDkor
 M0wa7yudoShtvUB2hrNVCEgsU7jNDGlSUzbnAoO+8wY3neG7RNdNAd2OFmg7c+WvZj8S
 Fmm/hjeCUJpNk+oUsCZYG3Hj5lg7F2mSdPDvpxTSIJXSETTmhquhtxJ9mbsj/CAV1icX
 esOB0U5bPEQO0sDdzjh6MERsVTtq+C31WB/w1KdbIo+3w0E39NzuOT8BMiWZz5S+SmfK
 tCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763469207; x=1764074007;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xWH61jHILhuuM/eqN9zZnCfpTwI2FbUKKoAu6Ut/IXg=;
 b=CMd8kCN6wGlG6XVuO4VlTPW7rAbiIusiOKreWhJFArYT5SX5SCIqjtMPYzQDz0Zg9U
 4+JDlzscfIlq1NhXPwENVGoscvkIX8kudgcbku+qGWBQXlAYxkbse/r2sfnPXr6DTyWY
 d6/ZH7cZuQ/T6eDwCGZctDovLUwMWnwq89rf+pIaeh/FHs53BeZOuP5r4YaMISrNc3yK
 0qOrnEKTiFOJLKW9Ew2W0wYHIB+/A3cERjShVCCoqpDjvsffI4OB7RXIX8OkxvfJYkd8
 gTtF0PlC0JhZrw+edt4Rn+08ko3tiKJx+LEefRqXFwfZfzksXr35KO57mQN+JCnrVTmK
 c7NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV03I+QGNYorIzG9MAVjTGa+jyDHu7Y71iwpr5NBybpYc61Idmf+JhNLg6Yvl/5IGQ3yf+yx0nnrks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx0VTEiqO6XHh9FNBa2uNEJD9RCPZgqZZJvp08ZUFyEkyqXH2I
 7soJBFp2sJdAVQqorYhK6Q+ZwE2OT9R3Og6RbG3aTwNCKPcQm190Iz/TYQSKdC5/HqslKAiO3lP
 nkoJUb9vsj7wL4SeBcLzpfKdgGpRUilYsY8GKk2OLxyI3DRbMlRxfevg9yGwi8QWwO/SegytsUi
 HBg/4=
X-Gm-Gg: ASbGnctDT2r2MNEerfAMH8TzqwlgXhOg8vHZwZ3fePnFWpM+sM6+R+aAgjEg8C+/RWe
 edZHKwsJ4hjMD62HuqaBZmqUVEHRXqUPvU+clprSbn28/MaHuCU76O3CJE+QdWXMirKLtlYq1Ll
 uJaRnQlaUREHZlwHz+rgK4SMckflS7yngqsuIQLKvJ9v44z9EvzboG8R9tOcuOKBp3xGgPvb3+a
 8889NKvuEgsD4yrB5JfikI+OIUENMmYxo2Hb8OfH6QJvxewRO0ozda7EO3otwpbPc6nCTGaoU1O
 lTuQ7KusqfVVcQJ4CyXqn81EDV8o0JKaU6DdxJiF/E7RZGUSG8JhB/n7o/XYt5TnWkNRiNZltZj
 x/Vb3rrpchsNXIdOwoc7aiDgG7ui0dDZagmb1rHXyWMAzLwV9QPz1JAt6CtkZQpEE+p8=
X-Received: by 2002:ac8:7d50:0:b0:4ee:1718:dec8 with SMTP id
 d75a77b69052e-4ee313fa866mr24770431cf.3.1763469207014; 
 Tue, 18 Nov 2025 04:33:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFB8OaN3tmFzcOE29+YjSKwC8Jq3pDXXlW1BguEgp3kVHDiSSO5K52l1zjqF4g8J3kaErlFaQ==
X-Received: by 2002:ac8:7d50:0:b0:4ee:1718:dec8 with SMTP id
 d75a77b69052e-4ee313fa866mr24770151cf.3.1763469206515; 
 Tue, 18 Nov 2025 04:33:26 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734ff75e4fsm1345957566b.12.2025.11.18.04.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 04:33:26 -0800 (PST)
Message-ID: <715ea6b0-a8d7-4ecf-b0c7-f4469c94b969@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] dt-bindings: panel: sw43408: adjust to reflect the
 DDIC and panel used
To: "Rob Herring (Arm)" <robh@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Casey Connolly <casey.connolly@linaro.org>,
 linux-arm-msm@vger.kernel.org, phodina@protonmail.com,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-2-317a2b400d8a@ixit.cz>
 <176346899005.2610273.2055455026150162691.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <176346899005.2610273.2055455026150162691.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwMCBTYWx0ZWRfX+UQNuwS9htGP
 ctO4I2XWfsK1s9rsHCCeX8xigPCu1D7U6xF4I3hH2XnYxDukpzGINLXKyby9rZvrHzBl7ry4/YG
 1XF5YSZn5fkq1mkNDzMwxz2oHKg0f/wrb3Inmp4J0hjImUAy2DCxi7LpnZnMczLkoTSq/NiGlHY
 r05+IjAUIu6Nw+u55m+S+fGyKhN1960ECO82VtqXhgpCa+uhLKkbslcrqw6lcPbcCVa+L5TeAQX
 ii+gBL0qZ7zymU8d890B4rQEf++jTvO2MZA/ldGwLKgG629SMVKY+gIzrd7R6E1klBcXyZRtkU5
 dZrgxnUtUt0sWJIfJeM/Mtdiaz/WwILpDKYcZB1WGtjaKI3n/Gy6NCtUwX+RRuDDB6R0qRSDGCy
 IPMlsl0/GGaxRpUzhFmtLYqnzQoqjQ==
X-Proofpoint-GUID: MiJTakznS1Kk_6zcFYxGJZOo0OThhAJi
X-Proofpoint-ORIG-GUID: MiJTakznS1Kk_6zcFYxGJZOo0OThhAJi
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c6798 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180100
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

On 11/18/25 1:29 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 18 Nov 2025 12:30:37 +0100, David Heidelberg wrote:
>> Add compatible for used LG panel.
>> SW43408 is not panel, but DDIC. The panel itself is the
>> LG LH546WF1-ED01, so introduce combined compatible for it.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>  .../devicetree/bindings/display/panel/lg,sw43408.yaml         | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/lg,sw43408.example.dtb: panel@0 (lg,sw43408): compatible:0: 'lg,sw43408' is not one of ['lg,sw43408-lh546wf1-ed01']
> 	from schema $id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/lg,sw43408.example.dtb: panel@0 (lg,sw43408): compatible: ['lg,sw43408'] is too short

You got this error because you didn't fix the example DT (which would be
validated with `make dt_binding_check`

Konrad
