Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C50C9C5F5D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 18:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD10210E0E1;
	Tue, 12 Nov 2024 17:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JWUz/6Qr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9CE10E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 17:45:25 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3a6bcbd23c9so22407705ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 09:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1731433525; x=1732038325;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ECpNk3WVDKxbHxhK0N6QRh+9W6qmtXb+Bcm8kSS24fI=;
 b=JWUz/6QrBdXEW8ujMdZjO8paDfARTnMXYneBOACor1CCtUuy8p6nQ2l9ScOQw1scXb
 Al1AZb0zqRLr/ePxz0a2Z3nSuOm8z/NscwRmQ9xlprLP99oxgaagWLMR3UrBHJnrqs1M
 sQi+57Y4oIS7o4O7zA2y7B8WRkXo8V3LsUZTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731433525; x=1732038325;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ECpNk3WVDKxbHxhK0N6QRh+9W6qmtXb+Bcm8kSS24fI=;
 b=Hvbj4mqWLRIdh2MrIxW5RWW7H+XfhwVe4Ied+2EkGUgFl3dvatLAY9Jlf8u4yE8szm
 6csNC6kA+Kr2P3ryOZkYajWazZ/Yg14CoXH4wVgpf/h9h0wzilkTw0iRH7x0ptKYVkEy
 AOVv02NMVs5QO5UVZWaMHQrPZp12WwCYL7Gi4r6zMMloWxm+8lI1zqwrC70pniQGc/9X
 g4q/p8GWS5qVBTLZFM9i8P1ftNdtQD1dmZeesbafqr7ExbU6upzKuYS/qfidchcC7e/p
 pmd3W/doQtlREisg+i+SQcYQrymQotuLcpOoKVMm4tedTppWMKpR9KaKzEd9VLGkIvTS
 gOTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT+JeUL0hXIojkHwc01JxC/UpOUZqeFbpGvq7uRXt7Zoq0EThNUFKBMIGehR7cvPYoX2zmp5XK4CA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCQEgSRqBl1kotPiCtXsYjRl4rc9wLv+Qzbfh08MsyaMnwGkxn
 8YmhYuPQDJayXB/TNLHQYlc1yUXSqRgrWuwk/N29D/7UMvjdd7R1XiLwhxQYoLd7886AOaMkP1c
 W
X-Google-Smtp-Source: AGHT+IEcXBAYv4/mLCHfvUtLQLJl2VENS1NC1IgYaxRc/OxGwWR3LyGd7ehckrw2AjOPHQRtvikMZw==
X-Received: by 2002:a05:6e02:745:b0:3a4:e99a:cffc with SMTP id
 e9e14a558f8ab-3a70c895f97mr41435405ab.20.1731433524938; 
 Tue, 12 Nov 2024 09:45:24 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f984856csm23083155ab.44.2024.11.12.09.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 09:45:24 -0800 (PST)
Message-ID: <d9bcf2df-8201-4eea-8e98-d305a4671736@linuxfoundation.org>
Date: Tue, 12 Nov 2024 10:45:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/CoC: spell out enforcement for unacceptable
 behaviors
To: Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Dan Williams
 <dan.j.williams@intel.com>, Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241108161853.12325-1-skhan@linuxfoundation.org>
 <ZzJkAJEjKidV8Fiz@phenom.ffwll.local>
 <ba3d5492-e774-452f-9fe0-e68b743c6b0d@linuxfoundation.org>
 <ZzNppQIQm6O6lnfW@finisterre.sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZzNppQIQm6O6lnfW@finisterre.sirena.org.uk>
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

On 11/12/24 07:43, Mark Brown wrote:
> On Mon, Nov 11, 2024 at 02:50:45PM -0700, Shuah Khan wrote:
>> On 11/11/24 13:07, Simona Vetter wrote:
> 
>>> Personal take, but I think a forced public apology as the primary or at
>>> least initial coc enforcement approach is one of the worst.
> 
> ...
> 
>> This document isn't intended to be a complete summary of all actions the
>> CoC takes in response to reports. There is a lot of back and forth with
>> the individuals to bring about change before the CoC asks for an apology.
> 
> I guess it would be good to explicitly call out (possibly in an
> incremental change on top of this one) that the specific enforcement
> steps here are examples, and are mainly for cases where a more
> mediation/education based approach fails or extreme cases where they're
> inappropriate?  Neither the existing document nor the current change
> make that explicit (at least to my reading), it's clear from for example
> the reports that are sent that the existing practice is to try to use
> those approaches first but I'm not sure that people would realise that
> from this document alone.

Thank you Mark. I will add more content to the document distilling the
discussion on this thread in the interest of transparency.

thanks,
-- Shuah
