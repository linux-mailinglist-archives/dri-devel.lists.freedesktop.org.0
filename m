Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFdYFT01lGlpAgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:30:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14DC14A68C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9673B10E4B0;
	Tue, 17 Feb 2026 09:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="giunyFuu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpccjwhI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB2C10E4B0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:30:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61H6UjLQ3394972
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8W5VnLVQTMNajqo922h3PHI78p/CB9uzSUImNB9R/sY=; b=giunyFuukUa0Px9M
 OxTTEb0mAtF94EjoNo9OeYfwRu/ECbR2p7ruD3HLy5vNL6JLa5F5poldOzCeM6Mj
 cxQ8ie8Z1a4M2wC5xGkkergKDm0eOFm5JO/LsDO2LMy3PoLIot671xPeNc442YY5
 jziPUIsWJDBKWfrCQrF92UwNKJFvIuUDEsb74MvjFTP6qyhC71MP/hVPeYJCzhgV
 G/ihEAMLEvYlIGUkK40jEL+r2aKyTAeWu3/LlsDtwK6qPEK5xbxX2Sl9shFpqhob
 v0Y2meW+J5WoEjovbai+ZD6tw9GomvNvftTBcjDj2y2K1oPhKZ3YTshsjsMlZ6KI
 hth+Wg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5kha08v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:30:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb38346fdbso326297685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 01:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771320632; x=1771925432;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8W5VnLVQTMNajqo922h3PHI78p/CB9uzSUImNB9R/sY=;
 b=KpccjwhI7LOAy0kuwaZwGdYEpb9etWaRQoIxGCbvomN08Pur64VNuqlxM8k+xmSlO0
 ir7CiQrvJbl1SeZac58NEjmz0BIBG9l4jmOOd41B4EbkJJ+H7dlPYNhT8cVnM03lv1dA
 dIT2U8CnMbqBgNHJNWXMVN8iMf55qc9QqGFWD9ywn8yuPkjJO/gi/y323NOLl2odhzab
 PC7TEC7XjcDmenikmC4JKtj0d2gzmo0ODn4Yf9/LUDlZTbvS3Qp/6fmWNJcnYrcCVEK7
 EHto/NIRBBHgi9fkOhEaA4DYz2h9vZTNLk6e6nFf51szOGzSoGeNTOk7ZxmXnbqR1K2x
 VUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771320632; x=1771925432;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8W5VnLVQTMNajqo922h3PHI78p/CB9uzSUImNB9R/sY=;
 b=QWghKGruceK5CnoPTzRejILo2wIB7H2Tf1BtPQkCvfCc0zDjtj9Qk2N46RiU2QWbtq
 2gM/dR3d+s1663CdoRdy4xI2O+GsKpZkODtYZDBgpmszksHnel4GXthn2j+YCKXp1lhE
 wABzQ2n8BLpCNSWHNxwSl4uBKSeZzcNQYU5WevPAp58HFHDKURJfXzx+0eRXJJT0EoVY
 PccIw3m2pwqlU9jzr5lkrkrmSb5XgbNRXWXOYhoz524/G1lAkgMG8GQgRX3vyIIbTinm
 nT7gxbb/2M2F4048Y1ToDYG3xYRiIgWBWFUp3XXjAC26UeRY9tR9HdB7aNP3feXZpZUS
 LH1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkFHs+rwxJj1tepAyMvqpjqZUPF5iqA9z82P1WV5a98YP6HxG8icwQrVUmTE5cq2NwDGAiROz9kPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX6PyHsLYVwVA6LTr9wnfHDu8eLwjmi/4oM7oVbrxF/CtBcM5Q
 /1UiDOK5JmNFB1Lkwoo0vVZo45GP67G3OCvHZ4FNqo6zDvhSFkbPyjpyhI713qR+UYdbMSsuvTx
 /V4CRL+MNkc1aL9N8O0bM2mtY1NwI8MT9UZiw7pIcKhi6AdwV+GBfQT4DMomU0JVYMy+mqwg=
X-Gm-Gg: AZuq6aIEkZQ2qBr/1A3BtYsQnyesw5Rki//MO/d5o1HoWOOlXEwherIcW61utbealur
 s3NIS7v0r3fpwSWQEsVrC2Ba3FISP2tEkbdEJNOj35Vc/5eEBhX+8hj5RSl5tnf4LVXs6CyHBA3
 wYzEBYpTiLvWnjzwQS34jT6X2Od+npZ+bAGI1HkPEtn2PnQXTtKPW/pF53bBC6p3glBnh/PKv66
 T52TibFhnGMab1U7lu19CqvF+4u2WLUGn8cefKOsH74ZrACEh0Jjgqj5v8EpsQ4biTIS9Lp+PB8
 AfSqLGMtDH8GA2d+KMUZ6fSbm3eRlLugxjcLdt6qlhDHFxkHZ0mvQd9MRKweHJ4qcporJYPvr8L
 TO/VqZGR/DBp39HHO+WSTKUhy+QdXdxP/ASyTgGXObW5saJT2scQJc+4kuLdYVSaG1WjofCpEMN
 3HZ0U=
X-Received: by 2002:a05:620a:28d6:b0:8c9:ec71:b224 with SMTP id
 af79cd13be357-8cb4074ecafmr1335129585a.0.1771320631847; 
 Tue, 17 Feb 2026 01:30:31 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8c9:ec71:b224 with SMTP id
 af79cd13be357-8cb4074ecafmr1335126685a.0.1771320631478; 
 Tue, 17 Feb 2026 01:30:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad3e3ae4sm2310747a12.21.2026.02.17.01.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 01:30:29 -0800 (PST)
Message-ID: <2effa1a1-1ee1-418f-9194-748440d4b94f@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sdm670-google-sargo: add
 touchscreen and display labels
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science
References: <20260217000854.131242-1-mailingradian@gmail.com>
 <20260217000854.131242-5-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217000854.131242-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69943538 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vp-gwG22Q1kQfukJ7XUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: S1w6MPEosslyS-J80rFABR6d_oaH1Vgq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OCBTYWx0ZWRfX8zsblCPsYSO1
 buH03j+OXkxmtgzbOdUl9lwULXbWZXSnLZk4/F/Ssu+R4ObUtk1iLdDqOrINmE1jYyh7LKxLFwN
 RnBNk3IATySHrHz/hoSvuSLBfShoBf7S/GKZNuk5AiNbAO2PyWIa3XdtCDOWr9Zd4W3hBAjDaPV
 7fh4l9nKpXbMtytmws3AcAIoZMzP8EYNH407JstXbnyK4TlyKXrRpqvnMqyFFUljQGgp/rLQyJA
 FjFJ9goAcpWBcFrqqztF1D0l0TSkPV93DkGqEQEuekaVbh3s1vyL/2yrd86o1Rn+vOdvtVgHGtO
 vleT9pPzZb3bTdonO1QR/60CFLA2pFVgrn2F9RClhXf8Vbj4TtnQnCqh9vTvp3A3jlGkBJlsDQc
 Il0PxNyCoA4CWRHHnn9RSLjupha1YrFrbqOnBxVl0f8r1o1QMaSnLnZ6QWMRENmyK9hJjK3vytp
 iwjICAErF4V3OCP+zaw==
X-Proofpoint-ORIG-GUID: S1w6MPEosslyS-J80rFABR6d_oaH1Vgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170078
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
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: B14DC14A68C
X-Rspamd-Action: no action

On 2/17/26 1:08 AM, Richard Acayan wrote:
> The touchscreen and framebuffer can have different resolutions on the
> Pixel 3a and 3a XL. Label them so the resolutions can be modified, in
> anticipation of the addition of the Pixel 3a XL.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

could be squashed with e.g. patch 3, but potayto/potahto

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
