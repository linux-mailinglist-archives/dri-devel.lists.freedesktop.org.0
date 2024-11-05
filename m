Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5499BC3C4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 04:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD6810E0DF;
	Tue,  5 Nov 2024 03:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fD16sy2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E0810E0DF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 03:21:13 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2e30116efc9so3937363a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 19:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730776873; x=1731381673; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rJTGWkHI9HxJNutbUnigt8F/ht1Q1r0MfDYJ2HTJrJw=;
 b=fD16sy2eKqbRnDBw/ARFDePIF42HqL+8brh43cNyQv3Iiz5VLK2Q8bkpdJKnzXXER1
 KxsXgNbS18lc68J1Nfcq1efxm3LPBCkZqNFeYICl+3m78fpyHX4LSXkF7lCgfnur/nNs
 7dC9zIe0L+/row6Wv1/MlrHUo/YzzrlzdolFPnfe+aDws0UTqnBXcdAyKRQapm4Xzd2i
 5Cx7U6SiLjPuGnLevbqjdsCArEkq5zaoy6Zs4CrI40UH7lhcRc8Fl13Yf2f1wJcPdgz0
 RrrbTB2o/oyHYiF+HP9hnrPO9lc90c5miV/y9x5lb3TYWqy4pA7FPrc9gzcuLqpmI1PY
 PYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730776873; x=1731381673;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rJTGWkHI9HxJNutbUnigt8F/ht1Q1r0MfDYJ2HTJrJw=;
 b=ppaCXA/NY+FATBaslKL3vwWshcaJRMezc/FC7NF3InLT0S4SZnqeeO8xL30PcWJm42
 KyOCqVw59eMYcnGnR+5oAIQpkxpslEIVVzllfyZpesszwmYm4RxvCP21IZ4akdGtrsH3
 D9CYtmLNJ5eOllc6nbBA9XwWRRJGGcItVnkogV/BqrRAvX6IBOMV0J7MAcPz04AdyAch
 cZ1fuA9Ds2JKdCD9XcnoApxepJUx7Rs5xLvevayNIZWSstY9MMQjL69UdYOt0LqmdCqP
 bFCMuPDjGMmoxADgGk7bBlXuGC+6463lHCvmoS7SJ1HhDu4wOJNoGwDbDsGn/02y/JYz
 TNkw==
X-Gm-Message-State: AOJu0YwklMOZtZNeNoSXlHkOHmhakXlwtamfEDlTHH4Pf2PfznVpq83x
 q+BCEhktGMAT1PM/7/uF3y29ihb/S+Vswd0s6QVfh6XDQg/sPRfpl1Dy0xDU0d4H3i+FvA0p1hr
 DuanBsUHJScVqeBtNAxCpsdviDESyhcqk
X-Google-Smtp-Source: AGHT+IEsosuxVyvNdWfTTT0cMWgOtr+PdEdzchPTZSOg48ciJyD74+DsAy5HGpfiArScSOs7u9zH66LDlJKETYnp07c=
X-Received: by 2002:a17:90a:c90b:b0:2e2:b17a:b118 with SMTP id
 98e67ed59e1d1-2e8f10a72bemr37543617a91.32.1730776872742; Mon, 04 Nov 2024
 19:21:12 -0800 (PST)
MIME-Version: 1.0
From: Eduardo Hopperdietzel <ehopperdietzel@gmail.com>
Date: Tue, 5 Nov 2024 00:21:01 -0300
Message-ID: <CAKs_gcAS6Q4nGz-w+GeJQHtHJnMLHK717oiYGopSVm13UWuRZQ@mail.gmail.com>
Subject: UAPI Question: State of Lease after DRM Master is Lost/Regained
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000af789e062621e41d"
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

--000000000000af789e062621e41d
Content-Type: text/plain; charset="UTF-8"

Hello,

I have two questions related to leases that I couldn't find answers to in
the kernel documentation:

1. Does drmModeRevokeLease() close the previously obtained file descriptor?

2. If a lease is created and then the DRM master is lost and then regained,
is the lease still valid? If not, are there any additional cleanup steps
required?

Thanks in advance,

Eduardo

--000000000000af789e062621e41d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I have two questions related to leases that =
I couldn&#39;t find answers to in the kernel documentation:<br><br>1. Does =
drmModeRevokeLease() close the previously obtained file descriptor?<br><br>=
2. If a lease is created and then the DRM master is lost and then regained,=
 is the lease still valid? If not, are there any additional cleanup steps r=
equired?<br><br>Thanks in advance,<br><br>Eduardo</div>

--000000000000af789e062621e41d--
