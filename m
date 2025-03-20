Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC18A6AD86
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C853610E697;
	Thu, 20 Mar 2025 18:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BZCfjywl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C1410E68A;
 Thu, 20 Mar 2025 18:53:32 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-85ad83ba141so144363439f.2; 
 Thu, 20 Mar 2025 11:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496811; x=1743101611; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gMXprwpPowLLoVogtCcQtZ50lNSDFQUUtuE2MLi/rpw=;
 b=BZCfjywlVUV1SWkk983M8UmnjVPvLC2Yf4Ggfzf+Hh358wueCvpTo24UKno8GsCt87
 XWLWLKLZXTZTCi+uaJo7A7ONQSjU73z6/rTklMTWz6mAwHGzaHh3nJfsvEJQ3qgz3iMv
 m4iCjxhsS6UaLu+yilAVryMoa2CPF66l5t+D9snZtqGacGjstMIIoHZ2c7VCNM3qIYmB
 B9b9canL3Oot11urxcmoD3arLx8ZySSPu4PcMBSSDLHECyXyywx/tZvgToCGpv0ayK8p
 96nGXrWKU8sUwc0d6jymQiu5NB18EEqJMfnALHprx6p3xUlwXKhxa24gfHv1rfNZIfs8
 G7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496811; x=1743101611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gMXprwpPowLLoVogtCcQtZ50lNSDFQUUtuE2MLi/rpw=;
 b=RaNYqhld1v2tnRMzt5LgcJQLfwWSbBwzEweJilbizADOF1CGsCf5C8ehv0vsWRnWa8
 0CE4fwimqE9n/IB40Ws4bPLOa2Kzze+TKRAIN1vYq4YJ5XB3W8wYBDrwRkPTPJWngTpJ
 c72r5yBtqqgD3EEh8x/Gg5t5jcf0EGClrIGDyI/xqPz9GpT83Y63a+l/mG1Yd1dls4wL
 dWzz5RC8o7o9z43G1RnVlOwv2gEIFjODWK7Vg4BQ0LvfCo1Xpa5t0mCwaqbGbmkU1BcB
 +FzM6mlasmPy42UQR9GFf+SmaZOwssXPA9kdxIRWUd33LZIzfz5ifqkgenm2TF/vrS71
 71SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtc9St0L6G+Tfi/2e8LH78W1jRjWtUf6OigKPv7776eaw6gJ/28iB03ik+ffWnNKMWN64Y7Pe5ZiZA@lists.freedesktop.org,
 AJvYcCX+9GP2QVwr2Y6b3tUCJHGWZL0LxfLfTsqU+TBFA+CjentBoQj8kdmZddHzG8IFxSjjhunJt3z05mqv@lists.freedesktop.org,
 AJvYcCXKofuOnXzdtrzfTUy01xft2VkyHS3H5GlQGJlGZcRqNHy6nrWlgi0S5iilAkW6hqOf3a4Dfv6ssVILr/lsATYAjA==@lists.freedesktop.org,
 AJvYcCXUevFVY9vxW83UZo+QblnUp40kWhtZprn5XvOdoYHR+ayfzQYIkLaSyvZo9T/jgcSzx6oI2g2I@lists.freedesktop.org,
 AJvYcCXnUGSt9hhylvfFNNLe1JUMIQZ8wTYsR9Kd3L6XQu1IKK2VIhI2t+C3ya1N3p34v3806tP40l3Sd8WXbAzqPw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNi7JtS2SmCxBZbynmEidmSQjOnf4alwPdu6HJK55ovuZKJlij
 aKq6SOZN9Vy47GbrCfLo3m2+nhnC4utXzSIJQb6GdTS6x8vZy2+1
X-Gm-Gg: ASbGnctw18XWvFUCEPtlB3oWsQ3FsSaDd6afOMUZdWua74mtQzQJu0dUqiR8hsh3zgp
 DfbrJwQqP57HBWdMcrj9tyPlXQS8qR42aiAy9UJEhP/gwjs4szaHJyehq+d7pUP2AS2DUzuAOgm
 PfhIy/kEf4hKF/gepYKOxJmfrJeoE3q4cWiIkVqisaK2jj6ZMI7Kojnz8e3UkSzDVvmLouqVOLU
 gXHdHIxxLprpismcW4i4gpEmRSt26uUxgjHCpdsl448GhxCp5Txg4ORgUB46JECEew6nOWdSFnn
 nuexFr5c8RiLBX5k9QyKtYMXfQGRlf92Ksy1nBXXj1UG3/cM6WLdWyFGGcjxy35+H7CJHzsmcOf
 3JA==
X-Google-Smtp-Source: AGHT+IG+/7Kbepu4M0I9q9bM6mS824HGPKpcYmMojnJPg6cLnUArrmay+qvcX7lRE8FxKCVlxWVxpQ==
X-Received: by 2002:a05:6602:36c4:b0:85b:5494:5519 with SMTP id
 ca18e2360f4ac-85e2ca6fff3mr44385939f.5.1742496811395; 
 Thu, 20 Mar 2025 11:53:31 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 25/59] selftests-dyndbg: add comma_terminator_tests
Date: Thu, 20 Mar 2025 12:52:03 -0600
Message-ID: <20250320185238.447458-26-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

New fn validates parsing and effect of queries using combinations of
commas and spaces to delimit the tokens.

It manipulates pr-debugs in builtin module/params, so might have deps
I havent foreseen on odd configurations.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
- skip comma tests if no builtins
---
 .../dynamic_debug/dyndbg_selftest.sh          | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 68a9046405f2..368d10a691a0 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -216,7 +216,7 @@ function check_err_msg() {
 function basic_tests {
     echo -e "${GREEN}# BASIC_TESTS ${NC}"
     if [ $LACK_DD_BUILTIN -eq 1 ]; then
-	echo "SKIP"
+	echo "SKIP - test requires params, which is a builtin module"
 	return
     fi
     ddcmd =_ # zero everything
@@ -238,8 +238,27 @@ EOF
     ddcmd =_
 }
 
+function comma_terminator_tests {
+    echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP - test requires params, which is a builtin module"
+	return
+    fi
+    # try combos of spaces & commas
+    check_match_ct '\[params\]' 4 -r
+    ddcmd module,params,=_		# commas as spaces
+    ddcmd module,params,+mpf		# turn on module's pr-debugs
+    check_match_ct =pmf 4
+    ddcmd ,module ,, ,  params, -p
+    check_match_ct =mf 4
+    ddcmd " , module ,,, ,  params, -m"	#
+    check_match_ct =f 4
+    ddcmd =_
+}
+
 tests_list=(
     basic_tests
+    comma_terminator_tests
 )
 
 # Run tests
-- 
2.49.0

