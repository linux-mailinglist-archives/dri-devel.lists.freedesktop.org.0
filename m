Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF733A2BDFE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F94210EA66;
	Fri,  7 Feb 2025 08:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z54uRH5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E4810EA17
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 03:46:55 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-46fa734a0b8so16170741cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 19:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738900015; x=1739504815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUgshD4k7+DeHbdvE2lo1G+Dt5NqluPiGTxoQ6J9L2E=;
 b=Z54uRH5ASw6Ox3WLmWX6CJS0/+DTYWICk+VXPlqodn25J1xKyk75K7c+FBcT/gbIf+
 82UAIrDjjWEGDrXLMzupLjxWAQ2ixVeUhflKk+qFuf6JgtIXpAr0UJK2SUDZoftI6Die
 5brFCCHH/Cu3EOZ2ViaKCc+genJjLbVdRxmBdyztFAOQ+Dk6y/vuKakksPzMJDlrz8Vj
 uu86mTugGtE+VuPkNuAgohWBptmr63ZijMC35CFGIUkZKYcFSpKKHBuZLMkmMsUe+Usi
 0oBzZbbboXDs2cpDOGTZgbPY6kVNfI0AUdv/xQYaEBlfdC6fIzfT9edVqlRE4ok2w/3H
 wEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738900015; x=1739504815;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uUgshD4k7+DeHbdvE2lo1G+Dt5NqluPiGTxoQ6J9L2E=;
 b=NOBhiFUBsVGOaLjJK4klwnVKKWafRFZh0sHnN+4/7e9Zotr9rCtuEMTxThq2Ip1BOx
 Bd0R3oDfe7Qn2gyD9o89a6/uZa4TQEA5kWwWJvEMSrfTjWSjwMb50QPJjmFdDNSkmcrM
 RlPRWiC/ccZ7c88wF4I0d03LtoKsEBRsQF9hmQ0FPnmvnxdTJSUesfhLPQm79lsDWkXQ
 aejCrGRtZZkMjfjYctj1tQhv5r+3rhZd2JjjVNeNb5EQl6C7iBBfjM+sv+/8k40CrdZC
 gkpJ8pQIm2FvutYxOUavz0pkdbNy5xGhkumHr7JMZ5QHaTwf0j2CBI+HVWkKZ1HYGJBb
 dwqg==
X-Gm-Message-State: AOJu0YxltizcI7PFWKx/uScpFeS6bg7vrjcCG2YM1opB66Ju7ekRO3x+
 aXGdoYe5/9H3jsmTXmKGSxPKXkLhephhNrUvmT3Y1uPLxMTeV++a
X-Gm-Gg: ASbGncsfIU57ozZ+9/3e83emDsHFwJuFLEACMXGpIEo+aQhn/bPFd8L4OhLuhGIQVp4
 Oig7BmDcvH3jzm6DFIPEbU63QbSExIJdAi7ac8RlhjRjo8WXcjAsmMZsisMZNM9mby8P5M+4nKR
 AU/jehil/KOSHmXSIzGDghRBrY0QNSREBrtd+zEwJEFPvMKGbn9WcysgP6wTBI7jOqJuNiCBhbm
 vjxxEkYpUMJ7PtdEYYxi3V0KtuinIb7x3/RdGxunL2tE+ltoL9ml+gnO3U+zzDcX1riM1FbN0yz
 kL3Z9B4i5X1lCLgNpmys0huZ7L7YJez2t3nh8k3z3tjJnApe3pTAEti8DA==
X-Google-Smtp-Source: AGHT+IEm3BdSe+q9WBSKEcsae+Hf1w+7IXInI0crzAEIRMQZhsnXJTj+cQiEaklGauUKMdmGN54b2w==
X-Received: by 2002:a05:622a:90:b0:467:672a:abb8 with SMTP id
 d75a77b69052e-47167993229mr27416671cf.5.1738900014318; 
 Thu, 06 Feb 2025 19:46:54 -0800 (PST)
Received: from [192.168.1.105] (c-73-176-204-61.hsd1.il.comcast.net.
 [73.176.204.61]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c041eb7a01sm138122385a.95.2025.02.06.19.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 19:46:53 -0800 (PST)
Message-ID: <f68426ac-d8ec-4a90-a683-ca157719c7d5@gmail.com>
Date: Thu, 6 Feb 2025 21:46:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Eric Salem <ericsalem@gmail.com>
Subject: [PATCH] Documentation: gpu: Fixed typos
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 07 Feb 2025 08:32:02 +0000
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

Fixed a few misspellings.

Signed-off-by: Eric Salem <ericsalem@gmail.com>
---
 Documentation/gpu/todo.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 256d0d1cb216..7cc102f1571a 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -294,7 +294,7 @@ Various hold-ups:
   valid formats for atomic drivers.
 
 - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
-  version of the varios drm_gem_fb_create functions. Maybe called
+  version of the various drm_gem_fb_create functions. Maybe called
   drm_gem_fb_create/_with_dirty/_with_funcs as needed.
 
 Contact: Simona Vetter
@@ -319,7 +319,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -838,7 +838,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.48.1
