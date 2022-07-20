Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A428057B1CD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC7714A451;
	Wed, 20 Jul 2022 07:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EEC14A387
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 07:32:27 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 516446601A8F;
 Wed, 20 Jul 2022 08:32:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658302345;
 bh=nA6qTkA4roJM05MdvmeS/0o+jL/jdbAA6i2U6C/0nfY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JIEI9OGaIuTd3eRxjdfDcy9PNFHpr1KDlOcjkLx/jL62iS3OPtpLPxwCSl6ZzKUB0
 D1uvpEi3Q1rCfjLxwg5vyH02EIh4jVlj6JlkBOQLewfmiMcnBBllQcyGLQ6dd7R4vF
 gxQsW/+8Tva7lhLDeNHRSFgNBsNKoF9zgEjMRHBp+mluTN8uRyrl97qhrar3FlBjmx
 mI1V/sQdMmcnByEM6zW67qq8XmKJaqPOdpsEhPo8r4S1xQTj3JrLYtNjmz1jV+3Oe8
 jkfbAD2YCxwrT/2w2Lns81sJ2NpmJ5SJZIrYgoY9Ncx+QzC6EAjiKz9BBDss0kQx53
 R7CrteoJ5M6eQ==
Message-ID: <c2868779-0a50-0f0b-3562-8bb4b0d5e3d2@collabora.com>
Date: Wed, 20 Jul 2022 09:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] drm/panel-edp: Fix variable typo when saving hpd
 absent delay from DT
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Douglas Anderson <dianders@chromium.org>
References: <20220719203857.1488831-1-nfraprado@collabora.com>
 <20220719203857.1488831-4-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220719203857.1488831-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/07/22 22:38, Nícolas F. R. A. Prado ha scritto:
> The value read from the "hpd-absent-delay-ms" property in DT was being
> saved to the wrong variable, overriding the hpd_reliable delay. Fix the
> typo.
> 
> Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s probed by EDID")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

I think you should've sent this separately from the rest of the series, especially
because of the questions etc.

In any case, for this commit:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
