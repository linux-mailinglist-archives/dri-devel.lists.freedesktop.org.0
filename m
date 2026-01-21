Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAR2COYpcGnYWwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 02:20:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C94EFD3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 02:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7DD10E680;
	Wed, 21 Jan 2026 01:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjhQVJon";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWW2XdI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9093E10E676
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60KL0fm2877927
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 31X3HJXmE+ewsNzBKQHcu2ys5oB4OdT178S5VcUsReU=; b=JjhQVJonIPs7teeB
 ksba57MU7kAC7XFnHE9s6f8gtNHJIOMBivHGAhk4VAEqtFPY3DQF4lTvGnL2e4Ec
 /14EPROD5LweJovoDRwNc+q+RxVlTV65u6bxWxoPn8ZWktwvidpfxWXlkJV8J1po
 U2A6H6lI+HTE5i41B8w1GVXXcGUFkQA5S6asXwHE4D+vmy7Gth+Hi/trxOEY4Pu3
 7UpRKznhwprap3xyWLv5zIa8q2dV8hv+YbwNS3YO2mukxrqM3WHOLoPGYyJU9j1e
 S7Je3YUF/0UegLjdXUWFUGDqfFgdXD/jh8Gnh6GI75TQ1ZkElWrG8C/aaOvCG9st
 sF86dQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta42jbs1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52f89b415so265338685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 17:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768958424; x=1769563224;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31X3HJXmE+ewsNzBKQHcu2ys5oB4OdT178S5VcUsReU=;
 b=SWW2XdI73vGZfbpkdnC/lmRQhL8HP7jRNoDrL9QS0mOH+Fzbqga7HRTFiuM7bA5WFM
 M6uF+ycRVFGHuPx7AQKj4A2iP+Dr1HSD6YG/Lk1Vuy57bjbMmukNHnHllwmo4K54R6/F
 RUVAcKnzidQPtdpEygsJseD3to4z55dKCt/eyD89mh6SAQvxbasZdxqeH3OCjjTxq6R1
 +bGEvxj483Av3Mj7f3dgo92ajuj4MYjgDXhCfxZKkhOii86ZBxnSAr5Em8T2RG+OHPcc
 vBD6BeNQGRSOCu3QWivMNadqo/8ev1mGjo9sStez460cSLyi4km+Civ3I2vxExoYTtLc
 EV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768958424; x=1769563224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=31X3HJXmE+ewsNzBKQHcu2ys5oB4OdT178S5VcUsReU=;
 b=joZU+YSs0b3dnMEwZeAEs5k2VV86bCtqGtQE5u9JYvhtS96LifI7Fh+rspII9krWtT
 niittn/MwNW0FFAwmJVBrknsW0HbyEjQzKaaA1J8b375P/XisKh1d8OYNwYX40VpeFtR
 YjkR2mCwE5hyphnStqe5cVSvXzUnxq3qvYRftZGU6YbZHxhjzYjwuBzAXNwYsH2ju2VD
 j75K5D1MkDJ2rsyCX0otos6Xht59ygRjEKSpBBuw2R+7X/q/ov2nyUnzPSe3vGtUr5JP
 W728b5Xta0x0XyMxmVKsrGLR0dCpKois/35D2ihzYxufwGd30/uIyXJQb6AjZeY6hNlf
 KFZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+6x30/gXSaoXBEOjysOe3SYlfG3wwlt9vV8hwvEEhuSEyuJFk+EmVG1EyvtUxs8a4BGYO5zLxHR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvdq0MQKdFVPs1NB0UhSrRi2un8juaYNnNEFVymxlR5drlf8jS
 lQudujtlBufMQwHCOmXuc8BzYp0nJvNn2FeTcGuh54/n7p9DOSfyLyjcDr73Hv7tOgUW41A/zSG
 hIy2AspYR39lsaJ7CZJ1NRoMnH+i8UpOk5Bz30uO6ggJnF6vQqAtV4GDc/HHySJFBBAOLX08=
X-Gm-Gg: AZuq6aI25cTx2KSCxiDs+FSxRMA9kChsnpukT1Mzfnrfz+no5JxpQ6sNgEdNYnBt9+V
 YpUZpIrq9woOZ4cBmZkXwIPRJ1qugTwNksLovPwlMIQ2pfxQUONhK2lbt/fUgzrWP8GId1Mz/77
 ccJgkznkyGH9qgCsPPD8Crp08+odAGJZMcvY7ZuzZSDu+1wGdUXzE1SaE3nOL3a4Fcbv1bjP9w7
 F/mCpKeYVki+sSYV94I8OHZRyMj27WWZLROfxkdUk8PO7UacOBRnGLTK1vTNGGBOmu7q6u91de+
 1slrhuo1VkzH6GWY+jw1JiXbPf3rCbyAryMFz2mdYF7dTjz71IDo09Zab5uWTALKiwGtDZf/qdn
 on+d77A8RFgR6EQGDqufBRrNcXOl1mG/t3hyqxxHKquWDo8ILmlrGnEH4/ynpJ7uRbykMjL1w17
 aGx4A4OmpMkxYKRBV9hG7P5q0=
X-Received: by 2002:a05:620a:1a10:b0:8b2:ec00:784f with SMTP id
 af79cd13be357-8c6cce503bcmr456075985a.82.1768958424131; 
 Tue, 20 Jan 2026 17:20:24 -0800 (PST)
X-Received: by 2002:a05:620a:1a10:b0:8b2:ec00:784f with SMTP id
 af79cd13be357-8c6cce503bcmr456073085a.82.1768958423695; 
 Tue, 20 Jan 2026 17:20:23 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3543d2sm4383110e87.43.2026.01.20.17.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 17:20:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
Date: Wed, 21 Jan 2026 03:20:20 +0200
Message-ID: <176895840437.3580355.3757750367730207447.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
References: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDAwOSBTYWx0ZWRfX993BqLSYSVaR
 LXKSPxmwHEx2bZ9g1Mrh+u0ACHKEB2B2pK8WlkTdjyfY0HhhayU+ATBuzws5791+qZdss/3wEwa
 3G4D9PfmhHn3gu0sFYFQ0qqDDsNhORoxFSjh+ESCo+MzSSIznYeaxNc2ZPl2FCC71vNchoHViGG
 6snNfXqqvspclYEDlpGGDG+WJCHVk8sUzmvhhQZe0EzvEbAjZDs2g6kdmKQeT/yI/I0q47Ucltg
 5Bds8p+4Fbxy4BuCDyi3WNsq7FQhkXJg/DOv6ukz6ryl+eAY0XUZtWzMGM9Z/1PTLPakmvZZK4k
 1Yayd1ifragTM3wWwpdYZX55e4eXukRAk8lqwQQp5LzydcFAyW+zlvDmwo1yq4NQc2Q5T4pdVnn
 7STwPCZRoPmG3cfGVaAigSvedGfjR+HNXSSsIlubLMjL4evt1N68f5wA6C76NND0J4Q9sSsKTQm
 x5EM27gyAIRUKJG82lQ==
X-Proofpoint-GUID: -anlah3tD95zHW9_eS3sfv5mz3WbtwXh
X-Proofpoint-ORIG-GUID: -anlah3tD95zHW9_eS3sfv5mz3WbtwXh
X-Authority-Analysis: v=2.4 cv=JeSxbEKV c=1 sm=1 tr=0 ts=697029d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=OVJ8HEpvijlIqhD3_UYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210009
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:nathan@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:llvm@lists.linux.dev,m:patches@lists.linux.dev,m:lkp@intel.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: AD1C94EFD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 13 Jan 2026 17:00:31 -0700, Nathan Chancellor wrote:
> An (admittedly problematic) optimization change in LLVM 20 [1] turns
> known division by zero into the equivalent of __builtin_unreachable(),
> which invokes undefined behavior if it is encountered in a control flow
> graph, destroying code generation. When compile testing for x86_64,
> objtool flags an instance of this optimization triggering in
> msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dp: Avoid division by zero in msm_dp_ctrl_config_msa()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f185076da44c

Best regards,
-- 
With best wishes
Dmitry


