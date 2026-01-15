Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A80D231D9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23F010E6EF;
	Thu, 15 Jan 2026 08:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERbyeOQr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dx+4i75a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6B910E6E9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:29:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6gFoj783893
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=8wi0sGLhxJVBWYng52GyE/X8QfV6jCwL+3c
 zaujsZWs=; b=ERbyeOQraVp3bYKkwM9mHfgiFOq/Q8cm95J0RTeZTfZ3y+2KoYm
 c0EsFrd+j+NkRi0NaANa7BGEJXhfLKwla0G8X71Erf0QPrHWzdQGCOIRJZG7FWjX
 NY8mPaqFT9LNAz1ZLkvrjXpwrhNWwEbxxQ5uUD76H05U7H2TuEnHARSO3YjDTFIN
 ODUI9/GHY90VnliOse/tHQBc71vPzx1ZgPdbsxIeZW37xGuf+FvRQilJTy4NtZQu
 Oe3cGD23VIC0lZmNe6hFO0lmSCmeGqDsCAmkP2fWV8fKiA02LMMGOH2K9SwB9eBM
 dEh3wMQYDVUQGFvA+FjOQWyyOdTdB6L9mrg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5k5x0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:29:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b471737e673so1026707a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 00:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768465744; x=1769070544;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8wi0sGLhxJVBWYng52GyE/X8QfV6jCwL+3czaujsZWs=;
 b=Dx+4i75aNNeqVxSb/ZNSy/EWnpKwCt0RbXbFJ+3JSKTmRUbC5bP7VwbXrm014HHa7q
 YaAmUUT8IWu1g6inAqSxceRQg8FLqXS7i0qiPOQ2+uQHiVorup3Acp3YNY5Wr8k6f1nj
 RwcI9EgDgAQ7SXEkF9fshHgGKumaiyQphm2Heh6wlTWhX/32r5RO8psDjgJYChsUxgI4
 eQislky0phcO+Ttta2Z3nv2hqcAGhus6RwwqEYt6uKbnKjbW0Evp98ecdT+ag5pl5PkT
 PeBnZ+lNjCIb+ad/FubQsr23q97nSyKPFnH37MJ7Te2taXbEsTFQ5XsA9zSZaLXaQ2O7
 yz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768465744; x=1769070544;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8wi0sGLhxJVBWYng52GyE/X8QfV6jCwL+3czaujsZWs=;
 b=FPIUa2mPNh1KKJDloj+UorJ47bWYzrgarzbGNNwxkdrp8FvldU3SxbJqkiIn8KsfnS
 oRpHksIXdx2c4ECks2NJzeMg51JdRy97H1k/lCcg0LtVFi5dbJSZU3jkBMWegQGywiuo
 0g/KnBZrnp1LMSSkzB3NdxLsK1v+YyJxu+3hQVjRQ4Hhfo6g1QZgovag7BEYyTlRvIAa
 fcApBR77FHfKFpK8Ygs1Fsn7wf5VZHdku7T29700UUzFg6kJqaFoEKwtM7gLuC92Wo6/
 bZYsoe6xPeJchm4M3R+0O3HIM0ZB2Dx21PvnuT1hWiYmSDrN/WMBgGb46mEqybY7y5j+
 hNRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4a6xJ5r0QtTq2e3ZaUnGFC7FZDcfEYQ1bzFf6463Q168Hv1QwU0x1rrqycMiDBjHxZFHzdkfAACc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIUIhE64aQxgOygXSHKHLQF8S7R1S3CcZuD59X4Klr265U6aej
 D3bqeg1egbb4pUkzx7WfJVtcCOtaL9z8Ohnl8UFsM9vPBNULe1gOJy6F1+nGSrbGDASKb89sBDy
 fr31KU/yTPCFyOkkkzl7dUkpA6smBmVCXraOWYIP3laOIJs3swAxHKfF8A9JqoMGlqjt77ww=
X-Gm-Gg: AY/fxX7JUWRnxpNgv+ucaKvNtgAtUHsx0iH1lp9trnXaCz5mviO5cIoG43jqVD9Pg1y
 yzrjj1Tab3RE+omv0MQJqYRB2Lqo9rIl5HCarEgLnMmj7kTCq41z440pHbpbCrtNf++GfaNNc+/
 NRHS5xnTRbA+jSneY5uEqyD+fDwmUy1kYqYTNssgSnf9hOjBgf8n5MaxMPFdKiwCTmHJDdEb8mZ
 AGZgDUQ3EAe+4WW2OdUdrMnrHkSU/0HHSTJSoYaucJ6RN0fhxE7Ds19Ilzywwc32CuhuXaXQHV1
 48HuW77nFYiCQNKh9RxoGrcuk4vji0AoFmD0oZMLUfByFmCg4PKKlbgYJRZkryCME9abkVSQD+b
 /TCX159eStze0nvKpA5lB2SMoVxWTb47OUdUE6+lr
X-Received: by 2002:a05:6a20:7f89:b0:347:9ae1:cffb with SMTP id
 adf61e73a8af0-38bed0d2c3bmr5834702637.24.1768465744445; 
 Thu, 15 Jan 2026 00:29:04 -0800 (PST)
X-Received: by 2002:a05:6a20:7f89:b0:347:9ae1:cffb with SMTP id
 adf61e73a8af0-38bed0d2c3bmr5834682637.24.1768465743922; 
 Thu, 15 Jan 2026 00:29:03 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81f8e69d1e7sm1773296b3a.58.2026.01.15.00.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 00:29:03 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, thierry.escande@linaro.org,
 abelvesa@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 ekansh.gupta@oss.qualcomm.com
Subject: [PATCH v2 0/4] Add missing bug fixes
Date: Thu, 15 Jan 2026 16:28:47 +0800
Message-Id: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1NyBTYWx0ZWRfX0ryHp9YrVgST
 qC7HiZ1NJzsWhGfADptu/8DNXCoKPKtUp26P564pdf9X5uOHGrkg3o9g7IytXFeHajLMQa3qUce
 Kk0XFOzbxU10vSiCaDnnrm3nJbitWYDHxjx/c7934HDqvDb5JJ3VuKTqLHc15wX3KcuMXZAG1M7
 5H6PzAFSj1sHnQoPJ9KVFtlTK65/zcFubbAaBTmB4HOTAl9ROKRQrLAHS8JYvxMluTT4F7dUUAX
 nR4vSZlaPhcBjJfPo4b0UNT9JCWryqzoYiWkPoRFz+NSXA0UoXtB8OeqGJpFyHicVWMwshk6v7y
 FV3WwdNzKR+Rr7fiy9n0TTQfyKNgHzV7h5gbgF5SDwjPiXWYVX1ur+XXwqL1vvBXgJP7I71xLzF
 uzAITm553xZMMNGBiSVYQiUDE3v5WJuu2j/kuv8z1j9lP4ymrYaPuCQ4oeRFldKFA8QS0b4iYJf
 KAAykxkIX/nTF3wKRQQ==
X-Proofpoint-ORIG-GUID: QTTHqTQH9t33JYWehn4zyIuPCIaH0cI0
X-Proofpoint-GUID: QTTHqTQH9t33JYWehn4zyIuPCIaH0cI0
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=6968a551 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gfRWkJ0A9WzxxLvKSxYA:9 a=zZCYzV9kfG8A:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150057
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

Add missing bug fixes in memory areas. This patch series carries
following fixes:
- Add proper checks to fastrpc_buf_free to avoid potential issues.
- Add multiple fixes for remote heap which is used by Audio PD.
Patch [v1]: https://lore.kernel.org/all/20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com/

Changes in v2:
  - Remove the if check outside fastrpc_buf_free
  - Store the spinlock pointer in the struct fastrpc_buf instead
  - Allocate entire reserved memory to audio PD through remote heap

Ekansh Gupta (3):
  misc: fastrpc: Add NULL check to fastrpc_buf_free to prevent crash
  misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
  misc: fastrpc: Remove buffer from list prior to unmap operation

Jianping Li (1):
  misc: fastrpc: Allocate entire reserved memory for Audio PD in probe

 drivers/misc/fastrpc.c | 135 ++++++++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 64 deletions(-)

-- 
2.43.0

