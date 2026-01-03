Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F23CEFDCE
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 11:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4800510E327;
	Sat,  3 Jan 2026 10:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gyl5dHZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC3F10E327
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 10:02:55 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4308d81fdf6so6025980f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jan 2026 02:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767434574; x=1768039374; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pVMxWDM6IlrZiTwjie+uTeOt+ekq2BmDE9odN218w14=;
 b=gyl5dHZc1KQJltfyBTbYo5WQylw3Ko+YRNUtyz/RP2i0E7kt1uryutPSO0orgcGSl7
 84WNiJQq/C0pxjZy1mP2YT6DdRpgTO8NKmSwVgpRSHilRfZirk9VunhsGEkwgVnkNzwp
 ktyJwIYL5CELn3CO1v7GMSVpca1jFvzMg6Kj80yIDDqnSAMMUK/jCEyzEO8IrTTiHlN+
 sxoqd6uxttmt2KkahI+Ga7WYdpE3x+2JVLrQ/1CRvL8hWys1J4FYJJUuR7hnZ/DlLyex
 6f20tvvDYrDJbZAFr6KZZGTg/Il2oqbGZ7mtJdwYg0tXbv7Tq1FegUwURvPfFfnMFCkY
 hzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767434574; x=1768039374;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVMxWDM6IlrZiTwjie+uTeOt+ekq2BmDE9odN218w14=;
 b=gWOBHcX5LAx2kV29Fz+dg10IqvXyKqg/LKybQA9of6AiU+F615tuNkw6+4i/pHXd3i
 EVYSRgz/QLfvrXbwdtwbGUI2nRDzAl1slQivXRNM45bD1YifwYBHmn4s2MBvO7l2JPRk
 J5n3mSvBNZ5akGbEdkzZJ2r/ttLUET10ne9xhzphegqVEd5mGoi5GwP1OG0767ct0oju
 Ln5orB5XPy2AE9VG7X/sYLs2wUw2wyfIiYIbIyWqjcle584magBcmjji4QZHuwURrqX+
 6UhWI5LuUfNa4O+10GQf23qdk+OBUzh64MHEfERDiP0RSgsHyw5jA3e5e03nZ9/nEVfa
 16gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH3zSjfxPzvK+O4Rgf4sIrZ4RY9lIkW3GUuXntgN69WxfKLjtkFkumTsGQcoVU2rvevEfKic/4zys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzz3q/uCd4l3RIdPJ+VMmjJQVdnpdwZGdSmeyOC32htF+yogfId
 rI0rUxLY0XpTAxZ7/WcEH37Xidcxk8RJyhLUjwKMfwBDinvJw+l8Y9EKhqoGsd8iooE=
X-Gm-Gg: AY/fxX4ymJCuOS5YByeMbmHKrP18Pr8+7/lrtVBxqVLV59xrNni9LK4qzTlr5PM9HuU
 BM6mIwQbVjCFiuOKpEZtGgikR/YGQv2xG7OVpzUXacx6tFnIwfdPlt0TkBaP6xYf2zxIDQL3S3e
 8CZuxLr/I72vuVvGcYQCHSH8SRp88BqR4XkAgnvnySdJ4hXmymZbA7upyhAyZFIOe+O7sU4OUsK
 v3qgv6qRbzn0NkUApbKW4gJ9KJ9iDm6yP2Z+dIbv5WCsvp9PfqeSgiZqhdRWuIndLc4WsdOzlFh
 Gb7SUufV3LzUCdl+7d8aB2dHx4zDG4QMFQGW7OZLUISK8+KckaHEqzdFZ+W1ITMln3Srm5eF1vi
 ibPC2MDOg6BVtRUbHXzIHhqtg8l5If0V5Ahp8a4y2kSe9pRoB2AsNO+zrxXIGN/BSXlwwjSjUiB
 koEpew6OAFvpLipDk6hllbYyBaZw==
X-Google-Smtp-Source: AGHT+IFPkanq3RHUbcsbNCpasG6Z313jdsfGQVH9J5om8n/FtqWwK7E4sTbdu6zUmursa5ksRK1pIw==
X-Received: by 2002:a05:6000:3113:b0:42f:bb4a:9989 with SMTP id
 ffacd0b85a97d-4324e4d0fc1mr49661835f8f.28.1767434573075; 
 Sat, 03 Jan 2026 02:02:53 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2a94sm89174903f8f.43.2026.01.03.02.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 02:02:52 -0800 (PST)
Date: Sat, 3 Jan 2026 13:02:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Vincent Mailhol <mailhol@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] overflow: Update is_non_negative() and is_negative()
 comment
Message-ID: <903ba91b-f052-4b1c-827d-6292965026c5@moroto.mountain>
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
 <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org>
 <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
 <CANiq72=jRT+6+2PBgshsK-TpxPiRK70H-+3D6sYaN-fdfC83qw@mail.gmail.com>
 <b549e430-5623-4c60-acb1-4b5e095ae870@kernel.org>
 <b6b35138-2c37-4b82-894e-59e897ec7d58@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6b35138-2c37-4b82-894e-59e897ec7d58@kernel.org>
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

Thanks Randy, for sending this to me.  I'm on the sparse list, but
I've been on vacation and haven't caught up with my email.  I can
easily silence this in Smatch.

regards,
dan carpenter

diff --git a/check_unsigned_lt_zero.c b/check_unsigned_lt_zero.c
index bfeb3261f91d..ac3e650704ce 100644
--- a/check_unsigned_lt_zero.c
+++ b/check_unsigned_lt_zero.c
@@ -105,7 +105,8 @@ static bool is_allowed_zero(struct expression *expr)
 	    strcmp(macro, "STRTO_H") == 0 ||
 	    strcmp(macro, "SUB_EXTEND_USTAT") == 0 ||
 	    strcmp(macro, "TEST_CASTABLE_TO_TYPE_VAR") == 0 ||
-	    strcmp(macro, "TEST_ONE_SHIFT") == 0)
+	    strcmp(macro, "TEST_ONE_SHIFT") == 0 ||
+	    strcmp(macro, "check_shl_overflow") == 0)
 		return true;
 	return false;
 }
