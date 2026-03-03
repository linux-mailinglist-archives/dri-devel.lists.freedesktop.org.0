Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCkeNAm3pmk7TAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 11:25:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739FE1EC9E7
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 11:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D6510E075;
	Tue,  3 Mar 2026 10:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MnQm5bf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA57610E075
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772533508;
 bh=lUm3Qv+Y+T2p0B2H2OuXplVZveLD9IckC1/rT/NDcOI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MnQm5bf9YUeMFv/ikj4ECGjJJUpnpHrjXwWNa5BA2cHIn3x2Tu/vZ/I1dKB6/rjyD
 OhWZ6m58s+NRn7lXsMby4r4jUJ5s1D9zvL4EkGltFRnGoi9RFA1dBVGt2+bGiMwV4/
 VU0MRbvrb4sV1YvYuRAydNHe845jsWoTQ2CjK1HSUA09ytOSwC3Filt19F/8m6CA71
 IF/wiv60VSc/JpGCrljPQqRD1pKY9w4y+xgfj0744mkw8qyAYYKOr5HL3KCwP1VXlP
 zPqmOoNDvL2QZ3htWHpV/Ms0I/VNuCvxe3et1No3QKsfbAA3GVVeRYN2Ub1pqPd83j
 5+Cbbnr1rx7/Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BF4D17E005F;
 Tue,  3 Mar 2026 11:25:08 +0100 (CET)
Date: Tue, 3 Mar 2026 11:25:00 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com
Subject: Re: [PATCH] drm/tyr: Use DRM device type alias across driver
Message-ID: <20260303112500.1f47d56e@fedora>
In-Reply-To: <20260302202331.176140-1-deborah.brouwer@collabora.com>
References: <20260302202331.176140-1-deborah.brouwer@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 739FE1EC9E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:dkim,collabora.com:email]
X-Rspamd-Action: no action

On Mon,  2 Mar 2026 12:23:31 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Currently Tyr defines a convenience type alias for its DRM device type,
> `TyrDrmDevice` but it does not use the alias outside of `tyr/driver.rs`.
> 
> Replace `drm::Device<TyrDrmDriver>` with the alias `TyrDrmDevice` across
> the driver.
> 
> This change will ease future upstream Tyr development by reducing the
> diffs when multiple series are touching these files.
> 
> No functional changes are intended.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/file.rs | 7 +++++--
>  drivers/gpu/drm/tyr/gem.rs  | 7 +++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
> index 450be5ab9aaf..31411da203c5 100644
> --- a/drivers/gpu/drm/tyr/file.rs
> +++ b/drivers/gpu/drm/tyr/file.rs
> @@ -7,7 +7,10 @@
>      uapi, //
>  };
>  
> -use crate::driver::TyrDrmDriver;
> +use crate::driver::{
> +    TyrDrmDevice,
> +    TyrDrmDriver, //
> +};
>  
>  #[pin_data]
>  pub(crate) struct TyrDrmFileData {}
> @@ -25,7 +28,7 @@ fn open(_dev: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>> {
>  
>  impl TyrDrmFileData {
>      pub(crate) fn dev_query(
> -        ddev: &drm::Device<TyrDrmDriver>,
> +        ddev: &TyrDrmDevice,
>          devquery: &mut uapi::drm_panthor_dev_query,
>          _file: &TyrDrmFile,
>      ) -> Result<u32> {
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index 514524ae07ef..5cd0cd9585e8 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -5,7 +5,10 @@
>      prelude::*, //
>  };
>  
> -use crate::driver::TyrDrmDriver;
> +use crate::driver::{
> +    TyrDrmDevice,
> +    TyrDrmDriver, //
> +};
>  
>  /// GEM Object inner driver data
>  #[pin_data]
> @@ -14,7 +17,7 @@ pub(crate) struct TyrObject {}
>  impl gem::DriverObject for TyrObject {
>      type Driver = TyrDrmDriver;
>  
> -    fn new(_dev: &kernel::drm::Device<TyrDrmDriver>, _size: usize) -> impl PinInit<Self, Error> {
> +    fn new(_dev: &TyrDrmDevice, _size: usize) -> impl PinInit<Self, Error> {
>          try_pin_init!(TyrObject {})
>      }
>  }
> 
> base-commit: 15da5bc9f3adab7242867db0251fe451ac3ddb72

