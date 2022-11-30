Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C0763D95B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 16:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6CC10E489;
	Wed, 30 Nov 2022 15:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5B410E48C;
 Wed, 30 Nov 2022 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oQ9dPsuO3NH7LD/dPayMRzr2bJuPWc28ti+5YXyo6Lo=; b=h6hMWKg1nF8fxST1CkhnfvYovh
 ufRy684CUnMt5QyuAmcYo14AF5YDB2vyNT3O42Y2fKH3Q5GISG6rqCI2F2uaQQyTjkgg4F5hfT0rN
 AqEX9MH+8uyV/K6AYPa177HqQBd1+gAcIlkcHi9V5/LP69UppHI4YcS1ldcG6v8XEYuA0jQmyQrvV
 KOV5ZtWRl/nprilkrGXDr0LbaXCkIiTY0YAsg+3qFD99cefkB5WTRQ6j8shE87MNfmdYij4h5J2F2
 Wes50rDCDJBtwWKV8XVn9aJN8jPs8Qa0B+3fgkvOqfUdA43xW5JDhmp5CSbcziKlhyRqVfX+RZDxw
 t9Ci+U7w==;
Received: from 200-207-99-62.dsl.telesp.net.br ([200.207.99.62]
 helo=[192.168.1.111]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p0OwH-00BgmO-9q; Wed, 30 Nov 2022 16:23:57 +0100
Message-ID: <2dbf222e-7694-ea5e-c35d-663011c16e84@igalia.com>
Date: Wed, 30 Nov 2022 12:23:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 0/2] drm: Add GPU reset sysfs
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20221125175203.52481-1-andrealmeid@igalia.com>
 <20221128112528.1206b1f5@eldfell>
 <584UdQAqoPr4vSxCTJg70LFQm--HpHH-EhnAo78lRAZ89OnrDkUeKlTnDGT_DMzDT3PeEtmXNsrqB6GuiV4TsZv3pBU8kFWjyPLWGrevIMw=@emersion.fr>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <584UdQAqoPr4vSxCTJg70LFQm--HpHH-EhnAo78lRAZ89OnrDkUeKlTnDGT_DMzDT3PeEtmXNsrqB6GuiV4TsZv3pBU8kFWjyPLWGrevIMw=@emersion.fr>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, amaranath.somalapuram@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, contactshashanksharma@gmail.com,
 christian.koenig@amd.com,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/28/22 06:30, Simon Ser wrote:
> The PID is racy, the user-space daemon could end up killing an
> unrelated process… Is there any way we could use a pidfd instead?

Is the PID race condition something that really happens or rather 
something theoretical?

Anyway, I can't see how pidfd and uevent would work together. Since 
uevent it's kind of a broadcast and pidfd is an anon file, it wouldn't 
be possible to say to userspace which is the fd to be used giving that 
file descriptors are per process resources.

On the other hand, this interface could be converted to be an ioctl that 
userspace would block waiting for a reset notification, then the kernel 
could create a pidfd and give to the blocked process the right fd. We 
would probably need a queue to make sure no event is lost.

Thanks
	André
