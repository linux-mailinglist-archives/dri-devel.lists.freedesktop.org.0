Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLMbGnlBc2mWtwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:38:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64A7378F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0919810EA86;
	Fri, 23 Jan 2026 09:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FaB8YSUg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211A710EA86
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 09:37:57 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-2b71e7dab12so170890eec.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 01:37:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769161076; cv=none;
 d=google.com; s=arc-20240605;
 b=DZ31HvlhctJ65XstaasZc5XBqrFB3FmKxNYYv/rzR1ezmEzu7+QLZ76PaG85TjzruK
 P1ZMS6eZPk/zGs0q2gS5v9/EtWpUz3NrPfzHXrFQwLduZ6lhrd+kov/RlrMn3ooH67U1
 l5GHIjM0G3Ej4MKrEenwcg/6PT42emYwsxqjlxUMul4+HRvkK1TkSO4iPKsMfGdkAWTm
 7psM2cSSxvgoZ8pw9etEqfkT5tk8ItXkkUbpwyFUI93ZMvWzzrjOW8yZIb3lnGx8yl7j
 g8H+TC+h6vZPJTNwv8wDvfm+BTb4HRlczJdbwSCA/sjLfY3FbZNUGRiD3IbSummq7MHI
 GPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OKbiv5C1O+oTj4HZTm9MkPI8pY1Wh7MDgnYiN1gWUHU=;
 fh=f7eeuqRdeJYsODM9L+XIwkg7TuTFPiHwpZB5UUVyUXU=;
 b=LTvUL1Pu4DhykJR++ZfEGU00pQ2qHvfNETCkHnQy8lZ5Vkqq5XsCXF8aKFHnOYo7ok
 pl/zWRMgv2X9ytLtZbOiApjtXKZbLe2gkpftdtUveYrXTgVOsHWsZDSo7P0ZADu4/Odk
 yBp1QF+IlKoVKNUR3EOryNhjW4CLGIMSqoImEmGLoJdmCBvCOcwMNEPw3g5KwseRTvwv
 jAmiXvoNW1kvpTCA46CGEjcTsnoE8CwR4oSuR7TEr0InPy0ncAtRgrf3lWaUxGkqP9HJ
 e8sDyuk9oonuHAYU6mBF6eKzTF4Zy+tCPQe9ZpwknOw45sNCgV6IjKFBMeb30Sq3XAiH
 dIzg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769161076; x=1769765876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKbiv5C1O+oTj4HZTm9MkPI8pY1Wh7MDgnYiN1gWUHU=;
 b=FaB8YSUg8Pp5jMXAsjJKvgJtxelJeZcWqsScv+IG9Rgg83QVMsRkMu4dtFHfu2OCJy
 CaKn2qBfTy+/VqnmkOaeUW3WtFZm7tlnOJK5YC4xvpQV9hTtybb4r7Ix++uAbrvwD9D/
 2vUQMcPZT3bjgrz7OWG44Q++Adc/wGsEzl91j/XKD3uD+QZy+x5TdeN1jk/QaiV969Hl
 gSWgjPwMQ1QwL/3ckFgaBbOsCnqiGrIjQSnbNOkkekdICepo2T6z4mpmghyq+SWw1d/m
 5M9RQPXKmXKhs/ObjOxoIjBTEZoGTMqUInAkExMiwPw8mF4+jBAarkdRg6JsdRnpkM/r
 P56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769161076; x=1769765876;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OKbiv5C1O+oTj4HZTm9MkPI8pY1Wh7MDgnYiN1gWUHU=;
 b=SN/TR3ZCNa9sjbRxaAe+K7wWsU949OC8ZsX581zW7IeKXuDP4Gw9ysT89kxHFU0SLA
 zqx/eu5N1JGlJVG6L/dg2d4ENAm7WNehdg7LN66VP3raHnr7hIVRAZ9hHDM9Eg5nFcJN
 OgxqaBkRoGMjUsxfMD4jZAWETPh7UeMUBfxxYPS4kEHi7cwIbqxMp+dp86G7bQCdra+C
 ljeBnHjJLxiPCeAvfhoTgDLeURZQW3EZrBNigIGOWySM2AGPMhAHAfENojluxmC00ar9
 lD8IOpvcFX/L6toLEtg7XsIiIeVQMXLfaFwyP4f2/7MuaYJ1LB0KN5fs92SU2KbTz2y8
 G6tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz4/WWb7+ijOaEvFaI/Cs+zWqQ7pfAHKuw6gjNy+211TCFbS6I4Xg7TXM2pNfALtHHFyPb9oUjs10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yws7VdB2ot+Dgz/aShQa/+KUNzPb8Ij3NVss8x93+QxznqSLMU4
 UlJDT+8bpHR33CtZ788FdG25kEjlLFy1rUv8KZdtTTIo76o+oq8CLw5hXtV7vje5rpoie7yBkIc
 6x1po+GqRekAn+27fgDNZzhnDvwP+O0A=
X-Gm-Gg: AZuq6aIa8L5amFtIqKU/pcuaJPv9IvXf92nNurVylsc1+8du1LcJmaAjiyRXXl0Fiis
 SnGXT4a6Lnb6SzUrU7d6WUr18kUnny27cvRdnsA42Eggq69LDGjutRHgQLIQtMZ7yMnTjJ+K+Cw
 t9XgaMUcO6EBc+p3Da9cYCl4I28Xpsasb0qnJ1A4qclvH/p5F29W+n0qSwM0oJFkmPdCSeiDjn5
 8APUHi+5pNe/asOrREPxFcielEPtPEWLSmx011JcAXyHGAUX7m8qgaKxfh3tk4vs7WY/dGKPjOr
 GTomTmjRq+VMyp2mfMyAZAtADlr1WOZy9R5XNCF9uO7zDGPPpswGxmB3AQd+tPl2K20FWpk2Soj
 19waQF2fqlI+R
X-Received: by 2002:a05:7300:f081:b0:2b7:24fc:f625 with SMTP id
 5a478bee46e88-2b7397b575dmr561451eec.0.1769161076214; Fri, 23 Jan 2026
 01:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20260122202804.3209265-1-lyude@redhat.com>
 <DFVEI4KHCNFS.2IT595IZJBGGT@kernel.org>
 <25d3c403781a88019340a47567ff85959b0c03bd.camel@redhat.com>
 <CANiq72k1b3DLEy_32ruWu1XBFK80oRDVzSer69ANL_232mmv-w@mail.gmail.com>
 <DFVHQBHQR2CW.2X27B7EP1WXTO@garyguo.net>
In-Reply-To: <DFVHQBHQR2CW.2X27B7EP1WXTO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 10:37:41 +0100
X-Gm-Features: AZwV_Qh72c8avqIB3lLn1gouNrn4jZK_rjGLxuQXGE3UwGch6Qniu9pnHjC3WXU
Message-ID: <CANiq72mxEt0dx+rDkCjvJ1X8H2G9CzVd5ZWAg3HSoWG=EsOCiw@mail.gmail.com>
Subject: Re: [PATCH] rust/drm: Fixup import styles
To: Gary Guo <gary@garyguo.net>
Cc: lyude@redhat.com, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, 
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
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:lyude@redhat.com,m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:ojeda@kernel.org,m:simona@ffwll.ch,m:aliceryhl@google.com,m:shankari.ak0208@gmail.com,m:airlied@gmail.com,m:lina+kernel@asahilina.net,m:atharvd440@gmail.com,m:daniel.almeida@collabora.com,m:shankariak0208@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,vger.kernel.org,lists.freedesktop.org,ffwll.ch,google.com,gmail.com,asahilina.net,collabora.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: AD64A7378F
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 6:01=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> This is tracked in https://github.com/Rust-for-Linux/klint/issues/5.

Linked, thanks!

Cheers,
Miguel
