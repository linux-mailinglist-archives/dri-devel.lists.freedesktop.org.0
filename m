Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0950AACAF58
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 15:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155EF10E0D1;
	Mon,  2 Jun 2025 13:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B97DIWRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EED10E0D1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 13:45:46 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2351227b098so29129445ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748871946; x=1749476746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S970LvgFik4CtRd8l9nyTXQOtk7DcwYM8qd00P7SiU8=;
 b=B97DIWRVNV6X5MtjYVGfgrtgUSPhq0OcWb61aX/sjFz5stq4qnrgSHK4U5GXR+RM/l
 5dTS1GbXH3vs2sLILMreiL5JNjEjb6G+bbjDWSmmfaYT0FezoomQA4lqerb3400vb42Q
 n66OpAWnzs18IdWIZUO0dUt3NMuG1JfjQxmdqohWtHmBnMoDyeU/Awju1QQzHPnlKnEM
 VTPPP4G0stMxaEYDC4ru4KQws+hz7boAE7lqdgEBj32eLZQyqgh2xobDBJsNnE2SB7Li
 iiNLsAIhBS2C8nizLb27Tw0ql1myimcTjYOfhsN9x7fNCsknlMmftfXMryMoPdk4hfq0
 ISmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748871946; x=1749476746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S970LvgFik4CtRd8l9nyTXQOtk7DcwYM8qd00P7SiU8=;
 b=kJs+IOgsqQgZaglHDVP2wtPS0nQMOJt81JQ2nFUfSoA2tgvjhDNlrJg2v3uqJNc0Pf
 9FPBV7lpmeNu/HTmMbG0ia0uNm9MSKmEJlNeNUQ9nxdL3U02IfxT9HauN9N8r8vrry54
 mduGAcQxcIPXdb/2jwJ8xJJXIbMFdUw/0t6yLh5v5+KI0KM4kysc1bLyn2o1sxsufNHt
 oPaKDNPnrZUmNYs0dsePAVh05iaxOPdODqs6+4c0Gffee4VSOUc1VOpMaUd22ZaNcvre
 /NKyHjxQanYosdgiXiGYdU7suhKtPKH7YF/pxCHETXwzqDtUcZzuimomvzsBjWpCfIkP
 HGVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYB97XIZYsnenIHQKTRkAi5XvQk/Q4ttpoO/Uj4tsY32DMRvbPJcZMHDTJ6e4OulC339W16ITXohg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7vZZieTMJQ/DMydwfEbUlxv1wSsEQrdHz/BC6VCE1iucVSCy8
 hF6ZZI1qj8gbmyRAp3WkFNVpZoKMnIJ+kXX3RZ0ENB5aPAZ5hS5ftvkF
X-Gm-Gg: ASbGnctlDlEobWVJXgjXijdek8ahdDD+Xep1IQu6PRIiUv0+XjGZn6arAGtY4jAROWV
 D0iKz7fcwCh/TlIyWTxNISqmwj4VRdLlEo9GsyZ+lAInJ1SXcLrB3IkROtICvZaFIwMCwhBgcy6
 9adbK5vvyeD2ChsRwXpwJuGUj/MEj0+xZMNOeMrfZW9zqyAolaRfgNjnygIzWvIn2sW1j2d/6rd
 eOjR9y4wleRb0qs2GllaOMULwaZ1FqSqDqAFf9DeMyWNjxITBWL4rTwjqSJTLJfqymW4wMNF91x
 LTJDRMOo59rE8e3DhmZbXUHyI/gzwGvXUsyKApH/uAUDxWfDUg==
X-Google-Smtp-Source: AGHT+IFQV0KYx8dlqZAj78pn1qmlTMJYNfvFmu2Nk15buJHM133DY8QNVn+McD/8+Bdfqcjfqt1YEQ==
X-Received: by 2002:a17:903:b07:b0:231:c9bb:60fd with SMTP id
 d9443c01a7336-2355f769730mr100658265ad.33.1748871946123; 
 Mon, 02 Jun 2025 06:45:46 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e2e8e80sm5591447a91.24.2025.06.02.06.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 06:45:45 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: jani.nikula@linux.intel.com
Cc: danielt@kernel.org, deller@gmx.de, dri-devel@lists.freedesktop.org,
 jingoohan1@gmail.com, lee@kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mitltlatltl@gmail.com
Subject: Re: [RFC PATCH 1/2] backlight: Rename duplicated devices to support
 dual-backlight setups
Date: Mon,  2 Jun 2025 21:45:32 +0800
Message-ID: <20250602134533.114602-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <7dc6a9e5171bc70be23188ffd8c45168fa79aacb@intel.com>
References: <7dc6a9e5171bc70be23188ffd8c45168fa79aacb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On Mon, May 26, 2025 at 4:53 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Sun, 25 May 2025, Pengyu Luo <mitltlatltl@gmail.com> wrote:
> > When registering a backlight device, if a device with the same name
> > already exists, append "-secondary" to the new device's name. This is
> > useful for platforms with dual backlight drivers (e.g. some panels use
> > dual ktz8866), where both instances need to coexist.
> >
> > For now, only one secondary instance is supported. If more instances
> > are needed, this logic can be extended with auto-increment or a more
> > flexible naming scheme.
>
> I think for both patches you should consider adding a new interface for
> creating dual backlight scenarios.
>
> For example, this patch turns a driver error (registering two or more
> backlights with the same name) into a special use case, patch 2
> magically connecting the two, and hiding the problem.
>
> With i915, you could have multiple devices, each with multiple
> independent panels with independent backlights. I think accidentally
> trying to register more than one backlight with the same name should
> remain an error, *unless* you want the special case of combined
> backlights.
>
> Similarly, what if you encounter a device with two panels, and two
> *independent* ktz8866?
>
> Please be explicit rather than implicit.
>

For i915, I noticed that it renamed the device internally, so I tried
to rename it in the backlight driver.

Indeed, patch 2 may combine independent panels, I was playing with
android tablet, and I ignored it, you had well explained it. Thanks
for pointing out, I will consider adding a new interface.

Best wishes,
Pengyu
