Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IOTAmgvcWmcfAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 20:56:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C435CA9A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 20:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE2D10E896;
	Wed, 21 Jan 2026 19:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SpEgm8Un";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FBF10E895;
 Wed, 21 Jan 2026 19:56:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D46F7600C3;
 Wed, 21 Jan 2026 19:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C96C19422;
 Wed, 21 Jan 2026 19:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769025378;
 bh=W+5gFu3JgHDLqSXUjxM6ibvM0s3B72Pq84Z3Z6iiLLU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SpEgm8Un+pCybSWCtssHK9idnxyWO+8NxxymILl5SctayJVwKTS4o5I/XzVVqIywu
 AffZwxoIAJnvRqd73D+pPFg6fXE+hN+pUq75yjS+wUZAYLQo2xHJz6jQBwZZtfu/rt
 5D9IckYXsqGLJJmQcah7hAP2snn8x2wa02hzIcq0gZdT2yiMA3MajZbUpg4co5hU8l
 CoScTP9ii5VQMpo+JNJ7PYhx/66a28ARx0/Tmk0zKYV20xHOpILw1Wh22ffAczemQy
 saoSIfcJiH+RFbWaqETp9xSIu9lSmhNhNSKLJx2inAZRcW47qvkz/01Dv4GA1x4I75
 NJxrdPKjg+hRw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [RFT PATCH 0/3] Add missing CX_MEM/DBGC GPU regions for
 SM6115/QCM2290
Date: Wed, 21 Jan 2026 13:56:07 -0600
Message-ID: <176902536628.1171053.16798539408151784925.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	URIBL_MULTI_FAIL(0.00)[gabe.freedesktop.org:server fail];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: C9C435CA9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 29 Dec 2025 21:47:38 +0100, Konrad Dybcio wrote:
> These regions were previously left undescribed, fix that.
> 
> Compile-tested only, the driver shouldn't break though.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
      commit: 0fdcc948929a6d673bd0f90631dd6e42090c3dbd
[3/3] arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions
      commit: 78c13dac18cf0e6f6cbc6ea85d4f967e6cca9562

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
