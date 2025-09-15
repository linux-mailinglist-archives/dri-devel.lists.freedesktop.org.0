Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1406B57E49
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA60210E4C6;
	Mon, 15 Sep 2025 14:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ePsbBEj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C066710E4C6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:03:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 640ED4196A;
 Mon, 15 Sep 2025 14:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EDCC4CEF1;
 Mon, 15 Sep 2025 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757945004;
 bh=3OGpAD/DchUR1g97RRHzHWYq+4uUvSPasPeyQ225Wbw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ePsbBEj7Xnja3jcodWPE9dWOmMn5QFEarpYbh77+opI5UEfW4s2diz9T0dmsLgpXH
 7hex+7mEbHOw4A6gcLtg+2YJLyfFsOxm3oNAYi55mbDGYGvEzjSWZEBqfbcFJMv+TZ
 cFVSWimnCfZai8Lji+z0GAuK7XR+pvIP5ipesFhyp/iU0Qi+xovpCcj7hzTj4yladf
 Jqk9hrb19xKTnctrFPfpuoZ5/nWiQ2td4pwFxDHLkftR/tp8+RTrDw5ZUh4qhC47WV
 25nGeIUReGZB9erzYXtEiEnKvwgdOsNbYHIEANFg9/KbyyBH4cxAnXA+xFsuIoorrB
 dJraCaCEONZVw==
From: Bjorn Andersson <andersson@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuldeep Singh <quic_kuldsing@quicinc.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v12 00/11] Trusted Execution Environment (TEE)
 driver for Qualcomm TEE (QTEE)
Date: Mon, 15 Sep 2025 09:03:21 -0500
Message-ID: <175794499686.3800302.11326605409469132909.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Thu, 11 Sep 2025 21:07:39 -0700, Amirreza Zarrabi wrote:
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.
> 
> [...]

Applied, thanks!

[01/11] firmware: qcom: tzmem: export shm_bridge create/delete
        commit: 8aa1e3a6f0ffbcfdf3bd7d87feb9090f96c54bc4
[02/11] firmware: qcom: scm: add support for object invocation
        commit: 4b700098c0fc4a76c5c1e54465c8f35e13755294

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
