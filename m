Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O2vOfFYlGkXDAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:02:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A9B14BB9D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB16210E230;
	Tue, 17 Feb 2026 12:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUPYeLHH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c5FwMifD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A4610E230
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 12:02:53 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HBgmso945797
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 12:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bGm8YJF4G7QYW/qaOMM2c8kP
 NYdqClawZJbczBsbutQ=; b=VUPYeLHHodmnO2Q94yDbR2HtKNHWLFoB0NS+M8S+
 xibBsrEe+RcZIv6wL+LVdqD8iVxRUdUF7mUdewT+EYw7Ruv75ieaVUArCEKdrGzY
 T1k5X9dtJ5hXJgt/82YWaT0Ll09Na3BIDX5DiKWmrRQciyrznTruuyJBL6svacbA
 6OaeJyfgnQERYTSIAWvkUeAU1h6wJRx6FpTdnv0+Wc1Xt2+qgfafad9s8DqE7u1m
 g26CVmTN3N69RejXypCIzayI/ALz9FmAwQRKNlNDybpM2qabcTTfadVmb5153B6j
 e+5AthgUFRJXTeLnKkXknzGoo1FKlXSoRNag06IemHFuQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca361q4n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 12:02:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb52a9c0eeso3372966085a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 04:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771329772; x=1771934572;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bGm8YJF4G7QYW/qaOMM2c8kPNYdqClawZJbczBsbutQ=;
 b=c5FwMifDcPBXB7nBmF5Tt7qrWbxxmYMSVieLO73RoWUftX0ePgpN3yQodekKStcrqD
 iZDz6OqoJY8x/BPs5tJrTSidzwh6WpOrLqp9Ag1vaZlCrNHA3LVjgbDMgwl4hD6J+K44
 IcCFOtCWLXJZ0EKMHEV58nneOdJX2N7fOXu9TA2FJhatznVA1dRoKizo4zOau31iVgJ4
 eFQg5DrKjGmAKYKsZL/YyVphNPGcP8nZHpmm2sBuBI3rfHOuc3T8NbTUsbxIedIFJAab
 F1xA/5sDY7JbDotmsNr5eAXY1tdT68QG5Fvw9iwSLcU6gtb6MkRVSTR2kXCz/0ig0Cds
 NcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771329772; x=1771934572;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bGm8YJF4G7QYW/qaOMM2c8kPNYdqClawZJbczBsbutQ=;
 b=Gjln8+k2TDY+WgxJ8uvK0qfYMmZ7GR+xhL0PnwaQtTIqh1GpNTVY1o78Rvce0o1jB8
 tkQuEQ0qC0L7inSaFq11ZgR6VnRTd1UAsoAK92Z+ypl2qTAFaH/FkYhttH6rghd8TyYS
 lDsy23qmp9fr+fFrXhcYEoro0oqBC6jdtqrj16ko2SctwMf0x/S0aRCviLULTx9VLF8q
 9IF13Nx3Uihg2KoZt5MygpM4w+jXkuuKSrW+oYlQcRPMOc1RyN0lqxaiHrWrQ7PY5RTd
 VZgWyurUL5zG1SgItn97tWy2uIsbdqUm2jZoIs8DKD7KpadV4cWULS2qxkHhk1CNK+uc
 SRPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/OMf6V8ju1D9neWguRxra/8x9Xae1eFJLWOsHwmXa2yVLH42w0tMXeFS4py7C84CjWy9WwyC6kzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3v6sPA/JfVYFnLEqAzPKtTTUrdqzyN9bskT74kLlYioTgz4U1
 H7sq2hckbKtrdY6p28iXbsI/pbrgfxz9EqguaGdbayER4w9RYfyqImQKE0tE+Rtq5wOeLKvT4Ig
 nRVnQv3jU5QuUW5++Aik8hKIsEUmj5pFc4uwnLs/9fZWNw6c6vFUCWZo4nkyy3MCzE/aoZps=
X-Gm-Gg: AZuq6aJR0jcZoDZkDXWlmCKFcSv1gMPD/4cC/9yqhbe1PuaLfgjZgIqXg2jvagAUXAB
 Ro3CTNI9xFtbtZFB4j/4QOj849XSE1yXCfbipB6hm3GnPGScVXjBaRJ61GCFFEjJR5OqgX/Y6TU
 ReR2Uppkisn28yTxJ9k1uEQuITU3Lt/xybVdJLfZQXpF77/AhyWlQcHFgX6bujuGcM5pq7fafGS
 BmB94OQYtpeykBXg3eI2lMss/lSWpzunrrw9gdOcGrwcKVtLWD5FX2YyJXH/BlO7zKeb9M6SiTg
 JWlA56l8kYzIDqVTeaKyrZUu8bN0ppFisaiWC7E/GoZsyclzKxEJX7FpreRg5664U0/zVaE1tas
 pTnCIrgAV/zSEAtOneMxiMR5Ay7PIItKUc/w6
X-Received: by 2002:a05:620a:a508:b0:8cb:4d9b:6b4d with SMTP id
 af79cd13be357-8cb4d9b6f20mr1040224185a.10.1771329771899; 
 Tue, 17 Feb 2026 04:02:51 -0800 (PST)
X-Received: by 2002:a05:620a:a508:b0:8cb:4d9b:6b4d with SMTP id
 af79cd13be357-8cb4d9b6f20mr1040219285a.10.1771329771325; 
 Tue, 17 Feb 2026 04:02:51 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5ac92sm33943836f8f.1.2026.02.17.04.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 04:02:50 -0800 (PST)
Date: Tue, 17 Feb 2026 14:02:49 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, mathieu.poirier@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Message-ID: <v3fxfnuvkgxvvqmiejtemytw2uysbbqtdlmsn3yvojkep4jual@n737hvkaa434>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfX8MNtS4Oqj3nd
 HET3sYQOBrL5iKv9DbG+dGBSGcm4zf2Q+JCTFFE1pHUpq+FyGSWiMrQLmujtnri4YxVfiFWB5vL
 VSBh5fyJgfV9HU+gX84bDM5a93ya7nv0u9qC/oaiRtZrfybWAwHh32KuBcS7+T13FfjlCiJiJ1c
 qcbAneRm6mC2Cumyezdfk5UYvuMQNW3pAS6dYLJQ8CZGJUgmMZyCedSxEcBITjoTJOCdq3kod3/
 SYYif7dc/eifZUQhW+wTduk5guSFkHU3JehtUiLNOC18Gml7Km113BR5rCif204Nko4lNavce+i
 bne3BlyEhABOAl4JyGSYpprTKUvEoq6BDjEBGXMNX832j0U+3MZimCXMT1Y2EcaSKeB9OAvE/br
 n2JOV8OS2GsERjngsF8u/lMhlPnMJLAwPuRw0+B0Uei+KJfZVcEivLJ5Db0h2hqoQaI8IKrLnsW
 l4pqzHmhuXRgjUJT4YQ==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=699458ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=IccHdx435YTdWfe-SmwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vKI_038D31pJhUY8oCYww_Ymm_iPYdoC
X-Proofpoint-ORIG-GUID: vKI_038D31pJhUY8oCYww_Ymm_iPYdoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170099
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 57A9B14BB9D
X-Rspamd-Action: no action

On 26-01-29 05:43:58, Sibi Sankar wrote:
> Enable ADSP and CDSP on Glymur CRD board.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
