Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHJOJeFoj2lHQwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 19:09:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCE7138D28
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 19:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AA610E83F;
	Fri, 13 Feb 2026 18:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eMwhsuV/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vajhqqf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500FF10E841
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 18:09:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61DBpR0f1756673
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 18:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wnIvEMq2lqqL1ydDe9tV35Bd
 iKQQyNP7fbnknKGOgrM=; b=eMwhsuV/qcvE4VlI8a5VRwbzyGVqQveTej1zXbdc
 OI5/SDujiqxDiRQGbVziwRqwpNLe64WOyoMzFc4fDC8qiMHstugaXsU6eGkh/KVv
 MJh2WWocQMzjljN9UM4aaX2o6qKANVTDyoOJXpYhGPJVv9UY7mQCh4ulGr+oEVA0
 /oPni3VJ9+URIF1OksoTNNXGaA0XyIGNHFvbpWP0zIVPQ0DyV4lOHARZT/FKq8VL
 juLTgqJtFlvBO9RKeZa+REntyPPgghryWZmnjBkF+AdEHTgSHiisRi/IgkwTKZ6M
 r2NwxZuqw3F5r3eALL4g9FRJftBJBHe/JVTyVdK6TcAchg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9mb14nx0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 18:09:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb3b6b37d8so448681985a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 10:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771006172; x=1771610972;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wnIvEMq2lqqL1ydDe9tV35BdiKQQyNP7fbnknKGOgrM=;
 b=Vajhqqf0bvq916awZuNZdm57U8Bx6GuWp5y1radNLqEsoZLLlM/RL2pnmlDrxazZUl
 opvA8Uc5f3dgSx61cX9mvAptn6ssBihJj+repvXuzUgO9aoA8/1kXsRnj1T5jEcYOtc3
 eVKof1FWBwhoVp6J01SfHEOKwj8APQwj9xqln/wkiitqGEbyCzhnI5ZMLpBFzystX1/h
 M+gh/tw6MJe9AgOC0i3aunVtRZRCXlZCcZA7Hai7RPYFtlxyDuUOz0ukhsqkjhSqdMir
 9EaU5xXxDWWV2+bjq+tqATIfSDqHigSWZ5weq1a6+vVp+Zc+BRjVcX7sWJrXnwOMpELP
 6JpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771006172; x=1771610972;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wnIvEMq2lqqL1ydDe9tV35BdiKQQyNP7fbnknKGOgrM=;
 b=h55qR+Mk845q6LyO+9bF1U7O9HNMDeockkDnkeqAq79YZ0U046tWzOzWyuoJ+CyXTh
 fpheQMyifIpUtUws3lxwQ/U/u8C8YSTa5/6qiVR38ePCGbRqfWrvqDgoSxXlL8W/EPHO
 IfZdGgpb0n66KffA2wzRVpIgraKGusA8ZBA5udawfcuIydBLmTWhiSkcjzXNzTkekQ+u
 WMqV6Dijz4TLupKbw+wT5CpNSSWdskwy9ql9k+eRykMF/ZugBzr35rVcifzcbsi+3ICa
 8w035h9vtZTaY/als801m3dpNA33hEbJHo4ybSr1xhAjCHGQmdum3oQ/OUruMvM3VP0J
 KlJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIXqlAmnchuHWIIvGdhRioCaKyTpprHPbCAqS07JXZhDD0CAykXIBCIl7DV28fEcPZQT3J9doFaPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+z/tkcwo7Elmtpl48scKDBGfYFXHZEyK5kn0vAP0hXVTkm/OM
 QcEFBpZSq6kGeyki3rsBlu5qbBfEi3FNwg53oOqiqpODxOxErfPcU0gHtX6Jy0ulzOgz8QjjPlu
 mL+Y1z7EhX5k9Wdc08ubnQZO/YtXx3Kh+1ZVyB31Fk2L/upBvy1uArPAp7fm4nqzFLegjsKs=
X-Gm-Gg: AZuq6aIbu0vO8kxfYvnJEwxRndX8Vc0bNCjQCJSyfFE0/b2vOhjkDWweHsJZCJ9ckzv
 s3XIEjqqM4DsrfIbi9YmdonjKoV/UOCgytDp35eiTzXF8YktfMil0DGC7l4P0yyOdZaeEJzaQlw
 4p1NbcrONyNVOXuBKJq9KMToGIREWzmEx0PDvVqAJirVrCQiCIX3oI9LSpLeUXvC20dzf+ARQ+L
 2wdMTg4f3BnuagOr+P7LZ60jml1Rf260zzqoUj+mDcmxfY1O65qx8qHMgaQtqMYGMwMI144Lpfp
 CyHWtcK+zui9aptXZAXrDVUEWKzdcYcAqjYHmjx5oV6o7QW8EUlGKH+uYRrx7HNa2uBB28hyjVp
 gTwYL8Ur+Jlq1mapBoAnw2uBjkiI5dbGxygBabsiowa1akhU15xCeOFrJixrDqaQZHrL8bse06g
 KPdIdM4xfD2pZqU2fQlvjHgngSxZQFCfwGGS4=
X-Received: by 2002:a05:620a:4629:b0:8c6:e225:2671 with SMTP id
 af79cd13be357-8cb4245fec1mr317255585a.48.1771006171840; 
 Fri, 13 Feb 2026 10:09:31 -0800 (PST)
X-Received: by 2002:a05:620a:4629:b0:8c6:e225:2671 with SMTP id
 af79cd13be357-8cb4245fec1mr317250385a.48.1771006171320; 
 Fri, 13 Feb 2026 10:09:31 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f568742sm1698351e87.27.2026.02.13.10.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 10:09:30 -0800 (PST)
Date: Fri, 13 Feb 2026 20:09:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yifei@zhan.science
Subject: Re: [PATCH 1/6] dt-bindings: arm: qcom: document google,
 bonito-tianma board
Message-ID: <l223eppwztijuzg5plro5pfphlrsy4amouytri5vlzijwwsjio@wdkwscirvood>
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-2-mailingradian@gmail.com>
 <06503bb7-0d82-4407-815f-6f3851069041@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06503bb7-0d82-4407-815f-6f3851069041@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzOSBTYWx0ZWRfXw3GspA+QUmXZ
 v+bVpUOD0ZcP+Pe0sMlnHifUfvlEd1rsVZS/qPTQP6ZJD/9aT60ULcgZEQBQelNDsPOY9GKEuEU
 cFQ6hmQWNtZ46LQ6mHM8sj0xB6n+1wcKeS/IS2T2xch32LetlrtVlwXTHnYC6HUDnF4M7QTycmM
 hLDZx4f6gU47JneRCmVJMXEQ0+EEfhuoL3kwAtDMkVUMkLpWorkaZtD5lNJ1xnxIVM4fDp4zczo
 npX/12QYIb5x4YnJIRlFVaAcZd0j9S+HvUhrMfQXBLgwISVkPw/uh6U1/yBfQ8dJY2AeSMUl3mp
 0Ei2xTAosJuZaURgsDq3OJEvBD0wih1f+ZbXBRrfQZ8vjSPjENlGIhC9rsYtln0/BBJCiKZ4CLB
 HtlCfdyj/Xc+Djx1nUkWJSgwz08g1FMxTRdIAcfAixke2MuhNfZIePPk7rVOR+RBHvARexMEQnC
 RkVKpE29OnD5tfZuz6A==
X-Proofpoint-ORIG-GUID: vuCbJJYBooPn24d7dTv7GSh59gF5HFGm
X-Authority-Analysis: v=2.4 cv=asC/yCZV c=1 sm=1 tr=0 ts=698f68dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=XJJW21WzQjcAiImwANcA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: vuCbJJYBooPn24d7dTv7GSh59gF5HFGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130139
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:mailingradian@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org,zhan.science];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: ECCE7138D28
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:12:05AM +0100, Krzysztof Kozlowski wrote:
> On 10/02/2026 03:32, Richard Acayan wrote:
> > The google,bonito-sdc board compatible represents the Google Pixel 3a XL
> 
> I do not see sdc anywhere in the diff.
> 
> > with a Tianma/Novatek NT37700F panel. Document it in the bindings.
> 
> What is bonito? Why bonito is compatible with sdm670?

bonito is a name for the Pixel 3a XL devices (like sorgo and other
google names).

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
