Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNePChWGpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:44:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 894141D8E97
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C646810E4CE;
	Mon,  2 Mar 2026 12:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyl5rPdt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6l5n4oX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E0810E4D6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:44:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6229Eq8j3630813
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 12:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VlqArBldRc1YoMwGDMVGPMxUF1kUIY9lZ/UKqUb15lg=; b=hyl5rPdt1kXYfqTF
 SwSgpTQIxmwUeiYFvCVJWYPOVTsnXvjFdNohDst3j377YvuPa9hP4K78GUrvIHky
 tdbb+zuLQl5Sfh6LWrcLGA7JKWPOb6gJ3y5XDxrCoEkGJQ+9Ng/QQkyVZJglf1/T
 ElOS0QxAtK0pg/s+XvItcsiAob2stdEh69IHzjucM/tjZ3YIxSGtUitXKuKvOLBp
 wgriNLlwVVi6VDlDA27hqN0zpk5do8DFW7wrL9HDVMuxHpqebYwQZ6Ahs0CAQMJN
 G3Tb5vAQ7iwJ10BzA2k9u9exnSUt8DdYqqkMgE/h/fV/tFcme/1oDeAqMQf4eYNc
 cdLqoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhrp1m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:44:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb4025302aso380443785a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455440; x=1773060240;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VlqArBldRc1YoMwGDMVGPMxUF1kUIY9lZ/UKqUb15lg=;
 b=D6l5n4oXAAzXRFU39rKHM3qIsZH4Wp2iuO6DPKKjQBEWinL4fJEg+sjnP3/hpAADjC
 bbO4fYmRjJgWEgCClV1fqGc8u77tf6Dav3B+zktvdpThgXo9jS04UvU+u3TabpqyxjVo
 9BGmgM6aOz4rCRo4fiUNvINexPTRufbMI4UxQgMwsi/FCHH67ffVxURQUDRdnMI35+kk
 zjBK7mQnx4koAa0SYkDKDmMTz2+dbYfdu5HrcApbVVGQoct5od0nOFfy4F9ORYN/yZs+
 L/Zm0se+oMVayIDEPOXU2BZboEO5qPSB1s0dHgJozzwAWBU/LPPzVqIBTSltGp/XL0Lq
 YKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455440; x=1773060240;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VlqArBldRc1YoMwGDMVGPMxUF1kUIY9lZ/UKqUb15lg=;
 b=pn2uUfaIDi/8dc9u8Fix4zvggCx6n0BXYQeQ7kCsTC+lHGjiGpQYb0bw1saRaGWO+2
 aKi0r8dHpgijPB/0FqWJLi9K29+7568SpGkg7XXDXpHPyG7obLubXmoN81L/wV91/Elq
 4KcdNXRCADKQlChWF80GQ18HmnyG2tCXwO2L/zRPAMMkBK4Uq7U0oGqVdqi1tp/mYm+H
 1Wu80rQbsfDOJwQIUNkRHpPousPJiUHeh7KzPjtnlvw/e9WmSbE2R1Aju+SNUi7Ykeq4
 x5J7JscYdSxdcVVn8BBxwMYjVilce9JxtYPQxM7+LqKahNGgiDjd7IOP4boD26IeyLs4
 LJCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX67mFPclHwl1g/3zGuxQqTWS6x01Z/BdwTABOytKF9kgu4eQWHHNTZhb5/EALa9ayOIgDnZ/J0oBw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSRIszZMJix996hLJQ/kPMGaqhcvWy/3m3i6TfQZLe/WVwWjG4
 M3F5He0c/D3tv6Hj6amZnpf0okv1buu3dtHJ1iUS0it4RmrdQI+h+34IXcU/LbOrR7H62zI45k8
 lBnD/njh2UDwjSotcYzlc/uL4t+PqOqaIUcfQ+vy9PPdti8nOACECHrClIq7g3HasOweVmB0=
X-Gm-Gg: ATEYQzze2n3nvOFuX8Of3jUqTcnzL36TJCpejQw81q67+tMZVpyVnGO9raJkmc68C8X
 EWYmkHo/xjCbRbRyzrAKRanMz3JKJTS9Vp9odleC2Zz1CNe+9TuJXwWXVGRovAO8FQ6mMxCOQUU
 rbFbDZxTMd+Er0jUgZY2XeZbEXk8nPKFcDMILqR0CVZiOfk+E8e3iRpF8mTNnndlA2RJchwl1gn
 3h2lsIe4E5mUSP0eim+B6dXiMgRn0Twu/5sog5sri3MEh0qFIIFfIMs42zrRr6hAjEgQ+ngXoEU
 mxYeOuFP0lS0QTqZgmt15guJcPFOo2RQWtZfJADsNR+jiJ7/8uIUKXWUgG4GGch8hAQC1PWX56I
 xdAVlXr+5VPaRscqDbmzLHO34CpCFeo39sIqkcj4rb0jHKfUTkN9LFOxhK/COHTo4Qe0GaN9TSd
 H/N1U=
X-Received: by 2002:a05:620a:280d:b0:8c9:eee0:dba6 with SMTP id
 af79cd13be357-8cbc8f0b52cmr1028845285a.7.1772455440117; 
 Mon, 02 Mar 2026 04:44:00 -0800 (PST)
X-Received: by 2002:a05:620a:280d:b0:8c9:eee0:dba6 with SMTP id
 af79cd13be357-8cbc8f0b52cmr1028834185a.7.1772455437476; 
 Mon, 02 Mar 2026 04:43:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ac51843sm484250466b.16.2026.03.02.04.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:43:56 -0800 (PST)
Message-ID: <224ef96a-92a1-4628-b377-da9fb298445e@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/msm/dpu: drop VBIF index from the VBIF params
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-6-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-6-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0qLlMW9H5-U_2f5ZzQQbBBPAyGcKGCbD
X-Proofpoint-GUID: 0qLlMW9H5-U_2f5ZzQQbBBPAyGcKGCbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfXy3xJcnWdOqLu
 gAXy1c4j9lht3eUHf060ZSgcwCFBNkcb960ddNCZ/173vU3f7tTOpbqeDpPlHxOh1k2XK9mQytq
 PCajQscW6R3k3ctR3fsGZCdKwhDyTaJ0iBEW6zOoV2PpCR9D83K4EFgWDVtSLQz1MW/ml/98MaK
 eJZCa7EXA3URJSs2HK+wWekEdDaS5kxse7hmCEH067Y89M1Ir0sdtDQVBi7MYaASs/Ik+f7nmXF
 umY5wqNoKV5Kr9UzDqrXna/OQtotejFvb2cTQ6mCkGx4Qw0zLOB1ZBtMIgBvDOYL4OsQRhlAiUL
 +riWRq+f9OmRVuh7qd2LTZ5oAyIiiYr2A6BMd/u2WWv87KASxgsfDUD3FMo7KSk6eiFSx1rIH2Q
 9O7JnuzO7vYO6b1vq6zAmA+BR3IDBnBy0qg4b/YtAOCyApwDG07htPsPQbITOl2fYbOKdbRrCG3
 TXjb+2aq0XRhEIgomyw==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a58610 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_hvl8nLCH5BLpogRQO4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 894141D8E97
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> Since we don't support and don't use VBIF_NRT, VBIF_RT is the only
> possible VBIF type. To simplify the driver, drop vbif_idx from the VBIF
> parameter structures.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
