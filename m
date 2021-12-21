Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2FA47BEAA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 12:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C048B10FA8F;
	Tue, 21 Dec 2021 11:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A6C10FD17;
 Tue, 21 Dec 2021 11:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640085192; x=1671621192;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AhM8CT4Q7vGzVW0UnhNiDkcp9OqhNC9PVsRnh98yPwI=;
 b=kF28pkPf6uPB3+BotSodUj7A+aZqKmGM2wlq5fZybLJP/ryJALManlPS
 jD9psU2Ak2btcfBXAryWv98ucRjK+7XBnW+6bDyhc574r7RBt04AfPE/k
 pqXc0vacZRtHRcVM7+JBavdCLoBFgEcIGNjoQKqd+iz7Mt7Vgkj1n+lvK
 /N3QiOVn/337CoVlIs1MPDTv4G07tLWI1ZEtR16toBjFCoWSF63Nz6SLB
 vjh/5Bs6wcTJqfcqb1TRNVsW4t98Sz62rNGlO1oS8ub0NodZa+hEGJuql
 iDgfvKoP1gE44Fp5Q4vTAmKsSoUllsWwf2M4uUUDghB9bumTTJGkC10pI Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="221051243"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="221051243"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 03:13:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="607030086"
Received: from pjordan-mobl.ger.corp.intel.com (HELO [10.252.23.37])
 ([10.252.23.37])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 03:13:10 -0800
Message-ID: <781f3363-352e-1671-a826-58acbc1d1b43@intel.com>
Date: Tue, 21 Dec 2021 11:13:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 2/7] drm/i915: Break out the i915_deps utility
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211217145228.10987-1-thomas.hellstrom@linux.intel.com>
 <20211217145228.10987-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211217145228.10987-3-thomas.hellstrom@linux.intel.com>
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

On 17/12/2021 14:52, Thomas Hellström wrote:
> Since it's starting to be used outside the i915 TTM move code, move it
> to a separate set of files.
> 
> v2:
> - Update the documentation.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
