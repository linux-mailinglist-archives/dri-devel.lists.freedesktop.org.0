Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388877FD666
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8284210E4FB;
	Wed, 29 Nov 2023 12:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E0710E4FB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:16:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 333065C0226;
 Wed, 29 Nov 2023 07:16:22 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 29 Nov 2023 07:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1701260182; x=1701346582; bh=iU
 KfoiyieE1DGUI9X7Vz+GHxmVnHYaFed+v+G/BvXck=; b=tImvZeIRKkTT/5EAVe
 vDAuaN+rvSFT7R8Nn1OlP8DnFIghn5e3ELkKI/aU5W3h4mzGCYMMWxS9UgospzHw
 K98Pc6r+4nsl7IFDxWTPcxqRCd++5AlL+Q0bmfh8VzDO6zDB5YfysB0cD33BFvZp
 S6yfmg96WhwxbHYLbRISAeEjZNVTTJj8i2wfs8XLdf7JK5lOxcbF9qXPdmasnOTU
 pbAAcfcloR5hJuQDnfNTnQKcpXHDYYiTMJechse1wtiLX+ZhaCh9PFvrDnrwiaN9
 C877Ldf6YOPj33qgEJv3+8eHA41uzu562MFEbziCMj1CK7llDhNCNMLm2FUa5QUQ
 0JZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1701260182; x=1701346582; bh=iUKfoiyieE1DG
 UI9X7Vz+GHxmVnHYaFed+v+G/BvXck=; b=jKMiw3l6OhHtKFVtpvDQX/eLQh8DZ
 0jOV4qg6KvZMX20DaYYNJFHLYptFOvO3H7ENbESg6Ve4RRbuT6SsYBnyRxEqpkeE
 x/HgxZpm5WYCh6WjobQIWiivgFcojTqfrQj1mxnX+gkK18CP25QCCEYplJnH9+an
 URxPT+l7QVBBbMnct4lz019bfalWpm8A9/jHEws853ZPYs4ugUfk55DyB/VJR4fz
 JZLpw+xpWDBURr3ZhHaTeDMmuTvF48BvbC0dRaAmlrN6DvIsfo9kf3zvMLf1uVif
 QdCClRwjzhquswc8Rs21P+lG4nlVbRDEe+aVCi5nzj1jA1ACV/ZMH+Dzw==
X-ME-Sender: <xms:lStnZcUsRJHDxRxG_dSuhZ9VwADii1OuLyaBUaOleyeJ6vQt1IrT2w>
 <xme:lStnZQkq0n1F6KwSBbgOj-I48NhWWAbKkl5N64bzGjRpvqXNtf0dGgqmLX7MS2fB9
 E2c3N9ApjUAN0m3-oM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeihedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:lStnZQZU7OlJEJWKpIjm1df0NTm344fRIvukIbSi5fp1lwgP6l3q0w>
 <xmx:lStnZbWWiNu7w2_CS0UeIGzSakeTXh6n2DZQIV6hzgRlqkNynq1IbQ>
 <xmx:lStnZWmNrlF7g21b1NvyW5f2LBPzyhiKJuSGs0AYUVfk9FEQoNnoMA>
 <xmx:litnZYdKbS6S0sAo7gUYz0OpUCXZOu84KjwSIngF9DpYb--X6j0oDA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C59AEB60089; Wed, 29 Nov 2023 07:16:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1234-gac66594aae-fm-20231122.001-gac66594a
MIME-Version: 1.0
Message-Id: <9b9a3ab9-03f6-4c71-b9f3-5349887f3a45@app.fastmail.com>
In-Reply-To: <f541c6e55705ffb76e51dd906164c1a92bb87af2.camel@imgtec.com>
References: <20231129113825.2961913-1-arnd@kernel.org>
 <f541c6e55705ffb76e51dd906164c1a92bb87af2.camel@imgtec.com>
Date: Wed, 29 Nov 2023 13:16:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Donald Robson" <Donald.Robson@imgtec.com>,
 "Frank Binns" <Frank.Binns@imgtec.com>,
 "Matt Coster" <Matt.Coster@imgtec.com>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 1/2] drm/imagination: avoid -Wmissing-prototype warnings
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023, at 13:07, Donald Robson wrote:
> Hello Arnd,
>
> Thanks for this.  However, I fixed these in a patch a few minutes 
> before you sent
> yours.  I'm not sure what normally happens in these circumstances, but 
> as my patch has
> the kernel robot tags and a few additional fixes, I think we should 
> probably use that
> one.

Sure, that's fine. If you don't mind rebasing, just add a
"Reported-by: Arnd Bergmann <arnd@arndb.de>" line as well.

I tend to create a bug fix for any build regressions I see as
part of building randconfig kernels, but it's normal that the
mainainers have already fixed the same bug before I send my
patch, or that there is a better solution than what I come up
with.

     Arnd
