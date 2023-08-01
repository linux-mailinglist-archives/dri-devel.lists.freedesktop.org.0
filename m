Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1176C114
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3981810E46C;
	Tue,  1 Aug 2023 23:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB4D10E465
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:45 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3492c49c649so8053705ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932945; x=1691537745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+CfnRsFNUYXmygRp+lpSqvj59BR1h/rC9xdfPKJnDI=;
 b=h1TGK2ZlXSADc3tN9UPPfIyUQ1E1M7T4qkvwJyraifru5jg/mpl7quH/34yXATnkLT
 ThxWOQU4vNnMeFalaGIP8RStIWvNBrC1zjO+PAG3Niy8t6FRz9HCTdWnO6S2+wBCn05s
 g1aniRMjdHUfHptEnWkaOidWyctiqDlydxjVwIVRs0ZizZNyyOQKSerFu2gXqNF+IE2/
 nAenFvnfglSU32dglovFU+p5qZz2ZDHGy+K8BCl0CC4InTxoWfGyJZ2904hEY1Xd9lF2
 eJ9T5oi1WsZuceMcS3QPSxh8VsJSwiV1fV8PlQ4GQkMV0IqY67AWAaDh6h4boqtYx9eA
 KaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932945; x=1691537745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+CfnRsFNUYXmygRp+lpSqvj59BR1h/rC9xdfPKJnDI=;
 b=S5NICF2SO9cT1rX9Mg6ZO6Jdgwk+uhe41WA14RzPAFw82sv+a2EtJTSKiGbdsMfNnK
 yTMCPpm1w8YFrjs/aQsqvnxLoumyIOYU44fNZs1N3s9IQzBua2Wm3RT3m/RhTJSe/mrj
 MzLSp65ME9DjxHLxynMwVqPN7z3JUkCq+cAYwppcw561Kh3Nsjl4srWCFLWVXnfu6g5k
 WElGeKwiUI+CLl0iqIkbyw2eJp3uvc2TLps/jvAuDHdBMzvQCntBKZW4fxoP0t8L3AHl
 Qqlb/pVynOziHvblwafg6lYNPJxDMRy2poor0EtkdEhwfAMip9y8pPx+x4Bt/4MVXpzd
 mAPQ==
X-Gm-Message-State: ABy/qLaGZyqdeciEIJx/9KIO56Yev6DBcqChkKuPUdsUCf/DnQnywASv
 miGGC/HxZOvgN35zx/X+C3A=
X-Google-Smtp-Source: APBJJlGjn8ASalYCPieBDurdqF3KEU0bFHq1ehRAR3xQCMJMoMqz/nQs8Z+JnQ7s2Zf+uxYThoa05A==
X-Received: by 2002:a92:c213:0:b0:348:eb44:2a30 with SMTP id
 j19-20020a92c213000000b00348eb442a30mr12016014ilo.15.1690932945248; 
 Tue, 01 Aug 2023 16:35:45 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:44 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 18/23] parens-on-PARAM
Date: Tue,  1 Aug 2023 17:35:06 -0600
Message-ID: <20230801233515.166971-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

---
 include/linux/dynamic_debug.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 871de0c32034..9b86c49173f9 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -172,9 +172,9 @@ struct ddebug_class_param {
 
 #define __DYNDBG_CLASSMAP_PARAM(_name, _bits, _var, _flags)		\
 	static struct ddebug_class_param _name##_##_flags = {		\
-		.bits = &_bits,						\
+		.bits = &(_bits),					\
 		.flags = #_flags,					\
-		.map = &_var,						\
+		.map = &(_var),						\
 	};								\
 	module_param_cb(_name, &param_ops_dyndbg_classes,		\
 			&_name##_##_flags, 0600)
-- 
2.41.0

