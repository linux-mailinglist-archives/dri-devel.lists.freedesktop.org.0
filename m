Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB9178B522
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 18:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AA110E315;
	Mon, 28 Aug 2023 16:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A71210E311;
 Mon, 28 Aug 2023 16:11:15 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RZFsp6GXsz9sV3;
 Mon, 28 Aug 2023 18:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1693239070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aoaaryzi6SBqAG9hPq9YHz3/mtxEs0iaU4L1R/VYHlw=;
 b=MkBv4LmWqB4b8yilepEp0iTZf/XsZa8/Ct8sticPhsSKzvm4Ctczto5Rtrl5x79oopv8eg
 29srTw4rlIoeV2p2oXlvwKAtZEHoIRGFv1iiPmAntjU3cR+V+2nNYzJ2sx2FUbYDcnooOl
 HfRGMoR6EMGx9Xaod1negh2/+FllGQiErZH6GtGuDDl+vPU48YW1V53VEOpesZlh5RQF0T
 WXRnCU/jlFI4tnv/XVOxIZAbzA+UeuNHD8q9yd6+NQq01hJauOcSg6aa778z7PMM5lEGvX
 dYJaG+1u73gNfrXHKZzfsVecd3N3G1b8gxC20QWYhY4TFpNSRINsebkVN6HNfw==
Message-ID: <88d4d764-6b71-3eff-3e2c-31f2b2f3ea6f@mailbox.org>
Date: Mon, 28 Aug 2023 18:11:05 +0200
MIME-Version: 1.0
Subject: Re: [PATCH (set 1) 00/20] Rid W=1 warnings from GPU
Content-Language: de-CH-frami, en-CA
To: Lee Jones <lee@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
References: <20230824073710.2677348-1-lee@kernel.org>
 <87wmxk4xt3.fsf@intel.com> <20230824120735.GS1380343@google.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20230824120735.GS1380343@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ibs94ie8miru1dh146saewmp5c3pjzxf
X-MBO-RS-ID: aab928bbbf67e7ef629
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Stanley Yang <Stanley.Yang@amd.com>, linux-media@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 linaro-mm-sig@lists.linaro.org, linux-tegra@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Hyun Kwon <hyun.kwon@xilinx.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Jerome Glisse <glisse@freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Gourav Samaiya <gsamaiya@nvidia.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/24/23 14:07, Lee Jones wrote:
> On Thu, 24 Aug 2023, Jani Nikula wrote:
>> On Thu, 24 Aug 2023, Lee Jones <lee@kernel.org> wrote:
>>> This set is part of a larger effort attempting to clean-up W=1
>>> kernel builds, which are currently overwhelmingly riddled with
>>> niggly little warnings.
>>
>> The next question is, how do we keep it W=1 clean going forward?
> 
> My plan was to fix them all, then move each warning to W=0.
> 
> Arnd recently submitted a set doing just that for a bunch of them.
> 
> https://lore.kernel.org/all/20230811140327.3754597-1-arnd@kernel.org/
> 
> I like to think a bunch of this is built on top of my previous efforts.
> 
> GPU is a particularly tricky though - the warnings seem to come in faster
> than I can squash them.  Maybe the maintainers can find a way to test
> new patches on merge?

One approach for this which has proved effective in Mesa and other projects is to make warnings fatal in CI which must pass for any changes to be merged. There is ongoing work toward introducing this for the DRM subsystem, using gitlab.freedesktop.org CI.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

