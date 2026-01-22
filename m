Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKM+F/OXcmnBmwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 22:34:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C236DCC3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 22:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61F710EACB;
	Thu, 22 Jan 2026 21:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RnBF6H4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A9110EACB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 21:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769117677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ze2NWM9t6BzojOpRtlgWdqStZabOs9WJTc/eEI2xyY8=;
 b=RnBF6H4/gUwjdptrwNskRP0Ao+j6LQnsk7lPQEdZ1Gqj9I+75Lk7Pun0/3HIlvZm47t6d6
 t9lTknF5Z6zRu0T6zxT8eMUVtIglBPKBu2Jwm9P/uEMbcq5GfqWV/8JAirw/3rEjV34Oi0
 x9gGMmCUD5DxhNVuzAaOfPAWDp/hDLE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-zHTfEPFvOOeTJqbIGOuS1g-1; Thu, 22 Jan 2026 16:34:36 -0500
X-MC-Unique: zHTfEPFvOOeTJqbIGOuS1g-1
X-Mimecast-MFC-AGG-ID: zHTfEPFvOOeTJqbIGOuS1g_1769117676
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a2cc5b548so63998966d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 13:34:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769117675; x=1769722475;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ze2NWM9t6BzojOpRtlgWdqStZabOs9WJTc/eEI2xyY8=;
 b=khVtAln/Hz7k17OYOfKOIT12YG2qVL1IJbJJFTLd3O7F13siN+cAEyKUWpVzcLSX7t
 RqDC4s8db4Wr/QolvZvEomHrPbGoOeov06X17Ad4Iq5SMSYgaiozQpIUahak1yXBk7eF
 bKo5RUHplyJ8doFKs6Ji7hBaXInSFEUdIY/VY0BcnYV0pcfYDV6UffKAX1JOJejgT0A5
 d2GGYXBrj2OdNGv+NloY3uo44+6fs3RwMOjpjVLG6HRWFDIWiaTCX0FOTOU9/VU7aaCN
 vmgcJwjJ76UASIqh2fGS6w1LKxJ5317GUGAH3iv1ZUQycx1plAETM55Ff34H977KUYDm
 plGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Pi4ly1XKQ0VwGnYWoGPXzZPJoI3cWNNHXvqvbxe2YI9/ZmGaj7k4a8KcX3CLeXam4mvDbH/dTmQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOubWExDHmN06IVJDu+NDOLsWynOSI/PZDmqZCuxXXbsHXqfGv
 zIJ4/UVmnJ/n7dJTOXW0jISjVKVwa21Br/EzB+sd0PZFhIhvrrb03Ykja4OnT99Xg5uzhQ7VCFR
 2r77tmewEDEW/FQ7jkgd0R+xSIAh8XfrHhHc6sSSXS5/3a9NhWfZ/oYWjn3nyhBBQmbmcsw==
X-Gm-Gg: AZuq6aJJDnuPeJvZshWmXn+gHlHuSx9sjrVPXhWEM3P1vuzuNVt8SggwTrjprIXIwrs
 B70pCzPqfj6HDqRZa51LBVv/aukm2D4OfpTKaT0+YGYuMiTdh9CeGpmdXPBI3u31G5yLtBF5Ase
 qWP4XLoGQbWcXJHqbQlRg1awraddPFYj0tbSzAbRk3gZXDR06pdqvYAuCbP/3sufBB6tHrXT/et
 RWK13CtGrn/e9Quay17wZmWq3b2NdqPB1vqcDBkuyaCr50SgQ2c443VNRD3UPC1Ha9LDG4u/T/c
 Wv+uZownt1z5lM14G/FpWeC/aCsfyp4zM2PwVF0DQL6GJinz+tjz5Uh8FE+RmqcetIgt3L+UA7U
 CCaxIXQ==
X-Received: by 2002:a05:6214:19c8:b0:892:66bb:fdbb with SMTP id
 6a1803df08f44-894904b5044mr12928066d6.23.1769117675652; 
 Thu, 22 Jan 2026 13:34:35 -0800 (PST)
X-Received: by 2002:a05:6214:19c8:b0:892:66bb:fdbb with SMTP id
 6a1803df08f44-894904b5044mr12927756d6.23.1769117675299; 
 Thu, 22 Jan 2026 13:34:35 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89491824d47sm2941886d6.7.2026.01.22.13.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 13:34:34 -0800 (PST)
Message-ID: <25d3c403781a88019340a47567ff85959b0c03bd.camel@redhat.com>
Subject: Re: [PATCH] rust/drm: Fixup import styles
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Simona
 Vetter	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Shankari
 Anand	 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Asahi
 Lina	 <lina+kernel@asahilina.net>, Atharv Dubey <atharvd440@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 22 Jan 2026 16:34:32 -0500
In-Reply-To: <DFVEI4KHCNFS.2IT595IZJBGGT@kernel.org>
References: <20260122202804.3209265-1-lyude@redhat.com>
 <DFVEI4KHCNFS.2IT595IZJBGGT@kernel.org>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PM6HU64dxtnbje1aCeEbm9MZ69KhKlieWCTCo_W78JQ_1769117676
X-Mimecast-Originator: redhat.com
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,ffwll.ch,google.com,gmail.com,asahilina.net,collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:ojeda@kernel.org,m:simona@ffwll.ch,m:aliceryhl@google.com,m:shankari.ak0208@gmail.com,m:airlied@gmail.com,m:lina+kernel@asahilina.net,m:atharvd440@gmail.com,m:daniel.almeida@collabora.com,m:shankariak0208@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.579];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B4C236DCC3
X-Rspamd-Action: no action

On Thu, 2026-01-22 at 21:30 +0100, Danilo Krummrich wrote:
> On Thu Jan 22, 2026 at 9:28 PM CET, Lyude Paul wrote:
> > This is to match
> > =C2=A0 https://docs.kernel.org/rust/coding-guidelines.html#imports
> >=20
> > There should be no functional changes in this patch.
>=20
> Thanks! While at it, can you please drop imports that are in prelude
> and use
> prelude instead?

Just a random musing - it would actually be quite nice if we could have
some sort of automated style check for this. I have to assume the linux
kernel probably isn't the only project out there with its own prelude=E2=80=
=A6

