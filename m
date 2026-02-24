Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HPXE61FnWmoOAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 07:31:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EC01826DF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 07:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F2D10E130;
	Tue, 24 Feb 2026 06:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7znZ/P0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLyyEFq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CBF10E130
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 06:31:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O4MKRc696443
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 06:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mrnibdhDFWWXaZ2Mcr559Vtn
 d7wiGbsUwg3q2/yPUkA=; b=O7znZ/P0TTfUhxS2fNa6ZoVevQGqYLNeTCTGbJ9A
 KSbf2hef/0etqN6MJHIp5hLrJWxWQv8TezgiglnLCndmjfCeYsbSXKBl+S3iihrL
 +pUm0pV9r7+ryFw0xcYGOiufCVwxlTdd1pkv+bHWdtdf/7/AU5bDvgaFKj6DFA/E
 mB6n8aX5WSQJVQIHRK8bzd+R20T+s1XQvllbUX2BZEnywbbWJ7sFd/WfjZfRYZC3
 +udzw0at6JbdnhwQf4McSm7JkO0M6fgoilH3i6yGzF1RYO49d5GKjiRnA6n9qCaW
 EQHamhkSz9nAY2xiau/lUPTqrOBWbswCbmDHrt3zoSokuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9t1sr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 06:31:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb0595def4so5984068385a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771914663; x=1772519463;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mrnibdhDFWWXaZ2Mcr559Vtnd7wiGbsUwg3q2/yPUkA=;
 b=RLyyEFq/q+nXjp3TMPnYhASbybWnoH5ffcwt8UtBf6HPoOXUAzy0+1vdlS/b5+Le62
 1gkK00rAhPRLQIKeOdfyAGGm0mGBdiisWcMLaEPoMD0dYsWOYWZrk/pYwc3cvF+BZyDA
 Ir0X0vyZ0JOPQSvbzbB2IbOckuPZ42EY1eQBRa40UzJt3uXJTJDzbMyGQuyzP/swBs4+
 WoYi9TvTRoU1JjGbeOujJdGS0Nv7o4dq9VvoWYPko6nppmojRsk+fFkbaZEIoYQzLjdw
 EtfB+d7Htcuqbc9stpMzqTJu6LvGZiYNzFRqAh/yp4t4ZdaJJk2DLZMRHOiafEFZsWPv
 XsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771914663; x=1772519463;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mrnibdhDFWWXaZ2Mcr559Vtnd7wiGbsUwg3q2/yPUkA=;
 b=OaiFfX9eDKVePEc1MM1Xir+4R2isOowC9iHAvzm9HcxjYsa9USyr3s/SZTj/1lyYrp
 d7EUtqTXY3p4aA3oT7QZJS88J0HxZu8aNrG1v3PmFzD3iIB5Hw3mYpUyZ12tm6YaYjHZ
 XoAo1oayBEPhIYqn+kQW8PLjFwwlgdXu1jwpiiAyZQDQJXdfHSTabtrT/vc+Eade/1v4
 bF6XBBDlEZyi6CNrEvQgawHqY1pxIzIKwb0pGrYhXgg53TIsucK4Bdg0h4ztnlUcD2iv
 2rZbv0Co/d3U2aaqf//PvHYR29cQIjrHZtfpJXOJKBMbNQDHHIDXe1HDq5CQX7NPO22+
 EYig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk+P0b6jsS/0KxjfG5iCAxVw4ujmFc3n0gAYnOd8dYbnqMqFw9jYkBZUwQkg265P9vdTKu3C5KkbI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu2LU5rByZXvQPR0LHJho96QbY6FgjeQCL0F/aRHUeshfr2L6v
 eGCQ/Rz79U12ppTC6JSR3/w+b4G7wKgVGQ3Tr/GdvhEDLCuvYCFRkpx0BOS+YkueCqs5OOK/QrK
 +pBOqwiIr+TejDZFTNyB7PXEhVQniD8Tnw9yM1FIoX81bzTp3v24Ln/fLfTobrtPGzsFChUc=
X-Gm-Gg: AZuq6aKoBHvOIVJymdPgb5dbfcJuFOVwU/srCBahYYq7uATKmkxctfbH1i5brJtYI6x
 oAeghf3/VGpvGoJPq+bXwoiBlp3WCUYisCzSQ/xRCl8P52+aynhQG8ehuxm7PlFCe3i8wEUpnGT
 NmWohsCB6GVXlosk5tOR7gP6Fi1TWRx29KTMELZyzwrE8XcuB2flyoZkWhBeyvsdRvsPlXGfZbj
 /nzHrG1vamCqZl82QW8Ix8/QvQeJjM/sfWgcmOWUPIpIzQ3bATUAa5W8MaMpFfVdQZCpwxM4QK5
 DiN555cyBEUskIEC1dtY4/ozrWy2bhby/7ox6EC4hd6a1OEFa3nsWKxC8UdusUFngog0xvSbPdX
 FYhWp9JJyVdwPrHCnVtkLGZfZVZUQgV5ZyRz3j6Cag0akmO2mwDVz/EieOECoLsa3YjIhEKh+9p
 Vf7Eh14jGMSccL8As/hlgeROjzk7YsFLSb4VI=
X-Received: by 2002:a05:620a:1a13:b0:8c6:b05b:1f33 with SMTP id
 af79cd13be357-8cb7be3b53bmr2085233285a.9.1771914662660; 
 Mon, 23 Feb 2026 22:31:02 -0800 (PST)
X-Received: by 2002:a05:620a:1a13:b0:8c6:b05b:1f33 with SMTP id
 af79cd13be357-8cb7be3b53bmr2085229485a.9.1771914661995; 
 Mon, 23 Feb 2026 22:31:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb498cfsm1989020e87.78.2026.02.23.22.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 22:30:59 -0800 (PST)
Date: Tue, 24 Feb 2026 08:30:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
 srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Message-ID: <lqt5k6w3peqlgvgeagp2v3yqtvqpaihsbkvu2hwfzel4j2whnh@qafj2mnrt2dq>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
 <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
 <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
 <CAO9ioeUSJQC685K47qMBn51r7APReO9T+h_K3bZ_94Uwn1unBg@mail.gmail.com>
 <48778fa8-b485-4c79-be1a-c70836f65f0b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48778fa8-b485-4c79-be1a-c70836f65f0b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699d45a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=60J4MCMU89GRG9oapK0A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA1NCBTYWx0ZWRfXzfYzS2VC+bSo
 tTnNU5laPyvH9VQlp/iHacnCjc2R8b53E5fXvZ97+pHoHU6PrIWEqbLxJKyAwscC57khCPQTG3z
 LM+2SuDYVHg1PwTuIefIkv8gTdNpmr5uG3DhKwBM+XQKGXAdnFtxPbvDQ8FFFXXQ/F8FBhGVgA+
 IZVSRtPY7jdidQ1FMflTBk6KZuhlLHl6gCRX7SJhW3Jt2GcRi7/5BuVKAzXT6g5xbc41iXRFKx1
 tQ/ynVyCOddLKtorCoI4GnJaR6Pu4Zk3NNI4s0ARN8uezndpGqWzuPIrmxo9ySu5Ktj0YLgyUZ1
 eKAuSkDEgIbl5NowZwUEJd2+55GTabHUWkyFL6x/Ciw9R8vMlkLNq5RPlq+TZ+HL++hMcv4v3gR
 laV5M70CwUf71g8EK83f2UBuvDri/rq7P25H6WQA0BdeephV2Vf2hLbqXZVg16dmTA6I2a082J7
 I+gYJ9LBFzECkeeRcmA==
X-Proofpoint-ORIG-GUID: Q4vm31Pwv1ed7v4G6tWjUD9q9zhZxd6G
X-Proofpoint-GUID: Q4vm31Pwv1ed7v4G6tWjUD9q9zhZxd6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240054
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sibi.sankar@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 87EC01826DF
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 11:48:00AM +0530, Sibi Sankar wrote:
> 
> On 2/23/2026 10:44 PM, Dmitry Baryshkov wrote:
> > On Mon, 23 Feb 2026 at 11:09, Sibi Sankar <sibi.sankar@oss.qualcomm.com> wrote:
> > > 
> > > On 2/3/2026 6:09 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
> > > > > On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
> > > > > > On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
> > > > > > > On 1/29/26 1:13 AM, Sibi Sankar wrote:
> > > > > > > > Enable ADSP and CDSP on Glymur CRD board.
> > > > > > > > 
> > > > > > > > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > > > > > > > ---
> > > > > > > >    arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
> > > > > > > >    1 file changed, 14 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > > > > > > index 0899214465ac..0eed4faa8b07 100644
> > > > > > > > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > > > > > > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > > > > > > @@ -487,6 +487,20 @@ &pon_resin {
> > > > > > > >            status = "okay";
> > > > > > > >    };
> > > > > > > > 
> > > > > > > > +&remoteproc_adsp {
> > > > > > > > + firmware-name = "qcom/glymur/adsp.mbn",
> > > > > > > > +                 "qcom/glymur/adsp_dtb.mbn";
> > > > > > > > +
> > > > > > > > + status = "okay";
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&remoteproc_cdsp {
> > > > > > > > + firmware-name = "qcom/glymur/cdsp.mbn",
> > > > > > > > +                 "qcom/glymur/cdsp_dtb.mbn";
> > > > > > > > +
> > > > > > > > + status = "okay";
> > > > > > > > +};
> > > > > > > Please make sure it gets to L-F (only Kaanapali is there right now)
> > > > > > > 
> > > > > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > > Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
> > > > > > but the firmware in linux-firmware is (now) targeting IoT devices,
> > > > > > should we use WoA-like names for firmware on Glymur CRD instead
> > > > > > (qcadsp-something.mbn). It would match what was done for the SC8280XP
> > > > > > CRD.
> > > > > I think it's simply time to stop pretending the firmware is generic
> > > > > (some fw simply isn't and some fw may come from different/incompatible
> > > > > branchpoints) and include a board name in the path
> > > > Well... CDSP is usually generic, except for WP vs non-WP.
> > > Hey Dmitry/Konrad,
> > > 
> > > Thanks for taking time to review the series :)
> > > 
> > > The ADSP/CDSP firmware that got upstreamed to linux-firmware got their
> > > functionality tested on Glymur WP CRD devices.  Given that the firmware
> > > has already landed, can I continue to use the same name as the patch and
> > > have a different name for other boards if something specific has to be
> > > pushed
> > > for IOT?
> > Thank you for a prompt reaction, it took just 20 days. During that
> > time we could have fixed WP firmware filenames, but... linux-firmware
> 
> Hey Dmitry,
> 
> I'm really sorry that this happened this way :( but I was out
> on vacation the past three weeks getting married. A quick
> review comment on the firmware pull request for naming
> change request would also sufficed in the interim. Also to address
> some of your concerns there aren't any plans to push an iot
> specific ADSP/CDSP firmware for Glymur reference devices.

There are no plans to push or there are no plans to have it?

> Also, this series already warrants a re-post so I can still
> accommodate your naming requests with corresponding
> updates to linux-firmware.

Yes, but the linux-firmware has been released with these file names, so
you can't just change them. You will have to provide
backwards-compatibility links, which defeats the purpose.

> 
> -Sibi
> 
> > got released just two days ago, so we can't fix that anymore. Now we
> > don't have any other option than to use a non-standard name for IoT
> > firmware when it comes later.
> > 
> > > -Sibi
> > > 
> > 

-- 
With best wishes
Dmitry
