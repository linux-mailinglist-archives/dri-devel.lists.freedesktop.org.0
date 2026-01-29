Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KyMLSdce2nXEAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 14:09:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A13B0466
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 14:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE9B10E864;
	Thu, 29 Jan 2026 13:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AlN76riK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259EF10E864
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 13:09:56 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7d148dd3421so339073a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 05:09:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769692195; cv=none;
 d=google.com; s=arc-20240605;
 b=cTgcKJJz6DMs50IGHwQssA7tcyHLE64IS14wXyhbOL+Lq6NOYnYHnDDFxwiB8HhLnP
 H5VGdp/GGcB0AyplGHAdN+cHSYhr8NZ3IaBRwJFpYFnp0z8uTVGrcYbwlns9kCc8I+AK
 OKhq1vLZ6/gq8m283GGv/b5rgJbtUjcYV4J1zeRLpmwv21x3uTCBWlAiq9xLraFpA6c9
 4sAnicMCIkr+vjAKHDbzm2w1bclvTd8cZN9juxXbsreR5LjBvdeZSYKa6sraOS4BedmB
 8ag8CdzGRdbSryZodyFXDPajihIYcigXJV+OgrSlRuqDb1cD3u8Di6yBSa71omprRSxe
 xoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=yfLqSzFDrvMz7ZkHgmvyu7CB8CE2AR+2kwlJG7PQ0TU=;
 fh=rdVGboUKQTe2PQPC07+N7izNoR5Mh+KRwIz2BQB2NMY=;
 b=TA/5idKtEzszdjC2DdxgsgSYOCrYLHn+b1bxue+PUAiiwexKLWzfQZsBrzFuWeArmB
 eDa2i3g7xMuPCDshHyV8CMrd2DNI9p4rfuwXZ7DQcqC/kIHEGGGW5Bd+VavLCtZe5PHW
 sgIYyO+v5xY6TKmEop9hviCL7/ohIxyvtVgilDRs3VluM+XKhES2f/KVVSXAiHH1+yqu
 lVb6WZR/wyKiAVNUUtz7JC4HCcl9u1AEzEIh3ROc7hP1G7HjPyFbZdNDnUjpqZTj1GR/
 wm6YpjmbR4FUvUyPEGuwXBTRgYIdcFKdo0YMhdJ3M8lvb+j6PEn44wtIet10qIMd/44U
 KuSQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769692195; x=1770296995; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yfLqSzFDrvMz7ZkHgmvyu7CB8CE2AR+2kwlJG7PQ0TU=;
 b=AlN76riKWJeF6j2EDOKUs3v0AfpbVROCB5FfkD9pwOZ5mFy4VwHoGAEOzzXy+FFD42
 2Rp/IVzKxZBMrH2uuTKm4G9O2kiCjgNNbaV29ZaJLJshpi4/9yceuBTmH/BGhpohfScA
 vx1DM+ifj8gQunq7R7Jsw7482yf4ZRdNfKlhRhRJb/5DYP8mdrfwI4h2XoFQY5E+5lo9
 yAFs7c1mxspMoXxaWbmsJb3HFKDuQU18Xp7hN0WDhMkkVPeRD0NJyRVZ3xkLkZAf/LiP
 aHvf6oRQSAJIA5Dy8IfnUc92Uf0SZFrzbnRKYVXkmvmoCZzLpFAVa6CGW15s0piJrL5z
 Ysag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769692195; x=1770296995;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yfLqSzFDrvMz7ZkHgmvyu7CB8CE2AR+2kwlJG7PQ0TU=;
 b=b96lap1HfNv/BgjsM67ADKAktzOOvDcv7uIt4lVe9ZasQjHLnZXVMAuvzkTkGrp5eb
 84mrXBcCEiHM8s5DjRxsrnwF2T3pYhFBSRX75iHrIOP9tAJGfattaLDwM1L9VhiFoxnt
 BSQjn3Ad1L2HwW1S7+rQBe+q/9QOWRbTa5hXJsJ7OkXqcihdjHLeN33Q7M9NnvPxuhgt
 Xa+jW1b5Nt9U7OzlWACzlL57Lcyk1KfF8IvKzrLIgPXbb6hPuwJ/U/hpD2FiIYPN9r5s
 2dW9ecVY7ZDi9Ggam6lLnzYSp4KBpKSFNjPsmsbxBwqvBw/+FFkD5RbyZnzeK0ONvMF3
 RObQ==
X-Gm-Message-State: AOJu0YyW80Yb/tSsKAnt5rzCVidcEnmuUAGCwqH1DlXVrW/FtBJ1YYtX
 mVJKo0ZKIirsySKb2gjcDWqYMAhH3xCo5NLzc6BaSy8WvEbexmQt4yHjuN1XLaMkRY9XoK3elMx
 AvPZjy/WQacANxCKKrNbs/B6KceHd3KrAAA==
X-Gm-Gg: AZuq6aKgkzqsqk4YhRj/BbM2uiNjtqkyJ7TylBMUjKG3DNjs03XMLJ/8LYhf4rSn0D/
 VA9hMKG90T4cKvm/jJ6sRBm99866YgObnoaSiYvLLH6fQAkPJk1F6cdTbNSkFLhMkJsgRrnjr2C
 x8PWlT2bVwKu8Zbh6QJ5XOMV0M97aPDFnruzcAjEzyH0hbEviDISd4k2cpphFM5ditFZDl8HkgR
 oV515jDBWKB1gzLn/sJT4Cgqk5AL3ZpUU0fubdE3heftu09tiUOnJ+RhcvrBTo2SQA1
X-Received: by 2002:a05:6830:2804:b0:7cf:c485:be43 with SMTP id
 46e09a7af769-7d18500e8famr4928277a34.7.1769692195148; Thu, 29 Jan 2026
 05:09:55 -0800 (PST)
MIME-Version: 1.0
From: Harsha vardhan <bbsharshavardhan@gmail.com>
Date: Thu, 29 Jan 2026 18:39:42 +0530
X-Gm-Features: AZwV_QholSSAm5FobimTzTirVmifDqhyXtIxYsIPoYXegDWmjYD7w32Ej455v18
Message-ID: <CAMk+bD7CFgegFUDH3L_r7GOHcuEpXuM3Ca1LeySL8nd-jYxKnw@mail.gmail.com>
Subject: 
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000a757390649869275"
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	EMPTY_SUBJECT(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bbsharshavardhan@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 48A13B0466
X-Rspamd-Action: no action

--000000000000a757390649869275
Content-Type: text/plain; charset="UTF-8"

I haven't received the password

--000000000000a757390649869275
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I haven&#39;t received=C2=A0the password</div>

--000000000000a757390649869275--
