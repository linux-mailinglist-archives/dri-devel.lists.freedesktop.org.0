Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0F2695B37
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 08:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5AB10E042;
	Tue, 14 Feb 2023 07:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFC010E042
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 07:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676361204; x=1707897204;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cM4LmkGtpEdKy1XzmEMkCrAbuWfRYhF9QWNHUe+unqM=;
 b=iHUt3EwFpTPJEDpiSv0uTDUbG3dZyYeoFsCzJigkQKJuerWMC2Dj8cou
 iEJlrABwb1WL79OR8OPD4jIhVMN1+69sCC6nnJH+xxNFm6ywERA+LpVja
 fHAdp3927arZrrbhQYeuQA7UennMFEczyI6ERip5WRHBUCLlwdAZOm+Tb
 E2Qnrj5808V6rVjwK3Q7wlhSEEwiqFPNAitCQoiU0GznBNtGJJIdhtxq2
 7qYdvzbbQ8PIo26PZBTFycIDwB7WlPa3D1m5o+LCJjhwrYSv0krj7olHd
 /LkwiHwlB3ToHWevvfBLCL6YlC61AxuLwIYVVwzZQlpjEegHRwzwulYGa g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="314746823"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="314746823"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 23:53:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="914649066"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="914649066"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 23:53:22 -0800
Date: Tue, 14 Feb 2023 08:53:20 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: DRM accel and debugfs/sysfs
Message-ID: <20230214075320.GA2824540@linux.intel.com>
References: <20230201152003.GA2623449@linux.intel.com>
 <5dfdf605-55a2-28d3-aecf-713a632b2431@igalia.com>
 <5651b98b-ace8-5009-409f-d6032cb5374d@quicinc.com>
 <bdf077e8-87ff-108a-e1fe-44bd6db79674@igalia.com>
 <Y+Pk185JOBg7/AKN@phenom.ffwll.local>
 <CAFCwf11-46pknoh_S=GYWeQFP3Q6x+k7EcqsOapPEEji5Dygnw@mail.gmail.com>
 <755e6102-9248-03fb-4bd7-089341427165@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <755e6102-9248-03fb-4bd7-089341427165@igalia.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 09, 2023 at 10:17:26AM -0300, Maíra Canal wrote:
> Christian sent today a patchset addressing some problems in the debugfs
> API [1]. As he is planning to remove the debugfs_list, I guess it would
> be better to wait a while to align accel with the debugfs API,
> considering that it currently changing.
> 
> Also, it would be nice to get feedback from the accel side.
> 
> [1] https://lore.kernel.org/dri-devel/613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com/T/

I'll cc accel people and continue the discussion there.

Regards
Stanislaw

