Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL6iJ5+FpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:42:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F241D8DB1
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0D610E4C9;
	Mon,  2 Mar 2026 12:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCWUvjnN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESEHtuZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CADD10E4C1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:42:03 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6229K71r782945
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 12:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0TwXGsbXnf1mwta9roKukARuNf4bIgiX9Ha2j3oj6v8=; b=jCWUvjnNbVAQqVUW
 EfzMfNrWNT7zRacazyuGZu/NuOb1JvvT4UijK4TMDpxE7s6KsI7MpGjJ1dhjk1+J
 /7/R5z2CaWkvnaZSMIw6xHAYNWMCaI/j5B502358eOK23oZsL61VL/S0ttKQm8k3
 lgP8lxMGl3yjTxANglUfs7mucbZ+Ev6C4cyeZc4PFd+uZzzMlabiI+x1T3Zw0VGt
 NblgQYhM9IvFEKWqhVvdJncOWQYB7/lEmHAkJrX88ph+ps43F7buXHTd+vJOlx2k
 i7udYL56BKna+r1VeM3JhxeeaCsBAHmPty/cq6SkleadrKwbjQ4SnoC+YAgF3WF0
 Tg7Bvg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00na2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:42:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb38346fdbso421140885a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455322; x=1773060122;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0TwXGsbXnf1mwta9roKukARuNf4bIgiX9Ha2j3oj6v8=;
 b=ESEHtuZghgWqvLACwGGYyoqvSukb4P1Z2CiAdSv7yq+XhHtCCLhL0FyASLrahr1zPa
 i3+ko4ft1FsjeNTJFpzueYgaDNosmo2b00NSRthQpGqTTGDZpQBn6Gfe2iOm1QZ0xcRP
 2Em2hKfYRk+S5hLkJAmPkcywH0Ffthpfi4wZ95tBYTSWrcvcwDs1jWVWxUguGTy8ZCON
 fOhgkVw4j5LjfB/tWxMqIKsFwreMLPsP3huQk+Y6PBm/gDMo/nJOMFoxk5FeyXKYeTen
 OR6YGEn3iXSgRl6SvOsCRQUI00ht2PqxyhFiNfZBFDXz7cORwoWXTQCDXNVTpvCygaZa
 lU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455322; x=1773060122;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0TwXGsbXnf1mwta9roKukARuNf4bIgiX9Ha2j3oj6v8=;
 b=WdifA23KQ35jvv5zBpoCO6Q9j0CadsWUeCgXNdnNMyNMgBKKjhx2fzq84M6mYmd2jg
 T/9EzRjhekYWEZhVlvzclrSlM4cfy30PfBLH7UMKmAHQDi0Ox13t3ED5EyRlWFt3q/mL
 oHtG/ZXXX2EdiCSwHZBfiYlU599NQ2jwyzBkEWEKylCpROuQwtZKEaqk+GeAbsvY+HPO
 d/m5kS16x3uex4SnaTNFd+EeZiO5LV5vKYD+N9BjMTi6Xw24JvRX01gEgLsV1uhisYWi
 fMhlWK0YURlXilTVCxp2K0aQ1mjrQ+zW+F638uRFeUGtQTE3x7aotmo8FYGq3N+bm2qH
 ZdIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWz40FWj9IFOFoyc4iHJvmGj8yQJxfvvOQWZqSVsYmp5XoSanTiRbcBNdASH8QrikCk3Kqet7pX4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzShWZf207rWhw0l4+bbvz6eiNMQ+eE5AinnboeABDYpKlpZmLw
 FpQjR4V7eMZ/QJPpcncyywfH382CmO69alI6Aip0dtiMn+USNHe48emMBqCcLNJZR9QXAhHdX/c
 +/7XQqIYgcuarTcq4NhC/ccqDd8lTscm6O3e9cAZzWQ4a6V63PamnEh4nH6TgTe5SC6c3DWU=
X-Gm-Gg: ATEYQzyDZ29HZegPT+AZw3Go8rUNQHPXwoZFErtyORBq1M9XoMwaBfkdioMjfbR5OAt
 c6vxDXyxsMI9r0JyKanNKIXnSkugP+CZatmKjaEKMg8NbXt4t08YkQnK6/T3hdD0JujGv1VKYPF
 jSU4lvpdeSihFIrMnMHE95nXLcGjPv0mKL1zbdU8ho7kfv+013Eq+Ihf9uIjv/NrTaK2ea9sRfL
 Qy+l33DbaAFpqOOsghQvqd2e8oeMQdC8Dqp83YuyqvHAD6Vd/Ou5AVSNj1uHXiJTUAQpezJySVv
 V8fp+rRoDzJCV1fWPxIW2d+5Xl+ywHVADJgl/C845BCslhtb/Wcx8QNY+em+70tdM1o0C6wVuhZ
 zRYgxSq12LosLb/iDtAHOrrduXh13C3xrH/cw8ttyMVDGo/GYol0njCse2fZh0A9bkg3iSrGRrv
 0mLJo=
X-Received: by 2002:a05:620a:1a1f:b0:8cb:4059:a90c with SMTP id
 af79cd13be357-8cbc8f3bc1dmr1129518785a.8.1772455321855; 
 Mon, 02 Mar 2026 04:42:01 -0800 (PST)
X-Received: by 2002:a05:620a:1a1f:b0:8cb:4059:a90c with SMTP id
 af79cd13be357-8cbc8f3bc1dmr1129515385a.8.1772455321392; 
 Mon, 02 Mar 2026 04:42:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fabd467d1sm3438066a12.10.2026.03.02.04.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:42:00 -0800 (PST)
Message-ID: <0b1dba75-b701-4966-b39f-ff62d3400b66@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:41:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/msm/dpu: drop VBIF id, base and name from the
 catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-4-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-4-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a5859a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-mdkBzqSqWWIJJC9AIcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX1gyHpogAYUJh
 EX82Ty/GCHXs9dhOZqou+FGjtpZXtz0DmW2u9rGLgnzgFYhpf9e5X3pNw6A2Y2ZeoLdC+Basz7u
 58fGVst+6ZcGeDjOOAPibj7X+LsUhzwO0DlmokovYtaO5FOgfxEIXopUJF8nFQ+HVymq6HafRlp
 nz0KfWsRos+atTsv0MxkUk7Ui870vres5g7rdQKMYZnLSt76xLoBHRLEwA7r1RglhqefoGWlMEn
 FnGB/CEYmxEES1gKfFwg6McPMOqRGEeDFOUrRUpAPcpp8hEKGHYwai9v/eD4mBRPiEHPiZRkHuB
 +DUFeReKJCa53MVUE3rBIuEjbczJbhN3T+QacDX9AymJCgZghHRGF4vDsfVo7653K8KmnJj9U50
 OKS0W6Gri3LpDWKaejILlVwUlPRNVfyfUmEw9S/wgrXpS4cdOXHuPWPe9USJdzP13hqY6L1yFC5
 NuxB/sMECwH4YXcpe7g==
X-Proofpoint-GUID: 41vq6OWdPnUVYmDBH9pSze6E42Svn2bX
X-Proofpoint-ORIG-GUID: 41vq6OWdPnUVYmDBH9pSze6E42Svn2bX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 50F241D8DB1
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> For all the platforms VBIF id is VBIF_RT, the name and base are also
> fixed. Drop those fields from the catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
