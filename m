Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIcZM0EZnGmq/gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:09:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368431738A6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E40910E29B;
	Mon, 23 Feb 2026 09:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgPei3rs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H//BTANv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F8910E29B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:09:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61MLkP2C2108750
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eN7Ug5P4IulUD8R6oc/tr1H69BNlQK6QUos9s3IP/G0=; b=PgPei3rsOIhtAWo5
 5Z029DFPbn4BtObtDnE8yAdRIE5N0DRD1e14GABAvMIBoj0Rl5YSMmMgYcLSprb0
 VXe7mfdSSEa16caVx+2raxup1eQrvMlNNi6bFjk5WVkC47Xdl9UcrTkUJw8IP/gU
 +l1gxNrKf6uY7X6VJqwEy6YSou9jMbYpeX2IMjCxV/7BiF+/7Ey26dCudFnak2ed
 QMfDVHs3CkDbLWqteEuTveie6wbUKI5e/GlMmxakyIYiOh/fCgUhHyd1yBldKbMg
 lUae9KQOoKkAKH7X3XDsZfPbaT9Cuv8uYEWEtfE0MX4FU60AbAY9Ls/9iJ2+eP1x
 CQrSyA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vum0ys-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:09:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2a76f2d7744so46218035ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 01:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771837753; x=1772442553;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eN7Ug5P4IulUD8R6oc/tr1H69BNlQK6QUos9s3IP/G0=;
 b=H//BTANvzzOOoZryzaICjVc1GMTE2RfAfpzzBVzPRkO1qUOpfXIj8c6+zI3dZrwCGI
 dD28jjsLTOmgJCoIzmGTRwiUK1rPuDNZzZy1Y5w+YuMdaMuEn870aw4YLYxuCy8zTUUj
 7hyyacJ4lMqIW/Cwk4fw1FsLcta2+OkkspnThf9PqWUjBtlOLy8wImEFW06HMVRDPLMf
 0ItcwqDXlsIJEF18us6o/4EX7YAALCr0bsD72nv3Dw6LCswUS+6rjf/XLP/nn+/fXGlT
 /ApPY1BPyJ+8Zy827MwH7N/1ckSD1jIAKaQi4NnjVeA1r5h/mZYywGCNPYVWhFWYeHho
 mpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771837753; x=1772442553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eN7Ug5P4IulUD8R6oc/tr1H69BNlQK6QUos9s3IP/G0=;
 b=LZ91FXrnv+BrXwQ5vn7WLrEXmGyAE2dhspdC1J/Ku/95qJ51F+UDXmpUPBUfpeSmcs
 I4aN36qWVF/R6eWJYuKgRGLm4veOxrKN/iMosbQB8gpodePTRuuuUaeulh+c82y7PSe5
 s7DIQ4194QXHt9Lu27Hkcgyzhpzf63E+7RcMRp2RSewQnpGlyU8IShy8C4D2/364xz/e
 viHxBy8EOSv3ZcCTDTjLGDb847/ShfTYbXp/tV5WTVbCIdT0kwDVqH3oGBU1yVjBVXeh
 otnLhMNxsfH0hGPy9rA5XHUh1bAiWAKHmfYuw+zZTV+pPkAGHcy4fYHbzELV7t5X6NJo
 /tSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpOenNbNdtt7AUODbt8GUdwBTlponel7UQEC22pMZR9/kp/KqQmi1CWUoirH8NNL9tKthUoymZIH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdwMnVHf2m8VJzvM2bcj1kRF1xXTfk9276gLVhF305raC6fEh4
 sDHQfl/VjmwA3lrvNMRIb4EFfiDaWyhlnOGwlO1FtckFroe+O9T9COFcSU7a6P7OsNzWAXwIcbn
 xjdG2R1KzZ9JhLVJoGMUBRaDoEwW0csRafCG4aQ8zNTTr7vWS9gJSuSlP42++jhTZHEENEos=
X-Gm-Gg: ATEYQzxY+mLg8CZtl3VHgkNWypfnZdtfdAOaexvPX4J90SscqthJmWJX5b259hSkvD0
 r5/5SXvolchxctX9fT+zHWt+d5KEPV6t/uCvqgwNLC8nzT7Rgn/6KiymT6kXJ2vCNdH/aXK/lIk
 OrRPMPlaHS1PEYyL1/gPbUukh/tKtxF3Dr2vIGatpj/WH2SjLeFueqLqRjryWuajIO++/BRE2K+
 Xt5nuGuJX7kFD1lnuj+3+X4B5Q4IChhLBA0RYbkyY0PGGyxyDCQ2x9oeF7I3NDhPfDaJNj+252e
 VEJ8QDM7fBjIyZHNTO73q6tFeO89anKEiCfhdDTZQ0JA5kN7CEBaUQ2MwjkcD5QajMrysQ6BIuA
 tYyTFxvKoEeLXlpmMiFnJK3YDp6/eIDaCakaJUok5vmSrMvS/aXgffYvtIJKrjA0L5LCv12t2VP
 DTDSZzVrhl68Q56N5vpinYbPaZH7XPMx5wKRuaHv0=
X-Received: by 2002:a17:903:1b26:b0:2aa:d333:ce84 with SMTP id
 d9443c01a7336-2ad743e37b3mr80704325ad.11.1771837753409; 
 Mon, 23 Feb 2026 01:09:13 -0800 (PST)
X-Received: by 2002:a17:903:1b26:b0:2aa:d333:ce84 with SMTP id
 d9443c01a7336-2ad743e37b3mr80704045ad.11.1771837752910; 
 Mon, 23 Feb 2026 01:09:12 -0800 (PST)
Received: from [10.190.200.237]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad80907b4csm34202505ad.78.2026.02.23.01.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 01:09:12 -0800 (PST)
Message-ID: <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:39:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, mathieu.poirier@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
 <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c193a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GmUvsNMoEockHelqzZ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ATckQVnE2dXgC3dOgeTLQejTyvVRpICZ
X-Proofpoint-ORIG-GUID: ATckQVnE2dXgC3dOgeTLQejTyvVRpICZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX8YJUkt3ILD1n
 h1hhoyhD9uMO87skTYxCQDvktmHjozisidS2PeyFa4mQu/3FSGHp9fWXz69bO+53z+uYY0lVsK8
 l9y+w3/IveqgXvLw2SH/dVJ/N6Qjbe4tIyTxSRkJGtqZXz4uW/8RYtT7NF2J3Ita25LwX3WgQx1
 kPXMkzJRLShbNaf/jVld/r2hEp5v9rRrptTyqpzV+z43jQtvXnBYroFSTefkrD6u8EUE3D3f6DN
 vMEaLXr78liq2MsfK0w+jUC+NeJ6wt0h4P0rMVtvKusFSei2H98xkwF8opQWEDs+3pXAus8sbmG
 DEOTJIMGzIMjNB/adPkdZCql4C+dVCm8aV46pnc3pOYlpNuUcoDXD+2EMFXOL9Q4MbMgqKT7a5m
 /LL3jaGWPNxzZfNSkLp61gsmHINmwE5AwNOdMWkvppaSH25sBJZdsRV6zAxabSE33EylSH+PPWM
 jQ2XgfpQdD/93o+NsIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 368431738A6
X-Rspamd-Action: no action


On 2/3/2026 6:09 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
>> On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
>>>> On 1/29/26 1:13 AM, Sibi Sankar wrote:
>>>>> Enable ADSP and CDSP on Glymur CRD board.
>>>>>
>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
>>>>>   1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>> index 0899214465ac..0eed4faa8b07 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>> @@ -487,6 +487,20 @@ &pon_resin {
>>>>>   	status = "okay";
>>>>>   };
>>>>>   
>>>>> +&remoteproc_adsp {
>>>>> +	firmware-name = "qcom/glymur/adsp.mbn",
>>>>> +			"qcom/glymur/adsp_dtb.mbn";
>>>>> +
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&remoteproc_cdsp {
>>>>> +	firmware-name = "qcom/glymur/cdsp.mbn",
>>>>> +			"qcom/glymur/cdsp_dtb.mbn";
>>>>> +
>>>>> +	status = "okay";
>>>>> +};
>>>> Please make sure it gets to L-F (only Kaanapali is there right now)
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
>>> but the firmware in linux-firmware is (now) targeting IoT devices,
>>> should we use WoA-like names for firmware on Glymur CRD instead
>>> (qcadsp-something.mbn). It would match what was done for the SC8280XP
>>> CRD.
>> I think it's simply time to stop pretending the firmware is generic
>> (some fw simply isn't and some fw may come from different/incompatible
>> branchpoints) and include a board name in the path
> Well... CDSP is usually generic, except for WP vs non-WP.

Hey Dmitry/Konrad,

Thanks for taking time to review the series :)

The ADSP/CDSP firmware that got upstreamed to linux-firmware got their
functionality tested on Glymur WP CRD devices.  Given that the firmware
has already landed, can I continue to use the same name as the patch and
have a different name for other boards if something specific has to be 
pushed
for IOT?

-Sibi

