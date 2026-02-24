Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDUECo9xnWmAQAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:38:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E3E184BC3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075EF10E140;
	Tue, 24 Feb 2026 09:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DltwqRYR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcZMHrGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A1D10E140
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:38:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O4LjnR1460712
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s1SK4xxHCghz73tk4AuBgNJLpt1PKV49tRriGiP5+AA=; b=DltwqRYRdIQcP/lF
 Pl5jCI1YCOekGMCbcSOdekrwtyDwnBuX4uAcwBzh3qU9UcM6V29B+zqG5PTc57y5
 s4CvMG0nevsWDZx16pRJuDiHQJSA69XrhZBCHytaVChM++j8FJzyyHJmWHJ/0Qsb
 sYN5/H58stYjTV8rgo1adtp9/IKfH4ffi/SCGGcZEEJBJiVXX1BbdkzSrS5cvAyD
 Bd1n3z9VzMllWPV0nn0cYUBCd/7umvZJ9pb2ufc6iJvDeZ/O6gVBufwg5hzK8/b4
 ThbanhdivJDVtMMp1uB7ToFfNahY7TBo5yCGiT2TwTVenZYlqs9VGpKTaLiVB5Fk
 ztjDsw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e38xjw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:38:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2aae0d40a47so448768335ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 01:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771925897; x=1772530697;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s1SK4xxHCghz73tk4AuBgNJLpt1PKV49tRriGiP5+AA=;
 b=XcZMHrGHeegTDz66/6BzTTqbN3w6La+nYhygrqqYHnaAKbCxMcXb+sFBz+XhSxWAa0
 iTBNOStMjiI6pw3l1tE3MAwSDnhdWb3YHJp7OEiCZEHQ3qy3WF4uyUMI8E24kivlWaxs
 ZtoDzJOSGQiPtXsxLre4GkUiDEG0wVDzfft7Zfc3RVt84xMsBY2OzFSj8uHJE508fJgw
 AEtFXgMDT2oZgbaD4T4VQVG9Mx1AcjyNtjvARYYL5zlhpskhp/MYxowmtNQdOxgKPDSc
 YS5KgMtD8Y0wEUnRdw0/7TFYZM1G9KIrwohWsB7aPnEwxGTC4rDBDYcOUQ3pHk/bE8PB
 StSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771925897; x=1772530697;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s1SK4xxHCghz73tk4AuBgNJLpt1PKV49tRriGiP5+AA=;
 b=bU/Z8XUBN204kPdQTSGFDzuxUrCwzWUgV8P9nipO//MqxlaGKZdSWLqh6qGpYvKYll
 O2h0JBYJHC8qsgl2268aO3+xiOC52pImGvCBPBGNetk5c9SUFX4bWZN3j76VndDLk5f2
 WeqoqcACnyVrOMGEKyotv7WkyHZVVuyquVBGbKgWJcl+0A+Lc7hf+a3+NRvFm3e+mIDl
 3Nzf1O1CBOaA3hWcU8fed+4CWsMCseGPUk5y6oXk+lg5CJlednC5UQMdGw9zkc0BdOT3
 ZWSxjskiOxD2/iqhmL0hQn2Vk/nzWQ/3kPHfOx+XuaFI0buLIqDygDVqvjNHJQX1oe+s
 Akhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Dxi6YB2Fqn43ttsdxPRlcUywaDD9RXdOODMZZsi+BIxQv2kjlrJ4vgfDnocPdwWAogXIKxPaOVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfRCHmV3tDgKHyTaYTS7YnZQy0Cg3JdDzrK8wK/m0Sa0uN2MAu
 W10dCR4KHcwK/rM6WysAoNpRlstgn+Mw7uRgo3oX8GvnNP41JtVqUR7rACVTJFbMRXc8W4qfgxn
 69uVQ7X3mmpz7Cl29Gb5atS64OoEqSsODXEi2jHJmCxoPWTdhBY84sn9qigdTc6KOI7iW8Qc=
X-Gm-Gg: ATEYQzxnLhdMQ9khwtneXHrHKsd2QpvBRBaB4vUG3YToN+u/RqlSRWO/6Oh7cucekx1
 xp6Of5nWHssZmGrrpBvPXJrWicVeQyqfDVjiGR6OqjbxgDrkBBrMfnVn24mmfaLChJ3MkwmXqdF
 X6E/nt2cdU/fkAnI4SW6tTCWA37Yo3Hw7nrh203MGoQiDN4mSncRBDvAtj0e60crUwT4VvJp9xM
 xLeuQhwsQIWBfpOQ8tDQhPuOrIC2t+AjGsQ5fmC9Uqch9zXL8ZZUIQz3iN7IBlGI10f42FVytQB
 uIT/Afw1IfLXZEt8gnuV5ST+ldircsK4UPTJosvPdXV8RKXpkIo0fzdf6bYyhchKP+9mKfZL0t8
 b9gSBRKLC8YcnNugFkd6tLmk1IbEFaNFKDN0fOtAK90X3ssX8Mo/A
X-Received: by 2002:a17:903:248:b0:2ad:9edf:7fe4 with SMTP id
 d9443c01a7336-2ad9edf81a5mr19440125ad.48.1771925897350; 
 Tue, 24 Feb 2026 01:38:17 -0800 (PST)
X-Received: by 2002:a17:903:248:b0:2ad:9edf:7fe4 with SMTP id
 d9443c01a7336-2ad9edf81a5mr19439945ad.48.1771925896872; 
 Tue, 24 Feb 2026 01:38:16 -0800 (PST)
Received: from [192.168.0.111] ([49.207.195.178])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad7500e19fsm104235835ad.59.2026.02.24.01.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 01:38:16 -0800 (PST)
Message-ID: <83decab4-a59d-434a-8ddf-2808d7081858@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 15:08:09 +0530
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
 <48778fa8-b485-4c79-be1a-c70836f65f0b@oss.qualcomm.com>
 <lqt5k6w3peqlgvgeagp2v3yqtvqpaihsbkvu2hwfzel4j2whnh@qafj2mnrt2dq>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <lqt5k6w3peqlgvgeagp2v3yqtvqpaihsbkvu2hwfzel4j2whnh@qafj2mnrt2dq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699d718a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FDuvZuZHjihTmU/CkdNO9w==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pNNgpXSRwlUzhS52UYoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: AtOXDrxyWmGWo4IuFJL-4B5J-yxAQUzt
X-Proofpoint-ORIG-GUID: AtOXDrxyWmGWo4IuFJL-4B5J-yxAQUzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MSBTYWx0ZWRfX6JhQGB8QH5+h
 U9c78t0iUsX3Yi6/fNOMWixMayEOboPAdJlOXLUk7S67BXxAsLQKhiAvYwdVi7mtB3gwyxUZ5/S
 xyQRg5yD+O8fHQHRZIplLIOHhxdW8akuDCP2Iy5RAkoOcrL665KnD4i7H3iucSMlJv4YkLbT9mO
 UcA9l03VyeBKuHNQT6jPm2mx0pTsRNHxENvujLQZTNNhp9ObtaYrYed3epJOLkdQREWf+vynjGp
 vU4yL3Ap67ZUqykH8atWjBf219ZgOIqEYe2QF+5vyUhNQvtVgaLKqzun71c8/d2IeTy1IAIBApX
 nZllI9ldWEyv875TpIhhVO/bDatKmXTnsdsLblCQ1S4VY1QO7+YYXWggrBjJfepvdaWqE81AqC4
 Lf2Wjki/gGKX01q5c5xdP963qrSlSieg+nJ2q1PmfzTOiOQEaHnqWJ2xt+55Utu/3Yc2rSwjBlr
 iKRyiKqR7qtcn4t8YnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240081
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 81E3E184BC3
X-Rspamd-Action: no action


On 2/24/2026 12:00 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 11:48:00AM +0530, Sibi Sankar wrote:
>> On 2/23/2026 10:44 PM, Dmitry Baryshkov wrote:
>>> On Mon, 23 Feb 2026 at 11:09, Sibi Sankar <sibi.sankar@oss.qualcomm.com> wrote:
>>>> On 2/3/2026 6:09 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
>>>>>> On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
>>>>>>> On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
>>>>>>>> On 1/29/26 1:13 AM, Sibi Sankar wrote:
>>>>>>>>> Enable ADSP and CDSP on Glymur CRD board.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>     arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
>>>>>>>>>     1 file changed, 14 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>>>>>> index 0899214465ac..0eed4faa8b07 100644
>>>>>>>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>>>>>> @@ -487,6 +487,20 @@ &pon_resin {
>>>>>>>>>             status = "okay";
>>>>>>>>>     };
>>>>>>>>>
>>>>>>>>> +&remoteproc_adsp {
>>>>>>>>> + firmware-name = "qcom/glymur/adsp.mbn",
>>>>>>>>> +                 "qcom/glymur/adsp_dtb.mbn";
>>>>>>>>> +
>>>>>>>>> + status = "okay";
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +&remoteproc_cdsp {
>>>>>>>>> + firmware-name = "qcom/glymur/cdsp.mbn",
>>>>>>>>> +                 "qcom/glymur/cdsp_dtb.mbn";
>>>>>>>>> +
>>>>>>>>> + status = "okay";
>>>>>>>>> +};
>>>>>>>> Please make sure it gets to L-F (only Kaanapali is there right now)
>>>>>>>>
>>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>> Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
>>>>>>> but the firmware in linux-firmware is (now) targeting IoT devices,
>>>>>>> should we use WoA-like names for firmware on Glymur CRD instead
>>>>>>> (qcadsp-something.mbn). It would match what was done for the SC8280XP
>>>>>>> CRD.
>>>>>> I think it's simply time to stop pretending the firmware is generic
>>>>>> (some fw simply isn't and some fw may come from different/incompatible
>>>>>> branchpoints) and include a board name in the path
>>>>> Well... CDSP is usually generic, except for WP vs non-WP.
>>>> Hey Dmitry/Konrad,
>>>>
>>>> Thanks for taking time to review the series :)
>>>>
>>>> The ADSP/CDSP firmware that got upstreamed to linux-firmware got their
>>>> functionality tested on Glymur WP CRD devices.  Given that the firmware
>>>> has already landed, can I continue to use the same name as the patch and
>>>> have a different name for other boards if something specific has to be
>>>> pushed
>>>> for IOT?
>>> Thank you for a prompt reaction, it took just 20 days. During that
>>> time we could have fixed WP firmware filenames, but... linux-firmware
>> Hey Dmitry,
>>
>> I'm really sorry that this happened this way :( but I was out
>> on vacation the past three weeks getting married. A quick
>> review comment on the firmware pull request for naming
>> change request would also sufficed in the interim. Also to address
>> some of your concerns there aren't any plans to push an iot
>> specific ADSP/CDSP firmware for Glymur reference devices.
> There are no plans to push or there are no plans to have it?

I've been told that the plan is to use the same firmware for IOT SKUs as 
well. Also in case they do update the firmware in the future, it would 
be tested for any regression against WP targets.

>> Also, this series already warrants a re-post so I can still
>> accommodate your naming requests with corresponding
>> updates to linux-firmware.
> Yes, but the linux-firmware has been released with these file names, so
> you can't just change them. You will have to provide
> backwards-compatibility links, which defeats the purpose.
>
>> -Sibi
>>
>>> got released just two days ago, so we can't fix that anymore. Now we
>>> don't have any other option than to use a non-standard name for IoT
>>> firmware when it comes later.
>>>
>>>> -Sibi
>>>>
