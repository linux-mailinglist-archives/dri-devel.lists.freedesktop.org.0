Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30B144D404
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 10:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21286E9D6;
	Thu, 11 Nov 2021 09:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A1E6E9D6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 09:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636622702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XoIxLEENy2F1Zskv5/PoD5j6jmD+4MPXDSF/F9jQnm4=;
 b=fIdtkvcLKxpF2DkB6uq94K6ypuYiSOt8YtzgSQRuauP/YFLJcCL6DwiCqf7oPXyBQoobRK
 Fq1byusw+UnoMtkPjmI1LiGsNQc115UR3gvRFBVKtJtBZvoHCRgLfJ2B5HX6ofGEmyNbud
 yOuipmZ3ODdfJLM6yjL80shTUXcMe7o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-G8yBC_f0PpymW3MEqliFBQ-1; Thu, 11 Nov 2021 04:24:59 -0500
X-MC-Unique: G8yBC_f0PpymW3MEqliFBQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so2393681wms.8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 01:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=XoIxLEENy2F1Zskv5/PoD5j6jmD+4MPXDSF/F9jQnm4=;
 b=JMQto/uv4CHbIjzShIJ27QIGU3wirZYGtlGCLHfdQuc1xOAsXJ7crV5N0RA9nmvYhS
 hU8f0lDvORmgxOS4EBOEQLq4y1UYlZieH09NJPQ/NcuV7mmKpfR2cHli1MqWr7rJVrw2
 oyEJKLnFFLvb4Jbg7jx2VL+b/yuu6uI6M5A8vzd7MS9ELomEigcTaUspSV58tlGcUuEq
 jdNyyKGzRJibuIKd5kC5qU6Tt/3cI13XFeuzdBpPnuyJhZErIm796W81gnYXFjry96xi
 /DS9t7ePyWkC+xh9X8VQgVtNrbSld8mHOU0Tr64b+1+z4H2MNSy7e6FlGpq+ENSjU/pf
 TOLQ==
X-Gm-Message-State: AOAM530AnsQbXg7qNWLgy/w2oYK6ZlHBxCijo+FIEglJKggUHbZtb0nC
 FBCegUo///asWkvUMX3UHP6xSDC7QsW0qNOOXvBvpgJFQ6fq/NOV6qUmqsaZnk/PtPg4nVw+ab8
 2DhWymM+KF+GYF7bNpN4xJ7GE0fVt
X-Received: by 2002:a05:6000:18ad:: with SMTP id
 b13mr7062533wri.195.1636622698149; 
 Thu, 11 Nov 2021 01:24:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/L5EBwaiQ5M/k0471vvBJxC4do3fiwU7k3yCJtLLPx+phRd7gimWqthqE//nDPulozzVurg==
X-Received: by 2002:a05:6000:18ad:: with SMTP id
 b13mr7062518wri.195.1636622697991; 
 Thu, 11 Nov 2021 01:24:57 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id l26sm2293227wms.15.2021.11.11.01.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 01:24:57 -0800 (PST)
Message-ID: <1ddb9e88-1ef8-9888-113b-fd2a2759f019@redhat.com>
Date: Thu, 11 Nov 2021 10:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [REGRESSION]: drivers/firmware: move x86 Generic System
 Framebuffers support
From: Javier Martinez Canillas <javierm@redhat.com>
To: Ilya Trukhanov <lahvuun@gmail.com>
References: <20211110200253.rfudkt3edbd3nsyj@lahvuun>
 <627b6cd1-3446-5e55-ea38-5283a186af39@redhat.com>
 <20211111004539.vd7nl3duciq72hkf@lahvuun>
 <af0552fb-5fb5-acae-2813-86c32e008e58@redhat.com>
In-Reply-To: <af0552fb-5fb5-acae-2813-86c32e008e58@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: len.brown@intel.com, linux-efi@vger.kernel.org, regressions@lists.linux.dev,
 linux-pm@vger.kernel.org, pavel@ucw.cz, rafael@kernel.org,
 stable@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 tzimmermann@suse.de, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/21 08:31, Javier Martinez Canillas wrote:

[snip]

>>> And for each check /proc/fb, the kernel boot log, and if Suspend-to-RAM works.
>>>
>>> If the explanation above is correct, then I would expect (1) and (2) to work and
>>> (3) to also fail.
>>>
> 
> Your testing confirms my assumptions. I'll check how this could be solved to
> prevent the efifb driver to be probed if there's already a framebuffer device.
> 

I've posted [0] which does this and also for the simplefb driver.

[0]: https://lore.kernel.org/dri-devel/20211111092053.1328304-1-javierm@redhat.com/T/#u

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

