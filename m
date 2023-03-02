Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 621226A7FEE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 11:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3753010E424;
	Thu,  2 Mar 2023 10:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1B710E424
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677752886; x=1709288886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JNmeX4YMt2MSNNVdS07qrPM9ADyCnWD1IDLvuLJEbCQ=;
 b=f2hXNI2j2On/OtKb8i7pI10Ojyk9CAMBY/1Q4YPexh+ga0tlNv9FgFjI
 vyFAYz9gLKZiggKyfz8cDuUNGk12R3YbrVJGDWJZkKIAFvPWTzKskwO98
 7IZQSvzJAwGfOmM2yG4XlMac3pbPrkJLJevPNqFgr7f8ZYkfJr1XtWp/4
 P6JWFw3aKnHYZk5qiw86rUuaCtTAueSgkPKWE/Kv3M6WSlfEZHN2vAPru
 jKuTfAHcPEXLfWBtfmtf3TbR9l1cjt/12EAndANbRAHux+3KEJgFV1W1T
 WxSFEj+mfiosbpcynS36IqsYF9OfBWctNQ07fbqALy/CwJb+25dxnl0d5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="336981764"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="336981764"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 02:27:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="652359097"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="652359097"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 02:27:49 -0800
Date: Thu, 2 Mar 2023 11:27:47 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 1/2] habanalabs: unify err log of hw-fini failure in
 dirty state
Message-ID: <20230302102747.GD3963532@linux.intel.com>
References: <20230302091517.14896-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302091517.14896-1-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 11:15:16AM +0200, Oded Gabbay wrote:
> From: Dafna Hirschfeld <dhirschfeld@habana.ai>
> 
> print more informative message when failing in dirty state
> 
> Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>> ---
