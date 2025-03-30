Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA14A75BB8
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 20:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB0910E348;
	Sun, 30 Mar 2025 18:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdW1dZ5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D9C10E348
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:11:40 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UAUHSB030043
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IHCLsgwndVdO8FLjUW7q+Y9fKZsm0ip45s3E7IUNxT4=; b=cdW1dZ5K6G4WJfKY
 g+biGwAiaa45bJa6blyuVjEiRog9cUpM65BRHaKfsxieDig4/oN278cIgx6gAJQS
 4PWyy3MINHTorcUFGcifur9ZkEkMTwDfHodlNF7JZJVnJNOYM60pzp6Wu2bpV8vd
 EZoK/mydvs4GIBvOG4XHJeyDq2f9JqxgV6XL3/TTCiQEL2SXWVKXyPYAcz///eZ+
 CpDx0gQdih0iFmuSyVINrl2kKKMr8orpY0cgcvDn3iOeNGCBX+P/OnnL7cDcy3qs
 YYrG+xoMiFmO7NohJlHJSLTi2BWF70XIsNT79lzJGYU1p7keSQkNhM2v0SGw2NWU
 Y+H3gw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7v8aqre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:11:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5c77aff55so914125085a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743358299; x=1743963099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IHCLsgwndVdO8FLjUW7q+Y9fKZsm0ip45s3E7IUNxT4=;
 b=X28LzbL9X1uTZp04nhIw8MGyUL/dxmLxPSiUbWEkwPbZNqPIU4cIsBINMfA7jiSUs5
 LVldPmMaI8WB7RzqrEjEB2W4BlxyRhrXJaR8QY4y7XUF5nXqgmzJjdBe6h9yAYPPhfZo
 FbySZoYs8LV28/TMNhzA2YQ2RCc5pxbHUASpnHncvYb/ZI82LuhVp8jmPQOG3Du4JXju
 7veJGJ6QOlEwnenpiQLCtJubEF0I3flnfQX0SCSew31Oyer+zrrPXEIR5J/TW3PiopK7
 4bvWb6/KtZ0DydD0H17Va/+HjCohTCfC8Hgc7b8NviZygabch8D/4Hsl18QM47/oPVZl
 NqMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr/AbLb2evyEtQdutVIBRGG4mAlLgVYd8PpK3NxYGTohzyIw86/3L5jekjnYRTIVbXawO7rOabf38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBLM07YjLChMQocMulkiB3Nixlx4aGQvOuUjo5Uxv2texdmGba
 2Rx2bHduJz3xPQRTpZFnE26Ne414UsCGYx8lN4M50VHD9/IIq3Qcj6bkHf2eHRhuLDbvkmorWe5
 5ioLHneIXDjJOw3XZ4oERUCYlLq+4uWDSyDlp1BJpdBmJLjmpt7hsNlZg2E147bnIA4I=
X-Gm-Gg: ASbGncva1AkIQg3OcC1SQthmDZxz0bDDHq6/hux90oTQfD2RTG2qLiLwH+xpoq7/n1n
 5lHtiS8gVivtrMCNHS09dwFbPQYyA6KJUzXQPhui/Hbh0eBweglDVGh5yZ7a7uS3DqJQThRXrNN
 SO2aQxaacVxA32/v3t409VEwIJKYSQShEGqLp7KZQFrBVDU7+30k4yCiRDni0XtXmdSt9I3nC/+
 RDkFRe1tg9Xwc9CJ4+eeEwfQG1qboKePG8qHdIhQAe3MBh67WtIybfpnCSy5y6zl6+WrFXajkcn
 KH+8dAirMIfZ1IhP+8mR0oNOF5fucqKbEoviU8KUJGly2K5HhhrUeJkJGMvvFfDunBs=
X-Received: by 2002:a05:620a:240d:b0:7c5:47c6:b888 with SMTP id
 af79cd13be357-7c690875554mr1077466785a.40.1743358299214; 
 Sun, 30 Mar 2025 11:11:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCxKgPTocdwQ0XAErOu8+9sjdwXmOoRIq6BagPPCMyfRgTINzYG2F09NWNBN2nPg7Q11HjYA==
X-Received: by 2002:a05:620a:240d:b0:7c5:47c6:b888 with SMTP id
 af79cd13be357-7c690875554mr1077461685a.40.1743358298784; 
 Sun, 30 Mar 2025 11:11:38 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2aa9c56sm11478831fa.4.2025.03.30.11.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 11:11:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, megi@xff.cz, javierm@redhat.com,
 Tejas Vipin <tejasvipin76@gmail.com>
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com
Subject: Re: [PATCH v2] drm/panel: himax-hx8394: transition to mipi_dsi
 wrapped functions
Date: Sun, 30 Mar 2025 21:11:30 +0300
Message-ID: <174335828698.2569365.403291486244545977.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250325094707.961349-1-tejasvipin76@gmail.com>
References: <20250325094707.961349-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3AzebFrPHjC8P6TUB165DkAeOpwKGf1X
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=67e9895b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=XaNsSy3_rJ97ry3LfhwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 3AzebFrPHjC8P6TUB165DkAeOpwKGf1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300127
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

On Tue, 25 Mar 2025 15:17:07 +0530, Tejas Vipin wrote:
> Changes the himax-hx8394 panel to use multi style functions for
> improved error handling.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/panel: himax-hx8394: transition to mipi_dsi wrapped functions
      commit: 4658f363fe67065d968bb9f6cbf611523846f27c

Best regards,
-- 
With best wishes
Dmitry

