Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DTZIRqLnGmLJQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:15:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2917A880
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB5B10E2F9;
	Mon, 23 Feb 2026 17:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+xjFPlX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7aQLSxP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F5C10E2F9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 17:15:01 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NAYM6d3409088
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 17:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wh7kU6ZDVbvD/9tP6ZOLZ53B
 u1ldM81AwUKEiVq1unM=; b=V+xjFPlXZagKk5j0l0qOtnm90VoROFpw19JzGSZ1
 c5FjEKAQw8qPznNKya7lDKd/1dfdXl05/8Zws1h9KqtAzvmRDn6lp7h7AmrlCQbT
 I5U6IBuIOnNqaS0BYsE3i2DQaHXgcI0XaZ1X4OntdA0xnRecFEScpYE1+EQd+o+z
 pPykmIBnQR6cr5oEFXLgxXiBC5hq8RN0Z1gFAaAgrKLIjGd5E8+ubsmAbGTlVh73
 o0TSuI/A9d+fKAGfd1vOn48Zb0vIBgF8FuWfDXZvYDuCgt8QpIWyZdj6XYbE0/gU
 E+Xu0KJbz2keqLG7y9Gv1P65MeZiNwH0UI9kXT/loSjp1Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8ts7f1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 17:15:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-354c44bf176so4612157a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771866900; cv=none;
 d=google.com; s=arc-20240605;
 b=gbOHlKd/DqRySp4eZVaq0DezPCdLV2Njc+eMvZo0adtDI22/qoAryV8X2VDK0MMefe
 AOirTECSMADY2vrTJ6PWSlfDCG4JGmTSfmMkLv6YO51TUN1y6xRY7ktmIbl5aOBcpKuZ
 CSLDSgu/fkBq0CPnSyloAuNeApHFk4ouWb51pM4ULJpvLPEm6N9NL2Maeb0pWeIVtLtz
 Pz63dpcohbz5bLPRnx7+rG+C07XEXZkeiNSRmPJjDfDBBHMqPrf3Y8fqjamuTI6+L+4u
 Ch69oG39VwPk7A0RXB2uhDfuFZ52ZkoYKbWqg7jo9F5d3ncyH3l3kZv+zW4L3w19lnLl
 6egw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wh7kU6ZDVbvD/9tP6ZOLZ53Bu1ldM81AwUKEiVq1unM=;
 fh=TJ0Mpddwaut6P8qT0RwOp6InZy9kvqhwkz4fYJqp6LY=;
 b=fANxEGbiLJqemBR5qJdriEjQxrVJwR7Wkkexym5AL5/Ew7stqC98wjDYSIL4IiCWVu
 f860vbXoiJlf2XSxPvd7ytRryzDWc6dPJnCY/OJhAOOwEsWXdJRynPz4K2AK1/4MWRnG
 XC7YixWaJktBDGBeyR4CP//2wP/SLEKed22mpdL5pm7wVGWF3MJPlRhE2u62t0XkOGvV
 95H7x7CHJDYrphZaPBFvO9+s+Z3/V1S89Yz+EJwhv0j9PdogIoJGwZB8WjdL2oBqlETe
 w/DBEqzoD3MBhOi8GzVxPJ32yytRYaSzB37kZtMyH9Uwc3NeC90j60FWyyXHDh1zAplB
 tYsQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771866900; x=1772471700;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wh7kU6ZDVbvD/9tP6ZOLZ53Bu1ldM81AwUKEiVq1unM=;
 b=h7aQLSxP7kMkBNQt0ylfFOc/OeghwHc01DKK4cF1PEevXa30CRT200S28m4akxscLc
 qYGTJ7OuxFNJ1JI+g+1KEDrQrPua+O5wSmqppCi4f7aDdLucoSdze4TRyuZ/fHbf0FJ0
 5GH6akaal7/5LhKwGBUYrgbTlblGr4QjF3D2YOLTfdujq43im3BEOMMIheID2++nYZRy
 keFA04VDxfKCe9sxwlwg31HmfBe5eY16qfqPdO1DufIW2AXty1e5w7tC+EDz5+60gr89
 CZdyOWpIGOjrHKmI9M6CsP/8vfao6mFXbaWRMGJdSUI4fNSiUpiKlIRP7NtmI53nGIDC
 cUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866900; x=1772471700;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wh7kU6ZDVbvD/9tP6ZOLZ53Bu1ldM81AwUKEiVq1unM=;
 b=sBqsvMaVWLpRedvs2l35MYidjIBhqd8K0hcTG06zYXvmaBjOn0gnRT5EXrul15JQ6a
 g5OdjPxKnSxherz2mqJJ59wNSsi8VcENO834kPM6Yw7Lb4rsTjhxOflzbucapcKvtxxr
 ykR0GIN9PM22ZiA45Qf0ex7C2+PUpEsu5hAWJlR/4dRT0IfOHeJafyOpXD0qVWQiR4k2
 sDe2NSoNTbgTOmlgffAtcb4Bt4y8S1m/49ATfTyc/oib0WZj7IVLGOMGGNAGuw5Eb31v
 UU1tupamHqqxk4j0PLZm1eiz+TzwSKrNAUzSk8+iJPNchGdJe8j3jmDaUsAZMkh+yVaf
 k8cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJILmo8VkSVw6BF3boBDF6yc+3SMDGu9Q4s6OHHGxxLfvHt7Ry8VSZIFeKcGAkb6KoSDi31gjakn0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw80+/hdxG1DiCYyr8uoimFiaaOqaRLPNPrV6IrfeREv3o6zDn7
 YUH+MJE55NU/l2hvdeJTKZ3QOfAUfzqkuPGYlrB+1TGQWaUClN2CFMilszynMYOaTzkEQqi9L2n
 P53CGSdD6TShXwRF9rNoEpHG/I0YNIF3yLyLKksAmPb2t6CSjd1O10YflG+bMhcDaL8+TCv2cyA
 Etf840ZybNL4zA9RLlW+t3xucgH5lkLzCLDdklwCVYar9MqzetJ7ERpA==
X-Gm-Gg: ATEYQzyL9+jGWY6sMYW2RgQBK5vb/ZPVwYU6lcBqCl3RIRsLt/EzG6H+UaZukCzA6sW
 LUee5VYALcvKKzlcYPlIaX1Sl9RNZ3F5bR4Iicz0mDKxHwsqN/7f6f+0yjcohrxdzwXi+Uhs77P
 qc2Vvlx2PamsyX9aGCN4otPW6DyKfshdJOJ2cW6gkBkeGD5GDZUNAZmeS4vzwKli1uFEd5KRDJc
 Zi1rrg=
X-Received: by 2002:a17:90b:4d07:b0:356:9405:759d with SMTP id
 98e67ed59e1d1-358ae7fd547mr9439336a91.9.1771866900332; 
 Mon, 23 Feb 2026 09:15:00 -0800 (PST)
X-Received: by 2002:a17:90b:4d07:b0:356:9405:759d with SMTP id
 98e67ed59e1d1-358ae7fd547mr9439301a91.9.1771866899637; Mon, 23 Feb 2026
 09:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
 <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
 <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
In-Reply-To: <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:14:47 +0200
X-Gm-Features: AaiRm501mLQQ8EL4TUeJKdJtQPxrmINvjfQ-5i--0rLisA6GLW_3SyuzX8m0n54
Message-ID: <CAO9ioeUSJQC685K47qMBn51r7APReO9T+h_K3bZ_94Uwn1unBg@mail.gmail.com>
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
 srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699c8b15 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=iTchkLz9Y-giF9P-svAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: e7llT-LbvZ7f7vYrTQX02OHplv7ThBad
X-Proofpoint-GUID: e7llT-LbvZ7f7vYrTQX02OHplv7ThBad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0OCBTYWx0ZWRfX3kdF3aQ18Son
 PK9TnTnfmxjUui1g47sT5DKeBx7WKaM1r6qJrWVAzjk2mL4KZyURDbWfsXFpL0UWmkkWfRFHbH8
 2RLTYg8DDnjgAQ4sSsIM/xuf8iCSMqrmid5d/xthETMyf2Xr7tkSCAxHoiOo2kreXxOgY95Yzz3
 2uyntK2TERXOsXf0a9RoYhTuWSTRnEqXlfmUUNn47M3YhkYDUv3fjIR0n9+hS0jdUXvrRIWkHiC
 ouHutax476UMzrd5ABpLZwcsCNXXcJ9vVNaG/wz68hRtSSVh2AXH0x8nWAGpVPuJHP9NFPjCuop
 VF/+q/YdcGkU683T0xqGqSZOMi/0+4Z/IMe4mz6kp3x3+G0SSH03rRfklLeSMvrSkUFUNaDJmgw
 17zocAlifjO2HdZpduGrWQ0HxAWXaMcwpdsNpFxGOVskbR+x7SubuMv5UmdYT9qnBRFb/1NKaIT
 EepMRWF4Bf0scJlQzuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230148
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sibi.sankar@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: BBF2917A880
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 at 11:09, Sibi Sankar <sibi.sankar@oss.qualcomm.com> wrote:
>
>
> On 2/3/2026 6:09 PM, Dmitry Baryshkov wrote:
> > On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
> >> On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
> >>> On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
> >>>> On 1/29/26 1:13 AM, Sibi Sankar wrote:
> >>>>> Enable ADSP and CDSP on Glymur CRD board.
> >>>>>
> >>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >>>>> ---
> >>>>>   arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
> >>>>>   1 file changed, 14 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>>>> index 0899214465ac..0eed4faa8b07 100644
> >>>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>>>> @@ -487,6 +487,20 @@ &pon_resin {
> >>>>>           status = "okay";
> >>>>>   };
> >>>>>
> >>>>> +&remoteproc_adsp {
> >>>>> + firmware-name = "qcom/glymur/adsp.mbn",
> >>>>> +                 "qcom/glymur/adsp_dtb.mbn";
> >>>>> +
> >>>>> + status = "okay";
> >>>>> +};
> >>>>> +
> >>>>> +&remoteproc_cdsp {
> >>>>> + firmware-name = "qcom/glymur/cdsp.mbn",
> >>>>> +                 "qcom/glymur/cdsp_dtb.mbn";
> >>>>> +
> >>>>> + status = "okay";
> >>>>> +};
> >>>> Please make sure it gets to L-F (only Kaanapali is there right now)
> >>>>
> >>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
> >>> but the firmware in linux-firmware is (now) targeting IoT devices,
> >>> should we use WoA-like names for firmware on Glymur CRD instead
> >>> (qcadsp-something.mbn). It would match what was done for the SC8280XP
> >>> CRD.
> >> I think it's simply time to stop pretending the firmware is generic
> >> (some fw simply isn't and some fw may come from different/incompatible
> >> branchpoints) and include a board name in the path
> > Well... CDSP is usually generic, except for WP vs non-WP.
>
> Hey Dmitry/Konrad,
>
> Thanks for taking time to review the series :)
>
> The ADSP/CDSP firmware that got upstreamed to linux-firmware got their
> functionality tested on Glymur WP CRD devices.  Given that the firmware
> has already landed, can I continue to use the same name as the patch and
> have a different name for other boards if something specific has to be
> pushed
> for IOT?

Thank you for a prompt reaction, it took just 20 days. During that
time we could have fixed WP firmware filenames, but... linux-firmware
got released just two days ago, so we can't fix that anymore. Now we
don't have any other option than to use a non-standard name for IoT
firmware when it comes later.

>
> -Sibi
>


-- 
With best wishes
Dmitry
