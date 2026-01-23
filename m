Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEulFGjYc2lNzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 21:22:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5DC7A926
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 21:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A396A10E2E7;
	Fri, 23 Jan 2026 20:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="AiNaJRrW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD12410E2E7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 20:21:55 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so1626123f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 12:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769199714; cv=none;
 d=google.com; s=arc-20240605;
 b=P1Xo4dHZ+39xfrVMhkOglMhPjnEUHW0mfLFtiSYfvdagw6fpP5VkwR6qB86OdurRgk
 HhcRyIsrT1LSejKSvkiTynEJOsS2Nu0+CBUdJIyo6ho/uzxDgzrM0TVQvBBsjHhTeL5e
 eszMhF/61Xi61ypZwB2CKiJooPm9ug8u/dg+e57adPqCWlQfr31P4p0JkFrdnaazoTwL
 6lYQ6Zbluz5dLWv2/OCbLh5Vq3lEKGFqD+ek2/DVDDQEQ+5vmKnZA7tiFmIt2xh1MfpL
 xIFCxwnsxE0+DLyXycY+Ih21ey4KFYyS5cYEfyvQahZ5mbt/mPkcJvicnGoLhbg6jqzB
 bQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tYTkrrKvxXRdGIyytYvYnylK83PY2Yek6IF+8AvwZ/I=;
 fh=oRfeUf6BqRFDNweG3pxt/NdxB5lQnu1QfHvkmGRPZW0=;
 b=Obh8LDIV00qQl4QjJgzQEfGpZVqDFRruOwm2+zaybXMFKta3FqKyrgUfhv3G5OnAWP
 b2CqLOIIs4xk9GTfDovKOvriE+1iyd9fewBb1RXrrzfA7H9EQFiKqtjh2Az7VXIdn/li
 7gv5RYP6cqZRKk4MQFUeIbYTNKCDWmD0pqh5UyWspjEmPK19vnaCn6I3+EFgTSyMVh3M
 mWdPbyCx6mXaShDM4va+Ca/sUqyHW7FrnIR+oLyHQg/a+PWSWdW4h041M8Mu/raPhieU
 TUkeu56cYzOBfXD6aNAhV4+Qb/jjFkKKIZlsDJkUehV7YGFGZExaYYMMpzEMehl7enKW
 5hDA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769199714; x=1769804514;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tYTkrrKvxXRdGIyytYvYnylK83PY2Yek6IF+8AvwZ/I=;
 b=AiNaJRrW8YJ6sPoiKUDwPzgWnaZwsbWcR3HTXfFzvI5BDz6TfVklJcMWfREC2TX7m+
 qJoAaRfK9NHUFKnXsJGbVt7hSxGfR7QU/oLbrh/B6WftSCCbLHAYR7WzjCSzZlDhwThD
 Mu7v5igFieI3wcNmQTXd1ESsfuOdSQNJ4aeCJoNsTASwPx7F4BVCT4FKaeJnwIp9PIPZ
 BmumAXpe8/5a//GspsC6Qra5vkn2B4hWRhkQbRVwZlKCub13ArmJr1YbJaWoFsJQD6AY
 rfPPOZMIZB/VnZ/2SreXyILi0y5hwzngAS020jkis0a5jRTKgm/EG5ZTMouM3mo0fwW9
 DaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769199714; x=1769804514;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tYTkrrKvxXRdGIyytYvYnylK83PY2Yek6IF+8AvwZ/I=;
 b=AMfMIWGep2bn8NI+1OPlwMYdhGLHQccqBy9DkmS5y1gw/Bqr4Vfpg+GPKa8qzaezW+
 uyuocHGSScA213BZcogizuT+DbajcPWQvXPJkvFpRU2oLj+FfrpKgfvvLWsFDcDhlqqA
 iQqRA/6bVdY/9m2ziY9SueFfruohN9nUauvedcTC8zD8NEBnjT6eUasnykGNj9ZCuckp
 eeVulasx09sSOYNNVLEcZ9LQRRQrymKwLDzlBwNSTzedIIg6o1Ji4zbgZcGZE/oJn9VF
 L8ALA1lBfV1F2QIxiSSYzK3BvZK1e8ZEhfr2ktgVuidc/Qc0uplL6DzyyZsRmGUIQJmX
 73NQ==
X-Gm-Message-State: AOJu0Yyg0jdqf+op+1z8EQbAsUwCsJqSe31qL0Se3PM0kN90aVrLRqAf
 lYsIK+4GfOn62CXxAZq1QPCpiwOr44J959AsGhKNjWjFd0JZsTT4/z2vyQKLTBqH1oLjMLtQ+6U
 Zgec8tinwBdQLN6aTGLDw41VjAUHe/hwvGC8gTGNj
X-Gm-Gg: AZuq6aIFFWcuItfzizli1f/81xjVJIoOHcug40Zk8ITDQVgRtYP3q0LNPHjbT0GOG0D
 pP8Cw//sqU5dMfQBjgCrCJ/dYcP0x5YYqYl0E5TGmfff1JkN4HPbwOQssbDiHaX5mXLvzm3Scn7
 W5q759CD0i4B1EKTtuD1gw2yVn0oxuXk8WQ37MU7E22WJVMh63n1txWca3s5o3BqkoC3wvrIRaU
 nRJCqAhvjtfH0XfCG86NlfqSjwvtaXos7v9qtKw0h+dLND5MJI8tbZo2SUrofFPsk0Rn9R7+XMk
 jAD8Lg904DVlq9YCl7z9OIhvfA==
X-Received: by 2002:a05:6000:2307:b0:435:729b:c390 with SMTP id
 ffacd0b85a97d-435b9669f54mr4708948f8f.47.1769199714152; Fri, 23 Jan 2026
 12:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20260123175235.209092-1-deborah.brouwer@collabora.com>
In-Reply-To: <20260123175235.209092-1-deborah.brouwer@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 23 Jan 2026 21:21:41 +0100
X-Gm-Features: AZwV_QhV7L9EpT5JVv9GhLwtH5gmRNqQm9kkG0BqPUvJju6rCMrDt9HxQcIre2M
Message-ID: <CAH5fLgjtZORYCJBohhD1W7RYcsSG6=ofVVLkg=xsdhKDA94ghA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/tyr: suppress unread field warnings
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
 broonie@kernel.org, dakr@kernel.org, miguel.ojeda.sandonis@gmail.com, 
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:broonie@kernel.org,m:dakr@kernel.org,m:miguel.ojeda.sandonis@gmail.com,m:gary@garyguo.net,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,collabora.com,kernel.org,gmail.com,garyguo.net];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.810];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8A5DC7A926
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

Applied to drm-rust-next. Thanks!
