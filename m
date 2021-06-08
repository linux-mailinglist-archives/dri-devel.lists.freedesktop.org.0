Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593B939F0BB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D91C6EB2F;
	Tue,  8 Jun 2021 08:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D48C6EB2F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 08:23:13 +0000 (UTC)
IronPort-SDR: G4AJyeIHgZI34gXlnEws3fOqSkboU3IJrRIt9lz4mlFcHKRVn6YkiKin3Nll3riOfjFOfTBLns
 p+plnbHo83+A==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268652265"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="268652265"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:23:11 -0700
IronPort-SDR: QPtw+S5zpASY+oyt7F/I2V2d/+8OWkJWgTBlFxoF9sv9hkeSr76dgDxTTIZSk8X/96z7VgKKO4
 +wTQAzyWcGcg==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="634997041"
Received: from delmer-mobl.ger.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:23:10 -0700
Subject: Re: [PATCH] drm/ttm: fix pipelined gutting v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210608081931.11339-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <87e9494d-a99f-ca93-da3b-febdd94408a5@linux.intel.com>
Date: Tue, 8 Jun 2021 10:23:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608081931.11339-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 6/8/21 10:19 AM, Christian König wrote:
> We need to make sure to allocate the sys_mem resource before the point
> of no return.
>
> v2: add missing return value checking, also handle idle case
>
> Signed-off-by: Christian König <christian.koenig@amd.com>

lgtm.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


