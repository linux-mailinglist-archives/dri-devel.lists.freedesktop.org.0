Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO9fDeLicWk+MgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:42:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540BC63550
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF8C10E93B;
	Thu, 22 Jan 2026 08:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="U1UiHxnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2422F10E93B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 08:42:05 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4801bceb317so6366905e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 00:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769071324; x=1769676124;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=eUi/3E4y07lYAhJzymrjYIl8d6EumDS+Xmgbs2h2dPs=;
 b=U1UiHxnYCf2FuwMuyleM2mTKjkWrxBJ07otOmRdbD5qPb3WxHtdobxsyC/MyodE+bz
 CvwDim5EFhYTv17FOcqdIQRjmw4/SMr7+9OKgUOnIx4opWg5RPyBAi45yT/VkDxjDrEM
 4KZzy9C4m2Dtnp+ATijOz0mLHhFmoR3F04mqNquU5ItF9v/4s94seRpH36wBbBBRW9xv
 /Enim5PepjF0FzNApKYxplTce+j47FED1o3O6VDycuR4UI09UIxh1dNkwj+4AK0SJIXL
 EkEsfX5hMEKwihuF+jsMyudy3PqnD2g7Ungt7DgtK8ImgkMasuSrvL/5ixirtwnwWWCY
 Jysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769071324; x=1769676124;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eUi/3E4y07lYAhJzymrjYIl8d6EumDS+Xmgbs2h2dPs=;
 b=A5tEwYAp8hQJVYpjiONr7zbah9sS3sR6VZeNcvPxBh2C3yMnlmKKBDaO6kv8Uvvlfv
 5T3NmzTqV1SVaovrIs9KkjxVwRZwsW0Fx0FjPXMTqaNDYC+3DroS/51TmegHuIKSOMZh
 nAa2USPfVbROVuvt4u2dlsBr43lRnQuewDqkzJUCWLKhMYrXvupwiXV8GZwQaSKWnp2E
 3PLdZ8lXmsfoyUnW/v9LLJdFdEjFzQdBT0xfnU5DxdMkJy8ofcAR8QML/b5GYrlQ6kUl
 YcN/i0uTO2qKao3TcrYhEiOh0FQqcbyIh8e+pkCEgjSy9mD7jPb9hpWm4fJQqeC3KmfR
 LrDw==
X-Gm-Message-State: AOJu0YwMg4/74Vjca5I4VOpz0ybf5+9iSO03c0L0yfigNLwh9pSDu9+s
 X9WGgBI6UXo4whYJac9bHAz8OJ2n8DcLUqngZq7r4Pk6QTT7BpwIxOpFhEdr/JPWnvsACqQYGVp
 wcIG7OhlqvKEjR/fKBw==
X-Received: from wmcq10.prod.google.com ([2002:a05:600c:c10a:b0:477:988a:7675])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fcb:b0:477:7bca:8b34 with SMTP id
 5b1f17b1804b1-4803e78fdb4mr130750555e9.6.1769071323772; 
 Thu, 22 Jan 2026 00:42:03 -0800 (PST)
Date: Thu, 22 Jan 2026 08:42:02 +0000
In-Reply-To: <20260122003746.405370-1-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
Message-ID: <aXHi2jJNptrgUqyj@google.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
 broonie@kernel.org, dakr@kernel.org, miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:broonie@kernel.org,m:dakr@kernel.org,m:miguel.ojeda.sandonis@gmail.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,collabora.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 540BC63550
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 04:37:46PM -0800, Deborah Brouwer wrote:
> Currently these warnings, as errors, are preventing Tyr driver
> from building:
> 
> error: field `device` is never read
>   --> drivers/gpu/drm/tyr/driver.rs:37:5
>    |
> 36 | pub(crate) struct TyrDriver {
>    |                   --------- field in this struct
> 37 |     device: ARef<TyrDevice>,
>    |     ^^^^^^
>    |
>    = note: `-D dead-code` implied by `-D warnings`
>    = help: to override `-D warnings` add `#[allow(dead_code)]`
> 
> error: fields `mali` and `sram` are never read
>    --> drivers/gpu/drm/tyr/driver.rs:196:5
>     |
> 195 | struct Regulators {
>     |        ---------- fields in this struct
> 196 |     mali: Regulator<regulator::Enabled>,
>     |     ^^^^
> 197 |     sram: Regulator<regulator::Enabled>,
>     |     ^^^^
> 
> error: aborting due to 2 previous errors
> 
> Suppress these errors so that the Tyr driver will build.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

I still don't understand why I couldn't reproduce it myself, but
assuming it's not just an 1.80.0 issue, below is my review:

>  drivers/gpu/drm/tyr/driver.rs | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 2a45d0288825..04c865cb4397 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -34,6 +34,7 @@
>  
>  #[pin_data(PinnedDrop)]
>  pub(crate) struct TyrDriver {
> +    #[allow(dead_code)]
>      device: ARef<TyrDevice>,

Let's use #[expect(dead_code)] so we remember to remove this when a user
is added.

>  }
>  
> @@ -193,6 +194,8 @@ struct Clocks {
>  
>  #[pin_data]
>  struct Regulators {
> +    #[allow(dead_code)]
>      mali: Regulator<regulator::Enabled>,
> +    #[allow(dead_code)]
>      sram: Regulator<regulator::Enabled>,

I don't think we intend to ever use these fields - they exist only for
their destructor. In that case, please prefix them with an underscore
instead:

#[pin_data]
struct Regulators {
    _mali: Regulator<regulator::Enabled>,
    _sram: Regulator<regulator::Enabled>,
}

Alice
