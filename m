Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AA131E780
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 09:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992796EA01;
	Thu, 18 Feb 2021 08:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97C16E9FE;
 Thu, 18 Feb 2021 08:35:17 +0000 (UTC)
IronPort-SDR: 3WWmHqYTW59IHyHRSNwXt8pQJqTvE8LfjlOwQNUr/v8hpWF6xV9u8O2MmO68yBHFHuR8aze/PR
 eFsEwDQWMIVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="183504705"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="183504705"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 00:35:15 -0800
IronPort-SDR: uwBmf4yGcSmtx7h+yFIaOUYqETNcs87WxE3iddYstACQozLswauYt27Nd7xgxrensaeXIaOJgF
 PRAzgaJt9KCQ==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="400405752"
Received: from cklinger-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.38.13])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 00:35:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: lyude@redhat.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [RFC v4 10/11] drm/dp: Extract i915's eDP backlight
 code into DRM helpers
In-Reply-To: <355ce12ec69a9b5f20b4a856a40c8abf413be5c0.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210208233902.1289693-1-lyude@redhat.com>
 <20210208233902.1289693-11-lyude@redhat.com>
 <20210211041540.GI82362@intel.com>
 <355ce12ec69a9b5f20b4a856a40c8abf413be5c0.camel@redhat.com>
Date: Thu, 18 Feb 2021 10:35:05 +0200
Message-ID: <87mtw1ai4m.fsf@intel.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 greg.depoire@gmail.com, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Feb 2021, Lyude Paul <lyude@redhat.com> wrote:
> I think it wouldn't be a bad idea to just address this with a followup series
> instead and use the old DRM_DEBUG_* macros in the mean time.

aux->dev is there, could also use dev_dbg et al. in the mean time. They
handle NULL dev gracefully too if the driver didn't set that.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
