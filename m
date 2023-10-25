Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF677D7241
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 19:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD5A10E6B9;
	Wed, 25 Oct 2023 17:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821D210E6B9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WFDsBeNzIWm+1JDBQXpVS6CTIo15VdI1ShkITo+K5HA=; b=iUpD6IUmoMwQbfWK8QONXz+TIZ
 XbaUYVH2mIJDMbcP0ypbOY/8hiN4lrygrt/eP3YBzzgQY+0tUzOoThG6JlPig6ajIzDvdp0D9G29r
 bqrndCqJnRopQ3e25bcj3txoxE51CW+eTndc2ziIX1HH8BbKj/n7cLvq3cO9E6YCg5yLm11wuRaRB
 nXZ8wNNFa+OqpzbnNZi+kll9Dbpm87UthSQiqHRd1UGSK1m3Vuzo5TKd/tm5zFs/dANAl3BBqAhKm
 AYAhmeazQR5lfkkIsZGnu6HSbh1rR4H54gLkKAnO9tRfwxpVxBVAovrf+HZanvu+7G/Wv2/bf5eR/
 SKzuNMfg==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qvhec-007Rr1-Rc; Wed, 25 Oct 2023 19:26:51 +0200
Message-ID: <8b3a8ffc-dd40-88ac-6989-bc727d0045f4@igalia.com>
Date: Wed, 25 Oct 2023 14:26:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] drm/todo: Add entry to clean up former seltests
 suites
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20231025132428.723672-1-mripard@kernel.org>
 <20231025132428.723672-2-mripard@kernel.org>
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <20231025132428.723672-2-mripard@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Maxime,

Wouldn't be nice to add to the TODO list an item regarding the deleted
drm_mm tests? Something just to remember us to develop new tests for it
in the future.

Best Regards,
- Maíra

On 10/25/23 10:24, Maxime Ripard wrote:
> Most of those suites are undocumented and aren't really clear about what
> they are testing. Let's add a TODO entry as a future task to get started
> into KUnit and DRM.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   Documentation/gpu/todo.rst | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 03fe5d1247be..b62c7fa0c2bc 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -621,6 +621,23 @@ Contact: Javier Martinez Canillas <javierm@redhat.com>
>   
>   Level: Intermediate
>   
> +Clean up and document former selftests suites
> +---------------------------------------------
> +
> +Some KUnit test suites (drm_buddy, drm_cmdline_parser, drm_damage_helper,
> +drm_format, drm_framebuffer, drm_dp_mst_helper, drm_mm, drm_plane_helper and
> +drm_rect) are former selftests suites that have been converted over when KUnit
> +was first introduced.
> +
> +These suites were fairly undocumented, and with different goals than what unit
> +tests can be. Trying to identify what each test in these suites actually test
> +for, whether that makes sense for a unit test, and either remove it if it
> +doesn't or document it if it does would be of great help.
> +
> +Contact: Maxime Ripard <mripard@kernel.org>
> +
> +Level: Intermediate
> +
>   Enable trinity for DRM
>   ----------------------
>   
