Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF05517873
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 22:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C5810E388;
	Mon,  2 May 2022 20:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF2B10E388;
 Mon,  2 May 2022 20:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651524284; x=1683060284;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=51GFpIeuIbntBhS0AYpR1PV4fHQtGUVTQ4aSGU62VF8=;
 b=CCUkTilrubPNvim6Gz9Sd023wdVelE/GREWbAdOXKMI3rj0cnD3zZaBB
 Wb0+mc5rrsmDlsaTXh0srotuSDaYEdXrbuhy7PKm8vK6URAp/BxJMIepj
 OnOm6JH1NZG3km83F9RXOhPO5gEhf1/vh8vI9zGmf0w0T+9uNLKS3yV58
 u6Eee2rSmIBkux7XQtYdcz8XuQ3TxSY5aAHD13shF/6TkNe87z+6nIjI5
 +mRcDYlGAdrvC0dfP5sKv8URy0WLm3Oji14Inx+rYf2Zhzk6XphFWRsFa
 xyIneEUF/oENqX26zYHmUPKTyykNXBbPg97O22w9HQegVS3a0O3/0eOwU w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266911162"
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="266911162"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 13:44:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="583891996"
Received: from alwohlse-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.11.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 13:44:44 -0700
Date: Mon, 2 May 2022 13:44:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 01/11] drm/i915/pvc: add initial Ponte Vecchio definitions
Message-ID: <20220502204441.2zotzzagf4cnrvym@ldmartin-desk2>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220502163417.2635462-2-matthew.d.roper@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 09:34:07AM -0700, Matt Roper wrote:
>From: Stuart Summers <stuart.summers@intel.com>
>
>Additional blitter and media engines will be enabled later.
>
>Bspec: 44481, 44482
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
