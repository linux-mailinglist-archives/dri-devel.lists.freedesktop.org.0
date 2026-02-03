Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIq3NUBXgmmISgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 21:14:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F13DDE677
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 21:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058FC10E5AB;
	Tue,  3 Feb 2026 20:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S642t2iU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkbSHTt2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C6E10E587
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 20:14:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 613IlpaB2613693
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Feb 2026 20:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CtW+VYHRGzBX6OvEGMQr1befivCX9DAV1/zlI/ei+2c=; b=S642t2iUR5AEQuUl
 A9Wmq7DQIIixJkvaZOFqUe5Q9d1+7m2lb5eH8yJDOl4mLigYGuBRzP6zkhC8XqRY
 QmrvzlnTKGfqi/KBx4xhIfZKVp++naan53+qMz1CvdqSxc/Ew0FzePd0i98vASuu
 YqIF2U+JUmFGq0o9jz2v+Glr1tbC1Q5maGsi7J6ae1DqBLLIoiMVHJWg9dVq4yAZ
 rQUyQ556ofF8ridKdQwWLmYMUy1N+0dLUGhbSVeArisfoQcI3eTiSO8uBtDKt15P
 wes0p97ppVDPknIyLP0fBWBdwiPwdT70xhglEbDRE66F3FMMtsnjnQkWPbHrIRJx
 qz7TNg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3h07hk7p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 20:14:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-353049e6047so16436a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 12:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770149690; x=1770754490;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CtW+VYHRGzBX6OvEGMQr1befivCX9DAV1/zlI/ei+2c=;
 b=WkbSHTt2sL+dis2v65cHkzFlnvPSW6GW9DuC5cMI8yG3B4ZzDppl3uQQ9bOIUi6VLT
 CUQI69V4lM/gv6VJqtYUpObPJ8FFfWr8Qsv0PAWhsX1CjoS0//vvTNGRGt/D4w39EHxv
 7CzLljo6f58RCJqLpvfXmIFbGJMHRR4kt9LylIbDIay0NzjE0Xh+c69SRsuxilMWdark
 d4h3KH01yGhc4pZA4CKIphZNNYd0I8hUMC2cNHBjMlZYPbpITuBL369+/bBdhBRCq074
 GrZIrky11Gji4kUB3ujXep1Th4ExBuzBmB0yFmBAQwPtBsjE6BXB/juiGB0AqhPDzBVO
 4o1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770149690; x=1770754490;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CtW+VYHRGzBX6OvEGMQr1befivCX9DAV1/zlI/ei+2c=;
 b=Hkaukmby7soqZGjNS5QLCfLdTKewskWF3GRQBrj7mNS0xlACLZN9PCzc9kTALDn3fg
 7TyY/T64ySqwqXNSPYA3AmpsPdE6GgH/u0lw6SDXgl5j4BeClqKWvftMr8TvDpZro6wA
 1Nv2uVT9U2zxTdKlnaTsN0dCMbn/b8utQGo9J4SawdnXJQUswIhU3PjHMkxsZFbKmMSl
 ajDKCWY0rcVszZEHfZtFwWXM+ZhTTlg9YeXGagu5Ee5IPJrhrGwBb8exZtFsGBR1RGvg
 Jm1xqLo6+5E1ctcxWuVgHLK544gRjtbwrURNAi3zUbzfY5VbdtSi2kjbX2uXk+ro6Zs0
 aZAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVShWrupvTE+RTxMln5iBd2QkU7dgMpZ+fZ3J5WGrY1BbqUPqpcEMdGbM+tw+4UexdV0NNOH57ID1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYZZ4oKZXgxi8r2il94kvcxfJhey19g+QijWdOVA/vGk2IqmnB
 ss74+a5HXtBKXAMVYhLUASVp69mwkCuXBOtnr3L9UBYKS4e+FukNDuhWtiRmDApvKa0n1KJ4cWr
 Hx8zhCCqaRpuj3+eH5pih9Iz8q49get4zA3PM63l6HPFzKNjvbyZF6KUMNGGf8FgLWSIwkTU=
X-Gm-Gg: AZuq6aKpf5g+gYPKoQ3jJ3LQYYfAnuOp0wBhzHltDGeEL9VYyVm+oQ8xuSOjMKTVXHm
 wpjp0Nwt8hV2Lslw9XjCfGzLw2orAXmAJz054HZazFA7naDp4BloFqMLRKIwu18TtqpxbFn2tQ0
 pCtdqJQTBOMOriYpMiKrfGpU7MGYKp8U6oP9bw+uQwECaH9ZzJy1C2B7DQ0QUnf4a6PuqMsR8UK
 OuF2NxpXTpVWMc4aKLcgUbMqx42i182KTWcw9ltt8/6FjPVXA1v8in+Wj6StOremIXMqKQvQlaj
 TMrM0INPegggT4hP9fRx6zTb18ctTXtFtUbXrS5SV7aojLNuIWNuIO3Y0Zk5JBTzrooHEtUofD1
 1m218XngFOLWddXJbNuauf8MeTcy5vK/bEg==
X-Received: by 2002:a17:90b:3b89:b0:352:e3d1:8d69 with SMTP id
 98e67ed59e1d1-354870b1bb5mr334096a91.1.1770149689817; 
 Tue, 03 Feb 2026 12:14:49 -0800 (PST)
X-Received: by 2002:a17:90b:3b89:b0:352:e3d1:8d69 with SMTP id
 98e67ed59e1d1-354870b1bb5mr334077a91.1.1770149689371; 
 Tue, 03 Feb 2026 12:14:49 -0800 (PST)
Received: from [192.168.1.11] ([106.222.231.57])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35487131849sm97904a91.0.2026.02.03.12.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 12:14:48 -0800 (PST)
Message-ID: <86cc659d-f5d9-47b0-8134-6a4b11c99434@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 01:44:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm/gmu: Add SDM670 compatible
To: Richard Acayan <mailingradian@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240806214452.16406-7-mailingradian@gmail.com>
 <20240806214452.16406-8-mailingradian@gmail.com> <aYFJcxOXWpuuC41I@rdacayan>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <aYFJcxOXWpuuC41I@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE2MCBTYWx0ZWRfX18dPlwO8poW+
 LpgtqjJqSvQ7j2q+KQ4uEaEwmjY63U2acRS+/vSBZkLOVweo7aTGqxK7Ei3ieZf0X/ayvW6C0VG
 ZyrVCQY1NexI/U375YzG2aQX1cUfKX+wmkpzQ0P+//Mcx08QlHDhungbFGMnFtIhrZSq5OB5oAM
 uRQEoTRw5262VAybjGDh/x3nKN2S16VMkimGvsVtp7lQUNPd7900yjiQHKsDFdNgrVUuPpvZiCo
 OwxsiXonFdXFe0DBZmHLLinwQ8O0xC2gF1K4UHaJzsJ+2UioFXbIVYBickOMqJWN6kqB6IGhiFX
 /Kuttn6E9+IASBmBYG0O6Uu4+DSUFp91S7SFpHquBV+L5AJstjp26kuByWmyEmKHNlHzRzJ5rd3
 P/xXpGb3FOKABwxX1JlIF3h9nWSEY3Ad8jZcWLGYEeqAP+8U/jLeLA7hNwOZu33IBSsjutGGeCa
 FAqwYxm3NaMvq8WZp9w==
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=6982573a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=TQVzCM6xFy0bRFPZzaP6Sw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=lqJ36Ib93Mf7KDR35b0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KyaThAongee0QrKss1fErP6ty4b99h70
X-Proofpoint-GUID: KyaThAongee0QrKss1fErP6ty4b99h70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030160
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:daniel@ffwll.ch,m:robdclark@gmail.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@linaro.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,quicinc.com,linaro.org,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6F13DDE677
X-Rspamd-Action: no action

On 2/3/2026 6:33 AM, Richard Acayan wrote:
> On Tue, Aug 06, 2024 at 05:44:55PM -0400, Richard Acayan wrote:
>> The Snapdragon 670 has a GMU. Add its compatible.
>>
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Ping, the contents of this patch seem worth including in the bindings
> but I haven't gotten a response to this patch.

This requires a rebase, most likely. Send a new rev?

-Akhil.
