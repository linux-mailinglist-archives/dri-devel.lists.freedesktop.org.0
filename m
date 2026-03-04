Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F4ZFPedqGmHwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:02:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B611F207CD0
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1634C10EAAF;
	Wed,  4 Mar 2026 21:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JhG+j245";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E6810EAAF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 21:02:43 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8ca01dc7d40so753303785a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 13:02:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772658162; cv=none;
 d=google.com; s=arc-20240605;
 b=DuYEK+X7vK+T8UfdgM4EOlV15YPD0KaXQik6aHh2KRn/CORWa7FIRoTRSnJEX6gufp
 R7EH98K0MPcRMKk45DXi57lerScfSLeuxvOli8kq7i160IoPRxTBr7JTmDVwUXFkILtB
 Lp3KxT4BNXqdeARy7Wh4w7knCaHZTbpYOII1ZwYQ8/CVBI64lI06aYmpLeTFby3BJNR5
 i0uAb1gK/cV7mrzAtmAew9ha6ssr5+s6qkSbrSD/nFAVo/NhEKVGUNAko5YYWTHwi47l
 7rrIOj6kHNBvsDSYPj27tLYKq68xm78+5kY5b3T1R/xQppX/+11q77EuY/7dS+8Y5xfo
 8sqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vlhZF7vEEF7ihejrZ5obw8Q86R87gDIRFL7geQVcy6k=;
 fh=Br4P08rjupjyCKPoilEWKkAO1cR+GmRkh8mJAJbdS40=;
 b=EjB21oVP4U1n2KjlRobk23yq8k98hTJpwWyM4XxfXaECLUhswZF+rdfyA3Rqk633g9
 XqhImnIf+bFg9PNgE1MyzbdQXat+Ff/r5QNAqK/p785VBPhYtDTWFc9GNKUAdfAvOmXY
 YbdZiuTylX6Cb9gVa84p1t7UKJh0QxnRfLx+XUWkIKEMAobZ6HXL5GHvlqbK2Re9WA8s
 TzhbB0ogdCqd0rbzIZTDEJIUke43SjJnUzZRODkUdsh6D6eJjPQaMAtnHRYyWvR6QTRH
 LE6XzW13GAOSMN8155DYHUCN4dWdFtwv+jNft+zTJACA3HHCjxz21yoB5Ay0ZLqGV9Fc
 7W1w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772658162; x=1773262962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vlhZF7vEEF7ihejrZ5obw8Q86R87gDIRFL7geQVcy6k=;
 b=JhG+j245xOdnjdPVvKWJYYtJs/QjQ+pTq2r5L/NSnZs+7ZMJc1y2/+kROS8ka46GJ9
 WYSh5iEgGLZeJMOl8jP7TnX2bUCKqvPJskNOAJBEZhXU1pK5C+HRLrMmXuDxR0V0047t
 KWf4FIcl7aRHwMQ9xuJKCnldiQ+CNVM8nkAi2Jpf527CcSJvhojBfkDawWGGGGniraiy
 j7HKbh+4eYkrqToxI8oZDK7LFI52c0MaTK9PtYyClqcKp5BRZE1vGFnvpfo46HrWHrhK
 Smk2XYKz+3EqNf5iapHOkVuti0fg26Dd3sILVFeQD/BiqORpzm2P8I3cVU4hqHwXzqLI
 SsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772658162; x=1773262962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vlhZF7vEEF7ihejrZ5obw8Q86R87gDIRFL7geQVcy6k=;
 b=wkg0co17uvvUpd1au8oEgDvVeTtdLsEU393iuB9YmBW0m9/Ee317cXJ5XjLUyLwV80
 NpHW9TC9inGc5Z+Lhk4aLNfIygfWgl4PAx04tvo8fAcg81XVowJQM1mBzVcTPAnMw3F9
 TUMSQAoZWvZQH4U+tY284f23ZlH0UbtyMLJObE8BVb07HhSIKr9+Gq7icZPjElVz2aNR
 mWcYOK5x6kT8yDNBX/wQeHuPnT3O/rCr2olIbO4aPBJton0TCzj5E15gI40Oh9LJf1kn
 6YiQS42jgir4EZ+6o3OGOkZkgLe7+mt9vqTfD8lvbMaqOycjrZUuZa01pp9kS+MHV08U
 E0Gg==
X-Gm-Message-State: AOJu0Yx+kZzDYqj0BZDq/dP+FLTG+fbVrNnUsTVCR5yyjtUnIBzEhSIb
 1UQcJfuVBegcWCZEVIa+Csu55jlBLISu0cByiLc7NYJ4RVYiZMPpfKY/IYuyxcF9A0FL8GMlDMc
 mJShSEOxgPKoGtl9p5B0EUtsQV0zanl4=
X-Gm-Gg: ATEYQzw24x+KfQ1UUvAm/5kO0JGV8q3ziYj2ExwB0D194swpaLZpr7P1VzAS/rjJ2RV
 YY3pYTbmFwDD6FVizROSgfOuDR3lzG+vRYdVVOhRKqej34EwrHtdc840c2pcftHzQ9vXf8eN8T5
 GD4sxA5AJAvUojyw/muM4p/MwE+u1cXdASrcnBDUK/+TtyDE0HR4fV2UWZXg2/w+H00sIteBmDV
 vytrazMjKzQSDjUn9f+Cb8EO8yL+EwltyjKHp0g1jPKTjIFq5sY4sOSURJEJB1koyTh9xP/803j
 zSdqXl114ldn3cr3MEXgX4nQX6TuSVaQxRb3FyzHCNlceGBp1HfiLRIWDkcUx9w4frs=
X-Received: by 2002:a05:622a:1b88:b0:503:2f41:aba5 with SMTP id
 d75a77b69052e-508db2ca3famr47720571cf.24.1772658162419; Wed, 04 Mar 2026
 13:02:42 -0800 (PST)
MIME-Version: 1.0
References: <20260224031750.791621-1-airlied@gmail.com>
 <DGU60EGDUNV7.2MJ0CY8K01TCF@kernel.org>
In-Reply-To: <DGU60EGDUNV7.2MJ0CY8K01TCF@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Mar 2026 07:02:30 +1000
X-Gm-Features: AaiRm52HcjplSTgUJ4c2kf_3WOSF_YUZKqmY2FNaKXgyoZSsV3JxDsYk0sn7Zt0
Message-ID: <CAPM=9tzcwB-udBP2W-MzmvwsC-YiCW6pCkdc4jon2pyQYGtLfQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau/dpcd: return EBUSY for aux xfer if the device is
 asleep
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: B611F207CD0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 at 03:14, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Tue Feb 24, 2026 at 4:17 AM CET, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > If we have runtime suspended, and userspace wants to use /dev/drm_dp_*
> > then just tell it the device is busy instead of crashing in the GSP
> > code.
> >
> > WARNING: CPU: 2 PID: 565741 at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/=
rm/r535/rpc.c:164 r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
> > Modules linked in: overlay uinput rfcomm snd_seq_dummy snd_hrtimer nf_c=
onntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fi=
b_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft=
_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tabl=
es qrtr bnep s>
> > snd_soc_acpi intel_rapl_msr libarc4 kvm crc8 soundwire_bus irqbypass sn=
d_soc_sdca rapl iwlwifi snd_soc_avs uvcvideo intel_cstate think_lmi uvc fir=
mware_attributes_class intel_uncore intel_wmi_thunderbolt wmi_bmof snd_hda_=
codec_conexant snd_hda_codec_nvhdmi videobuf2_vmalloc snd_soc_hda_codec cfg=
80211 videobu>
> > processor_thermal_mbox sparse_keymap intel_soc_dts_iosf intel_pch_therm=
al platform_profile rfkill snd soundcore int3403_thermal int340x_thermal_zo=
ne int3400_thermal acpi_thermal_rel acpi_pad joydev loop nfnetlink zram lz4=
hc_compress lz4_compress xfs wacom hid_microsoft ff_memless nouveau ucsi_ac=
pi typec_ucsi>
>
> I'd remove the modules linked in, it seems not relevant.
>
> > CPU: 2 UID: 0 PID: 565741 Comm: fwupd Not tainted 6.18.10-200.fc43.x86_=
64 #1 PREEMPT(lazy)
> > Hardware name: LENOVO 20QTS0PQ00/20QTS0PQ00, BIOS N2OET65W (1.52 ) 08/0=
5/2024
> > RIP: 0010:r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
> >
> > This is a simple fix to get backported. We should probably engineer a p=
roper power domain solution to wake up devices and keep them away while fw =
updates are happening.
>
> s/away/awake/ and line length.
>
> > Cc: stable@vger.kernel.org
>
> Do we want this backported before GSP introduction?
>
> I.e. if it's only about the WARN_ON() and otherwise doesn't cause problem=
s it
> should probably be
>
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-R=
M")
>
> otherwise
>
> Fixes: 8894f4919bc4 ("drm/nouveau: register a drm_dp_aux channel for each=
 dp connector")

Go back to this for safety, probably won't blow up but it could still
cause wierd register timeouts.

>
> > Signed-off-by: Dave Airlie <airlied@redhat.com<
>
> No need to resend, I can fix up the above (and the minor typo in the SoB)=
 on
> apply.

Thanks,
Dave.
