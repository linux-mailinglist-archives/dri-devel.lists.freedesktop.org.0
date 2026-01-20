Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE/NMvOfb2ktKAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:32:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF07461DA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573F510E0B5;
	Tue, 20 Jan 2026 14:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="fVVul/vk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CD110E0B5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 14:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768920153; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cBDUiKRn7dWGj+Wf5Gkpttqj84Z16wlVEghf4vsT7+CBPOky6pYSo7R/b+0CLjFZDPb3n29MjC5M17RGeFnWNQNzAIRYJ71YDSzTmfiJwJJ6RS7m99lxpiZRFQ9Ks68U9VXGxm+KXrQ74FtjmVO/gQGYxKJbmMdLFJX5VRCx0Bo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768920153;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=mYjY0h5RtTqtyeY84cGtAPfcqd3rPa2ZnEvuIXpm/e0=; 
 b=jYVEflO+XX/Aq8jqVS83DT8n3eWPisIN1kyUCTDtEkQUSg9M4Bjhubd8LCW6ui7dPE1md0a4aUx/Lw3E+iY75csH8+6QAoyVd/EkoEtCR3u8hwMV+AsEd+nNvnyfVOfukINrRfNX8rsiXk+I0sYokwA+9mlnmO7Nb+p+l6DWgBY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768920153; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=mYjY0h5RtTqtyeY84cGtAPfcqd3rPa2ZnEvuIXpm/e0=;
 b=fVVul/vkI1plhh3ZP3TitAPYBOHP5ROsYDXRMquP77WaBejnDhbBOQV3V5erTc4r
 Xn39cGHKZSq+M8WiWCExQVnR2C3zg3f4QkMwy3i53J4WH7iGDAeRrDrH4Zqrwy7OLj4
 x+PoUEcN6ZW0cMapUwvUHalNzpfgQzviEw9MqmvI=
Received: by mx.zohomail.com with SMTPS id 1768920151695790.3936926328192;
 Tue, 20 Jan 2026 06:42:31 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 0/4] rust: Add ARef support for work items
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aW9a6KII98eI55HK@google.com>
Date: Tue, 20 Jan 2026 11:41:03 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1EBC2DFD-DA94-44E6-AD10-F892F57DFE5F@collabora.com>
References: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
 <aW9a6KII98eI55HK@google.com>
To: Alice Ryhl <aliceryhl@google.com>
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
X-Rspamd-Queue-Id: 5FF07461DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aliceryhl@google.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[131.252.210.177:from];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	DWL_DNSWL_BLOCKED(0.00)[collabora.com:dkim];
	DNSWL_BLOCKED(0.00)[131.252.210.177:from,136.143.188.112:received];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[136.143.188.112:received];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,workqueue.rs:url]



> On 20 Jan 2026, at 07:37, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> On Thu, Jan 15, 2026 at 09:35:56PM -0300, Daniel Almeida wrote:
>> This series adds ARef<T> support for both regular and delayed work =
items.=20
>>=20
>> - Patches 1 and 3 actually implement the support in workqueue.rs
>> - Patches 2 and 4 adds a corresponding implementation in drm::Device =
that
>>  dispatches the calls to the underlying T::Data.
>>=20
>> This was tested on Tyr, and is actually needed in order to obtain a
>> &drm::Device when handling work items. This is then needed in order =
to
>> allocate GEM objects inside the work handler that processes the tiler =
OOM
>> (out of memory) events. The current series sets the stage so that the =
above
>> is possible in the future.
>>=20
>> This is currently based on v6.19-rc5. I hope we can land all four =
commits
>> on a single tree, but otherwise let me know whether I should split =
the
>> workqueue.rs changes from the drm::Device ones and rebase =
accordingly.
>=20
> Please send a new version that CCs workqueue maintainers.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

That was the usual =E2=80=9Cb4 prep =E2=80=94auto-to-cc=E2=80=9D, =
perhaps we need to fix something
in MAINTAINERS?

=E2=80=94 Daniel=
