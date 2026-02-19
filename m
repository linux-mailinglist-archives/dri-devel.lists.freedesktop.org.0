Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC2rEf2Ul2nO1QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 23:55:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE75163664
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 23:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7561110E356;
	Thu, 19 Feb 2026 22:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kh8Yk73K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADEF10E762
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 22:55:51 +0000 (UTC)
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-124713e4244so135364c88.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 14:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771541751; cv=none;
 d=google.com; s=arc-20240605;
 b=Z2MiAv5rkZ/IkzXUHtlxd8sJuRmpFnuTHJKRHkb0c8ERa9YCanznfdbOyzP/TD3DOr
 OgjtPoFXOF6TDWOssJTxbpWoO88jgAsrJwJkgz2gDqvJ4e/U57kPxlA2anbqq+GqFm6e
 NUW78GwLDr7FMscG1eD8o4kb5LfgKxq4TxwB91LBXWGADGDaNAHzzT1JSlLPi3HnFXZN
 2r2DVBn++INjnrXbUCIyVxKP0lNjFPgUiOv9A5ambMKx7/7AJqrUdKFQIYIrYhYri60K
 JssRdd5Tqgf3KOnBYrLIXYtY3JLq3Mt0c0Skg6IOuELm7QQueS5TyWNMjULuc/HHolPL
 zuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tzmFdsfq8MNx6L2xpTWEWoiPLvNts9kq7DaS1ogvM6k=;
 fh=zs4bLRQ20fWVXVnKDvScl6S9516C82jNvAmIA62M2DI=;
 b=PaRDz3ZD1bRCmYrQyYvZ7yOSCy5Y/VNHQc0llPa/IscD5q0KftiFLMf9Ci+LjwzyOV
 Dc98LsXmbZ/xynHS0rpHEvVUW97o82N81VbCY0jr2UoJBdmsJJOhG06NWkIutJaxcBga
 2/5q1C3uhorGUIY35DkwP4Cha5p7ZFeOXjdVezaaiNDq/sMVFBaNyd9fsKlHWHzbIAjO
 My++an+RqdcZfzh4C3pdISp+6HiOmi8xQULLS1fSIyCiUxjSe87VU2eV8eac590xmWNQ
 gfgzcUgOh3HcfQoXuh9idBHzdMxysifne0Af6kipPK3nZyZqlIyrr8FfcPDW7nkd2Tcq
 GjRg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771541751; x=1772146551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tzmFdsfq8MNx6L2xpTWEWoiPLvNts9kq7DaS1ogvM6k=;
 b=Kh8Yk73Kb0cdU+cXOT5YCH7dpTCOtVIkLLdkg/cpAs7RJ6ZGuJY7Sv0uOXsnWsvGdm
 Jawx+IQ/WMXKREfjNcsASBQVDRbnV9DCE0Bo9Vxzn52dJg8okdS9QiVErhvwdkZEZz/B
 ZR2qLTHzIFV6lPCj0GTD7LAE8FIyKdp2uPTdsrWoFS7mT+BcWo2S2FZhPFMZ28BUFXvV
 1H4Sl9AAgZpp33wAir38+O9h7QJ30v6tgmHfL0RjOazckU0ZpQZKFX+ES2PMfN7XLO3Z
 tDipnH3uQk0aO/A6vyNu3pF5f7T5N18HCiM9AlcAio5KFVNecf9sDLdQ+lHb7VYg6m3f
 dEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771541751; x=1772146551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tzmFdsfq8MNx6L2xpTWEWoiPLvNts9kq7DaS1ogvM6k=;
 b=daeFN3mgY4GQZWsatVEmW80T2UkDB5MD5tUQ/AE/mQd+0l5e+fDkNMze6qKVgQD4Za
 6KqbztFrluYc8hJCxw7dertR5fjsXv0hNy6jo9o4vC3PhS343qv+TzMWcCc0dcDe2c6h
 6T4v9wpC0IwmUtBjYMJr4IPsvN8zpWkMhqv8PWTuXMZefjyCf3rVCJtDoGeGlvuBipmV
 Nd1aBq/ZBaMnz0ijL2Ej1bJAWrPbFtDbU+0Ufxv2yH7x8Sw8Gw55SFPgJBsSQp7ccFvM
 zyF4mIFx2RFVdcWqr6vnGEww1GeV3aGG3W3KmCkR3EXo0n5ztFL5rTPlRJBvoYXbYPjP
 YmRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIWE64rTQv2pIv7Ii3OFvtUwGC34AN7vNScpOQFB4be6aR4ajjLviDkMDVZloMhdScHGZYrUqMnvI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt9aUTWjn/qkzlTyFaol6Zl8Yjnizt6aQjcCcX+awYRdE8uVUD
 JVCdFhdQ8Qp1xH/++ZZQUghVXSb6Kf93+bDINGNxsKiiuWxVhghNokqy8ix6GfWNL8Wj1KFNi+R
 nENFUL5jABBs5UQMgHz7L5Jy95IOlJx0=
X-Gm-Gg: AZuq6aJEXi6i3SIocgM8/h/8wQT6qWOGCTqfWcEL/hX3e1gPvby3YFbUhUbePXPrZt7
 V9vs51a9glIv+JWzXwAdSULXwt5T6/gIKjWGZYQucifq+EI1WkGHXGUh0FJ6ZsTfRN4r3c6zEmX
 RMBLq8GYF509iPjrjD/pNMX941GBqGpQVSoNAxOYiqZuxtZuasHF8alZo+kpmO/WZ+4Gi/kfWr/
 XvDIQ3ACPp7b1VRMoZOwlMRIZHBnRJPkVB+HG7z0axQqG2u+JK3rnFrAmRcPc4brukriqWdKUwV
 NrqNo9EXv2m83No/89rRqlTdGDJJgNbMREQ6IHpNYSKCXWOoYZ0HuaxVzjfEyIud3eL5pbFrPY6
 /OgHHuIdIHqpuRnJCExd8hQgF
X-Received: by 2002:a05:7301:4591:b0:2ba:75f5:72cd with SMTP id
 5a478bee46e88-2baba129259mr5952861eec.9.1771541750839; Thu, 19 Feb 2026
 14:55:50 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72=2Hx9QYbdFee7FZzF2tt9dzAOs7A+xe=tAXZi3_o2DCg@mail.gmail.com>
 <FCF46102-0B7A-4972-90AF-985A9F45CE9E@nvidia.com>
In-Reply-To: <FCF46102-0B7A-4972-90AF-985A9F45CE9E@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 23:55:38 +0100
X-Gm-Features: AaiRm50FqOS1dTWgKs-rY8pjqDvqyuBoJm6Fgf3-4VuQIwJo2BUnXmDIAOZ9-c8
Message-ID: <CANiq72=A22Xn+Ocd9-GU_CVU88LD6i1hTHAeQPqLEf-j17131g@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: ABE75163664
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 8:29=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> I think let us see how it goes and how much is the volume? If it is
> light then I/we could send you a pull request from personal kernel.org
> repository, if not then we can set up a branch at that time. What do
> you think?

If it is very light, then we could just do Acked-bys, but setting up a
branch is easy:

  https://github.com/Rust-for-Linux/linux/tree/ffi-next

Please feel free to use it (if so, please let me know your GitHub
handle -- I already have Alexandre's); otherwise, we can delete it.

Having all branches in the same place is good for others to have a
single place to look into, and has the advantage of being able to add
it there as a `T:` field already.

Thanks!

Cheers,
Miguel
