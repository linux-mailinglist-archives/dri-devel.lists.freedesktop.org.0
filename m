Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B60B0D3F5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937CB10E61F;
	Tue, 22 Jul 2025 07:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="IyBJDlZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6428410E61F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1753170976;
 bh=sEi6Qc+0LMLSRWy4yxxZXRzpQLiDwl7qhwa3kf4qeBE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=IyBJDlZ/46kFPBbWehvroWoU9cTUfolUS5qddaAsKRZn80OHNHmJXL5SFicbDZ43U
 sh+1rL2SBYiGrF4x6AsgQNw0sgJQRUNmAYRGP+5mzxgNm3XLGJuvOpYonGAWl7cHDT
 kR2L1iNLPssExD0XV37gu8ZhIxeCv2cEuLyGM+6c=
X-QQ-mid: zesmtpip2t1753170967t5ee6ac39
X-QQ-Originating-IP: RjCZbseQq4oikT5GmR1Rbfwt8wXQmxJlvGsd6iZwE7U=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 22 Jul 2025 15:56:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5626045234927739205
From: WangYuli <wangyuli@uniontech.com>
To: jiang.peng9@zte.com.cn
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 eperezma@redhat.com, jasowang@redhat.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mst@redhat.com, sumit.semwal@linaro.org,
 virtualization@lists.linux.dev, xu.xin16@zte.com.cn,
 xuanzhuo@linux.alibaba.com, yang.yang29@zte.com.cn
Subject: Re: Re: [PATCH v3] virtio: Update kerneldoc in
 drivers/virtio/virtio_dma_buf.c
Date: Tue, 22 Jul 2025 15:56:05 +0800
Message-ID: <B54095728F89524F+20250722075605.24998-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717160707018ilXWr01CnLXI8dTRDVKy4@zte.com.cn>
References: <20250717160707018ilXWr01CnLXI8dTRDVKy4@zte.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M5znx2hx04lbAGhAtTpGT8TMqZAxGzKRNrEQKddeNz1di6XnjLJi+ZP8
 1PyOHEVqrJ0Mi7j9Sw5Cs/HRnL0Ie7HPuBQrTUrna+KUM5YGK8qBDDGNdIfeeRP1CVS3v4W
 b/ZQODKSPJpiShXBdy9z2RUMCJUkUoEAp4E1bMf9eLKDVl+v/dxYIHUVViBJlOR9E00E7la
 gA+sZYSWsUOda8Z3mxZgb5LvLgDzWuhX2Lm/Soh/uULxK1kxidGERc9+M/s7aOnHh3ONFPx
 3nkkQOm2wcYSWFPnRTRXIvgISlmGd+El90qdPzstqYKJ/rP2xr81zI3NXB+6ph/bnbDvrqI
 vkaXwqMVvjtYbtjmJ4NdZBd8/7dEmAe4dslbt42DQMoeHVnw9XE2akbEgA5tXEDL2afKWw+
 5xN7dFv+yg6OmDR1ZmbebaPmNvMxBghAwq1J3vDmFpq04u4dNEo1+3oYK+dLXWMG1NoTvly
 bFCdJxD2EMoMfC2LmuZ2+Gb8v3+fQGgdug9WE/oAhay6Eov78myJTv4xhDhfyMXnI1o1FtU
 FajytM7SwA8NVxAk/tfXWWMD5XzkIigtJmKlPpfB2hdvUjvP0u7HfeMRUHrF6brg1zWuFfJ
 jJ/t8KnTsx2h9UiFaF0Gg8dWfn5ZgNZPxiBcTJoD2cgJZ2CAPIC90VTdSZk5jI2COSh9O6O
 yNJBGUlrsfF63AnVN8n1E4X2mUIOcBHG3or5IBa8oh4cjwH0p/FJqn1J53i8IiDyeBfGHQ3
 +fm9QOuDVTdWtW20pYb4hRSCzOmNgknkJ+5EpWPaxcBoX/lYFtRudWcVcW/r/ZQO3D/u2KX
 hVk/2bz2q7KAUxp3p4QmbfwRN1Rz5/ADplFZVSZ0vutMJLCPKtSYWMxHd7fgS++fOQOCDJk
 6yF7fjZXQ2u50BFKUtwrEsfBAsPV+Th5+rnRn7OoJ9VlXA73mc/dxu0j9dYoW/eSVyIsGTl
 FVdCF4NLkXB5oH/xnSLkbIJs7ynIrd3EuRqfkECoAu4cnXVdkHCzXPg5mRJjE6Q12nSBR3z
 2E3Xa1vRDnJ/s4KC+c1bJ2t7wpIMZq4S20KMZ9Nw==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
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

Hi Peng Jiang,

Please feel free to add "Reviewed-by: WangYuli <wangyuli@uniontech.com>"
to your patch v4. [1]

[1]. https://lore.kernel.org/all/20250716094357-mutt-send-email-mst@kernel.org/

Thanks,
--
WangYuli
