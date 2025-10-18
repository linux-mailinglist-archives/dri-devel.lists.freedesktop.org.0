Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C537BED5F2
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 19:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4090510E11A;
	Sat, 18 Oct 2025 17:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ko0663Hv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E842210E11A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 17:45:40 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-88f2b29b651so438431085a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 10:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760809540; x=1761414340; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y+vXAMQTTWEmkUojbXBO1de8JWN1eVf43j81u3Bw1Rg=;
 b=Ko0663HvEeR9/xA42D2PQ6tl4bgQiqitnK9OePYWLLXCrK7XNZvV6BEgcXHgkm/yaD
 MhhEE7gLDVQM3OiIxJNpUCD0s4/RzjVvWnLhu2FDoJNHrh6bKuv03wHjQegb/Ig0KsIE
 w6UllvROvlZk+WB4Mz4vZeJIHPCaqh9ROo1nsjqxt250IDI28RubdpZo9TxoTLnYRaUe
 vFLZYHFD0rTGLY/SZOOQjFVn28XkTYgEVydLCNs1Oij/HZpx9LKCtJqvmF+m/LeoOfu1
 Vfx4iLhLjwye8a5sZYvgL802BsDHDDJk08u9TJ9YGh2/OBFwNGeSG6NeXbAxQrP5E2sI
 x+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760809540; x=1761414340;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y+vXAMQTTWEmkUojbXBO1de8JWN1eVf43j81u3Bw1Rg=;
 b=qIu2QrhznWscMvA2JxGAdGMGe0kUjqaDCNRZFADAENGsKc9E64IstobPuoNoZKQeJ9
 VHUZXBLh0BHuJIXwXqH6hn5ax7stXhGel6yk+gCxAH0wwqIqiOfBbBcJMbpLd9o5iJIs
 FW4Osgul3KKPPoK9rouVicf4ERfN7WZs1K/c++L18y6tdLkodOsQUx4WHKjYfssIX+0a
 u6d1r6f11h3CUpdKKuYgkQbCI/7/gcIsm6S2Zj7NIRYEMWocOQetIemH3g1XQk7bxtzq
 q44RXwzEwNvSywNRcGNf511NoEiGTE9GZ63omDsXud9CR8tP4nUrIr5LB8McwMj/8Z9k
 +hzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpCAOEnp/QNKykuCxKmXHPhe4G2C22EgQMTEsvn/sE3zp1KWCFrnk5fYpw6pMslh+2Q+YLsf1LSqI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1cimz5aNl9BKKIQ+VuF0/DrXttFiw/ejfuriOGAaQaD2NtmrN
 Aq0lH32zQ/NSDTge80j3XAklKdgocxWgQ2OB6tHqthMNa5oV5URAKnVU
X-Gm-Gg: ASbGnct362T4vr0MSwEj2lMUdPtScw5JwAsTKKREpwiVZbn/W+QSRgAdFYF5TS/3kCF
 mlVIh8TjpCj2OIs5uMGfzYsJ3zbK3zQXJcgxz5v6JDd4xh/2hdCcaVW9ePsm4Tonx4Rwk2efkFX
 c2sGI3hFGTdts9iR2EnuQ/dLFl18l2XL/yWIO5waPT/zcby39prvVChndzsSuD36T5xQaodlCjN
 wF1FKqpO3gsuZOmj00kXalTP4JtClk36J53QRdJUEFKoIL7BbGHTWkiXIynkDRyasWgPYGWSiBC
 iVzVria6AccmPZNjpBVYyr5Y8uRra/+O5jTl6w13NnPXwgIdZ7TJYxpr747gZQUrKeUJwJ3mzIh
 Bt3eMEcEhIETz4cX+GMTNLzB4EkC+pLG7juvdfx0WOs/cf/qvWbr3zU5E/yTjM7GbKhDeJd04k4
 zGKgNiFBmpcsJVfqSFUJaxFpVVELyf0pWaf8cNUDQAwWzOVMCyF3zfTc40EZrXbNGyz8sAqKCZt
 XKDPBEqemF08Tma5pb/QfFnTmWDv0Mn5TkFDEBmvr69zmaMJQn4
X-Google-Smtp-Source: AGHT+IF2b+xiML9xjqA23uk9sgK2DYeECM9Ckm8gu0/pdYUA9bmcAEH6Tg4P0+oRe/HNA9P52OxDww==
X-Received: by 2002:a05:620a:f04:b0:88e:991e:cf2a with SMTP id
 af79cd13be357-890709e6bbfmr1147502985a.44.1760809539813; 
 Sat, 18 Oct 2025 10:45:39 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 10:45:38 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:13 -0400
Subject: [PATCH v18 02/16] rust_binder: remove trailing comma
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-2-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809526; l=981;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=6FtTg88GY2fWPari0/xVYIFZl0LtyM/QigeE2PMN1js=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDmUAuND6Y30l5/wiMpkJH4TDC04JmcQb3JxiK1A28k2upCho1xt+vnLZy55U4tUVIHHZi0W9Xs
 LsFR1ERakPA4=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

This prepares for a later commit in which we introduce a custom
formatting macro; that macro doesn't handle trailing commas so just
remove this one.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/android/binder/process.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index f13a747e784c..d8111c990f21 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -596,7 +596,7 @@ pub(crate) fn debug_print(&self, m: &SeqFile, ctx: &Context, print_all: bool) ->
                     "  ref {}: desc {} {}node {debug_id} s {strong} w {weak}",
                     r.debug_id,
                     r.handle,
-                    if dead { "dead " } else { "" },
+                    if dead { "dead " } else { "" }
                 );
             }
         }

-- 
2.51.1

