Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA4iL/SCd2m9hgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 16:06:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C25289E9A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 16:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37D910E44C;
	Mon, 26 Jan 2026 15:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="210x8ZKh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA25110E450
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 15:06:24 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso2827005f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 07:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769439983; cv=none;
 d=google.com; s=arc-20240605;
 b=UPcrjt8//KPJ+UtLaPifRqKgZV6mbecr1Ghbw2RsFIAggVbxxPszd5/w7UFPvwrupm
 zy/IbFY54frQ/6tTDQLdAhsvsjwTLrqNiBAvaUgT1rzR3BVHUmB3FG9FVEZqW2XZBH9A
 t+4B9IcJwa6CVuglGF1br8fDadpzUnb5hTO6M/DyWmZhbC6o8x/uSczgQ0lp+XqL9x91
 449hhGc4XuW2m2xAbaKPcO2lPB02rktvAGPBGbidv9y8X/NsAfr5kvi87EV8sZxEV8nF
 ricg6U9givoANXZNyS+IQidx164XuQgTwU/+9Wdlxm8hK1kkxJtfGk0b867Js9EVmjz/
 OWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Z41mf+ChQ/9Ufyepg/JpP8j8QIs8IVmpuK2fawXti0w=;
 fh=sMMNf41pX7wLkRtDDUkXBzK0fKbxC2dXy7fwjBQ2HHA=;
 b=QNe7hvjTBaiEfO31bIF5ujJZml/PhnWhZDVCRl1FzT+IQ25H1fDWiugnJmheLwu45m
 LMA8Hbvi0sAAnwRFioTqt8o1th2cyvqTCuMT7aX1edJCU7gtVWG6qfiVGfFHrhcz7RjC
 sCczH5wCs1hr8/mztGITb2g63CAOftyEmZ/J8At5N7uISwTyAQMfbHyVJESgTBp8Jqy3
 6UkCoKuHIc1faZ3j0B+ttEIADyP58cY7GJg9+dfEF2JlbtV9WpAFoRXBPEd0EKELPBdE
 bvishZnHzMQ+BG7bUtEitZaLzV2uv7bcPEh4HUoAptjDDJGKyTTm7SWYg6YbnSFPfIJX
 zOBQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769439983; x=1770044783;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z41mf+ChQ/9Ufyepg/JpP8j8QIs8IVmpuK2fawXti0w=;
 b=210x8ZKhIWZ8gSuTAkH159fPWlOkznK5TgwAQcW9t9SFHE58UoThN81WvT/FNVCVSV
 4z5UGSBqgRwvq0GB8Rx0iwWwuwJBKp5tkhOOCelPNYmlGXQBesle3XyN/SB1JcbdPCIe
 446+HreKboRu5sUoODG2GszXfikxj2lqEkZjpvXscEHQLwyKqR2F40HlAej9FUDWX7Lf
 wkGGfwf8wbAveZfFAUeKm74RL86UZ1RXbo1cSfRl7aULY/xeBBcFKG2SScJ463uSnGj2
 GpZokfRkSLKWeVJJoa35FeFbKBXcUkJo1CDoBi4dOzFrQoJTRTJU6l/VmUdHRfJUGVmI
 fWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769439983; x=1770044783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z41mf+ChQ/9Ufyepg/JpP8j8QIs8IVmpuK2fawXti0w=;
 b=iPb0oLJNOXZw4j3IuQORxJN3PDql+iOmNmjInwq28yb7ySBXn7M0baU3ybA02rPDMH
 kUFo21d/At/OGt/C8DP2LivzTIwxW74X6TwkbxeMDyeXwLM6u1XWuyR5gpdONE7UQU+E
 YHbJ+i4taFEe/vcwYx0r65pDy3b+ORw7c0szDOY61hcnRIwzpbE0DWwG660JKXs4NnDT
 rMmsAzJ4kSZfj7rwU0pjTS7i5Aj9vMzcHlT6k99Wv0cprNtGkxqnwLVDNbD39WQdeLyU
 8VDOV+rodhf9S3q+cElVcAj6sqzPmyecPJyMrQNRmoQ6LVzP4ymUaoiHGxkrk8MwaQ8/
 WdeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURERVjuQWQujPTXz5gfC4oU2V8GSiZs0qH/wUjRmo2MLd/DigvuIH0WmPYJ1BOOgOVoboDSlbWf+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5ANuBT6ex2BxSvE0HmaOEwREdjPgli34K5jZP7BgwTOMRAjNp
 twOxGEutIFxl2gXBmW2gzkvOSA9Z3CTv4fUPMYk1j/I18wYf49zn4wi5BDcA6dbxW/tdUgNGpSB
 YkpJIBHTYIPTSqs4m1LM4RKottdMT1IO76toiCnUq
X-Gm-Gg: AZuq6aIYVyjDl5A1N72+X3EhfUkKAzYuKrl2hWlLrfCErd9lwzI308fCCBWvuJgXKco
 Z5VT1sTTAl0q2d4XuFaQPuFlPEIBUOSmzi94KSbTAbUxZwj5tAA6+9YC/raD02XsgwzHX3kRwss
 lLZIlI+F98qzg0BPdf329kClTbgxQ/0xNxHkZB8qjIN/ymMqXBBFQkyqK2O9HmIea7YeOFlIH7V
 BKIZQ/2QODgCy7lizTQ95wHs4d+1Ou1Y1AkXTd2ZW8N0U12JYVl+oa9uxiboEVZnA/d+K8yWyGv
 saNGdDeURHMA0Av90LzUHn3mW3BlNIlJ99UC9aUAq4K3tdWZAlY2fHHy0g==
X-Received: by 2002:a5d:5f44:0:b0:435:a48a:1239 with SMTP id
 ffacd0b85a97d-435ca14577cmr8053819f8f.14.1769439982862; Mon, 26 Jan 2026
 07:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20260120181152.3640314-1-gary@kernel.org>
 <20260120181152.3640314-4-gary@kernel.org>
 <aXcxMShqvHzYMllD@google.com> <DFYKD4MRY9BK.7O6YH0H3RHOO@kernel.org>
In-Reply-To: <DFYKD4MRY9BK.7O6YH0H3RHOO@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 26 Jan 2026 16:06:11 +0100
X-Gm-Features: AZwV_QhdWfajSqPqBDtNF163E0Xp0jfpmiLPUwX0qTH6ZyZyU_r6RbWqp7VnRm4
Message-ID: <CAH5fLgiOMJ_6bUfhRiHorg9HkNeDknSO0bjK61wry1ZaNO0A4Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpu: tyr: remove redundant `.as_ref()` for `dev_*`
 print
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:gary@garyguo.net,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:daniel.almeida@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[garyguo.net,linuxfoundation.org,kernel.org,gmail.com,protonmail.com,umich.edu,google.com,collabora.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 2C25289E9A
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 2:43=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Jan 26, 2026 at 10:17 AM CET, Alice Ryhl wrote:
> > On Tue, Jan 20, 2026 at 06:11:09PM +0000, Gary Guo wrote:
> >> From: Gary Guo <gary@garyguo.net>
> >>
> >> This is now handled by the macro itself.
> >>
> >> Signed-off-by: Gary Guo <gary@garyguo.net>
> >
> > Acked-by: Alice Ryhl <aliceryhl@google.com>
>
> Given your ACK, do you want me to take this one through driver-core for t=
his
> cycle? For the nova-core one I will wait for -rc1 to be out and take it t=
hrough
> the drm-rust tree to avoid conflicts, Tyr should be less prone to conflic=
ts
> though.

I don't mind either way, but if there are no conflicts, it would be
nice to take it off our plate now.

Alice
