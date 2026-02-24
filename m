Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCH3HKZCnWkMOAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 07:18:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EAF1825AC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 07:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C7610E1CE;
	Tue, 24 Feb 2026 06:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJM0S5xl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WBYMC52R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C83A10E1CE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 06:18:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O4LU2M1250855
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 06:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JIF3RzhViYYlwxx+OD/unsWmeMnNrO6XtaAytnKLG5w=; b=SJM0S5xliId38m0K
 yEeHtH36NYE+SuY/Jiivi5rbioKb+jvioZ0KTCFwPBsbt9TixdCi+zbsJiwsQUZT
 0gh8VH+1WUfX1G8tCK8yzM9LRRkBRXzYAVhncJEw/2wQCsdTcQeSydM/3ZJgT5c9
 dFZtguSyMcGmuv0OriC68j58AdtPaBW7girwYib3Vdsv8McKNnp3SaNuRjWQDFU+
 TeGs2DHWyoxECcnALatSSaqQkf8tyzUiFqFOaTt9XCWz9NiyNabV8yjowfjZ+2U0
 y4WJ+01NZTMcNnFnAT12oWjlGRpca/6rQBoBnLNqv0TmLFTLiyWe8Hf1L9jUHg2B
 87zx+w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4568df0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 06:18:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-35678f99c6eso3582963a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771913887; x=1772518687;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JIF3RzhViYYlwxx+OD/unsWmeMnNrO6XtaAytnKLG5w=;
 b=WBYMC52RAXeF+isQLzoAaleffdSVQR/Kzl1ldcBNA2yvngixSEMdshVxFaCzIT1s8A
 RIeJzIYwIt33cnIVz/kQtzsr1KqR7Rs7f6jm3Qhh5qXkgG3BcHvfgdLWfv3ekhATlxcf
 uMoeJmQRRKg7cWuhagKv5dKbsjIv9YxZqfwwFUIZChx5zkm6bFUnDuQUddlS59pzkgJT
 p7CeTe/by0DcNrg49doLAmHhORbU3285UtNKOGXJsrj9P0EfNjPsbAmxtz5r//bv4h6G
 XhP/Ihz3Qe2I9YU3cBJ9isiZWaKwFavM/9MpYWcuSzFMUFn1HI2yjHrNGxefqQBnXnzO
 eqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771913887; x=1772518687;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JIF3RzhViYYlwxx+OD/unsWmeMnNrO6XtaAytnKLG5w=;
 b=IE3ySa2AwpIPucebBMPO6AC+NzMQKAHH4FJ6O+isAjL2d0NJ2V6A1BDTVGzzMFvFDA
 hGrzZlhU6y33oi4vBBY/mwLSTGvvnfOfbufr8a76jH5GzupBXA+cT8J1jmTe8a1o8bzr
 Gt6T2C/6Q9u+xeECV4/Sqt6cdgmvhF3xmYCw8xfp5s/v9CG36cN2mUZHMbqTV6Q3Jd+l
 fA6agff7Sy4yx279TeYPuyIcuQgIVYSp+CiSyCwrsaZksIFv+6V1LFljI15Vtk2blhej
 BBdDD9VLYIiqqTGk16rnuyud9QRdbHu9RA/2rpu7g+aopGYj8Tv1AuUXPzVeaCBFGKH5
 i9+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXESsUC4Tmkg+ILDI+KDnvZrRS41B0/YHpVNNF1t7mO72DRJLSEUw2xCbAu0INYRNL8gfHZXEjMFTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbF79jT0UcSjLOGQ/BrzzYjyxJHYWZlDxZXOQzl3GBYx++kJDv
 0LHOlYCHLMD7JPL0HkRLYnVJq24VbXyYRJA5Dzx7wj4r5aGJD/ZajLrr1pSqp9MaVzjWD2kxaUf
 Ms7OmnMJaPspyLGGjnZEzBK+W01oIxswwp2iD8yYd8zJT48LxNh9GLNa296C2BS++Z+qm3sE=
X-Gm-Gg: ATEYQzwspLT8726rAa0lJe0WYVpJ8qrvouakrEy/51h/xc78enkP+p2T54olHgISF91
 9qMhVwrITSfS/Aaj85rmn+WZ3M9/Prow3zmsSjD0oYinWkt1+zd6XePHa2l9y+Fo3Kz6K4xkb67
 SFkEik8d/IDFxAATvAh45yk8fRN0uzf1XQimSdWyUjN5e3ysmVldBVTWQmCZh2mM5UaYWCky+0l
 hcsrn4DOhD8EkXdAAib99KJFCXaA01vfDLnuPC+wdsLnVQhti94J6PS7jpQurpY6ww1CyVp/JyL
 7V1IWb1DjB8sQzJMkSZHYkfnAyMEQ332QRSKHiTBRus8K3QlylMRPYgr55EmHt3L6FDKNE8sqzY
 Ak0xZWw77YoJH4xrK13IGC0DOm4+e0fD8rkmrlJso4fLUsoLXmo0MZ7KhUpR6wWOXeq0ebuVXv6
 wAET+OUaKWiZrF3ro52y6wVcpAa69I47V0aReBDO0=
X-Received: by 2002:a17:90b:2e0f:b0:356:3ba2:1233 with SMTP id
 98e67ed59e1d1-358ae8b3dafmr8115463a91.22.1771913886841; 
 Mon, 23 Feb 2026 22:18:06 -0800 (PST)
X-Received: by 2002:a17:90b:2e0f:b0:356:3ba2:1233 with SMTP id
 98e67ed59e1d1-358ae8b3dafmr8115432a91.22.1771913886336; 
 Mon, 23 Feb 2026 22:18:06 -0800 (PST)
Received: from [10.190.200.237]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-358af5f8b1bsm8333890a91.0.2026.02.23.22.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 22:18:05 -0800 (PST)
Message-ID: <48778fa8-b485-4c79-be1a-c70836f65f0b@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:48:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
 srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
 <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
 <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
 <CAO9ioeUSJQC685K47qMBn51r7APReO9T+h_K3bZ_94Uwn1unBg@mail.gmail.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUSJQC685K47qMBn51r7APReO9T+h_K3bZ_94Uwn1unBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8QMw8E4X2Z9DCywRMzJSgJD4gmCXmiuV
X-Proofpoint-ORIG-GUID: 8QMw8E4X2Z9DCywRMzJSgJD4gmCXmiuV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA1MSBTYWx0ZWRfX57G1h5V0GgN3
 lwHPydOrNNB05GQ0OkK4sl97ic47MnAph6ZXpbJ9fPTKj4vVc1AtiSQt+pRO5nHQRaXvZ8fngKs
 mjlvZatSJXCWlE1QJ2PDmnMlmsB1AaexKYupCgm1pzJsLDLbrQXVRH5XL5tRjJMCtCxSZFxkJYR
 A6zH9kg552CSu1/yH6nvZegnd7GqYAbFBwmSH8XIiuRpgUNeEAQ3bu4eKgRv29uq+a2SS1sPH24
 PabFLIWcvOlOIVcvfCoSNoh78UN+N3yneTtE7c/dnJChG7kzWSYBSZcpbfsRAJQWY12uaroFsmC
 DCyOJjJXwbs7HHuDwTotaRQYHTtP/SPzDtD3tIIqRCRh5Jnk1QdlV34hTPGjF31V8ITQWDLQrCY
 NGuvt1OIXt6RfEl+gx9w+25DIZCQVQDB5moepBLfcECzoMEsC80mUJ12N0QPrdEfc8keKMtB3mn
 addkBa2XyK6srjM1lnQ==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d42a0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ePpz_JlwkyPc9ubz9f4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240051
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: D5EAF1825AC
X-Rspamd-Action: no action


On 2/23/2026 10:44 PM, Dmitry Baryshkov wrote:
> On Mon, 23 Feb 2026 at 11:09, Sibi Sankar <sibi.sankar@oss.qualcomm.com> wrote:
>>
>> On 2/3/2026 6:09 PM, Dmitry Baryshkov wrote:
>>> On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
>>>> On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
>>>>> On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
>>>>>> On 1/29/26 1:13 AM, Sibi Sankar wrote:
>>>>>>> Enable ADSP and CDSP on Glymur CRD board.
>>>>>>>
>>>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>    arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
>>>>>>>    1 file changed, 14 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>>>> index 0899214465ac..0eed4faa8b07 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>>>> @@ -487,6 +487,20 @@ &pon_resin {
>>>>>>>            status = "okay";
>>>>>>>    };
>>>>>>>
>>>>>>> +&remoteproc_adsp {
>>>>>>> + firmware-name = "qcom/glymur/adsp.mbn",
>>>>>>> +                 "qcom/glymur/adsp_dtb.mbn";
>>>>>>> +
>>>>>>> + status = "okay";
>>>>>>> +};
>>>>>>> +
>>>>>>> +&remoteproc_cdsp {
>>>>>>> + firmware-name = "qcom/glymur/cdsp.mbn",
>>>>>>> +                 "qcom/glymur/cdsp_dtb.mbn";
>>>>>>> +
>>>>>>> + status = "okay";
>>>>>>> +};
>>>>>> Please make sure it gets to L-F (only Kaanapali is there right now)
>>>>>>
>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
>>>>> but the firmware in linux-firmware is (now) targeting IoT devices,
>>>>> should we use WoA-like names for firmware on Glymur CRD instead
>>>>> (qcadsp-something.mbn). It would match what was done for the SC8280XP
>>>>> CRD.
>>>> I think it's simply time to stop pretending the firmware is generic
>>>> (some fw simply isn't and some fw may come from different/incompatible
>>>> branchpoints) and include a board name in the path
>>> Well... CDSP is usually generic, except for WP vs non-WP.
>> Hey Dmitry/Konrad,
>>
>> Thanks for taking time to review the series :)
>>
>> The ADSP/CDSP firmware that got upstreamed to linux-firmware got their
>> functionality tested on Glymur WP CRD devices.  Given that the firmware
>> has already landed, can I continue to use the same name as the patch and
>> have a different name for other boards if something specific has to be
>> pushed
>> for IOT?
> Thank you for a prompt reaction, it took just 20 days. During that
> time we could have fixed WP firmware filenames, but... linux-firmware

Hey Dmitry,

I'm really sorry that this happened this way :( but I was out
on vacation the past three weeks getting married. A quick
review comment on the firmware pull request for naming
change request would also sufficed in the interim. Also to address
some of your concerns there aren't any plans to push an iot
specific ADSP/CDSP firmware for Glymur reference devices.
Also, this series already warrants a re-post so I can still
accommodate your naming requests with corresponding
updates to linux-firmware.

-Sibi

> got released just two days ago, so we can't fix that anymore. Now we
> don't have any other option than to use a non-standard name for IoT
> firmware when it comes later.
>
>> -Sibi
>>
>
