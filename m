Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09D8A854BB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 08:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F2510E07B;
	Fri, 11 Apr 2025 06:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=asahilina.net header.i=@asahilina.net header.b="qIzyLriz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4A110E07B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 06:54:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 8516C41A36;
 Fri, 11 Apr 2025 06:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1744354444;
 bh=ORvObUBDvUZptnQ7XIrGeR4mDqIP57xKuS6cgRYJshI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=qIzyLrizaTZhtC/G8bDSXffhMbKyim1wIPe5LB8GSRO9A7w+tXWcPwanYGfuSfSpV
 xIvgh1euLie4zr9bgA5mmc4vm1oayCFJBScHj+REHveXAP/WtQmBRggpFcs9r92WtE
 THr1/v8Lp31Qgqy0sgXiHBkkSta7UxTaFa6vE7KuAE0RrNHf9iwc6fwTQh/MjRhxRY
 tMZvxrx+nacrKhkRb4ypuB3pmHFAJBwioix/IVWXzANRXSRY99BsI6Mves1J0EiYiU
 wELK9WExvAsS3jaOAJXAeAOPIjfbIiKRfR6MIICBpQfUil5QhEc483ga2b/i7Q6OfS
 Zb7cFkpLhLwQg==
Message-ID: <664d0f25-ac38-420f-bdf1-21ed7add726d@asahilina.net>
Date: Fri, 11 Apr 2025 15:53:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] DRM Rust abstractions
To: Dave Airlie <airlied@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 acurrid@nvidia.com, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250325235522.3992-1-dakr@kernel.org>
 <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
 <Z_VXBZcBsk2k6eVN@cassiopeiae>
 <143206f6-cd97-4ef8-a4f3-f68d703903bf@asahilina.net>
 <Z_V2ZxIZxI_HiHM5@cassiopeiae>
 <ebbb4d4e-4778-434b-82d7-188f8f6152ff@asahilina.net>
 <CAPM=9ty5dNQOJUj=wtubGYGt5Kt3QeQAQ9rjM2P0dwjBUFspMw@mail.gmail.com>
 <34a4a130-98d1-4cc3-8dcf-b72b3ed36c10@asahilina.net>
 <43ec8aba-f279-422d-95d1-68daac7eaed9@asahilina.net>
 <Z_ecMl2QtAssfczJ@pollux>
 <88270028-7541-4184-a118-96c182109804@asahilina.net>
 <CAPM=9tyXAdaota38cgeQc86teEebe9XOnBTZ+aDBZpzEBApD9A@mail.gmail.com>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <CAPM=9tyXAdaota38cgeQc86teEebe9XOnBTZ+aDBZpzEBApD9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 4/11/25 9:43 AM, Dave Airlie wrote:
>>
>>> However, I understand that you prefer to have primary authorship, even if the
>>> code has been re-organized in new commits, moved, modified or rewritten.
>>
>> Correct.
> 
> For anyone working in this area that is intending to upstream anything
> from asahi, I think if code is rewritten completely it's probably not
> consistent to keep the primary author. Copyright doesn't cover ideas,
> it covers the code.

I think you're conflating two unrelated things here. Copyright has
nothing to do with who is the primary Git author. As far as copyright is
concerned, Danilo could submit everything as-is. Since I'm still
mentioned as co-developer, there is no copyright issue. The primary
author story is about FOSS etiquette, not a legal argument.

If you "rewrite" (as in not directly copying and pasting the original)
code while closely referencing the original and retaining some/much of
the substance, that is still covered by copyright. This is why the
clean-room process exists for reverse engineering, and why the Asahi
project has rules that it does not accept code from people who have
exposed themselves to Apple code or disassembly in most cases, and why
both Asahi and Nouveau rely on black-box register and memory tracing for
reverse engineering GPUs.

If you rewrite code from scratch without referencing the original at all
and without retaining any of the substance of the original, then of
course, that is not a derivative work, and the author of the original
would not have to be mentioned as author at all. This is how projects
like Wine reimplement the Windows API.

In this case, Danilo "rewrote" (I would say refactored) the Device
abstraction. We can decide who gets to be primary author, but I don't
think any lawyer would advise him to completely remove my attribution
entirely, implying there is nothing left copyright by me.

~~ Lina

