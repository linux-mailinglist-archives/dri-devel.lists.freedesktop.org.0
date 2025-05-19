Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5264FABD06F
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A3D10E15E;
	Tue, 20 May 2025 07:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PmWcf9Sg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A43910E157
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 14:38:44 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-70dda931089so3950987b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747665523; x=1748270323; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=B3qOF+M7Ch0i4fooYuNBrA3XOJQM5eyS/FImXYWj+vg=;
 b=PmWcf9Sg2Kb1U1l3Nis7lM9mdzP61YAPXXXaalAHmLdOUD4r2nBkXELpqMixsyvS/w
 7cNpWtfwF8iMdOxmeIuHTZ5tmLAGeC802fhEQmdIJsAN4epVDb8BzzXPM1CXx/xD+Mje
 xyZJehkZhJwNQMIl4coDd5kpPvk5iV4anD1+i0Cgjd0yQvyoHZxHCpTPX/+dEKCN4Klj
 H+XQoiXEdGdVHin9yxOKt6TUbelG4WmG8pjr+qfLX7SH/vlN5FFAkJCGwX22Io+h7qgN
 neLAHhnx2mas+c8ZV0eiRZnwUFwXwDbSzMY4DlwCB5PShY9ALwBxQEDrsYQXpI8Dx+jK
 hXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747665523; x=1748270323;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B3qOF+M7Ch0i4fooYuNBrA3XOJQM5eyS/FImXYWj+vg=;
 b=aJoURF85G+pB1zAOmpdHIC4V27rpWNVQzMkvhWapSl4ufMJxGl5Hnt0P2C9SUg/8D6
 VvDxK7nw7rZaPCw1dhQuAYjhQcAIQ2sUPw+Jkam2GqNxlTA7N/DZnVtAXX+C5tAkudnP
 wM9scV42/1n8StRElWP+nN7CszStsPeiR/SjRKJfGyIRhLwzr6fdB3XihLCyAyWa+qap
 ev7lV5WW+Z93DbrK9uIdW81u3CJcJv2+HoVYhxJjXXzWu0ae4OSloB2dcusUZXRuZgXX
 /53tqzYkb/qVlQpDX5ACuGmFN5rO7MNzWE9Uo7E6OebAPTnCnjnNnnaHgMTUlAvzF2O2
 oVCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlTwCMr3DlSWZSy/4S/zem4N/TouddUA9T77NMsrsnb0VUttQB+TMmorKhpzh7VqILh+FmLF6peJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqYg6MvXx8bkdmgrsWWxY9bYJPbOXjS18hNJwnGGI16g+DEO7J
 cBBGj2vDk5ajGIZOgch1Y9fwVmJgASTVemo2RiMC87abBIb8iHdAY4In2PAAZLKgQbPyE1pm8Nj
 u9z9xnFcjbD5n7LDhlGQligCnMFE096U=
X-Gm-Gg: ASbGncsHuagrmKBfkGfnbr0qYC3MwRGD0RL1ojVOS2DGCJXILxPk0TrorlAcm/tfBwQ
 sJPfAAoOUxCF6bswCLMJuaIDs1bsLMY+Gjgy6FtiDqIhXGK6kcb8DyI1+tSh5OBU/jlt+O1R0Vn
 N02+v7FBQ6dUzO17vNUdhspPBS7/icTU99syQmu8TTX22v0CoMZU5cTJR7tLQ0lRj94T4edGb48
 Vqp
X-Google-Smtp-Source: AGHT+IFk5/+5g0ye3KpfT6RelFgI8xwRWLH9RkkT7WSS6xIhQSDbLLRhgs5g/GJ0CDL8x9INyAlpDVZv/QVe9HXeDvk=
X-Received: by 2002:a05:690c:4b8f:b0:6f9:af1f:fdd0 with SMTP id
 00721157ae682-70ca7c50638mr193640087b3.31.1747665523438; Mon, 19 May 2025
 07:38:43 -0700 (PDT)
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Mon, 19 May 2025 20:08:32 +0530
X-Gm-Features: AX0GCFtZ21KnSBYLwwstp7iu2VM-pnzZgRbPcbW3bS7zlruRQ1KqfAq9Q5Ozqg8
Message-ID: <CAG+54DaA4ni5g26AFKGe76-AgFeMy4GUVopgMQukeaJ_bPWDRQ@mail.gmail.com>
Subject: [PATCH] Documentation : fb : sstfb.rst : Fixed spelling mistake.
To: deller@gmx.de, Jonathan Corbet <corbet@lwn.net>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 20 May 2025 07:31:11 +0000
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

fixed document with spelling mistake
changes made :
1. "tweeks" to "tweaks"

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 Documentation/fb/sstfb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/fb/sstfb.rst b/Documentation/fb/sstfb.rst
index 88d5a52b1..6cefa974a 100644
--- a/Documentation/fb/sstfb.rst
+++ b/Documentation/fb/sstfb.rst
@@ -192,7 +192,7 @@ Todo
 - Get rid of the previous paragraph.
 - Buy more coffee.
 - test/port to other arch.
-- try to add panning using tweeks with front and back buffer .
+- try to add panning using tweaks with front and back buffer .
 - try to implement accel on voodoo2, this board can actually do a
   lot in 2D even if it was sold as a 3D only board ...

--
2.43.0
