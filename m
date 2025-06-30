Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CDEAED9F9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5B810E3F9;
	Mon, 30 Jun 2025 10:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mNiJxc4e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC53410E3F9;
 Mon, 30 Jun 2025 10:37:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8D4B7A53157;
 Mon, 30 Jun 2025 10:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2567C4CEE3;
 Mon, 30 Jun 2025 10:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751279845;
 bh=I6v7+2Lj0U1E1xur/fLOtCrs41aLHuKzyBm8BqVEENQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mNiJxc4ehbWTc79WumhE2WdTKIwy28mnieiWoKlI9et2AwCDyoknaQXQ/11BqsENH
 AGjzTIxt92wtTsOc1MRKmS9pKG5ZRJLrXRo4oY1/8m2tkzFLDrSTm6PvaHgvvR6czl
 5He6BKrdehdSlC7zheDBNgY9T+FRudrHenXwvHSAA48D2c/xrEWR4fkkhCteQciyYa
 9Bqr5Adgec2yc6t9tWJG03jT3xUsOZ3C+qvz/TAwwrJ8K643ut5qHzW7cGteTkYI6V
 fWpPVyvpqZuFN1T4wFxXKVkPp+ix9iXxK5BFa+bj3/d9EYwczw8caJsSsQDrpscMYy
 +vzPsv4Nc5DTw==
Message-ID: <36b59175-87ef-459b-9b9d-f7de716f0be5@kernel.org>
Date: Mon, 30 Jun 2025 12:37:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Documentation for nova-core
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250503040802.1411285-1-joelagnelf@nvidia.com>
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

On 5/3/25 6:07 AM, Joel Fernandes wrote:
> Hello,
> 
> Please find attached initial documentation for nova-core mainly about the vbios
> and boot process. It helps build an understanding of the boot code. All the
> information is derived from publicly available code and sources.

Has there been a follow-up on the series? I think it'd be great to apply, now
that we landed the FWSEC-FRTS series.

- Danilo
