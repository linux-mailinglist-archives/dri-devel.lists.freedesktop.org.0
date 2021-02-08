Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D9314449
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 00:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1CE6EA2C;
	Mon,  8 Feb 2021 23:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D236EA2C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 23:51:32 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d24so6329621lfs.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 15:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f1ksRfHxQP91F2cobjQCnH7KkqQZ/RBpiypTVeBwL0o=;
 b=Lt1l31FFOyW86MHPhM2dmlp3CnNjnRF35I7kJCzBdAjfBXZt2aOd17ubGFSh/9snq2
 Em/eRjrj32oV9PC5MCVddOkJfTYb8UwvO1fjDEMIzusRgmdyIG3wRdcTHKIMnK58Jqrj
 aPuSUzx/WBihzdrU/9pN3jImIs2zrz6dEfE/OBy1xlGsZamicn/FI8GdJ9e7AEUHsI1w
 WlgQJylgHnEQUorRg5HM00epDUZpSE5mDoBp+TWgcQYket2uTBNCIqs9wTDsofITgRTW
 6pSsP0XVm86nN+0iqMnkXlGb+BdU8QVzzR2JQ18uLADxnMszu8VvhvH4LeOpQcTMZZU3
 JMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f1ksRfHxQP91F2cobjQCnH7KkqQZ/RBpiypTVeBwL0o=;
 b=XGdAwa3zt7LHMFPWCXKffyls4gi7pwRa5gyMKNpqcthaxLgjUn6NQQGf3w5ykO7wjY
 E6YFVWRRVg7TthM+nLyDoyE/yhJdWzIQQh56HQgWKGsDsOQNBWvK4gT++pVlO59CUJoF
 IG0VfneHDVyon9c7m8k9przxEYdSi3xKzVM1Glba3X9uQ39bl9Xg6LnArnmaDAvCQjUp
 2tGYM1LZfstbw78sx4n1UcIoyEd9/+MqryNPz+LdDi7IaMgC0zpeSuAiJIUtwSwFFE9Z
 KIMAbsYem7XHaKLQm7TvIXFkFbRei6DyeL+hYFtirGd0Vo4bgP2FhkD8gIIc+GHy38sc
 /jQw==
X-Gm-Message-State: AOAM5324ksKPxuTfeghGEOO9h6LvEbba0AgbTOETA/egZbe02KxO9TFH
 1HeNu6kvjZ1ws7/hNFKgcM1E4GDxrqYsM7KI3CfQ5A==
X-Google-Smtp-Source: ABdhPJwMzLsIQHn0nFSXjP8TcUTQ0TXQ8EQhTsBbFxlwIDjytkG5rhfFU2ED/MBCcaL0uN6XwAIvfDNm9L0PApMvbHg=
X-Received: by 2002:a19:ca14:: with SMTP id a20mr6347761lfg.567.1612828291075; 
 Mon, 08 Feb 2021 15:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20210129030514.1231773-1-john.stultz@linaro.org>
 <27bd6340-617a-37a2-d17f-8e50b5d5362f@linuxfoundation.org>
In-Reply-To: <27bd6340-617a-37a2-d17f-8e50b5d5362f@linuxfoundation.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 8 Feb 2021 15:51:17 -0800
Message-ID: <CALAqxLWR0h+qzJeRVWe4gpDre7u=Kg7mgnxTv524xXEviZhZdg@mail.gmail.com>
Subject: Re: [PATCH 1/5] kselftests: dmabuf-heaps: Fix Makefile's inclusion of
 the kernel's usr/include dir
To: Shuah Khan <skhan@linuxfoundation.org>
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
Cc: Sandeep Patil <sspatil@google.com>, Suren Baghdasaryan <surenb@google.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Laura Abbott <labbott@kernel.org>,
 linux-kselftest@vger.kernel.org, Hridya Valsaraju <hridya@google.com>,
 linux-media <linux-media@vger.kernel.org>, Shuah Khan <shuah@kernel.org>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 8, 2021 at 3:23 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
> On 1/28/21 8:05 PM, John Stultz wrote:
> Thanks John for all these 5 fix and cleanup patches.
>
> Applied to linux-kselftest next for 5.12-rc1
>

Great! I was just prepping to resend them :)
Thanks so much!
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
