Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEF96AD419
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 02:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F2B10E0A2;
	Tue,  7 Mar 2023 01:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920A410E34B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 01:36:39 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so15048240pjb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 17:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678152999;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JOYQlgcH4lD1Ha4i8w6bRHjoNTM7YfPZ9WX5HZ9QO3I=;
 b=WaTSDjMCZBclEN8svJcq9Pmi6JcG+tKiz00sPCtEyk7uTzRSZJAJnijU2VlOya9vmP
 FoBiwEd58sL8cAsMjOL0W2CD1dQzqC1LAYHwTXgfJIKBjWwwCjsE9VzmjqxFq0zOES8F
 mMv5hlD7kaK3SOmyej8qjhaGXidp2hwJnFNvunBAjc8McjE75AHz7dsoFHXcf+O3XAbZ
 xirvX8OLJ9ehz0FXt+AHD0jS55AYRminnBrs2CPGAz3as9e5925AVmFvjeow+SdoJ1+4
 jOnYwyolUyItxekQqRECZXxKAbUpKGiOb37g0la+5ORFtKbQCRWUuWxOfB10OEuc0Llm
 tN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678152999;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JOYQlgcH4lD1Ha4i8w6bRHjoNTM7YfPZ9WX5HZ9QO3I=;
 b=J6n8SSthmyHWBMLA/cNgXzTB7AhE3Z9u0/H4/CHPBWrxP6jA4fGJ+cNYoG+ET+xdME
 xNMBzfIxLupPLbtNqzoVF8mmEUzwe0ac6/apSvlEVW/SC6sTuvEkbWB47AIOumKjbSTg
 Os6V4iSFKuU06qNUT8PanCsPxiD9ptoXhTsC+WHUWlbUJ0N0zK6ctyyC1co8YkF/jmEo
 clgbZUaq4F0rKE6q+GyNmhmX21WL70vKVy1suPNGo86d7TnCm2jOKU5enmOEfOtrnRMI
 li4ol8nCu37iQuUPbW7tnLk+IGbFZKDw+EiNxxrdxFN/YMXkZ2Qvl07URXrfyDE4Gj3a
 GQ5g==
X-Gm-Message-State: AO0yUKWcxPLuwTErLi+dhksM96Uzfy0fC15hcZ/cyaPNTdC1hTkFgefm
 qd6+NwWfL/sP4wlgQnTGHj0=
X-Google-Smtp-Source: AK7set9TNDTtw5wgGGIsWh6Oli4TjGs+OdUfBpBXy+tm8dWZa7Cute5zIaKXRlix9l0CLbc/IYdq4Q==
X-Received: by 2002:a17:903:11cc:b0:19c:aa09:c455 with SMTP id
 q12-20020a17090311cc00b0019caa09c455mr15955641plh.25.1678152999128; 
 Mon, 06 Mar 2023 17:36:39 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp.
 [106.167.171.201]) by smtp.gmail.com with ESMTPSA id
 l19-20020a170902f69300b0019956488546sm7311718plg.277.2023.03.06.17.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 17:36:38 -0800 (PST)
Message-ID: <f94e3ada-212c-eef7-9e7b-03760bb29521@gmail.com>
Date: Tue, 7 Mar 2023 10:36:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH v2 2/2] media: Adjust column width for pdfdocs
Content-Language: en-US
To: linux-media@vger.kernel.org, linux-doc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <29380b3e-1daa-3aef-1749-dbd9960ba620@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <29380b3e-1daa-3aef-1749-dbd9960ba620@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Akira Yokosawa <akiyks@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The column width specifiers added in commit 8d0e3fc61abd ("media:
Add 2-10-10-10 RGB formats") don't suffice for column 1 and too
wide for column 2.

Adjust them to get a good looking table.

Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
new to v2

 Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index ea545ed1aeaa..d9d7b7621d8c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -778,7 +778,7 @@ number of bits for each component.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{3.2cm}|p{0.8cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 
 .. flat-table:: RGB Formats 10 Bits Per Color Component
-- 
2.25.1


