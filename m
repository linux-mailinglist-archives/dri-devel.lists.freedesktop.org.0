Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1DB6C2F4C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 11:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A3D10E149;
	Tue, 21 Mar 2023 10:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808AA10E149
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679395395; x=1710931395;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=YIaDsYJVZV4/Gfldx90oLM5qwBhR1P2LlcqqvmJyz6A=;
 b=PMnlTeyJMZSKGvR60t82SWwOiT5ytHr6nWd7nllg2gWWl2Ijtgem72l+
 /tWZksRLdww23XjxQz68P7KhYzS+VRsmd+Wn8NJvdD4obQrrx5x+l8DC+
 rxxfsZmJM0XqtHHBe1a+Xwv/23XOR7NVJ2AKZcKKs8FdVhrX+bofrRMzG
 tEx1qeeXDsKwIyFENMWidZK71apibajy2oE4GOVHR9NtRuku4hbaEOIrv
 XVfEyUhOnFoV4mOFe9piKboNgG7K+m9iZPssFk8NIyorzhQsp+ICis9Yy
 ngYMHi1Seb+gCcjXGj9f7k7Q5HrIddFzpWMCNKmSFuQOB8kGlkzKVWg89 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="336413638"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="336413638"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 03:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="681443964"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="681443964"
Received: from trybicki-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 03:43:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: Re: display band (display area vs real visible area)
In-Reply-To: <CAOf5uwkDb=pkEV_qSshA7PnSxCV82sEwrmivAZhth48ae0S++g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAOf5uwkDb=pkEV_qSshA7PnSxCV82sEwrmivAZhth48ae0S++g@mail.gmail.com>
Date: Tue, 21 Mar 2023 12:43:10 +0200
Message-ID: <87ileu8jwh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 21 Mar 2023, Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote:
> Hi all
>
> I would like to know the best approach in the graphics subsystem how
> deal with panels where the display area is different from the visible
> area because the display has a band left and right. I have already
> done the drm driver for the panel but from userspace point of view
> it's a pain to deal in wayland for input device and output device. Do
> you have any suggestions?

Do you have the EDID for the panel?

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
