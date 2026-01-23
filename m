Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jaScNMbtc2n/zgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:53:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E07C7AFAD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1FD10E129;
	Fri, 23 Jan 2026 21:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dFllSGlK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB73710E129
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 21:53:06 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-2b7030e2e5fso133492eec.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 13:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769205186; cv=none;
 d=google.com; s=arc-20240605;
 b=S6ZVgYBFjE2LTmUpvkFVFWIEh9OVlKWzrU7FgTGHpQmlUF6mxaE7J+Nt8RxpR4Xtlv
 cXRPXSyIa6l7ibp72/UCJQg5dJu5jXMf64GtsixCKLVfxu2cDMlJfrJAshHhiMUQhy+J
 kPxLqgFAKj0wxzQSnnY4jCT+/4JyweFNzw16WLzJhuBWqdWXaIpw5dAmyAHN2eHu+goK
 aenmVtZ/eUx6gf7hC7DZ/ChmFO0GbOaQYlqAtNfBljQFDL6aKOetGk4q7JU6uByaUILH
 X8yR9ZYCsId08sb0HVaYrQ4V2Gsle2ADqe44ToykywBTmfGzoN9BGf/3T4iyk9PsQ5DZ
 xbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9Ep/4rplD22XA1Jd43Nq1k5DwogUL9sjJeYzQUx57Yw=;
 fh=zre8YX4vYu0xQpWzxlow5frXIM/xcXmN+jf3pKWZc/s=;
 b=YN2ueKpQrggoTtY/xFsoDNru/DklIS+lcKA+T2QuetS3ZgoJvAPFt5uWHNK8m2f0us
 3crbYvuiMDcIdBxMPc9R6rGUAurAvpSU+KAsbIemd3TQO/eQzH5Y2pJM5J5nYdeLOeuv
 eLmyLWQowj9swIGJLuiVdRbnDHpQkdj7kmJGdA2ipOSjy4dWWt8beE+RviD5fk5v4pKH
 OpIZEuyCct5g+22aMaAP5ZSotypa9hktpavP3Ee1MArvxqhIYBhyp8en/DLvMJ5hpMw1
 rxMq5pH3NQtIFiUYdOAxPPZQkVfxKj8arNorDlmQLvBpZ0RS/LJ2VRruJCTMR14JTuq6
 MuDg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769205186; x=1769809986; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Ep/4rplD22XA1Jd43Nq1k5DwogUL9sjJeYzQUx57Yw=;
 b=dFllSGlK4SZZMbpU9+6pOD2eCpOycTc9rsg/wk4VfqvTFzh/pdfUjUyBpF5TBQluZd
 ANoQu+yEmpKAVoi0uIE47KVwwjJN4nRDG4j/R2dvI9Bws7lUr7JhrkQd/Wk3zyEhjBUx
 QmqDOZWjYjrTOH2QvjCIXU2yX56DiCbbLqofMp1ZfuEHGue/DnnQw9nlwCAsgeWELhs5
 OBZXLk9OZtG/UfawpcWxehAPFjEd8ca/aL7Wmd9VWLSizZl3HiJgN7ZVCi9qJYl2GZAC
 Cz3zfhwvMyolgXJr7HQNW3yqiE/tSKCqCOcU89jzZJ/1cQvre/yvNk+2WFP7RGCoNsuM
 yw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769205186; x=1769809986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Ep/4rplD22XA1Jd43Nq1k5DwogUL9sjJeYzQUx57Yw=;
 b=YxPryI3Ktj5jpcYCxYSNRHLBQLlQ4aafb1o8Kxz3T8whtiq+YxjLDnHY7ptp26n9Qx
 SzlCOXFERnJxCdpBtf/3Kqa2qOSjtExA+jN++i9jP7kyXRw5DY1hOJ2HUykI/fXIuCpx
 9tU0ftsLPKlYpBOjxZh+Hmw7DmicbNXyTeDTio82/NSwFxq2l2VywwSjUVNljT32GA5W
 JMVt+/P7RIWWmT/tTkwFB7vag+JMGM2vvdkMy/NnIDW0dAp9mgXccjqL0xGCQAiwxV2C
 Wo3rw8ot1aoaBQI8YPDy5RnOIqUTitg3GOppJzgpf6te93U7QIqAwQOiSQNfouxB1ye/
 D0MA==
X-Gm-Message-State: AOJu0YykjVn8lfyxsoOqcGg9ey0xWqh4lWNBm0aBGIbZcIxtZj9rldYN
 RQMQXZEYNXarabqu14ltqMOf79Ha8lMEHPAQ4gw3Auzi1L5nHURC501uZ/drO8OROUSSQLUP2x/
 89NopE0R1s1WmWWL/KzMBLkz4CI6pdS0=
X-Gm-Gg: AZuq6aJE7zRPKDduy4tzp+AXtUoW+0oYGMeS8n0E9GA3mvf8baCZUzJpEs7MR4/uygO
 DELSBatcyxWRPRsENRZltpUuhdUkXV/w19n10j/qa7vTNvdPEqGD6atQ8VAAweH4ZyT7X3Z3FUf
 7koSe2RDrIXA7HlFU9/NWM0R1MfvnGb3D/RbNFo+VcBwProdEjo0HkagUVlTN1RdoIv7z6ZA5Xx
 /R6ETwJ666EDNiYqwGTflgBBjr6l/W3iS/Ya4eTnok4wAdILWEbfUQ9uH29ttqioPeeco0BeNOJ
 Xo1eEFwO0Xp41TVV7eq2EuR1oLmv/CnZtPHFhUGWQztHjy/ySVCzFielVJ7eagy7kfwCfnf+feB
 lzZG2MHAZclA4
X-Received: by 2002:a05:7300:4308:b0:2b7:1cbe:fd31 with SMTP id
 5a478bee46e88-2b74e894200mr282379eec.5.1769205185862; Fri, 23 Jan 2026
 13:53:05 -0800 (PST)
MIME-Version: 1.0
References: <20260123175235.209092-1-deborah.brouwer@collabora.com>
In-Reply-To: <20260123175235.209092-1-deborah.brouwer@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 22:52:51 +0100
X-Gm-Features: AZwV_QhaLoszLXa1nYZT8QHcVsl1_mwB9UJTtvTw9Qim_nysZJKLydf37qNT6UI
Message-ID: <CANiq72m86aqCr3F+QdzzB-tPsgaUF0YWfV6NAyLqfq8AzKw90g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/tyr: suppress unread field warnings
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, aliceryhl@google.com, 
 boris.brezillon@collabora.com, broonie@kernel.org, dakr@kernel.org, 
 gary@garyguo.net
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:broonie@kernel.org,m:dakr@kernel.org,m:gary@garyguo.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3E07C7AFAD
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 6:52=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Currently the rust compiler warns that certain fields in the TyrDriver ar=
e
> 'never read'. The fields are needed, but they are not read directly, they
> are only written into an 'impl PinInit' that is returned by probe.
>
> When warnings are compiled as errors, these warnings prevent Tyr from
> building.
>
> Suppress the warnings by adding underscores to the problematic variables.
> This allows Tyr to build again.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

In the future, please add the error message to the commit (it helps
for matching it later).

Thanks!

Cheers,
Miguel
