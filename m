Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1858286F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 16:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10029459F;
	Wed, 27 Jul 2022 14:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032F5932A1;
 Wed, 27 Jul 2022 14:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658931500; x=1690467500;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uoI7KelwWlQQNj5jn9w6g8Y98M8Qw8jtv+JZ13Ertiw=;
 b=HkzcJZTty/GccOL/lNgBITDzEuBTC8FuDG84EwMSrdufDeTR2XvscN5Y
 jiAOPuJAjQ8bbeY7j0koyI1W6U1iC1IhVx/V8R+xGVqBSjfgvNURcN07S
 IlXJIcAMNHhcli61qZq+XmFn+jkaf3S/AIop1el/LQfQr2dDjuzUQiDBY
 ouG/QiLklK/10CRE77DS+wh4U7qTJ1yMharn6UCL4k3PkzkT/KlJMbrFs
 kNaCYNOdywfrLyBxrZKx+RsYZP1YtoQB+Hn5TMoeqeJPDinqV54EjTtDg
 K1fHJYX4ltYp5O5/tOvkvdtbxnLE+Du4TCKfNtSHa5DSTf4JHBgnOUKKz Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="268626242"
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; d="scan'208";a="268626242"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 07:18:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; d="scan'208";a="628392107"
Received: from cene1-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.44.151])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 07:18:16 -0700
Date: Wed, 27 Jul 2022 16:18:14 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v3 2/6] drm/i915/gt: document
 with_intel_gt_pm_if_awake()
Message-ID: <YuFJJmo1DqZIMrLp@alfio.lan>
References: <cover.1658924372.git.mchehab@kernel.org>
 <b974905bd0f6b5308b91561cc85eeecd94f1452a.1658924372.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b974905bd0f6b5308b91561cc85eeecd94f1452a.1658924372.git.mchehab@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

> Add a kernel-doc markup to document this new macro.
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
