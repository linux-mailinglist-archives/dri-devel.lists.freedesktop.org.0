Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJzuEMGAmGlMJQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 16:41:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB32168FA2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 16:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7E010E1C6;
	Fri, 20 Feb 2026 15:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="blBBUvRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6551A10E1C6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 15:41:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771602105; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BX1BO0YLnjIggdkKUqZk7VGj6l8xDbWUqLpdKOL8j1YiwrsZXwkseCPjoXGMtBv5eg56uHrapYHkAtcY25Ogv58RzBaxUQdt41+oJaRPrRc/Kk9PT9wk5zK9m/v0KJEnoHpOlAxBIK3hbwSMSSIdLlwfF2tDG/mrrfaWjH/dIUo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771602105;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rrCr3rMtN5X7RDG+lszzKvxXugEivTxgvZ+z254iq/w=; 
 b=lLsNwdVOLQ/t3UvgWIFZch79fMqzXcYGCnKKczzrCvNWhAC02bIyP1008dLyEe9qsO3pct70nLqSoQLDlG47vPL2/HcaKiqexT4wz84h2ygUo639U1bj5I4EfaSyQd7MrmeF9lZEjX2gzifxvCEIjBFwFAdjVX0cyhl1QyqUw9o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771602105; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=rrCr3rMtN5X7RDG+lszzKvxXugEivTxgvZ+z254iq/w=;
 b=blBBUvRVeQSvkoiX43BE/wq1EvQpjIaeFOsJh78+SfxEXHNp/q+saprKkYG/tOXA
 wx+w2LsZ2nOjteGqQTwRVGu/hvjbdp72CiRlr6VCZc508NZQW35QEx/U8I4JVIz6oW7
 cQiYL+qIQ0WRZLlX83Rl8cv/f4XrkZpMMjbderFk=
Received: by mx.zohomail.com with SMTPS id 1771602103205457.33180772414937;
 Fri, 20 Feb 2026 07:41:43 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212120538.13f81d8a@fedora>
Date: Fri, 20 Feb 2026 12:41:28 -0300
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, beata.michalska@arm.com, lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <D1860FEC-0ADD-4095-A7D8-DEED40640172@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-9-deborah.brouwer@collabora.com>
 <20260212120538.13f81d8a@fedora>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,m:boris.brezillon@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CBB32168FA2
X-Rspamd-Action: no action



> On 12 Feb 2026, at 08:05, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
> On Wed, 11 Feb 2026 17:37:09 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
>=20
>> +
>> +impl Mmu {
>> +    pub(crate) fn new(
>> +        pdev: &platform::Device,
>> +        iomem: ArcBorrow<'_, Devres<IoMem>>,
>> +        gpu_info: &GpuInfo,
>> +    ) -> Result<Arc<Mmu>> {
>=20
> Maybe the Mmu should be wrapped in a Devres, like we do with other HW
> components that require the underlying device to be bound to access
> registers. I mean, we do have iomem wrapper into a Devres, so maybe
> that's not needed, dunno.


Isn=E2=80=99t it enough to have the mmio range wrapped in Devres? =
That=E2=80=99s the
actual device resource that goes away when the device goes away.

>=20
>> +        let slot_count =3D =
gpu_info.as_present.count_ones().try_into()?;
>> +        let as_manager =3D AddressSpaceManager::new(pdev, iomem, =
gpu_info.as_present)?;
>> +        let mmu_init =3D try_pin_init!(Self{
>> +            as_manager <- new_mutex!(SlotManager::new(as_manager, =
slot_count)?),
>> +        });
>> +        Arc::pin_init(mmu_init, GFP_KERNEL)
>> +    }
>=20

