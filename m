Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNbHMNawfWnoTAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 08:35:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C10C116C
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 08:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5DB10E175;
	Sat, 31 Jan 2026 07:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZOY13HI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fbAjglDM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A869510E175
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 07:35:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60V4lfBx4058344
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 07:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SUqzqLvgto+ebNJM8P3jaMfV
 gKVElHQyD3m2HQJHmkE=; b=gZOY13HIhKlknlRFc9Py5Rje7e39U5LQJNlrToYk
 CXPQ7X6R3U7Fz4kGIZA2tOuFK22bmJXk7ebGs7beGLx/iieBEP6KNBYU2SaJiPB8
 OL9peJSU09SDGH52fQf8OVJxjVyk9G6QXKo5GLWyYNqE5iz5kUlmkT/3hUF372u1
 4Cj3/cA2EUUaMJO74sCgRbj+bHXBtlD34i3kurF22P/e1Z11wKV/Arjo3a+FdVkJ
 qmPflA7Vvjx7wR7lBxd1HbOX86tIgNDi22ja+7+7aqvjnD+bok6tpFeevwhy6y4+
 O+oUg+H48hfnfuWv9t9AH2vbE7CbR83HxnH8ylowRpa+9A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1b17rbgu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 07:35:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5ecdded59aaso7346368137.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 23:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769844943; x=1770449743;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SUqzqLvgto+ebNJM8P3jaMfVgKVElHQyD3m2HQJHmkE=;
 b=fbAjglDMGIwjZMFv7eAZs+Zd3tnNHWhI8k8wYHTnMOwhmKn/Yz+RDxeVY9pK3YcSQ0
 Om/9n1Gkzn7MHNNjN0oFrBVR1Q55oB4vVNAJB8nK6Sh+Pogf01tCUlLaOyx13w09MrCz
 c/XYx5BjUHd6f5FUF3m6TmF3u//dBwqZaRfrCV3Kavfbl0qcWHRhSquUKMfLBZRtijS3
 ygmtEiZfLQ4q058f8PXP+ELo1WrH6KQ43Eok+D78vJqGCSLqq9F8eWr73YMKrP20gDZW
 buySoIsco1b2l7EN/w0GQGFaNZVpF4YfC0p714CVBLkQhPQs3WdHpGKSAb7a0Tnk+C+b
 L3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769844943; x=1770449743;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SUqzqLvgto+ebNJM8P3jaMfVgKVElHQyD3m2HQJHmkE=;
 b=mkSVHpUn456v3o8VwUd9Wz8Hmtqf2fAE6I1641svDsT9Pea4bH3L5FzRDujI9uy5yp
 cpMk9qEqPlUKTi8ypiQBmvdJ1MKtWPvcI3wVHz1Hxi4GJ4usN0X+gR/2S4LGeKoEFO45
 xI/uGRUH6eDmOHHD5XvrLHQIyO+kcMLylJPq8JObuLzdlDHqkkdVUtm8pvwGeSnOf1n5
 Vw/jywt+TreOARQUIPB7AwkZ77hC6kK0qdwnd9AjuKjMHoX5vuoLFgQdUueBZGlUe25O
 xrmK3LxYxwMjUE+9cIz9LIpxWIleg16ZrFYOWIea3tIIj+ugvYvIiWqd55/T80KXNh/9
 9KEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWitQw6rks5snnub8/pRHYONJSKZpU+fki0QvZUWME0eLofZwdZaDYPZAVPI48oI8+TjGiOsMR9Ask=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeJacrenisXz70wd9dTLcExZVlJaEpmkZC+nhVuTxS4z9yJlX1
 RFRE8UyS5j6mHfrFbJ5gSr4jEHsbgtdsFnaUtcEXhRViNpUE1lKHkE/RnF93wsRY4jO3Vn7yEkh
 wDFfpnLoYHToFxrFbBVZVkK12o5BQJTJIWKLyvUCLsr9qNouRDWNdkPezR6tJlfIXWf33Ty8=
X-Gm-Gg: AZuq6aL1cfi+MAcQvyqNPDYp1h0axXZhLzJzwqdbNozxUHJSj1GIQ84/8hNV84PxBry
 sH5WnOgMBTRJbLlaP8OP+jmDE1y9Lf8FykPRSoPj0rYU2AkJwDU50+3/j2gkNZY5kYMofPi89L6
 6gVsWnib0mQtRdaVUs65o6dUP8e8hb8W7otkEd/fnVHmSRnkRksbtXyQ2jVDRgTrgLE3AHBmglo
 rTb2n729dz22uUxfmQQtcyn1XYLx/1jgnOuBXieKiqZJoSMRXJR+GzKbuUDWYfUa4uTLdHux+jV
 0yp/O5bTW7tzCfMK6UlA0XDKNFcW/rjgRST/Z67ker3zr0yFiTaXRe6O95YQ/HniSua5vsQXtOh
 7PzdjppAIKwSSpuqx+7X//0gI2Img+V9yD1rpJbAAjbW/wE7AY4cmPwokqWbtggGyjdqKyRNdrS
 ipS1+5GJUR1E87rDKVS+yu4l0=
X-Received: by 2002:a05:6102:d87:b0:5f5:3c96:983f with SMTP id
 ada2fe7eead31-5f8e236d78emr1957073137.1.1769844942968; 
 Fri, 30 Jan 2026 23:35:42 -0800 (PST)
X-Received: by 2002:a05:6102:d87:b0:5f5:3c96:983f with SMTP id
 ada2fe7eead31-5f8e236d78emr1957059137.1.1769844942560; 
 Fri, 30 Jan 2026 23:35:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e074beadcsm2216555e87.95.2026.01.30.23.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 23:35:40 -0800 (PST)
Date: Sat, 31 Jan 2026 09:35:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v8] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <f5p4fdxannhvqmbwj3e45rnoew4vcs5cczlf54honfqpotkxen@4f7hqhexcrin>
References: <20260131065539.2124047-1-xjdeng@buaa.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131065539.2124047-1-xjdeng@buaa.edu.cn>
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=697db0cf cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gt7TBnWFjOhXHAj3EKgA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 90SBOCyNH4YVArbT7S1DvemVJRcgF5Zm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2MiBTYWx0ZWRfXxESA0+wCsxhy
 si+0rHjwXohORdWoiCBElwJh8g7Yp+yKW+Ov6uxzYwN4WeLG7AQAZ99ybxoAofDh/jeSZd/V/C8
 PMkHSTCVN/ETRBLa/LJ/8gG2NRuRN8uXrIHNUt7+KA4nzzZKk/W4Mk1AsqxnnUp6LORSYu6hjVf
 3jRqXqln98d3KouzLgsyX7iYe8lKSD550tEWKI48rECV6X1w1SEEP/JwAIkDEuipWWxZs1He29Y
 TUGgk1DsD/v2GOxQE4+B+wof1jYAWksPXbzuWaKfjArKEPlqQgaq5iEMTTXUMkhm7s2XG7oen6e
 AJv+LOaAzpeKry2E28rwajIVggwsgav4/gOHEHh7th+MpfOpxuoMygevRer1S9rM1m6Twkk2oY6
 zTtjmkmacb/wzgJmqtrJLlVKOqXX/DORFASpgEnIAZojX8/jOM1zdVDDKSUNxCXRR0mqACkXbtN
 7L2NAMbMlljMW25BW8A==
X-Proofpoint-GUID: 90SBOCyNH4YVArbT7S1DvemVJRcgF5Zm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310062
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
	FORGED_RECIPIENTS(0.00)[m:micro6947@gmail.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xjdeng@buaa.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,buaa.edu.cn:email,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 27C10C116C
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 02:55:39PM +0800, Xingjing Deng wrote:
> In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> reserved memory to the configured VMIDs, but its return value was not checked.
> 
> Fail the probe if the SCM call fails to avoid continuing with an
> unexpected/incorrect memory permission configuration.
> 
> This issue was found by an in-house analysis workflow that extracts AST-based
> information and runs static checks, with LLM assistance for triage, and was
> confirmed by manual code review.
> No hardware testing was performed.
> 
> Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
> Cc: stable@vger.kernel.org # 6.11-rc1
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> ---
> v8:
> - Remove the redundant brace.
> - Link to v7: https://lore.kernel.org/linux-arm-msm/20260129233703.407404-1-xjdeng@buaa.edu.cn/
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
