Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D82CE97DA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 12:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B4510E218;
	Tue, 30 Dec 2025 11:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLzKyOg4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJUpzoTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819C810E218
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:36 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU944Wn2551807
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=uXOb6/A5UVi
 94XYfCLNblq+Mqdl95+smoRAtSR12Qsc=; b=nLzKyOg4PiyG2B1JCNk3PVrbwLP
 OsWjO2chMmmxsV4Hk/qNTO3EL1PW7WPYUAGr1SlIZRuBSAA02SCbqs7sxBot62g3
 na/gZ/Un+7qSOBP/0LASmN7tTWShrV6g0UrjCCZDxFEK+ter41AlnyEt5gR/e8LZ
 DC6/cMQA3HpHJgEjjbogb30bRrN+lMOh/vh7IXq34Srpn37AxBcgGH4M2cO+21kY
 GvxK2EfkBYNkxkwWGEFjUBxZUztjHso3CvchhzSM5g4jPW3sxfdIud4Iuys/i5yN
 el0Onvgj6SKVwxM/TygjBDwFoTiSeetjpINpfu1Z7tTzMNOwmm4/ylZc8oA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skhmnf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7ba92341f38so10864621b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 03:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767092554; x=1767697354;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uXOb6/A5UVi94XYfCLNblq+Mqdl95+smoRAtSR12Qsc=;
 b=OJUpzoTSeeMN5/ZgVmPKtDuWOrrChyeJ516dpi35IDuiGQOJJ2z+hMi4hZRqhgrcfP
 /KsAAkaYQJlaSYi30NFRZ7+uuGyMXa9CeJOsE71fV1Xd9dr9R85cMT7S44HGFO6z/yvG
 1Di9X8N+sJXZ9O1gN6/8s2vlistinO+/dX9S2Jbii13ODofm80VJu8SE19+HGp5zC9HH
 mz/HsKBaAOWhSOtA/oUcPNHvJ1wPuDgpk6lxN01NgZVP1eDbu2Jzy/hPF+JBQtFoCHpg
 6XKL1YjO9bfvAZvuM1KkAWerpjGr/YaACdBP6Ss5AHXzDK7KySrnmX+tkAGjjqUa0nG1
 umbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767092554; x=1767697354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uXOb6/A5UVi94XYfCLNblq+Mqdl95+smoRAtSR12Qsc=;
 b=eWjx+KdksW3NjumutTkJsagrx56CGiRKa2fxoipudZbGsnbb5Y7QqLCOZNtN8HZSGs
 7CfrffPT5ecFPWNV7uPYOSTMDvhNPg3tYOaVuHXRqJk5RdWSQJYZHImuwh11qUpNQ94o
 UEKobUI2JZNSYo4ggyWb7RcZCv1tfvkPCoAyRvtC7oD0BUZEi5hTAkQrO2UXO+ixy2tw
 k+EyoSOZjYxtGL6Bt63NtGlChtg93LxowbtvosfvsuwXAanXoknbii9otao+nqfXL8HA
 niYAWKc5oS+gOC4ZbLXrArXcMKbUy3Ku/81f5rebv4bfAeyPOnXwPmRgkOX6KHVeAdKw
 TeFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg4Teb4sL3puX51zDNbemWba0SNLFZoUjqvsO6PWvChkOgjJUEJ1xhJXrsnxmviOm8PKfRBtknGZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEvBhw1IV1gbjuQMbdb2pdYMy1Mnpj8ZyFKTIzzlqgCJqE98Xw
 GgNsW3fkNmihAJghEiwqZgPHG2FBs5vmz5BELIAex2lJmi8Yw+mPJ2dUu4fhGvDjWS+lpsh3Uq4
 K5KfYTIcJQGMjKnntlxQbv6e2vqSW0gODP6GDFAFoTiK5gb3l9qWXg9LCRx4jDJP6Hh0NqOI=
X-Gm-Gg: AY/fxX44kxNf9ErH8t5g1ONIkYi8ysEubajqDkbqaIEw+WxyFUbPYYxEd9YKgkZg0bd
 OOF7Whs+620ij3BFqu+hJgIrZaOuiVRspRL+nZBeGVcq5WWwqkAtoCF5rdNJEzo+sAqyiptFQDH
 U/5ps3EgRBFtff1NtAsA9/Gp7Sphn4o4dkUxLG/ZeLKx79ZXrO3DPd72Oja0f0GoQb8klT2xp+A
 +o5mp/9/VghM8tiwH3iC+K3iB6blbyeEZYmBL5o0+FLZpugwBlUfEgSfUIYeu3ijgsrTFTgr1vJ
 QBvtPj9NBoY9H0H2L6oGhMNLQ3dpmocAiiOomLO8Eye9siIqCZV23ZjUO9vaFwgLsLGZFt55hh4
 2YK9hHYSR5wRdUL72xlwtWHL+6d7LIsLxCv74iDdmxw==
X-Received: by 2002:a05:6a21:6d9a:b0:35d:2172:5ffb with SMTP id
 adf61e73a8af0-376a94b9f40mr33065462637.47.1767092554356; 
 Tue, 30 Dec 2025 03:02:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmzcXCgCAF/KfhFTejp806J8JhYinHBklMJhbJpOqY8ALnUh2jYcR9CnXOC5f6eAcCigeiOA==
X-Received: by 2002:a05:6a21:6d9a:b0:35d:2172:5ffb with SMTP id
 adf61e73a8af0-376a94b9f40mr33065431637.47.1767092553805; 
 Tue, 30 Dec 2025 03:02:33 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c3a4deb6f17sm2556908a12.22.2025.12.30.03.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 03:02:33 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v3 1/3] misc: fastrpc: Sanitize address logging and remove tabs
Date: Tue, 30 Dec 2025 16:32:23 +0530
Message-Id: <20251230110225.3655707-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA5OSBTYWx0ZWRfXwqZuc0vS3sUx
 6ZUGMgXaQ9hdlouIgp6x52mt0MnVdiGp1H5aptSGfHdPsFIpXZAH85mS57s81Wn4ze7uVNMC4zp
 UFrW8AdqJc58P3kmYOTZ3DLsYZpIbYtvE/X9gDZprDSf+TI/KH2QtdnQ9nidKsGViq+pyDFb/Ys
 Utg7oFn7mPS1KLf88E/sBfAG8SY7wq2mG/0QeDGbaYu9GuSF1JYFfU/9Gs3UO1csi73u/VHTmnc
 VJWc89E7Ihn6QI0340w4jL6EfWVDYQHuDv8ak0XxazeinLYjykKTFut+BSlz+XHl/wY+2FRKXJA
 YQxkseMWt/24cmHlsXtAo+Obn66XynQryhJyNwl6sQHEgFLq5VV6jfkP/QHcLFceFaGevH1eHEE
 feyWTwu/mKB9yvx9i2JOtob7YFJUgBh1v/t5WMozN15JodNMt0gSQv8fUD6dE6QOETGrHPMItia
 kNaOkWGXXj3grNVKk9g==
X-Proofpoint-ORIG-GUID: fFUMs6TMz5EGWpZgNPhtwyy6D_N-e2Ae
X-Proofpoint-GUID: fFUMs6TMz5EGWpZgNPhtwyy6D_N-e2Ae
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=6953b14b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TXGx01ld9870rz7a8QIA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300099
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

Avoid printing raw addresses in driver logs by using %p for remote
buffer addresses. This reduces the risk of information leaks and
conforms to kernel logging guidelines. Remove tabs in dev_*
messages.

Fixes: 2419e55e532d ("misc: fastrpc: add mmap/unmap support")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..408fe47e9db7 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1830,13 +1830,13 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
 				      &args[0]);
 	if (!err) {
-		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
+		dev_dbg(dev, "unmap OK: raddr=%p\n", (void *)(unsigned long)buf->raddr);
 		spin_lock(&fl->lock);
 		list_del(&buf->node);
 		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
-		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
+		dev_err(dev, "unmap error: raddr=%p\n", (void *)(unsigned long)buf->raddr);
 	}
 
 	return err;
@@ -1861,8 +1861,8 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	spin_unlock(&fl->lock);
 
 	if (!buf) {
-		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
-			req.vaddrout, req.size);
+		dev_err(dev, "buffer not found: addr=%p [len=0x%08llx]\n",
+			(void *)(unsigned long)req.vaddrout, req.size);
 		return -EINVAL;
 	}
 
@@ -1959,8 +1959,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		goto err_assign;
 	}
 
-	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
-		buf->raddr, buf->size);
+	dev_dbg(dev, "mmap OK: raddr=%p [len=0x%08llx]\n",
+		(void *)(unsigned long)buf->raddr, buf->size);
 
 	return 0;
 
@@ -2006,7 +2006,8 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
 				      &args[0]);
 	if (err) {
-		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
+		dev_err(dev, "unmap error: fd=%d, raddr=%p\n",
+			map->fd, (void *)(unsigned long)map->raddr);
 		return err;
 	}
 	fastrpc_map_put(map);
@@ -2074,8 +2075,8 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, &args[0]);
 	if (err) {
-		dev_err(dev, "mem mmap error, fd %d, vaddr %llx, size %lld\n",
-			req.fd, req.vaddrin, map->len);
+		dev_err(dev, "mem mmap error: fd=%d, vaddrin=%p, size=%lld\n",
+			req.fd, (void *)(unsigned long)req.vaddrin, map->len);
 		goto err_invoke;
 	}
 
-- 
2.34.1

