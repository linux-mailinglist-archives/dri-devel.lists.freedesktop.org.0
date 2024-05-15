Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB08C6206
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 09:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F2D10E00C;
	Wed, 15 May 2024 07:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="asAaV+Xi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07E510E00C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 07:48:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E3B13CE1371;
 Wed, 15 May 2024 07:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66D7C32781;
 Wed, 15 May 2024 07:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715759282;
 bh=7+Rm9slZp7s5VN1EMhP2yf5x2G6kbVKBXKCd/UkqlM4=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=asAaV+XiTWpRtr/53VyBjtRKjT70kq+L57IcLebru/ozd3/6tDpF6QLNbFPW7K3gM
 DLpKBBqKI0O+sufJdOtbAsJ79wlfNcv+Uc85KJshD2+qlnc5P9nbF0fgvSryWNg0Xi
 btBfa70afOK1PwrvyQI7UFTJ17CDJVORqPorkDJjvUePg1GJd5CmRSjoInpidgUC7G
 ZLoc/RftJhQIem0HTsVoudNijaBN9b1YbeOi04GNbz+j6cjnXxShprq8PMFYgTC6MF
 iHXBAGkT3ttK1Lndkeyh/TBn6r+SFVTNmfuzAVvKa3DkeIxKv+pfXn348yo/PRO+vf
 ZjHsWCB6Fjf3Q==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfauth.nyi.internal (Postfix) with ESMTP id C57E31200032;
 Wed, 15 May 2024 03:48:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 15 May 2024 03:48:00 -0400
X-ME-Sender: <xms:sGhEZjZ2gZSgOcEaEixOE7W1VlXD32ttp_zgD9gGIu0vkBDFwlJosA>
 <xme:sGhEZib1EaFq3rct_1jI7x4lIiwh-zePANKVB6_BYz5OlbMpPKpegcbpzEtaEGMbm
 B7vVETCbx-FnzxUR8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegjedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
 frrghtthgvrhhnpedvveeigfetudegveeiledvgfevuedvgfetgeefieeijeejffeggeeh
 udegtdevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudej
 tddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusg
 druggv
X-ME-Proxy: <xmx:sGhEZl_dTaFyJaVAMtSf8UIwFESqX5NZ9AAANd-fTDlNx4CRewDQSw>
 <xmx:sGhEZpoHgl15LrdhdbtCus11HSKbDai1YZx8fWoOWJ9yr5GNWj8H4A>
 <xmx:sGhEZupcbW2ri4W-vtO-Qw0-MNjYTOCyScod6gjFQAXagUoNOt4Tww>
 <xmx:sGhEZvRnqe0zoluW3buZV1Oc4pdjdwCIgc5-HcHuKpKHSHEGMM1GxQ>
 <xmx:sGhEZmoMFEQooAYaKtCnJaCuJiEJ31sG8oiq-XvEc8qi-O1GV450kt5w>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 89646B6008F; Wed, 15 May 2024 03:48:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-455-g0aad06e44-fm-20240509.001-g0aad06e4
MIME-Version: 1.0
Message-Id: <5c992610-0716-47d1-97f6-65901797aa8c@app.fastmail.com>
In-Reply-To: <20240514130858.3048650-2-schnelle@linux.ibm.com>
References: <20240514130858.3048650-1-schnelle@linux.ibm.com>
 <20240514130858.3048650-2-schnelle@linux.ibm.com>
Date: Wed, 15 May 2024 07:47:29 +0000
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Niklas Schnelle" <schnelle@linux.ibm.com>, "Helge Deller" <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Heiko Carstens" <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] video: Handle HAS_IOPORT dependencies
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

On Tue, May 14, 2024, at 13:08, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=n will disable inb()/outb() and friends at
> compile time. We thus need to #ifdef functions and their callsites which
> unconditionally use these I/O accessors. In the include/video/vga.h
> these are conveniently all those functions with the vga_io_* prefix.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
> Note: This patch does not depend any not-yet-mainline HAS_IOPORT changes
> and may be merged via subsystem specific trees at your earliest
> convenience.
>
> v1 -> v2:
> - Moved vga_mm_r(), vga_mm_w(), vga_mm_w_fast() above #ifdef CONFIG_HAS_IOPORT
>   to use them in with or without I/O port variants.
> - Duplicated vga_r(), vga_w(), vga_w_fast() functions as non-I/O port variants
>   to get rid of in-code #ifdef (Arnd)
> - Got rid of if (regbase) logic inversion needed for in-code #ifdef

Thanks for preparing the new version!

> diff --git a/include/video/vga.h b/include/video/vga.h
> index 947c0abd04ef..468764d6727a 100644
> --- a/include/video/vga.h
> +++ b/include/video/vga.h
> @@ -197,9 +197,26 @@ struct vgastate {
>  extern int save_vga(struct vgastate *state);
>  extern int restore_vga(struct vgastate *state);
> 
> +static inline unsigned char vga_mm_r (void __iomem *regbase, unsigned 
> short port)
> +{
> +	return readb (regbase + port);
> +}

My first thought was that this should use the normal whitespace,
but I guess the file is pretty consistent about the style here,
so I agree with your choice here.

      Arnd
