Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50C898D58E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 15:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E6710E34E;
	Wed,  2 Oct 2024 13:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="AKdh1Wtt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F52E10E34E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 13:31:46 +0000 (UTC)
Received: from [192.168.42.96] (pd9e59da1.dip0.t-ipconnect.de
 [217.229.157.161]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 57BDA2FC0050;
 Wed,  2 Oct 2024 15:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1727875904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGOtZtXVPpdQdwtaMm7mq8l+rXyCb8gEF+WRDFxJKYo=;
 b=AKdh1WttXohJ3kmStfUJlq+YBFG0nVVUnH6gJFFlkO8LXBTQ7i67AAKMa7Uxgojxe11DIp
 9AhqnU/+v8p4FwfkK8fs51GtUsn7waSWGeag7UMc39r6cbMDH4m76TrYCEmcPZL7xuNO+D
 1kN11fRwGQqVAzXFaIdgmU1Vid2iy7U=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>
Date: Wed, 2 Oct 2024 15:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
To: Lee Jones <lee@kernel.org>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org, hdegoede@redhat.com, 
 jelle@vdwaa.nl, jikos@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz, cs@tuxedo.de
References: <20240927124152.139099-1-wse@tuxedocomputers.com>
 <20241002125243.GC7504@google.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20241002125243.GC7504@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

Am 02.10.24 um 14:52 schrieb Lee Jones:
> On Fri, 27 Sep 2024, Werner Sembach wrote:
>
>> Hi,
>> first revision integrating Armins feedback.
>>
>> Stuff I did not yet change and did not comment on previously:
>> - Still have to ask Christoffer why the mutex is required
>> - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
>> - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
>>
>> Let me know if my reasoning is flawed
> Use `git format-patch`'s --annotate and --compose next time please.
>
I did but --compose does not automatically insert the subject line, that's why i 
copied it but forgot to change it to 0/1

Sorry for the flawed subject line

Best Regards,

Werner

