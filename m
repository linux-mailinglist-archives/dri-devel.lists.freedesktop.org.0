Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499277E05FB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 17:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD1C10EA1B;
	Fri,  3 Nov 2023 16:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C49E10EA1A;
 Fri,  3 Nov 2023 16:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699027217; x=1730563217;
 h=message-id:date:mime-version:to:from:subject:
 content-transfer-encoding;
 bh=W2rIx8079F1RztiK5qWjXtY+YzADcCaFWWRk47QxPiU=;
 b=ksg81vxMFHH6L4vSBiLIncB9ViBTPVLvy+3KJ+ztKIQXXgtw7UGotHEn
 PciJslOwpt2jqL6eJba5EGmkPiRYP47x3gZU67RSSJGboY5I1qE2M4tlK
 ZM3E2HImuGC6Kd4VPZaE7/45Vkyz2vPExY4BiTTq6pSJw8mq1HgNUDe+V
 ZODYpU2ukFjrQKlHvFed2dMzseS2Gtt//dvd6WQFRH/gsRgBN+tuWHBmn
 SVZ7d49Wmcwjaxr2Rqmka8zy+5Sjf8bQzruahsA4qGZLpgyBbU+/+QrtY
 4vOtS//HwGrNxIUpfYPfIb3qmzhdktnHdfA4ZeEOwu2eEVAjXpUcv+RqG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388796088"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="388796088"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 09:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738109513"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="738109513"
Received: from shouweis-mobl1.ccr.corp.intel.com (HELO [10.249.254.68])
 ([10.249.254.68])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 09:00:14 -0700
Message-ID: <c148fc2c-da83-c3d6-02ac-f9c632ed19ed@linux.intel.com>
Date: Fri, 3 Nov 2023 17:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Subject: VM_BIND locking document
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Danilo, Boris

As you might know we have a task to complete a VM_BIND locking document 
including userptr gating the Xe driver upstreaming. I have version 3 of 
that document out as a patch

https://patchwork.freedesktop.org/series/122508/

updated with the latest gpuvm changes, including the fine-grained 
locking plus userptr locking as done in the Xe driver.

It would be greatly appreciated if you could read through and come with 
suggestions / objections / acks.  The idea is this document will simply 
be updated as drm_gpuvm evolves. In particular the userptr area 
currently follows Xe locking and probably needs to be adjusted if / when 
we get userptr in drm_gpuvm.

Thanks,

Thomas


