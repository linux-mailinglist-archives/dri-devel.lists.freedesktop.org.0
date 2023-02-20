Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6232669D0A9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 16:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D772810E25C;
	Mon, 20 Feb 2023 15:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3982A10E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676907120; x=1708443120;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O468sMTkKi9bilMN1dwa1y+YgaaLu5Cz8fjIGsr0w5Q=;
 b=A8atTd+Rya6P/s8UPlcMoyB8O6OuCPjZ/qASpbpDjMA36dB/hP5mZRTA
 /fshTHuSECtgniNykFys+Mf7AxWYAm7x2m8enVBJKT1ulgbhk9EdLpx2i
 xN5v2+Q+tabABsl2tL7btG431qnq5HciABn4KURdi21M/l0+EXz8LR19g
 1P6eEKSOc/yI8W5P69SX7LR/euqSrKuaZTDR+qQNDA/XRwe4NGIiHY4DI
 fvhi1Q2ynXadOjyMN63laeC1jzkA5FIH5/mHxgtWjzfTp8R0sHjGaqb5Y
 g5fLfymANK3a2JpRobEhDZG6wcsVYY0mjGpbBIIZLiFqicVfg29lQJAfY g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="316144435"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; d="scan'208";a="316144435"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 07:31:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="1000305082"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; d="scan'208";a="1000305082"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 07:31:28 -0800
Date: Mon, 20 Feb 2023 16:31:26 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 01/27] habanalabs/gaudi2: increase user interrupt grace
 time
Message-ID: <20230220153126.GE2862577@linux.intel.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 12, 2023 at 10:44:28PM +0200, Oded Gabbay wrote:
> From: Ofir Bitton <obitton@habana.ai>
> 
> Currently we support scenarios where a timestamp registration request
> of a certain offset is received during the interrupt handling of the
> same offset. In this case we give a grace period of up to 100us for
> the interrupt handler to finish.
> It seems that sometimes the interrupt handling takes more than expected,
> and therefore this path should be optimized. Until that happens, let's
> increase the grace period in order not to reach timeout which will
> cause user call to be rejected.
> 
> Signed-off-by: Ofir Bitton <obitton@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> for the whole series.

