Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EcVIvmyomlc5AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:18:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384B51C19DF
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F37610E237;
	Sat, 28 Feb 2026 09:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f64d3RJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0852F10E1B5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 19:30:57 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-5033387c80aso44783721cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 11:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772220656; x=1772825456; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sMgCgfThj0uiQ/ajRpndQGU5RmdKGE2cIcjmdTi6q0U=;
 b=f64d3RJFYMv7P1X/VLlSdJOSXB1/XbZ+J8fVTx2K88R7xNS0t274eDkAC8MHlvVnBA
 3SzD6/AxvheX36NkMwUxiEamHLfblcvkRE7nxds/Vs5NAjGJiyhV/Nf8CtVaNk3B9wA2
 pK2PBQR+Qp5pPoJHTkkuPaUE5+dmcV3HdSZL4Y2sdiHE1fEsk/NH/WNcKDlHoZapiwgT
 ytlcgVd+DBPuDqPez8rY/M0crZEZBVsioeYcbSGk6O3s3QfujphIjBe0XKRu3L72iF1b
 F08LxvpLxPjA0pdpMRi+yn//DOtPdkIhcLs3UvUeZIqBmi6UsKq0RDjdKmTMg2C8ocXg
 1KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772220656; x=1772825456;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sMgCgfThj0uiQ/ajRpndQGU5RmdKGE2cIcjmdTi6q0U=;
 b=w5ci52m6cjE1xsCEmoZ7CQEfRmDY696LuTnOn3kEkN04DsbJxzxTBxZtHy+xPcSM4s
 1lvWoksUvBBOxih4vELe5yKc9rJH1n0GxQgNrhTduWJZglX3i1QwsLhUOQhxh3B2KmGY
 zuSi72KoNy3ji598oD+NOQYo3xstF/eJvzxrectwKisrDYkMbfrqafsRWD91KENLFp55
 e4SzgDDtp/Zhdsy6tv2dppG5yU6AyzE+oihRFK222E9Mx8seso86H0Q2kdrjMf7CcbQx
 uzXUHUY57MzLXnsdoIhpZ06xVP/SdfPsda8outzIXq9b8J+2ZGJqRIfxABAaLvgCbisj
 NJaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj1ihuUkZGsAj+I7u89XhTiYb49DanmIIw4xytpXGu4dX25vfkmfx0JGzt2jH2kR9+nV3WTFQ5GB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEbdKhd3xdfUh5sxmbZgJ7/t3OeNO/y/3Nth+qY3T6yXPyRwvP
 GlNKiDwmNAiR4HjxpJ0YvgFAJIr3FQh4TEOYu+/ZXCAbqrbcv/TRGdJ3
X-Gm-Gg: ATEYQzy4OJeP4YyzPEg6ZtOba9FHOMiV/hokHVQqv5/b9zbOjQIaEZcpzoDI4+Qp81j
 cT8JAdVQgEAR2IGlIe+P/w9Hhz7jo7o1Q7Qe8uOrz70sR61Ps6lyeqPtK/FWQLvyYRCKScZvAU9
 AYWYuep82tG5bIweQANVK5WfY/xaMy9XT44KWnw5+x7TlnHXwHZtXUZTxjU3eHzYWN3j8N0d/rU
 y7KyvYNV/Osh/Ihh46m7cBxK34VpoZ6q9LpOHxbdm2Esk/v0flveuPmC3I0uKCEB68SdFT74fgs
 2QRewQMfCMLoC3Amqm14O12c2h1NmfUZgUn8Vxpf2PjorSzMRjlGbcRF7Egr/4QSWiF5E3Dq6cC
 rsxACJE35eoejLBkJlXfqK25dsnUMUc1im1/CKpBQ49KVy4JpyOp4GIJ3qKbnBf8oDInYkO3Niv
 kCXiBII/6ZDrf+aLEif2PQb/3+e1n705KXUntqsL2CTO9n
X-Received: by 2002:a05:622a:48:b0:4ff:a6b7:6c9d with SMTP id
 d75a77b69052e-5075248b828mr56391801cf.38.1772220655720; 
 Fri, 27 Feb 2026 11:30:55 -0800 (PST)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50744af0731sm60355271cf.31.2026.02.27.11.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 11:30:54 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 11:30:49 -0800
Message-Id: <DGPZSF0HMGPJ.2ZDZ6J28MFTQK@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Lyude Paul" <lyude@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-7-gary@kernel.org>
In-Reply-To: <20260123175854.176735-7-gary@kernel.org>
X-Mailman-Approved-At: Sat, 28 Feb 2026 09:18:41 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:linux-riscv@lists.infradead.org,m:gary@garyguo.net,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:acourbot@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:apopple@nvidia.com,m:joelagnelf@nvidia.com,m:lyude@redhat.com,m:jhubbard@nvidia.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[adidevgithub@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[garyguo.net,linuxfoundation.org,kernel.org,gmail.com,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adidevgithub@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 384B51C19DF
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 9:58 AM PST, Gary Guo wrote:
> +        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
Nit: Missing colon after MBOX1, should it be `MBOX1: {:#x}`.

Thanks!



