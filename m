Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEe1GjNUd2nMeAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 12:46:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB8E87CBD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 12:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B86210E1B9;
	Mon, 26 Jan 2026 11:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OqfLVoL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACA510E1B9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 11:46:55 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-2b7063004daso238591eec.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 03:46:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769428015; cv=none;
 d=google.com; s=arc-20240605;
 b=ZAMgG8MhyDI3uq56gO8nnJ6Du+7UOCP84PZ2Pn5So98EPYSbTDD0w2JRUn2HRXOq44
 jDfpVS9yw8bOLPymgC1iZxmK/dHf9mp6sfGJy/YCp/xySkCeX9Z16AkjDSjTXWBNGumc
 mSrj2n8NjWIQyby/P41CGlU8yduAlBn3Y/drg6QQlkPRyrlEs2NIPJ8+XuiMyEmqAGVk
 GHkOzjwc2trf4BZY8Lh8fSMcsBpoBTd+oZ72hMsfzO/JhDD3oQLZTyUL1P7bL8p/MQZr
 OqdUE/clw73isedzzcWUYRBZ+Ssof9Eo8LnjyCz+wUXQ5yRdWLqDIAj3IVU02P5ZhMh7
 /QDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=o3x62Qf9dAWX541AJwNkvWxUTiuyvytUehddtIPb4VY=;
 fh=K1OLU32kYsB6la9e0VjFDk61e7Av2ZyCXoFmi8ShFF4=;
 b=KzhcJTcS5o38BdmzdfF4+8ynWXdulZ9x/Cs/A1F2oUR8V4vCBA3ocVi2t4Lxq67iM/
 MHELWAY7erleDhGlX8Sog1MtFedaZwQ0HTBOUoqOJJtKLV/Z4YW23wm2xbPez8vCCj+n
 rnqVrupirQymBB1EfGPoV9wM59b5i/826HOWEViNFYON2TBt3y3ikO6P5CnTnNRobvMM
 qA99oN1oQwK/kiwyfJI+y1Y9LJhpf3Es8Hl5Op1fMCTWOQUYnTHK+P4rUHhNF4tb8HLz
 d6sjnrqTCnEL6yExfx6cz25nfxBYpbAwe9FiIaM6apN8e7acqwjJOdH7T7ov+D9kdcvV
 QaBw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769428015; x=1770032815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o3x62Qf9dAWX541AJwNkvWxUTiuyvytUehddtIPb4VY=;
 b=OqfLVoL7QngRAarDv7fQzlgIQtHpOZjDfoK2y4qnbzskuReJsaCoXl6dJcwVBnbnPd
 mmhppaWv2Tk/d6/47VqTHDizMq76YI3rss3xZeLgqjkVRzn3GYnPaHuBtM8BsE/7wt0C
 sw7T0LXAJ3p7UZFMuMagxtzSlbzJBoBp9JRLNEcYkMoQq0MkHo5q+BoLXbs+fDVSrApA
 RiTCg6/zNi++Hg3vUElC4zSyu1/oo0IGWjoLfQlf6BSsoOoB3I5FxUd5A6Qqm534tmg7
 xRoTuCs93oiFLRQLVSZbP4nS6DyCvfCzEzeo7t3cPXRf5hjJF16yKdz8PVB99ddGLgXn
 rnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769428015; x=1770032815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o3x62Qf9dAWX541AJwNkvWxUTiuyvytUehddtIPb4VY=;
 b=PlqlBgc2mRyyWQz3ig1KDx/2NoaXG3tylkBDiwtLdJLBkNf7tV3DDczbolAtwaqzGZ
 1swCaeKSmIzBJB+PddmfhsRF0XSlmJrzkDLJPfbkwDHs0nXRqrJfQ34GXFsEp1Wo7++z
 UwKduTm+L2Pyk+rjAAhu+SGxvDSEU/pi9xWomvsCXyBZih3G2Tn1qb6Wxzc6nklY9Nhi
 oEwzsVwXb+WhOi28PpnSfuVKeeFuj9A5789VOHWV7YlJakEJOZHV+HES1M94Km3+vzc9
 9OB8JjLZ0CM+Zf8ZYN4K69aATsYpSTczLIsZRjxs5FhlUyEjeVuVOhah28gWB669sWgw
 Dqfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk4JrN1lwg7ukae7FoPtj+8rBUNInV66c4EKT0E27powMSRNqZtpNZ1TiCtQtX/ecUJhA7XIK1p+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKJ7Q0dLi8g/V2T/2P68pJ1GQL5hxp5Tyu0is+QTpJBuENoliF
 HIYJkGiJpv1yPZE9s/t6r5T6b0p34tojoMK6iI0A+O/oGUs8vOKweSPE3Rl59cAiTOblo0BldDI
 4/fxUwUolPuRJBK5Q15fvX0KgXKY8xnk=
X-Gm-Gg: AZuq6aJQyzqRGJd74Nmn7OS+7w0we8AEj5JJtNWOLPftJk3uyeMVVi9tFqjkNiYDqcv
 RWe4/OLj3nN45nqPnm9pf7cBXqWRotCGR72zhIg7nQ02S2PzuMsNx8iDH3Mn5sDg2aziBVOf+6w
 5qJ5AJJ8J0eRXtDcn+rv5RFtDIdw0eOLiTPMmiIxBLrwv+yj2V8xA9v3diRT/o4muhxm1Mvi0QW
 wOwi9PV+zGGjHTlwmrQv8gdj02gYEFat91uSHo7U/6kGZ1xexkKzM2RTF/L9aaJ36HpKiJ7sQTN
 3yr/f1nhq8p0qrCEREE2c1w/z6XcMMX9D2uTnplOGLjG2krYK247i6hqktJ5Gsr2z/RWxGCNbnv
 GbyZbGJRKxHCZEjFdWLRMte0=
X-Received: by 2002:a05:7301:1f14:b0:2b7:3835:21f0 with SMTP id
 5a478bee46e88-2b76420a89amr1152037eec.2.1769428014494; Mon, 26 Jan 2026
 03:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
 <ed48e82a-cb94-477f-83c4-b2d87ae3cde6@suse.de>
 <DFYG7MT5JINY.1T8ZZ4ASIWXU@nvidia.com>
In-Reply-To: <DFYG7MT5JINY.1T8ZZ4ASIWXU@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 12:46:41 +0100
X-Gm-Features: AZwV_QiVehF8RRi7itklBIsdJdhL1p075lkEaX9CIFh4ljGe-kX6fmrMO2Whn90
Message-ID: <CANiq72kRhkLKcc279CacJ8CnQ18JEZ4A9-vkcg_k4Jw88O4EDw@mail.gmail.com>
Subject: Re: [PATCH v1 v1 0/4] [RUST] Framebuffer driver support
To: Alexandre Courbot <acourbot@nvidia.com>, pengfuyuan <pengfuyuan@kylinos.cn>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Hans de Goede <hansg@kernel.org>,
 Lee Jones <lee@kernel.org>, 
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:acourbot@nvidia.com,m:pengfuyuan@kylinos.cn,m:tzimmermann@suse.de,m:dakr@kernel.org,m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:deller@gmx.de,m:hansg@kernel.org,m:lee@kernel.org,m:sam@ravnborg.org,m:soci@c64.rulez.org,m:ville.syrjala@linux.intel.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,google.com,collabora.com,gmail.com,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,ffwll.ch,gmx.de,ravnborg.org,c64.rulez.org,linux.intel.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CEB8E87CBD
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 11:28=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> This, and the patchset is also obviously AI-generated.

pengfuyuan: the generated content guidelines I mentioned earlier this
month in another of your patches have been merged now, please read:

    https://docs.kernel.org/next/process/generated-content.html

Thanks!

Cheers,
Miguel
