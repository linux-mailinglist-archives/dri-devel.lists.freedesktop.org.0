Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CByAAR6rj2nSSQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:52:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BE9139DE8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8535A10E845;
	Fri, 13 Feb 2026 22:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="blm3BL7a";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWRr1Lz9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D7C10E845
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 22:52:08 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61DHd97J1411318
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 22:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pSRPCVbNw7rKbjwLiRmMue8k0pDouTah/uYscuuMf8w=; b=blm3BL7aKtpPgFNj
 q9VrUuqRazoplx1qvCi2CR3ZapOrRAN3HwbnbSh65eQV2XOJVODD0R101j9OWq6Z
 fOW/RRAXoMx2Z2X8ZLDkp8m3wnKLISvDolF+qOgtkYtqa2LgD4i2hWHBIWfh2MaH
 n4FCED8vFbyIiIYH+vM6bpd7MHfjJUTwDP7dyVkNS/Ykn+bfGWxfZpToeLY/IWGF
 kNfqmGdQf8yYQpqP93yGR4xdvXXTC8JzLGXx7R6/z/RjRyt7lZHBHIpTUIsh+khC
 N8CsTW6AnXhDOoQgEF1NFPTabynoEmNpsmMHavtZiXrKq77fr6Axkak+xDYIJvUi
 GZoE4A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca8hh0vkn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 22:52:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8954ac30d79so62363716d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771023127; x=1771627927;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pSRPCVbNw7rKbjwLiRmMue8k0pDouTah/uYscuuMf8w=;
 b=WWRr1Lz9VSqU9YUUH1GxtaF33MK82ODhDY0WTATY5fKFsZmEAnpR4WclMo2K41hSnM
 Q3vwyV1OLAXGWF05vwibzjt8eldGfmdqWg/jnxDXksnfgCHF15kfpIIdzeqlHMuTiT2E
 +PN9+PEVaLCtH7QSjJsK1SLBkJnuBv25toFzRTQrEpPD2ShA7zfM1nOECJXRFdyw1Bm3
 BP81BoHnTrYg8t1IsETYp9wFSjJeuAISpkm9JbYbCrMeSy7wxDXE89hqxv0ywP/6gU9O
 VILtdBOmELE4k4kr262fqtD0VJnsVQQh6ol/1EhFD3bsd9wkSsR69isAeANxVwnEpCK/
 ZCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771023127; x=1771627927;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pSRPCVbNw7rKbjwLiRmMue8k0pDouTah/uYscuuMf8w=;
 b=ADXF5slwhNkzilLz0h0PQK+2ccGnv+t1BO9tYMeoUlJD6/UiqJb0z2hNpv9sx/xHQx
 Dvo+ufIdfCaaXHzCOFHr38+maZL/XgrxXl9oTvg2lLi7B7zSMQjrSoU6KpEk6enijQLS
 H/pi41+E6B3w8vMpUnUGZkTpaYhbWSqc5S8JA8LizUbtpmJyOQBGvIOYagrUDfo6H44O
 lBOEGWQSJuQ3sR19ihkRbSfOcFb5cnIm9pxkKiI20HukygwBGbej8uhpGyBh7VTaV6No
 SMOzIvA552QGLOrRKhG7qLPtF1VdVok+/zenB5Yl1Gqk3zpQXLSiPLKzdyUONSDAi91z
 7Eqg==
X-Gm-Message-State: AOJu0YwJkOfnutiqyvvSqI+5Z9L0bAmBcK96nnX2pch6f6jvXQvoybGr
 UwTjSFJZpidZM7loAdFEUfJL93Lss/A3Y8SkDF2btUAC4Da9vpEqrPIm78BOBYgU1k4zu275mhV
 CarpjWvJPsDMzuBYJKuCHZSvRh6UfeaofXLsAA5dNI1ghmpmiH/A+S2yypOfx5tNml3qS7eM=
X-Gm-Gg: AZuq6aIubZRkf0a+XotJ/vautPG+kFFhzp3uAZBDOpVIQK/CFwl1/vBd8q+42Lp0FmG
 b7c8o9INTOYKy2i77jDDsUgs7FjBmqj1216M9m94LL6zyyOJoZCigTcDlk/KYLLSGLfCdaeRJd7
 as8PVvwvAVv35KmcGeBNvMRSAX+gEvHcGlc6UQ++vxlNEnlZxA5QSFTz9Z0nCGibA549RsveNdU
 7XbkaMypuzE381UBW09Kxp4QprG9+ktHh2mQXYCtx69drEz6FOQ13o2bJtROKOscadjy1rQ/ubC
 dgjVak44O2X4jrGl460AKaLRGAvUJeSAUiiIvJ/jWir0OMTXXPX+9xTFJ0uYBeEjYKFB3jhCm/U
 e1jrHyuIWfU6D+keHQjeSWKyriGdJseAt0TvbVgVKqixXr5Z3CWpYnKZG0XH+k7A8F/8dp6WISG
 YNxIiz8NyDOlUSBo5W+shssvoorxaYd8l0Bp8=
X-Received: by 2002:a05:620a:29c1:b0:8c6:ed3d:be60 with SMTP id
 af79cd13be357-8cb4248a74amr454448385a.71.1771023126656; 
 Fri, 13 Feb 2026 14:52:06 -0800 (PST)
X-Received: by 2002:a05:620a:29c1:b0:8c6:ed3d:be60 with SMTP id
 af79cd13be357-8cb4248a74amr454444985a.71.1771023126200; 
 Fri, 13 Feb 2026 14:52:06 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f56867fsm1829162e87.24.2026.02.13.14.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 14:52:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>,
 linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
References: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
Subject: Re: (subset) [PATCH v3 0/3] Add DSI Port B input support for
 LT9611 HDMI bridge
Message-Id: <177102312411.531660.1550838144624471871.b4-ty@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 00:52:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=bplBxUai c=1 sm=1 tr=0 ts=698fab17 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=Gj2pMmEfbv5KbNg3tboA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: X0Zi2yCcqul5LcbVyLtx51XeAZ4gx6Xa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE3NiBTYWx0ZWRfXxTOeBgXTBajD
 A4yy5CngoN1ZusjVDGtO9XP+jafkohlxJOKumj3xrv/pMc9uU+0imFdz/wv6p+3RqsOTj9oWR5b
 Ez86J+/r5ipvyQzKls9N3bmMp2U1IcV/KqS9XBt8Rt7HUuDDXuq0Cx5hNttYDCZy6L0PeeA70bh
 AneB90lnSuK/EKDUFLg/f8zfYHcB810jkUDm6I951PD6Ul9M5TaJbGPGjJ61MdLcgnf16sr3tNo
 RK8CTqvtejePRRUYU99VLv6BxA8tH9GqoehGoFvYcPJI6yDyA7nwJfWcPbS3XrX6Gkm1B91eJuk
 beV0W+8OSVoYISDiCBfcE0fYs2CAATGOu6XIQzrsa7GbMjtnZSO83wW15j7XttVTMiU/xntY6aN
 Cbr7l0cGQ8uHnaUCapslvqFew6fQEMaAhdkLr/EjpGhLjJgW+dFC05/+llkOCAy9kndPxaGQKCM
 undj6qi4Cm7GvIwo1Og==
X-Proofpoint-GUID: X0Zi2yCcqul5LcbVyLtx51XeAZ4gx6Xa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_05,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130176
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:christopher.obbard@linaro.org,m:hongyang.zhao@thundersoft.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,thundersoft.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 67BE9139DE8
X-Rspamd-Action: no action

On Sat, 07 Feb 2026 15:32:53 +0800, Hongyang Zhao wrote:
> The LT9611 HDMI bridge has two DSI input ports (Port A and Port B).
> The current driver only supports Port A or dual-port (A+B) mode, but
> some boards like RubikPi3 connect DSI to Port B only.
> 
> This series adds support for using DSI Port B as the input source by
> utilizing the existing ports mechanism in devicetree:
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] dt-bindings: display: lt9611: Support single Port B input
      commit: 5ae47f510f38ba125b3bf213735f70d90a44e52b
[2/3] drm/bridge: lt9611: Add support for single Port B input
      commit: e8bd92c4a0d2ee0fe8ee2b33c94dcffb3a39749b

Best regards,
-- 
With best wishes
Dmitry


