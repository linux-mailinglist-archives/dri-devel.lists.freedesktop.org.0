Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640330D4F4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7346C6EA17;
	Wed,  3 Feb 2021 08:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCA86E25A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 02:33:23 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id q2so10451160edi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 18:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=EH7eli1reNhvqze1So90O77LsgQINkcNkiUZRGmykgg=;
 b=tsTiMEA94ozApnrFbE+jP+a35VXpwLM7H+dhzn1dqSp16jWygBUtKH4Z5byFBpHahX
 p2QBi/mgYTmMN9kLRR8ZrTeWqoFKBMIx7q8verhrilvPXCIXvl7VYJpLzWyeKLY3X0fs
 dRUae1MmpPI3hXTMnYSJBEgj3drQT/XtGl5Lo6WamUdGe3z6IHRkcWT+JQsxFHYL0Ijs
 qVthlj6i/zbzWTkKFRxmVCW9G9A4vge/deWnnqDHwyAhtfrM6Y1AGC+wrwn8AFtJfPq4
 iLw1tBCH4T8zSVnv/XrvGr33sU4NNoOKsxV62eYFApqfTDxA8tN9SZaqzZ/5I7RaPjG3
 znWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=EH7eli1reNhvqze1So90O77LsgQINkcNkiUZRGmykgg=;
 b=n5JshHjth5OUBgDsWDIoBdKM2kIhMQKBCZa8DpJyN6wEU2Hm5krREo+4SO+KpBI3bg
 1CO1rzaEyqGPzfo6r2amJF5x9SSs8oL5xsxBGxsvUZEcnOS1S6eNp0q6VhO90xo6NRwD
 yKOtEYtiF7+yiYvz14XKiSUwFeuwWSRc0hhKPu5ZaJLdSYw7PnPBSSTxE1k6lfr/nbNd
 eYxYa1msJhntBFjfWNAJMUAiyZHea6GKjWC5rHfZG8gAMEuH9mjDE2N3Nv9+GERKFR7R
 aYXtO8MCiYlYQlZLmUGdJVit13i0NC8FP7wmJbHthUMRNgKj2w2MWpYdM3srNm/yaFt3
 xV3g==
X-Gm-Message-State: AOAM531QihYJEJ+ULm6BlgjZQdL7rXQwpN4+49elP8a/LWV/bsj/Gc2S
 CN2XWAo6kvFHU3Lmr4Na+iAWB2UhWzzyqSVt8Wg=
X-Received: by 2002:a50:c94b:: with SMTP id p11mt890850edh.388.1612319602096; 
 Tue, 02 Feb 2021 18:33:22 -0800 (PST)
MIME-Version: 1.0
References: <1612194898-44732-1-git-send-email-driverfuzzing@gmail.com>
In-Reply-To: <1612194898-44732-1-git-send-email-driverfuzzing@gmail.com>
From: FUZZ DR <driverfuzzing@gmail.com>
Date: Tue, 2 Feb 2021 20:33:10 -0600
Message-ID: <CABF6pWFsxXuLM_hh3y-0AmzF69vwTFX5YBeEnZjNUoBoiZD7RA@mail.gmail.com>
Subject: Re: [PATCH 2/3] fix the out-of-bounds access of dramsr13
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: linux-fbdev@vger.kernel.org, Thomas Winischhofer <thomas@winischhofer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: multipart/mixed; boundary="===============0921196161=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0921196161==
Content-Type: multipart/alternative; boundary="0000000000002655d805ba6569c8"

--0000000000002655d805ba6569c8
Content-Type: text/plain; charset="UTF-8"

The patch in previous email is a stupid mistake, please ignore it.

Thanks.

--0000000000002655d805ba6569c8
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">The patch in previous email is a stupid mistake, please ignore it.<div><br><div>Thanks.</div></div></div>

--0000000000002655d805ba6569c8--

--===============0921196161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0921196161==--
