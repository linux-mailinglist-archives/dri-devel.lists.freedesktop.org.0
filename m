Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3933B308DB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 00:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD7D10EA1A;
	Thu, 21 Aug 2025 22:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KkrdpSJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com
 [209.85.210.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D2C10EA18
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 22:00:58 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-76e2e8e28e1so3715304b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 15:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755813658; x=1756418458;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=4cLlpuHdBM/UdMtUWDBy4/i+9L6ubcblOqSNe/mP7/k=;
 b=KkrdpSJf9GynGDMDP4YV0EdRsafyZDsVtcFcTYJnIQ6Zk0TVGZ8uLbuggvMjM3MVhx
 fePXE8idRxBJvMntr3NOfwR6C9w02a3N1fhN+8GWZ7LJm7ghulrgsF1B8QtYzjE5rQum
 jTAHinYfnLjDV/Dmdh76z1HYF8nNE1H6Ml3NFUAd/RR754a6CExEhhEirCL4UfYg98D3
 KDg7BXT0r7auHWeQt6WnxfGg01GXFp6p66mhxOyj+ScZ6AmgDblyS7L6o/+11puFadX6
 Iidgh0MnBkPmTls7GdBAuBhr16/tvLWb9fGc6qketJM7ostJIGiV4kLb92TG1WozDCLJ
 W2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755813658; x=1756418458;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4cLlpuHdBM/UdMtUWDBy4/i+9L6ubcblOqSNe/mP7/k=;
 b=b5fsgW7c+Myky68dU9htDqNQx1cqBF/9uEwqImAoFsPPpJ2pdkWBU9ucIocAy90Nk2
 lo7DRUgbHcwRQpxb+lySGAyBT7KBVi+d2GmO3/LmS5L2hCKirXlhw9vTVEf8IZweohQw
 i59PBhi1ZlyCJ9xXVZ0m4ebWGBoA3Y76DORidHgct8zkcanHQXj7NPOBuZa3cpaz637J
 yI69wt6dY7gWxPUEJ4McloXTKRmpIcKdrMVBjczV/G9J4YU84RLYO34Lj4mP+mx+nnUj
 Pl2r+uIatNLazfPPPDmMirUGcbnAXIW0HTeWam0wjV84bAiAeWcCcV9hNHPIeW0Of+PL
 5oGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOtsSOHN8EzIrvlVj1L3Inqt8maNGpCwQqkKgouiYr6GxsppZInIiCNW9LOo/QO953hzQ0udY3SDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5gHo+rxVUlt32wjmHGcvvcyYuf+p50k/ePeF9I6vR8wBvNIRT
 n2wJjpyQ9iACSlzkgx1FzYE6Tdc+YNUr9f14q/J9lV0w/o1hINvM7x6EJBtSPF9x0qOM6I4uCr8
 vHG6QXyIOXyFtWA==
X-Google-Smtp-Source: AGHT+IEAbdE+rBrrN9gQKjiTu1VWCSa69pr7H1Wqyou0ZlgqSmruqcwdp3/7Db/srMjoEdDP7SkVIJMHghXH9A==
X-Received: from pfop21.prod.google.com ([2002:a05:6a00:b55:b0:746:1931:952a])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3d0e:b0:76e:885a:c1cd with SMTP id
 d2e1a72fcca58-7702fc472d4mr1141804b3a.31.1755813658055; 
 Thu, 21 Aug 2025 15:00:58 -0700 (PDT)
Date: Thu, 21 Aug 2025 22:00:53 +0000
In-Reply-To: <v5j6nxynzvvlcxu3m3mkeyjv5dlozzp7ixkgc6u6hdzh7en6jh@zvzqm5n7njfd>
Mime-Version: 1.0
References: <v5j6nxynzvvlcxu3m3mkeyjv5dlozzp7ixkgc6u6hdzh7en6jh@zvzqm5n7njfd>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821220054.3700783-1-cmllamas@google.com>
Subject: [PATCH v2] drm/xe: switch to local __basename() helper
From: Carlos Llamas <cmllamas@google.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 "=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matt Atwood <matthew.s.atwood@intel.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
 Carlos Llamas <cmllamas@google.com>, Tiffany Yang <ynaffit@google.com>, 
 "open list:INTEL DRM XE DRIVER (Lunar Lake and newer)"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Commit b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
introduced a call to basename(). The GNU version of this function is not
portable and fails to build with alternative libc implementations like
musl or bionic. This causes the following build error:

  drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:12: error: assignment to =E2=80=98=
const char *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer=
 without a cast [-Wint-conversion]
    130 |         fn =3D basename(fn);
        |            ^

While a POSIX version of basename() could be used, it would require a
separate header plus the behavior differs from GNU version in that it
might modify its argument. Not great.

Instead, implement a local __basename() helper based on strrchr() that
provides the same functionality and avoids portability issues.

Fixes: b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Tiffany Yang <ynaffit@google.com>
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
v2:
 - Wrap changes in a helper function per Luca's feedback.
 - Fix typo in commit log: s/avoid/avoids/ per Tiffany.
 - Update commit log.
 - Collect tags.

v1:
https://lore.kernel.org/all/20250820201612.2549797-1-cmllamas@google.com/

 drivers/gpu/drm/xe/xe_gen_wa_oob.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen=
_wa_oob.c
index 6581cb0f0e59..c18faccdeb90 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -123,11 +123,19 @@ static int parse(FILE *input, FILE *csource, FILE *ch=
eader, char *prefix)
 	return 0;
 }
=20
+/* Avoid GNU vs POSIX basename() discrepancy, just use our own */
+static const char *__basename(const char *s)
+{
+	const char *p =3D strrchr(s, '/');
+
+	return p ? p + 1 : s;
+}
+
 static int fn_to_prefix(const char *fn, char *prefix, size_t size)
 {
 	size_t len;
=20
-	fn =3D basename(fn);
+	fn =3D __basename(fn);
 	len =3D strlen(fn);
=20
 	if (len > size - 1)
--=20
2.51.0.rc2.233.g662b1ed5c5-goog

