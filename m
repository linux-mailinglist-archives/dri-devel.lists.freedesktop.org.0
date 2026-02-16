Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HBRH0wjk2kX1wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 15:01:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F81445D1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 15:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449E689190;
	Mon, 16 Feb 2026 14:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD76389190
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 14:01:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 100621595
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 06:01:32 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 2F26C3F73F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 06:01:38 -0800 (PST)
Date: Mon, 16 Feb 2026 13:59:27 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
Message-ID: <aZMiv7ARO4TUSUTa@e142607>
References: <20260215100302.136719-1-work@onurozkan.dev>
 <20260216104423.6b5bcc96@fedora>
 <523c7b99-33a7-410d-8efb-b7bb2f2f416d@collabora.com>
 <4730819.LvFx2qVVIh@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4730819.LvFx2qVVIh@workhorse>
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
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:nicolas.frattaroli@collabora.com,m:boris.brezillon@collabora.com,m:aford173@gmail.com,m:angelogioacchino.delregno@collabora.com,m:work@onurozkan.dev,m:steven.price@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:krzk+dt@kernel.org,m:broonie@kernel.org,m:matthiasbgg@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,onurozkan.dev,arm.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,onurozkan.dev:email]
X-Rspamd-Queue-Id: 317F81445D1
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 01:43:19PM +0100, Nicolas Frattaroli wrote:
> On Monday, 16 February 2026 12:44:39 Central European Standard Time AngeloGioacchino Del Regno wrote:
> > Il 16/02/26 10:44, Boris Brezillon ha scritto:
> > > Hello Adam,
> > > 
> > > On Sun, 15 Feb 2026 16:21:34 -0600
> > > Adam Ford <aford173@gmail.com> wrote:
> > > 
> > >> On Sun, Feb 15, 2026 at 4:04 AM Onur Özkan <work@onurozkan.dev> wrote:
> > >>>
> > >>> If sram-supply is missing, Panthor falls back to a
> > >>> dummy regulator with a warning. This implicit behavior
> > >>> hides missing DT wiring behind regulator core fallback.
> 
> This is intentional design of the regulator API. A missing supply will
> always result in a dummy regulator. The _optional function bubbles the
> missing supply condition up to the caller.
> 
> Catching device trees lacking supplies that are marked as required by
> the binding is done with dtbs_check, not at runtime.

I'm replying to this thread while I'm also trying to cover some discussion in the
DT patch series.

What we're trying to solve is this: the Mali GPUs have an L2$+bits power domain
that in upstream ended up being called 'sram' for reasons. The domain is important
both for ultimate power savings (you can turn off most of the other GPU domains
and preserve enough state for the GPU to wake up on an interrupt) and for normal
operations, for obvious reasons. Now, vendors either don't bother to put a
separate domain just for "sram" or go to the extreme of handing over control over
that domain to an MCU that implements aggresive and system-wide policies. We're
trying to cater for all cases, include the (currently hypotetical) one where you
have a separate "sram" power domain that Linux can control.

When we have first upstreamed the bindings, inspired by Panfrost driver, we have
added the sram-supply as mandatory which I think is turning out to be a mistake.
Prompted by Mark Brown's reply[1] to Tyr adding 'sram-supply' as an optional
property, Onur has started this and the DT patch series[2] to enforce the presence
of an 'sram-supply' to reduce the number of warnings in dtbs_check. In reality
what we are enforcing is a dummy supply that is the same as the one the GPU is using
because most of the systems don't have a specific one.

So the problem we have is: do we change the upstream binding and make 'sram-supply'
optional for every compatible string given that it is unlikely to be provided (and
the code did not enforce it in panthor_devfreq.c anyway from the beginning), or
do we accept that this power domain is important but usually not specified and we
go with the current DT patch series that provides one?

[1] https://lore.kernel.org/all/20260212100538.170445-1-work@onurozkan.dev/
[2] https://lore.kernel.org/all/20260215100302.136719-1-work@onurozkan.dev/

> 
> > >>>
> > >>> Make SRAM handling explicit: require sram-supply for all
> > >>> Panthor compatibles except mt8196-mali where GPU supplies
> > >>> are intentionally managed outside Panthor and DT does not
> > >>> model sram-supply for that compatible.
> > >>>
> > >>> This keeps DT power modeling explicit and avoids relying on
> > >>> dummy-regulator fallback.
> > >>>
> > >>> Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> > >>> Signed-off-by: Onur Özkan <work@onurozkan.dev>
> > >>> ---
> > >>>   drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
> > >>>   1 file changed, 9 insertions(+), 4 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> > >>> index 2249b41ca4af..5f6075f18fe3 100644
> > >>> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> > >>> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> > >>> @@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
> > >>>           * But without knowing if it's beneficial or not (in term of power
> > >>>           * consumption), or how much it slows down the suspend/resume steps,
> > >>>           * let's just keep regulators enabled for the device lifetime.
> > >>> +        *
> > >>> +        * Treat sram-supply as mandatory except for mt8196-mali. It manages
> > >>> +        * SRAM outside Panthor so this driver must not require direct control
> > >>> +        * over it.
> > >>>           */
> > >>> -       ret = devm_regulator_get_enable_optional(dev, "sram");
> > >>> -       if (ret && ret != -ENODEV) {
> > >>> -               if (ret != -EPROBE_DEFER)
> > >>> +       if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-mali")) {
> 
> If you really need a per-SoC branch then please just store it in the
> platform data so we don't have these "of_device_is_compatible" checks
> littered throughout the driver.

I agree, if we go with "sram-supply" being optional only for mt8196-mali then we should
put this in the panthor_soc_data payload and here we use that.

> 
> > >>
> > >> I wonder if a more generic device tree flag would be better here.
> > > 
> > > No, we don't want it as a separate DT flag. This is all stuff we can
> > > hide behind the compat, and every bit we add to the DT we don't
> > > strictly need turns out to be a liability in the long run in general.
> > > 
> > >> What happens if others do the same as Mediatek or Mediatek decides to
> > >> do this with more processors and this list grows?
> > > 
> > > That's what panthor_soc_data is for: you can attach per-compat
> > > properties without polluting the DT with more stuff that can be
> > > directly inferred from the compatible.
> > > 
> > >> It seems like a
> > >> panthor binding might be useful to prevent future bloat.
> > > 
> > > It's actually the opposite, the more we add to the DT, the trickier it
> > > gets to maintain, because we tend to get those things wrong (is the
> > > SRAM really not needed on mt8196, or is this just a workaround to hide
> > > the fact the PM is deferred to some FW?).
> > > 
> > 
> > MT8196 has three supplies: core, stack, sram.
> > 
> > For example, the Google Rauru Chromebooks use those:
> > 
> >         core-supply = <&mt6373_vbuck7>;
> >         stack-supply = <&mt6316dp_vbuck0>;
> >         sram-supply = <&mt6316kp_vbuck1>;
> > 
> > As of now (in our midstream trees), these supplies are declared in the gpufreq
> > node (the performance domain controller), and required to be on whenever GPUEB
> > interaction is needed, other than whenever the GPU itself is, well, needed to
> > be powered.
> > 
> > As of the current model, these supplies are getting powered on and off along
> > with the MFG power domain.
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c#n1005
> > 
> > I'm not sure what happens if we also add those to the GPU node... for this, I'm
> > adding Nicolas to the Ccs, as he is the one who developed support for EB.
> 
> Fairly sure they need to be on as part of any of the operations the MFG stuff
> does, but I also am not 100% sure on this because I didn't take notes at the
> time.
> 
> Either way, this patch shouldn't exist, it doesn't do anything useful, as a
> missing supply from the DT can be caught with `make dtbs_check`. It does not
> need to be booted on each device to then have the driver abort probe at runtime.

So what should we do when dtbs_check catches it? Series [2] is trying to provide
a supply, but it is a bogus one because in reality the vendors don't declare one.

Best regards,
Liviu

> 
> > 
> > Cheers,
> > Angelo
> > 
> > > Regards,
> > > 
> > > Boris
> > 
> > 
> > 
> 
> 
> 
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
