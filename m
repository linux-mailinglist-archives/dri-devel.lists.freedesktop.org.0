Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F9A10B94
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7FC10E3DB;
	Tue, 14 Jan 2025 15:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="c3cTmJOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D175B10E3E0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:58:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso40701995e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 07:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1736870317; x=1737475117; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Jy053pveFc5vOQULkJgdhfgLtZi8bhMtaMMo61vm9vk=;
 b=c3cTmJOwzLTuQI6deJ2Q2ff5T/Hs8FQiFDuZHwfSEgqcCLiOfjVpbSJMwnPS5Jwsc3
 JOfZK5ZLboIy9S3vWr0I6LWhykb1iiTcqwMBkdGo5tmsg6AhKXYDaFq/PHqW3MPoA7fU
 bTgysXoqLupVotyOy5K2djhJzaRpOjzC6KPabEnclcCM5l28zVNApEAGeiKspKG7Vzma
 5DYlNKcB3s58vE+J4I60MLcBMabka1jDQ3Px7P+eGI9Xq6WuCJALj3GhJ/9rji13MOI0
 QehmUMaMpKSdwFthGejFzAMUmWQHRyo9D0iiTVUgbgNHRusNx1eYylpid4Uf+/AjTEdD
 gG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736870317; x=1737475117;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jy053pveFc5vOQULkJgdhfgLtZi8bhMtaMMo61vm9vk=;
 b=u59VCqEC7COcNG1pJxfeISRP1s5fMh694GMzpOX5PTAWAJqVXt2zSdHbL4qZe+Mg9Z
 H1wXevcTyDg60d7J12xFIWq6qZsGfoDyfLrM1bm545soGauV1JgtaKBKuORafrlRoEpN
 eMcvp6fdjzAb9BXRDgDY7GSdo0jVE2n4C6w1wA0JeyDGgNt52cxbPl1VnR0+J4D6/Hom
 mrxiyqtTV8oQrSOrQLzsgdg6TNRyM1KJbL6vlaSS3nAjiFkqVplWVPBuuKjW4M19bZ+E
 BIHPJUcGtcjBm0rQW4irQ+xtM6cZm36TKBFtNt4+CIznDUSn5WhSkWpE/y29oDn/ofLz
 AROA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwutb5ODl+bs1d4jOG4GlQbz+FBEbbDG58GrUT5Z/brotv8AVtxF4SmieJFiz5KFp8JcVMiH/zuK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKGyoafB+iZohDAhafmzR5g7fI39FArVseABcRKcfP5ytPgmWX
 qL5V9pMXf5WdP+ZeCzmqat5bJv6LhivQYoOTT7jDziwfvZeF6Iu/w4U3yhZmxn0=
X-Gm-Gg: ASbGnctRvV0O9BAw2F9wbx6SYqkMLfb0HaXDzsGk9Hz1HUAcwDyxZMVshl7v93AUtYo
 z3e2qdLuRdKrqsuit/egcFj8NUw6t4vykrCcciODE9cXGDwIgTq5SDm31HMRV1o03nctMS6tndg
 LhypRFO9jte1f0cdcsJF4Z+bZXxvetHEW6DnBI3mIWOwAi5FiD70mBwaiShGUAiZPecYvVTggKC
 fwZKDUcUZbI2uafO5ClxGQSjot3HS4uHyCcUZS3Fqc1zAtNwi2om74c3KY=
X-Google-Smtp-Source: AGHT+IGJhudVR8zz9A+ucF0FCTkf/6lu/MjcBn4kAg2gfn0Lg/cER2ZyrWmwTBO/3c4T29HM2nx7kw==
X-Received: by 2002:a05:600c:1c8b:b0:434:f5c0:32b1 with SMTP id
 5b1f17b1804b1-436e26a7578mr245284945e9.15.1736870317330; 
 Tue, 14 Jan 2025 07:58:37 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37bd0sm177839635e9.26.2025.01.14.07.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 07:58:37 -0800 (PST)
Date: Tue, 14 Jan 2025 16:58:35 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Friedrich Vock <friedrich.vock@gmx.de>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org
Subject: Re: [PATCH] cgroup/dmem: Don't clobber pool in
 dmem_cgroup_calculate_protection
Message-ID: <ijjhmxsu5l7nvabyorzqxd5b5xml7eantom4wtgdwqeq7bmy73@cz7doxxi57ig>
References: <20250114153912.278909-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ibfckbdhvcclcywt"
Content-Disposition: inline
In-Reply-To: <20250114153912.278909-1-friedrich.vock@gmx.de>
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


--ibfckbdhvcclcywt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] cgroup/dmem: Don't clobber pool in
 dmem_cgroup_calculate_protection
MIME-Version: 1.0

On Tue, Jan 14, 2025 at 04:39:12PM +0100, Friedrich Vock <friedrich.vock@gmx.de> wrote:
> If the current css doesn't contain any pool that is a descendant of
> the "pool" (i.e. when found_descendant == false), then "pool" will
> point to some unrelated pool. If the current css has a child, we'll
> overwrite parent_pool with this unrelated pool on the next iteration.

Could this be verified with more idiomatic way with
cgroup_is_descendant()? (The predicate could be used between pools [1]
if they pin respective cgroups).

Thanks,
Michal

[1] https://lore.kernel.org/all/uj6railxyazpu6ocl2ygo6lw4lavbsgg26oq57pxxqe5uzxw42@fhnqvq3tia6n/

--ibfckbdhvcclcywt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ4aJqAAKCRAt3Wney77B
SQc5AQDnhZPEDQ5xOwuloCpkFjE7OGy9XDVbMoEBwHiqAgMD4gD3V6Q/12Rtz2RP
isY6dnqfsRxL6wDbK6TxQjf2z7GpAA==
=Erot
-----END PGP SIGNATURE-----

--ibfckbdhvcclcywt--
