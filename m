Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h754KWE3e2kYCgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:33:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE4AEC1C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B3910E24F;
	Thu, 29 Jan 2026 10:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EFB10E24F;
 Thu, 29 Jan 2026 10:33:02 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
 client-signature ECDSA (secp384r1) client-digest SHA384)
 (Client CN "*.hostsharing.net",
 Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 6712B2C06849;
 Thu, 29 Jan 2026 11:33:00 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 5E92C2639F; Thu, 29 Jan 2026 11:33:00 +0100 (CET)
Date: Thu, 29 Jan 2026 11:33:00 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: airlied@gmail.com, ardb@kernel.org, bp@alien8.de,
 dri-devel@lists.freedesktop.org, francescopompo2@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, javierm@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, lszubowi@redhat.com,
 rodrigo.vivi@intel.com, simona@ffwll.ch, tursulin@ursulin.net,
 tzimmermann@suse.de
Subject: Re: [PATCH v2 1/2] efi/libstub: enable apple-set-os for all apple
 devices
Message-ID: <aXs3XOYucVna8eGH@wunner.de>
References: <aXovFQsk-w90wZi1@wunner.de>
 <20260129043759.1220-1-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129043759.1220-1-atharvatiwarilinuxdev@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,alien8.de,lists.freedesktop.org,linux.intel.com,redhat.com,vger.kernel.org,intel.com,ffwll.ch,ursulin.net,suse.de];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,wunner.de:mid]
X-Rspamd-Queue-Id: 35AE4AEC1C
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 04:37:59AM +0000, Atharva Tiwari wrote:
> > As discussed previously, your patch will regress older MacBook Airs
> > which use SPI to access keyboard + trackpad if the set_os protocol
> > is invoked:
> > 
> > https://lore.kernel.org/all/ZoJPgSlZJ3ZlU2zL@wunner.de/
> > 
> > The last time this topic came up, I suggested counting the number of
> > GPUs instead of using the DMI quirk.  I even provided a patch but
> > nobody with an eGPU bothered to test it, so the thread fizzled out:
> > 
> > https://lore.kernel.org/all/Z6paeFrjdv7L3mtv@wunner.de/
> > 
> > Maybe you could give it a spin and verify if it fixes the issue for you?
> 
> I tested your patch, and well it works (you still need the 2nd patch to 
> avoid a blank screen), but i can see how this will fail
> like for example, with the iMacPro (only has dGPU) you would need 2 eGPUs
> to turn on apple-set-os.

I don't quite follow.  The patch counts the number of GPUs and
uses the set_os protocol if there are at least 2 of them.
One dGPU + one eGPU = 2, so the protocol is used.

Am I missing something?

Thanks,

Lukas
