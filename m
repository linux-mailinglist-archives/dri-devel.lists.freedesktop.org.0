Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEljGH8or2mzOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 21:07:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED8F240A48
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 21:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7958010E58C;
	Mon,  9 Mar 2026 20:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ik.me header.i=@ik.me header.b="iQTK/4ga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1119 seconds by postgrey-1.36 at gabe;
 Mon, 09 Mar 2026 20:07:20 UTC
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch
 [45.157.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6825B10E58C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 20:07:20 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fV6yJ0Qd6z620;
 Mon,  9 Mar 2026 20:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
 t=1773085719; bh=JSB1VwR1hlXdj+drdPisjtXSesd6AYdMKEWkO/sGqrs=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=iQTK/4gaQcfdwI+buCORDM4mGZR5RWb+mRBHrw/v/BGEgHN4Dwuxuifm2hK2BrVPA
 e4JOU+r99Eq5Ry2biEsIzl3Np/H20WPhxdq5QM0+ktCpM+OsacDpSUE9r4qRm7+lmU
 PH4eYlzQTSV7Wk5hsoNYZfEerIAhRuOgMRb1c51U=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fV6yG1p98z27L; Mon,  9 Mar 2026 20:48:38 +0100 (CET)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 20:48:37 +0100
Message-Id: <DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
From: "Ewan Chorynski" <ewan.chorynski@ik.me>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
Feedback-ID: :b2b0f7d1dda10c9:ham:e74197f626dda86
X-Infomaniak-Routing: alpha
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
X-Rspamd-Queue-Id: BED8F240A48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ik.me,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ik.me:s=20200325];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:joelagnelf@nvidia.com,m:ttabi@nvidia.com,m:epeer@nvidia.com,m:ecourtney@nvidia.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:acourbot@nvidia.com,m:dakr@kernel.org,m:aliceryhl@google.com,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[ewan.chorynski@ik.me,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ewan.chorynski@ik.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ik.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ik.me:dkim,ik.me:mid]
X-Rspamd-Action: no action

On Fri Mar 6, 2026 at 5:52 AM CET, Alexandre Courbot wrote:
> This patchset adds the remaining support required for booting the GSP on
> Turing.
>
> We did a deep dive with Eliot looking for the reasons why some fields
> involved in the bootloader are ignored or used apparently
> inconsistently, and this results in a more documented flow and a few
> fixes. Apart from that, this series seems to be stabilizing and
> successfully probes my TU106:
>
>     NovaCore 0000:08:00.0: NVIDIA (Chipset: TU106, Architecture: Turing, =
Revision: a.1)
>     NovaCore 0000:08:00.0: GPU name: NVIDIA GeForce RTX 2070
>
> This series is based on `drm-rust-next`. A tree with all the patches is
> available at [1].
>
> [1] https://github.com/Gnurou/linux/tree/b4/turing
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Changes in v11:
> - Fix build error/warnings and rustfmt formatting.
> - Address incorrect IMEM section start offsets in FalconUCodeDescV2
>   and better document fields usage and unused fields.
> - Use `get`/`get_mut` instead of direct array indexing when accessing
>   firmware content.
> - Link to v10: https://patch.msgid.link/20260301-turing_prep-v10-0-dde5ee=
437c60@nvidia.com
>
> Changes in v10:
> - Store the firmwares into a regular KVec and move them into a DMA
>   object only when actually loading using DMA.
> - Use `try_update` when updating the `NV_PFALCON_FBIF_TRANSCFG` register
>   array as its index is not build-time proven to be valid.
> - Fix alignment issue when processing imem section of the FWSEC
>   bootloader (thanks Eliot!).
> - Link to v9: https://patch.msgid.link/20260212-turing_prep-v9-0-238520ad=
8799@nvidia.com
>
> Changes in v9:
> - Add a few preparatory patches to simplify the actual feature patches.
> - Use a wrapping type for the bootloader.
> - Simplify the falcon loading code and move the complexity to the
>   firmware types.
> - Add the generic bootloader files to `ModInfoBuilder`.
> - Link to v8: https://lore.kernel.org/all/20260122222848.2555890-1-ttabi@=
nvidia.com/
>
> ---
> Alexandre Courbot (10):
>       gpu: nova-core: create falcon firmware DMA objects lazily
>       gpu: nova-core: falcon: add constant for memory block alignment
>       gpu: nova-core: falcon: rename load parameters to reflect DMA depen=
dency
>       gpu: nova-core: falcon: remove FalconFirmware's dependency on Falco=
nDmaLoadable
>       gpu: nova-core: move brom_params and boot_addr to FalconFirmware
>       gpu: nova-core: falcon: remove unwarranted safety check in dma_load
>       gpu: nova-core: firmware: add comments to justify v3 header values
>       gpu: nova-core: firmware: fix and explain v2 header offsets computa=
tions
>       gpu: nova-core: make Chipset::arch() const
>       gpu: nova-core: add gen_bootloader firmware to ModInfoBuilder
>
> Timur Tabi (2):
>       gpu: nova-core: add PIO support for loading firmware images
>       gpu: nova-core: use the Generic Bootloader to boot FWSEC on Turing
>
>  drivers/gpu/nova-core/falcon.rs                    | 315 +++++++++++++++=
+---
>  drivers/gpu/nova-core/falcon/hal.rs                |   6 +-
>  drivers/gpu/nova-core/firmware.rs                  | 107 ++++---
>  drivers/gpu/nova-core/firmware/booter.rs           |  65 ++--
>  drivers/gpu/nova-core/firmware/fwsec.rs            | 129 +++-----
>  drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 348 +++++++++++++++=
++++++
>  drivers/gpu/nova-core/gpu.rs                       |   9 +-
>  drivers/gpu/nova-core/gsp/boot.rs                  |  17 +-
>  drivers/gpu/nova-core/regs.rs                      |  30 ++
>  9 files changed, 820 insertions(+), 206 deletions(-)
> ---
> base-commit: 15da5bc9f3adab7242867db0251fe451ac3ddb72
> change-id: 20260204-turing_prep-6f6f54fe1850
>
> Best regards,

Hi,

I just want to remind that there is still issues for some Turing cards
with the firmware used by Nova (570.144) and this patchset still suffer
from the issue.

I am not able to probe on my GeForce GTX 1650 Mobile :

[    2.246095] NovaCore 0000:01:00.0: NVIDIA (Chipset: TU117, Architecture:=
 Turing, Revision: a.1)
[    2.722681] NovaCore 0000:01:00.0: Booter-load failed with error 0x31

However nouveau does not probe either with this firmware so that's not
really this patchset fault.

Are there any plans to check this to enable support on all Turing cards ?

I already reported this error in the V4 patch [1] for context.

Feel free to ask me if you need additional tests or results.

[1]: https://lore.kernel.org/rust-for-linux/DFA1CUMND2ME.1D3PAJW641QHM@ik.m=
e/T/#u

Regards,
Ewan
