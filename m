Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLnnA+YpcGmyWwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 02:20:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6884A4EFD1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 02:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D6D10E67F;
	Wed, 21 Jan 2026 01:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGIQMPlX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOTmhOpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBB310E67C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60KM7dw8781959
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GxiQLmlTsdvKzrs2ro8tcxJmpLG39Vy46ft+XTCJ8eU=; b=EGIQMPlX7EZRAgMc
 EphulYo16uZm3gNPXZVtG6QlkM4PEm0hKFMrdC6ooiU1mFVUggTMtOaSI9AoC0CJ
 wNFSqblAJyXpTCO/5Vn21upvjgBAeAe8X3/LV2qSerYw74G38zSB1IcRSEQLM6KH
 9bPqZpPmfqH8j+LfYy6bDoI3vF913ROCJA/A1Qp48IdEAMiIdv5nkGCdOltKrR7K
 P7lU+G3bzxgDbVP8qLgJkZRIAHmQSkOBhG3kX4cLTlxEf7s7hl8b2jHBPcYxQxPP
 xikq+e6F0rO1Nb0MCW1eMag+/ESBLwe4xttPn+y2BffTvGM8nYzgXl0WVjYbqzYl
 vVCIew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btatyt8cy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6b4058909so774326785a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 17:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768958428; x=1769563228;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GxiQLmlTsdvKzrs2ro8tcxJmpLG39Vy46ft+XTCJ8eU=;
 b=DOTmhOpF9e4j9YDwXzdcvOKVuNCw6bGWrromvxu876FNBr1D+iiiyi2/At5N3sJjOa
 JmcKFrBN7WiQsDQL2rDGGF5VJROdZAMZw/PjbalIhdagSHA87pdDTiAObTrZMX0nDPfd
 C8g14sHk1aCVXoj1NiI8GXyKm0ECuEEXzLW+9+j99uPgpmWT3gt8CFtCbkpngECx9Wdd
 isT5N12hA6Ins3vTClY3kJnHKT1H+ZM8YqsHFRR8CjFQ35e0MOAd8s/gYLQOaE/BHKpT
 404JCie4hr0+Xtq7jNTGHWcC2OrGflun/9lBiLVMBzWcxgtCp0407aC6wp/Fsh6pUFnR
 7OMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768958428; x=1769563228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GxiQLmlTsdvKzrs2ro8tcxJmpLG39Vy46ft+XTCJ8eU=;
 b=d5pDMN5gopJMMJGWMsTaxKGz7ZPM4jQeP4+jYAa9zmonzI3by6EOZo/35eiQPitnKh
 S/aV9Ln0VAgQEbeXobSoV7daIvYQEtBVKBADDw7XahvYWU0O8NjI23MtP9kgseEjK9Rq
 FmoFivinOjjjkHFsVWajUp5ddmtGGl17uMhYvqh/IFkgQIomYc85zfBjBpHg8D6C9dpC
 dm6wvWvasR305xzxMTJk832E4npNmukjqGKSPPmsDRj6dv7g4R5Jc2ouWsXHEs17tOkH
 O1VipW3rjnl0FGVjHkQ4QAKWcrUPZ7xtDzfIXt/ZGeowLYzupftMac4AkP7L5iSXMjyj
 T1Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkpTxKREcZhTRbqQKiJZN//DPSfcEZ6MUoRJy8bNsD02CD9hWRFJtM48yH/fDJbP7OjL5ZnPqctrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylH5TzsDtc47q3RZFXQ6ihbtZ3GKCgEX94sejPveGOdkQGBHbC
 Ns95nTFLN4VbaNwpWIR5ocSUV9be0n1IFBJazuX/H2pXaM1akEvIxIccbAbl+Jfpa+nudlkqeBI
 cSFnHdjxjYI+dbN2CLejvwehg1jbqJu/Ibe8PgD47s8e2NNhAQTJaZExDs7Y8CVHqOFGZCxc=
X-Gm-Gg: AZuq6aKOsWG5MNnMPS3YfsPCLKj9FA9Cfbes8T0laQuI4WWgJo545B6y82XuecnYOgr
 +IJVo9Vt+hJuAvEVtimaInRzir5PjsUoWdIPm5inTpcshpaVOE7CD/+y43XYIwpAn7yqu7hl+T+
 vVpNBTpY8y+wB7YbJE68NQta5As11s8oZHyeQKYvBDGZ3PLCLTJrVNXmSLVY2mnBBP3jzuus38Z
 YN6tHHC1HDDV8n9e4FVByegpC7k15HSM4XlorszAdOSp3TTdVDH4rTfNEO+2WkCTni8+z8mbBgD
 yPQoRKI0MLxw5hMXJTwYUPlUEDdRihFdgoKf/W3yQZQ54d43z85kMN5pdlWp8jCBiE2R04KXFiC
 oilbFdXpR7gnwYW8XXuX7gW7zGm9N/8dHMrn4sqfK1ANhL4wMASl4dFju9Kmu0sarnM0+ADI87y
 Th+b3xddeCF9pFq9MdFsDcI7w=
X-Received: by 2002:a05:620a:19a9:b0:8a6:e2b4:ba73 with SMTP id
 af79cd13be357-8c6a676deefmr2388902285a.51.1768958427667; 
 Tue, 20 Jan 2026 17:20:27 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8a6:e2b4:ba73 with SMTP id
 af79cd13be357-8c6a676deefmr2388899585a.51.1768958427183; 
 Tue, 20 Jan 2026 17:20:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3543d2sm4383110e87.43.2026.01.20.17.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 17:20:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com,
 yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v6 00/12] drm/msm: Add support for Kaanapali
Date: Wed, 21 Jan 2026 03:20:21 +0200
Message-ID: <176895840440.3580355.4970268867453461816.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDAwOSBTYWx0ZWRfX9QMEBbBN5ie+
 HaTINybGkGk1+IqNX54GN+TlTdq3TDEDlvGPGNJWKbIVxdiVRHgfKgM7MvjDWsUThDz4lP6ac8T
 uiNiF6mRftwSeLJWhKOoMjbcP5zrrFx5gHQfd4lsaZnsVcatpF+/cTZlyjIMIlXit15GMcZvgKW
 2uddpoxPd2BQmiwfo0HCls68tYs+NYbcwiOeIb8ct9dTy8hkfy30WH3ompwCIgbCyjVdQmsKi3e
 xS91DFpuig+gVbVXXX3HyxhZdp0XJiUXb0chJBnuAheq4/nS86TydC7jRUit6AyZpZqjOMd7B7r
 BT+WTEExmTEMzeweGvU8d9on+UvEVQ7DIYNKErwpe5keVFaGsxtvk6HNW+/Ei5yDMck2h2l5wKL
 UVf8OkmuUzUoHrcFfVLbn4EaDtxM2EVGvmOS2zqw7fShSHWD9hX+00qmhNSeMfU8rH2iFT/fXaw
 y2Z+v6vC0XiEBLu6xRw==
X-Authority-Analysis: v=2.4 cv=IYeKmGqa c=1 sm=1 tr=0 ts=697029dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=s59xupi2FMclaisc2rYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: VZkkNg92cVHe1_h6veRw-XQ2V0QWHyfJ
X-Proofpoint-ORIG-GUID: VZkkNg92cVHe1_h6veRw-XQ2V0QWHyfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:yuanjie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:yongxing.mou@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 6884A4EFD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 15 Jan 2026 17:27:37 +0800, yuanjie yang wrote:
> The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> - DSI PHY/DSI base address have some changes.
> - DPU 13.0:
>   - SSPP layout has a great change.
>   - interrupt INTF layout has some changes.
> 
> This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> in addition to the driver changes.
> 
> [...]

Applied to msm-next, thanks!

[01/12] dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/60772c225f0f
[02/12] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b92efcf5197e
[03/12] dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ac9d8bf74862
[04/12] dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/526015977816
[05/12] drm/msm/mdss: Add support for Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3d2d7a3386e8
[06/12] drm/msm/dsi/phy: Add support for Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/223bff623c7d
[07/12] drm/msm/dsi: Add support for Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2482c6f93aa6
[08/12] drm/msm/dpu: Add interrupt registers for DPU 13.0.0
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b78956dc9ed7
[09/12] drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cc4b81f178c7
[10/12] drm/msm/dpu: Add Kaanapali SSPP sub-block support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/688c7734002a
[11/12] drm/msm/dpu: Add Kaanapali WB support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c6c9f129e98e
[12/12] drm/msm/dpu: Add support for Kaanapali DPU
        https://gitlab.freedesktop.org/lumag/msm/-/commit/83fe2cd56b1d

Best regards,
-- 
With best wishes
Dmitry


