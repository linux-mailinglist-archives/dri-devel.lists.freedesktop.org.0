Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5A660C455
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9887410E146;
	Tue, 25 Oct 2022 06:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE9F10E459
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 16:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666630397;
 bh=aQXL6HsBM0PBhw4P2ZBfupcRtHh2BCUCWB6pB0nA23A=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:Reply-To:From:
 In-Reply-To;
 b=WCOSv/OaqIINzfZx0jBUUTkbXnykfxURG6ruovKabxfrCD6fNeVoVhmCq21VRSd++
 EdQbDbpUxlEjg7oWjpar//QTofPzNMoh6gM7CpfsBOFv8CGrEGAlf6G1SsdUu6XjUq
 PP41vWtYDNgsl1y/EnuiKNQm0ZkAtDoH673JQmL8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.179] ([91.141.38.147]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1p5Vz70NpM-00uMMC; Mon, 24
 Oct 2022 18:53:17 +0200
Message-ID: <d6afe54b-f8d7-beb2-3609-186e566cbfac@gmx.net>
Date: Mon, 24 Oct 2022 18:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [Regression] CPU stalls and eventually causes a complete system
 freeze with 6.0.3 due to "video/aperture: Disable and unregister sysfb
 devices via aperture helpers"
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <bbf7afe7-6ed2-6708-d302-4ba657444c45@leemhuis.info>
 <668a8ffd-ffc7-e1cc-28b4-1caca1bcc3d6@suse.de>
 <958fd763-01b6-0167-ba6b-97cbd3bddcb6@leemhuis.info>
 <Y1Z2sq9RyEnIdixD@kroah.com> <51651c2e-3706-37d7-01e7-5d473a412850@suse.de>
Content-Language: de-AT
From: Andreas Thalhammer <andreas.thalhammer-linux@gmx.net>
In-Reply-To: <51651c2e-3706-37d7-01e7-5d473a412850@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:oXxMU3rv9x3UT4ue7ukIwZ6SdCPVZxqtw7T7v5iUBbb/swy8ZGW
 OEh7ZMfxoCabHFhNrQ+9g5tniFWizkiG8musEV22cHvnKWGv6TqOLtXFcVLdn05V4SAtO9B
 gSiuLrNIOEtwt0Kc1CQhB9OxWwfzXaRZjtbm1eVQ020qS/samJk8Ej2vDsEAn0XgA0Dij29
 MhQ/XUcxtLn9bZYYdsoOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ovny2x/YLUg=:Au3NRZZl4J3Ny7mGN4/4g4
 OZcGRDOsYyBxA9+kFLhVU52E95pp1of66zJbSWquO6JAV/8ot+98WgfqTy4tpon6cmXRkG2DL
 AP9GEJxvVoUUDiK2jin1rsH9nxUspn0bVgITIyqHoUxe5lNhJKDt2CX8X88TzSvtWVZsf/Y4n
 BWHLWN7uk/1flbEoH1YTM4mw5pfprRMbqYLP62UQNa+iv2KJn7Q16if0w+uv7tFYYokSQzEUX
 yOONXD6S8yCbRdvVk0opxB/Ku9D0mnUZZ6Lws4PAVQMq2MKrmLNOUg76BwNTCiXQPn5D7vbUW
 LHpQfepQCY/558yfOYg82xM8tYUrtVIJZhn8s1aF0zjv96gqqhnnNzGD9xBfpBQSrL6Tc6GIX
 iHvHOkINI+KkdIgwlT7FSyG1jEDTg1lrBQqjGkkFTB4wM8zMCsl8+Oavba2gdTXj+n8C0lZHR
 9BZhSSsZDdxBaZv3P+ce0wQ+H1WEYT+iqwAZvwXLIbrYabCUcIUgLD4WOiJ8eSGRK6dDbLJoh
 78KhsEYHmf+tDX6Wskqpz8pFDGGuvymKsxWM8UbmcQWBj9evlyhNAuv55QyjDCeTNveVCgJW2
 xlFqcq8OmEKJS85lTi5jThUy5j+ujO0Y3wDoN4UPKQykBhFpUhU+XZdP+yCAne2AojyzxLJqg
 i4NX3z1iRb0lGMg65DVNpcEb0IoTkNyoJzZuveRKoqjMng8oOcWoJ6c36eE1KdnPbjhNl8oQj
 qrqnOOYOBoY0EYttWVcsVgPXiMX5ANiZZuL7eZxZAwqhOPKuuOA1mJgsPc9WYrvJ/oGrvRjAa
 3mMRMf/5wTaCOz4WePbU1xfGfbz/07RhphxydbMqwvORLbPRH57UvbCmNp8QJxU1vt0FlvoTH
 0KwUG9vVjK/+DanWhhrEB0ywVyoVdXMBYSpVPOrPnuxDqJnViaOA6WmUJBk8ZwDuzQDxYNb3f
 AqphM44+eA55Ce1hDjmE5rkuMUDiw2BI5QS/fQCmQDzoiVlKl9AYY60XO5p/ycdAEtxR/7ED2
 qnGCFWVRF/pSxT0PRtxlE8RttwfrzGjd2BrssHlaogFEv6jk75EdoDwUD6aXFgiZsLG+SR1PB
 3Ivz1CuNE1wQ8Th4nVeu+H0y2viQw/vP3gEawBucvvhen6VCXj3EOxA1Ccenuk32fZ8YRKS1+
 c4bGysCXyqQf94PvOU05Eymxa9W9O87MQFei3ZRAQr6JFMoLC04DDrvNq/ZD/22eiauFndT1Y
 yOU558RssfigXCnGg6cFUPTKSqCquzAOR+sWEwCOpgmLP5XmEu2fvJWY+t6166U9EuaiwL5Kp
 uKpEvZ/TFJzpzP9pVcPOpv71uZyTPhJST4F2rC0irjc2bEeBuMD4HkvIU3MlgX62omIkqBMLV
 MtR3S2CnkD67ksrx1UAJi4bUF1wN8c9FshYLb0xLVFDUYFT/6UVAr10uufLVRh2chTqHj4rVI
 3cf0warK9QykkHhFlpAVJvU1pCvikgBx1q6G3ToJXjaKlqklQC8XaBtSBt++N6A6CuLf5+GNH
 YYGA9purb8BtmmZe/CsENEPHJX8GmnWmXPNpsi+rq7P51iXPAJh5m1P7/SuElnvvjpA==
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:02 +0000
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
Reply-To: andreas.thalhammer@linux.com
Cc: Sasha Levin <sashal@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just tested with 6.1-rc2 (tarball from kernel.org), which works.
