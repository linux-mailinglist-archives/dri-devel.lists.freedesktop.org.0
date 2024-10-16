Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D535B99FECB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 04:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C0B10E080;
	Wed, 16 Oct 2024 02:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C4z5s/QI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EC110E080;
 Wed, 16 Oct 2024 02:25:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D2E2DA40DD7;
 Wed, 16 Oct 2024 02:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28189C4CEC6;
 Wed, 16 Oct 2024 02:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729045534;
 bh=Jdptx5u4v/6E5gp57CYDnSwOan85kAY5Yrrs9yzpD4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C4z5s/QIbi4scSq1/pFzjwCxhTENqAU9wNPNPZpWCHzS5yFKT4n8SBn2aWiPvJ2mF
 K0EsQ+KSQd/4eudF++qNxhI5ebGeGjOFvXqYuZoHt3J1MmhThPxJTLX34UNSmCWj0b
 kY6p1luRxUgDrgfWWYadT5kwu1dX2/O8XyQo5IXiKh7hSXFyqo2aXf00izrInqlKys
 CciCGTPMC0rjsEz1tLNQSFvi619GwtJlVTKA0zVlZUsPJhoD1z1t7bJ08QIMsLi9OT
 ktFu4XOAr1CxQCkWz0KvIjAXnX4mt09iqoPAZJDm8OMuyQ1w5Sga2UYVP+hhuS4sWu
 K0hMCuJF1zWAQ==
Date: Tue, 15 Oct 2024 19:25:32 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Christian Brauner <brauner@kernel.org>, oe-lkp@lists.linux.dev,
 lkp@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linux-next:master] [fs]  d91ea8195e:
 stress-ng.ring-pipe.ops_per_sec -5.1% regression
 (stress-ng.ring-pipe.pipe_read+write_calls_per_sec 7.3% improvement)
Message-ID: <20241016022532.GC1138@sol.localdomain>
References: <202410151611.f4cd71f2-oliver.sang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410151611.f4cd71f2-oliver.sang@intel.com>
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

On Wed, Oct 16, 2024 at 10:19:25AM +0800, kernel test robot wrote:
> kernel test robot noticed a -5.1% regression of stress-ng.ring-pipe.ops_per_sec

These emails that talk about negative regressions keep confusing me.  A negative
regression would be an improvement.  But that is not actually what is meant.

Wondering if the wording can be fixed to remove the minus sign.

- Eric
