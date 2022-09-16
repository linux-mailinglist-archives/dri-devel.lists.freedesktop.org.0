Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F595BA8AD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 10:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C3710E3E2;
	Fri, 16 Sep 2022 08:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1A310E3E2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 08:53:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id DC374580E35;
 Fri, 16 Sep 2022 04:53:07 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Fri, 16 Sep 2022 04:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1663318387; x=1663321987; bh=ZFtMGAa129
 Cr8RDhpd8v9Ui9QHwxY8QKFU+/h7fj6XQ=; b=gWg3mZo9s5TlBI9yv/BxqQZOZw
 1ZfOCrayhnJUa/V3wtJz10UO0UQK6jZEugRvKOuadIbjJVIjE14dJfLzqufIyl7T
 JKWXguoxPYQqk7GGGLVhSy7CWoJudeWl7/iPpMnlyxUY/o/q/ex35KoNJH+8fZR9
 ZdrXrnRXkSJ5LTpt2rEEX/0+fMAQBFNU8HvzUSyokM3iSUYYe8FUPWEMhGOx5t6o
 fQ1wsSaf0vDuNvhS3sUSnMZNqx5jqU1mpUhBTr3ScsQJSZ3+Bdqs9e4Tz7YC7X44
 HT+6q5l2Q3HlsBeh86zSd3vmpBlLYBJPwe3ZQ8V9Dp3rpqgQyjW0rlDxAscg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663318387; x=1663321987; bh=ZFtMGAa129Cr8RDhpd8v9Ui9QHwx
 Y8QKFU+/h7fj6XQ=; b=GMfE+QHqHY8DvFPc5wS/gYUVndeUmb4XlY9Ge1HmYh76
 /55jOjdVCT0SWUNI3C3P7yKinX6eFYD7MKqX9pdbftMKRkKoRGlutyophwC+0DkM
 CgtzbwfCI6gUc9wOVCRSPO8HGjpTo0mvVDlnHfxBT7CjGySv1Vf3DkTGgoObp9FQ
 26eMpo+C6swJEXjWeEaL2jA+ONEPeE3BFQlmElfCBLOlPFk6pBNcrtTJ5sH+tXs7
 3DNxfIB3yNWo1Nt8TEZeMtFzFN5+wgXzyw/5Bg1LjTL0VUxoFZqffsH0idAyQfYL
 oVXKJstZj1GsWqkra9GbpGB4xY+THRN/1suOODNryQ==
X-ME-Sender: <xms:cjkkYxByAD8WY1jjqGvKcu6gaN_-LLv2lpPQnPdpZ1w-USi0zNjbYQ>
 <xme:cjkkY_gMYYhvDZAqPcC2VzRCSKeS5OIpOcofZzCTJbTIHvgo07HZ2jusfF8uL7KRL
 YoZaIuNPmNb92aTf6U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvtddguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepgeetiefhjedvhfeffffhvddvvdffgfetvdetiefghefhheduffeljeeuuddv
 lefgnecuffhomhgrihhnpehprghsthgvsghinhdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:cjkkY8mt-T6hs-vzmr2eDer5cUMI6T9SKNR5CnF5rblc4_T2aHh0Cw>
 <xmx:cjkkY7wAoerWWOo6_Rf1Er1y_JnDclRfJ2nRtmSQPMfTPjPc7iPD7A>
 <xmx:cjkkY2T8yX6G_uqsNQdRU31LHhBv96s3Kq3LaVgtB15dcvFtp6CSSg>
 <xmx:czkkYzJVIfwPMEUT1-cOqx74WLNWWcAIEzuUZb3vyBqda3a7DTAtSA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B8C3AB60086; Fri, 16 Sep 2022 04:53:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <e020ff7a-d58e-481d-bb1c-980fe5e13c3e@www.fastmail.com>
In-Reply-To: <6c0d4973-7f7e-1893-58b2-9bbe19160045@ideasonboard.com>
References: <202209160259.7f3Z5krO-lkp@intel.com>
 <9b4152e9-34cb-4ed6-b5e3-ef045b40dff2@www.fastmail.com>
 <6c0d4973-7f7e-1893-58b2-9bbe19160045@ideasonboard.com>
Date: Fri, 16 Sep 2022 10:52:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "kernel test robot" <lkp@intel.com>
Subject: Re: drivers/gpu/drm/omapdrm/dss/dsi.c:1126:1: warning: the frame size
 of 1060 bytes is larger than 1024 bytes
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
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 16, 2022, at 10:24 AM, Tomi Valkeinen wrote:
> On 15/09/2022 21:49, Arnd Bergmann wrote:
>> On Thu, Sep 15, 2022, at 8:17 PM, kernel test robot wrote:
>> I think hte problem is that struct dsi_irq_stats is just too
>> large, at 776 bytes. The interrupts are disabled during a copy
>> from 'dsi->irq_stats' into 'stats'. A trivial workaround would
>> avoid the local copy and keep interrupts disabled through
>> the entire function so it can operate directly on the source
>> data, but that would introduce a longer time with irqs disabled,
>> which might be bad as well.
>> 
>> Since this is only called from a debugfs file, and reading that
>> file is probably not performance critical itself, maybe
>> using kmalloc on the large structure would be best.
>
> I think that makes sense. I have sent a patch using kmalloc.
>
> Oddly enough, I was not able to reproduce the warning with my normal 
> toolchain, gcc-arm-11.2-2022.02-x86_64-arm-none-linux-gnueabihf. I even 
> reduced the frame size limit to 700, and saw warnings from other places, 
> but not from omapdrm.

I had another look and found that this only happens with
CONFIG_INIT_STACK_ALL_PATTERN=y or CONFIG_INIT_STACK_ALL_ZERO=y,
which are only available with gcc-12.x or clang.

It looks like without that, gcc can reduce the size of the
on-stack variable by only copying the members that it actually
needs, see https://pastebin.com/8dDRE1bX for the gcc-11
output.

      Arnd
