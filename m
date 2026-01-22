Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KlOHy6ccmkFnAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 22:52:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DF96DF60
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 22:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1C610EAED;
	Thu, 22 Jan 2026 21:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H1tqyQxQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05F210EAED
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 21:52:42 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-12339e20a87so136369c88.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 13:52:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769118762; cv=none;
 d=google.com; s=arc-20240605;
 b=B52O8YYHCbZ7OxJWO472pyUlnjzZIb+wOHVoPa9CVy5uXz4YVOMPpOKT7vgi5RNTgl
 atIiFPbO6Z9HK+PxdwX11byHpmBICc0KirOjpzVRqgka0CIvgjqv+vmjyPH5+cuch3N3
 1oOXbZkjGVSbWP1O1+cwZuGsCwjmFs8/UvS8L358y+t1oB5477ZvYs9LwFqIBXa/fhl4
 zcYbF869JVUbQKGmQdo21yb9jj2CRMYVIkOXwUbD7EkEIqrGgAnT8nhDE6a2CIRpGz8Q
 SVjG0WVA5hAJut+md+t05bv7FtKvEcHl+n3hlaXUApiZ8UBFQ6fvm9TrYv3dmf6+4A8e
 /Z8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kJ1n1W9oNr5vNhOoeiv4otLFkO0Rv3BVZJZSEM76zTY=;
 fh=1WE12E/eikbu6Cqq+BHH/SRDcMDqNc6iaC8NP49+L3g=;
 b=XFDIFugQb9HuOrJth3FEA5gmav4Y40f8dvQsT4eVSzh90LPkJ3QIhB4odSQMjyvJuG
 eAlKNujuzoNekGwNcVvhq3q0YRKajaWrwnv6LJQSPgX3MnE0PBjotRICul05CnUggOdP
 wnuhMSC0nWqzkcZ3d6/Nn9mT2umq1XcbRKG9fjghjY5ZY0TmdvO2cQRE1M48T09R3JMh
 VJr3Y32W6n8BrKGspI+lnxITIlCtttIOw93mY+hFtKcwlm2t85yMWS2LFUM8LovczL8f
 Cg2yyXu1/SpyDx0KtXMvCBBJqsKnXI77ygk5VTHYWN+Wj0FsAjWgLwYkMWBCDEPGVgnQ
 dR4g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769118762; x=1769723562; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJ1n1W9oNr5vNhOoeiv4otLFkO0Rv3BVZJZSEM76zTY=;
 b=H1tqyQxQg07OiWrihHgPaVdSEKjxPobrgWmwjdqq1nWqWqnS7AVG2mmnLp6EiABEMN
 cUQ8JCAEImzJf0GHkmhvMFubPF9Eb2f9Lqam31/WcWAQR6dQzCy8JQdOkBg8t7JM4I2q
 PC8ZbR9JBXfRwzvJnvx4Tkayia3/z8kyeYK5UPcw5n9BsBnRgdYY0leLEVje+Xs3bHbl
 RaxyXKV+3/Sg7TWJbCVmxfJZTONlwj39ZDUPdddjYvYLCqJ7tpCIRoZ9dD3aFcZ0C7JF
 KQJAzwGbYaC5zF3kmbn18xgAiPpquNPZ/WwWA4wUdAb6rYbTx0eI+dESlSKgKWBCAyZk
 swmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769118762; x=1769723562;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kJ1n1W9oNr5vNhOoeiv4otLFkO0Rv3BVZJZSEM76zTY=;
 b=AX/LPITIpLuN5JVILgb6Ak+WtjwxWys9V8TOW8XnJPOJjFEPRUfOwL4aamEICGAVvm
 QGh7mEKuizy4DQi6fYQZZZqycETx3ikt+IECpkkiJ125vPFxcgtn7ZbgZy8z+KXIiOW0
 9q+FvNi+sjHaB3VdBhDa3mY8wijLZ6plImNlLHJKJtCZuvYzZ3xPqNxgGCMl7LCHonwL
 dc9ancaJRvkFpDbKMsmPPnLAqXNYPnJ7+uh3mYDmAAE3g2FPDxKWW4RB0VDc9M5nUk/h
 NIUqNdRNnZCALTAapbCZ0cBGK5+NU2rzVJUr1+Hw4R2Wqvema1gghFhk/E28dlNok6p3
 W6KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzhmfNE9PDl1HCXCD3qGjB5q0iDoDKeyw4YQNerS2sFVH2rO8SyL88QEOpsdsnlki1zmKWIvGGXvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdYHv9sAn2AzohGa/wxhnwXhH9O5FtbaD34B6dOxAG8F67rkWQ
 63WRQLdcuVRUwbdVbz/9Rj2IlkMjoyNL0+14MtGkEbcTUGQCqMxhlfGsnDWO67IRA6/394Av5tt
 C75++G5g+IAHS01ztC2e6n5yq4fvcfVw=
X-Gm-Gg: AZuq6aI3r/UBTsM9Mt91uFJLzCIVHzbUjbCRx1lR1WzFfbUcXlgbbdqZJUpgWj0FePd
 MbJhv5S+ogrlTydt37my66/4ccukSQsnnaDIN4SeHh4INzVbhDQtEcLREtRS31BgiSKTXFX4B8p
 cF8IwORNig4FjZA7mrWrXnEq8oEVsGHJ39uPOciPPS12Yj9Ot0jcShlNVh/s14MtnNgmksE8BTB
 rXdmtI+Dlsd4de/IKtUlBw7o/qA4uYD7j9B4CtZ9GTHSs7q/HfEbGJV3b7rZMs68aWBPT7zqMmL
 dlZHGLkY8dL6bkOyxTSX3hJL1wq0Gj+zCsxSSKvmxsa9k38duSmYRVeqci9d9rlKYKNGt6cQ36Z
 x9cem4ZX2pvb9
X-Received: by 2002:a05:7300:324a:b0:2ae:5549:2c86 with SMTP id
 5a478bee46e88-2b739b6f4e4mr228287eec.5.1769118761814; Thu, 22 Jan 2026
 13:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20260122202804.3209265-1-lyude@redhat.com>
 <DFVEI4KHCNFS.2IT595IZJBGGT@kernel.org>
 <25d3c403781a88019340a47567ff85959b0c03bd.camel@redhat.com>
In-Reply-To: <25d3c403781a88019340a47567ff85959b0c03bd.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Jan 2026 22:52:28 +0100
X-Gm-Features: AZwV_QhZZxWF4WZYVcR4FnS_Sg28Z3ZQQfKTOoxKuwtN0Bkji7JJbfvuj-OOB1M
Message-ID: <CANiq72k1b3DLEy_32ruWu1XBFK80oRDVzSer69ANL_232mmv-w@mail.gmail.com>
Subject: Re: [PATCH] rust/drm: Fixup import styles
To: lyude@redhat.com, Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, 
 Shankari Anand <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, 
 Asahi Lina <lina+kernel@asahilina.net>, Atharv Dubey <atharvd440@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:gary@garyguo.net,m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:ojeda@kernel.org,m:simona@ffwll.ch,m:aliceryhl@google.com,m:shankari.ak0208@gmail.com,m:airlied@gmail.com,m:lina+kernel@asahilina.net,m:atharvd440@gmail.com,m:daniel.almeida@collabora.com,m:shankariak0208@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.983];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.freedesktop.org,ffwll.ch,google.com,gmail.com,asahilina.net,collabora.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C4DF96DF60
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 10:34=E2=80=AFPM <lyude@redhat.com> wrote:
>
> Just a random musing - it would actually be quite nice if we could have
> some sort of automated style check for this. I have to assume the linux
> kernel probably isn't the only project out there with its own prelude=E2=
=80=A6

Yeah, that would be quite nice indeed -- we have discussed this a few
times (most recently a couple weeks ago, including whether Klint could
be used for that and for detecting "long import paths", i.e. when we
have a re-export we prefer, but that has edge cases; as well as
related bits like a `klint::moved` annotation -- Cc'ing Gary).

Cheers,
Miguel
