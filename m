Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EzcC+tad2maeQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 13:15:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3438815B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 13:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4897410E405;
	Mon, 26 Jan 2026 12:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fnIihzMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F3710E405
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 12:15:34 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2b6aa67a792so225609eec.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 04:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769429734; cv=none;
 d=google.com; s=arc-20240605;
 b=YR4osBAfmTEPMBloNJ+GU4UUWHHmxc9tDkkuMJ/qvBoIqojjbJOGfLN0Z6XO7G3g+X
 iHpIc7GsCAjLGs9shSnXgJEw4qiBt/mgt+SBJ+ORAH9rE7O4Yob2gh/N/rF0ctLsgEGI
 LFMMpcikQsjMTNsEfo681oumI6mlk4d9iKVirXV/kJwJfU6gJmR/+QCrwtT1hXBeCmkD
 MYtSOcUkWkUNMQPb3GRvcZ3voYPMzLvN06+dSoyT/o2Zg/kIP7Y9636OwX6qBaam0buX
 AN+Dnb6Z2V8uzppGRmc+w4/IzTNGrBs9wkpRuifyF/v55k81NuomtCKuekm8XjBRe+MC
 ydGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=467gqcHqnIQ9VVwNI4wTrt6UrXfdyjXK86YLFCrFEFQ=;
 fh=yHgwBeUilm9wHnEcBdlq38nallCKYi0nSX7+eOMwYJ8=;
 b=KUrWzLkKKCPAgOcx9scAydFASYVo0+PrO42oXkzXsmD7BT2oL3xYm0Lc9AvW+QJI7d
 VACFdir+faMfdiBJABxiVlOGvY5XjCiWnkmV79b+hKMnmBQCSygxXElvH+whnQKNiGFK
 nOxyLtkt8Vk0YqTgjbhT/aTfVf375hnRdtSBWqPq+VU8HWv1d04rqOel1EDHbSLIEd4Q
 G9QfAVR2F6cGNywl0frtryAME1rwZd6HwyF3/zgWFpV9K6qKRbtPnF8KP7T+ArrgHBDn
 lHKBM2p5iMufxTPVAo1Z0kLhVdNCE4ct/r4peGssBI7my45hRhx2fP/r//Q9x5QkMTxh
 lHJQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769429734; x=1770034534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=467gqcHqnIQ9VVwNI4wTrt6UrXfdyjXK86YLFCrFEFQ=;
 b=fnIihzMxteEVANbuGkLw1emY6BD0m+p4dd1BYfhBKe5+LcyEDRHtbpnMuEq4qlfCfX
 65fVsxzbPY4t1nDrw3fsCnaE7PwJMVrZaOIYENoueAJ2OThpFXSeBPKH9fFFchNuO+Af
 yON0TAt1sVnIWyzsN55oKPRaJTU2sMiAZiiLMpjFYPwTG+jar3E47uJga2Uf11M3sWqt
 to2+OmDxUPBWXmm5Vz1Glz6xCjcHbRMlaavTWetEm3eHvkIRomm5jn/xDcT6qzGTxVrO
 CpJWadgZ3U/cWz6XBMd06u1aY68+EbTUg2FHl0TRsCmyGDmsGLsWbkobTFI7ckvVqirt
 La9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769429734; x=1770034534;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=467gqcHqnIQ9VVwNI4wTrt6UrXfdyjXK86YLFCrFEFQ=;
 b=H3RpLXZGKlyCMynmHQMAqXVGIdq7u+XYVCn2qTMyKSAXj2fR7hraxMieMnVU37fq95
 HPMos1nqTxNFJJ9YcRRLckWwCU7TwH7k1TS75KObffzfXaqccv4yNi3CpkhwEwH3/CJa
 OzqmEg0ejgYjpnJ4HzaMvjninI3esXm5AhA4uF6j6JxZ9O58sjroCLh5ZJxow7tLRhzs
 YF0y5Urt8nzQa8cCpSighT6f0qX6LOmkLEPql6QMaWyWNXC6QADcR/e2iI0uT24qPFR5
 4ZO25o6OFTshmUhc3nlfHa6v3/0jxl2WKOdqZBAUxsbIxQ6F6JCexL84izhcg9sJnGX1
 aE4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9qxjVBkw+PY/T3yIr1V29KkYunem21+yGnpDYLAAPfFJGW6qdi5k59vG9drbr7/bHevI/q9KtM4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxciD9syY8bMqQhbRKJsROwDWNRwrbgl1s/wNa879bv0zbCJq9+
 EX+WTqhQHYJxbOt2XZCpR4QLkc41rM2JrrfwfD5kCOGyDoB8gbT+i9ICDU9G0x9+/MfYscE7ET1
 3YwT0rBxaJud2nIYOJ6hOWRe/7wS8zPk=
X-Gm-Gg: AZuq6aLAsmq100j9S0Yvb5RKLdcdrUp6O/HvT9bj/nL5bEUW+9YoMP+WyCEp0MaKvT2
 xMOnxIFRuSg0z1IxCkpuC/+RZIFykA2GbL/CoFz5WietvTbXAiyOMS35yLx6I1M2p7ZS/aL2WQc
 Qg5fg5jo3JkiawtijRORZCuFJvl8tSrSfz21FgMTA5qJQojR70bapih526XFwdcRfs45I6/bAHU
 gBUlYzjkhyIWymHxa09S9DVs7B8SswO+98A42KQv5knPgMiW7KPBmxKaQmL1tXcgh3Zaxqmx3eP
 +Ry4XQrH1KLtBAedFPerfVI/ofmecI1DS7NLP5xns3bfDIAk1u3iJXQKjW1epJick31PPoQ+w8e
 DuVFNJc8rFsha
X-Received: by 2002:a05:7300:730c:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2b764828e58mr995313eec.5.1769429733882; Mon, 26 Jan 2026
 04:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
In-Reply-To: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 13:15:21 +0100
X-Gm-Features: AZwV_QgKhnNNbMKQO6XKgBIfpElvwvwX8oVrlUj8qdRiKJuHYG8VHhtnfvBlY5s
Message-ID: <CANiq72nNRh-yx7Tts17kJ1M=x+ML=Uk663TW9HN6HnARrg5J3g@mail.gmail.com>
Subject: Re: [PATCH v1 v1 0/4] [RUST] Framebuffer driver support
To: pengfuyuan <pengfuyuan@kylinos.cn>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Zsolt Kajtar <soci@c64.rulez.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengfuyuan@kylinos.cn,m:dakr@kernel.org,m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:deller@gmx.de,m:hansg@kernel.org,m:tzimmermann@suse.de,m:lee@kernel.org,m:sam@ravnborg.org,m:soci@c64.rulez.org,m:ville.syrjala@linux.intel.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,collabora.com,gmail.com,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,ffwll.ch,gmx.de,suse.de,ravnborg.org,c64.rulez.org,linux.intel.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5D3438815B
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 9:18=E2=80=AFAM pengfuyuan <pengfuyuan@kylinos.cn> =
wrote:
>
>   rust: io: mem: add ioremap_wc support
>   rust: device: add platdata accessors

For future reference / others, these are essentially the same as:

    https://lore.kernel.org/rust-for-linux/tencent_63DD850B43CC086844717B73=
C574B8358F05@qq.com/
    https://lore.kernel.org/rust-for-linux/20260109080528.478731-2-pengfuyu=
an@kylinos.cn/

In general, please try to mention if a patch was already somewhere
else and add a changelog to understand if feedback was addressed.
Otherwise, others will have to do a manual comparison.

For instance, I may guess you sent this as a sample user due to what
Greg said back then. But that is just a guess, since you didn't reply
to the feedback nor mention it here.

Cheers,
Miguel
