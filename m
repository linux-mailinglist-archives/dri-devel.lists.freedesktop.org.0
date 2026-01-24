Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZvsYL9rFdGmt9gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 14:15:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B37DAFB
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 14:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CBE10E02B;
	Sat, 24 Jan 2026 13:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QyI2X7Ow";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com
 [74.125.82.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9096110E02B
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 13:15:01 +0000 (UTC)
Received: by mail-dy1-f175.google.com with SMTP id
 5a478bee46e88-2b71a4fdb86so84789eec.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 05:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769260501; cv=none;
 d=google.com; s=arc-20240605;
 b=eRxoleJZuIJOAEGKqN/xvGOeWz2ePBDe4UETAvICEcqOLmf+XqoopYyILw07IFi30R
 35JBbm6CpdlqFmNn/gvkWELoiEZTlcEnnCKrkrqdTVwTo8NNduID+xyQV/Tnp9lIK3Y8
 1jD6uAjT6aOcwCo0deGLObwYZwZCpd1jm9gMS9PtasbR3HnRZkx9Gcxm2lML7YhFB0FR
 5zM8gFwwPcySjG81AXY60z1h+Rm72bgDT026jDEIMgyjB+djGdE+K94F/vjLkE6v7tTN
 8rXcPEpeyMMgjXuZHXkepBENaAfULOawEZG/IynL4wT37Ger4YAgEX5F37u2gzoVihK0
 NRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=j/5gB/yware0YUUo5zLojxV8fN2+m/679NaTvivZzqY=;
 fh=77Ymf4Evpo00XJw3caqmDraFTMAXqaxLIrpo2X7hPls=;
 b=ZwCDmXkF/XuhgI9vB2i3JvOoZlpEt4pEyUm5G8u86HT9O9QDxGnRbznC2tSPyR9ueC
 KzhEDSkiJsoTEYlGTtaY72mq6CuqMxcU0lfWBYUJbNvUcK1kr4MUT0uW0++uCtbng/nN
 I3pEYY7EKznpJtKiUScbOJIaFxvN2je7GgHhsUblPJXWXEn0OiQ+rijqKTarvIZmcjUo
 7V4S23O1aclnr59vzO888okIyrUKt3cy02CXayeoD1k3i5psPr6Nrklh4/WQnnzhVmDP
 RM7tyOZQJRtI69+xoqexd0khrptxuqd40mOw9T4PvScGFEGqF6HOsTzSkR/li0Q0ymSs
 hIEw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769260501; x=1769865301; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/5gB/yware0YUUo5zLojxV8fN2+m/679NaTvivZzqY=;
 b=QyI2X7Ow16v1scMEBCFMC43Hd8Frhi+L0FNezczucoprABYB2jEce8yoE2NL4/XBJJ
 WknZuEwCR2nXIF11b5K/KEcH5Jl3gNUVQQ+JBf66PjowaJ/YtrgyN0rP9d0uq+Zpw//Z
 gcmDbkMCI9IaabKL4HmRNlDuFp/oJivaHSFU6ffNEkKaUviMlrz3j74fFn318mR9ey59
 5ajbSGh2iqLKfOxrEs6bifElaH+C8yf587rL9kFl57g7uDP8yebRW545BgEONqtTlSuL
 QIfEh+qEtkzNLhk8IyoWVs8a4xaxb74RIXbnyyOQ+dgSjtq5O9+I9Dg+tXGwETKnaID/
 0pDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769260501; x=1769865301;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j/5gB/yware0YUUo5zLojxV8fN2+m/679NaTvivZzqY=;
 b=YWzV6OqnDON/hA6Q+MdAfaHW4ItYVqitYjOCkp7i5sXzXQecXyfQXjtMrnW0cSKmKh
 62gCcNN7CcZhIZ97SlGlP2VQoAJI3kdou+Rd5YGp1Lh4pTLIyFXhg9lnCIofi6710hgd
 8yjt1+46RDV+D5H+sK4qly/yIB0zxmyDROXucVqyryNoLVek+NS5WrcAPt6MvIYGZJWy
 NKu53aJ1DMwe7WpgTStKsCeVzGvSNNNwQhmzGzMAd79f3A2afMu34bRRLtU4y8JfYTwp
 DO5AogT+XBiZw/CDwNknBD7RvB9l3bwFVHkub0V+EWAFFCRvbKC3NJS5klEBXbPHxtS8
 CJ1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVFz6qzuLqnC2h53GMARQvHEhw5cG7orIARGO3kn2Xkf1F7XmjPb+doWEtPVC+e0Mdch+dVKynQb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyxb28tXCpiI3T9+7Zoi9jaaNDrjt8ok7kULkzPURvr8OebEOOD
 i6LlOjiXLMYGHfYlAuELIyEcuIG2GHGC8GQZqrKudfq66Jmfb6g3hibjmnvJj8zgtbfDkHyWENd
 DFLsugMCGHH9DtQs4iSZ9R6KLdJncPTI=
X-Gm-Gg: AZuq6aKWcd2Ev/hDNKPZ1j9NemMrbwQQkEFbgz2I4BTmhRc87lbHpLZQnYd5dKhxWyJ
 J2KU+3plYVObuKayHMwsQMBTwGTrlRqXyj2TcWAPhN9CSNy7/wGHeTdsCM2vDJmy3bgSZkMLbVW
 Yzui3k6NGsr7B8Xm7YhNjZGoK82MI9rFV85hr2KuNo9QrvoS9c1P52CipjMylJ2Erphu6zim6f6
 uZnKdWBI3gu4XDlJkiJqObvlDGvCYIBy+3AKul9uwGegVf1zGAzLw5JkdGRGMmc9QQT61OFg2p3
 Wq5MeoMI7PpOhFDVKKNLx6ECviPrxor8zJppFtrGs2CGmsAfuovIPZ+gm+gmy2BWR0LCjh3RmmN
 i6ui6fNdLFSgcMF8KWPL2XOs=
X-Received: by 2002:a05:7300:5707:b0:2b7:24a1:865d with SMTP id
 5a478bee46e88-2b739998d29mr1718285eec.3.1769260500501; Sat, 24 Jan 2026
 05:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
 <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
In-Reply-To: <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Jan 2026 14:14:48 +0100
X-Gm-Features: AZwV_QjXqBFZOGf5JkyIpoeKssJ5kZ4ktB_L9npprLQF2ToUkR2vgcZr8uuR2YA
Message-ID: <CANiq72nrmbLP6mhHKcGJaeLeOa4g_440NiGCZBB7cVcWoyrjCg@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
To: Mark Brown <broonie@kernel.org>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
 aliceryhl@google.com, boris.brezillon@collabora.com, dakr@kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1B3B37DAFB
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> As I said on the other thread I'm seeing this with what appears to be
> 1.85.0 in Debian stable.

Danilo asked me if I knew what could explain the fact that Alice and
he couldn't reproduce the dead code warnings while we were in the call
the other day.

One theory we had was whether the toolchain was different -- Debian
sometimes does patch toolchains, so that could have explained it, even
if it would be strange that they would change something that affected
a warning like that.

However, I tested Debian Trixie's toolchain in a fresh container as
well as upstream Rust binaries with next-20260122 (reverting the
`BROKEN` commit) and I can reproduce the unused warnings (and the
Clippy other ones). Same for next-20260121.

Which I guess is expected now, given what Deborah posted -- I can also
reproduce it with e.g. the latest stable (1.93.0) too.

I hope that helps.

Cheers,
Miguel
