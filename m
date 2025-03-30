Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678AFA75B51
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B238910E0E5;
	Sun, 30 Mar 2025 17:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4ZMEK63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7B110E0E5
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:14:44 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDpiDs026339
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5i3eDoRwfxAXyOJNfAoWRrpjX5DTKwyAl2h3Ll2a+Ck=; b=n4ZMEK63TxeG6m9O
 ItDJchUK4hSWpjPBrvdt06ROOOq+vnSD9gFiYAA5gN2R1uPAofD0G8ZUITuDcKlv
 3CCJkytVNn3z3KiMXmLU21Kc1/lfREtaEWvphgWtRjCIt3wOg7zdQvLSTFn8P6pg
 rZOYKhces30KsuyImsNeDT2ibbTwNtdKG6bEm3Z4+SycRBd5iqCkq4lcH52fVhp5
 wSZ9Nu9vHfTVl0homIOtuTJl84pHNDCZu/XG3cR4T9LdyPAtHXfuLlFyND06ovON
 rlEufN7nf3V/gKWkTAvtEfdywzMUKHzqewm6tbIy5zbWRqv7uQX+UCXyCLeo3smN
 ToEiUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvam3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:14:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c0b0cf53f3so584643185a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743354881; x=1743959681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5i3eDoRwfxAXyOJNfAoWRrpjX5DTKwyAl2h3Ll2a+Ck=;
 b=rmXmJQVuou1ZjeUaVs82anerejUjugUuqo1NBHhFZspRAGl9XvjqpmEMrQhlzkYYHs
 5DCWtgm164SYW/S+3yo/CR41Zt5PLvRXPkBkZl5xEH5dLzfnK8/lBSNNsNxJVSKPrGG5
 ldM0zJSmGBZqtYXA1Uicv4UG2EG+8KMNQQxt4hGGT4Tn89e/7oLoffBejR/K13o+6rRJ
 D8v7AnaqtSFPm3FxGNE3s1TYgwTSO1rNz83/Xp49RB+OVRcuATu1QoYDfU5n4fXKjL+8
 Il9cWkF6V0Ot8+dfqldVALp5jjnVfWCMl/mCHJUeuUxyYp+zpqAcqX4nXi+6mcUSXa1c
 zg8g==
X-Gm-Message-State: AOJu0YzoLEfkI4dxU3ZQ5i2uD9sL2nY202gwcBrEZzYQG7fM6sQZ+zVR
 J63CArQKnB8lsrf1ZvxR6THHSdPL4gIeD4okYrEOtreFbEU4OhZRke5M4y4bdfM8nTMrbMO/e0M
 einNOgrh27qsuW2VB0kh9vq/kFAupw9u6mxB3v/TWCEe0CZYo0xZKeKTn92YpXWhfW7Q=
X-Gm-Gg: ASbGncuZmb7Y7xTe+9Bh7ivtUADqInb3WkyiWig2CFDmRjzbh0g5jT4VLRafRs3/rNG
 ylOxgFkERyIjoHwoG338OtgNpiPv/5dsR5t3IoE4ODIRxhe/ZHslDy7jGx+X8pXY2Hpnt10b2Ze
 6cMJztD7KO3Utxdyym1h4o3Rxk2Op2gyRqe9gQyOV0JQKqmoLepGLnD2Q3b1HiZhuSI1/m8G8Py
 fLMCDTtHHug/zuGbVY7qbUbT+3BS/6cD8NTCKHVoq4QZmwL/B3xHbqc2KHZUcrPLLbS7FEKo9T8
 EbvF5u5/UdkaMz6aabE1FAu+HJSMPggkRbpoEDbEC+s+GreQsy7xllnUMlhKTgQ8Y4s=
X-Received: by 2002:a05:620a:4103:b0:7c5:467f:d130 with SMTP id
 af79cd13be357-7c69087cf02mr1038534185a.36.1743354881384; 
 Sun, 30 Mar 2025 10:14:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6ouIKg8DzyniG2QRhNtOGX2OqcIrcPRuppMODsS9RbSuUxUY5ZbhZt97wTj9QrUTaz/fM/w==
X-Received: by 2002:a05:620a:4103:b0:7c5:467f:d130 with SMTP id
 af79cd13be357-7c69087cf02mr1038530785a.36.1743354881076; 
 Sun, 30 Mar 2025 10:14:41 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2b4c82dsm11838891fa.72.2025.03.30.10.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 10:14:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Anusha Srivatsa <asrivats@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3] drm/panel/sharp-ls043t1le01: Use _multi variants
Date: Sun, 30 Mar 2025 20:14:35 +0300
Message-ID: <174335487030.2561144.6278208739964228205.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com>
References: <20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67e97c02 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=dR6xgOBWzFjIgz3fxCEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: gRQJrBwKJ2EFjQ02HIumpAb9lHMfOogB
X-Proofpoint-GUID: gRQJrBwKJ2EFjQ02HIumpAb9lHMfOogB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300120
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

On Wed, 26 Mar 2025 23:29:19 -0400, Anusha Srivatsa wrote:
> Move away from using deprecated API and use _multi variants
> if available. Use mipi_dsi_msleep() and mipi_dsi_usleep_range()
> instead of msleep() and usleep_range() respectively.
> 
> Used Coccinelle to find the _multi variant APIs,replacing
> mpi_dsi_msleep() where necessary and for returning
> dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()
> does not have a corresponding _multi() variant. Replacing it with
> mipi_dsi_dcs_write_seq_multi() instead. This change is manual.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/panel/sharp-ls043t1le01: Use _multi variants
      commit: 20e8219205145e1af3b98b6a0a3cc59568116a05

Best regards,
-- 
With best wishes
Dmitry

