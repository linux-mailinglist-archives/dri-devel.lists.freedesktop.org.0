Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D7E6C8564
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 19:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7D510EC36;
	Fri, 24 Mar 2023 18:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E12C10EC36
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 18:53:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id l27so2784154wrb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 11:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1679683983;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AvFmi2Kslfzz8p7RlnVaanV9PDS7ezg9eJoTmpzeqLU=;
 b=c07BLeBXy4v+Jc465zDUVlUJBuC5ZwPChTA8jtt0ZZeABDsPCZpd5nBIS4OCup4Yjf
 UwUpftJYbvFl1pRFjZGVkBkX6LvzVRxEM1ElKLtrW9wR26l1H/CeqrjcLbozOCqODl3u
 TVIMf2uGghQQZbslcE/eUNKTlwqpTciEiQK48ujsPEmb4gUpbWFW9Le7O5ITX2FsOZIO
 hM8x7cUpML8bew+QgZUnRgXKLkR6woc7c0mdA0syeR+HTHGeq0svX9ozha0YHVCbsqqz
 c68DWjMH0gyew9uW+GaIyr/0+nZQHp9MWxGgB28kaQGGDXgL0rzETXCKgW1Seqn+8apg
 gc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679683983;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AvFmi2Kslfzz8p7RlnVaanV9PDS7ezg9eJoTmpzeqLU=;
 b=heLg2Tqmf8jpfWVdkPQ05UaUxlnGsdZb9N1GKLFQqzPROvVte0ndStY/UMmGl9DKfF
 6kDL56pDv+MQ2Mqo8RHkjOahq8+xeE2JFvY0qltYcsSMy18RQE3Zv5hSjKXkPjKIJZLo
 o2YQp81Zqhyx6xHMyZpVhkpHNhRFMKUEQFkBnfNJLVQSj0tkFPa3I4vk7L0fWaeObJ3m
 06r+Gx9hBo36inMui+vas4Kx9FF0b1L3czj/PCzwJ8xXufdva9W5tLKzD7Dyl0OJoyVK
 vpkUp9kgspnzQfUW/2HKfTvtOBntu6O5Qf6CKbENaJSUiZXHoOCVTm5VAKr66gQitVh6
 wj/Q==
X-Gm-Message-State: AAQBX9f6ExJM7SpGDjoKYdaLY3sKlmxOEqWLASQk9LPkRygpKs2300GM
 N87syZUgIrRaCyj8n2KpJc3xzQ==
X-Google-Smtp-Source: AKy350aaqrujAr8UEyTGBmBkvY/sH6CnI1gpgbAxu5Uxe5DRzA8XLPJkFulS9IB/6lu4GhcM84lq6Q==
X-Received: by 2002:a5d:4d51:0:b0:2d2:20ed:b572 with SMTP id
 a17-20020a5d4d51000000b002d220edb572mr2900719wru.69.1679683983636; 
 Fri, 24 Mar 2023 11:53:03 -0700 (PDT)
Received: from vdi08.nix.tessares.net
 (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002cfe685bfd6sm18948878wrw.108.2023.03.24.11.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 11:53:03 -0700 (PDT)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: [PATCH v2 0/2] docs & checkpatch: allow Closes tags with links
Date: Fri, 24 Mar 2023 19:52:45 +0100
Message-Id: <20230314-doc-checkpatch-closes-tag-v2-0-f4a417861f6d@tessares.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3xHWQC/42OTQ6CMBCFr2K6drQFEXHlPQyLaRlpI7akU4mGc
 HcLJ3D5vZf3Mwum6IjFdTeLSJNjF3yGYr8TxqLvCVyXWRSyKGWpTtAFA8aSeY6YjAUzBCaGhD2
 oulS6qqvqrJXIeY1MoCN6Y9eGwfk3H1/IieJqj5Ee7rNN39vM1nEK8bs9mdSq/jM6KZCg9KWUd
 UENNnhLxIyR+OApiXZZlh/fVtDi5AAAAA==
To: Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
 =?utf-8?q?Kai_Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>, 
 Thorsten Leemhuis <linux@leemhuis.info>, 
 Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=hBQXRTLnt2/M7PhMUp0rgb64b++zS9LaDQGwBm4DXUk=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkHfGOqPllO3g+/LlSkRIxkaEoUAWKI/DGZTOyA
 OG7ny0LP+CJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZB3xjgAKCRD2t4JPQmmg
 c6pEEADBh4OrKeURadfB2zkHoNq4wee35N1D+2057a2iHhcB1hiM3S2kApDgLJT7hynAlg/oAP9
 KlAnaKcqrAaVAHJ2/bDkMurl/i5AHzwEv5XJxjNlat3DHM6oUir4ZC+bhN2sJEgxxztkNz7z8Ep
 E5JyHXxZYBDRYCmC5JbTdyH2x2C7fJ28gq1rX8qDj8aCz1Mu8SD02XchIvh0pSudoHrdxOToSdF
 1Wll+rDDjZgWfuynGhfEm4MJVb/Y4dDVkYpd02k/lBjN0x5E++eJIWTyikPaSUnCa0uo6btxuqP
 98UATAXCIroa4QZD6YBI/T2fimEsR9cMkoEpohyyk3fMN3cY5Xy7gpvY9rtgO8B7liueMS9xSiW
 FhobWVD+ZmE1QBpf8TgeaUEvbeP151YtoqMYckOu5n/QugOlD5Y+0qDj0xJUFGsbeJlg4VmVyw4
 XeB7Cjw5LxLcMT2uk2ceesqaSNri9W3KZyYmsIYCV1smTTMbiEgXTCJbf+wjvWZQfQJiAY8D9u2
 ewRwaSW54k3pjbr/DQtcM4TLwzHBtQi54gIREfOOSHHZKOBVRtwA+jKGNM82i/sTb3amiQqViwi
 Cay1VAHjyqQHDSVhe9lM06Pp2brytPsAb8osq8mBknAIW10PfZwJcThF9512YMiFK4dK07bcmRv
 QVIriidmpXtGF/w==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073
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
Cc: Matthieu Baerts <matthieu.baerts@tessares.net>, mptcp@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since v6.3, checkpatch.pl now complains about the use of "Closes:" tags
followed by a link [1]. It also complains if a "Reported-by:" tag is
followed by a "Closes:" one [2].

As detailed in the first patch, this "Closes:" tag is used for a bit of
time, mainly by DRM and MPTCP subsystems. It is used by some bug
trackers to automate the closure of issues when a patch is accepted.
It is even planned to use this tag with bugzilla.kernel.org [3].

The first patch updates the documentation to explain what is this
"Closes:" tag and how/when to use it. The second patch modifies
checkpatch.pl to stop complaining about it.

The DRM maintainers and their mailing list have been added in Cc as they
are probably interested by these two patches as well.

[1] https://lore.kernel.org/all/3b036087d80b8c0e07a46a1dbaaf4ad0d018f8d5.1674217480.git.linux@leemhuis.info/
[2] https://lore.kernel.org/all/bb5dfd55ea2026303ab2296f4a6df3da7dd64006.1674217480.git.linux@leemhuis.info/
[3] https://lore.kernel.org/linux-doc/20230315181205.f3av7h6owqzzw64p@meerkat.local/

Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
Note: After having re-read the comments from the v1, it is still unclear
to me if this "Closes:" can be accepted or not. But because it seems
that the future Bugzilla bot for kernel.org is going to use it, I'm
sending here a v2. I'm sorry if I misunderstood the comments from v1.
Please ignore this v2 if I did.

Changes in v2:
- Patch 1/2:
  - Add Konstantin's Acked-by: even if the patch has changed a bit, the
    concept is still the same, I hope that's OK.
  - Mention "public" in "5.Posting.rst" file as well. (Jonathan Corbet)
  - Re-phrase the new text from "5.Posting.rst". (Bagas Sanjaya &
    Thorsten Leemhuis)
  - Clearly mention that private bug trackers and invalid URLs are
    forbidden (Linus Torvalds).
- Rebased on top of Linus' repo.
- Link to v1: https://lore.kernel.org/r/20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net

---
Matthieu Baerts (2):
      docs: process: allow Closes tags with links
      checkpatch: allow Closes tags with links

 Documentation/process/5.Posting.rst          |  9 +++++++++
 Documentation/process/submitting-patches.rst |  9 +++++++++
 scripts/checkpatch.pl                        | 16 ++++++++--------
 3 files changed, 26 insertions(+), 8 deletions(-)
---
base-commit: cb7f5b41f8341148050fe63e27cf52aa4f1519ad
change-id: 20230314-doc-checkpatch-closes-tag-1731b57556b1

Best regards,
-- 
Matthieu Baerts <matthieu.baerts@tessares.net>

