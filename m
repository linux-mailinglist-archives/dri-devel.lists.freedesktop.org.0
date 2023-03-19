Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A96C06B5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 00:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BC410E0A5;
	Sun, 19 Mar 2023 23:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BAE10E069;
 Sun, 19 Mar 2023 23:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679270348; x=1710806348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JpsuJrdvik2SZDHzxaiPaOE5KFs/Im8ufn+wansR7vA=;
 b=jy4RQYim7rlOKxrEve315FAnDwagJsge9HS9dUr0kMojFkEapEANBJPQ
 hPonGz/2oj8gTfA4dP9Ui7WLjdZoDseh/FbmE73cTJ/Cp4KHXdNZ6v7cj
 TBr7/3dKnQKy07NuLNTfRVqSbrYzd3Xr6AqKERnNYIBJNvcEE6J1uPaMV
 5O81OKCrzc79uMjM+kNGQZxfLkgTTF5voe2o0dsCa4rp+QJjSOqNYlnw2
 ST45wJ70jMXptMSLGsfKvQbYtj+jD3zuWucuzk1wSg5TMhmBYJN5qYUvk
 0U6ZmkwJKJ0wO4CvnKTclYzGJCSD5mWBUSuT500D4mMJt2h1ot/9aCh5R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="338570875"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="338570875"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 16:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="713367270"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="713367270"
Received: from msbunten-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.251.221.102])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 16:59:02 -0700
Date: Mon, 20 Mar 2023 00:58:36 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 08/10] drm/i915: Correct type of wakeref
 variable
Message-ID: <ZBehrM6iDqZcKCOy@ashyti-mobl2.lan>
References: <20230224-track_gt-v4-0-464e8ab4c9ab@intel.com>
 <20230224-track_gt-v4-8-464e8ab4c9ab@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224-track_gt-v4-8-464e8ab4c9ab@intel.com>
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
 Chris Wilson <chris.p.wilson@intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Mon, Mar 06, 2023 at 05:32:04PM +0100, Andrzej Hajda wrote:
> Wakeref has dedicated type. Assumption it will be int
> compatible forever is incorrect.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

easy...

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
