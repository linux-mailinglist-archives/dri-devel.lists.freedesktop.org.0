Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991A2316713
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 13:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43E16E049;
	Wed, 10 Feb 2021 12:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3127F6E049
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 12:47:35 +0000 (UTC)
IronPort-SDR: hPm2YDfOh9CB1VEIi4+1+uSjtbqYlrZFfZacUwnrXnCfZLVunW1velaxBUZ+yXSQBY3c+tVFQQ
 NpI9Adv7L46g==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182130139"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="182130139"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 04:40:31 -0800
IronPort-SDR: /OOriOnbA9GvacZvRk+hMmUhkhITDx/8m8sBFH2KgomCoHdCBjN0xHmfMvJR9mR7RtdKPz1rdC
 r01tpTBj2idg==
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="396693394"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 04:40:28 -0800
Date: Wed, 10 Feb 2021 14:40:24 +0200
From: Imre Deak <imre.deak@intel.com>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 5.10 078/120] drm/dp/mst: Export drm_dp_get_vc_payload_bw()
Message-ID: <20210210124024.GA65741@ideak-desk.fi.intel.com>
References: <20210208145818.395353822@linuxfoundation.org>
 <20210208145821.517331268@linuxfoundation.org>
 <20210210122517.GA27201@duo.ucw.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210122517.GA27201@duo.ucw.cz>
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
Reply-To: imre.deak@intel.com
Cc: Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Ville Syrjala <ville.syrjala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 10, 2021 at 01:25:17PM +0100, Pavel Machek wrote:
> Hi!
> 
> > commit 83404d581471775f37f85e5261ec0d09407d8bed upstream.
> > 
> > This function will be needed by the next patch where the driver
> > calculates the BW based on driver specific parameters, so export it.
> > 
> > At the same time sanitize the function params, passing the more natural
> > link rate instead of the encoding of the same rate.
> 
> > Cc: <stable@vger.kernel.org>
> 
> This adds exports, but there's no user of the export, neither in
> 5.10-stable nor in linux-next. What is the plan here?

the export is used by the upstream 
commit 882554042d138dbc6fb1a43017d0b9c3b38ee5f5
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon Jan 25 19:36:36 2021 +0200

    drm/i915: Fix the MST PBN divider calculation

which I can also see now applied to 5.10.15:

commit 0fe98e455784a6c11e0dd48612acd343f4a46fce
Author:     Imre Deak <imre.deak@intel.com>
AuthorDate: Mon Jan 25 19:36:36 2021 +0200
Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CommitDate: Wed Feb 10 09:29:18 2021 +0100

    drm/i915: Fix the MST PBN divider calculation

    commit 882554042d138dbc6fb1a43017d0b9c3b38ee5f5 upstream.

--Imre
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
