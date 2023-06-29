Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B218E742686
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 14:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A799510E1A9;
	Thu, 29 Jun 2023 12:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1572910E1A9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 12:36:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 3C0B92B00163;
 Thu, 29 Jun 2023 08:36:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 29 Jun 2023 08:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1688042167; x=1688049367; bh=bT
 G+9AqapEnTzTdZN+3/z4mAZ7LW415XlukWbIMXEK4=; b=jVer3ZsYEpv4oKp9MB
 szsrrrdYGu7rGZrQTOVLMkGALoFHHLvc/oUUpXJBoXJgdCfT0l7aA0yKhATrYNXB
 aEGN9jvcC01pqiHdFsqq0bkFFSz9UIn0wpYtG5wYSyHBgIUb0q0WF10Dn3D0ys+Q
 XdVTz1xDdvBF5BWZT8QJkN/TJUgNTFQEn9uRiImRIIIxVlZAUYgfDYxAZN24C9If
 0fvLO/7Vh+JJJx9ib3bnVyk06XlQdUmqqoWItzk2IhpGynOSTiS1PFOrwsJCeCaJ
 8UiDOATEhC65kKFJEjC7rOkzppp5TX9XQuMvRoXskdiug/iaC/tnwPy1ygPdzaL6
 IoZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1688042167; x=1688049367; bh=bTG+9AqapEnTz
 TdZN+3/z4mAZ7LW415XlukWbIMXEK4=; b=CccPJWvx1a+Oz1MM5Taiu9fsGftW9
 hmgBcLqXYChcnfp2nv6RWUg7M5kQcytbmDfhV1AVipcw49+CmNKous2ER6JLcGud
 qLKDK3EFXotIhbICdzx3r91mhkebGgUqVWBxeOtOqIwIjt2VLx2+7M0e0ZNBw8IY
 QYBew9HSxFvupkHfoU1p8ZntBi5WUvQWBmTXQhafzKFZRTGtPdZIsRBX2guG6EvC
 jm91VDAmWV04RD50eKeuNQ1gIbDXgSNCl/ADV15oAHykwZ0L0pLZZYK3u1cr3+Rr
 x7zXD2MAiXbufbU1CsLjDKzyEFWnoX4+00s21o08yDXbrmZmwqDH+dXBg==
X-ME-Sender: <xms:tnqdZAyITayvFU5PbWEsgwbjYWgt1_bFD3KxUqWmvV0MpPRpzRhMYw>
 <xme:tnqdZETRQyAQkFjh37a8uYBhXLeGI9R7f1m3td7LD-JziB80SvWJeQz0ASta2bqx9
 LtzynNQufcPspiPv5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeggdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:t3qdZCWK84TlQOUoGax5_YXtDLllqy8UMuSas5speVwKDdAYHHtFmg>
 <xmx:t3qdZOh7zh5gc4FrE0MBs27VLcYOiuEURtr1UYpC_ojWWV1ts5U5xw>
 <xmx:t3qdZCD2YEfxCMDoMp6Bks-zFbCY2rQklJKHTChqpgGWw39PgvnhXA>
 <xmx:t3qdZKjiEc4oaeDQe8Jc0rTS3lifMyHCY8K24zrYhOb09JLKNV8fH1kx3iQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D6555B60086; Thu, 29 Jun 2023 08:36:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <80e3a583-805e-4e8f-a67b-ebe2e4b9a7e5@app.fastmail.com>
In-Reply-To: <20230629121952.10559-8-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-8-tzimmermann@suse.de>
Date: Thu, 29 Jun 2023 14:35:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>, 
 "Daniel Vetter" <daniel@ffwll.ch>, "Dave Airlie" <airlied@gmail.com>
Subject: Re: [PATCH 07/12] arch/x86: Declare edid_info in <asm/screen_info.h>
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-hexagon@vger.kernel.org,
 linux-staging@lists.linux.dev,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Sami Tolvanen <samitolvanen@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Juerg Haefliger <juerg.haefliger@canonical.com>, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 29, 2023, at 13:45, Thomas Zimmermann wrote:
> The global variable edid_info contains the firmware's EDID information
> as an extension to the regular screen_info on x86. Therefore move it to
> <asm/screen_info.h>.
>
> Add the Kconfig token ARCH_HAS_EDID_INFO to guard against access on
> architectures that don't provide edid_info. Select it on x86.

I'm not sure we need another symbol in addition to
CONFIG_FIRMWARE_EDID. Since all the code behind that
existing symbol is also x86 specific, would it be enough
to just add either 'depends on X86' or 'depends on X86 ||
COMPILE_TEST' there?

      Arnd
