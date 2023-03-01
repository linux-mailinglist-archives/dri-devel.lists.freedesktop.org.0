Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3985F6A6CF7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 14:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6513010E148;
	Wed,  1 Mar 2023 13:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD1410E148
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 13:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677676901; x=1709212901;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5Ns6mKslXJR1+4H/RaboOnQcW8KRAah3NoP5Atcd/xU=;
 b=EpxX5CmDb1IlsqPtBEwyCfezYxIae6mPQLbqssva+HfwCC0UGLtuQrcZ
 DN9Gll1HZDYhXbXdRRkq51E6vHKjsDalmDtL7tb3/ZK1y2npK+T/4Ecnr
 akyKh29ENxBOb8w6L9seq2jqeJzRI6xa/kxoedkH3Ud7CgEA9zfhxqRcm
 eOLS3axwuLrcOSsPVkcG1t+xEK9K8jzeih/w0+giV1yUGoaeOJKlkUbxL
 6EfNIrJEuRzqtHH54e81rNHDIXkgy/w2ZgJWlsBDu8VyYCKeT2RH41aCH
 3DkQoa3bJ/C+RA4+6HBonlGmkCi45NPR5kmrLzYtip3j/5TratrL1IVG+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="335898788"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="335898788"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:21:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="674552456"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="674552456"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:21:39 -0800
Date: Wed, 1 Mar 2023 14:21:37 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 2/6] habanalabs: add device id to all threads names
Message-ID: <20230301132137.GF3815307@linux.intel.com>
References: <20230227111306.3985896-1-ogabbay@kernel.org>
 <20230227111306.3985896-2-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227111306.3985896-2-ogabbay@kernel.org>
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
Cc: Sagiv Ozeri <sozeri@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 01:13:02PM +0200, Oded Gabbay wrote:
> From: Sagiv Ozeri <sozeri@habana.ai>
> 
> Compute driver threads names will start with hlX-*, when X is the
> device id.
> This will help distinguish them from the NIC thread names.
> 
> Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
