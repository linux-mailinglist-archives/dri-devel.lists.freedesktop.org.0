Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CD5188746
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33BF6E1B5;
	Tue, 17 Mar 2020 14:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199876E200;
 Mon, 16 Mar 2020 16:03:52 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id s194so5018392vkb.11;
 Mon, 16 Mar 2020 09:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wvAykn+Mcr48Ojibon31AtsUmNWJhzG6dtX2WjIFvrU=;
 b=t1BvX3yVB2R9tmBfuDY6pphhyYF6retC69h3FAI0/gfGt9Io7MPdaGzm1W01jFLN+y
 zMyGXiXjd2WKMAq8r76HjqMZYnpbCaKzXTjcXtP7BSsaOPgiivErMgPx35/hvD7s+pTr
 WzNzEfltN0FEXT2RoqsKdfRaWQvqw4otcIBQDwOriZD0ascLn7WAwtgNh0yjH3mD0IXK
 Bjdj2PKbL4K40EJaNMhJjsHDZvpkBV7Uyh8rwbC4Nyx7olYWfW591Ic1fO5GvjZZF1J+
 +mIuFGsb25nh8oXKlAv9rjiDiykCgBVMhAYhvolIcOxXZgkxoVTl2FSP8LA9yQUyF/tB
 e3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wvAykn+Mcr48Ojibon31AtsUmNWJhzG6dtX2WjIFvrU=;
 b=WCvCeDO9HanQvyFAWmmqZYS5iC+GghAu7Zgd7pnTGyW/NKmF98xHlC9Odylp52QuOf
 su1jVgE7b+6rDCn7ryigUvjV29Xx/Ui82zYugPzmKJlcM0Nv/sCh/ZmOkgMY12yjAyjZ
 4wnUcsMrjvbhNFSIdxCnvL6U2GkXCH/wdGifxLCoqEq6fzZH2U5Silcws/wCSQuNqvRO
 1MxLYI6v5/0HYGrLQ74Cf3jDLv+bHQs/JpSkCs9HxnkQDz2ec1d4Dldh5k5t0byZXFLZ
 Lrmd3bVsvJfsM4L4XeY8skDSrMh3z6L+dK8TcK45m9lYGgjwbgULfLdmI15NS+Eht63o
 svJw==
X-Gm-Message-State: ANhLgQ1WvavX3OmTHI+1uSprGJ/xQcsPYQYLyvLamS2fBQ3Iw8uth6C2
 QuNkDCmd+7cVCu3Zv5CVWStSa18VRZFyZzTiCiE=
X-Google-Smtp-Source: ADFU+vv3SwnAmTdBSAzsRnok+WaPqKzhoy+IoMoYlvkIcgp0kTVHXlO5misQRZzsDL3H6GJdMn8ZZJvgwSZhgiOjpOM=
X-Received: by 2002:a1f:3d05:: with SMTP id k5mr592007vka.76.1584374630936;
 Mon, 16 Mar 2020 09:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com>
 <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
In-Reply-To: <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
From: Tomek Bury <tomek.bury@gmail.com>
Date: Mon, 16 Mar 2020 16:03:39 +0000
Message-ID: <CAO1ALzkG5maAqgOAm9xfi7fg5+Zv-_N+SUAn-JnmGL5WbRkXrQ@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: Daniel Stone <daniel@fooishbar.org>
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> vkAcquireNextImageKHR() [...] it's the application's decision whether it wants a fence, a semaphore, both or none
Correction: "or none" is not allowed
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
