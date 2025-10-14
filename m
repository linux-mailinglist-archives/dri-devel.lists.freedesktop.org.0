Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C83FBD7126
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 04:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FAF10E198;
	Tue, 14 Oct 2025 02:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="fyFGhwJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A379510E04A;
 Tue, 14 Oct 2025 02:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=0W7I+dl8DSQnGqmj60m9MouHseze8cJzELVYWnnCpck=; b=fyFGhwJWKeaMWloZ6aKJi7zS1X
 5kwXYznOeKHxCx0ieLGqPVcCGOR6SiaWWpvIGR20azRC/fXkZ/gq8iiDdbbv+cLCK/mBkyW1a+LcM
 4p7h3zyt909nD7TPUtWzGQjseHGvhy5qSrswlJa/mA9t7JJm9KFtjhNsGe6nDd2rY0rVJ/gfiH4sX
 otNKI+yW4Aa5SWX7Y2T+frEPgBpQjBol9Xh2J3wUXMMzSt1P3sXigxiiK81aOmojoysLCwB/S8bzg
 lARTRZ1rZ83ELAsJUoLiPTXuC0pB8EVQKD13CimOergJDpR7KVC0Kc1kPWo+qd+DcyK1MkdHnmkHW
 T9/wfgJQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v8UkB-0000000EyRP-0ns0; Tue, 14 Oct 2025 02:26:31 +0000
Message-ID: <00e1ffa0-1576-43da-9c65-38f2d912d28e@infradead.org>
Date: Mon, 13 Oct 2025 19:26:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: xe_guc_pc.c: fix DOC underlines
From: Randy Dunlap <rdunlap@infradead.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251013182827.733781-1-rdunlap@infradead.org>
 <aO1aCNMPKTNZta4V@intel.com>
 <a9226ec9-d98b-49ea-a589-c1c2880cfbfb@infradead.org>
Content-Language: en-US
In-Reply-To: <a9226ec9-d98b-49ea-a589-c1c2880cfbfb@infradead.org>
Content-Type: text/plain; charset=UTF-8
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

[correction]

On 10/13/25 7:08 PM, Randy Dunlap wrote:
> Hi,
> 
> On 10/13/25 12:59 PM, Rodrigo Vivi wrote:
>> On Mon, Oct 13, 2025 at 11:28:26AM -0700, Randy Dunlap wrote:
>>> Apparently a recent change in docutils has made checking of section
>>> heading levels (underline style) be more careful.
>>>
>>> There are 2 heading underline style errors reported here. Repair them by
>>> changing the underline style from Chapter (using '=') to Section (using
>>> '-') since they are used within a Chapter already (in xe_firmware.rst).
>>>
>>> """
>>> Documentation/gpu/xe/xe_firmware.rst:31: drivers/gpu/drm/xe/xe_guc_pc.c:75: ERROR: A level 2 section cannot be used here.
>>>
>>> Frequency management:
>>> =====================
>>>
>>> Established title styles: =/= =
>>>
>>> The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
>>> One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
>>> (up to Docutils 0.21, these sections were silently dropped). [docutils]
>>> Documentation/gpu/xe/xe_firmware:31: ../drivers/gpu/drm/xe/xe_guc_pc.c:86: ERROR: A level 2 section cannot be used here.
>>>
>>> Render-C States:
>>> ================
>>>
>>> Established title styles: =/= =
>>>
>>> The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
>>> One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
>>> (up to Docutils 0.21, these sections were silently dropped). [docutils]
>>
>> Nothing against this change, but I'd like to understand more on what has
>> actually changed. I have docutils 0.21.2 here and I cannot see this error.
>>
> 
> Hm, I now have Docutils 0.22.2 and I also cannot reproduce this issue.
> 

I cannot reproduce it with my patch applied!  :(
Without the patch applied, I do see still see this.

>> Perhaps it was a temporary bug in docutils 0.21.0 or 0.21.1 ?
> 
> Yes, maybe.
> 
> I suggest that we drop this patch.
> Thanks for your assistance.
I am now copying linux-doc, which I should have done to begin with.

@linux-doc: I am seeing the above (2) docs build errors, reportedlyfrom docutils (v0.22.2).

Rodrigo (DRM XE maintainer) cannot reproduce the docs build error.

Does anyone have any ideas about this?
[patch copied below] [also:
https://lore.kernel.org/dri-devel/a9226ec9-d98b-49ea-a589-c1c2880cfbfb@infradead.org/T/#m4e3005311d19eef3d24fc7a4c7129de0ff322f9c]


Thanks.

-- 
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm/xe: xe_guc_pc.c: fix DOC underlines

Apparently a recent change in docutils has made checking of section
heading levels (underline style) be more careful.

There are 2 heading underline style errors reported here. Repair them by
changing the underline style from Chapter (using '=') to Section (using
'-') since they are used within a Chapter already (in xe_firmware.rst).

"""
Documentation/gpu/xe/xe_firmware.rst:31: drivers/gpu/drm/xe/xe_guc_pc.c:75: ERROR: A level 2 section cannot be used here.

Frequency management:
=====================

Established title styles: =/= =

The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
(up to Docutils 0.21, these sections were silently dropped). [docutils]
Documentation/gpu/xe/xe_firmware:31: ../drivers/gpu/drm/xe/xe_guc_pc.c:86: ERROR: A level 2 section cannot be used here.

Render-C States:
================

Established title styles: =/= =

The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
(up to Docutils 0.21, these sections were silently dropped). [docutils]
"""

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Sorry for the resend. I didn't have .gitconfig present so parts of
this didn't work as intended.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
---
 drivers/gpu/drm/xe/xe_guc_pc.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20251013.orig/drivers/gpu/drm/xe/xe_guc_pc.c
+++ linux-next-20251013/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -74,8 +74,8 @@
  * connected power conservation features in the GuC firmware. The firmware
  * exposes a programming interface to the host for the control of SLPC.
  *
- * Frequency management:
- * =====================
+ * Frequency management
+ * --------------------
  *
  * Xe driver enables SLPC with all of its defaults features and frequency
  * selection, which varies per platform.
@@ -85,8 +85,8 @@
  * thus saving power. Base profile is default and ensures balanced performance
  * for any workload.
  *
- * Render-C States:
- * ================
+ * Render-C States
+ * ---------------
  *
  * Render-C states is also a GuC PC feature that is now enabled in Xe for
  * all platforms.
