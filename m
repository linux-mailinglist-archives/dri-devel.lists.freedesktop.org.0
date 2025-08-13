Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803D1B24947
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 14:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB0D10E6F9;
	Wed, 13 Aug 2025 12:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ffRGwOX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE0210E4EB;
 Wed, 13 Aug 2025 12:13:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2BCF2601E1;
 Wed, 13 Aug 2025 12:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE0CC4CEEB;
 Wed, 13 Aug 2025 12:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1755087228;
 bh=YRMUZMdrCI81xQhP38eNlaRhIFU7sGuS/mHAU4lyajc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ffRGwOX0TD4yG5vj6NulVxBtbSeY6X+Bvb+sEgzMZG22pu8ZRpzLgnZ/d6j+08wXM
 H4lhClcV1AUW6Nk+Szf+irIaKOVkTWkR8z5Q3mTku2AeGFYPiiGAyyWuHtB0kHfWGq
 UMhdavpW86dCHzkCdvh1/ifFSRZ6gJLHlGrg8bc0=
Date: Wed, 13 Aug 2025 14:13:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH 2/9] mei: late_bind: add late binding component driver
Message-ID: <2025081346-shrank-wish-e85d@gregkh>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
 <20250710150831.3018674-13-rodrigo.vivi@intel.com>
 <2025071611-decode-hastiness-df63@gregkh>
 <CY5PR11MB63666310C54B48FB3624D9E0ED56A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025071603-guide-definite-70e3@gregkh>
 <CY5PR11MB636646E936C800D689BFBEEBED56A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025071619-sterile-skiing-e64b@gregkh>
 <CY5PR11MB6366AF03A73910CED71C7E37ED5BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <7aa74159-a9a8-4ca7-9635-a806c57bf7f4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aa74159-a9a8-4ca7-9635-a806c57bf7f4@intel.com>
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

On Wed, Aug 13, 2025 at 03:21:09PM +0530, Nilawar, Badal wrote:
> Hi Greg,

<snip>

For some reason this was in html format :(

Also, please follow the rules that Intel kernel developers must follow,
which means not using me as your first-line of review.  Please work with
your internal developers on this first, before resubmitting.

thanks,

greg k-h
