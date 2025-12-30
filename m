Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE1CE97E6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 12:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB2010E8B8;
	Tue, 30 Dec 2025 11:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPjnz7Gy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5fW/whb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4966A10E8B7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:43 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU0jgkU2672553
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=VYwQ/Hx44kd
 wcs759Yx8Gs08E+Q2dSlIoFnhLpXFKqU=; b=pPjnz7GygYTWoDKptwvj3aPNlKv
 I34MNm9IYPfIHWBK2zVtO8L/GpuxXjM5dP7vmLNFEnCeGzi1CvdpiFFhcbttQpBk
 K5L2biLIiclFdHxUBfsBmQvIAg7ErWGwH7vKiGA/wjVlwSXgPGBFCnf2dPfPYDQN
 LxBc07Vc8Aix8C5xBYrWRq/lARdQjng3XCDzUt4kchFcEBI7lPl5xjiS6f8qOp0c
 bwNHupfQWHdcFOZzzz3LL26vDnn1Juo77P9oMl2hj07C0B1vOUfgAlBOKYeYjfkZ
 Ruk30Lu9dNze0bjao1xuO4aXYBzKwYMsZltYLEFB12/pZrKWCUJDGiqTFIg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fcs84g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7d5564057d0so23545005b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 03:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767092561; x=1767697361;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VYwQ/Hx44kdwcs759Yx8Gs08E+Q2dSlIoFnhLpXFKqU=;
 b=j5fW/whbTn1N6/pjSwmlkPLKiJh/AkMC2LcHRWVigh6WSCDk6LEhbtxBiz3G11/e49
 9Yq19RxUn/IlNNiVB9r7iU1HxrzZOWtqX3ohn65FSuZRq4ECdmYCnxca6QP7kMYDryAQ
 xVKTTrsmrbK7ntHQbkt7vZKC/0DSjFMQ5VIDK2v5u2XcZLpW7R4tE6WF6RggdxDqjlqp
 7zd3HCX0g1D9ENbnWfoOvfK01S2Bu7ODMUIu3EgnTTs6vaiJ9TOeHHYEGH1cZhvCBoTa
 ZNjQjxNItwJU45OJgOFLFLUB7aUn057aUMtEwYdC0y70ACMeOixdPpP+1hu1yIEcyptF
 kbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767092561; x=1767697361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VYwQ/Hx44kdwcs759Yx8Gs08E+Q2dSlIoFnhLpXFKqU=;
 b=jEsyQzDB6G9b6JGHHAc/dedg78w/Tz3Bt1eJ2PMxBvVGaaZ448wUK4U/muEWt29S05
 5G+AkZUkFqoDujj4CRyoMsOm3v2mx54J/UFVygUrHC2hc+K2mk3l3ub9rc84nBVcFDJL
 n2eFLzR3byG9L4p5001r7ZzSBzZ7jgHrU27jbdSiismuDsMjZCUWoObPFGon1s6A+sAL
 VzKg7MqiysNZX5zMhrx4Ech6EAyy4yHyZ0jAQ/u//hoPXVLAdh9iaEuGa0iRnpE9+Qs9
 aJvJMpCHdN8PTUzoweLJEHJ8ChB7kUYzyddgvRAle8zOy+j9posKED1LfL4jon5UEt7H
 QUoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhgwWBQXJxZTB2zY+6zjeu84lH3zpAJ5uySEv3SsSvkJ9hNZASvOqiikW8B3IMan1NZchDwFeKypE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2Up32MswV/8zA3lJmE9aXcFYVfxn6qp3evCPrHY+ZDZXUn4rY
 5Wbld/5odfPLRXJ2N1oIWENzDiRBQVfZJDrpjmnQiC0uS7LRNM/Subc2mB2KdA1gSCyyfzqg+V5
 el6TKJ/cumXv8gmIGwobE7nnMNVQKpS2voLtZ0I/MPc54TZX+S0zfWIxOb/y2L/4fN7tfgL8=
X-Gm-Gg: AY/fxX7seGHDgzVQYuhYFuOvZX5xczetwAIlSmM71POvVQizzcvm/4vByurPtZiexo1
 edU/rihFD2esYB27QXEj+EPewMB1yVbfg/aGSxeAmyLeGlnvtisgZLhholh9rJ8mUnNqFuXhMvx
 mLHOUacDqnUJMVHF3pebPvyozhmuVR9pRcGjjucJgYkLUND3UtBH0NjY+iSLxtgI1PWksv8v1BB
 F8x3BB5UcAoViZHV0xd6X0AFBXQMLb2ZDyWL4fqKFlKuRFycEFCFCmgxz1frvVbp50mfXjDjUu0
 xZGRSvXGMiUFcDw2j165qLxs8rZM4x2FvHFUnEtCO6+gnFvPpFAQz6aN2b1Z3Yh4E4YR66ThW0b
 oWX3r2Kbymi35PunJXAMOwFLQc2F8PALpuIX+x9N7uA==
X-Received: by 2002:a05:6a20:3ca8:b0:33c:2154:d4f4 with SMTP id
 adf61e73a8af0-376aa500867mr30883648637.49.1767092560449; 
 Tue, 30 Dec 2025 03:02:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhhWXGKYIxwN0TmVgGtWsqgsEy8WyS+QDcMuCfhzukRTbnwE5KpXtMVJAEy0hB11Qi0NV12w==
X-Received: by 2002:a05:6a20:3ca8:b0:33c:2154:d4f4 with SMTP id
 adf61e73a8af0-376aa500867mr30883629637.49.1767092559966; 
 Tue, 30 Dec 2025 03:02:39 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c3a4deb6f17sm2556908a12.22.2025.12.30.03.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 03:02:39 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 3/3] misc: fastrpc: Support mapping userspace-allocated
 buffers
Date: Tue, 30 Dec 2025 16:32:25 +0530
Message-Id: <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IAGlsVHBQW08279AKdhFuEnw7_LiLQyX
X-Proofpoint-ORIG-GUID: IAGlsVHBQW08279AKdhFuEnw7_LiLQyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA5OSBTYWx0ZWRfX8rseQNjkQbMD
 0OXR5nmewROQNR3rMsJKdm7qfxmxNbOLMZZzQdaDKoTeIm5WkrK9Qt9bSCAgGpYSF9zR3k2wbC5
 R8Ek2qJOVG08VSaGALhC9l8G+AhdrCXdjew9EaL0a1wkSq1mA+wm8bSxczHCSPDcT0yASrLXab0
 /6h40FrV4F70QXK3QZzbpSvHRvpLsgPCQFQcHql+IeX+OAqhEYKppYIAlqYlivj/v+XaIlS3fbf
 hBTJS1w5j2vYrzJq8EWO5NKakYcSnHFY1nwgahHK+VlQ/miOJfnNUS/PA33grKwmU0NCuyzlZYL
 8/ZYPR53xqy4Ijbutld5nPUemAy4/8+gc7pjSQZNc18NtOd8KJA8ri3/VnvVcphR6raNIbVTGNf
 H818oxv0EIT92E9sINljvDP0i66FdfSKLaBy9xQfPj9o/wYdZjhv/Bx7vk5SEPO2pjkPIjZ8U2S
 I/pEQWvVAKlJgHKi4dw==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6953b152 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LDv6qzVS_9dTolnp15UA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
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

Currently, FastRPC only supports mapping buffers allocated by the
kernel. This limits flexibility for applications that allocate memory
in userspace using rpcmem or DMABUF and need to share it with the DSP.
Add support for mapping and unmapping userspace-allocated buffers to
the DSP through SMMU. This includes handling map requests for rpcmem
and DMABUF-backed memory and providing corresponding unmap
functionality.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 86 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 24064efe5dd8..b677e485bade 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1854,8 +1854,10 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_buf *buf = NULL, *iter, *b;
+	struct fastrpc_map *map = NULL, *iterm, *m;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1869,13 +1871,42 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	}
 	spin_unlock(&fl->lock);
 
-	if (!buf) {
-		dev_err(dev, "buffer not found: addr=%p [len=0x%08llx]\n",
+	if (buf) {
+		err = fastrpc_req_munmap_impl(fl, buf);
+		if (err) {
+			spin_lock(&fl->lock);
+			list_add_tail(&buf->node, &fl->mmaps);
+			spin_unlock(&fl->lock);
+		}
+		return err;
+	}
+
+	spin_lock(&fl->lock);
+	list_for_each_entry_safe(iterm, m, &fl->maps, node) {
+		if (iterm->raddr == req.vaddrout) {
+			map = iterm;
+			list_del(&iterm->node);
+			break;
+		}
+	}
+	spin_unlock(&fl->lock);
+	if (!map) {
+		dev_dbg(dev, "buffer/map not found addr=%p len=0x%08llx\n",
 			(void *)(unsigned long)req.vaddrout, req.size);
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+	if (err) {
+		dev_dbg(dev, "unmap error: fd=%d, raddr=%p\n",
+			map->fd, (void *)(unsigned long)map->raddr);
+		spin_lock(&fl->lock);
+		list_add_tail(&map->node, &fl->maps);
+		spin_unlock(&fl->lock);
+	} else {
+		fastrpc_map_put(map);
+	}
+	return err;
 }
 
 static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
@@ -1989,25 +2020,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
 	return err;
 }
 
-static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+static int fastrpc_req_map_create(struct fastrpc_user *fl,
+				  struct fastrpc_req_mmap req,
+				  char __user *argp)
 {
-	struct fastrpc_req_mmap req;
+	struct fastrpc_map *map = NULL;
+	struct device *dev = fl->sctx->dev;
+	u64 raddr = 0;
 	int err;
 
-	if (copy_from_user(&req, argp, sizeof(req)))
-		return -EFAULT;
+	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
+	if (err) {
+		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
+		return err;
+	}
+
+	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
+				  req.vaddrin, &raddr);
+	if (err)
+		goto err_invoke;
 
-	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
-		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
+	/* update the buffer to be able to deallocate the memory on the DSP */
+	map->raddr = (u64)raddr;
 
-		return -EINVAL;
+	/* let the client know the address to use */
+	req.vaddrout = raddr;
+	dev_dbg(dev, "mmap OK: raddr=%p [len=0x%08llx]\n",
+		(void *)(unsigned long)map->raddr, map->size);
+
+	if (copy_to_user(argp, &req, sizeof(req))) {
+		err = -EFAULT;
+		goto err_copy;
 	}
 
-	err = fastrpc_req_buf_alloc(fl, req, argp);
+	return 0;
+err_copy:
+	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+err_invoke:
+	fastrpc_map_put(map);
 
 	return err;
 }
 
+static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_req_mmap req;
+	int err;
+
+	if (copy_from_user(&req, argp, sizeof(req)))
+		return -EFAULT;
+
+	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
+	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {
+		err = fastrpc_req_buf_alloc(fl, req, argp);
+		if (err)
+			return err;
+	} else {
+		err = fastrpc_req_map_create(fl, req, argp);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
 static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
-- 
2.34.1

