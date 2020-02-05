Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D526B15334D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 15:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC086F5DB;
	Wed,  5 Feb 2020 14:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE8B6F5D7;
 Wed,  5 Feb 2020 14:45:18 +0000 (UTC)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7084D222C2;
 Wed,  5 Feb 2020 14:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580913918;
 bh=ztiXU/qrRqrIBmSEuYtgGn+N5ZJQerFe60JUEI3uqn8=;
 h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
 b=tDpH/6eD//x5iba0qIdaXUdt/MX2so5Wb11SVUfzH52gn1t0ov8vHbSqkQL5er5BR
 ID1/yXegxDemzRr5VBfW9ss9InJGi4VQg8j2G/XhoWLEb57Wp2Vk4QWF4wcPHJ4AOf
 xevJ8MqaGky8J3YjBKdn0/MZO9JA2Xte0CdgakFg=
Date: Wed, 05 Feb 2020 14:45:17 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/i915: Wean off drm_pci_alloc/drm_pci_free
In-Reply-To: <20200202171635.4039044-4-chris@chris-wilson.co.uk>
References: <20200202171635.4039044-4-chris@chris-wilson.co.uk>
Message-Id: <20200205144518.7084D222C2@mail.kernel.org>
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
Cc: , intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: de09d31dd38a ("page-flags: define PG_reserved behavior on compound pages").

The bot has tested the following trees: v5.5.1, v5.4.17, v4.19.101, v4.14.169, v4.9.212.

v5.5.1: Build OK!
v5.4.17: Build OK!
v4.19.101: Failed to apply! Possible dependencies:
    4a3d3f6785be ("drm/i915: Match code to comment and enforce ppgtt for execlists")
    4bdafb9ddfa4 ("drm/i915: Remove i915.enable_ppgtt override")
    5771caf885ae ("drm/i915/skl+: Decode memory bandwidth and parameters")
    6323113b7af6 ("drm/i915: Move SKL IPC WA to HAS_IPC()")
    79556df293b2 ("drm/i915/gtt: Enable full-ppgtt by default everywhere")
    86b592876cb6 ("drm/i915: Implement 16GB dimm wa for latency level-0")
    8a6c5447635c ("drm/i915/kbl+: Enable IPC only for symmetric memory configurations")
    900ccf30f9e1 ("drm/i915: Only force GGTT coherency w/a on required chipsets")
    cbfa59d4b331 ("drm/i915/bxt: Decode memory bandwidth and parameters")
    d53db442db36 ("drm/i915: Move display device info capabilities to its own struct")
    f361912aa9bf ("drm/i915/skl+: don't trust IPC value set by BIOS")
    fd847b8e60e0 ("drm/i915: Do not modifiy reserved bit in gens that do not have IPC")

v4.14.169: Failed to apply! Possible dependencies:
    0d6fc92a73e0 ("drm/i915: Separate RPS and RC6 handling for VLV")
    37d933fc1728 ("drm/i915: Introduce separate status variable for RC6 and LLC ring frequency setup")
    3e8ddd9e5071 ("drm/i915: Nuke some bogus tabs from the pcode defines")
    562d9bae08a1 ("drm/i915: Name structure in dev_priv that contains RPS/RC6 state as "gt_pm"")
    61843f0e6212 ("drm/i915: Name the IPS_PCODE_CONTROL bit")
    771decb0b4d7 ("drm/i915: Rename intel_enable_rc6 to intel_rc6_enabled")
    960e54652cee ("drm/i915: Separate RPS and RC6 handling for gen6+")
    9f817501bd7f ("drm/i915: Move rps.hw_lock to dev_priv and s/hw_lock/pcu_lock")
    c56b89f16dd0 ("drm/i915: Use INTEL_GEN everywhere")
    d46b00dc38c8 ("drm/i915: Separate RPS and RC6 handling for CHV")
    d53db442db36 ("drm/i915: Move display device info capabilities to its own struct")
    fb6db0f5bf1d ("drm/i915: Remove unsafe i915.enable_rc6")

v4.9.212: Failed to apply! Possible dependencies:
    0031fb96859c ("drm/i915: Assorted dev_priv cleanups")
    03cdc1d4f795 ("drm/i915: Store port enum in intel_encoder")
    4f8036a28112 ("drm/i915: Make HAS_DDI and HAS_PCH_LPT_LP only take dev_priv")
    50a0bc905416 ("drm/i915: Make INTEL_DEVID only take dev_priv")
    6e266956a57f ("drm/i915: Make INTEL_PCH_TYPE & co only take dev_priv")
    8652744b647e ("drm/i915: Make IS_BROADWELL only take dev_priv")
    d53db442db36 ("drm/i915: Move display device info capabilities to its own struct")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
