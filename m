Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JG3I5J4hWllCAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 06:13:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9B1FA4F5
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 06:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6CB10E044;
	Fri,  6 Feb 2026 05:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MEOSBYez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DD110E044
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 05:13:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E0B3B6001A;
 Fri,  6 Feb 2026 05:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAC3C116C6;
 Fri,  6 Feb 2026 05:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770354828;
 bh=SELwI8x2fY2Mg/K9mrj2wjwWIxG7k5ARqUF6zfTyb/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MEOSBYezow6B4qu+aSRo44cthqiqEA3BlG3oZII+FnHbJlYPtj7Fx9XoNAvblLY7H
 FUxtbdhptk62hXOIOfCXtfLKokYj4726nXEHc46xK5vtLlC5XgBiIRWodDd20QFxam
 5GT5bfq+iwKi38wJw/pquV1S+b0MoWXKMDSYhgm1D3ZqOKMGILDzlZlxdEzCBLeyKl
 S4ndUVXN3i2Jrco/ecJuuvjb+DYl220QhLkTW6Od0OLnpeP5NXIMQoBXxydol7uews
 YDRQMOx1OxDaxvJ8MhNPafURvKkJGsEOp63IPh51Zaa0sM5b1CrlyL/3lINxt8xD4k
 VE1Ivt/Jd1PSQ==
Date: Fri, 6 Feb 2026 05:13:44 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
 samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 09/12] firmware: google: Pack structures for coreboot
 table entries
Message-ID: <aYV4iOKmZgJc0hdb@google.com>
References: <20260203135519.417931-1-tzimmermann@suse.de>
 <20260203135519.417931-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203135519.417931-10-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:briannorris@chromium.org,m:jwerner@chromium.org,m:javierm@redhat.com,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzungbi@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,redhat.com,sholland.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,chromium.org:email,suse.de:email]
X-Rspamd-Queue-Id: 1E9B1FA4F5
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 02:52:28PM +0100, Thomas Zimmermann wrote:
> Pack the fields in the coreboot table entries. These entries are part of
> the coreboot ABI, so they don't follow regular calling conventions. Fields
> of type u64 are aligned to boundaries of 4 bytes instead of 8. [1]
> 
> So far this has not been a problem. In the future, padding bytes should
> be added where explicit alignment is required.
> 
> v2:
> - use aligned 64-bit type instead of __packed__ attribute (Julius)

Changelog should be after "---" otherwise it becomes part of commit message.

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://github.com/coreboot/coreboot/blob/main/payloads/libpayload/include/coreboot_tables.h#L96 # [1]
> Suggested-by: Julius Werner <jwerner@chromium.org>
> Acked-by: Julius Werner <jwerner@chromium.org>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
