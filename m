Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCfYGGLVhWmuHAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 12:49:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AAEFD5DB
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 12:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDAD10E072;
	Fri,  6 Feb 2026 11:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Ce18+USR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0937810E072
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 11:49:48 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f6sp06hL0z9vCS;
 Fri,  6 Feb 2026 12:49:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1770378585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+oezsb71EA+19sF6ntvI6Z0OyRW87p8CjSQDkHxgIA=;
 b=Ce18+USRK4nI/eces2Gp1KgAkFOYnM9SEUOFGvf9rZ9vokFtOq51kOCTMdxccCtu/q5Rfc
 bXnIk8iiow5vACb3dWbAyQ65sU6VOIiD6ajBy1ejdn100guKalZ9zBQL/ON5Jtttpqw8IS
 dgXqUGvugWeJr90xH1ygRzgx9rpa490+gZklR6DS6RIXTJ38bfVdgNrD99i/ieCjAzmZA6
 k4E0skAjZoiDuW2+AcJ5siliqx4XjWl5YnBdIM9u4uFsCY5ecFDKCFt3s2lUMrm4nwlBk2
 4yvSbr1xlc/fDqkVZZ+rGsNqiwVjISaMM8kIHkNBbtcwWcn2XL2p59nl577mtg==
Message-ID: <bd453972-529b-42bc-8b8d-41afd1f5008d@mailbox.org>
Date: Fri, 6 Feb 2026 12:49:41 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
To: dri-devel@lists.freedesktop.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: grc8nmpo1ayzz7u5hk5bhkixa4ncnj94
X-MBO-RS-ID: 17943a7f56649df977d
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,linux.intel.com,kernel.org,ffwll.ch,suse.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,lists.freedesktop.org:email,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,intel.com:email,ffwll.ch:email]
X-Rspamd-Queue-Id: 17AAEFD5DB
X-Rspamd-Action: no action

On 1/15/26 3:45 AM, Marek Vasut wrote:
> Update drm_of_get_data_lanes_count_ep() return value documentation
> to match the drm_of_get_data_lanes_count() return value documentation.
> The drm_of_get_data_lanes_count_ep() is only a wrapper around the
> drm_of_get_data_lanes_count() and therefore returns the same error
> codes.
> 
> Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   drivers/gpu/drm/drm_of.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 4f65ce729a473..cfd0518174de8 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
>    *
>    * Return:
>    * * min..max - positive integer count of "data-lanes" elements
> - * * -EINVAL - the "data-mapping" property is unsupported
> - * * -ENODEV - the "data-mapping" property is missing
> + * * -ve - the "data-lanes" property is missing or invalid
> + * * -EINVAL - the "data-lanes" property is unsupported
>    */
>   int drm_of_get_data_lanes_count_ep(const struct device_node *port,
>   				   int port_reg, int reg,


Is anything missing here or can this be applied ?

Thank you
