Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5163828ADD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 18:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083C010E47E;
	Tue,  9 Jan 2024 17:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE6210E47E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 17:17:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B2F07CE1941;
 Tue,  9 Jan 2024 17:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D01C433F1;
 Tue,  9 Jan 2024 17:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704820668;
 bh=D7KV1IGnrkXqUutExUdjibJpcr5iZJVE7kOMwjqDBjE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=azLjjcxUBJVJs7dVbTFf3s2B/YPVpZUMPF1PMrVOIKcwVqKJe7cgvbGjceH/bEGlA
 /J6c6wUifbb5lI4ZysV8Q1FuSKZwhVzo12gYZZJGNd22juu+sPubMRu22n4FPmQ5SQ
 KqLMmX730gSn4lkOXB8KXSAOolWrywFMlpDuN3rNvWuRcNwZMQn9NViWf3NzazXdL+
 +sM/MCqVH03g6D3Yi6pVLIyCCuSAo+uotxLD0HWuh0CcGqgZ/iipTnhxzUPCpb/aR1
 B5E3Hde7t3CeIa/CdRy5l2udRn8IRTKk/OFTG+Jo4pCU0T2bOFZ2sa7FdXolXA6c+6
 MGZDeCmhSZOHw==
From: Robert Foss <rfoss@kernel.org>
To: linux-kernel@vger.kernel.org,
 xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20231221093057.7073-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20231221093057.7073-1-xiazhengqiao@huaqin.corp-partner.google.com>
Subject: Re: [PATCH RESEND] drm/bridge: Fixed a DP link training bug
Message-Id: <170482066511.1300150.1577752604987496736.b4-ty@kernel.org>
Date: Tue, 09 Jan 2024 18:17:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 dianders@google.com, allen.chen@ite.corp-partner.google.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Dec 2023 17:30:57 +0800, xiazhengqiao wrote:
> To have better compatibility for DP sink, there is a retry mechanism
> for the link training process to switch between different training process.
> The original driver code doesn't reset the retry counter when training
> state is pass. If the system triggers link training over 3 times,
> there will be a chance to causes the driver to use the wrong training
> method and return a training fail result.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: Fixed a DP link training bug
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ca077ff8cac5



Rob

