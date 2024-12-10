Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71A9EB5DA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 17:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC9E10E0C3;
	Tue, 10 Dec 2024 16:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a89O4Bfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C07C10E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 16:16:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B5E81A40EC5;
 Tue, 10 Dec 2024 16:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B37CC4CEDE;
 Tue, 10 Dec 2024 16:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733847392;
 bh=rzsJ9NMMTP/m0KBPr+ghsEHE/q4mLK8kQfUUsuyDk1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a89O4BfmDzVbneHeA9lJ7ce0/9RV85QCJfEd9zoaXsAcOijiRFeiHlJoes6ShV2AW
 4zEJU/fu+MrZrtGJ50pWMZTsqryXBDjKBReV3iabg74VpRSU2a+NWR5lpLlSZStJUF
 Vi2bbZwxGb8b+HyuC/XJd5Ap9MSvmd7mDiMEEq/cKbSFP2roURj3UIewMAE4fLYuDt
 92WB2frvTdYyoSgQr0ZLtSzA8i+QH0XQU7NfxPYsN8prCmVT5fyWu1Zo+k0B2wfAtz
 WFHqBC8b+CkbWa2YfKZt9ltUAirwCq4ezeJWkjdcg5lcwiZX2CUec7nkscGVdvq0Js
 ojycG3hVQJJFw==
Date: Tue, 10 Dec 2024 11:16:31 -0500
From: Sasha Levin <sashal@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Troy Hanson <quic_thanson@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 ogabbay@kernel.org, corbet@lwn.net, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.12 033/107] accel/qaic: Add AIC080 support
Message-ID: <Z1hpX_BduAF4b54s@sashalap>
References: <20241124133301.3341829-1-sashal@kernel.org>
 <20241124133301.3341829-33-sashal@kernel.org>
 <51afee37-2c90-d31a-978c-5681dccd5ccb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <51afee37-2c90-d31a-978c-5681dccd5ccb@quicinc.com>
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

On Sun, Nov 24, 2024 at 12:07:20PM -0700, Jeffrey Hugo wrote:
>On 11/24/2024 6:28 AM, Sasha Levin wrote:
>>From: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>
>>[ Upstream commit b8128f7815ff135f0333c1b46dcdf1543c41b860 ]
>>
>>Add basic support for the new AIC080 product. The PCIe Device ID is
>>0xa080. AIC080 is a lower cost, lower performance SKU variant of AIC100.
>> From the qaic perspective, it is the same as AIC100.
>>
>>Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
>>Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>Link: https://patchwork.freedesktop.org/patch/msgid/20241004195209.3910996-1-quic_jhugo@quicinc.com
>>Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Sasha, it feels like autosel was a bit aggressive here.  This is an 
>enablement patch for new hardware, and not a bug fix.  Therefore, it 
>does not appear to be stable material to me.
>
>Am I missing something?

Yup, we also take patches that enable new hardware by adding PCI/USB/etc
IDs as well as quirks.

-- 
Thanks,
Sasha
