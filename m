Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AbCHU+vjWmz5wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:45:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85E412CA74
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAA510E71F;
	Thu, 12 Feb 2026 10:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j53LgTeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BB710E71F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 10:45:32 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-2ba85f77203so349157eec.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 02:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770893131; cv=none;
 d=google.com; s=arc-20240605;
 b=K2/O/umCe8iyLV27jXJrFrffY/pcrFeNQjYgR0s5bdYiQADRLXIE+iQnB+7aKjiMvu
 SQSEnlYDifo0p5Xlm8/1LQqoHjQIH5YaiiXaRXsB/JkB/WF5D3nkhNqnkkcoUtss2H2e
 h921oCdA8eDsluXuBmb3H9vyUHEiGl85LkapRB9l6TeECJwNBamiGPQ3vjeMhlzdTF63
 U7YFRt3WpuzJ6pEklV+1jKpQRUh6M3UVQH0b1aMoZi4MHqn6wz5Wrk/MybGJwy8QBooP
 uyDu7WnTXBwCd8l6ikUbyWGYEDUNKQSJUNkU5m6pmeYX0SWQE5UyOzjZCDOa2y2gVGpm
 Vc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=phpZ1LJL4LHD3Xu5bAIFwIXSGa+vgb+4IXaYk+lvQ+c=;
 fh=bTWuTnjWYpG4pyp+a1DWYscbQaE0C3juK9BoadpjYyE=;
 b=D6pdv8YdI1ALWvNiDnCKRyAcau9j80AAwbakmAooNxQQdVEh6EyCbmjwbJuZBB58CC
 BzlwoTa+hx7kRNm7u3KbzgO+nUqPp7ta3+EdgfcdQezommXdEaqnSIKjqvs8kjnomXDK
 d87jDro0yULPUEx+CtEg2wSwuptSMFQIyfSupNhJAZUY9UbDPbe4Q4VjCR4RqHsklCVg
 bWOMjC5n8q2qS1q7+UGevZf3mhKk2mcee2nacCU6lFQns+efZjld9X9UbV4PrKbcfCAN
 1Yqk9P3ukrdExnwo0bNp8tnux3hA52tqHx9p4tgjsccRANpdNvGzpakLrlJtUqbGo1PD
 mU+Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770893131; x=1771497931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phpZ1LJL4LHD3Xu5bAIFwIXSGa+vgb+4IXaYk+lvQ+c=;
 b=j53LgTeCOu5RSc5gZpew1p45Noh9AhMf5ufow/AavxvHfEnb3+aqPwEg4FAkvUCNRV
 G6dPcQhxQdY4AkqrofyLLK9g/tEpnsXTibp+Aw8BreExO1KQqJWwnJWoYLC45pqy8yUb
 b/FTT43XPh5ck76rbzwAzmOG2b8CIPIuxrWRSG0vuHZVtzOEMKa35Flr4YI9hWQU8F6V
 a1OWF1Nj9ZP43K/X8uSpSLP/5XN5W7DA8ZFCP67+ilCbNHK/G505LRbKHgVlsDvJlqoT
 WbXn930vXXg7W8Wy90EPN3BXzvDRYSF1BY6+zzyKiw8bvMiN74rzrtdqZ5Srp+4/+Lka
 dgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770893131; x=1771497931;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=phpZ1LJL4LHD3Xu5bAIFwIXSGa+vgb+4IXaYk+lvQ+c=;
 b=cgWdsVWssE0eR8WvA6tkxdbeiwFgykbWbKPV+tSk3X3jFP2EadDZHHkpcxdWdJLKDn
 Cy7c2Qtz4wwNr3Zh+EbLH9j4Qz5rP1VZmD40NlAuaFCV6g2Hv9j4WGWyLZv+kuGIy0Ts
 0IpTCGplGOyR9argcHElhxsN1yNzlaJCAtKmIQ1LZsGAVfcwnouOle8fLOwZcoSBG82E
 bYoZgEq1h772v18XKnk9i/eWn3Qzkj12pBx9wu4/P9HofdZniSi1/4bQwji9oj21mqQw
 wdr+MHYlIebT0KGNjDaciCyhI7KouyiP+BXaz56RmgUDZAjADnocJOf/OJa8PX0GiCyN
 7LWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfxlNlz0bniLo4808q+k1bHVHOS6GcqhM61BKKJgCTYtVUSWiiA9+ks585G0SXsucqoZD51NmMuXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytrEpRETxul+FJoRRNgS7ZaC2RzNAdkeAi9+/lGMP1gBXsHS5V
 J4qeSF+wfASiVTJWLQPLy9HeBmQhClSgza0o2udJtFqn/1DraVwqUxMhqb2mgA9VwBXIDWImPuv
 AIQkDXRPwv5Y8LPq7yAy4xX3JPXW2Kjg=
X-Gm-Gg: AZuq6aJrgO0xz7E/nKibYBhYKYna+nif+zjytTyZF+/nXbCcWVbAplj/+rOSVcz8qWY
 4AJwkTPjqR0W8j2XEnG6X5k188/RzXJ+zQoOoT0xoJrd77jb1JsDbOAE8kXgV50XbsYw9+C37DK
 GRkyaQ9jm7l9+dwUaiIm9Oo6genpabTgRLOEBNnDmzYAjzpoPsVE+q+Cyf2JO92Xo6/hCcQcG8b
 FUlyJ9HBjRvDQIIHC9dUDzXF0pjcyOWtt0snikZ7EIKLu2G5wJ3/t1chqkdIevFnI06fsdpaNKr
 wDHKe+ByjbvFeVkNdB50wIMotJabq7rS8b+79qyEZ3kefFzIjLXq4TcD2eSj/VMLMKyo155QJW3
 iJ9wMfDxqciCakGBlKnfNLQIa
X-Received: by 2002:a05:7301:1011:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2baa808a1a0mr502293eec.7.1770893131339; Thu, 12 Feb 2026
 02:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-8-deborah.brouwer@collabora.com>
 <20260212111113.68778819@fedora>
In-Reply-To: <20260212111113.68778819@fedora>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 11:45:17 +0100
X-Gm-Features: AZwV_Qj0hpy9yWpoQU6BD-WczAf3MmOLS9jRC4UWcoe2oNEcIa9_Ve27ZA0Cghs
Message-ID: <CANiq72na4OjOT+LD4E0oPoPtrV5jJXoApbhoSbVivMDOwhkPMQ@mail.gmail.com>
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
 aliceryhl@google.com, beata.michalska@arm.com, lyude@redhat.com
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D85E412CA74
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 11:11=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Don't know what the doc rules are in rust, but for this sort of generic
> layer, maybe we should provide extensive docs around objects, fields
> and public functions. I see that most struct fields are documented, but
> not the struct themselves. the enum doesn't seem to be documented, and
> some of the public functions are not either. And that's all my fault,
> because I gave you this raw piece of code without much doc (you added a
> lot already). Just saying that, maybe now that things have settled
> down, is a good time to add proper doc where it's missing.

Yeah, documentation is definitely welcome, and will be rendered for
all crates in the future.

We configure the compiler to require documentation for public items,
and while it is not enforced for private ones, it is definitely wanted
and expected unless unreasonable (e.g. too trivial or onerous).
Examples are also encouraged.

We generally try to be strict within the `kernel` crate, but we don't
want to make things too hard either. It is a balance. Subsystems
should decide on how strict they need/want to be on things like docs
for private items. Some subsystems define further guidelines/rules,
e.g. like Nova:

  https://docs.kernel.org/gpu/nova/guidelines.html

A few related notes at (I am writing a "coding guidelines list" to go
along that document with simple, short notes I have been accumulating
over the months, and that may also be useful to give to AI review
tooling):

  https://docs.kernel.org/rust/coding-guidelines.html#code-documentation

I hope that helps.

Cheers,
Miguel
