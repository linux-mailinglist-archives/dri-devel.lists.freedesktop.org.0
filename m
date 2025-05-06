Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E588AAC337
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 13:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB95010E24E;
	Tue,  6 May 2025 11:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F12eTmWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A7510E24E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 11:59:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54686vGi020658
 for <dri-devel@lists.freedesktop.org>; Tue, 6 May 2025 11:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zTFgJlZ2gHYRDvXHM37MJXTgO7TLxZmzMBTuRE9JWIc=; b=F12eTmWIEWnIgUS1
 PD0qx2+dd5Kefug6QxnbWU1E6NUsR8+mB/0QHmPxMYoPm3eQqCMgYAUBOsudAbO8
 gSFfqRmf1LA8L7c1/NllbEruaV9tJCrmII3NzxP2KPsw7hF1VZqOwDwF57Oj84cL
 4WIv5oTzSZr0FQ5XioDDANP4I/9zCgOyQSW8E9iGrHB7YclAijKblVdYypi8mesS
 6aPEbSHX6NaIcBj+1cPkUHNE72JrThJv0IKDbzhpKb3rqsFopDeFNgMaXCCMJ9mW
 +X2VoP49dcHy1w3lGRCqAqXwnN0Z1AeeEexVb3q3DDhLCyyprAaZnVoj17XSbcj4
 vzkq5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfqcg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 11:59:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c790dc38b4so965856185a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 04:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746532782; x=1747137582;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zTFgJlZ2gHYRDvXHM37MJXTgO7TLxZmzMBTuRE9JWIc=;
 b=K1Bkq8gPcTp6J9/ndUSUi7FlqjdjjznslmhRIN7sgjG8iEgqNz5BUm9DLXCIxJnp3H
 j2vhFa5NTyKWvsY76yb/Qh9Lc1cjXUTsK8Td7v3ECMwwgdLQAMQ1sWBdFiUTh29HZnvi
 w1pEtiPA5dn8195xFLWKc+kjW26CPM7OYqc39WJ1dQCfIS3tgDm5u/WKBUROBHHNUkNf
 MeMf3U1qubbgcD5osMRt+XXz38KnhNjJ3FL1Y0FjCOz9E08HaMPreEVpmFjqW7hYernR
 1scxE65aKGNTE9fitRqlv4pvqRySoAntsNXmny1Pf21LPC8191etQx/Dt3FI7ESV7OTa
 f2Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE7B7ahnybyBUZPLQdnNL6M4v1AM5Hmn3EV5qVcxmGU+3ygFGdMbV5vB1rHsXQUitMGtfyHJhZhcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhPOKU1OiZWxn8EsAbOXFQgwHsHiWsIG5XDIJCIlnRJV9gzKYz
 eZCKEme0nAUEVw0ey2vU8KEfaEXmzXYTJhN+wSwJVM68yX46Xh0YNiEEv82AD6B6mp+ISbjKN1v
 sVb0TjUxJRm6PxWS5jtOZOY0ZjTWQ7i7kh/RLon4I1LRx+NsYOdov6q5S8qrp7aOHbts=
X-Gm-Gg: ASbGnctmkH79I6MX5TsjGjF9dXaIC5nLoVMX1+naQUSkDEADf3vvj1urMaBInQurv1q
 dqUGN5jkMR4YwIj56G0Xne7MZqQ+71/+zp56A5q6VjYFpM9dSMuzJpFlkLadRWmsKGsbwChP9bo
 FCfYUNXTRuWNH1cg6Hh2nTQrGHaOoykOQxZ7zjl4XkFu5f9c6k0IldFuNS08GkM+9LngL8ah/Kt
 epDBhhyg2+1NE3V+J8WsdAEgZGjWAzd4VBN6aQ4l5K/C8vTtoRF4i3qATon/JwUOnacKR3SJ7gD
 FLkc/IwAoQsD29v7O82Gf6AE74JeI0br6e67rbipCYVULeaFDTbBS4lSy0tHPlrSFHpIJyGGJdo
 =
X-Received: by 2002:a05:620a:198c:b0:7c0:5b5d:c82b with SMTP id
 af79cd13be357-7caf058fe93mr520904185a.28.1746532782579; 
 Tue, 06 May 2025 04:59:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd94CFYawEurg0hfZfGtdKWHF+uRpesgha+HGKI333mbLlDZRfu9bTDIzajHzBOws8ZH1XeA==
X-Received: by 2002:a05:620a:198c:b0:7c0:5b5d:c82b with SMTP id
 af79cd13be357-7caf058fe93mr520901085a.28.1746532782235; 
 Tue, 06 May 2025 04:59:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94b1b4fsm2079645e87.31.2025.05.06.04.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 04:59:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kevin Baker <kevinb@ventureresearch.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gonzalez <alex.gonzalez@digi.com>,
 Thierry Reding <treding@nvidia.com>, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250505170256.1385113-1-kevinb@ventureresearch.com>
References: <dbd8e1bc-bc23-4240-b6b1-321ac6f5ed68@linaro.org>
 <20250505170256.1385113-1-kevinb@ventureresearch.com>
Subject: Re: [PATCH v2] drm/panel: simple: Update timings for AUO
 G101EVN010
Message-Id: <174653278110.2517250.15843200835087426912.b4-ty@oss.qualcomm.com>
Date: Tue, 06 May 2025 14:59:41 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: zfI_9RFZD6OjUwbidLBei4wUctV4FBFz
X-Proofpoint-GUID: zfI_9RFZD6OjUwbidLBei4wUctV4FBFz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExNSBTYWx0ZWRfX047buTLgc7jv
 njYyCUmAgUfT5KGzRipPcuDmDYc7RZzYJmvsh87QWXRIg2olu2EYkKVLL2zI6OkvZglNRRz9gtf
 I9IU3L0T9wGFyzVwRDLtiYTLkw/f+7HEKXBYaEs4unOCziYyqY+Eyjs1WuDNN3NBzbQ0fcnNH6l
 XnUMhzbEOn/11bivTDMKEZCwjDUtEW/Mql0j0xvq+sLyw6xo0kehrscJQdZ82HG4ZXkjPwG1YoC
 nWue1jZGiXeJeogc0OKAAHDDk0aKDG3CL6wNImgETNUlLL2/ZmQzQXRF60iszAkc0yPLtd+w42I
 E+4Cf7k1uAhxM4mE+coriULqnHfInIxD+aM9iw6lXoVY2wPez68fn4jIoSSEwkSwAOjeEPptRqb
 27+mRDGlZc2GX2U94f+0X9oPmnpDlOfv0tMbEShJQFBkizrEY4n0qgwpgqnimzw+tsw/ySJc
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6819f9af cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=H2HuHbmjnKnfmXjmLfEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=851
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060115
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

On Mon, 05 May 2025 12:02:56 -0500, Kevin Baker wrote:
> Switch to panel timings based on datasheet for the AUO G101EVN01.0
> LVDS panel. Default timings were tested on the panel.
> 
> Previous mode-based timings resulted in horizontal display shift.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/panel: simple: Update timings for AUO G101EVN010
      commit: d5d283d45c85e774b64100137f34e7d55bfbe45e

Best regards,
-- 
With best wishes
Dmitry


