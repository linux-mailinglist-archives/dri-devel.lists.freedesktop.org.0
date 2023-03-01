Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB95D6A6D1A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 14:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5149E10E140;
	Wed,  1 Mar 2023 13:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B32D10E140
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677677694; x=1709213694;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nCkQrDvQXLRig5d/4wkfCnX7rBuk8IiIe+69AtYyiLY=;
 b=AaXjreTNyXjhhrinGrO655Rvz0u0tHFZqFimnNrxeFlhtJiNH37/Y0AJ
 yc3IGWb3HwvyXtFcZuTpJZe3Uu+AbiWXgQlUh8npHtXIMVSRhvBDzrdAo
 Y8JRAsIeJN4FyrrukRIm7b+v06JbE/FnDaUp4MeKMUux4THbTmmbJCODz
 ggzVzJh55KFzPD7/eCuldWaMO0WmNKoQMB32WsyuI5/fcegTScfLJdgZ/
 qEQhycqr9qa9K7oPNDszdyPQqyQw0QyjvTVagIwOgsvxRX3Rsjo11n1yN
 eO+p3LFN57TPh6LfuNxmj2rxhWq4ThP2odOcgGmPBfuwKGcEyLKCyWN72 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="334441816"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="334441816"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:34:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738646916"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="738646916"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:34:53 -0800
Date: Wed, 1 Mar 2023 14:34:51 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 5/6] habanalabs: use notifications and graceful reset for
 decoder
Message-ID: <20230301133451.GH3815307@linux.intel.com>
References: <20230227111306.3985896-1-ogabbay@kernel.org>
 <20230227111306.3985896-5-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227111306.3985896-5-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 01:13:05PM +0200, Oded Gabbay wrote:
> From: Tomer Tayar <ttayar@habana.ai>
> 
> Add notifications to user in case of decoder abnormal interrupts, and
> use the graceful reset mechanism if reset is required.
> 
> Signed-off-by: Tomer Tayar <ttayar@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

