Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAAEAC598C
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 19:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4AD10E294;
	Tue, 27 May 2025 17:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpTVDw1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96C210E294
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 17:59:10 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAncCW018828
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 17:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q2GYwQWvLDehVexEpnKVnL5W3PAsk05c4IXTOLkYRtI=; b=OpTVDw1UnCgyDdC/
 MCI6MRkJCpBTnLgSBupMo9wnC56yI9tSOsKgG163I7u/AWwy77cXFj6gMx1XJQsP
 Zo17Vp1W4Zq1JQvdBpGvzpwqIx8e0J05UwEz5MloZbk+IZMTEdY5wnFI1fs6VmGB
 FgeSzMvRTecU08yaInbUdHvP3EYL7XcY8EU3yJaFM1722b+ylEeHDHLXbnjLOWUl
 7FyRzRq+cAxytrMTCAh1Dx308svyjwHfQiDvP7pD1rI3z6xv3VavtXM/Mj2SZusO
 O6SqGwf1cXZYS+ux3ZPsDLlo7YRCkHe51taX1ef3HUY8JcNTnoF/RawyRp1XnXHs
 WLHc9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcv79u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 17:59:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c790dc38b4so19351285a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 10:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748368744; x=1748973544;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q2GYwQWvLDehVexEpnKVnL5W3PAsk05c4IXTOLkYRtI=;
 b=XZA3ayZUawG0VvFleE7MFdG8vQXXczW249J8Jrm/fRhYGQXU7INcmtWuE5YpswsWwk
 3uXfn1btjb9OeU4eVc+pj8n8eaAXXBfG+PxqrEXyeYVk9C55UOLAUpMNr4Eby4rDygq0
 Ma2Gqto/7IWTm4AIhjcIQ76qyTK2756j+vuSvci07wZphe696qj67cIutbglnsaNp3/h
 PCGktMKwAZU+kbqRpR+Vf0XeSEb32UBoph7G7YrQeXt7AZCgwaCxlDBGsvuUjJ/nFViM
 nBhu6zIVhrau73pjw60B0vz1BTP2APmYyOpU549pVgbAetHmWWB2j9EzdHpqka6pIMm7
 bwuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW40Z5wqwH9frKULLYidQ8Lrcyp5nhpm+yZxd1Jho+BudrM8Q0Xlq8bsxOvg+FPk7a0NkflBf63qGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywea6SJhhFfGskQh5wS3o7m6u+beZi+XMHZrCf6VbktivsTmimE
 6lA9BO5lglpf7X36P8A3Z0ieftZWuKTOL4YEF3Cw9JG52+0AmanODb06zdO00ah9cbFG+Zmkdko
 xA9G91KFYBrwCN2hGxNvG9bVUbkgSXi4Xn7P7dTmdo1eJp8lWq3H1h6uAY9ipGVLIxdshb0Y=
X-Gm-Gg: ASbGncuHzbyqkaTJa7xJvvB2zKGEWAhWIjuimMSsGM5PwhUDichgAAze6QcCga84idr
 m9Ws/H3VtqIlkhAZ+q0mjd1ymrZnHBC6/Dk4+KYHvnjCIDuJ1nAlfM8aTyK0K6gTpeeozlr7wj6
 TMrcAxwKWg+2PeITmWbQik4tYKgAUdtD4PwNpw/BBSGDlDpunb/xSSYfdoy+rgFFvXxOQ2rXGWK
 7PA4db98R819k8grzbUntdMIdBBjwFYxN87nvzmF7KwVt+f87OjY+Mg9Obp5j5RmjmapC7BYgFQ
 K1UsgwlpvrvypcTv75qx256kzcDItioGjjN0H0k8OlnocZDwTDckq6Svf7dW/EndMQ==
X-Received: by 2002:a05:620a:2b99:b0:7cc:13f:fa30 with SMTP id
 af79cd13be357-7cf06dae508mr200609685a.27.1748368743756; 
 Tue, 27 May 2025 10:59:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV42QuI+o0ObvOlA9nelVctqH0EcLGjZmTZYrszeNqEsSUQnYPR7mAD6Ra+fFCXIFAPsslmw==
X-Received: by 2002:a05:620a:2b99:b0:7cc:13f:fa30 with SMTP id
 af79cd13be357-7cf06dae508mr200606885a.27.1748368743424; 
 Tue, 27 May 2025 10:59:03 -0700 (PDT)
Received: from [10.172.99.180] (37-33-128-129.bb.dnainternet.fi.
 [37.33.128.129]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532d666ae0sm92728e87.225.2025.05.27.10.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 10:59:02 -0700 (PDT)
Message-ID: <9563595c-7b02-48f5-9f62-eeb35547981f@oss.qualcomm.com>
Date: Tue, 27 May 2025 20:59:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/connector: only call HDMI audio helper plugged cb if
 non-null
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250527-hdmi-audio-helper-remove-fix-v1-1-6cf77de364d8@collabora.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250527-hdmi-audio-helper-remove-fix-v1-1-6cf77de364d8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cXj_rhDWsZF0pmGa_1yVH7fUnXmEfXIx
X-Proofpoint-GUID: cXj_rhDWsZF0pmGa_1yVH7fUnXmEfXIx
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6835fd69 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6k2OflH5rXnsPsZLZHiYtw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=3R2PNEn0RuH7tX0IixoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE0OCBTYWx0ZWRfXyzb0/nmZmI5w
 KGUd8TkZOkapt4kCcaxcy7V6STVBKLr+i99C/2EiU18gMVUXqT5zU+LJHxkXat39//ul8sOLmBf
 HIih9nXp8jS6geNYEKqed1MzjRBPRFt6PimW0AsQloBNxRONkO5q+dLCu0jwWL3DW0/LFYEjd9z
 1mHk4cTELWRzu3dta2ozbEqhF1wrmhiuHZvGtTQFDTX4i+qYeeCvS6dL0j7sPhpQEAZspk8A+Mo
 G8V8voYnQBGfZr3XqXJKd5TBllStEAaXXBeg8oons7jDXnMJAPfGsXMNxKSeYFF+SiOAOMklCTO
 87BqknKYDUlo7fyzWDRKt+GlIZ6xBTPoGvTIc3uHfuEGL5DkPr6bOSL5KZqComX1QMl7K0sca1m
 KJ3BNwZZIQZ2elXmq0uK5WryaUjvanF27h32rgULNaf1IkyGaIltl/qJJnFmWsIPabVg9XIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270148
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

On 27/05/2025 20:57, Nicolas Frattaroli wrote:
> On driver remove, sound/soc/codecs/hdmi-codec.c calls the plugged_cb
> with NULL as the callback function and codec_dev, as seen in its
> hdmi_remove function.
> 
> The HDMI audio helper then happily tries calling said null function
> pointer, and produces an Oops as a result.
> 
> Fix this by only executing the callback if fn is non-null. This means
> the .plugged_cb and .plugged_cb_dev members still get appropriately
> cleared.
> 
> Fixes: baf616647fe6 ("drm/connector: implement generic HDMI audio helpers")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
