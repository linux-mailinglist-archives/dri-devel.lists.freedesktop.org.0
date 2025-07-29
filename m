Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58B2B150D1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 18:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8752610E07B;
	Tue, 29 Jul 2025 16:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="p8ulU+Nf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC03810E07B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Vj2Y5Htk0TdwQIPD29EKrTANnYA57kMQx2/+EiD5PZA=; b=p8ulU+Nfn7Z+lRd63HWUpZDRGu
 3clUC0Bin8TVQ+eSuOwAVxh0/ug/HmZXpgolSMwzSQWgEO6xUFB0TEI5zTcAI5LCX2NDMn5Ck2JV9
 p27oo3x2F8BM8zfzMD9+X15imt5minFPXuIBDyd1h0dbj+Rv/89ICAqkibrH+qblBRmrfRhlYfMSW
 1DpcywvrUhRCZfj5rXtPqX4xOMx5KzefKZ7a3g3iNFWKa/0tHKcnRr9cYNdamQqJGcm//a664JS/5
 vsuqTgysPb4stxN6Q5UY9epYGFcW7uIJOiq3AccMZhVDF/MEeVTehuzyVKzL1qxgNn/JkEodzvOOi
 lXc7ihjA==;
Received: from [50.53.25.54] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1ugmpv-0000000CefU-29Dl; Tue, 29 Jul 2025 16:05:56 +0000
Date: Tue, 29 Jul 2025 09:05:52 -0700
From: Randy Dunlap <rdunlap@infradead.org>
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linux-leds@vger.kernel.org
Subject: Re: linux-next: Tree for Jul 29 (BACKLIGHT_KTD2801)
User-Agent: K-9 Mail for Android
In-Reply-To: <5002743.GXAFRqVoOG@radijator>
References: <20250729153510.3781ac91@canb.auug.org.au>
 <b6c481bb-e854-405e-a428-90301789fe20@infradead.org>
 <5002743.GXAFRqVoOG@radijator>
Message-ID: <B2E29C08-674C-4D8A-B187-7F6A6B5DC76F@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On July 29, 2025 2:18:16 AM PDT, "Duje Mihanovi=C4=87" <duje@dujemihanovic=
=2Exyz> wrote:
>On Tuesday, 29 July 2025 10:32:13 Central European Summer Time Randy Dunl=
ap=20
>wrote:
>> so BACKLIGHT_KTD2801 should:
>> 	depends on GPIOLIB
>
>Sounds good to me=2E
>
>> Also, in drivers/leds/Kconfig, does it need duplicate entries for this?
>> Can't the second entry be removed?
>> (asking since Duje made both entries)
>
>That's an oversight on my end, and as such the second one (the one inside=
 the=20
>"if NEW_LEDS" block) should be removed=2E
>
>Would you like me to send a patch to fix these?

Yes, please=2E=20
Thanks=2E=20



~Randy
