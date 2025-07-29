Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E03B14C11
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 12:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA1910E608;
	Tue, 29 Jul 2025 10:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MogjU+in";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EC910E607;
 Tue, 29 Jul 2025 10:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753784431; x=1785320431;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=u9g9xTirDI5BoZdPd2gtcPkZvUCKI6czZ27irfE2iIU=;
 b=MogjU+in8CINj/Jb2fL/Wfeu2+Ki0htBeI3fQtuyCM759PCHzv3KB52z
 Pl9TrLeZcI58YVl+Dl+FlTwSCSVcJrohZGfzUBE5IM/69lMRWnfilQgWz
 oNXA00OqauxLVZOfZJF9PTeeU+HEcYO38A54FX5sREqSQaFZdkVFQ56DJ
 AdafgKqOGBJFuDsGAdfjnZER38QgXJcv/La3Hhv0s5mkeq3J0E5OqdRNK
 hKBtHoe6JeyqNiA/3rHEXvSpgzrO5YmrVH6Uw6ZKjeXWkM1AigHpqzCR5
 cCwle7sEcB2ryPs317uibRhk5/nq+r2MGolUsx8M6o0MvAk3PSsskHF93 A==;
X-CSE-ConnectionGUID: Qi6mi0ILSem9v0rWHgfnNQ==
X-CSE-MsgGUID: EgXd59RWS5SYuiNKU+P++w==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59872761"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="59872761"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 03:20:31 -0700
X-CSE-ConnectionGUID: RXJlBpLLQlWpDWW8k/7zRw==
X-CSE-MsgGUID: b62qSJQPQKun17BHcYAXTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="163006701"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.22])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 03:20:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Mindful <andy.mindful@gmail.com>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, linux-pm@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, rafael@kernel.org,
 ville.syrjala@linux.intel.com, tglx@linutronix.de
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend
 in 6.8+ on ThinkPad X1 Carbon Gen 10
In-Reply-To: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
Date: Tue, 29 Jul 2025 13:20:25 +0300
Message-ID: <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
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

On Tue, 29 Jul 2025, Andy Mindful <andy.mindful@gmail.com> wrote:
> Please let me know if any further information or testing is required.

Likely the quickest way to find the root cause is to bisect the issue.


BR,
Jani.

-- 
Jani Nikula, Intel
