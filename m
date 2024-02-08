Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD8284E649
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 18:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D019510E079;
	Thu,  8 Feb 2024 17:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z9zA4kNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF3B10E079
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 17:10:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2512A61E93;
 Thu,  8 Feb 2024 17:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40978C43390;
 Thu,  8 Feb 2024 17:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707412218;
 bh=IOWSzMMlO8YnqPbPdbrgPuZBehBM3plhMgRmZTrstpg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z9zA4kNi3LDmXYPGblJeqbGXFB0y4GLSR6Sea/138sxNx07IiIBW8UN4/Qw0OFRJh
 aYH0IFxoAAaNMQPano/vow2LQnB6QO1ngCB8k/7CadBHz2Kfoz6VZw9ug47zyrtgWS
 vlv25aHnv33AK3Td76bto+j0HlWjcOF0Pdzh4BJheR7YFaAHqzu1O+GTbEBglNqfPD
 OaAfCQsfYckoroCZZLweLdWLWJWLYqwhxgp5jU+tXYsBBizx92vDj0Y9C86MIoG2u8
 VC2Eqz1rMd0ntjeArBMnULFuQ9EXS2ZlhNvrtjVBpJOtJFE/IIQJXCeP4rGVg4hNdI
 b+Pq4UG0UKXww==
Date: Thu, 8 Feb 2024 17:10:14 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/4] backlight: hx8357: Clean up and make OF-independent
Message-ID: <20240208171014.GW689448@google.com>
References: <20240201144951.294215-1-andriy.shevchenko@linux.intel.com>
 <20240208105304.GI689448@google.com>
 <ZcUKmlbtyktnKhLr@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcUKmlbtyktnKhLr@smile.fi.intel.com>
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

On Thu, 08 Feb 2024, Andy Shevchenko wrote:

> On Thu, Feb 08, 2024 at 10:53:04AM +0000, Lee Jones wrote:
> > On Thu, 01 Feb 2024, Andy Shevchenko wrote:
> 
> ...
> 
> > Someone may wish to address this:
> > 
> > WARNING: DT compatible string "himax,hx8369" appears un-documented -- check ./Documentation/devicetree/bindings/
> > #58: FILE: drivers/video/backlight/hx8357.c:636:
> > +		.compatible = "himax,hx8369",
> 
> I can do it if and when have more time. But apparently it was before this
> series, right?

I'm not sure it's ever been documented.

It doesn't affect your series in any way.

-- 
Lee Jones [李琼斯]
