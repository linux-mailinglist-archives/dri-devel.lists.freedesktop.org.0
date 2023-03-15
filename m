Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B20E6BC7DB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 08:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E70510EC46;
	Thu, 16 Mar 2023 07:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04DF10E1F3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 17:45:22 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id bj30so14744492oib.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 10:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1678902322;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XbXR+MjoDmPAizTkfTnxPiWP8P/tJvfSr2s65nMsZqY=;
 b=WdyWMHScbp9Xscv//tjFxd6LrZkacdhlW2taPvmIPyNNikiY9hbbXOLpUC/ziDPp1p
 BKuUXuQY15cEvaI8fR5JVWDQUoAKPZ6Akxhx47/75NiyAeGiqMYEB0Ez/zmNalVStZ8I
 osPXpio6OnbrZuItrH1SrZI5ql4Zk85zm4KBABF84mmK2IBN30ch/4DV0Hdd/z8qfFI/
 W15yHhkhhuzFjwiB3F3a+wcCvSNsTFqby8z/X0cZ3DNklpIXoHCOnHr0XSLvuromnFnl
 jCtZwCrs/ZWXzbdjO2bNO1FX8rJw2RvapzRAoZ/RYyb9WRPmRJ9Cdwt3RoUcwRHsZnqu
 NJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902322;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XbXR+MjoDmPAizTkfTnxPiWP8P/tJvfSr2s65nMsZqY=;
 b=qzq8Xf/3d6rLA0/apNWtj8RCZIPGDCpAUYnwI5c1xgq9dYaXWbm9mH3NaTD4kc2Gup
 peOgMUP6VClANXGfKLpsoG3A7wRfCSuYgh2AiXBb6w7aBYQym0Qfe3pzUJhaMjtBxL3Y
 c7yK7hmvgrawmhaXlQypw2LdDGkGeehp2SpnOwamDRcwWejFI2aBfZYRQCV3nGEXmMwO
 04eDc7d+vNjr+Jmr1DkFd4PVsbotPfxnVy381hbwefMHr4BHIMyZ9k+fxfuv4DQ+7/d6
 O1VNwB7Y5oGHy9Fj4dxm5kt6EoQD5jWCBKxAvVCAzNTLtACKYCvGb5ZZBHhLurW794zN
 wTZQ==
X-Gm-Message-State: AO0yUKVgQVVVruhisKWvO1vTkPvDI6kyLOXYU6nJrYzb5c7Snu2AIZqJ
 nQNhJ/92neQOg1MEiXEV84SXZg==
X-Google-Smtp-Source: AK7set9NV2x9y+GkGJZOb0QoGgHxjSzj3K+eMaORMr1duB+i1vpc6e06R9xucAwV+fVQMHW6/CFobg==
X-Received: by 2002:a05:6808:f8e:b0:386:b205:b415 with SMTP id
 o14-20020a0568080f8e00b00386b205b415mr832314oiw.27.1678902320800; 
 Wed, 15 Mar 2023 10:45:20 -0700 (PDT)
Received: from vdi08.nix.tessares.net
 (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
 by smtp.gmail.com with ESMTPSA id
 p81-20020acad854000000b00383f0773beasm2381095oig.52.2023.03.15.10.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:45:20 -0700 (PDT)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: [PATCH 0/2] docs & checkpatch: allow Closes tags with links
Date: Wed, 15 Mar 2023 18:44:55 +0100
Message-Id: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABcEEmQC/x2NQQ6CMBBFr0Jm7URKrSRexbBoh5FOxEI61ZgQ7
 m5x+fLz/ttAOQsr3JoNMn9EZUkVzKkBij5NjDJWhq7tbGvNBceFkCLTc/WFItK8KCsWP6HprQm
 ud+4aDFQ/eGUM2SeKx8Ms6a3nl9fC+ZjXzA/5/tP3Yd9/JVpXkooAAAA=
To: Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
 =?utf-8?q?Kai_Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>, 
 Thorsten Leemhuis <linux@leemhuis.info>, 
 Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=S4QdlcgcJK/4Mz8o8bruRwWYP04OwIm5qBApGBf8A0w=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkEgQpOQ9q4VkUr92LeGgSLNNgqxMvZxOIft+MX
 m24Y8IEH5yJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZBIEKQAKCRD2t4JPQmmg
 c72fEADucBwquyZjRF+v38GZLT3Qn6ewlj9qTiDJlTvLo33bawpwcQAIp1HYODGXKV0QLsPfk8s
 HN/O4Eyw2Blk5zzITvNipIazHhHmLN67T6RcA9OqhgxA0nUxWWZwQNFlNug3tRr1o6OdBpEExAM
 TrKVefJvedVZEa9Zp/ZbNzLRpcl/PR3xTuUM0AlPVyqeUDdtPmTbjyZ/SrFnwiDO6vpKDMqwPts
 oFWDgYJTPMxK1QpbRYgJ79wLSJMmd0KLt+Mhy1w8lMnMgUgjz+CSlhAwQ0pOOVFMBC5NhiP/Cb3
 PIHwIsVlav0EWxpLT39cF94O+BaP42mML6ufekC1wpkh8jKoJw2OKfXM60Lc7fGQK1rHJf9Vw+O
 G6By7w7NwDwEdKct0sA9DRgmqIWOh1CkhvO+R98MBEIp4y3wsrK6UCVUOYf5nicS373i+fLNnkJ
 8kyWVsoODtIzntj8YJtxEQ05NGesIGmbV+PKRdIUt4QCBitZtnpjbH2889Jo9zoiMPXMnR88u+A
 7ndHV87WEmpDpiS9QKFJEVmJNb0xv0t3ZzhruNk4xKeSWrOpxZg85kNmud7dPhftm8Tw1WsBWtd
 B/iIOTdSrtDGj0EwY+wqPTzzqPJ9MLpxbVkTugJ8N/CjQuO0v1HGesMFvikb+alj7Qf6KquE/dc
 jaD1XaRTQkS3vTg==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073
X-Mailman-Approved-At: Thu, 16 Mar 2023 07:56:01 +0000
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

Because this tag is used for a bit of time by different subsystems and
it looks like it makes sense and it is useful for them, I didn't bother
Linus to get his permission to continue using it. If you think this is
necessary to do that up front, please tell me and I will be happy to ask
for his agreement.

The first patch updates the documentation to explain what is this
"Closes:" tag and how/when to use it. The second patch modifies
checkpatch.pl to stop complaining about it.

The DRM maintainers and their mailing list have been added in Cc as they
are probably interested by these two patches as well.

[1] https://lore.kernel.org/all/3b036087d80b8c0e07a46a1dbaaf4ad0d018f8d5.1674217480.git.linux@leemhuis.info/
[2] https://lore.kernel.org/all/bb5dfd55ea2026303ab2296f4a6df3da7dd64006.1674217480.git.linux@leemhuis.info/

Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
Matthieu Baerts (2):
      docs: process: allow Closes tags with links
      checkpatch: allow Closes tags with links

 Documentation/process/5.Posting.rst          |  9 +++++++++
 Documentation/process/submitting-patches.rst |  7 +++++++
 scripts/checkpatch.pl                        | 16 ++++++++--------
 3 files changed, 24 insertions(+), 8 deletions(-)
---
base-commit: 6015b1aca1a233379625385feb01dd014aca60b5
change-id: 20230314-doc-checkpatch-closes-tag-1731b57556b1

Best regards,
-- 
Matthieu Baerts <matthieu.baerts@tessares.net>

