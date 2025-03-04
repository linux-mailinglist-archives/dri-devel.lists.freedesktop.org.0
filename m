Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA9FA4E2F7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 16:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F9B10E618;
	Tue,  4 Mar 2025 15:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J4Q2BzRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D798410E618
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 15:23:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 43414A457BC;
 Tue,  4 Mar 2025 15:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5D0C4CEE5;
 Tue,  4 Mar 2025 15:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741101801;
 bh=wOZdyUaRyNj68ihWIOygiOcGTvvKLhUnXJHLbU9loN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J4Q2BzRvoV3D63ntQX7PJjECA5gNDcY3O5MJdc82JtYjlkGjJPffZEmxWvJXkINQr
 DICUn/02zKB0e2v7InznL8QpLBcNsAEvZapenQfRa1qCnOHw63v0lmbHAruGfblgwt
 DMFZWZDmWAOsdC+beiNN2Nwvz05DyuZGhzXTSGybPMwKYeVmlD+XlAx06Fia64QOQB
 CH5/+2lSpMOQim1fFY9YhZeSAHU9oQKu7N7zZpwHLHtm0s8+G/2BX3swytK6SyrH6K
 pgBsG1zG1xiz2Rv91U41AeVXb00uaSZPNY8rv6FACOh6hJXrQBL23oJLMWo8DF3voe
 pjQNcqG92VQiw==
Date: Tue, 4 Mar 2025 09:23:20 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI
 color encoder
Message-ID: <20250304152320.GA2630063-robh@kernel.org>
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-4-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304101530.969920-4-victor.liu@nxp.com>
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

On Tue, Mar 04, 2025 at 06:15:28PM +0800, Liu Ying wrote:
> A DPI color encoder, as a simple display bridge, converts input DPI color
> coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
> converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
> bits in every color component though). Document the DPI color encoder.

Why do we need a node for this? Isn't this just wired how it is wired 
and there's nothing for s/w to see or do? I suppose if you are trying to 
resolve the mode with 24-bit on one end and 18-bit on the other end, you 
need to allow that and not require an exact match. You still might need 
to figure out which pins the 18-bit data comes out on, but you have that 
problem with an 18-bit panel too. IOW, how is this any different if you 
have an 18-bit panel versus 24-bit panel?

Rob
