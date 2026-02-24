Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jhlXGFnqnGnfMAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 01:01:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57333180155
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 01:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4E710E466;
	Tue, 24 Feb 2026 00:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="h1uU0yAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC1D10E464;
 Tue, 24 Feb 2026 00:01:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771891280; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MXnnDmygS/SyyPK2FhSI5pg394hYfn2Oi8bTFHFJL/c/TqCkZOCafI9Vg9C3CLiDNDlZs6tFGqRZSJuRU+CYWyekBX7kEmx529O7LUR6A6FkqUP/41aBGN/JVfpR+h2OqZ4ukF+lyJINBXMlskxaiNnTsUxIYnQnriJYIBZEJMI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771891280;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1GPnaeyQQ+YgeIhvlTV26Nxf1dbQRvncvT2ZavlelMQ=; 
 b=WjZVC8aDSpZebP4UNM7nrNGrZ36AY9eJ70Z5LcKQzkGHQN8PZ2FsR5Sm6GJl/w8OzVD+mK19uG5KQOK7FwdJuIuUw268W8JpgfzXKJa4Gwk1SWUp4seoKHougJ3gn4m7cpi8SD3bOL+9TQj9SoppQYR9Z9iEzD7GmpTAz7iw9W0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771891280; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=1GPnaeyQQ+YgeIhvlTV26Nxf1dbQRvncvT2ZavlelMQ=;
 b=h1uU0yAzHLTU5tOyxG/3DNEutnkqI0yy9qqKwAByLa9df5he8qaw3QRqjyLrZZZM
 a2srOd07+2HqCAnhbu9Z/L9IujFWr9oq1hX5Kxz8bzYhd6jMIGxERp/GhlfK6WTZdBG
 BklyIRM39S2vojusLLlC/k1/XLNaFJRATwXInUTM=
Received: by mx.zohomail.com with SMTPS id 1771891279476376.3950125576306;
 Mon, 23 Feb 2026 16:01:19 -0800 (PST)
Date: Mon, 23 Feb 2026 16:01:18 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/tyr: Clarify driver/device type names
Message-ID: <aZzqTv0IHGUfiLVN@um790>
References: <20260223204648.208886-1-deborah.brouwer@collabora.com>
 <DGMO1YUKS8WK.H2FG6YL1ROC3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGMO1YUKS8WK.H2FG6YL1ROC3@kernel.org>
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 57333180155
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:41:04PM +0100, Danilo Krummrich wrote:
> On Mon Feb 23, 2026 at 9:46 PM CET, Deborah Brouwer wrote:
> > Currently the `TyrDriver` struct implements both `platform::Driver` and
> > `drm::Driver`. For clarity, split up these two roles:
> >  - Introduce `TyrPlatformDeviceData` to implement `platform::Driver`, and
> 
> I think this should be TyrPlatformDriverData instead, i.e. it is the driver's
> private data that happens to be stored in (and owned by) the platform device.
> 
> The corresponding C setter is also called platform_set_drvdata() and not
> platform_set_devdata().

Yeah, I think you’re right, since we use this struct for
platform::Driver. I’ll rename it and send a v3.

> 
> >  - Introduce `TyrDrmDriver` to implement `drm::Driver`.
> >
> > Also rename other variables to reflect their roles in the DRM context:
> > - Rename `TyrDevice` to `TyrDrmDevice`
> > - Rename `TyrData` to `TyrDrmDeviceData`
> 
> Although it might sound contradictory at first, I think for a drm::Device it is
> OK to name it TyrDrmDeviceData as opposed to TyrDrmDriverData (although that
> would make sense as well and I'd probably prefer that).
> 
> The reason is that a platform::Device being a bus device may store different
> *driver specific* data types thoughout its whole lifetime, i.e. a platform
> device may be bound to multiple different drivers throughout its lifetime.
> 
> But a drm::Device being a class device is always *statically* typed over it's
> private data type, i.e. drm::Device<TyrDrmDeviceData>.

I'd definitely like to keep TyrDrmDeviceData for this struct because of
its relationship to the drm::Device.

Thanks for your review.

> 
> > - Rename `File` to `TyrDrmFileData`
> > - Rename `DrmFile` to `TyrDrmFile`
> >
> > No functional changes are intended.
> >
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> 
> Otherwise LGTM.
