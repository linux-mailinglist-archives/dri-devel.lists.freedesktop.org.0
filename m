Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 125AF6D0D80
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 20:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2991C10EF6F;
	Thu, 30 Mar 2023 18:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EEB10EF6E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:13:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j24so20033005wrd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1680200027;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kWvu93s3B9VjmqDMiiXdedDGk5MrX3CFDculOGxbOWA=;
 b=sli5Zcnh9i3zNFg0OD4NJPjzj5UPngZ7yeiqMMUves6L/8ZJDHVNC3ONaZ0AIC5yTQ
 QPj6iYADmhwpApfEAzvdNjYd2EusisdpRaAUcu59P0Hmt6hV76sU2XaBlk9e/ZQqDa3o
 9Blb/mtUqXj12HRbpXYfuM9xIjrpZP8IcSjfV1pAcqGNjBTp5jxqJdU2R8MdycMnWRY7
 tH+KHrdlazlSAzTx2p2hgMOAOFMAZJIxesKhkQpBqmZx5kB380/W2iFcH1EFauzVNA98
 wxewA9SGDs0AxubFXATsh0YzLUsHTtS08CB3oq4pTm/vPZLaoGMM6ASZV/utCcpaYZkP
 i9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680200027;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kWvu93s3B9VjmqDMiiXdedDGk5MrX3CFDculOGxbOWA=;
 b=6XiWdcYsPgY6l9WJVor0+h+Jm0531yJdK5J//K8I+3yq2UNKIBcxFeDYkiu7HErUK3
 dgtKT5spdKGuhNcKdYMJSJAAi3m2fJsIwTcqDj9+r+pzM0ZPvYpPGBl5Amb6CfPMyDa5
 DV1s1nj/Rj8gJXgY1gLIiIVFOtxfLIAsd6CjThggySME80MN4/xlxWTQMSAJNLqk8vS2
 havWO/Yhs8KkFDuibfl0N70+Fi0LncQJ5D/ToZeLWYToDz4xLK3PrVX40bBR5CK8i+BV
 bBAbTlTMAUx0yWUTcphuGfIDJufYY/YjWdMho2OakwlaMO/hl0EGg95gx/VzxRdEqs3K
 uQcQ==
X-Gm-Message-State: AAQBX9eNQddzG2xI5hFXQIIPk2TOoN98LlbEVSoEPff2ik1aSkiFcz7J
 iUvNK1C745atnnXrWp1hTMNIWg==
X-Google-Smtp-Source: AKy350ZWc8tsaoQuJAI+JCJF8FIO6JAnNbN0LzQ0c1I4PsoO/4NA4M+PeruUOstds4qYABCZ9NPt5A==
X-Received: by 2002:adf:fc8e:0:b0:2d5:39d:514f with SMTP id
 g14-20020adffc8e000000b002d5039d514fmr19572798wrr.65.1680200027085; 
 Thu, 30 Mar 2023 11:13:47 -0700 (PDT)
Received: from vdi08.nix.tessares.net
 (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a056000121200b002d24a188b64sm33459741wrx.112.2023.03.30.11.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 11:13:46 -0700 (PDT)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Date: Thu, 30 Mar 2023 20:13:25 +0200
Subject: [PATCH v3 3/4] checkpatch: allow Closes tags with links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230314-doc-checkpatch-closes-tag-v3-3-d1bdcf31c71c@tessares.net>
References: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=D3yoDenjNEV/KCtG0U0EPfT8PJhrudmfXIcKaZcGmXw=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkJdFWQocAajiRNqyFvXj5qo4/2Z8WWqi1nIZBk
 5QwkcAZ+n+JAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZCXRVgAKCRD2t4JPQmmg
 c9SgEACJgEzspH+uZoG/13hgM9PKxSlrJyloUsc7rMZyyotfkMCSrhRetdU39HLP0ov13RMhD7x
 HyTbtXG6yJcsIyrNO7E1sjh/VsWLuSRUNc88IRngD4gPFXZ9dYSOxP8xhg8vSW59EmXi4eHVEW9
 FvharwxCLiaMfgbpEn6oKbgTv+5f9O5jJZ8In6M1fGvK8FPXd1AZc8fIrIQrGumKSK+SxUDP4z6
 8+cx1flxxcXVJHy63snCsalNGkWNj03Fea9dLRaGGQn5YcWjeUcO5wr9JMNLsb9ab6alLGgWzwr
 yvf2tPBVjV3FMEWfYBRqDEhYtXdL857Nzu9ZXX1c+KRDrmYoKNHoNUdL5E1G+g7ZIruYEBAr4b5
 wzd+dkxAR30b0v8xbsdJ7VcTwppgqA5j67MJZbNMstx9fGZMSuTKIQE23VZc28fJHfhTX/fJTwT
 Uw9lMq4duCsQHUKbEby1KjZz2xZRCvw5khoin0vCsBG1kB5CG3tMzD2WtUT9l7/4lZ0pNxBiFv7
 DU3Fn4vpAPDBC5RZTS0Gu17bcoLNkKFlMTE6J/c96yTIKjQL7Q5JLlWzJ/uM7PTIrP+tHpzS9pU
 Ybx1BImfE7gTrV3hC08Kw/i6FBHVhwbtPLTF8tkzi2fCIFgjwGCcW6uqBVX3Y1Lpj3SAZe0MC+G
 7ASkSErSjwx7pPw==
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

As a follow-up of a previous patch modifying the documentation to
allow using the "Closes:" tag, checkpatch.pl is updated accordingly.

checkpatch.pl now no longer complain when the "Closes:" tag is used by
itself or after the "Reported-by:" tag.

Fixes: 76f381bb77a0 ("checkpatch: warn when unknown tags are used for links")
Fixes: d7f1d71e5ef6 ("checkpatch: warn when Reported-by: is not followed by Link:")
Closes: https://github.com/multipath-tcp/mptcp_net-next/issues/373
Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
v3:
 - split into 2 patches: the previous one adds a list with all the
   "link" tags. This one only allows the "Closes" tag. (Joe Perches)
 - "Closes" is no longer printed between parenthesis. (Thorsten
   Leemhuis)
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9d092ff4fc16..ca58c734ff22 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -620,7 +620,7 @@ our $signature_tags = qr{(?xi:
 	Cc:
 )};
 
-our @link_tags = qw(Link);
+our @link_tags = qw(Link Closes);
 
 #Create a search and print patterns for all these strings to be used directly below
 our $link_tags_search = "";

-- 
2.39.2

