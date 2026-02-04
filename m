Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDW9Dpa0gmnwYgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 03:53:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFFFE1052
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 03:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F1210E04F;
	Wed,  4 Feb 2026 02:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mooRhu+D";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQMJo4fF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7798F10E04F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 02:53:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 613IlhjG2667102
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Feb 2026 02:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jbKJwXctHqVCMfa4Vxs5ilJA
 ib+vhhyF/HXY/PQ3uuI=; b=mooRhu+D14OvJsm79bSmmVp79mX1c7qvR9Sj3nkJ
 1AMly/KHxk1KiHs1VpY3bOlHTH6PVcnyB4AZbLWqVrO7P4CKOZ/VTBFJmibG6n13
 HLyij4aFZBO3U4QBE+SLfhx171QI0jHYVEfiX3p5M5y2Q0K41Vok4OWpM/Y7MtCP
 43l374TtzUfzeACm7K0SSz3LJcC55dxK0W1xH/W5iLixprX6mYXY+sHxfdBg2AtY
 wUNnWa7RpbwktYb8ZIjhEnx38YvVWkXF4uLwAmbNfXWQLu6i0lEX2NuDdXfsRcLr
 TobNIEtp/yBOKkUSY5IQvBN7pAOg+eeQ4slfqdeDrmZ6mw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3nf61med-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 02:53:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52f07fbd0so2817164985a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 18:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770173585; x=1770778385;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jbKJwXctHqVCMfa4Vxs5ilJAib+vhhyF/HXY/PQ3uuI=;
 b=YQMJo4fF497AROC2fVDHiTFyhmaDY5YOZ6375M042kCTKMqJuB9b/YHxv7LjfmoW16
 CF425GwhkV8eLvmPdYAoJFLoz/vAlwiA5YTx4Y7AGxDTYUfESFUU+jtYHiuEXRpcHzSK
 7qyj2MNlvoCMkUjAPDIawn3I1rXJhIBCVtdVJMSR1BMrriVj7X5BuRpq9GluVSQU5zky
 hGP1vNIZ3znM1UxJ7HGJT3eEMN7aCOdb/ACm1NptyI+chN4Ot5aIoiHwsqNED6rZQWy/
 VSmNKezqTsLFzVy85V4W+GvBpLSQTLCuDZ8U1eJV2AIjVWUtjpoLi/fw4WWEMOtN6UlP
 Tq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770173585; x=1770778385;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbKJwXctHqVCMfa4Vxs5ilJAib+vhhyF/HXY/PQ3uuI=;
 b=Ds9Db6xjc4rtGbavBnakLvRl6B5PzwwaUMMV3hAeRnrcBxAYeULbdVJniFU80WIcrh
 KeWWTXCYzRMwBSG0+OJ0seuyfPu0qoS8arNOlQAqzoa6HBRAUy7o1ASQ2syg4UgYuQqc
 STbsqb3Jn7+GtrC5qq6+XH5iltmlDXFJEUTNOBjKONQsLtYRTMWSd9KE6PAvbgVeOI3Y
 X5itT5jvjIADJttWGzNwBXe2goW53j99gQ5rP/YjnYIUinQQl9BLGN8gb2nMEwQQ/Vqp
 LCU5T4m6Q2XNiOsH9yNVL9bSLPf1CfKdD3kNtKobyLdGLu+HCg3uIrmHHZs3qLJUxOs5
 fjNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdf+8lFiQm9IW7T+opQR07Z6WoH3cpXaaJf4D0Yx73gZLi6MFHZQ/N5LyyLVT8WVT9FfnfSjkrz0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPHX7p3MMZZ+gmrcr/qfzg6j3GqlR/a7pVhuLTmyf51wY/K/mK
 BQpL1bfBcZqAtcFzwLFAY0tuKWd4lwLd+rD74jmtHW9vJF/z0g5pa7F3XwvVhO4d5uZvwJeMyP5
 jQT8RlIAyE4emxGb3HrtY2fffTC+AbSuGBF/6NRv0h+dBePAiIGaOroGPdKeMDYf5WNNzXeplMm
 g65fo=
X-Gm-Gg: AZuq6aJ5XKqKRK+XU/0TSitNhdq3FoFSbZpZRb9Q8Pu21g22YaSyMHdrCb/+b7CLxMq
 pvEMk2EFBJvCLQ3qqh3lTjtWq8lZBG9OPBY6oTQj4TMI+Qv2IaCJbgZdPsRhHS4J5RGcugJCDwS
 cDTma3Ff4AUw9EuWiSZfxi8NBCtNH8hwBdVPRM1asuUTzS9D8seMt3QSwUcDC9MNQh2ut8zDibl
 nlZDa4ImIF0eTjhbUgOvUwyQ22vToYvyXAUBrF9oA7V3tpOXSYgh4pqJsQatDwxxFfIzO1YA86+
 ybk1L6/D4WaL4e2I2gSIWy0xUDP1JQ7mQvpsHh+6CU9eBJ9V8HxZf3g5R7tKA9Q9I1XW2ImO71y
 a1CWUiMrSSkmqvxGlu8PFA8eY8uhe0LXWDJcPwQMwIfUGvTe+HnBv/boIQxzWCE0PoVulcOjCt/
 8Ja+YvQLd+x1m0G/ULXLoOJDs=
X-Received: by 2002:a05:620a:290c:b0:8c6:e07f:a050 with SMTP id
 af79cd13be357-8ca2f9dc5b9mr228962385a.75.1770173584680; 
 Tue, 03 Feb 2026 18:53:04 -0800 (PST)
X-Received: by 2002:a05:620a:290c:b0:8c6:e07f:a050 with SMTP id
 af79cd13be357-8ca2f9dc5b9mr228960585a.75.1770173584096; 
 Tue, 03 Feb 2026 18:53:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38691f9eaf0sm2357331fa.19.2026.02.03.18.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 18:53:02 -0800 (PST)
Date: Wed, 4 Feb 2026 04:52:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Expand context ID mask for DSP
 polling mode support
Message-ID: <mfhksjaoyazrbbkdjamn4zvg244mvehburtl4qz7gybjgnp6y6@jicyk73fn46j>
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
 <20251230062831.1195116-4-ekansh.gupta@oss.qualcomm.com>
 <xrudy7p267tuu6q5qrndw35677noevqq23zooxmsacxlswzpub@2cqtvc6e3aw4>
 <37e2876f-6998-4e79-8696-c7f97307a28f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37e2876f-6998-4e79-8696-c7f97307a28f@oss.qualcomm.com>
X-Proofpoint-GUID: nLd5kRn97hZAoPs8uwF9Bkmag1M7OSsn
X-Proofpoint-ORIG-GUID: nLd5kRn97hZAoPs8uwF9Bkmag1M7OSsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxOCBTYWx0ZWRfXwiHUCkPEnC7k
 qOyd4VtSG8NFs8WGSSMO1WaV4ON/TqY7DI4qD+ZLIYv3EiCinoAAht8h3Vxqd4a3MCElH4uz7nU
 I+TwpqWPCWDQd7FB7S4NgLEeyNSBK1RBLosqvvYTxxdNFQhYtpVmSKJbRoFDAU7VJlVtiIW2hFv
 voazTFEQY9rbdB94Z4/8y851uz2yXtVN8pi3GHfcXpiGIfemliAeHf0JMtoCn1zz2RhmqD2MQAd
 vrQYwA8nfxpDbLBMK0fZjpwRGKEus6KVisvrq3yQmyx4deUdBvXm3GvENN9+y54j14aQgIR3lNV
 kmxHLmgLaP5bryntD7w+NfYak7T/OEV4w+7YX3rvHgKE0hoE5hn0DpJpI6htjFkyJCI3mpbKt7Y
 jaNJwcBC8VmmClK5WPOAtIF0h2y2luYegBTf5QLNcb+2vOOsaAyjgajrwCupFKyKjdhEb35Z7sz
 jv/AXtnUEiWeHvHaz5A==
X-Authority-Analysis: v=2.4 cv=doTWylg4 c=1 sm=1 tr=0 ts=6982b491 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8iDC8G_LTYsPp_hLZygA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040018
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 9AFFFE1052
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 03:56:55PM +0530, Ekansh Gupta wrote:
> 
> 
> On 1/6/2026 8:23 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 30, 2025 at 11:58:30AM +0530, Ekansh Gupta wrote:
> >> Current FastRPC context uses a 12-bit mask:
> >>   [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)
> > Is it Linux-only representation or is it also used by the DSP? Will it
> > work with MSM8916?
> Apologies for the delay in response, had to go back to check on older DSP software.
> 
> DSP will also use this but it handled properly across platforms. DSP get PD details from PD bits
> and mask it to use further for async call checks. Other than async call check, the context ID is
> majorly used for book-keeping on DSP side(no functional utility).
> 
> So, it should also work on MSM8916,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> >
> >> This works for normal calls but fails for DSP polling mode.
> >> Polling mode expects a 16-bit layout:
> >>   [15:8] = context ID (8 bits)
> >>   [7:5]  = reserved
> >>   [4]    = async mode bit
> >>   [3:0]  = PD type (4 bits)
> >>
> >> If async bit (bit 4) is set, DSP disables polling. With current
> >> mask, odd IDs can set this bit, causing DSP to skip poll updates.
> >>
> >> Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
> >> byte and lower byte is left for DSP flags and PD type.
> >>
> >> Reserved bits remain unused. This change is compatible with
> >> polling mode and does not break non-polling behavior.
> >>
> >> Bit layout:
> >>   [15:8] = CCCCCCCC (context ID)
> >>   [7:5]  = xxx (reserved)
> >>   [4]    = A (async mode)
> >>   [3:0]  = PPPP (PD type)
> >>
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> 

-- 
With best wishes
Dmitry
