Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A771727B26
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 11:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F33710E59E;
	Thu,  8 Jun 2023 09:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F2410E061;
 Thu,  8 Jun 2023 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686216288; x=1717752288;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yMTR43sundDuCLxrhPjvMEGgD8zveygrCNqUiPWMafE=;
 b=Vk6HAEJP9MJwYjHxYD6AMJ7mMkvN44Rr6A2gpNPkw6wNOOQIeeNAzbgn
 3bUORGh8HCvNPguR5nHALXvvPwf03MuPQghN+FOfHRaS/TQYrbf25El7s
 IWhe0fS40EzzBW+G1l8XoT3paA0sCYNTHy2dnV8evBOMb8FRHVb+oQCQr
 CTUCchFG7VlInxfsUjF3aDPedSdD3V10018K4BYUKIqdoaokc0vAeSHL8
 5s7ENw4XojdUBwCTzR6Cjzq/1y8MA0cCzVWLS/iRF4FPy7ql0X2V7I48y
 jBDzdvPKAplhqIwoXHkhwzRc8RytOmcO7vebo+7IdGUKs+QAtp7OpkHyH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="359728090"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="359728090"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 02:24:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822542113"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="822542113"
Received: from bapostu-mobl.ger.corp.intel.com (HELO [10.251.211.75])
 ([10.251.211.75])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 02:24:44 -0700
Message-ID: <69bbc0e4-dfa2-1331-3b5d-a1ed6b335af7@linux.intel.com>
Date: Thu, 8 Jun 2023 11:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PULL] drm-MISC-fixes
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <ZIGUHBz7+LsqN2nm@jlahtine-mobl.ger.corp.intel.com>
 <0182c0fb-fa03-9a3b-29c0-25706cc89c4a@linux.intel.com>
 <87zg5as5g7.fsf@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87zg5as5g7.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

On 2023-06-08 10:50, Jani Nikula wrote:
> On Thu, 08 Jun 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
>> Oops, forgot to fix topic. :-)
> And replied to the wrong message. ;)
>
> But why was it wrong, not using dim?

Gah! I was grabbing the tmp file used for the pull request from dim, but it doesn't recognise my MTA.

As repentence, I will fix my tooling to generate the mail directly from dim, instead of carefully stealing the most recent pull request as new and filling in the contents. :-)

Cheers,

~Maarten

