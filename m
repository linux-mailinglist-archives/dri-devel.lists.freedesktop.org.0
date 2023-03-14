Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72126B9CBB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 18:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11D610E182;
	Tue, 14 Mar 2023 17:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B3010E182;
 Tue, 14 Mar 2023 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678814073; x=1710350073;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8maF+MyMRN8PyFjPic/AWZFEI8hxeFF4uDFIm6V9zAY=;
 b=eixqsI8VNWTmFBXA6NRjz1hmHyyBCqjHncD4fq1hpJJswFTj+BNis5OV
 gqnfO5Ctb7fOSzq4IXeemENU5+dAxvIZ5/v8gmu+VylynqVpa+v2ggYPa
 NpsxAYn/tgK+jgu+nT7lMdOoZKKrjHlGC4klN6LWhhdi7Eto2xxqJIBGM
 tTD8uWz8bVLL0yHUxu53YlvXD2CRnf6tWSVLsBcoYIRRXpp2Ym/djeB/H
 llIH3QjDD+Oo/TRqxwX3k7SLSQn6rUm9dJxPS0h3Ug8wfJTIL2hoNqClb
 y3kCebfOE0+BnuY9Un0/VT2XJ2qIifT892B22Dn1w+iyesCIDCUf1IUb1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="334976465"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="334976465"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 10:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="743385788"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="743385788"
Received: from novermar-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.219.242])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 10:14:30 -0700
Date: Tue, 14 Mar 2023 18:14:27 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v6 1/2] drm/i915/gt: introduce vm->scratch_range callback
Message-ID: <ZBCrc/rJ/075n6Jf@ashyti-mobl2.lan>
References: <20230308-guard_error_capture-v6-0-1b5f31422563@intel.com>
 <20230308-guard_error_capture-v6-1-1b5f31422563@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308-guard_error_capture-v6-1-1b5f31422563@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Fri, Mar 10, 2023 at 10:23:49AM +0100, Andrzej Hajda wrote:
> The callback will be responsible for setting scratch page PTEs for
> specified range. In contrast to clear_range it cannot be optimized to nop.
> It will be used by code adding guard pages.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
