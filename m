Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC03780A32
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 12:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C0210E4C1;
	Fri, 18 Aug 2023 10:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4C310E4C1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 10:32:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 512A861BAF;
 Fri, 18 Aug 2023 10:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A25C433C9;
 Fri, 18 Aug 2023 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692354775;
 bh=2TpNR24FXV8wdI1xhbKlLvv+i1pe7zzGnmmdOMKPlHQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D5DpRaKdxnrBq9RtRGDerqJ9ZLF6aeHNJYe5Zkl/JE3/AE6kZ52RgD7UEv7lgQcwF
 y0L4iiXKIkzaMUhbUG+N0H7eWNS5XmBxcR0H2fzjaizgnDSXKgXdTvk8/0wuGWwsYT
 Yhba7GQrX3nS1EeECLivbu3Jj8VBHkACeA5oILw2AO/DLaLrMeKSKZGvIPU2hgDpMC
 ELddEsHjx0dJpFyppHKOJF+pszgky4fxsjcJx6yzbQczghXFnsH1HP1jgoiIONLSTr
 mKf2gEjKj/YciYEG526rvVH6QhiowFf1WtWMM90R14Az6sIezlqDV9ug0ifd1wg6/B
 obIoapnjgMm0A==
Message-ID: <f9c32a69-6399-0686-d47d-7464055e49bc@kernel.org>
Date: Fri, 18 Aug 2023 12:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-3-sarah.walker@imgtec.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230816082531.164695-3-sarah.walker@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, hns@goldelico.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, afd@ti.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, tzimmermann@suse.de, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/08/2023 10:25, Sarah Walker wrote:
> Add the device tree binding documentation for the Series AXE GPU used in
> TI AM62 SoCs.
> 
> Co-developed-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> ---
> Changes since v4:
> - Add clocks constraint for ti,am62-gpu


Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by
automated tooling. Performing review on untested code might be a waste
of time, thus I will skip this patch entirely till you follow the
process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.


You already got this comment. I think more than once. Fix your
processes, so finally this is resolved.

Best regards,
Krzysztof

