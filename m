Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 477B7399BF9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 09:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2F06F41B;
	Thu,  3 Jun 2021 07:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A92F6F41B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 07:51:41 +0000 (UTC)
IronPort-SDR: 4HSLXwdVvyaCAfThqukcE3IWH08qeC/B9YhkVBf/g40Wz52Mn4l/P616LzfP5v7JnJ8k1ZqgJ8
 MbRgDc3ev91A==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="203802157"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="203802157"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 00:51:38 -0700
IronPort-SDR: Ys7EkF56CjQrLCJT0pfvJvDlRbsx2tFeBnq6dBD/Q6hYlgOXeHyMl9jcPGS85GAANq3c2vZBla
 VsSJ5XULNkpg==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="480092025"
Received: from rdavies-mobl.ger.corp.intel.com (HELO [10.252.26.83])
 ([10.252.26.83])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 00:51:36 -0700
Subject: Re: [PATCH 03/10] drm/ttm: flip over the sys manager to self
 allocated nodes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 thomas_os@shipmail.org, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <20210602100914.46246-3-christian.koenig@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <a0a3fd10-37f5-5f46-b082-6537f9044bd2@intel.com>
Date: Thu, 3 Jun 2021 08:51:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602100914.46246-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 02/06/2021 11:09, Christian König wrote:
> Make sure to allocate a resource object here.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
