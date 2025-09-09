Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFE5B4FF04
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B9910E74A;
	Tue,  9 Sep 2025 14:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5ixmLeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8158C10E74A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:14:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M3Jl002349
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 14:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=W5FZPnnAYfSSnhNPm1f6v5Pu
 spMlQ9tOXnSUoaQvITU=; b=T5ixmLeoK0g8oikx7Hu43fr4ZiNog5OjTS3WtXRm
 r85JhqR1KHFmjCO0zzFbrFDIgR2hVIjeQCuIG/R1DNsCaWmh04mLy/PO2Y55OOQv
 hyXrREj0rvrA+Rn0kr5CVUTiL99qDpNcWyli46KC7hZcVraKNwEqN7ObZVfTvg49
 llWOKc2aJuaIune+alEcQV+ClCp14LsgEJoToTuDRHk0L3yuiHdVooeVXfNp8jc5
 Elxt/0ugTnursyPGhLQ5klGmUmwXtQ3JPxoj02bZuOemwS3wze0na8Q7wD/6YY6J
 Ci7v7quxokL4LoP2N4cV/Pivmx/6vYqmBWjNvZIsu2U6Mw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg0aqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 14:14:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-728a71d8fd9so176766366d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 07:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757427255; x=1758032055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5FZPnnAYfSSnhNPm1f6v5PuspMlQ9tOXnSUoaQvITU=;
 b=I5hw0Kxlpvy5raZbO2V40RGvhp/W8nYMu25H4dFhXTKv5Us3JgOP7c2fvyF+CzERFj
 tDTz74kJ29WJIWoP+CGf+UElFNh8oSZu307QnD58n8eKGkZAbSgTKGAwz03sbOIVNHgU
 Gwoe//0W6snUPADNxGO7M2wruepb4vIvz2s1tQc39ZgQTBKnDx544GuNK3gWRORgeALE
 P7/KLfkSw/lT83Cy5ra2bMpau020UNTsi9amn43vKwDYoNOdwRf8QgKxL+UhFfuxWXDB
 f7RAxMBiWpKuan0RMsyhgrSrfAYZJbN5dly4kpMs6d9okcbYTlT/8omurG6nKoA9oMrG
 epew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuQBhOUTgWQ3A6GGNwr0jIGMzQ8OKscLwDzJeXSI7mHfF7IhcZYIKaOjbqDdmtlggIqOPSqLJd3O4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl0uqOjRoWeoBPLRtHIoSrlCW0+pMMB7QR0B6pBsceWw56Orgl
 Gzz/Y6cF70ZtO2GSHVAQ4737VKyA37wxbJFJsMLu10irDl3grxuknOVqyKXBTers8/SMFJ8MpU4
 2ZjhxR8fQaWJQwIH7sSu22j6XXoWj7h85Sp7ntN4QHZeqMIZKTnSeITXAhiFb6W8ETAPllYs=
X-Gm-Gg: ASbGncvO4AztR8Y248g2lbTYKEG4gh7sWOw64jRzTURoO99JFbKbuXCUDAOPUknwlGr
 /MhniNsMya2kVNe9zFDR3QxbF4nMNas630m2stdadauwmV90PxoqoPNXVoKCkAxSrxJEN0paMAo
 ZSIXZ9n2b3a1oP6zcvNsmX8ByC5bdts0WqDbtFW1BMW1FhVys3rnpvCK4GQ43EnPE7f6alONO+t
 7OUpjINpUgeBfO/Bd+snr8O8dzvYMppjAxToazn17cCtuTdbkVvjDCqer6qGhErv6t9rUCKJmYo
 sM2HGNGvMy/nf3boLHqT/twyhlPQr7zM4Sh0xFkolFgRKLW02Uzrl0uk5XklKgFCArchbE3w0ID
 QUsjf2TnNIwHsvuikJjYl+y3ivL0Oh0tYBfTmQz8nTHxv8fbYMvKO
X-Received: by 2002:a05:6214:e4e:b0:70f:a142:afe8 with SMTP id
 6a1803df08f44-7393ec1652emr110125906d6.32.1757427254549; 
 Tue, 09 Sep 2025 07:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5HnvrIRYNjzKE2Adpf1VS+N1fWbBiiFfd+dgTBaSg1PUDf5W+niPtxk1dqQFL9lVco7WQ0g==
X-Received: by 2002:a05:6214:e4e:b0:70f:a142:afe8 with SMTP id
 6a1803df08f44-7393ec1652emr110125376d6.32.1757427253933; 
 Tue, 09 Sep 2025 07:14:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50b0e98sm39956381fa.60.2025.09.09.07.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:14:12 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:14:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 andy.yan@rock-chips.com, mordan@ispras.ru, linux@treblig.org,
 viro@zeniv.linux.org.uk, aradhya.bhatia@linux.dev, javierm@redhat.com,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, u-kumar1@ti.com,
 s-jain1@ti.com, lyude@redhat.com, luca.ceresoli@bootlin.com
Subject: Re: [PATCH v6 3/6] drm/bridge: cadence: cdns-mhdp8546-core: Set the
 mhdp connector earlier in atomic_enable()
Message-ID: <bnydasal33cfzwddq6djfjgfb6viavpfpkuks5j7mpmvihckui@o7jvkwmskcuf>
References: <20250909090824.1655537-1-h-shenoy@ti.com>
 <20250909090824.1655537-4-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909090824.1655537-4-h-shenoy@ti.com>
X-Proofpoint-ORIG-GUID: SpGpgI6Ew4HBgkijpU09EU6EylWCj7Qs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXzNaXRN4YCu7i
 kpCJfULlK8nToKW2SpjrkcFhoxWlZ59WR9OLVv/PoRO1Y6XAz2k1pN1yJrW94b6JRs+xcSYhIU9
 4OBF8H3qdCbrQe2umN4IE5KS6/toIXnJrJzfw4/97Na8ZEZmYG9IcCPRHvlX10UbrO/pbnSQFCE
 KuYP9lpVz6xf5IoQM6xH09OJaAJtjiTozxAzj272xQszxXg0jAFj5+/GMpoyFdVGiCEimBJxFk7
 P592K02OZgFL3vj9BbSDybXtH0F4cZvMnlp4CQeQB4Cy76p3gltOmdqhbs92euJnZHSi5sShHKP
 4lmoupsZiORPbUlJeVG8+cpu1IMKUU7sOL1hPCUlVT4E162uAhDFfcHOs9Rz5tnQJ0qqmE5lNXx
 7Ny+70h1
X-Proofpoint-GUID: SpGpgI6Ew4HBgkijpU09EU6EylWCj7Qs
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c03638 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sozttTNsAAAA:8 a=ATudFdEghz8k9U3f8PAA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

On Tue, Sep 09, 2025 at 02:38:21PM +0530, Harikrishna Shenoy wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> In case if we get errors in cdns_mhdp_link_up() or cdns_mhdp_reg_read()
> in atomic_enable, we will go to cdns_mhdp_modeset_retry_fn() and will hit
> NULL pointer while trying to access the mutex. We need the connector to
> be set before that. Unlike in legacy !(DBANC) cases, we do not have
> connector initialised in bridge_attach(). So set the mhdp->connector
> in atomic_enable() earlier to avoid possible NULL pointer.
> 
> Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

It looks like you should reorder your commits: first apply the DBANC
fixes, then drop support for !DBANC.


-- 
With best wishes
Dmitry
