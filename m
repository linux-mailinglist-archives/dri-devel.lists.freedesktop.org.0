Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952EDB2F595
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 12:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A37410E925;
	Thu, 21 Aug 2025 10:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvIOL4X+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B0410E925
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:46:59 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b7nb027007
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PbeAkF9lKsJH/3PwbzKREqKnFWKzw18FGY4jC2/s3Xk=; b=TvIOL4X+mzB2gk/t
 ElgOJe1OlODT6w6gJwoKK8s8QnHxjYZc3F8uxWFbELvMOHYMqkTlxf0novdKLncb
 UvBYIYghcFSq5JnPBrWGziUllfoF47zeOD9hZcr170rYNLbYk0sydsEvYQkMls7I
 ujITzUExS7xGKi4dhmRVUGHVkZ3I3LvyKcKLlNzjn+3YVUo0jLCyqV3S7rZX9VEh
 qJH1+G4j1EIAaYWOM1mYtMRwvdbV92a1PoGWqEOoQaanb9xWxc5SslMLFrda/el8
 CtOdVHqOwBcOR9dUNrkc/R9qppV8lQCiO01rSYS4jTP75yROPhKIcwIgaF+G2Va8
 OBo0Jw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528w3ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:46:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9289280dso19082726d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755773218; x=1756378018;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PbeAkF9lKsJH/3PwbzKREqKnFWKzw18FGY4jC2/s3Xk=;
 b=h+HUufXFv0lMEUngcWSysyB2Wtc9kXChHFW5TFRQQxou0ZBiqpkkYwQJstipX6lvUI
 chkItnuQwrbJuM+AVabKHIrauFG4FuC/7L/ax3MmDZKiqYXzEEKVt5clh2RkReK4W8bJ
 VFL7NXmt8cpDph/ecDp3zI2kBqW6gKMego6Z783wqFspBJivdFGT4+s79YB0cnnLHZny
 GNZx+K0uSvNVu4Iw649eFUWIVHxuTSN2DTguAqTo/0VbsADlm2VUI8CxcrVaxj5yy4qX
 QRfkaqpltTRKJA7dzZo0FGlEbGpwlQ1vsIMakWfu8o+lVotXpFEY/pXHm/mELJ7SSjrq
 j8vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW11Sbj4AIkqTjYvTISL9wlX+eL0KIcFylZ2+mofAEyg0CMuSVC70MaCHrPU+tpo+mqufRwJU86qB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqA0IgUUhNVqgphQCaU1UKHPj/2GUCxDH269y3p9taYeiPj6lD
 IxWhaYt2ZtnAY0+uxjOSEHZb45w6cc0LNffgkFqYnf46CX6M81NIhbrMZdwvk23oiURpyk951Aa
 NnK464Zf7pKGLBhF/yhcRHCQGoqYKNcf3k5dgKtCJ3NLz2xDUXZkQHC7W8V97UFqHGc+peTM=
X-Gm-Gg: ASbGncsp4zEj0mWGep7qV98FacFcu7wFd58rxotMmpHRYl3tsIIIhCjZgx1bzIr3mmR
 WXjKgt8rTi88MMHmYYgVN5tB1qLe6r7gyR0pmX+16UvM1RGLGcwp5aK9DMQHDwJnhU5dXHEkPfX
 wkQZ7NrKMWXbu9254LaHHXyMI+Cl3qwNVwR4E8L5xp3C2dBF2IHYXyhubvTyN5XRIPt0VQS3Trj
 9WutZBGPcAJJBenRGJC76sV4cJXVxc9RFTMv3x9GYdkYhFWUHQs4tj3Sx4JTKPBhrDggq5bPLiD
 SNfTU+MlhlR36lDp5NoYGmUgkuDY6jANaTOdo0YuKM9/hmm5WO7jlw+93k64py0z8byl6gFcjPv
 qp5trDlcJSpw1ahxvH5XFxy3rbfsyZTRSZYQSQAKhzLgtX9ntGAjQ
X-Received: by 2002:ad4:5d66:0:b0:709:b92d:e84 with SMTP id
 6a1803df08f44-70d88e7ceddmr19991056d6.16.1755773217885; 
 Thu, 21 Aug 2025 03:46:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPCh8MTppXOux5rMJyRB2XP2aYfSeODTQkbnpzCGbsdnnzgmSsU7ZBWn1Dz+HjgvczWm/5uA==
X-Received: by 2002:ad4:5d66:0:b0:709:b92d:e84 with SMTP id
 6a1803df08f44-70d88e7ceddmr19990796d6.16.1755773217301; 
 Thu, 21 Aug 2025 03:46:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef434334sm2999872e87.149.2025.08.21.03.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 03:46:56 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:46:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harikrishna Shenoy <a0512644@ti.com>
Cc: "Raghavendra, Vignesh" <vigneshr@ti.com>,
 Harikrishna Shenoy <h-shenoy@ti.com>, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nm@ti.com, kristo@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, s-jain1@ti.com, devarsht@ti.com,
 u-kumar1@ti.com
Subject: Re: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel:
 panel-simple.yaml: Add Raspberry pi dsi panel compatible
Message-ID: <k5llnrrvc72stluvlbvzireqn6jq3h6dan7valuim4rty77mfg@gfv7drdyms2q>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-2-h-shenoy@ti.com>
 <td7d5mldzdunb4sxs5rxa4tfnvvpolcmpwurcv5ubn47whnqek@azedwe6h3y5r>
 <8a31d1c5-4233-4696-bf8c-58f5db68d41f@ti.com>
 <fe6f848e-d7bf-477d-bad0-0c8a860f3ae6@ti.com>
 <c1edadf5-538c-43f6-aea4-8fa9f9c5aa13@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1edadf5-538c-43f6-aea4-8fa9f9c5aa13@ti.com>
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a6f922 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=RF00TdSWAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=Ne0C-CsPbgjNxdNBSCgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=_nx8FpPT0le-2JWwMI5O:22
X-Proofpoint-GUID: 524DAXgKl8hgtNezbfnqLgkTbUl_9V7m
X-Proofpoint-ORIG-GUID: 524DAXgKl8hgtNezbfnqLgkTbUl_9V7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX45+qjcaaB2Ms
 pSRXMQJYY4rDEEZpCJJo87YiFk1tW7GdccswZL2wrkJUJtGbt+lo8PEVFXUe4C8sGDIwBTrKwIE
 5BVo24YEIcev00wS0nDJZCL4+qDj2s+5rBqH8d6ljV6N2xTpUj7FDQizD8SSAMCSfHRFW6kxpkk
 GUfTgD0FAtmqpGJ0yb5X2pe2CmIajroZ/lH7XsyMRB59AeFJsLjDN4z/P9OwCAeb/PhTxYuXNPm
 v3Ho/MyBxk9r7HwLzMaSPCMYs7tsId0S3r2xqNWcKVcsdS+deqCi/ABy9C72mWLvwbKCpRl6kFL
 OIBIcHpjAOAqRDPfT27GdllGqREshNmoQa3oN0d1h1nG0+2qEnzd4aU5hfeMu7kZeO1QmLwHiKM
 LS0hqWDHV6KVICwQl4AAjPQgqEdlqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Thu, Aug 21, 2025 at 10:33:43AM +0530, Harikrishna Shenoy wrote:
> 
> On 8/20/25 15:34, Raghavendra, Vignesh wrote:
> > 
> > On 8/20/2025 11:06 AM, Harikrishna Shenoy wrote:
> > > On 8/19/25 06:54, Dmitry Baryshkov wrote:
> > > > On Mon, Aug 18, 2025 at 09:17:44PM +0530, Harikrishna Shenoy wrote:
> > > > > Add RPi DSI panel[0] as a valid compatible for simple-panel.
> > > > > 
> > > > > [0]:https://www.raspberrypi.com/products/raspberry-pi-touch-display/
> > > > > 
> > > > > Signed-off-by: Harikrishna Shenoy<h-shenoy@ti.com>
> > > > > ---
> > > > >    .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
> > > > >    1 file changed, 2 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-
> > > > > simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-
> > > > > simple.yaml
> > > > > index 1ac1f0219079..65f486f2bc9d 100644
> > > > > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > > > > @@ -268,6 +268,8 @@ properties:
> > > > >          - rocktech,rk070er9427
> > > > >            # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
> > > > >          - rocktech,rk043fn48h
> > > > > +        # Raspberry, 7" dsi panel
> > > > > +      - rpi,7inch-dsi
> > > > It's powertip,ph800480t013-idf02
> > > Could you please point to any documentation for this?
> > Git log would point you to it:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=051e95ee7ec10050154e4c8f48be4d99ac83f8fc
> 
> Timing patterns we use differ from powertip,ph800480t013-idf02.
> 
> Link:
> 
> https://github.com/raspberrypi/linux/commit/8648a8c9442b45e85b73423be1b469d10234b4e2
> 
> https://github.com/beagleboard/linux/commit/bde1b4c52cc5a79a2108076b8706e23d5844afa9
> 
> So I think, separate compatible needs to be added.

Then please identify the panel that is actually being used. RaspberryPi
isn't a panel vendor.

> 
> > > > >            # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
> > > > >          - samsung,ltl101al01
> > > > >            # Samsung Electronics 10.1" WSVGA TFT LCD panel
> > > > > -- 
> > > > > 2.34.1
> > > > > 

-- 
With best wishes
Dmitry
