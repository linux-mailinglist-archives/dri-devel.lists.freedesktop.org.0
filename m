Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F066754A2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B3D10EA4D;
	Fri, 20 Jan 2023 12:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D36710EA49
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:35:43 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id lp10so2035099pjb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+XT9kad4yNYrmYBEVNX5sJ/vTlzpH7jOnDJsBQpKUaY=;
 b=o1DizLMpkK/XWtupOkGIL0XJkwy5IvcKxYbOInCIMcgwXpUlGb3XbnVWRRSXoVptUZ
 qvJIFMD1FvcHncGKgonqG1rlQKlgeVxcU9cPYCyiDRijYNw7cd3YgGzwuTqGjv6Upxo1
 dfwwz08WXNvcRbhCrGhevuFpZlnx/6vLcAxHq55K754d7q1I/7k3BpXeBwcZjrYObJlH
 xWMg5+igvxefRAE0dr77Y3pJezVM13Xu7UAHiKJ4k+5xQXfphuxdFQeLprWYZOA855fJ
 yauL6r3ayGXFR6o9GcJGOFR8ZTl8GLzdQBeOcFuHxPUU0lL+V3e6tXtEFp3JkK0+Lfcc
 YkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+XT9kad4yNYrmYBEVNX5sJ/vTlzpH7jOnDJsBQpKUaY=;
 b=vsNpxJwod1qBrZenVt3czbPMuazgW8Mf4Lzft2Gp4K/yzgxFG1nK2/W60x7aRGi3ap
 jHbJ739vXDyrDjh/sqYJJpvphm0EE9Pl0wMJkkJo71Q7RtNJpg0FXiZzzstJN9gk7me9
 hveoJWhLxOWxBbuGsVC2z8bv2v2Ko2vsDp8sbgCiqhej6lIL+/OZTZ8s8jmREtYG5O++
 yUVcM+3Cx9b2xyM11dzfMfpCCkrhe/uB8Qs+wk1wssRbujqTuOG6112D1tez1ipCz8Ca
 EnY1LdNHZ5lgHeDFkCqGSer6EYKviWYyL8Gh0m8N31oKnymEwc66ZakQM8KO3wyMazzt
 +caw==
X-Gm-Message-State: AFqh2kpdJzfQ8M7CHvob99koNhhDjyOPYMNbI/SrOkhMi9v3TwwGcq0q
 AZQfJVNQ7VkHS28DvCIpnps=
X-Google-Smtp-Source: AMrXdXtR2dp2lGd836pplDAnvwEYyR4FgT1yvTQphEkpDyqJKKc/zFKYkS4KybH4feu7AhdF/DFATQ==
X-Received: by 2002:a05:6a20:12d0:b0:b6:a6c4:87b0 with SMTP id
 v16-20020a056a2012d000b000b6a6c487b0mr20697785pzg.41.1674218143103; 
 Fri, 20 Jan 2023 04:35:43 -0800 (PST)
Received: from debian.me (subs02-180-214-232-6.three.co.id. [180.214.232.6])
 by smtp.gmail.com with ESMTPSA id
 nm1-20020a17090b19c100b0022717d8d835sm1422965pjb.16.2023.01.20.04.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:35:42 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 44717104FA4; Fri, 20 Jan 2023 19:35:37 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Freedesktop DRI List <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux KVM <kvm@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH linux-next 1/3] Documentation: accel: escape wildcard in
 special file path
Date: Fri, 20 Jan 2023 19:35:32 +0700
Message-Id: <20230120123534.137413-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120123534.137413-1-bagasdotme@gmail.com>
References: <20230120123534.137413-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452; i=bagasdotme@gmail.com;
 h=from:subject; bh=1v1ZVN3QD/qaEbSGAKvpr7+XFzT7pgg0PCoXuklJFvo=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDMmnuqZa5MVnegeFrN/LpCgsEKFssnv28cyqSyuvH1voFf3k
 rL9ORykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACZyrpnhv1dNBkdmUOZE7x515wDLSc
 9DDPZLtaVuKN20l0FwSdSxPQz/3ZdM/7P784x1RZ7frfOjK45z9torf7sa/DTWsVbUa8dkdgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Aaron Lewis <aaronlewis@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Oded Gabbay <ogabbay@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stephen Rothwell reported htmldocs warning then merging accel tree:

Documentation/accel/introduction.rst:72: WARNING: Inline emphasis start-string without end-string.

Sphinx confuses the file wildcards with inline emphasis (italics), hence
the warning.

Fix the warning by escaping wildcards.

Link: https://lore.kernel.org/linux-next/20230120132116.21de1104@canb.auug.org.au/
Fixes: f65c5dac207322 ("docs: accel: Fix debugfs path")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/accel/introduction.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/accel/introduction.rst b/Documentation/accel/introduction.rst
index 11cade51f387a6..89984dfececf0b 100644
--- a/Documentation/accel/introduction.rst
+++ b/Documentation/accel/introduction.rst
@@ -67,9 +67,9 @@ tree - drivers/accel/.
 The accelerator devices will be exposed to the user space with the dedicated
 261 major number and will have the following convention:
 
-- device char files - /dev/accel/accel*
-- sysfs             - /sys/class/accel/accel*/
-- debugfs           - /sys/kernel/debug/accel/*/
+- device char files - /dev/accel/accel\*
+- sysfs             - /sys/class/accel/accel\*/
+- debugfs           - /sys/kernel/debug/accel/\*/
 
 Getting Started
 ===============
-- 
An old man doll... just what I always wanted! - Clara

