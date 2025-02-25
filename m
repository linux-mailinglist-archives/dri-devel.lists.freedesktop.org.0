Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B2A4402D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 14:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610C389EBB;
	Tue, 25 Feb 2025 13:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bhFz+sWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA08B89EBB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:10:00 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-220ea8ed64eso13723185ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 05:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740489000; x=1741093800; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NmgbRQa5MS86snbaEZWHJjQdnfuzUG+P83d5Gw//rMo=;
 b=bhFz+sWXiolYRpK/uO0J6G7YGmCFOf2sKt1V/75ZP6lNJDZWsuIcwY8f+E7rVUkSuK
 hvIztOR9kzlnAYtAQDks6kBY/fwaUGEcGouw0j98RHLrgt/apul7IsTsPpqEnBruoii+
 JuK1Nyk8PCG6sHGYhI5wvK0xHifRwEOkLa4ZWAdD8BH5PNjvGtw2lnvbi/nRZEdrocZY
 s3bzfWsKuVJoBDS3K4B38IYlXAPIri4lxwQ7+b+f86iVsF3xH4gcIXgAd2FUkBa/g1Yn
 Uw80wzQgZ4tW0jQGMK2gHGipyLE+xmLDtzNyIc46N8gP7FGgwv865cfZPmUNte0lHYQW
 NrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740489000; x=1741093800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NmgbRQa5MS86snbaEZWHJjQdnfuzUG+P83d5Gw//rMo=;
 b=kQkaQ3zwbjOcZdNEZsih/1ts1FigVHXfXzztsBjLyxfgrkDj6vJ4aK3dYUIiKTz7eW
 zwrYntmMIZNgOSPOCwDgwWbCH3ymwnsjZS0kPljvN1vRu+UWhBtiX3ViVnR1OwKvUma9
 HVq9t79nL5BSJ6XL5mG6NA7ElKnAdXfb9/aKm8nIYdSLosAQvmDuOK/QoUbWboJpNHji
 g69ZSdvrNumi29mk197ERfyZuBDi/9aa8fkTbA5cwrnOBMwuTQfJc1oiUnvuvznEnKZj
 CyY61sVEXMKK2UYPRj9V1VDmh5Yuwr5c7VVwEMqwIzBzlBhfowWAf/H6PfFFdXIwjgjg
 o5fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhwA5eUi12n9WqCwxnGmcAnxdFbhGXvi72C8MZsDSZX9iB02I/V3nxWb7j28L46407yfMkTQgLsUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh0pmKnNFwp/qmIGzeP1SMFtJaBarwi9wR9IJcMa/Ih18wPfGb
 skNE75H0BfBjh7S7Zv4MzHyoBiTRi2MHTpFABq25OxB7TEoei7r6
X-Gm-Gg: ASbGnctpF5krfN9n5TFsxah9hS8dMIkNQrP0MKoHRaPhZJC6BQ2q3bDCB0NEFqgc+08
 rs67x1DnLZa442cuwee8kV7Nn2GAejV1ruENCFsoSEPDFzyapPXpZRzDQ6gdk/OrYWZVkIamfcC
 oja/KsnA+fPS8cere82dqrCU6JhV5Nj6WhTY8TlA8C9BLeV4Am07zAd9ClaBTxsChBpFVXTzxYh
 k5guaEQfGEBC5f7BWbJMy4UisXAagFjo2yenxcJnClPRkouRK0l7ctOluDAPgtz2RxrXIMwBIq6
 1fH0mVJ50TbO5kJycpnV8OB6EcxwXpkx1CaHTNQ7tiM=
X-Google-Smtp-Source: AGHT+IFAOl04FQd9DYpn24JBIFzBlWQ2MlsHQBRasgHUbKqN9nNVyvOkNVWTDVi3kFIyQpABTIYMWw==
X-Received: by 2002:a17:903:230e:b0:216:30f9:93c5 with SMTP id
 d9443c01a7336-2219ff56b99mr109777465ad.6.1740489000319; 
 Tue, 25 Feb 2025 05:10:00 -0800 (PST)
Received: from localhost.localdomain ([171.217.43.225])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a0a7ea0sm13413485ad.177.2025.02.25.05.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 05:09:59 -0800 (PST)
From: Qianyi Liu <liuqianyi125@gmail.com>
To: phasta@mailbox.org
Cc: airlied@gmail.com, ckoenig.leichtzumerken@gmail.com, dakr@kernel.org,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liuqianyi125@gmail.com,
 maarten.lankhorst@linux.intel.com, matthew.brost@intel.com,
 mripard@kernel.org, phasta@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH] drm/scheduler: Fix mem leak when last_scheduled signaled
Date: Tue, 25 Feb 2025 21:09:53 +0800
Message-Id: <20250225130953.100871-1-liuqianyi125@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <141295638b73e885f51a4b82ea7e417a6b0f5140.camel@mailbox.org>
References: <141295638b73e885f51a4b82ea7e417a6b0f5140.camel@mailbox.org>
MIME-Version: 1.0
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

> Oh, and importantly, I forgot:

> Since this is clearly a bug fix, it needs a "Fixes: " tag and put the
> stable kernel on Cc.

OK, thanks for reminding.

Qianyi.
