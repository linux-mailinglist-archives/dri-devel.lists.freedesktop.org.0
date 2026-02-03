Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEpOHKotgmlFQAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:17:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D4EDCA4A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0680510E71B;
	Tue,  3 Feb 2026 17:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="MazUbTBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1137010E172
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 17:17:26 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-655af782859so10648639a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 09:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770139044; cv=none;
 d=google.com; s=arc-20240605;
 b=dpWjOhl2Dt1kJ0WF6TQkceQy7FGFGnDNPMreaERf3CkIHbBYwPlb1R6Z85bNTCdzIA
 8VHek6p7o5nGFYbcC9NBZocu6jW/nYQovfZJ1E+qWL7E/p4YKA2FwLhqG0GmygvbpLIj
 2zejY4q9z2wdJetOw9SyzzkcUfOAPmz5X2BcrFoLzz+0HIIEfQysh5ATRdjWyZkUDRXd
 SLJELTWQrkZbGUGGfSAFJEgc8E1t/IXkdlPCJoK+f/R9LVyPgzKFSIwv788cCmjD5qYC
 8Pszu6HmQwnx4jlSzncUL9/4v110COgiy3Gs6D8Sa879b8lIb4UZEOVMJvKKeMiAtepj
 b4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=WXUcacBTiAMKHApnkp/9joztisqR6cQaDE+uiBNMCxk=;
 fh=2dmh0iBV1twiX1VeJvztNZLysdOQUdkMhIBX8wFUfjA=;
 b=SbqvbcwmmaBBgyG+DwBJbhVeFb7jE77zCDkQ6bOLA38DA42C74MAS7EnG4heEvT7fK
 6u4Az9ihklM5sHrAfk7cXfjTVLGD33PozRmf6jZAgZ+JFAGmLeIKAdeygosjFhvVTJx1
 Z9Ez5M1fIV4iU7bFctN+c4rLcP9TI8TaWXOm8FRWZ0i6ha8uwo1RI87YBrjkG36oI09F
 Ky9YLzZTvXVl2o4hLpNeJB6syxwP0NNNVEWQ1KSw5LQzKAUN6TcVScckzj2wPohMMRqs
 6qDvCc1iFGaQDIF8gCjwV6wCH6BhyfPhrlF3/Fs/fA4FGSZ1p5QZvmWtDMq/wubOWfvs
 N0HQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1770139044;
 x=1770743844; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WXUcacBTiAMKHApnkp/9joztisqR6cQaDE+uiBNMCxk=;
 b=MazUbTBDB+jdmh43jkB1UQFLMxNYznXjntN6z1waumdD8g7XWEUSeMwphU8UNNqf9O
 9EFmy03KGVEousaiYZ7LE5BqpDG1gWOMIVssCHLr+HcyuZ5lIMJnqECcJk+xkWHdyx3u
 oCr6Yaf1154xLa1/5N00+lJ0uz6/3WnF0wnLwjXdP5cyxzbfIL8K0VEgFwZ9leteUiv+
 rY4Oi/xZAhE6WgdRxKZDOCC+D9SRjwKpIdUX5/iryRKMTugu2ydBGu6aYlR5tjKNaPMW
 Dr83jekOIFp6lmwaiHwlqOP6+3eBytoql726eC09yENmpRQasA1dJZWIVLxeLBIu7MNQ
 z9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770139044; x=1770743844;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXUcacBTiAMKHApnkp/9joztisqR6cQaDE+uiBNMCxk=;
 b=fpAhwdE8Xuh4RiD+xjSpH8pj89E6hCfB6Cz5FJ24MwsMSzyWzF48Tm4ldQH71t0K1r
 D+E7gtcJ1vbjHjn04Nx4Kcm1iCxf1HXz++A1cO3DPKNEDn4z99b4d9E10T3tSacUtEbv
 0I0rt4u2Hxklc9k6rYorc2w33TVDpuTdibWMlwdO+Vcj9GMEiDUngSCUwzhVlL9utZMm
 BDJHdgXV7JCCvP4LdrHxNzXG9j5LWiH+3/DuaKcFDV2GcPZ1tjAr8/949I/SthBtCO4K
 4HyyQ+EPili7J9ZZ+u96krD278V8d60gXer1wJvU2/QNdaBk055byUavpgVpsRzHHA8H
 vLhQ==
X-Gm-Message-State: AOJu0YwQ52vWhQeG8fejoJuaavbep9oSjjsgIgHWsbdE3Jmunc78omVX
 D7laTCETdIJSKu1aNMu8brCD25VlN+GlyKKcDmzRLEqKLWgZfESGn0m44Ymv4fKtzh6a4d7adrX
 odPvUj75AszsCZefmsK4M37f0VF34yoJXxOcs3l+qRQ==
X-Gm-Gg: AZuq6aJ6MPBtbWI9N4hhLO3+OkcyQcTBIIC708E35OLWUxhadBuxsQfDanm+Mrw4zNb
 xd0QB106Un6HpRK118NvRuuPI4PmOgPfm2v0f+waJc8hkljjHDJY5Wnl9kTNVgY7zu3b1VAZsCK
 9vjLDhEuQ4IKxr5n2583Im6KElKvOO6uK8mjIPH29/5EqNfy904KL/iRB6/wq0TY4z6POrgHufD
 9bonK9Y6Q8WyUdPBsLXyMEleJpROsuZqajNPc6tWk4RSo5o6UomO1iQT5X7stM/bdhFzSg=
X-Received: by 2002:a17:907:26c9:b0:b87:892:f43b with SMTP id
 a640c23a62f3a-b8e9f196585mr15408166b.42.1770139044388; Tue, 03 Feb 2026
 09:17:24 -0800 (PST)
MIME-Version: 1.0
References: <20260202220402.2217813-1-airlied@gmail.com>
 <CAAgWFh03m1Pu=uNPtqGpP-y1PAqNUvyUvo1-K-qP5dHzrh3T1A@mail.gmail.com>
In-Reply-To: <CAAgWFh03m1Pu=uNPtqGpP-y1PAqNUvyUvo1-K-qP5dHzrh3T1A@mail.gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 3 Feb 2026 12:16:58 -0500
X-Gm-Features: AZwV_QgM1aeOQoCbcngqwZlMPlTD5sT2OKWl9VNfIi_vZ5xZ2YFLd_KZuY5W4pI
Message-ID: <CAAgWFh2NiUYduXf_hQB6cqmXQZQ0t8qBz+d5J01EWXyE8XEgZg@mail.gmail.com>
Subject: Re: [PATCH] nouveau/vmm: start tracking if the LPT PTE is valid. (v4)
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[darkrefraction-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[darkrefraction.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[darkrefraction-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	SINGLE_SHORT_PART(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E6D4EDCA4A
X-Rspamd-Action: no action

CTS looks good here on this version of the patch.
