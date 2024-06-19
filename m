Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829E290F84B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 23:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2C110E031;
	Wed, 19 Jun 2024 21:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ue47HRvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03D110ED48;
 Wed, 19 Jun 2024 16:52:50 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a63359aaacaso1086183266b.1; 
 Wed, 19 Jun 2024 09:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718815969; x=1719420769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sg8iq1YbugOa9R8IB28lqgdNNm+1gAxq/vOOtZ57ZOo=;
 b=Ue47HRvo/V2IKdj8UZN8jTHl7j/Ze4U46pV2uAGl5riE3OMneXrs9q8IrG5HgvF3gM
 crjm5GPj7WLdUB+W9rWyPhpvcpN+ltEA922FrAfiPAFwFGc9G2AW0hxmGBsMT9EsH57F
 BWTcAH/wEDjBhUyLh885r0ad/p/kcPz9bovYpxwrGjYgGgcO4L+q+VvQY86WWWVd1ReW
 lk1NOMzu0PNjP9HLU/LIAYJ5xUR7Ql4S3Ad8g4vn643AqRKxfTxshGCxCKCN1f4vwUM3
 /z84Y6JR2og3tcpKXJi+ibClBT6CMynyrQvjDIJyjSPZpyl7WFS7rYOq9L0zzFCzIAJE
 Pq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718815969; x=1719420769;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sg8iq1YbugOa9R8IB28lqgdNNm+1gAxq/vOOtZ57ZOo=;
 b=gN7PLaWOo918iG9FyHIazuWsKKKo/nFaGm9MtsOEkzsl7UAP4UPkhjSwyNrLKODF25
 AlfMXolj4MUp0BjwvKG9PZWLrkX5T0KhwjnBapaSxx4RFXB0uMwzh/wuzjUH6tFEIWUm
 nWDyKok815YqmmwpEHwTy8nORIZaKKBLdEvuISM7EON/GFpbkrTk+gxW8rHw4wGbsNYb
 zyWHEJAox3WBO+CJHwEhKPYqtw+EALc44A0KoARv2zWTNpOHtNBF2Z1XPDeuNecMNi8h
 dHMyD4DKKkl8I3H+s0BYvurXNLtwfyogEnFfx0DsZ6oicPxsmN3MCtmXzlg/ziW5rNsV
 iWwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL2/hx5pSotbAoEfBRxQmUwqxBEvfS0UPhDB6561m8LTQUc5nOY0KIDdbMcezJa/H2AX/odrWB8b9Cq/DKMYD7moL1fdx1jA43/EgdWU6sHcFtWpoCjT2Kg4ESiInBDFIwoILEINyWfN1/qgvkI7us
X-Gm-Message-State: AOJu0Yxi4Y/RlUaitFa7kPcpQNCXPQxKb1JeQvqX52h+lhWhKq0K0FUP
 9C2RRoqgsoFMqMzREbYJzHyRhUM9GApuMSZ31ouY2pKMiYCmi851
X-Google-Smtp-Source: AGHT+IGLVc6V9yHvLlBwOaTLXlaBqSki7ZZ318wMOiFw3bNvll5UDbTnoOeAaDrDMurVE4s7u5vDlA==
X-Received: by 2002:a17:907:808:b0:a6f:586b:6c1 with SMTP id
 a640c23a62f3a-a6fab7756d5mr237803466b.56.1718815968691; 
 Wed, 19 Jun 2024 09:52:48 -0700 (PDT)
Received: from ?IPV6:2001:871:22c:6af9:d5cb:1d01:917c:4b48?
 ([2001:871:22c:6af9:d5cb:1d01:917c:4b48])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f8f934346sm196331366b.94.2024.06.19.09.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 09:52:48 -0700 (PDT)
Message-ID: <63f10133-311e-4c4c-8192-978b01b41247@gmail.com>
Date: Wed, 19 Jun 2024 18:52:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.10-rc1
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>
Cc: Dave Airlie <airlied@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rafael Wysocki <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <CAHk-=wjQv_CSPzhjOMoOjGO3FmuHe5hzm6Ds69zZSFPa4PeuCA@mail.gmail.com>
 <ZmrTZozoi0t/tuva@duo.ucw.cz>
 <CAHk-=wjqHL7KjOWYBVKFewcKPWL7CJxddWfJnvL3AfOqfR8vMg@mail.gmail.com>
 <ZmwHGviv/6J6FQLf@duo.ucw.cz>
 <CAHk-=wigB-wVK+4=NuYJxoKLnoUXB52J5WU2hpKj2de6vGuY7g@mail.gmail.com>
 <CAHk-=wjcdUUip96PnfC+iRjAwPHn3XKsgcohk1ad5VcckCFVKA@mail.gmail.com>
 <ZnABbKrIzmmEoFEV@duo.ucw.cz> <ZnK2bmDFuwX8E5rY@duo.ucw.cz>
From: Gerhard Stoiber <stoiber.gerhard@gmail.com>
Autocrypt: addr=stoiber.gerhard@gmail.com; keydata=
 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
In-Reply-To: <ZnK2bmDFuwX8E5rY@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 19 Jun 2024 21:13:26 +0000
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

Hello!
>                              
> Ideas welcome, especially some way to see what graphics is doing.

I'm unsure about the distro you are using but try package intel_gpu_top. 
It displays irqs/s and a bunch of other utilization statistics.


Hope this helps.

--
BR,
Gerhard

