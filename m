Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GQcCqZYl2lPxAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 19:38:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F99161BC5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 19:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CF510E737;
	Thu, 19 Feb 2026 18:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jtaAo+jL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467F210E737
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 18:38:24 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2b8095668ebso23163eec.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 10:38:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771526303; cv=none;
 d=google.com; s=arc-20240605;
 b=GWxyTIhdl1gejaJkni1FNI7O14IfBD7bNqgp5qiZeUwAmgpzb8F9Z8e3Euyn+Hw1Ld
 esdJJSIs2q5ISMT6O8/HH/tE5p8KsWjhDoWrL8uJPb6rPc8Y3iiAMk+1VZRXQlXemRam
 Y4v5vMtnzKh7Hg2VPGEDy1IBDqC3pQNgSWOE6q5/zoW5eb4kHbRCc/B/q7hUuPWtiPJR
 L3Fr6Dp6VTiG2liI18AgsHswTVo5jcQoqlh6MQoXe8G+5cP53+055IRGrrYsrKs90WdT
 WXAH8aCKXB1bCRqqxqYNWYPjCoNaBbBE+4HeYKb6WirWzLqUWso6g8L+seb2fKDQXMPp
 Qp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2/99nRZ95IjeVc75LvwCdBJOe5YtV3DPyqkMVVh+UtY=;
 fh=g9J02Rsb44C2CKj2QE2n+goytoIccrahb8S39PC4Xvo=;
 b=e59yUMrz0RsqQz661dQ54k3Jatu0w4HaVMxyzjq2JC/92RcRlXwbAGBKV41hACbWlA
 68XMfBRn1SEfO/+ZVrkDUbCg9z91Ii7Bqno2jKpvDUU7J7/vimO+qxWbQpZAc2d8PxBR
 Ox5PVB2HFwuEFd75dh0gSHw4vmk0XDxNYKmDIu6VU5aNWO/9dcKIwcKNmH/Ra78KtvM9
 oDl4+x1q165llFixahDwHP0YgnVkc4cNinZFORZRx00tesv5R5VceQj77416fgz0b8a5
 mC9wJn7RKCdOF/S/vOOb/s7q/LP5yGfNKf46PmUZUsoXesh1L+jqqGlJ8FELUxcSek/2
 4zDw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771526303; x=1772131103; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/99nRZ95IjeVc75LvwCdBJOe5YtV3DPyqkMVVh+UtY=;
 b=jtaAo+jLA6PodvlGAb6g0/54DyPTtKG+pcU5x8v45aNnd87Iv1ahJGLyK+RXxZMfUC
 aMmva2CsJYDNE1MdQ2bv1ddAEDSKP6IklmS3iNy3rFhMcPs8JTtkHzzu35v9LVjRD5Fk
 qPR/AjCaAKdigXVsmdufVYo8wp+/NmqPNX7DyoEISX6wiOGqO9dXthsNUMy+WIEp2Ero
 bo/SKtGVDj34v1vZNaoLLWmPxHlWOD2GxX69MPadNx8/T9Itjt3fEvZpU2Tb0QJtr3gC
 GyldHdsXGk0w39Faf6Wqp6tx2NbK+d0AO0znwdB5r8xfCLfqYdjBZcI3v/I+pd2T9Tjh
 EWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771526303; x=1772131103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2/99nRZ95IjeVc75LvwCdBJOe5YtV3DPyqkMVVh+UtY=;
 b=rzInpO2rcFPGy6c7/yYCUZID7vXyq63+wRulMuldYBMUijw2Wl0vGmHvUT/5xwG6y/
 jH+XgbaDu4fWZcX+uZP0XnpGqmk2p/VlL2hv0mSGn7+d/yO0asLDziAeI+iYjm8cYKhy
 prhZa1z6xpG2Qbyz5ta/H915Kzp0T3J+pB0544N9Kd7W18mJYPLdO4wxOZYXRvyr3s+r
 dv+1v7XwF8klmeSrlt7Oqc3c88CIi3pyMV+0F0ZjcELKgzCbsIa/Wm0dahTuqWwXZYeI
 am7u2+CUq/m9NbH0CypSEUymMkoohYThdvJeARHukOQhZVey4wuTg6ahZtqB8KVdRZ/Q
 dM+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyRmWdmoslbVKORSy0Ypi3iBL5xuwf7tb5Ybcxy3Ybsp5QB1NQWII6W5VG5B86rIME/JuweY4vq6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI+inZvblk2BCNBFHOMb+aNbyChN4U0h/RqPJMuAE8KOVYWIsP
 KoKrBoCXJN09uWXwQMh84XhS8ZB+jsk/AEt/WBDmdWFcSvU5QQMnEpt/xspreCRzt9s7QIAT1pn
 9O2y5cqPmxIxE0MX4jinQ9MGfooHiMIQ=
X-Gm-Gg: AZuq6aJS/jv8kMV8idWlGpo1E8RwHngJyz86S0zKh1T4L/pkMd+ti6KftYWMdiGmOuc
 Bez6QpZrUy/imCKjWZE0wH47HJ2w8pk36zHZJ9CBHopDKL/C5yA8XYJTb4qVn5xpRJ2Ce/0SJFH
 NjpfO9/0Rns8ajEXlfr6OHjbGMfr+GEAyb2+QatLmtmaynfT3Q5VJEsTYHnUYM9+vR0Bq7yfksV
 kEeiOVWH0TOUAFfYOd2qFmlVCN7LORZphUu3HgycBh74G5yC5gSXBEt7e5xpWGcxSjugf65BHFP
 b0iAajNq+wvLKa8jyM/6y2PUrcmO450cZPZZRIP/PnIpV8MD1vx19NYCP2dpkJN72r/DusFY0VE
 OuMGhA7up68hovPyEcNL9G1Y7
X-Received: by 2002:a05:7301:9f12:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2bab9fdaf9emr5325750eec.1.1771526303423; Thu, 19 Feb 2026
 10:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <6a2b1bbe-7a36-4162-9110-a00eed69f156@nvidia.com>
In-Reply-To: <6a2b1bbe-7a36-4162-9110-a00eed69f156@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 19:38:09 +0100
X-Gm-Features: AaiRm53j9rn-ZQL0hiiQAUk0BjVlxqB7i8xeJadkWVN54mZayvqJi7_JF18SlVU
Message-ID: <CANiq72=2Hx9QYbdFee7FZzF2tt9dzAOs7A+xe=tAXZi3_o2DCg@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Dave Airlie <airlied@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Nikola Djukic <ndjukic@nvidia.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:joelagnelf@nvidia.com,m:acourbot@nvidia.com,m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:airlied@redhat.com,m:daniel.almeida@collabora.com,m:koen.koning@linux.intel.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:ndjukic@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 94F99161BC5
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 7:07=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Yeah, this is a good idea. I am Ok with that. Alex/Miguel, you're Ok with=
 this too?
>
> If all in agreement, I can make this change for next revision.

It would be very good to get you guys (and NVIDIA) more involved in
general, so thank you! :) -- (and Danilo for proposing it)

Do you want that I set up a branch for that like `rust-ffi`? It is
usually what we are doing lately for things like this, and slowly
splitting things into more pieces. I see you both have already sent in
the past a few GIT PULLs etc., so possibly this is not that
interesting for you, but we can still do it.

Cheers,
Miguel
