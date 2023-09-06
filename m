Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 811A7793B7C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 13:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B747210E3B7;
	Wed,  6 Sep 2023 11:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F31B10E3B7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 11:36:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0619A61004;
 Wed,  6 Sep 2023 11:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E168CC433C7;
 Wed,  6 Sep 2023 11:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694000181;
 bh=XvZQw/D6OS4nurgc67PWjQY0smNSqPLGy1z+2Y7iLEE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=RvDQJ04t9UEd4Oi2krSltHz7ad7T65t3srpDJPL7Fzli6KXVBDFqHYPd5o+Cvyt9F
 9I0AYTcjn/A3TLM/Ae6RN+h5D9JfdHJL9cpe5oR1QSWSSHpgu7ukLoMer/bZvpdtSH
 +i6288tsyUsCa4e+p5heEEejhKTR08PSKhlzwzIo+KqlsWoW55n7O58rWS6U3x74ot
 rCvBA8WDFug3IXzRne6dxavXHvr7IGS2vyecXnM0zuuLlmZYExwxl2fCc8dsfwm604
 JLXmmkRf3vt3++bXM6kbEO5Vugzsac0xupKSByP4eh4yyeomwxY5Btj08y91dY2EId
 HTWyOrDlpNksA==
Message-ID: <b15931f26e229fd13e4d27fd582940f7.mripard@kernel.org>
Date: Wed, 06 Sep 2023 11:36:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sarah Walker" <sarah.walker@imgtec.com>
Subject: Re: [PATCH v6 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
In-Reply-To: <20230906095542.3280699-4-sarah.walker@imgtec.com>
References: <20230906095542.3280699-4-sarah.walker@imgtec.com>
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 matthew.brost@intel.com, corbet@lwn.net, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 tzimmermann@suse.de, mripard@kernel.org, matt.coster@imgtec.com,
 robh+dt@kernel.org, faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org,
 afd@ti.com, boris.brezillon@collabora.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Sep 2023 10:55:25 +0100, Sarah Walker wrote:
> Add the device tree binding documentation for the IMG AXE GPU used in
> TI AM62 SoCs.
> 
> Co-developed-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Frank Binns <frank.binns@imgtec.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
