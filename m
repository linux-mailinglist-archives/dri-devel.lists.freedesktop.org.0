Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6104F5F0F2D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 17:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5685A10ED5C;
	Fri, 30 Sep 2022 15:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF1510E2A5;
 Fri, 30 Sep 2022 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664552715; x=1696088715;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NbSH8bl8X63yMfdG/2CWZzQSjnfsxBolNzA6k8pFsRA=;
 b=Mmu1frPaUuxgz28opq9s+asRyj7Hez2N75dTaObSQO5svZBgN7j3LeXd
 +jMi95uaBujXKCXMCQ3g+ZLou0jchatb/GuEtIvgJE7OrjPDG3DVi8ivv
 z5sq4QUoFn0hJJ3gydCbG8qyz8ML1E7Yfll6LQgZiN0sknZSXrGq65j/X
 i/w0eKqYXJ6ShVXRvqU0ZkBjzmS0aSemMMfdO3Pr4GaaPk1ZhTG5WEi9h
 a7lMdr1LR0NECmVpUM0J+BzNjaLgGAs3Qh056c6JqRi+ZI7ehZ6jvWuuY
 Fy5mHsxN78wV/RQ/7RGHOFFjsWc+45Ss9XvRziye1IwN466Vu/J/UYhiG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="328603691"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="328603691"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 08:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="600451908"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="600451908"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga006.jf.intel.com with SMTP; 30 Sep 2022 08:45:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Sep 2022 18:45:09 +0300
Date: Fri, 30 Sep 2022 18:45:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: KMS atomic state sets, full vs. minimal (Re: [PATCH v3 0/6] Add
 support for atomic async page-flips)
Message-ID: <YzcPBfLBNzfbHG5W@intel.com>
References: <20220929184307.258331-1-contact@emersion.fr>
 <Yzb0uNjB5FpjCIjq@intel.com> <Yzb6203nHF8fVH/W@intel.com>
 <YzcGw9myJotLRTVl@intel.com> <20220930183700.6cf64900@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220930183700.6cf64900@eldfell>
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
Cc: andrealmeid@igalia.com, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 06:37:00PM +0300, Pekka Paalanen wrote:
> On Fri, 30 Sep 2022 18:09:55 +0300
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > That would actively discourage people from even attempting the
> > "just dump all the state into the ioctl" approach with async flips
> > since even the props whose value isn't even changing would be rejected.
> 
> About that.
> 
> To me it looks like just a classic case of broken communication.
> 
> The kernel developers assume that of course userspace will minimize the
> state set to only those properties that change, because...?
> 
> Userspace developers think that of course the kernel will optimize the
> state set into minimal changes, because the kernel actually has the
> authoritative knowledge of what the current state is, and the driver
> actually knows which properties are costly and need to be optimized and
> which ones don't matter. It has never even occurred to me that the
> kernel would not compare next state to current state.
> 
> No-one ever documented any expectations, did they?

Do you really want that for async flips? Async flips can't be
done atomically with anything else, so why are you even asking
the kernel to do that?

-- 
Ville Syrjälä
Intel
