Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA4CB24DB8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F38E10E760;
	Wed, 13 Aug 2025 15:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g6iWDGWQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F4310E75E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:42:11 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7e86faa158fso2592985a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099731; x=1755704531; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rIKU6y7HIcD7sJ2LFPkw8IuKvoxcxt9BF9YEBuREqoU=;
 b=g6iWDGWQKfue5S+Lf7A4BZwrjGjmtwWun0lbuxzly8Zz37HmE8vSOHcqchoYNFt4Vx
 9uQs6lr5CtkG+xLszWbwqRhMjr+Q3b6uoRSa3qyqVGI3syJUCKnuofizwDopKE6vjmFw
 VKM+7emscaHXnbGxw4rfx4oA72/1J3+YbIIynfEffpWdgy0liL5Gfz47DkZLLPOqkgYV
 D0JpMrZBPfdEO/+IAgqY2qV2iWAdNdx6ANspt82IHFRq4hGftpkpSVfYIeIJWU6XzHJD
 AnlyjAYpLBts9py9KmoAZEKGDVNYc6mALedZHgaKJwR2uh0h69bYizfBHTNAVDDOuQHh
 BUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099731; x=1755704531;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rIKU6y7HIcD7sJ2LFPkw8IuKvoxcxt9BF9YEBuREqoU=;
 b=dtpaAoL2+pDd01pPz8DjbZb8aV5dkR3hgylLVI2JsuTjcEBdItwKYSAn4OBL8vjyYn
 AxBd3VUWWh+TGxVDTmDaQIv2s6Y6npSB7mH87jAOfoMljN9bZQZulmkhKTOMbU4/VlBS
 QUOw0fOqV1EzQgMVTd38mzMFjWhLJUjY3WwXlWb9wmwioANV437idcZcydYi+5gds/yO
 1GAc0Q1QZhcwNbqTsRMt/O9AJUMtG0J5cpn+R4U20H5xJ5mwb0FHApTEWgQWslm/WtVp
 NDahhrkdKuD/yZUpr449pNBSUS38e9KNH6vHoTAh/1IDy+oXcKES0GtqLUiLnoeCOsIP
 JB3w==
X-Gm-Message-State: AOJu0YzXC/Avcl+v8QbTViH3eUhC98LSOWPuk6JfSrWR04+yDiNLscJo
 KMm0Vmm6S/p0OneWol6dF8pJq1d4xO45NWoL1dyQ5do7Sni4ctFwVkDx
X-Gm-Gg: ASbGncuXer1lqsKw/txdm/VMYmtTDWik2zITk36vBJbHbCJsX5QxiZFlfAQrVGafIHE
 R5MXhGO0NQ0uRBWyS5sfSu5z/rH54FufHKJ8wxeCnOJewYUknbi8eydi+EhZTAQHfnLi3qfOy+n
 FafMkVW5ieun7+F1a2s8yMc/pryc2vczbD6VChxMHXK0fqra09Q3Jk2nRhNl1uC/TyL5p2tMLrb
 VWKUeGSmouqRAmeVzJz6CeM3AU59J6P8nl++jmLm8GD2/ycePHq9/K5Sm1oddEpVZrVxXGuBHAy
 DpURoXCPtfD6pQ+eUSZ7WmehLEIxaY26iZu6Tgd4m/3WwhYlEaEHramO2Ih39h6/2HaHtxh/YhS
 TMWHmS8kvLPq1R6CADCAsW3BjbuJHjRzFRKH/vvkz9bFRH9kDMMkmsJNgTa/JZQaioN/vuMr7e7
 Gw/Toj5DeuhGe3h6vx3IIFWsqP+IRVigHmnP1VUC0J57gf
X-Google-Smtp-Source: AGHT+IHBJOKNxC55yhYhgGJW6LYVF5ZsnH5hebdh4RPHu+2KNBOMpGvD4jyu77CdVl9CARQjjtP5SQ==
X-Received: by 2002:a05:620a:d8c:b0:7e6:9bc2:6cb8 with SMTP id
 af79cd13be357-7e86fbeb340mr8732985a.2.1755099730671; 
 Wed, 13 Aug 2025 08:42:10 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e81bc7a1e3sm1180019685a.74.2025.08.13.08.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:42:10 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:41:56 -0400
Subject: [PATCH v3 05/11] rust: drm: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-5-545c14bc44ff@gmail.com>
References: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Len Brown <lenb@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099715; l=1242;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Je+DfhMpFZaWrjewSpv+UzKU7rguC4PRjqAvjqowEZw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFm34PmolkRKLvy4QkIEI5kiwY6L7v2WN4Wn/sP/XpTg8AkQm7p2MjVpOjJBbFo96Gwp6cSlT0w
 zoP7k/PilvAY=
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

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoid methods that only exist on the latter.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/drm/device.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3bb7c83966cf..4a51909ccc76 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -83,8 +83,8 @@ impl<T: drm::Driver> Device<T> {
         major: T::INFO.major,
         minor: T::INFO.minor,
         patchlevel: T::INFO.patchlevel,
-        name: T::INFO.name.as_char_ptr().cast_mut(),
-        desc: T::INFO.desc.as_char_ptr().cast_mut(),
+        name: crate::str::as_char_ptr_in_const_context(T::INFO.name).cast_mut(),
+        desc: crate::str::as_char_ptr_in_const_context(T::INFO.desc).cast_mut(),
 
         driver_features: drm::driver::FEAT_GEM,
         ioctls: T::IOCTLS.as_ptr(),

-- 
2.50.1

