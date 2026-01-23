Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPcXD7yOc2l0xAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:07:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A6C777B3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF4910EB0D;
	Fri, 23 Jan 2026 15:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DBA0D10EB0D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 15:07:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E71571515
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 07:07:29 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 470643F632
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 07:07:36 -0800 (PST)
Date: Fri, 23 Jan 2026 15:05:58 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] drm/panthor: Add src path to includes of panthor_gpu.o
Message-ID: <aXOOVtGqYdP0sto7@e142607>
References: <20260123-panthor-tracepoint-build-fix-v1-1-7d67b7c0ae9b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123-panthor-tracepoint-build-fix-v1-1-7d67b7c0ae9b@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:nicolas.frattaroli@collabora.com,m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sashal@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	NEURAL_SPAM(0.00)[0.497];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,arm.com:email]
X-Rspamd-Queue-Id: A2A6C777B3
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 02:11:44PM +0100, Nicolas Frattaroli wrote:
> The file that defines CREATE_TRACE_POINTS needs to have the src
> directory added to its include paths, or else the build may fail, as
> define_trace.h won't be able to find the included trace file.
> 
> Add it to the Makefile's CFLAGS for panthor_gpu.o.
> 
> Fixes: 52ebfd8d2feb ("drm/panthor: Add tracepoint for hardware utilisation changes")
> Reported-by: Sasha Levin <sashal@kernel.org>
> Closes: https://lore.kernel.org/r/aXLyzd6pMmexwWlY@laps/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> index 753a32c446df..dd15d52a88ba 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -14,3 +14,5 @@ panthor-y := \
>  	panthor_sched.o
>  
>  obj-$(CONFIG_DRM_PANTHOR) += panthor.o
> +
> +CFLAGS_panthor_gpu.o := -I$(src)
> 
> ---
> base-commit: 15bd2f5d52de890f745ac0c60a44cd27d095bb0d
> change-id: 20260123-panthor-tracepoint-build-fix-fa99f917f7ed
> 
> Best regards,
> -- 
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
