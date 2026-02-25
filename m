Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFPSIQbinmmCXgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:50:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD950196E21
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8DD10E745;
	Wed, 25 Feb 2026 11:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z99Nak8T";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JEjp1p7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B1910E745
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:50:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9RuqL3056472
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V+78rA94PT3W1jpfuknZR2JGZiaj4yrwUHLE5tMG7LQ=; b=Z99Nak8TCWNDcsji
 goA7LEpe7euQ7GnuEvcIuTeJ4EOWrR970/i5hcNnownrBrCthQjNwdVwQP2wXGl9
 iGCD2SeIerez+63ukE7/OPC/Ij7BPVpZWUAdgUOd+wR/0FXb4vv9e51WcXWucNBH
 JfZh1TKz7BhcWlIGDwrfqa71AfgzR0TmYjVtkWOoAQf6BusJk7+ydL40Qa4PvOup
 YJm98U7KJ+7rBpI0iuL2wnOqQKvrItMNm7i1+c5zCzVrt69TFGigr4AZH+d876Md
 oDEEHkPaqv75i2kDeyjd0ap7vLbN1+wNK0wOlb3AlkEeMmGhvauscHOOiFMATQNW
 khtPDg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39ggmr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:50:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c7177d4ab4so607541485a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 03:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772020225; x=1772625025;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V+78rA94PT3W1jpfuknZR2JGZiaj4yrwUHLE5tMG7LQ=;
 b=JEjp1p7MFiDydoNs76a/qlDMwVeE+GrhnhanY/d/tJHQWKPwSG2SZnfr3VZFaHwcW8
 dr4xNHK38BwbvjLd3h/tmXfK0ZgASzxanAjKW1pLj8+VX5pNMVXc3HRqtRjQWDsRBT+e
 Brz5/5iawcORwhTgwAlXfopaT699a4CM2AQzAStBQtQsndSXzzISEqKB8yeWhqoJ3hgu
 I/SIt3BQQ1rRYTVQ5RpRL5QX8mNwXqfevAv/3XBtXynxa/ZJpqO6d+sB46WA5idl2MVu
 IsJtawtpEBlH9ndZcpEMzXO72O7rB9YHpSvuXLPdpYxKCFIlIwZic3mec7lMDUgIRB0N
 6CVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772020225; x=1772625025;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V+78rA94PT3W1jpfuknZR2JGZiaj4yrwUHLE5tMG7LQ=;
 b=PKqnGjtUrP+mkGlTpJDTigIK3ydJW3H0gRFaPPB8vxP6Y4zEFcG+ga4E0FbchWsKG5
 UOyPnPQX43dbDfgN+prEawDN8g6KrTrtytnFqXHYSpnxBBNISje540HlENwTio4nloJw
 W9vcc2VnDAea5NcxFNb64yNtJlOQTN5VNayesuhVHdHANuq9n/x0L3JnlsiTQFMdUjzZ
 d9XGIt8A8BXeM43b1GiEFN4E33W+QolZB9aGbxdSTxXuPbd/dgSeCuWJm7+BjjnHYvJq
 +sg0go5uA2leaLt2DSaLS9aHtmWFs2VnCFwQGm5v84JVxXzscsmbjx5nVSvh9wKDNRM0
 BxHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXanFWo4MwB/fH6pwqdYoDlO2KykfRBCNfs3g106e9BCNdiSQui80shgG0aggArigoJz7s963FUESk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfBajRZjZSmI7dJDvHcnvDlQ7ynl0KORlPCt7rgCb6DOW82Yd9
 3LUod/A1/blyoyX4s/RUhJ/ogRXB5L2RY7CIjKolrgL1hR0B1agn/0OO884PlWrD+bCg5r2yGRt
 hg/0YbHiRX/Ntd2uBsRuOyk5u7MtFhPNRp3juv/aXWZIuzG36sNQa0bQqvN3LeHj6AcFJ6QQ=
X-Gm-Gg: ATEYQzyUGiPDYurkodx93crRd3MZdIcgdUzt8x6E+H59kaSSRfBKarFf3Tbi9/k6aCz
 ca9FF0m6fk94UzmRyrw6I1iVPAWAKS8wxKsVdOZwHLnucAKJxkFdmf0RpHYeMcxFel0AWhfk3AK
 wunFb1bx0XiRXcgZCJEO1OioV2z/c5F9HXdy7hgqmHESO08r70+mmnW3FOtrPGZLwVvn7hu3Go+
 yEHjS9w1a9fjRH/uA62OQmiZAS/M/KO/0udjLwLCg0NuTccSIT9Aw8WqOeK6owggTNtxOCRwMKO
 7+4/7tt87I4h1grjYGi2NTNbhQ/VMUJyRwM8VBULwv1gqeOJ/ddh1RaGrVHvIkeElR9c/3EucwP
 ZpvkpRrWGYMfU/f2u9YddQL8n/ltcJ9bU78gl5zLrFRIvz8aO+HmzbAMnLAbozlpToa7NVXcNRM
 o5OGQ=
X-Received: by 2002:a05:620a:198a:b0:8be:6733:92b1 with SMTP id
 af79cd13be357-8cb8c94f65dmr1557770985a.0.1772020224971; 
 Wed, 25 Feb 2026 03:50:24 -0800 (PST)
X-Received: by 2002:a05:620a:198a:b0:8be:6733:92b1 with SMTP id
 af79cd13be357-8cb8c94f65dmr1557767785a.0.1772020224482; 
 Wed, 25 Feb 2026 03:50:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65eab9a08edsm4194196a12.5.2026.02.25.03.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 03:50:23 -0800 (PST)
Message-ID: <872fddf3-959a-4fd4-8f93-cafdf8414ef7@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add support for the Samsung S6E8FCO display panel
To: Yedaya Katsman <yedaya.ka@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Kamil_Go=C5=82da?=
 <kamil.golda@protonmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExNiBTYWx0ZWRfX+aXnINzn2BdR
 Hn/mJyY4paeqfaLTZsqiu1U6S5kbvkmIEmSxFbRualNYHGQEOgHbNXGoTlQOOfMS1XG+luDdhik
 tbZbHkNHaWIh2aIa3TJGxJuIIRovwXLu/Jup3aOS1RsN4ZNHrL94x2Tt/JmOFhnkJp5VkXZu9an
 f4xMBJfWooySrSz26+R3nyjGyihFiItmmE4iLXz3lfA6XI++Jo2+YH7wJ/5+EybnPYzMpEXpfko
 i3YdIuCnJMpuiqehyF98SrUWPz0qpUq1au15g/Mjd6k2M/WbcScl5dbgK+e3t5sfZ+0xWgy3i7K
 JzEbS8TdIx3whSZ9HDqDEJpcjA3Gm6BPukY6B5BkDjrrkU+TpQ9OU5NFUo0VysC/LxxJdM5bSe0
 CYLKJn7yqWs9tGnquPtf/0maaCdw415Y/5HOG7/TesgZGNwV9aHQSHlTOpLlq43/pspGVsmsupT
 IATHWO18+27sshH1q7A==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699ee202 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=Gbw9aFdXAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=y4KI_ShnAeI64LbocBgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: kxXwLtsW5F2UJIaaeiOsM2JdAIywYLJd
X-Proofpoint-ORIG-GUID: kxXwLtsW5F2UJIaaeiOsM2JdAIywYLJd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250116
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
	FORGED_RECIPIENTS(0.00)[m:yedaya.ka@gmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:yedayaka@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CD950196E21
X-Rspamd-Action: no action

On 2/23/26 9:26 PM, Yedaya Katsman wrote:
> This adds a driver to support the Samsung S6E8FCO display panel found in Xiaomi
> Mi A3 (xiaomi-laurel). The driver is generated using
> linux-mdss-dsi-panel-driver-generator[0].
> 
> The mdss reset dependency makes the screen work more reliably.
> 
> [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> 
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
> Changes in v2:
> - Changed commit title like Dmitry asked

You got more comments for patch 3 from Dmitry

https://lore.kernel.org/linux-arm-msm/dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme/

Konrad
