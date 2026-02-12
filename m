Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF1TOmKMjWnq3wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:16:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776812B2A0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0571910E6EE;
	Thu, 12 Feb 2026 08:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mX7PQdYO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8F210E6EE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770884189;
 bh=YgMCnMRXuxLnijeVbtKnc4LzIsS0QcXtZba8gNfJIVc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mX7PQdYOPWlSOuIwslZTGPIpTHXS1s4Ow1a9ah1GqiuutDD4HR0gDO+DSILad2Axi
 TcakDn70JWbDPS1ONhqO0tw1B3j6foRD7MZNcYrv7JmKeg5urQwQQQsLFVrq2XwB5N
 8uRjtJ3pED6EC9MhsKHUpvaSaW63yP6WhWyb39ydDsTe7ZRd3qHtvRpE+OBca1ds4+
 OxpBhWXPsXukZ0Ih/47RozMiFyRlbc7S1JWxUdTd+AvpCmyiHw+f+v2IguN5E4tx9o
 OmdxGklIuwhzp27B2h5bsEwjr7BTvVB9C8bUhXUXK3kNUgdSjQTXMGXjnanF0fdE97
 bhGBleq+Rklmw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 812FE17E0097;
 Thu, 12 Feb 2026 09:16:29 +0100 (CET)
Date: Thu, 12 Feb 2026 09:16:24 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 05/12] drm/tyr: add MMU address space registers
Message-ID: <20260212091624.3deda2ea@fedora>
In-Reply-To: <20260212013713.304343-6-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-6-deborah.brouwer@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 2776812B2A0
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 17:37:06 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>

I'm pretty sure I got that from Daniel's branch, and only tweaked a few
minor things to make it work (I probably messed up authorship when
doing that). I'd prefer to attribute that work to Daniel, if you don't
mind.

> 
> Add register definitions and constants for managing MMU address space,
> including:
>   - Address space translation configuration (page table format, attributes)
>   - Memory attributes (cacheability, shareability)
>   - Address space commands (update, lock, flush)
>   - AsRegister helper for per-AS register access
> 
> These will be used by the MMU/VM manager to configure page tables and
> control address space operations.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  drivers/gpu/drm/tyr/regs.rs | 101 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 100 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> index 611870c2e6af..9cb7ab0c806a 100644
> --- a/drivers/gpu/drm/tyr/regs.rs
> +++ b/drivers/gpu/drm/tyr/regs.rs
> @@ -8,7 +8,10 @@
>  #![allow(dead_code)]
>  
>  use kernel::{
> -    bits::bit_u32,
> +    bits::{
> +        bit_u32,
> +        bit_u64, //
> +    },
>      device::{
>          Bound,
>          Device, //
> @@ -111,3 +114,99 @@ pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u3
>  pub(crate) const MMU_IRQ_CLEAR: Register<0x2004> = Register;
>  pub(crate) const MMU_IRQ_MASK: Register<0x2008> = Register;
>  pub(crate) const MMU_IRQ_STAT: Register<0x200c> = Register;
> +
> +pub(crate) const AS_TRANSCFG_ADRMODE_UNMAPPED: u64 = bit_u64(0);
> +pub(crate) const AS_TRANSCFG_ADRMODE_AARCH64_4K: u64 = bit_u64(2) | bit_u64(1);
> +pub(crate) const AS_TRANSCFG_PTW_MEMATTR_WB: u64 = bit_u64(25);
> +pub(crate) const AS_TRANSCFG_PTW_RA: u64 = bit_u64(30);
> +
> +pub(crate) const fn as_transcfg_ina_bits(x: u64) -> u64 {
> +    x << 6
> +}
> +
> +pub(crate) const AS_MEMATTR_AARCH64_SH_MIDGARD_INNER: u32 = 0 << 4;
> +pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_NC: u32 = 1 << 6;
> +pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_WB: u32 = 2 << 6;
> +
> +pub(crate) fn as_memattr_aarch64_inner_alloc_expl(w: bool, r: bool) -> u32 {
> +    (3 << 2) | (u32::from(w)) | ((u32::from(r)) << 1)
> +}
> +
> +pub(crate) const AS_COMMAND_UPDATE: u32 = 1;
> +pub(crate) const AS_COMMAND_LOCK: u32 = 2;
> +pub(crate) const AS_COMMAND_FLUSH_PT: u32 = 4;
> +pub(crate) const AS_COMMAND_FLUSH_MEM: u32 = 5;
> +
> +pub(crate) const AS_STATUS_ACTIVE: u32 = bit_u32(0);
> +
> +pub(crate) const AS_LOCK_REGION_MIN_SIZE: u32 = bit_u32(15);
> +
> +/// Maximum number of hardware address space slots.
> +/// The actual number of slots available is usually much lower.
> +pub(crate) const MAX_AS_REGISTERS: usize = 32;
> +
> +const MMU_BASE: usize = 0x2400;
> +const MMU_AS_SHIFT: usize = 6;
> +
> +const fn mmu_as(as_nr: usize) -> usize {
> +    MMU_BASE + (as_nr << MMU_AS_SHIFT)
> +}
> +
> +pub(crate) struct AsRegister(usize);
> +
> +impl AsRegister {
> +    fn new(as_nr: usize, offset: usize) -> Result<Self> {
> +        Ok(AsRegister(mmu_as(as_nr) + offset))
> +    }
> +
> +    #[inline]
> +    pub(crate) fn read(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<u32> {
> +        let value = (*iomem).access(dev)?.try_read32(self.0)?;
> +        Ok(value)
> +    }
> +
> +    #[inline]
> +    pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u32) -> Result {
> +        (*iomem).access(dev)?.try_write32(value, self.0)?;
> +        Ok(())
> +    }
> +}
> +
> +pub(crate) fn as_transtab_lo(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x0)
> +}
> +
> +pub(crate) fn as_transtab_hi(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x4)
> +}
> +
> +pub(crate) fn as_memattr_lo(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x8)
> +}
> +
> +pub(crate) fn as_memattr_hi(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0xc)
> +}
> +
> +pub(crate) fn as_lockaddr_lo(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x10)
> +}
> +
> +pub(crate) fn as_lockaddr_hi(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x14)
> +}
> +
> +pub(crate) fn as_command(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x18)
> +}
> +
> +pub(crate) fn as_status(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x28)
> +}
> +
> +pub(crate) fn as_transcfg_lo(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x30)
> +}
> +pub(crate) fn as_transcfg_hi(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x34)
> +}

