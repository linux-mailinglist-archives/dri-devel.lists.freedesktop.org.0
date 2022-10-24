Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A07E60AE27
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 16:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5428910E7FC;
	Mon, 24 Oct 2022 14:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B0010E7E9;
 Mon, 24 Oct 2022 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666623029; x=1698159029;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i8eQYIzEW5kl0Sx33p/IjESQTeKXMAvAqTYx4ZFb0LY=;
 b=KGsdUZo1bInRYQOEIgDHL/ch13S8AFS8b3gWthmOt1Bn5grs/tNRjELp
 fFCtYRvJSyhJQyF48dB+TilQTk5yHG6U+UMG8jPK7b6mU4sOkz0jR833P
 8CgfZZk+WnlnYoG1NcN0fY+T8S5YO5Fmpd08pQbjcxpTwhDDeCiLHqzhb
 RF2Qu4K8QEq62xCxOt6H0HsC3iBzygFshpHpGYdRxXvmGnugw2HvqS3Ih
 ahTsEpAeTpFyGOnGTOtGJMKhy7AiLcJJ2WzqoTSS3rBhF3FIPk3tH6653
 01AFQXHMqtRAKWktfUgCBS7mxRz1VT8+5GQIiNhslg242+pgGukhDU+CX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="393752374"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="393752374"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 07:50:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="736436080"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="736436080"
Received: from cwilso3-mobl.fi.intel.com (HELO [10.252.13.22]) ([10.252.13.22])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 07:50:28 -0700
Message-ID: <19db9b97-4eeb-10f5-902c-5649c072585a@intel.com>
Date: Mon, 24 Oct 2022 15:50:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.0
Subject: Re: [PATCH] drm/i915: Remove unwanted ghost obj check
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20221024144558.27747-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221024144558.27747-1-nirmoy.das@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/10/2022 15:45, Nirmoy Das wrote:
> vm_fault_ttm() should not expect ttm ghost obj so remove that check.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
