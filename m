Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCjWBCwllGnXAAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:22:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC79149E2F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A6F10E48F;
	Tue, 17 Feb 2026 08:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="J014N6Ua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D228410E063;
 Tue, 17 Feb 2026 08:21:56 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fFXg513Dfz9t5M;
 Tue, 17 Feb 2026 09:21:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1771316513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pi28vdSvaRdgQlZvv9XjaVuEVLRh69xvypyxyKxT0lc=;
 b=J014N6UaPVvmn7gwPG+BTYpubqlD2QsIK4jg8FBkOuzaC6QFwdu1TvSHl8fstX2aqRwJB/
 fIUvEJlbfaIqN2hKXCrhIzfsa5iwFHnwThEm86ekPhiAy0XezA2l47AVoCqhi0gzIqNRKv
 Eq91lCoWbWQyca0/e9T+sd6gAr09IX3t0VJdKo85MA3wqKOjwpX7sgNOKWbidL1gbVF/ru
 MSaRfzt4+FzW/o12SxFt70rQ512+bt199Rj2Pi+hkBt6rxnc4vdAsuACfBSIhMn9RWqXbn
 m9YtGajhbFCPYIGivvOuJfc9XWT1Ig2Zbf2E/ch9hZ+0nO1F5i4X7W0C+CTe5A==
Message-ID: <c6a852ae-4edf-4336-9f2a-448c296cc045@mailbox.org>
Date: Tue, 17 Feb 2026 09:21:46 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v4 23/27] drm: Add passive_vrr_disabled property to crtc
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, daniel@fooishbar.org
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
 <20260216164516.36803-24-tomasz.pakula.oficjalny@gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20260216164516.36803-24-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bab2b5f730da6c68bdb
X-MBO-RS-META: e7z64sqjybjr64r3sok1s13kged1xk8c
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,fooishbar.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: DBC79149E2F
X-Rspamd-Action: no action

On 2/16/26 17:45, Tomasz Pakuła wrote:
> Many TVs and other HDMI sinks suffer from blanking and possibly other
> glitches when VRR is toggled. With VRR present on such sinks and
> vrr_on_desktop enabled, they behave like the signal is always variable,
> even in fixed refresh rate situations. DisplayPort and eDP enforce
> seamless VRR transitions but HDMI unfortunately doesn't.
> 
> Keep VRR toggled if it's supported and not explicitly disabled. It can
> be used for any VRR sinks, but this is mainly targeted for HDMI.
> 
> Functionally, for an end user, this is the same as normal, fixed refresh
> rate mode. The only difference is that sink is kept in VRR state which
> enables seamless transitions into/out of variable refresh rate.
> 
> Basically, the driver shouldn't change it's behavior around VRR_ENABLED
> set to false, jut keep sending info packets/frames with VRR/FreeSync/
> G-Sync/HDMI VRR active.
> 
> Enabled by default for sinks that claim it's support

Having a negation term like "disabled" in the property name can be confusing (as it involves double negation when the property value is 0) and is better avoided.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
