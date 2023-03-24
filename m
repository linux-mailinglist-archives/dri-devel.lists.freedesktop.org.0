Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4606C79D6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 09:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A3910EB9F;
	Fri, 24 Mar 2023 08:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6980E10EBA3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679646710; x=1711182710;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NnWo6nHOxz1TY8xTh43YIWJYKwa2BiqdOlD847sLryE=;
 b=O+ejKr5CMYdVe/stj3nuP9sGofm4Avd9YMcy9D1Nlel7p79q+yBsBEAd
 hHdOATu3eYGvChDQ6Rc6ch2ie5amO8rZCrTIagkQ9L4GfQkS3huCJsmLL
 g8pDm9FSmsbSGI4cY0yQ6/z9DbLmU0TJWB6cHUaPMJ5ElHZsYPoVPBpjG
 M1idhA2ge4yMlQoShLQBlHzlYTYQit8PUiy4Up7rHfcHTiX4eqjsjq1vx
 efHLr3heALhHTcq88ImLqc6dl2tEb+pEitn/Ie3aKsI/8XkSeZkwKUN32
 0g4bzGyd3pRJ+C/LauMIcmyFpzEAH7mcEHrhP7S5d+kgBIujauYIJdo+I w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404644337"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="404644337"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="747070723"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="747070723"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:31:48 -0700
Date: Fri, 24 Mar 2023 09:31:47 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 6/6] accel/habanalabs: send disable pci when compute ctx
 is active
Message-ID: <20230324083147.GK2130371@linux.intel.com>
References: <20230323113525.959176-1-ogabbay@kernel.org>
 <20230323113525.959176-6-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323113525.959176-6-ogabbay@kernel.org>
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
Cc: Tal Cohen <talcohen@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 01:35:25PM +0200, Oded Gabbay wrote:
> From: Tal Cohen <talcohen@habana.ai>
> 
> Fix an issue in hard reset flow in which the driver didn't send a
> disable pci message if there was an active compute context.
> In hard reset, disable pci message should be sent no matter if
> a compute context exists or not.
> 
> Signed-off-by: Tal Cohen <talcohen@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
