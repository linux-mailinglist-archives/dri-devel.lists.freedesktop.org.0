Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKa7HVN2cWngHgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 01:58:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66B660226
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 01:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00D210E19A;
	Thu, 22 Jan 2026 00:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l0kQ7dNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1800910E19A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 00:58:55 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-1233985e56aso26322c88.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 16:58:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769043534; cv=none;
 d=google.com; s=arc-20240605;
 b=Cn9GIh3k90YhHjCs4T1VT4T9oQzoxTPcwzE/t1nE7+IolwxV5aSAQwPthGUsx9bANR
 bLtakjSv4+R4R2blmtpFQyY7qVxtpFHAmUi+s6OBV5cd4nQq11bwh4RGod8wgCytnTt2
 zS3g3GVRf5jXu1vsZX/88F+clEN66UBUp5LNmcVrmt8AoRowxUD7X4ZrsfJUbZYTyHEv
 wQ45t+hQ8lwxgnaoPt2B1n053Fit2CuETezsQfifrIT3K5s0l5B2fL8wLao8Kj9yUCLt
 sFZSygSlmzw5I3dqP09efsk/kg+bhqosJJ9yVr0ann5lWqms/r+YB1fV2rs2j/CX8ase
 Sf0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ePOS+ru0GKPNPJ/oqMKjbYqjVjULTjEPxdStPXBVmqw=;
 fh=a/EgYQRbFjvOCAVh31N4h/Agzg3cV3cnM6rW77ZdStk=;
 b=FFUmZExjVC4MqIF1QAejr2cTsjWcZFG9mdWZwXJ8pvLQDBfAQo8GHA9I4F+jW24Jnz
 2BkbwJKnFm/d3B3Zik0s7XYuVnu3m9V/5R8uXwfsEssZPS2gBXzU76u+h5aFGFMeAixn
 O1b8bf8tJ7SMajFczFoJbE9ESn3mOnjkO46S1HWpXLkiQ66Fb46UFZoYI17B7jNF8LSu
 veEmSO79O4ZsVlSaTCF4iZBWvSWJx0fL3G2N+5jLMSO305C5EatLiVaqNnxCfAOuIkj3
 p1Hvlz77/Y9z6OS2t1F0gvXTddRseJPidE+ewIpCeU8k//OVTF6LRAKUAZMh8qDNmmUI
 NL1Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769043534; x=1769648334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePOS+ru0GKPNPJ/oqMKjbYqjVjULTjEPxdStPXBVmqw=;
 b=l0kQ7dNyUzkU2B9DfHko7deE/PP7jAu4CanX0g9ofs3KCp5UWWLj1hq5EzyVWF/nG2
 hjW5jaqkAsAsIepDLZNvn3hnfBGCgqoMz27BMcMZNVuPse3ofBsC0uVJ2aOWNrNnBqJr
 +AcmYLgiSnAvqs47Zteq8+6XyGnnElUg1vei+UMpMI6HUvapIy+uxP+bxvTdosUwImXj
 jTBeWOFNntG85Vb4Tsed4ttKq3gucylUgUjZhK5PWvz/Rf1hDvQWAEgnultW7hW/qJaU
 rC1H4/NUvEXAuBwkfu1LNKGGniPMMQuavhHCwCqsnLqLfGWSph45efqsbmageL6zMEyT
 Hc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769043534; x=1769648334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ePOS+ru0GKPNPJ/oqMKjbYqjVjULTjEPxdStPXBVmqw=;
 b=N1tBDC5VRzgUd2Ym/pl/vhXkGd+3mZikTdg0YbJH0e78mUbiiKSB8KCqRJbIJUUoQT
 gzLB6d8tyfdbBYlr2hG+0VCGahBEet4FPERc08Kkxp0kgMRqRFOQjRe0ayDLrghk3ZBB
 0RARTUHlpyCLhiOr/DSsUHBRgARGr3xXvH3OKijMBJmZ8rUkMZz7jkcsuZ8z/0NynvP6
 xg8cVWi1oYIyHJyve4/A/dFtr/KOPqqVlCmzlbr7y27LZmqgIfrWmvDpBfoU2zRf+Gab
 wu49VpwmPZ+wXoDO3eA+I4iwPMe3vc8S4TjlC88BRs6XIbTuRLBcqD/Pusco0fz8+M5u
 jgxA==
X-Gm-Message-State: AOJu0YwEcuacMmoMBZaN+yZx4hIH2E5xl57vfFGKMLXtOFVYkcStZrvi
 T4KU3LBYWqqKZE4u0RtmZYDbCWjc1dEl0zHTcsBRjUzumT8bViKhKdcofxgn4UXJm1WiCInvGB8
 56IOIuWmeWDGl2Ge26wafDr/8r2ZIj53fVg==
X-Gm-Gg: AZuq6aLEC+rHmq/njlHpUXqcQ3hI9yn+CtAbbIMw4VIlgOyAtOC1xVKw4eUwSjRRSe4
 Y5fMGFMwYdu54KHSm0Z2Sn9Hl1L3Iux6wHvZ+WK+tahrKsEirRLXrvVaREXVO2oKSRGDvPNQlNk
 V+o6UwkzdC3uShuoL0vs2InppHyRqMLAx/OnKqboNQS6jk6gzmoSUIcWepQnl+nn8yd1gVQED14
 T2X+VaBGySChQHr4qADXTSBlmFqkyu3YoPu7ZUTNo/fWlQp+3XVx7oUbVn3PPqZ04nB4KQnaldW
 ejZBCl0b/4gaBRhTojDSwm8PAOTR9TN6fCA8kqUcDAfQHyFVt+YuACLrEvqSt9gHFOygVdZKMV0
 pfD8RXEOPeAQR
X-Received: by 2002:a05:693c:408a:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2b710089fb4mr1300915eec.7.1769043534133; Wed, 21 Jan 2026
 16:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
In-Reply-To: <20260122003746.405370-1-deborah.brouwer@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Jan 2026 01:58:40 +0100
X-Gm-Features: AZwV_QjET6D4LLELM-SXyns7n53A43bBKl3-wihBiJ4nAUEgyGlB4PBhb8I0Qdk
Message-ID: <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, aliceryhl@google.com, 
 boris.brezillon@collabora.com, broonie@kernel.org, dakr@kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:broonie@kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D66B660226
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 1:38=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Currently these warnings, as errors, are preventing Tyr driver
> from building:

From what I understand, this is only reproducible with Rust 1.80.0
(unsupported upstream), and was fixed in Rust 1.80.1. Did you
reproduce it elsewhere? I asked Mark where his toolchain comes to see
what could be done there (e.g. in his distribution).

If it is just in Rust 1.80.0, and if a distribution still uses that
one, and for some reason they don't want to use/backport the fix in
1.80.1, then we could consider something more global, i.e. ignoring
that lint altogether for that version, since it also fails for another
trait in `bounded.rs` (that is why I knew about this).

(By the way, in any case, we would need a proper explanation of this
full context in the commit message.)

Thanks!

Cheers,
Miguel
