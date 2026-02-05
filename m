Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOFbFWPohGnb6QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:58:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EF3F6A3B
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5E210E085;
	Thu,  5 Feb 2026 18:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GNWrED9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7211D10E085
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 18:58:39 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-1244bce2c17so57492c88.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 10:58:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770317918; cv=none;
 d=google.com; s=arc-20240605;
 b=bStz4g30InNdD3xhg5ZplwHNv0MRlRI1BKvBNS1SQB95Hjty9LB20Z6rYfey/21Ief
 TZamCkc77tCpFWS/OXRPeFa/ATnq62J1P5v/gU8lye6S2wSTHwuCCS06Oz93mUwMOLb/
 BzuKx8//R7GNUS2RS0cPO+n2tCgprWmJ6x0an9E2oVt5X15axdJ6aXoTUmTJsNEd44m/
 YMZmati+juI8WX7HhuDRs8LRy86PGLF5wzgHd1D8MnbqTOMl4cg/ieqNKcWLWpGNieyX
 EbEhvpoQYKVd8FYsLSfPjXo3SrmCyUrGpkGDQozhMtRBcPlpRqG8Z/7DagCX0Z3Fmlkr
 Lx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=zoGVwy4LRkxpr0BHHCLpaHENAAk0g5OLxtCpZU771L8=;
 fh=CmoOW/iJI4FrFVyeB+R9uX4Avkv7Lv0DfC0a0aF7jnQ=;
 b=gaZOnwZW7PwzKps9pX/13C4yf97ZpxqysHhL/yaCsMcOjYSzQqYqhXM3sT9cy/iMEz
 xsJ+beGSNMgYQiHcWKa5JplJSLBdYNwTj/zgA9s0SQ2/sAqTHkzPPlFq2RNXef9Ugfd8
 3fML5debFd2YPhVKT3VmSC0FPedURNzABTbJqtHCV0MXYCwBq6knVQkZaLkMRfVX/se6
 xSKSEqZnzG/GNT9BHsMSkSe/dLKk3nFpVkT6IydNtmrTg/MKghqIctY8DfFYbinI/nbL
 b7mUkM2PYUyfWqmVGPL2X7aLMX7aQRXaA/y/FED2GIULtHOvNP5ATK5tg1kEQOYCZ9T7
 xqEw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770317918; x=1770922718; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zoGVwy4LRkxpr0BHHCLpaHENAAk0g5OLxtCpZU771L8=;
 b=GNWrED9M6+Mji79bMZSOkfHy+vNtFXSeKGB9bcDDpmgHMbWCbqkiULtlqGonCTAV49
 Ecw9mO60dVBk9R5vz0ZlPLLz0iMzRQr2yLBN0EehyRjs2VMZY6FqcO/UzMH/RRrkjqC3
 rmIfrZ3mACx4eGoKutQuJT5WqSSaE139xh047MxTeE7i5aj5X8Mq4OMTL/6sfYm0pzt2
 ZM6577yvchQ7qUkDHQ3hFYyFQB+iyqhi1UUMzaUNQ4TlTzS6jU9bJXoiv3mbudmr7y58
 /Xe6HD0RP3gJ2WWd13Ew8x8sP341V/mn1lT2Bdq1RmLj5GsPwGqRndQcsPP6rWDKdWwe
 sGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770317918; x=1770922718;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zoGVwy4LRkxpr0BHHCLpaHENAAk0g5OLxtCpZU771L8=;
 b=Md3yeuGtED+pnRqb3AdwReJVnDKB9EoPWrWEO2VO6D1MO3wmsPEHtna2vpYfl5KP78
 3DuHr+7gRVoYuX2QvBp1u3806pdG9j7kwv2DiEK5Mtva8Ja/UyAi0Bk2xAVL+E/VbZul
 O8RIVMXGZ7sl5VKUnr9b3ZUm/58XgRCNxad6L7/xeV1mGpczFC/t6vyoHkCvAMnbPJVa
 QDLLjF9cK5KHWLOIkxfMbBuzhGF0qh8RUS4+o5LHHrt4J6bB4+OQm75/mXiikcISK2ng
 DR8gtyWPNp2MY04fbw811XgTbfgbRAYReXMH2QndZKXebS4YICckExi6bZbmIFXo1E9Y
 6yug==
X-Gm-Message-State: AOJu0YxdJom0ZclILH8wE7IymTLj18UXIJbNJKpAt4E68cyYW88p1C3N
 NDLrgluQfYeR5IclWIpdDaGyHJ1f4kKXI382Psz0dZKihuFA3+cn+noAV5vys+zTJWlsH9EefeF
 ReAIWgxdEyv6Kv4f/03cnW9KjTHr6rftPiBQg
X-Gm-Gg: AZuq6aKFExkfvnoR8BTnNOuOJ3uJLeK1oSwpGpzgyCDeLHgFDXFKeTfq4k6Wgp+zp+8
 rViMTouWPqbtYvZ5PDw/mjURfMQwWSo0LQQyfJibMEKtuuc+6oO8Flfo85bO/UfBaZt7oeJ6tsk
 AIaP1ShqwETZtPMrsRFjf1O+Otm8Dvw9dSatvRmRLwGO8fBRReEb3DV4I5WvrNtof2kBnT4bwy9
 uUSH59f2+g7j/VlnZMtmpPMKRNfHr7O3qZGA+6Gyg2lcSxfn5MM9uzyIG/0ewsRfyr7/Euz
X-Received: by 2002:a05:7022:1003:b0:11a:43fb:58dd with SMTP id
 a92af1059eb24-1270401f86amr58579c88.5.1770317918373; Thu, 05 Feb 2026
 10:58:38 -0800 (PST)
MIME-Version: 1.0
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Feb 2026 13:58:25 -0500
X-Gm-Features: AZwV_QhnvxAX3QFbhjBdiyAGYWhTIP9_aIECVW0vQxlsAVwvUQy6bpKUyXK7DNQ
Message-ID: <CADnq5_MTX8CifP25UvE5kdMbCYxgK+A+KGdd-_Ef1m4VYv+WRQ@mail.gmail.com>
Subject: Accelerator/GPU top
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Francis <David.Francis@amd.com>, 
 Christian Koenig <christian.koenig@amd.com>
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: A3EF3F6A3B
X-Rspamd-Action: no action

Has anyone given any thought on how to support something like top for
accelerators or GPUs?  We have fdinfo, but using fdinfo requires extra
privileges (CAP_SYS_PTRACE) and there is not a particularly efficient
way to even discover what processes are using the GPU.  There is the
clients list in debugfs, but that is also admin only.  Tools like ps
and top use /proc/<pid>/stat and statm.  Do you think there would be
an appetite for something like /proc/<pid>/drm/stat, statm, etc.?
This would duplicate much of what is in fdinfo, but would be available
to regular users.

Thanks,

Alex
