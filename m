Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE2CCF696
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A5510EF16;
	Fri, 19 Dec 2025 10:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcfyx/aZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fm8AJAvT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F86410EF18
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJ4c1Um3990920
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=5WpkRzSjWUQP8YT/iPdEOd
 s5AwcizwNwKhZAwGdgqG4=; b=dcfyx/aZ0inFWrCsE+V0e48utFdMCeCYtOOeQf
 WZQDSjLYkXDgpGLx6WQMCjHZ3NtHsNZ8PyNNlG7pPnHSBrT3SBfcLvTF3/ETIhgN
 dmYBc2u6STU2XlOAhHhZS09V4+PFg1bYuFhXw85qzJ/KBSSTubZF0t3T3JSQcufd
 hEbKV79LhDrN6/Dm8uuLZ+xKdb68dQtWDnuW3lfFPVbrd1C2OQ67P1pSjdKPqPtn
 Yi9a5trHL4IDPS4XFUqfGXgXauhhMsCYOvdmDTZO/EwtvzTTEcq3o0YzNuHXiXq8
 Kau6A0FJFZwtX25IxbmSHueIhRoWWvbAB46Zk4HeRRjv0JJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2da9ha-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a3a4af701so36107206d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 02:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766140761; x=1766745561;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5WpkRzSjWUQP8YT/iPdEOds5AwcizwNwKhZAwGdgqG4=;
 b=fm8AJAvT2+xtudz0XJrKJV73bYWqAI0hxRl1UB8lkoZbNvHjjtIa+8/o9dQNctvgq6
 X3T6fRkntiLKLAkVMhspxs3ZuoaAnMozTMM8ALJGHloX26NBQ2JTeepFvR3eu8mBGiJI
 6mIxz4aka4mcJDETsYAeMnuIb7qa5RJ9COVB4vqkexAfFBv1EoVJUK7d8/Z5TSxzj7nq
 Oq2jxkKYTfaTuo9H81n/REa3BEWzudukD6pirveKijY20BdspXjj6YXVIkB0172xe9ST
 Z0x28SRMKMeXlFM8gUa9SZ7mKpooPMsgiRuzTLo3/vm+dBZefMFxRM3BN4DBuufNMhWl
 GMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766140761; x=1766745561;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5WpkRzSjWUQP8YT/iPdEOds5AwcizwNwKhZAwGdgqG4=;
 b=RQBPktDJ519RoAHyLLH/CnEWCnorB2v4RJIST4tpkP7AaC2PMpQiifuMdq6cimyZGF
 z6LxG+9D4fjb99nt7ROHz3tdjPT9XAbvIqnqY/VXCBVgNWmyXkXMnkVySjsudTkoIxCr
 E1w2nY3f5FyubndFvChZWMItXVFGOK3WgtSAgc1tvnN1ceA9B1/W9JouMfHhgjESUsE7
 0H9SUzBzWMf0Ok5ecusvQwElDLkaf6TS8BvLVgmCxwKWjLExiWOyKGc1aRI0029kuW4I
 D3xK60abnzPVbGmsn0iRyxbhNFha5vYdAuvqqtCMvf0sjTpVNHCkn1k23tOVXDKmIO5x
 YuYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNyNq1L9UdQQ+eZLgUW0tfb2Ft0EqVyTIRMGMbLJToaWQsKQlwExDKH+HYjy2cVS3cVCS2QrcTnew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhGSUcIKez8pSpi9WJRH7N7Fx7Tqsa1gUSaukvoK/RSiqcGCQy
 sPwkIHmDYqRGrLmOLUqhPNVOvnB9rUNDPAEJZ/yYd2fhFywLnJJU6MhPQmv5qc8kFAzgUf+R4eD
 yKIr9wFJaOQP/wQlB9VQ1JjWqnN8bAgSWS9tXAP5+5Fk6NF7RRFNvgB2PnRZzKqFq6dqm/fw=
X-Gm-Gg: AY/fxX4K+FScVTUt7yWKEg3Hd1HZ94uA7xpLJsZTK06SIq6gE8cmSzcTM6Gak9A7bTf
 71j0yLjlgIJTX+xp6yLvXiWrYT4Je/hDdKZIWHBXgyaNxMFA819BcVp+ZDxBg49tjfl76oBelo/
 ihqkk8frgNaZ7T/TyZrubCXY3IQ3x5GWR85q/F44ukAFBLtHXeCK4nDAxyGPRIgWq2WBFKx4ht2
 VDl7kDXLxrsLbU4mITOxJD9wzX+K//wbJMlfotYlxuOK6fq/S17cOh/5JHEa4uKkfWVr1hW6dsm
 gmvqYNyuSCAGSGTlp5Q4bTAzJQc6GRdBGga2rmkqMzHAGQduu1hlhbFlr5J/s6pX2/Annhb9y79
 8EESe3Py4J/2LUbI=
X-Received: by 2002:a05:622a:a07:b0:4f1:ca4f:d480 with SMTP id
 d75a77b69052e-4f4abd97f74mr34794701cf.45.1766140761293; 
 Fri, 19 Dec 2025 02:39:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG54uLQpoAtFj+oMXbNkbve+ZM6hf/DHjVt1IKUPcHqipmFzkeIxiVd9pxY+UmnT0HbF+zwrg==
X-Received: by 2002:a05:622a:a07:b0:4f1:ca4f:d480 with SMTP id
 d75a77b69052e-4f4abd97f74mr34794491cf.45.1766140760794; 
 Fri, 19 Dec 2025 02:39:20 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ad8577sm198142066b.24.2025.12.19.02.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 02:39:20 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/dpu: Revert broken parts of the quad pipe support
Date: Fri, 19 Dec 2025 12:39:00 +0200
Message-Id: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQrRWkC/yXNQQrCMBCF4auUWTtgQmuIVxEXTTPqKEnjTCNC6
 d2NuvwW738rKAmTwrFbQejFynNuMLsOptuYr4Qcm8Hu7WCs8RglYdKEsVRsA5IFn3WMWLgQBpk
 flNEF2/vh4LxxBK1UhC78/r2czn9rDXealm8atu0DxsdeW4cAAAA=
X-Change-ID: 20251219-drm-msm-dpu-revert-quad-pipe-broken-7b249567917e
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/u3nvXle1xbqy/IuGW/9vL0OVSJ020YRlDEhrJxnPis=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpRStOgv3n6bkgMr1ZmWnTrO6Ri2kbxqxejW06l
 ip8nZ7X4KeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUUrTgAKCRAbX0TJAJUV
 Vi5nEACtwbm0IopDWK5GIQKXH19r7MV9q7QjXyGuhaaElQy7myNtVLl4DD+JP9VY8KfRMQdDNxB
 N36gh5lsCDG+bNVKtJdJ2gANTEgJ3IhZxsuaNyQhj8iPLUONlxyS0ZEVm2kMzgL7Qew0mkxnFEF
 IdFKw74UFHJ6nRi5MvOiNkbeNZ2z2X/M5Oay5MuJ9n8bzTzaCqqcBiM374bvYVPTcjVv6QJVDB+
 yYnScHthLUmJio2uzCnTYfW490HE3UPeqGONcxHmZDZYXb/wgizy1idAJ4ktGtCVqMIcmDCQYL6
 X+BCZZWG5IhC3i775MdMYAMZL0WbrkVHSDGIlgcTcDzZ94sX2EOKV69ggBByj9qDx1Gf8aQVM+w
 c9yPPKS1MsYJomrebxP6V0ic6lJ0eaPaKzT03eAb7CZzmC4b04C0sZ//aP4h9u1520lGcdXnhxV
 sC031PQIRZhk7gjjKjVzQ3NXMkfv1VrYHPvvEAtT59LxUN3fCTZiXCGKWDdrCEd6zUvOzoDFgG+
 L/bsXrqduqxUVb8snRyL5NQOk0Vt8rIyZJnRRT/u0hdxyYaQ+Tpal0n5eYRhs3mMpHLGiLEnT98
 1FjAqGgwkiCnsRLqjvN6l2kI9B2HfiF6+UDnO1e3k6rmJkw2uhwHynUuCRrr2n6qeRmql3UHlgv
 BWr1/b1M5xj+zFw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=69452b5a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=C3Rb7UmAfwJbGrY5-NcA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NyBTYWx0ZWRfX7b9t7Aj/kcGC
 vD2QOo1zNEZg26Cw40zggHB8cYJeGAfXSncud5IsZKABYg8/UIBZFRnngjQb2V8pbr715UjI/Yu
 +5jhiAL7HFGzWD/TyY9NVs3Myp9DilszllU0Hcowl6nOGzmdIXsPKKgTtFyiHFOvr/YRIXwUrEU
 dJX/Qf5c1rMLWvNxn5GySjOtFPYe4DvDyAfEGGM0K121WdLqmy1gnyGF5xqHGMMXjLv6CR1f4FF
 /eR8YiMsfAQMFrc+CI4S76kC3OUjnfPmC9Et9t6OIce6j2/crPbf0LYCBmqRJSzMRn695YzkR3W
 /J0/HxN9Nz8txTYra9XzdjLuvGEzlWQarCouRicndVmFDYb9JRixJimVXXxmY83HdoULrxok4tp
 oz6WNksAOCizD3sbjJpqnqt2miw7YRgUZhx3F+8L5B1GOWOGN7A64aMRlstoYUocEf8K+8ojB8t
 RgurPOASgYVnJyuLNiA==
X-Proofpoint-GUID: OzKEP4rpRRauh02QkH9tK8j-Eusou3B2
X-Proofpoint-ORIG-GUID: OzKEP4rpRRauh02QkH9tK8j-Eusou3B2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190087
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

There are quite a few reports off-list that, at least on Hamoa based
devices, there are some IOMMU faults and some abnormal artifacts on eDP.
These have been traced to the quad pipe support introduced in 6.19-rc1.

Meanwhile, Marijn reported some issues in some dual-DSI dual-DSC scenario.

Off-list discussion concluded into reverting these two commits to avoid
the described issues.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      Revert "drm/msm/dpu: support plane splitting in quad-pipe case"
      Revert "drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case"

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  38 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  29 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 137 +++++++----------------
 7 files changed, 73 insertions(+), 145 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-drm-msm-dpu-revert-quad-pipe-broken-7b249567917e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

