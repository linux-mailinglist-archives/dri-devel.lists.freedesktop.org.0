Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76D85F5F9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 11:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EBC10E8FC;
	Thu, 22 Feb 2024 10:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ac5JO/QJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E9C10E8FC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708598769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rRPR8AvutOPFFWYPFI0BFk7mX8osS7DuA7SiNt9M+vA=;
 b=ac5JO/QJP4USXPuTv6jJ6FdxI0Mku5VBXiDWmQUcv3EXjSpRU3dyYc1j9i0Uyrxoyj4Dx6
 E56j83ya/mA2EWWWH+i9Ei9apxjVa6VaoeUILKVxFR0gxXHmtSXXU72irz8fHJ0JOXX9bo
 2tr6U7iJKu2E+QATMsAjs5Xs1BgXOWI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-4WJHxsXkOSmP3ar8Rr9OPg-1; Thu, 22 Feb 2024 05:46:05 -0500
X-MC-Unique: 4WJHxsXkOSmP3ar8Rr9OPg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a357c92f241so316804666b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 02:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708598765; x=1709203565;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rRPR8AvutOPFFWYPFI0BFk7mX8osS7DuA7SiNt9M+vA=;
 b=meNfa74StEW7IpaInRegPZDLLiVnChsZcuxb14QALfaNEKJVPQyCql5V48XIL4w0YD
 WB9CfIeMg++74HmueYdMJOd2BUWolFaVvYZFQd6mZLsgAtjQNTKAJjWyZyTbkhFFkwrF
 ps9qI+a7qp6ivR5R5LlRvCr04r3yjWr6l28pUmgvZ/VNY2jb/Loe6N8aufkSRRLj0B6D
 X6NwSoBrhwCfebbOtgq9uxuW+KZmlkzn39rT/JbfpjKMOqHAGPhNHcNoYVoQfCqDxpPC
 v3KbeiHgZXVUhk4fIwR8EeU6cgNw7wst4dxIdYYFWtyFMx+uvDuClMUvmOQbEyDfStGc
 A8jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgmRQ5svmet8/8jJTBl5E//eeG7d4lPKVZmjY46uQ4s1T9TZ7SLEMC29GGcwZiJo8RHTOkOx1HjSnSaDi+e+ouoj2nvx8WeqYZ3jSfgjrF
X-Gm-Message-State: AOJu0YwBrfKeV6QoeBg8AF8HZsQ/GlB6I1in3xq1ye9N/dyssmwL11BB
 +y4ClQ2A+vKz7VBQTSalSYxC+kfDQZJ1MGgDzliybzQpcOHnblyc3N4pHmgHQKzHopzDn2Inf2m
 pSPB7KOznHkZKHCXb6LYNr5knGAdbGbpxo9efYFhgvAJU3YvQ3ITGY9gg0cjKbUUnDw==
X-Received: by 2002:a17:906:4e97:b0:a3f:7fac:6ad2 with SMTP id
 v23-20020a1709064e9700b00a3f7fac6ad2mr957877eju.52.1708598764831; 
 Thu, 22 Feb 2024 02:46:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXxoBT+ZeY1acRDGAGZfFRUc+WAMjs5U2qUzzkSwUQrrqCnfDJdHUdJj930KHBJgZvV563bw==
X-Received: by 2002:a17:906:4e97:b0:a3f:7fac:6ad2 with SMTP id
 v23-20020a1709064e9700b00a3f7fac6ad2mr957856eju.52.1708598764441; 
 Thu, 22 Feb 2024 02:46:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 ov28-20020a170906fc1c00b00a3cf9b832eesm5810587ejb.40.2024.02.22.02.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 02:46:04 -0800 (PST)
Message-ID: <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
Date: Thu, 22 Feb 2024 11:46:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future handling of complex RGB devices on Linux v2
To: Pavel Machek <pavel@ucw.cz>, Werner Sembach <wse@tuxedocomputers.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/21/24 23:17, Pavel Machek wrote:
> Hi!
> 
>> so after more feedback from the OpenRGB maintainers I came up with an even
>> more generic proposal:
>> https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916#note_1753072869
> 
>>> evaluate-set-command ioctl taking:
>>> {
>>>     enum command                /* one of supported_commands */
>>>     union data
>>>     {
>>>         char raw[3072],
>>>         {
>>>             <input struct for command 0>
>>>         },
> 
> Yeah, so ... this is not a interface. This is a backdoor to pass
> arbitrary data. That's not going to fly.

Pavel, Note the data will be interpreted by a kernel driver and
not passed directly to the hw.

With that said I tend to agree that this seems to be a bit too
generic.

Werner, it seems you are basically re-inventing ioctls here.

If you are going to use per vendor specific data structs for various
commands and have those defined in the kernel userspace API headers,
then this means that userspace will already need updated versions
of those headers to support new vendors / new laptop models if
the commands change for a new model.

So what you are basically providing here is a generic interface
to pass a cmd number + a cmd-bumber-specific data struct and
we already have that it is called an ioctl.

So I think that the conclusion of this whole discussion is that
with the exception of a get-dev-info ioctl, we simply want
vendor specific ioctls, using 1 ioctl per command.

Given that these devices are all different in various ways
and that we only want this for devices which cannot be accessed
from userspace directly (so a limit set of devices) I really
think that just doing custom ioctls per vendor is best.

This certainly is the most KISS approach. This proposal
in essence is just an arbitrary command multiplexer /
demultiplexer and ioctls already are exactly that.

With the added advantage of being able to directly use
pass the vendor-cmd-specific struct to the ioctl instead
of having to first embed it in some other struct.

Regards,

Hans



