Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8846F19CC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B3910ED60;
	Fri, 28 Apr 2023 13:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8D310E3DE;
 Fri, 28 Apr 2023 13:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682689164; x=1714225164;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/Ngfc4XyZJaFdutDZ0Iq0sGAnXwE+B6C+W1EN7H7KGc=;
 b=hyrsHJ70blIuChKWX0JUEot4a9KGpD1/6r3N9l3OlvjukcsMStEd94Tb
 kwDdEEGVlPO+/6ibMAl55fLOasr/ke0KSvZny4TfznhEv/zkvSPG3BIcz
 UWye26c44BSVYbpMGeHx2EJ783HcUZ4DOHS8SNphsEluTTm7UqShXN+9W
 AX2f2vRkL16a/tzMihtvtdlj6JC5HoW8JIMnDU+XHwZ2fU48dlY1vwcuQ
 b2IBKmu/cCMuENeCNICQC91M+j/S15zpYh1qvRh95jip67iSyz6opiM7K
 2TnxIkOWOWW+I/Mh572paW8QeIrAD5ajjFiL4zfTRvkWc7NIy+QlMyeIQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="410848123"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="410848123"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 06:39:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="941104254"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="941104254"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga006.fm.intel.com with SMTP; 28 Apr 2023 06:39:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Apr 2023 16:39:20 +0300
Date: Fri, 28 Apr 2023 16:39:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Xaver Hugl <xaver.hugl@gmail.com>
Subject: Re: [PATCH 1/6] drm/uapi: Document CTM matrix better
Message-ID: <ZEvMiJTHENBV6P56@intel.com>
References: <20230411222931.15127-2-ville.syrjala@linux.intel.com>
 <3e6ce087-411a-8f2e-974e-2a9379587159@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e6ce087-411a-8f2e-974e-2a9379587159@gmail.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 12:31:10AM +0200, Xaver Hugl wrote:
> I can't say anything about the other commits in this series, but
> "Document in which order the CTM matrix elements are stored" is
> Reviewed-by: Xaver Hugl <xaver.hugl@gmail.com>

Thanks for the review+ack. Pushed to drm-misc-next.

-- 
Ville Syrjälä
Intel
