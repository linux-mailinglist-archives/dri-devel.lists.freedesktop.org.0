Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0736E39B625
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 11:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794236F5ED;
	Fri,  4 Jun 2021 09:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1CC6F5ED
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 09:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622799697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vInzNIEC7qJ5S09yd5rz53tVm0jzaytwZERB+pVm5Bo=;
 b=htpY4lpQguWBi3+PVNP6ZC6SycmRan5tqAwMpG7howyo7zqonwu8w7+zELF4U59lYYcK5/
 A927JroqudO7quVMDwkaVJuU/kmYpsYZaBXjBsUHta6pv8mZw4XC9swQkXMMdLS/dKyA+0
 K9p4hBtXYJKF1fMz/8cuxQjIAVG7stI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-x7-P2L3lM5KYqpFKYZiNVw-1; Fri, 04 Jun 2021 05:41:33 -0400
X-MC-Unique: x7-P2L3lM5KYqpFKYZiNVw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v15-20020a5d4a4f0000b0290118dc518878so3713451wrs.6
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 02:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vInzNIEC7qJ5S09yd5rz53tVm0jzaytwZERB+pVm5Bo=;
 b=BOYEZ4CIvkazho/lL6RBQWyjRGPTUbZWRbOyXiDnVoKNmycK1kYqtRl8t9btg7TX1p
 +6F+p2C+GUIQAEyKlj+kLOzSMf8dQXPnevgz09lnEq6rROjSSI1QKKb5NO0ZgcVeSj0Y
 Rx50qnhu9edjFUm6QkhaLzGHZk8yUi1RWMaoHLMu3cj/lfHSDd0ID9cR6NXkJyTpWEVV
 JTOvipueSpamsxv9k+yrTKbKdgthnQS7L4bDCAsqppB8hrou2ZXKRsVAhjxA9uG8HP8E
 my1WUGLvu9n8uYo70ZMDb1rq1ZKXo70EjPM4tNpy+kXNailJ1iz5r5ewqXfhy6ye6vyA
 uFeQ==
X-Gm-Message-State: AOAM530/J4qgBki73lJMUEMGLHoJhLH1ncEkhjnmX6SEKuGX+D0c3X3f
 EZ94csC2tYN+SrmOFp3VXA6jE/OUIYENKULFVfkrsJMGcsgwsRYCtWt3hblMso3NoGwRUJRAFia
 FE/mDigH6zoskDDsZKKFTfAVsbbIQ
X-Received: by 2002:a5d:4b05:: with SMTP id v5mr2924891wrq.330.1622799692506; 
 Fri, 04 Jun 2021 02:41:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhdTfU1nuBk4nI718hAXg7aCCY0AbwUXs0SHoQeG2N7oNmbQ2psiZjVGvncyM/3mEKj6kYbw==
X-Received: by 2002:a5d:4b05:: with SMTP id v5mr2924840wrq.330.1622799692240; 
 Fri, 04 Jun 2021 02:41:32 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id u16sm6643628wru.56.2021.06.04.02.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 02:41:31 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] allow simple{fb, drm} drivers to be used on non-x86
 EFI platforms
To: Borislav Petkov <bp@alien8.de>
References: <20210601145912.774054-1-javierm@redhat.com>
 <YLk7HjX2OnLhMt4V@zn.tnic>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <c48c6261-c9e5-29cd-8d43-6dbbcb2034ff@redhat.com>
Date: Fri, 4 Jun 2021 11:41:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLk7HjX2OnLhMt4V@zn.tnic>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, Joerg Roedel <jroedel@suse.de>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Chester Lin <clin@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sudeep Holla <sudeep.holla@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Borislav,

On 6/3/21 10:27 PM, Borislav Petkov wrote:
> On Tue, Jun 01, 2021 at 04:59:10PM +0200, Javier Martinez Canillas wrote:
>> The series touches different subystems and will need coordination between
>> maintainers. Ard Biesheuvel said that can be merged through the EFI tree.
> 
> I'm always happy when code from arch/x86/ moves away so
> 
> Acked-by: Borislav Petkov <bp@suse.de>
> 

Thanks for the ack.

> Btw, for the future, please CC everyone on the whole patchset - I had to
> go look at your 2/2 on lore to see what it does because I had only 1/2
> in my mbox.
> 

Yes, sorry about that. I just used what get_maintainer.pl --git-fallback
suggested me, I'll make sure to include all people in Cc the next time.

> Thx.
> 

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

