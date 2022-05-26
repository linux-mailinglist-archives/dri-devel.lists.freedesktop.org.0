Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40367535455
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 22:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E062A10E297;
	Thu, 26 May 2022 20:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A4F10E297
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 20:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653596219; x=1685132219;
 h=message-id:date:mime-version:to:from:subject:
 content-transfer-encoding;
 bh=skbcxi7lkmXzokbfkumHuuYAEBu0dboltI1n+J/aHmA=;
 b=bZoElirBc3P2dHKNl3ZT2WlhPmhjnUrfhV90Z/ZYhFZHUkn+BuIlHCgg
 naVHAEasW4WuZ+p2yruATBYIPGAtQiUZvFN4zSTuPHIG3g3ePu+cbLsqa
 YQS93ySPxo5yE6RNrxEw/EMYoYsYwGMImcwh6Bjq+VNMsPg+0HM72c/eu
 ACbFqTdi7JLMXF39geVDFJfB1JE/UZb9Za2IWCZssSHydGTvKL3I24wDJ
 8MDoTgIVG9LZ9BBDiw1L2hDsEFX5vDGWMRa+5WdXtsSyvJLvdlJ4ZmILs
 Y5xDZX++S1At1I1/aQpqvzKepLhy8N0trAF6wmxkivYI7YEnUOpQqBr6D A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="299616946"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="299616946"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 13:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="527591656"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 26 May 2022 13:16:58 -0700
Received: from [10.249.136.244] (patrykma-MOBL.ger.corp.intel.com
 [10.249.136.244])
 by linux.intel.com (Postfix) with ESMTP id 5ED40580B54
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 13:16:58 -0700 (PDT)
Message-ID: <f46fedcf-37d0-f355-af4f-5f6890555046@intel.com>
Date: Thu, 26 May 2022 23:16:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: dri-devel <dri-devel@lists.freedesktop.org>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [2/2] dma-buf: Add an API for importing sync files (v9)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Just noticed a small nit on this one :

ordering via these fences, it is the respnosibility of userspace to use

-> responsibility


Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


Cheers,


-Lionel

