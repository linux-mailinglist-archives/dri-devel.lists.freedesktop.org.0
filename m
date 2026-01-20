Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHzXIDcIcGlyUwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 23:56:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303BC4D584
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 23:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB5610E659;
	Tue, 20 Jan 2026 22:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="lRK3m4HZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F40E10E65B;
 Tue, 20 Jan 2026 22:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7FF8940C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1768949809; bh=3eKsNV/AaXk/1OQudVxiK4Bs15qEnnFSiizsYY5lccQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lRK3m4HZ4T4+ITEXyUBHIvV7JxjUFKNcojklaMwM9rDZue4KHvaldVW1UggAAAe4L
 GieTTeWbeOsXMR7azmTtfDsMiFyabGp4vi/SsAp3/lBAidrxodGcFiaPeFh4g7hkzV
 QLqu+kr42R5IPFv1JeH8fVcx+9aUaS4E+8tW652wCazgUbI5nxAagsCgrOGX1+y6xa
 LgZYcw+7sLD2FuBZ3wUcbQz/UFLIoXDLuuJrG/2FhLq68byqS+ssTlz1UdfpsguTls
 cCpocjMtriCI6ZIH4tUEDa2Q3N8L/6liAMZrm1UvY3Uapn+EsCE/TZ8hDHYFtE6gcr
 oIaeB0oOAtZqg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1)
 server-digest SHA256) (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 7FF8940C27;
 Tue, 20 Jan 2026 22:56:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Alex Shi
 <alexs@kernel.org>, Carlos Bilbao <carlos.bilbao@kernel.org>, David Airlie
 <airlied@gmail.com>, Federico Vaga <federico.vaga@vaga.pv.it>, Hu Haowen
 <2023002089@link.tyut.edu.cn>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nsc@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona
 Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, Yanteng
 Si <si.yanteng@linux.dev>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Avadhut Naik <avadhut.naik@amd.com>,
 Chenguang Zhao <zhaochenguang@kylinos.cn>, David Disseldorp
 <ddiss@suse.de>, Dongliang Mu <dzm91@hust.edu.cn>, Gang Yan
 <yangang@kylinos.cn>, Kees Cook <kees@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, Steven
 Rostedt <rostedt@goodmis.org>, Tamir Duberstein <tamird@gmail.com>,
 Vincent Mailhol <mailhol@kernel.org>, WangYuli <wanyl5933@chinaunicom.cn>
Subject: Re: [PATCH 0/9] docs: Fix kernel-doc -Werror and moves it to
 tools/docs
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
Date: Tue, 20 Jan 2026 15:56:48 -0700
Message-ID: <87wm1bhozz.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vaga.pv.it,link.tyut.edu.cn,linux.intel.com,intel.com,ffwll.ch,ursulin.net,linux.dev,lists.freedesktop.org,vger.kernel.org,linutronix.de,amd.com,kylinos.cn,suse.de,hust.edu.cn,infradead.org,linuxfoundation.org,goodmis.org,chinaunicom.cn];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,huawei];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:email,lwn.net:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 303BC4D584
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> After a restful weekend and revisiting both yours and my series,
> I'm opting to send a patch series merging both into one:
>
> - The first 4 patches are from my series (no changes since v5):
>     https://lore.kernel.org/linux-doc/cover.1768642102.git.mchehab+huawei@kernel.org/T/#m81211c0ff38bbaa82b8b0b6606f242ccc0c2a9ac
>
> - It follows by the 2 patches from your renaming series:
>     https://lore.kernel.org/linux-doc/20260119111745.4694546b@foz.lan/T/#m51099c31a99dccccdb4d17cbaadc818e9e4df8c4
>
>   with the fix I proposed for kernel-doc to find its libraries
>
> I added 3 patches afterwards:
>
>   - patch 5: move possible return values from docstring to helper message;
>   - patch 6: improve MsgFormatter description;
>   - patch 7: moves kerneldoc_bin from conf.py to the sphinx/kerneldoc.py
>     (this is now just a debugging message - no need to pick it from env)
>
> IMO, this series is ready to be merged.

Patch 7 adds a new warning:

  WARNING: unknown config value 'kerneldoc_bin' in override, ignoring

It needs to be taken out of sphinx-build-wrapper; I've appended the
following patch to the series to deal with it.  I think I'll go ahead
and tack on a patch putting in the scripts/kernel-doc symlink, then I
guess it's ready to go.

Thanks,

jon

From 4a3efd128f7da996b677151790d043ec44a00561 Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Tue, 20 Jan 2026 15:50:38 -0700
Subject: [PATCH] docs: sphinx-build-wrapper: stop setting kerneldoc_bin for
 Sphinx

Now that the Sphinx build does not use the kerneldoc_bin configuration
variable, we shouldn't try to set it in the build wrapper or we get a nifty
warning:

  WARNING: unknown config value 'kerneldoc_bin' in override, ignoring

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 tools/docs/sphinx-build-wrapper | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index cb2a5005e633..9f1ae1485f84 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -750,7 +750,6 @@ class SphinxBuilder:
 
             build_args = args + [
                 "-d", doctree_dir,
-                "-D", f"kerneldoc_bin={kerneldoc}",
                 "-D", f"version={self.kernelversion}",
                 "-D", f"release={self.kernelrelease}",
                 "-D", f"kerneldoc_srctree={self.srctree}",
-- 
2.52.0

