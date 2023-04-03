Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C546D4D7B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0356810E50A;
	Mon,  3 Apr 2023 16:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B887310E50A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 16:23:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id o32so17449105wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1680539029;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E841ISFmhdikW8veVmziJDv7bwLBR4jkaGT4dRFLTmM=;
 b=wqswj6Sj7OxB5slUYnbQiBGf7pcDxzHiUAiu4HRxJCGMrepldM0RavmChoH7Yz890K
 4fid8IFvZbdlfJPjI6sHWSjXFkQb58n32OM7Sh6hnhdhfjtuwlfMFIW9Ou4gnvQ4VB+j
 8IqM2SJCnv91z6hjNlhmXa04eRLjQgcpgMl+qBn5K2whrIk12/AQ2XLRFcPquH7wp0da
 sNxcKUg035BTn+K1At55esFQFrJCOf9aLS2b/MwSnvtBGcrd16WTPV8RhoO+Anr78hw3
 k0SpdwRMk2l2XWh+NFtUnndM2uZQfAOQP3Ji8k+t2OVUIoEWmXPFr8aWKWu70U3jvPgi
 jjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680539029;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E841ISFmhdikW8veVmziJDv7bwLBR4jkaGT4dRFLTmM=;
 b=8O2qGSn+Vp0ti/WGJSogZeBXDKIqaeBSLNuVBKGG5TznnWAwbxTvqAFK7sZs1783Aj
 UC86znkp80fIwgi1FCjC33m9OfmPPCqdal2zo7lFCIASvqRVXxnNl4J8se+r4ZV+xHJN
 K302/5VoV2weGJ1gK53Cwp0y9NZSjMzkqgPoVORTGyoc3mlxRGA4di+j4yFq/ML2ZWuk
 M0+oTdK9+CRjm0nz3b8SZ53y374wj6w4HNMPxSJ4Jae24/26Gyxn/Tg6/mSzGtvJavwb
 WJgMsJfHmacYvmGadm/suWjzZZ+nHclwLnZaUEMtYiYddPqPZclzIC4AN9VIjlUoMkes
 sMZA==
X-Gm-Message-State: AAQBX9dfky0beWLRewcBXQPiJAHaaoyA6w7Ix7cdo5YIsautaveeskzd
 pEiFLTCzuLbn+mTzZIMKrHBCcw==
X-Google-Smtp-Source: AKy350YHy5UArO/gmMWF3Z2Gsjf/gCwD3P/hKgpl1CystEdDr97kxH1E/CoSevABZ3vGj4OE60HHCw==
X-Received: by 2002:a1c:7c17:0:b0:3eb:39e0:3530 with SMTP id
 x23-20020a1c7c17000000b003eb39e03530mr8611wmc.41.1680539029403; 
 Mon, 03 Apr 2023 09:23:49 -0700 (PDT)
Received: from vdi08.nix.tessares.net
 (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c45c700b003ee2a0d49dbsm19829116wmo.25.2023.04.03.09.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 09:23:49 -0700 (PDT)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: [PATCH v4 0/5] docs & checkpatch: allow Closes tags with links
Date: Mon, 03 Apr 2023 18:23:45 +0200
Message-Id: <20230314-doc-checkpatch-closes-tag-v4-0-d26d1fa66f9f@tessares.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJH9KmQC/43OwU7DMAwG4FeZciZQJ22zceI9EAfHcZeILZ3iU
 IGmvjvpjohDj78tf7/vSrgkFvV6uKvCS5I05xb6p4OiiPnMOoWWlemM7Sz0OsykKTJ93rBS1HS
 ZhUVXPGtwFvzghmH0oNq9R2HtC2aKm3BJ+UteriiVy7a+FZ7S96P6/aPlmKTO5efxyQLbdE/pA
 rrT4I+2c4ZPeMK3yiJYWJ4zV7XBi9mNmYZNPfbgjiNMY/gHs7sx27AAPtBkgRzQH2xd11+8MRZ
 yfgEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=0RP36hifT0KwybB2xAVif6HIHF0lZc8UPp6cjui9F1U=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkKv2T3N2a4Z8KjSF9P80Pqivkyx6Uum+l6DjOy
 q8dSYXIw3GJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZCr9kwAKCRD2t4JPQmmg
 cx55EACT3p2scRebAISag6Axflm7qLP3qvV6LJ8j00BebIZ2VJxMPl+B8ytiPj0LytRWucJ6/zc
 ifm1ejrc/zQw8ihSzBYCs2fyE5QNNxlu2ZmLiqKqg+/b1w9oAjRm/GnZJtrr0LbFoag9IN3FioA
 Wu9wb9KHEHZjiOZhjazkkUYWAaCYk1SnHa2c0ptgUU+3Hj/uQeFL5D/oUe8KcW/rsaxID8/7LIK
 pZ7tB29Jn3rP/MP5eg+Rn5fZuWXKLfSZKb0e38/WCr4JkGTGBvxwnd/QAlugn4pL/pYGd2xQBKS
 l3Sqpm99OUjmuigxyj4UQggVAA3IDK/38K5t+u45eaNeLui9Ug7Fn9nIyjOfTshbRMYGIlmhfyg
 LMD+9meoQcoNrM/09elq9vnTn1twB2jDp8MVaM0KMMU/LIfV7D9GlKzaCyYbYXA7raCBAVqt+MX
 H65pBQ30bzlwJj5tTzaQZ6poRLif3AMNWMJw7P7ZIYEtZWyl2zFe7DJ8vGyx9Q//gZiHviaFKvZ
 TbedcTLa6dttig7P0QRUCPoJGdudZUekuj1keJ2J70Q8vgtVlwnkTSBxkstbhClKrtBHM0XsLMN
 HGLg9AFa6xS8XW+/inYu2uuR0x+CFrPxXLo9gHBqGoW1WFFCWJ2bR3i4n5QQhuoY+gM/OwEQTu3
 WQ8OTHBQd+nHEcQ==
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
that the future Bugzilla bot for kernel.org and regzbot would like to
use it as well, I'm sending here new versions. I'm sorry if I
misunderstood the comments from v1. Please tell me if I did.

Changes in v4:
- Patches 1/5, 3/5 and 4/5 have been added to ask using the "Closes" tag
  instead of the "Link" one for any bug reports. (Thorsten)
- The Fixes tags have been removed from patch 4/5. (Joe)
- The "Reported-by being followed by a link tag" check is now only
  looking for the tag, not the URL which is done elsewhere in patch 5/5.
  (Thorsten)
- A new patch has been added to fix a small issues in checkpatch.pl when
  checking if "Reported-by:" tag is on the last line.
- Link to v3: https://lore.kernel.org/r/20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net

Changes in v3:
- Patch 1/4 now allow using the "Closes" tag with any kind of bug
  reports, as long as the link is public. (Thorsten)
- The former patch 2/2 has been split in two: first to use a list for
  the different "link" tags (Joe). Then to allow the 'Closes' tag.
- A new patch has been added to let checkpatch.pl checking if "Closes"
  and "Links" are used with a URL.
- Link to v2: https://lore.kernel.org/r/20230314-doc-checkpatch-closes-tag-v2-0-f4a417861f6d@tessares.net

Changes in v2:
- The text on patch 1/2 has been reworked thanks to Jon, Bagas and
  Thorsten. See the individual changelog on the patch for more details.
- Private bug trackers and invalid URLs are clearly marked as forbidden
  to avoid being misused. (Linus)
- Rebased on top of Linus' repo.
- Link to v1: https://lore.kernel.org/r/20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net

---
Matthieu Baerts (5):
      docs: process: allow Closes tags with links
      checkpatch: don't print the next line if not defined
      checkpatch: use a list of "link" tags
      checkpatch: allow Closes tags with links
      checkpatch: check for misuse of the link tags

 Documentation/process/5.Posting.rst          | 22 ++++++++++----
 Documentation/process/submitting-patches.rst | 26 +++++++++++------
 scripts/checkpatch.pl                        | 43 ++++++++++++++++++++++------
 3 files changed, 70 insertions(+), 21 deletions(-)
---
base-commit: 7e364e56293bb98cae1b55fd835f5991c4e96e7d
change-id: 20230314-doc-checkpatch-closes-tag-1731b57556b1

Best regards,
-- 
Matthieu Baerts <matthieu.baerts@tessares.net>

