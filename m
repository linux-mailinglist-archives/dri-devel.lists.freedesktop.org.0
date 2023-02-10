Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A19D692141
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 15:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFEA10E153;
	Fri, 10 Feb 2023 14:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FB410E153;
 Fri, 10 Feb 2023 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676041015; x=1707577015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uGsHhSmLfn0k4uR1/avlGQfHpqa+SE/uoIYkvAW37Bw=;
 b=NVQlDXxtAMNd5YonS0XNshrPjCE8g6Qf9ew7YWy4odvCpBidiE8yU+EI
 h4cxxxzdPkFidx8Muf1Klztga0D+puUSzYFgBdZef3OHHC3OOWDpuoDP9
 xJm8v4rzZFhuzxyOoMaijUiWZqo9XKj0WyffN6BKiIUGN3/lpnxkNGtM+
 BitxyT8WIl/nvPN7J1uTxJ2UZf+/wSROzUudrF9jbJsH5F1MzZLDJ+E1A
 Iwj3e2mpUZmP0YRfnflWO3TavpHAP9JwQZiGsBv9OML+Hntzt+uJ9GNCJ
 4ynBlfQzscWcRgBzT1pVQ4kmt8ggiOwl+TBDYYLIcQEt8TkUaHOjKQ54u Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="395041701"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; d="scan'208";a="395041701"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 06:56:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="731735842"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; d="scan'208";a="731735842"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.0.158])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 06:56:47 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Isabella Basso <isabbasso@riseup.net>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] lib/igt_kmod: add compatibility
 for KUnit
Date: Fri, 10 Feb 2023 15:56:44 +0100
Message-ID: <7621786.lvqk35OSZv@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <66E07FE6-0FE1-4CDF-A346-CF23C7B9D073@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <2101392.KlZ2vcFHjT@jkrzyszt-mobl1.ger.corp.intel.com>
 <66E07FE6-0FE1-4CDF-A346-CF23C7B9D073@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 linux-kselftest@vger.kernel.org, Magali Lemes <magalilemes00@gmail.com>,
 =?ISO-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 kernel list <linux-kernel@vger.kernel.org>, leandro.ribeiro@collabora.com,
 igt-dev@lists.freedesktop.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 n@nfraprado.net, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 =?ISO-8859-1?Q?Andr=E9?= Almeida <andrealmeid@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Isabella,

On Monday, 19 September 2022 22:55:44 CET Isabella Basso wrote:
> Hi, Janusz,
> 
> > Am 09/09/2022 um 12:18 PM schrieb Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>:
> > 
> > ...
> > 
> > Anyway, related to my comment about naming that function a parser, I think the 
> > best approach would be for that parser to return a generic set of results from 
> > kunit execution, then we could feed that data into an IGT specific handler 
> > that would convert them to IGT results (SUCCESS, FAIL, or SKIP) as if returned 
> > by a set of IGT dynamic subtests.
> 
> That sounds like a good idea to me, I might take some extra time before v3 to
> do that, though. 

Were you able to make any progress?  Do you need any help?

Thanks,
Janusz


