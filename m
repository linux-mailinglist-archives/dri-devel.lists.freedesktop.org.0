Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E84C6A5895
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 12:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013BF10E4C4;
	Tue, 28 Feb 2023 11:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFCD10E4C4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677585164; x=1709121164;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ggyx2CAu7EyosRp281wE2F+gng0S6AmQ8+oXpM+KpQ4=;
 b=YeLWYsZ4z/YaWHrxYD+vojGJ9b4jEbXHPdxpc+FStpj1DjVBeXtBqut1
 Aj/C5ejVUhPCxdgw/2X3ssi8Gt6YAjKzN2dozOGtBSYUWQ1uk3PWKJE/W
 mXIchaoLl3tVuN+bZIDHQi2ccyj/hvJMFCycqa69GBTl7l1gZIs3mLCeP
 0tbAA+WFmD/P2zVSfAAlrG4q94RS/gZCK/xDYrx0cJARq2DbMg9PEgoQ+
 5dpvfE3BNTA66+GAhRQqxkkEqhgqeoSH6tNPvRvjjfldUGWBDyrNr2FGg
 W/5NZ8anMfsotzXr9N/vCLt85lWlilmXJoH7j5oJxNZTLlod38lccX8d4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="336405106"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="336405106"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 03:52:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="674099409"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="674099409"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 03:52:41 -0800
Date: Tue, 28 Feb 2023 12:52:39 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 3/8] accel/qaic: Add MHI controller
Message-ID: <20230228115239.GH3547587@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-4-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675698105-19025-4-git-send-email-quic_jhugo@quicinc.com>
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 06, 2023 at 08:41:40AM -0700, Jeffrey Hugo wrote:
> +	mhi_cntl = kzalloc(sizeof(*mhi_cntl), GFP_KERNEL);
[snip]
> +	mhi_cntl->irq = kmalloc(sizeof(*mhi_cntl->irq), GFP_KERNEL);

I recommend usage of devm_kzalloc(), devm_kmalloc() for those
to simplify error and exit paths.

Regards
Stanislaw
