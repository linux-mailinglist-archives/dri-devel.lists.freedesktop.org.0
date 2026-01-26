Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGJZDkSDd2m9hgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 16:07:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9712189EC1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 16:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFAD10E449;
	Mon, 26 Jan 2026 15:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FyIRubkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404B610E449
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 15:07:45 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4359a302794so2862174f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 07:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769440064; cv=none;
 d=google.com; s=arc-20240605;
 b=dSxqdMagMhB+Z/hoayuQLwQVM5zuVYPLG+3VPqrMPQMGGrnQYr1qvM/yVK+Ht4mfqb
 pmiKwYjnYUMHlXRsLb+LsIUTBnx2/hRX1iV7bZ4Dn7t8gkTg4tvPBbfnmf2belTmge0A
 N+igntODY3fWCg4OvtpKWUDJU2IxIlju3TcC/2JEqoSXO7VTIbTXOEHs0Ni/Su6fyFIQ
 CFrW/X6DECXKk5oO9nuUpD206BkkxKKVqhkWkP+hfiNlK5hIg0TU75LvaxjFOSMShmet
 PPmeQdlxyjri2yTznWhzaMrucO/SCEPmvsus2sNuLq9QtyqBK/BD8cLeusVWFFcCxLKv
 UiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=lr2FLKFsKIM5F/MNIJ4lz4VnmHaX2p0/zhRPZhHRNeY=;
 fh=QQxlaW0XIOofJFYQxoNjbPiUQdU3EDcNJftDRhds4zs=;
 b=iFOEXuBuvshCD/RhgERUlf0hz1u9ND4UWn+cFuXpbnvFJIFhD4Cok+pyOn3vilgIVI
 DVdVoXhSG6ZpnSkRHe/MGCNYC28qQ59aS6xUX+I0zVAPhzBHDKTfeQwmXStgThIVZ+V/
 DlHzAsjFvRD/KIBKEqovF04XdDgLT+OTyvzSMWfU5M8IVjYjWf1rIZEaPXJ+TfXIAtQ2
 2HMsSKjKm08sXmTEZCpPWUstFDmsnulZtj/jJDRAFdeCdn/KHI5PLFSUyV2JnO62eHG9
 GGCo+oIdZK7fZyJ9U5Vr71XXJ2ig5UR1fQIpMYO4W/OOQVLQk8OMRoawe9HmEpZiP20t
 TbmA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769440064; x=1770044864;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lr2FLKFsKIM5F/MNIJ4lz4VnmHaX2p0/zhRPZhHRNeY=;
 b=FyIRubkzkVkpjC6UHNH8Vo6BOp/aEk7RZyOmPuH1hieN4F0FaXztMx24LMDBK6cas7
 L566Agufl5hm00p68kzhQxHptKdI+2P8MlTqhUyNP5/m+bTw+Vq8Px8g8/l0YKWJUOkM
 1ZZ55jlpd1NAF7GLF/1zr8JQWqKUzSnfRWlV8EIDgYmsr7YtS1G6GwutuxAMmtT9XM0c
 u12QUv509cDubeSWFXRXv51hiGpK0T9ryGiDSAI411klPiVfWZdYUfJoZ1zd2LK+ogZ8
 O6lXvDTELge7XEyBrgYk6EfuPBenWkhJuvPTsH6rbbldGFRyEQ1h5uKcKCnbaDai4D29
 haug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769440064; x=1770044864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lr2FLKFsKIM5F/MNIJ4lz4VnmHaX2p0/zhRPZhHRNeY=;
 b=kCtZProJX6arKGkTeTQpf8hsqYa1NyqfWi0Z/XHIDdXPDmvSchhhzu10I3Jg0fdsb5
 lWgXD/+0wSt4m70OE47663zrD8lT9xFB+xupju+m+9+Gkevdx6fWPsjDR9VPf8LzdCFg
 /EoYku3i7B4PKC8f7X/43DHBim2RrQKbH9T72SCJnzmL2688qTPe5iHk1yGqed97XI15
 +Y2We1A/LJbVZxK4inyZm9q/dfHDWXYTgVKzrwlFVT3zhJWbGJ2bAqox99rXcRO4sIYW
 JgUBd/syAwbB5hi60BEzQ7Irjfa0d6SyCSmboeeOR+sROPMOEELHWqmk1LHBH+1m08Aa
 ZSPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGX+HVuNK+Ns3HxIlVWjkHoA1EmPU6ftNhiVQhhOoie/VqYT4naMOpD68AH6ulF0V3qMSdCx/HakI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygPpI56LjPP5QAM/WPJJB2ztYpZshr06tIe3CuhgveV59P/Dit
 XRRU+zO11me379DTrv6E6NGrtgwEjxETTeIPRUvK+/L4ijdm4iNfkpFzRvRwPERDCQ2iEVmfUen
 RB+1qPpW+YnSZIot0QgeUbGfXnMH2AXlMZfkadSqg
X-Gm-Gg: AZuq6aLq65LV7BT1FjM19cNhs98iFuhnoRdQZ9hsqWf8tbrWjAu0EZ3KP1A76CRD4SM
 AGPIsGFziPHB5wqUvLtFE0b9UZsl+IVAz3BIsG8u7/PMim587Pl3mQ4naoZRMWgVc6ZapdY+oTF
 yFpUFWZhdYRodI7fg8hwS9kNZ8bNmBBolDIXin/YqJEQ8qf6pZjb3iWqBVwNGxw2iFKstGUsHLd
 nGkkpbrTgltAu9DMt6r3k1+00+jF2UYEsOgvi6sN/eDKlE+veNtT+114U4Kn9/V7bSdbFUdZmRM
 CWFH1GAryvD9oH3yrcnciWGtFOzM+Jq0HDIZ2fv0D4a49gGXfpgmkFxgTw==
X-Received: by 2002:a05:6000:2c11:b0:431:a38:c301 with SMTP id
 ffacd0b85a97d-435ca1adea6mr7281836f8f.48.1769440063540; Mon, 26 Jan 2026
 07:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com>
 <20260126160036.2b2c66a7@fedora>
In-Reply-To: <20260126160036.2b2c66a7@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 26 Jan 2026 16:07:30 +0100
X-Gm-Features: AZwV_QjLENulvLS1sAXoE81OvlNZto8fyQIabUO6YtyEaaalxqoH-joeeBXDm7U
Message-ID: <CAH5fLggFzHSB-iassPmwkP74h6qN6V6hYaCfjT0_JEvGoDecBQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] rust: gpuvm: add GpuVm::obtain()
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Lyude Paul <lyude@redhat.com>, Asahi Lina <lina+kernel@asahilina.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
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
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 9712189EC1
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 4:00=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 21 Jan 2026 11:31:19 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > +/// A [`GpuVmBo`] object in the GEM list.
> > +///
> > +/// # Invariants
> > +///
> > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and=
 is present in the gem list.
> > +pub struct GpuVmBoResident<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
>
> I find the name a bit confusing: BO residency is often used to refer to
> memory backing the buffer object, and in this case, you can end up with
> a GpuVmBoResident being returned for a BO that has been evicted (one
> that's no longer resident).

Good point. I meant it as "present in list" but I guess there are
other things a gpuvm may be present in.

Any naming suggestions?

Alice
