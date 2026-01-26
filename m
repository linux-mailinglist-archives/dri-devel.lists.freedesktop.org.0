Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FmgD0q6d2lGkgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:02:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A454F8C4CB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8EC10E0BD;
	Mon, 26 Jan 2026 19:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKFjOkrF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S64rSsiw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE6F10E0BD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:02:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60QH2xXb2869426
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AG32K6YK2Taoh3iHWZzj+qz6JqTYOUoarjRigSl0Wa8=; b=RKFjOkrFN0WH3Z0h
 Lw7+iUogZabnvf8bbMerYYZ8jxzT1TwZii0W9vqOVWGfTUdlUmKkDP6vAJ4t+Rbw
 PwijsY3w9dstdnHIAm4FxTC9nf6Lns7UwY9hHAMAXm5Hn3FsO/KUpTmIQDxucC9e
 o8BpOK/98Bl7xFuk+ftxXgJOt6DOQQZc9dkwpDC/QHlobgNePQ7n66vYuCg0pXU9
 w0LAtKpF0SXcXiUh6ybxIKECelw3wUaM2HnJOduLzM9TWhx/A4oGm2Pkmt2KavMs
 qEdfx2FB7eDm83uRARDpZtkgczAvlQ8S4+kCNe2F7+iB17Nr4/+q429Y9C6//XNh
 /0g2qg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxcb0gbsx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:02:29 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-93f57cdeb11so7316366241.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 11:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769454149; x=1770058949;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AG32K6YK2Taoh3iHWZzj+qz6JqTYOUoarjRigSl0Wa8=;
 b=S64rSsiw55LkZpEIkKU50ih1tLxNLFtuNpHKzyFNz1wMwcyY2n9D72F4lQGOKEy5ZB
 yPWXCXvVi2lMafoMF10+9i813xxVZx2BZYRdJbdtO/YWjz4DoyGekHkg7YXpAdwYw3h3
 dIx7KMa454yChxzKyZUWAbPG2EYS5vYKlBNYGDD4Bq8tiYH/kyadh0m4pNZUrWjXDrB1
 0IBJgyFzGK9PRpk6jqQNwfk+X4iMXhP7E5+bsAfNiI/yIhqDzkB5bg5snNyqStkaz2LW
 jpjkcWbtSMaqjcD3EQ2ZkfGWyMLWXoeoIx//5omMwGnNXlKoPtl/XrtbilfSvJqVcMAC
 +ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769454149; x=1770058949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AG32K6YK2Taoh3iHWZzj+qz6JqTYOUoarjRigSl0Wa8=;
 b=Q2mFJuthKrNEbBqxF+YW4FykO7M+NofrbUod5r6/UHBI7yniwmBvlwXUusSiw2lakC
 Evu/XjRbUJwgg4APanqYZFdPu67M//ub2HFX6ZUVGimAAjvkbgtQdQ5H/ExHjaGjUEFf
 m1i54PgfTZRKrqqaDh6WrlMsLkJMdGci8IDvZgRsSUgKuwXaI8D8sliyHTERy0N+H+Xc
 PsrvdM6nFsi9V2lXGaLdxMoKTKply7sLyklV1xq7ggM1yCGZY+MAIg3BZAyIDOBJuwe2
 rLLVGn1PQVnmFdGiKknjuTwto4mfN07tMdm1PZfA9aNrhMU6rZBahoEPTF5V9V1LGOQS
 7Ukg==
X-Gm-Message-State: AOJu0Ywqyl/37V10yIWoyvnMIpHwyHHae+xzJM9Mrq3Wunxn4N1eIjB7
 Ltv2eN9H6ujZ3BfAWPnmFTd03YAIXHrMDi6L1xfgLwedlUrCKSG7W7zPnfNzF+SNH12HTw0buiK
 VQJthE7etf9cocYA6r9OYpTPCr7VO6tpublQmhxmz8dE5rES5ngQe3tFfwkz/OFmcN7e3u1M=
X-Gm-Gg: AZuq6aJUt5GgvhX6v6JTP5o040gh/oR1vtZpsfLJ9BodM1ZNSYcsYYI5mtCkjO4JtiB
 ejBfipU0hqm1LSMU9M3oIwK1YBJCL2qNlPLFWEq77afjIbw8vdTtbnaY93O2af9QajjAi1GkhAT
 LXmL1zX1z+Z/6PetzunkTd2ODyzEZtfOfPpAgEnrcyYXvndmdA9RC1kzns5bUMHxzqVI8YliYUA
 J4py5uiTBM7rxHziydrPgLrF67i3IRGEvg1Wl4zIFLcX8sJsfyaY8GNkfw4pu1yZe6TnI8RNx//
 NZpHpXf9R+g9YtCjRmsMSjF4ZloW6kyB/pROHFvZ/ZDAEdpicDZK6Hol4DTBzHTKtyQhhKhRupV
 hVE1zOjWLrzCnrmsjLjkopYizorWBRUI37uka9sjYlsyMgektM4hJmorkuRXXvAjEA6FGvHvCQV
 nv69dvE42l55usG8hcJW6nHSg=
X-Received: by 2002:a05:6102:54aa:b0:5f5:40ab:2d65 with SMTP id
 ada2fe7eead31-5f72378a4e8mr31361137.22.1769454147532; 
 Mon, 26 Jan 2026 11:02:27 -0800 (PST)
X-Received: by 2002:a05:6102:54aa:b0:5f5:40ab:2d65 with SMTP id
 ada2fe7eead31-5f72378a4e8mr31321137.22.1769454146932; 
 Mon, 26 Jan 2026 11:02:26 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de49189f8sm2935408e87.50.2026.01.26.11.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 11:02:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/display: bridge_connector: move audio_infoframe
 checks to OP_HDMI
Date: Mon, 26 Jan 2026 21:02:23 +0200
Message-ID: <176945413960.1492466.3261759749688865592.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126-drm-fix-lt9611uxc-v1-1-04a635a8f5cf@oss.qualcomm.com>
References: <20260126-drm-fix-lt9611uxc-v1-1-04a635a8f5cf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: giGytWhzDDPKgOhdA7NoiES8xw84mr7d
X-Proofpoint-GUID: giGytWhzDDPKgOhdA7NoiES8xw84mr7d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE2MSBTYWx0ZWRfXxg9jkEGnLYQy
 JtfcFbENqz+gqV1RP1xEqWSAGSm6AD3QjPtU1jSNJDNEyW2/2rbV6eOEtU4jaTSpoddnTtBn2aY
 USvRBwpbeZzBPEfklZQ9/xlSMbJw9zO+8rCcG3S/1QO+SpGF909ZEL+xsEEpHH5sVlWUmoYWjvo
 s20zUnUaJ1OAjPFYO6ZT7sFiX+R7Jz1mfGx9ocDNUQhCmz5C0heK/6bNFbZmD96UnR5eIsxH6sR
 oTH4Ez5QjHGrqYcuPwwnIQeS+wwz/ORBvjoJQjUBreLWRVyAWsbkVerWompZMhRXAnW4R7zFl2S
 cFNRyvhrwVJSzalvxal1d5vSuO0vuOmL0oYGoVTSo6kdxtj7e7zwEbtWYLZZeF6U2ozCbSTOiUa
 XekIhxTzFzLSuX2HP9D/EfVpeyLWZocRjeHZLylTd1P9IH8v3ILCj+GB+TPorpmUai6ymlfQSTp
 6AZycfde6mgYRB4UkpA==
X-Authority-Analysis: v=2.4 cv=IdyKmGqa c=1 sm=1 tr=0 ts=6977ba45 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iqCJcN-e-oDrINi5DbIA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260161
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: A454F8C4CB
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 13:44:27 +0200, Dmitry Baryshkov wrote:
> There are DRM_BRIDGE_OP_HDMI_AUDIO bridges (e.g. Lontium LT9611UXC)
> which don't implement DRM_BRIDGE_OP_HDMI and don't implement
> hdmi_clear_audio_infoframe / hdmi_write_audio_infoframe callbacks.
> 
> Move corresponding checks under the DRM_BRIDGE_OP_HDMI condition, making
> sure that we require those callbacks only from the bridges which are
> actually going to use them.
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/display: bridge_connector: move audio_infoframe checks to OP_HDMI
      commit: 474d54095090be8ea8701d4a16476f488aa06959

Best regards,
-- 
With best wishes
Dmitry

