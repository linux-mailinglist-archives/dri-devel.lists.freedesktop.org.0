Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1930C198A4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 10:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50D210E776;
	Wed, 29 Oct 2025 09:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPcOsO4r";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWKgHQ0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE2B10E76D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:59:54 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4vQ853666075
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Piz8rod4lz0FtmBYgSwSVPwpSZnz6NSh0sr50I+nrGU=; b=lPcOsO4r3SX6Ym/V
 XyPlofVFzvTrGI2l0UP5NsYv4j28pOhXcDNyo+1K9h4pcDMI8F/eaA0IrYvwiyyH
 ju/qnQ9MAPGJnMTXHV+I/tFOs7/EDWeklEj5SQqnvCn75dAmpeNCchuAdibM9iMJ
 kntrb2Ym0p+c3KKy1TDAqcNw4C5FUNycUxeN0/Th55oUEGSrcM8QjRLNz/io8uJ5
 AF9LsxT1iG2g7SAD1DGviacyfguXDCzx2vIMqLO4Kf3oG3JKehZA7QPJB8H3Wf8Y
 L3Q2ufs7iQDOsjrsnJnunM1jhwXVerjc6Zzba09+Src16zAcPIUKa/0d4eSQ6nmM
 Nm3+kw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3t3pg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:59:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-28e970be282so23345525ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761731994; x=1762336794;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Piz8rod4lz0FtmBYgSwSVPwpSZnz6NSh0sr50I+nrGU=;
 b=OWKgHQ0vjMDmxzPASoYVg9rTUwE0xdud2sO8LnGzjw0ea7/ANeSWcU9WmHJGKv0mpx
 b5JXl14+TW9QCmjnrI0JhMXuaFhB+NM6Ssnh02HfsO2phIExI6BbcZvM12iNyCztpgh0
 YWnCey39WnBVVMzPT4x29QkoAd+mmJrhRtHkzb35yx4g0u8Z2x84m93O7KgsxKXIWDqR
 ylofcBxNRKt9XIEXOfnuyRbUJedolzyIlN2I7k2lB4mFmdcYZTzQFQJBUS1WlaR5QybB
 YHNcgCl/MgYaro17tnUj+QnkbftJMyQmAyMgefynRrAAyg4V5FWpkRrihzHP+menr/F6
 xRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761731994; x=1762336794;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Piz8rod4lz0FtmBYgSwSVPwpSZnz6NSh0sr50I+nrGU=;
 b=w8XWYiebhx4J1snYM4OiVw/6VmTRWyw5eD7TTpX2sx0bmZKqUzvmejb9afQouQyg76
 pTw08/dEuUG8gwc4GokTt2cKklPZxGuNI6HeboEvBpcK/ohsXJ+fublMHVX2RX9K+79l
 ok2w32+t1zjbF7TZDo4T6qSxwEYpIL1LHNdXUkHQ0+pehIDM42eq8LCFpJReXi7tr3+2
 x7XO0hCZE3BBNPHoVl3JHnGBaLGjEAH0TkuZwHPgwtV0BoeFnBhCdHSZyWQJf5fQs/Mr
 ySmuOF9l6Qef8IgZdp/NEGz6NDTO1PyrEsOX6/p87YrnqagU+M/08RFjfOJ/5rKrjlE5
 2DTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHIMMKaKBD8P6M0pXk3I0J12tNXv4hWGUJbSNcUe6FAld2AJFTow9W28N7oioJZyOJLBmBTGE+CXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuwJmN0AeoW+x1pv+1a/pmAU6ZluKlZaP8oEPdT/Ip75d0D0cK
 tFYuPfgFQAdx0cztoWnH9DCzsLuEjDiKlYxRDHL5/625c6CL+C0C2wrw0AaqNBe2Y6bKn4Qp2TF
 tXDdYjNEpcka0zemAJG49O+LbacYuxAptTyUa8aoOOtrbAEPpvA351fAocvE7Q1LRucszG3c=
X-Gm-Gg: ASbGnct63+/hmARsqRH/JosFqkCtaHyqSCjbAGKyuuc/69Y2aWfvB/qRaAxch5PPWx7
 N7ebe93tPbD16I0TWJGFQMr2CfTdwmYkMohlhxep6FxaEsPPA517D9y50SQ9dMGFNWwA4ZN6guy
 DMdNuae1nj2LrgILDcbr3+qTs5U7gEJkJuVBtq7Si++RbJfE2soYkusqq0Zi6NwAo1BqZmveEkj
 nvTlKOeZ3TjXrzt0XFZmWN8mpPPBRFsQRV7CTtEVsFqdBeAMnI0yH5isNEODC/VBOesqr7wWmwl
 Fx/yelcu1p4iFUouHlTpa22gWc4Kl9xziPfRzUhMspXmYJ6/qLySvvgPZKC6+ikXp+M2olWUWuF
 REsPmG3ENlFL8xMFQZst9z9a0QjhoyIqS1Z9pFB6lqxe6IAdca4jnMrZaS8trMvX5RM6n4Q==
X-Received: by 2002:a17:903:2f8d:b0:269:80e2:c5a8 with SMTP id
 d9443c01a7336-294deeedda7mr15829025ad.7.1761731993558; 
 Wed, 29 Oct 2025 02:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4z4olbHvLZYuxygnDrTvnj3GVSCIDXrQfTkLlCd2lWeeIOL0S3gFqI+0DsjMVOy8PFkbqAA==
X-Received: by 2002:a17:903:2f8d:b0:269:80e2:c5a8 with SMTP id
 d9443c01a7336-294deeedda7mr15828705ad.7.1761731992999; 
 Wed, 29 Oct 2025 02:59:52 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d2789bsm144130825ad.62.2025.10.29.02.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 02:59:52 -0700 (PDT)
Message-ID: <7fcbb624-7c92-4043-b5aa-0fbfd3dd125c@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 17:59:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] dt-bindings: display: msm: sm6150-mdss: Fix
 example indentation and OPP values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-2-c4316975dd0e@oss.qualcomm.com>
 <ggrtehmzg5bajbglcjhlf5jynhwqq6vztc2fqwxxgip2q3vmip@t72qcggza2or>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ggrtehmzg5bajbglcjhlf5jynhwqq6vztc2fqwxxgip2q3vmip@t72qcggza2or>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zBGjsudgjTRF6Foibba2swurpY2l1OAX
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=6901e59a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=v3LxePKqoqSeXojOrL0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3NCBTYWx0ZWRfX1s9Bejfxne8H
 LWwXGFLAezv88QBtViBpchm1q+jAjXJ/wJX4Hq+jEiBvaOnlmyaAQ4PtmbSWtH3pl2qJpOqBiGb
 CkaI53SFTFRaD28OWBd6upmDRdP8L6mnvKRbzheadVSYywNaWyymB7HSccHz1umsVXK+ZFF93qP
 AerBMlTCnGma+/S1ZxMG4XBSqIzH8UsuvFLpN+iLa2jz4ZpF8MjKmcuM6YCkgXh22Ag+yb+1VwA
 8wrZvSgtDiU04ht4inyWNmedrCJH1/UZqycAfv8HWeoOx7Di3qDjNkU0km47EJUAJT+LeqQCuAz
 ScLolYjNkDTTiU4+UJzjYXKW9rxJFx4dTELLKNaQvanpWq3ii6d23iXs33KGIoZ7Rq2yk9eE9Q4
 ftl442yclhllqJsPHnRmpSDf6/t1rA==
X-Proofpoint-GUID: zBGjsudgjTRF6Foibba2swurpY2l1OAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290074
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


On 10/29/2025 4:00 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 01:21:02PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> - Adjusted indentation and added missing blank lines in the example.
>> - Corrected OPP clock values to match actual DTS configuration.
> See Documentation/process/submitting-patches.rst to check how to write
> proper commit messages.


Ok, will refer guide to update commit msg.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 32 ++++++++++++----------
>>  1 file changed, 17 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> index ba0dea2edea98cee0826cf38b3f33361666e004a..80183df71cd9288f652dc42afeae101e8edcbe65 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> @@ -140,35 +140,37 @@ examples:
>>                  #size-cells = <0>;
>>  
>>                  port@0 {
>> -                  reg = <0>;
>> -                  dpu_intf0_out: endpoint {
>> -                  };
>> +                    reg = <0>;
>> +
>> +                    dpu_intf0_out: endpoint {
>> +                    };
>>                  };
>>  
>>                  port@1 {
>> -                  reg = <1>;
>> -                  dpu_intf1_out: endpoint {
>> -                      remote-endpoint = <&mdss_dsi0_in>;
>> -                  };
>> +                    reg = <1>;
>> +
>> +                    dpu_intf1_out: endpoint {
>> +                        remote-endpoint = <&mdss_dsi0_in>;
>> +                    };
>>                  };
>>              };
>>  
>>              mdp_opp_table: opp-table {
>>                  compatible = "operating-points-v2";
>>  
>> -                opp-19200000 {
>> -                  opp-hz = /bits/ 64 <19200000>;
>> -                  required-opps = <&rpmhpd_opp_low_svs>;
>> +                opp-192000000 {
> This is not necessary. This is just an example, so it doesn't matter,
> which values are actually written here.


Yes, but I think correct value is better?


>> +                    opp-hz = /bits/ 64 <192000000>;
>> +                    required-opps = <&rpmhpd_opp_low_svs>;
>>                  };
>>  
>> -                opp-25600000 {
>> -                  opp-hz = /bits/ 64 <25600000>;
>> -                  required-opps = <&rpmhpd_opp_svs>;
>> +                opp-256000000 {
>> +                    opp-hz = /bits/ 64 <256000000>;
>> +                    required-opps = <&rpmhpd_opp_svs>;
>>                  };
>>  
>>                  opp-307200000 {
>> -                  opp-hz = /bits/ 64 <307200000>;
>> -                  required-opps = <&rpmhpd_opp_nom>;
>> +                    opp-hz = /bits/ 64 <307200000>;
>> +                    required-opps = <&rpmhpd_opp_nom>;
>>                  };
>>              };
>>          };
>>
>> -- 
>> 2.34.1
>>
>>
