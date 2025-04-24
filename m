Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77010A9A559
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF31F10E762;
	Thu, 24 Apr 2025 08:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IObR2D6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E582110E762;
 Thu, 24 Apr 2025 08:10:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AA556A4467C;
 Thu, 24 Apr 2025 08:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C291C4CEEB;
 Thu, 24 Apr 2025 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745482204;
 bh=FUSF6dmhuuTU8raDy8wQzUQyI+F+nNdK7RweTlozMxc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IObR2D6pKLpVpEB7jtcJyvFaesOQGUAEp90przdD74Cetq6B8w47sI2W7iuthQAF0
 C9FKXzJlS8QZ956UI8l3Qvy4PVSD8X42gjJ25fsL5zs1NXFBuDFn/wwlpjZhrgPsNw
 HYeWLwno/Y+5Xs6xLFNTxHUyuxz7Rn0/bL86ZBpo56EqBjzNoGZBfiLGaOKqjV3OK+
 0Jpiym+fG6PAg86ERCjh+J3o17Zu0YLoYrMm4kjPhu/xbreiFlir66xGrBGoD8NmcW
 Rjdc3moTDk512AvxKuMV7CyboKmDQCZKYjetpoUrQTlxDV0dB+AMh75U4/sJu9JmpB
 zJIfGUPKtc1EQ==
Message-ID: <bd36327b-53e0-43d8-95c9-b26c2905720e@kernel.org>
Date: Thu, 24 Apr 2025 10:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Additional documentation for nova-core
To: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>
References: <20250423225405.139613-1-joelagnelf@nvidia.com>
 <D9EH7958IAJZ.1R6EJXUR5H3NB@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <D9EH7958IAJZ.1R6EJXUR5H3NB@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/24/25 3:25 AM, Alexandre Courbot wrote:
> Thanks a lot for doing this, this was severely missing from the
> WPR2 patchset.
> 
> Due to the strong focus on documentation, and in order to ease merging,
> I think it makes sense to keep this separate from the WPR2 patchset and
> merge it on top of it. Danilo, would that work for you?

Perfectly fine for me!

@Joel: Thanks a lot for this work, appreciate it!
