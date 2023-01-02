Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C897865B331
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 15:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF5910E188;
	Mon,  2 Jan 2023 14:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3037E10E188
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 14:09:04 +0000 (UTC)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id A39E660027FC1;
 Mon,  2 Jan 2023 15:09:02 +0100 (CET)
Message-ID: <664cb6b8-3f84-8627-cb35-52fdabad186c@molgen.mpg.de>
Date: Mon, 2 Jan 2023 15:09:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Problems with delivery to dalias@libc.org (was: [PATCH v2] matroxfb:
 G200eW: Increase max memory from 1 MB to 16 MB)
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, "Z. Liu" <liuzx@knownsec.com>
References: <20230102140206.6778-1-pmenzel@molgen.mpg.de>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230102140206.6778-1-pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 it+linux-fbdev@molgen.mpg.de, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Cc: Back to dalias@libc.org]

Dear Linux folks,


Please ignore version 2.


Am 02.01.23 um 15:02 schrieb Paul Menzel:

[…]

> ---
> Update Rich’s address.

I should have read the undelivered message better:

```
<dalias@libc.org>: host brightrain.aerifal.cx[216.12.86.13] said: 
550-Message
     blocked for policy reasons: 550-Your mail system is forging its 
hostname.
     550 Message could not be delivered (in reply to end of DATA command)
```

I got the same for dalias@aerifal.cx. No idea, what is supposedly wrong 
with our setup:

     $ host mx.molgen.mpg.de
     mx.molgen.mpg.de has address 141.14.17.8
     $ host 141.14.17.8
     8.17.14.141.in-addr.arpa domain name pointer mx.molgen.mpg.de.


Kind regards,

Paul
