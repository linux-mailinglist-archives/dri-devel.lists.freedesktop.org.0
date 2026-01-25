Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WrtKNMjddWkvJQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 10:09:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220E0800D8
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 10:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AE010E066;
	Sun, 25 Jan 2026 09:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RbuF955C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2516210E066
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 09:09:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4327555464cso2333819f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 01:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769332162; x=1769936962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=31O2eYXcVuLapO5Zw/zgNNvFpdLcpA1gw2dP7RI+fXE=;
 b=RbuF955CanD0TYKKjC+hXyjJekWDNhMIocquOIzKYpvh1whyF/+RIdfr13H9Nh5vPH
 v8jlgBRn4kgyNHJBP3GSrNpOkauPq3+fu5gizVU6gPqK0lsI6gO2UfBC0nNit2RrzuRS
 Z1B4k7JNf+DP6ReEIxYE5xVM9+zg36wTCuhg7yUcBK+3Jj1f/VWNiEw9jxi53ebIaiZr
 IJNfWeBsmzTunEdWvqjwJtH31V5e6l6DSd1OFaM7Dpx1ntfbtHewDsRuSCdhgJ0TOH4v
 xvOCUyFSC060cQeLs7l+iYyn4AlaLxiCddt7oOg5x+21Ji9f7L+hw8pz1lgodlHTjbTr
 FUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769332162; x=1769936962;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=31O2eYXcVuLapO5Zw/zgNNvFpdLcpA1gw2dP7RI+fXE=;
 b=o37QlUbd5dOnk7sKcUi9swGhm7wnawkU99qWXIduHDf8w5JdqgiTv4PuLdyHs749aX
 0+RdkwnRFT8TQsQL99svABBZtFFYelAPH5G6I/ITbfE2WDHbRGZWwInVNVdg0JAj3dM8
 ME86Cjl7U4ABpjmIj3QF+wlQ6p16gAr4KNh6oMycQqSDdnBH3sdKs7rdx1w4yVuyhfsk
 ADxpnPPyDENvOdw3ijG11Q8y6D8SAjkhfFXkqpPNdz8B8Jbh2oSZHSbct2ynZrwjyGhQ
 3ve5+C1s4UetKyFGTx1+J/p+1yylpXmcvpiVCY/M+5JBT9B5XXj6145P8KqwSeUhN9q4
 lvGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjyX2axgaI7JDEMcgX4is4AuzDkyoO/mFf3qN7rXx35ZeiAjPSiUDyeF1Xr0OkE0Q7BH36H0POSAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7rcrYOnqICFbU/Y05IOpTCPZEjFqcjUbcr+r4IWTrisbT70TJ
 XzQdmUwypq5sLLqWq7GIu+1YZ8TdGeAo1i5CihTpS9MCEzpHT3Ob+Z6c
X-Gm-Gg: AZuq6aJ6avJHRoqr16P4nlLvPZHR+Abyq1UJjuACTgSshBEbTrjp/H2NlZA6+5+V3Yq
 b5XA49pslettlW1Uqm1T70NSz4aw88lFX3+NEABYfmfnXfknQFHxvJp2WE+zkhlOjx4KE2cWMGj
 D/HwiJZPR6X+IWs8HXR/q1PM3TAlUsuguouBJot27KFwv73pUS38Uu5EN45BCqtEd1pWLIIZJ6T
 4HbK7r55x+J+dEDQ76WpdNzcohZsy4w8IabZJVmnGYXa0Zxbpv20DB1FPfwRHqfpUUNCc4JEH3p
 2csP+CJUEXzgU6zA9x7vzG2fvVulJK8rq7YLfbTzqoNVru6fewU+eTeM9Ywi5B0cRQUt2hlDZJE
 8WJlHwc6MbKfbaSeZgW9lRH+0lmrbxvTBarMNUX0nc1aCWszHb/FnAAKcjt0CYli8HGOR3j2iyV
 rmnDd+3RF1TNZ4YU9+O/yllZM5W7B1fr8vsg/EBTigaDZg8RNk6Ul9hDx6jw1P4mbtANp1LJSNl
 y6NZJSM8wZ5+4dqAMh4ycOhfRE9RBsjh40M/CiQimc=
X-Received: by 2002:a05:600c:c04b:10b0:46e:4e6d:79f4 with SMTP id
 5b1f17b1804b1-4805dd3722bmr10472735e9.15.1769332162004; 
 Sun, 25 Jan 2026 01:09:22 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:e4b8:a0ef:f9fc:d01?
 (p200300dfbf2de300e4b8a0eff9fc0d01.dip0.t-ipconnect.de.
 [2003:df:bf2d:e300:e4b8:a0ef:f9fc:d01])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48046fba46dsm263939945e9.0.2026.01.25.01.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jan 2026 01:09:21 -0800 (PST)
Message-ID: <8d930ac7-11b1-437b-be18-7a785f20a72f@gmail.com>
Date: Sun, 25 Jan 2026 10:09:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
 <20260124231830.3088323-2-joelagnelf@nvidia.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20260124231830.3088323-2-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,m:acourbot@nvidia.com,m:aliceryhl@google.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:epeer@nvidia.com,m:zhiw@nvidia.com,m:bhelgaas@google.com,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:alexgaynor@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[nvidia.com,vger.kernel.org,kernel.org,google.com,gmail.com,ffwll.ch];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dirkbehme@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dirkbehme@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nvidia.com,google.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 220E0800D8
X-Rspamd-Action: no action

Hi Joel,

On 25.01.26 00:18, Joel Fernandes wrote:
> Use checked_add() and checked_mul() when computing offsets from
> firmware-provided values in new_fwsec().
> 
> Without checked arithmetic, corrupt firmware could cause integer overflow. The
> danger is not just wrapping to a huge value, but potentially wrapping to a
> small plausible offset that passes validation yet accesses entirely wrong data,
> causing silent corruption or security issues.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fwsec.rs | 60 ++++++++++++++-----------
>  1 file changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> index a8ec08a500ac..1a91bbbce3d5 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -46,10 +46,7 @@
...
> @@ -356,8 +362,12 @@ pub(crate) fn new(
>          // Patch signature if needed.
>          let desc = bios.fwsec_image().header()?;
>          let ucode_signed = if desc.signature_count() != 0 {
> -            let sig_base_img =
> -                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
> +            // Compute sig_base_img = desc.imem_load_size + desc.pkc_data_offset.

Nit: Drop `desc.` to make it consistent with the other comments.

Best regards

Dirk
