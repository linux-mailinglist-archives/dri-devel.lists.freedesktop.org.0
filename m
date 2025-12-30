Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB1CE8C86
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 07:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BB910E0F2;
	Tue, 30 Dec 2025 06:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtSeVSJU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ravif2i3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4363C10E0F2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:28:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU3ijQl2548850
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=2gzL+morhvxfoUPSphDTxDkgMVT4wyQ3PbJ
 AvLEIUeo=; b=BtSeVSJUEZVh3f3YzULe3kqpDhPJ05pKoRvVunLKBOvlU8lOpmV
 NMr/o5open9lQz4N6cWuudpNyJiDQA0SNoONOughQEMmVLKBJqubT+NWuMWLj2lw
 oWN6ht0Q/mDcdekQqaNiFr9yAXwz1epHXu47egXb3q9+F2ejqNS6s/nPxBXTCuXr
 LsqxvTw/15cS8TgmVPrIjckomXXKRuYhP75OppTpLpAUhYX5r2BkLdzQz2wM3WXY
 a6bBhIY/cwWq1ah6JKqsy0MkLTBIzxgsZ5MZXHTjq4wUI8jemiSszutlvaG1js5z
 Vx7EVfSiE7DS+lZE7l7+prE26eJ76D0hWlQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7398a37-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:28:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a0dabc192eso226869105ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 22:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767076117; x=1767680917;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2gzL+morhvxfoUPSphDTxDkgMVT4wyQ3PbJAvLEIUeo=;
 b=Ravif2i3Pw3oUmU8iz3LK6GnnlB1oIOGK+P7i6py0/hwho4QszYCnUgcxTPzV3QUbw
 KQaKWUQ8I0yyalFDgwubHut1fRHQuZ0Yx9pnJpOOzaydnqTrnwZLFFTF5usb7aSL410u
 GYwvTFREKzyeiPHMuH5if8vtl7SoA4jnOeOzvJZSUDl1TZGqcL5uOsmMLNWEYXbar2S/
 YEFySCV1msosTus+fOeqkFSynBnQUfTO5Oe3JCZcRQm1yNvIl9Yd2q1bSgyz47KsYtxb
 nwZc/AwPCquX+6aNgeAyjDabV9HdLAuGAK05CYeUbYmJ4G6j8GIbC+zdNedg6/779foc
 0sCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767076117; x=1767680917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2gzL+morhvxfoUPSphDTxDkgMVT4wyQ3PbJAvLEIUeo=;
 b=vN9S6wzfvfV1fo6oc3MpFHKDZblMiJ9oLBYBQlfsQeJ8Sa6Gth0SEhatt7NRIDCDNo
 qKqZ+E8kgoNXj8YPNQMXi9abPBVS7BU0hsWXL1S0HA6uctBLW51/LOoiMaNOiKJGtD/D
 tCgnLe626c3dTXsDPcvBxaZIFCze3ZBaJY6TFHhc2BFPSbAY9HakmABB9E+UKUPmNDcx
 UqzjV0j0/1L1x1NOAZNr6wZkpuscCmambKzV6Sg6NHWFEoos7YeLvm28CgP7UypEcL9t
 24aa6yB/cws1OBV9+o3SjeToW7yC4eC4qH8mxGxhczResW3qMMuO8gsqWd297Dq25GL6
 zhRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1BOzknxSrZNK0IteheADFOlamufwR/fNmN1t9bITNxjApqMIgqD7JJ9EXuvETDm4CmvMws+78OB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrI1kj4GYZiknav5DMIra15/mmpF1mPv176+AGjkDY2cHyfKeD
 sNiyCG0VPO1BoO+fIhWJ7BtMaiuM4GfE9yLY77v/Xvg/uB8Lk4/ctRLVhjtzJma1aoSBFq2Sl0W
 ys3WqgzWfCWxSxbx5ht2jqfs1dYza/ydXJxRMMbBhif+PJKWx0odF+5Iiriuxc78Xh3KILRk=
X-Gm-Gg: AY/fxX6Q8sUifA/xtObCHktUPzI+CvvSY8NNxjdXN9+/ERKNkM+cMh8hnHjv1iRvemm
 7JarPDIrLVFkWeKJ5PMumxvyZOn3/15BkUpwSwU/SxLCtu15VPbu0IB9WLt2v/Ca8O0LHefin6C
 UQ7C5AIacpNRc11W2kcAHYQOHMDTKcBP9KKLixnY4WWG92wPdhmcQ1mv5Od4lT8dFjjNHkoecPY
 vne5/atXpwttfaG18LUYsfdDShSwL6PWHZSh1v2dN6bO+dy5H6CTJLWLu0GwxWv2Slj/wd7tTVh
 E5D31u8RpA9LWugKectwEaNJBkQXFkv2bnn7MgUAs4/9g41MZWqUABUrBD7W8gl4JSehORG5Wn1
 UjBucC6uRICaI1/ep0RQOnW7+sLQ3GFetIe4fytMBhQ==
X-Received: by 2002:a17:903:943:b0:2a0:a0cc:9994 with SMTP id
 d9443c01a7336-2a2f2833076mr359789095ad.47.1767076117084; 
 Mon, 29 Dec 2025 22:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKWoEDEpUIbuA4wOjGKtEu4bp/ZAZJLkcusU8f8d1u+B9Xfn8/4xtkSBgzZnIUtkExo2w0DA==
X-Received: by 2002:a17:903:943:b0:2a0:a0cc:9994 with SMTP id
 d9443c01a7336-2a2f2833076mr359788915ad.47.1767076116642; 
 Mon, 29 Dec 2025 22:28:36 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7961b4d0sm26491536a12.5.2025.12.29.22.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 22:28:36 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v5 0/4] misc: fastrpc: Add polling mode support
Date: Tue, 30 Dec 2025 11:58:27 +0530
Message-Id: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9XifKud2XwhCIb2xxWureRzhCENJvQiI
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=69537115 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=66tqkxcFYQ9a7oDX834A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1NyBTYWx0ZWRfX4cDrrlq4VQsR
 vVfoBdvvNPgLlLl418gJzfs1PLZoPArJXczW43QFgXl7gCve3OiwC9ZnA9qnVGQvhdFpwO0X960
 ktPLMIXV0UfWOZYUSvpBjZmI3G2ZmuP8KU5hFQh2lX/61ayWCZCMeym4eAy4AUm7pPWhSeK4cKC
 uRVwmAJ1L8uUWh+upPFDHOp+nuH5mZIKxz3BKmOjSnRGtbT7J9MzzMrZBFEvfL3HNjzETdIln98
 A6V9hyAAZbTyEoEdHPl9vm3E2XFk9S9IOnqMtYAAQ1gRmgrqwEEfG5hHk0QEuHsvQESqy+Diq+Y
 cMC8praL0EbWkD61hU22jmzieh3BCbHoTMJYB33lvCoAvDcSfWZoTTDvx6Xe2wtjHIg75OYl0Nq
 zO0Ditv8XobyopTWpkTvJ611pNjjHheL/+Ssd7NsGI6EUitsltYH6rGcONXKl91Pmhdgh+sGlHr
 31YWgx/0MyZ7fKP72Vw==
X-Proofpoint-ORIG-GUID: 9XifKud2XwhCIb2xxWureRzhCENJvQiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300057
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

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v4]: https://lore.kernel.org/all/20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com/

Changes in v5:
  - Add more details in commit text.

Changes in v4:
  - Replace hardcoded ctxid mask with GENMASK.
  - Fixed commit text.

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (4):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
  misc: fastrpc: Expand context ID mask for DSP polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 164 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |   9 ++
 2 files changed, 151 insertions(+), 22 deletions(-)

-- 
2.34.1

