Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51476BFE27A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 22:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E9710E03F;
	Wed, 22 Oct 2025 20:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RO6O/tXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338C210E03F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 20:25:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIetoH006818
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 20:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=8WTncnGza2Kn9sGuWGXDCvdR1E4ZhnjnCPB
 ZWVK2zTw=; b=RO6O/tXy6IjQ9bSKkDn0tGkt7+7Enp4sAIiHIMZZKfo0LeyVy3Q
 4SZR4AtSy3f6KWUqqOBQ3ZstAvxdNktQmy/dMFg1ikgG2Jgl4W9JlI6HDWoCPeBV
 /sa/rXdKkiDteaDUMzaZ9NStt8HwMaGqzucXFf8rIemn/BhVYWZ499jnWw+yc2Rv
 mEEXqnjz7jo+dept1BSBsVOwqO33uLa6hWHLXhFJRwl3lgIjk4v5yzl0n8T+sClh
 laWIANVbqlOM6PzZdlgbMPswcze+6gSoNc0NjiO5z4SqkSl4z0O8Bn7CuBiysSs5
 AtBoXHkIOfqG8OYpOUc7TOcGiRyOvYHKfeA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j5x3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 20:25:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e892f776d0so2671931cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761164729; x=1761769529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8WTncnGza2Kn9sGuWGXDCvdR1E4ZhnjnCPBZWVK2zTw=;
 b=SBG0gkli2FmRPvpmdYY5qvGb2M30kPhVBkg80lPVXkZKV1bit5LU61GZkCVB+N61Rq
 ZrZpq5yIqWZ3lop323TNRrx8mi0e3GE7OTn47JJAHSOOtWZNhtmFWJZa3NS8S8r1tm1A
 Q1X17vE9Yod94z4SbjbNM5w22WJJr3SeGFQBFH9/tGzqkw8V72f2awJpiyeW+Vx8Cxqu
 /AjHVGtK14317jrTqz8nKAPsCCjwz2J1YNC7YblNpp7S1jIiwfy7GpJUdN+12zeWs18B
 0zBPE07UWFWRuttFRqIYBnHsKPlidKqBHAehl0qvurSBDsEmgP2pkIIOxgHjFxaf5+hr
 uKGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnJNOIiADcY6WROabQ3JOh21j7FztjrFrdUzvRFaRg/bWDfNNesbPU7H8hc0xX7AHP5EgvGbXk000=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5gQJMkHZ98T/NXDYpxwfWq9F5Ti3EVnK1TIEd9qpLvWJnHHeN
 nT/ENIXAgnjH83xlZD/i10Z9WDhaG7Rcd0KREpqRYDWIuUDsHq/7zG0R3p0Ib5wmruZx3V9ixCF
 /pIFw5CdWZiIakW71WC4wDQZZ65B/B0HNjiXyo2tBcUGKr8crI9MW6XmJo65RfLxbWR1v/es=
X-Gm-Gg: ASbGncvz0D1T0peTsf5ur3xA0vY1MUFJo9o1l2b0mFMZduZa5ho8W2J4hZQzoNTPndW
 64H2QCCBnSJ5d55yhOObFOyx6RR+DEcu5AYt015YsltQJTWpn351/UYsHdQWzfQN0DopDSjKpUu
 XrgObVYDcIyhcr32A6goGB1h+pyLfrlM+IvEEZ6WcCN0jETOFLtJSQtI+JPRiSIsqVumo3tO9zC
 DWeLE9B77+XbSlkT7dzT1OoIxqjq7vICK8Jcuxx2LoD2gzdGENIvDNHer8LiTNRIToV2ccnCRV7
 MNexBB20h6NPozfHe5UC7jOCIbUIZhltoCPjLOGT8G7JyYIYTimRgimQMRZScoT+G23adK/MOiI
 MBfdTaMUEehx0ROCcLKgVmI/zY9flom5a9oF+Mqo=
X-Received: by 2002:ac8:5fd0:0:b0:4e8:86ea:9ef5 with SMTP id
 d75a77b69052e-4e89d1dd2f1mr289828481cf.12.1761164729277; 
 Wed, 22 Oct 2025 13:25:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9MXmiprMdwUKIxdLcE2lxIjNarD784+69rh18fxO6NZuqDYy+756Rfa7vCNVdOJRHSD8i3A==
X-Received: by 2002:ac8:5fd0:0:b0:4e8:86ea:9ef5 with SMTP id
 d75a77b69052e-4e89d1dd2f1mr289828161cf.12.1761164728853; 
 Wed, 22 Oct 2025 13:25:28 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d5141a207sm4998566b.52.2025.10.22.13.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 13:25:28 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] accel/qaic: Add Sub-system restart (SSR)
Date: Wed, 22 Oct 2025 22:25:24 +0200
Message-ID: <20251022202527.3873558-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX7wIxlXEcdUuM
 9Uce9rRFQZaopGrydQ9g8zoh4vvH7gE8dvPbQMQfIwCZkn363A6yrkuYydkxVTCGwEM9+F7HL+B
 V2KxFVA5eyob3SvijCo+yD8rZofkuOffbd781x4gixpqYYAk1vLF0NLouA8RLE366qaimbYAFZo
 NC5Zsnoqqf1+ygZMm5dOMf/Nk5L6TDq2dQTnis6EPMBxVBfc60P7e+Jv5cLfQZh0fh3IlnYccLC
 36Eoe7W8TyYKuqD8wYJO/rQ02HgZR3JrdhHMA7jonF56SzdLkypkk6RDIPHDxNpmNdt7LQVmuMT
 MxGCB1j2BYFl3UuFXu0dBJsj5ysehKmN+PiR96M1ZKVzmcvX2fiiCG2n6IpA+gW/LkvNkBFPF+v
 uvrJu76y3WLrOZIS5X0vwEj354PaUA==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f93dba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bJ9p3azHXPqUh9OXqB0A:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 2nWYZzifAvTL0Cr5kp5fG44TNAHGd916
X-Proofpoint-ORIG-GUID: 2nWYZzifAvTL0Cr5kp5fG44TNAHGd916
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

SSR is a feature that mitigates a crash in device sub-system. Usually,
after a workload (using a sub-system) has crashed on the device, the
entire device crashes affecting all the workloads on device.
SSR is used to limit the damage only to that particular workload and
releases the resources used by it, leaving the decision to the user.
Applications are informed when SSR starts and ends via udev notifications.
All ongoing requests for that particular workload will be lost.

During SSR the affected DBC changes state as follows:
DBC_STATE_BEFORE_SHUTDOWN
DBC_STATE_AFTER_SHUTDOWN
DBC_STATE_BEFORE_POWER_UP
DBC_STATE_AFTER_POWER_UP

In addition to supporting the sub-system to recover from a crash, the
device can optionally use SSR to send a crashdump.

Jeff Hugo (1):
  accel/qaic: Implement basic SSR handling

Pranjal Ramajor Asha Kanojiya (2):
  accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents
  accel/qaic: Collect crashdump from SSR channel

 Documentation/ABI/stable/sysfs-driver-qaic |  16 +
 Documentation/accel/qaic/aic100.rst        |  24 +-
 drivers/accel/qaic/Kconfig                 |   1 +
 drivers/accel/qaic/Makefile                |   2 +
 drivers/accel/qaic/qaic.h                  |  36 +
 drivers/accel/qaic/qaic_control.c          |   2 +
 drivers/accel/qaic/qaic_data.c             |  61 +-
 drivers/accel/qaic/qaic_drv.c              |  25 +
 drivers/accel/qaic/qaic_ssr.c              | 819 +++++++++++++++++++++
 drivers/accel/qaic/qaic_ssr.h              |  16 +
 drivers/accel/qaic/qaic_sysfs.c            | 109 +++
 11 files changed, 1102 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-qaic
 create mode 100644 drivers/accel/qaic/qaic_ssr.c
 create mode 100644 drivers/accel/qaic/qaic_ssr.h
 create mode 100644 drivers/accel/qaic/qaic_sysfs.c

-- 
2.43.0

