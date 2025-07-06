Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CD9AFA4B7
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 13:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5DB10E118;
	Sun,  6 Jul 2025 11:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WT2PbVLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2408310E118
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 11:06:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5666PldJ011577
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Jul 2025 11:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eOhCEmF+uV+au2Gk6pPccqIbZaEi6QqNF6NnOQEKyi4=; b=WT2PbVLZDLLyMqzR
 CeaRMGUmrLHO7TB+C8NYp7uDBxngRbAynVqmv/NTZK9dEPYfP6GEeVM08neRAfZ1
 Lm+W2lAilqGoziTONOiJZvPU9dKnme4nFW/J2U5duRYPAU2Io/HNMim97618JsP3
 y29xMuBPfm7eXdhvadvN3sDjVBY00FEfz1DlKYFkJiQ1b7+QPJWhMtzpS3p0J9I1
 qZB/63J/tsKwhbTFl49ht+xR2cMsnZwMV1PN4wYN6366/d4s1QfJ5P76Leusl8cR
 JJtiC2xQ4MtDxSPOiTxop35jsKIFP3TdWmUwJkFVG/umr56i8ZxUdeDFHk936rbx
 GXBqFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk3em6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 11:06:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d44d773e23so576772385a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 04:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751799970; x=1752404770;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eOhCEmF+uV+au2Gk6pPccqIbZaEi6QqNF6NnOQEKyi4=;
 b=lce75ObevetbEoK8BCVcR+Gad5Lnl3LbxEEw11wU2ULyg4rE3VkMURgTtz8l1RyQGh
 thXI3sJfamBjaZ6BF6p/mceLLil/ygCKi5AY8n7F/B9CBDOjDabDJb+ui/phUugBuIXo
 ImDBk34cMNtnUsY8ScwyuP44w6El1K8oLD4YgPaurZtg5JEe/F0mqD79fjCHNsO6b1kg
 02g5TbOUT4Bs7YXi+vL/APz37R3Kv6iFsX8mEfQOYDs5Z8LtDApnj1ytvO5LDJ5hZztQ
 Y8ELJcXE7HSTT3apkfAafPM31YHjCXGJl10r/nw1UckN8485t64xrnn+yvmkNdoiVO/l
 Kuxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlApq7bzghe+tSURPN21I2AgtNRy9C3+lzdutWT92nCGlyz+832dqyOBVN5a3GepdNWod1GklqviE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxieLxMIXTCZxApo0Uvb6+3wmG8SU1jj6/PoksHza7xFAvaRHQx
 U7NKeD9olEaAvrxrJhRskC7r/tGDZ7gx3qBrWg8c/0GAL0RWYdwNO/4YKTggKMs6hbIZzyyQNWW
 QeelIRCiU6LHfn2DpYmk9C9SWf8aNL2lFedXIIoxkGMPbneUSs/dX7XRtLlMnUAx6sqlbkGV1vY
 lHXX2FAA==
X-Gm-Gg: ASbGncvAWZ5KUO27G+MxAfFDDbaAi5m5dAcvMdUv5DytOfXGuPHaPjDzB1EwSJ7LJQ4
 qAmWgdrxq1epIO+VGSPxVGMB8we48cl5U1GdRqRlooLzPysqWg0jNLG2kd4yiBIh75XnyzXWf1b
 IoJCRqw9F6wDNUWrbxgxt15yr8O6Drx6hN1SNw1OPa/t3giYYICMQLg60gR6KdNhaC5+fN4eDpj
 8hJbKa5jfEG15zkJ2TOVWdT4R2tv5kkjF12oNY6YP1wx5OyVMbMHCG7sxJfzbsIEuhePbDZOwTo
 r11VfhL027Al+ZmfHG8DcleaiSky0/j5Yzcl40gVy7WDAD2KIOA/egKe7prR9INlsRWHwkXsWzX
 7lW+zn2ZT+4Rgrgr+GqGcRocj3x3ShyVtyl8=
X-Received: by 2002:a05:620a:1aa7:b0:7d4:57a5:9742 with SMTP id
 af79cd13be357-7d5dcd0783amr1166925785a.39.1751799969901; 
 Sun, 06 Jul 2025 04:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGONDgnDnvrSDe6qvx2fU3hNgdKW6lnSf2axuoSi2pM1AUPmOnALDeg2BDGk/SgSQqBZddqxw==
X-Received: by 2002:a05:620a:1aa7:b0:7d4:57a5:9742 with SMTP id
 af79cd13be357-7d5dcd0783amr1166922685a.39.1751799969465; 
 Sun, 06 Jul 2025 04:06:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384d16c7sm918063e87.253.2025.07.06.04.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 04:06:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
In-Reply-To: <20250613122838.2082334-1-thierry.reding@gmail.com>
References: <20250613122838.2082334-1-thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/fbdev-client: Skip DRM clients if modesetting
 is absent
Message-Id: <175179996829.2704907.4823332673925452896.b4-ty@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 14:06:08 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2OSBTYWx0ZWRfX9qDJwFK+CiFr
 FlQH7UvUDLUp8Z/vOxWdWnANW2ArhCQR3RIB1sKzoN080t2ADCuabJvkfbsDrI21hyK4wa0GdDk
 CkL62BZwqBRuliW4ppkNw1jg2EREnno109KwZq0P9gH/0vGvwdYimWxzynnnw1NjwE9YihuJLbl
 ok26NW2GwGjCt/T+EME0g1Cr2PBxDy+jfbuIrVoVD0VcjGytO9KLWHUSXHj5cyLdpsvAk+XaphJ
 kYnBHjayf2Z1KD70LBblA/vxZkKo1Lt3ucwM955RDLaW8QewTL6SUBCIG792YK44ykKOTprMCsX
 JFpcER6dSWMZqVicxlZs8amCg/LWwQqXm0Jp6ujOSusGOupWlPQDCFzHuzOIDsi77Zjixc9V9Cr
 M9i70cWoiCV2acNszseqOq9Xg0veM75lo5VFSewInNntlOOpMf3C1LfCepRZ62vLNLF6jPPy
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686a58a3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=qTWL-RXyTIDn97wEdt8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: opasRVl7YHPfkjELV1vcSKXu4doTkxo9
X-Proofpoint-GUID: opasRVl7YHPfkjELV1vcSKXu4doTkxo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060069
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

On Fri, 13 Jun 2025 14:28:38 +0200, Thierry Reding wrote:
> Recent generations of Tegra have moved the display components outside of
> host1x, leading to a device that has no CRTCs attached and hence doesn't
> support any of the modesetting functionality. When this is detected, the
> driver clears the DRIVER_MODESET and DRIVER_ATOMIC flags for the device.
> 
> Unfortunately, this causes the following errors during boot:
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/fbdev-client: Skip DRM clients if modesetting is absent
      commit: cce91f29c088ba902dd2abfc9c3216ba9a2fb2fe

Best regards,
-- 
With best wishes
Dmitry


