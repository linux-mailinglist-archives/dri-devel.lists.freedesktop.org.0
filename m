Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGQoICA1eml+4gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 17:11:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49916A53CE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 17:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9497710E74A;
	Wed, 28 Jan 2026 16:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 483 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jan 2026 16:11:08 UTC
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872B610E73B;
 Wed, 28 Jan 2026 16:11:08 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
 client-signature ECDSA (secp384r1) client-digest SHA384)
 (Client CN "*.hostsharing.net",
 Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 0299E2C0781D;
 Wed, 28 Jan 2026 17:03:04 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id ED2A733097; Wed, 28 Jan 2026 17:03:03 +0100 (CET)
Date: Wed, 28 Jan 2026 17:03:03 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Lenny Szubowicz <lszubowi@redhat.com>,
 Francesco Pompo <francescopompo2@gmail.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/i915/display: Disable display for iMac's
Message-ID: <aXozN_-GCw4bLjmE@wunner.de>
References: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
 <20260128145855.1071-3-atharvatiwarilinuxdev@gmail.com>
 <26c4e0b7f9c25f405401288d13fc7e5097e9c7f5@intel.com>
 <aXotLnGvZu4Ib0Vx@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXotLnGvZu4Ib0Vx@intel.com>
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
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,intel.com,ursulin.net,ffwll.ch,suse.de,redhat.com,alien8.de,vger.kernel.org,lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.871];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:mid]
X-Rspamd-Queue-Id: 49916A53CE
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:37:18PM +0200, Ville Syrjälä wrote:
> On Wed, Jan 28, 2026 at 05:23:51PM +0200, Jani Nikula wrote:
> > On Wed, 28 Jan 2026, Atharva Tiwari <atharvatiwarilinuxdev@gmail.com> wrote:
> > > Disable display on iMacs, as they can't do link training
> > > on the internal display.
> > >
> > > (tested on iMac20,1)
> 
> I guess the main problem with a hack like this is that you won't
> be able to get deep pkgC states due to the display hardware not
> going into DC5/6.

If patch [1/2] in this series results in a power regression,
I'd say it needs to be reworked.  Either exclude iMacs from
the set_os protocol or find a way to power down the iGPU again
once the kernel has assumed control.

I wonder what macOS does.  If the iGPU is exposed by set_os,
surely macOS must be able to power down the iGPU again,
so we should be doing the same.

Thanks,

Lukas
